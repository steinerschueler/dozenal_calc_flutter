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
  ProseChapter('Teiler, Brüche und Perioden', [
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
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('Die Zahlenbasen im Vergleich', [
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
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('Eine kurze Geschichte der Stellenwertsysteme', [
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
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
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
];
