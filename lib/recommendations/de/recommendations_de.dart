// German source for the "Empfehlungen" chapters. part of
// ../recommendations.dart. Power-user framing (woodworking trig/DMS, base-12
// benchmark, open-source learning value, RPN, exact/symbolic arithmetic),
// evergreen (no prices/versions/dates/stock), honest about tradeoffs.
// Distilled from docs/taschenrechner-analyse.md.

part of '../recommendations.dart';

List<RecChapter> _recChaptersDe() => const [
  // ── Physisch ──────────────────────────────────────────────────────────
  RecChapter(
    'Physisch',
    intro:
        'Gesucht ist ein kompaktes Gerät fürs Taschenformat — kein klobiger '
        'Grafikrechner —, das entweder programmierbar ist oder einen offenen '
        'Rechenkern mitbringt. Grafikrechner (NumWorks, TI-Nspire, Casio '
        'fx-CG) bleiben wegen des Formfaktors außen vor; der klassische HP 35s '
        'ist eingestellt und gebraucht nur noch zu Liebhaberpreisen zu haben.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Proprietär · programmierbar wissenschaftlich',
        blurb:
            'Programmierbarer Taschenrechner mit Formelspeicher und natürlicher '
            'Anzeige. Für wiederkehrende Holzbau-Formeln (Versatztiefe, '
            'Kervengeometrie) lassen sich Programme mit Parametern ablegen.',
        pros: [
          'Kompakt und taschentauglich',
          'Programmierbar, mit Formelbibliothek',
          'Vertraute algebraische Eingabe, Grad/Minuten/Sekunden',
          'Sehr gutes Preis-Leistungs-Verhältnis',
        ],
        cons: [
          'In Europa meist nur per Import erhältlich',
          'Proprietär — kein Einblick in den Code',
          'Keine Basis-12-Ausgabe',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Free42-Kern (GPL-2.0) · RPN · Premium',
        blurb:
            'Flaggschiff-RPN-Rechner und Hommage an den HP-42S, im CNC-gefrästen '
            'Edelstahlgehäuse mit USB-C. Der Rechenkern ist Thomas Okkens '
            'quelloffenes Free42 mit Decimal-128-Arithmetik (34 Stellen).',
        pros: [
          'Offener Rechenkern (Free42, GPL) — Verhalten studierbar',
          'Identisch zur Desktop-/Mobil-Engine, Programme portierbar',
          'Extreme Präzision (34 Dezimalstellen)',
          'Verarbeitung wie ein Erbstück, USB-C-Massenspeicher',
        ],
        cons: [
          'Nur RPN — Eingewöhnung nötig',
          'Premium-Preis, zeitweise schwer erhältlich',
          'BASE-Funktionen ohne Basis 12',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Proprietär · wissenschaftlich (Budget)',
        blurb:
            'Aktueller, nicht programmierbarer ClassWiz — die günstige, überall '
            'erhältliche Option für alle, die keine Programmierbarkeit brauchen.',
        pros: [
          'Günstig und praktisch überall erhältlich',
          'Natürliche Anzeige, großer Funktionsumfang',
          'Kompakt, robust',
        ],
        cons: [
          'Nicht programmierbar',
          'Proprietär',
          'Spürbar langsamer bei komplexen Operationen',
          'Keine Basis 12',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'Fazit: Der fx-5800P ist die rationale Wahl — programmierbar, kompakt, '
        'vertraute Eingabe. Der DM42n ist das Liebhaberstück mit offenem Kern '
        '(dafür RPN-Pflicht und Premium-Preis). Tipp: RPN vorab gratis mit '
        'Free42/Plus42 testen, bevor man die Hardware kauft.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Fürs Telefon im Alltag. Hier die stärksten Apps, die regulär über '
        'Google Play laufen — die rein quelloffenen Optionen folgen im nächsten '
        'Kapitel (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Proprietär · CAS & Graphen',
        blurb:
            'Wissenschaftlicher Rechner mit symbolischer Algebra, Graphen, '
            'Gleichungen sowie Ableitungen und Integralen. Weit verbreitet, '
            'aktiv gepflegt, mit Layouts für verschiedene Bildschirmgrößen.',
        pros: [
          'Großer Funktionsumfang (CAS, Graphen, hohe Stellenzahl)',
          'Bruch- und periodische Darstellung',
          'Aktiv gepflegt, anpassbare Layouts',
        ],
        cons: [
          'Proprietär — kein Lernwert für eigene Projekte',
          'Voller Funktionsumfang kostenpflichtig',
          'Keine Basis-12-Ausgabe',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Vollständige Neuimplementierung des HP-42S ohne HP-Code. Plus42 '
            'erweitert sie um algebraische Gleichungen und einen Solver und '
            'senkt damit die RPN-Einstiegshürde deutlich.',
        pros: [
          'Quelloffen (GPL), Code als Lernmaterial',
          'Plattformübergreifend identisch — Programme portierbar',
          'Decimal-128-Präzision',
          'Plus42 mit algebraischen Gleichungen',
        ],
        cons: [
          'RPN-Logik (Plus42 mildert das)',
          'BASE-Funktionen ohne Basis 12',
          'Auf Mobil kostenpflichtig (Desktop gratis)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'Fazit: HiPER Calc Pro als stärkstes Alltagswerkzeug aus dem Play '
        'Store; Free42/Plus42 als quelloffene RPN-Schiene mit Decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Rein quelloffene Apps aus dem F-Droid-Store (oder direkt vom '
        'Entwickler): einsehbarer Code, keine Tracker — und damit zugleich Lern- '
        'und Referenzmaterial für eigene Projekte.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & Einheiten',
        blurb:
            'Die offizielle Android-Oberfläche der Qalculate!-Engine: eine '
            'Kotlin/Java-UI über der nativen C++-Bibliothek libqalculate. '
            'Symbolische Berechnungen, beliebige Präzision, Intervallarithmetik, '
            'Einheitenrechnung — die mächtigste Engine im Feld.',
        pros: [
          'Quelloffen (GPL), mächtigste Engine (CAS, Einheiten, Präzision)',
          'Rechnet auch in Basis 12 (duodezimal) — als einziger hier',
          'Lehrreiche Architektur: Kotlin-UI über nativem Rechenkern',
          'Keine Tracker',
        ],
        cons: [
          'Bezug vor allem über F-Droid oder Direkt-Build',
          'Projekt verweigert Googles Entwickler-Verifikation — reguläre '
              'Installierbarkeit künftig ungewiss (über F-Droid unkritisch)',
          'Höhere Einstiegshürde als ein simpler Rechner',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Schlanker, gepflegter Rechner, vollständig in Kotlin. Kein '
            'Funktions-Champion, aber der Code ist lesbar und überschaubar — '
            'bemerkenswert der dokumentierte Wechsel der internen Zahlen von '
            'Double auf BigDecimal, also genau die Präzisionsfrage, die auch '
            'ein Basis-12-Rechner lösen muss.',
        pros: [
          'Quelloffen (GPL-3.0), sauberer Kotlin-Code',
          'Ideales Lern- und Referenzobjekt',
          'Verlauf, schlichtes UI, keine Tracker',
        ],
        cons: [
          'Kein CAS, keine Programmierbarkeit',
          'Funktional kein Konkurrent zu HiPER/Qalculate',
          'Keine Basis 12',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'Fazit: Qalculate! ist die mächtigste quelloffene Wahl — und der '
        'einzige mit Basis-12-Ausgabe. OpenCalc ist der „Blick in den '
        'Maschinenraum" für Entwickler.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS ist die schwächste Plattform für quelloffene Rechner — dafür gibt '
        'es hier ein herausragendes proprietäres Werkzeug. Ehrlich benannt: '
        'echte FOSS-Konkurrenz fehlt.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Proprietär · Referenz-Werkzeug',
        blurb:
            'Gilt seit den 1990ern als Referenz auf Apple-Plattformen: '
            'umfangreiche Umrechnungen, erstklassige RPN-Eingabe, tiefe '
            'Anpassbarkeit (Themes, Tastenlayouts, Papierstreifen). Läuft auf '
            'iPhone, iPad, Apple Watch und Apple TV.',
        pros: [
          'Erstklassiges, sehr ausgereiftes Werkzeug',
          'Optionaler RPN-Modus, editierbare Historie',
          'Viele Umrechnungen und Konstanten',
          'Kostenlose Lite-Variante zum Einstieg',
        ],
        cons: [
          'Proprietär — kein Lernwert',
          'Kostenpflichtig',
          'Funktionsfülle kann anfangs erschlagen',
          'Keine Basis 12',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Schließt die Open-Source-Lücke auf iOS: Free42 ist gratis im App '
            'Store und nutzt dieselbe Engine wie auf allen anderen Plattformen.',
        pros: [
          'Quelloffen (GPL), Free42 gratis',
          'Plattformübergreifend identisch',
          'Decimal-128-Präzision',
          'Plus42 mit algebraischen Gleichungen',
        ],
        cons: [
          'RPN-Logik (Plus42 mildert das)',
          'Keine Basis 12',
          'Plus42 kostenpflichtig',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Fazit: PCalc als Hauptwerkzeug (ohne ernsthafte FOSS-Konkurrenz auf '
        'iOS), Free42/Plus42 als quelloffene RPN-Empfehlung und sauberer '
        'RPN-Einstieg.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Auf dem Mac trifft das beste native Werkzeug auf die mächtigste offene '
        'Engine — eine Rollenteilung lohnt sich: schnelle Tastenbedienung hier, '
        'exakte und symbolische Arbeit dort.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · mächtigste Engine',
        blurb:
            'Das Desktop-Kraftpaket (auch für Windows und Linux): symbolisch, '
            'beliebige Präzision, Einheitenrechnung, Plotting. Per Homebrew '
            'installierbar; das CLI „qalc" verhält sich identisch zu Linux.',
        pros: [
          'Quelloffen, mächtigste Engine (CAS, Einheiten, exakte Brüche)',
          'Rechnet auch in Basis 12 (duodezimal)',
          'Erweiterbar um eigene Funktionen, CLI skriptbar',
        ],
        cons: [
          'Weniger „mac-nativ" poliert als PCalc',
          'Die Mächtigkeit will eingeübt sein',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Proprietär · native Mac-Qualität',
        blurb:
            'Dieselben Stärken wie auf iOS, in einer polierten Mac-App: tiefe '
            'Anpassbarkeit und „Magic Variables" zur Wiederverwendung von '
            'Ausdrücken, dazu Handoff zwischen den Apple-Geräten.',
        pros: [
          'Native, ausgereifte Mac-App',
          'RPN, Papierstreifen, viele Umrechnungen',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Proprietär, kostenpflichtig',
          'Keine Basis 12',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Auch für macOS — auf dem Desktop gratis. Dieselbe Engine wie der '
            'Rechenkern der DM42-Hardware.',
        pros: [
          'Quelloffen (GPL), auf dem Desktop gratis',
          'Decimal-128-Präzision',
          'Plattformübergreifend identisch',
        ],
        cons: [
          'RPN-Logik',
          'Keine Basis 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Fazit: PCalc für die schnelle Tastenbedienung, Qalculate! für exakte '
        'und symbolische Arbeit (und Basis 12). Als Spezialisten am Rande: Numi '
        '(natürlichsprachliche Eingabe) und Soulver (Notizblock-Rechnen).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Auf Linux ist die Lage klar — eine Engine dominiert, und die '
        'eigentliche Frage lautet „GUI oder Terminal?". Für reine '
        'Standardrechner gibt es daneben die Desktop-Klassiker.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · konkurrenzlos',
        blurb:
            'GTK- und Qt-Oberfläche plus das CLI „qalc". Voller '
            'libqalculate-Umfang: symbolisch, beliebige Präzision, '
            'Unsicherheits-Propagation, Plotting. „qalc" ist skriptbar (Ausdruck '
            'als Argument oder aus einer Datei) und in jeder großen Distribution '
            'paketiert.',
        pros: [
          'Quelloffen, in jeder Distribution verfügbar',
          'Mächtigste Engine, rechnet auch in Basis 12',
          'CLI skriptbar — Aliase, Pipes, eigene Funktionsbibliotheken',
        ],
        cons: [
          'Die Funktionsfülle braucht Einarbeitung',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · KDE-Standard',
        blurb:
            'Der KDE-Rechner mit wissenschaftlichem und Programmierer-Modus '
            'sowie anpassbaren Tastenlayouts — eine solide Grundausstattung.',
        pros: [
          'Quelloffen, leichtgewichtig',
          'Programmierer-Modus (Bin/Okt/Hex)',
          'Gut in KDE Plasma integriert',
        ],
        cons: [
          'Kein CAS',
          'Keine Basis 12',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · GNOME-Standard',
        blurb:
            'Der GNOME-Standardrechner mit Einheiten und Währungen sowie '
            'erweiterten, finanzmathematischen und Programmier-Modi. Funktional '
            'unter Qalculate, aber rundum solide.',
        pros: [
          'Quelloffen, einfach zu bedienen',
          'Einheiten und Währungen eingebaut',
        ],
        cons: [
          'Weniger mächtig als Qalculate',
          'Keine Basis 12',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · ruhende Entwicklung',
        blurb:
            'Der ehemalige Geheimtipp: schnelle, tastaturzentrierte Eingabe mit '
            'Syntax-Hervorhebung und Autovervollständigung, hohe Präzision, '
            'Variablen wie in einer Tabellenkalkulation. Stabil — aber seit '
            'Jahren ohne neue Version.',
        pros: [
          'Quelloffen, sehr schnelle Tastatureingabe',
          'Hohe Präzision, portabel ohne Installation',
        ],
        cons: [
          'Entwicklung ruht — keine Zukunftsperspektive',
          'Von Qalculate funktional überholt',
          'Keine Basis 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'Fazit: Qalculate!/qalc ohne ernsthafte Konkurrenz — die Wahl ist '
        'eigentlich nur GUI gegen Terminal-Workflows. KCalc und GNOME '
        'Calculator als leichte Standardrechner, SpeedCrunch nutzbar, aber ohne '
        'Zukunft.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Auf Windows ist die Konkurrenz dünn — eine Engine sticht heraus, dazu '
        'kommt der seltene Fall einer permissiv lizenzierten Referenz, deren '
        'Code man (anders als bei GPL) rechtlich unkompliziert nachnutzen darf.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · klarer Sieger',
        blurb:
            'Offizielle Windows-Builds (qalculate-qt) mit derselben mächtigen '
            'Engine wie auf Mac und Linux: symbolisch, beliebige Präzision, '
            'Einheiten, Plotting.',
        pros: [
          'Quelloffen, mächtigste Engine',
          'Rechnet auch in Basis 12 (duodezimal)',
          'Erweiterbar um eigene Funktionen',
        ],
        cons: [
          'Weniger „Windows-nativ" poliert',
          'Die Mächtigkeit will eingeübt sein',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Windows-Rechner (Microsoft)',
        tag: 'MIT · vorinstalliert',
        blurb:
            'Seit 2019 quelloffen auf GitHub — und zwar unter der MIT-Lizenz. '
            'Das ist der seltene Fall einer permissiven Lizenz im Feld und '
            'damit die rechtlich unkomplizierteste Code-Referenz (C++/C#). '
            'Bietet einen Programmierer-Modus mit Bin/Okt/Hex.',
        pros: [
          'Quelloffen unter MIT — Code-Übernahme rechtlich unkompliziert',
          'Vorinstalliert und vertraut',
          'Programmierer-Modus (Bin/Okt/Hex)',
        ],
        cons: [
          'Kein CAS, keine Programmierbarkeit',
          'Begrenzte Präzision',
          'Keine Basis 12',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · ruhende Entwicklung',
        blurb:
            'Schnelle, tastaturzentrierte Eingabe mit Syntax-Hervorhebung und '
            'Autovervollständigung, hohe Präzision, portabel ohne Installation '
            '— aber seit Jahren ohne neue Version.',
        pros: [
          'Quelloffen, sehr schnelle Tastatureingabe',
          'Hohe Präzision, portabel',
        ],
        cons: [
          'Entwicklung ruht — keine Zukunftsperspektive',
          'Von Qalculate funktional überholt',
          'Keine Basis 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Für RPN-Fans: auf dem Desktop gratis, dieselbe Engine wie der '
            'Rechenkern der DM42-Hardware.',
        pros: [
          'Quelloffen (GPL), auf dem Desktop gratis',
          'Decimal-128-Präzision',
          'Plattformübergreifend identisch',
        ],
        cons: [
          'RPN-Logik (Plus42 mildert das)',
          'Keine Basis 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Fazit: Qalculate! als klare Wahl. Den Windows-Rechner als '
        'MIT-lizenzierte Code-Referenz im Hinterkopf behalten, SpeedCrunch nur '
        'mit Pflege-Warnung, Free42/Plus42 für RPN-Fans.',
  ),
];
