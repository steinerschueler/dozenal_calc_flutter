Ich fasse die drei Recherche-Blöcke (fib_a/b/c) zu einem einzigen, kohärenten
deutschen Dossier zusammen. Thema: das Mathematik-Kapitel **„Fibonacci,
Quadratzahlen und Kuriositäten"**. Schwerpunkt: die **beweisbaren**
Zahlen-Besonderheiten rund um die Zwölf — und die saubere Abgrenzung zur
Numerologie. Was ist Satz, was Koinzidenz, was Esoterik?

Index-Konvention in diesem Dossier: Fibonacci-Glieder werden als F(n)
geschrieben, das zwölfte Glied kurz als **F₁₂ = 144**.

---

## Die Fibonacci-Folge — Definition und Herkunft

Die Fibonacci-Folge lautet 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, …
Jedes Glied ist die Summe der beiden vorangehenden. Formal mit der heute
üblichen Indizierung: F(0) = 0, F(1) = 1, F(n) = F(n−1) + F(n−2).

Sie ist nach **Leonardo Bonacci aus Pisa** (ca. 1170–1240, „Fibonacci")
benannt, der sie 1202 in seinem *Liber Abaci* als Lösung eines idealisierten
Kaninchen-Wachstumsproblems beschrieb. Bekannt war die Folge in Indien schon
früher: der Sanskrit-Gelehrte Virahanka (ca. 7. Jh.) und andere nutzten sie
als Zählprinzip für Silbenfolgen.

**Index-Konvention.** Es gibt zwei verbreitete Schreibweisen. Historisch
(Fibonacci selbst) zählt man F(1) = 1, F(2) = 1; dann ist 144 das *zwölfte*
Glied. Heute üblicher ist F(0) = 0, F(1) = 1; dann hat 144 den *Index* 12,
ist aber das 13. Element der Folge (inklusive der Null). In beiden Systemen
schreibt man F₁₂ = 144 — aus leicht verschiedenen Gründen. Empfehlung:
beim Schreiben die gemeinte Konvention explizit halten. Im Kapitel verwenden
wir die kurze Form F₁₂ = 144.

---

## Das Kernstück: F₁₂ = 144 = 12²

Die zwölfte Fibonacci-Zahl ist 144, und 144 = 12² ist eine Quadratzahl. Das
ist keine Trivialität: Die Fibonacci-Folge wächst *exponentiell*, die
Quadratzahlen (1, 4, 9, 16, 25, …) wachsen nur *quadratisch*. Zwei so
unterschiedlich wachsende Folgen haben keinen zwingenden Grund, sich mehrfach
zu treffen.

**J. H. E. Cohns Satz (1964).** John H. E. Cohn bewies 1964, dass 0, 1 und 144
die *einzigen* vollständigen Quadratzahlen der gesamten Fibonacci-Folge sind.
Formal: F(n) = x² genau dann, wenn n ∈ {0, ±1, 2, 12}. Das entspricht den
Gliedern F(0) = 0 = 0², F(1) = F(2) = 1 = 1² und **F₁₂ = 144 = 12²**. Cohns
Beweis ist *elementar*, aber nicht trivial: Für gerades n nutzt er die
Faktorisierung F(n) = F(n/2) · L(n/2) (wobei L die Lucas-Folge ist) und zeigt,
dass beide Faktoren nur für n = 2 und n = 12 zugleich die nötige
Quadrat-Struktur haben; für ungerades n verwendet er Kongruenzen und
quadratische Reste.

Cohn veröffentlichte das Ergebnis 1964 doppelt: einen Volltext-Scan in der
*Fibonacci Quarterly* (Bd. 2, S. 109–113, frei zugänglich) und einen
zugehörigen Aufsatz im *Journal of the London Mathematical Society* (Bd. 39,
S. 537–540, hinter Paywall). OEIS A166074 (Indizes n mit F(n) = Quadrat)
listet ebenfalls nur {0, 1, 2, 12}.

**Erweiterung auf alle Potenzen (2006).** Bugeaud, Mignotte und Siksek bewiesen
2006 in den *Annals of Mathematics* (Bd. 163, S. 969–1018) die stärkere
Aussage: Die einzigen *vollständigen Potenzen* (xᵏ mit k ≥ 2) in der
Fibonacci-Folge sind 0, 1, 8 (= F(6) = 2³) und 144 (= F₁₂ = 12²). Cohns Satz
ist davon der Spezialfall k = 2. Dieser allgemeinere Beweis ist tief: er
kombiniert modulare Formen (im Geiste von Wiles' Fermat-Beweis) mit
Logarithmenformen.

**Dozenaler Kontext: 144 = 1 Gross.** Im Handel heißt 144 Stück ein *Gross*
(aus dem altfranzösischen *grosse douzaine*, „großes Dutzend"; ältester
englischer Schriftbeleg um 1324). Ein Gross ist ein Dutzend Dutzend, also 12²
— und im dozenalen Stellenwertsystem genau „100", die erste dreistellige
Zahl. Diese Handelseinheit entstand unabhängig von der Fibonacci-Folge. Dass
gerade dieses Handelsmaß die einzige nichttriviale Fibonacci-Quadratzahl ist,
macht den Befund für ein dozenales Publikum einprägsam — aber siehe
Vorbehalte.

---

## Der Goldene Schnitt und φ

Das Verhältnis aufeinanderfolgender Fibonacci-Glieder konvergiert gegen den
**Goldenen Schnitt** φ = (1+√5)/2 ≈ 1,618 (dezimal): F(n+1)/F(n) → φ. Johannes
Kepler beobachtete diese Konvergenz erstmals 1611. Die Verhältnisse pendeln
abwechselnd über und unter φ, mit schnell schrumpfendem Fehler.

Die definierende Eigenschaft von φ ist die Gleichung **φ² = φ + 1**: φ ist die
einzige positive Zahl, deren Quadrat genau um 1 größer ist als sie selbst. Im
Rechner: φ ≈ 1,74BB677… (dozenal); tippt man `φ² =`, erscheint exakt φ + 1.

**Binets Formel** gibt das n-te Glied geschlossen an: F(n) = (φⁿ − ψⁿ)/√5 mit
ψ = (1−√5)/2 ≈ −0,618. Da |ψ| < 1, wird ψⁿ für große n winzig; also F(n) ≈
φⁿ/√5 — die Folge wächst wie eine Potenz von φ.

---

## Die Zwölf als reiche Zahl

Die Zahlentheorie kennt mehrere präzise Weisen, eine Zahl als „teilerreich" zu
beschreiben. Die Zwölf taucht in mehreren davon auf — jede mit eigener
Definition.

**Hochzusammengesetzte Zahl.** Eine Zahl N ist *hochzusammengesetzt*, wenn sie
mehr Teiler hat als jede kleinere positive ganze Zahl. Zwölf hat sechs Teiler
(1, 2, 3, 4, 6, 12); keine kleinere Zahl hat so viele (10 hat vier, 11 hat
zwei). 12 ist die fünfte hochzusammengesetzte Zahl: die Folge beginnt 1, 2, 4,
6, 12, 24, 36, 48, 60, 120, … Srinivasa Ramanujan definierte und untersuchte
diese Klasse 1915 in den *Proceedings of the London Mathematical Society*.

**Abundante Zahl — und die kleinste.** Eine Zahl ist *abundant* (überfließend),
wenn die Summe ihrer echten Teiler die Zahl übersteigt. Für 12: 1+2+3+4+6 = 16
> 12; der Überschuss beträgt 4. **Zwölf ist die kleinste abundante Zahl** —
alle Zahlen unter 12 sind defizient (Teilersumme < Zahl, z. B. 10: 1+2+5 = 8)
oder perfekt (= Zahl; die einzige perfekte Zahl unter 12 ist 6: 1+2+3 = 6).
Erst bei 12 „quillt" die Teilersumme über. Die Dreiteilung in defizient /
perfekt / abundant geht auf Nikomachos von Gerasa zurück (um 100 n. Chr.,
*Introductio Arithmetica*).

**Sublime Zahl.** Eine *sublime Zahl* erfüllt zwei Bedingungen zugleich: (a)
die *Anzahl* ihrer Teiler ist eine perfekte Zahl, und (b) die *Summe* ihrer
Teiler ist ebenfalls eine perfekte Zahl. Für 12: die Anzahl der Teiler ist 6
(perfekt: 1+2+3 = 6), die Summe der Teiler ist 1+2+3+4+6+12 = 28 (perfekt:
1+2+4+7+14 = 28). Damit ist 12 sublim. Stand 2025 sind nur **zwei** sublime
Zahlen bekannt: 12 und eine 76-stellige Zahl. Ob es weitere gibt, ist offen.
Der Begriff ist ein Nischenkonzept der Freizeitmathematik (OEIS A081357),
klar definiert, aber kein Standardlehrstoff — siehe Vorbehalte.

*Anmerkung:* 12 ist außerdem semiperfekt (2+4+6 = 12), superior
hochzusammengesetzt und kolossal abundant (jeweils 3. Glied der Folge). Diese
strengeren Eigenschaften gehören in ein vertiefendes Dossier, nicht
zwingend ins Einführungskapitel — sie verstärken nur das Bild „teilerreiche
Zahl", ohne Neues zu sagen.

---

## Die Kanonenkugel-Identität: 1² + 2² + … + 24² = 70²

Die Summe der ersten n Quadratzahlen ist die n-te *quadratische Pyramidalzahl*
P(n) = 1² + 2² + … + n² = n(n+1)(2n+1)/6 — die Anzahl der Kugeln in einer
quadratischen Pyramide aus n Lagen. Die Formel leitete Thomas Harriot um 1587
her, als Sir Walter Raleigh wissen wollte, wie man gestapelte Kanonenkugeln
zählt.

Die schwierigere Frage: Für welche n ist P(n) *selbst* eine Quadratzahl? Es
gibt nur **eine** nichttriviale Lösung:

    1² + 2² + 3² + … + 24² = 4900 = 70²

4900 Kugeln lassen sich also entweder als 70×70-Quadrat auslegen oder als
Pyramide mit 24 Lagen stapeln. Édouard Lucas vermutete 1875, dass dies neben
den trivialen Fällen (0, 1) die einzige Lösung ist. Der erste vollständige
Beweis stammt von G. N. Watson (1918) und nutzte elliptische Funktionen;
elementare Beweise folgten erst spät (Ma De Gang 1984, W. S. Anglin 1990). Das
Problem war also tatsächlich schwer.

**Verbindung zu 24 = 2×12.** Die Lösungszahl 24 ist das Doppelte der Zwölf und
selbst die sechste hochzusammengesetzte Zahl (acht Teiler). Sie steht in den
hochzusammengesetzten Zahlen direkt hinter der 12. Diese Beobachtung ist
hübsch — aber sie ist **kein belegter Grund**: 24 erscheint hier, weil die
diophantische Gleichung P(n) = m² gerade diese Lösung hat, nicht wegen einer
Beziehung zur Basis 12 (siehe Vorbehalte). Die Lösung N = 24 hat tiefere
Echos in der modernen Mathematik (Leech-Gitter in 24 Dimensionen, bosonische
Stringtheorie in 26 Dimensionen); diese Verbindungen sind real, aber zu
technisch für ein Einführungskapitel und werden nur erwähnt.

---

## Platons 5040 — dieselbe Teilbarkeitsphilosophie

In den *Gesetzen* (Buch V) empfiehlt Platon 5040 Bürger für die ideale Stadt.
Sein Argument ist arithmetisch, nicht mystisch: 5040 lässt sich durch jede
Zahl von 1 bis 12 teilen — mit der einzigen Ausnahme von 11. (Für die
Teilbarkeit durch 11 schlägt Platon vor, zwei Familien abzuziehen: 5038 =
11 × 458.) Es ist 5040 = 7! = 2⁴·3²·5·7 mit 60 Teilern.

Jean-Pierre Kahane hat angemerkt, dass dies womöglich die erste historisch
belegte bewusste Nutzung des Konzepts der hochzusammengesetzten Zahl ist.
Platons Überlegung ist praktisch-verwaltend: Gruppen jeder Größe bis 12 lassen
sich restlos bilden. Es ist dieselbe Einsicht, die die Zwölf als Basis
attraktiv macht — angewendet auf eine Bevölkerungszahl, nicht auf ein
Zahlensystem.

---

## Begriffslandkarte: Was 12 ist und was nicht

| Eigenschaft | 12? | Erklärung |
|---|---|---|
| **Perfekte Zahl** | NEIN | Perfekte Zahlen: 6, 28, 496, 8128 … Bei 12 ist die Summe der echten Teiler 16 ≠ 12. |
| **Abundante Zahl** | ja | Teilersumme (16) > Zahl (12). |
| **Kleinste abundante Zahl** | ja | Beweisbar: alle n < 12 sind defizient oder perfekt. |
| **Semiperfekte Zahl** | ja | 2+4+6 = 12 (Teilmenge der echten Teiler). |
| **Hochzusammengesetzt** | ja | Mehr Teiler als jede kleinere Zahl. |
| **Sublime Zahl** | ja | Anzahl (6) und Summe (28) der Teiler sind beide perfekt. Nur 2 bekannt. |
| **F₁₂ = 144 = 12²** | ja | Cohn 1964: einzige nichttriviale Fibonacci-Quadratzahl. |

---

## Vorbehalte & verbreitete Irrtümer

### Irrtum 1 (der wichtigste): „12 ist eine perfekte Zahl"

Dies ist der häufigste populäre Fehler und verdient ausführliche
Richtigstellung. Numerologie-Seiten und religiöse Texte nennen 12 regelmäßig
„vollkommen" oder „perfekt" — mit Argumenten wie „durch viele Zahlen teilbar",
„12 Monate", „12 Apostel".

Mathematisch hat „perfekte Zahl" seit der Antike eine präzise Definition:
σ(n) = 2n, also die Summe *aller* Teiler (inklusive der Zahl selbst) ist
doppelt so groß wie die Zahl. Die perfekten Zahlen sind 6, 28, 496, 8128, … —
Euklid kannte sie bereits. Für 12 gilt σ(12) = 1+2+3+4+6+12 = 28 = 2×14 ≠ 24 =
2×12. **12 ist abundant, nicht perfekt.**

Die historische Wurzel der Verwechslung liegt bei Nikomachos von Gerasa, der
die Kategorien defizient / perfekt / abundant ausdrücklich mit moralischen
Werten verknüpfte (abundant als „übermäßig", perfekt als „recht und schön").
Diese Moralisierung ist der Ausgangspunkt des Missverständnisses. Sie ist ein
Zeitzeugnis, keine Mathematik, und sollte in Lehrmaterial nicht als Wertung
weitergegeben werden.

### Irrtum 2: „F₁₂ = 144 = 12² ist eine mystische Fügung"

Cohns Satz ist ein echter Satz der Zahlentheorie — und gerade darum *keine*
Mystik. 144 ist eine Fibonacci-Zahl, eine Quadratzahl und ein Handelsmaß
(Gross); diese drei Fakten sind unabhängig gesichert. Dass sie in derselben
Zahl zusammenfallen, ist eine echte Kuriosität. Der Wert liegt darin, dass
Cohn *beweist*, es handle sich um einen Einzelfall, nicht um Teil einer
größeren Regel. Der Satz identifiziert 12 als *Index* der Folge; er sagt nichts
über die *Basis* 12. Dass 144 in Basis 12 „100" ist, ist eine ästhetische
Beobachtung, kein mathematischer Inhalt — der Satz gilt in jeder Zahlenbasis.

### Irrtum 3: „24 ist wichtig, weil es 2×12 ist"

Im Kanonenkugel-Problem taucht 24 auf, weil die Gleichung P(n) = m² gerade
diese Lösung hat — nicht wegen einer inhärenten Beziehung zur Basis 12. Die
Verbindung 24 = 2×12 ist eine nachträgliche, korrekte Beobachtung, aber **kein
Grund**. Die Wikipedia-Quelle zum Problem stellt diese Verbindung nicht her;
sie ist als Beobachtung des Redakteurs zu kennzeichnen, nicht als Zitat.

### Irrtum 4: Die Häufung von Eigenschaften als Argument

Die Liste mehrerer Eigenschaften (abundant, sublim, hochzusammengesetzt,
Fibonacci-Quadrat …) erzeugt den Eindruck kumulativer Besonderheit. Aber jede
Eigenschaft ist eine eigene Definition; ihr gemeinsames Zutreffen ist weder
kausal noch symbolisch verknüpft. Was 12 heraushebt, ist ihre *Kleinheit* —
sie ist die kleinste Zahl mit diesen Eigenschaften; größere
hochzusammengesetzte Zahlen (24, 36, 60, 120, …) haben *mehr* Teiler. Der echte
Wert der Auflistung ist didaktisch: Sie zeigt, wie viele Begriffe die
Zahlentheorie für „reich" kennt — kein Beweis einer kosmischen Auszeichnung.

### Irrtum 5: Die Sublime-Eigenschaft als „Beweis" der Besonderheit

12 ist sublim — aber der Begriff stammt aus der Freizeitmathematik, und nur
zwei sublime Zahlen sind bekannt. Diese Seltenheit ist teils Folge der eng
konstruierten Definition. Daraus eine tiefe Natürlichkeit der 12 abzuleiten,
wäre zirkulär.

### Irrtum 6: „Cohn bewies das als Erster"

Einige Sekundärquellen schreiben eine frühere Beweisskizze dem norwegischen
Mathematiker Wilhelm Ljunggren (1951) zu. Diese Priorität ist bibliographisch
**nicht** über zugängliche Volltexte verifiziert; Cohns 1964er Arbeit ist der
am weitesten zitierte und verfügbare Beweis. Ljunggren höchstens als möglichen
Vorläufer nennen, nicht als gesicherte Primärquelle. (Im Kapitel wird er gar
nicht erwähnt — die Attribution ist zu unsicher für eine Einführung.)

### Irrtum 7: φ erscheint „überall" in der Natur

Wahr ist: φ erscheint in der Phyllotaxis (Blattstellung) und in Spiralmustern
biologischer Strukturen — gut erklärt über den Goldenen Winkel (≈ 137,5°), der
maximale Raumnutzung ergibt; die entstehenden Spiralzahlen sind dann
Fibonacci-Zahlen. Nicht belegt sind dagegen: dass Nautilus-Spiralen φ folgen
(ihr Verhältnis liegt näher bei 1,33), dass der Goldene Schnitt in Parthenon,
Pyramiden oder bei da Vinci bewusst eingesetzt wurde (je nach Messpunkt
beliebig einstellbar), oder dass eine ästhetische Präferenz für goldene
Rechtecke kontrolliert nachweisbar wäre. Diese Überdehnungen schwächen das,
was echte, beweisbare Mathematik ist. (Im Kapitel wird die Natur-φ-Frage nur
knapp und ehrlich gestreift.)

### Irrtum 8: Platons 5040 als mystische Zahl

Platon ist kein Numerologe. Sein Argument ist explizit arithmetisch: eine
leicht teilbare Bevölkerungsgröße. Die esoterische Rezeption („Platon wusste
von heiligen Zahlen") überlagert ein nüchternes Verwaltungsargument. Und
Kahanes Hinweis ist die Interpretation eines modernen Mathematikers über einen
antiken Text, kein Zitat Platons selbst.

---

## Quellen (Tier-System)

Bewertung nach Zuverlässigkeit (**R1** wissenschaftlich/primär · **R2**
etablierte Referenz · **R3** seriös populär · **R4** schwach · **S**
spekulativ) und Zugang (**A1** Volltext gelesen · **A2** teilweise/Snippet/
Paywall · **A3** nur indirekt). Jede Quelle annotiert, *was* sie belegt.

### Fibonacci-Quadratzahlen (Kern-Mathematik)

- **[R1·A1]** Cohn, J. H. E.: „Square Fibonacci Numbers, Etc." *Fibonacci
  Quarterly* 2 (1964), S. 109–113 — https://math.la.asu.edu/~checkman/SquareFibonacci.html
  — Volltext-Scan zugänglich. Belegt: F(n) = x² ⟺ n ∈ {0, ±1, 2, 12};
  Beweisstruktur über Lucas-Faktorisierung und Kongruenzen. Hauptquelle für
  den Cohn-Satz.
- **[R1·A2]** Cohn, J. H. E.: „On Square Fibonacci Numbers." *Journal of the
  London Mathematical Society* 39 (1964), S. 537–540. doi:10.1112/jlms/s1-39.1.537
  — Paywall (HTTP 402). Belegt: zugehörige JLMS-Publikation desselben
  Ergebnisses; Kernsatz über Snippet + Sekundärliteratur gesichert.
- **[R1·A1]** Bugeaud, Y.; Mignotte, M.; Siksek, S.: „Classical and modular
  approaches to exponential Diophantine equations I. Fibonacci and Lucas
  perfect powers." *Annals of Mathematics* 163 (2006), S. 969–1018 —
  https://annals.math.princeton.edu/2006/163-3/p05 — Volltext-Seite. Belegt:
  einzige vollständige Potenzen in Fibonacci sind 0, 1, 8, 144.
- **[R1·A3]** OEIS A166074 (Indizes n mit F(n) = Quadrat) —
  https://oeis.org/A166074 — Snippet. Belegt: Korrektheit von {0, 1, 2, 12}.

### Goldener Schnitt, φ, Natur

- **[R2·A1]** Fibonacci sequence — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Fibonacci_sequence — Volltext. Belegt:
  Folgendefinition, Indexkonventionen, Binet-Formel, φ-Grenzwert,
  Kepler 1611, Leonardo Bonacci / Liber Abaci 1202.
- **[R3·A1]** Myth-busting the Golden Ratio — University of Edinburgh (EuSci,
  2020) — https://eusci.org.uk/2020/07/29/myth-busting-the-golden-ratio/ —
  Volltext. Belegt: Phyllotaxis als legitimes Gebiet; Überdehnungen
  (Nautilus, Parthenon, Schönheitsmasken) als unbelegt.

### Kanonenkugel-Problem / Pyramidalzahlen

- **[R2·A1]** Cannonball problem — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Cannonball_problem — Volltext. Belegt:
  1²+…+24² = 70² als einzige nichttriviale Lösung; Lucas 1875, Watson 1918
  (elliptische Funktionen), Ma 1984, Anglin 1990; Harriot/Raleigh 1587;
  Leech-Gitter / Stringtheorie-Echos.
- **[R2·A1]** Square pyramidal number — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Square_pyramidal_number — Volltext. Belegt:
  Formel P(n) = n(n+1)(2n+1)/6; 4900 = 70² = P(24).

### Teilerreiche / abundante / sublime Zahlen

- **[R1·A2]** Ramanujan, S.: „Highly Composite Numbers." *Proc. London Math.
  Soc.*, Serie 2, 14 (1915), S. 347–409. doi:10.1112/plms/s2_14.1.347 —
  https://www.math.univ-lyon1.fr/~nicolas/ramanujanNR.pdf — Direkt-PDF,
  teilweise gelesen. Belegt: Definition hochzusammengesetzter Zahlen,
  d(N)-Notation, erste Glieder.
- **[R2·A1]** Highly composite number — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Highly_composite_number — Volltext. Belegt:
  d(12) = 6, Liste der ersten HCN, 12 als 5. Glied, Kahane-These zu Platon.
- **[R2·A1]** Abundant number — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Abundant_number — Volltext. Belegt:
  12 als kleinste abundante Zahl, Abundanz = 4, Nikomachos (ca. 100 n. Chr.).
- **[R2·A1]** Sublime number — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Sublime_number — Volltext. Belegt: Definition,
  Verifikation für 12 (6 Teiler perfekt, Summe 28 perfekt), nur zwei bekannte
  sublime Zahlen, OEIS A081357.
- **[R2·A2]** Perfect number — Wikipedia / MacTutor —
  https://en.wikipedia.org/wiki/Perfect_number ;
  https://mathshistory.st-andrews.ac.uk/HistTopics/Perfect_numbers/ —
  Teilweise. Belegt: σ(n) = 2n, perfekte Zahlen 6, 28, 496, 8128 — Kontrast
  zum Irrtum „12 ist perfekt".

### Gross / Platon

- **[R2·A1]** Gross (unit) — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Gross_(unit) — Volltext. Belegt:
  144 = 12² = „dozen dozen"; *grosse douzaine* (altfranzösisch, frühes 15. Jh.);
  Großgross = 1728 = 12³.
- **[R2·A1]** 5040 (number) — Wikipedia (en) —
  https://en.wikipedia.org/wiki/5040_(number) — Volltext. Belegt:
  Platon, *Gesetze* Buch V; Teilbarkeit 1–12 (außer 11); 7! = 5040, 60 Teiler;
  Kahane-Interpretation.

### Beleg für die *Existenz* des Irrtums (nicht als Sachbeleg)

- **[S·A2]** mysticalnumbers.com — Number 12 — https://mysticalnumbers.com/number-12/
  — Inhaltlich unzuverlässig. Nur herangezogen als Beleg, *dass* die populäre
  These „12 ist perfekt/vollkommen" existiert. Nicht als mathematischer Beleg.

### Anmerkung zu unsicheren / verworfenen Attributionen

- **Ljunggren (1951) als früher Quadrat-Beweis:** in Sekundärquellen genannt,
  bibliographisch nicht über Volltext verifiziert. Im Dossier als unsicher
  markiert, im Kapitel **weggelassen**.
- **24 = 2×12 als „Grund" im Kanonenkugel-Problem:** Beobachtung des
  Redakteurs, nicht durch Primärquelle belegt. Im Kapitel ehrlich als
  Beobachtung ohne Kausalität geführt.
- **Superior-HCN / kolossal-abundant für 12 (Alaoglu & Erdős 1944):** korrekt
  belegt (Wikipedia: Superior/Colossally abundant number), aber für die
  Einführung als zu speziell **ausgelassen** — verstärkt nur „teilerreich".
