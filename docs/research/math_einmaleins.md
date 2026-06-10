# Dossier: Das Einmaleins der Zwölf — Muster und Kopfrechentricks

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Tricks im Einmaleins«
**Datum:** 2026-06-10
**Verifikation:** Vollständige 12×12-Tabelle und alle Muster per Python in Basis 12
nachgerechnet.

> Methodik gemäß `docs/research/README.md`. Maßstab `nature_pyrit.md`.

---

## 0. Die Tabelle (Basis 12, selbst gerechnet)

```
×    1   2   3   4   5   6   7   8   9   A   B  10
1    1   2   3   4   5   6   7   8   9   A   B  10
2    2   4   6   8   A  10  12  14  16  18  1A  20
3    3   6   9  10  13  16  19  20  23  26  29  30
4    4   8  10  14  18  20  24  28  30  34  38  40
5    5   A  13  18  21  26  2B  34  39  42  47  50
6    6  10  16  20  26  30  36  40  46  50  56  60
7    7  12  19  24  2B  36  41  48  53  5A  65  70
8    8  14  20  28  34  40  48  54  60  68  74  80
9    9  16  23  30  39  46  53  60  69  76  83  90
A    A  18  26  34  42  50  5A  68  76  84  92  A0
B    B  1A  29  38  47  56  65  74  83  92  A1  B0
10  10  20  30  40  50  60  70  80  90  A0  B0 100
```

---

## 1. Die Reihen mit kurzem Schwanz (Teiler von 12)

Die Vielfachen der Teiler 2, 3, 4, 6 enden in **kurzen, sich wiederholenden** Zyklen — das
macht sie leicht auswendig:

- **2er-Reihe:** Endziffern immer gerade (0,2,4,6,8,A …).
- **3er-Reihe:** Endziffern 3, 6, 9, 0, 3, 6, 9, 0 … (Viererzyklus).
- **4er-Reihe:** Endziffern 4, 8, 0, 4, 8, 0 … (Dreierzyklus).
- **6er-Reihe:** Endziffern 6, 0, 6, 0 … (Zweierzyklus).

**Mal Zwölf = eine Null anhängen:** n · 10 (zwölf) verschiebt nur um eine Stelle (7·10 = 70).
**Mal Sechs** ist die „halbe Null": 6·n endet auf 0, wenn n gerade, sonst auf 6.

---

## 2. Die Elfer-Reihe als Spiegel

Die schönste Reihe ist die der Elf (B): **B, 1A, 29, 38, 47, 56, 65, 74, 83, 92, A1, B0.**
Zwei Muster zugleich (selbst geprüft):

1. Die **Zehnerstelle klettert** 0, 1, 2, …, A, während die **Einerstelle fällt** B, A, 9,
   …, 0.
2. In jedem Produkt **summieren sich die beiden Ziffern zu B** (eins-A: 1+10=11; zwei-9:
   2+9=11; …).

Das ist das genaue Gegenstück zur Neuner-Reihe in Basis 10 (dort summieren sich die Ziffern
zu 9). **Kopfrechentrick:** B·n = 10·n − n (mal zwölf, dann das n wieder abziehen). Beispiel:
B·7 = 70 − 7 = 65 (in Basis 12). Verifiziert: B·7 = 65. ✓

---

## 3. Die störrischen Reihen: Fünf und Sieben

Fünf und Sieben (und die Eins und die Elf) sind teilerfremd zur Zwölf. Ihre Reihen laufen
darum **durch alle zwölf möglichen Endziffern**, bevor sich etwas wiederholt — kein kurzer
Zyklus, der das Merken erleichtert. Die 5er-Endziffern: 5, A, 3, 8, 1, 6, B, 4, 9, 2, 7, 0;
die 7er-Endziffern: 7, 2, 9, 4, B, 6, 1, 8, 3, A, 5, 0.

