// Traduzione italiana dei capitoli «Consigli». part of
// ../recommendations.dart. Registro da power-user tecnico esperto;
// nomi di prodotto, URL e termini tecnici (RPN, GPL, MIT, CAS, base dodici,
// decimal-128, bin/ott/hex) invariati.

part of '../recommendations.dart';

List<RecChapter> _recChaptersIt() => const [
  // ── Fisico ────────────────────────────────────────────────────────────
  RecChapter(
    'Fisico',
    intro:
        'L’obiettivo è un dispositivo compatto da tasca — non una pesante '
        'calcolatrice grafica — che sia programmabile oppure dotato di un nucleo '
        'di calcolo aperto. Le calcolatrici grafiche (NumWorks, TI-Nspire, Casio '
        'fx-CG) sono escluse per via del fattore di forma; il classico HP 35s è '
        'fuori produzione e reperibile usato soltanto a prezzi da collezionista.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Proprietario · scientifico programmabile',
        blurb:
            'Calcolatrice tascabile programmabile con archivio di formule e '
            'visualizzazione naturale. Per le formule ricorrenti nella lavorazione '
            'del legno (profondità di intaglio, geometria delle giunzioni) è '
            'possibile memorizzare programmi con parametri.',
        pros: [
          'Compatta e tascabile',
          'Programmabile, con libreria di formule',
          'Inserimento algebrico familiare, gradi/minuti/secondi',
          'Ottimo rapporto qualità-prezzo',
        ],
        cons: [
          'In Europa di solito disponibile solo tramite importazione',
          'Proprietaria — nessuna possibilità di esaminare il codice',
          'Nessun output in base dodici',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Nucleo Free42 (GPL-2.0) · RPN · Premium',
        blurb:
            'Calcolatrice RPN di punta e omaggio all’HP-42S, in un corpo fresato '
            'a CNC in acciaio inossidabile con USB-C. Il nucleo di calcolo è '
            'il Free42 open-source di Thomas Okken con aritmetica decimal-128 '
            '(34 cifre).',
        pros: [
          'Nucleo di calcolo aperto (Free42, GPL) — comportamento studiabile',
          'Identico al motore desktop/mobile, programmi portabili',
          'Precisione estrema (34 cifre decimali)',
          'Fattura da cimelio, archiviazione di massa USB-C',
        ],
        cons: [
          'Solo RPN — richiede adattamento',
          'Prezzo premium, a volte difficile da trovare',
          'Funzioni BASE senza base dodici',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Proprietario · scientifico (budget)',
        blurb:
            'L’attuale ClassWiz non programmabile — l’opzione economica e '
            'reperibile ovunque per chi non ha bisogno di programmabilità.',
        pros: [
          'Economica e disponibile praticamente ovunque',
          'Visualizzazione naturale, ampio set di funzioni',
          'Compatta e robusta',
        ],
        cons: [
          'Non programmabile',
          'Proprietaria',
          'Notevolmente più lenta nelle operazioni complesse',
          'Nessuna base dodici',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'In sintesi: l’fx-5800P è la scelta razionale — programmabile, compatta, '
        'inserimento familiare. Il DM42n è il pezzo da appassionato con nucleo '
        'aperto (ma solo RPN e prezzo premium). Consiglio: provare gratis l’RPN '
        'con Free42/Plus42 prima di acquistare l’hardware.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Per l’uso quotidiano sul telefono. Ecco le app più valide disponibili '
        'regolarmente su Google Play — le opzioni puramente open-source seguono '
        'nel capitolo successivo (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Proprietario · CAS e grafici',
        blurb:
            'Calcolatrice scientifica con algebra simbolica, grafici, equazioni, '
            'derivate e integrali. Molto diffusa, attivamente mantenuta, con '
            'layout per diverse dimensioni di schermo.',
        pros: [
          'Ampio set di funzioni (CAS, grafici, elevato numero di cifre)',
          'Visualizzazione di frazioni e decimali periodici',
          'Attivamente mantenuta, layout personalizzabili',
        ],
        cons: [
          'Proprietaria — nessun valore didattico per i propri progetti',
          'Funzionalità complete a pagamento',
          'Nessun output in base dodici',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Reimplementazione completa dell’HP-42S senza codice HP. Plus42 la '
            'estende con equazioni algebriche e un risolutore, abbassando '
            'sensibilmente la soglia d’ingresso all’RPN.',
        pros: [
          'Open source (GPL), codice come materiale didattico',
          'Identico su tutte le piattaforme — programmi portabili',
          'Precisione decimal-128',
          'Plus42 con equazioni algebriche',
        ],
        cons: [
          'Logica RPN (Plus42 attenua l’impatto)',
          'Funzioni BASE senza base dodici',
          'A pagamento su mobile (gratuito su desktop)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'In sintesi: HiPER Calc Pro come strumento quotidiano più potente dal '
        'Play Store; Free42/Plus42 come soluzione RPN open-source con '
        'decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'App puramente open-source dallo store F-Droid (o direttamente dallo '
        'sviluppatore): codice ispezionabile, nessun tracker — e quindi materiale '
        'didattico e di riferimento per i propri progetti.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS e unità',
        blurb:
            'L’interfaccia Android ufficiale del motore Qalculate!: una UI '
            'Kotlin/Java sopra la libreria nativa C++ libqalculate. Calcolo '
            'simbolico, precisione arbitraria, aritmetica degli intervalli, '
            'conversione di unità — il motore più potente nel settore.',
        pros: [
          'Open source (GPL), motore più potente (CAS, unità, precisione)',
          'Calcola anche in base dodici (duodecimale) — l’unico qui',
          'Architettura istruttiva: UI Kotlin su nucleo nativo',
          'Nessun tracker',
        ],
        cons: [
          'Ottenibile principalmente tramite F-Droid o build diretta',
          'Il progetto rifiuta la verifica sviluppatore di Google — la '
              'installabilità futura tramite canali ordinari è incerta '
              '(non è un problema via F-Droid)',
          'Soglia d’ingresso più alta rispetto a una calcolatrice semplice',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Calcolatrice snella e ben mantenuta, scritta interamente in Kotlin. '
            'Non è un campione di funzionalità, ma il codice è leggibile e '
            'compatto — notevole il documentato passaggio dei numeri interni da '
            'Double a BigDecimal, esattamente la questione di precisione che '
            'anche una calcolatrice in base dodici deve risolvere.',
        pros: [
          'Open source (GPL-3.0), codice Kotlin pulito',
          'Oggetto di studio e riferimento ideale',
          'Cronologia, UI essenziale, nessun tracker',
        ],
        cons: [
          'Nessun CAS, nessuna programmabilità',
          'Funzionalmente non è un rivale di HiPER/Qalculate',
          'Nessuna base dodici',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'In sintesi: Qalculate! è la scelta open-source più potente — e l’unica '
        'con output in base dodici. OpenCalc è lo «sguardo sotto il cofano» '
        'per gli sviluppatori.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS è la piattaforma più debole per le calcolatrici open-source — ma '
        'offre uno strumento proprietario di prim’ordine. Onestamente: una vera '
        'concorrenza FOSS è assente.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Proprietario · strumento di riferimento',
        blurb:
            'Considerata il riferimento sulle piattaforme Apple dagli anni ’90: '
            'conversioni estese, inserimento RPN di prim’ordine, profonda '
            'personalizzabilità (temi, layout dei tasti, nastro di carta). '
            'Funziona su iPhone, iPad, Apple Watch e Apple TV.',
        pros: [
          'Strumento di prim’ordine, molto maturo',
          'Modalità RPN opzionale, cronologia modificabile',
          'Molte conversioni e costanti',
          'Versione Lite gratuita per iniziare',
        ],
        cons: [
          'Proprietaria — nessun valore didattico',
          'A pagamento',
          'La ricchezza di funzioni può disorientare all’inizio',
          'Nessuna base dodici',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Colma il vuoto open-source su iOS: Free42 è gratuito sull’App '
            'Store e usa lo stesso motore di tutte le altre piattaforme.',
        pros: [
          'Open source (GPL), Free42 gratuito',
          'Identico su tutte le piattaforme',
          'Precisione decimal-128',
          'Plus42 con equazioni algebriche',
        ],
        cons: [
          'Logica RPN (Plus42 attenua l’impatto)',
          'Nessuna base dodici',
          'Plus42 a pagamento',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'In sintesi: PCalc come strumento principale (senza seria concorrenza '
        'FOSS su iOS), Free42/Plus42 come raccomandazione open-source e '
        'introduzione pulita all’RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Sul Mac il miglior strumento nativo incontra il motore aperto più '
        'potente — una divisione dei ruoli conviene: uso rapido da tastiera qui, '
        'lavoro esatto e simbolico là.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · motore più potente',
        blurb:
            'Il concentrato di potenza desktop (anche per Windows e Linux): '
            'simbolico, precisione arbitraria, conversione di unità, plotting. '
            'Installabile via Homebrew; il CLI «qalc» si comporta in modo '
            'identico a Linux.',
        pros: [
          'Open source, motore più potente (CAS, unità, frazioni esatte)',
          'Calcola anche in base dodici (duodecimale)',
          'Estendibile con funzioni proprie, CLI scriptabile',
        ],
        cons: [
          'Meno rifinito in stile «nativo Mac» rispetto a PCalc',
          'La potenza richiede un po’ di apprendimento',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Proprietario · qualità Mac nativa',
        blurb:
            'Gli stessi punti di forza che su iOS, in un’app Mac rifinita: '
            'profonda personalizzabilità e «Magic Variables» per riutilizzare '
            'le espressioni, più Handoff tra i dispositivi Apple.',
        pros: [
          'App Mac nativa e matura',
          'RPN, nastro di carta, molte conversioni',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Proprietaria, a pagamento',
          'Nessuna base dodici',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Disponibile anche per macOS — gratuito su desktop. Lo stesso '
            'nucleo di calcolo dell’hardware DM42.',
        pros: [
          'Open source (GPL), gratuito su desktop',
          'Precisione decimal-128',
          'Identico su tutte le piattaforme',
        ],
        cons: [
          'Logica RPN',
          'Nessuna base dodici',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'In sintesi: PCalc per l’uso rapido da tastiera, Qalculate! per il '
        'lavoro esatto e simbolico (e la base dodici). Come specialisti di '
        'nicchia: Numi (inserimento in linguaggio naturale) e Soulver '
        '(calcolo stile blocco note).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Su Linux la situazione è chiara — un motore domina, e la vera domanda '
        'è «GUI o terminale?». Per calcolatrici standard pure ci sono anche '
        'i classici del desktop.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · senza rivali',
        blurb:
            'Interfacce GTK e Qt più il CLI «qalc». L’intero set di funzionalità '
            'di libqalculate: simbolico, precisione arbitraria, propagazione '
            'dell’incertezza, plotting. «qalc» è scriptabile (un’espressione '
            'come argomento o da file) e disponibile nei pacchetti di ogni '
            'distribuzione principale.',
        pros: [
          'Open source, disponibile in ogni distribuzione',
          'Motore più potente, calcola anche in base dodici',
          'CLI scriptabile — alias, pipe, librerie di funzioni proprie',
        ],
        cons: [
          'La ricchezza di funzioni richiede un po’ di apprendimento',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · standard KDE',
        blurb:
            'La calcolatrice KDE con modalità scientifica e programmatore e '
            'layout dei tasti personalizzabili — una solida dotazione di base.',
        pros: [
          'Open source, leggera',
          'Modalità programmatore (bin/ott/hex)',
          'Ben integrata in KDE Plasma',
        ],
        cons: [
          'Nessun CAS',
          'Nessuna base dodici',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · standard GNOME',
        blurb:
            'La calcolatrice standard di GNOME con unità e valute, più modalità '
            'avanzata, finanziaria e programmatore. Funzionalmente al di sotto '
            'di Qalculate, ma solidissima.',
        pros: [
          'Open source, facile da usare',
          'Unità e valute integrate',
        ],
        cons: [
          'Meno potente di Qalculate',
          'Nessuna base dodici',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · sviluppo inattivo',
        blurb:
            'Il vecchio tip da insider: inserimento rapido centrato sulla '
            'tastiera con evidenziazione della sintassi e completamento '
            'automatico, alta precisione, variabili come in un foglio di '
            'calcolo. Stabile — ma senza una nuova versione da anni.',
        pros: [
          'Open source, inserimento da tastiera molto rapido',
          'Alta precisione, portabile senza installazione',
        ],
        cons: [
          'Sviluppo inattivo — nessuna prospettiva futura',
          'Funzionalmente superato da Qalculate',
          'Nessuna base dodici',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'In sintesi: Qalculate!/qalc senza seria concorrenza — la scelta è '
        'davvero solo GUI contro flussi di lavoro da terminale. KCalc e '
        'GNOME Calculator come calcolatrici standard leggere; SpeedCrunch '
        'utilizzabile, ma senza futuro.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Su Windows la concorrenza è scarsa — un motore spicca, affiancato '
        'dal raro caso di un riferimento con licenza permissiva il cui codice '
        'è legalmente riutilizzabile senza complicazioni (a differenza della GPL).',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · vincitore indiscusso',
        blurb:
            'Build ufficiali per Windows (qalculate-qt) con lo stesso potente '
            'motore di Mac e Linux: simbolico, precisione arbitraria, unità, '
            'plotting.',
        pros: [
          'Open source, motore più potente',
          'Calcola anche in base dodici (duodecimale)',
          'Estendibile con funzioni proprie',
        ],
        cons: [
          'Meno rifinito in stile «nativo Windows»',
          'La potenza richiede un po’ di apprendimento',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Calcolatrice di Windows (Microsoft)',
        tag: 'MIT · preinstallata',
        blurb:
            'Open source su GitHub dal 2019 — e sotto licenza MIT. È il raro '
            'caso di una licenza permissiva nel settore, quindi il riferimento '
            'di codice (C++/C#) legalmente più semplice da riutilizzare. '
            'Offre una modalità programmatore con bin/ott/hex.',
        pros: [
          'Open source sotto MIT — riutilizzo del codice senza complicazioni legali',
          'Preinstallata e familiare',
          'Modalità programmatore (bin/ott/hex)',
        ],
        cons: [
          'Nessun CAS, nessuna programmabilità',
          'Precisione limitata',
          'Nessuna base dodici',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · sviluppo inattivo',
        blurb:
            'Inserimento rapido centrato sulla tastiera con evidenziazione della '
            'sintassi e completamento automatico, alta precisione, portabile '
            'senza installazione — ma senza una nuova versione da anni.',
        pros: [
          'Open source, inserimento da tastiera molto rapido',
          'Alta precisione, portabile',
        ],
        cons: [
          'Sviluppo inattivo — nessuna prospettiva futura',
          'Funzionalmente superato da Qalculate',
          'Nessuna base dodici',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Per gli appassionati di RPN: gratuito su desktop, lo stesso '
            'nucleo di calcolo dell’hardware DM42.',
        pros: [
          'Open source (GPL), gratuito su desktop',
          'Precisione decimal-128',
          'Identico su tutte le piattaforme',
        ],
        cons: [
          'Logica RPN (Plus42 attenua l’impatto)',
          'Nessuna base dodici',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'In sintesi: Qalculate! come scelta indiscussa. Tenere a mente la '
        'Calcolatrice di Windows come riferimento di codice con licenza MIT, '
        'SpeedCrunch solo con avvertenza di manutenzione, Free42/Plus42 per '
        'gli appassionati di RPN.',
  ),
];
