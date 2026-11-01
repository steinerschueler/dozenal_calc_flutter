@AGENTS.md

## Gerätetests

Ablauf: Gerät finden, bauen und installieren, per `adb input tap/swipe` steuern, `screencap`, mit `Read` ansehen.

Bei Zustandswechseln (Sprache, Orientierung, Theme, Tastenmodus) beide Zustände als Datei aufnehmen und nebeneinander
zeigen, nie nur eine Stichprobe. Geräte und Entsperr-Rezepte stehen lokal in `docs/local/device-testing.md`, der Ordner
kann auf einem Rechner fehlen.

`adb` liegt in `~/Android/Sdk/platform-tools/` und braucht für das Gerät einen Lauf ausserhalb der Sandbox. In der Sandbox
ist die Geräteliste immer leer. Installationen brechen oft ab, dann wiederholen und nicht deinstallieren: siehe
[docs/entwicklung.md](docs/entwicklung.md).
