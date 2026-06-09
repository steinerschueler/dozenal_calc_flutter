# Dozenal Calc für Apple Watch (watchOS)

Eigenständige native **SwiftUI-App** unter `watch/`. Kein Flutter — Flutter
hat keinen watchOS-Embedder, und der Dart-Code läuft auf der Uhr nicht. Bewusst
minimal: ein schneller Dozenal-Grundrechner fürs Handgelenk, ohne Theorie,
Intro oder Overlays.

## Aufbau

```
watch/
  project.yml                 # xcodegen-Projektdefinition
  Sources/
    App.swift                 # @main, ContentView, Display, die drei Seiten
    Glyph.swift               # DozenalDigit + GlyphShape (12 Glyphen als Shape)
    Calculator.swift          # Basis-12-Eingabe, Auswerter, Formatierung
    Info.plist                # von xcodegen erzeugt (WKApplication, WKWatchOnly)
```

**Layout:** festes zweizeiliges Display oben, **links-bündig** (die System-
Uhrzeit sitzt oben rechts; links-bündig hält die Eingabe frei davon und von der
runden Ecke). Darunter ein `TabView` im `.page`-Stil mit drei horizontal
gewischten Seiten:
- **links** (`tag 0`): Lizenz (MIT) + kurzer Datenschutz-Text.
- **mitte** (`tag 1`, Start): Glyphenblock, 3×4 = die zwölf Ziffern.
- **rechts** (`tag 2`): Funktionsblock, 12 Tasten in drei Sets à vier
  (`+ − × ÷` · `xʸ √ log .` · `( ) ⌫ AC`) plus Gleichtaste über die volle Breite.

**Glyphen:** `GlyphShape` portiert `paintDozenalDigitAt` aus
`lib/glyph_painter.dart` 1:1 (Pfeile + Halb-/Vollkreise, parametrisch gezeichnet,
q = min(w,h)/4). Bei Änderungen an den Glyphen beide Stellen synchron halten.

**Rechenlogik:** Gleitkomma (nicht der exakte Rational-Track der Hauptapp —
auf der Uhr bewusst weggelassen). Rekursiver Abstieg: `expression → term →
power → unary → primary`. Operatoren `+ − × ÷`, Potenz `^` (rechtsassoziativ),
Wurzel `√` **binär** (`a√b` = a-te Wurzel von b = `pow(b, 1/a)`) **und** als
Präfix (`√b` = Quadratwurzel), `log` (Basis 10) als Präfix, Klammern, unäres
Minus. Eingabe in Basis 12 (`A`/`B` für zehn/elf), Ausgabe wieder in Basis 12.

## Bauen & testen (Simulator)

Voraussetzungen: Xcode, **xcodegen** (`brew install xcodegen`) und die
**watchOS-Simulator-Runtime** (separater Download, ~4 GB):

```bash
xcodebuild -downloadPlatform watchOS        # nur einmalig, falls Runtime fehlt
```

Projekt erzeugen und auf einem Watch-Simulator bauen/laufen:

```bash
cd watch
xcodegen generate                            # → DozenalWatch.xcodeproj

# Simulator anlegen (einmalig) + booten
UDID=$(xcrun simctl create DozenalWatch \
  com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-10-46mm \
  com.apple.CoreSimulator.SimRuntime.watchOS-26-5)
xcrun simctl boot "$UDID"; open -a Simulator

# bauen, installieren, starten
xcodebuild -project DozenalWatch.xcodeproj -scheme DozenalWatch -configuration Debug \
  -destination "platform=watchOS Simulator,id=$UDID" -derivedDataPath build \
  build CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO
APP=$(find build -name DozenalWatch.app -path '*Debug-watchsimulator*' | head -1)
xcrun simctl install "$UDID" "$APP"
xcrun simctl launch  "$UDID" app.weltanschauung.dozenal.watch
xcrun simctl io      "$UDID" screenshot /tmp/watch.png
```

Reiner Typecheck ohne Runtime (z. B. zum schnellen Verifizieren):

```bash
xcrun --sdk watchsimulator swiftc -typecheck \
  -target arm64-apple-watchos10.0-simulator \
  -sdk "$(xcrun --sdk watchsimulator --show-sdk-path)" watch/Sources/*.swift
```

`watch/build/` und `watch/DozenalWatch.xcodeproj` sind Build-Outputs und per
`.gitignore` ausgeschlossen — versioniert sind nur `watch/Sources/` und
`watch/project.yml`. Nach Änderungen an `project.yml` erneut `xcodegen generate`.