Dasselbe Quartett 1, 5, 7, B, das schon auf der Stundenuhr und bei den Primziffern auftrat,
kehrt hier wieder: genau diese Reihen sind die „vollen" — und genau deshalb haben 1/5 und
1/7 die langen, vollen Perioden aus dem Kapitel über zyklische Zahlen. (In Basis 10 ist die
7er-Reihe die berüchtigt sperrige — hier sind es Fünf und Sieben.)

---

## 4. Quadrate und das Gross

Die Diagonale der Tabelle sind die Quadratzahlen: 1, 4, 9, 14, 21, 30, 41, 54, 69, 84, A1,
**100**. Das letzte ist zwölf mal zwölf = ein **Gross** (144 dezimal), das in Basis 12 glatt
„100" heißt — wie hundert im Zehnersystem. Schon hier zeigt sich, wie rund die Zwölf ihre
eigene Quadratzahl schreibt.

Praktisch sind in Basis 12 auch das **Verdoppeln und Halbieren** bequem, weil zwölf gerade
ist (Hälfte von 10 ist 6; Hälfte von 6 ist 3).

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »Das Einmaleins ist in Basis 12 insgesamt leichter.«** Nur teilweise. Die
Teiler-Reihen (2,3,4,6) sind leichter, dafür sind Fünf und Sieben schwerer als im
Zehnersystem. Die Tabelle ist auch größer (12×12 statt 10×10).

**Irrtum 2: »Die Ziffern der Elfer-Reihe summieren sich zu zehn.«** Nein, zu **elf** (= B),
weil B die Basis minus eins ist. Im Zehnersystem ist es die Neun.

**Irrtum 3: »Mal sechs endet immer auf sechs.«** Nur bei ungeradem Faktor; bei geradem auf
null (6·2 = 10, 6·4 = 20).

**Irrtum 4: »Tricks sind Beweise.«** Die Muster sind verlässliche Merkhilfen, beruhen aber
auf der Arithmetik der Basis — der Spiegeltrick der Elf folgt direkt aus B = 10 − 1.

**Irrtum 5: »100 in Basis 12 ist hundert.«** Nein — „100" bedeutet hier zwölf mal zwölf =
hundertvierundvierzig (ein Gross).

---

## Abgrenzung

»Teilbarkeit und die Elfer-Probe« behandelt das Erkennen von Teilern; dieses Kapitel die
Multiplikationstabelle und ihre Muster. »Zyklische Zahlen« erklärt, *warum* die Fünf- und
Sieben-Reihe voll durchlaufen (Primitivwurzel) — hier nur die sichtbare Folge im Einmaleins.
»Die Uhr als Gruppe« liefert dasselbe Quartett 1, 5, 7, B aus algebraischer Sicht.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1**/**R2**/**R3**; Zugang **A1**/**A2**/**A3**.

- **[R2·A1]** Duodecimal — Wikipedia — https://en.wikipedia.org/wiki/Duodecimal — Einmaleins, Teilbarkeit und Muster in Basis 12.
- **[R2·A1]** Multiplication table — Wikipedia — https://en.wikipedia.org/wiki/Multiplication_table — Muster der Reihen, Diagonale der Quadrate, Symmetrie.
- **[R2·A2]** Multiplicative group of integers modulo n — Wikipedia — https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n — warum die zu 12 teilerfremden Reihen alle Endziffern durchlaufen.
- **[R3·A2]** Dozenal Society of America — Manuale — https://dozenal.org — dozenale Kopfrechentechniken (PDF-Manuale; Beleg-Kandidat, nicht im Volltext geprüft).

### Eigene Verifikation (R1·A1)
- Python (Basis 12): vollständige 12×12-Tabelle; Endziffer-Zyklen 2/3/4/6; Elfer-Reihe
  (Ziffernsummen alle = B, Spiegelmuster); B·n = 10·n − n (B·7 = 65); 5er-/7er-Endziffern
  durchlaufen alle zwölf; Quadrate 1…100; 100 = 144. Reproduzierbar.
</content>
