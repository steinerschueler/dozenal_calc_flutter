import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Loads release-signing credentials from android/key.properties. The file is
// gitignored — keep it out of the repo. When the file is missing (fresh
// checkout without the developer's keystore), the release signingConfig
// stays unconfigured and `flutter build apk --release` falls back to the
// debug signing config below.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasReleaseKeystore = keystorePropertiesFile.exists()
if (hasReleaseKeystore) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "app.weltanschauung.dozenal"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "app.weltanschauung.dozenal"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String?
                keyPassword = keystoreProperties["keyPassword"] as String?
                storeFile = (keystoreProperties["storeFile"] as String?)?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String?
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                // Fresh checkout without key.properties — sign with debug keys
                // so `flutter run --release` still works for local development.
                signingConfigs.getByName("debug")
            }
            // Drop x86_64 from the AAB upload (~12 MB savings). x86_64 Android
            // was for Windows Subsystem for Android (discontinued March 2025)
            // and a tiny Chromebook segment; x86 (32-bit Intel) is effectively
            // extinct on Android. RISC-V (riscv64) will land when Flutter ships
            // engine binaries — add it here when that happens.
            //
            // The .clear() + .addAll() pattern is required because Flutter 3.35+
            // auto-populates ndk.abiFilters with [armeabi-v7a, arm64-v8a, x86_64]
            // BEFORE this build.gradle runs. Just setting `ndk.abiFilters =` or
            // `+=` here doesn't take effect — we have to wipe Flutter's defaults
            // first, then re-add only what we want.
            ndk.abiFilters.clear()
            ndk.abiFilters.addAll(listOf("armeabi-v7a", "arm64-v8a"))
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Pinned for the `enableEdgeToEdge()` extension used in MainActivity. The
    // Flutter Gradle Plugin pulls in an older androidx.activity transitively
    // which lacks the post-1.8.0 ComponentActivity receiver signature; the
    // explicit pin guarantees the right overload is on the classpath so
    // MainActivity compiles without "receiver type mismatch".
    implementation("androidx.activity:activity-ktx:1.9.3")
}
