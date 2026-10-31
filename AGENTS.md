# Dozenal Calc

Flutter-Port eines Rust- und egui-Wissenschaftsrechners, der in Basis 12 rechnet. Der Rust-Prototyp bleibt die
Entwicklungs-Sandbox unter <https://github.com/Bawdyness/dozenal_calc>. Paket- und GitHub-Name ändert nur A-067.

## Prüfen

- Vor «erledigt»: `flutter analyze` und `flutter test`, Ergebnis nennen. Die CI führt dieselben Schritte aus.
- `pre-commit run --all-files` deckt heute nur gitleaks ab und ersetzt die beiden Befehle nicht.
- Einzeln: `flutter test test/rational_test.dart`, `flutter test --plain-name "parses 1/7"`.
- Welche Testdatei zu welchem Bereich gehört: [docs/entwicklung.md](docs/entwicklung.md).

## Zuerst lesen

| Aufgabe | Datei |
|---|---|
| Rechenkern, State, Tokens, Start der App, Daten, Netzziele | [docs/architektur.md](docs/architektur.md) |
| Display, Glyphen, Keypad, Langdruck | [docs/rendering.md](docs/rendering.md) |
| Info-Liste, Theorie, Handbuch, Empfehlungen | [docs/info-modal.md](docs/info-modal.md) |
| Einstellungen, Theming | [docs/einstellungen-und-theming.md](docs/einstellungen-und-theming.md) |
| Umrechner, Werterechner, Resultat-Brücke, Farbcode | [docs/rechner-seiten.md](docs/rechner-seiten.md) |
| Intro, Sprachen, RTL | [docs/mehrsprachigkeit.md](docs/mehrsprachigkeit.md) |
| Edge-to-edge, `MainActivity`, ABI-Filter | [docs/android-nativ.md](docs/android-nativ.md) |
| Release, Assets, Store-Screenshots | [docs/build-und-assets.md](docs/build-und-assets.md) |
| macOS, watchOS, Flathub, Microsoft Store, F-Droid | [docs/distribution.md](docs/distribution.md) |
| Lizenz, Lints, Portierung, Umgebung (Volltext) | [docs/konventionen.md](docs/konventionen.md) |
| Prosa in `lib/theory/<lang>/math_<lang>.dart` | [docs/chapter2-conventions.md](docs/chapter2-conventions.md), vor jedem Edit |

## Git

- `bidozenal-foundation` gehört allein der Basis-24-App und nimmt nie Dozenal-Calc-Code auf, und umgekehrt. Vor jedem
  Commit `git branch --show-current` prüfen.
- Dozenal-Calc-Arbeit läuft auf `master`, Riskantes über einen kurzlebigen Branch (GIT-22).
- `docs/local/` bleibt gitignoriert: Gerätedaten und Persönliches kommen nie in versionierte Dateien.

## Flutter-Version

- CI, Lockfile und F-Droid-Rezept nutzen dieselbe Flutter-Version (heute 3.47.9). Das SDK pinnt transitive Pakete,
  deshalb schreibt `flutter pub get` mit einer anderen Version `pubspec.lock` um.
- Die CI läuft mit `--enforce-lockfile` und schlägt bei Abweichung fehl. Beim Wechsel der Version zusammen ändern:
  `.github/workflows/ci.yml`, `pubspec.lock` und `packaging/fdroid/`.
- Dass `flutter pub outdated` die vom SDK gepinnten Pakete meldet, ist erwartet und kein Fehler.

## Sprache

- Projekt-Markdown ist Schweizer Rechtschreibung (DOK-62). Alle App-Texte bleiben Hochdeutsch mit Eszett: ARB, Theorie,
  Handbuch, Empfehlungen, `legal/*.de.md`, Store-Listings. Begründung:
  [ADR 0001](docs/decisions/0001-eszett-in-app-texten.md). Dort gewinnt das Eszett auch gegen Recherchedokumente.
- Beim Portieren aus Rust bleiben die Rust-Namen in Kommentaren, sie sind der Suchschlüssel. Der Port ist in `logic/`
  und in den Dispatch-Schichten absichtlich 1:1: Bei Logikänderungen das im Kopfkommentar genannte Gegenstück prüfen.
- Neue Sprache oder neuer ARB-Key: alle 14 Sprachen liefern. Kapitel- und Listenstruktur prüfen die Treue-Tests.

## Fallstricke im Kern

- Listen im State nie in-place ändern: `shouldRepaint` vergleicht per `listEquals`.
- `handleClick` ist der einzige Einstieg für Tasten und physische Tastatur.
- `isArmed` und `_inverseSwap` teilen eine Quelle, sonst laufen Anzeige und Umschaltung auseinander.
- Wertlose Brücken-Tasten bleiben komplette No-ops, sonst verbraucht ein Tipp den Zustand nach `=`.
- Der Disabled-Zustand von CONV liest Umrechner und Werterechner: Eine graue Taste hostet kein Langdruck-Popup.
- Postfix bindet stärker als unäres Minus: `−3!` ist `−(3!)`.
- `formatBaseNum` muss Rauschen nahe an ganzen Zahlen wegrunden, sonst wird `12 ft` zu `11.BBBBBB`.
- Exakte Resultate über 20000 Bits fallen auf f64 zurück, weil die Ziffern-Extraktion etwa O(n²) kostet.
- Eine frische Installation rechnet dezimal: `_applyStartupPrefs` spielt den Default Dez ein.

