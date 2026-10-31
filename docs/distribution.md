# Distribution

Aus dem früheren Gesamtdokument übernommen. Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

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
  Zoom): [`docs/watch.md`](watch.md).

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
  Flutter-Version synchron gehalten werden (aktuell `1.5.1`/`19`).

  Das eigenständige **xcodegen**-Projekt (`watch/project.yml`, daraus
  `watch/DozenalWatch.xcodeproj` + `watch/build/`, beide gitignored) bleibt
  parallel für schnelles Simulator-Testen bestehen — es nutzt `WKWatchOnly`
  statt Companion. Bei Glyphen-/Logik-Änderungen genügt das Editieren der
  geteilten `watch/Sources/`-Dateien; beide Projekte ziehen sie automatisch.

## Plattform-Distribution & Packaging (Linux/Flathub, Windows, F-Droid)

Neben **Google Play** (Android, live) und **App Store** (iOS/iPadOS/macOS, live —
auf dem Mac per Xcode gebaut/eingereicht, nicht von hier) laufen drei weitere
Schienen. Play-/App-Store-Workflows siehe „### Release-Builds" +
`docs/release-workflow.md`; diese drei sind eigenständig und jeweils nur hier
dokumentiert:

## Linux / Flathub

`flutter build linux --release` → portables `build/linux/x64/release/bundle/`
(Binary `dozenal_calc_flutter` + `lib/` + `data/`). Fenstertitel „Dozenal Calc",
`APPLICATION_ID app.weltanschauung.dozenal` (`linux/CMakeLists.txt` +
`linux/runner/my_application.cc`). Paketierung in **`packaging/flatpak/`** (eigene
`README.md`): flatpak-builder-Manifest, AppStream-Metainfo, `.desktop`,
hicolor-Icons. **Strategie: vorgebautes Bundle** — Flathubs Builder haben kein
Netz, ein Flutter-Source-Build zöge zur Bauzeit Engine/pub-Pakete; daher wird das
`bundle` als `.tar.gz` ein **GitHub-Release-Asset** (am `v<ver>`-Tag) und das
Manifest referenziert es per `url`+`sha256` (**`strip-components: 0`**!). Runtime
`org.freedesktop.Platform 25.08`, finish-args bewusst **ohne** `--share=network`.
Einreichung: PR gegen `flathub/flathub` (Base `new-pr`), Build per PR-Kommentar
**`bot, build`**. Stand: PR **flathub/flathub#8968** baute grün (aarch64+x86_64),
liegt im Review.

## Windows / Microsoft Store

Flutter-Desktop-Target in **`windows/`** (`flutter create --platforms=windows
--org app.weltanschauung .`, braucht VS 2022 + „Desktop development with C++").
`flutter build windows --release` → `build\windows\x64\runner\Release\…exe`.
Store-Paket als **MSIX** über die dev-dependency `msix` (`msix_config` in
`pubspec.yaml`, `store: true` = unsigniert, der Store signiert beim Ingest):
`dart run msix:create --store`; **pro Einreichung `msix_version` erhöhen**
(4-teilig, Revision = 0). Listings in **`store/microsoft-store/`** (eine
`listing.<locale>.md` je Sprache, **15 Sprachspalten** inkl. neu übersetztem
cy/ga; Texte aus den Play-Listings ohne HTML; **Titel global „Dozenal Calc"**,
kein Per-Sprache-Titel). Der **vollständige, erprobte Ablauf inkl. aller
Stolpersteine** (Bilder per **URL-Propagation** statt Pfad-Import; **jede Sprache
nach CSV-Import öffnen + Save**, sonst „Incomplete"; `runFullTrust`-Begründung bei
jeder Submission) steht in **`store/microsoft-store/WORKFLOW.md`** — der
massgebliche Leitfaden. Identität: Store ID `9N4M1XLPLP0N`, Package
`steinerschler.DozenalCalc`, Publisher „steinerschüler".

## F-Droid (Paketierung vorbereitet, Einreichung offen)

Paketierung in **`packaging/fdroid/`** (eigene `README.md`): F-Droid baut **aus dem
Quellcode** auf eigenen Servern — also ein Bau-Rezept, kein Artefakt. Metadata
`app.weltanschauung.dozenal.yml`: MIT, Science & Education, baut den **`v1.5.1`-Tag**
als **universelles APK** (`flutter build apk --release`), Flutter auf **3.41.8**
gepinnt (passend zum Tag `v1.5.1`, mit dem nächsten Tag anheben) via `flutter`-srclib; F-Droid **signiert
selbst** (fehlende `key.properties` daher unkritisch). Sauberer Kandidat: keine
proprietären Deps, keine Anti-Features (kein Google/Firebase/Tracking/Netz). **Noch
offen:** Rezept lokal mit `fdroid build` testen, dann MR gegen
`gitlab.com/fdroid/fdroiddata` (F-Droid nutzt **GitLab**, nicht GitHub → eigenes
Konto nötig). Schritte in `packaging/fdroid/README.md`.
