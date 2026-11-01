# Glossar

Ordnet die deutschen Fachbegriffe den Bezeichnern im Code zu (DOK-63). Gibt es zu einem Begriff einen Bezeichner, heisst
er im ganzen Projekt so (CC-52).

| Begriff | Bezeichner | Bedeutung |
|---|---|---|
| Hauptrechner | `DozenalCalcState` | Erster Rechner, rechnet in Basis 12 oder 10 |
| Einheitenrechner, Umrechner | `ConverterState` | Zweiter Rechner: Masseinheiten |
| Werterechner | `AssetState` | Dritter Rechner: Edelmetalle und Währungen, im Code heisst der Bereich `asset` |
| Klasse | `AssetClass` | Oberste Ebene im Werterechner: Edelmetall oder Währung |
| Gattung | `AssetGenus` | Zweite Ebene im Werterechner, etwa Gold oder GBP |
| Kategorie | `UnitCategory` | Grösse im Einheitenrechner, etwa Länge oder Fläche |
| Einheitensystem, Welt | `UnitWorld` | Imperial (Zwölfer-Welt) oder metrisch (Zehner-Welt) |
| Zahlbasis | `activeBase` | Basis 12 oder 10, gilt für alle Rechner |
| Ziffer | `DozenalDigit` | Eine der zwölf Ziffern |
| Exakte Schiene | `Rational` | Rechnen mit Brüchen, bewahrt Perioden |
| Zerlegung | `breakdown` | Wert als gemischte Einheiten, etwa Fuss und Zoll |
| Resultat-Brücke | `ansForBridge`, `insertCalcAns` | Trägt Ergebnisse zwischen den Rechnern |
| Brücken-Tasten | `ConvAns`, `AssetAns` | CONV und VAL im Hauptrechner |
| Speicher | `memStore` | Register des Werterechners, die anderen Rechner haben ein eigenes |
| Wertmodus | `valueTargets` | Drill-Ebene mit der Wahl der Zielwährung |
| Kursspeicher | `RateStore` | Grobe Kurse samt eigenen Änderungen |
| Preiskurve | `PriceSeries` | Historische Reihe im Diagramm |
| Epoche | `ChartEpoch` | Zeitraum des Diagramms: Antike, Mittelalter, Neuzeit, Heute |
| Page-Peek | `_PagePeekOverlay` | Kurze Anzeige, auf welcher Rechner-Seite man steht |
| Tastenmodus | `KeypadMode` | Overlay oder Scrollen |
| Tastenprofil | `KeypadProfile` | Alle oder Einfach |
| Ziffernstil | `GlyphStyle` | Dozenal-Glyphen oder A und B |
