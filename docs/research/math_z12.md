# Dossier: ℤ/12ℤ — die Uhr als Gruppe

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Die Uhr als Gruppe (ℤ/12ℤ)«
**Baut auf:** »Teiler, Brüche und Perioden« (Teilerstruktur der 12)
**Datum:** 2026-06-10
**Verifikation:** Alle Zahlenwerte (Erzeuger, Untergruppen, Elementordnungen, Einheiten,
Quintenzirkel-Folge, Primzahlreste) per Python/BigInt selbst nachgerechnet. Merge aus
drei unabhängigen Recherche-Dossiers (z12_a algebraisch · z12_b Brücken · z12_c
Geschichte/Vorbehalte); die Zahlenwerte decken sich vollständig.

> Methodik gemäß `docs/research/README.md`: Dossier vor Prosa, Tier-System, ehrliche
> Vorbehalte. Maßstab `nature_pyrit.md` und `math_zyklische_zahlen.md`.

---

## 1. Was eine Gruppe ist (in vier Regeln)

Eine **Gruppe** ist eine Menge mit einer Verknüpfung, die vier Bedingungen erfüllt:
Abgeschlossenheit (das Ergebnis bleibt in der Menge), Assoziativität, ein neutrales
Element, ein Inverses zu jedem Element. Mehr nicht.

