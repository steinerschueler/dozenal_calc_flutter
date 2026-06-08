All examples verified correct. Now compiling the final dossier.

## Grundlagen & Definitionen

### Was ein Stellenwertsystem ist

Ein **Stellenwertsystem** (auch Positionssystem, englisch *positional notation*) ist ein Zahlensystem, in dem der Wert eines Ziffernsymbols von seiner **Position** abhängt. Dieselbe Ziffer bedeutet an verschiedenen Stellen Verschiedenes. In `222` steht die linke 2 für zweihundert, die mittlere für zwanzig, die rechte für zwei.

Jede Position trägt eine **Potenz der Basis**. Die Stellen wachsen nach links: jede Stelle ist das *b*-fache der Stelle rechts von ihr.

### Basis (Radix) und Ziffern

Die **Basis** (oder **Radix**) *b* ist die feste Zahl, mit der je zwei benachbarte Stellen zusammenhängen. Sie ist zugleich die **Anzahl der verschiedenen Ziffernsymbole** (einschließlich der Null), die das System braucht.

| Basis | Name | Ziffernsymbole |
|---|---|---|
| 2 | Binär | 0, 1 |
| 8 | Oktal | 0–7 |
| 10 | Dezimal | 0–9 |
| 12 | Dozenal/Duodezimal | 0–9 und zwei Extra-Zeichen (z. B. A, B) |
| 16 | Hexadezimal | 0–9, A–F |
| 60 | Sexagesimal | 60 Werte (heute meist dezimal gruppiert) |

In Basis 12 bedeutet „10" zwölf und „100" bedeutet hundertvierundvierzig (= 12²). Das ist der gewöhnungsbedürftigste Punkt: „10" ist immer die Basis selbst, egal welche Basis gemeint ist.

### Die Stellenwert-Formel

Der Wert einer Ziffer ist die Ziffer mal die Basis hoch Stellennummer. Für eine ganze Zahl mit den Ziffern a₃a₂a₁a₀ gilt:

```
(a₃a₂a₁a₀)_b = a₃·b³ + a₂·b² + a₁·b¹ + a₀·b⁰
```

Die ganz rechte Stelle hat immer den Wert b⁰ = 1 (die Einerstelle).

Beispiele (alle unabhängig nachgerechnet):
- Dezimal: 465 = 4·10² + 6·10¹ + 5·10⁰ = 400 + 60 + 5 = 465 ✓
- Hexadezimal: 14B9₁₆ = 1·16³ + 4·16² + 11·16¹ + 9·16⁰ = 4096 + 1024 + 176 + 9 = **5305₁₀** ✓

### Radixpunkt und Nachkommastellen

Ein **Radixpunkt** (im Dezimalsystem das Komma) trennt den ganzzahligen vom gebrochenen Teil. Hinter dem Punkt sinkt der Exponent pro Stelle um 1. Die Stellen tragen also negative Potenzen der Basis:

```
2,35₁₀ = 2·10⁰ + 3·10⁻¹ + 5·10⁻² = 2 + 0,3 + 0,05
```

### Zwei Bausteine für ein vollwertiges System

Ein voll funktionsfähiges Positionssystem braucht zwei Dinge:
1. das **Stellenwertprinzip** (die Position kodiert die Größenordnung), und
2. ein **Null-Zeichen** als Platzhalter, damit leere Stellen eindeutig sind (102 ist nicht 12).

Historisch wurden beide Bausteine nicht überall gleichzeitig erreicht. Das babylonische System (Basis 60) hatte das Stellenwertprinzip lange vor einer konsistenten Null. Die vollständige Verbindung aus Positionsschreibweise und Null als eigenständiger Zahl ist eine indische Leistung (siehe Geschichte).

### Schlüsselbegriffe der Teilbarkeit (präzise)

**Teiler.** Eine ganze Zahl *d* ist Teiler von *n*, wenn *n* ohne Rest durch *d* teilbar ist. Die Teiler von 12 sind 1, 2, 3, 4, 6, 12 (sechs Stück). Die Teiler von 10 sind 1, 2, 5, 10 (vier Stück).

**Hochzusammengesetzte Zahl (highly composite number).** Eine Zahl, die *mehr* Teiler hat als jede kleinere Zahl. Die Folge beginnt: 1, 2, 4, 6, **12**, 24, 36, 48, **60**, 120, 180, 240, **360**, …

**Superior hochzusammengesetzte Zahl (superior highly composite number).** Eine stärkere Bedingung: Diese Zahlen haben das beste Verhältnis von Teilerzahl zu eigener Größe. Die ersten sechs sind **2, 6, 12, 60, 120, 360**. Genau deshalb wurden **12 und 60 historisch als Basen verwendet** — sie bieten viele Teiler bei noch handhabbarer Größe.

### Wann ein Bruch abbricht und wann er sich wiederholt

Dies ist der mathematische Kern des ganzen Themas:

> Ein vollständig gekürzter Bruch *n/m* hat in der Basis *b* eine **abbrechende** (endliche) Darstellung **genau dann, wenn jeder Primfaktor des Nenners *m* auch Primfaktor der Basis *b* ist.** Sonst ist die Darstellung **periodisch** (sich wiederholend).

- Basis 10 = 2·5 → endlich nur, wenn der Nenner die Form 2ᵃ·5ᶜ hat. Deshalb enden 1/2, 1/4, 1/5, 1/8 sauber, aber 1/3 und 1/7 werden periodisch.
- Basis 12 = 2²·3 → endlich nur, wenn der Nenner die Form 2ᵃ·3ᶜ hat. Deshalb enden 1/2, 1/3, 1/4, 1/6, 1/8, 1/9, aber 1/5 und 1/7 werden periodisch.

