# Glossar

Ordnet die deutschen Fachbegriffe den Bezeichnern im Code zu (DOK-63). Gibt es zu einem Begriff einen Bezeichner, heisst
er im ganzen Projekt so (CC-52). Die Spalte «nicht verwenden» nennt Wörter, die mit einem anderen Begriff verwechselt
werden.

| Begriff | Bedeutung | Bezeichner | nicht verwenden |
|---|---|---|---|
| Hauptrechner | Erster Rechner, rechnet in Basis 12 oder 10 | `DozenalCalcState` | |
| Einheitenrechner, Umrechner | Zweiter Rechner: Masseinheiten | `ConverterState` | |
| Werterechner | Dritter Rechner: Edelmetalle und Währungen, im Code heisst der Bereich `asset` | `AssetState` | |
| Wertklasse | Oberste Ebene im Werterechner: Edelmetall oder Währung | `AssetClass` | Klasse |
| Gattung | Zweite Ebene im Werterechner, etwa Gold oder GBP | `AssetGenus` | |
| Kategorie | Grösse im Einheitenrechner, etwa Länge oder Fläche | `UnitCategory` | |
| Einheitensystem, Welt | Imperial (Zwölfer-Welt) oder metrisch (Zehner-Welt) | `UnitWorld` | |
| Zahlbasis | Basis 12 oder 10, gilt für alle Rechner | `activeBase` | |
| Ziffer | Eine der zwölf Ziffern | `DozenalDigit` | |
| Exakte Schiene | Rechnen mit Brüchen, bewahrt Perioden | `Rational` | |
| Zerlegung | Wert als gemischte Einheiten, etwa Fuss und Zoll | `breakdown` | |
| Resultat-Brücke | Trägt Ergebnisse zwischen den Rechnern | `ansForBridge`, `insertCalcAns` | |
| Brücken-Tasten | CONV und VAL im Hauptrechner | `ConvAns`, `AssetAns` | |
| Speicher | Register des Werterechners, die anderen Rechner haben ein eigenes | `memStore` | |
| Wertmodus | Drill-Ebene mit der Wahl der Zielwährung | `valueTargets` | |
| Kursspeicher | Grobe Kurse samt eigenen Änderungen | `RateStore` | |
| Preiskurve | Historische Reihe im Diagramm | `PriceSeries` | |
| Epoche | Zeitraum des Diagramms: Antike, Mittelalter, Neuzeit, Heute | `ChartEpoch` | |
| Page-Peek | Kurze Anzeige, auf welcher Rechner-Seite man steht | `_PagePeekOverlay` | |
| Tastenmodus | Overlay oder Scrollen | `KeypadMode` | |
| Tastenprofil | Alle oder Einfach | `KeypadProfile` | |
| Ziffernstil | Dozenal-Glyphen oder A und B | `GlyphStyle` | |
