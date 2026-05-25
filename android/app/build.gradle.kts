import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.github.triplet.play")
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

// Gradle Play Publisher (com.github.triplet.play) — pushes listings, release
// notes and (on demand) the AAB to Google Play via the Developer API. Upload
// commands live as `./gradlew publishListing`, `publishReleaseNotes`, and
// `publishBundle`; plain `./gradlew build` does NOT upload anything.
//
// Safety rails: default track is `internal` and default release status is
// DRAFT, so a bundle upload lands as a draft on the internal test track and
// must be promoted manually in Play Console. Override per-invocation via
// -Pplay.track=production -Pplay.releaseStatus=COMPLETED when you genuinely
// want to publish.
//
// Credentials live at ~/keys/play-publisher.json, deliberately outside the
// repo. When the file is missing (fresh checkout), the plugin's publish
// tasks fail with a clear "no credentials" error — local building still
// works because no publish task runs by default.
val playCredsFile = file(System.getProperty("user.home") + "/keys/play-publisher.json")
play {
    if (playCredsFile.exists()) {
        serviceAccountCredentials.set(playCredsFile)
    }
    defaultToAppBundles.set(true)
    track.set("internal")
    releaseStatus.set(com.github.triplet.gradle.androidpublisher.ReleaseStatus.DRAFT)
}