## Bekanntes Problem: `.page`-TabView-Erstrender-Zoom

Beim allerersten Layout dimensioniert die watchOS-`.page`-`TabView` ihre
Startseite falsch (zu groß): direkt nach dem Start ist die unterste Glyphen-
Reihe abgeschnitten, die Ecktasten berühren die Uhr-Rundung. **Einmal hin- und
zurückwischen korrigiert es** (neuer Layout-Pass mit dann bekannter Geometrie).
Kein offizieller Apple-Fix; die Community behandelt es als Timing-Problem (die
`selection` wird erst nach dem ersten `onAppear` gesetzt).

Aktuelle Milderung: die `TabView` wird einen Runloop nach `onAppear` per
`.id`-Wechsel neu aufgebaut — beseitigt es meist, aber nicht garantiert.
**Deterministisch zoomfrei** wäre, die Tasten mit fester, leicht konservativer
Zellgröße aus einem äußeren `GeometryReader` zu setzen (nie größer als die
Seite, daher nie abgeschnitten); aktuell bewusst zurückgestellt zugunsten der
voll ausfüllenden Variante. Referenzen:
- https://developer.apple.com/forums/thread/711572
- https://www.hackingwithswift.com/forums/swiftui/tabview-with-tabviewstyle-page-not-behaving-as-expected-when-app-loads/18636

## Auslieferung: eingebettet in die iOS-App (ab Build 16)

Die Watch-App wird **in die Flutter-iOS-App eingebettet** und in einem IPA
ausgeliefert (ein App-Store-Eintrag, ein Review). Das `DozenalWatch`-Target
lebt in `ios/Runner.xcodeproj`, verdrahtet per `tool/embed_watch_target.rb`:

```bash
/opt/homebrew/opt/ruby/bin/ruby tool/embed_watch_target.rb   # idempotent
```

Das Skript (nutzt das `xcodeproj`-Gem — bei Bedarf
`/opt/homebrew/opt/ruby/bin/gem install xcodeproj`) legt das watchOS-
Application-Target an, referenziert dieselben `watch/Sources/*.swift` (single
source of truth, geteilt mit dem xcodegen-Projekt), hängt es als Dependency an
`Runner` und ergänzt eine `Embed Watch Content`-Copy-Phase
(`$(CONTENTS_FOLDER_PATH)/Watch`, dst-spec 16). Es ist idempotent: ist das
Target schon da, passiert nichts. Re-run nach einem `flutter create`/Projekt-
Reset.

Eigene Dateien des eingebetteten Targets (nicht die des Standalone-Projekts):
- `ios/watch/Info.plist` — Companion-Variante: `WKApplication` +
  `WKCompanionAppBundleIdentifier = app.weltanschauung.dozenal`, **kein**
  `WKWatchOnly`. Version über `$(MARKETING_VERSION)`/`$(CURRENT_PROJECT_VERSION)`.
- `ios/watch/Assets.xcassets` — Watch-App-Icon, ein alpha-freies 1024er
  (kopiert aus `ios/Runner/.../Icon-App-1024x1024@1x.png`; App Store lehnt
  Alpha bei App-Icons ab).

Bundle-ID `app.weltanschauung.dozenal.watch` (Präfix der iOS-ID — Pflicht).
`MARKETING_VERSION`/`CURRENT_PROJECT_VERSION` im Target **synchron zur
Flutter-Version halten** (aktuell `1.3.0`/`16`; sie sind im pbxproj
hartcodiert, nicht aus `pubspec.yaml` abgeleitet).

Signing/Provisioning: der vorhandene Apple-Distribution-Cert deckt watchOS ab;
beim geräte-losen Export erzeugt `-allowProvisioningUpdates` das Profil für die
Watch-Bundle-ID automatisch mit. Schnell-Verifikation der Kompilierung ohne
Signing:

```bash
xcodebuild -project ios/Runner.xcodeproj -target DozenalWatch \
  -sdk watchsimulator -configuration Release \
  CONFIGURATION_BUILD_DIR=/tmp/w-out OBJROOT=/tmp/w-obj SYMROOT=/tmp/w-sym \
  CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO build
```

Noch zu tun in App Store Connect: Watch-App-Icon (1024, im Asset-Katalog ✓),
**Watch-Screenshots** (eigener Slot), und die Watch-App taucht nach dem Upload
automatisch unter der iOS-App auf (keine separate Plattform).