**Periodenlänge.** Bei einem periodischen Bruch 1/m (mit *m* teilerfremd zur Basis) ist die Periodenlänge gleich der **multiplikativen Ordnung der Basis modulo m** — der kleinsten positiven Zahl *k* mit bᵏ ≡ 1 (mod m). Diese Ordnung teilt stets φ(m) (Eulersche Phi-Funktion). Beispiel: 1/7 hat in Basis 10 die Periode 6, weil 10⁶ ≡ 1 (mod 7) und kein kleinerer Exponent das leistet (Periode „142857").

---

## Beispiele & Verfahren (mit Tabellen)

### Steckbrief der sechs Basen

| Basis | Primfaktoren | Teiler der Basis | Hauptverwendung |
|---|---|---|---|
| 2 | 2 | 1, 2 | Digitale Hardware (Schaltzustände an/aus) |
| 8 | 2 | 1, 2, 4, 8 | Unix-Dateirechte (chmod), historisch Mainframes |
| 10 | 2, 5 | 1, 2, 5, 10 | Alltag, Metrik/SI, Buchhaltung |
| 12 | 2, 3 | 1, 2, 3, 4, 6, 12 | Dozenal-Bewegung; kulturell: Dutzend, Uhr, Zoll |
| 16 | 2 | 1, 2, 4, 8, 16 | Computer (kompakte Binärdarstellung) |
| 60 | 2, 3, 5 | 1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60 | Zeit, Winkel, Koordinaten |

### Umrechnung: ganzer Teil und Nachkommateil getrennt behandeln

Der ganze Teil und der Teil hinter dem Komma werden mit **zwei verschiedenen Verfahren** umgerechnet.

#### Ganzer Teil — fortgesetzte Division (Restmethode)

Regel: Die Zahl wiederholt durch die Zielbasis teilen, jeden **Rest** notieren, mit dem Quotienten weiterrechnen, bis der Quotient 0 ist. Die Reste **von unten nach oben** gelesen ergeben die Zahl in der neuen Basis. Der zuletzt berechnete Rest ist die höchstwertige (linke) Ziffer.

**Beispiel: 1234₁₀ → Basis 12** (nachgerechnet)

| Schritt | Rechnung | Rest |
|---|---|---|
| 1 | 1234 ÷ 12 = 102 | 10 (= A) |
| 2 | 102 ÷ 12 = 8 | 6 |
| 3 | 8 ÷ 12 = 0 | 8 |

Von unten gelesen: **86A₁₂**. Probe: 8·144 + 6·12 + 10 = 1152 + 72 + 10 = 1234 ✓

**Beispiel: 13₁₀ → Basis 2** → 13÷2=6 R1, 6÷2=3 R0, 3÷2=1 R1, 1÷2=0 R1 → **1101₂**. Probe: 8+4+0+1 = 13 ✓

**Beispiel: 348₁₀ → Basis 5** → **2343₅**. Probe: 2·125 + 3·25 + 4·5 + 3 = 348 ✓

#### Nachkommateil — fortgesetzte Multiplikation

Regel: Den gebrochenen Anteil wiederholt mit der Zielbasis multiplizieren. Der jeweils entstehende **ganzzahlige Anteil** (auch 0) ist die nächste Nachkommaziffer. Mit dem verbleibenden Bruchteil weitermachen — bis er 0 wird oder die gewünschte Genauigkeit erreicht ist. Anders als beim ganzen Teil werden die Ziffern hier in der **erzeugten Reihenfolge** (von oben nach unten) gelesen.

**Beispiel: 0,625₁₀ → Basis 2** (nachgerechnet)

| Schritt | Rechnung | Ziffer | Rest |
|---|---|---|---|
| 1 | 0,625 × 2 = 1,25 | 1 | 0,25 |
| 2 | 0,25 × 2 = 0,5 | 0 | 0,5 |
| 3 | 0,5 × 2 = 1,0 | 1 | 0 (Ende) |

Ergebnis: 0,625₁₀ = **0,101₂** ✓

**Beispiel: 0,5₁₀ → Basis 5** → 0,5×5 = 2,5 (Ziffer 2, Rest 0,5), wiederholt sich → **0,2222…₅** (periodisch).

#### Vollbeispiel mit beiden Teilen

**12345,6₁₂ → Dezimal** (nachgerechnet):

| Stelle | Wert dezimal |
|---|---|
| 1·12⁴ | 20736 |
| 2·12³ | 3456 |
| 3·12² | 432 |
| 4·12¹ | 48 |
| 5·12⁰ | 5 |
| 6·12⁻¹ | 0,5 |

Summe = **24677,5₁₀** ✓

#### Sonderfall: verwandte Basen (reines Gruppieren, keine Division)

Wenn eine Basis eine Potenz einer anderen ist, läuft die Umrechnung ohne Rechnung — nur durch **Gruppieren der Ziffern**:
- 8 = 2³ → jede Oktalziffer = genau **3 Binärstellen**
- 16 = 2⁴ → jede Hexadezimalziffer = genau **4 Binärstellen** (ein „Nibble")

Beispiel: `10 0101 1100₂` → in Vierergruppen `0010 0101 1100` → **25C₁₆**. Das ist der zentrale Praxisgrund, warum Hex und Oktal in der Informatik so beliebt sind.

### Brüche 1/2 … 1/12 in Basis 10 und Basis 12 nebeneinander

Diese Tabelle wurde mit exakter Bruchrechnung erzeugt und Stelle für Stelle geprüft. Die Periode ist mit Überstrich-Notation hier durch Klammern markiert; der Wert vor der Klammer ist die nicht-periodische Vorperiode.

| Bruch | Dezimal (Basis 10) | Dozenal (Basis 12) | Bemerkung |
|---|---|---|---|
| 1/2 | 0,5 | 0,6 | beide endlich |
| 1/3 | 0,(3) | **0,4** | nur Basis 12 endlich |
| 1/4 | 0,25 | 0,3 | beide endlich |
| 1/5 | 0,2 | 0,(2497) | nur Basis 10 endlich |
| 1/6 | 0,1(6) | **0,2** | nur Basis 12 endlich |
| 1/7 | 0,(142857) | 0,(186A35) | beide periodisch, Periode 6 |
| 1/8 | 0,125 | 0,16 | beide endlich |
| 1/9 | 0,(1) | **0,14** | nur Basis 12 endlich |
| 1/10 | 0,1 | 0,1(2497) | nur Basis 10 endlich |
| 1/11 | 0,(09) | 0,(1) | jeweils kurze Periode |
| 1/12 | 0,08(3) | **0,1** | nur Basis 12 endlich |
| 2/3 | 0,(6) | 0,8 | nur Basis 12 endlich |

**Wichtige Korrektur/Präzisierung gegenüber populären Snippet-Quellen** (eigenständig per BigInt-Rechnung verifiziert):
- 1/7 in Basis 12 = 0,(186A35) — die Periode ist „186A35", Länge 6.
- 1/5 in Basis 12 = 0,(2497) — reine Periode „2497", Länge 4, beginnt direkt hinter dem Komma.
- 1/10 in Basis 12 = 0,1(2497) — eine Vorziffer „1", danach Periode „2497". Manche Quellen geben das ungenau wieder.

Proben: 0,16₁₂ = 1/12 + 6/144 = 18/144 = 1/8 ✓; 0,14₁₂ = 12/144 + 4/144 = 16/144 = 1/9 ✓

**Kernbeobachtung:** Basis 12 macht 1/3, 1/6, 1/9, 1/12 und 2/3 endlich (in Basis 10 alle periodisch). Der Preis: 1/5 und 1/10 werden in Basis 12 periodisch, weil 5 kein Teiler von 12 ist.

### Brüche in Basis 60

Weil 60 = 2²·3·5 alle drei kleinen Primzahlen enthält, terminieren besonders viele Brüche:
- 1/2 = 0;30, 1/3 = 0;20, 1/4 = 0;15, 1/5 = 0;12, 1/6 = 0;10 (Semikolon trennt den ganzen vom gebrochenen Teil, siehe Neugebauer-Notation).

Eine Stunde lässt sich dadurch glatt in 30, 20, 15, 12, 10, 6, 5, 4, 3, 2, 1 Minuten teilen — der praktische Grund für 60 in Zeit und Winkel.

### Teilbarkeitsregeln in Basis 12

Weil 12 die Teiler 2, 3, 4, 6 hat, ist die Teilbarkeit oft an der **letzten Ziffer** ablesbar (Quelle: Dozenal Society of America):

| Teiler | Regel in Basis 12 |
|---|---|
| 2 | letzte Ziffer gerade: 0, 2, 4, 6, 8, A |
| 3 | letzte Ziffer ∈ {0, 3, 6, 9} |
| 4 | letzte Ziffer ∈ {0, 4, 8} |
| 6 | letzte Ziffer ∈ {0, 6} |
| 12 (= „10") | endet auf 0 |
| B (= 11) | Quersumme ist Vielfaches von B (analog zur 9er-Regel in Basis 10) |
| 5, 7 | keine einfache Endziffernregel |

Zum Vergleich: In Basis 10 sind nur 2, 5, 10 an der Endziffer ablesbar; 3 und 9 brauchen die Quersumme, 4 die letzten zwei Ziffern. Basis 12 deckt mit der Endziffer allein mehr kleine Teiler ab.

### Vergleichstabelle: Teilbarkeit, Kompaktheit, Lesbarkeit

| Basis | Anzahl Teiler | Endliche Einheitsbrüche 1/n | Kompaktheit | Lesbarkeit für Menschen |
|---|---|---|---|---|
| 2 | 2 | nur n = 2ᵏ | sehr gering (lange Folgen) | gering |
| 8 | 4 | nur n = 2ᵏ | mittel | mittel (technisch) |
| 10 | 4 | 2ᵃ·5ᶜ (inkl. 1/5) | gut | sehr hoch (vertraut) |
| 12 | 6 | 2ᵃ·3ᶜ (1/3, 1/4, 1/6, 1/8, 1/9) | gut | mäßig (Sonderziffern) |
| 16 | 5 | nur n = 2ᵏ | hoch (byte-bündig) | technisch |
| 60 | 12 | bis 1/6, 1/10, 1/12, 1/15, 1/20, 1/30 | sehr hoch | gering (60 Symbole) |

---

## Geschichte & Personen

### Sexagesimal (60) — das erste Positionssystem

Das Sexagesimalsystem entstand bei den **Sumerern im 3. Jahrtausend v. Chr.** und wurde an die **Babylonier** weitergegeben, mit Einflüssen der **Akkader**. Es verband das Stellenwertprinzip (Potenzen von 60) mit einer internen Zehnergruppierung für die Werte 1–59. Der Übergang zum echten Positionssystem gilt als die größte mathematische Leistung der Babylonier; weder Sumerer noch Akkader hatten ein reines Positionssystem.

Spuren der Basis 60 finden sich in alten Maßeinheiten: 1 Talent = 60 Minen, 1 Mine = 60 Schekel (spätes 3. Jahrtausend v. Chr.).

**Null-Problem:** Spätbabylonische Texte nutzten einen Platzhalter für die Null, aber nur in mittleren Positionen, nie am rechten Ende — also keine voll ausgereifte Null.

**Moderne Notation:** **Otto Neugebauer** führte in den 1930er Jahren die heute übliche wissenschaftliche Schreibweise ein: Werte 0–59 je Stelle dezimal geschrieben, Semikolon trennt ganzzahligen vom gebrochenen Teil, Komma trennt die Stellen (z. B. `1;30` für 1,5).

**Unsicher/umstritten:** Warum gerade 60? Eine endgültige Erklärung gibt es nicht. Die meistgenannte Begründung ist die hohe Teilbarkeit (60 ist die kleinste Zahl, die durch alle von 1 bis 6 teilbar ist — kgV(1…6) = 60, unabhängig verifiziert). Eine ältere, auf Theon von Alexandria zurückgehende Teilbarkeits-Erklärung existiert ebenfalls, ist aber in den geprüften Primärquellen nicht im Detail belegt. Neugebauer selbst warnte: „die Ursprünge sind nicht so einfach, konsistent oder zeitlich eindeutig, wie sie oft dargestellt werden."

### Dezimal (10) — die indische Stellenwert-/Null-Entwicklung

Das positionelle Dezimalsystem mit zehn Symbolen wurde zwischen dem 1. und 4. Jahrhundert von indischen Mathematikern entwickelt. **Aryabhata** (5. Jh.) wird die Stellenwertnotation zugeschrieben. **Brahmagupta** formalisierte im 7. Jahrhundert die **Null** (*shunya*, „Leere") als Platzhalter *und* als eigenständige Zahl mit Rechenregeln — in seinem Werk **Brāhmasphuṭasiddhānta (628 n. Chr.)**.

Ab dem 9. Jahrhundert übernahmen arabische und persische Mathematiker das System: **al-Chwārizmī** („Über das Rechnen mit indischen Ziffern", ca. 825) und **al-Kindī** verbreiteten es in der islamischen Welt, von wo es nach Europa gelangte.

**Unsicher:** Die Datierungen zu Aryabhata und der frühindischen Entwicklung schwanken in der Literatur und sind als Näherungen zu lesen. Die populäre „zehn Finger"-Erklärung für die Basis 10 ist plausibel, aber historisch nicht eindeutig belegt.

### Binär (2) — Leibniz und Vorläufer

**Thomas Harriot (1560–1621)** verstand die binäre (und andere) Numeration theoretisch fast ein Jahrhundert vor Leibniz, sah aber keine Anwendung und publizierte nicht.

**Gottfried Wilhelm Leibniz** entwickelte das System ab den 1670er Jahren (1679 skizzierte er eine binäre Rechenmaschine) und veröffentlichte es im **April 1703** als „Explication de l'Arithmétique Binaire" in den *Mémoires de l'Académie Royale des Sciences* in Paris — nur die Zeichen 0 und 1.

**Hinweis zur Datierung:** Eine frühere Snippet-Quelle nannte „1689". Die geprüften Detailquellen datieren die *Publikation* auf 1703; die Vorarbeiten liegen früher. Konfidenz für 1703 als Publikationsjahr: hoch.

**I-Ging-Verbindung:** Der Jesuit **Joachim Bouvet** sandte Leibniz 1701 (empfangen 1703) ein Diagramm der 64 Hexagramme des *I Ging*. Leibniz erkannte darin sein Binärsystem wieder und verband es mit seinem Programm einer universellen Formalsprache (*characteristica universalis*).

### Oktal (8)

- **1716** bat König **Karl XII. von Schweden** **Emanuel Swedenborg** um ein System zur Basis 64; Swedenborg hielt 64 für zu schwer und schlug **Basis 8** vor (Manuskript 1718, unveröffentlicht).
- **Hugh Jones** schlug 1745 ein Oktalsystem für britische Münzen und Maße vor.
- **James Anderson** prägte 1801 den Begriff **„octal"**.

### Hexadezimal (16)

Der Begriff „hexadecimal" ist erstmals **1952** belegt (C. E. Fröberg, *Hexadecimal Conversion Tables*) — ein sprachlicher Mischling aus griechisch *hex* (sechs) und lateinisch *-decimal*. Die ältere Variante „sexadecimal" stand schon 1895 im *Century Dictionary*. **Donald Knuth** hielt 1969 etymologisch „senidenary" für korrekter.

Die heutige **A–F-Notation** wurde ab 1966 mit dem Fortran-IV-Handbuch für IBM System/360 zum De-facto-Standard. Frühere Maschinen nutzten ganz andere Symbole (z. B. ORDVAC/ILLIAC: K, S, N, J, F, L).

### Dozenal/Duodezimal (12) — die Bewegung

- **Frank Emerson Andrews** schrieb 1934/35 im *Atlantic Monthly* über Basis 12 und veröffentlichte 1935 das Buch „New Numbers: How Acceptance of a Duodecimal Base Would Simplify Mathematics" — das erste buchlange Werk dazu in Amerika. Sein Kernargument: Viele Rechenvorteile, die man dem metrischen System zuschreibt, ließen sich auch dozenal erreichen, weil traditionelle Maßeinheiten viele Faktoren von 12 enthalten.
- Die **Duodecimal Society of America** wurde **1944** gegründet (Andrews als erster Präsident; ab 1945 erschien das *Duodecimal Bulletin*). Die **Dozenal Society of Great Britain** folgte **1959**.

**Symbole für Zehn und Elf** (es gibt bis heute keinen einheitlichen Standard):
- **Dwiggins**-Symbole 𝒳 und Ɛ (von William Addison Dwiggins), von der DSA 2008–2015 verwendet;
- **Pitman**-Ziffern ↊ und ↋ (gedrehte 2 und 3), in **Unicode 8.0 (2015)** aufgenommen;
- historisch auch X/E oder T/E;
- die Buchstaben **A und B** (aus der Hexadezimal-Konvention).

**Sehr aktuelle, ungewöhnliche Angabe:** Im **Januar 2026** stellte die DSA ihre Webseiten auf die Buchstaben A und B um, behielt aber die Pitman-Ziffern im *Duodecimal Bulletin* bei. Diese Angabe wurde durch zwei unabhängige Quellen bestätigt (Wikipedia und DSA-bezogene Treffer); Konfidenz: hoch. Sie ist erwähnenswert, weil sie so neu ist, dass viele ältere Quellen sie noch nicht kennen.

**Unsicher/umstritten:** Die Hypothese, Basis 12 stamme aus der Phalangen-Zählung (3 Fingerglieder × 4 Finger = 12, mit dem Daumen abgezählt; die zweite Hand zählt Zwölfergruppen bis 60), ist verbreitet, aber historisch nicht eindeutig belegt. Sie sollte als plausible Hypothese, nicht als Tatsache präsentiert werden.

---

## Anwendung heute

### Binär (2) und Hexadezimal (16) — Computer

Computer-Hardware ist binär: Ein Transistor kennt physisch nur zwei Zustände (an/aus, Strom fließt/fließt nicht), direkt als 1/0 interpretierbar. Das ist die einfachste, rauschrobusteste physikalische Realisierung.

Hexadezimal dient als **kompakte, byte-bündige Darstellung** von Binärdaten. Weil 16 = 2⁴, gilt: 1 Hex-Ziffer = 4 Bit (ein Nibble), 1 Byte = 2 Hex-Ziffern (z. B. `2C`). Die Umrechnung Binär↔Hex ist trivial (Vierergruppen bilden). Praktische Anwendungen: Speicheradressen, Byte-Werte, Web-Farben (`#FF00FF`), Unicode-Codepoints (`U+00A1`), MAC- und IPv6-Adressen, Hex-Dumps beim Debuggen.

### Oktal (8) — Nischenrolle

Eine Oktalziffer = 3 Bit. Oktal war in den 1940er–1960er Jahren verbreitet, als Wortbreiten Vielfache von 3 Bit waren (z. B. die PDP-8 mit 12-Bit-Wort = vier Oktalziffern). **Niedergang:** Mit dem 8-Bit-Byte wurde Oktal unpraktisch, weil 8 kein Vielfaches von 3 ist und Oktal-Gruppen die Byte-Grenzen zerschneiden. Hexadezimal passt exakt zu Bytes und setzte sich durch. Oktal überlebt vor allem in **Unix-Dateirechten** (`chmod 755`: je Ziffer Eigentümer/Gruppe/Andere, Wert = 4 lesen + 2 schreiben + 1 ausführen).

### Sexagesimal (60) — Zeit, Winkel, Koordinaten

In modifizierter Form bis heute im Einsatz: **Zeit** (60 Sekunden/Minute, 60 Minuten/Stunde), **Winkel** (360° pro Kreis = sechs Sechziger; 60 Bogenminuten/Grad, 60 Bogensekunden/Minute), **geografische Koordinaten** und Navigation. Es wird heute nie als reines Symbolsystem geschrieben (das bräuchte 60 Ziffern), sondern als Mischnotation mit Doppelpunkt (`3:23:17`) oder Grad/Minuten/Sekunden.

### Dezimal (10) — Alltag, Metrik, SI

Das gesamte metrische/SI-System ist base-10-strukturiert: alle Einheiten über Zehnerpotenzen verknüpft, Umrechnung durch Komma-Verschieben (10 mm = 1 cm, 100 cm = 1 m), konsistente Präfixe (kilo = 1000, milli = 1/1000). SI ist das einzige Messsystem mit offiziellem Status in fast allen Ländern. Dezimal dominiert Alltag, Handel, Schule und nahezu die ganze Wissenschaft — ein institutioneller „Lock-in".

### Dozenal (12) — kulturelle Spuren plus aktive Bewegung

Reale Spuren von 12 im Alltag: 12 Stunden, 24 Stunden (12×2), 12 Monate, **Dutzend** (12), **Gros** (144 = 12²), Großgros (1728 = 12³), 12 Zoll/Fuß, 12 Troy-Unzen/Pfund. Die römische *uncia* wurde sowohl zu „ounce" als auch zu „inch".

Aktiv gefördert wird die Umstellung von der **Dozenal Society of America** und der **Dozenal Society of Great Britain**; ein ausgearbeitetes dozenales Maßsystem ist Tom Pendleburys **TGM**. Das heutige Interesse ist überwiegend akademisch und hobbyistisch (Notation, Pädagogik, Basenvergleich) — eine breite praktische Umstellung findet nicht statt.

---

## Missverständnisse & ehrliche Vorbehalte

### A) Der Fünftel-blinde-Fleck von Basis 12

Es stimmt: 12 hat sechs Teiler gegen vier bei 10, und 1/3 = 0,4₁₂ terminiert sauber. **Aber ein oft unterschlagener Punkt:** Sowohl 10 als auch 12 haben 5 *nicht* als Primfaktor. Jeder Bruch mit 5 im Nenner (1/5, 1/10, 1/20) wird in Dozenal periodisch — 1/5 = 0,(2497)₁₂. Fünftel und Zehntel sind aber für Prozente, Dezimalgeld und Statistik zentral. Ein verbreitetes Pro-Dozenal-Zitat tut das mit „who cares about fifths? Fifths are usually a cheap imitation of sixths" ab — das ist eine abtuende, keine ernsthafte Auseinandersetzung. Ehrlich bilanziert: 12 *tauscht* die saubere Drittel-Darstellung gegen die saubere Fünftel-Darstellung ein, es gewinnt nicht überall.

### B) Längere Perioden, wenn es schiefgeht

Wenn in Dozenal doch ein Bruch periodisch wird, hat die Periode tendenziell *größere* Länge als das dezimale Gegenstück, weil 12 zwischen den Primzahlen 11 und 13 liegt. Das macht „hässliche" Ergebnisse in Basis 12 mitunter besonders lang (in diesem Rechner z. B. Periodenlängen über 100 Stellen bei manchen Ergebnissen).

### C) „Basis 12 ist wie das überlegene imperiale System" — Verwechslung

Der eigentliche Vorteil eines Maßsystems ist die **interne Konsistenz** (alle Umrechnungen über *eine* Basis, Komma verschieben) — nicht „imperial gegen metrisch". Das metrische System gewinnt, weil es konsequent *eine* Basis nutzt, nicht weil 10 mathematisch optimal wäre. Ein gemischtes imperiales System (Meile/Yard/Fuß/Zoll mit Faktoren 1760/3/12) hätte diesen Vorteil *nicht*, egal in welcher Ziffernbasis man es schreibt. Pro-Dozenal-Argumente vermischen diese beiden Dinge häufig.

### D) „Eine bessere Basis verbessert die Mathematik" — überzogen

Mathematik selbst ist basenunabhängig; nur die *Darstellung* von Brüchen ändert sich. Selbst ein wohlwollender Pro-Dozenal-Autor räumt ein, Zahlschreibweisen seien „still arbitrary conventions" und sein Text sei mehr Spielerei als zwingendes Argument. Die meisten Vorteile sind kosmetisch/notationsbezogen, nicht fundamental.

Das oft zitierte **Aitken-Zitat** (Dezimal-Effizienz „etwa 65", wenn Dozenal 100 bekommt) ist eine subjektive Schätzung *einer* Person für „gewöhnliche Rechnungen", keine gemessene oder allgemein anerkannte Kennzahl — entsprechend vorsichtig zu zitieren.

### E) Kompaktheit ist real, aber meist klein

Höhere Basen brauchen weniger Stellen. Bei Hex ist das ein *funktionaler* Vorteil (exaktes Bit-Mapping). Bei Dozenal sind die Zahlen nur etwa 8 % kürzer als dezimal (Schätzung) — real, aber gering, also eher kosmetisch. Zudem braucht 12 zwei neue Glyphen, für die es keinen Standard gibt (A/B vs. ↊/↋ vs. X/E) — ein echtes Adoptions- und Lesbarkeitshindernis.

### F) Umrechnen ist Übungssache, hat aber reale Kosten

Die Umrechnung folgt festen Algorithmen — kein konzeptionelles Hindernis. Aber: Sie ist zeitaufwändig, und bei Nachkommastellen drohen Rundungsfehler, wenn man zwischendurch rundet (deshalb die Regel „nicht runden"). Das ist kein Argument gegen das Lernen, aber ein realer Grund, warum ein globaler Basiswechsel praktisch teuer wäre.

### G) Monokausale Finger-Erzählungen sind unsicher

Sowohl die „zehn Finger"-Erklärung für Basis 10 als auch die „Phalangen"-Erklärung für Basis 12 sind populäre Hypothesen, aber historisch nicht eindeutig belegt. Sie sollten als Hypothesen markiert werden, nicht als Tatsachen.

### Fazit der Abwägung

Keine Basis ist universell überlegen. 12 schlägt 10 bei Drittel/Viertel/Sechstel, verliert aber bei Fünfteln. 60 ist „teilbarkeits-königlich", aber mit 60 Symbolen zu groß für den Alltag. 2 und 16 sind nicht „besser für Menschen", sondern für Maschinen optimal. Der praktisch entscheidende Faktor eines Messsystems ist die konsequente Ein-Basen-Konsistenz, nicht die Wahl der Basis selbst.

---

## Quellen (Tier-System)

Bewertung nach zwei Achsen. **Zuverlässigkeit:** R1 = wissenschaftlich/primär · R2 = etablierte Referenz · R3 = seriös populär · R4 = schwach (Blog/SEO) · S = spekulativ/pseudowissenschaftlich. **Zugang:** A1 = Volltext gelesen · A2 = nur teilweise (Snippet/Paywall) · A3 = nur indirekt.

Zusätzlich: Alle Bruchtabellen, Umrechnungsbeispiele und Stellenwert-Proben in diesem Dossier wurden **eigenständig per exakter Bruch-/BigInt-Rechnung** verifiziert (Python `fractions`), nicht nur aus Quellen übernommen.

### Grundlagen, Stellenwert, Umrechnung

- [R2·A1] Positional notation — Wikipedia — https://en.wikipedia.org/wiki/Positional_notation — Stellenwert-Formel, Radixpunkt, Umrechnungsverfahren; im Volltext gelesen.
- [R3·A1] Another Method for Converting Between Bases — Lumen Learning / Math for Liberal Arts — https://courses.lumenlearning.com/waymakermath4libarts/chapter/converting-between-bases/ — Division-Rest- und Multiplikations-Verfahren, „Do not round off"-Warnung; Volltext.
- [R3·A1] Conversion of Fractions in Various Bases — cut-the-knot — https://www.cut-the-knot.org/blue/frac_conv.shtml — Nachkomma-Multiplikationsverfahren mit periodischem Beispiel; Volltext.
- [R2·A2] Numeral system — Wikipedia — https://en.wikipedia.org/wiki/Numeral_system — Snippet.
- [R2·A2] Radix — Wikipedia — https://en.wikipedia.org/wiki/Radix — Snippet.
- [R3·A3] Number System and Base Conversions — GeeksforGeeks — https://www.geeksforgeeks.org/digital-logic/number-system-and-base-conversions/ — indirekt.
- [R3·A3] Base Conversion Method — MathsIsFun — https://www.mathsisfun.com/base-conversion-method.html — indirekt.
- [R3·A3] Using repeated division to convert to other bases — Purplemath — https://www.purplemath.com/modules/base_why.htm — indirekt.

### Zahlentheorie (Teilbarkeit, Perioden)

- [R2·A1] Superior highly composite number — Wikipedia — https://en.wikipedia.org/wiki/Superior_highly_composite_number — Definition mit ε, Folge 2,6,12,60,120,360, Bezug zu Basen; Volltext.
- [R2·A1] Multiplicative order — Wikipedia — https://en.wikipedia.org/wiki/Multiplicative_order — Definition, gcd-Bedingung, teilt φ(n), Beispiel; Volltext.
- [R2·A2] Highly composite number — Wikipedia — https://en.wikipedia.org/wiki/Highly_composite_number — Folge 1,2,4,6,12,…; Snippet.
- [R2·A2] 12 (number) — Wikipedia — https://en.wikipedia.org/wiki/12_(number) — Teiler von 12; Snippet.
- [R2·A2] Repeating decimal — Wikipedia — https://en.wikipedia.org/wiki/Repeating_decimal — Terminierungskriterium, Periodenlänge ↔ Ordnung; Snippet.
- [R2·A2] Multiplicative Order — Wolfram MathWorld — https://mathworld.wolfram.com/MultiplicativeOrder.html — Snippet.
- [R2·A3] A002182 (hochzusammengesetzte Zahlen) — OEIS — https://oeis.org/A002182 — indirekt.
- [R1·A3] Repeating Decimal Expansions in Different Bases (eJMT, PDF) — https://ejmt.mathandtech.org/Contents/eJMT_v16n3p4.pdf — indirekt.
- [R3·A2] Q: prime denominator repeats every p−1 digits — Ask a Mathematician — https://www.askamathematician.com/2015/07/q-when-you-write-a-fraction-with-a-prime-denominator-in-decimal-form-it-repeats-every-p-1-digits-why/ — Snippet zur Maximalperiode.

### Sexagesimal / Babylonien

- [R2·A1] Sexagesimal — Wikipedia — https://en.wikipedia.org/wiki/Sexagesimal — Ursprung, 12 Teiler, Zeit/Winkel, Neugebauer-Notation, Null-Problem; Volltext.
- [R2·A2] Sexagesimal number system — Britannica — https://www.britannica.com/science/sexagesimal-number-system — Snippet.
- [R2·A3] Babylonian mathematics — Wikipedia — https://en.wikipedia.org/wiki/Babylonian_mathematics — indirekt.
- [R1·A3] Babylonian numerals — MacTutor — https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/ — indirekt.

### Binär / Leibniz

- [R3·A2] Binary number — Wikipedia — https://en.wikipedia.org/wiki/Binary_number — Snippet.
- [R3·A2] Binary Numbers — Electronics-Tutorials — https://www.electronics-tutorials.ws/binary/bin_1.html — Snippet (Leibniz, an/aus).
- [R4·A2] What Is Binary — Computerhope — https://www.computerhope.com/jargon/b/binary.htm — Snippet (Transistor-Zustände).
- [R3·A3] Leibniz Expounds on Binary Arithmetic — History of Information — https://www.historyofinformation.com/detail.php?id=395 — indirekt.
- [R3·A3] The Binary System Was Created Long Before Leibniz — Comm. of the ACM (Blog) — https://cacm.acm.org/blogcacm/the-binary-system-was-created-long-before-leibniz/ — indirekt (Harriot-Vorläufer).
- [R4·A3] Leibniz and the I Ching — ichingai.info — https://ichingai.info/en/learn/leibniz-i-ching/ — indirekt.

### Oktal

- [R2·A2] Octal — Wikipedia — https://en.wikipedia.org/wiki/Octal — Snippet (Swedenborg, Jones, Anderson).
- [R3·A2] Embedded Wednesdays: Octal — Embedded.fm — https://embedded.fm/blog/embedded-wednesdays-octal — Snippet (3-Bit-Wortbreiten).
- [R2·A2] PDP-11 architecture — Wikipedia — https://en.wikipedia.org/wiki/PDP-11_architecture — Snippet (Übergang Oktal→Hex).
- [R4·A3] Why Octal and Hexadecimal are used On Computers — thestarman.pcministry.com — https://thestarman.pcministry.com/asm/hexawhat.html — indirekt.
- [R3·A3] Octal and Hexadecimal Numeration — All About Circuits — https://www.allaboutcircuits.com/textbook/digital/chpt-1/octal-and-hexadecimal-numeration/ — indirekt.

### Hexadezimal

- [R2·A1] Hexadecimal — Wikipedia — https://en.wikipedia.org/wiki/Hexadecimal — 4-Bit-Mapping, Begriffsgeschichte, A–F-Standardisierung; Volltext.
- [R2·A2] Nibble — Wikipedia — https://en.wikipedia.org/wiki/Nibble — Snippet (Nibble = 4 Bit, Byte = 2 Hex).
- [R3·A2] What is a nibble — TechTarget — https://www.techtarget.com/whatis/definition/nibble — Snippet.
- [R3·A2] What is a Nibble — Lenovo — https://www.lenovo.com/us/en/glossary/nibble/ — Snippet.
- [R3·A2] Why we are using HEXADECIMAL values for computer addressing — ResearchGate — https://www.researchgate.net/post/Why_we_are_using_HEXADECIMAL_values_for_computer_addressing — Snippet.
- [R1·A3] Robert (Bob) Bemer papers (Finding Aid) — Computer History Museum — https://archive.computerhistory.org/resources/access/text/finding-aids/102724781-Bemer/102724781-Bemer.pdf — indirekt.

### Dezimal / Indien / Null / Metrik

- [R2·A3] History of the Hindu–Arabic numeral system — Wikipedia — https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system — indirekt.
- [R2·A3] Hindu–Arabic numeral system — Wikipedia — https://en.wikipedia.org/wiki/Hindu%E2%80%93Arabic_numeral_system — indirekt.
- [R3·A3] 4.1 Hindu-Arabic Positional System — OpenStax — https://openstax.org/books/contemporary-mathematics/pages/4-1-hindu-arabic-positional-system — indirekt.
- [R1·A3] Writing with SI (Metric System) Units — NIST — https://www.nist.gov/pml/owm/writing-si-metric-system-units — indirekt (autoritativ für SI).
- [R2·A3] International System of Units — Wikipedia — https://en.wikipedia.org/wiki/International_System_of_Units — indirekt.
- [R4·A3] Why the World Uses the Metric System — SI-Units.eu — https://si-units.eu/blog/metric-system — indirekt.

### Duodezimal / Dozenal

- [R2·A1] Duodecimal — Wikipedia — https://en.wikipedia.org/wiki/Duodecimal — Symbole A/B/↊/↋, Teiler, exakte Brüche, Gros, Andrews/DSA/DSGB, Aitken-Zitat, Januar-2026-Umstellung; Volltext.
- [R3·A1] Dozenal Divisibility Rules — Dozenal Society of America — https://dozenal.org/drupal/content/dozenal-divisibility-rules.html — Endziffern-Teilbarkeitsregeln; Volltext.
- [R3·A2] Dozenal Society of America (Hauptseite) — https://dozenal.org/ — Snippet.
- [R3·A1] The case for base twelve — eev.ee (fuzzy notepad) — https://eev.ee/blog/2016/04/26/the-case-for-base-twelve/ — Pro-Argumente UND ehrliche Selbstrelativierung, „who cares about fifths", 8-%-Zahl; Volltext. (Blog, aber unüblich selbstkritisch und sachlich.)
- [R3·A2] Duodecimal Number System: Should We Use Base 12 Instead Of Base 10? — ScienceABC — https://www.scienceabc.com/eyeopeners/why-we-should-already-use-base-12-instead-of-base-10 — Snippet (Andrews-Kontext).
- [R4·A2] Base 12: An Introduction — Built In — https://builtin.com/data-science/base-12 — Snippet.
- [R3·A3] An Excursion in Numbers — F. E. Andrews (DSA-PDF) — https://dozenal.org/article-andrews-excursion-in-numbers.pdf — indirekt.
- [R3·A3] A history of the DSA — Gene Zirkel (DSA-PDF) — https://dozenal.org/article-zirkel-history-of-dsa.pdf — indirekt (PDF nicht parsebar).
- [R3·A3] Foundation and First Generation — Dozenal Society of America — https://dozenal.org/duodecimal-bulletin-chronology-000 — indirekt.
- [R3·A3] Summer Reading: „New Numbers" — Charles Petzold (Blog) — http://www.charlespetzold.com/blog/2006/08/250954.html — indirekt.
- [R2·A2] New Numbers (F. E. Andrews, 1935) — Internet Archive — https://archive.org/details/newnumbershowacc0000fran — Katalog/Leihzugang (Volltext leihbar).

### Praxis-Kontext / parallele Systeme

- [R1·A3] When bases clash: numeration systems used in parallel — PMC/NCBI — https://pmc.ncbi.nlm.nih.gov/articles/PMC12536284/ — indirekt (Konsistenz/Verwirrung, Präzisionsverlust).
- [R3·A3] Linux file permissions explained — Red Hat — https://www.redhat.com/en/blog/linux-file-permissions-explained — indirekt (chmod-Oktal).
- [R4·A3] Understanding Octal File Permissions using chmod — filepermissions.com — http://www.filepermissions.com/articles/understanding-octal-file-permissions — indirekt.

### Spekulativ / als unsicher markiert

- [S·A3] Snippet-Cluster zur Phalangen-/Finger-Zähl-These (u. a. Grokipedia, phillosoph.blogspot.com, ResearchGate-Diagramm) — verschiedene URLs — indirekt; **als spekulativ/umstritten zu behandeln**, im Text entsprechend gekennzeichnet.