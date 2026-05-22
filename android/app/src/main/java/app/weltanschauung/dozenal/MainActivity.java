package app.weltanschauung.dozenal;

import android.os.Bundle;
import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

// SDK-35-officially-blessed edge-to-edge declaration. EdgeToEdge.enable() uses
// WindowInsetsControllerCompat under the hood (non-deprecated) and backports
// transparent system bars to older Android versions. We also drive the icon
// brightness here via WindowInsetsControllerCompat — NOT via Dart's
// SystemChrome.setSystemUIOverlayStyle, because that routes through Flutter's
// PlatformPlugin, whose compiled bytecode still statically references the
// deprecated Window.setStatusBarColor / setNavigationBarColor /
// setNavigationBarDividerColor APIs. Play Console's pre-launch scan reads
// those references out of the DEX even when the runtime path isn't taken,
// which is what kept flagging Build 9 despite the EdgeToEdge.enable() call.
// Going fully native here lets R8 dead-code-eliminate those Flutter paths.
//
// Why FlutterFragmentActivity (not the more common FlutterActivity)?
// FlutterActivity inherits from the legacy android.app.Activity and is NOT a
// ComponentActivity, so EdgeToEdge.enable() (which requires
// androidx.activity.ComponentActivity) refuses it at compile time.
// FlutterFragmentActivity inherits via androidx.fragment.app.FragmentActivity
// from ComponentActivity and is the modern-AndroidX-compatible base.
//
// Why Java instead of Kotlin?
// activity:1.9.3 ships EdgeToEdge as a Kotlin-compiled class with a
// kotlin_module marker; Flutter's Kotlin compiler refuses to resolve it across
// that module boundary even though the .class is physically on the classpath.
// Java's interop ignores kotlin_module metadata and sees EdgeToEdge as a
// plain public class.
//
// Why the explicit configureFlutterEngine override?
// Unlike FlutterActivity, FlutterFragmentActivity's configureFlutterEngine()
// is an empty hook — plugins are NOT auto-registered. Without this manual
// call, shared_preferences (intro_seen_v2 gate), url_launcher (feedback
// mailto), and package_info_plus (version info) all silently fail to bind.
public class MainActivity extends FlutterFragmentActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        EdgeToEdge.enable(this);
        super.onCreate(savedInstanceState);
        // Light icons on the dark app background. setAppearanceLight*Bars(false)
        // means "icons are light" (i.e. the bar background is dark). This is the
        // non-deprecated replacement for SystemUiOverlayStyle's brightness flags.
        WindowInsetsControllerCompat controller =
                WindowCompat.getInsetsController(getWindow(), getWindow().getDecorView());
        controller.setAppearanceLightStatusBars(false);
        controller.setAppearanceLightNavigationBars(false);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
