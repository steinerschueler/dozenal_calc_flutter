# Flathub-Einreichung: Dozenal Calc

Dateien für die Veröffentlichung des Linux-Builds auf [Flathub](https://flathub.org):

- `app.weltanschauung.dozenal.yml`: flatpak-builder-Manifest, liefert das vorgebaute Bundle von
  `flutter build linux --release` aus.
- `app.weltanschauung.dozenal.metainfo.xml`: AppStream-Metadaten (Pflicht).
- `app.weltanschauung.dozenal.desktop`: Desktop-Eintrag.
- `app.weltanschauung.dozenal-{512,256,128,64}.png`: hicolor-Icons.

Die App-ID `app.weltanschauung.dozenal` entspricht der Bundle-ID von Android, iOS und macOS und der eigenen Domain
`weltanschauung.app`. Flathub kann einen Nachweis des Besitzes verlangen.

## Stand der Einreichung

Alle Vorarbeiten sind erledigt:

1. **Bundle veröffentlicht, Manifest gepinnt.** Das vorgebaute Bundle ist das Asset `dozenal-calc-1.5.1-linux-x64.tar.gz`
   im [Release v1.5.1](https://github.com/steinerschueler/dozenal_calc_flutter/releases/tag/v1.5.1).
   `app.weltanschauung.dozenal.yml` verweist mit seinem sha256 darauf.
2. **Screenshots in der Metainfo.** Der Block `<screenshots>` ist aktiv und zeigt auf raw-GitHub-Adressen unter
   `store/screenshots/linux/`.
3. **Build geprüft.** Der Builder von Flathub hat das Manifest für aarch64 und x86_64 grün gebaut, ausgelöst über den
   PR-Kommentar `bot, build`.
4. **Eingereicht, nicht angenommen.** PR **flathub/flathub#8968** (Base `new-pr`) wurde am 2026-06-13 ungemerged
   geschlossen. Es gibt keinen neuen Versuch, bis sich die KI-Richtlinie von Flathub ändert:
   [ADR 0003](../../docs/decisions/0003-keine-flathub-einreichung.md).

## Version aktualisieren (nächstes Release)

```bash
flutter build linux --release
tar czf dozenal-calc-<ver>-linux-x64.tar.gz -C build/linux/x64/release bundle
sha256sum dozenal-calc-<ver>-linux-x64.tar.gz   # → url und sha256 anpassen
```

Optionaler lokaler Testbuild. Er braucht die Flatpak-Werkzeuge, die auf dem aktuellen Rechner fehlen. Die Runtime-Version
muss zum Manifest passen, derzeit 25.08:

```bash
sudo apt install flatpak flatpak-builder
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.freedesktop.Platform//25.08 org.freedesktop.Sdk//25.08
flatpak-builder --force-clean --user --install builddir app.weltanschauung.dozenal.yml
flatpak run app.weltanschauung.dozenal
```
