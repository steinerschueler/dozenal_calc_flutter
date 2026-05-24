# CLAUDE.md

Diese Datei gibt Claude Code (claude.ai/code) Hinweise zur Arbeit mit dem Code in diesem Repository.

## Projekt

Flutter-Port eines Rust + egui Wissenschafts-Taschenrechners, der nativ in
**Basis 12** (dozenal) rechnet. Ursprung: https://github.com/steinerschueler/dozenal_calc.
Viele `.dart`-Dateien nennen explizit die Rust-Datei, von der sie portiert
wurden (z. B. `state.dart` ↔ `src/input.rs` + `src/eval.rs`). Bei
Logikänderungen den Kopfkommentar auf das Rust-Gegenstück prüfen — der Port
ist absichtlich 1:1 für die `logic/`- und Dispatch-Schichten.

## Befehle

```bash
flutter pub get
flutter run                   # aktuelle Plattform
flutter run -d chrome         # Web
flutter analyze               # was CI ausführt
flutter test                  # gesamte Suite (147 Tests)
flutter test test/rational_test.dart           # einzelne Datei
flutter test --plain-name "parses 1/7"         # einzelner Test per Name
```

Test-Routing (für gezielte Edits):
- `state_test.dart` — Orchestrator inkl. Handler-Pfade, mit Abstand die
  größte Datei.
- `rational_test.dart` + `rat_parser_test.dart` — exakte Rational-Schiene.
- `expression_test.dart` — f64-Auswerter inkl. `resolvePostfix`.
- `dozenal_converter_test.dart` — Doz ↔ Dez-Konvertierung.
- `keypad_layout_test.dart` — Orientierungs-Dispatch und Repaint-Verhalten.
- `edge_cases_test.dart` — Grenzfall-Sammler über die Module hinweg.

CI (`.github/workflows/ci.yml`) ist auf Flutter 3.41.8 stable festgenagelt
und führt `analyze` + `test` aus. Das Flutter-SDK selbst pinnt sechs
transitive Abhängigkeiten (`meta`, `vector_math`, `cli_util`, `matcher`,
`test_api`, `xml`) auf Versionen, die `pub outdated` flaggt — das ist
erwartet, kein Bug. Nach jedem Flutter-Minor-Stable-Release erneut prüfen.

### Release-Builds

```bash
flutter build apk --release
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
flutter build web --release
```

Der Play-Store-Appbundle-Build braucht explizit Java 17 (Java 21 auf dieser
Maschine zerbricht Gradle). Android-Signing liest `android/key.properties` —
fehlt die Datei, fällt der Build still auf Debug-Signing zurück.

Als abschließenden Schritt nach einem Release-Build mehrsprachige
Play-Console-Versionshinweise verfassen — ein Block pro aktiv
unterstützter Listing-Locale. **Wichtig:** Die App enthält seit dem
Post-Build-11-Ausbau **vierzehn** Sprachen, aber Play Console listet nur
**sieben** davon als Release-Notes-Locale (DE, EN, FR, ES, IT, FA, RU).
Die zusätzlichen Sprachen (GA, HI, ZH-Hans, ZH-Hant, CY, JA, AR) leben
nur in der App selbst — für sie werden keine Play-Console-Notes
geschrieben. Persisch wird in Play Console nur als `fa-AF` gelistet, das
ist Googles einzige Farsi-Listing-Locale:

Jeder Block: Tag-öffnen auf einer Zeile, Prosa als eine einzige lange
Zeile direkt darunter, Tag-schliessen auf einer Zeile. Leerzeile zwischen
Blöcken. So vermeidet Copy-Paste in Play Console ungewollte Zeilenumbrüche
in der Beschreibung.

```
<de-DE>
…ca. 450 Zeichen (Limit 500 pro Locale)…
</de-DE>

<en-US>
…
</en-US>

<fr-FR>
…
</fr-FR>

<es-ES>
…
</es-ES>

<it-IT>
…
</it-IT>

<fa-AF>
…
</fa-AF>

<ru-RU>
…
</ru-RU>
```

Inhalt aus den tatsächlichen Build-Änderungen ableiten (nicht aus der
Commit-Message kopieren) und Ton an Tester richten — was sie sehen werden,
nicht die Constraint-Math dahinter. Zeichen pro Locale mit `wc -m`
verifizieren. Bei einem Release, das nur eine Locale betrifft (z. B.
gezielter Persisch-Fix nach Native-Speaker-Review), nur den entsprechenden
Block schreiben — Play Console übernimmt für nicht aufgeführte Locales
automatisch die letzten Notes weiter.

