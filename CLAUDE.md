# CLAUDE.md

Diese Datei gibt Claude Code (claude.ai/code) Hinweise zur Arbeit mit dem Code in diesem Repository.

## Projekt

Flutter-Port eines Rust + egui Wissenschafts-Taschenrechners, der nativ in
**Basis 12** (dozenal) rechnet. Ursprung: https://github.com/Bawdyness/dozenal_calc
(Rust-Upstream bleibt unter Bawdyness — bei steinerschueler veröffentlicht
der Autor nur fertige Software, der Rust-Prototyp ist Entwicklungs-Sandbox).
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
flutter test                  # gesamte Suite (~221 Tests)
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
- `unit_convert_test.dart` + `converter_state_test.dart` — Einheitenrechner:
  SI-Drehscheibe/Faktoren/Breakdown bzw. Compound-Eingabe + Cursor.
- `converter_keypad_layout_test.dart` — Umrechner-Layout über Seitenverhältnisse.
- `cursor_tap_test.dart` — Tipp-Cursor (Hauptrechner-Hit-Test + `moveCursorTo`).

CI (`.github/workflows/ci.yml`) ist auf Flutter 3.41.8 stable festgenagelt
und führt `analyze` + `test` aus. Das Flutter-SDK selbst pinnt sechs
transitive Abhängigkeiten (`meta`, `vector_math`, `cli_util`, `matcher`,
`test_api`, `xml`) auf Versionen, die `pub outdated` flaggt — das ist
erwartet, kein Bug. Nach jedem Flutter-Minor-Stable-Release erneut prüfen.

### Manuelles Testen auf physischem Gerät

adb-Loop (Gerät finden → bauen/installieren → per `input tap/swipe`
ansteuern → `screencap`+`pull` → `Read`). Bei State-Wechsel-Prüfungen
(Sprache/Orientierung/Theme/Tastenmodus) **beide** Zustände als Datei
capturen und via `SendUserFile` nebeneinander zeigen, nie Spot-Check
zurückgeben. Vollständige Schritt-für-Schritt-Anleitung inkl.
Install-Konflikt-Lösung und udev-Reflex:
[`docs/device-testing.md`](docs/device-testing.md).

### Release-Builds

```bash
flutter build apk --release
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
flutter build web --release
```

Der Play-Store-Appbundle-Build braucht explizit Java 17 (Java 21 auf dieser
Maschine zerbricht Gradle). Android-Signing liest `android/key.properties` —
fehlt die Datei, fällt der Build still auf Debug-Signing zurück.

**Nach jedem Release-Build** mehrsprachige Play-Console-Versionshinweise
verfassen — ein ~450-Zeichen-Block pro Listing-Locale für die **sieben**
Play-Console-Release-Notes-Locales (DE, EN, FR, ES, IT, FA, RU; die übrigen
sieben App-Sprachen haben dort keinen Slot). Als `build<N>-release-notes.txt`
im Projekt-Root ablegen, dann via Gradle Play Publisher pushen:

```bash
dart run tool/sync_play_listings.dart   # store/listing.*.md + build<N>-release-notes.txt → play/
./gradlew publishListing                # nur Texte/Grafiken
./gradlew publishBundle                 # AAB-Upload (Track: internal, Status: DRAFT)
```

`publishBundle` lädt nur hoch (AAB muss schon gebaut sein), landet als Entwurf
auf `internal` und muss in Play Console manuell promotet werden. Vollständiger
Workflow — Notes-Block-Format + Template, `-Pplay.track`-Override, Credentials
(`~/keys/play-publisher.json`), Sync-Source-Layout:
[`docs/release-workflow.md`](docs/release-workflow.md). App-Namen-Konvention
pro Locale: [`docs/store-listings.md`](docs/store-listings.md).

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

### Play-Store-Screenshots (Status: manueller Capture)

Keine per-Locale-Screenshots im Repo — die `tool/generate_screenshots.dart`-
Pipeline wurde wegen unzuverlässigem `.ttc`-Font-Loading in flutter_test
(CJK-Tofu) verworfen. Play Console nutzt das Default-Locale-Set für alle
Sprachen. Falls per-Locale gewünscht: adb-Capture vom Gerät (siehe
`docs/device-testing.md`). Details + Begründung:
[`docs/store-listings.md`](docs/store-listings.md).

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

