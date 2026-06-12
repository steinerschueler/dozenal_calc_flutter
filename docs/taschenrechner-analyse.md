# Bestmögliche Taschenrechner pro Plattform – Recherche-Analyse

**Zweck:** Grundlagendokument für eine Artikelserie (ein Artikel pro Plattform) mit begründeten Empfehlungen. Übergabe an Claude Code zur Artikelproduktion.
**Stand der Recherche:** 12. Juni 2026
**Status der Aussagen:** Aussagen mit Quellenverweis [Qn] sind recherchiert und belegt. Aussagen, die als „Allgemeinwissen, zu verifizieren" markiert sind, stammen aus Modellwissen und sollten vor Publikation gegengeprüft werden. Keine Behauptung ohne diese Kennzeichnung publizieren – intellektuelle Redlichkeit ist Leitprinzip der Serie.

---

## 1. Kontext und Zielgruppe

Die Empfehlungen richten sich an technisch versierte Nutzer mit folgendem Profil (zugleich Autorenperspektive der Serie):

- Software-Entwicklung (u.a. Kotlin/Android), daher Bedarf an Basis-Umrechnung (Bin/Okt/Hex) und Interesse an einsehbarem Quellcode
- Geometrische Berechnungen aus dem Holzbau (Trigonometrie, Winkel in Grad/Minuten/Sekunden, Versatz- und Kerven-Geometrie) – liefert praxisnahe Testaufgaben
- Anspruch an mathematische Exaktheit: exakte Brüche, symbolische Resultate (√2 statt 1.4142...), hohe bzw. beliebige Präzision
- Eigenes App-Projekt „Dozenal Calc" (Basis-12-Rechner): Open-Source-Codebasen dienen als Lern- und Referenzmaterial, Basis-12-Fähigkeit existierender Rechner ist Benchmark
- Formfaktor-Präferenz physisch: kompakt, kein klobiger Grafikrechner

## 2. Bewertungskriterien und Gewichtung

| # | Kriterium | Beschreibung | Gewicht (Vorschlag) |
|---|-----------|--------------|---------------------|
| 1 | Präzision & Darstellung | Exakte Brüche, symbolische Ausgabe, beliebige/hohe Genauigkeit | 20 % |
| 2 | Trigonometrie & Winkelkomfort | DMS-Umrechnung, schneller Moduswechsel Grad/Rad | 15 % |
| 3 | Basis-Umrechnung | Bin/Okt/Hex; Basis 12 als Spezial-Benchmark | 10 % |
| 4 | Programmierbarkeit | Formeln/Programme speichern und parametrisieren | 10 % |
| 5 | Eingabelogik & Bedieneffizienz | Algebraisch vs. RPN; Tastendrücke pro Aufgabe | 15 % |
| 6 | Formfaktor / UI-Qualität | Physisch: Taschenformat, Tastenqualität; Software: Layout, Lesbarkeit | 10 % |
| 7 | Pflege & Zukunftssicherheit | Aktive Entwicklung, Verfügbarkeit, Ersatzteile/Updates | 10 % |
| 8 | Offener Quellcode & Lernwert | Lizenz, Sprache (Kotlin direkt verwertbar), Lesbarkeit der Codebasis | 15–20 % (Bonus, kein K.-o.) |

Hinweis zur Lizenz-Systematik (für alle Artikel wiederverwendbar):

- **GPL (v2/v3):** Studieren immer erlaubt; Code-Übernahme verpflichtet zur Offenlegung des eigenen Quellcodes unter GPL (Copyleft). Für ein closed-source veröffentlichtes Dozenal Calc: nur lesen, nicht kopieren.
- **MIT/Apache:** Übernahme mit Lizenzhinweis möglich.
- **Public Domain / CC0 / Unlicense:** keine Pflichten; bei Taschenrechner-Codebasen praktisch nicht anzutreffen.
- Echte „Gemeinfreiheit" ist also die Ausnahme; der praktische Standard im Feld ist GPL.

## 3. Methodik der Recherche

1. Kuratierte Shortlists pro Plattform statt offener „bester Taschenrechner"-Suchen (SEO-verseuchtes Terrain).
2. Primärquellen bevorzugt: offizielle Projektseiten, GitHub/Codeberg-Repositories, F-Droid-Metadaten, Hersteller-Shops. Sekundärquellen (Reviews, Vergleichsportale) nur ergänzend.
3. Verfügbarkeits- und Preisprüfung für physische Geräte über Hersteller-Shop und Marktplätze.
4. Für die Artikel vorgesehen, aber noch nicht durchgeführt: empirischer Praxistest mit standardisierten Testaufgaben (siehe Abschnitt 10). Die Artikel sollten klar trennen zwischen recherchierten Fakten und eigenen Testresultaten.