## Fallstricke im UI

- Die Schliess-Barrier der Popups ist ein `Listener` mit translucent-Hit-Test und schluckt nie Eingaben.
- Die Popup-Breite muss den 1-px-Rahmen einrechnen.
- `_kFuncPageEnabled` ist absichtlich `false`, der Code bleibt bestehen. Nicht löschen.
- Die drei Keypads teilen `keypad_parts.dart`, bleiben aber getrennte Widget-Bäume mit eigener Semantik.
- `Keypad`: Der Scroll-Modus gilt nicht im Profil «Einfach».
- Ohne `CalcStateScope` oder `ThemeScope` blendet die Einstellungen-Seite die betroffenen Zeilen aus. Tests pumpen sie so.
- Widget-Tests mit `find.text` müssen den Page-Peek ausklingen lassen (`flushPagePeek`).
- Bei offenem Chart bleibt das Pager-Wischen gesperrt, sonst verliert das Verschieben im Chart die Gesture-Arena.
- Der Umrechner wertet Skalar-Operatoren links nach rechts aus und kennt keinen Operatorvorrang.
- Die Pending-Zahl überlebt den Kategorie- und Klassenwechsel, committete Terme nicht.
- Painter tragen `final AppColors colors`, `shouldRepaint` vergleicht es. Ohne `ThemeScope` gilt `AppColors.dark`.
- Bewusst unabhängig vom Theme: Intro, Flaggen, `legal/*.html`, Polygon-Akzente, roter Caret, `AppRefCard`-Button.
- Grün bedeutet Zehner-Welt, Violett Zwölfer-Welt. Das Op-Blau gehört den Funktions-Glyphen, Gold bleibt sparsam.

## RTL und Sprachen

- Die Rechner-Oberfläche und `_Pre`-Tabellen bleiben auch in `fa` und `ar` LTR.
- Neue UI prüfen auf `_NavChevron`, `EdgeInsetsDirectional.fromSTEB` und `TextAlign.end`.
- Locale über `toLanguageTag()` vergleichen, `zh-Hant` vor `zh` prüfen. Sonst fallen Routen auf vereinfachtes Chinesisch.
- Bei grösseren Intro-Änderungen den Suffix von `_kIntroSeenFlag` erhöhen.
- Neue Scaffold-Seiten wickeln den Body in `SafeArea(top: false, …)`.

## Android und Apple

- In `main.dart` keine `SystemChrome.*`-Aufrufe: Play Console flaggt die statischen Referenzen im DEX. Edge-to-edge und
  Icon-Helligkeit laufen nativ. Keine aggressiven R8-Strip-Regeln gegen die verbleibenden Upstream-Warnungen.
- `MainActivity` bleibt Java und `FlutterFragmentActivity`: `EdgeToEdge` verlangt das, Kotlin löst die Klasse nicht auf.
  Darum ruft sie `GeneratedPluginRegistrant` selbst auf, sonst sind die Plugins stumm.
- ABI-Filter stehen in `buildTypes.release`, zuerst `.clear()`, dann `.addAll()`: Flutter setzt vorher eigene Werte.
- Nie `windowLayoutInDisplayCutoutMode=shortEdges` zurückholen: Play Console flaggt es.
- Bei neuen Versionen `MARKETING_VERSION` und `CURRENT_PROJECT_VERSION` des Watch-Targets synchron halten.
- Das Web-Datenschutz-HTML nutzt für die walisische Flagge Inline-SVG: Die Emoji-Sequenz rendert nicht überall.

## Release

- Play-Appbundle braucht `JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`, Java 21 zerbricht Gradle.
- Ohne `android/key.properties` fällt der Build still auf Debug-Signing zurück. Für die Store-Ausgabe prüfen.
- Nach jedem Release-Build `build<N>-release-notes.txt` schreiben: zwölf Locales, je unter 500 Zeichen
  (massgeblich `_localeMap` in `tool/sync_play_listings.dart`).
- Generierte PNGs und gepatchte Plattform-Ressourcen werden mitcommittet, sie entstehen nicht beim Build.
- Pro Microsoft-Store-Einreichung `msix_version` erhöhen. Nach dem CSV-Import jede Sprache öffnen und speichern.
- Im Flathub-Manifest gilt `strip-components: 0`.

## Grundsätze

- Keine Analytics, keine Plattform-Berechtigungen, keine neuen Netzziele ohne `npf.toml` und Datenschutzerklärung.
- Der Tablet-Emulator ist bei wiederholten Installs instabil: physisches Gerät nutzen oder den Emulator neu starten.
- Der Web-Build lädt von Google-Hosts, siehe «Netzziele» in [docs/architektur.md](docs/architektur.md).
