# Dossier: 12! und die Reihenfolgen — Fakultät, Permutationen, Glockenläuten

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »12! und die Reihenfolgen«
**Datum:** 2026-06-10
**Verifikation:** Alle Zahlen per Python/Bash nachgerechnet. Merge aus drei Recherche-
Dossiers (perm_a Kombinatorik · perm_b Change Ringing · perm_c Gruppen-Brücke).

> Methodik gemäß `docs/research/README.md`. Maßstab `nature_pyrit.md`,
> `math_zyklische_zahlen.md`.

---

## 1. Fakultät: die Anzahl der Reihenfolgen

n! = 1·2·3·…·n zählt die Reihenfolgen, in die man n unterscheidbare Dinge bringen kann:
für den ersten Platz n Wahlmöglichkeiten, dann n−1, dann n−2 … bis 1. Ein Dutzend Dinge
(12 Monate, 12 Gäste, 12 Tonarten) in eine Reihe: 12! Möglichkeiten.

Tabelle (selbst gerechnet; Basis 12 mitgeführt):

| n | n! (dezimal) | n! (Basis 12) |
|--:|-------------:|--------------:|
| 0 | 1 | 1 |
| 1 | 1 | 1 |
| 2 | 2 | 2 |
| 3 | 6 | 6 |
| 4 | 24 | 20 |
| 5 | 120 | A0 |
| 6 | 720 | 500 |
| 7 | 5040 | 2B00 |
| 8 | 40320 | 1B400 |
| 9 | 362880 | 156000 |
| A | 3628800 | 1268000 |
| B | 39916800 | 11450000 |
| 10 | 479001600 | 114500000 |

**0! = 1**: es gibt genau eine Reihenfolge von nichts (die leere). Konvention mit gutem
Grund — sie hält die Formeln widerspruchsfrei.

---

## 2. Die Zahl 12!

**12! = 479 001 600** (dezimal) = **114 500 000** (Basis 12). Knapp eine halbe Milliarde.

In Basis 12 endet 12! auf **fünf Nullen**: 12! = 2¹⁰ · 3⁵ · 5² · 7 · 11, und jede „runde
Stelle" 12 = 2²·3 verbraucht zwei Zweien und eine Drei; davon gibt es min(10/2, 5) = 5.
(In Basis 10 endet 12! auf zwei Nullen, weil nur min(10, 2) = 2 Fünfer-Zweier-Paare
übrig.) Die vielen Endnullen sind ein Dozenal-Effekt.

Größeneinordnung: Zeigte man jede Sekunde eine neue Reihenfolge, bräuchte man für alle 12!
rund **15,18 Jahre** (479 001 600 / 31 557 600 Sekunden je Jahr). An einem **runden** Tisch
zählt nur die Sitz*folge*, nicht der Startplatz — dann sind es (12−1)! = **11! = 39 916 800**
Anordnungen.

---

## 3. Auswahl mit und ohne Reihenfolge

- **Geordnete Auswahl** (Permutation): P(n,k) = n!/(n−k)!. Drei aus zwölf, Reihenfolge
  zählt: 12·11·10 = **1320**.
- **Ungeordnete Auswahl** (Kombination): C(n,k) = n!/(k!(n−k)!). Sechs aus zwölf:
  „12 über 6" = **924**. Zwei aus zwölf (alle Paare): **66**.

Beide ruhen auf der Fakultät. **Verbreiteter Sprachfehler:** „Permutation" (Reihenfolge
zählt) und „Kombination" (zählt nicht) werden umgangssprachlich vertauscht; das
Zahlenschloss ist eigentlich ein „Permutationsschloss".

**Bezug zum Rechner:** Die Fakultäts-Taste (n!) liefert direkt 12! in Basis 12. Postfix
bindet stärker als unäres Minus: −3! = −(3!) (Architektur-Konvention).

---

## 4. Glocken, die alle Reihenfolgen läuten (Change Ringing)

In englischen Kirchtürmen läutet man Glocken seit dem frühen 17. Jahrhundert in
wechselnden **Reihenfolgen** (Permutationen), nicht in Melodien — *change ringing*. Ein
**Extent** ist die Folge aller n! Reihenfolgen, jede genau einmal. Pro Glockenzahl ein
eigener Name: Singles (3), Minimus (4), Doubles (5), Minor (6), Triples (7), Major (8),
Caters (9), Royal (10), Cinques (11), **Maximus (12)**.