Fertige Release-Notes werden im Projekt-Root als `build<N>-release-notes.txt`
abgelegt (siehe `build12-release-notes.txt`), damit künftige Builds auf
das gleiche Format und die gleiche Block-Reihenfolge zurückgreifen können.

### Asset-Regenerierung

`assets/icon.png`, `assets/compass.png` und das Play-Store-Feature-Graphic
werden programmatisch über Golden-Style-Tests in `tool/` erzeugt:

```bash
flutter test tool/generate_icon.dart            # → assets/icon.png
flutter test tool/generate_compass.dart         # → assets/compass.png
flutter test tool/generate_feature_graphic.dart # → store/feature-graphic.png
dart run flutter_launcher_icons                 # → Plattform-Icons
dart run flutter_native_splash:create
```

Die erzeugten PNGs sind versionierte Build-Outputs und gehören mit
committed — sie werden zur Laufzeit aus `assets/` geladen, nicht im Build
neu generiert. Nach `flutter_launcher_icons` / `flutter_native_splash`
auch die jeweils gepatchten Plattform-Resources (`android/app/src/main/res/`,
`ios/Runner/Assets.xcassets/`, …) prüfen und mitnehmen.

## Architektur

### Zwei-Schienen-Auswertung (die Kernidee)

Jeder `=`-Druck startet **beide** Auswerter parallel — den exakten
`Rational` (BigInt-basiert) und den `f64`-Auswerter:

- `lib/logic/dozenal_digit.dart` — reine Datenschicht: Enum 0..11 mit
  `value`/`fromValue` (Port von `DozenalDigit` aus `src/logic.rs`). Keine
  Flutter-Imports, wird von Parser, State und Tastenmap geteilt.
- `lib/logic/rational.dart` — exakte Rationals mit Periodenerkennung
  (`1/7` → `0.186A3` mit Überstrich + Punktmarker für den Periodenstart).
- `lib/logic/rat_parser.dart` — Parser der Rational-Schiene. Kollabiert
  nur bei nicht-rationalen Tokens (sin, log, …) oder Division durch null.
- `lib/logic/expression.dart` — f64-Fallback-Auswerter und
  Ergebnisformatierung. Enthält auch `resolvePostfix`, das vor
  `withImplicitMuls` läuft und postfix-eingegebene Tokens (`n!`, `|x|`,
  `1/x`) in präfix-Funktionsaufrufe umordnet. Standard-Konvention:
  Postfix bindet stärker als unäres Minus, also `−3!` = `−(3!)`. Wenn
  der User `|−3| = 3` will, muss er klammern.

Wenn die Rational-Schiene kollabiert, wird das f64-Resultat als **State B**
mit `≈`-Suffix angezeigt. Wenn beide funktionieren, gewinnt die
Rational-Schiene. `DozenalCalcState.isF64Fallback` steuert diese Anzeige.

### State (`lib/state.dart`)

`DozenalCalcState extends ChangeNotifier` ist der einzige Orchestrator. Er
besitzt die Input/Result-Buffer, den Speicher, die Modi und `infoState`.
`handleClick(token)` ist der einzige Einstiegspunkt — Tastendrücke und
physische Tastatur-Events laufen beide hierdurch (Tastenmap in
`lib/main.dart`).

**Listen-Mutationen erzeugen frische Instanzen**, weil
`CustomPainter.shouldRepaint` per `listEquals` vergleicht; In-Place-Mutation
bricht die Repaint-Erkennung.

`isArmed(token)` ist die Keypad-Query für den „scharf"-Punkt-Indikator:
sie gibt `true` zurück, wenn ein Tap auf `token` den vorhergehenden
Buffer-Token via `_inverseSwap` in seine Inverse umschalten würde
(z. B. Sin ↔ ArcSin nach erstem Sin-Tap). Anzeige-Logik und Toggle-Logik
müssen über diese gemeinsame Quelle laufen, sonst desynchronisieren sie.
Eingabe von `.` wird zusätzlich durch `_hasDecimalInCurrentLiteral`
gefiltert (beidseitiger Walk durch das aktuelle Zahlen-Literal), damit
`1.2.3`-Eingaben gar nicht erst entstehen.

### Tokens (`lib/tokens.dart`)

