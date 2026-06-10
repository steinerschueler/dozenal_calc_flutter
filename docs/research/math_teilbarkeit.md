# Dossier: Teilbarkeitsproben und die Elfer-Probe in Basis 12

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Teilbarkeit und die Elfer-Probe«
**Baut auf:** »Teiler, Brüche und Perioden« (dort nur kurz angerissen)
**Datum:** 2026-06-10
**Verifikation:** Alle Regeln und Beispiele per Python in Basis 12 nachgerechnet.

> Methodik gemäß `docs/research/README.md`. Maßstab `nature_pyrit.md`.

---

## 1. Die letzte Ziffer verrät die Teiler von 12

In Basis 12 ist die letzte Ziffer der Rest modulo 12. Darum erkennt man die Teilbarkeit
durch jeden **Teiler von 12** sofort an der Endziffer:

| Teiler | teilbar, wenn Endziffer … |
|-------:|---------------------------|
| 2 | gerade: 0, 2, 4, 6, 8, A |
| 3 | 0, 3, 6, 9 |
| 4 | 0, 4, 8 |
| 6 | 0, 6 |
| 12 | 0 |

Das ist der praktische Vorzug der Zwölf: In Basis 10 verrät die Endziffer nur 2, 5 und 10;
in Basis 12 sind es 2, 3, 4, 6 — die häufigeren Teiler. (Beweis: 12 ist durch 2, 3, 4, 6
teilbar, also hängt der Rest mod 2/3/4/6 nur am letzten Stellenwert.)

---

## 2. Die Quersumme prüft die Elf (B) — die Elfer-Probe

Weil **12 ≡ 1 (mod 11)** ist, lässt jede Potenz von 12 beim Teilen durch 11 den Rest 1.
Eine Zahl hat darum modulo 11 denselben Rest wie ihre **Ziffernsumme** (Quersumme). Also:

> Eine Zahl ist in Basis 12 genau dann durch B (elf) teilbar, wenn ihre Quersumme durch B
> teilbar ist.

Das ist das **genaue Gegenstück zur Neunerprobe** in Basis 10 (dort 10 ≡ 1 mod 9, Quersumme
prüft die 9). In Basis 12 prüft die Quersumme die Elf — die **Elfer-Probe**.

Beispiel (selbst gerechnet): 4B7 in Basis 12 (= 715). Quersumme 4 + B + 7 = 1A (= 22 = 2·11),
durch B teilbar — also ist 4B7 durch B teilbar (715 = 11 · 65). ✓

