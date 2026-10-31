# Konventionen

Aus dem früheren Gesamtdokument übernommen. Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

- **Branch-Trennung (HART):** Arbeit am **Dozenal Calc** (diese App, Rechner, Theorie, Einheitenrechner, l10n, Store)
  läuft auf `master`, Riskantes über einen kurzlebigen Branch (GIT-22), und **niemals** auf `bidozenal-foundation`. Die
  Branch `bidozenal-foundation` gehört allein der separaten **Basis-24-«Bidozenal»-App** (Fundament in `docs/bidozenal.md`)
  und darf keinen Dozenal-Calc-Code aufnehmen. Vor jedem `commit`/`push` den aktiven Branch prüfen
  (`git branch --show-current`); steht HEAD versehentlich auf `bidozenal-foundation`, zuerst `git checkout master`.
  Umgekehrt gilt das Gleiche: Bidozenal-Basis-24-Arbeit nie auf `master`.
- **Lizenz-Hinweis:** Dieses Projekt steht unter der **MIT-Lizenz**.
  Root `LICENSE` enthält den kanonischen MIT-Wortlaut (Expat-Variante,
  Copyright Eric Naville, 2026). Die vierzehn lokalisierten
  `legal/license.*.md`-Dateien folgen einem Hybrid-Schema:
  lokalisierter Header + Rechte-Zusammenfassung → englischer
  MIT-Volltext als rechtsverbindliche Fassung → lokalisierter
  Autor/Drittanbieter-Block. So bleibt die Multi-Sprach-UX erhalten,
  aber juristisch zählt die englische Originalfassung. Vorgängiger
  CC-BY-NC-SA-Stand wurde bewusst aufgegeben — MIT ist OSI-konform,
  CC ist nicht für Software empfohlen.
- **Keine Analytics, kein Netzwerk, keine Plattform-Berechtigungen.** Die
  Datenschutzerklärung ist im App-Bundle (`legal/privacy-policy.de.md`,
  gerendert via `privacy_page.dart`), die App ist deutsch-zuerst.
- **Deutsche Rechtschreibung der App (HART):** App-Texte schreiben durchgängig Hochdeutsch mit Eszett (U+00DF), niemals
  Schweizer Doppel-s. Gilt für die **gesamte App** und sämtliche ausgelieferten deutschen Inhalte (ARB, Theorie, Handbuch,
  Empfehlungen, `legal/*.de.md`, Store-Listings). Eine etwaige gegenteilige Vorgabe in `docs/`-Recherchedokumenten gilt
  **nicht** für App-Texte, bei Konflikt gewinnt diese Konvention. Projekt-Doku folgt DOK-62, siehe
  [ADR 0001](decisions/0001-eszett-in-app-texten.md).
- Beim Portieren aus Rust die Rust-Funktions-/Struct-Namen in Kommentaren
  beibehalten — sie sind der Lookup-Schlüssel für Verhaltens-Querverweise.
- **Lints:** `analysis_options.yaml` aktiviert nur das
  `package:flutter_lints/flutter.yaml`-Standardset, keine projekt-spezifischen
  Zusatzregeln. `flutter analyze` muss aber sauber bleiben — CI fängt
  Verstösse.

## Umgebungs-Hinweise

- Der Tablet-Emulator (AVD) ist instabil bei wiederholten
  `flutter install`-Zyklen auf dieser Maschine. Lieber ein physisches
  Gerät verwenden oder den Emulator zwischen Installs neu starten.
