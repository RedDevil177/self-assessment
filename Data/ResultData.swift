import Foundation

// MARK: - Datenmodell für Party-Ergebnisse
// Diese Struktur speichert alle möglichen Ergebnis-Typen,
// die ein Nutzer nach Abschluss des Quiz erreichen kann.
// Jeder PartyResult steht für einen bestimmten „Party-Typ“,
// der durch die Antworten in der App ermittelt wird.
struct ResultData {
    
    // Eine statische (also globale und unveränderliche) Liste aller Party-Ergebnisse.
    // Diese Liste wird vom Auswertungssystem genutzt,
    // um das finale Ergebnis basierend auf den Antworten des Nutzers zu bestimmen.
    static let partyResults: [PartyResult] = [
        
        // Jeder Eintrag in dieser Liste ist ein PartyResult-Objekt,
        // das aus einer ID, einem Namen und einer Beschreibung besteht.
        PartyResult(id: 1, name: "Der Bierkapitän", description: "startet laut, motiviert alle, kennt jedes Trinkspiel und hält den Pegel bis zum Morgengrauen."),
        PartyResult(id: 2, name: "Die Dancing-Queen", description: "steht keine Minute still, kennt alle Moves und zieht selbst die Schüchternen auf die Tanzfläche."),
        PartyResult(id: 3, name: "Der DJ-Flüsterer", description: "verbringt den halben Abend am DJ-Pult und hat immer eine Meinung zur Playlist."),
        PartyResult(id: 4, name: "Der Genießer", description: "nippt entspannt am Drink, beobachtet das Geschehen und bleibt bis zum Schluss cool."),
        PartyResult(id: 5, name: "Der Labersack", description: "redet mit jedem, kennt nach einer Stunde alle Namen und weiß alle Geschichten."),
        PartyResult(id: 6, name: "Der Influencer", description: "hält jeden Moment mit dem Handy fest und hat die besten Insta-Stories des Abends."),
        PartyResult(id: 7, name: "Der Chaot", description: "verliert Handy, Jacke und Überblick, aber nie die gute Laune."),
        PartyResult(id: 8, name: "Der Barkönig", description: "hat immer das perfekte Mischverhältnis, kennt alle Cocktails und organisiert Nachschub."),
        PartyResult(id: 9, name: "Der Stimmungsmacher", description: "bringt jeden zum Lachen, startet Trinkrunden und ist der Herzschlag jeder Party."),
        PartyResult(id: 10, name: "Der Früh-nach-Hause-Geher", description: "ist gerne dabei, aber spätestens um Mitternacht im Taxi – mit einem Grinsen.")
    ]
}
