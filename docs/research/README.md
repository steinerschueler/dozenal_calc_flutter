# Theorie-Recherche: Gattungen, Scope & Backlog

Orientierungs-Dokument für **künftige Instanzen, die für die Theorie recherchieren
und schreiben**. Hält die grobe Idee fest: *welche Gattung welche Themen umfasst*,
*was schon da ist*, *was noch fehlt* und *nach welcher Methodik* gearbeitet wird.

> Dieses Dokument ist die **Single Source of Truth für die inhaltliche Gliederung**.
> Die technische Zuordnung (welches Kapitel in welchem Block, Legacy vs. Prosa)
> lebt im Code: `lib/theory/theory_blocks.dart`. Bei Änderungen **beide** pflegen.

## Gliederung: Grundlagen + drei Gattungen

Vor den drei thematischen Gattungen steht ein **Grundlagen**-Teil; danach gehört
jedes neue Thema **bewusst und trennscharf** in genau eine Gattung.

### Grundlagen (erster Block in der Theorie)
*Die grundlegenden Ideen des Zwölfersystems — der Einstieg vor den thematischen
Blöcken.* Enthält: **Was ist das Dozenalsystem?** und **Zwölf Glieder an der Hand**
(die anthropologische Herkunft des Zählens in Zwölfern — *warum* überhaupt Zwölf).
Konzeptuelles Fundament, nicht Natur/Mathematik/Gesellschaft.

**Abgrenzung zu „Bedienung des Rechners":** Die *Bedienung* ist App-Hilfe und bleibt
ein **eigener Eintrag oben im Info-Menü** (ausserhalb der Theorie). Sie soll **deutlich
auf die Grundlagen verweisen** (für Einsteiger ins Zwölfersystem) und zusätzlich die
**schwierigeren Fähigkeiten des Rechners** erklären (exakte Rationals & Perioden,
Zwei-Schienen-Auswertung, Funktionen …). Faustregel: grundlegende *Ideen* → Grundlagen;
*Bedienung* der Features → App-Hilfe.

### 1. Zwölf und die Welt
*Wo die Zwölf in der Welt auftaucht — nicht als menschliche Konstruktion, sondern
als Vorgefundenes.* Umfasst die **naturwissenschaftlichen, theistischen,
künstlerisch-kulturellen, biologischen und historischen** Artikel.
Beispiele: Pyrit/Granat (Mineralogie), Kugelpackung, Viren & Radiolarien, Zellen &
Schäume (Biologie), Quasikristalle (Physik), Musik, Kunst, Sprache, Bauen, Kalender
(Kultur), Tierkreis (Astronomie/Mythos).

### 2. Dozenale Mathematik
*Die mathematische Struktur der Zwölf selbst.* Umfasst die abstrakt-mathematischen
Themen: **Dodekaeder, Dodekagon (Zwölfeck), Fibonacci, Goldener Schnitt, Pi,
Einheitskreis & 360°** — und möglichst **weitere, weniger allgemein bekannte**
Themen (Teiler/Brüche/Perioden, Stellenwertsysteme, …). Anspruch: über das
Schulwissen hinausgehen, das Eigentümliche der Zwölf zeigen.

### 3. Dozenale Gesellschaft
*Der lebendige, zeitgenössische Dozenalismus.* **Nicht nur** die Dozenal Society,
sondern **alle gegenwärtigen Strömungen, Werkzeuge, Trends und Projekte**, die
etwas für die **Implementierung** des Dozenalismus tun: Gesellschaften & Bewegung,
Ziffern-Vorschläge (Pitman/Dwiggins), Aussprache-Systeme (Do/Gro/Mo), Metrologie
(TGM), Software & Werkzeuge (inkl. dieser App, Rapoports Rechner, Dozecal) usw.

## Ist → Soll: die Umsortierung

Beim Build-16-Umbau wurden die alten Lehr-Kapitel pragmatisch im Welt-Block belassen.
Nach der geschärften Gattungs-Idee stimmt das nicht mehr — die **Geometrie-/Zahlen-
Themen müssen von „Welt" nach „Mathematik" wandern**:

| Kapitel (aktuell Legacy, Welt-Block) | Soll-Gattung |
|---|---|
| Das Zwölfeck — Grundlagen / Winkel & Diagonalen / Flächen & Verhältnisse | → Mathematik (Dodekagon) |
| Der Dodekaeder — Fünfecke im Raum / φ, Dualität & Symmetrie | → Mathematik (Dodekaeder; φ als eigenes Thema lösen) |
| Fibonacci, Quadratzahlen und Kuriositäten | → Mathematik |
| Zwölf Tierkreiszeichen und der Himmel | bleibt **Welt** (theistisch/historisch) |
| Was ist das Dozenalsystem? | → **Grundlagen** |
| Zwölf Glieder an der Hand | → **Grundlagen** |

Zuordnungen sind entschieden **und in `theory_blocks.dart` umgesetzt** (4 Blöcke:
Grundlagen · Zwölf und die Welt · Dozenale Mathematik · Dozenale Gesellschaft).
Offen ist nur noch das **Bequellen** der verschobenen Legacy-Kapitel (siehe Backlog).