`sealed class CalcToken` mit const-Singleton-Subklassen für
Payload-freie Varianten. Spiegelt das Rust-Enum und erlaubt erschöpfende
`switch`-Pattern-Matches.

### Rendering

- `glyph_painter.dart` — zwölf benutzerdefinierte Dozenal-Glyphen (kein
  Font: reines `CustomPainter`).
- `token_painter.dart` — Glyphen der Operator-/Funktionstasten.
- `display.dart` — Zwei-Zeilen-Display, Überstrich-Rendering,
  Periode-Markierung. `TwoLineDisplay` skaliert sich adaptiv an seinen
  Container, funktioniert also vom Landscape-Phone (~60 dp) bis zum
  Tablet-Portrait (170 dp).
- `keypad.dart` — orientierungsgesteuertes Dispatch. `Keypad.build` liest
  die `LayoutBuilder`-Constraints und wählt:
  - **`_HochKeypad`** (Portrait): vertikale Flex-`Column` mit
    `AnimatedSwitcher`-Panel-Swap zwischen Sets 1–4 + System-Reihe und
    Sets 6–10. Drei Gap-Regimes nach verfügbarer Höhe: normal (≥560 dp),
    eng (480–559 dp), Scroll-Fallback (<480 dp).
  - **`_BreitKeypad`** (Landscape / Tablet): Inline-Layout mit allen zehn
    Sets nebeneinander, gegliedert in drei visuelle Blöcke: Zahlengitter,
    Sets 1–5 (Hauptoperationen + System), Sets 6–10 (erweiterte Funktionen).
    Zwischen den drei Blöcken läuft je eine 1-dp-Divider-Linie (`Color
    0xFF333333`, gleich wie der horizontale Divider in `_HochKeypad`).
    Geometrie (Build 7, mit Build-8-Floor-Anpassung):
    - `buttonSize = min(rawH, rawW).clamp(breitMinTouchTarget, 70)` — beide
      Achsen werden berücksichtigt, damit weder vertikal noch horizontal
      beschnitten wird. `breitMinTouchTarget = 36 dp` (statt der Hoch-Mode-
      `minTouchTarget = 44 dp`): Material 48 / iOS 44 sind Empfehlungen,
      nicht Mauern, und in Landscape wird das Phone zweihändig gehalten —
      36-dp-Targets bleiben treffbar. Mit 44 als Floor klemmten 360-dp-
      hohe Phones (kompakte Phones, kompakte Phones) auf beiden Achsen und
      scrollten redundant; der niedrigere Floor lässt die Tasten der
      Viewport-Form folgen, statt sie hinauszuschieben.
    - Alle inner-Block-Abstände (im Zifferngitter h+v, in opColumns v,
      zwischen Sets innerhalb eines Blocks h) sind identisch =
      `tabletColGap` (8 dp). So „atmet" jeder Block gleichmäßig.
    - Horizontaler Slack wird in die zwei Gruppen-Lücken gepumpt
      (`groupGapBase = 18`, Cap `maxGroupGap = 100`). Was über den Cap
      hinausgeht, landet als symmetrischer Außenrand via `SizedBox(width:
      max(viewport, contentWidth))` + `MainAxisAlignment.center`.
    - Vertikaler Scroll-Fallback engaged, wenn `naturalHeight > h` (z. B.
      Split-Screen, Foldable-Cover-Display).
- Jede Taste ist in `ConstrainedBox(minHeight: 44)` gewrappt, damit der
  Material-44-dp-Touch-Target-Floor deklarativ erzwungen wird.
- `app_layout.dart` — `displayHeightFor(h) = (h * 0.20).clamp(60, 170)`
  für beide Orientierungen, plus die `tablet*`-Referenz-Proportionen für
  `_BreitKeypad`. Die alten `mobile*`-Konstanten und der frühere
  `_DesktopKeypad` / `_MobileKeypad` / `_TabletKeypad`-Dreiklang wurden
  in Build 4 entfernt.

### Info-Modal

`info_pages.dart` (Navigator-Routen) + `info_content.dart` (Dispatcher) +
zehn `info_content_<lang>.dart`-Part-Dateien, eine pro Sprache, mit
`part of 'info_content.dart'`-Direktive. Jede Part-Datei exportiert eine
`_chapter<Lang>(int chapter, AppLocalizations l)`-Funktion mit den zwölf
Lehr-Kapiteln als Prosa + custom-painted Illustrationen für die
Geometrie-Kapitel.

