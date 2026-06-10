// German prose for the "Grundlagen" theory block. part of
// ../grundlagen_theory.dart. Distilled from docs/research/grundlagen_*.md in
// deliberately simple, translatable sentences. Voice: state the matter
// neutrally; honest about trade-offs and unproven claims (Fingerglied-Zählung
// as Vermutung, not fact).

part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersDe() => const [
  ProseChapter(
    'Was ist das Dozenalsystem?',
    [
      ProseSection(
        'Was eine Basis ist',
        'In einem Stellenwertsystem hängt der Wert einer Ziffer von ihrem Platz '
            'ab. In der Zahl 347 steht die 3 für dreihundert, die 4 für vierzig, '
            'die 7 für sieben. Jede Stelle ist so viel mal größer als ihre '
            'rechte Nachbarin, wie die Basis angibt. Im gewohnten Dezimalsystem '
            'ist die Basis zehn.\n\n'
            'Das Dozenalsystem hat die Basis zwölf. Die Stellen sind also nicht '
            'Einer, Zehner, Hunderter, sondern Einer, Zwölfer, '
            'Hundertvierundvierziger. Die Zahl „100" bedeutet hier nicht hundert, '
            'sondern zwölf mal zwölf, also 144 im Dezimalen. Und „10" bedeutet '
            'genau ein Dutzend.\n\n'
            'Wichtig dabei: Die Menge selbst ändert sich nie, nur die '
            'Schreibweise. Fünfzehn Äpfel bleiben fünfzehn Äpfel, ob man sie '
            '„15" (dezimal) oder „13" (dozenal) aufschreibt. Eine Zahl wird '
            'durch einen Basiswechsel weder größer noch kleiner.',
      ),
      ProseSection(
        'Warum es zwei neue Ziffern braucht',
        'Das Dezimalsystem kommt mit zehn Zeichen aus (0 bis 9), weil bei jeder '
            'zehnten Einheit eine neue Stelle beginnt. Das Dozenalsystem geht '
            'erst bei der zwölften Einheit eine Stelle weiter. Es braucht darum '
            'zwei zusätzliche Zeichen — für die Werte zehn und elf, die im '
            'Dezimalen schon zwei Stellen belegen.\n\n'
            'Dieser Rechner schreibt sie als A (= zehn) und B (= elf). Ganz '
            'wichtig: A und B sind hier keine Buchstaben und keine Platzhalter, '
            'sondern vollwertige einstellige Ziffern — genauso wie 7 oder 9, nur '
            'eben für zehn und elf. Gezählt wird darum: 0, 1, 2, …, 9, A, B, 10, '
            '11, …\n\n'
            'Das ist eine echte Stolperstelle für alle, die Algebra gewohnt sind. '
            'Dort meint „2B" das Produkt zwei mal B. Hier nicht. „2B" ist eine '
            'zweistellige Zahl: eine 2 an der Zwölferstelle und ein B an der '
            'Einerstelle, also zwei Zwölfer und elf Einer — dezimal 35. Das '
            'Produkt zwei mal elf dagegen wäre 22, dozenal „1A", also etwas ganz '
            'anderes. Nebeneinanderstehende Ziffern bilden eine Zahl, sie werden '
            'nicht multipliziert. Der Rechner weiß das von selbst, weil A und B '
            'für ihn feste Ziffern sind und keine Buchstaben.\n\n'
            'Andere Schreibweisen sind verbreitet, vor allem die gedrehten '
            'Ziffern ↊ und ↋, die Isaac Pitman 1857 vorschlug und die seit 2015 '
            'sogar einen eigenen Unicode-Platz haben. Einen einzigen weltweit '
            'gültigen Standard gibt es bis heute nicht.',
      ),
      ProseSection(
        'Der Vorteil: glatte Brüche',
        'Der eigentliche Reiz der Zwölf ist ihre Teilbarkeit. Zwölf lässt sich '
            'glatt durch 2, 3, 4 und 6 teilen; zehn nur durch 2 und 5. Das zeigt '
            'sich am deutlichsten beim Bruchrechnen. In Basis 10 sind ein Drittel '
            '(0,333…) und ein Sechstel (0,1666…) unendliche, periodische '
            'Dezimalbrüche. In Basis 12 sind sie kurz und exakt: ein Drittel ist '
            '0;4, ein Sechstel ist 0;2.\n\n'
            'Dahinter steht eine einfache Regel: Ein Bruch 1/n bricht in einer '
            'Basis genau dann ab, wenn der Nenner n nur aus Primfaktoren der '
            'Basis besteht. Zwölf besteht aus 2 und 3 — also sind alle Brüche '
            'mit Nennern aus Zweien und Dreien glatt.\n\n'
            'Das ist aber kein reiner Gewinn, sondern ein Tausch. Ein Fünftel, '
            'in Basis 10 das glatte 0,2, wird in Basis 12 periodisch (0;2497…). '
            'Auch Zehntel werden periodisch. Der Tausch lohnt sich im Alltag, '
            'weil man häufiger durch drei und vier teilt als durch fünf — aber '
            'er ist ehrlicherweise ein Tausch, kein Wunder.',
      ),
      ProseSection(
        'Wo die Zwölf längst lebt',
        'Lange vor jeder Theorie hatte sich die Zwölf bereits in Maße, Zeit und '
            'Handel eingegraben, gerade weil sie sich so gut teilen lässt. Im '
            'Handel zählt man in Dutzenden (12 Stück) und im Gross (144 = 12² '
            'Stück); das Wort „Dutzend" geht über das Französische auf '
            'lateinisch duodecim, „zwölf", zurück.\n\n'
            'Das lateinische Wort uncia bedeutete „ein Zwölftel" — eines Fußes '
            'wie eines Pfunds. Daraus wurden die englischen Wörter inch (Zoll) '
            'und ounce (Unze): 12 Zoll ergeben einen Fuß. Auch die Zeit ist '
            'zwölfgeteilt: zweimal zwölf Stunden am Tag, zwölf Monate im Jahr, '
            'und der Vollkreis hat 360 = 30 × 12 Grad.\n\n'
            'Es gibt sogar eine Vermutung, warum gerade die Zwölf: Mit dem Daumen '
            'lassen sich die drei Glieder der vier übrigen Finger abzählen, das '
            'macht 4 × 3 = 12. Diese Zählweise ist in Teilen Asiens bis heute in '
            'Gebrauch. Sie ist eine plausible Erklärung für den Ursprung des '
            'Zwölferzählens, aber nicht bewiesen — sie bleibt eine Hypothese.',
      ),
      ProseSection(
        'Die dozenale Bewegung',
        'Den Vorteil der Zwölf bewusst zu nutzen, ist eine alte Idee, die im '
            '20. Jahrhundert eine kleine organisierte Form fand. 1935 schrieb '
            'Frank Emerson Andrews in den USA das erste Buch dazu; 1944 entstand '
            'die Dozenal Society of America, 1959 die Dozenal Society of Great '
            'Britain. Beide geben bis heute Hefte heraus und verwenden die '
            'Pitman-Ziffern.\n\n'
            'Diese Gesellschaften fordern keinen weltweiten Systemwechsel. Sie '
            'verstehen ihre Arbeit als Bildung und Erkundung: Sie wollen zeigen, '
            'dass die Wahl der Zahlenbasis keine Naturnotwendigkeit ist, sondern '
            'eine Gewohnheit. Der Mathematiker Alexander Craig Aitken warb '
            'prominent für die Zwölf und schätzte das Dezimalsystem als deutlich '
            'weniger effizient ein — eine anschauliche Schätzung, kein gemessener '
            'Wert.',
      ),
      ProseSection(
        'Warum es sich nie durchgesetzt hat',
        'Wenn Basis 12 rechnerisch oft bequemer ist, warum rechnet dann die '
            'ganze Welt dezimal? Die Antwort liegt nicht in der Mathematik, '
            'sondern in der Gewohnheit. Das Dezimalsystem ist seit Jahrtausenden '
            'verankert — vermutlich, weil der Mensch zehn Finger hat. Das ist ein '
            'anatomischer Grund, kein mathematischer, aber er sitzt tief.\n\n'
            'Als die Welt im 18. und 19. Jahrhundert ihre Maße vereinheitlichte, '
            'gewann das dezimal-metrische System; ein Wechsel des Zählsystems '
            'galt schon damals als undurchführbar. Heute kämen die Kosten einer '
            'Umstellung — neue Schulbücher, Geräte, Software, das Umlernen aller '
            'Menschen — einem Neuaufbau gleich. Und die Computer rechnen ohnehin '
            'binär, wo die Basis 16 näher liegt als die Zwölf.\n\n'
            'Die Spuren der Zwölf in Uhr, Maßband und Dutzend sind deshalb kein '
            'Aufruf zum Wechsel. Sie zeigen nur, dass die Zwölf nie ganz '
            'verschwunden ist — und machen das Rechnen in ihr zu einer Reise in '
            'ein vertrautes und doch fremdes Zahlenland.',
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
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
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
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Zwölf Glieder an der Hand',
    [
      ProseSection(
        'Die Methode: zwölf Glieder, ein Daumen',
        'Halte eine Hand vor dich und betrachte die vier Finger neben dem '
            'Daumen. Jeder dieser Finger hat drei Glieder, getrennt durch '
            'sichtbare Gelenke: ein Grundglied, ein Mittelglied und ein Endglied. '
            'Vier Finger mal drei Glieder ergibt zwölf — zwölf zählbare Punkte auf '
            'einer einzigen Hand.\n\n'
            'Der Daumen dient als Zeiger und wird selbst nicht mitgezählt. Er '
            'berührt nacheinander jedes der zwölf Glieder und zählt so von eins '
            'bis zwölf. Die am häufigsten beschriebene Reihenfolge beginnt am '
            'äußersten Glied des kleinen Fingers und wandert fingerweise zur '
            'Handinnenseite. Es gibt aber Varianten: manche beginnen am '
            'Zeigefinger, manche zählen von der Spitze nach unten. Fest ist nur '
            'die Grundstruktur — ein Zeiger, vier Finger, je drei Glieder, Summe '
            'zwölf.\n\n'
            'Dass es genau drei Glieder sind, ist keine kulturelle Wahl, sondern '
            'Anatomie: Diese 2-3-3-3-3-Form (der Daumen hat nur zwei Glieder) '
            'teilen alle Menschen, und sie ist ein altes Erbe der Säugetierhand. '
            'Die Glieder entstanden zum Greifen und Klettern, nicht zum Zählen — '
            'aber sie eignen sich gut dafür.',
      ),
      ProseSection(
        'Von zwölf zu sechzig',
        'Hat der Daumen alle zwölf Glieder der ersten Hand durchlaufen, ist ein '
            'voller Durchgang abgeschlossen. Nun übernimmt die zweite Hand das '
            'Merken: Für jeden abgeschlossenen Zwölfer streckt sie einen Finger '
            'aus. Fünf Finger mal zwölf Glieder ergibt sechzig. Mit zwei Händen '
            'lässt sich also lautlos und ohne jedes Hilfsmittel bis 60 zählen.\n\n'
            'Diese Verbindung 12 × 5 = 60 ist die einfachste Erklärung dafür, '
            'warum gerade die Sechzig in den mesopotamischen Systemen eine so '
            'große Rolle spielt — und über sie bis heute: 60 Sekunden je Minute, '
            '60 Minuten je Stunde, 360 = 6 × 60 Grad im Vollkreis.\n\n'
            'Es gibt auch eine andere Konvention, bei der beide Hände Glieder '
            'zählen; dann kommt man auf 12 × 12 = 144. Beide Zählweisen sind '
            'richtig, aber sie sind nicht dasselbe System.',
      ),
      ProseSection(
        'Wo so gezählt wird',
        'Diese Zählweise ist keine moderne Erfindung. Der Mathematikhistoriker '
            'Georges Ifrah hat sie in seiner „Universalgeschichte der Zahlen" '
            'bekannt gemacht und als noch gebräuchlich beschrieben — in einem '
            'breiten Gürtel von Ägypten über Syrien, die Türkei, den Irak, den '
            'Iran, Afghanistan und Pakistan bis nach Indien und Indochina.\n\n'
            'Ein Hinweis zur Quellenlage ist hier ehrlich angebracht: Diese '
            'Länderliste ist die meistzitierte Angabe zum Thema, aber sie geht '
            'fast ganz auf diese eine Quelle zurück. Spätere Texte stützen sich '
            'meist wieder auf Ifrah. Wann und wie genau beobachtet wurde, ist '
            'nicht festgehalten; eine jüngere, systematische Erhebung fehlt.\n\n'
            'Am besten belegt ist der Fall der Chepang in Nepal. Die '
            'Sprachforscher Ross Caughley und Martine Mazaudon dokumentierten, '
            'dass die Chepang Wild in Zwölfern zählen und dabei die Fingerglieder '
            'abtippen; ihr Wort für zwölf, hale, geht auf eine alte Wurzel für '
            '„Basis des Zählens" zurück. Auch einige Sprachen im mittleren '
            'Nigeria tragen Zwölfer-Zahlwörter. Bei beiden gilt aber: Im Alltag '
            'rechnen die Menschen heute dezimal; die Zwölfer-Spuren sind eher '
            'Reste als ein lebendiges Vollsystem.',
      ),
      ProseSection(
        'Die große These — und warum sie offen bleibt',
        'Ifrah stellte die Vermutung auf, das Zwölfersystem überhaupt — und das '
            'babylonische Sexagesimalsystem mit der Basis 60 — sei aus dieser '
            'Fingerglied-Zählung hervorgegangen. Die These hat starke Seiten: Sie '
            'erklärt die Zwölf und die Sechzig zugleich, sie ist anatomisch '
            'plausibel, und sie zeigt eine konkrete Handlung statt einer bloßen '
            'Zahlen-Koinzidenz.\n\n'
            'Trotzdem ist sie eine Hypothese, keine gesicherte Geschichte. Ifrah '
            'selbst nennt seine Herleitung ausdrücklich spekulativ. Kein antiker '
            'Text, keine Tontafel und keine Abbildung beschreibt diese Methode als '
            'Ursprung des babylonischen Systems. Die Methode passt zum Ursprung — '
            'das ist aber nicht dasselbe wie ein Beweis.\n\n'
            'Das stärkste Gegenargument liefert Ägypten: Die Ägypter zählten laut '
            'Ifrah ebenfalls auf den Fingergliedern — und entwickelten trotzdem '
            'ein dezimales Zahlensystem. Die Fingermethode allein erzwingt also '
            'weder die Zwölf noch die Sechzig.',
      ),
      ProseSection(
        'Andere Erklärungen daneben',
        'Die Fingerglied-These steht nicht allein. Für die Herkunft der Sechzig '
            'gilt unter Historikern eine andere Vermutung sogar als die am '
            'weitesten akzeptierte: dass zwei Völker mit verschiedenen Zählbasen '
            'im Handel zusammentrafen und sich auf 60 als gemeinsames Vielfaches '
            'einigten. Auch dafür gibt es jedoch keinen direkten historischen '
            'Beleg.\n\n'
            'Daneben stehen eine astronomische Erklärung (rund zwölf Mondzyklen '
            'passen ungefähr in ein Jahr, daher zwölf Monate und zwölf '
            'Tierkreiszeichen) und eine rechnerische (die Zwölf und die Sechzig '
            'haben besonders viele Teiler und sind darum praktisch). Diese Gründe '
            'erklären gut, warum sich die Zahlen gehalten haben — aber nicht '
            'zwingend, warum man ursprünglich zu ihnen griff.\n\n'
            'Wahrscheinlich wirkten mehrere Kräfte zusammen: die Hand, der '
            'Himmel, der Handel und die gute Teilbarkeit. Genau das macht es so '
            'schwer, eine einzige Ursache herauszulösen. Was bleibt, ist ein '
            'schöner, ehrlicher Befund: Die menschliche Hand bietet eine '
            'natürliche Grundlage für die Zwölf — ob sie das Zahlensystem geformt '
            'hat, lässt sich nicht abschließend sagen.',
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
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
