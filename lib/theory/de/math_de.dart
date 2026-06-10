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