**Wichtig:** Diese alten Kapitel sind **Legacy** (`info_content_<lang>.dart`, wörtlich
aus dem Rust-Original portiert) und haben **noch keine Quellen / kein Dossier / keinen
Vorbehalte-Abschnitt**. Beim Verschieben gehören sie auf den neuen Standard gehoben
(Dossier schreiben, `sources:` ergänzen). Der Detail-View rendert den Quellen-Block
bereits für *jedes* Kapitel (`info_pages.dart` — `if (sources.isNotEmpty) …`); nur
`TheoryChapterRef.legacy` setzt `sources` derzeit hart auf `[]`. Angleichung ist also
v. a. Inhalts- + minimale Modell-Arbeit, die Illustrationen/Tabellen bleiben erhalten.

## Backlog (Stand pflegen!)

Legende: Dossier = `docs/research/*.md` vorhanden · Prosa = als `ProseChapter`
verdrahtet (`lib/theory/<lang>/<block>_<lang>.dart`).

### Grundlagen
| Thema | Dossier | Prosa |
|---|---|---|
| Bedienung des Rechners (standalone App-Hilfe, NICHT im Grundlagen-Block) | — | (Legacy; *geplant:* Verweis auf Grundlagen + Erklärung der schwierigeren Rechner-Fähigkeiten) |
| Was ist das Dozenalsystem? (aus Legacy heben + bequellen) | ❌ | (Legacy) |
| Zwölf Glieder an der Hand (aus Legacy heben + bequellen) | ❌ | (Legacy) |

### Zwölf und die Welt
| Thema | Dossier | Prosa |
|---|---|---|
| Pyrit, Granat, Kugelpackung, Quasikristalle, Viren/Radiolarien, Zellen/Schäume | ✅ (nature_*) | ✅ |
| Musik, Kunst, Sprache, Bauen, Kalender | ✅ (culture_*) | ✅ |
| Tierkreis (aus Legacy übernehmen + bequellen) | ❌ | (Legacy) |
| *Ideen:* Uhr/Zeitmessung, Monate/Jahr, Theologie der Zwölf (12 Apostel/Stämme), … | ❌ | ❌ |

### Dozenale Mathematik
| Thema | Dossier | Prosa |
|---|---|---|
| Teiler/Brüche/Perioden, Zahlenbasen, Geschichte der Stellenwertsysteme, „Wie dieser Rechner rechnet" | teils (math_*) | ✅ |
| Dodekagon, Dodekaeder, Fibonacci (aus Legacy heben + bequellen) | ❌ | (Legacy) |
| Goldener Schnitt, Pi, Einheitskreis & 360° | ❌ | ❌ |
| *Ideen:* weniger bekannte Zwölf-Mathematik (highly composite numbers, 12 als 3-glatt, …) | ❌ | ❌ |

### Dozenale Gesellschaft
| Thema | Dossier | Prosa |
|---|---|---|
| Bewegung, neue Ziffern, Do/Gro/Mo, TGM/Gesellschaften/Werkzeuge, Dozecal, Rapoports Rechner | teils (society_*) | ✅ |
| *Ideen:* aktuelle Tools/Repos, Fonts, Online-Communities, diese App selbst | ❌ | ❌ |

> Einheiten (`unit_*`, 8 Dimensionen) sind ein **eigener** Block (Einheitenrechner),
> kein Teil der drei Gattungen — hier nur der Vollständigkeit halber erwähnt.

## Methodik (verbindlich)

Maßstab ist ein bestehendes Dossier wie [`nature_pyrit.md`](nature_pyrit.md).

1. **Dossier zuerst** (`docs/research/<kategorie>_<thema>.md`), gegliedert in
   Sach-Abschnitte **plus** einen expliziten Abschnitt **„Vorbehalte & verbreitete
   Irrtümer"** (Fakt / Hypothese / Mythos sauber trennen) **plus** einen
   **`## Quellen (Tier-System)`**-Block.
2. **Tier-System** je Quelle: Zuverlässigkeit **R1** (wissenschaftlich/primär) ·
   **R2** (etablierte Referenz) · **R3** (seriös populär) · **R4** (schwach) ·
   **S** (spekulativ); Zugang **A1** (Volltext gelesen) · **A2** (teilweise/Snippet/
   Paywall) · **A3** (nur indirekt). Jede Quelle annotieren: *was* sie belegt.
3. **Prosa destillieren** in `ProseChapter` (Überschrift + Absatz je `ProseSection`),
   **einfache, übersetzbare Sätze**, neutrale Erzählstimme: die Wissenschaft nennen
   und berichten, *wie* Figuren/Traditionen sie deuten — aber **keine eigenen
   Wertungen** im Erzähler. Ehrlich zu Vorbehalten (z. B. „ein Pyritoeder ist KEIN
   platonisches Dodekaeder"). Die Top-Quellen als `sources:`-Liste (Titel, URL,
   R-Tier, A-Tier) anhängen → rendert als tappbarer „Quellen"-Block.
4. **Sprachen:** Deutsch ist Referenz (Template-ARB). Erst DE-Dossier + DE-Prosa
   fertigstellen, dann in die übrigen 13 Sprachen übersetzen (Fallback auf DE).

## Workflow (technisch)

1. Dossier nach `docs/research/` schreiben.
2. `ProseChapter` in `lib/theory/de/<block>_de.dart` ergänzen (Sektionen + `sources`).
3. In `lib/theory/theory_blocks.dart` der richtigen Gattung zuordnen.
4. Übersetzen: `lib/theory/<lang>/<block>_<lang>.dart`.
5. Optional Bild/App-Verweis: `chapter_images.dart` (`imageId`).
6. `flutter analyze` + `flutter test` grün halten.
</content>