Die Menge {0, 1, …, 11} mit der Addition modulo 12 (a ⊕ b = (a+b) mod 12) ist eine
solche Gruppe — die **Stundenaddition** der Uhr. Neutral ist 0 (= „12 Uhr"), invers zu
a ist 12 − a (5 + 7 = 0). Diese Gruppe heißt **ℤ/12ℤ**.

---

## 2. ℤ/12ℤ als zyklische Gruppe — die Erzeuger {1, 5, 7, B}

ℤ/12ℤ ist **zyklisch** der Ordnung 12: ein einzelnes Element erzeugt durch wiederholte
Addition die ganze Gruppe. Ein Schritt g erzeugt alle 12 Positionen **genau dann, wenn
ggT(g, 12) = 1**. Die vier Erzeuger sind **1, 5, 7, 11** (in Basis 12: 1, 5, 7, B) — die
zu 12 teilerfremden Reste; ihre Anzahl ist **φ(12) = 4** (Eulersche Phi-Funktion).

Elementordnung: ord(k) = 12/ggT(k, 12). Vollständig (selbst gerechnet):

| k | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B |
|---|--|--|--|--|--|--|--|--|--|--|--|--|
| ord(k) | 1 | 12 | 6 | 4 | 3 | 12 | 2 | 12 | 3 | 4 | 6 | 12 |

Die auftretenden Ordnungen sind genau die Teiler von 12: {1, 2, 3, 4, 6, 12}.

---

## 3. Die sechs Untergruppen — am Zifferblatt ablesbar

**Fundamentalsatz über zyklische Gruppen:** Cₙ hat zu jedem Teiler d von n genau eine
Untergruppe der Ordnung d (erzeugt von n/d), und keine anderen. Das ist stärker als
Lagrange (der nur sagt: Untergruppen-Ordnung teilt n; Umkehrung gilt nicht allgemein —
Gegenbeispiel A₄ hat keine Untergruppe der Ordnung 6).

ℤ/12ℤ hat also **sechs** Untergruppen — am 12-Stunden-Zifferblatt sichtbar:

| Ordnung | Untergruppe | Figur am Zifferblatt |
|--------:|-------------|----------------------|
| 1 | {0} | nur die 12-Position |
| 2 | {0, 6} | Durchmesser-Linie |
| 3 | {0, 4, 8} | gleichseitiges Dreieck |
| 4 | {0, 3, 6, 9} | Quadrat |
| 6 | {0, 2, 4, 6, 8, A} | regelmäßiges Sechseck |
| 12 | alles | das volle Zifferblatt |

Eine „Dezimaluhr" ℤ/10ℤ hätte nur Teiler 1, 2, 5, 10 — keine Untergruppe der Ordnung 3
oder 4. Dass 12 so reich ist, ist dieselbe Eigenschaft, die sie als Stellenwertbasis
auszeichnet: 12 ist eine **hoch zusammengesetzte Zahl** (Ramanujan 1915), keine kleinere
Zahl hat so viele Teiler.

---

## 4. Brücke 1 — Musik: der Quintenzirkel ist 7-Schritte mod 12

In der mathematischen Musiktheorie (pitch classes; Babbitt, Forte 1973) sind die zwölf
Halbtöne der gleichstufigen Stimmung die Elemente von ℤ/12ℤ (C = 0, … H = 11);
Transposition = Addition mod 12. Die **reine Quinte** ist 7 Halbtöne. Wiederholtes +7 mod
12 (selbst gerechnet):

```
0 → 7 → 2 → 9 → 4 → B → 6 → 1 → 8 → 3 → A → 5 → 0
```

Alle zwölf Töne, bevor der Kreis sich schließt — **weil ggT(7, 12) = 1**, also 7 ein
Erzeuger ist. Die **Quart** (5 Halbtöne, ggT(5,12)=1) erzeugt denselben Zirkel rückwärts.

Gegenbeispiele (Akkorde = Untergruppen): große Terz 4 → {0,4,8} (übermäßiger Dreiklang,
Ordnung 3); Tritonus 6 → {0,6} (Ordnung 2); kleine Terz 3 → {0,3,6,9} (verminderter
Vierklang, Ordnung 4).

**Abgrenzung:** Akustik, Obertöne, Stimmungsgeschichte, pythagoreisches Komma bleiben im
Welt-Kapitel `culture_musik.md`. Hier zählt nur die *additive Gruppenstruktur*.

---

## 5. Brücke 2 — Primziffern: enden auf 1, 5, 7, B

In Basis 12 ist die letzte Ziffer der Rest mod 12. Eine Primzahl p > 3 hat ggT(p, 12) = 1,
also p mod 12 ∈ {1, 5, 7, 11}. **Alle Primzahlen > 3 enden in Basis 12 auf 1, 5, 7 oder B.**
Die übrigen Ziffern scheiden aus, weil sie durch 2 oder 3 teilbar sind (auch die 9 =
12k+9 = 3(4k+3)).

Verifiziert (p ≤ 100, >3): 5→5, 7→7, 11→B, 13→1, 17→5, 19→7, 23→1B(B), 29→25(5), 31→27(7),
37→31(1), 41→35(5), 43→37(7), 47→3B(B), 53→45(5), … — alle in {1,5,7,B}. ✓

Das sind exakt die vier Erzeuger / die Einheiten (ℤ/12ℤ)×. **Notwendig, nicht hinreichend:**
25 = 5² endet auf 21 (1), 35 = 5·7 endet auf 2B (B) — zusammengesetzt trotz „guter" Ziffer.

In Basis 10 enden Primzahlen > 5 analog auf 1, 3, 7, 9 (= Einheiten mod 10, φ(10) = 4).

---

## 6. Die verbindende Zahl: φ(12) = 4

Dieselbe Vierermenge {1, 5, 7, 11} tritt in allen drei Welten auf — kein Zufall, sondern
dieselbe Bedingung ggT(·, 12) = 1, dreimal gelesen:

| Welt | Rolle von {1, 5, 7, B} |
|------|------------------------|
| Gruppe | additive Erzeuger von ℤ/12ℤ |
| Uhr | Schrittweiten, die alle 12 Felder treffen |
| Musik | Quint/Quart/Halbton/große Sept — erzeugen den ganzen Tonkreis |
| Primziffern | einzig mögliche Endziffern für Primzahlen > 3 |

---

## 7. ℤ/12ℤ als Ring — und warum es kein Körper ist

ℤ/12ℤ ist auch ein **Ring** (Addition + Multiplikation mod 12). Aber **kein Körper**:
nicht jedes Element ≠ 0 hat einen Kehrwert. 2·x ≡ 1 (mod 12) ist unlösbar (ggT(2,12) = 2);
es gibt Nullteiler (3·4 ≡ 0). ℤ/nℤ ist ein Körper genau dann, wenn n prim ist — 12 ist
es nicht (das gälte ebenso für ℤ/10ℤ, ist kein Mangel des Dozenalen).

**Die Einheiten** (invertierbar) sind (ℤ/12ℤ)× = {1, 5, 7, 11} = φ(12) = 4 Stück. Jede ist
ihr eigener Kehrwert: 5² = 25 ≡ 1, 7² = 49 ≡ 1, 11² = 121 ≡ 1 (mod 12). Eine Gruppe der
Ordnung 4, in der jedes Element zum Quadrat 1 ergibt, ist die **Klein-Vierergruppe**
C₂×C₂. Grund (CRT, 12 = 4·3): (ℤ/12ℤ)× ≅ (ℤ/4ℤ)× × (ℤ/3ℤ)× ≅ C₂ × C₂.

**Präzisierung (ein verbreiteter Fehler):** Es ist **nicht** wahr, dass 12 die größte Zahl
mit „elementar-abelscher Einheitengruppe vom Exponenten 2" ist — das ist **n = 24**
((ℤ/24ℤ)× ≅ C₂×C₂×C₂). Die korrekte Sonderstellung der 12: sie ist die größte Zahl, deren
Einheitengruppe **genau** die Klein-Vierergruppe C₂×C₂ ist (Ordnung 4 *und* Exponent 2).
Die n mit Exponent-2-Einheitengruppe sind genau die Teiler von 24: {1,2,3,4,6,8,12,24}.

---

## 8. Geschichte

- **Gauss**, *Disquisitiones Arithmeticae* (1801, geschrieben ab 1798 mit 21): führt die
  Kongruenznotation a ≡ b (mod n) mit dem ≡-Zeichen ein — Geburtsstunde der modularen
  Arithmetik. Gauss verstand ℤ/nℤ vollständig, bevor das Wort „Gruppe" existierte.
- **Galois** (um 1831): erster klarer Gruppenbegriff (Permutationsgruppen, Normalteiler);
  posthum durch Liouville 1846 veröffentlicht.
- **Cayley** (1854): erste *abstrakte* Gruppendefinition. ℤ/nℤ gilt rückblickend als der
  älteste, konkreteste Prototyp der endlichen zyklischen Gruppe.

Anwendungen heute: Prüfziffern (ISBN-10 mod 11, IBAN mod 97), Kryptographie (RSA in
ℤ/nℤ), Wochentagsrechnung (Zeller / Conways Doomsday, mod 7).

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1 (der wichtigste): »Modulo 12« = »Basis 12«.** Falsch. *Basis 12* ist eine
Stellenwert-*Schreibweise* (wie man Zahlen notiert); *modulo 12* ist eine Rest-*Relation*
(welche Klasse eine Zahl hat). Man rechnet täglich modulo 12 auf der Uhr — in Basis 10.
Beide teilen nur die Zahl 12, aus demselben Grund (viele Teiler), sind aber verschiedene
Strukturen. Ein Dozenal-Text muss das explizit trennen.

**Irrtum 2: »Die Uhr zeigt die ganze Struktur.«** Sie zeigt nur die *additive* Gruppe.
Multiplikation, Einheiten, Nullteiler — nichts davon hat ein Uhr-Bild.

**Irrtum 3: »ℤ/12ℤ ist ein Körper.«** Nein (12 nicht prim; 2 ohne Kehrwert; Nullteiler).

**Irrtum 4: »5 und 7 sind musikalisch ausgezeichnet.«** Nein — jeder zu 12 teilerfremde
Schritt erzeugt den Kreis (auch 1 und 11). Quinte/Quart sind nur die musikalisch
prominenten Vertreter.

**Irrtum 5: »Endziffer beweist Primalität.«** Notwendig, nicht hinreichend (25, 35, 49 …).

**Irrtum 6: »ℤ/12ℤ ist die Symmetriegruppe des Zwölfecks.«** Nein — das ist die
Diedergruppe D₁₂ (24 Elemente, nicht abelsch). Nur die *Drehungen* des Zwölfecks sind
isomorph zu ℤ/12ℤ.

**Irrtum 7: »12 ist die größte Zahl mit Exponent-2-Einheitengruppe.«** Das ist 24 (siehe
Abschnitt 7); 12 ist die größte mit Einheitengruppe = C₂×C₂.

**Vorbehalt 8: Der Quintenzirkel schließt sich nur in der gleichstufigen Stimmung exakt**
(in reiner Stimmung bleibt das pythagoreische Komma, ~23,46 Cent). Die Gruppentheorie gilt
für das *Modell* der Tonklassen, nicht für die physikalischen Schwingungen.

**Vorbehalt 9: »Viertelstunden-Marken« sind Stundenmarken.** Die Untergruppe {0,3,6,9}
sind die Zifferblatt-Positionen 12/3/6/9 (nach 0/3/6/9 *Stunden*), nicht 15-Minuten-
Punkte.

---

## Abgrenzung zu bestehenden Kapiteln

»Teiler, Brüche und Perioden« führt die Teilerstruktur der 12 ein; dieses Kapitel macht
daraus eine *Gruppenstruktur* und trennt Modulo von Basis. »Zyklische Zahlen« behandelt
die *multiplikative* Seite (Primitivwurzeln, Perioden 1/p) — hier geht es ausschließlich
um die *additive* Gruppe. »Klang in Zwölfteln« (Welt-Block) behandelt Akustik/Stimmung;
hier nur die Algebra des Quintenzirkels.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1** (wissenschaftlich/primär) · **R2** (etablierte Referenz) · **R3**
(seriös populär); Zugang **A1** (Volltext) · **A2** (teilweise/Snippet/Paywall) · **A3**
(indirekt).

### Gruppentheorie / modulare Arithmetik (R1–R2)
- **[R2·A1]** Modular arithmetic — Wikipedia — https://en.wikipedia.org/wiki/Modular_arithmetic — Kongruenz, ℤ/nℤ-Ring, Uhr-Beispiel, Gauss 1801.
- **[R2·A1]** Cyclic group — Wikipedia — https://en.wikipedia.org/wiki/Cyclic_group — Erzeuger, ord(k)=n/ggT, eine Untergruppe je Teiler.
- **[R2·A1]** Subgroups of cyclic groups — Wikipedia — https://en.wikipedia.org/wiki/Subgroups_of_cyclic_groups — sechs Untergruppen von ℤ/12ℤ.
- **[R2·A1]** Multiplicative group of integers modulo n — Wikipedia — https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n — (ℤ/12ℤ)×={1,5,7,11}, CRT, ≅ C₂×C₂, Tabelle n=12/24.
- **[R2·A1]** Klein four-group — Wikipedia — https://en.wikipedia.org/wiki/Klein_four-group — V₄=C₂×C₂, Exponent 2.
- **[R2·A1]** Lagrange's theorem (group theory) — Wikipedia — https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory) — Gegenbeispiel A₄.
- **[R2·A1]** Euler's totient function — Wikipedia — https://en.wikipedia.org/wiki/Euler%27s_totient_function — φ(12)=4.
- **[R2·A1]** Group (mathematics) — Wikipedia — https://en.wikipedia.org/wiki/Group_(mathematics) — vier Axiome.
- **[R2·A2]** „What is special about the divisors of 24?" — arXiv:1104.5052 — https://arxiv.org/pdf/1104.5052 — Teiler von 24 = n mit Exponent-2-Einheitengruppe; Snippet/CRT.
- **[R1·A2]** Keith Conrad, Orders of Units in Modular Arithmetic (UConn) — https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf — Ordnungen, Euler-Satz; PDF binär, Standardstoff.

### Musiktheorie (R1–R2)
- **[R2·A1]** Circle of fifths — Wikipedia — https://en.wikipedia.org/wiki/Circle_of_fifths — 12-Schritt-Folge, Diletski/Heinichen.
- **[R2·A1]** Pitch class — Wikipedia — https://en.wikipedia.org/wiki/Pitch_class — Tonklassen 0–11, Transposition = +k mod 12, Babbitt/Forte.
- **[R2·A1]** Interval (music) — Wikipedia — https://en.wikipedia.org/wiki/Interval_(music) — Quinte 7, Quart 5, Tritonus 6 Halbtöne.
- **[R1·A2]** Dmitri Tymoczko, *A Geometry of Music* (OUP 2011) — ℤ/12ℤ als Standardmodell; Paywall, über Rezensionen.

### Geschichte (R1–R2)
- **[R1·A2]** Disquisitiones Arithmeticae — Wikipedia — https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae — Kongruenznotation, 1801.
- **[R2·A1]** Group theory — MacTutor — https://mathshistory.st-andrews.ac.uk/HistTopics/Development_group_theory/ — Galois 1831, Cayley 1854.
- **[R2·A1]** Évariste Galois — MacTutor — https://mathshistory.st-andrews.ac.uk/Biographies/Galois/ — Lebensdaten, Liouville 1846.

### Primzahlen, hoch zusammengesetzte Zahlen, Anwendungen (R2)
- **[R2·A1]** Duodecimal — Wikipedia — https://en.wikipedia.org/wiki/Duodecimal — Primzahlreste Basis 12.
- **[R2·A1]** Dirichlet's theorem on arithmetic progressions — Wikipedia — https://en.wikipedia.org/wiki/Dirichlet%27s_theorem_on_arithmetic_progressions — ∞ Primzahlen je teilerfremder Restklasse.
- **[R2·A1]** Highly composite number — Wikipedia — https://en.wikipedia.org/wiki/Highly_composite_number — 12 hoch zusammengesetzt (Ramanujan 1915).
- **[R2·A1]** Zeller's congruence — Wikipedia — https://en.wikipedia.org/wiki/Zeller%27s_congruence — Wochentag mod 7.

### Eigene Verifikation (R1·A1)
- Python/BigInt: Erzeuger, Ordnungen, Untergruppen, Einheiten mod 12 & 24, Quadrate,
  Exponent-2-Liste (Teiler von 24), Quintenzirkel-Folge, Primzahl-Endziffern ≤ 200 —
  alle reproduzierbar nachgerechnet, mit Wikipedia abgeglichen.
</content>
