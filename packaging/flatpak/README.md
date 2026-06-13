# Flathub submission — Dozenal Calc

Files for publishing the Linux build on [Flathub](https://flathub.org):

- `app.weltanschauung.dozenal.yml` — flatpak-builder manifest (ships the
  pre-built `flutter build linux --release` bundle).
- `app.weltanschauung.dozenal.metainfo.xml` — AppStream metadata (required).
- `app.weltanschauung.dozenal.desktop` — desktop entry.
- `app.weltanschauung.dozenal-{512,256,128,64}.png` — hicolor icons.

App ID `app.weltanschauung.dozenal` matches the Android/iOS/macOS bundle ID and
the owned domain `weltanschauung.app` (Flathub may ask to verify ownership).

## Open TODOs before this is submittable

1. **Publish the bundle + fill the manifest source.** Flathub builders have no
   network, so we ship the pre-built bundle:
   ```bash
   flutter build linux --release
   tar czf dozenal-calc-1.5.1-linux-x64.tar.gz -C build/linux/x64/release bundle
   sha256sum dozenal-calc-1.5.1-linux-x64.tar.gz
   ```
   Upload the tarball to a GitHub release (tag `v1.5.1`) and put its URL + sha256
   into `app.weltanschauung.dozenal.yml` (`sources[0]`).

2. **Add a screenshot to the metainfo.** Flathub requires ≥1, showing the
   *desktop* app. Capture from the running build (the window is 1280×720),
   host it at a stable URL (e.g. raw GitHub under `store/screenshots/linux/`),
   and uncomment the `<screenshots>` block in the metainfo.

3. **Test-build locally** (needs flatpak tooling — not on the current host):
   ```bash
   sudo apt install flatpak flatpak-builder
   flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
   flatpak install --user flathub org.freedesktop.Platform//24.08 org.freedesktop.Sdk//24.08
   flatpak-builder --force-clean --user --install builddir app.weltanschauung.dozenal.yml
   flatpak run app.weltanschauung.dozenal
   ```
   Iterate the manifest until it builds and runs cleanly; bump
   `runtime-version` to the current Freedesktop stable if needed.

4. **Submit to Flathub.** Needs a Flathub (GitHub) account: open a PR to
   `flathub/flathub` adding the manifest, then address the review. Builds and
   updates run on Flathub's infrastructure after acceptance.
