# Android nativ

## Edge-to-edge (Android 15) und Native-Activity

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
   + `setAppearanceLightNavigationBars(false)` — helle Icons (weiss) auf
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
[`docs/edge-to-edge.md`](edge-to-edge.md).

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

## ABI-Filter (`android/app/build.gradle.kts`)

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
