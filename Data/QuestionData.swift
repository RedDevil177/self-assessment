import Foundation

/// Struktur, die alle Fragen für das Party-Persönlichkeitsquiz enthält.
/// Jede Frage ist ein Objekt vom Typ `Question`, das Text, Antwortmöglichkeiten und Punktverteilung beinhaltet.
struct QuestionData {
    
    /// Sammlung aller Fragen, die in der App verwendet werden.
    static let all: [Question] = [
        
        // MARK: - Frage 1
        Question(
            id: 1,
            text: "Wie verbringst du am liebsten den Start einer Party?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich starte gleich mit Trinkspielen und motiviere alle", points: [1:2, 9:2, 7:1]),
                AnswerOption(text: "Ich beobachte erst entspannt die Leute", points: [4:3, 10:2, 7:2]),
                AnswerOption(text: "Ich gehe direkt zur Tanzfläche oder lege Musik auf", points: [2:4, 3:3, 6:2]),
                AnswerOption(text: "Ich organisiere sofort Drinks oder Essen", points: [8:3, 1:1, 4:1])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
        
        // MARK: - Frage 2
        Question(
            id: 2,
            text: "Wie gehst du mit Social Media auf Partys um?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich mache die besten Selfies und Storys", points: [6:4, 2:2]),
                AnswerOption(text: "Ich organisiere die Musik und achte, dass alles läuft", points: [3:3, 8:3, 1:1]),
                AnswerOption(text: "Mir ist das egal, ich will die Stimmung genießen", points: [4:3, 10:2, 9:1]),
                AnswerOption(text: "Ich teile nur die lustigsten Momente", points: [5:3, 7:2, 9:1, 6:2])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
        
        // MARK: - Frage 3
        Question(
            id: 3,
            text: "Wie spontan bist du, wenn die Party neue Spiele oder Challenges startet?",
            type: .slider,
            options: nil,
            sliderRange: 1...10,
            sliderPoints: [
                1: [10: 1, 4: 1],    // sehr abwartend -> Früh-nach-Hause-Geher, Genießer
                2: [10: 1, 4: 1],
                3: [10: 1, 4: 1],
                4: [5: 1, 9: 1],     // vorsichtig mitmachen -> Schnacker, Stimmungsmacher
                5: [5: 1, 9: 1],
                6: [5: 1, 9: 1],
                7: [5: 1, 9: 1],
                8: [1: 1, 7: 1],     // sofort dabei -> Bierkapitän, Chaot
                9: [1: 1, 7: 1],
                10: [1: 1, 7: 1]
            ]
        ),
        // MARK: - Frage 4
            Question(
                id: 4,
                text: "Was ist für dich das Wichtigste auf einer Party?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ein entspannter Abend ohne Stress", points: [4:3, 10:2, 7:2]),
                    AnswerOption(text: "Gute Musik und Stimmung", points: [3:2, 9:2, 2:2]),
                    AnswerOption(text: "Coole Drinks und Cocktails", points: [8:3, 1:1, 4:1]),
                    AnswerOption(text: "Viele neue Leute kennenlernen", points: [5:3, 6:2, 9:1])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 5
            Question(
                id: 5,
                text: "Was machst du, wenn dein Lieblingssong läuft?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ich stürme auf die Tanzfläche", points: [2:3, 6:2, 9:1]),
                    AnswerOption(text: "Ich rufe laut mit und stoße an", points: [1:1, 9:2, 7:2]),
                    AnswerOption(text: "Ich gehe direkt zum DJ und feiere mit ihm", points: [3:3, 2:2, 6:1]),
                    AnswerOption(text: "Ich nicke im Takt und genieße es ruhig", points: [4:3, 10:2, 8:3])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 6
            Question(
                id: 6,
                text: "Wie entscheidest du, ob du auf eine Party gehst?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Wenn ich weiß, dass meine Freunde da sind", points: [5:3, 9:2, 2:1]),
                    AnswerOption(text: "Wenn ich am nächsten Tag ausschlafen kann", points: [10:3, 4:1, 7:1]),
                    AnswerOption(text: "Wenn’s gute Drinks gibt", points: [8:3, 1:1, 4:1]),
                    AnswerOption(text: "Wenn ich Lust auf Tanzen habe", points: [2:3, 3:1, 6:2])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 7
            Question(
                id: 7,
                text: "Wie sieht dein typischer Partyabend aus?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ich heize allen ein und halte durch bis zum Schluss", points: [1:2, 9:1, 7:1]),
                    AnswerOption(text: "Ich tanze, filme und poste Highlights", points: [2:3, 6:4, 3:1]),
                    AnswerOption(text: "Ich rede, trinke und organisiere zwischendurch", points: [5:2, 8:3, 4:2]),
                    AnswerOption(text: "Ich bleibe entspannt und gehe, wenn’s genug war", points: [10:3, 4:2, 7:1])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 8
        Question(
            id: 8,
            text: "Wie sehr liebst du es, der Mittelpunkt jeder Party zu sein?",
            type: .slider,
            options: nil,
            sliderRange: 1...10,
            sliderPoints: [
                1: [10: 3, 4: 1],
                2: [10: 3, 4: 1],
                3: [10: 3, 4: 1],
                4: [9: 2, 5: 1],
                5: [9: 2, 5: 1],
                6: [9: 2, 5: 1],
                7: [9: 2, 5: 1],
                8: [1: 3, 9: 2],
                9: [1: 3, 9: 2],
                10: [1: 3, 9: 2]
            ]
        ),
        
        // MARK: - Frage 9
            Question(
                id: 9,
                text: "Was trinkst du am liebsten auf einer Party?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Bier – klassisch und ehrlich", points: [1:2, 7:2, 9:1]),
                    AnswerOption(text: "Cocktails – bunt und lecker", points: [8:3, 6:1, 4:2]),
                    AnswerOption(text: "Ich bleibe lieber bei Wasser oder Cola", points: [4:3, 10:2, 5:1]),
                    AnswerOption(text: "Was immer die Bar hergibt", points: [7:2, 1:1, 9:2])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 10
            Question(
                id: 10,
                text: "Wie reagierst du, wenn ein Song läuft, den du hasst?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ich gehe zum DJ und wünsche was Neues", points: [3:3, 2:1, 5:1]),
                    AnswerOption(text: "Ich gehe an die Bar für einen Drink", points: [8:3, 4:1, 10:1]),
                    AnswerOption(text: "Ich mache Witze drüber und bringe die Stimmung zurück", points: [9:3, 1:1, 7:2]),
                    AnswerOption(text: "Ich bleibe gelassen und warte ab", points: [4:3, 10:2, 6:1])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 11
        Question(
            id: 11,
            text: "Wie viel Bier trinkst du im Schnitt pro Partyabend?",
            type: .slider,
            options: nil,
            sliderRange: 1...10,
            sliderPoints: [
                1: [10: 3, 4: 1],   // sehr wenig -> Früh-nach-Hause-Geher, Genießer
                2: [10: 3, 4: 1],
                3: [7: 2, 5: 1],
                4: [7: 2, 5: 1],
                5: [9: 2, 1: 1],
                6: [9: 2, 1: 1],
                7: [1: 3, 9: 2],
                8: [1: 3, 9: 2],
                9: [1: 3, 9: 2],
                10: [1: 3, 9: 3]   // sehr viel -> Bierkapitän, Stimmungsmacher
            ]
        ),
        
        // MARK: - Frage 12
            Question(
                id: 12,
                text: "Was machst du am nächsten Tag nach der Party?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ich schlafe aus und lache über den Abend", points: [4:2, 7:2, 10:2]),
                    AnswerOption(text: "Ich poste die besten Bilder", points: [6:3, 3:2, 2:2]),
                    AnswerOption(text: "Ich rufe Freunde an und bespreche die Highlights", points: [5:3, 9:2, 1:1]),
                    AnswerOption(text: "Ich plane schon die nächste Runde", points: [1:2, 8:2, 9:1])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 13
            Question(
                id: 13,
                text: "Wie reagierst du, wenn jemand einen Toast ausruft?",
                type: .singleChoice,
                options: [
                    AnswerOption(text: "Ich stimme laut mit ein und proste allen zu", points: [1:2, 9:1, 7:2]),
                    AnswerOption(text: "Ich filme es natürlich für später", points: [6:3, 3:2, 2:2]),
                    AnswerOption(text: "Ich genieße einfach den Moment", points: [4:3, 10:2, 8:2]),
                    AnswerOption(text: "Ich erzähle gleich noch eine lustige Geschichte dazu", points: [5:3, 9:1, 1:1])
                ],
                sliderRange: nil,
                sliderPoints: nil
            ),
        
        // MARK: - Frage 14
        Question(
            id: 14,
            text: "Wie viele Bilder landen in deiner Insta Story pro Abend beim Feiern?",
            type: .slider,
            options: nil,
            sliderRange: 1...10,
            sliderPoints: [
                1: [10: 3, 4: 1],
                2: [10: 3, 4: 1],
                3: [10: 3, 4: 1],
                4: [5: 2, 9: 2],
                5: [5: 2, 9: 2],
                6: [5: 2, 9: 2],
                7: [5: 2, 9: 2],
                8: [2: 3, 6: 3],
                9: [2: 3, 6: 3],
                10: [2: 3, 6: 3]
            ]
        ),
        
        // MARK: - Frage 15
        Question(
            id: 15,
            text: "Wie reagierst du, wenn die Musik plötzlich ausfällt?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich fang einfach laut an zu singen!", points: [1:2, 2:2, 5:1, 6:2, 7:2, 9:3]),
                AnswerOption(text: "Ich renn direkt zum DJ-Pult, um zu helfen.", points: [3:3, 6:1, 9:1]),
                AnswerOption(text: "Ich bleib locker, red einfach weiter mit den Leuten.", points: [4:2, 5:2, 10:1]),
                AnswerOption(text: "Das ist mein Zeichen – Zeit fürs Taxi.", points: [10:3])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),

