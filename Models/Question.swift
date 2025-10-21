import Foundation

// MARK: - Modell für einzelne Fragen im Quiz
// Diese Struktur beschreibt, wie eine Frage in der App aufgebaut ist.
// Jede Frage hat einen Text, einen Fragetyp (z. B. Multiple Choice oder Slider)
// und kann unterschiedliche Antwortmöglichkeiten oder Punktezuordnungen enthalten.
struct Question {
    let id: Int                          // Eindeutige Nummer der Frage (zur Identifikation)
    let text: String                     // Der eigentliche Fragetext, der dem Nutzer angezeigt wird
    let type: QuestionType               // Typ der Frage – bestimmt, ob Auswahl oder Schieberegler verwendet wird
    let options: [AnswerOption]?         // Antwortmöglichkeiten (nur bei Multiple-Choice-Fragen gefüllt)
    let sliderRange: ClosedRange<Double>?// Bereich des Sliders, z. B. 1...10 (nur bei Slider-Fragen)
    let sliderPoints: [Int: [Int: Int]]? // Punktezuordnung für Slider-Fragen:
                                         // Erster Schlüssel: Slider-Wert
                                         // Zweiter Schlüssel: Ergebnis-ID (PartyResult)
                                         // Wert: Punkte, die dieser PartyResult für diesen Wert bekommt
}

// MARK: - Modell für Antwortoptionen bei Multiple-Choice-Fragen
// Jede Antwort hat ihren Text und eine Punkteverteilung,
// die beschreibt, welche PartyResult-Typen durch die Wahl dieser Antwort gestärkt werden.
struct AnswerOption {
    let text: String                     // Text der Antwortoption, der angezeigt wird
    let points: [Int: Int]               // Punkteverteilung: Key = PartyResult-ID, Value = Punkte
}

// MARK: - Fragetypen im Quiz
// Bestimmt, ob der Nutzer eine feste Auswahl trifft oder einen Wert über einen Slider einstellt.
enum QuestionType {
    case singleChoice                    // Der Nutzer wählt eine von mehreren Antwortmöglichkeiten aus
    case slider                          // Der Nutzer bewegt einen Regler, um eine Einschätzung abzugeben
}