Der Dispatcher (`buildChapterContent` in `info_content.dart`) wählt über
eine `const Map<String, _ChapterBuilder> _chapterBuilders` anhand der
aktiven Locale die passende Sprach-Funktion. Fallback auf Deutsch bei
unbekannter Locale (sollte nie passieren, weil `resolveLocale` nur
unterstützte Codes durchlässt).

Kapitel 2 hält die sprach-spezifische Aussprache-Konvention für
Dozenal-Zahlen fest. Die geometrisch motivierten Magnituden 12²–12⁷
basieren auf den germanischen Lehnwörtern quader, cuber, tesser, penter,
hexer, hepter. In den meisten Sprachen bleiben sie invariant und werden
bei nicht-lateinischer Schrift transliteriert (کوادر, کوبر, تسر … in
Persisch ; квадер, кубер, тессер … in Russisch ; क्वाडर … in Hindi ; 卡德
… in Chinesisch). **Ausnahmen für romanische Phonologie:** Spanisch
adaptiert auf `-ero/-eros` (maskulin, parallel zu cuadrado/cubo),
Italienisch auf `-era/-ere` (feminin, mit „tessera" als existierendem
italienischem Wort für Mosaikstein — Glücksfall für 12⁴). Französisch
behält `-er`, weil französisches stummes r das Lehnwort bereits nativ
aufnimmt (`papier`-Muster). Der Verbindungsstil zwischen Magnituden ist
sprach-spezifisch und in der jeweiligen Kapitel-2-Prosa dokumentiert:

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

Wenn `handleClick` `state.infoState` auf `InfoList` setzt, pusht der
State-Listener in `main.dart` die Route und resettet `infoState` auf
`Closed` — der Navigator steuert ab dann alle Listen-/Detail-/Zurück-
Übergänge.

Sekundärseiten, die aus `info_pages.dart` heraus gepusht werden:
`privacy_page.dart` und `license_page.dart` (laden
`legal/<typ>.<code>.md` per Locale via dem generischen
`markdown_page.dart`), `feedback_dialog.dart` (`mailto:`-Composer,
kein Netzwerk; alle Strings über ARB) sowie `conversions_page.dart`
(Live-Umrechnung eines Eingabewerts in die klassischen Imperial-12-
Einheiten — Inches/Fuss, Pence/Schilling/Pfund, Dutzend/Gros/Großgros,
Sekunden/Minuten/Stunden, Bruchteile von 360° — jeweils in Dez- und
Doz-Darstellung; eigene Doz/Dez-Toggle und symbolische Notation
ft/in/sh/d/£/min/h/° statt sprachspezifischer Wörter, damit die
Sektion-Bodies in allen Locales identisch und kompakt bleiben).
Alle folgen der gleichen Push-Konvention — keine direkten Routen
aus `main.dart`, alles geht über die Info-Liste.

**Datenschutz-Web-Hosting (cPanel):** Parallel zu den in-app
`legal/privacy-policy.<tag>.md`-Dateien (in App-Bundle, in-app via
`flutter_markdown_plus` gerendert) leben unter `legal/privacy.<tag>.html`
vierzehn stand-alone HTML-Versionen für `weltanschauung.app`. Die
Play-Console-Datenschutz-URL zeigt auf eine davon (in der Regel
`privacy.de.html` als Default). Jede HTML enthält einen horizontalen
`<nav class="lang-picker">`-Block direkt nach `<main>` mit allen
vierzehn Sprachen alphabetisch nach Code (ar, cy, de, en, …, zh-Hant),
jede als Flag + nativer Name, aktive Sprache via `.current`-Klasse
visuell hervorgehoben. Picker erzwingt `direction: ltr`, damit
FA/AR-Dateien die Reihenfolge nicht spiegeln. **Walisische Flagge ist
Inline-SVG** (Bezier-Pfad portiert aus `WelshFlagPainter` in
`flag_painter.dart`): die Unicode-Subdivision-Sequenz 🏴󠁧󠁢󠁷󠁬󠁳󠁿
rendert auf Firefox-Linux und älteren Android-Versionen unzuverlässig,
deshalb font-unabhängige SVG-Lösung. Andere dreizehn Sprachen nutzen
Standard-Regional-Indicator-Emojis (universell unterstützt). Die
Naming-Konvention ist `privacy.<tag>.html` (kürzer als die
in-app-Variante `privacy-policy.<tag>.md` — Web-URLs sollen kompakt
sein, in-app-Pfade konsistent mit `license.<tag>.md`).

### Intro