Ein voller Extent auf 12 Glocken wären 12! = 479 001 600 Wechsel. Bei realistischen ~2
Sekunden je Wechsel sind das **Jahrzehnte Dauerläuten** (rund 24–35 Jahre) — ein
vollständiger 12!-Extent wurde **nie** geläutet und gilt als praktisch unmöglich. Tatsächlich
geläutete Dauer-Stücke („peals") auf 12 Glocken erreichen nur einige **Zehntausend**
Wechsel, also einen winzigen Bruchteil. Der einzige je vollständig geläutete Extent auf
Turmglocken war 1963 in Loughborough auf **8** Glocken (8! = 40 320 Wechsel, knapp 18
Stunden).

Schöner Nebenfakt: Der Algorithmus, alle Permutationen durch Vertauschen *benachbarter*
Elemente zu erzeugen, war den Glöcknern um 1621 geläufig — Mathematiker (Steinhaus,
Johnson, Trotter) „entdeckten" ihn erst um 1962 neu.

---

## 5. Aus der Zahl wird eine Gruppe

Nimmt man alle Umordnungen eines Dutzends und verknüpft sie durch *Hintereinanderausführung*
(erst die eine, dann die andere), entsteht die **symmetrische Gruppe S₁₂** mit genau 12!
Elementen. Anders als die Uhr-Gruppe ℤ/12ℤ ist sie **nicht kommutativ**: die Reihenfolge
der Umordnungen ändert das Ergebnis.

Jede Umordnung ist **gerade** oder **ungerade** (je nach Anzahl der Vertauschungen). Die
geraden bilden die **alternierende Gruppe A₁₂** mit 12!/2 = **239 500 800** Elementen.

**Cliffhanger:** Unter den fast einer halben Milliarde Umordnungen gibt es eine winzige,
extrem symmetrische Auswahl von nur **95 040** (= 12·11·10·9·8), die „fünf beliebige Punkte
auf fünf beliebige andere genau auf eine Weise" abbildet — die Mathieu-Gruppe M₁₂. Der
Index [S₁₂ : M₁₂] ist 479 001 600 / 95 040 = **5040 = 7!**. Davon handelt das nächste
Kapitel.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »0! = 0«.** Nein, 0! = 1 (genau eine leere Anordnung). Konvention mit gutem
Grund, kein Trick.

**Irrtum 2: »Permutation = Kombination«.** Permutation zählt die Reihenfolge mit,
Kombination nicht. Umgangssprachlich vertauscht.

**Irrtum 3: »n! zählt Teilmengen«.** Nein — n! zählt *Reihenfolgen* aller n Dinge.
Teilmengen zählt 2ⁿ, Auswahlen zählen die Binomialkoeffizienten.

**Irrtum 4: »Change ringing ist Zwölf-Mystik«.** Es ist Permutations-Handwerk; die 12
ist nur die typische Turm-Glockenzahl (Maximus), keine magische Eigenschaft.

**Vorbehalt 5: Rekord-Längen schwanken.** Wie viele Wechsel das längste je auf 12 Glocken
geläutete Stück hatte, geben Quellen unterschiedlich an (Kategorisierung nach Methode).
Deshalb hier nur „einige Zehntausend / ein winziger Bruchteil", keine harte Rekordzahl.

**Vorbehalt 6: 12! ist groß, aber nicht riesig.** Ein Kartenspiel hat 52! Reihenfolgen —
unvorstellbar mehr. 12! ist gerade noch greifbar (Jahre, nicht Universumsalter).

---

## Abgrenzung

»Die Uhr als Gruppe (ℤ/12ℤ)« behandelt die *additive, kommutative* Gruppe; hier geht es um
*Verkettung* von Umordnungen (nicht-kommutativ, S₁₂). »S(5,6,12) / M₁₂« setzt den
Cliffhanger fort. »Fibonacci, Quadratzahlen und Kuriositäten« berührt Fakultäten nicht.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1**/**R2**/**R3**; Zugang **A1**/**A2**/**A3**.

### Kombinatorik (R2)
- **[R2·A1]** Factorial — Wikipedia — https://en.wikipedia.org/wiki/Factorial — n!, 0!=1, Wachstum, Anwendungen.
- **[R2·A1]** Permutation — Wikipedia — https://en.wikipedia.org/wiki/Permutation — geordnete Anordnungen, P(n,k).
- **[R2·A1]** Combination — Wikipedia — https://en.wikipedia.org/wiki/Combination — C(n,k), Binomialkoeffizient.
- **[R2·A2]** Twelvefold way — Wikipedia — https://en.wikipedia.org/wiki/Twelvefold_way — systematischer Überblick Abzählung.

### Change Ringing (R2–R3)
- **[R2·A1]** Change ringing — Wikipedia — https://en.wikipedia.org/wiki/Change_ringing — Permutations-Läuten, Stufennamen, Extent.
- **[R2·A1]** Extent (change ringing) — Wikipedia — https://en.wikipedia.org/wiki/Extent_(change_ringing) — voller Extent = n! Wechsel.
- **[R2·A1]** Method ringing / Maximus — Wikipedia — https://en.wikipedia.org/wiki/Method_ringing — Maximus (12), Plain Bob, Grandsire.
- **[R2·A2]** Steinhaus–Johnson–Trotter algorithm — Wikipedia — https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm — benachbarte Vertauschungen, Bezug zum Glockenläuten.
- **[R3·A2]** Peal records (CCCBR u. a.) — variierende Längenangaben für 12-Glocken-Peals; deshalb im Dossier nur als „einige Zehntausend" geführt.

### Gruppen (R2)
- **[R2·A1]** Symmetric group — Wikipedia — https://en.wikipedia.org/wiki/Symmetric_group — |Sₙ| = n!, nicht-abelsch.
- **[R2·A1]** Alternating group — Wikipedia — https://en.wikipedia.org/wiki/Alternating_group — |Aₙ| = n!/2.
- **[R2·A1]** Parity of a permutation — Wikipedia — https://en.wikipedia.org/wiki/Parity_of_a_permutation — gerade/ungerade wohldefiniert.

### Eigene Verifikation (R1·A1)
- Python/Bash: 0!–12! dezimal & Basis 12; 12! = 2¹⁰·3⁵·5²·7·11; 11! = 39 916 800;
  P(12,3)=1320, C(12,6)=924, C(12,2)=66; |S₁₂|=12!, |A₁₂|=12!/2=239 500 800;
  Index S₁₂/M₁₂ = 5040 = 7!; 12!/Jahr ≈ 15,18. Alle reproduzierbar.
</content>
