import SwiftUI

// MARK: - Hauptansicht für das Quiz
// Diese View zeigt die Fragen des Party-Quiz nacheinander an.
// Sie unterstützt sowohl Multiple-Choice- als auch Slider-Fragen
// und berechnet automatisch die Punktzahlen für jedes mögliche Ergebnis.
struct QuestionView: View {
    
    // Liste aller verfügbaren Fragen (aus der zentralen Datenquelle)
    let questions = QuestionData.all
    
    // MARK: - Zustandsvariablen
    // Diese Variablen speichern den aktuellen Fortschritt und Nutzerinteraktionen.
    @State private var currentIndex = 0           // Aktuell angezeigte Frage (Index)
    @State private var selectedOption: AnswerOption? = nil // Vom Nutzer gewählte Antwort (bei Multiple Choice)
    @State private var sliderValue: Int = 5        // Aktueller Wert des Sliders (bei Slider-Fragen)
    @State private var showResult = false           // Steuert, ob das Ergebnis angezeigt wird
    @State private var scores: [Int: Int] = [:]     // Punkte für jede mögliche Ergebnis-ID
    
    // MARK: - Benutzeroberfläche
    var body: some View {
        // Aktuelle Frage anhand des Index auswählen
        let question = questions[currentIndex]

        ZStack {
            // MARK: Hintergrund
            // Zeigt ein leicht transparentes Hintergrundbild mit Farbverlauf.
            Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.5)
                .ignoresSafeArea()
            
            // Dunkler Farbverlauf über dem Bild, um Text besser lesbar zu machen
            LinearGradient(
                colors: [Color.black.opacity(0.85),
                         Color(red: 0.05, green: 0.05, blue: 0.1).opacity(0.85)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // MARK: Hauptinhalt
            VStack(spacing: 30) {
                
                // Fragetext anzeigen
                questionText(question.text)

                // Wenn Frage vom Typ Single Choice ist → Auswahlbuttons anzeigen
                if question.type == .singleChoice, let options = question.options {
                    singleChoiceView(options: options)
                }

                // Wenn Frage vom Typ Slider ist → Schieberegler anzeigen
                if question.type == .slider, let range = question.sliderRange {
                    sliderView(range: range)
                }

                Spacer()
                
                // Weiter- oder "Ergebnis anzeigen"-Button
                nextButton(for: question)
            }
        }
        // MARK: Navigation und Layout
        .navigationTitle("Frage \(currentIndex + 1)/\(questions.count)")
        .toolbarBackground(Color.black, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear(perform: resetState)
        // Navigation zum Ergebnisbildschirm
        .navigationDestination(isPresented: $showResult) {
            ResultView(scores: $scores, currentIndex: $currentIndex)
        }
    }
}

// MARK: - Unteransichten (Subviews)
private extension QuestionView {
    
    // Zeigt den Fragetext formatiert an
    func questionText(_ text: String) -> some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
    
    // Darstellung aller Antwortoptionen bei Multiple-Choice-Fragen
    func singleChoiceView(options: [AnswerOption]) -> some View {
        VStack(spacing: 15) {
            ForEach(options, id: \.text) { option in
                singleChoiceButton(option: option)
            }
        }
        .padding(.horizontal, 30)
    }
    
    // Darstellung eines einzelnen Antwort-Buttons
    func singleChoiceButton(option: AnswerOption) -> some View {
        Button(action: { selectedOption = option }) {
            Text(option.text)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(selectedOption?.text == option.text ? .white : .white.opacity(0.7))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(maxWidth: .infinity)
                .background(buttonBackground(for: option))
                .cornerRadius(10)
                .shadow(color: selectedOption?.text == option.text ? .purple.opacity(0.5) : .clear, radius: 6)
        }
    }
    
    // Hintergrundfarbe der Buttons (ändert sich je nach Auswahl)
    func buttonBackground(for option: AnswerOption) -> some View {
        Group {
            if selectedOption?.text == option.text {
                // Wenn ausgewählt → Farbverlauf
                LinearGradient(
                    colors: [Color.purple.opacity(0.9), Color.blue.opacity(0.9)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            } else {
                // Wenn nicht ausgewählt → leicht transparente Fläche
                Color.white.opacity(0.08)
            }
        }
    }
    
    // Darstellung des Sliders bei Skalenfragen
    func sliderView(range: ClosedRange<Double>) -> some View {
        VStack(spacing: 10) {
            // Der Slider selbst
            Slider(value: Binding(
                get: { Double(sliderValue) },
                set: { sliderValue = Int($0) }
            ), in: range, step: 1)
                .tint(.purple)
                .padding(.horizontal, 30)

            // Anzeige des aktuellen Wertes
            Text("Wert: \(sliderValue)")
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))
        }
    }
    
    // Weiter-Button oder Ergebnis-Anzeige
    func nextButton(for question: Question) -> some View {
        Button(action: {
            handleNext(question)
        }) {
            Text(currentIndex < questions.count - 1 ? "Weiter" : "Ergebnis anzeigen")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(buttonGradient(for: question))
                .cornerRadius(12)
                .shadow(color: buttonShadow(for: question), radius: 10, x: 0, y: 4)
                .padding(.horizontal, 40)
        }
        .disabled(buttonDisabled(for: question))
    }
}

// MARK: - Logik und Hilfsfunktionen
private extension QuestionView {
    
    // Setzt Zustände beim Laden oder nach einer Frage zurück
    func resetState() {
        if !showResult {
            selectedOption = nil
            sliderValue = 5
        }
    }
    
    // Verarbeitet die Auswahl und geht zur nächsten Frage
    func handleNext(_ question: Question) {
        switch question.type {
        case .singleChoice:
            // Punkte für gewählte Option hinzufügen
            if let option = selectedOption {
                for (resultId, pts) in option.points {
                    scores[resultId, default: 0] += pts
                }
            } else { return }
        case .slider:
            // Punkte für aktuellen Slider-Wert hinzufügen
            if let sliderPoints = question.sliderPoints?[sliderValue] {
                for (resultId, pts) in sliderPoints {
                    scores[resultId, default: 0] += pts
                }
            }
        }

        // Nächste Frage oder Ergebnis anzeigen
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedOption = nil
            sliderValue = 5
        } else {
            showResult = true
        }
    }
    
    // Farbverlauf für aktiven Weiter-Button
    func buttonGradient(for question: Question) -> some View {
        Group {
            if (question.type == .singleChoice && selectedOption != nil) || question.type == .slider {
                LinearGradient(
                    colors: [Color.green.opacity(0.9), Color.teal.opacity(0.9)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            } else {
                Color.gray.opacity(0.4)
            }
        }
    }
    
    // Schattierung des Buttons bei Aktivität
    func buttonShadow(for question: Question) -> Color {
        ((question.type == .singleChoice && selectedOption != nil) || question.type == .slider)
        ? .green.opacity(0.5)
        : .clear
    }
    
    // Steuert, wann der Button deaktiviert ist
    func buttonDisabled(for question: Question) -> Bool {
        (question.type == .singleChoice && selectedOption == nil) ||
        (question.type == .slider && question.sliderPoints?[sliderValue] == nil)
    }
    
    // Hintergrundverlauf als separater View (optional nutzbar)
    var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.black.opacity(0.85),
                     Color(red: 0.05, green: 0.05, blue: 0.1).opacity(0.85)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

// MARK: - Vorschau für SwiftUI Canvas
#Preview {
    QuestionView()
}
