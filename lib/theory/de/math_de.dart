// German prose for the "Dozenale Mathematik" chapters. part of
// ../math_theory.dart. Simple, clear sentences (easier to translate) for
// complex topics. The app-internals chapter is written from the source
// (logic/rational.dart, logic/expression.dart, state.dart); the maths/history
// chapters are distilled from docs/research/math_*.md.
//
// Order convention: the maths and history chapters come first; the
// app-internals chapter ("Wie dieser Rechner rechnet") stays last.

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersDe() => const [
  ProseChapter(
    'Teiler, Brüche und Perioden',
    [
      ProseSection(
        'Warum Zwölf so teilbar ist',
        'In Basis Zwölf schreiben wir zwölf Ziffern: 0 bis 9, dazu A für Zehn '
            'und B für Elf. „10" bedeutet hier also Zwölf.\n\n'
            'Die Zwölf lässt sich durch besonders viele Zahlen glatt teilen: 1, '
            '2, 3, 4, 6 und 12. Die Zehn dagegen nur durch 1, 2, 5 und 10. Der '
            'Grund liegt im Bauplan der Zahlen: Zehn ist zwei mal fünf, Zwölf '
            'ist zwei mal zwei mal drei. Die Zwölf steckt ihre Bausteine in die '
            'kleinen, häufigen Teiler 2 und 3 — und ist dadurch durch 3 und '
            'durch 4 teilbar, woran die Zehn scheitert. Auf die Größe kommt es '
            'nicht an: Die 16 ist größer, aber nur durch Zweierpotenzen '
            'teilbar.',
      ),
      ProseSection(
        'Welche Brüche glatt aufgehen',
        'Ob ein Bruch eine endliche Kommazahl ergibt, hängt an einer einfachen '
            'Regel: Er geht genau dann auf, wenn der Nenner nur aus '
            'Primfaktoren der Basis besteht.\n\n'
            'Weil in der Zwölf die Drei steckt, werden viele Alltagsbrüche in '
            'Basis Zwölf glatt: ein Halb = 0,6; ein Drittel = 0,4; ein Viertel '
            '= 0,3; ein Sechstel = 0,2; ein Neuntel = 0,14; ein Zwölftel = 0,1. '
            'In Basis Zehn laufen Drittel, Sechstel und Neuntel dagegen '
            'unendlich. Der Preis der Zwölf: Brüche mit Fünf im Nenner werden '
            'krumm — ein Fünftel ist in Basis Zwölf 0,2497, mit Wiederholung.',
      ),
      ProseSection(
        'Wenn es sich wiederholt',
        'Geht ein Bruch nicht auf, wiederholt sich ab einer Stelle eine feste '
            'Zifferngruppe — die Periode. Wie lang sie ist, folgt einer klaren '
            'Regel der Zahlentheorie und hängt von Basis und Nenner ab.\n\n'
            'Manches ist in beiden Welten gleich sperrig: Ein Siebtel hat in '
            'Basis Zehn (0,142857) wie in Basis Zwölf (0,186A35) eine '
            'sechsstellige Periode. Insgesamt gibt es unter den kleinen Nennern '
            'in Basis Zwölf etwas weniger periodische Brüche als in Basis Zehn '
            '— dafür können die Perioden, wenn sie auftreten, etwas länger '
            'ausfallen.',
      ),
      ProseSection(
        'Teilbarkeit auf einen Blick',
        'Praktisch zeigt sich die Stärke der Zwölf bei den Teilbarkeitsregeln. '
            'Ob eine Zahl durch 2, 3, 4 oder 6 teilbar ist, verrät in Basis '
            'Zwölf schon die letzte Ziffer. In Basis Zehn geht das nur für 2, '
            '5 und 10.\n\n'
            'Für die Elf (B) gibt es eine Quersummen-Regel — genau wie die '
            'bekannte Neunerprobe in Basis Zehn, weil Zwölf um eins über Elf '
            'liegt. Nur die Sieben hat, wie auch in Basis Zehn, keinen '
            'einfachen Test.',
      ),
      ProseSection(
        'Keine Basis gewinnt überall',
        'Die Zwölf hat also einen echten Vorteil beim Dritteln und Vierteln — '
            'und einen echten Nachteil beim Fünfteln, das für Prozente und Geld '
            'wichtig ist. Sie tauscht das eine gegen das andere.\n\n'
            'Mehr Teiler sind auch nicht beliebig besser: Sonst wäre die '
            'Sechzig im Vorteil, die durch noch mehr Zahlen teilbar ist — doch '
            'sie bräuchte sechzig Ziffern und ein riesiges Einmaleins. Die '
            'Dozenal-Gesellschaften sehen die Zwölf als guten Mittelweg: nur '
            'zwei Extra-Zeichen, kleines Einmaleins, aber die Teiler 2, 3 und '
            '4. Das ist ihre Abwägung, kein Beweis.',
      ),
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2',
        'A1',
      ),
      Source(
        'Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html',
        'R1',
        'A2',
      ),
      Source(
        'Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Zyklische Zahlen',
    [
      ProseSection(
        'Das Siebtel und seine Verwandten',
        'Ein Siebtel geht in Basis Zwölf nicht glatt auf, sondern wiederholt '
            'sich: ein Siebtel = 0,186A35, danach wieder 186A35, endlos. (A '
            'steht für Zehn, B für Elf.) Die sich wiederholende Gruppe ist die '
            'Periode; sie ist hier sechs Stellen lang.\n\n'
            'Das Verblüffende zeigt sich, wenn man die anderen Siebtel danebenlegt. '
            'Zwei Siebtel = 0,35186A, drei Siebtel = 0,5186A3, vier Siebtel = '
            '0,6A3518, fünf Siebtel = 0,86A351, sechs Siebtel = 0,A35186. Es sind '
            'jedes Mal dieselben sechs Ziffern in derselben Reihenfolge — nur '
            'beginnt die Folge an einer anderen Stelle. Man kann sie sich auf '
            'einem Ring aufgereiht denken, der bei jedem Bruch ein Stück '
            'weitergedreht wird.',
      ),
      ProseSection(
        'Wenn die Vielfachen rotieren',
        'Dieselbe Drehung steckt im Einmaleins der Periode selbst. Nimmt man die '
            'Ziffernfolge 186A35 als ganze Zahl und multipliziert sie der Reihe '
            'nach, entstehen wieder nur Drehungen: 186A35 × 2 = 35186A, × 3 = '
            '5186A3, × 4 = 6A3518, × 5 = 86A351, × 6 = A35186. Eine Zahl mit '
            'dieser Eigenschaft heißt eine zyklische Zahl.\n\n'
            'Der siebte Schritt schließt den Kreis: 186A35 × 7 = BBBBBB. Lauter '
            'Elfen — die höchste Ziffer der Basis Zwölf, sechsmal hintereinander. '
            'Das ist kein Zufall: BBBBBB ist gerade um eins kleiner als die nächste '
            'runde Stelle. In Basis Zehn kennt man dasselbe Kunststück von der '
            'berühmten Zahl 142857 (der Periode von einem Siebtel im Zehnersystem): '
            'Auch dort ergeben die Vielfachen Drehungen, und 142857 × 7 = 999999. '
            'Die Ziffern sind andere, die Struktur ist dieselbe.',
      ),
      ProseSection(
        'Warum gerade sechs Stellen',
        'Dass die Periode genau sechs Stellen lang ist — und nicht weniger —, hat '
            'einen klaren Grund. Beim schriftlichen Teilen bleibt nach jedem '
            'Schritt ein Rest, und die Periode endet, sobald sich ein Rest '
            'wiederholt. Bei einem Siebtel treten nacheinander alle sechs '
            'möglichen Reste 1 bis 6 auf, bevor sich der erste wiederholt. Mehr '
            'als sechs verschiedene Reste kann es bei der Sieben nicht geben, also '
            'ist sechs die größtmögliche Länge.\n\n'
            'Eine Primzahl, deren Kehrwert diese längstmögliche Periode erreicht, '
            'nennt man eine volle Periodenzahl. Nur bei ihr durchlaufen die '
            'Vielfachen alle Drehungen, und nur dann entsteht eine zyklische Zahl. '
            'Ob eine Primzahl voll ist, hängt davon ab, wie sich die Potenzen der '
            'Basis — hier Zwölf — beim Teilen durch die Primzahl verhalten.',
      ),
      ProseSection(
        'Die Ergänzung zur höchsten Ziffer',
        'Die Periode 186A35 trägt noch ein zweites Muster in sich. Teilt man sie '
            'in der Mitte und addiert die Hälften, kommt 186 + A35 = BBB heraus — '
            'wieder lauter Elfen, diesmal drei. Die beiden Hälften ergänzen sich '
            'genau zur höchsten Ziffer.\n\n'
            'Das ist ein allgemeiner Satz (nach Étienne Midy, 1836) und gilt in '
            'jeder Basis: In Basis Zehn ist es 142 + 857 = 999. Der Effekt zeigt, '
            'dass die zweite Hälfte der Periode kein neues Material ist, sondern '
            'das Spiegelbild der ersten.',
      ),
      ProseSection(
        'Nicht jede Primzahl macht mit',
        'Die schöne Drehung ist die Ausnahme, nicht die Regel. Ein Elftel zeigt '
            'in Basis Zwölf nur die Periode 0,1 — eine einzige sich wiederholende '
            'Eins, weil Zwölf um eins über Elf liegt (das Gegenstück zu einem '
            'Neuntel = 0,1 im Zehnersystem). Ein Dreizehntel ergibt 0,0B mit der '
            'kurzen Periode 0B. Solche Primzahlen erzeugen keine zyklische Zahl.\n\n'
            'Unter den kleinen Primzahlen sind in Basis Zwölf 5, 7, 17, 31, 41 und '
            '43 (dezimal gezählt) volle Periodenzahlen — bemerkenswerterweise alle '
            'mit der Endziffer 5 oder 7 in Basis Zwölf. Das ist eine notwendige, '
            'aber keine hinreichende Bedingung: Die Neunzehn endet ebenfalls auf '
            '7, hat aber nur eine sechsstellige Periode. Auch der Wechsel der Basis '
            'spielt mit: Die Fünf ist in Basis Zwölf voll (ein Fünftel = 0,2497, '
            'Periode 2497), im Zehnersystem dagegen geht ein Fünftel glatt auf. '
            'Welche Primzahlen mitmachen, gehört also zum Paar aus Basis und '
            'Primzahl, nicht zur Primzahl allein.',
      ),
      ProseSection(
        'Wie viele es gibt — eine offene Frage',
        'Man könnte meinen, eine so klare Eigenschaft sei längst ausgezählt. Das '
            'ist nicht so. Wie viele volle Periodenzahlen es in Basis Zwölf gibt — '
            'ob unendlich viele —, ist bis heute nicht bewiesen.\n\n'
            'Eine Vermutung von Emil Artin aus dem Jahr 1927 sagt voraus, dass '
            'ungefähr siebenunddreißig von hundert Primzahlen voll sein sollten, '
            'in Basis Zwölf wie in jeder anderen tauglichen Basis. Die Beobachtung '
            'an kleinen Zahlen passt zu dieser Größenordnung. Aber die Vermutung '
            'ist eben eine Vermutung: Trotz großer Anstrengungen ist sie für keine '
            'einzelne Basis bewiesen. Das gehört zur ehrlichen Darstellung dazu — '
            'ein einfach klingendes Muster, hinter dem ein bis heute offenes '
            'Problem steht.',
      ),
      ProseSection(
        'Im Rechner ausprobieren',
        'All das lässt sich hier nachsehen. Tippt man ein Siebtel und Gleich, '
            'zeigt die Anzeige 0, mit einem Überstrich über 186A35 — die sechs '
            'Stellen der Periode. Bei zwei Siebteln erscheint dieselbe Folge als '
            '35186A, gedreht; das ist keine Rundung, sondern exakt dasselbe Muster. '
            'Ein Fünftel zeigt den Überstrich über 2497, ein Elftel nur über der '
            'einen Ziffer 1.\n\n'
            'Größere Beispiele machen die Grenzen sichtbar: Ein Bruch mit Nenner '
            'Einundreißig (dezimal) hat eine dreißig Stellen lange Periode — hier '
            'kürzt die Anzeige mit drei Punkten, weil nicht alles in eine Zeile '
            'passt. Wie der Rechner exakte Brüche und ihre Perioden überhaupt '
            'ermittelt, steht im Kapitel „Wie dieser Rechner rechnet".',
      ),
    ],
    sources: [
      Source(
        'Cyclic number — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_number',
        'R2',
        'A1',
      ),
      Source(
        'Full reptend prime — Wikipedia',
        'https://en.wikipedia.org/wiki/Full_reptend_prime',
        'R2',
        'A1',
      ),
      Source(
        '142857 — Wikipedia',
        'https://en.wikipedia.org/wiki/142857',
        'R2',
        'A1',
      ),
      Source(
        'Midy’s theorem — Wikipedia',
        'https://en.wikipedia.org/wiki/Midy%27s_theorem',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative order — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_order',
        'R2',
        'A1',
      ),
      Source(
        'Artin’s conjecture on primitive roots — Wikipedia',
        'https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots',
        'R2',
        'A1',
      ),
      Source(
        'Orders of Units in Modular Arithmetic (Keith Conrad, UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
      Source(
        'OEIS A019340 — Primes with primitive root 12',
        'https://oeis.org/A019340',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Teilbarkeit und die Elfer-Probe',
    [
      ProseSection(
        'Die letzte Ziffer verrät viel',
        'In Basis Zwölf ist die letzte Ziffer einer Zahl nichts anderes als ihr '
            'Rest beim Teilen durch zwölf. Darum sieht man der Endziffer sofort an, '
            'ob die Zahl durch einen Teiler der Zwölf glatt aufgeht. Gerade '
            'Endziffern (0, 2, 4, 6, 8, A) bedeuten teilbar durch zwei. Endet die '
            'Zahl auf 0, 3, 6 oder 9, ist sie durch drei teilbar; auf 0, 4 oder 8, '
            'durch vier; auf 0 oder 6, durch sechs; auf 0 allein, durch zwölf. '
            '(A steht hier für zehn.)\n\n'
            'Das ist ein handfester Vorteil der Zwölf. Im Zehnersystem verrät die '
            'Endziffer nur die Teilbarkeit durch zwei, fünf und zehn — für drei, '
            'vier oder sechs muss man rechnen. Die Zwölf legt gerade die häufigen '
            'kleinen Teiler offen.',
      ),
      ProseSection(
        'Die Elfer-Probe: die Quersumme zählt',
        'Für die Elf (B) hilft die Endziffer nicht, aber ein ebenso einfacher '
            'Griff: die Quersumme, also die Summe aller Ziffern. Eine Zahl ist in '
            'Basis Zwölf genau dann durch elf teilbar, wenn ihre Quersumme durch '
            'elf teilbar ist. Der Grund ist hübsch: Zwölf lässt beim Teilen durch '
            'elf den Rest eins, und ebenso jede höhere Stelle — darum zählt nur, '
            'was die Ziffern zusammen ergeben.\n\n'
            'Das ist das genaue Gegenstück zur bekannten Neunerprobe im '
            'Zehnersystem, wo die Quersumme die Neun prüft. In Basis Zwölf prüft '
            'sie die Elf — daher der Name Elfer-Probe. Ein Beispiel: Die Zahl 4B7 '
            'hat die Quersumme 4 + B + 7, also vierzehn plus acht, das ist '
            'zweiundzwanzig — und zweiundzwanzig ist zweimal elf, somit ist 4B7 '
            'durch elf teilbar. Wie die Neunerprobe dient die Elfer-Probe als '
            'schnelle Rechenkontrolle: Geht die Probe nicht auf, steckt im Ergebnis '
            'ein Fehler.',
      ),
      ProseSection(
        'Die Dreizehn an der alternierenden Quersumme',
        'Eine zweite Probe fängt die Dreizehn. Hier zählt man die Ziffern '
            'abwechselnd plus und minus, von rechts beginnend — die alternierende '
            'Quersumme. Geht diese durch dreizehn auf, dann auch die Zahl selbst. '
            'Der Grund ist das Spiegelbild der Elfer-Probe: Zwölf liegt um eins '
            'unter dreizehn, darum wechseln die Stellen beim Teilen durch dreizehn '
            'das Vorzeichen.\n\n'
            'Ein kleiner Stolperstein für alle, die das Zehnersystem gewohnt sind: '
            'Dort heißt „Elferprobe" gerade die alternierende Variante, weil die '
            'Elf dort um eins über zehn liegt. In Basis Zwölf sind die Rollen '
            'vertauscht — die einfache Quersumme gehört der Elf, die alternierende '
            'der Dreizehn. (Die Dreizehn selbst schreibt sich in Basis Zwölf '
            'übrigens als 11, ein Zwölfer und ein Einer; gemeint ist immer ihr '
            'Wert.)',
      ),
      ProseSection(
        'Wo die Zwölf sich schwertut',
        'Kein Vorteil ist umsonst. Die Fünf und die Sieben teilen sich mit der '
            'Zwölf keinen Faktor und passen auch nicht zur Elf oder Dreizehn — für '
            'sie gibt es in Basis Zwölf keine bequeme Endziffer- oder '
            'Quersummenregel. Ausgerechnet die Fünf, die im Zehnersystem die '
            'allereinfachste Probe hat (Endziffer null oder fünf), wird hier '
            'umständlich.\n\n'
            'Das ist der ehrliche Tausch: Die Zwölf schenkt uns die leichten '
            'Proben für drei, vier und sechs und nimmt dafür die leichte Fünf-Probe. '
            'Welche Seite mehr wiegt, hängt davon ab, welche Teiler im Alltag '
            'öfter gebraucht werden — und das sind meist die kleinen.',
      ),
    ],
    sources: [
      Source(
        'Divisibility rule — Wikipedia',
        'https://en.wikipedia.org/wiki/Divisibility_rule',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Casting out nines — Wikipedia',
        'https://en.wikipedia.org/wiki/Casting_out_nines',
        'R2',
        'A1',
      ),
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Tricks im Einmaleins',
    [
      ProseSection(
        'Reihen mit kurzem Schwanz',
        'Das Einmaleins der Zwölf hat zwölf Reihen, und einige davon prägen sich '
            'fast von allein ein — nämlich die der Teiler. Ihre Vielfachen enden in '
            'kurzen, sich wiederholenden Mustern. Die Sechserreihe endet abwechselnd '
            'auf 6 und 0 (6, 10, 16, 20, 26, 30 …). Die Viererreihe läuft 4, 8, 0, 4, '
            '8, 0; die Dreierreihe 3, 6, 9, 0 und wieder von vorn; die Zweierreihe '
            'bleibt stets gerade.\n\n'
            'Zwei Handgriffe sind besonders bequem. Mal Zwölf heißt einfach eine '
            'Null anhängen: sieben mal zwölf ist 70. Und die Sechserreihe ist die '
            'halbe Zwölferreihe — sechs mal eine gerade Zahl endet auf 0, sechs mal '
            'eine ungerade auf 6.',
      ),
      ProseSection(
        'Die Elfer-Reihe als Spiegel',
        'Die hübscheste Reihe gehört der Elf (B): B, 1A, 29, 38, 47, 56, 65, 74, '
            '83, 92, A1, B0. In ihr stecken gleich zwei Muster. Die vordere Ziffer '
            'klettert Schritt für Schritt nach oben — 0, 1, 2, 3 und so fort —, '
            'während die hintere im Gleichschritt nach unten fällt. Und in jedem '
            'Ergebnis ergeben die beiden Ziffern zusammen elf: eins und zehn, zwei '
            'und neun, drei und acht.\n\n'
            'Das ist genau das Spiegelbild der Neunerreihe aus dem Zehnersystem, wo '
            'die Ziffern sich zu neun ergänzen. Daraus folgt ein bequemer Trick: '
            'Statt mal elf zu rechnen, nimmt man mal zwölf und zieht die Zahl '
            'einmal ab. Elf mal sieben ist also siebzig minus sieben, das ergibt 65 '
            'in Basis Zwölf — und tatsächlich steht in der Tabelle bei elf mal '
            'sieben die 65.',
      ),
      ProseSection(
        'Die störrischen Reihen: Fünf und Sieben',
        'Nicht alle Reihen sind so gefällig. Die Fünf und die Sieben teilen sich '
            'mit der Zwölf keinen Faktor, und ihre Reihen laufen darum durch alle '
            'zwölf möglichen Endziffern, ehe sich etwas wiederholt — kein kurzer '
            'Zyklus, der das Merken trägt. Die Fünferreihe endet der Reihe nach auf '
            '5, A, 3, 8, 1, 6, B, 4, 9, 2, 7, 0; bei der Sieben ist es ähnlich '
            'sprunghaft.\n\n'
            'Hier kehrt ein altes Quartett wieder: Genau die Reihen der Eins, Fünf, '
            'Sieben und Elf durchlaufen alle Endziffern vollständig — dieselben '
            'vier Zahlen, die auf der Stundenuhr den ganzen Kreis erzeugen und auf '
            'die Primzahlen enden. Und genau deshalb haben ein Fünftel und ein '
            'Siebtel jene langen, vollen Perioden aus dem Kapitel über zyklische '
            'Zahlen. Im Zehnersystem ist die Siebenerreihe die berüchtigt sperrige; '
            'in Basis Zwölf sind es die Fünf und die Sieben gemeinsam.',
      ),
      ProseSection(
        'Quadrate und das Gross',
        'Geht man die Tabelle schräg von oben links nach unten rechts, stehen dort '
            'die Quadratzahlen: 1, 4, 9, 14, 21, 30, 41, 54, 69, 84, A1 — und '
            'schließlich 100. Diese letzte ist zwölf mal zwölf, also '
            'hundertvierundvierzig, die in Basis Zwölf glatt „100" heißt und seit '
            'alters ein Gross genannt wird. Die Zwölf schreibt ihre eigene '
            'Quadratzahl so rund wie das Zehnersystem die Hundert.\n\n'
            'Auch das Verdoppeln und Halbieren fällt in Basis Zwölf leicht, weil '
            'zwölf gerade und durch vier teilbar ist: die Hälfte von 10 ist 6, die '
            'Hälfte von 6 ist 3, die Hälfte von 3 ist 1,6. So lässt sich vieles im '
            'Kopf in kleine, saubere Schritte zerlegen — der eigentliche Grund, '
            'warum Freunde der Zwölf das Rechnen mit ihr als angenehm empfinden.',
      ),
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Multiplication table — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplication_table',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Die Zahlenbasen im Vergleich',
    [
      ProseSection(
        'Was eine Basis ist',
        'Ein Stellenwertsystem gibt jeder Ziffer einen Wert nach ihrer '
            'Position. Die Basis sagt, wie viele Ziffern es gibt und um welchen '
            'Faktor jede Stelle wächst. Basis Zehn nutzt zehn Ziffern, Basis '
            'Zwölf zwölf (0–9, A, B), Basis Zwei nur zwei (0 und 1).\n\n'
            'Dieselbe Zahl sieht je nach Basis anders aus, meint aber dasselbe. '
            'Eine kleine Basis braucht viele Stellen (binär wird sehr lang), '
            'eine große Basis viele verschiedene Zeichen.',
      ),
      ProseSection(
        'Sechs Basen im Steckbrief',
        '• Basis 2 (binär): die Sprache der Computer — ein Schalter ist an '
            'oder aus.\n'
            '• Basis 8 (oktal): heute eine Nische, etwa für Dateirechte unter '
            'Unix.\n'
            '• Basis 10 (dezimal): unser Alltag und das metrische System.\n'
            '• Basis 12 (dozenal): Dutzend, Uhr und Zoll — und das Anliegen der '
            'Dozenal-Bewegung.\n'
            '• Basis 16 (hexadezimal): kompakte Schreibweise für '
            'Computerdaten.\n'
            '• Basis 60 (sexagesimal): Zeit und Winkel, ein Erbe Babylons.',
      ),
      ProseSection(
        'Umrechnen zwischen den Basen',
        'Zahlen wandern nach festen Verfahren von einer Basis in die andere. '
            'Den ganzen Teil teilt man wiederholt durch die Zielbasis und liest '
            'die Reste von unten nach oben. Den Nachkommateil multipliziert man '
            'wiederholt mit der Zielbasis und liest die ganzen Anteile von oben '
            'nach unten.\n\n'
            'Beispiel: 0,5 wird in Basis Zwölf zu 0,6; 0,125 wird zu 0,16. '
            'Zwischen verwandten Basen geht es noch einfacher: Weil Sechzehn '
            'eine Potenz von Zwei ist, entspricht eine Hex-Ziffer genau vier '
            'Binärstellen — man muss nur gruppieren.',
      ),
      ProseSection(
        'Wo welche Basis zu Hause ist',
        'Computer rechnen binär, weil ein Transistor nur zwei Zustände kennt. '
            'Hexadezimal ist die handliche Kurzschrift dafür — sie steckt in '
            'Speicheradressen, Webfarben wie #FF00FF und Unicode-Nummern. Zeit '
            'und Winkel folgen der Sechzig: sechzig Minuten, 360 Grad, leicht '
            'in Drittel und Viertel teilbar. Der Alltag und fast die ganze '
            'Wissenschaft laufen dezimal — vor allem aus Gewohnheit und weil '
            'das metrische System darauf aufbaut.\n\n'
            'Die Zwölf lebt in Dutzend, Gros, Uhr und Zoll fort. Seit dem 18. '
            'Jahrhundert gibt es Fürsprecher einer echten Zwölfer-Rechnung — '
            'von Buffon über Isaac Pitman bis Frank Emerson Andrews, der 1935 '
            'das erste Buch dazu schrieb. Eigene Gesellschaften pflegen die '
            'Idee bis heute; mehr dazu im Block „Dozenale Gesellschaft".',
      ),
      ProseSection(
        'Keine Basis ist überall die beste',
        'Jede Basis hat ihren Zweck. Zwei und Sechzehn sind nicht „besser für '
            'Menschen", sondern ideal für Maschinen. Zehn ist vertraut und fest '
            'verankert. Zwölf teilt schön in Drittel und Viertel, verliert aber '
            'beim Fünftel. Sechzig teilt am besten, ist mit sechzig Zeichen '
            'aber zu groß für den Alltag.\n\n'
            'Bei Maßsystemen zählt am Ende weniger die Basis selbst als die '
            'Konsequenz, mit der man bei einer einzigen Basis bleibt: Das '
            'metrische System gewinnt, weil alles über dieselbe Zehn läuft — '
            'ein gemischtes System aus Meile, Yard, Fuß und Zoll hätte diesen '
            'Vorteil in keiner Basis.',
      ),
    ],
    sources: [
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Octal — Wikipedia',
        'https://en.wikipedia.org/wiki/Octal',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Eine kurze Geschichte der Stellenwertsysteme',
    [
      ProseSection(
        'Vor dem Stellenwert',
        'Lange schrieb man Zahlen, indem man Zeichen aufaddierte. Die römischen '
            'Ziffern sind so ein System: XVII heißt zehn plus fünf plus eins '
            'plus eins. Das ist gut zum Ablesen, aber mühsam zum Rechnen, und '
            'große Zahlen werden unhandlich.\n\n'
            'Der große Sprung war das Stellenwertsystem: Dieselbe Ziffer '
            'bedeutet je nach Position etwas anderes. Erst das macht das '
            'schriftliche Rechnen mit beliebig großen Zahlen einfach — und '
            'verlangt eine Ziffer für „nichts an dieser Stelle": die Null.',
      ),
      ProseSection(
        'Babylon und die Sechzig',
        'Das erste echte Stellenwertsystem entstand bei den Sumerern und '
            'Babyloniern, vor über viertausend Jahren, zur Basis Sechzig. Es '
            'gilt als ihre größte mathematische Leistung.\n\n'
            'Eine volle Null hatten sie aber noch nicht: Sie kannten ein '
            'Platzhalter-Zeichen für leere Stellen in der Mitte, nie aber am '
            'Ende einer Zahl. Ihr Erbe begleitet uns bis heute — in den sechzig '
            'Minuten der Stunde und den 360 Grad des Kreises.',
      ),
      ProseSection(
        'Die indische Erfindung der Null',
        'Das heutige Zehnersystem mit der Null kommt aus Indien. Aryabhata '
            'nutzte im 5. Jahrhundert die Stellenschreibweise; Brahmagupta '
            'behandelte 628 die Null erstmals als eigene Zahl mit eigenen '
            'Rechenregeln, nicht nur als Lücke.\n\n'
            'Von dort übernahmen es arabische und persische Gelehrte — '
            'al-Chwarizmi schrieb um 825 darüber —, und über sie gelangte es '
            'nach Europa. Darum heißen unsere Ziffern bis heute „arabische '
            'Ziffern", obwohl die Idee aus Indien stammt.',
      ),
      ProseSection(
        'Die Basen der Maschinen',
        'Mit den Rechenmaschinen kamen neue Basen. Gottfried Wilhelm Leibniz '
            'veröffentlichte 1703 das Binärsystem aus nur 0 und 1 — er sah '
            'darin sogar die alten Hexagramme des chinesischen I Ging '
            'wieder.\n\n'
            'Heute rechnen Computer binär, schreiben es aber meist '
            'hexadezimal: Mit dem 8-Bit-Byte der IBM System/360 in den 1960er '
            'Jahren setzte sich Basis Sechzehn durch, weil zwei Hex-Ziffern '
            'genau ein Byte ergeben. Jede Basis fand so ihren Platz — nicht '
            'weil sie „die beste" wäre, sondern weil sie zu ihrer Aufgabe '
            'passt.',
      ),
    ],
    sources: [
      Source(
        'Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2',
        'A2',
      ),
      Source(
        'Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number',
        'R3',
        'A2',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter('Wie dieser Rechner rechnet', [
    ProseSection(
      'Zwei Rechner in einem',
      'Wenn du die Gleichtaste drückst, rechnet die App nicht einmal, '
          'sondern zweimal — mit zwei ganz verschiedenen Maschinen.\n\n'
          'Die erste ist ein exakter Bruch-Rechner. Er rechnet ohne jede '
          'Rundung, mit beliebig großen ganzen Zahlen. Die zweite ist ein '
          'schneller Komma-Rechner, wie ihn fast jeder Taschenrechner hat — '
          'er rechnet mit begrenzter Genauigkeit, dafür mit allem, auch mit '
          'Sinus, Wurzel und Logarithmus. Beide laufen bei jedem '
          'Gleichheitszeichen los.',
    ),
    ProseSection(
      'Der exakte Bruch',
      'Der Bruch-Rechner hält Zahlen als Verhältnis zweier ganzer Zahlen '
          'fest. Ein Drittel bleibt wirklich ein Drittel, nicht 0,333… Erst '
          'zur Anzeige verwandelt er den Bruch in dozenale Nachkommastellen.\n\n'
          'Dabei erkennt er, wenn sich die Nachkommastellen wiederholen. Ein '
          'Drittel ist in Basis Zwölf glatt 0,4. Ein Fünftel dagegen läuft '
          'periodisch: 0,2497 2497 2497 … Die App zeigt das mit einem Strich '
          'über der sich wiederholenden Gruppe und einem Punkt, der den '
          'Anfang der Periode markiert. So bleibt das Ergebnis exakt, statt '
          'still gerundet zu werden.',
    ),
    ProseSection(
      'Wenn der Bruch nicht reicht',
      'Manche Rechnungen lassen sich nicht als Bruch schreiben. Sobald ein '
          'Sinus, eine Wurzel, ein Logarithmus oder eine ähnliche Funktion '
          'vorkommt — oder durch null geteilt wird —, gibt der Bruch-Rechner '
          'auf.\n\n'
          'Dann springt der Komma-Rechner ein. Sein Ergebnis ist nur '
          'näherungsweise, darum stellt die App ihm ein „≈"-Zeichen voran: '
          '„ungefähr". Klappen beide Wege, gewinnt immer der exakte Bruch. '
          'Das „≈" erscheint also nur dort, wo eine echte Näherung nötig ist.',
    ),
    ProseSection(
      'Lange Perioden und das Display',
      'Exakte Ergebnisse können sehr lang werden. Manche Brüche haben '
          'Perioden von über hundert Stellen — viel mehr, als auf eine Zeile '
          'passt.\n\n'
          'Damit nichts aus dem Display läuft, lässt die App von rechts so '
          'viele der hintersten (niederwertigsten) Stellen weg, bis der Rest '
          'in die Zeile passt, und setzt ein „…" als Zeichen dafür, dass es '
          'noch weitergeht. Die Periode-Markierung wird dabei sauber '
          'mitgekürzt. Die Zahl bleibt also ehrlich: Was abgeschnitten ist, '
          'wird sichtbar angezeigt, nicht versteckt.',
    ),
  ]),
  ProseChapter(
    'Fibonacci, Quadratzahlen und Kuriositäten',
    [
      ProseSection(
        '144 — wo sich zwei Welten treffen',
        'Die Fibonacci-Folge beginnt mit 1, 1, und jede weitere Zahl ist die '
            'Summe der beiden vorangehenden: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Sie wächst exponentiell — die Glieder werden rasch '
            'sehr groß. Die Quadratzahlen 1, 4, 9, 16, 25, 36, … wachsen '
            'dagegen nur quadratisch, also viel langsamer. Zwei so '
            'verschieden wachsende Folgen haben fast keinen Grund, sich '
            'jemals zu treffen.\n\n'
            'Und doch tun sie es: Die zwölfte Fibonacci-Zahl ist 144, und '
            '144 = 12² ist eine Quadratzahl. Wir schreiben dieses Glied kurz '
            'F₁₂ = 144. In Basis 12 ist 144 zugleich „100", die erste '
            'dreistellige Zahl, und im Handel das Gross — ein Dutzend Dutzend. '
            'Drei Eigenschaften fallen hier in einer einzigen Zahl zusammen.\n\n'
            'Dass dies kein bloßer Zufall, sondern ein Einzelfall ist, hat '
            'J. H. E. Cohn 1964 bewiesen: Außer 0, 1 und 144 gibt es in der '
            'gesamten unendlichen Fibonacci-Folge keine weitere Zahl, die '
            'zugleich eine Quadratzahl ist. Sein Beweis ist elementar, aber '
            'nicht einfach; er nutzt die eng verwandte Lucas-Folge und '
            'Teilbarkeitsargumente. Die Zwölf steht damit an einer bewiesenen, '
            'einmaligen Kreuzung zweier fundamentaler Zahlenfolgen — eine '
            'Besonderheit, keine Mystik.\n\n'
            'Ein noch stärkerer Satz von 2006 (Bugeaud, Mignotte und Siksek) '
            'geht weiter: Die einzigen vollständigen Potenzen überhaupt in der '
            'Fibonacci-Folge sind 0, 1, 8 = 2³ und 144 = 12². Cohns Aussage '
            'über die Quadratzahlen ist davon der Spezialfall.',
      ),
      ProseSection(
        'Der Goldene Schnitt',
        'Teilt man eine Fibonacci-Zahl durch ihre Vorgängerin, nähern sich '
            'diese Verhältnisse immer mehr einer festen Zahl: dem Goldenen '
            'Schnitt φ = (1+√5)/2 ≈ 1,618. Formal F(n+1)/F(n) → φ. Johannes '
            'Kepler bemerkte diese Annäherung schon 1611. In Basis 12 ist '
            'φ ≈ 1,74BB677…; der Rechner führt φ als Konstante im '
            'Erweiterungsfeld.\n\n'
            'φ hat eine schlichte definierende Eigenschaft: φ² = φ + 1. Es ist '
            'die einzige positive Zahl, deren Quadrat genau um 1 größer ist als '
            'sie selbst. Wer im Rechner φ² = tippt, erhält exakt φ + 1 — die '
            'Identität wird unmittelbar sichtbar.\n\n'
            'In der Natur erscheint φ tatsächlich dort, wo Blätter und Kerne '
            'um den „Goldenen Winkel" versetzt wachsen; die Spiralzahlen von '
            'Sonnenblumen oder Tannenzapfen sind dann oft benachbarte '
            'Fibonacci-Zahlen. Vieles andere, was φ zugeschrieben wird, hält '
            'der Prüfung aber nicht stand: Die Nautilus-Spirale folgt nicht '
            'φ, und ein bewusster Einsatz im Parthenon oder bei da Vinci ist '
            'nicht belegt. Echt ist φ in der Mathematik und in der '
            'Blattstellung — nicht überall.',
      ),
      ProseSection(
        'Die Zwölf als teilerreiche Zahl',
        'Die Zahlentheorie kennt mehrere genaue Weisen, eine Zahl als '
            '„teilerreich" zu beschreiben — und die Zwölf taucht in einigen '
            'davon auf. Zwölf ist hochzusammengesetzt: Sie hat mehr Teiler '
            'als jede kleinere Zahl. Ihre Teiler sind 1, 2, 3, 4, 6, 12 — '
            'sechs Stück; keine Zahl unter 12 hat so viele. Srinivasa '
            'Ramanujan untersuchte diese Klasse 1915 in einer berühmten '
            'Arbeit in den Proceedings of the London Mathematical Society.\n\n'
            'Zwölf ist außerdem die kleinste abundante Zahl: Die Summe ihrer '
            'echten Teiler, 1+2+3+4+6 = 16, übertrifft die Zahl selbst. Bei '
            'kleineren Zahlen ist es umgekehrt — bei 10 ergibt 1+2+5 = 8, '
            'weniger als 10. Zwölf ist die erste Zahl, bei der die Teiler '
            '„überquellen".\n\n'
            'Eine seltenere Eigenschaft: Zwölf ist eine sublime Zahl. Das '
            'heißt, gleich zwei Kennzahlen ihrer Teiler sind selbst perfekte '
            'Zahlen. Die Anzahl der Teiler ist 6 (und 6 = 1+2+3 ist perfekt). '
            'Die Summe aller Teiler ist 1+2+3+4+6+12 = 28 (und 28 = 1+2+4+7+14 '
            'ist ebenfalls perfekt). Bis heute sind nur zwei sublime Zahlen '
            'bekannt — die Zwölf und eine 76-stellige Zahl. Der Begriff stammt '
            'allerdings aus der Freizeitmathematik und ist eng konstruiert; '
            'seine Seltenheit ist also kein Beweis kosmischer Bedeutung, '
            'sondern Folge einer speziellen Definition.',
      ),
      ProseSection(
        'Eine Pyramide aus Kanonenkugeln',
        'Stapelt man Kanonenkugeln zu einer Pyramide mit quadratischer '
            'Grundfläche, enthält die n-te Pyramide 1² + 2² + … + n² Kugeln. '
            'Thomas Harriot leitete diese Summenformel um 1587 her, als Sir '
            'Walter Raleigh wissen wollte, wie man gestapelte Kugeln zählt.\n\n'
            'Eine schwierigere Frage ist: Wann ist eine solche Pyramide '
            'zugleich ein perfektes Quadrat aus Kugeln? Es gibt nur einen '
            'nichttrivialen Fall, und er ist schön: '
            '1² + 2² + … + 24² = 4900 = 70². Dieselben 4900 Kugeln lassen '
            'sich also als Pyramide mit 24 Lagen oder als 70×70-Quadrat '
            'auslegen. Édouard Lucas vermutete 1875, dass dies die einzige '
            'Lösung ist; vollständig bewiesen wurde es erst 1918 von '
            'G. N. Watson — das Problem war wirklich schwer.\n\n'
            'Die Zahl 24 ist gerade das Doppelte von 12. Das ist eine hübsche '
            'Beobachtung — aber ehrlich gesagt kein belegter Grund: Die 24 '
            'erscheint hier, weil die zugrunde liegende Gleichung gerade diese '
            'Lösung hat, nicht wegen eines Zusammenhangs mit der Basis Zwölf.',
      ),
      ProseSection(
        'Platons ideale Stadt',
        'In seinen „Gesetzen" (Buch V) fragt Platon, wie viele Bürger eine '
            'ideale Stadt haben sollte. Seine Antwort: 5040. Das Argument ist '
            'nicht mystisch, sondern praktisch — eine Stadt muss ihre Bürger '
            'ständig in gleich große Gruppen einteilen, und 5040 ist durch '
            'jede Zahl von 1 bis 12 teilbar, mit der einzigen Ausnahme von 11. '
            '(Für die Teilbarkeit durch 11 schlägt Platon vor, zwei Familien '
            'abzuziehen.)\n\n'
            'Was Platon hier beschreibt, ist dieselbe Einsicht, die dem '
            'Dozenalsystem zugrunde liegt: Im Alltag sind die kleinen Teiler '
            'die wichtigen. 5040 = 7! ist gewissermaßen die große Schwester '
            'der Zwölf — dieselbe Teilbarkeitsphilosophie, angewendet auf eine '
            'ganze Stadtbevölkerung statt auf ein Zahlensystem.',
      ),
      ProseSection(
        'Kuriosität ist nicht Numerologie',
        'Die Zwölf trägt viele Etiketten zugleich: hochzusammengesetzt, '
            'abundant, sublim, Index der einzigen nichttrivialen '
            'Fibonacci-Quadratzahl. Diese Häufung wirkt eindrucksvoll — aber '
            'jede Eigenschaft ist eine eigene, unabhängige Definition. Ihr '
            'gemeinsames Zutreffen ist weder Ursache noch Symbol von etwas '
            'Höherem. Was die Zwölf wirklich heraushebt, ist ihre Kleinheit: '
            'Sie ist die kleinste Zahl mit diesen Eigenschaften; größere '
            'Zahlen wie 24, 36 oder 60 haben sogar noch mehr Teiler.\n\n'
            'Ein verbreiteter Irrtum sei klar benannt: Die Zwölf wird oft '
            'eine „perfekte Zahl" genannt. Das ist mathematisch falsch. '
            'Perfekt heißt: Die Summe der echten Teiler ergibt die Zahl '
            'selbst — wie bei 6 (1+2+3) oder 28 (1+2+4+7+14). Bei der Zwölf '
            'ergeben die echten Teiler 16, also mehr als 12. Die Zwölf ist '
            'abundant, nicht perfekt. Die Verwechslung geht auf Nikomachos von '
            'Gerasa zurück (um 100 n. Chr.), der diese Zahlenklassen mit '
            'moralischen Wertungen verband — eine Deutung der Antike, keine '
            'Mathematik.\n\n'
            'Der Wert dieses Kapitels liegt genau in der Trennung: Cohns Satz, '
            'die Kanonenkugel-Identität und die kleinste abundante Zahl sind '
            'bewiesene Tatsachen. Sie verdienen es, als das gesehen zu werden, '
            'was sie sind — schöne, ehrliche Mathematik, die ohne mystische '
            'Aufladung auskommt.',
      ),
    ],
    sources: [
      Source(
        'Square Fibonacci Numbers, Etc. (J. H. E. Cohn, 1964)',
        'https://math.la.asu.edu/~checkman/SquareFibonacci.html',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci and Lucas perfect powers (Bugeaud, Mignotte, Siksek, 2006) — Annals of Mathematics',
        'https://annals.math.princeton.edu/2006/163-3/p05',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci sequence — Wikipedia',
        'https://en.wikipedia.org/wiki/Fibonacci_sequence',
        'R2',
        'A1',
      ),
      Source(
        'Cannonball problem — Wikipedia',
        'https://en.wikipedia.org/wiki/Cannonball_problem',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Abundant number — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundant_number',
        'R2',
        'A1',
      ),
      Source(
        'Sublime number — Wikipedia',
        'https://en.wikipedia.org/wiki/Sublime_number',
        'R2',
        'A1',
      ),
      Source(
        '5040 (number) — Wikipedia',
        'https://en.wikipedia.org/wiki/5040_(number)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Die Uhr als Gruppe (ℤ/12ℤ)',
    [
      ProseSection(
        'Rechnen wie auf dem Zifferblatt',
        'Auf der Uhr ergibt elf Uhr plus zwei Stunden nicht dreizehn, sondern ein '
            'Uhr. Man rechnet ganz normal und nimmt am Ende den Rest beim Teilen '
            'durch zwölf. Bildlich wird die endlose Zahlengerade auf einen Kreis '
            'mit zwölf Marken aufgewickelt; jede Zahl landet auf einer der Marken '
            '0 bis 11.\n\n'
            'Diese zwölf Marken mit der Stundenaddition bilden ein sauberes '
            'kleines Rechensystem. Es bleibt immer in sich geschlossen (jede Summe '
            'ist wieder eine der zwölf Marken), es gibt die Null als „ändert '
            'nichts", und zu jedem Schritt gibt es einen Rückweg: fünf vorwärts '
            'macht sieben rückwärts wieder wett, denn 5 + 7 = 12 = 0. Ein '
            'Rechenbereich mit diesen Eigenschaften heißt in der Mathematik eine '
            'Gruppe. Die Stundenuhr ist das anschaulichste Beispiel überhaupt; '
            'ihr Name ist ℤ/12ℤ, gesprochen „Z modulo zwölf".',
      ),
      ProseSection(
        'Welche Schritte alle Felder treffen',
        'Geht man in Einerschritten um den Kreis, trifft man der Reihe nach jede '
            'der zwölf Marken, bevor man wieder am Anfang ist. Das gelingt aber '
            'nicht mit jeder Schrittweite. Springt man immer um drei, landet man '
            'nur auf 0, 3, 6, 9 und ist nach vier Sprüngen zurück — acht Felder '
            'bleiben unberührt. Springt man um vier, trifft man nur 0, 4, 8.\n\n'
            'Alle zwölf Felder erreicht eine Schrittweite genau dann, wenn sie mit '
            'der Zwölf keinen gemeinsamen Teiler hat. Das trifft auf vier Schritte '
            'zu: 1, 5, 7 und B (= elf). Genau vier — das ist kein Zufall, sondern '
            'eine Zählgröße der Zwölf, die uns gleich noch zweimal begegnet. Diese '
            'vier sind die „guten" Schrittweiten, die den ganzen Kreis erzeugen.',
      ),
      ProseSection(
        'Die Untergruppen am Zifferblatt',
        'Die Schrittweiten, die nur einen Teil der Marken treffen, zeichnen aufs '
            'Zifferblatt lauter regelmäßige Figuren. Der Sechserschritt verbindet 0 '
            'und 6 zu einer Linie quer durch die Mitte. Der Viererschritt zeichnet '
            'das Dreieck 0–4–8, der Dreierschritt das Quadrat 0–3–6–9, der '
            'Zweierschritt das Sechseck der geraden Stunden. Jede dieser Figuren '
            'ist selbst wieder eine kleine, in sich geschlossene Uhr — eine '
            'Untergruppe.\n\n'
            'Bemerkenswert: Zu jedem Teiler der Zwölf — 1, 2, 3, 4, 6, 12 — gehört '
            'genau eine solche Figur, nicht mehr und nicht weniger. Die Zwölf hat '
            'so viele Teiler wie keine kleinere Zahl, darum trägt ihr Zifferblatt '
            'so viele saubere Figuren. Eine gedachte Zehn-Stunden-Uhr käme nur auf '
            'die Teiler 1, 2, 5, 10 — kein Dreieck, kein Quadrat. Dieselbe '
            'Teilbarkeit, die die Zwölf als Zählbasis auszeichnet, macht auch ihr '
            'Zifferblatt so reich.',
      ),
      ProseSection(
        'Dieselbe Uhr in der Musik',
        'Die zwölf Halbtöne einer Oktave bilden denselben Kreis: nach zwölf '
            'Halbtonschritten ist man wieder beim Ausgangston, eine Oktave höher. '
            'Eine Melodie in eine andere Tonart zu rücken heißt, alle Töne um '
            'denselben Schritt weiterzudrehen — Addition auf dem Tonkreis.\n\n'
            'Der Quintenzirkel, den Musiker auswendig lernen, ist nichts anderes '
            'als der Siebenerschritt auf diesem Kreis: Eine reine Quinte sind '
            'sieben Halbtöne, und weil die Sieben eine der vier guten Schrittweiten '
            'ist, läuft der Zirkel durch alle zwölf Töne, ehe er sich schließt. Die '
            'Quarte (fünf Halbtöne) dreht denselben Zirkel rückwärts. Schritte mit '
            'gemeinsamem Teiler bleiben dagegen in einer Figur hängen und ergeben '
            'genau die bekannten symmetrischen Akkorde: die große Terz das '
            'Dreieck, der Tritonus die Linie. Warum gerade zwölf Halbtöne und wie '
            'sie klingen, steht im Kapitel über die Zwölf in der Musik; hier zählt '
            'allein, dass es derselbe Kreis ist.',
      ),
      ProseSection(
        'Und in den Primziffern',
        'Noch ein dritter Ort zeigt dieselbe Vierergruppe. Schreibt man Primzahlen '
            'in Basis Zwölf, so endet jede Primzahl über der Drei auf eine der '
            'Ziffern 1, 5, 7 oder B. Andere Endziffern sind unmöglich: Eine Zahl, '
            'die auf 0, 2, 4, 6, 8 oder A endet, ist gerade; eine, die auf 3, 6, 9 '
            'endet, ist durch drei teilbar. Übrig bleiben genau die vier Ziffern, '
            'die mit der Zwölf keinen Teiler gemein haben — wieder 1, 5, 7, B.\n\n'
            'Es sind dieselben vier wie die guten Schrittweiten und die '
            'Zirkel-erzeugenden Intervalle. Eine Endziffer aus dieser Vierergruppe '
            'ist allerdings nur eine notwendige Bedingung, kein Beweis: 25 endet in '
            'Basis Zwölf auf 1, ist aber fünf mal fünf. Die Ziffer schließt viele '
            'Zahlen als Primzahl aus, sie krönt aber keine.',
      ),
      ProseSection(
        'Addieren immer, teilen nicht immer',
        'Auf der Stundenuhr kann man auch multiplizieren — und hier hört die schöne '
            'Geschlossenheit auf. Beim Addieren hat jeder Schritt einen Rückweg; '
            'beim Multiplizieren nicht. Es gibt keine Stunde, mit der man die Zwei '
            'multiplizieren könnte, um glatt bei der Eins zu landen, denn das '
            'Doppelte ist immer gerade. Die Zwei hat auf der Zwölferuhr keinen '
            'Kehrwert.\n\n'
            'Einen Kehrwert haben nur die vier guten Zahlen 1, 5, 7, B — und jede '
            'ist ihr eigener: fünf mal fünf ist 25, das ist 1 auf der Zwölferuhr; '
            'ebenso sieben mal sieben und B mal B. Hätte die Uhr eine '
            'Primzahl-Stundenzahl wie elf oder dreizehn, dann hätte jede Stunde '
            'einen Kehrwert. Die Zwölf ist dafür zu teilbar — derselbe Reichtum an '
            'Teilern, der ihr Zifferblatt schmückt, nimmt ihr die glatte Division. '
            'Das ist kein Mangel, sondern das Wesen zusammengesetzter Zahlen; einer '
            'Zehneruhr ginge es genauso.',
      ),
      ProseSection(
        'Modulo zwölf ist nicht Basis zwölf',
        'Ein letzter, wichtiger Unterschied, der leicht durcheinandergerät. Die '
            'Uhr rechnet „modulo zwölf" — sie behält nur den Rest beim Teilen durch '
            'zwölf. Das ist etwas anderes als „Basis Zwölf", die Schreibweise '
            'dieses Rechners, bei der die Stellen für Einer, Zwölfer, Gross und so '
            'weiter stehen. Modulo sagt, in welche Restklasse eine Zahl fällt; '
            'Basis sagt, wie man sie aufschreibt.\n\n'
            'Beide drehen sich um die Zahl zwölf, aber aus demselben tieferen Grund '
            '— ihren vielen Teilern —, nicht weil sie dasselbe wären. Man rechnet '
            'jeden Tag modulo zwölf auf der Uhr und schreibt die Zeit trotzdem im '
            'Zehnersystem. Diese Art Rest-Rechnung führte Carl Friedrich Gauss 1801 '
            'als eigene Schreibweise ein; heute steckt sie unsichtbar in '
            'Prüfziffern von Buchnummern und Konten und in jeder Wochentagsformel.',
      ),
    ],
    sources: [
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A1',
      ),
      Source(
        'Cyclic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_group',
        'R2',
        'A1',
      ),
      Source(
        'Subgroups of cyclic groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Subgroups_of_cyclic_groups',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A1',
      ),
      Source(
        'Circle of fifths — Wikipedia',
        'https://en.wikipedia.org/wiki/Circle_of_fifths',
        'R2',
        'A1',
      ),
      Source(
        'Pitch class — Wikipedia',
        'https://en.wikipedia.org/wiki/Pitch_class',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Disquisitiones Arithmeticae — Wikipedia',
        'https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    '12! und die Reihenfolgen',
    [
      ProseSection(
        'Wie viele Reihenfolgen?',
        'Wie viele Möglichkeiten gibt es, ein Dutzend Dinge in eine Reihe zu '
            'legen — zwölf Gäste an eine Tafel, die zwölf Monate auf eine Liste, '
            'zwölf Bücher ins Regal? Für den ersten Platz hat man zwölf Kandidaten, '
            'für den zweiten noch elf, dann zehn, und so fort bis zum letzten, für '
            'den nur noch einer übrig ist. Man multipliziert alle Möglichkeiten: '
            '12 · 11 · 10 · … · 2 · 1.\n\n'
            'Dieses Produkt aller Zahlen von 1 bis zwölf schreibt man kurz „12!" '
            'und nennt es Zwölf-Fakultät. Allgemein ist n! das Produkt aller Zahlen '
            'von 1 bis n und zählt die Reihenfolgen von n Dingen. Eine Kuriosität '
            'am Rand: 0! ist als 1 festgelegt — es gibt genau eine Art, gar nichts '
            'anzuordnen, nämlich die leere.',
      ),
      ProseSection(
        'Die Zahl 12!',
        'Ausgerechnet ist 12! = 479001600 im Zehnersystem — knapp eine halbe '
            'Milliarde Reihenfolgen für nur zwölf Dinge. In Basis Zwölf schreibt '
            'sich dieselbe Zahl als 114500000, mit fünf Nullen am Ende. Diese '
            'Nullen sind ein Heimspiel der Zwölf: weil 12! die Faktoren Zwei und '
            'Drei so oft enthält und jede dieser Endnullen genau eine Zwölf '
            'abspaltet, gehen fünf davon glatt auf. Im Zehnersystem endet 12! nur '
            'auf zwei Nullen.\n\n'
            'Wie groß ist eine halbe Milliarde Reihenfolgen? Zeigte man jede '
            'Sekunde eine neue, wäre man erst nach gut fünfzehn Jahren durch. Sitzt '
            'die Dutzendrunde dagegen an einem runden Tisch, bei dem nur die '
            'Nachbarschaft zählt und nicht der Startplatz, schrumpft die Zahl auf '
            'elf Fakultät — knapp vierzig Millionen. Den Rechner kann man fragen: '
            'Die Fakultäts-Taste liefert 12! sofort in Basis Zwölf.',
      ),
      ProseSection(
        'Auswahl mit und ohne Reihenfolge',
        'Oft will man nicht alle zwölf ordnen, sondern nur einige auswählen — und '
            'dann macht es einen Unterschied, ob die Reihenfolge zählt. Drei Läufer '
            'aufs Treppchen (Gold, Silber, Bronze) aus zwölf: 12 · 11 · 10 = 1320 '
            'geordnete Möglichkeiten. Eine Reihenfolge zählt hier, denn Erster und '
            'Zweiter sind nicht dasselbe.\n\n'
            'Wählt man dagegen sechs aus zwölf nur als Gruppe, ohne Rangfolge — '
            'etwa sechs Freiwillige —, sind es 924 Möglichkeiten; zwei aus zwölf '
            'als Paar sind 66. Beide Zählweisen ruhen auf der Fakultät. Im '
            'Sprachgebrauch werden sie gern verwechselt: Ein „Zahlenschloss" '
            'verlangt in Wahrheit eine bestimmte Reihenfolge — es müsste '
            'Reihenfolge-Schloss heißen.',
      ),
      ProseSection(
        'Glocken, die alle Reihenfolgen läuten',
        'In englischen Kirchtürmen gibt es eine alte Kunst, die genau dies tut: '
            'das Wechselläuten. Statt Melodien läuten die Glöckner ihre Glocken in '
            'immer neuen Reihenfolgen, jede Reihenfolge genau einmal. Bei jedem '
            'Wechsel darf jede Glocke nur um eine Position rücken — eine '
            'körperliche Fassung des Vertauschens benachbarter Elemente, die '
            'Glöckner schon um 1621 beherrschten, lange bevor Mathematiker '
            'denselben Trick beschrieben.\n\n'
            'Für jede Glockenzahl gibt es einen Namen; zwölf Glocken heißen '
            'Maximus. Alle Reihenfolgen von zwölf Glocken zu läuten hieße, 12! = '
            'rund 479 Millionen Wechsel zu durchlaufen — bei zwei Sekunden je '
            'Wechsel wären das Jahrzehnte ununterbrochenen Läutens. Das hat nie '
            'jemand vollbracht und gilt als unmöglich; die längsten wirklich '
            'geläuteten Stücke auf zwölf Glocken erreichen nur einige Zehntausend '
            'Wechsel. Vollständig durchgeläutet wurde ein Extent nur auf acht '
            'Glocken: 40320 Wechsel, knapp achtzehn Stunden, 1963 in Loughborough.',
      ),
      ProseSection(
        'Aus der Zahl wird eine Gruppe',
        'Sammelt man alle 12! Umordnungen eines Dutzends und versteht „erst die '
            'eine, dann die andere" als Rechenregel, entsteht wieder eine Gruppe — '
            'die volle Umordnungsgruppe der zwölf Dinge. Anders als auf der '
            'Stundenuhr kommt es hier auf die Reihenfolge der Schritte an: zuerst '
            'tauschen, dann schieben ergibt etwas anderes als umgekehrt. Diese '
            'Gruppe ist riesig und nicht vertauschbar.\n\n'
            'In ihr versteckt sich ein letztes Staunen. Unter den fast '
            'fünfhundert Millionen Umordnungen gibt es eine winzige, '
            'außergewöhnlich regelmäßige Auswahl von nur 95040 Stück, die fünf '
            'beliebige der zwölf Punkte auf fünf beliebige Ziele genau auf eine '
            'einzige Weise schiebt. Dass auf gerade zwölf Punkten so etwas '
            'überhaupt möglich ist, gehört zu den seltensten Erscheinungen der '
            'Mathematik — und ist das Thema des nächsten Kapitels.',
      ),
    ],
    sources: [
      Source(
        'Factorial — Wikipedia',
        'https://en.wikipedia.org/wiki/Factorial',
        'R2',
        'A1',
      ),
      Source(
        'Permutation — Wikipedia',
        'https://en.wikipedia.org/wiki/Permutation',
        'R2',
        'A1',
      ),
      Source(
        'Combination — Wikipedia',
        'https://en.wikipedia.org/wiki/Combination',
        'R2',
        'A1',
      ),
      Source(
        'Change ringing — Wikipedia',
        'https://en.wikipedia.org/wiki/Change_ringing',
        'R2',
        'A1',
      ),
      Source(
        'Extent (change ringing) — Wikipedia',
        'https://en.wikipedia.org/wiki/Extent_(change_ringing)',
        'R2',
        'A1',
      ),
      Source(
        'Symmetric group — Wikipedia',
        'https://en.wikipedia.org/wiki/Symmetric_group',
        'R2',
        'A1',
      ),
      Source(
        'Steinhaus–Johnson–Trotter algorithm — Wikipedia',
        'https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Die Mathieu-Gruppe M₁₂',
    [
      ProseSection(
        'Eine Auswahl unter fast einer halben Milliarde',
        'Das vorige Kapitel endete mit einem Versprechen: Unter den fast '
            'fünfhundert Millionen Umordnungen eines Dutzends gibt es eine winzige '
            'Auswahl von genau 95040, die etwas fast Unglaubliches kann. Wähle '
            'fünf der zwölf Punkte und sage, wohin jeder einzelne soll — dann gibt '
            'es unter diesen 95040 Umordnungen genau eine, die das tut. Nicht '
            'zwei, nicht keine: genau eine.\n\n'
            'Aus dieser einen Eigenschaft folgt schon die ganze Anzahl. Für das '
            'Ziel des ersten Punktes hat man zwölf Wahlmöglichkeiten, für den '
            'zweiten elf, dann zehn, neun, acht — und damit liegt der Rest fest. '
            'Zwölf mal elf mal zehn mal neun mal acht ergibt 95040. Diese seltene '
            'Sammlung von Umordnungen trägt einen Namen: die Mathieu-Gruppe M₁₂.',
      ),
      ProseSection(
        'Das Steiner-System S(5,6,12)',
        'Was halten diese 95040 Umordnungen unverrückbar fest? Eine zierliche '
            'kombinatorische Figur. Man kann aus zwölf Punkten gewisse '
            'Sechsergruppen so auswählen, dass jede beliebige Auswahl von fünf '
            'Punkten in genau einer dieser Sechsergruppen enthalten ist. Es gibt '
            'davon genau 132 Sechsergruppen, und diese Anordnung ist bis auf '
            'Umbenennung der Punkte die einzig mögliche.\n\n'
            'Dieses fein austarierte Gebilde heißt das Steiner-System S(5,6,12). '
            'Die Mathieu-Gruppe ist genau die Menge der Umordnungen, die alle 132 '
            'Sechsergruppen wieder auf Sechsergruppen abbilden — die Symmetrien '
            'dieser Figur. Die zwei Zahlen, 132 Sechsergruppen und 95040 '
            'Symmetrien, sind in Basis Zwölf übrigens B0 und 47000.',
      ),
      ProseSection(
        'Warum gerade die Zwölf',
        'Das eigentlich Erstaunliche ist nicht, dass M₁₂ so regelmäßig ist, '
            'sondern wie selten solche Regelmäßigkeit überhaupt vorkommt. Camille '
            'Jordan bewies 1872: Sieht man von den naheliegenden, gewöhnlichen '
            'Fällen ab, so ist eine Umordnungsmenge, die fünf Punkte auf genau '
            'eine Weise frei platzieren kann, nur auf einer einzigen Punktzahl '
            'möglich — auf zwölf. Die entsprechende Sache für vier Punkte gibt es '
            'als Ausnahme nur auf elf Punkten.\n\n'
            'Auf gerade elf und zwölf Punkten — und sonst nirgends jenseits der '
            'gewöhnlichen Fälle — existieren diese außergewöhnlich vollkommenen '
            'Symmetrien. Die Zwölf ist damit eine von nur einer Handvoll Zahlen, '
            'die so etwas tragen. Das ist ein klares mathematisches Ergebnis, '
            'keine Zahlenmystik — aber ein Grund zum Staunen.',
      ),
      ProseSection(
        'Die erste ihrer Art',
        'Endliche Gruppen haben Bausteine, die sich nicht weiter zerlegen lassen — '
            'die einfachen Gruppen, die Atome der Gruppentheorie. „Einfach" meint '
            'hier unzerlegbar, nicht leicht. Die meisten dieser Atome gehören zu '
            'wenigen unendlichen Familien; daneben stehen genau sechsundzwanzig '
            'Einzelgänger, die sporadischen Gruppen. M₁₂ ist einer von ihnen.\n\n'
            'Émile Mathieu beschrieb M₁₂ schon 1861 — es war die allererste '
            'sporadische Gruppe, die je gefunden wurde, fast hundert Jahre vor dem '
            'Rest. Ihre Existenz blieb lange umstritten, manche Fachleute '
            'bezweifelten sie; erst Ernst Witt stellte sie 1938 auf sicheren '
            'Boden. Die Reihe der sporadischen Gruppen, die mit M₁₂ begann, endet '
            'beim sagenhaft großen „Monster", und ihre vollständige Auflistung '
            'gehört zu den größten Gemeinschaftswerken der Mathematik überhaupt.',
      ),
      ProseSection(
        'Zum Anfassen: Karten und ein Spiel',
        'So abstrakt das klingt — es gibt greifbare Zugänge. Mischt man zwölf '
            'Spielkarten auf zwei bestimmte, immer gleiche Weisen wieder und '
            'wieder, so erzeugt man berichteten Quellen zufolge genau die '
            'Umordnungen der Mathieu-Gruppe. Und der Mathematiker John Conway '
            'erfand ein „mathematisches Blackjack" mit den zwölf Zahlen Null bis '
            'B, dessen Gewinnstrategie unmittelbar auf den 132 Sechsergruppen '
            'beruht.\n\n'
            'Ehrlich bleibt: Dieses Kapitel hat kaum eine Taste im Rechner, die '
            'ihm entspricht — es ist reine Theorie-Schönheit, kein Werkzeug. Aber '
            'manchmal ist genau das der Reiz: dass ausgerechnet die Zwölf, die '
            'diesem Rechner ihren Takt gibt, eine der wenigen Zahlen ist, auf '
            'denen die Mathematik eine derart seltene, vollkommene Symmetrie '
            'versteckt hat.',
      ),
    ],
    sources: [
      Source(
        'Mathieu group M12 — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group_M12',
        'R2',
        'A1',
      ),
      Source(
        'Mathieu group — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group',
        'R2',
        'A1',
      ),
      Source(
        'Steiner system — Wikipedia',
        'https://en.wikipedia.org/wiki/Steiner_system',
        'R2',
        'A1',
      ),
      Source(
        'Sporadic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Sporadic_group',
        'R2',
        'A1',
      ),
      Source(
        'Multiply transitive group — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiply_transitive_group',
        'R2',
        'A1',
      ),
      Source(
        'Classification of finite simple groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups',
        'R2',
        'A1',
      ),
      Source(
        'Émile Léonard Mathieu — Wikipedia',
        'https://en.wikipedia.org/wiki/%C3%89mile_L%C3%A9onard_Mathieu',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Das Zwölfeck (Dodekagon)',
    [
      ProseSection(
        'Was ein regelmäßiges Zwölfeck ist',
        'Ein regelmäßiges Zwölfeck (griechisch Dodekagon: dōdeka = zwölf, '
            'gōnía = Winkel) ist ein Vieleck mit zwölf gleich langen Seiten und '
            'zwölf gleich großen Innenwinkeln. Alle zwölf Ecken liegen gleich '
            'verteilt auf einem Kreis, dem Umkreis, je 30° voneinander '
            'entfernt.\n\n'
            'Jeder Innenwinkel misst genau 150°. Das folgt aus einer einfachen '
            'Überlegung: Geht man die Figur einmal ganz herum ab, dreht man sich '
            'an den zwölf Ecken zusammen um volle 360°, also 30° je Ecke. Dieser '
            'Außenwinkel und der Innenwinkel ergänzen sich zu 180°, somit bleibt '
            '180° − 30° = 150°. Im Dozenalsystem schreibt sich 150° als 106°, '
            'der Außenwinkel 30° als 26°. Alle Winkel, die im Zwölfeck '
            'vorkommen, sind Vielfache von 15° — dozenal 13°.\n\n'
            'Das Zwölfeck zählt zu den Formen, die sich mit Zirkel und Lineal '
            'exakt zeichnen lassen. Der Weg ist kurz: einen Kreis schlagen, ihn '
            'in sechs gleiche Teile teilen (das gelingt mit dem Zirkel allein, '
            'weil beim Sechseck die Seite genau dem Radius gleicht), dann jeden '
            'der sechs Bögen halbieren — fertig sind zwölf gleichmäßig verteilte '
            'Punkte. Dass das geht, ist kein Zufall: Ein regelmäßiges n-Eck ist '
            'genau dann konstruierbar, wenn n aus einer Zweierpotenz und '
            'verschiedenen sogenannten Fermat-Primzahlen besteht (Satz von Gauß '
            'und Wantzel). Für 12 = 2² × 3 ist das erfüllt, weil 3 eine solche '
            'Primzahl ist.',
      ),
      ProseSection(
        'Drei Vielecke teilen sich die Ecken',
        'Das Bemerkenswerte am Zwölfeck ist weniger seine Form als das, was in '
            'ihm steckt. Verbindet man nur jede zweite seiner Ecken, entsteht '
            'ein regelmäßiges Sechseck. Jede dritte Ecke ergibt ein Quadrat, '
            'jede vierte ein gleichseitiges Dreieck — alle drei exakt, nicht '
            'angenähert, und alle auf demselben Umkreis wie das Zwölfeck '
            'selbst.\n\n'
            'Dahinter steht eine allgemeine Regel: Ein regelmäßiges m-Eck passt '
            'genau dann mit denselben Eckpunkten in ein n-Eck, wenn m die Zahl n '
            'teilt; man verbindet dann jede (n/m)-te Ecke. Sechseck, Quadrat und '
            'Dreieck stecken im Zwölfeck, weil 12 durch 6, 4 und 3 teilbar ist. '
            'Und 12 ist die kleinste Zahl, die durch 3, 4 und 6 zugleich teilbar '
            'ist — ihr kleinstes gemeinsames Vielfaches. Darum ist das Zwölfeck '
            'das kleinste reguläre Vieleck, das diese drei Grundfiguren '
            'gemeinsam enthält; ein Fünf-, Acht- oder Zehneck kann das nicht.\n\n'
            'Es ist genau dieselbe Teilbarkeit, die das Dozenalsystem so '
            'angenehm macht. Dass 12 durch 2, 3, 4 und 6 aufgeht, lässt '
            'geometrisch die drei Vielecks in einem Zwölfeck zusammenfallen — '
            'und macht arithmetisch die Brüche ein Halb, ein Drittel, ein '
            'Viertel und ein Sechstel zu kurzen, glatten Zwölferbrüchen. Form '
            'und Bruchrechnung haben dieselbe Wurzel.',
      ),
      ProseSection(
        'Vierundfünfzig Diagonalen, sechs Längen',
        'Eine Diagonale verbindet zwei Ecken, die nicht benachbart sind. Die '
            'Formel n(n−3)/2 liefert für das Zwölfeck 12 × 9 / 2 = 54 '
            'Diagonalen. Das wirkt unübersichtlich, ist aber streng geordnet: '
            'Weil das Zwölfeck so symmetrisch ist, sind alle Diagonalen, die '
            'gleich viele Ecken überspringen, gleich lang. Es gibt fünf solche '
            'Sprungweiten und dazu den Durchmesser — also nur sechs '
            'verschiedene Längen. Bei Seitenlänge 1:\n\n'
            'd₂ überspringt eine Ecke und misst √(2+√3) ≈ 1,932. d₃ überspringt '
            'zwei Ecken, 1+√3 ≈ 2,732. d₄ überspringt drei Ecken, (3√2+√6)/2 ≈ '
            '3,346. d₅ überspringt vier Ecken, 2+√3 ≈ 3,732. d₆ schließlich '
            'verbindet gegenüberliegende Ecken — das ist der Durchmesser, √6+√2 '
            '≈ 3,864.\n\n'
            'In diesen Werten verstecken sich saubere Muster. Die fünfte und die '
            'dritte Diagonale unterscheiden sich um genau die Seitenlänge: '
            '(2+√3) − (1+√3) = 1. Und der Durchmesser ist exakt doppelt so lang '
            'wie die kürzeste Diagonale, d₆ = 2 · d₂ — dasselbe Verhältnis 2:1 '
            'wie die Oktave in der Musik. Alle Winkel zwischen den Diagonalen '
            'sind dabei wieder Vielfache von 15°, denn die zwölf Ecken zerlegen '
            'den Vollkreis in Schritte von 30°.',
      ),
      ProseSection(
        'Die Fläche und die „runde Drei"',
        'Um die Fläche zu finden, zerlegt man das Zwölfeck vom Mittelpunkt aus '
            'in zwölf gleiche, schmale Dreiecke. Jedes hat zwei Schenkel der '
            'Länge R — das ist der Umkreisradius, der Abstand vom Mittelpunkt zu '
            'einer Ecke — und an der Spitze den Winkel 30°. Rechnet man die '
            'zwölf Dreiecke zusammen, fällt etwas Schönes heraus:\n\n'
            'A = 3 · R².\n\n'
            'Der Faktor ist eine glatte, ganze Drei, ganz ohne Wurzel. Das '
            'gelingt, weil in der Rechnung sin(30°) = ein Halb auftritt, und 30° '
            'ist gerade der Eckenwinkel des Zwölfecks. Unter den mit Zirkel und '
            'Lineal zeichenbaren Vielecken ist es das einzige größere, bei dem '
            'die Flächenformel so glatt aufgeht; beim Sechseck etwa bleibt eine '
            'Wurzel stehen. Rechnet man lieber mit der Seitenlänge s, lautet die '
            'Fläche A = 3(2+√3)·s² ≈ 11,196·s².\n\n'
            'Setzt man die Fläche ins Verhältnis zum Umkreis, dessen Fläche π·R² '
            'beträgt, kürzt sich R² heraus und es bleibt genau 3/π ≈ 0,9549. Das '
            'Zwölfeck füllt seinen Umkreis also zu rund 95,5 % aus — viel mehr '
            'als ein Sechseck (etwa 83 %), ein Quadrat (rund 64 %) oder ein '
            'Dreieck (rund 41 %). Statt der krummen Kreiszahl π steht hier die '
            'runde Drei: Bei R = 1 ist die Zwölfeckfläche exakt 3 und liegt damit '
            'knapp unter π ≈ 3,1416.\n\n'
            'Diese Nähe nutzte schon Archimedes. Er näherte π über Vielecke an, '
            'begann beim leicht zu zeichnenden Sechseck und verdoppelte die '
            'Eckenzahl: 6, 12, 24, 48, 96. Das Zwölfeck war sein erster Schritt. '
            'Das 96-Eck — dozenal gesehen 12 × 8 — füllt den Kreis schon zu '
            '99,93 % und lieferte ihm 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Wo das Zwölfeck als Form auftaucht',
        'Die zwölf Stundenmarken einer Analoguhr bilden ein regelmäßiges '
            'Zwölfeck: zwölf Punkte im Abstand von 30° auf dem Kreis. Dass der '
            'Vollkreis 360° = 12 × 30° umfasst und der Tag zweimal zwölf Stunden '
            'hat, ist derselbe 30°-Raster, den auch Kompassrosen für zwölf '
            'Richtungen nutzen.\n\n'
            'Mehrere Länder prägten zwölfseitige Münzen — vor allem, damit sie '
            'sich durch ihre Form von runden Münzen ertasten lassen. Der '
            'britische „Threepence" aus Messing (ab 1937) war das erste '
            'nicht-runde Umlaufstück Großbritanniens; das zwölfseitige '
            'Pfundstück (ab 2017) wurde gegen Fälschungen eingeführt und bewusst '
            'nach diesem Vorbild gestaltet. Anders als manchmal behauptet haben '
            'solche Münzen keine gleichmäßige Breite — diese Eigenschaft tragen '
            'die siebenseitigen britischen 20- und 50-Pence-Stücke, die keine '
            'Zwölfecke sind.\n\n'
            'Allein parkettiert das Zwölfeck die Ebene nicht: 150° geht nicht '
            'glatt in 360° auf. Zusammen mit anderen Vielecken aber schon — etwa '
            'mit Dreiecken oder mit Quadraten und Sechsecken, deren Winkel sich '
            'an jeder Ecke zu 360° ergänzen. Solche zwölfzähligen Muster bilden '
            'eine Grundlage der islamischen Geometrie-Ornamentik. Wie die Zwölf '
            'darüber hinaus ins Bauen und in die Kunst gelangt ist, behandelt '
            'das Kapitel „Die Zwölf im Bauen".',
      ),
      ProseSection(
        'Geometrie, nicht Zahlenmystik',
        'Die Eigenschaften des Zwölfecks sind echte mathematische Tatsachen, '
            'keine Geheimnisse. Dass die Fläche im Verhältnis 3/π zum Umkreis '
            'steht, folgt zwingend aus sin(30°) = ein Halb; es zeigt nur, dass '
            'das Zwölfeck den Kreis gut annähert, und stiftet keine geheime '
            'Verbindung zwischen der Drei und π. Ebenso ist die einfache Drei in '
            '„Fläche = 3·R²" eine Folge des Eckenwinkels, kein Wunder.\n\n'
            'Auch der Satz „A = 3·R²" verlangt die richtige Lesart: Die glatte '
            'Drei gilt für den Umkreisradius. Bei Seitenlänge 1 ist die Fläche '
            'rund 11,2, nicht 3. Und bei den Diagonalen lohnt Genauigkeit — die '
            'vierte ist (3√2+√6)/2 ≈ 3,346, kein einfacherer Wurzelausdruck; '
            'hier kursieren in manchen Quellen falsche Werte.\n\n'
            'Schließlich sagt die leichte Konstruierbarkeit nur, dass die Form '
            'mit einfachem Werkzeug entsteht. Sie erklärt gut, warum Zwölfecke '
            'im Handwerk, auf Münzen und im Ornament so häufig sind. Warum aber '
            'die Uhr zwölf Stunden hat, ist eine Frage der Tradition, nicht der '
            'Geometrie. Das Zwölfeck ist ein schönes geometrisches Werkzeug — '
            'und nichts weiter sollte man ihm andichten.',
      ),
    ],
    sources: [
      Source(
        'Dodecagon — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Constructible polygon — Wikipedia',
        'https://en.wikipedia.org/wiki/Constructible_polygon',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagon (12-gon) calculator and formulas — RedCrab Software',
        'https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Area of a Dodecagon — Alison Kiddle',
        'https://alisonkiddle.co.uk/area-of-a-dodecagon/',
        'R3',
        'A1',
      ),
      Source(
        'Getting Closer to π: Inscribing and Circumscribing Polygons — Univ. Alberta',
        'https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf',
        'R3',
        'A1',
      ),
      Source(
        'Archimedes on the Circumference and Area of a Circle — AMS Feature Column',
        'https://www.ams.org/publicoutreach/feature-column/fc-2012-02',
        'R2',
        'A1',
      ),
      Source(
        'Brass threepence — Wikipedia',
        'https://en.wikipedia.org/wiki/Brass_threepence',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagonal coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagonal_coin',
        'R2',
        'A1',
      ),
    ],
    imageId: 'math/dodekagon',
  ),
  ProseChapter(
    'Archimedische Parkettierungen',
    [
      ProseSection(
        'Das Zwölfeck füllt die Ebene nicht allein',
        'Ein regelmäßiges Zwölfeck ist eine schöne, runde Figur — aber es kann '
            'einen Boden nicht für sich allein lückenlos auslegen. Der Grund ist '
            'sein Innenwinkel von 150 Grad. Um eine Ecke herum müssen sich die '
            'anliegenden Figuren genau zu 360 Grad ergänzen, doch 360 geteilt '
            'durch 150 ergibt zwei Komma vier — keine ganze Zahl. Zwei Zwölfecke '
            'lassen an einer Ecke eine Lücke, drei überlappen sich.\n\n'
            'Das Zwölfeck braucht also Partner. Setzt man die richtigen Figuren '
            'dazwischen, entstehen lückenlose, hochregelmäßige Muster — '
            'archimedische Parkettierungen. So heißen die Pflasterungen der Ebene, '
            'die nur aus regelmäßigen Vielecken bestehen und an jeder Ecke gleich '
            'aussehen. Es gibt im Ganzen nur elf solche Muster.',
      ),
      ProseSection(
        'Zwei Muster mit Zwölfeck',
        'Von diesen elf Mustern enthalten genau zwei ein regelmäßiges Zwölfeck. Im '
            'ersten füllen kleine gleichseitige Dreiecke die Zwickel zwischen den '
            'Zwölfecken — an jeder Ecke treffen ein Dreieck und zwei Zwölfecke '
            'zusammen, und ihre Winkel ergeben 60 plus 150 plus 150, also genau '
            '360 Grad.\n\n'
            'Das zweite ist das reichere und in der Abbildung gezeigte: Um jedes '
            'Zwölfeck legt sich ein Kranz aus abwechselnd Quadraten und Sechsecken. '
            'An jeder Ecke treffen ein Quadrat, ein Sechseck und ein Zwölfeck '
            'zusammen — 90 plus 120 plus 150 Grad, wieder genau 360. Weil die Summe '
            'aufgeht, schließt der Kranz ohne jede Lücke, und das Muster setzt sich '
            'in alle Richtungen fort.',
      ),
      ProseSection(
        'Warum nur Drei, Vier, Sechs passen',
        'Neben ein Zwölfeck passen nur drei Sorten von Nachbarn: Dreiecke, '
            'Quadrate und Sechsecke. Das ist kein Zufall. Ihre Innenwinkel sind 60, '
            '90 und 120 Grad — und das sind gerade 360 geteilt durch sechs, durch '
            'vier und durch drei. Es treten also genau die Teiler drei, vier und '
            'sechs der Zwölf auf.\n\n'
            'Dieselben drei Teiler sind es, die in Basis Zwölf die Brüche ein '
            'Drittel, ein Viertel und ein Sechstel glatt aufgehen lassen. Die '
            'schöne Pflasterung und der bequeme Bruch entspringen derselben '
            'Wurzel: der reichen Teilbarkeit der Zwölf. Das ist eine echte '
            'Verwandtschaft, aber kein Zwang — die Winkel kommen aus der Geometrie, '
            'die glatten Brüche aus der Schreibweise; beide hängen nur an '
            'derselben Zahl.',
      ),
      ProseSection(
        'Kepler, Moscheen und Kristalle',
        'Vollständig aufgezählt hat diese Muster zuerst Johannes Kepler im Jahr '
            '1619, in einem Werk über die Harmonie der Welt. Der Name '
            '„archimedisch" ist dabei nur eine Anlehnung an die archimedischen '
            'Körper; eine antike Schrift, in der Archimedes selbst Parkettierungen '
            'behandelt hätte, ist nicht überliefert.\n\n'
            'Lange vor Kepler aber lebte das Zwölfeck schon in der Kunst: '
            'Zwölfzackige Sterne gehören zu den prächtigsten Motiven der '
            'islamischen Ornamentik, mit Zirkel und Lineal aus reiner Geometrie '
            'gebaut — früh etwa an der Moschee von Konya (1220). Und in der Natur '
            'kehrt dieselbe zwölfzählige Ordnung in den Quasikristallen wieder, von '
            'denen ein eigenes Kapitel erzählt. Das Zwölfeck, das allein keinen '
            'Boden füllt, ist im Verbund eine der fruchtbarsten Formen der Fläche.',
      ),
    ],
    sources: [
      Source(
        'Euclidean tilings by convex regular polygons — Wikipedia',
        'https://en.wikipedia.org/wiki/Euclidean_tilings_by_convex_regular_polygons',
        'R2',
        'A1',
      ),
      Source(
        'Truncated hexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_hexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Truncated trihexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_trihexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Archimedean Tilings and Egyptian Fractions (John Baez)',
        'https://math.ucr.edu/home/baez/egyptian.html',
        'R3',
        'A1',
      ),
      Source(
        'Islamic geometric patterns — Wikipedia',
        'https://en.wikipedia.org/wiki/Islamic_geometric_patterns',
        'R2',
        'A1',
      ),
      Source(
        'Harmonices Mundi — Wikipedia',
        'https://en.wikipedia.org/wiki/Harmonices_Mundi',
        'R2',
        'A2',
      ),
    ],
    imageId: 'math/parkettierung',
  ),
  ProseChapter(
    'Der Dodekaeder',
    [
      ProseSection(
        'Zwölf Fünfecke im Raum',
        'Der Dodekaeder (griechisch dōdeka = zwölf, hédra = Fläche) ist ein '
            'Körper aus zwölf gleichen, regelmäßigen Fünfecken. Alle Flächen '
            'sind identisch, alle Kanten gleich lang, und an jeder Ecke treffen '
            'genau drei Fünfecke zusammen. Gezählt ergibt das zwölf Flächen, '
            'dreißig Kanten und zwanzig Ecken.\n\n'
            'Er ist einer der fünf platonischen Körper — der konvexen Körper, '
            'deren Flächen ausschließlich aus gleichen, regelmäßigen Vielecken '
            'bestehen und an deren Ecken überall gleich viele Flächen '
            'zusammenstoßen. Die anderen vier sind der Tetraeder (vier '
            'Dreiecke), der Würfel (sechs Quadrate), der Oktaeder (acht '
            'Dreiecke) und der Ikosaeder (zwanzig Dreiecke). Unter diesen fünf '
            'ist der Dodekaeder der einzige mit fünfeckigen Flächen.\n\n'
            'Knapp beschrieben heißt der Dodekaeder {5, 3}: Fünfecke als '
            'Flächen, drei davon an jeder Ecke. Der Winkel zwischen zwei '
            'benachbarten Flächen beträgt etwa 116,57° (dezimal). Zum '
            'Vergleich: beim Würfel sind es 90°.',
      ),
      ProseSection(
        'Warum es genau fünf gibt',
        'Dass es nur fünf solcher Körper geben kann — nicht mehr und nicht '
            'weniger —, ist ein bewiesenes Ergebnis. Zwei Wege führen zu ihm, '
            'und beide laufen auf dasselbe hinaus.\n\n'
            'Der erste Weg ist eine schlichte Abzählung, der Eulersche '
            'Polyedersatz: Für jeden konvexen Körper gilt Ecken minus Kanten '
            'plus Flächen gleich zwei. Beim Dodekaeder: 20 − 30 + 12 = 2. '
            'Leonhard Euler hielt diese Beziehung um 1750 fest; den ersten '
            'lückenlosen Beweis lieferte Cauchy 1811. Die Formel gilt für jeden '
            'löcherfreien konvexen Körper, für jede Pyramide, jedes Prisma. '
            'Setzt man sie mit der Forderung zusammen, dass die Flächen gleiche '
            'regelmäßige Vielecke sind, bleiben genau fünf Lösungen übrig.\n\n'
            'Der zweite Weg ist anschaulicher und betrachtet eine einzelne '
            'Ecke. Der Innenwinkel eines regelmäßigen Fünfecks ist 108°. '
            'Treffen an einer Ecke drei Fünfecke zusammen, summieren sich ihre '
            'Winkel zu 324°. Die fehlenden 36° bis zum vollen Kreis sind genau '
            'die Lücke, die sich zum Raum hin faltet — so entsteht eine Ecke '
            'des Dodekaeders. Vier Fünfecke ergäben schon 432° und passten '
            'nicht mehr in eine Ecke. Darum sind drei Fünfecke die einzige '
            'Möglichkeit, und der Dodekaeder der einzige Körper mit fünfeckigen '
            'Flächen.',
      ),
      ProseSection(
        'Der Goldene Schnitt im Fünfeck und im Körper',
        'Jede Fläche des Dodekaeders ist ein regelmäßiges Fünfeck — und das '
            'Fünfeck ist der einfachste ebene Ort, an dem der Goldene Schnitt '
            'φ = (1+√5)/2 ≈ 1,618 als Streckenverhältnis auftritt. Die '
            'Diagonale eines regelmäßigen Fünfecks ist genau φ-mal so lang wie '
            'seine Seite. Wer im Rechner φ² = tippt, erhält φ+1 — das ist die '
            'definierende Gleichung des Goldenen Schnitts.\n\n'
            'Weil jede Fläche dieses Verhältnis trägt, durchzieht φ den ganzen '
            'Körper. Legt man den Dodekaeder in ein Koordinatensystem, '
            'erscheint φ buchstäblich in den Zahlen seiner zwanzig Ecken. Acht '
            'dieser Ecken bilden für sich einen Würfel; insgesamt lassen sich '
            'fünf verschiedene Würfel in den Dodekaeder einschreiben. Andere '
            'Eckpunkte spannen drei goldene Rechtecke auf — Rechtecke mit dem '
            'Seitenverhältnis φ zu eins —, die paarweise senkrecht aufeinander '
            'stehen.\n\n'
            'φ erscheint hier nicht aus Zauberei, sondern aus Notwendigkeit: '
            'Wo regelmäßige Fünfecke sind, ist φ. Die weitergehenden Deutungen '
            'des Goldenen Schnitts als „göttliche Proportion" sind menschliche '
            'Zuschreibungen, keine Eigenschaft der Geometrie selbst.',
      ),
      ProseSection(
        'Dualität und die reichste Symmetrie',
        'Zu jedem platonischen Körper gibt es einen dualen Körper: Man setzt '
            'in die Mitte jeder Fläche eine neue Ecke und verbindet die Ecken '
            'benachbarter Flächen. Beim Dodekaeder entsteht so das Ikosaeder — '
            'und umgekehrt. Dabei tauschen Flächen und Ecken die Plätze: Der '
            'Dodekaeder hat 12 Flächen und 20 Ecken, der Ikosaeder 20 Flächen '
            'und 12 Ecken. Die Kantenzahl 30 bleibt bei beiden gleich. Die '
            'Zwölf taucht in beiden auf — einmal als Flächenzahl, einmal als '
            'Eckenzahl.\n\n'
            'Weil beide dieselbe Bauart teilen, haben sie auch dieselbe '
            'Symmetrie — und es ist die reichste unter allen platonischen '
            'Körpern: 120 Symmetrien, also 60 Drehungen und 60 '
            'Dreh-Spiegelungen. Der Würfel hat nur 48, der Tetraeder 24. Die '
            '60 Drehungen verteilen sich auf sechs fünfzählige Achsen durch '
            'gegenüberliegende Flächenmitten, zehn dreizählige durch '
            'gegenüberliegende Ecken und fünfzehn zweizählige durch '
            'gegenüberliegende Kantenmitten.\n\n'
            'Die Zahl 120 lässt sich als 5! schreiben (5 × 4 × 3 × 2 × 1) und '
            'in die Primfaktoren 2, 3 und 5 zerlegen — dieselben drei Zahlen, '
            'die in den Achsen und in der fünfeckigen Flächenform '
            'wiederkehren. Diese fünfzähligen Achsen sind zugleich der Grund, '
            'warum kein gewöhnlicher Kristall ein echtes Dodekaeder bilden '
            'kann: Ein periodisches Gitter verträgt keine Fünf-Symmetrie '
            '(siehe das Kapitel über Pyrit).',
      ),
      ProseSection(
        'Die Euler-Zwölf: warum immer zwölf Fünfecke',
        'Ein letztes Ergebnis verbindet den Dodekaeder mit Dingen, die zunächst '
            'nichts mit ihm zu tun zu haben scheinen. Die Frage lautet: Kann '
            'man eine geschlossene, kugelartige Hülle allein aus regelmäßigen '
            'Sechsecken bauen? Die Antwort ist nein. Reine Sechsecke ergeben '
            'eine flache Fläche; um sie zur Kugel zu krümmen, müssen genau '
            'zwölf Fünfecke eingebaut werden — gleichgültig, wie viele '
            'Sechsecke man sonst verwendet.\n\n'
            'Das folgt wieder aus dem Eulerschen Satz. Mit null Sechsecken '
            'entsteht das reguläre Dodekaeder. Mit zwölf Fünfecken und zwanzig '
            'Sechsecken entsteht der klassische Fußball — und genau hier liegt '
            'ein häufiger Irrtum: Der Fußball ist kein Dodekaeder. Er ist ein '
            'abgestumpftes Ikosaeder mit 32 Flächen, also zwölf Fünfecken plus '
            'zwanzig Sechsecken. Beide teilen nur die zwölf Fünfecke; der '
            'Dodekaeder hat aber gar keine Sechsecke.\n\n'
            'Das reguläre Dodekaeder ist damit der reinste Fall dieser '
            'Zwölfheit: zwölf Fünfecke und sonst nichts.',
      ),
      ProseSection(
        'Würfel, Zwölfeck und Pyritoeder — was er nicht ist',
        'In Rollenspielen ist der Dodekaeder als D12 bekannt, der '
            'zwölfseitige Würfel. Weil er von allen fünf Körpern der Kugel am '
            'nächsten kommt, rollt er angenehm und kommt zuverlässig auf einer '
            'Fläche zur Ruhe; seine zwölf gleichen Flächen machen ihn fair.\n\n'
            'Drei Verwechslungen lohnen die Klarstellung. Erstens: Das '
            'Dodekagon ist nicht der Dodekaeder. Beide Wörter tragen „dodeka-" '
            '(zwölf), doch das Dodekagon ist ein flaches Zwölfeck mit zwölf '
            'Seiten, der Dodekaeder ein räumlicher Körper mit zwölf Flächen. '
            'Zweitens: Der Pyritoeder des Minerals Pyrit hat ebenfalls zwölf '
            'fünfeckige Flächen, ist aber kein regelmäßiger Dodekaeder — seine '
            'Fünfecke sind verzogen, und er hat keine echte fünfzählige '
            'Symmetrie (ausführlich im Kapitel über Pyrit). Drittens schließlich '
            'ordnete Platon den Dodekaeder dem Kosmos als Ganzem zu; das ist '
            'eine alte philosophische Deutung, kein mathematisches Ergebnis. '
            'Die Geometrie des Körpers steht für sich, ganz unabhängig davon, '
            'welche Bedeutung Menschen ihr gegeben haben.',
      ),
    ],
    sources: [
      Source(
        'Regular dodecahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Regular_dodecahedron',
        'R2',
        'A1',
      ),
      Source(
        'Dodekaeder — Wikipedia (de)',
        'https://de.wikipedia.org/wiki/Dodekaeder',
        'R2',
        'A1',
      ),
      Source(
        'Platonic solid — Wikipedia',
        'https://en.wikipedia.org/wiki/Platonic_solid',
        'R2',
        'A1',
      ),
      Source(
        'Eulers Polyederformel — Plus Maths (Cambridge)',
        'https://plus.maths.org/content/eulers-polyhedron-formula',
        'R1',
        'A1',
      ),
      Source(
        'Platonic Solids: Why Five? — MathsIsFun',
        'https://www.mathsisfun.com/geometry/platonic-solids-why-five.html',
        'R1',
        'A1',
      ),
      Source(
        'Golden ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Golden_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Phi in 3D Geometry (Ron Knott) — University of Surrey',
        'https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html',
        'R2',
        'A1',
      ),
      Source(
        'Icosahedral symmetry — Wikipedia',
        'https://en.wikipedia.org/wiki/Icosahedral_symmetry',
        'R2',
        'A1',
      ),
      Source(
        'Truncated icosahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_icosahedron',
        'R2',
        'A1',
      ),
    ],
  ),
];
