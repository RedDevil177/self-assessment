import Foundation

// MARK: - Datenmodell für Party-Ergebnisse
// Diese Struktur beschreibt einen einzelnen „Party-Typ“, also das mögliche Ergebnis,
// das ein Nutzer am Ende des Quiz erhalten kann.
// Jeder PartyResult steht für eine bestimmte Persönlichkeit oder Rolle auf einer Party.
struct PartyResult: Identifiable {
    let id: Int              // Eindeutige Kennung des Ergebnisses (wird für Punktzuordnungen verwendet)
    let name: String         // Bezeichnung des Party-Typs, z. B. "Der Bierkapitän"
    let description: String  // Kurze Beschreibung des Charakters bzw. typischen Verhaltens auf einer Party
}
