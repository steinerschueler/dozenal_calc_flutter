# Kapitel-2-Aussprachekonventionen (pro Sprache)

Referenz für das Editieren des Mathematik-Theoriekapitels in
`lib/theory/<lang>/math_<lang>.dart` — die
sprach-spezifische Aussprache-Konvention für Dozenal-Zahlen. Aus CLAUDE.md
(Info-Modal) ausgelagert, weil nur bei genau dieser Aufgabe gebraucht. **Vor
Änderungen an Kapitel-2-Prosa hier nachschlagen.**

## Magnituden 12²–12⁷

Geometrisch motiviert, basierend auf den germanischen Lehnwörtern **quader,
cuber, tesser, penter, hexer, hepter**. In den meisten Sprachen invariant und
bei nicht-lateinischer Schrift transliteriert (کوادر, کوبر, تسر … in Persisch ;
квадер, кубер, тессер … in Russisch ; क्वाडर … in Hindi ; 卡德 … in Chinesisch).

**Ausnahmen für romanische Phonologie:**
- **Spanisch** adaptiert auf `-ero/-eros` (maskulin, parallel zu cuadrado/cubo).
- **Italienisch** auf `-era/-ere` (feminin, mit „tessera" als existierendem
  italienischem Wort für Mosaikstein — Glücksfall für 12⁴).
- **Französisch** behält `-er`, weil französisches stummes r das Lehnwort
  bereits nativ aufnimmt (`papier`-Muster).

Der Verbindungsstil zwischen Magnituden ist sprach-spezifisch:

## Pro Sprache

- **Deutsch:** `-er/-a`-Bindung (`quadaundeins`, `kubaquader`)
- **Englisch:** „and" einmal vor letztem Sub-quader-Block (`quader and one`)
- **Französisch:** pure Juxtaposition mit „et"-Ausnahme nur an Position 21
  (`quader deux douzaines et un`, parallel zu „cent vingt et un")
- **Spanisch:** pure Juxtaposition mit „y"-Ausnahme an Einer-Position bei
  docena-Multiplikator 2–B (`cuadero dos docenas y uno`, parallel zu
  „treinta y uno"). Magnituden: cuadero, cubero, tesero, pentero,
  hexero, heptero.
- **Italienisch:** pure Juxtaposition ohne Konnektor (`quadera due
  dozzine tre`, parallel zu „centoventitré"). Magnituden: quadera,
  cubera, tessera, pentera, hexera, heptera.
- **Persisch:** durchgehender „و"-Konnektor (`quader و دو دوجین و سه`)
- **Russisch:** pure Juxtaposition + Numerus-Deklination
  (`две дюжины` Gen.Sg. nach 2–4, `пять дюжин` Gen.Pl. nach 5+)
- **Irisch:** pure Juxtaposition + „a"-Partikel vor Einer-Position
  (`quader fiche a trí`, parallel zu „céad fiche a trí"). Lenition/
  Eklipsis-Regeln auf `dosaen` nach Multiplikator (`dhá dhosaen` lenited
  bei 2, `seacht ndosaen` eclipsed bei 7+).
- **Hindi:** pure Juxtaposition ohne Konnektor (Devanagari-Schrift,
  transliterierte Magnituden)
- **Chinesisch:** pure Juxtaposition mit `零`-Brücke für eingebettete
  Nullen (`一卡德零一` = o101, mirror von Mandarin-Dezimal `一百零一`
  = 101)
- **Walisisch:** pure Juxtaposition mit „a"/„ac"-Partikel vor Einer-
  Position (`quader dau ddwsin a thri`, parallel zu „cant a thri").
  „a" löst Aspirate-Mutation auf c/p/t aus (`a thri`, `a phedwar`);
  „ac" vor Vokalen und Halbvokal w (`ac un`, `ac wyth`). Soft Mutation
  d → dd auf `dwsin` nach „dau" (`dau ddwsin`); fremde Magnituden
  (quader/cuber/…) bleiben unverändert. Kapitel-1-Prosa schlägt
  zusätzlich die Brücke zur walisischen vigesimalen Tradition
  (deunaw = 18 als „zwei Neuner", ugain = 20, deugain = 40, hanner
  cant = 50, trigain = 60, pedwar ugain = 80). Zusätzlicher
  Spezialabschnitt „Y Gymraeg a'r deuddeg" in Kapitel 1 (nur in CY,
  nicht in anderen Locales): würdigt deuddeg/pymtheg/deunaw als
  Unit-Wörter sowie dwsin im Alltagsgebrauch; gefolgt von vollständiger
  englischer Übersetzung in Klammern für Reviewer ohne Welsh-Kenntnisse.
- **Japanisch:** pure Juxtaposition ohne Konnektor (parallel zu „百
  二十三"), Magnituden als Katakana-Transliteration (`クアダー, クー
  バー, テッサー, ペンター, ヘクサー, ヘプター`); Basis-Einheit `ダー
  ス` (dāsu, Lehnwort). Multiplikator 1 explizit (`一ダース`, `一クア
  ダー`), parallel zu japanischem `一百` (ippyaku). Kapitel-1-Prosa
  schlägt die Brücke zur japanischen Myriaden-Konvention (万 = 10⁴,
  億 = 10⁸, 兆 = 10¹² — Vierergruppierung statt westlicher
  Dreiergruppierung) als ostasiatisches Nicht-Dezimal-Erbe.
- **Arabisch:** „و"-Konnektor vor Einer-Position (parallel zu „مائة
  وثلاثة"), Magnituden als arabische Transliteration (`كوادر, كوبر,
  تسر, بنتر, هكسر, هبتر`); Basis-Einheit `دزينة` (dazīna, Lehnwort
  aus Französisch/Italienisch). Multiplikator 1 implizit (`دزينة`,
  `كوادر` — wie Englisch/Irisch). Standard-arabische Numerus-Deklination
  auf `dazīna`: Dual `دزينتان` für 2 ; Plural `ثلاث/أربع/خمس… دزينات`
  für 3–10 (Polaritätsregel: maskuline Kardinalzahl vor femininem
  Plural) ; Singular `إحدى عشرة دزينة` für 11. Fremde Magnituden
  bleiben invariant (foreign-stem convention, wie GA/CY).
  Kapitel-1-Prosa schlägt die Brücke zum arabischen Mathematik-Erbe
  (al-Khwārizmī → Algorithmen, al-jabr → Algebra, indisch-arabische
  Ziffern).

Das e/o-Präfix als Theorie-Lese-Hilfe (e = dezimal, o = dozenal) bleibt
in allen Sprachen sprachneutral.
