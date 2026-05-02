# Play Store Listing — Dozenal Calc (de)

Vollständige Listing-Daten für den Google Play Console-Upload, deutsche
Variante. Beim Anlegen der App in der Play Console nimmst du die Werte
hier 1:1 in die jeweiligen Felder.

---

## App-Name

`Dozenal Calc`

(Max. 30 Zeichen — verwendet 11.)

---

## Kurzbeschreibung

(Max. 80 Zeichen — verwendet 66. Erscheint direkt unter dem App-Namen
auf der Listing-Seite, ohne Aufklappen.)

```
Ein "Dozenalrechner" mit einer neuartigen Schreibweise von Zahlen.
```

---

## Lange Beschreibung

(Max. 4000 Zeichen — verwendet ≈ 2900. HTML-Tags `<b>`, `<i>`, `<u>`,
`<br>` werden von der Play Console in der gerenderten Listing-Seite
unterstützt und tragen mehr Gewicht im Indexierungs-Algorithmus als
reine Unicode-Trenner.)

```html
Ein "Dozenalrechner" — ein wissenschaftlicher Taschenrechner, der nicht in zehn, sondern in zwölf rechnet. Mit eigenen Symbolen für die Ziffern.

<b>Was Basis 12 kann, was Basis 10 nicht kann</b>

Im Dezimalsystem ist 1/3 ein unendlicher periodischer Bruch (0.333…). In Basis 12 ist es kurz und exakt: 0.4. Auch Sechstel, Neuntel und alle Brüche, deren Nenner aus Zweien und Dreien besteht, werden im Dozenalsystem endlich. Das ist kein Zufall: zwölf hat sechs Teiler, zehn nur vier.

Dozenal Calc nutzt einen exakten Rational-Track parallel zur normalen Gleitkomma-Arithmetik. Periodische Brüche werden mit Strich über den sich wiederholenden Ziffern angezeigt, ganz wie aus dem Mathematikunterricht. Beispiel: 1/7 erscheint als 0.186A3 mit Periodenstrich, gefolgt von erhobenen Punkten wenn die Periode mehr als fünf Ziffern hat.

<b>Funktionsumfang</b>

• Grundrechenarten + Klammern + Vorzeichen
• Potenz, Quadratwurzel, n-te Wurzel
• Logarithmus zur beliebigen Basis
• Paralleladdition (a⊕b = ab/(a+b)) — nützlich für Widerstandsschaltungen
• Trigonometrie (sin, cos, tan, cot) und ihre Umkehrfunktionen
• Hyperbolische Funktionen (sinh, cosh, tanh, coth) und ihre Umkehrfunktionen
• Konstanten π, e, φ, √2
• Fakultät, Absolutbetrag, Kehrwert, Modulo
• Speicher (STO/RCL/MC) mit exakter rationaler Round-Trip-Erhaltung
• Winkelmodi RAD / DEG / GRAD
• Doppelklick auf Funktionstasten schaltet zur Umkehrfunktion (sin → sin⁻¹)
• Anzeige umschaltbar zwischen Dozenal und Dezimal

<b>Zwölf Kapitel zur Mathematik der Zwölf</b>

Eine integrierte Lektüre erklärt, warum gerade die Zwölf eine besondere Zahl ist:

1. Bedienung des Rechners
2. Was ist das Dozenalsystem?
3. Fibonacci, Quadratzahlen und Kuriositäten
4. Das Zwölfeck — Grundlagen (mit Illustration)
5. Das Zwölfeck — Winkel und Diagonalen (mit Illustration)
6. Das Zwölfeck — Flächen und Verhältnisse
7. Der Dodekaeder — zwölf Fünfecke im Raum
8. Der Dodekaeder — φ, Dualität und Symmetrie
9. Zwölf Tierkreiszeichen und der Himmel
10. Zwölf Flächen in Kristallen und Lebewesen
11. Zwölf Glieder an der Hand
12. Zoll, Fuss, Pfund — und warum sie dozenal Sinn ergeben

<b>Was Dozenal Calc nicht macht</b>

• Keine Werbung
• Kein Tracking
• Keine Analytics
• Keine Internetverbindung
• Keine Berechtigungen — die App fordert weder Kamera, Mikrofon, Standort, Speicher noch sonstige Zugriffe an
• Keine personenbezogenen Daten

Die App funktioniert komplett offline. Was du tippst, bleibt auf deinem Gerät.

<b>Für wen ist das?</b>

Für Lehrer und Lehrerinnen, die zeigen wollen, wie ein anderes Zahlensystem den Bruchrechen-Alltag verändern würde. Für Schüler und Schülerinnen, die ihre Mathematik aus einer ungewohnten Perspektive sehen wollen.

Lizenz: Creative Commons BY-NC-SA 4.0
Kontakt: dozenal@weltanschauung.app
```

---

## Metadaten / Pflichtfelder Play Console

| Feld | Wert |
|---|---|
| Package Name (App-ID) | `app.weltanschauung.dozenal` |
| Hauptkategorie | Bildung (Education) |
| Sekundärkategorie | Tools |
| Tags | calculator, mathematics, dozenal, base-12, education |
| Kontakt-E-Mail | `dozenal@weltanschauung.app` |
| Website (optional) | `https://dozenal.weltanschauung.app` |
| Privacy-Policy-URL | `https://dozenal.weltanschauung.app/privacy` (oder wo immer du die HTML-Version hostest) |
| Land/Region | Schweiz (oder weltweit) |
| Default-Sprache | Deutsch (Deutschland) |

