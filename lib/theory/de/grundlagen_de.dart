// German prose for the "Grundlagen" theory block. part of
// ../grundlagen_theory.dart. Distilled from docs/research/grundlagen_*.md in
// deliberately simple, translatable sentences. Voice: state the matter
// neutrally; honest about trade-offs and unproven claims (Fingerglied-Zählung
// as Vermutung, not fact).

part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersDe() => const [
  ProseChapter('Was ist das Dozenalsystem?', [
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
  ], sources: [
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Positional notation — Wikipedia', 'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia', 'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia', 'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
    Source('Finger-counting — Wikipedia', 'https://en.wikipedia.org/wiki/Finger-counting', 'R2', 'A1'),
    Source('Dozenal Society of America — Foundation and First Generation', 'https://dozenal.org/drupal/content/foundation-and-first-generation.html', 'R2', 'A1'),
    Source('Why ten and not twelve? — Metric Views', 'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/', 'R3', 'A1'),
  ]),
];
