# Edge-to-edge: Warum kein SystemChrome, welche Warnungen bleiben

Hintergrund-Referenz zum Edge-to-edge-Abschnitt in CLAUDE.md. Ausgelagert,
weil nur beim Debuggen von Play-Console-„randlose Anzeige"/„nicht mehr
unterstützte APIs"-Warnungen oder bei einem Flutter-Stable-Upgrade relevant.
Die handlungsleitenden Regeln stehen in CLAUDE.md; hier liegt das *Warum*.

## Warum keine `SystemChrome.*`-Calls in `main.dart`

Build 9 behielt `setEnabledSystemUIMode(edgeToEdge)` + ein „nur Brightness"-
`setSystemUIOverlayStyle`. Beide laufen über Flutters `PlatformPlugin`, dessen
kompilierte Methoden — egal welche Felder zur Laufzeit gesetzt sind — statisch
auf die deprecated `Window.setStatusBarColor / setNavigationBarColor /
setNavigationBarDividerColor` verweisen. Play Console scannt das DEX statisch,
sieht diese Referenzen und flaggt sie. Solange Dart-Code in die
Platform-Channel-Methode reinruft, hält R8 sie lebendig und kann die
deprecated Referenzen nicht wegoptimieren. Build 10 entfernt alle Dart-seitigen
Calls.

## Was Build 10 NICHT beseitigt (Upstream-Rest)

Die Play-Console-Warnungen »randlose Anzeige funktioniert möglicherweise
nicht« und »nicht mehr unterstützte APIs« bleiben nach Build 10 sichtbar. Die
geflaggten Stellen verweisen auf zwei Quellen außerhalb unseres Codes:

1. **`io.flutter.plugin.platform.e.a`** — obfuscated
   `PlatformPlugin.setSystemChromeSystemUIOverlayStyle`. Die Flutter-Engine
   registriert den Platform-Channel `SystemChrome.setSystemUIOverlayStyle`
   beim Start unabhängig davon, ob Dart-Code ihn ansteuert. R8 kann die Methode
   daher nicht strippen, und die statischen Referenzen auf
   `Window.setStatusBarColor / setNavigationBarColor / setNavigationBarDividerColor`
   bleiben im DEX. Tracking: `flutter/flutter#165327` plus Duplikate `#183372`,
   `#183349`, `#175261`, `#175262`, `#169810` — alle als „r: fixed" markiert,
   aber nur im Sinne eines Doku-Updates; der `PlatformPlugin`-Code ist Stand
   Flutter 3.41.8 unverändert.
2. **`B.b.q`, `b.o.J`, `b.p.J`, `b.r.J`** — die `EdgeToEdgeApi*Impl`-Backport-
   Klassen aus `androidx.activity:activity`. `EdgeToEdge.enable()` delegiert
   intern auf versions-spezifische Impls; die Pre-Android-15-Pfade rufen
   `setStatusBarColor` / `setNavigationBarColor` für Backward-Compat auf. Das
   ist genau der API-Pfad, den Google im Warntext selbst empfiehlt —
   Play-Console-DEX-Scanning unterscheidet aber nicht zwischen „wird auf
   Android 15 ausgeführt" und „Referenz im Bytecode vorhanden". Identisches
   Muster ist für Material Components (`material-components-android#4732`),
   .NET MAUI (`dotnet/maui#26788`), React Native
   (`software-mansion/react-native-screens#2632`) und Corona dokumentiert.

Google stellt im Warntext selbst klar, dass diese Hinweise die Endnutzer-
Erfahrung NICHT beeinträchtigen; sie bleiben so lange im Console-Dashboard,
bis Upstream-Libraries die Backport-Pfade entfernen. Build 10 ist damit das
technisch saubere Maximum, das app-seitig erreichbar ist — die übrig
bleibenden Warnungen sind als bekannte Upstream-Issues zu behandeln, nicht als
TODO im Repo.

**Aggressive R8-Strip-Regeln** gegen
`PlatformPlugin.setSystemChromeSystemUIOverlayStyle` wurden bewusst NICHT
eingebaut: der Engine-Startup-Pfad könnte die Methode reflektiv ansteuern,
OEM-spezifische Laufzeit-Crashes sind in verwandten Issues dokumentiert. Bei
jedem neuen Flutter-Stable-Release prüfen, ob `PlatformPlugin` die deprecated
Referenzen entfernt hat — dann diesen Block aktualisieren.
