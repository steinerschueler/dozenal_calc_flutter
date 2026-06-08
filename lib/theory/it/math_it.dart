//  Prosa italiana per i capitoli "Matematica dozenale". part of
// ../math_theory.dart. Frasi semplici e chiare (più facili da tradurre) per
// argomenti complessi. Il capitolo sui meccanismi interni dell'app è scritto
// a partire dal sorgente (logic/rational.dart, logic/expression.dart,
// state.dart); i capitoli di matematica/storia sono distillati da
// docs/research/math_*.md.
//
// Convenzione d'ordine: prima vengono i capitoli di matematica e storia; il
// capitolo sui meccanismi interni ("Come calcola questa calcolatrice") resta
// per ultimo.

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersIt() => const [
  ProseChapter('Divisori, frazioni e periodi', [
    ProseSection(
      'Perché il dodici è così divisibile',
      'In base dodici scriviamo dodici cifre: da 0 a 9, più A per dieci '
          'e B per undici. «10» significa quindi qui dodici.\n\n'
          'Il dodici si divide in modo netto per un numero particolarmente '
          'grande di numeri: 1, 2, 3, 4, 6 e 12. Il dieci, invece, solo per '
          '1, 2, 5 e 10. Il motivo sta nella struttura dei numeri: dieci è '
          'due per cinque, dodici è due per due per tre. Il dodici investe i '
          'suoi fattori nei divisori piccoli e frequenti 2 e 3 — ed è così '
          'divisibile per 3 e per 4, cosa in cui il dieci fallisce. La '
          'grandezza non conta: il 16 è più grande, ma divisibile solo per '
          'potenze di due.',
    ),
    ProseSection(
      'Quali frazioni vengono nette',
      'Se una frazione dà un numero con la virgola finito dipende da una '
          'regola semplice: viene netta esattamente quando il denominatore è '
          'composto solo dai fattori primi della base.\n\n'
          'Poiché nel dodici è presente il tre, in base dodici molte frazioni '
          'di uso quotidiano vengono nette: un mezzo = 0,6; un terzo = 0,4; '
          'un quarto = 0,3; un sesto = 0,2; un nono = 0,14; un dodicesimo = '
          '0,1. In base dieci, invece, terzi, sesti e noni vanno all\'infinito. '
          'Il prezzo del dodici: le frazioni con cinque al denominatore '
          'diventano storte — un quinto in base dodici è 0,2497, con '
          'ripetizione.',
    ),
    ProseSection(
      'Quando si ripete',
      'Se una frazione non viene netta, a partire da una certa posizione si '
          'ripete un gruppo fisso di cifre — il periodo. Quanto è lungo segue '
          'una regola chiara della teoria dei numeri e dipende dalla base e '
          'dal denominatore.\n\n'
          'Alcune cose sono altrettanto scomode in entrambi i mondi: un '
          'settimo ha sia in base dieci (0,142857) sia in base dodici '
          '(0,186A35) un periodo di sei cifre. Nel complesso, tra i piccoli '
          'denominatori, in base dodici ci sono un po\' meno frazioni '
          'periodiche che in base dieci — in compenso i periodi, quando '
          'compaiono, possono risultare un po\' più lunghi.',
    ),
    ProseSection(
      'La divisibilità a colpo d\'occhio',
      'Nella pratica la forza del dodici si rivela nelle regole di '
          'divisibilità. Se un numero è divisibile per 2, 3, 4 o 6, in base '
          'dodici lo svela già l\'ultima cifra. In base dieci questo vale solo '
          'per 2, 5 e 10.\n\n'
          'Per l\'undici (B) esiste una regola sulla somma delle cifre — '
          'proprio come la nota prova del nove in base dieci, perché il dodici '
          'sta uno sopra l\'undici. Solo il sette non ha, come del resto anche '
          'in base dieci, un test semplice.',
    ),
    ProseSection(
      'Nessuna base vince ovunque',
      'Il dodici ha dunque un vero vantaggio nel dividere in terzi e quarti — '
          'e un vero svantaggio nel dividere in quinti, importante per le '
          'percentuali e per il denaro. Scambia l\'uno con l\'altro.\n\n'
          'Più divisori non sono nemmeno indefinitamente meglio: altrimenti '
          'sarebbe in vantaggio il sessanta, divisibile per ancora più numeri '
          '— ma servirebbero sessanta cifre e una tavola pitagorica enorme. '
          'Le società dozenali vedono nel dodici un buon compromesso: solo '
          'due simboli in più, una piccola tavola pitagorica, ma i divisori '
          '2, 3 e 4. È la loro valutazione, non una dimostrazione.',
    ),
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('Le basi numeriche a confronto', [
    ProseSection(
      'Che cos\'è una base',
      'Un sistema posizionale dà a ogni cifra un valore secondo la sua '
          'posizione. La base dice quante cifre ci sono e di quale fattore '
          'cresce ogni posizione. La base dieci usa dieci cifre, la base '
          'dodici dodici (0–9, A, B), la base due solo due (0 e 1).\n\n'
          'Lo stesso numero appare diverso a seconda della base, ma significa '
          'la stessa cosa. Una base piccola richiede molte posizioni (il '
          'binario diventa molto lungo), una base grande molti simboli '
          'diversi.',
    ),
    ProseSection(
      'Sei basi in breve',
      '• Base 2 (binaria): il linguaggio dei computer — un interruttore è '
          'acceso o spento.\n'
          '• Base 8 (ottale): oggi una nicchia, ad esempio per i permessi sui '
          'file in Unix.\n'
          '• Base 10 (decimale): la nostra quotidianità e il sistema '
          'metrico.\n'
          '• Base 12 (dozenale): la dozzina, l\'orologio e il pollice — e la '
          'causa del movimento dozenale.\n'
          '• Base 16 (esadecimale): notazione compatta per i dati dei '
          'computer.\n'
          '• Base 60 (sessagesimale): tempo e angoli, un\'eredità di Babilonia.',
    ),
    ProseSection(
      'Convertire tra le basi',
      'I numeri passano da una base all\'altra con procedimenti fissi. La '
          'parte intera si divide ripetutamente per la base di destinazione e '
          'si leggono i resti dal basso verso l\'alto. La parte dopo la virgola '
          'si moltiplica ripetutamente per la base di destinazione e si '
          'leggono le parti intere dall\'alto verso il basso.\n\n'
          'Esempio: 0,5 diventa 0,6 in base dodici; 0,125 diventa 0,16. Tra '
          'basi imparentate è ancora più facile: poiché sedici è una potenza '
          'di due, una cifra esadecimale corrisponde esattamente a quattro '
          'posizioni binarie — basta raggruppare.',
    ),
    ProseSection(
      'Dove ogni base è di casa',
      'I computer calcolano in binario, perché un transistor conosce solo due '
          'stati. L\'esadecimale è la comoda abbreviazione per questo — si '
          'trova negli indirizzi di memoria, nei colori web come #FF00FF e '
          'nei numeri Unicode. Tempo e angoli seguono il sessanta: sessanta '
          'minuti, 360 gradi, facilmente divisibili in terzi e quarti. La '
          'quotidianità e quasi tutta la scienza vanno in decimale — '
          'soprattutto per abitudine e perché il sistema metrico si fonda su '
          'di esso.\n\n'
          'Il dodici sopravvive nella dozzina, nella grossa, nell\'orologio e '
          'nel pollice. Dal Settecento ci sono sostenitori di un vero calcolo '
          'in dodici — da Buffon, passando per Isaac Pitman, fino a Frank '
          'Emerson Andrews, che nel 1935 ne scrisse il primo libro. Apposite '
          'società coltivano l\'idea ancora oggi; di più nel blocco «La '
          'società dozenale».',
    ),
    ProseSection(
      'Nessuna base è la migliore ovunque',
      'Ogni base ha il suo scopo. Due e sedici non sono «migliori per gli '
          'esseri umani», ma ideali per le macchine. Dieci è familiare e '
          'saldamente radicata. Dodici divide bene in terzi e quarti, ma '
          'perde sul quinto. Sessanta divide nel modo migliore, ma con '
          'sessanta simboli è troppo grande per la quotidianità.\n\n'
          'Nei sistemi di misura, alla fine, conta meno la base in sé che la '
          'coerenza con cui si resta su un\'unica base: il sistema metrico '
          'vince perché tutto passa per lo stesso dieci — un sistema misto di '
          'miglio, iarda, piede e pollice non avrebbe questo vantaggio in '
          'nessuna base.',
    ),
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('Una breve storia dei sistemi posizionali', [
    ProseSection(
      'Prima del valore posizionale',
      'A lungo i numeri si scrivevano sommando simboli. Le cifre romane sono '
          'un sistema di questo tipo: XVII significa dieci più cinque più uno '
          'più uno. È comodo da leggere, ma faticoso per calcolare, e i numeri '
          'grandi diventano ingombranti.\n\n'
          'Il grande salto fu il sistema posizionale: la stessa cifra '
          'significa qualcosa di diverso a seconda della posizione. Solo '
          'questo rende semplice il calcolo scritto con numeri grandi a '
          'piacere — e richiede una cifra per «niente in questa posizione»: lo '
          'zero.',
    ),
    ProseSection(
      'Babilonia e il sessanta',
      'Il primo vero sistema posizionale nacque presso i Sumeri e i '
          'Babilonesi, oltre quattromila anni fa, in base sessanta. È '
          'considerato la loro più grande conquista matematica.\n\n'
          'Uno zero pieno, però, non l\'avevano ancora: conoscevano un segno '
          'segnaposto per le posizioni vuote in mezzo, mai però alla fine di '
          'un numero. La loro eredità ci accompagna ancora oggi — nei sessanta '
          'minuti dell\'ora e nei 360 gradi del cerchio.',
    ),
    ProseSection(
      'L\'invenzione indiana dello zero',
      'L\'odierno sistema decimale con lo zero viene dall\'India. Aryabhata '
          'usò nel V secolo la notazione posizionale; Brahmagupta nel 628 '
          'trattò per la prima volta lo zero come un numero a sé stante con '
          'proprie regole di calcolo, non solo come una lacuna.\n\n'
          'Da lì lo ripresero studiosi arabi e persiani — al-Khwarizmi ne '
          'scrisse intorno all\'825 —, e attraverso di loro giunse in Europa. '
          'Per questo le nostre cifre si chiamano ancora oggi «cifre arabe», '
          'sebbene l\'idea provenga dall\'India.',
    ),
    ProseSection(
      'Le basi delle macchine',
      'Con le macchine calcolatrici arrivarono nuove basi. Gottfried Wilhelm '
          'Leibniz pubblicò nel 1703 il sistema binario fatto di soli 0 e 1 — '
          'vi rivide perfino gli antichi esagrammi dell\'I Ching cinese.\n\n'
          'Oggi i computer calcolano in binario, ma per lo più lo scrivono in '
          'esadecimale: con il byte da 8 bit dell\'IBM System/360 negli anni '
          'Sessanta si affermò la base sedici, perché due cifre esadecimali '
          'danno esattamente un byte. Ogni base trovò così il suo posto — non '
          'perché fosse «la migliore», ma perché si adatta al suo compito.',
    ),
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
  ProseChapter('Come calcola questa calcolatrice', [
    ProseSection(
      'Due calcolatrici in una',
      'Quando premi il tasto uguale, l\'app non calcola una volta sola, ma '
          'due — con due macchine del tutto diverse.\n\n'
          'La prima è una calcolatrice esatta di frazioni. Calcola senza '
          'alcun arrotondamento, con numeri interi grandi a piacere. La '
          'seconda è una rapida calcolatrice decimale, come quella che ha '
          'quasi ogni calcolatrice tascabile — calcola con precisione '
          'limitata, ma con tutto, anche con seno, radice e logaritmo. '
          'Entrambe partono a ogni segno di uguale.',
    ),
    ProseSection(
      'La frazione esatta',
      'La calcolatrice di frazioni conserva i numeri come rapporto tra due '
          'numeri interi. Un terzo resta davvero un terzo, non 0,333… Solo per '
          'la visualizzazione trasforma la frazione in cifre dopo la virgola '
          'in base dodici.\n\n'
          'Nel farlo riconosce quando le cifre si ripetono. Un terzo '
          'in base dodici è un netto 0,4. Un quinto, invece, è periodico: '
          '0,2497 2497 2497 … L\'app lo mostra con una linea sopra il gruppo '
          'che si ripete e un punto che segna l\'inizio del periodo. Così il '
          'risultato resta esatto, invece di essere arrotondato in silenzio.',
    ),
    ProseSection(
      'Quando la frazione non basta',
      'Alcuni calcoli non si possono scrivere come frazione. Non appena '
          'compare un seno, una radice, un logaritmo o una funzione simile — '
          'oppure si divide per zero —, la calcolatrice di frazioni si '
          'arrende.\n\n'
          'Allora entra in gioco la calcolatrice decimale. Il suo risultato è '
          'solo approssimato, perciò l\'app gli antepone un segno «≈»: '
          '«circa». Se funzionano entrambe le vie, vince sempre la frazione '
          'esatta. Il «≈» compare quindi solo dove serve davvero '
          'un\'approssimazione.',
    ),
    ProseSection(
      'Periodi lunghi e il display',
      'I risultati esatti possono diventare molto lunghi. Alcune frazioni '
          'hanno periodi di oltre cento cifre — molto più di quanto stia in '
          'una riga.\n\n'
          'Affinché nulla esca dal display, l\'app omette da destra tante '
          'cifre finali (le meno significative) finché il resto non sta nella '
          'riga, e mette un «…» come segno che la cosa prosegue ancora. La '
          'marcatura del periodo viene così accorciata in modo pulito. Il '
          'numero resta dunque onesto: ciò che è tagliato viene mostrato in '
          'modo visibile, non nascosto.',
    ),
  ]),
];