---

## 4. Plattform Android

### 4.1 HiPER Calc Pro (proprietär) – Favorit als Werkzeug

- Wissenschaftlicher Rechner mit symbolischer Algebra, Graphen, Gleichungen, Integralen und Ableitungen; über 40 Mio. Downloads. [Q1]
- Aktiv gepflegt: Version 11.3.3 vom März 2026; jüngste Neuerungen u.a. bis zu 20 Funktionsgraphen gleichzeitig, verbesserte Partialbruchzerlegung, Anzeige von Ausdruckswurzeln. [Q2]
- Mehrere Layouts („pocket", „compact", „expanded") für verschiedene Bildschirmgrössen. [Q1]
- Allgemeinwissen, zu verifizieren: bis zu 100 Stellen Mantisse, periodische Zahlen, Bruchdarstellung; Pro-Version kostenpflichtig (einmalig, wenige Franken).
- Schwäche im Profil: closed source → Lernwert null; keine Basis-12-Ausgabe (zu verifizieren).

### 4.2 Qalculate! für Android (GPL-2.0) – Herausforderer mit Bonus

- Offizielle Android-UI der Qalculate!-Engine; Funktionsumfang u.a. symbolische Berechnungen, beliebige Präzision, Intervallarithmetik, Einheitenrechnung. [Q3]
- Lizenz GPL-2.0-only, Entwickler Jost Herkenhoff, Quellcode auf GitHub (`jherkenhoff/qalculate-android`). [Q4]
- Auf F-Droid vom Originalentwickler gebaut und signiert; erfordert Android 8.0+. [Q5]
- **Risiko-Befund:** Das Projekt verweigert sich erklärtermassen Googles neuer Entwickler-Verifikation („supports an open and independent Android ecosystem") und warnt selbst, dass die App ab September 2026 auf vielen Geräten möglicherweise nicht mehr installierbar ist. [Q3] Für F-Droid-Nutzer mit alternativen Installationswegen weniger kritisch; im Artikel als bewusste Positionierung einordnen.
- Architektur-Lernwert: Kotlin/Java-UI als Wrapper über die native C++-Bibliothek libqalculate (separates Repo `jherkenhoff/libqalculate-android`); Build benötigt NDK und SWIG. [Q6] Direkt relevantes Muster für eine App mit getrenntem Rechenkern.

### 4.3 OpenCalc (GPL-3.0, Kotlin) – Lernressource, kein Funktions-Champion

- Einfacher, gepflegter Android-Rechner, vollständig in Kotlin. [Q7]
- Aktives Repository (~900 Stars, >300k Downloads). [Q8]
- Technisch interessantes Detail für Dozenal Calc: Mit Version 3.0.0 Umstellung der internen Zahlenrepräsentation von `Double` auf `BigDecimal` – ein dokumentierter Architekturentscheid zur Präzisionsfrage, wie er auch für einen Basis-12-Rechner ansteht. [Q9]
- Funktional kein Konkurrent zu HiPER/Qalculate (kein CAS, keine Programmierbarkeit); Wert liegt im lesbaren, überschaubaren Kotlin-Code.

### 4.4 Free42 / Plus42 (GPL-2.0) – RPN-Schiene

- Free42: vollständige Neuimplementierung des HP-42S ohne HP-Code; quelloffen unter GPL v2; aktuelle Version 3.3.12. [Q10]
- Plus42: erweiterte Variante, ebenfalls GPL v2; ergänzt RPN-Tastenprogrammierung um algebraische Gleichungen und Solver-Konzepte nach Vorbild HP-17B/27S und HP-48/49/50. [Q11] Senkt die RPN-Einstiegshürde deutlich.
- Repositories aktiv gepflegt (letzte Aktualisierungen Januar 2026, gespiegelt auf Codeberg und SourceHut). [Q12]
- Einschränkung für den Dozenal-Benchmark: BASE-Funktionen decken die Basen 2, 8, 10, 16 ab (Allgemeinwissen, zu verifizieren) – keine Basis 12.

### 4.5 Weitere Kandidaten (Kurzbewertung)

- **RealCalc / RealCalc Plus** (proprietär): solider klassischer Scientific mit RPN-Option; Allgemeinwissen, zu verifizieren: Entwicklungsstand prüfen, wirkt seit Jahren stagnierend.
- **Calculator++** (GPL): letzte F-Droid-Version 2.3.3 von November 2023 [Q13] – Pflege-Status im Artikel kritisch prüfen.
- **CalcES u.ä. Casio-Emulationen:** rechtlich/lizenzrechtlich heikle Grauzone, nicht als Empfehlung führen.

### 4.6 Empfehlungs-Hypothese Android

Doppelempfehlung: HiPER Calc Pro als bestes Alltagswerkzeug, Qalculate! als gleichwertige Empfehlung für Nutzer mit Open-Source-Präferenz und als einziger Kandidat mit Basis-12-Ausgabe. OpenCalc als „Blick in den Maschinenraum" für Entwickler erwähnen.

---

## 5. Plattform iOS

### 5.1 PCalc (proprietär, USD 9.99) – Platzhirsch

- Gilt 2026 weiterhin als Referenz: kontinuierliche Entwicklung seit den 1990ern, umfangreiche Konvertierungen (inkl. Währungen mit Live-Kursen), erstklassige RPN-Eingabe, tiefgehende Anpassbarkeit (Themes, Tastenlayouts, Tape). [Q14]
- Unterstützt iPhone, iPad, Apple Watch und Apple TV; optionaler RPN-Modus, editierbare Historie. [Q15]
- PCalc Lite als kostenloser, funktionaler Einstieg mit In-App-Erweiterungen. [Q16]
- Schwächen: proprietär (kein Lernwert), Preis, Funktionsfülle kann erschlagen. [Q14]

### 5.2 Free42 / Plus42 (GPL-2.0) – die Open-Source-Lücke schliessen

- Free42 ist gratis im App Store erhältlich und vollständig quelloffen (GPL v2). [Q17]
- Gleiche Engine wie auf allen anderen Plattformen → plattformübergreifend identisches Verhalten, Programme portierbar.

### 5.3 Weitere Kandidaten

- **Calzy** (proprietär): Apple Design Award 2018, „Memory Area" für mehrere gespeicherte Werte; eher Design- als Funktions-Champion. [Q15]
- **HiPER auf iOS:** Verfügbarkeit/Funktionsparität unklar – vor Artikel verifizieren, nicht ungeprüft behaupten.

### 5.4 Empfehlungs-Hypothese iOS

PCalc als Hauptempfehlung (bestes Werkzeug, keine ernsthafte FOSS-Konkurrenz auf iOS), Free42/Plus42 als Open-Source-Empfehlung und RPN-Einstieg. Ehrlich benennen: iOS ist die schwächste Plattform für quelloffene Rechner.

---

## 6. Plattform macOS

### 6.1 Qalculate! (GPL-2.0+) – via Homebrew vollwertig

- Desktop-Versionen für Mac, Windows, Linux; Fokus auf Erweiterbarkeit und eigene Funktionen. [Q18]
- Details zu Features und Dozenal: siehe Abschnitt 9 (gilt plattformübergreifend).
- Allgemeinwissen, zu verifizieren: Installation über Homebrew (`brew install qalculate-gtk` bzw. Qt-Variante); CLI `qalc` funktioniert auf macOS identisch zu Linux.

### 6.2 PCalc (proprietär) – native Mac-Qualität

- Gleiche Stärken wie unter iOS; tiefe Anpassbarkeit von Tastenlayouts und „Magic Variables" zur Wiederverwendung von Ausdrücken. [Q19]

### 6.3 Weitere Kandidaten

- **Numi** (proprietär): Menüleisten-Rechner, versteht natürlichsprachliche Eingaben wie „100 km to miles" inklusive Währungen. [Q19] Nische: Schnellrechnungen, kein wissenschaftliches Arbeitsgerät.
- **Soulver** (proprietär): Allgemeinwissen, zu verifizieren – Notizblock-Rechner (Text und Zahlen gemischt), interessant für Kalkulationen mit Kontext, kein Scientific-Ersatz.
- **Free42/Plus42:** auch für macOS verfügbar (GPL v2). [Q10]

### 6.4 Empfehlungs-Hypothese macOS

Duell PCalc (bestes natives Werkzeug) vs. Qalculate! (mächtigste Engine + Open-Source-Bonus + Basis 12). Empfehlung im Artikel: beide installieren, Rollenteilung – PCalc für schnelle Tastenbedienung, Qalculate für exakte/symbolische Arbeit. Numi/Soulver als Spezialisten-Fussnote.

---

## 7. Plattform Windows

### 7.1 Qalculate! (GPL-2.0+) – klarer Sieger

- Offizielle Windows-Builds vorhanden (qalculate-qt). Details siehe Abschnitt 9. [Q18]
- Konkurrenzsituation auf Windows dünn: der historisch übliche Geheimtipp SpeedCrunch ist faktisch eingeschlafen (siehe 7.2).

### 7.2 SpeedCrunch (GPL) – ehemaliger Geheimtipp, Entwicklung ruht

- Letzte offizielle Version 0.12 stammt von 2018. [Q20]
- Das GitHub-Release-Verzeichnis weist als letztes getaggtes Release sogar nur 0.11 von 2014 aus. [Q21]
- Stärken bleiben: schnelle, tastaturzentrierte Eingabe mit Syntax-Highlighting und Autovervollständigung, hohe Präzision, Variablen wie in einer Tabellenkalkulation, portabel ohne Installation. [Q20, Q22]
- Artikel-Einordnung: nutzbar und stabil, aber ohne Zukunftsperspektive – Qalculate hat es funktional überholt.

### 7.3 Weitere Kandidaten

- **Free42/Plus42 für Windows** (GPL v2): verfügbar und aktuell gehalten (Version 3.3.x, 2026). [Q23]
- **Windows-Rechner (Microsoft):** Allgemeinwissen, zu verifizieren – seit 2019 quelloffen (MIT-Lizenz!) auf GitHub. Falls bestätigt, ist dies der seltene Fall einer permissiven Lizenz im Feld und damit für Code-Übernahme in Dozenal Calc rechtlich unkompliziertste Referenz (C++/C#); Programmer-Modus mit Bin/Okt/Hex, aber kein Basis 12, keine Programmierbarkeit, begrenzte Präzision.
- **HiPER Scientific Calculator für Windows:** Eine Windows-Variante wird auf Vergleichsportalen geführt (Freemium, proprietär, bis zu 100 Stellen Signifikand). [Q24] Funktionsumfang vs. Android-Version vor Artikel prüfen.

### 7.4 Empfehlungs-Hypothese Windows

Qalculate! als klare Hauptempfehlung. SpeedCrunch als ehrenvolle Erwähnung mit Pflege-Warnung. Windows-Rechner als MIT-lizenzierte Code-Referenz hervorheben (nach Verifikation), Free42/Plus42 für RPN-Nutzer.

---

## 8. Plattform Linux

### 8.1 Qalculate! / qalc (GPL-2.0+) – konkurrenzlos

- GUI-Varianten (GTK und Qt) plus CLI `qalc`; voller Funktionsumfang der libqalculate inklusive symbolischer Berechnungen, beliebiger Präzision, Unsicherheits-Propagation, Plotting. [Q25]
- `qalc` ist skriptbar (Ausdruck als Argument oder aus Datei) und damit in Shell-Workflows integrierbar. [Q25]
- Paketverfügbarkeit in allen grossen Distributionen (Beleg exemplarisch: openSUSE-Paket qalculate 4.8.1). [Q26]

### 8.2 Weitere Kandidaten

- **SpeedCrunch:** wie unter Windows – stabil, aber ruhend. [Q20, Q21]
- **KCalc** (GPL): wissenschaftliche und Programmierer-Modi, anpassbare Tastenlayouts unter KDE Plasma. [Q19] Solide Grundausstattung, kein CAS.
- **Free42/Plus42:** Linux-Builds verfügbar (GPL v2). [Q10]
- **GNOME Calculator:** Allgemeinwissen, zu verifizieren – GPL, Standardrechner mit Einheiten/Währungen, funktional unter Qalculate.

### 8.3 Empfehlungs-Hypothese Linux

Qalculate! ohne ernsthafte Konkurrenz; Artikel kann sich auf die Frage „GUI oder qalc im Terminal?" und Power-Workflows konzentrieren (Shell-Aliase, Pipes, eigene Funktionsbibliotheken).

---

## 9. Querschnittsthema: Dozenal, libqalculate und der Lernwert für Dozenal Calc

### 9.1 libqalculate als Funktions-Benchmark für Basis 12

Qalculate!/libqalculate ist der einzige identifizierte Kandidat mit nativer Duodezimal-Unterstützung – und zwar erstaunlich tief:

- Eingebaute Ausgabe-Konvertierungen `duo` / `duodecimal` (Anzeige als Duodezimalzahl) neben `bin`, `oct`, `hex`, `sexa` (Sexagesimal) und sogar bijektiver Basis 26. [Q25]
- Zusätzlich existiert eine separate Konvertierung `doz` / `dozenal`, die temporär spezielle Dozenal-Symbole aktiviert; die Symbole für die Ziffern 10 und 11 sind in den Einstellungen konfigurierbar (Standard: A und B). [Q27]
- Option `duodecimal symbols` / `duosyms` für Spezialsymbole der Ziffern 10 und 11 in Basis-12-Zahlen. [Q28]
- Ein- und Ausgabebasis sind getrennt und frei wählbar (`inbase`/`outbase`, numerisch bis hin zu exotischen Basen). [Q28]

**Konsequenz für die Artikel:** Die Testaufgabe „Stelle 1/3 exakt in Basis 12 dar" (erwartet: 0;4 bzw. 0.4₁₂, endlich statt periodisch) besteht nach Aktenlage nur Qalculate. Das ist zugleich das didaktische Kernargument für das Dozenalsystem und der USP-Nachweis für Dozenal Calc.

### 9.2 Design-Erkenntnisse aus dem Duodezimal-Issue (qalculate-gtk #135)

Das Issue dokumentiert reale Design-Probleme eines Basis-12-Rechners, die Dozenal Calc lösen muss: [Q29]

1. **Eingabe-Ambiguität:** Ziffern A/X kollidieren im Parser mit Einheitensymbolen und Variablen – Duodezimal braucht entweder ein Präfix (analog 0b/0o/0x; vorgeschlagen wurde 0d) oder einen dedizierten Eingabemodus.
2. **Ziffernsymbol-Pluralismus:** Mindestens drei Konventionen für die Ziffern zehn/elf existieren parallel – A/B, X/E (Pitman-Tradition) und die Unicode-Glyphen ↊/↋ (U+218A „Turned Digit Two", U+218B „Turned Digit Three"). [Q29, Q30] Empfehlung für Dozenal Calc: alle drei als synonyme Eingabe akzeptieren, Ausgabesymbol als Nutzereinstellung.
3. **Font-Problem:** Die Unicode-Glyphen ↊/↋ werden von vielen Fonts nicht dargestellt [Q29] – für eine Android-App heisst das: Font mit garantierter Glyphen-Abdeckung bündeln oder Fallback definieren.

### 9.3 Studierenswerte Codebasen (Priorisierung für Claude Code)

| Priorität | Projekt | Sprache | Lizenz | Was abschauen |
|-----------|---------|---------|--------|---------------|
| 1 | libqalculate | C++ | GPL-2.0+ | Radix-Konvertierung, exakte Brüche in fremden Basen, Trennung Ein-/Ausgabebasis, duosyms-Mechanik |
| 2 | qalculate-android | Kotlin + C++ (NDK/SWIG) | GPL-2.0 | Architekturmuster „Kotlin-UI über nativem Rechenkern" [Q6] |
| 3 | OpenCalc | Kotlin | GPL-3.0 | UI-Struktur, Eingabelogik, BigDecimal-Migration (v3.0.0) [Q9] |
| 4 | Free42/Plus42 | C++ | GPL-2.0 | Decimal-128-Arithmetik (Intel-Bibliothek), Tastenzustandsmaschine, Skin-System [Q10, Q12] |
| 5 | Windows-Rechner | C++/C# | MIT (zu verifizieren) | Einzige permissive Lizenz im Feld – Code-Übernahme rechtlich möglich |

**Lizenz-Warnung für alle Artikel und für Dozenal Calc:** Sämtliche Projekte ausser (mutmasslich) dem Windows-Rechner sind GPL. Studieren und Konzepte nachbauen: ja. Code kopieren in eine nicht-GPL-App: nein.

---

## 10. Standardisierte Testaufgaben für die Artikelserie

Jeder Artikel sollte dieselben Aufgaben durchrechnen und Tastendrücke/Zeit dokumentieren:

1. **Holzbau/Trigonometrie:** Versatztiefe t_V = h/4 bei Sparrenhöhe h = 180 mm, Dachneigung 37° 30′ 15″ → DMS-Eingabe, Sinus, Rückumwandlung in DMS.
2. **Exakte Arithmetik:** (3/7 + 2/5) · 7/29 → exakter Bruch erwartet, keine Dezimalnäherung.
3. **Symbolik:** √8 → erwartet 2√2 (besteht nur bei CAS-fähigen Kandidaten).
4. **Basis-Umrechnung Entwicklung:** 0xDEAD + 0b1011, Ausgabe dezimal und hexadezimal.
5. **Dozenal-Benchmark:** 1/3 in Basis 12 → erwartet 0;4 (endlich); zusätzlich 1/5 in Basis 12 → periodisch (Gegenprobe).
6. **Programmierbarkeit:** Formel mit zwei Parametern speichern (z.B. Stirnversatz-Einschnitttiefe), zweimal mit verschiedenen Werten abrufen.
7. **Präzision:** (1 + 1e-15) − 1 → deckt Gleitkomma-Artefakte auf; Vergleich Double vs. BigDecimal/Decimal128/beliebige Präzision.

## 11. Plattform Physisch (Hardware)

### 11.1 Casio fx-5800P – Preis-Leistungs-Sieger mit Importhürde

- Programmierbarer wissenschaftlicher Rechner im Taschenformat; Formelspeicher; seit 2006 am Markt (Allgemeinwissen, zu verifizieren: technische Daten gegen Casio-Datenblatt prüfen).
- **Verfügbarkeits-Befund:** In Europa offenbar nur per Import erhältlich. Neugeräte aus Südkorea ab ca. USD 86–90 inkl. Einfuhrgebühren [Q31, Q32]; europäische/indische Angebote teils massiv überteuert (£225) [Q33]. Auch Australien-Importe um EUR 70 dokumentiert. [Q34]
- Proprietäre Firmware → Lernwert null; Eingabelogik algebraisch mit natürlicher Anzeige (Casio-typisch).

### 11.2 SwissMicros DM42n – Premium-Option mit offenem Kern

- Flaggschiff-RPN-Rechner, Hommage an den HP-42S; gegenüber dem DM42 mehr RAM, schnellere CPU, USB-C; nutzt Free42 mit IEEE-754-2008-Quadruple-Precision (Decimal-128): 34 Dezimalstellen, Exponenten ±6144. Herstellerseite meldet aktuell „Out of stock". [Q35]
- Software-Stack: hauseigenes Betriebssystem DMCP plus Thomas Okkens quelloffenes Free42 als Rechenkern; SwissMicros ist faktisch der einzige verbliebene Anbieter neuer, authentischer RPN-Hardware. [Q36]
- Gehäuse aus CNC-gefrästem 316L-Edelstahl, lasergravierte Tasten; USB-C mit Mass-Storage-Modus für Programm-Transfer per Drag-and-drop. [Q37]
- Referenzpreise US-Händler: DM42 USD 379.95, DM32 USD 399.95, DM41X USD 424.95. [Q38] Da SwissMicros ein Schweizer Hersteller ist, für die Artikel Direktbezug ab Werk prüfen (CHF-Preise, Verfügbarkeit beobachten statt Reseller-Aufschläge zahlen).
- Einschränkungen: nur RPN; BASE-Funktionen ohne Basis 12 (Allgemeinwissen, zu verifizieren); Preisklasse weit über fx-5800P.
- Schwestermodell DM32 (HP-32SII-Nachbau) als kompaktere Programmier-Alternative auf gleicher Hardware-Basis. [Q36, Q38]

### 11.3 Ausgeschiedene Kandidaten

- **HP 35s:** 2007 eingeführt, 2021 eingestellt; Gebrauchtpreise inzwischen USD 300–500 – damit als praktische Empfehlung tot. [Q39] Historisch relevant als letzter klassischer HP-Scientific (RPN und algebraisch umschaltbar, NCEES-zugelassen). [Q40]
- **Grafikrechner (NumWorks, TI-Nspire, Casio fx-CG):** per Anforderungsprofil ausgeschlossen (Formfaktor).
- **Casio-Klassiker FX-502P/602P/603P:** nur noch Sammlermarkt, keine Empfehlung. [Q41]

### 11.4 Brücken-Strategie Software → Hardware

Empfohlener Artikel-Dreh: Vor einem DM42n-Kauf zwei Wochen Free42/Plus42 (gratis, alle Plattformen, identische Engine wie die DM42-Firmware [Q36]) als RPN-Probelauf nutzen. Erst wenn RPN überzeugt, Hardware kaufen. Plus42 mildert die RPN-Hürde durch algebraische Gleichungen nach HP-17B/27S-Vorbild. [Q11]

### 11.5 Empfehlungs-Hypothese Physisch

Zweigleisig: fx-5800P als rationale Empfehlung (~80–90 USD importiert, programmierbar, kompakt, vertraute Eingabe) – DM42n als Liebhaber-Empfehlung (Präzision, Baut wie ein Erbstück, offener Rechenkern, aber RPN-Pflicht und Premium-Preis, derzeit ausverkauft). Ergänzend prüfen: Casio fx-991CW (aktueller ClassWiz, nicht programmierbar, Allgemeinwissen, zu verifizieren) als Budget-Option für Nicht-Programmierer.

---

## 12. Gesamtübersicht (Spickzettel für die Artikelserie)

| Plattform | Hauptempfehlung | Open-Source-Empfehlung | Bemerkung |
|-----------|-----------------|------------------------|-----------|
| Android | HiPER Calc Pro | Qalculate! (einziger mit Basis 12) | OpenCalc als Kotlin-Lernobjekt; Qalculate-Installierbarkeit ab 09/2026 beobachten |
| iOS | PCalc | Free42 / Plus42 | Schwächste FOSS-Plattform |
| macOS | PCalc + Qalculate! (Rollenteilung) | Qalculate! | Numi/Soulver als Spezialisten |
| Windows | Qalculate! | Qalculate! | SpeedCrunch ruht seit 2018; Windows-Rechner ggf. MIT-lizenziert |
| Linux | Qalculate! / qalc | Qalculate! | Artikel-Fokus auf CLI-Workflows |
| Physisch | Casio fx-5800P (Import) | SwissMicros DM42n (Free42-Kern) | HP 35s eingestellt; RPN vorher per Plus42 testen |

Roter Faden der Serie: Qalculate!/libqalculate taucht auf vier von sechs Plattformen als Empfehlung auf und ist zugleich Dozenal-Benchmark und Lernressource – kann als verbindendes Element und Cliffhanger zwischen den Artikeln dienen.

## 13. Hinweise an Claude Code für die Artikelproduktion

1. **Ein Artikel pro Plattform** (6 Artikel), gemeinsame Struktur: Anforderungsprofil → Kandidaten → Testaufgaben-Resultate → Empfehlung → Open-Source-/Lernwert-Kasten.
2. **Faktendisziplin:** Nur Aussagen mit [Qn]-Beleg als Fakt formulieren. Alles mit Vermerk „Allgemeinwissen, zu verifizieren" vor Publikation prüfen oder als Einschätzung kennzeichnen. Preise und Verfügbarkeit (DM42n!, fx-5800P-Importe, Qalculate-Android ab 09/2026) sind volatil → vor jeder Veröffentlichung aktualisieren.
3. **Testaufgaben aus Abschnitt 10 real durchführen**, wo möglich (Software frei verfügbar); Resultate als eigene Messungen kennzeichnen. Hardware-Tests nur für tatsächlich vorhandene Geräte behaupten.
4. **Dozenal-Kasten** in jedem Artikel: Testaufgabe 5 als wiederkehrendes Element; im Android-Artikel zusätzlich Ausblick auf Dozenal Calc (transparent als eigenes Projekt deklarieren).
5. **Keine wörtlichen Zitate** aus Quellen übernehmen; paraphrasieren und verlinken.
6. **Zielsprache Deutsch (Hochdeutsch):** durchgängig ß (kein Schweizer ss) — einheitlich mit der gesamten App. Siehe CLAUDE.md, Abschnitt „Konventionen".

## 14. Offene Rechercheaufträge

- [ ] HiPER: Basis-Umrechnungs-Funktionen und Präzisionsdaten gegen offizielle Doku prüfen; iOS-/Windows-Versionen verifizieren.
- [ ] Windows-Rechner: MIT-Lizenz und Repo-Link (microsoft/calculator) bestätigen.
- [ ] fx-5800P: offizielles Casio-Datenblatt (Programmspeicher, Formelbibliothek) einarbeiten; Schweizer Bezugsquellen prüfen.
- [ ] DM42n: Wiederverfügbarkeit und CHF-Direktpreis bei swissmicros.com beobachten.
- [ ] Free42/Plus42: BASE-Wortbreiten und unterstützte Basen aus der Doku belegen.
- [ ] fx-991CW: Eckdaten und CH-Strassenpreis erheben (Budget-Empfehlung physisch).
- [ ] RealCalc, GNOME Calculator, Soulver: Pflege-Status klären oder aus den Artikeln streichen.

---

## 15. Quellenverzeichnis (abgerufen am 12.06.2026)

- [Q1] Google Play: HiPER Calc Pro – https://play.google.com/store/apps/details?id=cz.hipercalc.pro
- [Q2] Soft112: HiPER Calc Pro 11.3.3, Changelog – https://hiper-calc-pro.soft112.com/
- [Q3] GitHub: jherkenhoff/qalculate-android (README, Hinweis zu Google-Verifikation) – https://github.com/jherkenhoff/qalculate-android
- [Q4] F-Droid-Metadaten (GitLab): com.jherkenhoff.qalculate.yml (Lizenz GPL-2.0-only) – https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.jherkenhoff.qalculate.yml
- [Q5] F-Droid: Qalculate! – https://f-droid.org/packages/com.jherkenhoff.qalculate/
- [Q6] GitHub: qalculate-android README (Build mit NDK/SWIG, libqalculate-android) – https://github.com/jherkenhoff/qalculate-android/blob/main/README.md
- [Q7] Projektbeschreibung OpenCalc (Kotlin) – https://github.com/Darkempire78/OpenCalc
- [Q8] GitHub: OpenCalc Pull Requests / Repo-Statistik – https://github.com/Darkempire78/OpenCalc/pulls
- [Q9] GitHub: OpenCalc Releases, v3.0.0 (BigDecimal statt Double) – https://github.com/Darkempire78/OpenCalc/releases
- [Q10] Thomas Okken: Free42 (GPL v2, Version 3.3.12, Plattformen) – https://thomasokken.com/free42/
- [Q11] Thomas Okken: Plus42 (GPL v2, algebraische Erweiterungen) – https://thomasokken.com/plus42/
- [Q12] Codeberg: thomasokken (Repo-Aktivität Free42/Plus42, Januar 2026) – https://codeberg.org/thomasokken
- [Q13] F-Droid: Calculator++ (Version 2.3.3, Nov. 2023) – https://f-droid.org/packages/org.solovyev.android.calculator/
- [Q14] Best Overall Apps: Best Calculator App 2026 (PCalc-Einordnung, Preis) – https://bestoverallapps.com/categories/best-calculator-app-for-most-people/
- [Q15] iMore: Best calculator apps for iPad – https://www.imore.com/best-calculator-apps-ipad
- [Q16] appPicker: Best iPhone scientific calculator apps – https://www.apppicker.com/best-of/the-best-iphone-apps-for-scientific-calculators
- [Q17] Apple App Store: Free42 – https://apps.apple.com/us/app/free42/id337692629
- [Q18] AlternativeTo: Qalculate! (Plattformen Mac/Windows/Linux, Open Source) – https://alternativeto.net/software/qalculate-for-android
- [Q19] Worldmetrics: Best Calculator Software 2026 (PCalc Magic Variables, Numi, KCalc) – https://worldmetrics.org/best/calculator-software/
- [Q20] UpdateStar: SpeedCrunch 0.12 (Release 29.06.2018, Featureliste) – https://speedcrunch.updatestar.com/en
- [Q21] GitHub: speedcrunch/SpeedCrunch Releases (letztes Tag 0.11, 2014) – https://github.com/speedcrunch/SpeedCrunch/releases
- [Q22] lo4d: SpeedCrunch für Windows (GPL, portabel) – https://speedcrunch.en.lo4d.com/windows
- [Q23] lo4d: Free42 für Windows (Version 3.3.11, 2026) – https://free42.en.lo4d.com/windows
- [Q24] AlternativeTo: HiPER Scientific Calculator (Windows/Android, Freemium) – https://alternativeto.net/software/scientific-calculator/
- [Q25] Manpage qalc (Konvertierungen duo/duodecimal, inbase/outbase, Skripting) – https://qalculate.github.io/manual/qalc.html bzw. https://www.mankier.com/1/qalc
- [Q26] openSUSE PackageHub: qalculate 4.8.1 (Changelog inkl. Duodezimal-Symbole) – https://packagehub.suse.com/packages/qalculate/4_8_1-bp156_1_2/
- [Q27] GitHub: qalculate-gtk ChangeLog (doz/dozenal-Konvertierung, konfigurierbare Ziffernsymbole A/B) – https://github.com/Qalculate/qalculate-gtk/blob/master/ChangeLog
- [Q28] Manpage qalc: Option „duodecimal symbols/duosyms" – https://www.mankier.com/1/qalc
- [Q29] GitHub Issue: Duodecimal input (qalculate-gtk #135) – https://github.com/Qalculate/qalculate-gtk/issues/135
- [Q30] Wikipedia: Duodecimal (Unicode U+218A/U+218B, Pitman-Ziffern) – https://en.wikipedia.org/wiki/Duodecimal
- [Q31] eBay: fx-5800P neu aus Südkorea, USD 90 inkl. Einfuhr – https://www.ebay.de/itm/157117185904
- [Q32] eBay: fx-5800P neu aus Südkorea, USD 86.44 – https://www.ebay.de/itm/305860746046
- [Q33] eBay: fx-5800P aus Indien, £225 – https://www.ebay.de/itm/395768528058
- [Q34] eBay: fx-5800P aus Australien, ca. EUR 70 – https://www.ebay.de/itm/155154581053
- [Q35] SwissMicros Produktseite DM42n (Specs, „Out of stock") – https://www.swissmicros.com/product/model-dm42n
- [Q36] magazin Mehatronika: SwissMicros DM42n Review (DMCP + Free42, Modellfamilie) – https://magazinmehatronika.com/en/swissmicros-dm42n-review/
- [Q37] Amazon-Produktseite DM42n (316L-Stahl, USB-C Mass Storage) – https://www.amazon.com/SwissMicros-DM42-Calculator-High-Resolution-Mathematicians/dp/B07B4W13GW
- [Q38] CalculatorSource: SwissMicros-Preise (DM42/DM32/DM41X) – https://calculatorsource.com/collections/swissmicros
- [Q39] Wikipedia: HP 35s (eingestellt 2021, Gebrauchtpreise) – https://en.wikipedia.org/wiki/HP_35s
- [Q40] hpcalc.org: HP 35s Scientific Calculator – https://commerce.hpcalc.org/35s.php
- [Q41] Wikipedia: Casio FX-502P/FX-602P/FX-603P – https://en.wikipedia.org/wiki/Casio_FX-602P_series

*Hinweis zur Quellenqualität: [Q14], [Q19], [Q24] sind Sekundär-/Vergleichsportale – für die Artikel nach Möglichkeit durch Primärquellen (Herstellerseiten, App-Store-Einträge) ersetzen.*
