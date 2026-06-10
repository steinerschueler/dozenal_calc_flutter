# Dossier: Zyklische Zahlen — Perioden, Primitivwurzeln und das Siebtel in Basis 12

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Zyklische Zahlen«
**Baut auf:** »Teiler, Brüche und Perioden« (1/7 dort kurz erwähnt, nicht ausgeführt)
**Datum:** 2026-06-10
**Verifikation:** Alle dozenalen Perioden und Produkte selbst nachgerechnet (lange
Division in Basis 12, Python/BigInt). Merge aus drei unabhängigen Recherche-Dossiers
(zyklisch_a/b/c), deren Zahlenwerte sich vollständig decken.

> Methodik gemäß `docs/research/README.md`: Dossier vor Prosa, Tier-System, ehrliche
> Vorbehalte. Maßstab ist `nature_pyrit.md`.

---

## Die Kern-Idee: Periodenlänge als multiplikative Ordnung

Die Periodenlänge von 1/p in Basis b ist kein Zufall, sondern eine präzise Zahl der
Zahlentheorie: die **multiplikative Ordnung von b modulo p**, geschrieben ord_p(b) —
die kleinste positive ganze Zahl k mit b^k ≡ 1 (mod p).

**Satz (klassisch):** Sei p prim mit gcd(p, b) = 1. Dann ist die Periodenlänge von
1/p in Basis b genau ord_p(b). Beweisidee: b^k · (1/p) hat denselben Nachkommaanteil
wie 1/p genau dann, wenn b^k ≡ 1 (mod p). Das kleinste solche k ist ord_p(b). Nach dem
Kleinen Fermatschen Satz teilt k stets p − 1.

Die Periode ist damit höchstens p − 1 Stellen lang. Sie ist genau dann **maximal**
(= p − 1), wenn b eine **Primitivwurzel mod p** ist, d. h. wenn die Potenzen
b, b², …, b^(p−1) modulo p alle p − 1 von null verschiedenen Reste {1, …, p−1} genau
einmal durchlaufen. Eine Primzahl p mit dieser Eigenschaft heißt **full-reptend prime**
(volle Reptend-Primzahl; bei Conway & Guy »long prime«, deutsch »lange Primzahl«).

---

## Selbst nachgerechnet: lange Division von 1/7 in Basis 12

```
Schritt 1: 1 × 12 = 12.  12 ÷ 7 = 1, Rest 5.   → Ziffer 1
Schritt 2: 5 × 12 = 60.  60 ÷ 7 = 8, Rest 4.   → Ziffer 8
Schritt 3: 4 × 12 = 48.  48 ÷ 7 = 6, Rest 6.   → Ziffer 6
Schritt 4: 6 × 12 = 72.  72 ÷ 7 = A(=10), Rest 2. → Ziffer A
Schritt 5: 2 × 12 = 24.  24 ÷ 7 = 3, Rest 3.   → Ziffer 3
Schritt 6: 3 × 12 = 36.  36 ÷ 7 = 5, Rest 1.   → Ziffer 5
Schritt 7: Rest wieder 1 → Periode endet, Länge 6
```

Ergebnis: **1/7 = 0;186A35** (Periode 186A35, Länge 6 = 7 − 1). Maximal, weil 12 eine
Primitivwurzel mod 7 ist:

```
12^1 ≡ 5,  12^2 ≡ 4,  12^3 ≡ 6,  12^4 ≡ 2,  12^5 ≡ 3,  12^6 ≡ 1  (mod 7)
```

Alle sechs Reste {1,…,6} kommen genau einmal vor — die Definition einer Primitivwurzel.

---

## Die zyklische Zahl: die Rotations-Eigenschaft

Die Periode-Ziffern **186A35** bilden eine **zyklische Zahl**: multipliziert mit 1…6
entstehen Rotationen derselben Ziffernfolge (alle Produkte verifiziert):

