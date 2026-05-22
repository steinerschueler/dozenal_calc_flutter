package app.weltanschauung.dozenal;

import android.os.Bundle;
import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

// SDK-35-officially-blessed edge-to-edge declaration. EdgeToEdge.enable() uses
// WindowInsetsControllerCompat under the hood (non-deprecated) and backports
// transparent system bars to older Android versions, replacing the prior
// Dart-side approach (Colors.transparent on statusBar/systemNavigationBar in
// SystemUiOverlayStyle) which Flutter internally translated to
// Window.setStatusBarColor()/setNavigationBarColor() — both deprecated in
// API 35 and flagged by Play Console's pre-launch scan.
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
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
