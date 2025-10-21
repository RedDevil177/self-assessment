import SwiftUI

// MARK: - Startansicht des Quiz
// Diese View ist der Einstiegspunkt der App.
// Hier wird der Nutzer begrüßt und kann den Test über einen Button starten.
struct StartView: View {
    // State-Variable steuert, ob zur Fragenansicht gewechselt werden soll
    @State private var showQuestions = false

    var body: some View {
        // NavigationStack ermöglicht das Wechseln zwischen verschiedenen Ansichten
        NavigationStack {
            ZStack {
                backgroundView // Hintergrund mit Bild und Verlauf

                VStack(spacing: 30) {
                    Spacer()
                    headerView // Überschrift und Beschreibung
                    Spacer()
                    startButton // Button zum Starten des Quiz
                    Spacer()
                }
            }
            // Titel der Navigationsleiste
            .navigationTitle("Willkommen")
            // Schwarzer Hintergrund für die Navigationsleiste
            .toolbarBackground(Color.black, for: .navigationBar)
            // Helle Schrift auf dunklem Hintergrund
            .toolbarColorScheme(.dark, for: .navigationBar)
            // Navigation zur nächsten View (Fragenansicht)
            .navigationDestination(isPresented: $showQuestions) {
                QuestionViewWrapper()
            }
        }
    }
}

// MARK: - Unteransichten (Subviews)
private extension StartView {

    // Hintergrund mit Bild und dunklem Farbverlauf
    var backgroundView: some View {
        ZStack {
            Image("background") // Hintergrundbild aus Assets
                .resizable()
                .scaledToFill()
                .opacity(0.5) // leicht transparent für Textlesbarkeit
                .ignoresSafeArea()

            // Dunkler Verlauf, um Text besser hervorzuheben
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

    // Überschrift und kurze Erklärung zum Test
    var headerView: some View {
        VStack(spacing: 15) {
            Text("Welcher Partytyp bist du?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("Finde heraus, welcher Partytyp du bist! Mit den folgenden 25 einfachen Fragen bekommst du dein persönliches Ergebnis.")
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundColor(Color.white.opacity(0.8))
                .padding(.horizontal, 30)
        }
    }

    // Button, der den Test startet und zur Fragenansicht führt
    var startButton: some View {
        Button(action: {
            showQuestions = true // Navigation aktivieren
        }) {
            Text("Test starten")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    // Farbverlauf von Lila zu Blau
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

// MARK: - Wrapper für Fragenansicht
// Diese Struktur dient als Platzhalter, um die Navigation zu QuestionView zu ermöglichen.
// Sie kann später erweitert werden, falls zusätzliche Logik benötigt wird.
struct QuestionViewWrapper: View {
    var body: some View {
        QuestionView()
    }
}

// MARK: - Vorschau (für SwiftUI Canvas)
#Preview {
    StartView()
}
