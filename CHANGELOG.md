# Changelog

Format: [Keep a Changelog 1.1.0](https://keepachangelog.com/de/1.1.0/). Die Einträge vor diesem Changelog sind aus der
Git-Historie zusammengefasst. Nur `v1.5.1` ist als Git-Tag vorhanden.

## [Unreleased]

### Added

- Werterechner als dritte Rechner-Seite: Edelmetalle und Währungen, Wertmodus, Kurs-Editor und historische Preiskurve.
- Wertetheorie mit 27 Kapiteln und Werterechner-Handbuch in allen 14 Sprachen.
- Resultat-Brücke zum Werterechner über die Ans-Taste und CONV mit der Langdruck-Option VAL.
- Windows-Ziel mit MSIX-Paket und Listings für den Microsoft Store.
- Projektsteckbrief `npf.toml`, `AGENTS.md`, `docs/architektur.md` und dieses Changelog.

### Changed

- Der Page-Peek ist ein dezenter Punkte-Indikator, der mit dem Wischen mitgleitet.
- Das Keypad des Werterechners kommt ohne Overlay aus und zeigt beide Einheitensysteme gleichzeitig.
- Die CI nutzt Flutter 3.47.9 und prüft das Lockfile streng.
- Die KI-Anweisungen sind thematisch nach `docs/` aufgeteilt.

### Fixed

- Vorzeichen-, Speicher- und Darstellungsfehler aus einem Code-Audit, dazu exakte Flüssigunzen.
- Der Pfad in der Unit-Info zeigt den tatsächlichen Menüpfad.
- `gen_logos.ps1` findet Icon und Schrift relativ zum Repo.

### Security

- gitleaks läuft als pre-commit-Hook.
- Der Web-Build lädt CanvasKit und Schriften von der eigenen Seite, die IP der Besucher geht nicht mehr an Google.

## [1.5.1] - 2026-06-13

Build 19.

### Changed

- Standardmässig Dezimalzahlen und gewohnte Ziffern. Dozenal und die eigenen Glyphen lassen sich jederzeit einschalten.
- Neue runde, farbige Menüsymbole, der App-Name steht im Menütitel.
- Überarbeitete, kürzere Einführung mit vier Seiten.
- Einheit im Einheitenrechner ohne «Alles löschen» wechselbar.
- Theorie-Bilder als WebP (von 9,6 auf 5,4 MB).

### Added

- Einstellung «Schriftgrösse», vor allem für Tablets.
- Flatpak-Paketierung für Flathub.

## [1.5.0] - 2026-06-13

Build 18.

### Added

- Einheitenrechner als zweite Pager-Seite, Ergebnisse wandern per Ans und CONV zwischen den Rechnern.
- Basis und Einheitensystem sind unabhängig, dazu der Farbcode Zehner- und Zwölfer-Welt.
- Eigene Handbücher für beide Rechner, Einheitentheorie unter Theorie.
- Langdruck auf eine Einheit zeigt eine Erklärung in allen 14 Sprachen.
- Paritätstests zwischen Flutter- und Watch-Rechenkern.

## [1.4.0] - 2026-06-11

Build 17.

### Added

- Hell- und Dunkel-Theme.
- Einstellungen-Seite mit Keypad-Modi, Basis und Winkelmodus.
- Ergebnis-Verlauf per Wischgeste am Display.
- Funktionstasten: M+ und M−, x² und ±, ln, eˣ, log₁₂, nCr, nPr und wissenschaftliche Notation.

## [1.3.0] - 2026-06-09

Build 16.

### Added

- macOS-App und in die iOS-App eingebettete Apple-Watch-App im App Store.
- Play-Store-Screenshots in elf Sprachen.

## [1.2.0] - 2026-06-08

Build 15.

### Added

- Erste Ausgabe für iPhone und iPad.
- Theorie mit historischen Bildern und Verweiskarten in 14 Sprachen.
- Tabellen-Schrift JetBrains Mono und macOS-Machbarkeitsstudie.

## [1.1.0] - 2026-05-25

Build 14.

### Changed

- Die Theorie-Sektion im Menü ist einklappbar.
- Lange exakte Ergebnisse werden auf die Displaybreite gekürzt und markiert.

### Fixed

- Fehlerhafte Eingaben lassen sich an Ort und Stelle korrigieren.

## [1.0.0] - 2026-05-25

Builds 1 bis 13, erste Ausgaben über den Play Store.

### Added

- Rechner mit eigenen Glyphen, exakter Rational-Schiene mit Periodenerkennung und f64-Fallback.
- Doppelbasis, Einführung, Theorie-Kapitel und Hoch- und Breit-Layout.
- 14 Sprachen, Einheiten-Umrechnung und MIT-Lizenz.

### Changed

- Android-15-API-Umstellung, kleinere Pakete durch ABI-Filter.

[Unreleased]: https://github.com/steinerschueler/dozenal_calc_flutter/compare/v1.5.1...HEAD
[1.5.1]: https://github.com/steinerschueler/dozenal_calc_flutter/releases/tag/v1.5.1
