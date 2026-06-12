// German manual chapters. part of ../manual.dart.
//
// Chapter 1 (Grundbedienung) is migrated verbatim from the retired
// info_content.dart legacy chapter 0. The teaching chapters (exponents/roots/
// logs, trigonometry, memory, hyperbolics, Set 9 & 10) are appended here as
// they are authored.

part of '../manual.dart';

List<ManualChapter> _manualChaptersDe() => const [
  ManualChapter('Grundbedienung', [
    _H('Die Ziffern'),
    _P(
      'Dieser Rechner verwendet eigene Symbole für alle zwölf Ziffern. '
      'Vier Ankerziffern sind stilisierte Pfeilspitzen, die in die vier '
      'Himmelsrichtungen zeigen — 1 (oben), 4 (links), 7 (rechts), '
      'A (unten). Sie teilen den Zahlenkreis in vier Dreiergruppen, wie '
      'die Stunden 12, 3, 6 und 9 auf einem Zifferblatt.',
    ),
    _P(
      'Alle Ziffern dazwischen bestehen aus Halbkreisen und Vollkreisen. '
      'Die Null ist ein einfacher Kreis, B (= elf) ein Halbkreis über einem Vollkreis.',
    ),
    _DigitLegend(),
    _H('Grundbedienung'),
    _P(
      'Tippe Zahlen und Operatoren wie auf einem gewöhnlichen Taschen'
      'rechner. Drücke die breite =-Taste am unteren Rand, um das '
      'Ergebnis zu berechnen. AC (in Warnrot) löscht die gesamte '
      'Eingabe und das Ergebnis, Del entfernt das Zeichen links vom '
      'Cursor.',
    ),
    _H('Hilfe und Theorie'),
    _P(
      'Links und rechts der =-Taste sitzen zwei runde Knöpfe: '
      '(i) öffnet diese zwölf Theorie-Kapitel, (?) zeigt das '
      'Bedienungs-Intro mit den roten Markierungen erneut. Beim '
      'allerersten Start öffnet sich das Intro automatisch.',
    ),
    _H('Cursor und Navigation'),
    _P(
      'Der rote Strich im Eingabefeld ist der Cursor. Mit ◀ und ▶ bewegst '
      'du ihn, um mitten in einer Formel Zeichen einzufügen oder zu '
      'löschen. Nach einer Berechnung wandert der Cursor ins Ergebnis'
      'feld — die Pfeile bewegen dann den Ergebnis-Cursor. Sobald du eine '
      'neue Eingabe machst, springt der Cursor zurück ins Eingabefeld.',
    ),
    _H('Weiterrechnen'),
    _P(
      'Nach einer Berechnung kannst du direkt mit einem Operator weiter'
      'machen. Tippst du zum Beispiel + 5 =, verwendet der Rechner '
      'automatisch das letzte Ergebnis als ersten Operanden. Wenn du '
      'stattdessen eine ganz neue Rechnung beginnen willst, drücke '
      'zuerst AC.',
    ),
    _H('Doppelklick für Umkehrfunktionen'),
    _P(
      'Ein zweiter Klick auf eine Funktionstaste wandelt sie in ihre '
      'Umkehrfunktion um: sin wird zu sin⁻¹, cos zu cos⁻¹, und so '
      'weiter. Das gilt auch für die hyperbolischen Funktionen im '
      'Erweiterungsfeld. Ein kleiner goldener Punkt auf der Taste zeigt '
      'an, dass der nächste Klick umkehrt.',
    ),
    _H('Lange drücken für mehr'),
    _P(
      'Tasten mit einer kleinen Ecke unten rechts bieten bei langem '
      'Druck verwandte Funktionen an: x□ enthält x², log enthält ln, '
      'log₁₂ und eˣ, − enthält ±, STO enthält M+ und M−, n! enthält '
      'nCr und nPr. Zum Auswählen den Finger auf die gewünschte Option '
      'gleiten lassen und loslassen — oder loslassen und die Option '
      'antippen. Ein Tipp daneben schließt das Feld.',
    ),
    _H('Spezialoperatoren'),
    _P(
      'x² quadriert die vorangehende Zahl. √ berechnet die Quadratwurzel; '
      'steht links davon eine Zahl, dient diese als Wurzelgrad: 3√8 ergibt '
      'die dritte Wurzel von 8, also 2. log berechnet einen Logarithmus, '
      'wobei die Zahl links das Argument und die Zahl rechts die Basis ist: '
      '8 log 2 ist der Logarithmus von 8 zur Basis 2, also 3. ⊕ berechnet '
      'die Paralleladdition: a ⊕ b = (a·b)/(a+b), nützlich für '
      'Parallelschaltungen von Widerständen.',
    ),
    _H('Erweiterungsfeld'),
    _P(
      'Die Taste … rechts unten öffnet das Erweiterungsfeld mit weiteren '
      'Funktionen: Speicher, Konstanten (π, e, φ, √2), hyperbolische '
      'Funktionen, erweiterte Operatoren sowie EXP und DRG. Es schließt '
      'sich über dieselbe Taste, oder durch Antippen außerhalb des '
      'Feldes. Auf Tablets sind alle Sets ohnehin nebeneinander '
      'sichtbar — dort gibt es kein Overlay.',
    ),
    _Pre(
      '  6 — Speicher:    STO   RCL   MC    Ans\n'
      '  7 — Konstanten:  π     e     φ     √2\n'
      '  8 — Hyperbel:   sinh  cosh  tanh  coth\n'
      '  9 — Erweitert:  n!    |x|   1/x   mod\n'
      '  10 — Modi:      EXP   DRG   …',
    ),
    _H('Speicher'),
    _P(
      'STO speichert das aktuelle Ergebnis, RCL fügt den gespeicherten '
      'Wert in die Eingabe ein, MC löscht den Speicher. Ein kleines M '
      'im Display zeigt an, dass etwas gespeichert ist. Ans fügt das '
      'Ergebnis der letzten Berechnung ein — exakte rationale Werte '
      'werden vollständig mitgespeichert, Periodizität bleibt erhalten.',
    ),
    _H('Periodenstrich'),
    _P(
      'Wenn das Ergebnis ein periodischer Bruch ist, zeigt der Rechner '
      'die sich wiederholenden Ziffern mit einem Strich darüber an. '
      'Beispiel: 1/5 ergibt 0.2497 mit Strich über allen vier Ziffern. '
      'Bei Perioden mit mehr als fünf Stellen werden nur die ersten '
      'fünf gezeigt, gefolgt von …',
    ),
    _H('Zahlensystem Doz / Dez'),
    _P(
      'Das Zahlensystem wechselst du in den Einstellungen, erreichbar '
      'über die (i)-Taste: Dozenal rechnet in Basis 12 (Standard), '
      'Dezimal in Basis 10. Das aktive System steht oben rechts im '
      'Display angezeigt.',
    ),
    _P(
      'Beim Umschalten wird die aktuell sichtbare Zahl automatisch in '
      'das andere System umgerechnet. Aus "10" in Doz wird "12" in Dez. '
      'Im Dez-Modus werden die Symbole für 10 und 11 inaktiv (grau), '
      'da es sie in Basis 10 nicht als einzelne Ziffer gibt — wer Doz '
      'braucht, schaltet einfach zurück.',
    ),
    _H('Winkelmodus'),
    _P(
      'DRG wechselt den Winkelmodus für trigonometrische Funktionen: '
      'DEG → RAD → GRD → DEG. Der aktuelle Modus steht oben rechts '
      'im Display, direkt über der Doz/Dez-Anzeige. Standard ist DEG.',
    ),
  ]),
  ManualChapter('Exponenten, Wurzeln & Logarithmen', [
    _H('Drei Fragen an eine Beziehung'),
    _P(
      'Potenzieren, Wurzelziehen und Logarithmieren wirken wie drei '
      'verschiedene Rechenarten. In Wahrheit sind es drei Fragen an ein und '
      'dieselbe Beziehung: b hoch e ergibt n, kurz b^e = n. Dabei heißt b die '
      'Basis, e der Exponent und n das Ergebnis. Wer zwei dieser drei Größen '
      'kennt, findet die dritte — und genau dafür gibt es die drei Tasten '
      'x^□, √ und log.',
    ),
    _P(
      'Die Potenz beantwortet: Basis und Exponent sind bekannt, wie groß ist '
      'das Ergebnis? Die Wurzel beantwortet: Ergebnis und Exponent sind '
      'bekannt, welche Basis war es? Der Logarithmus beantwortet: Basis und '
      'Ergebnis sind bekannt, welcher Exponent steckt dahinter? Wurzel und '
      'Logarithmus sind also die beiden Umkehrungen des Potenzierens.',
    ),
    PowerTriangleFigure(),
    _H('Potenzieren: wiederholtes Multiplizieren'),
    _P(
      'Die Potenz b^e bedeutet zunächst nichts weiter, als b genau e-mal mit '
      'sich selbst zu multiplizieren. So ist 2^3 = 2·2·2 = 8 und 3^2 = 3·3 = 9. '
      'Das Potenzieren verdichtet eine Multiplikation, so wie die '
      'Multiplikation eine Addition verdichtet.',
    ),
    _P(
      'Aus dieser einfachen Idee folgen die Potenzgesetze, die man durch '
      'Nachzählen der Faktoren sofort versteht. Multipliziert man zwei '
      'Potenzen derselben Basis, addieren sich die Exponenten: '
      'b^m · b^n = b^(m+n) — man reiht die Faktoren einfach aneinander. Eine '
      'Potenz zu potenzieren multipliziert die Exponenten: (b^m)^n = b^(m·n).',
    ),
    _P(
      'Zwei Sonderfälle erklären sich aus derselben Regel. b^0 ist immer 1, '
      'weil b^1 geteilt durch b^1 sowohl 1 als auch b^(1−1) = b^0 ergibt. Und '
      'ein negativer Exponent bedeutet den Kehrwert: b^(−n) = 1/b^n, denn '
      'b^n · b^(−n) muss b^0 = 1 ergeben.',
    ),
    _P(
      'Trägt man die Werte einer Potenz wie 2^x auf, entsteht eine Kurve, die '
      'immer steiler ansteigt — das vertraute Bild des exponentiellen '
      'Wachstums.',
    ),
    ExpCurveFigure(),
    _H('Die Wurzel — die erste Umkehrung'),
    _P(
      'Die Wurzel kehrt das Potenzieren bei bekanntem Exponenten um. Die '
      'Quadratwurzel von 9 ist 3, weil 3^2 = 9; die dritte Wurzel von 8 ist 2, '
      'weil 2^3 = 8. Auf dem Rechner steht √ für die Quadratwurzel; tippt man '
      'links davon eine Zahl, wird sie zum Wurzelgrad — 3√8 ist die dritte '
      'Wurzel von 8.',
    ),
    _P(
      'Eine Wurzel ist nichts anderes als eine Potenz mit gebrochenem '
      'Exponenten: die n-te Wurzel von x ist x^(1/n). Das ist keine bloße '
      'Schreibweise, sondern folgt direkt aus dem Potenzgesetz — hebt man '
      'x^(1/n) auf die Potenz n, erhält man x^((1/n)·n) = x^1 = x. Zeichnet man '
      'y = x² und y = √x in dasselbe Bild, sind sie Spiegelbilder an der '
      'Geraden y = x. Das ist das sichtbare Zeichen dafür, dass eine Funktion '
      'die andere umkehrt.',
    ),
    SquareRootFigure(),
    _H('Der Logarithmus — die zweite Umkehrung'),
    _P(
      'Der Logarithmus kehrt das Potenzieren bei bekannter Basis um. Er '
      'beantwortet: Mit welchem Exponenten muss ich die Basis potenzieren, um '
      'das Ergebnis zu erhalten? Man schreibt log_b(n) = e. So ist '
      'log_2(8) = 3, weil 2^3 = 8. Auf dem Rechner gibt man das als 8 log 2 '
      'ein — links das Argument, rechts die Basis.',
    ),
    _P(
      'Auch der Logarithmus ist ein Spiegelbild: y = log_2(x) entsteht aus '
      'y = 2^x durch Spiegelung an der Geraden y = x. Wo die Exponentialkurve '
      'steil steigt, wächst der Logarithmus nur noch zögerlich — er macht aus '
      'riesigen Spannweiten handliche Zahlen.',
    ),
    ExpLogFigure(),
    _H('Die Logarithmengesetze'),
    _P(
      'Weil der Logarithmus Potenzen umkehrt, verwandeln sich die '
      'Potenzgesetze in spiegelbildliche Logarithmengesetze. Aus dem Produkt '
      'wird eine Summe: log(x·y) = log x + log y. Aus dem Quotienten eine '
      'Differenz: log(x/y) = log x − log y. Und ein Exponent im Argument wird '
      'zu einem Faktor davor: log(x^k) = k · log x.',
    ),
    _P(
      'Diese Verwandlung von Multiplikation in Addition war jahrhundertelang '
      'der eigentliche Zweck der Logarithmen: Mit Logarithmentafeln ließen '
      'sich mühsame Multiplikationen durch einfaches Nachschlagen und '
      'Addieren ersetzen. Dasselbe Prinzip steckt in jeder logarithmischen '
      'Skala — von der Dezibel-Skala des Schalls bis zur Magnitude der '
      'Erdbeben.',
    ),
    _P(
      'Die Basis eines Logarithmus ist frei wählbar, und jede lässt sich in '
      'jede andere umrechnen: log_b(x) = log_c(x) / log_c(b). ln (Basis e), '
      'log zur Basis 2 und log₁₂ sind darum keine grundverschiedenen '
      'Funktionen, sondern dieselbe Frage in unterschiedlichem Maßstab — sie '
      'unterscheiden sich nur um einen festen Faktor.',
    ),
    _H('Die Symbole auf den Tasten'),
    _P(
      'Dieser Rechner trägt keine gewohnten Zeichen wie √ oder „log". '
      'Stattdessen zeigt jede dieser Tasten ein x mit einem kleinen Quadrat □ '
      'in einer Ecke. Das Quadrat ist der Platzhalter für die Zahl, die du '
      'angibst — und in welcher Ecke es sitzt, verrät die Rechenart, denn die '
      'Position ist der üblichen mathematischen Schreibweise nachempfunden.',
    ),
    KeyGlyphsFigure(),
    _P(
      'Quadrat oben rechts (x^□) heißt potenzieren — x hoch □, so wie der '
      'Exponent in xⁿ oben rechts steht. Quadrat oben links (□√x) heißt Wurzel '
      'ziehen — die □-te Wurzel von x, so wie der Wurzelgrad in ⁿ√x oben links '
      'steht. Quadrat unten rechts (x_□) heißt Logarithmus — der Logarithmus '
      'von x zur Basis □, so wie die Basis in log_b unten rechts steht. x² '
      'schließlich ist die fertige Kurzform für „hoch zwei". (Das vierte '
      'Eckzeichen — Quadrat unten links mit einem kleinen + — ist die '
      'Paralleladdition ⊕ und hat ihr eigenes Kapitel.)',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'Die drei Grundtasten liegen in Set 2: x^□ (Potenz), □√x (Wurzel) und '
      'x_□ (Logarithmus). x² im Langdruck-Feld der Potenztaste '
      'ist die Kurzform für „hoch zwei". Über den Langdruck auf log erreichst '
      'du außerdem ln, log₁₂ und eˣ; diese öffnen gleich eine Klammer, in die '
      'du das Argument tippst.',
    ),
    _P(
      'Der Potenzoperator ist rechts-assoziativ: 2^2^3 bedeutet 2^(2^3) = 2^8, '
      'nicht (2^2)^3. Ganzzahlige Exponenten und die wissenschaftliche '
      'Notation EXP (a EXP b = a·12^b) bleiben exakt; Wurzeln und Logarithmen '
      'zeigen dagegen ein „≈", auch wenn das Ergebnis ganzzahlig ist — sie '
      'laufen über den Näherungs-Auswerter.',
    ),
    _Pre(
      'Eingabe        Ergebnis    (dezimal)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          dritte Wurzel\n'
      '8 log 2    ≈   3          log zur Basis 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H('Zwölferpotenzen und log₁₂'),
    _P(
      'In Basis zwölf sind die Zwölferpotenzen die runden Zahlen, genau wie '
      'die Zehnerpotenzen im Dezimalsystem: zwölf schreibt sich „10", '
      'hundertvierundvierzig als „100", tausendsiebenhundertachtundzwanzig als '
      '„1000". Wer im Rechner „100" liest, denkt also in einem Sprung von 144, '
      'nicht von 100.',
    ),
    _P(
      'Darum ist log₁₂ im Dozenalsystem der natürliche Stellenzähler — so wie '
      'der Zehnerlogarithmus im Dezimalsystem. Für eine Zwölferpotenz ist sein '
      'Wert exakt die Stellenzahl minus eins: log₁₂(„10") = 1, '
      'log₁₂(„100") = 2, log₁₂(„1000") = 3.',
    ),
    _P(
      'Quadrat- und Kubikzahlen sehen dozenal ungewohnt aus, sind aber '
      'dieselben Werte — nur anders geschrieben. 4² ist „14" (sechzehn), 5² '
      'ist „21" (fünfundzwanzig), A² ist „84" (hundert), B² ist „A1" '
      '(hunderteinundzwanzig). Die Mathematik ändert sich durch die '
      'Schreibbasis nie; auch e und ln sind basisunabhängig. Nur die '
      'Ziffernfolge wechselt, nicht der Wert.',
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H('Worauf zu achten ist'),
    _P(
      'Manche Eingaben sind nicht definiert und führen zu einem Fehler: der '
      'Logarithmus von null oder einer negativen Zahl, ebenso die Basen 0 und '
      '1. Auch die Quadratwurzel einer negativen Zahl gibt es im Reellen '
      'nicht. Negative und gebrochene Exponenten sind dagegen uneingeschränkt '
      'erlaubt — 8^(−1/3) ist 1/2.',
    ),
    _P(
      'Und noch einmal zum „≈": Es heißt nicht „ungenau". Wurzeln und '
      'Logarithmen laufen stets über den Gleitkomma-Auswerter und tragen '
      'darum dieses Zeichen, selbst wenn das Ergebnis eine glatte ganze Zahl '
      'ist. Der angezeigte Wert stimmt — das Zeichen verrät nur den Rechenweg.',
    ),
  ]),
  ManualChapter('Paralleladdition (⊕)', [
    _H('Eine fünfte Verknüpfung'),
    _P(
      'Neben den vier Grundrechenarten trägt der Rechner eine fünfte, weniger '
      'bekannte Verknüpfung: die Paralleladdition, geschrieben mit dem Zeichen '
      '⊕. Sie ist definiert als a ⊕ b = (a·b)/(a+b). Ihren Namen verdankt sie '
      'der Elektrotechnik — sie beschreibt den Gesamtwiderstand zweier parallel '
      'geschalteter Widerstände —, doch dieselbe Formel taucht überall dort '
      'auf, wo sich nicht die Größen selbst, sondern ihre Kehrwerte addieren.',
    ),
    _H('Strom sucht den leichteren Weg'),
    _P(
      'Schaltet man zwei Widerstände parallel, liegen sie zwischen denselben '
      'zwei Punkten; an beiden liegt dieselbe Spannung an, und der Strom teilt '
      'sich auf beide Pfade auf. Wie viel durch jeden Zweig fließt, hängt von '
      'seinem Widerstand ab — durch den niederohmigeren Pfad fließt mehr.',
    ),
    _P(
      'Entscheidend ist der Leitwert, der Kehrwert des Widerstands (G = 1/R): '
      'er sagt, wie gut ein Bauteil Strom durchlässt. Bei einer '
      'Parallelschaltung addieren sich die Leitwerte: 1/R = 1/R₁ + 1/R₂. Löst '
      'man das nach R auf, steht genau die Paralleladdition da: '
      'R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.',
    ),
    ParallelCircuitFigure(),
    _H('Immer kleiner als der kleinste'),
    _P(
      'Das überraschende Ergebnis: Der Gesamtwiderstand ist stets kleiner als '
      'der kleinere der beiden Einzelwiderstände. Ein zweiter Pfad lässt '
      'zusätzlichen Strom durch, ganz gleich wie hochohmig er ist. Zwei gleich '
      'große Widerstände parallel halbieren den Wert: 6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. '
      'Ein 6-Ω- und ein 3-Ω-Widerstand ergeben 18/9 = 2 Ω — weniger als 3.',
    ),
    _P(
      'Anschaulich: zwei Türen nebeneinander lassen mehr Menschen durch als '
      'eine; eine zweite geöffnete Kasse verkürzt die Schlange. Mehr Wege '
      'bedeuten weniger Widerstand und höheren Durchfluss.',
    ),
    ParallelBarFigure(),
    _H('Die Formel herleiten'),
    _P(
      'Der Ausgangspunkt ist die Regel, dass sich die Kehrwerte addieren: '
      '1/(a⊕b) = 1/a + 1/b. Bringt man die rechte Seite auf einen gemeinsamen '
      'Nenner, wird daraus (a+b)/(a·b). Der Kehrwert davon ist '
      'a ⊕ b = (a·b)/(a+b). Mehr steckt nicht dahinter — die ganze Operation '
      'ist „addiere die Kehrwerte und kehre das Ergebnis wieder um".',
    ),
    _H('Eigenschaften'),
    _P(
      'Aus der Symmetrie der Formel folgen die Rechenregeln. ⊕ ist kommutativ '
      '(a ⊕ b = b ⊕ a) und assoziativ, sodass man beliebig viele Werte '
      'verknüpfen kann: bei drei Gliedern addieren sich einfach drei '
      'Kehrwerte, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Gleiche Werte vereinfachen sich '
      'besonders — n gleiche Zahlen parallel ergeben a/n, also a ⊕ a = a/2 und '
      'a ⊕ a ⊕ a = a/3.',
    ),
    _P(
      'Für positive Zahlen liegt das Ergebnis stets unter dem kleineren '
      'Operanden. Zwei Grenzfälle runden das Bild: a ⊕ 0 = 0 — ein '
      'widerstandsloser Pfad, ein Kurzschluss, zieht allen Strom an. Und je '
      'größer b wird, desto mehr nähert sich a ⊕ b dem Wert a; ein unendlich '
      'großer Widerstand, eine Unterbrechung, trägt nichts bei. „Unendlich" '
      'ist somit das neutrale Element der Paralleladdition — so wie die Null '
      'das neutrale Element der gewöhnlichen Addition ist.',
    ),
    _H('Harmonisches Mittel und Dualität'),
    _P(
      'Die Paralleladdition ist eng mit dem harmonischen Mittel verwandt: das '
      'harmonische Mittel zweier Zahlen ist 2·(a ⊕ b), und a ⊕ b ist umgekehrt '
      'die Hälfte davon. Von den drei klassischen Mittelwerten liegt das '
      'harmonische stets am tiefsten — unter dem geometrischen und dem '
      'arithmetischen.',
    ),
    _P(
      'Tiefer betrachtet ist ⊕ das Spiegelbild der gewöhnlichen Addition unter '
      'der Kehrwert-Abbildung x → 1/x: Wer im Kehrwert-Raum normal addiert, '
      'addiert hier parallel, und umgekehrt. Reihen- und Parallelschaltung '
      'sind in diesem Sinne dual zueinander — dieselbe Beziehung wie zwischen '
      'Federn hintereinander und nebeneinander.',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'Die ⊕-Taste liegt bei den Operator-Glyphen in Set 2, neben x^□, √ und '
      'log. Du gibst a ⊕ b ein wie eine gewöhnliche Rechnung: erst a, dann ⊕, '
      'dann b, dann =. Anders als Wurzel und Logarithmus rechnet ⊕ exakt — es '
      'läuft auf der Bruch-Schiene mit Periodenerkennung und zeigt darum kein '
      '„≈".',
    ),
    _Pre(
      'Eingabe         Ergebnis    (dezimal)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, Periode 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      'Das letzte Beispiel zeigt den dozenalen Reiz: „10" ⊕ „20" — also zwölf '
      'parallel zu vierundzwanzig Ohm — ergibt glatt 8. Und 2 ⊕ 3 ist in Basis '
      'zwölf periodisch (1.2497… mit Überstrich über 2497), aber trotzdem '
      'exakt; in Basis zehn wäre dasselbe Ergebnis schlicht 1,2.',
    ),
    _H('Wenn die Summe null wird'),
    _P(
      'Einen Fall gibt es, in dem ⊕ scheitert: ist a + b = 0, etwa bei '
      '5 ⊕ (−5), steht im Nenner eine Null, und der Rechner meldet eine '
      'Division durch null. Nach dem Fehler lässt sich der Ausdruck direkt '
      'weiterbearbeiten — mit den Pfeiltasten hineinnavigieren und den Wert '
      'korrigieren; AC setzt alles zurück.',
    ),
  ]),
  ManualChapter('Trigonometrie', [
    _H('Winkel und ihre Maße'),
    _P(
      'Trigonometrie ist die Lehre von den Beziehungen zwischen Winkeln und '
      'Längen. Ein Winkel beschreibt eine Drehung — wie weit man einen Strahl '
      'um seinen Endpunkt drehen muss. Gemessen wird sie in drei '
      'gebräuchlichen Maßen: in Grad (ein Vollkreis ist 360°), im Bogenmaß '
      '(ein Vollkreis ist 2π) und in Neugrad oder Gon (ein Vollkreis ist 400). '
      'Welches Maß man wählt, ändert den Winkel selbst nicht — nur die Zahl, '
      'mit der man ihn beschreibt. Der Rechner schaltet mit der DRG-Taste '
      'zwischen ihnen um.',
    ),
    _H('Sinus, Kosinus, Tangens am Dreieck'),
    _P(
      'Im rechtwinkligen Dreieck hat jeder spitze Winkel θ eine feste '
      'Bedeutung. Die längste Seite, dem rechten Winkel gegenüber, heißt '
      'Hypotenuse. Die Seite gegenüber von θ ist die Gegenkathete, die '
      'anliegende die Ankathete.',
    ),
    _P(
      'Aus diesen drei Seiten bildet man drei Verhältnisse, die für einen '
      'gegebenen Winkel immer gleich sind — unabhängig von der Größe des '
      'Dreiecks: Sinus = Gegenkathete/Hypotenuse, Kosinus = '
      'Ankathete/Hypotenuse, Tangens = Gegenkathete/Ankathete = sin/cos. Der '
      'Kotangens ist der Kehrwert des Tangens. Die englische Merkformel '
      'SOH-CAH-TOA fasst die ersten drei zusammen.',
    ),
    RightTriangleFigure(),
    _H('Der Einheitskreis'),
    _P(
      'Dreiecke decken nur Winkel zwischen 0° und 90° ab. Der Einheitskreis — '
      'ein Kreis mit Radius 1 um den Ursprung — erweitert die Sicht auf alle '
      'Winkel. Zu jedem Winkel θ gehört ein Punkt auf dem Kreis: man dreht vom '
      'Punkt (1, 0) aus gegen den Uhrzeigersinn um θ. Dann ist der Kosinus die '
      'x-Koordinate dieses Punktes und der Sinus seine y-Koordinate.',
    ),
    _P(
      'So bekommen auch Winkel über 90° und negative Winkel einen natürlichen '
      'Platz. Bei 180° liegt der Punkt bei (−1, 0): cos 180° = −1, sin 180° = '
      '0. Bei 270° bei (0, −1). Der Tangens bleibt das Verhältnis sin/cos und '
      'stimmt mit der Dreiecks-Definition überein.',
    ),
    UnitCircleFigure(),
    _H('Pythagoras am Kreis'),
    _P(
      'Weil der Einheitskreis den Radius 1 hat, gilt für jeden Punkt auf ihm '
      'x² + y² = 1. In trigonometrischer Schreibweise: cos²θ + sin²θ = 1. Das '
      'ist keine neue Formel, sondern der Satz des Pythagoras am Einheitskreis. '
      'Aus ihr folgt sofort sin²θ = 1 − cos²θ — die Grundlage vieler '
      'Umformungen.',
    ),
    _H('Wellen und Perioden'),
    _P(
      'Nach einer vollen Drehung ist man wieder am Ausgangspunkt: Sinus und '
      'Kosinus wiederholen sich mit der Periode 360° (bzw. 2π). Trägt man sin θ '
      'über dem Winkel auf, entsteht die vertraute Sinuswelle, die zwischen −1 '
      'und +1 pendelt; der Kosinus ist dieselbe Welle, nur um 90° verschoben. '
      'Solche Wellen beschreiben Töne, Licht und Wechselstrom — jede '
      'Schwingung.',
    ),
    _Pre(
      'θ      sin θ    cos θ    tan θ\n'
      '0°     0        1        0\n'
      '30°    1/2      √3/2     1/√3\n'
      '45°    √2/2     √2/2     1\n'
      '60°    √3/2     1/2      √3\n'
      '90°    1        0        —',
    ),
    SineWaveFigure(),
    _H('Die Umkehrfunktionen'),
    _P(
      'Manchmal kennt man das Verhältnis und sucht den Winkel. Dafür gibt es '
      'die Umkehrfunktionen sin⁻¹, cos⁻¹, tan⁻¹ (die Arkusfunktionen): aus '
      'sin θ = 0,5 wird sin⁻¹(0,5) = 30°. Weil Sinus und Kosinus periodisch '
      'sind, gehören zu jedem Verhältnis unendlich viele Winkel; die '
      'Arkusfunktionen liefern darum nur einen ausgezeichneten Bereich — sin⁻¹ '
      'und tan⁻¹ von −90° bis +90°, cos⁻¹ von 0° bis 180°.',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'Die vier Funktionen sin, cos, tan und cot liegen auf dem Hauptkeypad und '
      'öffnen beim Druck gleich eine Klammer (sin( mit dem Cursor innen). Ein '
      'zweiter Tipp auf dieselbe Taste schaltet auf die Umkehrfunktion — ein '
      'goldener Punkt zeigt an, dass der nächste Tipp umkehrt. Die DRG-Taste '
      'wechselt den Winkelmodus (DEG → RAD → GRD), oben rechts angezeigt; im '
      'Profil „Einfach" geht das über die Einstellungen.',
    ),
    _P(
      'Eine dozenale Falle ist dabei zu beachten: Der Winkel wird im aktiven '
      'Zahlensystem eingegeben. Im Dozenal-Modus ist „90" nicht neunzig Grad, '
      'sondern 9·12 = 108. Um sin(90°) zu rechnen, tippt man „76" (denn '
      '7·12+6 = 90). Hier die gebräuchlichen Werte:',
    ),
    _Pre(
      'Grad (dezimal)    Eingabe (dozenal)\n'
      '30°               26\n'
      '45°               39\n'
      '60°               50\n'
      '90°               76\n'
      '180°              130\n'
      '360°              260',
    ),
    _P('Und ein paar durchgerechnete Beispiele im DEG-Modus:'),
    _Pre(
      'Eingabe        bedeutet      Ergebnis\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       Winkel zu 1   ≈76  (= 90°)',
    ),
    _P(
      'Alle trigonometrischen Ergebnisse tragen ein „≈", weil sin, cos und tan '
      'im Allgemeinen irrational sind — auch wenn der Wert wie bei sin(90°) = 1 '
      'glatt ist. tan(90°) ist nicht definiert; der Rechner zeigt dort eine '
      'sehr große Zahl, weil cos(90°) rechnerisch knapp nicht null ist.',
    ),
    _H('Winkel in Basis Zwölf'),
    _P(
      'Selbst die vertrauten Vollkreis-Werte sehen dozenal fremd aus: 360° '
      'schreibt man „260" (2·144 + 6·12), 400 Neugrad „294". Nur das Bogenmaß '
      'entzieht sich der Frage — 2π ist eine Konstante, unabhängig vom '
      'Zahlensystem; wer in RAD rechnet, umgeht die Falle ganz.',
    ),
    _P(
      'Dass der Vollkreis 360 Teile hat, passt gut zur Zwölf: 360 hat sehr '
      'viele Teiler (zwei Dutzend Stück), darum lässt sich der Kreis glatt in '
      'Hälften, Drittel, Viertel, Sechstel und mehr zerlegen — und 12·30 = 360, '
      'ein Zwölftel des Kreises ist genau 30°. Wie immer gilt: die '
      'Trigonometrie selbst ist zahlensystem-unabhängig. sin(30°) ist ½, ob man '
      'den Winkel „30" dezimal oder „26" dozenal schreibt. Nur die Ziffern der '
      'Eingabe ändern sich.',
    ),
  ]),
  ManualChapter('Speichern & Abrufen', [
    _P(
      'Ein Taschenrechner wird erst dann wirklich schnell, wenn man Zahlen '
      'nicht ständig neu eintippen muss. Vier Werkzeuge nehmen einem diese '
      'Arbeit ab: das letzte Ergebnis (Ans), ein benannter Speicher (STO/RCL), '
      'ein Akkumulator (M+/M−) und das Verlaufsband der Sitzung. Sie '
      'überschneiden sich nicht, sondern decken jeweils eine andere Situation '
      'ab.',
    ),
    _H('Das letzte Ergebnis: Ans'),
    _P(
      'Nach jeder Berechnung merkt sich der Rechner das Ergebnis unter dem '
      'Namen Ans. Wer direkt mit einem Operator weitertippt — etwa „× 2 =" '
      'gleich nach einem Ergebnis — verwendet Ans automatisch als ersten '
      'Operanden, ohne die Taste überhaupt zu berühren. Das ist der häufigste '
      'Griff beim Rechnen in einer Kette: Das Resultat des einen Schritts wird '
      'stillschweigend zum Anfang des nächsten.',
    ),
    _P(
      'Braucht man das letzte Ergebnis nicht am Anfang, sondern mitten in einer '
      'neuen Formel, fügt man es ausdrücklich mit Ans ein. Wichtig: Ans hält '
      'stets das vollständige Ergebnis fest — auch einen periodischen Bruch, '
      'nicht nur die sichtbaren Stellen.',
    ),
    _H('Der Speicher: STO, RCL, MC'),
    _P(
      'Ans hat eine Schwäche: Das nächste „=" überschreibt es. Wer einen Wert '
      'über mehrere unabhängige Rechnungen hinweg festhalten will, legt ihn mit '
      'STO (von engl. store) in den Speicher. Ein kleines „M" oben im Display '
      'zeigt dann an, dass etwas hinterlegt ist. RCL (recall) fügt den '
      'gespeicherten Wert an der Cursorposition wieder in die Eingabe ein — '
      'beliebig oft. MC (memory clear) leert den Speicher, und das „M" erlischt.',
    ),
    _P(
      'Ein typisches Szenario: Man berechnet den Radius eines Kreises und '
      'braucht ihn danach sowohl für die Fläche als auch für den Umfang. Der '
      'Radius wird einmal mit STO abgelegt; beide Formeln rufen ihn dann '
      'unabhängig mit RCL ab, ohne ihn je neu einzutippen.',
    ),
    _H('Der Akkumulator: M+ und M−'),
    _P(
      'Manchmal will man keinen einzelnen Wert festhalten, sondern eine laufende '
      'Summe aufbauen — etwa beim Addieren vieler Posten. Dafür gibt es M+ und '
      'M−, erreichbar per Langdruck auf STO. M+ addiert das letzte Ergebnis zum '
      'gespeicherten Wert, M− zieht es ab. Der Speicher wächst oder schrumpft '
      'mit jedem Treffer, ohne dass man die Zwischensumme selbst sehen oder '
      'notieren müsste. RCL zeigt am Schluss die Gesamtsumme, MC setzt den '
      'Akkumulator auf null zurück.',
    ),
    MemoryFlowFigure(),
    _P(
      'Die Skizze fasst die Wege zusammen: STO trägt das Ergebnis in den '
      'Speicher, RCL holt es von dort in die Eingabe. Ans nimmt die Abkürzung '
      'direkt vom Ergebnis zur Eingabe und umgeht den Speicher (gestrichelt). '
      'M+/M− führt das Ergebnis in einer Schleife in den Speicher zurück und '
      'rechnet es dort hinzu.',
    ),
    _H('Wann Ans, wann Speicher?'),
    _P(
      'Die Wahl folgt einer einfachen Faustregel. Ans nimmt man, wenn das '
      'Ergebnis sofort im nächsten Schritt gebraucht wird — schnell und ohne '
      'Vorbereitung. Den Speicher nimmt man, wenn ein Wert über mehrere '
      'getrennte Rechnungen bereitstehen oder sicher vor dem nächsten „=" '
      'geschützt sein soll. M+ und M− liegen eine Stufe darüber: Sie sind nicht '
      'zum Abrufen eines einzelnen Werts gedacht, sondern zum Aufsummieren '
      'vieler Einzelergebnisse zu einem Gesamtwert.',
    ),
    _H('Exakt gespeichert — kein Rundungsfehler'),
    _P(
      'Die meisten Taschenrechner arbeiten intern mit Gleitkommazahlen fester '
      'Präzision. Was sie anzeigen, ist bereits gerundet — und genau dieser '
      'gerundete Wert landet im Speicher. Rechnet man weiter, trägt man den '
      'Fehler mit; nach mehreren Schritten zeigt ein Ergebnis, das exakt 1 sein '
      'müsste, „0,9999…".',
    ),
    _P(
      'Dieser Rechner hält rationale Ergebnisse stattdessen als echten Bruch aus '
      'beliebig großen ganzen Zahlen — ohne Rundung. Und genau dieser Bruch '
      'wandert in den Speicher: STO, RCL, Ans und der Akkumulator bewahren '
      'Zähler und Nenner vollständig, nicht bloß die sichtbaren Stellen. Ein '
      'Beispiel: 1 ÷ 7 ist dozenal periodisch (Block 186A35). Speichert man das '
      'Ergebnis und multipliziert es später mit 7, kommt exakt 1 heraus — weil '
      'der Rechner nie etwas anderes als 1/7 mitgeführt hat. Ein Gerät, das nur '
      'die angezeigten Stellen speichert, käme auf „0,BBBB…".',
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (Periode, mit Überstrich)\n'
      '… STO          →  „M" erscheint; gespeichert: exakt 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (nicht 0.BBBB…)',
    ),
    _P(
      'Ehrlich bleibt der Rechner an seiner Grenze: Irrationale Ergebnisse — '
      'Wurzeln, Logarithmen, Trigonometrie — kann er nicht als Bruch halten. Sie '
      'tragen ein „≈" und werden als Näherung gespeichert. Die Regel ist leicht '
      'abzulesen: Steht ein „≈" vor dem Wert, ist das Gespeicherte eine '
      'Näherung; fehlt es, ist es exakt.',
    ),
    _H('Das Verlaufsband'),
    _P(
      'Wer eine frühere Rechnung noch einmal braucht, wischt auf der Anzeige '
      'nach unten. Das öffnet das Verlaufsband der laufenden Sitzung — die '
      'neueste Rechnung zuoberst, bis zu dreißig Einträge. Selbst AC löscht es '
      'nicht; es bleibt die ganze Sitzung über erhalten. Ein Tipp auf einen '
      'Eintrag holt dessen Ergebniswert zurück in die Eingabe, ganz wie Ans — '
      'nur für einen beliebigen früheren Schritt.',
    ),
    HistoryBandFigure(),
    _P(
      'Das Verlaufsband ist kein dauerhafter Speicher, sondern ein Rückblick: Es '
      'bewahrt den Faden einer Sitzung und lässt einen Wert wiederfinden, den '
      'man berechnet, aber nicht eigens gespeichert hat.',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'STO, RCL, MC und Ans liegen im Erweiterungsfeld: Man öffnet es mit der '
      '„…"-Taste und tippt dann die gewünschte Funktion. M+ und M− verbergen '
      'sich hinter einem Langdruck auf STO — die kleine Ecke unten rechts an der '
      'Taste weist darauf hin; im Popup wählt man M+ oder M−. Im Profil '
      '„Einfach" gibt es kein Erweiterungsfeld; dort sind die Speicherfunktionen '
      'nicht verfügbar.',
    ),
    _P('Drei durchgerechnete Beispiele (im Dozenal-Modus):'),
    _Pre(
      'Speichern und später einsetzen\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  „M" erscheint\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Direkt weiterrechnen mit Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 automatisch)',
    ),
    _Pre(
      'Posten aufsummieren mit M+\n'
      '  … MC                   Speicher leeren\n'
      '  5 =   … STO(lang) M+   →  Speicher 5\n'
      '  7 =   … STO(lang) M+   →  Speicher 10\n'
      '  3 =   … STO(lang) M+   →  Speicher 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      'Zur Gegenprobe in Dezimal: 5 + 7 + 3 = 15, und 15 ist dozenal „13" '
      '(1·12 + 3). Alle vier Werkzeuge — Ans, Speicher, Akkumulator und '
      'Verlaufsband — arbeiten auf demselben exakten Wert; wer sie kennt, muss '
      'kaum noch eine Zahl von Hand abtippen oder eine Zwischensumme im Kopf '
      'behalten.',
    ),
  ]),
  ManualChapter('Hyperbelfunktionen', [
    _P(
      'In der Schule lernt man Sinus und Kosinus als Koordinaten eines Punktes '
      'auf dem Einheitskreis. Weniger bekannt, aber ebenso grundlegend sind '
      'ihre hyperbolischen Gegenstücke sinh und cosh. Sie entstehen, wenn man '
      'den Kreis durch eine Hyperbel ersetzt — und der Schlüssel dazu ist die '
      'Exponentialfunktion eˣ.',
    ),
    _H('Die geraden und ungeraden Hälften von eˣ'),
    _P(
      'Jede Funktion lässt sich in einen geraden Anteil (symmetrisch zur '
      'y-Achse) und einen ungeraden (punktsymmetrisch zum Ursprung) zerlegen. '
      'Bei eˣ schreibt man beide Anteile direkt hin: cosh ist der gerade, sinh '
      'der ungerade. Addiert man sie wieder, kommt eˣ zurück — denn '
      'eˣ = cosh x + sinh x, und e⁻ˣ = cosh x − sinh x. Diese Zerlegung ist '
      'nicht willkürlich, sondern die einzig mögliche.',
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      'tanh ist der Quotient, coth sein Kehrwert (und darum nur für x ≠ 0 '
      'erklärt). Rechts stehen die Umkehrungen, auf die wir gleich '
      'zurückkommen.',
    ),
    _H('Die Einheitshyperbel'),
    _P(
      'Beim Einheitskreis erfüllt jeder Punkt (cos t, sin t) die Gleichung '
      'x² + y² = 1. Für die hyperbolischen Funktionen gilt eine fast gleiche, '
      'aber entscheidend andere Identität. Setzt man die Definitionen ein und '
      'rechnet die Differenz der Quadrate aus, heben sich die gemischten Terme '
      'weg:',
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      'Also liegt der Punkt (cosh t, sinh t) immer auf der Kurve x² − y² = 1, '
      'der Einheitshyperbel. Weil cosh t nie kleiner als 1 wird, bleibt der '
      'Punkt stets auf dem rechten Ast. Die Identität cosh²t − sinh²t = 1 '
      'spielt in der hyperbolischen Welt dieselbe Rolle wie cos²t + sin²t = 1 '
      'in der kreisförmigen — nur ist aus dem Plus ein Minus geworden.',
    ),
    UnitHyperbolaFigure(),
    _H('Der Parameter: eine Fläche, kein Winkel'),
    _P(
      'Hier liegt der tiefste Unterschied zur Trigonometrie. Beim Kreis ist der '
      'Parameter t der Winkel im Bogenmaß — und zugleich die Bogenlänge und das '
      'Doppelte der Sektorfläche; diese drei Bedeutungen fallen dort zufällig '
      'zusammen. Auf der Hyperbel gibt es keinen solchen Winkel. Was bleibt, ist '
      'die Fläche: t ist das Doppelte der Fläche des Hyperbelsektors zwischen '
      'dem Ursprung, dem Scheitel (1, 0) und dem Punkt (cosh t, sinh t) — genau '
      'die getönte Fläche in der Abbildung oben.',
    ),
    _P(
      'Daher der Name der Umkehrungen. Sie heißen Areafunktionen — arsinh, '
      'arcosh, artanh — vom lateinischen „area", Fläche. Das verbreitete '
      '„arcsinh" mancher Geräte ist streng genommen falsch: Es überträgt das '
      'Bogen-Präfix („arc") auf eine Funktion, bei der von einem Bogen keine '
      'Rede ist. arsinh(y) ist jener Parameterwert t mit sinh t = y — also eine '
      'Fläche, kein Bogen.',
    ),
    _H('Die Gestalt der vier Kurven'),
    _P(
      'cosh ist eine nach oben offene, achsensymmetrische Wanne mit dem '
      'Tiefpunkt (0, 1), denn cosh 0 = 1; ihr Wert ist nie kleiner als 1. sinh '
      'ist punktsymmetrisch, läuft durch den Ursprung und wächst in beide '
      'Richtungen unbeschränkt. Für große x nähern sich beide der Kurve eˣ/2 an.',
    ),
    _P(
      'tanh ist eine S-förmige Sättigungskurve: streng wachsend, durch den '
      'Ursprung, und sie bleibt streng zwischen −1 und +1 — diese Schranken '
      'werden angenähert, nie erreicht. coth schließlich verhält sich wie der '
      'Kehrwert von tanh, hat aber wegen sinh 0 = 0 einen Pol bei x = 0 und '
      'bleibt außerhalb von [−1, 1].',
    ),
    HyperbolicCurvesFigure(),
    _H('Verwandtschaft mit der Trigonometrie'),
    _P(
      'Beide Familien sind aus demselben Material gewoben: der '
      'Exponentialfunktion. Eulers Formel schreibt die Kreisfunktionen ganz '
      'analog — cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). Das Muster '
      'ist dasselbe; nur läuft die Exponentialfunktion bei den Kreisfunktionen '
      'auf der imaginären Achse (Argument i·t), bei den hyperbolischen auf der '
      'reellen (Argument x). Wer mit komplexen Zahlen noch fremdelt, darf diesen '
      'Gedanken überspringen — wichtig ist nur: es ist im Kern dieselbe Funktion.',
    ),
    _P(
      'Geometrisch ist es dieselbe Konstruktion — ein Punkt auf einer Kurve, '
      'parametrisiert durch die doppelte Sektorfläche —, nur einmal auf dem '
      'Kreis, einmal auf der Hyperbel. Daraus folgt das gekippte Vorzeichen: '
      'cos² + sin² = 1 gegenüber cosh² − sinh² = 1. Setzt man ein imaginäres '
      'Argument ein, gehen die Familien direkt ineinander über: '
      'cos(i·x) = cosh x und sin(i·x) = i·sinh x. Die Hyperbelfunktionen sind '
      'also „die trigonometrischen Funktionen mit imaginärem Argument".',
    ),
    _P(
      'Auch die Additionstheoreme laufen parallel: sinh(a+b) = sinh a·cosh b + '
      'cosh a·sinh b, genau wie beim Sinus. Beim Kosinus dagegen kippt ein '
      'Vorzeichen — cos(a+b) hat ein Minus, cosh(a+b) ein Plus. Das ist die '
      'Osborn-Regel: Jede trigonometrische Identität wird hyperbolisch, indem '
      'man sin→sinh, cos→cosh ersetzt und überall dort das Vorzeichen umkehrt, '
      'wo ein Produkt zweier Sinus-Faktoren steht. Ein falsches Vorzeichen sitzt '
      'fast immer genau an dieser Stelle.',
    ),
    _H('Anwendungen in der Welt'),
    _P(
      'Die bekannteste ist die Kettenlinie. Ein frei zwischen zwei Punkten '
      'hängendes Seil bildet keine Parabel — diesem Irrtum unterlag selbst '
      'Galilei —, sondern die Kurve y = a·cosh(x/a). Bei flachem Durchhang '
      'ähneln sich beide, bei starkem wird der Unterschied deutlich: Die '
      'Kettenlinie wächst schneller als jede Parabel. Umgekehrt — als nach unten '
      'offener cosh-Bogen — beschreibt sie die ideale Form eines tragenden '
      'Gewölbes, das seine Last rein durch Druck weiterleitet.',
    ),
    CatenaryFigure(),
    _P(
      'Auch der Fall mit Luftwiderstand gehört hierher: Wächst die Bremskraft '
      'mit dem Quadrat der Geschwindigkeit, so folgt die Geschwindigkeit einer '
      'tanh-Kurve und nähert sich sanft der Endgeschwindigkeit, ohne sie je zu '
      'überschreiten — die Sättigung von tanh ist hier die Physik selbst.',
    ),
    _P(
      'In der Relativitätstheorie schließlich addieren sich Geschwindigkeiten '
      'nahe der Lichtgeschwindigkeit nicht einfach. Führt man die „Rapidität" φ '
      'über v = c·tanh φ ein, wird die verwickelte Additionsformel wieder '
      'schlicht: Die Rapiditäten addieren sich gewöhnlich (φ = φ₁ + φ₂), genau '
      'weil tanh sein Additionstheorem hat. Was das Bogenmaß in der ebenen '
      'Geometrie ist, ist die Rapidität in der Geometrie der Raumzeit.',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'Die vier Funktionen liegen in Set 8, dem Erweiterungsfeld: Mit der '
      '„…"-Taste aufklappen, dann sinh, cosh, tanh oder coth tippen. Jede öffnet '
      'gleich eine Klammer (sinh( mit dem Cursor innen); fehlt die schließende, '
      'ergänzt der Rechner sie beim „=". Ein zweiter Tipp auf dieselbe Taste '
      'schaltet auf die Areafunktion um (sinh ↔ arsinh und so weiter) — ein '
      'goldener Punkt zeigt an, dass der nächste Tipp umkehrt.',
    ),
    _P(
      'Der wichtigste Unterschied zur Trigonometrie: Das Argument ist eine '
      'reine Zahl, kein Winkel. Der Winkelmodus (DEG/RAD/GRD) hat auf die '
      'Hyperbelfunktionen keinerlei Wirkung — keine Grad-Umrechnung, keine '
      'dozenale Winkel-Falle wie bei sin und cos. sinh(2) bedeutet in jedem '
      'Modus dasselbe. Da diese Funktionen transzendent sind, tragen ihre '
      'Ergebnisse stets ein „≈".',
    ),
    _P('Durchgerechnete Beispiele (alle Ergebnisse ≈, dozenal gekürzt):'),
    _Pre(
      'Eingabe       dezimal     dozenal\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1,1752      1.2128B7B6…\n'
      'cosh(1)       1,5431      1.66253A10…\n'
      'tanh(1)       0,7616      0.91804BB6…\n'
      'arsinh(1)     0,8814      0.A6B01B51…\n'
      'arcosh(2)     1,3170      1.397853260…',
    ),
    _P(
      'Die Grundidentität lässt sich direkt prüfen: cosh(2)² − sinh(2)² ergibt '
      '≈1. Mathematisch ist es exakt 1; der winzige Gleitkomma-Rest liegt '
      'unter der Anzeigegrenze, und der Rechner rastet ihn auf die glatte 1 '
      'ein.',
    ),
    _P(
      'Außerhalb ihres Definitionsbereichs melden die Funktionen einen Fehler — '
      'man muss dann mit AC zurücksetzen:',
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = dez. 0,5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      'arsinh ist für jede Zahl erklärt; arcosh verlangt x ≥ 1; artanh verlangt '
      '|x| < 1; arcoth lebt genau außerhalb, bei |x| > 1. Wer das im Kopf hat, '
      'umgeht die Fehlermeldungen von vornherein.',
    ),
  ]),
  ManualChapter('Set 9 & 10', [
    _P(
      'Die beiden letzten Felder des Erweiterungsfelds bündeln, was ein '
      'wissenschaftlicher Rechner sonst noch braucht: das Zählen (Fakultät und '
      'Kombinatorik), drei nützliche Operatoren (Betrag, Kehrwert, Rest) und die '
      'wissenschaftliche Notation. Alles liegt hinter der „…"-Taste.',
    ),
    _H('Fakultät: das Tor zum Zählen'),
    _P(
      'Die Fakultät einer ganzen Zahl n, geschrieben n!, ist das Produkt aller '
      'Zahlen von 1 bis n: n! = 1·2·3·…·n. Als Sonderfall gilt 0! = 1. Die ersten '
      'Werte sind harmlos — 3! = 6, 4! = 20, 5! = A0 (= 120 dezimal) —, doch dann '
      'explodiert die Folge: 10! (zwölf Fakultät) ist schon 114500000 in Basis '
      'Zwölf, fast eine halbe Milliarde.',
    ),
    _P(
      'Wozu das? n! zählt Anordnungen. Fünf Gäste lassen sich auf 5! = A0 Arten '
      'in eine Reihe setzen: fünf Möglichkeiten für den ersten Platz, dann vier '
      'für den zweiten, drei für den dritten und so fort. Die Fakultät ist der '
      'Baustein für alles Weitere. Auf dem Rechner ist n! exakt — das Ergebnis '
      'trägt kein „≈".',
    ),
    _H('Variationen: Auswahl mit Reihenfolge'),
    _P(
      'Oft ordnet man nicht alles an, sondern wählt r aus n Dingen — und die '
      'Reihenfolge zählt. Ein Rennen mit acht Fahrern: Wie viele Podien (Platz '
      '1, 2, 3) sind möglich? Acht für Gold, sieben für Silber, sechs für '
      'Bronze: 8·7·6 = 240 (= 336 dezimal). Allgemein ist das nPr (n Variiere r) '
      '= n!/(n−r)!. Man teilt durch (n−r)!, weil die unteren Faktoren wegfallen.',
    ),
    _H('Kombinationen: Auswahl ohne Reihenfolge'),
    _P(
      'Manchmal ist die Reihenfolge gleichgültig — beim Kartenblatt, beim Lotto, '
      'beim Händedruck. Die Zahl der ungeordneten Auswahlen heißt nCr („n über '
      'r") = n!/(r!·(n−r)!). Der Zusammenhang ist einfach: Jede ungeordnete '
      'Auswahl von r Dingen lässt sich auf r! Arten anordnen, also ist nCr = '
      'nPr/r!. Drei aus sechs für ein Komitee: 6 nCr 3 = 18 (= 20 dezimal). Die '
      'Händedrücke in einer Runde von n Personen sind n nCr 2 — bei fünf Leuten '
      'A (= 10), bei einem Dutzend schon 56 (= 66 dezimal).',
    ),
    _P(
      'Eine Feinheit der beiden: nCr und nPr werden aus Gleitkomma-Fakultäten '
      'gebildet und tragen darum stets ein „≈", auch wenn das Ergebnis — wie '
      'fast immer — ganzzahlig ist. Beim Zahlenlotto (sechs aus 49) etwa liefert '
      '49 nCr 6 das Ergebnis ≈48245A0 — gut vierzehn Millionen Möglichkeiten für '
      'einen Schein.',
    ),
    _H('Das Pascalsche Dreieck'),
    _P(
      'Ordnet man die Werte nCr zeilenweise an, entsteht ein Muster: In Zeile n '
      'stehen nacheinander n nCr 0, n nCr 1, …, n nCr n. Jede Zahl ist die Summe '
      'der beiden über ihr — so wächst das Dreieck ganz ohne Fakultäten. Die '
      'Ränder sind lauter Einsen, und es ist symmetrisch (n nCr r = n nCr (n−r)).',
    ),
    PascalTriangleFigure(),
    _P(
      'In Basis Zwölf sieht das Dreieck fast wie gewohnt aus — nur erscheint in '
      'Zeile 5 statt der zehn ein „A". Dieselben Zahlen sind übrigens die '
      'Koeffizienten von (a+b)ⁿ: aus Zeile 4 (1, 4, 6, 4, 1) liest man '
      '(a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴ direkt ab. Das verbindet '
      'Kombinatorik und Algebra in einem Bild.',
    ),
    _H('Betrag und Kehrwert'),
    _P(
      'Der Betrag |x| ist der Abstand einer Zahl von null — das Vorzeichen wird '
      'verworfen, |−7| = 7. Eine Eingabe-Feinheit: Die Postfix-Operatoren (|x|, '
      'n!, 1/x) binden stärker als das vorangestellte Minus. „−5" gefolgt von '
      '|x| ergibt darum −(|5|) = −5; wer den Betrag der negativen Zahl will, '
      'klammert: (−5) dann |x| ergibt 5.',
    ),
    _P(
      'Der Kehrwert 1/x ist der multiplikative Partner: x · (1/x) = 1, und der '
      'Rechner hält ihn exakt als Bruch. Dozenal zeigt sich das besonders '
      'schön — 1/4 ist glatt 0.3 (drei Zwölftel sind ein Viertel) und 1/3 ist '
      '0.4, wo Basis Zehn schon ins periodische 0,333… läuft. Der Kehrwert von '
      'null ist nicht definiert.',
    ),
    _H('Modulo: Reste und Rundgänge'),
    _P(
      'Sieben geteilt durch drei ist zwei, Rest eins — und genau diesen Rest '
      'liefert „7 mod 3 = 1". Das eingängigste Bild ist die Uhr: Nach zwölf '
      'beginnt die Zählung von vorn, „14 Uhr" ist „2 Uhr nachmittags", weil 14 '
      'mod 12 = 2. Die Uhr rechnet in Basis Zwölf — kein Zufall.',
    ),
    ModuloClockFigure(),
    _P(
      'Modulo ist das natürliche Werkzeug für Teilbarkeit: a mod b = 0 heißt '
      'genau, dass b die Zahl a teilt. Dozenal hat das besondere Schärfe, weil '
      'die Zwölf ungewöhnlich viele Teiler hat — 1, 2, 3, 4, 6 und 12, gegenüber '
      'nur 1, 2, 5, 10 bei der Zehn. Teilbarkeit durch zwei, drei, vier oder '
      'sechs liest man dozenal oft schon an den letzten Stellen ab.',
    ),
    _H('Wissenschaftliche Notation in Zwölferpotenzen'),
    _P(
      'Sehr große oder kleine Zahlen schreibt man kompakt als Mantisse mal '
      'Basispotenz. Dezimal meint „3 EXP 8" den Wert 3 × 10⁸. Dieser Rechner '
      'führt das Prinzip konsequent in Basis Zwölf: Im Dozenal-Modus bedeutet '
      '„a EXP b" nicht a × 10ᵇ, sondern a × 12ᵇ. Der Exponent zählt '
      'Zwölferpotenzen.',
    ),
    DozenalPowersScaleFigure(),
    _P(
      'Diese Potenzen tragen sogar eigene Namen: 12¹ = ein Dutzend, 12² = 144 = '
      'ein Gros, 12³ = 1728 = ein Großgros. Dozenal geschrieben sind das genau '
      'die runden Stellen 10, 100, 1000. So ergibt „1 EXP 2" den Wert 100 (= 144 '
      'dezimal) und „1 EXP 3" den Wert 1000 (= 1728). Für ganzzahlige Exponenten '
      'rechnet die exakte Schiene; im Dezimal-Modus zählt EXP wieder in '
      'Zehnerpotenzen.',
    ),
    _H('Winkelmodus und Schließen'),
    _P(
      'In Set 10 liegen außerdem DRG und Close. DRG zykelt den Winkelmodus '
      '(DEG → RAD → GRD) für die trigonometrischen Funktionen — ausführlich im '
      'Trigonometrie-Kapitel; im Profil „Einfach" stellt man ihn über die '
      'Einstellungen. Close faltet das Erweiterungsfeld wieder ein, das '
      'Gegenstück zur „…"-Taste. Die frühere Doz/Dez-Umschaltung ist vom Keypad '
      'in die Einstellungen gewandert.',
    ),
    _H('Auf diesem Rechner'),
    _P(
      'Alle diese Tasten erreicht man über das „…"-Erweiterungsfeld (im Profil '
      '„Einfach" sind Set 9 und 10 ausgeblendet). n!, |x| und 1/x wirken '
      'postfix — erst die Zahl, dann die Taste; mod, nCr und nPr sind binär '
      '(a mod b). Ein Langdruck auf n! öffnet das Popup mit nCr und nPr; die '
      'kleine Ecke unten rechts an der Taste weist darauf hin.',
    ),
    _P('Durchgerechnete Beispiele (im Dozenal-Modus):'),
    _Pre(
      'Eingabe       bedeutet              Ergebnis\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       Kehrwert von 4        0.3     (exakt)\n'
      '7 mod 3       Rest von 7 ÷ 3        1\n'
      '5 nCr 2       Kombinationen         ≈A      (= 10)\n'
      '8 nPr 3       Variationen           ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      'Exakt sind n!, |x|, 1/x und mod (kein „≈"); nur nCr und nPr tragen das '
      'Näherungszeichen. Außerhalb des Gültigen melden die Funktionen einen '
      'Fehler — dann mit AC zurücksetzen:',
    ),
    _Pre(
      '0 → 1/x       Kehrwert von null     DIV BY ZERO\n'
      '7 mod 0       Rest durch null       DOMAIN ERROR\n'
      '(−4)!         Fakultät negativ      DOMAIN ERROR',
    ),
    _P(
      'Damit ist die Werkzeugkiste vollständig: vom einfachen Zifferndruck der '
      'Grundbedienung bis zu Kombinatorik, Modulo und dozenaler '
      'Größenordnungs-Schreibweise rechnet der Rechner durchweg exakt, wo es '
      'exakt geht, und ehrlich mit „≈", wo nur eine Näherung möglich ist.',
    ),
  ]),
];

// ---------------------------------------------------------------------------
// Bedienung des Einheitenrechners — die zweite Handbuch-Sektion. Deutsch ist
// die Referenz; Übersetzungen werden wie beim Hauptrechner-Handbuch Kapitel
// für Kapitel nachgezogen (positionsweiser Fallback in manual.dart).
// ---------------------------------------------------------------------------

List<ManualChapter> _converterManualChaptersDe() => const [
  ManualChapter('Der zweite Rechner', [
    _P(
      'Hinter dem Hauptrechner liegt ein vollwertiger Einheitenrechner: '
      'Er rechnet Längen, Gewichte, Zeiten, Temperaturen und ein Dutzend '
      'weitere Kategorien zwischen dem metrischen und dem imperialen '
      'System um — wahlweise in dozenalen oder dezimalen Ziffern.',
    ),
    _H('Hin- und herwechseln'),
    _P(
      'Wische auf dem Hauptrechner nach links, und der Einheitenrechner '
      'erscheint. Wische auf dem Einheitenrechner nach rechts, und du '
      'bist zurück. Beim Wechsel zeigen zwei durchscheinende Karten kurz '
      'an, auf welcher Seite du gerade bist — die goldumrandete Karte ist '
      'die aktive Seite.',
    ),
    _P(
      'Beide Rechner behalten ihre Eingaben beim Wechsel: Du kannst '
      'mitten in einer Umrechnung zum Hauptrechner wischen, dort etwas '
      'nachrechnen und nahtlos weitermachen.',
    ),
  ]),
  ManualChapter('Kategorie, Zahl, Einheit', [
    _P(
      'Eine Umrechnung besteht aus drei Tipps: Kategorie wählen, Zahl '
      'tippen, Einheit tippen.',
    ),
    _H('Die Kategorie'),
    _P(
      'Die rechten beiden Tastenspalten zeigen die Kategorien (Länge, '
      'Gewicht, Zeit, …; weitere im Erweiterungsfeld „…"). Ein Tipp auf '
      'eine Kategorie klappt ihre Einheiten-Leiter auf — die Tasten rund '
      'um die goldumrandete Kategorie zeigen jetzt ihre Einheiten. Ein '
      'zweiter Tipp klappt die Leiter wieder zu.',
    ),
    _H('Zahl und Einheit'),
    _P(
      'Tippe eine Zahl und dann eine Einheiten-Taste: „144" und „ft" '
      'ergibt 144 Fuß. Die Ergebniszeile zeigt sofort dieselbe Größe in '
      'einer anderen Einheit, und die geschweifte Klammer daneben den '
      'Wert im jeweils anderen System.',
    ),
    _H('Die =-Taste'),
    _P(
      'Jeder Druck auf = zeigt die nächste Einheit der Leiter — so '
      'wanderst du durch alle Darstellungen derselben Größe. In der '
      'imperialen Welt folgt am Ende die gemischte Schreibweise, etwa '
      '„1 yd 2 ft 3 in", bevor der Zyklus von vorn beginnt.',
    ),
    _P(
      'Wechselst du zu einer anderen Kategorie, werden die fertigen '
      'Terme verworfen — eine bereits getippte Zahl bleibt aber stehen, '
      'du kannst also erst die Zahl und dann die Kategorie wählen.',
    ),
  ]),
  ManualChapter('Metrisch, imperial und die Farben', [
    _H('Die beiden runden Tasten'),
    _P(
      'Links und rechts der =-Taste sitzen „met" (grün) und „imp" '
      '(violett). Sie schalten zwischen dem metrischen und dem imperialen '
      'Einheitensystem um — der Wert bleibt dabei physikalisch gleich: '
      'Aus 144 ft werden 43.89 m, nicht 144 m. Die aktive Seite trägt '
      'einen Ring in ihrer Farbe.',
    ),
    _H('Das Farbsystem'),
    _P(
      'Grün steht überall in der App für die Zehner-Welt: metrische '
      'Einheiten und dezimale Ziffern. Violett steht für die Zwölfer-'
      'Welt: imperiale Einheiten und dozenale Ziffern. Einheitenzeichen '
      'wie „m" oder „ft" erscheinen in ihrer Systemfarbe, das DOZ/DEZ-'
      'Zeichen unten rechts in seiner Basisfarbe — und die geschweifte '
      'Klammer leuchtet immer in der Farbe der Welt, die sie zeigt.',
    ),
    _H('Dozenal oder dezimal'),
    _P(
      'Die Ziffernbasis ist vom Einheitensystem unabhängig und gilt für '
      'beide Rechner gemeinsam. Du stellst sie unter Einstellungen → '
      'Zahlensystem um — auch mitten in einer Umrechnung, die Werte '
      'bleiben erhalten. So kannst du metrische Einheiten dozenal lesen '
      'oder imperiale dezimal.',
    ),
  ]),
  ManualChapter('Mehrere Terme: + und −', [
    _P(
      'Innerhalb einer Kategorie kannst du Größen verketten: „5" „ft" '
      '„3" „in" ergibt 5 Fuß plus 3 Zoll. Das Plus bleibt unsichtbar, '
      'solange die Einheiten verschieden sind; bei gleichen Einheiten '
      '(„3 h + 2 h") wird es angezeigt.',
    ),
    _P(
      'Die −-Taste zieht den nächsten Term ab: „5" „ft" „−" „3" „in" '
      'ergibt 5 Fuß minus 3 Zoll. Das Minus ist immer sichtbar, und die '
      '−-Taste trägt einen goldenen Rahmen, solange sie scharf ist.',
    ),
    _H('Korrigieren'),
    _P(
      'Tippe in die Eingabezeile, um den roten Cursor zu setzen — mitten '
      'in eine Zahl oder zwischen zwei Terme. Ziffern erscheinen am '
      'Cursor, Del löscht das Zeichen davor; steht der Cursor an einer '
      'Term-Grenze, entfernt Del den ganzen Term davor. AC löscht alles.',
    ),
  ]),
  ManualChapter('Rechnen in der Eingabe: × ÷ ⊕ ^ √ ㏒', [
    _P(
      'Die getippte Zahl darf selbst eine kleine Rechnung sein: „3 × 2" '
      'und dann „ft" ergibt 6 Fuß. Ausgewertet wird strikt von links '
      'nach rechts, beim Tipp auf die Einheit.',
    ),
    _P(
      'Drückst du einen Rechenoperator, während schon ein fertiger '
      'Ausdruck dasteht, wird er zuerst in editierbare Ziffern '
      'verwandelt — der Gesamtwert in der zuletzt benutzten Einheit. '
      '„5 ft 3 in" und „×" wird so zu einer Zahl mal …, die du mit „2" '
      'und einer Einheit abschließt.',
    ),
    _H('Die besonderen Operatoren'),
    _P(
      'Bei Wurzel und Logarithmus steht links der Grad beziehungsweise '
      'die Basis: „2 √ 9" ist die Quadratwurzel aus 9, also 3; „2 ㏒ 8" '
      'ist der Logarithmus von 8 zur Basis 2, also 3. Das ⊕ bildet die '
      'Parallelsumme a·b/(a+b), bekannt von parallelen Widerständen.',
    ),
    _P(
      'Jedes Segment der Rechnung darf einen eigenen Dezimalpunkt '
      'tragen („1.6 × 0.6"). Beim Umschalten der Ziffernbasis werden '
      'alle Zahlen der Rechnung einzeln umgerechnet.',
    ),
  ]),
  ManualChapter('Speicher, Konstanten und die Brücke', [
    _H('Der Speicher'),
    _P(
      'Im Erweiterungsfeld „…" liegen STO, RCL und MC: STO merkt sich '
      'die Zahl der Ergebniszeile — oder, wenn noch keine Einheit '
      'gewählt ist, die getippte Eingabe. RCL fügt den gemerkten Wert '
      'wieder ein, MC löscht ihn. Sind RCL und MC grau, ist der '
      'Speicher leer.',
    ),
    _H('Die Konstanten'),
    _P(
      'π, e, φ und √2 setzen ihren Wert als Ziffern an die Stelle der '
      'Zahl am Cursor — praktisch für Umfänge und Verhältnisse: „3" „ד '
      '„π" „ft" ergibt den Umfang eines Kreises mit 3 Fuß Durchmesser.',
    ),
    _H('Die Brücke zum Hauptrechner'),
    _P(
      'Die Ans-Taste holt das letzte Ergebnis des Hauptrechners in die '
      'Eingabe — rechne dort etwas aus, wische herüber und gib dem Wert '
      'eine Einheit. Umgekehrt holt die CONV-Taste im Erweiterungsfeld '
      'des Hauptrechners die Zahl aus der Ergebniszeile des '
      'Einheitenrechners. Werte reisen dabei als Zahl und erscheinen '
      'automatisch in der Basis der Zielseite.',
    ),
  ]),
];
