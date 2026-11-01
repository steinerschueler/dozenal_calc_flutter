---
status: akzeptiert
date: 2026-11-01
---

# Keine Lint-Grenze von 80 Zeichen

## Kontext und Problem

CC-01 verlangt den Regelsatz `very_good_analysis`. Seine Regel `lines_longer_than_80_chars` verursacht rund 8300 der
18500 Befunde im Altbestand, vor allem in Übersetzungstexten. Nach CC-41 müsste jede geänderte Datei diese Befunde
beheben, auch bei einem korrigierten Wort. Lange Texte lassen sich nur durch Zerlegen in Teilstrings kürzen, was sie
schwerer lesbar macht.

## Betrachtete Optionen

- Regel beibehalten und Texte beim Ändern umbrechen.
- Regel für das ganze Projekt abschalten.
- Regel nur für die Textordner abschalten. Der Linter kennt keine Regeln pro Ordner, das bräuchte Kommentare in
  Hunderten Dateien.

## Entscheid

Die Regel ist im ganzen Projekt abgeschaltet. Die Zeilenbreite des Codes bestimmt weiter `dart format`.

## Konsequenzen

- Die übrigen Regeln von `very_good_analysis` gelten unverändert.
- Zeilen über 80 Zeichen, die `dart format` nicht umbrechen kann, sind erlaubt.
