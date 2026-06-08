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

## Vor einem Release

Noch zu tun, falls die Watch-App veröffentlicht wird: als Watch-Target in die
iOS-App einbetten (oder als unabhängige Watch-App signieren), Watch-App-Icon,
Watch-Screenshots, und Signing/Provisioning (der vorhandene Apple-Distribution-
Cert deckt watchOS mit ab).
