Ich fasse die vier Recherche-Blöcke zu einem einzigen, kohärenten deutschen Dossier zusammen.

## Grundlagen & Definitionen

Ein **Stellenwertsystem** (Positionssystem) ordnet jeder Ziffer einen Wert zu, der von ihrer Position abhängt. Mit einer Basis *b* steht jede Stelle für eine Potenz von *b*. Nachkommastellen stehen für negative Potenzen. In Basis 12 bedeutet `0.4` also den Wert 4·12⁻¹ = 4/12 = 1/3.

Die **Basis** (Radix) ist die Anzahl der verfügbaren Ziffern und zugleich der Faktor zwischen benachbarten Stellen. Basis 10 nutzt die Ziffern 0–9. Basis 12 nutzt zwölf Ziffern: 0–9 plus zwei zusätzliche Symbole für Zehn und Elf. In diesem Text schreiben wir **A für Zehn** und **B für Elf**. „10" in Basis 12 bedeutet also Zwölf.

Ein **Teiler** *t* einer Zahl *n* ist eine ganze Zahl, für die *n*/*t* wieder ganzzahlig ist. Die Anzahl der Teiler heißt d(n).
- Teiler von **12**: 1, 2, 3, 4, 6, 12 → d(12) = 6.
- Teiler von **10**: 1, 2, 5, 10 → d(10) = 4.

Eine **hochzusammengesetzte Zahl** (highly composite number) ist eine positive ganze Zahl, die mehr Teiler hat als jede kleinere positive Zahl. 12 ist hochzusammengesetzt: alle kleineren Zahlen haben weniger Teiler (d(6)=4, d(8)=4, d(10)=4, d(11)=2). Die ersten hochzusammengesetzten Zahlen sind 1, 2, 4, 6, 12, 24, 36, 48, 60, 120, 180, 240, 360. Bemerkenswert: 10 ist **nicht** darunter, 12 aber schon.

Eine **abundante Zahl** (Überfluss-Zahl) ist eine Zahl, deren Summe der echten Teiler größer ist als sie selbst. 12 ist die *kleinste* abundante Zahl: 1+2+3+4+6 = 16 > 12. Hochzusammengesetzt und abundant sind verschiedene Eigenschaften, fallen bei 12 aber zusammen.

Ein Bruch **bricht ab** (terminiert), wenn seine Stellendarstellung nach endlich vielen Nachkommastellen endet (z. B. 1/4 = 0.25 in Basis 10). Er ist **periodisch**, wenn sich ab einer Stelle ein Ziffernblock unendlich wiederholt (z. B. 1/3 = 0.333…). Die **Periodenlänge** ist die Länge dieses sich wiederholenden Blocks.

Die **multiplikative Ordnung von b modulo n** ist die kleinste positive ganze Zahl *k*, für die bᵏ ≡ 1 (mod n) gilt — gleichbedeutend mit der kleinsten Zahl *k*, für die *n* den Wert bᵏ − 1 teilt. Sie ist nur definiert, wenn ggT(b, n) = 1 ist (Basis und Nenner teilerfremd). Diese Größe ist der Schlüssel zur Periodenlänge (siehe unten).

### Warum 12 mehr Teiler hat als 10

Der Unterschied liegt vollständig in der Primfaktorzerlegung:
- **10 = 2 × 5** — zwei verschiedene, weit auseinanderliegende Primzahlen, jede nur einfach.
- **12 = 2² × 3** — die zwei kleinsten Primzahlen, wobei die 2 doppelt vorkommt.

Die Teileranzahl errechnet sich aus den Exponenten der Primfaktoren über die Formel (e₁+1)(e₂+1)…:
- d(10) = (1+1)(1+1) = 4.
- d(12) = (2+1)(1+1) = 6.

12 „verschwendet" keinen Primfaktor an die große, seltene Primzahl 5. Stattdessen investiert es in kleine Primzahlen (eine zusätzliche 2 und eine 3), die viel häufiger als Teiler auftreten. Deshalb ist 12 durch 1, 2, 3, 4 und 6 teilbar — insbesondere durch **3 und 4**, an denen die 10 scheitert.

Wichtig: Es geht um die Primfaktor-Struktur, nicht um die Größe. Größe allein bringt keine Teilbarkeit. 16 ist größer als 12, hat aber nur die Teiler 1, 2, 4, 8, 16, weil es nur die eine Primzahl 2 enthält.

## Beispiele & Verfahren (mit Tabellen)

### Das Abbruch-Kriterium

**Satz:** Ein vollständig gekürzter Bruch lässt sich in Basis *b* genau dann endlich (abbrechend) darstellen, wenn alle Primfaktoren des Nenners auch Primfaktoren der Basis sind. Das ist eine echte Äquivalenz (genau dann, wenn).

Daraus folgt direkt:
- **Basis 10 (Primfaktoren 2, 5):** Nur Nenner der Form 2ᵃ·5ᵇ brechen ab.
- **Basis 12 (Primfaktoren 2, 3):** Nur Nenner der Form 2ᵃ·3ᵇ brechen ab.

Weil 12 die Primzahl **3** enthält (10 nicht), brechen in Basis 12 alle Drittel-, Sechstel-, Neuntel- und Zwölftel-Brüche ab — genau jene, die in Basis 10 unendlich periodisch werden. Der Preis: Brüche mit dem Faktor **5** (Fünftel, Zehntel), die in Basis 10 abbrechen, werden in Basis 12 periodisch.

### Vergleich der Stammbrüche 1/2 bis 1/12

Notation: `[ … ]` markiert die Periode (den sich wiederholenden Block). „Vorper." = nicht-periodische Nachkommastellen vor der Periode. Alle Werte wurden mit exakter Bruchrechnung nachgerechnet.

| Bruch | Nenner-Primfaktoren | Basis 10 | abbrechend? | Basis 12 | abbrechend? |
|-------|--------------------|----------|-------------|----------|-------------|
| 1/2 | 2 | 0.5 | ja | 0.6 | ja |
| 1/3 | 3 | 0.[3] (Periode 1) | **nein** | **0.4** | **ja** |
| 1/4 | 2² | 0.25 | ja | 0.3 | ja |
| 1/5 | 5 | 0.2 | ja | **0.[2497]** (Periode 4) | **nein** |
| 1/6 | 2·3 | 0.1[6] (Periode 1) | **nein** | **0.2** | **ja** |
| 1/7 | 7 | 0.[142857] (Periode 6) | nein | 0.[186A35] (Periode 6) | nein |
| 1/8 | 2³ | 0.125 | ja | 0.16 | ja |
| 1/9 | 3² | 0.[1] (Periode 1) | **nein** | **0.14** | **ja** |
| 1/A (1/10) | 2·5 | 0.1 | ja | 0.1[2497] (Vorper. 1, Periode 4) | **nein** |
| 1/B (1/11) | 11 | 0.[09] (Periode 2) | nein | 0.[1] (Periode 1) | nein |
| 1/10 (1/12) | 2²·3 | 0.08[3] (Vorper. 2, Periode 1) | **nein** | **0.1** | **ja** |

Lesehinweis zur Notation: In `0.186A35` ist der gesamte sechsstellige Block die Periode. `1/B` (also 1/11 dezimal) hat in Basis 12 die einstellige Periode `0.1111…`, völlig analog zu 1/9 = 0.111… in Basis 10.

**Kernbeobachtung:** Von den alltäglich häufigen Brüchen 1/2, 1/3, 1/4, 1/6, 1/8, 1/9 und 1/12 brechen in Basis 12 **alle** ab. In Basis 10 brechen 1/3, 1/6, 1/9 und 1/12 *nicht* ab. Nur die Fünferreihe (1/5, 1/10) kehrt das Verhältnis um.

Zählt man die periodischen Stammbrüche im Bereich der Nenner 2 bis 12, so ergeben sich:
- **Basis 10: sechs** periodische (Nenner 3, 6, 7, 9, 11, 12).
- **Basis 12: vier** periodische (Nenner 5, 7, 11, 12).

Also zwei weniger in Basis 12. Diese Zählung gilt exakt für den Bereich 2–12; die in der Literatur kursierende Pauschalaussage „sechs periodische Brüche weniger" hängt vom betrachteten Nenner-Bereich ab und ist als Größenordnung, nicht als feste Konstante zu lesen (siehe Vorbehalte).

### Periodenlänge = Ordnung der Basis modulo Nenner

**Hauptsatz:** Sei der Bruch a/n vollständig gekürzt mit ggT(b, n) = 1. Dann ist die Periodenlänge der Darstellung von a/n in Basis *b* genau gleich der multiplikativen Ordnung von *b* modulo *n* — also dem kleinsten *k* mit bᵏ ≡ 1 (mod n).

**Begründungskette:** Die Multiplikation mit *b* verschiebt das Komma um eine Stelle. Die Periode wiederholt sich genau dann, wenn bᵏ·(a/n) wieder denselben Nachkomma-Rest hat, also wenn bᵏ ≡ 1 (mod n). Nach dem **Satz von Euler** gilt b^φ(n) ≡ 1 (mod n), wobei φ die eulersche Phi-Funktion ist. Daraus folgt, dass *k* stets ein Teiler von φ(n) ist. Für einen Primnenner *p* ist φ(p) = p−1, deshalb teilt die Periode immer p−1.

**Maximale Periode (Full-Reptend-Primzahl):** Erreicht die Periode den Höchstwert p−1, so ist *b* eine **Primitivwurzel** modulo *p*. Solche Primzahlen heißen Full-Reptend-Primzahlen bezüglich der Basis *b*. Klassisches Beispiel in Basis 10: 1/7 = 0.142857 hat Periode 6 = 7−1, weil 10 eine Primitivwurzel modulo 7 ist. Die Ziffern bilden einen zyklischen Block: 2/7 = 0.285714, 3/7 = 0.428571 usw. sind reine Rotationen desselben Blocks.

**Gemischte Nenner (vorperiodisch):** Enthält der Nenner sowohl Primfaktoren der Basis als auch dazu teilerfremde Faktoren, so beginnt die Darstellung mit einem nicht-periodischen Vorlauf, gefolgt von der Periode. Faktorisiert man den Nenner als (Basis-Faktoren)·m, so ist die **Vorlauflänge** gleich dem größten Exponenten der Basis-Primfaktoren, und die **Periodenlänge** gleich der Ordnung von *b* modulo *m*. Beispiel in Basis 12: 1/10 = 1/(2·5) hat Vorlauf 1 und dann die Vierer-Periode der Fünf → `0.1` gefolgt von `[2497]`, also `0.1[2497]`.

### Worked Examples (eigenständig nachgerechnet)

Ordnung von 12 modulo n, mit dem zugehörigen Bruch in Basis 12:

| n | Reduktion | Ordnung | Periode in Basis 12 |
|---|-----------|---------|---------------------|
| 5 | 12 ≡ 2 (mod 5): 2,4,3,1 | **4** | 1/5 = 0.[2497] |
| 7 | 12 ≡ 5 (mod 7): 5,4,6,2,3,1 | **6** | 1/7 = 0.[186A35] |
| 11 | 12 ≡ 1 (mod 11) | **1** | 1/B = 0.[1] |
| 13 | 12² = 144 ≡ 1 (mod 13) | **2** | 1/13 = 0.[0B] |

Detail zur 1/5-Rechnung: Da 12 ≡ 2 (mod 5), berechnet man die Potenzen von 2 modulo 5: 2¹=2, 2²=4, 2³=3, 2⁴=1. Die erste 1 erscheint bei k=4, also Ordnung 4.

Detail zur 1/7-Rechnung: Da 12 ≡ 5 (mod 7): 5¹=5, 5²=25≡4, 5³≡6, 5⁴≡2, 5⁵≡3, 5⁶≡1. Erste 1 bei k=6, also Ordnung 6. 12 ist damit auch in Basis 12 eine Full-Reptend-Primzahl bezüglich 7.

**Warum 7 in beiden Basen „schlimm" ist:** 7 teilt weder 10 noch 12, und sowohl 10 als auch 12 sind Primitivwurzeln modulo 7. Daher ist die Periode in beiden Fällen die volle Länge 6.

**Warum 11 in Basis 12 trivial ist:** 12 = 11 + 1 ≡ 1 (mod 11), also Ordnung 1, also 1/B = 0.[1]. Allgemein: weil die Basis 12 *zwischen* den Primzahlen 11 und 13 liegt, sind 1/11 (Periode 1) und 1/13 (Periode 2) in Basis 12 auffällig kurz.

Erweiterte Periodentabelle (eigene Rechnung) als Fortsetzung: 1/13 = 0.[0B] (Periode 2), 1/14 = 0.0[A35186] (Vorper. 1, Periode 6), 1/15 = 0.0[9724] (Vorper. 1, Periode 4), 1/16 = 0.09 (endlich, 2 Stellen), 1/25 → Periode 20.

**Wichtige Klarstellung:** Die Periodenlänge ist *nicht* generell basisunabhängig. Bei 1/7 ist sie zufällig in beiden Basen 6, bei 1/11 dagegen in Basis 10 zwei und in Basis 12 eins. Eine allgemeine Tendenz: In Basis 12 treten periodische Brüche seltener auf, aber wenn sie auftreten, haben sie seltener eine sehr kurze Periode als in Basis 10. Das ist ein echter Trade-off.

### Teilbarkeitsregeln in Basis 12

Weil 2, 3, 4 und 6 die Basis 12 teilen, genügt für diese Zahlen ein Blick auf die **letzte Ziffer**.

| Teiler | Regel in Basis 12 |
|--------|-------------------|
| 2 | Letzte Ziffer ∈ {0, 2, 4, 6, 8, A} |
| 3 | Letzte Ziffer ∈ {0, 3, 6, 9} |
| 4 | Letzte Ziffer ∈ {0, 4, 8} |
| 6 | Letzte Ziffer ∈ {0, 6} |
| 10 (zwölf) | Endet auf 0 |
| 8 | Über die letzten zwei Ziffern (Block durch 8 teilbar) |
| 9 | Über die letzten zwei Ziffern (Block durch 9 teilbar) |
| B (elf) | Quersumme durch B teilbar (Analogon zur Neunerprobe in Basis 10, weil 12 ≡ 1 mod 11) |
| A (zehn) | Teilbar durch 2 **und** durch 5 |
| 5 | Kein Endziffer-Test; „Split-Promote-Discard"-Verfahren nötig |
| 7 | Kein praktikabler Test (analog zur 7 in Basis 10) |

Bemerkenswert: In Basis 12 funktioniert das Endziffer-Kriterium gleich für **2, 3, 4 und 6**. In Basis 10 gilt es nur für 2, 5 und 10. Die Quersummen-Regel, die in Basis 10 für 3 und 9 gilt (weil 10 ≡ 1 mod 9), gilt in Basis 12 für **B = Elf** (weil 12 ≡ 1 mod 11). Dozenal bietet damit einfache Teilbarkeitstests für alle Zahlen kleiner als die Basis — mit der einzigen Ausnahme der Primzahl 7.

**Worked Example — Teilbarkeit durch 7 in Basis 12** (eigenständig verifiziert). Es gibt ein iteratives Verfahren: letzte Ziffer d abtrennen, den Rest r (als Dozenalzahl) nehmen, neu bilden r + 3·d, wiederholen. Begründung: 12·a + d ≡ 0 (mod 7) ⇔ 5a + d ≡ 0; Multiplikation mit 3 liefert das äquivalente a + 3d, da ggT(3,7)=1. Beispiel mit 7·53 = 371 (dezimal) = **26B** in Basis 12:
26B → 53 → 12 → 7 → 19 → 24. Und 24 in Basis 12 = 28 dezimal = 7·4, also teilbar.

### Umrechnungsverfahren zwischen den Basen

**Ganzzahliger Teil — wiederholte Division durch die Zielbasis.** Beispiel 24677 (dezimal) → Basis 12: fortlaufend durch 12 teilen, die Reste von unten nach oben lesen → 12345 in Basis 12. Gegenprobe über Stellenwerte: 1·12⁴ + 2·12³ + 3·12² + 4·12 + 5 = 20736 + 3456 + 432 + 48 + 5 = 24677. ✓

**Nachkommateil — wiederholte Multiplikation mit der Zielbasis.** Beispiel 0.5 (dezimal) → Basis 12: 0.5 · 12 = 6.0 → Ziffer 6, Rest 0 → `0.6`. Beispiel 0.125 → Basis 12: 0.125·12 = 1.5 (Ziffer 1), Rest 0.5; 0.5·12 = 6.0 (Ziffer 6), Rest 0 → `0.16`. Abbruch, sobald der Rest 0 wird. Bei nicht-abbrechenden Brüchen tritt ein Rest periodisch wieder auf — das markiert den Periodenstart.

**Stellenwert-Methode (Basis 12 → Basis 10).** Jede Ziffer mit ihrem Stellenwert (Potenz von 12, bzw. 12⁻ⁿ für Nachkommastellen) multiplizieren und in Basis 10 aufsummieren.

### Warum eine hochzusammengesetzte Basis fürs Bruchrechnen praktisch ist

Die Vorteile bündeln sich zu einem einzigen Mechanismus: Mehr kleine Primteiler in der Basis → mehr Stammbrüche brechen endlich ab → mehr einstellige Teilbarkeitsregeln → einfacheres Kopfrechnen und kompaktere Tabellen.

1. **Mehr abbrechende Alltagsbrüche.** Halbe, Drittel, Viertel, Sechstel und Zwölftel sind in Basis 12 alle endlich und kurz: 0.6, 0.4, 0.3, 0.2, 0.1. Genau diese Teilungen werden in Handel, Zeit, Geometrie und Mengen ständig gebraucht.
2. **Kürzere oder seltenere Perioden.** Über die Nenner 2–12 zwei periodische Stammbrüche weniger als in Basis 10. Durch die Lage zwischen den Primzahlen 11 und 13 sind 1/11 (Periode 1) und 1/13 (Periode 2) besonders kurz.
3. **Einfachere Teilbarkeitstests** für 2, 3, 4, 6 (Endziffer) und B (Quersumme).
4. **Der Preis:** Fünftel und Zehntel verlieren ihre Endlichkeit (1/5 = 0.[2497]).

## Geschichte & Personen

### Hochzusammengesetzte Zahlen und Basis 60

Der Begriff der hochzusammengesetzten Zahl und ihre systematische Theorie stammen von **Srinivasa Ramanujan**, „Highly composite numbers", *Proceedings of the London Mathematical Society*, Series 2, Vol. 14, S. 347–409, **1915**.

Die babylonische Basis **60** ist sogar „superior highly composite" mit den Teilern 1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60. Sie wurde von den Sumerern vor etwa 3500 v. Chr. entwickelt und von den Babyloniern um etwa 2000 v. Chr. übernommen. Division erfolgte dort über **Reziprokentafeln** (a/b = a · 1/b), nicht über Langdivision. Endliche Reziproke gab es nur bei Nennern mit den Primfaktoren 2, 3 oder 5; die Nenner 7, 11, 13 erzeugten „Lücken" in den Tafeln — genau das Abbruch-Kriterium aus dem zweiten Abschnitt. Das Vermächtnis von Basis 60 ist bis heute lebendig: 24 Stunden, 60 Minuten, 60 Sekunden und der 360°-Kreis.

### Dezimalsystem und die Null (Basis 10)

**Aryabhata** (Aryabhatiya, 499 n. Chr.) nutzte ein positionelles Dezimalsystem und das Wort *kha* („Leere") für die Null-Position. **Brahmagupta** (Brahmasphutasiddhanta, 628 n. Chr.) formalisierte die **Null als Zahl** mit eigenen Rechenregeln (Wort *shunya*) und behandelte negative Zahlen. Die früheste inschriftliche, voll-positionelle Dezimalnotation mit Platzhalter-Null findet sich auf den **Mankani-Kupferplatten, 595–596 n. Chr.** (Gujarat). Dies ist die Grundlage des heute weltweit genutzten Hindu-Arabischen Systems.

### Hexadezimal in der Informatik (Basis 16)

Mit der **IBM System/360** (angekündigt am 7. April 1964) wurde das 8-Bit-Byte zum Standard. Ein Byte entspricht zwei Hex-Ziffern, daher Basis 16. Die Buchstaben-Notation A–F etablierte sich ab **1966** mit dem Fortran-IV-Handbuch für System/360. **Donald Knuth** kritisierte 1969 den hybriden griechisch-lateinischen Begriff „hexadecimal" und schlug etymologisch „senidenary/sedenary" vor — was sich nicht durchsetzte. Hexadezimal zeigt dasselbe Prinzip wie Dozenal: eine hochteilbare Basis als kompakte, rechenfreundliche Notation. In Basis 16 (eine reine Zweierpotenz) sind nur Zweierpotenz-Nenner endlich.

### Die dozenale Bewegung

**Frühe Befürworter.** **Georges-Louis Leclerc, Comte de Buffon** (18. Jh.) plädierte für eine universelle Einführung von Basis 12 für Maße und Münzen. Später folgten **George Bernard Shaw**, **Herbert Spencer** und **H. G. Wells**. (Joshua Jordaine 1687 wird gelegentlich als früher englischer Traktat genannt, ließ sich in den zugänglichen Quellen aber nur indirekt belegen. Eine oft kolportierte Rolle von **Joseph Priestley** ließ sich nicht belegen — siehe Vorbehalte.)

**Isaac Pitman, 1857** schlug Basis 12 vor (Artikel „Reckoning Reform") und führte transdezimale Symbole ein: die durch 180°-Drehung aus Ziffern abgeleiteten **Pitman-Ziffern** (↊ für Zehn, ↋ für Elf). Sie sind bis heute die Notation der britischen Gesellschaft.

**F. Emerson Andrews** war die Schlüsselfigur der amerikanischen Bewegung. Er veröffentlichte zwei Artikel im *Atlantic Monthly* (1934 und 1935, darunter „An Excursion in Numbers") und das Buch **„New Numbers: How Acceptance of a Duodecimal Base Would Simplify Mathematics"** (Erstausgabe 1935, zweite Auflage 1944) — das erste buchlange Werk zu Basis 12 in Amerika. Er verwendete *X* (römische Zehn) und ein *Ɛ* („swash E") für Elf. Sein Kernargument: 12 ist durch 2, 3, 4, 6 teilbar, 10 nur durch 2, 5, daher 1/3 = 0.4, 1/4 = 0.3, 3/4 = 0.9 in Basis 12. Er räumte ein, der „leech-clutch of habit" (die zähe Macht der Gewohnheit) verhindere eine reale Umstellung — sein Vorschlag sei „an invitation to gallant adventure". Andrews' Symbole erschienen später im Schoolhouse-Rock-Segment „Little Twelvetoes".

**Gesellschaften.** Die **Duodecimal Society of America (DSA)** wurde 1944 gegründet (heute Dozenal Society of America), mit Andrews als Mitgründer und erstem Präsidenten. Die **Dozenal Society of Great Britain (DSGB)** folgte 1959 und nutzt die Pitman-Symbologie.

**Glyphen-Geschichte.** Die DSGB nutzt die Pitman-Ziffern (↊, ↋). Die DSA verwendete von 2008 bis 2015 Symbole von **William Addison Dwiggins** (Zehn nach römischem X, Elf als „fancy swash E"). **Don Hammond** (DSGB) passte die Pitman-Zeichen für Digital- und Siebensegmentanzeigen an. Die Pitman-Formen wurden in **Unicode 8.0 (2015)** kodiert: U+218A (↊) und U+218B (↋).

## Anwendung heute

Basis 12 und ihre Verwandten sind kulturell tief verankert, auch ohne dass tatsächlich „dozenal gerechnet" wird:

- **Zeit:** 12-Stunden-Zifferblatt, 24 Stunden pro Tag, 12 Monate, 60 Minuten (Basis 60). Der Vorteil: leichte Teilung in Hälften, Drittel und Viertel.
- **Winkel:** 360° als Vielfaches von 12 — teilbar durch sehr viele kleine Zahlen.
- **Handel und Maße:** Dutzend (12), Gros (144), Großgros (1728); 12 Zoll pro Fuß, 12 Troy-Unzen pro Troy-Pfund; Eier und Backwaren im Dutzend (erleichtert Inventur und Aufteilung).
- **Musiktheorie:** 12 Halbtöne pro Oktave.

Welche Basis wofür (breiter Konsens):
- **Basis 10** bleibt Standard für allgemeine Arithmetik — vor allem aus kultureller Trägheit und weil der Mensch zehn Finger hat.
- **Basis 2, 8, 16** dominieren in der Informatik (Zweierpotenzen, Hardware-Nähe).
- **Basis 12 und 60** prägen Zeit, Winkel und traditionelle Maße, weil dort das Teilen in Drittel und Viertel praktisch zählt.

Die Dozenal Society of America und die Dozenal Society of Great Britain fördern weiterhin das dozenale Rechnen. In der Praxis rechnet jedoch niemand durchgängig dozenal; verbreitet ist nur die *Zwölfer-Gruppierung* von Größen, nicht das vollständige Stellenwertsystem zur Basis 12.

## Missverständnisse & ehrliche Vorbehalte

**„Imperial gegen metrisch" ist das falsche Schlachtfeld.** Die eigentliche Stärke einer Basis ist ihre *interne Konsistenz* (welche Brüche abbrechen, wie Teilbarkeitstests aussehen), nicht der Streit Imperial gegen metrisch. Die Dozenal-Vorteile werden oft fälschlich mit „dann passt das Imperial-System besser" verwechselt. Tatsächlich könnte man ein metrisches System genauso gut dozenal aufbauen. Es ist eine Eigenschaft der *Basis*, nicht des *Maßsystems*.

**Basis 12 ist schlechter durch 5 teilbar — ein echter, oft verschwiegener Nachteil.** 1/5 wird in Basis 12 periodisch (0.[2497], Periode 4), in Basis 10 dagegen endlich (0.2). Auch der Teilbarkeitstest durch 5 ist in Basis 12 umständlich. Für Währung, Prozente und Fünfer-Schritte ist das spürbar. Pro-Dozenal-Texte sprechen diese Schwäche häufig nicht offen an.

**Periodische Brüche sind seltener, aber tendenziell länger.** Der Vorteil (weniger periodische Brüche) hat als Kehrseite, dass die auftretenden Perioden tendenziell länger sind. Wer nur „weniger Perioden" zitiert, erzählt die halbe Wahrheit.

**„Mehr Teiler ist immer besser" ist falsch zu Ende gedacht.** Sonst wäre Basis 60 oder 120 vorzuziehen — beide haben objektiv noch bessere Teilbarkeit als 12. Es gibt jedoch einen Trade-off zwischen Teilbarkeit und Lernaufwand: Eine zu kleine Basis erzeugt lange Zahldarstellungen (binär braucht viele Stellen), eine zu große Basis eine riesige Einmaleins-Tafel (Basis 60 bräuchte 60 Symbole und eine 60×60-Tabelle). 12 gilt als begründeter Kompromiss — nur zwei Extra-Symbole, kleines Einmaleins, aber 2 und 3 als Primfaktoren. Dass 12 der „Sweet Spot" sei, ist die Standard-Position der Dozenal-Gesellschaften: plausibel, aber eine Abwägung, kein Beweis.

**Umstellung ist teuer.** Die Sonderzeichen ↊/↋ sind schwer zu tippen, Font-Unterstützung fehlt vielerorts. Bestehende Lehrbücher, Software und kulturelle Gewohnheiten umzustellen wäre ein enormer Aufwand. Die Dozenal-Vorteile sind real, aber inkrementell, nicht revolutionär. Viele Befürworter verstehen ihre Texte selbst eher als Gedankenexperiment denn als Handlungsaufruf.

**Hinweise zur Genauigkeit und zu Quellenfehlern:**
- Der häufig zitierte eev.ee-Blog gibt 1/5 in Basis 12 fälschlich als „0.[249]" an — er lässt die 7 weg. Die korrekte Periode ist vierstellig „2497", bestätigt durch Wikipedia und unabhängige Rechnung. Dieses Dossier folgt der verifizierten Version.
- Die exakten Ordnungswerte „Ordnung von 12 mod 5 = 4" und „mod 7 = 6" wurden direkt aus der Definition nachgerechnet und über die belegten Periodenlängen gegengeprüft. Keine Einzelquelle führte eine fertige „Ordnung von 12 mod n"-Tabelle im Volltext.
- Die Pauschalaussage „sechs periodische Stammbrüche weniger / zehn kürzere Perioden" wird in den Quellen nicht einheitlich definiert und hängt vom Nenner-Bereich ab. Als grobe Größenordnung verlässlich, als präzise Konstante nicht.
- Pitmans Publikationsorgan wird als „Reckoning Reform" bezeichnet; ältere Sekundärquellen nennen abweichend „Bedfordshire Independent". Das Datum 1857 ist konsistent.
- Joseph Priestley als Basis-12-Befürworter ließ sich nicht belegen (gesichert sind nur Buffon, Pitman, Shaw, Spencer, Wells).

## Quellen (Tier-System)

Bewertung nach zwei Achsen. **Zuverlässigkeit:** R1 = wissenschaftlich/primär, R2 = etablierte Referenz, R3 = seriös populär, R4 = schwach, S = spekulativ. **Zugang:** A1 = Volltext gelesen, A2 = teilweise (Snippet/Paywall), A3 = nur indirekt.

### Mathematische Grundlagen (Brüche, Perioden, Teilbarkeit)

- [R2·A1] Duodecimal — Wikipedia — https://en.wikipedia.org/wiki/Duodecimal — Teilerzahlen 12 vs. 10, Abbruch-Kriterium, exakte Bruchtabelle (1/5 = 0.2497, 1/7 = 0.186A35), „zwischen 11 und 13"-Bemerkung, HCN/abundant-Status. Mehrfach unabhängig per WebFetch geladen.
- [R2·A1] Repeating decimal — Wikipedia — https://en.wikipedia.org/wiki/Repeating_decimal — Abbruch-Kriterium, Periodenlänge = multiplikative Ordnung, Full-Reptend-Primzahlen, Vorlauflänge bei gemischten Nennern, Euler/Fermat.
- [R2·A1] Highly composite number — Wikipedia — https://en.wikipedia.org/wiki/Highly_composite_number — Definition HCN, d(12)=6, Liste 1,2,4,6,12,24,36,48,60, Abgrenzung zu abundanten Zahlen, Ramanujan 1915.
- [R2·A1] Dozenal Divisibility Rules — Dozenal Society of America — https://dozenal.org/drupal/content/dozenal-divisibility-rules.html — Teilbarkeitsregeln Basis 12 für 2–B inkl. 7-Verfahren; „lowest abundant number".
- [R1·A2] Decimal Period — Wolfram MathWorld — https://mathworld.wolfram.com/DecimalPeriod.html — Periodenlänge = multiplikative Ordnung der Basis mod Nenner. Volltext lieferte HTTP 403; nur über Snippet.
- [R1·A2] Multiplicative order — Wikipedia / Wolfram MathWorld — https://en.wikipedia.org/wiki/Multiplicative_order — Definition „kleinstes k mit aᵏ ≡ 1 (mod n)". Teilweise (Snippet).
- [R1·A2] Orders of Units in Modular Arithmetic — Keith Conrad (UConn) — https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf — Begründung Ordnung/Periode, Primitivwurzel-Fall, Ordnung teilt φ(n). PDF beim Abruf nicht maschinenlesbar; Aussage über Wikipedia doppelt belegt.
- [R1·A2] Full Reptend Prime — Wolfram MathWorld — https://mathworld.wolfram.com/FullReptendPrime.html — maximale Periode p−1 ↔ Primitivwurzel. Nur Snippet.
- [R1·A2] eJMT v16n3: Repeating Decimal Expansions in Different Bases — https://ejmt.mathandtech.org/Contents/eJMT_v16n3p4.pdf — Perioden in verschiedenen Basen, „warum nicht größere Basis". PDF binär nicht lesbar; Inhalt durch Wikipedia redundant abgedeckt.
- [R1·A3] OEIS A246004 (dozenale Periodenlängen von 1/p) — https://oeis.org/A246004 — Katalog der Periodenlängen. Direktabruf HTTP 403; Werte selbst per Programm reproduziert.
- [R1·A3] OEIS A002326 (multiplikative Ordnung von 2 mod 2n+1) — https://oeis.org/A002326 — Ordnungs-Maschinerie. Nur Snippet.
- [R4·A1] The case for base twelve — eev.ee / fuzzy notepad — https://eev.ee/blog/2016/04/26/the-case-for-base-twelve/ — praktische Argumentation, abbrechende Brüche, Prozent-Argument. Achtung: enthält Tippfehler bei 1/5 (lässt die 7 weg).
- [R4·A1] Duodecimal: The Base-12 Counting System — duodecimal.net — http://duodecimal.net/archives/duodecimal/duodecimal.html — „terminates iff", Konversionsbeispiel 12345.6₁₂ = 24677.5₁₀, Stellenwert-Tabellen.
- [R4·A1] Should We Use Base 12 Instead Of Base 10? — ScienceABC — https://www.scienceabc.com/eyeopeners/why-we-should-already-use-base-12-instead-of-base-10.html — Nachteil bei der 5, Umstellungs-Argument, „warum nicht größere Basis".
- [R3·A2] Base 12: An Introduction — Built In — https://builtin.com/data-science/base-12 — populäre Einführung, kulturelle Anwendungen. Nur Snippet.
- [R4·A3] Grokipedia „Duodecimal" + dcode Repetend-Rechner — https://grokipedia.com/page/Duodecimal , https://www.dcode.fr/number-repeating-decimal — Kreuzbestätigung Periode 1/5 (4) und 1/7 (6). Nur Snippet.
- [R1·A3] Dozenal Society of Great Britain — Reciprocals — http://www.dozenalsociety.org.uk/pdfs/reciprocals.pdf — Reziproken-Muster. Kein Zugang (ECONNREFUSED); inhaltlich durch eigene Rechnung ersetzt.

### Geschichte & Personen

- [R2·A1] Babylonian mathematics — MacTutor (St Andrews) — https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/ — Sumerer vor 3500 v. Chr., Babylon ~2000 v. Chr., Reziprokentafeln, 1/7,1/11,1/13-Lücken, Zeit/Winkel-Vermächtnis.
- [R3·A1] Summer Reading: New Numbers — Charles Petzold — http://www.charlespetzold.com/blog/2006/08/250954.html — New Numbers 1935/1944, Atlantic 1934/1935, Symbole X und swash-E, „leech-clutch of habit".
- [R2·A2] Hexadecimal — Wikipedia — https://en.wikipedia.org/wiki/Hexadecimal — A–F-Standard ab 1966 (Fortran IV / System/360), Knuth 1969 „senidenary". Snippet.
- [R2·A2] IBM System/360 — Wikipedia — https://en.wikipedia.org/wiki/IBM_System/360 — Ankündigung 7.4.1964, 8-Bit-Byte. Snippet.
- [R2·A2] History of the Hindu–Arabic numeral system — Wikipedia — https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system — Aryabhata 499, Brahmagupta 628, Mankani-Platten 595–596. Snippet.
- [R2·A2] Sexagesimal — Wikipedia — https://en.wikipedia.org/wiki/Sexagesimal — 60 = superior highly composite, Teilerliste, Bruchfreundlichkeit. Snippet.
- [R1·A3] An Excursion in Numbers — F. E. Andrews (DSA) — https://dozenal.org/article-andrews-excursion-in-numbers.pdf — Primärartikel. PDF binär nicht lesbar; Inhalt via Petzold abgedeckt.
- [R1·A3] New Numbers (Internet Archive) — https://archive.org/details/newnumbershowacc0000fran — Primärwerk-Nachweis. Nur Katalogeintrag.
- [R2·A3] Dozenal Society of Great Britain — About Us — http://www.dozenalsociety.org.uk/pdfs/AboutUs.pdf — DSGB-Fakten. Kein Zugang (ECONNREFUSED); via Wikipedia abgedeckt.
- [R2·A3] New Digits (Hammond) — DSGB — http://www.dozenalsociety.org.uk/basicstuff/hammond.html — Hammonds Pitman-Anpassung für Digitalanzeigen. Snippet.