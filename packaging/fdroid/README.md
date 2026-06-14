# F-Droid submission — Dozenal Calc

Staging copy of the F-Droid metadata for publishing on [F-Droid](https://f-droid.org).
F-Droid builds **from source** on its own servers (unlike Play, where you upload a
built AAB, or Flathub, which ships a pre-built bundle), so the work is a build
*recipe*, not an artifact.

- `app.weltanschauung.dozenal.yml` — the metadata + build recipe. This is the file
  that goes into `fdroiddata/metadata/app.weltanschauung.dozenal.yml`.

App ID `app.weltanschauung.dozenal` matches the Play/iOS/macOS/Flathub bundle ID.

## Why this app is a clean F-Droid candidate

- **MIT** licensed, source public on GitHub.
- **No proprietary dependencies** — only `flutter_markdown_plus`, `shared_preferences`,
  `url_launcher`, `package_info_plus` (all FOSS).
- **No anti-features** — no ads, no tracking, no analytics, no network access, no
  Google Play Services / Firebase. So no `AntiFeatures:` block is needed.
- The `v1.5.1` git tag (versionCode 19) already exists on GitHub — F-Droid builds
  from that tag.

## The build recipe, in short

- Pins Flutter to **3.41.8** (the version in `.github/workflows/ci.yml`) via the
  `flutter` srclib. **Keep this in lockstep with CI** when you bump Flutter.
- Strips the non-Android Flutter targets (`ios linux macos web watch`).
- Builds a **universal APK** (`flutter build apk --release`, both ABIs in one file).
  Split-per-ABI is a later size optimisation (it needs a `versionCode * 10 + offset`
  scheme and multiple outputs).
- F-Droid **signs with its own key**, so the F-Droid build will have a *different
  signature* than the Play Store build — that's normal and expected for F-Droid.

## How to submit (needs a GitLab account — F-Droid uses GitLab, not GitHub)

1. Create / sign in at [gitlab.com](https://gitlab.com) and **fork**
   [`fdroid/fdroiddata`](https://gitlab.com/fdroid/fdroiddata).
2. Copy this file into the fork as
   `metadata/app.weltanschauung.dozenal.yml`.
3. **Test the recipe locally** (strongly recommended before opening the MR — Flutter
   recipes usually need a round or two of iteration):
   ```bash
   pip install fdroidserver        # or: apt install fdroidserver
   fdroid readmeta
   fdroid lint app.weltanschauung.dozenal
   fdroid build -v -l app.weltanschauung.dozenal:19
   ```
4. Commit on a branch, push to your fork, open a **merge request** against
   `fdroiddata` `master`. F-Droid's CI re-runs lint + build; address any reviewer
   feedback and the maintainers merge it.

## Known tuning points (flag for the reviewers if CI complains)

- **Flutter srclib ref:** if `flutter@3.41.8` isn't resolvable as-is, the fallback is
  `flutter@stable` plus a `prebuild` step `git -C $$flutter$$ checkout 3.41.8`.
- **Auto-update of versionCode:** `UpdateCheckMode: Tags` + `AutoUpdateMode: Version`
  detects new `vX.Y.Z` tags, but Flutter keeps its versionCode in `pubspec.yaml`
  (`version: X.Y.Z+N`), which F-Droid's auto-updater doesn't always parse. If it
  mis-detects the code, the fix is an `UpdateCheckData` pointer at `pubspec.yaml` or a
  manual `Builds:` entry per release. The first (1.5.1/19) entry is manual regardless.

## Updating for a future release

Tag `vX.Y.Z` on GitHub (the version must be set in `pubspec.yaml`), then either let
the F-Droid update bot propose the new build or add a `Builds:` entry mirroring the
1.5.1 one with the new `versionName`/`versionCode`/`commit`.
