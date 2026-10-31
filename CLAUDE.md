@AGENTS.md

## Gerätetests

Ablauf: Gerät finden, bauen und installieren, per `adb input tap/swipe` steuern, `screencap`, mit `Read` ansehen.

Bei Zustandswechseln (Sprache, Orientierung, Theme, Tastenmodus) beide Zustände als Datei aufnehmen und per
`SendUserFile` nebeneinander zeigen, nie nur eine Stichprobe. Geräte und Entsperr-Rezepte stehen lokal in
`docs/local/device-testing.md`.
