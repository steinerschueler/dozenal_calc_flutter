---
status: akzeptiert
date: 2026-10-31
---

# Eszett in App-Texten trotz DOK-62

## Kontext und Problem

DOK-62 verlangt für alle Markdown-Dateien eines Projekts die Schweizer Rechtschreibung. Die App richtet sich aber auf
Deutsch an den ganzen Sprachraum und schreibt durchgehend Hochdeutsch mit Eszett. Ein Teil dieser Texte liegt als
Markdown vor: `legal/*.de.md` zeigt die App direkt an, `store/**` wird in die Stores synchronisiert. Der Auftrag zur
Übernahme der Standards verbietet zudem, das Verhalten der App zu ändern.

## Betrachtete Optionen

- Alles Markdown umstellen, auch `legal/` und `store/`. Das ändert angezeigte Texte und Store-Einträge.
- Trennung nach Zweck: Projekt-Doku nach DOK-62, ausgelieferte Texte bleiben Hochdeutsch.
- Auch die App auf Schweizer Rechtschreibung umstellen. Das ist eine Produktentscheidung und betrifft Tausende Stellen.

## Entscheid

Trennung nach Zweck. `README.md`, `AGENTS.md`, `CLAUDE.md`, `CHANGELOG.md` und neue Doku folgen DOK-62. Ausgelieferte
Texte bleiben Hochdeutsch: ARB, Theorie, Handbuch, Empfehlungen, `legal/` und `store/`.

## Konsequenzen

- Das Eszett-Skript aus DOK-62 muss `legal/` und `store/` ausnehmen.
- Ältere Dateien unter `docs/` enthalten noch Eszett. Sie werden umgestellt, wenn sie ohnehin geändert werden.