Onboarding-PageView beim ersten Start, gesperrt über einen
`SharedPreferences`-Schlüssel der Form `intro_seen_v<N>` (aktuell `v2`,
definiert als `_kIntroSeenFlag` in `lib/main.dart`). Bei substanziellen
Intro-Änderungen den Suffix erhöhen, damit Bestandstester das
überarbeitete Intro erneut sehen. Slide-Inhalte (Text) kommen aus dem
ARB-System (`introSlide1`–`introSlide8`); Slide-Layout-Metadata
(Bild, Highlight-Rechtecke/Kreise, Ziffer-Labels) bleibt
sprach-neutral in `intro_pages.dart`.

### Mehrsprachigkeit

Vierzehn Sprachen aktiv: DE, EN, FR, ES, IT, FA, RU, GA, HI, ZH
(vereinfacht), ZH-Hant (traditionell, post-Build-11), CY (Walisisch),
JA (Japanisch) und AR (Arabisch). Die Infrastruktur:

- **ARB + gen_l10n:** `lib/l10n/app_<code>.arb` pro Sprache (DE ist
  Template-arb-file, andere fallen auf DE zurück, falls Key fehlt).
  Script-Tagged-Locales nutzen Flutters Konvention mit Unterstrich:
  `app_zh_Hant.arb`. `flutter gen-l10n` läuft automatisch bei
  `flutter pub get` dank `generate: true` in `pubspec.yaml`. Output unter
  `lib/l10n/` (per `.gitignore` ignoriert, da Build-Artefakt).
- **Locale-State:** `lib/locale_notifier.dart` mit `LocaleNotifier`
  (SharedPreferences-Schlüssel `locale_v1`, null = OS-Locale folgen) +
  `LocaleScope` (InheritedNotifier, macht Notifier für tiefe Widgets
  zugänglich ohne Provider-Dependency). Persistiert den vollen
  BCP-47-Tag (`zh-Hant`, nicht nur `zh`), damit `zh_Hans` und `zh_Hant`
  koexistieren können; alte einsprachige Einträge (`de`) bleiben
  rückwärtskompatibel. `resolveLocale` ist script-aware: exakte
  Sprache+Script gewinnt vor reinem Sprach-Match; `zh-TW/HK/MO` mappt
  automatisch auf `zh-Hant`. `info_content.dart`, `privacy_page.dart`
  und `license_page.dart` lookup über `toLanguageTag()` statt nur
  `languageCode`, sonst würden zh-Hant-Routen auf die vereinfachten
  Dateien zurückfallen.