```
186A35 × 1 = 186A35      1/7 = 0;186A35
186A35 × 2 = 35186A      2/7 = 0;35186A
186A35 × 3 = 5186A3      3/7 = 0;5186A3
186A35 × 4 = 6A3518      4/7 = 0;6A3518
186A35 × 5 = 86A351      5/7 = 0;86A351
186A35 × 6 = A35186      6/7 = 0;A35186
```

Grund: k/7 = k · (1/7); weil 12 Primitivwurzel mod 7 ist, durchlaufen die sechs
Nichtnull-Reste alle sechs zyklischen Startpositionen derselben Folge.

Abschluss: **186A35 × 7 = BBBBBB** (= 12⁶ − 1 = 2 985 983 dezimal; 426 569 × 7 = 2 985 983).
BBBBBB spielt in Basis 12 die Rolle, die 999999 in Basis 10 spielt (142857 × 7 = 999999).

Formal ist die zyklische Zahl zu p in Basis b der Zähler **(b^(p−1) − 1) / p**.
Für p = 7, b = 12: (12⁶ − 1)/7 = 2 985 983 / 7 = 426 569 = 186A35.

---

## Midys Satz: die Komplement-Eigenschaft

Teilt man die Periode einer full-reptend prime mit gerader Länge in der Mitte, ergänzen
sich die Hälften zur höchsten Ziffer (Midy, 1836; gilt in jeder Basis, b^n − 1 statt
10^n − 1):

```
186 + A35 = BBB        (246 + 1481 = 1727 = 12³ − 1)
```

Erweiterter Midysatz, Zweierpakete (k = 2):

```
18 + 6A + 35 = BB      (20 + 82 + 41 = 143 = 12² − 1)
```

Dezimales Analogon: 142 + 857 = 999; 14 + 28 + 57 = 99.

---

## Andere full-reptend Primzahlen in Basis 12 (nachgerechnet)

| p (dez) | p (doz) | Periode (Basis 12) | Länge | p−1 | full-reptend? |
|--------:|--------:|--------------------|------:|----:|:-------------:|
| 5  | 5  | 2497                            | 4  | 4  | ja  |
| 7  | 7  | 186A35                          | 6  | 6  | ja  |
| 11 | B  | 1                               | 1  | 10 | nein |
| 13 | 11 | 0B                              | 2  | 12 | nein |
| 17 | 15 | 08579214B36429A7                | 16 | 16 | ja  |
| 19 | 17 | 076B45                          | 6  | 18 | nein |
| 23 | 1B | 06316948421                     | 11 | 22 | nein |
| 29 | 25 | 04B7                            | 4  | 28 | nein |
| 31 | 27 | 0478AA093598166B74311B28623A55  | 30 | 30 | ja  |
| 41 | 35 | (40-stellig)                    | 40 | 40 | ja  |
| 43 | 37 | (42-stellig)                    | 42 | 42 | ja  |

Folge der full-reptend primes in Basis 12 (= Primzahlen mit Primitivwurzel 12,
**OEIS A019340**): **5, 7, 17, 31, 41, 43, 53, 67, 101, 103, 113, 127, 137, 139, 149,
151, 163, 173, 197, …**. Unter den Primzahlen bis 100 (ohne 2, 3): 8 von 23 ≈ 35 %.

**1/5 = 0;2497** (Periode 4, full-reptend; Midy: 24 + 97 = BB). Bemerkenswert: 5 ist in
Basis 10 *nicht* full-reptend (1/5 = 0,2 terminiert), in Basis 12 *schon*. Umgekehrt ist
19 in Basis 10 full-reptend (Periode 18), in Basis 12 *nicht* (Periode 6). Die Mengen
überlappen, decken sich aber nicht — die full-reptend-Eigenschaft gehört zum *Paar*
(Basis, Primzahl), nicht zur Primzahl allein.

---

## Zwei Sonderfälle: 1/B und 1/13