---

## Content-Rating

Beim Fragebogen mit `Everyone / Alle Altersgruppen` antworten — keine
Gewalt, keine Mature-Inhalte, keine UGC, keine In-App-Käufe.

---

## Data Safety Form

| Frage | Antwort |
|---|---|
| Sammelt deine App Nutzerdaten? | **Nein** |
| Teilt deine App Nutzerdaten mit Dritten? | **Nein** |
| Werden Daten verschlüsselt während der Übertragung? | nicht zutreffend (App überträgt keine Daten) |
| Werden Daten auf Anfrage gelöscht? | nicht zutreffend |

---

## Target Audience

Alle Altersgruppen ab 5+ (oder die niedrigste Stufe, die Play Console
für ein Erwachsenen-orientiertes Lerntool anbietet — kein
ausgesprochenes Kinder-Zielpublikum).

---

## Visuelle Assets — wo sie liegen

| Asset | Pfad | Größe | Verwendung |
|---|---|---|---|
| App-Icon (Source) | `assets/icon.png` | 1024×1024 | wird vom Launcher-Icon-Generator zu allen Plattform-Größen propagiert |
| Adaptive Icon | siehe `android/app/src/main/res/mipmap-*` | div. | bereits aus icon.png abgeleitet |
| Feature Graphic | `assets/feature_graphic.png` | 1024×500 | Promo-Banner oben in der Listing-Seite |
| Compass-Asset | `assets/compass.png` | 1024×1024 | nicht für Play Store, nur für Marketing/Website |

---

## Phone-Screenshots — Empfohlene Auswahl + Reihenfolge

Aus `screenshots/raw/`, in dieser Reihenfolge hochladen:

| # | Datei | Was es zeigt |
|---|---|---|
| 1 | `03_periodic.png` | 1÷7 = 0.186A3 mit Periodenstrich + State-C-Punkten |
| 2 | `02_typing.png` | Mid-Eingabe "1+2" |
| 3 | `04_complex.png` | Größere Klammer-Rechnung |
| 4 | `05_overlay.png` | Erweiterungsfeld mit Sets 6-10 |
| 5 | `07b_chapter4_svg.png` | Kapitel 4 mit Zwölfeck-Illustration |
| 6 | `06_info_list.png` | 12-Kapitel-Liste |
| 7 | `09_privacy.png` | Datenschutzerklärung in der App |

Play Store erlaubt 2-8 Screenshots pro Format (Phone, 7"-Tablet,
10"-Tablet); die Phone-Slots sind die wichtigsten und entscheiden über
≈ 90 % des Listing-Eindrucks.

---

## Tablet-Screenshots

Optional. Falls erwünscht, einen 7"- und/oder 10"-Tablet-Emulator
einrichten (`flutter emulators --create --name tab_7`,
`flutter emulators --create --name tablet`) und das Screenshot-Skript
analog zu Phone laufen lassen. Wegen unserer responsive
`isMobileScreen()`-Schwelle bei 500 dp wechselt das Layout dort
automatisch in die Desktop-Variante (Numpad + 5 Op-Spalten
nebeneinander) — das ist eine eigene Bildsprache, die für Tablet-
Listings sehr gut wirkt.

---

## Build-Artefakte für den Upload

Den Release-Bundle baust du jeweils mit:

```bash
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab` —
diese Datei lädst du in der Play Console hoch (Tracks: zuerst
Internal Testing, dann Closed/Open Testing, zuletzt Production).

Die Signatur kommt automatisch aus `android/key.properties` →
`~/keys/dozenal_calc.jks`.

---

## ASO-Hinweise (für Updates)

Empfohlene Wartung des Listings nach Veröffentlichung:

- Keywords in Long Description sollten 3–5× wiederholt werden, bei
  ca. 2–3 % Dichte — aktuell `Dozenal/Dozenalrechner` ≈ 4×, `Basis 12`
  ≈ 3×, beides natürlich eingebettet.
- Wenn neue Funktionen/Kapitel kommen: Listing-Text aktualisieren,
  insbesondere die Bullet-Liste im Funktionsumfang. Play Store
  re-indexiert nach jedem Update.
- Screenshots regelmäßig erneuern bei UI-Änderungen — abgelaufene
  Listings senken die Conversion sichtbar.
- Nutzerbewertungen aktiv beantworten in der Play Console; das ist ein
  Ranking-Signal.

---

## Was ABSICHTLICH nicht im Listing steht

Aus der ASO-Recherche bekannte Anti-Patterns, die hier vermieden
werden:

- ❌ Superlative ("Beste Rechen-App", "Nr. 1 für Mathematik") — würden
  als Spam-Signal gewertet
- ❌ "JETZT HERUNTERLADEN!"-CTAs in der Beschreibung — der Listing-
  Kontext braucht keine zusätzliche Aufforderung
- ❌ Emoji-Overload im Titel — `Dozenal Calc` bleibt rein typografisch
- ❌ Vage Trust-Claims ("Vertraut von Millionen") ohne Beleg
- ❌ All-Caps-Schreien
- ❌ Mehr als ≈ 10 Target-Keywords — wird vom Algorithmus als
  Keyword-Stuffing klassifiziert