        // MARK: - Frage 16
        Question(
            id: 16,
            text: "Was machst du, wenn du auf einer neuen Party niemanden kennst?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich quatsch direkt den Erstbesten an.", points: [1:1, 5:3, 6:2, 9:2]),
                AnswerOption(text: "Ich check erstmal die Stimmung von der Bar aus.", points: [4:3, 8:2, 10:1]),
                AnswerOption(text: "Ich such nach dem DJ oder der Musikquelle.", points: [3:4]),
                AnswerOption(text: "Ich bleib kurz, trink was und geh dann wieder.", points: [10:3])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),

        // MARK: - Frage 17
        Question(
            id: 17,
            text: "Was darf auf keiner guten Party fehlen?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ein Fass Bier und Trinkspiele!", points: [1:2, 5:1, 9:2]),
                AnswerOption(text: "Ein richtig guter DJ.", points: [3:4, 9:1]),
                AnswerOption(text: "Eine gemütliche Ecke zum Reden.", points: [4:2, 5:3]),
                AnswerOption(text: "Ein gutes Licht für Bilder.", points: [2:1, 6:3])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),

        // MARK: - Frage 18
        Question(
            id: 18,
            text: "Wie sieht dein perfekter Partyabend aus?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Kurzer Besuch, höflich sein, früh schlafen.", points: [10:3]),
                AnswerOption(text: "Lachen, Trinken, Lautsein – einfach durchdrehen!", points: [1:3, 2:1, 5:1, 7:2, 9:2]),
                AnswerOption(text: "Chillen, gute Gespräche und ein paar Drinks.", points: [4:3, 5:2]),
                AnswerOption(text: "Viele Fotos, ein bisschen tanzen, coole Klamotten", points: [2:1, 6:3]),
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),

        // MARK: - Frage 19
        Question(
            id: 19,
            text: "Was machst du, wenn jemand lautstark Streit anfängt?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich lenk ab und bring alle wieder zum Lachen.", points: [5:2, 9:3]),
                AnswerOption(text: "Ich bestell einfach eine neue Runde Drinks.", points: [1:2, 8:3]),
                AnswerOption(text: "Ich filme es – Content ist Content.", points: [6:4]),
                AnswerOption(text: "Ich geh einfach leise in Richtung Ausgang.", points: [10:3])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),

        // MARK: - Frage 20
        Question(
            id: 20,
            text: "Wie sieht’s bei dir am nächsten Morgen aus?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich wach irgendwo auf – aber mit guter Laune!", points: [1:2, 7:3, 9:1]),
                AnswerOption(text: "Ich analysier meine Stories vom Abend.", points: [6:3]),
                AnswerOption(text: "Ich erinner mich an alles – weil ich um 23 Uhr zu Hause war.", points: [10:2]),
                AnswerOption(text: "Ich mach mir einen Kaffee und schau Fotos mit Freunden.", points: [4:3, 5:2]),
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
        
        // MARK: - Frage 21
        Question(
            id: 21,
            text: "Wie reagierst du, wenn jemand betrunken Unsinn macht?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich lache und mache mit", points: [7:3, 1:1, 9:1]),
                AnswerOption(text: "Ich helfe ruhig und bring Ordnung rein", points: [8:3, 4:2, 10:1]),
                AnswerOption(text: "Ich filme das für später", points: [6:3, 2:1, 3:1]),
                AnswerOption(text: "Ich versuche, die Stimmung zu retten", points: [9:3, 5:1, 1:1])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
    
        // MARK: - Frage 22
        Question(
            id: 22,
            text: "Wie planst du deinen Partyabend?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich plane nichts – Hauptsache, es wird wild", points: [7:3, 1:2, 9:1]),
                AnswerOption(text: "Ich kümmere mich um Getränke oder Musik", points: [8:3, 3:1, 4:1]),
                AnswerOption(text: "Ich stimme mich mit Freunden ab", points: [5:3, 2:1, 9:1]),
                AnswerOption(text: "Ich schaue, dass ich genug Schlaf bekomme", points: [10:3, 4:1, 7:1])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
    
        // MARK: - Frage 23
        Question(
            id: 23,
            text: "Wie gehst du nach einer langen Partynacht nach Hause?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich bleibe bis zum Morgengrauen und feiere durch", points: [1:3, 9:2, 2:1]),
                AnswerOption(text: "Ich gehe früh, damit ich ausgeschlafen bin", points: [10:3, 4:2, 7:1]),
                AnswerOption(text: "Ich kümmere mich um die anderen oder den letzten Drink", points: [8:3, 1:1, 9:1]),
                AnswerOption(text: "Ich tanze weiter oder schaue, dass alle Spaß haben", points: [2:2, 9:2, 6:2])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
        
        // MARK: - Frage 24
        Question(
            id: 24,
            text: "In wie vielen Bars oder Clubs kennst du den Barkeeper mittlerweile schon beim Namen?",
            type: .slider,
            options: nil,
            sliderRange: 1...10,
            sliderPoints: [
                1: [10: 3, 4: 1],   // kaum Kontakt -> Früh-nach-Hause-Geher, Genießer
                2: [10: 3, 4: 1],
                3: [10: 3, 4: 1],
                4: [5: 2, 9: 1],    // ein paar Bekanntschaften -> Schnacker, Stimmungsmacher
                5: [5: 2, 9: 1],
                6: [5: 2, 9: 1],
                7: [1: 2, 7: 1],    // regelmäßig dabei -> Bierkapitän, Chaot
                8: [1: 2, 7: 1],
                9: [1: 2, 7: 1],
                10: [1: 3, 7: 2]    // überall bekannt -> Bierkapitän, Chaot
            ]
        ),
        
        // MARK: - Frage 25
        Question(
            id: 25,
            text: "Wie würdest du dich selbst auf Partys beschreiben?",
            type: .singleChoice,
            options: [
                AnswerOption(text: "Ich bin immer der lauteste und betrunkenste im Raum", points: [1:2, 9:3, 7:2]),
                AnswerOption(text: "Ich habe immer das Gefühl organisieren zu müssen", points: [8:3, 4:1, 3:2]),
                AnswerOption(text: "Ich bin immer relativ entspannt auf Partys und genieße sie", points: [4:3, 10:2, 5:1]),
                AnswerOption(text: "Ich bin meistens entweder am tanzen oder am Storys posten", points: [2:2, 6:3, 3:1])
            ],
            sliderRange: nil,
            sliderPoints: nil
        ),
        

    ]
}