**1/B (= 1/11) = 0;1̄** (Periode 1). Da 12 ≡ 1 (mod 11), ist ord_11(12) = 1 — kürzest
mögliche Periode. Genaues Analogon zu 1/9 = 0,1̄ in Basis 10 (10 ≡ 1 mod 9). In Basis 12
übernimmt B = 11 die Rolle der »9«.

**1/13 (= 1/11_doz) = 0;0B** (Periode 2). Da 12 ≡ −1 (mod 13), ist 12² ≡ 1 (mod 13),
also ord_13(12) = 2. Prüfung: 0;0B = 11/(12² − 1) = 11/143 = 11/(11·13) = 1/13. ✓

Beide erzeugen *keine* zyklische Zahl im engeren Sinn — ihre Perioden sind viel kürzer
als p − 1.

---

## Notwendige Bedingung: in Basis 12 enden full-reptend primes auf 5 oder 7

Damit 12 Primitivwurzel mod p ist, darf 12 kein quadratischer Rest mod p sein (ein QR
erzeugt nur Quadrate, nie die volle Restgruppe). Über das Legendre-Symbol:
(12/p) = (4/p)·(3/p) = (3/p), da 4 ein Quadrat ist. (3/p) = −1 gilt genau für
p ≡ 5 oder 7 (mod 12) — d. h. die letzte Ziffer in Basis 12 ist **5 oder 7**.

Das ist **notwendig, nicht hinreichend**: 19 ≡ 7 und 29 ≡ 5 (mod 12) erfüllen es, sind
aber nicht full-reptend (Perioden 6 bzw. 4). In Basis 10 dürfen full-reptend primes auf
1, 3, 7 oder 9 enden (vier Ziffern, teilerfremd zu 10); Basis 12 = 2²·3 ist stärker
eingeschränkt — nur zwei erlaubte Endziffern.

---

## Dichte: Artins Vermutung (unbewiesen)

**Artins Vermutung** (1927): Für jede ganze Zahl b ≠ −1, die kein vollständiges Quadrat
ist, ist b für unendlich viele Primzahlen eine Primitivwurzel; die asymptotische Dichte
beträgt die **Artin-Konstante C ≈ 0,3739558…** aller Primzahlen. Da 12 weder ±1 noch ein
Quadrat ist, gilt sie auch für b = 12 — aber **unbewiesen**.

- Hooley (1967): folgt aus der verallgemeinerten Riemann-Vermutung (GRH).
- Heath-Brown (1986): bedingungslos ist mindestens eine von {2, 3, 5} für unendlich viele
  Primzahlen Primitivwurzel — aber *welche*, bleibt offen; für b = 12 speziell unbekannt.

Empirisch (bis 100): ~35 % — passt zur prognostizierten Größenordnung, beweist sie nicht.

---

## Geschichte und kulturelle Echos

- **Gauss**, *Disquisitiones Arithmeticae* (1801): Periode von 1/p ist das kleinste k mit
  10^k ≡ 1 (mod p).
- **Emil Midy**, Lehrer am Collège de Nantes, 1836: erster Beweis der Komplement-Regel
  (Privatdruck). Der Effekt war Goodwyn um 1802 schon aufgefallen.
- **Martin Gardner**, *Mathematical Circus* (1979), Kap. 10: zyklische Zahlen populär
  aufbereitet (Scientific-American-Kolumne).
- **Shakuntala Devi** nannte 142857 *Ghumakkad Ank* (»die kreisende Zahl«).

Esoterische Überhöhungen (Enneagramm, Kabbala, »vedische Mathematik«) sind Assoziation,
nicht Mathematik — bemerkenswert ist die Zahlentheorie, nicht die kulturelle Verwendung.

---

## Bezug zum Rechner (direkt nachprüfbar)

- **1/7** → `0;` mit Überstrich über `186A35` (Periode 6).
- **2/7** → `35186A` unter Überstrich — exakt dieselbe Folge, rotiert (keine Näherung).
- **1/5** → Überstrich über `2497` (Periode 4).
- **1/B** → Überstrich über der einzigen Ziffer `1`.
- **1/15** (= 1/17 dez) → 16-stellige Periode.
- **1/27** (= 1/31 dez) → 30-stellige Periode; hier greift die Width-Truncation (`…`).
- **1/17** (= 1/19 dez) → `076B45`, Periode 6 statt 18 — sichtbares Gegenbeispiel.