Wie die Neunerprobe taugt die Elfer-Probe als **Rechenkontrolle** („Elfer wegstreichen"):
Stimmt eine Multiplikation, müssen die Quersummen-Reste der Faktoren multipliziert den
Quersummen-Rest des Ergebnisses ergeben (mod B).

**Achtung, Stolperstein:** In Basis 10 heißt „Elferprobe" die *alternierende* Quersumme
(weil dort 11 = Basis+1). In Basis 12 ist die Elf = Basis−1, daher prüft sie die *einfache*
Quersumme. Derselbe Name, andere Mechanik — der Wechsel der Basis vertauscht die Rollen.

---

## 3. Die alternierende Quersumme prüft die Dreizehn

Weil **12 ≡ −1 (mod 13)** ist, wechseln die Stellenwerte modulo 13 das Vorzeichen:
1, −1, 1, −1, … Eine Zahl hat darum modulo 13 denselben Rest wie ihre **alternierende
Quersumme** (abwechselnd plus/minus von rechts).

> Eine Zahl ist in Basis 12 genau dann durch 13 (dreizehn) teilbar, wenn ihre alternierende
> Quersumme durch 13 teilbar ist.

Das ist das Gegenstück zur alternierenden Elferprobe in Basis 10 (dort 10 ≡ −1 mod 11).
Beispiel: AA in Basis 12 (= 130 = 13·10); alternierend A − A = 0, durch 13 teilbar. ✓
121 in Basis 12 (= 169 = 13·13); 1 − 2 + 1 = 0. ✓ (Dreizehn schreibt sich in Basis 12 als
„11" — siehe Vorbehalt unten.)

---

## 4. Was in Basis 12 schwer bleibt: 5 und 7

Kein Vorteil ohne Preis. Fünf und Sieben sind teilerfremd zur Zwölf und zu 11 und 13 —
für sie gibt es **keine** einfache Endziffer- oder Quersummenregel. Gerade die Fünf, die in
Basis 10 die bequemste Regel überhaupt hat (Endziffer 0 oder 5), wird in Basis 12 unhandlich.
Die Zwölf tauscht die leichte Fünf-Probe gegen leichte Drei-, Vier- und Sechs-Proben.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »Elferprobe heißt überall alternierende Quersumme.«** Nein — das gilt in Basis
10. In Basis 12 prüft die *einfache* Quersumme die Elf; die *alternierende* prüft die
Dreizehn. Die Mechanik hängt an der Basis (11 = Basis−1, 13 = Basis+1), nicht am Namen.

**Irrtum 2: »13 schreibt sich als 13.«** In Basis 12 ist dreizehn = 11 (eins-eins:
ein Zwölfer und ein Einer). Damit es nicht mit der Zahl elf verwechselt wird, nennen wir
sie im Text bei ihrem Wert „dreizehn".

**Irrtum 3: »Teilbarkeitsregeln beweisen die Zahl, nicht nur den Rest.«** Eine Regel zeigt
*Teilbarkeit*, ersetzt aber keine Primzahlprüfung. Endziffer B macht eine Zahl nicht prim.

**Irrtum 4: »Quersumme prüft auch die 3 wie in Basis 10.«** Nein. In Basis 10 prüft die
Quersumme 9 *und* 3 (Teiler von 9). In Basis 12 prüft sie nur Teiler von 11 — und 11 ist
prim, also nur die Elf. Die Drei verrät hier die *Endziffer* (weil 3 | 12), nicht die
Quersumme.

**Irrtum 5: »Die Proben sind fehlerfrei.«** Neuner-/Elferproben erkennen viele, aber nicht
alle Rechenfehler (ein Fehler, der den Rest nicht ändert, schlüpft durch). Sie sind ein
schneller Plausibilitätstest, kein Beweis.

---

## Abgrenzung

»Teiler, Brüche und Perioden« nennt die Endziffer-Regeln und die B-Quersumme in einem Satz;
dieses Kapitel führt alle Proben aus, erklärt das *Warum* (12 ≡ 0/1/−1 modulo Teiler/11/13)
und ist ehrlich zum Preis (kein leichtes 5er-/7er-Kriterium). »Einmaleins-Tricks« behandelt
die Multiplikationstabelle, nicht die Teilbarkeit.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1**/**R2**/**R3**; Zugang **A1**/**A2**/**A3**.

- **[R2·A1]** Divisibility rule — Wikipedia — https://en.wikipedia.org/wiki/Divisibility_rule — allgemeines Prinzip, Quersumme/alternierende Quersumme über Basis±1; enthält Basis-12-Hinweise.
- **[R2·A1]** Duodecimal — Wikipedia — https://en.wikipedia.org/wiki/Duodecimal — Teilbarkeitsregeln in Basis 12 (Endziffer 2/3/4/6, Quersumme B, alternierend für 13).
- **[R2·A1]** Casting out nines — Wikipedia — https://en.wikipedia.org/wiki/Casting_out_nines — Neunerprobe als Rechenkontrolle; Verallgemeinerung auf Basis−1.
- **[R2·A2]** Modular arithmetic — Wikipedia — https://en.wikipedia.org/wiki/Modular_arithmetic — Begründung über Kongruenzen (12 ≡ 1 mod 11, 12 ≡ −1 mod 13).
- **[R3·A2]** Dozenal Society of America — Manuale/Teilbarkeit — https://dozenal.org — Dozenal-Teilbarkeitsregeln (PDF-Manuale; als Beleg-Kandidat, nicht im Volltext geprüft).

### Eigene Verifikation (R1·A1)
- Python (Basis 12): Endziffer-Mengen für 2/3/4/6/12; Quersummentest für B an Beispielen
  (4B7=715=11·65); alternierender Test für 13 (AA=130, 121=169); 12 mod 11 = 1, 12 mod 13 =
  12 (≡ −1). Reproduzierbar.
</content>
