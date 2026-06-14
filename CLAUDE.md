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
flutter test                  # gesamte Suite (~294 Tests)
flutter test test/rational_test.dart           # einzelne Datei
flutter test --plain-name "parses 1/7"         # einzelner Test per Name
```

Test-Routing (für gezielte Edits):
- `state_test.dart` — Orchestrator inkl. Handler-Pfade, mit Abstand die
  größte Datei.
- `rational_test.dart` + `rat_parser_test.dart` — exakte Rational-Schiene.
- `expression_test.dart` — f64-Auswerter inkl. `resolvePostfix`.
- `dozenal_converter_test.dart` — Doz ↔ Dez-Konvertierung.
- `keypad_layout_test.dart` — Orientierungs-Dispatch, Repaint-Verhalten
  und die Keypad-Modi/-Profile (Overlay/Scroll, Alle/Einfach).
- `long_press_popup_test.dart` — Langdruck-Popups: Host-Map, beide
  Auswahl-Gesten (Gleiten+Loslassen / Loslassen+Tippen),
  Tap-outside-Dismiss, a11y-Hold-Hint, EXP-statt-Doz/Dez in Set 10.
- `glyph_style_test.dart` — `GlyphStyleNotifier`: beide unabhängigen
  Prefs (Display/Keypad), Persistenz, Fallbacks, `keypadStyleOf`.
- `calc_prefs_test.dart` — `CalcPrefsNotifier`: Defaults, Persistenz-
  Roundtrip, Fallback bei unbekannten Strings, Notify-Verhalten.
- `app_theme_test.dart` — `ThemeNotifier` (Defaults, Persistenz,
  System-Modus-Auflösung), `AppColors.of`-Fallback, Light-Boot-Smoke
  der ganzen App.
- `settings_page_test.dart` — Einstellungen-Seite: Zeilen-Rendering,
  Segment-Toggles, Sichtbarkeit der State-Zeilen ohne `CalcStateScope`.
- `edge_cases_test.dart` — Grenzfall-Sammler über die Module hinweg.
- `unit_convert_test.dart` + `converter_state_test.dart` — Einheitenrechner:
  SI-Drehscheibe/Faktoren/Breakdown bzw. Compound-Eingabe + Cursor; dazu
  die Resultat-Brücke (`insertCalcAns`/`ansForBridge`) und das Überleben
  der Pending-Zahl beim Kategorienwechsel.
- `calc_pager_test.dart` — Rechner↔Umrechner-Pager: Swipe in beide
  Richtungen, Tastatur-Routing nach aktiver Seite, Ans/CONV-Roundtrip
  durchs UI, Info-Listen-Eintrag → Pager-Wechsel.
- `converter_keypad_layout_test.dart` — Umrechner-Layout über Seitenverhältnisse.
- `cursor_tap_test.dart` — Tipp-Cursor (Hauptrechner-Hit-Test + `moveCursorTo`).
- `recommendations_test.dart` — „Empfehlungen": Kapitel-Dispatcher plus
  Struktur-Treue aller 14 Sprachen (7 Kapitel, Pro-/Contra-Zählung je Rechner,
  URL-Menge identisch zur deutschen Vorlage), übersetzte Titel,
  `RecChapterPage`-Rendering.

CI (`.github/workflows/ci.yml`) ist auf Flutter 3.41.8 stable festgenagelt
und führt `analyze` + `test` aus. Das Flutter-SDK selbst pinnt sechs
transitive Abhängigkeiten (`meta`, `vector_math`, `cli_util`, `matcher`,
`test_api`, `xml`) auf Versionen, die `pub outdated` flaggt — das ist
erwartet, kein Bug. Nach jedem Flutter-Minor-Stable-Release erneut prüfen.

### Manuelles Testen auf physischem Gerät

Grundprinzip: adb-Loop (Gerät finden → bauen/installieren → per
`input tap/swipe` ansteuern → `screencap` → `Read`); bei
State-Wechsel-Prüfungen (Sprache/Orientierung/Theme/Tastenmodus) **beide**
Zustände als Datei capturen und via `SendUserFile` nebeneinander zeigen, nie
Spot-Check zurückgeben.

Die **vollständige Anleitung** (Geräte-Quick-Reference mit Serials/Auflösung,
Entsperr-Rezepte mit Pixelkoordinaten, Install-Konflikt-Lösung, udev-Reflex)
liegt **bewusst nur lokal** in `docs/local/device-testing.md` — diese Datei ist
**gitignored und gehört nicht ins (ggf. veröffentlichte) Repo**, weil sie
gerätespezifische und persönliche Daten enthält. Sie ist auf der Arbeits-
maschine vorhanden; bei Gerätetests dort nachschlagen. Beim Anlegen neuer
gerätebezogener Test-Doku ebenfalls dort (gitignored) ablegen, nie in
versionierten Dateien.

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
verfassen — ein <500-Zeichen-Block (Play-Limit) pro Listing-Locale für die
**zwölf** Play-Console-Release-Notes-Locales (DE, EN, FR, ES, IT, FA, RU, HI,
ZH, ZH-Hant, JA, AR; Play-Tags de-DE/en-US/fr-FR/es-ES/it-IT/fa-AF/ru-RU/
hi-IN/zh-CN/zh-TW/ja-JP/ar — maßgeblich ist die `_localeMap` in
`tool/sync_play_listings.dart`). Nur Irisch (GA) und Walisisch (CY) haben dort
keinen Slot. Als `build<N>-release-notes.txt`
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
`docs/local/device-testing.md`, lokal/gitignored). Details + Begründung:
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
- `token_painter.dart` — Glyphen der Operator-/Funktionstasten. Der
  Text-Fallback skaliert pro Token (`_labelScale`): `.`/`…` 0.55,
  `(`/`)` 0.5, Rest 0.35 — kleine/dünne Glyphen lesbar groß. Die
  Equals-Taste ist seit dem Welt-Farbcode **blau** (Palette-Slot
  `equals` = Op-Blau; Grün gehört der Zehner-Welt). Im Umrechner trägt
  der Gleichbalken zusätzlich einen lokalisierten Hinweis am unteren
  Rand (`equalsHint`-Param, ARB `converterEqualsHint` ×14: „mehrmals
  tippen: nächste Einheit").
- `keypad_parts.dart` — **gemeinsame Bausteine beider Keypads** (Haupt +
  Umrechner), damit nichts auseinanderdriftet: `PressableShell` (Tasten-
  Chassis: Press-Flash, Haptik, Rahmen inkl. gold/selected, Langdruck-
  Hooks, 44-dp-Floor), `DigitKeyPainter`/`TokenKeyPainter`, das
  Ziffern-Grid `kDigitGridRows`, die identischen Spalten `kSet1/2/6/7`
  und die Hoch-Höhen-Regime `kKeypadTight-/ScrollThreshold` (früher je
  Datei dupliziert mit „keep in sync"-Kommentar). Die Keypads selbst
  bleiben bewusst getrennte Widget-Bäume: gleiche Glyphen, verschiedene
  Semantik/Dispatches.
- `display.dart` — Zwei-Zeilen-Display, Überstrich-Rendering,
  Periode-Markierung. `TwoLineDisplay` skaliert sich adaptiv an seinen
  Container, funktioniert also vom Landscape-Phone (~60 dp) bis zum
  Tablet-Portrait (170 dp). Liest **GlyphStyle** aus dem
  `GlyphStyleScope`-InheritedNotifier (via `Builder` innerhalb des
  `CustomPaint`-Wraps): `custom` = Dozenal-Glyphen via
  `paintDozenalDigitAt` (Default), `conventional` = ASCII `'0'..'9'/'A'/'B'`
  per TextPainter (Pitman/Dwiggins-Konvention für die Über-9er-Stellen).
  Quell-Datei `lib/logic/glyph_style.dart`: der `GlyphStyleNotifier`
  hält **zwei unabhängige Prefs** — `style` für das Display
  (SharedPreferences-Key `glyph_style_v1`) und `keypadStyle` für die
  Ziffern-Tasten (`keypad_glyph_style_v1`, gelesen via
  `GlyphStyleScope.keypadStyleOf(context)`; ohne Scope Fallback auf
  custom). Beide defaulten auf custom; Display und Keypad lassen sich
  also getrennt auf konventionelle Ziffern umstellen
  (Settings-Zeilen „Glyphen-Stil" bzw. „Ziffern auf Tasten").
- `keypad.dart` — orientierungsgesteuertes Dispatch. `Keypad` nimmt
  zusätzlich `keypadMode` (Overlay/Scroll) und `keypadProfile`
  (Alle/Einfach) aus den Einstellungen entgegen (siehe
  Einstellungen-Abschnitt).
  **Set 10 ist [EXP (Sci), DRG, CONV, Close]** —
  die Doz/Dez-Tasten sind vom Keypad entfernt, die Basis-Umschaltung
  läuft nur noch über die Einstellungen-Seite (werterhaltend, gleicher
  `handleClick(Doz()/Dez())`-Pfad). CONV (`ConvAns`-Token) ist die
  Brücken-Taste zum Einheitenrechner — siehe „Resultat-Brücke" im
  Einheitenrechner-Abschnitt; im Profil „Einfach" fehlt sie wie alle
  erweiterten Sets (Ans/Speicher dort ebenfalls nicht erreichbar).
  **Langdruck-Popups:** ausgewählte Host-Tasten bieten bei langem Druck
  ein Akzent-Popup im Smartphone-Tastatur-Stil an. Host-Map ist die
  öffentliche Funktion `longPressOptionsFor(token)`:
  x^□ → {x²}; log_□ → {ln, log₁₂, eˣ}; − → {±}; STO → {M+, M−};
  n! → {nCr, nPr}. Host-Tasten tragen eine kleine Ecke unten rechts
  (`_CornerMarkPainter`, Dreieck in `textMuted`, 6×6 dp bei
  right:3/bottom:3) und einen a11y-Hint (`a11yHoldMore`). Auswahl per
  **beiden** Gesten: Gleiten+Loslassen (Hit-Test in globalen
  Koordinaten) oder Loslassen+Antippen. Die Schließen-Barrier ist ein
  **`Listener` mit translucent-Hit-Test** (OverlayEntry), KEIN opaker
  GestureDetector: Pointer-down außerhalb schließt das Popup UND der
  Tap wirkt normal auf die Taste darunter — die Barrier darf nie
  Eingabe schlucken (Smartphone-Tastatur-Verhalten; gleiche Konvention
  im Unit-Info-Kasten des Umrechner-Keypads). Die
  Popup-Breiten-Mathematik muss den 1-px-Container-Border
  (`_popupBorder`) einrechnen.
  **Zweite Overlay-Seite (Funktionsseite) ist deaktiviert, nicht
  gelöscht:** const-Flag `_kFuncPageEnabled = false` hält den Code
  intakt aber unerreichbar (auch die Breit-Spaltenbreiten-Mathematik
  ist auf das Flag konditioniert). Bei Reaktivierung nur das Flag
  kippen.
  `Keypad.build` liest die `LayoutBuilder`-Constraints und wählt:
  - **`_HochKeypad`** (Portrait): vertikale Flex-`Column` mit
    `AnimatedSwitcher`-Panel-Swap zwischen Sets 1–4 + System-Reihe und
    Sets 6–10. Drei Gap-Regimes nach verfügbarer Höhe: normal (≥560 dp),
    eng (480–559 dp), Scroll-Fallback (<480 dp).
    - **Scroll-Modus** (`KeypadMode.scroll`, nur bei Profil „Alle"):
      statt Panel-Swap eine `SingleChildScrollView` mit allen Sets
      untereinander — Sets 1–4, System-Reihe ohne Expand
      (`_systemRowNoExpand`), „Erweiterungsfeld"-Header,
      `_hochScrollExtendedRows` (Sets 6–9) und EXP/Drg ohne Close
      (`_set10RowNoClose`). Die `=`-Zeile bleibt außerhalb gepinnt.
    - **Profil „Einfach"** (`KeypadProfile.simple`): nur Ziffern +
      Sets 1–4 + AC/Del/`.` — keine Expand-Taste, kein Erweiterungsfeld,
      keine EXP/DRG-Reihe (Winkelmodus dann über die
      Einstellungen-Seite). Scroll-Modus wird in „Einfach" ignoriert.
  - **`_BreitKeypad`**: drei Konfigurationen in `_buildBreitContent` —
    Einfach = 8 Spalten ohne Pfeiltaste und ohne dritte Gruppe;
    Alle+Overlay = 13 Spalten mit Page-Pfeil (bisheriges Verhalten);
    Alle+Scroll = 17 Spalten inline ohne Pfeil, Button-Sizing dann nur
    über `rawH` (horizontaler Scroll absorbiert die Überbreite).
  - **`_BreitKeypad`** (Landscape / Tablet): Inline-Layout mit allen zehn
    Sets nebeneinander, gegliedert in drei visuelle Blöcke: Zahlengitter,
    Sets 1–5 (Hauptoperationen + System), Sets 6–10 (erweiterte Funktionen).
    Zwischen den drei Blöcken läuft je eine 1-dp-Divider-Linie
    (Palette-Slot `hairline`, gleich wie der horizontale Divider in
    `_HochKeypad`).
    Geometrie (Build 7, mit Build-8-Floor-Anpassung):
    - `buttonSize = min(rawH, rawW).clamp(breitMinTouchTarget, 70)` — beide
      Achsen werden berücksichtigt, damit weder vertikal noch horizontal
      beschnitten wird. `breitMinTouchTarget = 36 dp` (statt der Hoch-Mode-
      `minTouchTarget = 44 dp`): Material 48 / iOS 44 sind Empfehlungen,
      nicht Mauern, und in Landscape wird das Phone zweihändig gehalten —
      36-dp-Targets bleiben treffbar. Mit 44 als Floor klemmten 360-dp-
      hohe, kompakte Phones auf beiden Achsen und
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

**Layout der Info-Liste** (`InfoListPage`) — seit dem Texte-Umbau:
1. „Bedienung des Hauptrechners" (`chapterTitle01`) — Handbuch-
   Expansion (`_ManualSectionExpansion`, parametrisiert statt
   dupliziert): App-Hilfe, kein Theorie-Stoff.
2. „Bedienung des Einheitenrechners" (`infoListConverterManual`) —
   zweite Instanz derselben Expansion, gespeist aus
   `converterManualChapters` (sechs Kapitel: Der zweite Rechner ·
   Kategorie/Zahl/Einheit · met/imp+Farben · +/−-Terme ·
   Skalar-Rechnen · Speicher/Konstanten/Brücke). **Alle 14 Sprachen
   vollständig übersetzt** (Subagenten-Pipeline: Übersetzen + Review);
   der positionsweise Deutsch-Fallback bleibt als Mechanik für
   künftige Kapitel bestehen.
3. `_TheoryExpansion` — ausklappbar zu den drei Theorie-Blöcken
   (Zwölf und die Welt, Dozenale Mathematik, Dozenale Gesellschaft)
   **plus „Einheitentheorie"** (`infoListConversionsEntry` →
   `ConversionsPage`) als viertem Eintrag — dorthin gezogen, als die
   frühere `_UnitsExpansion` aufgelöst wurde. Einen
   Navigations-Eintrag „Einheitenrechner" gibt es nicht mehr (Swipe +
   Page-Peek tragen den Zugang; der `requestConverter`-Pfad in
   state/main ist entfernt).
4. `_RecommendationsExpansion` — ausklappbar; ein Kapitel pro
   Plattform mit Pros/Cons je Rechner (eigener Abschnitt
   „Empfehlungen" unten).
5. **Einstellungen-Eintrag** — pusht `SettingsPage`
   (`settings_page.dart`, eigener Abschnitt unten). Die früher hier
   liegenden Quick-Toggles (Glyphen-Stil, Haptik) sind dorthin gezogen.
6. `_LanguagePickerExpansion` — analoge Ausklapp-Struktur, Default
   collapsed, listet `kSupportedLanguages`.
7. Sekundärseiten als Navigations-Items (Datenschutz, Lizenz, Spenden,
   Feedback).
8. `_VersionFooter` (Padding + Versions-Anzeige).

Alle Top-Level-Items sind durch 1-dp-Dividers im Palette-Slot `divider`
getrennt; keine größeren Gaps mehr (früher 24 dp vor dem Sprach-
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

### Empfehlungen (`lib/recommendations/`)

Ausklappbarer Eintrag direkt unter „Theorie" (`_RecommendationsExpansion` in
`info_pages.dart`) → sieben Plattform-Kapitel: Physisch, Android — Play Store,
Android — F-Droid, iOS, macOS, Linux, Windows. Jedes öffnet eine
`RecChapterPage` (`recommendations_page.dart`): kurze Einleitung, je Rechner
eine Karte (Name · `tag` = Lizenz/Genre · `blurb` · ✓ Pros in `t.equals` · ✗
Cons in `t.ac` · Link-Zeile mit abgeleitetem Host) und ein „Fazit"-Kasten mit
Goldakzent. Kuratiert aus [`docs/taschenrechner-analyse.md`](docs/taschenrechner-analyse.md):
Power-User-Rahmung, immergrün (keine Preise/Versionen/Daten/Lagerstatus),
redaktionell ehrlich (nur belegte Aussagen als Fakt).

Datenmodell + Dispatch in `recommendations.dart` (`RecCalc`, `RecChapter`,
`recommendationChapters(langTag)`); Inhalte als per-Sprach-`part`-Dateien
`<lang>/recommendations_<lang>.dart` — **alle 14 Sprachen übersetzt**, Dispatch
script-aware wie bei `theory/` (zh-Hant vor zh). Produktnamen werden im
Karten-Titel per `TextDirection.ltr` erzwungen, damit „!" („Qalculate!") und
„/" („Free42 / Plus42") in RTL (fa/ar) nicht umsortiert werden. Plattform-
Kapiteltitel außer „Physisch" bleiben Eigennamen (iOS, macOS, …). ARB-Eintrag
der Sektion: `infoListRecommendationsExpansion` (×14). Der Dozenal-Bezug
(Qalculate! als einziger mit Basis-12-Ausgabe) ist bewusst eingewoben.

### Einstellungen (`lib/settings_page.dart`)

Eigene Seite, erreichbar über die Info-Liste. Bündelt die Quick-Toggles
(Glyphen-Stil, Haptik — früher lose Zeilen in der Info-Liste) mit den
Keypad-Präferenzen und den Live-Rechner-Modi. Acht Zeilen, getrennt
durch Dividers im Palette-Slot `divider`, Segment-Optik via `_SegmentRow`
(ToggleButtons im Stil des früheren `_GlyphStyleToggle`):

1. **Erscheinungsbild** Dunkel/Hell/System — liest `ThemeScope.maybeOf`
   und schreibt `ThemeNotifier.setSetting` (siehe Theming-Abschnitt
   unten); ohne ThemeScope (Standalone-Widget-Tests) wird die Zeile
   ausgeblendet — gleiche Konvention wie die Calc-State-Zeilen.
2. **Glyphen-Stil** (Display, `GlyphStyleScope.style`),
   3. **Ziffern auf Tasten** (`_KeypadGlyphsRow`,
   `GlyphStyleScope.keypadStyle` — unabhängiger zweiter Pref, siehe
   Rendering-Abschnitt) und 4. **Haptik** (`HapticsScope`).
5. **Funktionstasten** Overlay/Scrollen und 6. **Funktionsumfang**
   Alle/Einfach — schreiben in `CalcPrefsNotifier`
   (`lib/calc_prefs.dart`): `ChangeNotifier` + SharedPreferences-Keys
   `keypad_mode_v1`, `keypad_profile_v1`, `numeral_system_v1`,
   `angle_mode_v1`; unbekannte gespeicherte Strings fallen auf die
   Defaults zurück (Overlay/Alle/Doz/Deg = exakt das
   Vor-Einstellungen-Verhalten, Store-Screenshots bleiben gültig).
   Bereitgestellt über `CalcPrefsScope` (InheritedNotifier).
7. **Zahlensystem** mit ausgeschriebenen, lokalisierten Labels
   „Dozenal"/„Dezimal" (`settingsNumeralSystemDozenal/Decimal`, ×14 —
   seit dem Wegfall der Doz/Dez-Keypad-Tasten ist diese Zeile der
   primäre Basis-Schalter und muss selbsterklärend sein; sie gilt seit
   der Basis/System-Entkopplung für BEIDE Rechner). Die Segmente tragen
   den Welt-Farbcode (`optionColors` auf `_SegmentRow`: Dozenal violett,
   Dezimal grün, gewähltes Segment mit Eigenfarb-Rahmen) und
   8. **Winkelmodus** DEG/RAD/GRD — bedienen den **lebenden**
   `DozenalCalcState` über `CalcStateScope.maybeOf`
   (`lib/calc_scope.dart`); ohne Scope (Widget-Tests, die die Seite
   standalone pumpen) werden beide Zeilen ausgeblendet. Doz/Dez läuft
   über `handleClick(Doz()/Dez())` (wertbewahrende Basis-Umschaltung,
   gleicher Pfad wie früher die Keypad-Taste); der Winkelmodus über den
   Setter `setAngleMode` (die DRG-Taste zykelt stattdessen).

Wichtig: die Doz/Dez-Tasten existieren auf dem Keypad nicht mehr
(in keinem Profil) — die Zahlensystem-Zeile ist der einzige Zugang
zur Basis-Umschaltung. Im Profil „Einfach" fehlt zusätzlich die
DRG-Taste, dann ist auch der Winkelmodus nur hier erreichbar.

Verdrahtung in `main.dart`: `_DozenalCalcAppState` besitzt
`CalcPrefsNotifier` **und** `DozenalCalcState` (oberhalb des
Navigators, damit die Settings-Seite den State erreicht);
`_applyStartupPrefs` spielt die persistierten Werte nach `load()`
einmalig in den State ein, `_syncPrefsFromState` spiegelt
State-getriebene Änderungen (DRG-Zyklus auf dem Keypad, Doz/Dez via
Settings-`handleClick`) zurück in die Prefs. ARB: 9 neue Keys (`settingsTitle`, `settingsKeypadMode*`,
`settingsScope*`, `settingsNumeralSystemTitle`,
`settingsAngleModeTitle`) in allen 14 Sprachen; plus 4 Theme-Keys
(`settingsThemeTitle/Dark/Light/System`).

### Theming Hell/Dunkel (`lib/app_theme.dart`)

Kein Material-ThemeData-zentriertes Theming — die App ist durchgängig
custom-painted, deshalb läuft alles über eine **semantische Palette**:

- **`AppColors`** — const-Klasse mit zwei Instanzen: `AppColors.dark`
  (= exakt die historischen Hardcoded-Farben, Default) und
  `AppColors.light`. Slots statt Literale: `scaffoldBg`, `appBarBg`,
  `divider` (ex `2C2C2C`), `hairline` (ex `333333`), `cardFill`/
  `cardBorder`, `inputFill`, Text-Treppe `textPrimary/Secondary/
  Tertiary/Muted/Faint`, `link`, `accentGold`, Illustrations-Neutrale
  `illusLine/illusFaint/illusDot`, Tasten-Akzente (`op`, `equals`,
  `ac`) u. a. Light behält die egui-Akzent-Identität (Blau/Grün/Rot),
  nur abgedunkelt für Kontrast auf Hell.
- **`ThemeNotifier`** (`ThemeSetting.dark/light/system`, Default
  **Dunkel**): SharedPreferences-Key `theme_mode_v1`, unbekannte
  Strings fallen auf Dunkel zurück. `system` löst über
  `updatePlatformBrightness` auf (notifiziert nur im System-Modus).
  Bereitgestellt via **`ThemeScope`** (InheritedNotifier, in
  `main.dart` zuoberst).
- **`AppColors.of(context)`** — zentrale Leseroutine; ohne ThemeScope
  (Widget-Tests, `tool/`-Golden-Generatoren) fällt sie auf
  `AppColors.dark` zurück. Painter-Konvention: CustomPainters tragen
  ein `final AppColors colors`-Feld mit Default `AppColors.dark`,
  `shouldRepaint` vergleicht `old.colors != colors` (const-Identität
  macht das billig); kontextlose Helper bekommen `AppColors t` als
  Parameter durchgereicht.
- **MaterialApp** bekommt nur ein dünnes abgeleitetes ThemeData
  (brightness, `scaffoldBackgroundColor`, `appBarTheme`,
  `NoSplash.splashFactory`) aus der Palette — Quelle der Wahrheit
  bleibt `AppColors`.
- **Status-Bar-Icon-Brightness:** KEIN `SystemChrome` (siehe
  Edge-to-edge-Abschnitt) — eigener MethodChannel
  `app.weltanschauung.dozenal/system_bars`, `MainActivity.java`
  setzt `setAppearanceLightStatusBars/NavigationBars` via
  `WindowInsetsControllerCompat`. Dart-Seite guarded gegen Web/
  Nicht-Android + `MissingPluginException` und dedupliziert
  (`_sentLightBars`).
- **Bewusst theme-unabhängig:** Intro bleibt dunkel, Flag-Painter,
  `legal/*.html`, farbige Polygon-/Diagonal-Akzente in den
  Theorie-Illustrationen, roter Eingabe-Caret, der `0A84FF`-Button
  + weißes Icon-Backing in `AppRefCard`. Keypad-Ziffern folgen der
  Palette; ob sie als Custom-Glyphen oder konventionell gerendert
  werden, steuert der theme-unabhängige `keypadStyle`-Pref (siehe
  Rendering-Abschnitt).

### Einheitenrechner (zweiter Rechner-Modus)

Vollständiger Umrechner, seit dem Pager-Umbau **Seite 2 eines horizontalen
PageView** im `_CalcScaffold`: Links-Swipe auf dem Hauptrechner öffnet ihn,
Rechts-Swipe führt zurück (Default beim Start ist immer der Hauptrechner).
Einen Listen-Eintrag als Zugang gibt es seit dem Texte-Umbau nicht mehr —
Swipe + Page-Peek tragen die Entdeckbarkeit, das Kapitel „Der zweite
Rechner" im Einheitenrechner-Handbuch erklärt den Wechsel
(`requestConverter`/`converterRequested` wurden entfernt). Der
einbettbare Inhalt ist `ConverterBody`
(`converter_page.dart`); `ConverterPage` bleibt als Route-Wrapper für
Tests/Preview mit eigenem, brückenlosem State. Im Pager besitzt
`_CalcScaffoldState` den langlebigen `ConverterState` — Eingaben überleben
Seitenwechsel. Die Swipe-Geste ist frei, weil beide Displays nur
Tap/Langdruck/Vertikal-Drag belegen; in Breit-Layouts mit horizontalem
Keypad-Scroll funktioniert der Seiten-Swipe auf der Display-Fläche.

**Page-Peek-Indikator** (Swipe-Discoverability): zwei durchscheinende
Karten in Bildschirmmitte als **Miniaturen der Seite** — Karten-
Seitenverhältnis = Body-Seitenverhältnis, also Hochformat-Karten im
Portrait, breite Karten im Landscape; alles skaliert mit der Breite
(Karte 0.38 w, Lücke 0.08 w, Nachbar ~40 % angeschnitten). Die aktuelle
Karte zentriert mit **goldener Umrandung** (`accentGold` α 0.7, 2 dp),
die Nachbar-Karte seitlich vom Rand angeschnitten — Seitennamen in
18-pt-Semibold (`pagerLabelMain` ×14; Umrechner nutzt
`infoListConverterEntry`). Die Karten **gleiten live mit dem Pager**:
ein `AnimatedBuilder` am `PageController` bindet die Positionen an den
kontinuierlichen `page`-Wert (eine Swipe-Breite = ein Karten-Pitch), die
goldene Umrandung blendet per Alpha von der verlassenen zur ankommenden
Karte über (konstante 2 dp, keine Layout-Sprünge), und das sanfte
Ausrollen liefert die Pager-Physik selbst. Der Puls läuft über einen
Controller-Listener (`_onPagerScroll`): jede Bewegung hält den Peek am
Leben, der Hide-Timer zählt erst ab Stillstand; `_pulsePagePeek` ist
Build-Phasen-sicher (Scroll-Callbacks können während des Layouts
eintreffen → `SchedulerPhase`-Check + Post-Frame-Fallback) und setStatet
nur beim Mounten, nicht pro Scroll-Tick. Puls bei jedem Landen (Boot, Intro-Schluss,
Rückkehr aus „Theorie und Weiteres") und bei jedem Seitenwechsel
(`_pulsePagePeek` in `_CalcScaffoldState`): 160 ms Fade-in, ~1050 ms Halt,
420 ms Fade-out. `IgnorePointer` + `ExcludeSemantics`, und nach dem
Ausblenden wird das Overlay komplett **unmounted** (`_pagePeekMounted`),
damit keine unsichtbaren Flächen für Hit-Tests/Semantics/Test-Finder
zurückbleiben — Widget-Tests, die Listen-Einträge wie „Einheitenrechner"
per `find.text` antippen, müssen den Puls vorher ausklingen lassen
(`flushPagePeek`-Helper in `calc_pager_test.dart`).
Vollständige Spezifikation + Implementierungs-Fortschritt:
[`docs/unit-converter.md`](docs/unit-converter.md).

**Resultat-Brücke (Ans ↔ CONV):** jeder Rechner kann das aktuelle Resultat
des anderen per Taste ziehen. Werte reisen als `double`
(Provider-Callbacks, verdrahtet in `_CalcScaffoldState.initState`); jede
Seite formatiert in ihrer eigenen aktiven Basis:
- **Umrechner-Ans** (Set 6, vorher inert): `ConverterState.insertCalcAns()`
  ersetzt die Pending-Zahl durch `DozenalCalcState.ansForBridge`
  (= `lastResultF64`, nur bei lebendem fehlerfreiem Resultat non-null) in
  Weltbasis; negative Werte armieren den −-Operator (Vorzeichen leben im
  Umrechner auf den Term-Lücken, nie in den Ziffern). Ausgegraut über
  `calcAnsAvailable`.
- **Hauptrechner-CONV** (`ConvAns`-Token, füllt den freien Set-10-Slot):
  fügt `ConverterState.ansForBridge` (die Zahl der Ergebnis-Zeile in der
  `=`-gezykelten Einheit; in der Breakdown-Ansicht der Gesamtwert in der
  Arbeits-Einheit) als Ziffern-Tokens via `formatF64Result` ein — das
  display-only `Negate` wird beim Einfügen zu unärem `Sub`, damit das
  Literal auf beiden Auswertungs-Schienen exakt bleibt. Im Fehlerzustand
  blockiert (`_isErrorBlocked` wie Ans/Rcl), nach `=` startet es einen
  frischen Ausdruck; ausgegraut, wenn drüben nichts liegt
  (`_isTokenDisabled` liest `convAnsValue`).
Damit der Brücken-Flow „Ans → Kategorie → Magnitude" funktioniert,
**überlebt die Pending-Zahl in `tapCategory` den Kategorienwechsel**
(sie ist einheitenlos; nur committete Terme werden verworfen).

**Physische Tastatur im Pager:** `_handleKey` routet nach aktiver Seite —
auf Seite 1 mappt `_handleConverterKey` Ziffern/Punkt/+/−/=/Del/AC/Pfeile
auf die Converter-Handler (Pfeile via `moveCaretLeft/Right`, zerstörungsfrei
an den Rändern); alles andere wird geschluckt, damit kein Tastendruck
unsichtbar den verdeckten Hauptrechner editiert.

**Basis ⊗ System (entkoppelt seit dem Farb-Umbau):** Die frühere Kopplung
„Doz = imperial in Basis 12 / Dez = metrisch in Basis 10" ist aufgelöst —
zwei unabhängige Achsen, alle **vier** Kombinationen gültig:
- **Einheitensystem** (imperial ↔ metrisch): converter-lokal, über die zwei
  **runden System-Tasten in der Equals-Reihe** — `met` (links, grün) / `imp`
  (rechts, violett); Kreisform + `pagerFill` wie die (i)/(?)-Rundtasten des
  Hauptrechners, die aktive trägt einen 2-dp-Eigenfarb-Ring. Sie
  ersetzen die früheren Rundtasten ((i)/Taschenrechner-Icon: Info läuft über
  die Hauptrechner-Seite, zurück per Rechts-Swipe) und die Doz/Dez-Tasten
  des Umrechner-Overlays (Slots leer, Drg/Close behalten ihre Plätze).
  `setWorld` kollabiert Terme werterhaltend zur Partner-Einheit.
- **Zahlbasis** (12 ↔ 10): global — die Settings-Zeile „Zahlensystem" wirkt
  auf BEIDE Rechner. Der Scaffold spiegelt `DozenalCalcState.activeBase` per
  Listener in `ConverterState.setBase` (werterhaltend: Pending-Ziffern
  werden umformatiert, Terme speichern Doubles). A/B-Tasten-Gating folgt
  der Basis, Breakdown-Verfügbarkeit dem System (imperial).
Intern läuft alles über eine **SI-Drehscheibe**; die `{ }`-Klammer zeigt das
Gegen-System (Zeit-Kategorie: die Gegen-Basis).

**Farbsystem „eine Farbe pro Welt, ein Träger pro Achse"** (Palette-Slots
`worldTen`/`worldTwelve` in `app_theme.dart`): **Grün = Zehner-Welt**
(metrische Einheiten UND Basis 10), **Violett = Zwölfer-Welt** (imperiale
Einheiten UND Basis 12) — bewusst NICHT das Op-Blau, das den
Funktions-Glyphen gehört. Träger trennen die Achsen: **Einheitensymbole**
tragen die System-Farbe (Eingabe-, Ergebnis- und Breakdown-Zeile, via
`unitRanges`-Char-Ranges in `ConverterLine`/`_InputLayout` — derselbe
Monospace-String, nur Span-Farben, Caret/Tap-Geometrie unverändert);
das **DOZ/DEZ-Badge** trägt die Basis-Farbe (beide Displays); **Ziffern und
Operatoren bleiben neutral weiß**; die **`{ }`-Klammer leuchtet gedimmt
(α 0.85) in der Farbe der Welt, die sie zeigt** (`bracketTenWorld` in
`ConverterLine`; Hauptrechner: Gegen-Basis-Farbe für `{…}`). Das pauschale
Ergebniszeilen-Grün des Umrechners ist gewichen (Wert weiß, `=` neutral) —
Grün-auf-Inhalt heißt jetzt eindeutig Zehner-Welt, Grün-auf-Aktions-Glyph
(=-Taste) bleibt „auswerten". `formatBaseNum` snappt seit diesem Umbau
Near-Integer-f64-Rauschen (SI-Roundtrip `14 ft` → 13.999…) wie
`formatF64Result`, sonst rendert `12 ft` als `11.BBBBBB`.

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
  (+ frei werdende Slots). Der Keypad ist **voll verdrahtet** bis auf Drg
  (inert — keine Winkelfunktionen im Umrechner):
  - **Skalar-Operatoren × ÷ ⊕ ^ √ ㏒** (Set 1 + Set 2, **immer aktiv** —
    Grau liest sich als „nicht verdrahtet"; auf komplett leerer Eingabe
    sind sie ein stiller No-op): erweitern die Pending-Eingabe zu einem
    links-nach-rechts-Ausdruck (`3×2`, KEIN Vorrang — laufende Eingabe),
    ausgewertet beim Magnituden-Commit via `parseScalarEntry` in
    `base_num.dart`. Binär-Konventionen wie im Hauptrechner: linker
    Operand = Wurzelgrad/Log-Basis (`2√9`=3, `2㏒8`=3), ⊕ = a·b/(a+b).
    Ein Zeichen pro Tastendruck (㏒ = U+33D2), damit Caret/Del
    zeichenweise stimmen. Auf einem committeten Compound kollabiert der
    erste Operator-Druck das Ganze in editierbare Ziffern (Gesamtwert in
    der Arbeits-Einheit — gleiches Idiom wie der Welt-Wechsel), sodass
    `3 ft × 2` und `3 × 2 ft` beide funktionieren. Dezimal-Guard pro
    Segment; `setBase` reformatiert segmentweise (`reformatScalarEntry`).
  - **Wert-Tasten** (Set 7 Konstanten π/e/φ/√2, RCL, **Ans** =
    Resultat-Brücke): **ersetzen das Skalar-Segment am Caret** durch ihre
    Ziffern (`insertValueEntry`; leeres Segment = einfaches Einfügen, nie
    Splicing in halbgetippte Zahlen). Dadurch praktisch immer aktiv —
    Konstanten bedingungslos, Ans sobald drüben ein Resultat liegt, RCL
    sobald das Register gefüllt ist. Negative Werte nur, wenn die
    Ersetzung die GANZE Eingabe abdeckt (Vorzeichen lebt auf der
    Term-Lücke, durch ^/√/㏒ nicht faktorisierbar; sonst No-op).
  - **Speicher** (Set 6): STO speichert den Ergebniszeilen-Wert
    (`ansForBridge`) — ohne committete Terme den Wert der **getippten
    Eingabe** („speichere, was ich getippt habe"); MC löscht. Register ist
    in-memory, überlebt AC und Kategorienwechsel (wie der
    Hauptrechner-Speicher). Feedback über die dynamischen Aktiv-Zustände
    (RCL/MC grau = Register leer) statt eines M-Badges.
- `lib/converter_display.dart` — zweizeilig, Ausdruck + `{ }`-Klammer, plus
  custom-paint **Caret** (rote Linie) mit Tap-Hit-Testing auf der Eingabezeile.
  Ziffern folgen dem **geteilten** „Ziffern im Display"-Pref
  (`GlyphStyleScope.styleOf`, dieselbe Quelle wie das Hauptdisplay): custom =
  Dozenal-Glyphen, gezeichnet als Overlay über unsichtbar gesetzte
  Ziffernzellen (die Monospace-`TextPainter`-Geometrie bleibt erhalten, damit
  Caret + Tap exakt bleiben), conventional = ASCII (`A`/`B` für 10/11).
  Einheiten-Symbole, Operatoren, Punkt und `{ }`-Klammer bleiben immer Text.
- Kategorie-Labels lokalisiert (`unitCat*`, 14 Sprachen); Einheiten-Symbole
  (`ft`, `kg`, …) bleiben international.

**Glyphen-Stil geteilt, Basis auch:** Display (`styleOf`) und Keypad
(`keypadStyleOf`) des Umrechners teilen die beiden Settings-Glyphen-Prefs mit
dem Hauptrechner, und seit der Basis/System-Entkopplung gilt auch die
Settings-**Zahlensystem**-Zeile für beide Rechner (Sync siehe oben). Nur das
**Einheitensystem** bleibt converter-lokal (met/imp-Tasten).

Die alte statische `conversions_page.dart` bleibt vorerst parallel bestehen
(soll später zu einem Theorie-Block werden).

**Tipp-Cursor (beide Rechner):** Tippen auf die Eingabezeile positioniert den
Bearbeitungs-Cursor (die rote Linie). Hauptrechner: `TwoLineDisplay`
(`inputCursorPosForTap` + `GestureDetector`) → `DozenalCalcState.moveCursorTo`.
Umrechner: `converter_display` Caret-Hit-Test → `ConverterState.handleInputTapAtChar`.

### Intro

Onboarding-PageView beim ersten Start, gesperrt über einen
`SharedPreferences`-Schlüssel der Form `intro_seen_v<N>` (aktuell `v3`,
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
  Portierungen aus `src/input.rs::handle_keyboard`. Auf Pager-Seite 0
  mündet alles in `_state.handleClick(token)` — derselbe Pfad wie ein
  Tastendruck; auf Seite 1 (Umrechner) übersetzt `_handleConverterKey`
  in die `ConverterState`-Handler (siehe Einheitenrechner-Abschnitt).
- **Intro-Gate:** `_maybeShowIntro` liest `_kIntroSeenFlag` (aktuell
  `intro_seen_v3`) aus `SharedPreferences` und pusht beim ersten Start
  `IntroPage`; danach wird das Flag gesetzt.
- **Info-Routing:** `_onStateChanged` lauscht auf `state.infoState`,
  resettet es auf `InfoClosed` und pusht `InfoListPage`. Nach
  Navigator-Pop wird der Keyboard-Focus wieder angefordert.
- **State-Ownership:** `DozenalCalcState` und `CalcPrefsNotifier`
  gehören `_DozenalCalcAppState` (oberhalb des Navigators), gereicht
  über `CalcStateScope` + `CalcPrefsScope` sowie per Konstruktor an
  `_CalcScaffold` — der Scaffold lauscht nur, erzeugt/disposed den
  State nicht. Startup: `_calcPrefs.load()` → `_applyStartupPrefs`
  (einmalig Prefs → State); danach spiegelt `_syncPrefsFromState`
  laufend State → Prefs. Details siehe Einstellungen-Abschnitt.
- **Layout-Wurzel:** `_CalcScaffold` ist seit dem Pager-Umbau ein
  horizontaler **PageView** (forciert LTR, auch in RTL-Locales): Seite 0
  rendert `TwoLineDisplay` über `Keypad` (inkl.
  `keypadMode`/`keypadProfile` aus `CalcPrefsScope`), Seite 1 den
  `ConverterBody`. `displayHeightFor(bodyH)` aus `app_layout.dart`
  bleibt die einzige Größenrechnung (pro Seite). `_CalcScaffoldState`
  besitzt `ConverterState` + `PageController`, verdrahtet die
  Resultat-Brücken-Provider in beide Richtungen und lauscht zusätzlich
  auf `state.converterRequested` (Info-Listen-Eintrag → `_goToPage(1)`).
  Splash-Feedback ist global via `NoSplash.splashFactory` aus, weil die
  Tasten ihre eigene Press-Color-Animation haben.

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
  Flutter-Version synchron gehalten werden (aktuell `1.4.0`/`17`).

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
- **Deutsche Rechtschreibung (HART): durchgängig „ß" (Hochdeutsch), niemals
  das Schweizer „ss".** Gilt für die **gesamte App** und sämtliche
  deutschsprachigen Inhalte (ARB, Theorie, Handbuch, Empfehlungen,
  `legal/*.de.md`, Store-Listings). Eine etwaige gegenteilige „ss"-Vorgabe in
  `docs/`-Recherchedokumenten gilt **nicht** für App-Texte — bei Konflikt
  gewinnt diese Konvention.
- Beim Portieren aus Rust die Rust-Funktions-/Struct-Namen in Kommentaren
  beibehalten — sie sind der Lookup-Schlüssel für Verhaltens-Querverweise.
- **Lints:** `analysis_options.yaml` aktiviert nur das
  `package:flutter_lints/flutter.yaml`-Standardset, keine projekt-spezifischen
  Zusatzregeln. `flutter analyze` muss aber sauber bleiben — CI fängt
  Verstöße.

## Umgebungs-Hinweise

- Der Tablet-Emulator (AVD) ist instabil bei wiederholten
  `flutter install`-Zyklen auf dieser Maschine. Lieber ein physisches
  Gerät verwenden oder den Emulator zwischen Installs neu starten.