Verweis auf »Wie dieser Rechner rechnet« für die technische Seite der Periodenanzeige.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »In Basis 12 gibt es keine full-reptend Primzahlen.«** Falsch. Eine
fehlerhafte HandWiki-Zusammenfassung legt das nahe (Verwechslung mit der Endziffer-
Bedingung). Korrekt: full-reptend primes in Basis 12 enden auf 5 oder 7 — 5, 7, 17, 31,
41, 43, … sind allesamt full-reptend (alle Perioden hier per Division verifiziert).

**Irrtum 2: »Die Rotation ist Magie ohne Grund.«** Sie folgt zwingend aus k/p = k·(1/p)
und der maximalen Periodenlänge — elementare Zahlentheorie.

**Irrtum 3: »186A35 ist besonders, weil A vorkommt.«** A erscheint nur, weil Reste > 9
auftreten; das ist eine Folge der Basis, kein tieferes Geheimnis (in Basis 10 hat 142857
nur Ziffern 1–8).

**Irrtum 4: »142857 ist die einzige zyklische Zahl.«** Nur die einzige in Basis 10 *ohne
führende Null*. Mit Nullen gibt es (vermutlich) unendlich viele; in Basis 12 sind 2497
und 186A35 die ersten ohne Führungsnull.

**Irrtum 5: »Midys Satz gilt nur für 142857 / Basis 10.«** Er gilt für jede full-reptend
prime in jeder Basis (b^k − 1 statt 10^k − 1).

**Vorbehalt 6: Artins Vermutung ist unbewiesen.** »~37 % aller Primzahlen sind in Basis
12 full-reptend« ist Prognose, kein Satz. Status (ohne GRH): offen — ehrlich zu nennen.

**Vorbehalt 7: »Basis 12 ist nicht pauschal besser/schlechter für Perioden.«** Es gibt
keine globale Längen-Aussage; 1/7 hat in beiden Basen Länge 6, 1/5 in Basis 10 Länge 0,
in Basis 12 Länge 4.

**Vorbehalt 8: Der Begriff »zyklische Zahl« ist nicht streng standardisiert.** Hier eng
gefasst: die Perioden-Ziffernfolge einer full-reptend prime, (b^(p−1) − 1)/p.

---

## Abgrenzung zu bestehenden Kapiteln

»Teiler, Brüche und Perioden« nennt 1/7 und die Grundregel (Periode = ord_b(n)). Dieses
Kapitel liefert den *Grund* (12 ist Primitivwurzel mod 7 ⇒ Länge 6 = p−1), zeigt die
*Konsequenz* (Rotation aller k/7), das *Komplement* (Midy) und das *offene Problem*
(Artin). Es greift nicht in »Die Zahlenbasen im Vergleich« vor (dort nur, dass 5 die
Basis wechselt).

---

## Quellen (Tier-System)

Bewertung: Zuverlässigkeit **R1** (wissenschaftlich/primär) · **R2** (etablierte
Referenz) · **R3** (seriös populär) · **R4** (schwach); Zugang **A1** (Volltext) ·
**A2** (teilweise/Snippet/Paywall) · **A3** (indirekt).

### Zahlentheorie (R1–R2)

- **[R2·A1]** Full reptend prime — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Full_reptend_prime — Definition, Äquivalenz mit
  Primitivwurzel, Periode = p−1, Basis-12-Endziffer 5/7, OEIS A019340, Artin.
- **[R2·A1]** Cyclic number — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Cyclic_number — Formel (b^(p−1)−1)/p,
  Multiplikationseigenschaft, 142857, Basis-12-Beispiele 2497 und 186A35.
