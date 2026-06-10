# Dossier: S(5,6,12) und die Mathieu-Gruppe M₁₂

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Die Mathieu-Gruppe M₁₂« (das „Wow"-Kapitel)
**Datum:** 2026-06-10
**Verifikation:** Alle Zahlen per Python/Bash nachgerechnet. Merge aus drei Recherche-
Dossiers (m12_a Steiner/Konstruktion · m12_b Geschichte/Nische · m12_c Zahlen/Vorbehalte).

> Methodik gemäß `docs/research/README.md`. Maßstab `nature_pyrit.md`,
> `math_zyklische_zahlen.md`. **Hohe didaktische Hürde** — die Prosa vermittelt das
> Staunen, nicht die volle Konstruktion.

---

## 1. Scharfe 5-Transitivität — die eine erlaubte Umordnung

Unter den 12! = 479 001 600 Umordnungen eines Dutzends gibt es eine winzige Auswahl von
genau **95 040**, die eine fast unglaubliche Eigenschaft hat: **Wähle fünf der zwölf
Punkte in einer Reihenfolge und sage, wohin jeder soll — dann gibt es unter den 95 040
genau eine Umordnung, die das leistet. Nicht zwei, nicht null: genau eine.** Das heißt
*scharf 5-transitiv*.

Daraus folgt die Größe direkt: für das Bild des ersten Punktes 12 Wahlen, dann 11, 10, 9,
8 — und der Rest ist festgelegt. **|M₁₂| = 12·11·10·9·8 = 95 040** = 2⁶·3³·5·11 (in Basis
12: 47000). Diese Gruppe heißt **Mathieu-Gruppe M₁₂**.

Schöner Nebenfakt: Der Index in der vollen Umordnungsgruppe ist [S₁₂ : M₁₂] =
479 001 600 / 95 040 = **5040 = 7!**.

---

## 2. Das Steiner-System S(5,6,12) — die bewahrte Form

Was halten diese 95 040 Umordnungen fest? Eine kombinatorische Figur namens **S(5,6,12)**:
eine Sammlung von Sechser-Teilmengen („Hexaden") der zwölf Punkte, sodass **jede
Fünfer-Auswahl in genau einer Hexade steckt**.

Anzahl der Hexaden (selbst gerechnet): jede der C(12,5) = 792 Fünfermengen liegt in genau
einer Hexade, und jede Hexade enthält C(6,5) = 6 Fünfermengen, also **792 / 6 = 132**
Hexaden. Dieses System ist (bis auf Umbenennung der Punkte) **eindeutig** — ein tiefes
Resultat (Witt, 1938). M₁₂ ist genau die Gruppe der Punkt-Umordnungen, die die 132 Hexaden
als Ganzes erhalten (die *Automorphismengruppe* von S(5,6,12)).

Ein **Steiner-System S(t,k,n)** allgemein: k-elementige Blöcke einer n-Menge, jede
t-Auswahl in genau einem Block. S(5,6,12) ist der berühmteste kleine Fall.

---

## 3. Warum gerade die Zwölf — der Satz von Jordan

Das eigentliche Staunen ist nicht, *dass* M₁₂ symmetrisch ist, sondern *wie selten* solche
Gruppen sind. **Camille Jordan (1872):** Außer den „erwartbaren" Beispielen
(symmetrische/alternierende Gruppen) ist die *einzige* scharf 5-transitive Gruppe **M₁₂ auf
12 Punkten**. Scharf 4-transitiv gibt es als Ausnahme nur **M₁₁ auf 11 Punkten**. Es gibt
keine scharf 6-transitive Ausnahme.

Anders gesagt: Genau auf 11 und 12 Punkten existieren diese außergewöhnlich perfekten
Symmetrien — sonst nirgends (jenseits der trivialen Familien). Die Zwölf ist also eine von
einer Handvoll Zahlen, die so etwas tragen. Das ist ein mathematisches, kein mystisches
Faktum.

---

## 4. Die erste ihrer Art — sporadische einfache Gruppen

M₁₂ ist eine **einfache** Gruppe: sie lässt sich nicht in kleinere Normal-Bausteine
zerlegen (so wie Primzahlen sich nicht in Faktoren zerlegen). Einfache Gruppen sind die
„Atome" aller endlichen Gruppen. Die meisten gehören zu unendlichen Familien — bis auf
**26 Ausnahmen, die sporadischen Gruppen.**

**Émile Mathieu** beschrieb M₁₂ und M₂₄ 1861 und 1873 — die **ersten je entdeckten
sporadischen Gruppen**, fast ein Jahrhundert vor dem Rest. Die fünf Mathieu-Gruppen (M₁₁,
M₁₂, M₂₂, M₂₃, M₂₄) bilden die „erste Generation"; die Reihe der sporadischen Gruppen
gipfelt im riesigen **Monster**. Ihre vollständige Klassifikation (abgeschlossen ~2004) ist
eines der größten Gemeinschaftswerke der Mathematik (zehntausende Seiten).

Historische Ehrlichkeit: Mathieus Originalbeweise wurden **angezweifelt** — G. A. Miller
behauptete 1898 sogar, M₂₄ existiere nicht. Erst **Ernst Witt** lieferte 1938 die
unangreifbare Konstruktion über die Steiner-Systeme. M₁₁ ⊂ M₁₂ als Punktstabilisator
(|M₁₁| = 7920 = 11·10·9·8).

---

## 5. Zum Anfassen — Kartenmischen und ein Spiel

So abstrakt M₁₂ ist, es gibt greifbare Realisierungen:

- **Mongesches Mischen (Mongean shuffle) von 12 Karten:** M₁₂ lässt sich von zwei
  Kartenmisch-Operationen erzeugen — berichtet in mehreren Quellen (nicht selbst
  nachgerechnet, daher als „berichtet" geführt).
- **Mathematisches Blackjack** (Conway & Ryba; Curtis-„Kitten"/MINIMOG): ein Spiel mit den
  zwölf Zahlen 0–B, dessen Gewinnstrategie direkt auf den Hexaden von S(5,6,12) beruht.
- Verbindung zum **ternären Golay-Code** (Fehlerkorrektur) — dieselbe Struktur in der
  Kodierungstheorie.

**Bezug zum Rechner (ehrlich schwach):** Dieses Kapitel ist reine Theorie-Schönheit, kein
Rechner-Tutorial. Höchstens lassen sich die Kennzahlen in Basis 12 darstellen: 95 040 =
47000, 132 = B0.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »M₁₂ macht die Zwölf magisch.«** Nein. Analoge Strukturen leben auf 11, 22, 23
und 24 Punkten (M₁₁, M₂₂, M₂₃, M₂₄). Die 12 ist *eine* von wenigen Trägern, nicht die
einzige; die Konstruktion lebt von der scharfen 5-Transitivität, nicht von Dozenal-Mystik.

**Irrtum 2: »einfach« heißt »leicht«.** „Einfach" ist ein Fachbegriff: keine nichttrivialen
Normalteiler. M₁₂ ist alles andere als leicht.

**Irrtum 3: »Steiner hat S(5,6,12) gebaut.«** Der Name ehrt Jakob Steiner, doch die
konkrete Konstruktion auf 12 Punkten stammt von Mathieu (1861) und gesichert von Witt
(1938) — ein historischer Benennungs-Zufall.

**Irrtum 4: »M₁₂ ist die Symmetriegruppe des Dodekaeders/Zwölfecks.«** Nein. Das Zwölfeck
hat D₁₂ (24 Elemente), der Dodekaeder die Ikosaedergruppe (120). M₁₂ (95 040) ist etwas
ganz anderes — eine Permutationsgruppe auf 12 abstrakten Punkten, keine Raumsymmetrie.

**Irrtum 5: »Mathieus Entdeckung war sofort akzeptiert.«** Im Gegenteil — sie war jahrzehnte­
lang umstritten (Miller 1898), bis Witt 1938 Klarheit schuf.

**Vorbehalt 6: Der Eindeutigkeits- und Klassifikationsrahmen ist tief.** Die Aussage
„M₁₂ ist die einzige scharf 5-transitive Ausnahme" ruht letztlich auf großer Theorie
(Jordan; im vollen Umfang auf der Klassifikation endlicher einfacher Gruppen). Die Prosa
berichtet das Ergebnis, nicht den Beweis.

**Vorbehalt 7: Mongean-Shuffle-Erzeugung nicht selbst verifiziert** — aus zwei Quellen
übernommen, als „berichtet" gekennzeichnet.

---

## Abgrenzung

»12! und die Reihenfolgen« liefert den Cliffhanger (95 040 unter 12!) und die Begriffe
(Umordnung, S₁₂). Dieses Kapitel führt ihn aus. »Die Uhr als Gruppe (ℤ/12ℤ)« behandelt
eine ganz andere, kommutative Gruppe — kein inhaltlicher Schnitt. »Der Dodekaeder«
behandelt Raumsymmetrie (Ikosaedergruppe), nicht M₁₂.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1**/**R2**/**R3**; Zugang **A1**/**A2**/**A3**.

### Gruppen & Steiner-Systeme (R1–R2)
- **[R2·A1]** Mathieu group M12 — Wikipedia — https://en.wikipedia.org/wiki/Mathieu_group_M12 — |M₁₂|=95040, scharf 5-transitiv, Aut(S(5,6,12)), M₁₁-Stabilisator.
- **[R2·A1]** Mathieu group — Wikipedia — https://en.wikipedia.org/wiki/Mathieu_group — fünf Mathieu-Gruppen, Mathieu 1861/1873, Witt 1938, Miller-Zweifel.
- **[R2·A1]** Steiner system — Wikipedia — https://en.wikipedia.org/wiki/Steiner_system — S(t,k,n), S(5,6,12) 132 Hexaden, Eindeutigkeit, Aut = M₁₂.
- **[R2·A1]** Sporadic group — Wikipedia — https://en.wikipedia.org/wiki/Sporadic_group — 26 sporadische Gruppen, Mathieu erste Generation, Monster.
- **[R2·A1]** Multiply transitive group / Jordan — Wikipedia — https://en.wikipedia.org/wiki/Multiply_transitive_group — scharf k-transitiv, Jordan-Klassifikation (nur M₁₁, M₁₂ als Ausnahmen).
- **[R2·A1]** Classification of finite simple groups — Wikipedia — https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups — Umfang, Abschluss ~2004.
- **[R2·A2]** Conway & Sloane, *Sphere Packings, Lattices and Groups* (SPLAG) — Mathieu-Gruppen, Golay-Code, Standardreferenz; Paywall/Bibliothek.

### Geschichte (R2)
- **[R2·A1]** Émile Mathieu — Wikipedia / MacTutor — https://en.wikipedia.org/wiki/%C3%89mile_L%C3%A9onard_Mathieu — Leben, 1861/1873.
- **[R2·A1]** Ernst Witt — Wikipedia — https://en.wikipedia.org/wiki/Ernst_Witt — Witt 1938, Konstruktion via Steiner-Systeme.

### Nische (R2–R3)
- **[R3·A1]** Mathematical blackjack / MINIMOG — yetanothermathblog + SageMath-Doku — Conway, Curtis 1984, Conway & Ryba; Spielregeln aus Hexaden.
- **[R3·A2]** Mongean shuffle generiert M₁₂ — mehrere Quellen, als „berichtet" geführt (nicht selbst verifiziert).
- **[R2·A2]** Ternary Golay code — Wikipedia — https://en.wikipedia.org/wiki/Ternary_Golay_code — Verbindung zu M₁₂.

### Eigene Verifikation (R1·A1)
- Python/Bash: C(12,5)=792, C(6,5)=6 → 132 Hexaden; |M₁₂|=12·11·10·9·8=95040=2⁶·3³·5·11;
  Basis 12: 95040=47000, 132=B0; Index 12!/95040 = 5040 = 7!; |M₁₁|=7920. Reproduzierbar.
</content>