**Width-Truncation auf der Ergebnis-Zeile:** lange exakte Ergebnisse (z. B.
`AB ⊕ BB` mit Periode-Länge 136 in Basis 12) würden rechts-bündig
gerendert nach links aus dem Display laufen. `_paintResultLine` in
`display.dart` läuft deshalb eine Drop-Schleife: solange `totalW +
suffixW > rect.width`, wird das hinterste Token (= niederwertigste
Nachkomma-Stelle) verworfen, Periode-Overlay-Indices werden
mit-geclampt. War vorher kein Suffix gesetzt, wird ein Baseline-`…`
angehängt (semantisch wie State B: „mehr da, abgeschnitten"). State C
gewinnt visuell über reine Width-Truncation, weil die Period-Info
informativer ist als der reine Schnitt-Marker.

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

**Error-Guard mit in-place Edit:** der `handleClick`-Error-Guard ist
dreiteilig:
- **AC** → kompletter Reset (Buffer, Cursor, Error).
- **Mode/Memory/Info-Tokens** (`_isErrorBlocked`: Drg/Doz/Dez/Sto/Rcl/
  Mc/Ans/Info/Expand/Close) → blockiert, User muss AC drücken.
- **Pfeil-Tasten** → Cursor bewegt sich, Error + Input + Cursor bleiben
  erhalten. Lässt den User im fehlerhaften Input navigieren, mit
  Fehlermeldung als Kontext sichtbar.
- **Alle anderen** (Del, Digit, Operatoren, Klammern, Funktionen,
  Equals) → Error löscht sich, Input + Cursor bleiben, dann normaler
  Dispatch. Erlaubt in-place-Editierung des fehlerhaften Ausdrucks
  + Re-Evaluation per Equals, ohne den ganzen Ausdruck neu tippen
  zu müssen.

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
  Tablet-Portrait (170 dp). Liest **GlyphStyle** aus dem
  `GlyphStyleScope`-InheritedNotifier (via `Builder` innerhalb des
  `CustomPaint`-Wraps): `custom` = Dozenal-Glyphen via
  `paintDozenalDigitAt` (Default), `conventional` = ASCII `'0'..'9'/'A'/'B'`
  per TextPainter (Pitman/Dwiggins-Konvention für die Über-9er-Stellen).
  Affektiert nur das Display — der Keypad-Render-Pfad in `keypad.dart`
  bleibt bewusst immer auf Custom-Glyphen (Marken-Identität). Quell-
  Datei `lib/logic/glyph_style.dart`, Persistenz via SharedPreferences-
  Key `glyph_style_v1`.
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

**Layout der Info-Liste** (`InfoListPage`):
1. `_TheoryExpansion(titles: titles)` — ausklappbarer Container für die
   zwölf Lehr-Kapitel, Default collapsed, Header „Theorie" mit
   `Icons.menu_book_outlined` und Chevron. Inside: 12 ListTiles mit
   monospace-Nummern-Prefix + Navigations-Chevron, eingerückt um 32 dp.
2. `_GlyphStyleToggle` — zweisegmentiger ToggleButtons-Switch zwischen
   Glyphen und 0-9/A,B (siehe Rendering-Abschnitt). Liegt direkt unter
   der Theorie, weil die Darstellungs-Wahl Teil davon ist, wie der
   Nutzer Dozenal liest — kein tiefes Setting-Menue dahinter.
3. `_LanguagePickerExpansion` — analoge Ausklapp-Struktur, Default
   collapsed, listet `kSupportedLanguages`.
4. Sekundärseiten als Navigations-Items (Imperial-12, Datenschutz,
   Lizenz, Spenden, Feedback).
5. `_VersionFooter` (Padding + Versions-Anzeige).

Alle Top-Level-Items sind durch 1-dp-Dividers im Farbton `0xFF2C2C2C`
getrennt; keine grösseren Gaps mehr (früher 24 dp vor dem Sprach-
Picker als visueller Sektions-Marker — mit dem Theorie-Expansion-
Container ist dieser Marker visuell redundant geworden).

AppBar-Titel ist `infoListTitle` und reflektiert die Mischnatur der
Seite (Theorie + alle anderen Items): DE „Theorie und Weiteres",
EN „Theory and More", entsprechend lokalisiert in allen 14 Locales.

Der Dispatcher (`buildChapterContent` in `info_content.dart`) wählt über
eine `const Map<String, _ChapterBuilder> _chapterBuilders` anhand der
aktiven Locale die passende Sprach-Funktion. Fallback auf Deutsch bei
unbekannter Locale (sollte nie passieren, weil `resolveLocale` nur
unterstützte Codes durchlässt).

Kapitel 2 hält die sprach-spezifische Aussprache-Konvention für
Dozenal-Zahlen fest (Magnituden quader/cuber/tesser/…, pro Sprache
unterschiedliche Konnektoren und Mutationsregeln). **Vor jedem Edit an
Kapitel-2-Prosa in `info_content_<lang>.dart` die vollständige Konvention
in [`docs/chapter2-conventions.md`](docs/chapter2-conventions.md)
nachschlagen.** Das e/o-Präfix als Theorie-Lese-Hilfe (e = dezimal,
o = dozenal) bleibt in allen Sprachen sprachneutral.

Wenn `handleClick` `state.infoState` auf `InfoList` setzt, pusht der
State-Listener in `main.dart` die Route und resettet `infoState` auf
`Closed` — der Navigator steuert ab dann alle Listen-/Detail-/Zurück-
Übergänge.

Sekundärseiten (aus `info_pages.dart` gepusht, alle über die Info-Liste —
keine direkten Routen aus `main.dart`): `privacy_page.dart` +
`license_page.dart` (laden `legal/<typ>.<code>.md` per Locale via
`markdown_page.dart`), `feedback_dialog.dart` (`mailto:`-Composer, kein
Netzwerk, Strings über ARB), `conversions_page.dart` (Live-Umrechnung in die
Imperial-12-Einheiten — Zoll/Fuss, Pence/Schilling/Pfund, Dutzend/Gros,
Zeit, 360°-Bruchteile — mit eigener Doz/Dez-Toggle und symbolischer Notation
`ft/in/sh/d/£/min/h/°` statt Wörtern, damit die Bodies in allen Locales
identisch bleiben), `converter_page.dart` (interaktiver Einheitenrechner —
zweiter Rechner-Modus, eigener Abschnitt unten), `support_page.dart`
(externer Ko-fi-Link via
`openExternalLink`, kein In-App-Payment; rahmt die Spende gegen die
Apple-Developer-Program-Gebühr für den iOS-Weg).

**Datenschutz-Web-Hosting (cPanel):** Parallel zu den in-app
`legal/privacy-policy.<tag>.md` (App-Bundle, via `flutter_markdown_plus`)
leben unter `legal/privacy.<tag>.html` vierzehn stand-alone HTML-Versionen
für `weltanschauung.app`; die Play-Console-Datenschutz-URL zeigt auf eine
(Default `privacy.de.html`). Jede enthält einen `<nav class="lang-picker">`
mit allen 14 Sprachen (Flag + nativer Name, `direction: ltr` erzwungen, damit
FA/AR nicht spiegeln). **Walisische Flagge ist Inline-SVG** (Pfad aus
`WelshFlagPainter`), weil die Unicode-Subdivision-Sequenz auf Firefox-Linux
und älteren Android-Versionen unzuverlässig rendert; die anderen 13 nutzen
Regional-Indicator-Emojis.

### Einheitenrechner (zweiter Rechner-Modus)

Vollständiger Umrechner, erreichbar über „Theorie und Weiteres" →
„Einheitenrechner" (`InfoListPage`, Eintrag `infoListConverterEntry`). Nutzt
die Bausteine des Hauptrechners wieder, ist aber ein **eigener Screen** — das
Hauptrechner-Keypad bleibt unangetastet (Store-Screenshots gültig). Vollständige
Spezifikation + Implementierungs-Fortschritt: [`docs/unit-converter.md`](docs/unit-converter.md).

**Zwei-Welten-Logik (Doz/Dez):** Doz = imperiale/dozenale Einheiten in Basis 12,
Dez = metrische Einheiten in Basis 10. Die `{ }`-Klammer zeigt jeweils das
Gegen-System; intern läuft alles über eine **SI-Drehscheibe**.

- `lib/logic/unit_data.dart` — reine Daten: 16 Kategorien (`UnitCategory`),
  je imperiale + metrische Leiter, SI-Faktoren, `breakdown`-Kaskaden (imperial),
  `affine`-Flag (temp). Keine Flutter-Imports.
- `lib/logic/unit_convert.dart` — `convert`, `bracketPartner`/`bracketValue`
  (Klammer), `breakdown` (mixed-radix), `nextInLadder`.
- `lib/logic/base_num.dart` — `parseBaseNum`/`formatBaseNum` (Basis 10/12).
- `lib/converter_state.dart` — `ConverterState extends ChangeNotifier`:
  Compound-Eingabe als Term-Liste, Operatoren (+ implizit / − explizit),
  Gesamtwert, `=`-Zyklus (Einheiten + Breakdown), Welt-Wechsel werterhaltend,
  Edit-Cursor (Caret in der getippten Zahl + Term-Grenzen).
- `lib/converter_keypad.dart` — Portrait (`_buildColumn`, drei Höhen-Regime
  wie `_HochKeypad`) + Breit (`_buildBreit`, alle Sets inline). Set 3/4 + 8/9
  sind Kategorien; Tipp expandiert die Magnituden-Leiter in die Gegenspalte
  (+ frei werdende Slots). Inaktive Op-Tasten (× ÷, Set 2/6/7, Drg) ausgegraut.
- `lib/converter_display.dart` — zweizeilig, Ausdruck + `{ }`-Klammer, plus
  custom-paint **Caret** (rote Linie) mit Tap-Hit-Testing auf der Eingabezeile.
- Kategorie-Labels lokalisiert (`unitCat*`, 14 Sprachen); Einheiten-Symbole
  (`ft`, `kg`, …) bleiben international.

Die alte statische `conversions_page.dart` bleibt vorerst parallel bestehen
(soll später zu einem Theorie-Block werden).

**Tipp-Cursor (beide Rechner):** Tippen auf die Eingabezeile positioniert den
Bearbeitungs-Cursor (die rote Linie). Hauptrechner: `TwoLineDisplay`
(`inputCursorPosForTap` + `GestureDetector`) → `DozenalCalcState.moveCursorTo`.
Umrechner: `converter_display` Caret-Hit-Test → `ConverterState.handleInputTapAtChar`.

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
  automatisch auf `zh-Hant`. `info_content.dart`, `privacy_page.dart`,
  `license_page.dart` und der Sprach-Picker in `info_pages.dart`
  (`_LanguagePickerExpansion`) vergleichen über `toLanguageTag()` statt
  nur `languageCode`. Sonst würden zh-Hant-Routen auf die vereinfachten
  Dateien zurückfallen — und im Picker (`languageCode == 'zh'` für beide
  Chinesisch-Varianten) markiert der Häkchen-Indikator fälschlich beide
  Zeilen und der Header zeigt immer die zuerst registrierte Variante.
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

**Keine `SystemChrome.*`-Calls in `main.dart`** (kein
`setEnabledSystemUIMode`, kein `setSystemUIOverlayStyle`): beide laufen über
Flutters `PlatformPlugin`, das statisch auf deprecated `Window.setStatusBar/
NavigationBarColor` verweist, die Play Console beim DEX-Scan flaggt. Alles
nativ in `MainActivity.java`. Verbleibende Play-Console-Warnungen (»randlose
Anzeige«, »nicht mehr unterstützte APIs«) stammen aus Flutter-Engine +
`androidx.activity`-Backports, sind als bekannte **Upstream-Issues** zu
behandeln (kein TODO im Repo) und keine aggressiven R8-Strip-Regeln einbauen.
Vollständige Begründung, Issue-Tracking und der Re-Check bei Flutter-Upgrades:
[`docs/edge-to-edge.md`](docs/edge-to-edge.md).

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

## Native Begleit-Apps (macOS, watchOS)

Neben den Flutter-Zielen (Android, iOS/iPadOS, Web) gibt es zwei native
Apple-Ableger. Beide sind **kein Flutter** — Flutter kann macOS als Desktop,
aber **nicht** die Apple Watch.

- **macOS (Flutter-Desktop):** per `flutter create --platforms=macos .`
  hinzugefügt (Ordner `macos/`). Baut/läuft als Desktop-Fenster
  (`flutter run -d macos`); das Breit-Keypad greift, physische Tastatur und
  Custom-Painter funktionieren. App-Store-fertig (ab Build 16): Bundle-ID
  `app.weltanschauung.dozenal` (in `macos/Runner/Configs/AppInfo.xcconfig`,
  identisch zu iOS/Android → **gleicher** App-Store-Connect-Eintrag,
  macOS als zusätzliche Plattform), Anzeigename „Dozenal Calc" via
  `CFBundleName`/`CFBundleDisplayName` in `macos/Runner/Info.plist` (der
  ASCII-`PRODUCT_NAME = dozenal_calc_flutter` bleibt, weil das `.xcodeproj`
  `dozenal_calc_flutter.app` per Pfad referenziert), Marken-Icon via
  `flutter_launcher_icons` (`macos:`-Block in `pubspec.yaml`),
  Release-Entitlements nur `com.apple.security.app-sandbox` (kein Netzwerk).

- **watchOS (SwiftUI, in die iOS-App eingebettet — ab Build 16):** Quellen in
  `watch/Sources/` (`App.swift`/`Calculator.swift`/`Glyph.swift`). Bewusst
  winzig: festes Display oben (links-bündig), darunter drei gewischte Seiten
  (Lizenz/Datenschutz · Glyphenblock · Funktionsblock), Gleichtaste über die
  volle Breite. Die zwölf Dozenal-Glyphen sind als SwiftUI-`Shape` 1:1 aus
  `lib/glyph_painter.dart` portiert (`watch/Sources/Glyph.swift`); die
  Rechenlogik (Basis-12-Eingabe, rekursiver Auswerter mit `+ − × ÷`, `^`,
  binärem `√` = n-te Wurzel, `log`, Klammern) in `watch/Sources/Calculator.swift`.
  Build/Test/Bekannte-Probleme (u. a. der watchOS-`.page`-TabView-Erstrender-
  Zoom): [`docs/watch.md`](docs/watch.md).

  **Auslieferung:** Das `DozenalWatch`-Target lebt in `ios/Runner.xcodeproj`
  und wird beim Archivieren der iOS-App in `…app/Watch/` eingebettet (ein
  IPA, ein App-Store-Eintrag). Verdrahtet per `tool/embed_watch_target.rb`
  (idempotent, `xcodeproj`-Gem) — referenziert dieselben `watch/Sources/`-
  Swift-Dateien (single source of truth), nutzt aber eine eigene Companion-
  `Info.plist` (`ios/watch/Info.plist`: `WKApplication` + `WKCompanionApp-
  BundleIdentifier = app.weltanschauung.dozenal`, **kein** `WKWatchOnly`) und
  einen eigenen Icon-Katalog (`ios/watch/Assets.xcassets`, alpha-freies 1024er
  aus dem iOS-Icon). Bundle-ID `app.weltanschauung.dozenal.watch`,
  `MARKETING_VERSION`/`CURRENT_PROJECT_VERSION` im Target müssen mit der
  Flutter-Version synchron gehalten werden (aktuell `1.3.0`/`16`).

  Das eigenständige **xcodegen**-Projekt (`watch/project.yml`, daraus
  `watch/DozenalWatch.xcodeproj` + `watch/build/`, beide gitignored) bleibt
  parallel für schnelles Simulator-Testen bestehen — es nutzt `WKWatchOnly`
  statt Companion. Bei Glyphen-/Logik-Änderungen genügt das Editieren der
  geteilten `watch/Sources/`-Dateien; beide Projekte ziehen sie automatisch.

## Konventionen

- **Branch-Trennung (HART):** Arbeit am **Dozenal Calc** (diese App — Rechner,
  Theorie, Einheitenrechner, l10n, Store) wird **ausschließlich auf `master`**
  committet und gepusht, **niemals** auf `bidozenal-foundation`. Die Branch
  `bidozenal-foundation` gehört allein der separaten **Basis-24-„Bidozenal"-App**
  (Fundament in `docs/bidozenal.md`) und darf keinen Dozenal-Calc-Code
  aufnehmen. Vor jedem `commit`/`push` den aktiven Branch prüfen
  (`git branch --show-current`); steht HEAD versehentlich auf
  `bidozenal-foundation`, zuerst `git checkout master`. Umgekehrt gilt das
  Gleiche: Bidozenal-Basis-24-Arbeit nie auf `master`.
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