- **Sprach-Registry:** `lib/language_options.dart` mit
  `kSupportedLanguages`-Liste — single source of truth für Locale,
  Anzeige-Label (selbstreferentiell: „Deutsch", „English", „Français",
  „Español", „Italiano", „فارسی", „Русский", „Gaeilge", „हिन्दी",
  „简体中文", „繁體中文", „Cymraeg", „日本語", „العربية"),
  Flag-Painter und kanonisches Flag-Seitenverhältnis. Picker
  (`_LanguagePickerExpansion` in `info_pages.dart`) ist datengetrieben
  aus dieser Liste.
- **Flag-Painter:** `lib/flag_painter.dart` enthält je einen
  `CustomPainter` pro Sprache. Iran-Wappen ist eine vereinfachte
  Tulpen-Silhouette mit weisser Schwert-Aussparung in Rot.
- **Kapitel-Prosa:** `info_content_<code>.dart` per `part of`-Mechanik —
  siehe Info-Modal-Abschnitt oben.

### RTL-Behandlung (Persisch + Arabisch)

`Localizations.localeOf(context)` löst persische (`fa`) und arabische
(`ar`) Locales als RTL auf, Flutter spiegelt alle direction-aware
Widgets automatisch. Zwei Eigenheiten in dieser App:

- **Calc-UI bleibt erzwungen LTR.** `_CalcScaffold` in `main.dart`
  wickelt sein Body in `Directionality(textDirection: TextDirection.ltr)`.
  Mathematische Notation ist sprach-übergreifend immer LTR (auch
  Persisch-Mathematiker schreiben `2 + 3 = 5` von links nach rechts mit
  westlichen Ziffern), und das Tastenfeld-Layout / Display-Cursor-
  Richtung müssen konsistent bleiben. Text-Screens (Info-Liste,
  Kapitel, Intro, Feedback, Privacy/License) folgen der Locale.
- **`_Pre`-Tabellen werden ebenfalls auf LTR gezwungen.** Monospace-
  Tabellen mit westlichen Ziffern und sprach-Labels würden sonst vom
  Bidi-Algorithmus zerlegt. Der Wrap sitzt direkt im `_Pre`-Widget in
  `info_content.dart`.

Direction-aware Bauteile, die korrekt sein müssen:
- `_NavChevron` in `info_pages.dart` — wählt `chevron_left` in RTL,
  `chevron_right` in LTR (ListTile-Trailing zeigt richtig zum Detail).
- `EdgeInsetsDirectional.fromSTEB` statt `EdgeInsets.fromLTRB` überall,
  wo asymmetrische horizontale Paddings gemeint sind (z. B.
  Sprach-Tile-Einrückung).
- `TextAlign.end` statt `TextAlign.right` für kapitellnummer-Prefixe.

Wenn neue UI hinzukommt, immer diese drei Stellen prüfen.

### App-Bootstrap (`lib/main.dart`)

Wickelt die vorgenannten Bausteine zusammen — wenn etwas „in main.dart"
liegt, dann hier:

- **System-UI-Setup** (Details siehe Edge-to-edge-Abschnitt): `main()`
  ruft **gar keine** `SystemChrome`-APIs — weder
  `setEnabledSystemUIMode(edgeToEdge)` noch `setSystemUIOverlayStyle(...)`.
  Beide würden über Flutters `PlatformPlugin` laufen, dessen kompilierte
  Methoden statisch auf die deprecated `Window.setStatusBarColor /
  setNavigationBarColor / setNavigationBarDividerColor` referenzieren —
  Play Console scannt das DEX statisch und flaggt diese Referenzen auch
  dann, wenn der Laufzeit-Pfad sie nie erreicht. Edge-to-edge UND
  Icon-Brightness werden ausschließlich nativ in `MainActivity.java`
  gesetzt (`EdgeToEdge.enable` + `WindowInsetsControllerCompat`).
- **Physische Tastatur:** `_charKeyMap` (zeichen-basiert, inkl. `,` als
  Dezimaltrenner für deutsche Layouts) und `_logicalKeyMap` (Enter,
  Backspace, Pfeiltasten, kompletter Numpad inkl. Fallback-Digits, weil
  Linux bei manchen Layouts `event.character` leerlässt). Beides
  Portierungen aus `src/input.rs::handle_keyboard` und mündet in
  `_state.handleClick(token)` — derselbe Pfad wie ein Tastendruck.
- **Intro-Gate:** `_maybeShowIntro` liest `_kIntroSeenFlag` (aktuell
  `intro_seen_v2`) aus `SharedPreferences` und pusht beim ersten Start
  `IntroPage`; danach wird das Flag gesetzt.
- **Info-Routing:** `_onStateChanged` lauscht auf `state.infoState`,
  resettet es auf `InfoClosed` und pusht `InfoListPage`. Nach
  Navigator-Pop wird der Keyboard-Focus wieder angefordert.
- **Layout-Wurzel:** `_CalcScaffold` rendert `TwoLineDisplay` über
  `Keypad`, mit `displayHeightFor(bodyH)` aus `app_layout.dart` als
  einzige Größenrechnung. Splash-Feedback ist global via
  `NoSplash.splashFactory` aus, weil die Tasten ihre eigene
  Press-Color-Animation haben.

### Edge-to-edge (Android 15) und Native-Activity

Ab `targetSdk 35` ist edge-to-edge der Default. Die alten XML-Attribute
`windowDrawsSystemBarBackgrounds`, `windowFullscreen` und
`windowLayoutInDisplayCutoutMode=shortEdges` wurden aus allen vier
`android/app/src/main/res/values*/styles.xml` entfernt — nur der
Material-Light/Black-NoTitleBar-Parent (plus die SDK-31-Splash-Items in
den `-v31`-Varianten) bleibt. `shortEdges` ist mit edge-to-edge-Default
nicht mehr nötig (Cutout-Handling läuft über `WindowInsets` + die
`SafeArea`-Wrapper) und wurde von Play Console als „veralteter Parameter
für randlose Anzeige" geflaggt.

Die Transparenz der System-Bars UND die Icon-Brightness werden
**vollständig nativ** in `MainActivity.java` gesetzt:

1. `androidx.activity.EdgeToEdge.enable(this)` — transparente System-Bars
   über `WindowInsetsControllerCompat`, mit Backport auf ältere Android-
   Versionen.
2. `WindowCompat.getInsetsController(...).setAppearanceLightStatusBars(false)`
   + `setAppearanceLightNavigationBars(false)` — helle Icons (weiß) auf
   dunklem Hintergrund. Das ist der nicht-deprecated Ersatz für Flutters
   `SystemUiOverlayStyle.statusBarIconBrightness`.

**Warum keine `SystemChrome.*`-Calls mehr in `main.dart`:** Build 9
behielt `setEnabledSystemUIMode(edgeToEdge)` + ein „nur Brightness"-
`setSystemUIOverlayStyle`. Beide laufen über Flutters `PlatformPlugin`,
dessen kompilierte Methoden — egal welche Felder zur Laufzeit gesetzt
sind — statisch auf die deprecated `Window.setStatusBarColor /
setNavigationBarColor / setNavigationBarDividerColor` verweisen. Play
Console scannt das DEX statisch, sieht diese Referenzen und flaggt sie.
Solange Dart-Code in die Platform-Channel-Methode reinruft, hält R8 sie
lebendig und kann die deprecated Referenzen nicht wegoptimieren. Build
10 entfernt alle Dart-seitigen Calls — was App-seitig darüber hinaus
nicht erreichbar ist, dokumentiert der folgende Absatz.

**Was Build 10 NICHT beseitigt (Upstream-Rest):** Die Play-Console-
Warnungen »randlose Anzeige funktioniert möglicherweise nicht« und
»nicht mehr unterstützte APIs« bleiben nach Build 10 sichtbar. Die
geflaggten Stellen verweisen auf zwei Quellen, die außerhalb unseres
Codes liegen:

1. **`io.flutter.plugin.platform.e.a`** — obfuscated
   `PlatformPlugin.setSystemChromeSystemUIOverlayStyle`. Die Flutter-
   Engine registriert den Platform-Channel
   `SystemChrome.setSystemUIOverlayStyle` beim Start unabhängig davon,
   ob Dart-Code ihn ansteuert. R8 kann die Methode daher nicht strippen,
   und die statischen Referenzen auf
   `Window.setStatusBarColor / setNavigationBarColor / setNavigationBarDividerColor`
   bleiben im DEX. Tracking: `flutter/flutter#165327` plus Duplikate
   `#183372`, `#183349`, `#175261`, `#175262`, `#169810` — alle als
   „r: fixed" markiert, aber nur im Sinne eines Doku-Updates; der
   `PlatformPlugin`-Code ist Stand Flutter 3.41.8 unverändert.
2. **`B.b.q`, `b.o.J`, `b.p.J`, `b.r.J`** — die `EdgeToEdgeApi*Impl`-
   Backport-Klassen aus `androidx.activity:activity`. `EdgeToEdge.enable()`
   delegiert intern auf versions-spezifische Impls; die Pre-Android-15-
   Pfade rufen `setStatusBarColor` / `setNavigationBarColor` für
   Backward-Compat auf. Das ist genau der API-Pfad, den Google im
   Warntext selbst empfiehlt — Play-Console-DEX-Scanning unterscheidet
   aber nicht zwischen „wird auf Android 15 ausgeführt" und „Referenz
   im Bytecode vorhanden". Identisches Muster ist für Material Components
   (`material-components-android#4732`), .NET MAUI (`dotnet/maui#26788`),
   React Native (`software-mansion/react-native-screens#2632`) und
   Corona dokumentiert.

Google stellt im Warntext selbst klar, dass diese Hinweise die
Endnutzer-Erfahrung NICHT beeinträchtigen; sie bleiben so lange im
Console-Dashboard, bis Upstream-Libraries die Backport-Pfade entfernen.
Build 10 ist damit das technisch saubere Maximum, das app-seitig
erreichbar ist — die übrig bleibenden Warnungen sind als bekannte
Upstream-Issues zu behandeln, nicht als TODO im Repo. **Aggressive
R8-Strip-Regeln** gegen `PlatformPlugin.setSystemChromeSystemUIOverlayStyle`
wurden bewusst NICHT eingebaut: der Engine-Startup-Pfad könnte die
Methode reflektiv ansteuern, OEM-spezifische Laufzeit-Crashes sind in
verwandten Issues dokumentiert. Bei jedem neuen Flutter-Stable-Release
prüfen, ob `PlatformPlugin` die deprecated Referenzen entfernt hat —
dann diesen Block aktualisieren.

`MainActivity` extendet bewusst **`FlutterFragmentActivity`**, nicht
`FlutterActivity`: nur Erstere erbt über `FragmentActivity` von
`androidx.activity.ComponentActivity`, was `EdgeToEdge.enable()`
zwingend verlangt. **Wichtiger Nebeneffekt:** FlutterFragmentActivity
registriert Plugins NICHT automatisch (anders als FlutterActivity).
Deshalb wird `configureFlutterEngine()` overridden und ruft explizit
`GeneratedPluginRegistrant.registerWith(flutterEngine)` — ohne diesen
Override sind `shared_preferences` (Intro-Gate), `url_launcher`
(Feedback-Mail), `package_info_plus` (Versions-Anzeige) stumm.

Java statt Kotlin in `MainActivity.java`, weil `EdgeToEdge` in
`activity:1.9.3` als Kotlin-Klasse mit `kotlin_module`-Metadata
ausgeliefert wird und Flutters Kotlin-Compiler die Klasse über die
Modulgrenze hinweg nicht auflöst, obwohl `.class` auf dem Klassenpfad
liegt. Java-Interop ignoriert die Metadata.

Jede Scaffold-Page wickelt den Body in `SafeArea(top: false, …)` — die
AppBar handhabt oben, aber sonst würden Listen unter der System-
Navigationsleiste verschwinden. Bei neuen Pages diese Konvention
beibehalten.

### ABI-Filter (`android/app/build.gradle.kts`)

Flutter ≥ 3.35 setzt automatisch `ndk.abiFilters` für Android-Builds
(armeabi-v7a, arm64-v8a, **x86_64**). x86_64 ist auf Android praktisch
ausgestorben — Windows-Subsystem-for-Android wurde März 2025 von
Microsoft eingestellt, übrig sind nur Chromebooks (winziger Markt) und
Dev-Emulatoren (von lokalem Build versorgt, nicht Play Store). Build 9
filtert es raus. Die Restriktion erfolgt in `buildTypes.release` —
nicht in `defaultConfig.ndk`, weil Flutters Plugin Letzteres
überschreibt. Die `.clear() + .addAll()`-Reihenfolge ist Pflicht, weil
Flutters Defaults vor unseren Block laufen:

```kotlin
buildTypes {
    release {
        ndk.abiFilters.clear()
        ndk.abiFilters.addAll(listOf("armeabi-v7a", "arm64-v8a"))
    }
}
```

RISC-V (`riscv64`) hier ergänzen, sobald Flutter Engine-Binaries
liefert (kein Datum). Spart ~18 MB im fat-APK und ~14 MB im AAB-Upload
gegenüber Build 8.

## Konventionen

- **Lizenz-Hinweis:** Dieses Projekt steht unter der **MIT-Lizenz**.
  Root `LICENSE` enthält den kanonischen MIT-Wortlaut (Expat-Variante,
  Copyright Eric Naville, 2026). Die vierzehn lokalisierten
  `legal/license.*.md`-Dateien folgen einem Hybrid-Schema:
  lokalisierter Header + Rechte-Zusammenfassung → englischer
  MIT-Volltext als rechtsverbindliche Fassung → lokalisierter
  Autor/Drittanbieter-Block. So bleibt die Multi-Sprach-UX erhalten,
  aber juristisch zählt die englische Originalfassung. Vorgängiger
  CC-BY-NC-SA-Stand wurde bewusst aufgegeben — MIT ist OSI-konform,
  CC ist nicht für Software empfohlen.
- **Keine Analytics, kein Netzwerk, keine Plattform-Berechtigungen.** Die
  Datenschutzerklärung ist im App-Bundle (`legal/privacy-policy.de.md`,
  gerendert via `privacy_page.dart`), die App ist deutsch-zuerst.
- Beim Portieren aus Rust die Rust-Funktions-/Struct-Namen in Kommentaren
  beibehalten — sie sind der Lookup-Schlüssel für Verhaltens-Querverweise.
- **Lints:** `analysis_options.yaml` aktiviert nur das
  `package:flutter_lints/flutter.yaml`-Standardset, keine projekt-spezifischen
  Zusatzregeln. `flutter analyze` muss aber sauber bleiben — CI fängt
  Verstöße.

## Umgebungs-Hinweise

- Der `tablet` Android-Emulator ist instabil bei wiederholten
  `flutter install`-Zyklen auf dieser Maschine. Lieber ein physisches
  Gerät verwenden oder den Emulator zwischen Installs neu starten.
