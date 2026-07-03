# Flathub submission — Dozenal Calc

Files for publishing the Linux build on [Flathub](https://flathub.org):

- `app.weltanschauung.dozenal.yml` — flatpak-builder manifest (ships the
  pre-built `flutter build linux --release` bundle).
- `app.weltanschauung.dozenal.metainfo.xml` — AppStream metadata (required).
- `app.weltanschauung.dozenal.desktop` — desktop entry.
- `app.weltanschauung.dozenal-{512,256,128,64}.png` — hicolor icons.

App ID `app.weltanschauung.dozenal` matches the Android/iOS/macOS bundle ID and
the owned domain `weltanschauung.app` (Flathub may ask to verify ownership).

## Status: submitted — PR in review

All pre-submission TODOs are done:

1. **[DONE] Bundle published + manifest pinned.** The pre-built bundle is the
   `dozenal-calc-1.5.1-linux-x64.tar.gz` asset on the
   [v1.5.1 release](https://github.com/steinerschueler/dozenal_calc_flutter/releases/tag/v1.5.1);
   `app.weltanschauung.dozenal.yml` references it with its sha256.
2. **[DONE] Metainfo screenshots.** The `<screenshots>` block is active and
   points at raw GitHub URLs under `store/screenshots/linux/`.
3. **[DONE] Build verified.** Flathub's builder compiled the manifest green
   for aarch64 + x86_64 (triggered via the `bot, build` PR comment).
4. **[DONE] Submitted.** PR **flathub/flathub#8968** (base `new-pr`) is in
   review; builds and updates run on Flathub's infrastructure after
   acceptance.

## Version refresh (next release)

```bash
flutter build linux --release
tar czf dozenal-calc-<ver>-linux-x64.tar.gz -C build/linux/x64/release bundle
sha256sum dozenal-calc-<ver>-linux-x64.tar.gz   # → update url + sha256
```

Optional local test build (needs flatpak tooling — not on the current host;
runtime version must match the manifest, currently 25.08):

```bash
sudo apt install flatpak flatpak-builder
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.freedesktop.Platform//25.08 org.freedesktop.Sdk//25.08
flatpak-builder --force-clean --user --install builddir app.weltanschauung.dozenal.yml
flatpak run app.weltanschauung.dozenal
```