- **[R2·A1]** 142857 — Wikipedia (en) — https://en.wikipedia.org/wiki/142857 —
  Rotationen, ×7 = 999999, 142 + 857 = 999.
- **[R2·A1]** Midy's theorem — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Midy%27s_theorem — Satz, Basis-b-Verallgemeinerung,
  erweiterter Midysatz, Midy 1836.
- **[R2·A1]** Multiplicative order — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Multiplicative_order — ord_n(a), Teilbarkeit durch φ(n).
- **[R2·A1]** Primitive root modulo n — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Primitive_root_modulo_n — Definition, Gauß 1801.
- **[R2·A1]** Artin's conjecture on primitive roots — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots — C ≈ 0,3739558,
  Hooley 1967 (GRH), Heath-Brown 1986, Status offen.
- **[R2·A1]** Repeating decimal — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Repeating_decimal — Periodenlänge = ord_b(p), Fermat.
- **[R1·A2]** Keith Conrad, »Orders of Units in Modular Arithmetic« (UConn) —
  https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf — Vollbeweis
  Periodenlänge = ord_b(p); PDF binär, Inhalt über Snippet/Quellenkenntnis.
- **[R1·A2]** Lewittes & Leschiner, »Midy's Theorem for Periodic Decimals«
  (arXiv:math/0605182, 2006) — https://arxiv.org/pdf/math/0605182 — Basis-b-
  Verallgemeinerung; PDF binär, über Abstract/Snippet abgesichert.
- **[R1·A3]** Moree, »Artin's Primitive Root Conjecture — a survey«
  (arXiv:math/0412262) — Gauss-Kontext, Artin-Konstante, offenes Problem (indirekt).

### Dozenal-spezifisch & Folgen (R2–R3)

- **[R2·A1]** Duodecimal — Wikipedia (en) — https://en.wikipedia.org/wiki/Duodecimal —
  Periodentabelle Basis 12, explizit 1/7 = 0;186A35.
- **[R2·A1]** Zyklische Zahl / Lange Primzahl — Wikipedia (de) —
  https://de.wikipedia.org/wiki/Zyklische_Zahl ·
  https://de.wikipedia.org/wiki/Lange_Primzahl — deutsche Terminologie (Conway/Guy),
  186A35, Artin-Konstante.
- **[R2·A2]** OEIS A019340 — Primes with primitive root 12 — https://oeis.org/A019340 —
  full-reptend primes Basis 12; Server 403, Erstglieder über HandWiki gesichert.
- **[R3·A2]** OEIS A246489 — Duodecimal period of 1/(n-ter Prim) — https://oeis.org/A246489 —
  bestätigt Periodenlängen (p=5:4; 7:6; 11:1; 13:2; 17:16; 19:6; 23:11; 29:4; 31:30); 403,
  über Snippet bestätigt.
- **[R3·A2]** Full-reptend prime — HandWiki — https://handwiki.org/wiki/Full_reptend_prime —
  bestätigt Endziffer-5/7 und Basis-12-Liste; enthielt irreführende »no such prime«-
  Formulierung (im Dossier korrigiert).

### Kultur/Geschichte (R2–R3)

- **[R2·A3]** Martin Gardner, *Mathematical Circus*, Kap. 10 (1979; AMS-Nachdruck 2020) —
  zyklische Zahlen populär; über Bibliothekseintrag/Snippet.
- **[R3·A1]** Sujatha Ratnala, »When Digits cycle: The Magical Number 142857« (Medium,
  2021) — Shakuntala Devi (*Ghumakkad Ank*), populäre Darstellung.

### Eigene Verifikation (rechnerisch gesichert)

- Lange Division 1/7, 1/5, 1/B, 1/13, 1/17, 1/19 in Basis 12; alle Produkte 186A35 × 1…7;
  Midy 186 + A35 = BBB und 18 + 6A + 35 = BB; full-reptend-Liste bis 200; Python/BigInt,
  für dieses Dossier reproduzierbar nachgerechnet. Werte stimmen mit OEIS A246489 überein.
</content>
</invoke>
