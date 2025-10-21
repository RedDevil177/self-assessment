import SwiftUI

// MARK: - Ergebnisansicht nach Abschluss des Quiz
// Diese View zeigt dem Nutzer an, welcher „Partytyp“ er ist, basierend auf den erreichten Punkten.
// Außerdem kann der Nutzer den Test über einen Button erneut starten.
struct ResultView: View {
    // Binding-Variablen, die aus der Haupt-Quiz-Logik übergeben werden
    // scores speichert alle erreichten Punkte für die verschiedenen PartyResult-IDs
    @Binding var scores: [Int: Int]
    
    // currentIndex zeigt an, an welcher Frage sich der Nutzer aktuell befindet
    // Wird beim Neustart des Tests wieder auf 0 gesetzt
    @Binding var currentIndex: Int
    
    // Zugriff auf die hinterlegten Ergebnisdaten (alle Partytypen)
    let results = ResultData.partyResults
    
    // Ermöglicht das Schließen der aktuellen View (zurück zur Startansicht)
    @Environment(\.dismiss) var dismiss

    var body: some View {
        // Ermittlung des besten Ergebnisses:
        // Wir suchen den PartyResult mit der höchsten Punktzahl.
        // Falls keine Punkte vorhanden sind, wird standardmäßig das erste Ergebnis (ID 1) angezeigt.
        let bestResultId = scores.max { a, b in a.value < b.value }?.key ?? 1
        let result = results.first { $0.id == bestResultId }!

        ZStack {
            backgroundView // Hintergrundbild + Farbverlauf

            VStack(spacing: 30) {
                Spacer()
                resultTextView(result: result) // Anzeige des Ergebnisses
                Spacer()
                retryButton // Button zum Neustart des Tests
                Spacer()
            }
        }
        .navigationTitle("Dein Partytyp") // Titel in der Navigationsleiste
        .toolbarBackground(Color.black, for: .navigationBar) // Schwarzer Hintergrund
        .toolbarColorScheme(.dark, for: .navigationBar) // Helles Schrift-Thema
    }
}

// MARK: - Unteransichten (Subviews)
private extension ResultView {

    // Hintergrundansicht mit Bild und Farbverlauf
    var backgroundView: some View {
        ZStack {
            Image("background") // Hintergrundbild aus den Assets
                .resizable()
                .scaledToFill()
                .opacity(0.5)
                .ignoresSafeArea()
            
            // Dunkler Verlauf über das Bild gelegt, um Text besser lesbar zu machen
            LinearGradient(
                colors: [
                    Color.black.opacity(0.85),
                    Color(red: 0.05, green: 0.05, blue: 0.1).opacity(0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
    }

    // Darstellung des Party-Ergebnisses (Name + Beschreibung)
    func resultTextView(result: PartyResult) -> some View {
        VStack(spacing: 15) {
            Text(result.name) // Partytyp (z. B. „Der Bierkapitän“)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Text(result.description) // Beschreibung des Typs
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white.opacity(0.85))
                .padding(.horizontal, 30)
        }
    }

    // Button zum Neustart des Tests
    var retryButton: some View {
        Button(action: {
            // Setzt Punkte und Fortschritt zurück
            scores = [:]
            currentIndex = 0
            dismiss() // Schließt die aktuelle Ansicht
        }) {
            Text("Nochmal testen")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    // Farbverlauf über den Button
                    LinearGradient(
                        colors: [Color.purple.opacity(0.9), Color.blue.opacity(0.9)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .shadow(color: .purple.opacity(0.7), radius: 10, x: 0, y: 4)
                .padding(.horizontal, 40)
        }
    }
}

// MARK: - Vorschau (für SwiftUI Canvas)
#Preview {
    // Beispielhafte Vorschau mit Testdaten
    ResultView(scores: .constant([1: 10, 2: 5, 3: 3]), currentIndex: .constant(0))
}
