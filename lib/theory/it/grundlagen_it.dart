part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersIt() => const [
  ProseChapter(
    'Che cos\'è il sistema dozenale?',
    [
      ProseSection(
        'Che cos\'è una base',
        'In un sistema posizionale il valore di una cifra dipende dalla sua '
            'posizione. Nel numero 347 il 3 sta per trecento, il 4 per '
            'quaranta, il 7 per sette. Ogni posizione vale tante volte quella '
            'alla sua destra quante ne indica la base. Nel familiare sistema '
            'decimale la base è dieci.\n\n'
            'Il sistema dozenale ha la base dodici. Le posizioni non sono '
            'quindi unità, decine, centinaia, bensì unità, dozzine e '
            'centoquarantaquattresimi. Il numero «100» non significa qui cento, '
            'ma dodici per dodici, cioè 144 in decimale. E «10» significa '
            'esattamente una dozzina.\n\n'
            'Importante: la quantità stessa non cambia mai, solo la '
            'rappresentazione. Quindici mele restano quindici mele, che le si '
            'scriva «15» (decimale) o «13» (dozenale). Un numero non diventa '
            'più grande né più piccolo cambiando base.',
      ),
      ProseSection(
        'Perché servono due nuove cifre',
        'Il sistema decimale si accontenta di dieci simboli (da 0 a 9), perché '
            'a ogni decima unità inizia una nuova posizione. Il sistema dozenale '
            'avanza di una posizione solo alla dodicesima unità. Ha perciò '
            'bisogno di due simboli aggiuntivi — per i valori dieci e undici, '
            'che in decimale occupano già due posizioni.\n\n'
            'Questo calcolatore li scrive A (= dieci) e B (= undici). '
            'Fondamentale: A e B qui non sono lettere né segnaposto, ma cifre '
            'singole a pieno titolo — esattamente come 7 o 9, solo per dieci e '
            'undici. Il conteggio va quindi: 0, 1, 2, …, 9, A, B, 10, 11, …\n\n'
            'Questa è una vera trappola per chi è abituato all\'algebra. Lì '
            '«2B» indica il prodotto due per B. Qui no. «2B» è un numero a due '
            'cifre: un 2 nella posizione delle dozzine e un B nella posizione '
            'delle unità, cioè due dozzine e undici unità — 35 in decimale. Il '
            'prodotto due per undici, invece, sarebbe 22, dozenale «1A», qualcosa '
            'di completamente diverso. Le cifre affiancate formano un numero, '
            'non vengono moltiplicate. Il calcolatore lo sa da sé, perché A e B '
            'sono per lui cifre fisse, non lettere.\n\n'
            'Esistono altre notazioni diffuse, soprattutto le cifre ruotate ↊ e '
            '↋ proposte da Isaac Pitman nel 1857, che dal 2015 hanno persino un '
            'posto nel codice Unicode. Un unico standard valido a livello '
            'mondiale non esiste ancora.',
      ),
      ProseSection(
        'Il vantaggio: frazioni esatte',
        'Il vero fascino del dodici è la sua divisibilità. Il dodici si divide '
            'esattamente per 2, 3, 4 e 6; il dieci solo per 2 e 5. La cosa si '
            'vede nel modo più chiaro con le frazioni. In base 10 un terzo '
            '(0,333…) e un sesto (0,1666…) sono frazioni decimali infinite e '
            'periodiche. In base 12 sono brevi ed esatte: un terzo è 0;4, un '
            'sesto è 0;2.\n\n'
            'Alla base c\'è una regola semplice: una frazione 1/n è esatta in '
            'una data base se e solo se il denominatore n è composto soltanto da '
            'fattori primi di quella base. Dodici si compone di 2 e 3 — quindi '
            'tutte le frazioni con denominatori fatti solo di due e tre sono '
            'esatte.\n\n'
            'Ma questo non è un guadagno puro, è uno scambio. Un quinto, che in '
            'base 10 vale il netto 0,2, diventa periodico in base 12 (0;2497…). '
            'Anche i decimi diventano periodici. Lo scambio conviene nella vita '
            'quotidiana perché si divide più spesso per tre e per quattro che per '
            'cinque — ma rimane, onestamente, uno scambio, non un miracolo.',
      ),
      ProseSection(
        'Dove il dodici vive da secoli',
        'Ben prima di qualsiasi teoria il dodici si era già insinuato nelle '
            'misure, nel tempo e nel commercio, proprio perché si lascia dividere '
            'così bene. Nel commercio si conta in dozzine (12 pezzi) e in grosse '
            '(144 = 12² pezzi); la parola «dozzina» risale attraverso il francese '
            'al latino duodecim, «dodici».\n\n'
            'La parola latina uncia significava «un dodicesimo» — tanto di un '
            'piede quanto di una libbra. Ne derivano le parole inglesi inch '
            '(pollice) e ounce (oncia): 12 pollici fanno un piede. Anche il '
            'tempo è suddiviso in dodici: due volte dodici ore al giorno, dodici '
            'mesi in un anno, e il cerchio completo ha 360 = 30 × 12 gradi.\n\n'
            'Esiste persino un\'ipotesi sull\'origine del dodici: con il pollice '
            'si possono contare le tre falangi delle altre quattro dita, cioè '
            '4 × 3 = 12. Questo metodo di conteggio è ancora in uso in alcune '
            'parti dell\'Asia. È una spiegazione plausibile dell\'origine del '
            'conteggio duodecimale, ma non dimostrata — resta un\'ipotesi.',
      ),
      ProseSection(
        'Il movimento dozenale',
        'Sfruttare consapevolmente il vantaggio del dodici è un\'idea antica '
            'che nel XX secolo trovò una piccola forma organizzata. Nel 1935 '
            'Frank Emerson Andrews scrisse negli Stati Uniti il primo libro '
            'sull\'argomento; nel 1944 nacque la Dozenal Society of America, '
            'nel 1959 la Dozenal Society of Great Britain. Entrambe pubblicano '
            'tutt\'oggi bollettini e usano le cifre di Pitman.\n\n'
            'Queste società non chiedono un cambio di sistema mondiale. Intendono '
            'il loro lavoro come educazione ed esplorazione: vogliono mostrare '
            'che la scelta della base numerica non è una necessità della natura, '
            'ma un\'abitudine. Il matematico Alexander Craig Aitken si batté '
            'attivamente per il dodici e valutò il sistema decimale come '
            'nettamente meno efficiente — una stima espressiva, non un valore '
            'misurato.',
      ),
      ProseSection(
        'Perché non si è mai affermato',
        'Se la base 12 è spesso più comoda dal punto di vista aritmetico, perché '
            'tutto il mondo conta in decimale? La risposta non sta nella '
            'matematica, ma nell\'abitudine. Il sistema decimale è radicato da '
            'millenni — presumibilmente perché gli esseri umani hanno dieci dita. '
            'È un motivo anatomico, non matematico, ma è profondo.\n\n'
            'Quando nel XVIII e XIX secolo il mondo unificò le proprie misure, '
            'vinse il sistema metrico decimale; cambiare il sistema di conteggio '
            'era già allora considerato impraticabile. Oggi i costi di una '
            'conversione — nuovi libri scolastici, dispositivi, software, il '
            'riaddestrare tutti gli esseri umani — equivalgono a una ricostruzione '
            'totale. E i computer calcolano comunque in binario, dove la base 16 '
            'è più vicina del dodici.\n\n'
            'Le tracce del dodici nell\'orologio, nel metro e nella dozzina non '
            'sono quindi un invito al cambiamento. Mostrano soltanto che il '
            'dodici non è mai del tutto scomparso — e rendono il calcolare in '
            'esso un viaggio in una terra dei numeri familiare e allo stesso '
            'tempo straniera.',
      ),
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Dodici falangi su una mano',
    [
      ProseSection(
        'Il metodo: dodici falangi, un pollice',
        'Tieni una mano davanti a te e osserva le quattro dita accanto al '
            'pollice. Ognuna di queste dita ha tre falangi, separati da '
            'articolazioni visibili: una falange prossimale, una media e una '
            'distale. Quattro dita per tre falangi dà dodici — dodici punti '
            'contabili su una sola mano.\n\n'
            'Il pollice funge da puntatore e non viene contato. Tocca in '
            'successione ciascuna delle dodici falangi, contando così da uno '
            'a dodici. La sequenza più comunemente descritta inizia dalla '
            'falange distale del mignolo e procede dito per dito verso '
            'l\'interno della mano. Esistono però varianti: alcuni iniziano '
            'dall\'indice, altri contano dalla punta verso il basso. '
            'Fissa è solo la struttura di base — un puntatore, quattro '
            'dita, tre falangi ciascuna, somma dodici.\n\n'
            'Che ci siano esattamente tre falangi non è una scelta culturale, '
            'bensì anatomia: questa forma 2-3-3-3-3 (il pollice ha solo due '
            'falangi) è comune a tutti gli esseri umani ed è un\'antica eredità '
            'della mano dei mammiferi. Le falangi si sono formate per afferrare '
            'e arrampicarsi, non per contare — ma vi si prestano bene.',
      ),
      ProseSection(
        'Da dodici a sessanta',
        'Quando il pollice ha percorso tutte le dodici falangi della prima '
            'mano, un ciclo completo è terminato. L\'altra mano prende ora il '
            'compito di memorizzare: per ogni dozzina completata alza un dito. '
            'Cinque dita per dodici falangi dà sessanta. Con due mani si può '
            'dunque contare in silenzio e senza alcun supporto fino a 60.\n\n'
            'Questo legame 12 × 5 = 60 è la spiegazione più semplice del perché '
            'proprio il sessanta abbia un ruolo così importante nei sistemi '
            'mesopotamici — e attraverso di essi fino a oggi: 60 secondi per '
            'minuto, 60 minuti per ora, 360 = 6 × 60 gradi nel cerchio completo.\n\n'
            'Esiste anche un\'altra convenzione in cui entrambe le mani contano '
            'falangi; si arriva allora a 12 × 12 = 144. Entrambi i metodi sono '
            'corretti, ma non sono lo stesso sistema.',
      ),
      ProseSection(
        'Dove si conta così',
        'Questo metodo di conteggio non è un\'invenzione moderna. Lo storico '
            'della matematica Georges Ifrah lo ha reso noto nella sua «Storia '
            'universale dei numeri» e lo ha descritto come ancora in uso — in '
            'una larga fascia che va dall\'Egitto alla Siria, dalla Turchia '
            'all\'Iraq, all\'Iran, all\'Afghanistan, al Pakistan, all\'India e '
            'all\'Indocina.\n\n'
            'Una nota onesta sulle fonti è qui doverosa: questo elenco di paesi '
            'è l\'indicazione più citata sull\'argomento, ma risale quasi '
            'interamente a questa unica fonte. I testi successivi si basano '
            'per lo più di nuovo su Ifrah. Quando e come esattamente siano state '
            'fatte le osservazioni non è documentato; manca uno studio sistematico '
            'recente.\n\n'
            'Il caso meglio documentato è quello dei Chepang in Nepal. I '
            'linguisti Ross Caughley e Martine Mazaudon documentarono che i '
            'Chepang contano la selvaggina in dozzine toccando le falangi; '
            'la loro parola per dodici, hale, risale a una radice antica per '
            '«base del conteggio». Anche alcune lingue della Nigeria centrale '
            'hanno parole numerali basate sul dodici. In entrambi i casi vale '
            'però: nella vita quotidiana le persone contano oggi in decimale; '
            'le tracce del dodici sono resti più che un sistema vivo e completo.',
      ),
      ProseSection(
        'La grande tesi — e perché rimane aperta',
        'Ifrah avanzò l\'ipotesi che il sistema duodecimale in generale — e il '
            'sistema sessagesimale babilonese con la base 60 — siano derivati '
            'da questo conteggio delle falangi. La tesi ha aspetti solidi: '
            'spiega insieme il dodici e il sessanta, è anatomicamente plausibile '
            'e mostra un\'azione concreta anziché una mera coincidenza numerica.\n\n'
            'Eppure rimane un\'ipotesi, non una storia accertata. Ifrah stesso '
            'definisce espressamente la propria derivazione come speculativa. '
            'Nessun testo antico, nessuna tavoletta d\'argilla e nessuna '
            'illustrazione descrive questo metodo come origine del sistema '
            'babilonese. Il metodo è compatibile con quell\'origine — ma questo '
            'non equivale a una prova.\n\n'
            'L\'argomento contrario più forte lo fornisce l\'Egitto: secondo '
            'Ifrah anche gli Egiziani contavano sulle falangi — eppure '
            'svilupparono un sistema numerale decimale. Il solo metodo delle '
            'dita non implica quindi né il dodici né il sessanta.',
      ),
      ProseSection(
        'Altre spiegazioni a confronto',
        'La tesi delle falangi non è la sola. Per l\'origine del sessanta una '
            'diversa ipotesi è considerata dagli storici quella più ampiamente '
            'accettata: che due popoli con diverse basi di conteggio si '
            'incontrassero nel commercio e si accordassero sul 60 come multiplo '
            'comune. Anche per questo, tuttavia, non esiste un riscontro storico '
            'diretto.\n\n'
            'Vi si affiancano una spiegazione astronomica (circa dodici cicli '
            'lunari rientrano approssimativamente in un anno, da qui dodici mesi '
            'e dodici segni zodiacali) e una matematica (il dodici e il sessanta '
            'hanno particolarmente molti divisori e sono perciò pratici). Questi '
            'motivi spiegano bene perché i numeri siano stati mantenuti — ma non '
            'necessariamente perché vi si sia ricorso originariamente.\n\n'
            'Probabilmente più forze hanno agito insieme: la mano, il cielo, il '
            'commercio e la buona divisibilità. Proprio questo rende così '
            'difficile isolare un\'unica causa. Ciò che resta è una bella '
            'conclusione onesta: la mano umana offre una base naturale per il '
            'dodici — che abbia davvero plasmato il sistema numerico non si può '
            'affermare con certezza.',
      ),
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
