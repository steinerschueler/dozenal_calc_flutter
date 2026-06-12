// Prosa della teoria delle unità in italiano. part of ../unit_theory.dart.
// I corpi sono mantenuti in frasi semplici e brevi (più facili da tradurre). Distillati
// dai dossier di ricerca in docs/research/. `count` non ha una voce di proposito
// — la storia della dozzina/del dodici vive nei 12 capitoli didattici dell'app.

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroIt() {
  return const [
    UnitTheorySection(
      'Cosa può fare il calcolatore',
      'Il convertitore di unità converte tra il mondo imperiale-dozenale '
          '(base dodici) e il mondo metrico (base dieci) — in tutte le '
          'categorie: lunghezza, area, volume, peso, tempo, angolo, '
          'valuta, temperatura e altre come pressione, forza, energia, '
          'potenza, cucina e coppia.\n\n'
          'La parentesi { } mostra sempre il valore nell\'altro sistema. '
          'Più unità si possono combinare in un unico valore — ad esempio '
          '1 ft 6 in o 2 h 30 min. Premere = scorre le rappresentazioni '
          'delle unità e la scomposizione a gradini; una pressione prolungata '
          'su un\'unità mostra una breve definizione. Le cifre appaiono come '
          'glifi dozenali o come normali 0–9/A/B, in base all\'impostazione '
          'del display.',
    ),
    UnitTheorySection(
      'Cosa non può fare',
      'È un convertitore, non una calcolatrice scientifica: nessuna '
          'funzione come seno o logaritmo, nessun calcolo libero con '
          '× e ÷, nessuna memoria e nessuna modalità angolo. Per questo '
          'c\'è la calcolatrice principale.\n\n'
          'La valuta (pence/scellino/sterlina) riflette il rapporto '
          'storico britannico — dodici pence allo scellino, venti '
          'scellini alla sterlina —, non i tassi di cambio attuali. '
          'Mostra la struttura dozenale del vecchio denaro, non valori '
          'monetari odierni. Il set di unità è fisso.',
    ),
    UnitTheorySection(
      'Come si usa',
      'Tocca una categoria (ad esempio lunghezza) — la sua scala di '
          'unità si apre nella colonna opposta. Tocca un\'unità, inserisci '
          'le cifre e combina più unità in un unico valore. Il tasto '
          'DOZ/DEZ passa tra il mondo imperiale e quello metrico; la '
          'parentesi { } mostra il corrispondente. = scorre le '
          'rappresentazioni, una pressione prolungata su un\'unità ne '
          'mostra il significato, e un tocco sulla riga di inserimento '
          'sposta il cursore.\n\n'
          'Un esempio — inserire 1 ft 6 in e leggere il risultato nel mondo opposto:',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryIt(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Contare per dozzine',
          'I pezzi si possono raggruppare per dieci — o per dodici. Una dozzina è '
              'dodici pezzi, una grossa è dodici dozzine (144), una grande grossa è dodici '
              'grosse (1728). È la stessa scala di unità, decine, centinaia e migliaia, '
              'solo in base dodici: dozzina = 12¹, grossa = 12², grande grossa = 12³. '
              'Scritti in base dodici vengono un tondo 10, 100 e 1000 — '
              'la grande grossa è dunque il «migliaio dozenale».\n\n'
              'Perché il dodici si lasci dividere in modo così comodo, e come si '
              'conti fino a dodici sulle tre falangi delle quattro dita, è trattato in '
              'Teoria → Fondamenti. Qui si parla delle unità di conteggio stesse.',
        ),
        UnitTheorySection(
          'Da dove vengono i nomi',
          '«Dozzina» giunge attraverso il francese antico douzaine dal latino '
              'duodecim, «due-e-dieci»; la parola significa esattamente dodici, non '
              'approssimativamente. Imparentati sono lo spagnolo docena, '
              'l\'italiano dozzina e l\'inglese dozen.\n\n'
              '«Grossa» deriva dalla grosse douzaine, la «grande dozzina», ed è '
              'attestata dall\'inizio del XV secolo. Nel commercio all\'ingrosso si '
              'contavano e imballavano piccole merci — matite, bottoni, aghi — a grosse; '
              'alcune scatole di matite portano ancora oggi la scritta «1 grossa». '
              'La grande grossa (1728) è la dozzina di grosse — ed è anche, per '
              'coincidenza, il numero di pollici cubi in un piede cubo '
              '(12 × 12 × 12). Le uova si vendono ancora oggi a dozzine.',
        ),
        UnitTheorySection(
          'La dozzina del fornaio',
          'Una dozzina del fornaio è tredici — uno in più di una dozzina comune; '
              'il tredicesimo pane si chiama «vantage loaf». La spiegazione più '
              'diffusa rimanda alla legge medievale inglese sul pane (Assize of Bread, '
              'XIII secolo): chi vendeva pane sottopeso rischiava sanzioni, così il '
              'fornaio aggiungeva un pane per sicurezza.\n\n'
              'Va aggiunta un\'onesta riserva: questa derivazione è plausibile e '
              'ampiamente ripetuta, ma non documentata nelle fonti. Le prime '
              'testimonianze scritte per l\'inglese «baker’s dozen» risalgono solo alla '
              'fine del XVI secolo — molto tempo dopo la legge.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Misure dal corpo',
          'Le più antiche misure di lunghezza provengono dal corpo umano. La '
              'larghezza del dito divenne il pollice, l\'avambraccio il cubito, il piede il '
              'piede, l\'apertura delle braccia la tesa. Era pratico, perché '
              'ognuno portava con sé la propria misura. Era però impreciso, perché nessun '
              'corpo è uguale a un altro.\n\n'
              'I primi standard fissi nacquero in Mesopotamia ed '
              'Egitto. In Egitto valeva il cubito reale, circa 52 centimetri. Era '
              'l\'avambraccio del faraone e fu fissato nella pietra come misura campione. '
              'I cubiti da lavoro in legno venivano regolarmente confrontati '
              'con esso — fu l\'inizio della taratura.',
        ),
        UnitTheorySection(
          'Da Roma al Medioevo',
          'I Romani ordinarono il sistema. Il loro piede (pes) aveva dodici «uncia». '
              'Da uncia derivò la parola «pollice» (in inglese inch) — e anche '
              '«oncia». Il loro miglio si chiamava «mille passus», mille doppi passi, '
              'circa 1480 metri. È la radice di tutte le miglia successive.\n\n'
              'Nel Medioevo quasi ogni città aveva le proprie misure. Un pollice veniva '
              'definito come tre chicchi d\'orzo disposti uno dietro l\'altro. Per il '
              'piede esistevano procedimenti curiosi: nel 1535 Jacob Köbel descrisse che si '
              'dovessero allineare la domenica sedici uomini all\'uscita dalla chiesa, piede dietro piede '
              '— un sedicesimo di quella misura era il «piede giusto». Così '
              'si livellavano le differenze. In Germania il '
              'piede andava comunque da 235 a 408 millimetri.',
        ),
        UnitTheorySection(
          'Misure in tutto il mondo',
          'Lo stesso schema esiste ovunque. In Cina si misurava in chi (piede) e '
              'cun (pollice), in India in hasta (cubito) e angula (dito), nel '
              'mondo islamico in diversi cubiti. Il cubito, dal gomito '
              'alla punta del dito, si ritrova in quasi tutti i continenti — il '
              'corpo è l\'origine comune.\n\n'
              'In molte culture il corpo valeva come misura sacra, l\'uomo '
              'come immagine dell\'ordine del mondo. I templi egizi, la costruzione biblica '
              'dell\'arca e i templi induisti furono misurati in cubiti.\n\n'
              'Anche la lingua ha conservato le misure. «Dagli un pollice, e '
              'si prenderà un miglio» significava in origine «… e si prenderà un '
              'cubito». Uno «sputo» è un breve tragitto. Il '
              'richiamo dello scandaglio del marinaio «mark twain» (due tese di profondità) divenne lo '
              'pseudonimo di Mark Twain.',
        ),
        UnitTheorySection(
          'Perché dodici — e un\'onesta riserva',
          'Perché il piede ha proprio dodici pollici? Per la divisibilità. '
              'Dodici si lascia dividere senza resto a metà, in terzi, in quarti e in '
              'sesti. Dieci solo a metà e in quinti. Un terzo di piede è '
              'esattamente quattro pollici; in decimale sarebbe 0,333… metri. Per l\'artigianato e il '
              'commercio, molto prima della virgola, era un vero vantaggio. Già '
              'i Romani scelsero il dodici proprio per questo motivo.\n\n'
              'Va aggiunta un\'onesta riserva: il sistema imperiale non è '
              'un sistema dodicesimale continuo. Solo piede e pollice — e le '
              'dodici once troy del metallo prezioso — sono davvero duodecimali. La '
              'iarda ha tre piedi, il miglio 1760 iarde: numeri storti. E i pollici '
              'nella vita quotidiana si dividono in metà, quarti, ottavi, quindi secondo '
              'base due. Il dodici si trova dunque solo in singoli punti, non '
              'nell\'intero sistema.',
        ),
        UnitTheorySection(
          'In uso oggi',
          'Oggi sono soprattutto gli USA e la Gran Bretagna a usare queste misure nella '
              'vita quotidiana. In tutto il mondo valgono però nella navigazione aerea e marittima: '
              'gli aerei misurano la loro quota in piedi, la loro velocità in nodi '
              'e la loro distanza in miglia nautiche. Un miglio nautico è un '
              'primo d\'arco sul globo terrestre — segue la divisione per sessanta, '
              'non per dodici. Schermi, pneumatici e tubi sono quasi '
              'ovunque in pollici. In Scandinavia il «mil» equivale a dieci '
              'chilometri. Nei paesi metrici le antiche misure vivono ormai solo nei '
              'modi di dire.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Alcune spiegazioni sono affascinanti, ma incerte. Una sostiene che il '
              'dodici derivi dal contare le falangi delle dita con il pollice — '
              'plausibile, ma non dimostrato. Altre teorie come il '
              '«pollice piramidale» o la «iarda megalitica» affermano '
              'l\'esistenza di un sapere occulto nelle antiche costruzioni. Nel mondo '
              'scientifico sono considerate confutate: si selezionano tra molte misure solo '
              'quelle che si adattano alla tesi.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'La terra come lavoro',
          'Le superfici si misurano collegando lunghezza con lunghezza. Ma le '
              'antiche misure agrarie non nacquero dalla geometria, bensì dal '
              'lavoro. Un campo era grande quanto ciò che si poteva '
              'coltivare in un giorno.\n\n'
              'Il tedesco «Morgen» (mattina) si chiama così perché lo si '
              'arava in una mattinata. L\'inglese «acre» era la superficie che un tiro '
              'di otto buoi riusciva a lavorare in un giorno. Il romano «iugerum» '
              'deriva da «iugum», il giogo dei buoi. Anche l\'arabo '
              '«feddan» significa giogo dei buoi. Ovunque la stessa idea: la terra è '
              'lavoro.\n\n'
              'Nell\'antico Egitto bisognava rimisurare i campi dopo ogni piena del Nilo, '
              'perché l\'acqua cancellava i confini. Gli agrimensori '
              'tendevano funi annodate; i Greci li chiamarono in seguito '
              '«tenditori di funi». In Mesopotamia la misura base era il «sar» — un '
              'quadrato di dodici per dodici cubiti.',
        ),
        UnitTheorySection(
          'L\'acro e il suo numero storto',
          'L\'acro ha una forma insolita: una striscia lunga e stretta, '
              'lunga un furlong e larga una chain (660 per 66 piedi). Questo '
              'rispecchia la pratica dell\'aratura: solco lungo, corsia stretta. Così risultano '
              '43 560 piedi quadrati o 4840 iarde quadrate.\n\n'
              'Perché questo numero storto, 4840? È un incidente della storia. '
              'Quando nel XIII secolo l\'Inghilterra accorciò il piede, la pertica '
              'e il furlong rimasero invariati nei confini dei terreni. Per questo '
              'l\'acro saltò da 4000 vecchie a 4840 nuove iarde quadrate. Il numero '
              'storto non è dunque un\'intenzione, ma il residuo di una '
              'riforma delle misure.',
        ),
        UnitTheorySection(
          'Misure di superficie in tutto il mondo',
          'Oggi l\'ettaro (10 000 metri quadrati) è la misura agraria '
              'più diffusa al mondo. Ma le antiche misure vivono tenacemente. In '
              'Thailandia il rai figura persino nel catasto ufficiale. In India '
              'e Bangladesh nel commercio fondiario si calcola in bigha. In Corea '
              'il pyeong è in uso quotidiano nonostante il divieto. L\'Egitto ha mantenuto il '
              'feddan, la Cina il mu. In Israele, Turchia e nei Balcani '
              'si misura in dunam. In Germania Morgen, Joch e '
              'Tagwerk vivono ancora nell\'agricoltura e nella lingua.\n\n'
              'Le più tenaci sono le misure che sono state fissate su valori metrici '
              'tondi — un rai è esattamente 1600, un dunam esattamente '
              '1000 metri quadrati.',
        ),
        UnitTheorySection(
          'Il dodici nella superficie — e una riserva',
          'Nelle piccole unità il dodici si mostra nel modo più bello. Un '
              'piede quadrato è 144 pollici quadrati, perché dodici per dodici fa 144. '
              'Scritto in base dodici è un tondo «100». Una iarda quadrata '
              'è nove piedi quadrati.\n\n'
              'Nelle grandi misure agrarie l\'ordine si spezza. L\'acro con '
              'le sue 4840 iarde quadrate non entra in nessuna base semplice. Ciò dipende '
              'dal fatto che le misure agrarie nacquero dal lavoro, non dal '
              'calcolo.\n\n'
              'Resta tuttavia un punto pratico: un terzo di ettaro è '
              '3333,33… metri quadrati — un numero storto. Un terzo di feddan '
              'invece è un tondo otto kirat. Dove si divide spesso in terzi, una base '
              'divisibile per tre è vantaggiosa. È esattamente ciò che offre il '
              'dodici.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Da dove viene la predilezione per il dodici? Una nota, ma '
              'indimostrata supposizione: dal contare le falangi delle dita. Il pollice '
              'tocca le tre falangi delle altre quattro dita — ciò dà '
              'dodici per mano. Questa tecnica di conteggio è documentata ancora oggi in parti dell\'Asia '
              'e del Vicino Oriente. Come origine certa non si lascia però '
              'dimostrare.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'Prima il recipiente, poi il cubo',
          'Il volume si misura collegando tre lunghezze — un cubo. '
              'Ma quasi da nessuna parte cominciò così. All\'inizio c\'era il recipiente: una '
              'brocca piena, un sacco di grano, un mestolo d\'olio. Si misurava '
              'ciò che si poteva mangiare, trasportare o commerciare, non ciò che si '
              'poteva calcolare.\n\n'
              'Il riferimento era per lo più una quantità di cibo. Il greco '
              '«choinix» era la razione giornaliera di grano per un operaio. Il '
              'giapponese «koku» era tanto riso quanto un uomo mangia in un '
              'anno — circa 180 litri. Il tedesco «Scheffel» (staio) era all\'incirca un '
              'sacco trasportabile.\n\n'
              'Solo i grandi imperi con un\'amministrazione derivarono il volume dalla '
              'misura di lunghezza. I Romani fecero il primo passo chiaro: la loro '
              '«amphora» conteneva esattamente un piede cubo, circa 26 litri. Così '
              'il volume divenne per la prima volta un vero cubo della misura del piede — '
              'l\'antenato diretto di piede cubo, litro e metro cubo.',
        ),
        UnitTheorySection(
          'Misura, rango e ricchezza',
          'Le misure di capacità erano spesso più che quantità — ordinavano intere '
              'società. In Giappone si misurava la ricchezza di un feudo in '
              'koku di resa di riso. A partire da diecimila koku un signore valeva come «daimyō», '
              'come principe. Persino la paga dei samurai e la grandezza delle navi '
              'venivano contate in koku.\n\n'
              'A Roma la razione del soldato veniva assegnata in «modii», una '
              'misura per aridi di poco meno di nove litri. In Mesopotamia, Egitto e '
              'Cina i sovrani controllavano le misure attraverso recipienti campione tarati. '
              'Il più famoso è il cinese «jialiang» dell\'epoca attorno '
              'all\'anno zero: un\'unica fusione in bronzo che incarna ben cinque '
              'unità di volume. Stava davanti alle sale dell\'imperatore '
              'come segno dell\'unità e della giustizia del suo dominio.',
        ),
        UnitTheorySection(
          'Il volume in tutto il mondo',
          'Quasi nessun ambito di misura era così frammentato come il volume. Il '
              'tedesco Scheffel andava, a seconda della città, da circa 5 a 250 litri. '
              'Inghilterra, USA e l\'Impero avevano da soli tre diversi '
              'galloni. Il gallone USA (3,79 litri) è ancora oggi circa un '
              'quinto più piccolo di quello britannico (4,55 litri).\n\n'
              'Molte di queste misure vivono ancora. Il commercio mondiale del grano '
              'calcola in «bushel» — i rapporti del raccolto USA per mais, soia e '
              'frumento compaiono solo in quelli. Il petrolio viene commerciato in «barile» da 42 '
              'galloni USA, un\'antica misura inglese delle botti da vino. In '
              'Gran Bretagna e Irlanda la birra viene mescita per legge nella '
              'pinta imperiale (568 millilitri). In Giappone il misurino del '
              'cuociriso misura esattamente un «gō». La legna da ardere si commercia in metri steri, '
              'metri cubi pieni o, in Nord America, in «cord».\n\n'
              'Negli USA le misure cubiche sono presenti nella vita quotidiana: i motori vengono indicati in '
              'pollici cubi (un «350»), il calcestruzzo e la terra nell\'edilizia in '
              'iarde cube, il gas naturale in piedi cubi.',
        ),
        UnitTheorySection(
          'Il dodici nello spazio — e una riserva',
          'Nel cubo il dodici si mostra nel modo più forte. Un piede cubo è 1728 '
              'pollici cubi — e 1728 è dodici alla terza. Scritto in base dodici '
              'è il tondo «1000». Questo numero ha particolarmente '
              'molti divisori, perché è costruito da due e tre. Un '
              'piede cubo si lascia quindi dividere pulitamente a metà, in terzi, in quarti, '
              'in sesti e in ottavi.\n\n'
              'Un metro cubo invece si divide pulitamente solo per due e per cinque. '
              'Un terzo di metro cubo è 0,333… — un numero infinito. Dove si '
              'divide spesso in terzi, il dodici è in vantaggio.\n\n'
              'L\'onesta riserva: questo bell\'ordine vale solo per le '
              'misure cubiche derivate dalle lunghezze. Le antiche misure di capacità — bushel, '
              'gallone, Scheffel — non seguono nessuna base pura. Crebbero da '
              'sacchi e botti, non dal calcolo, e mescolano passi per due, '
              'per tre e del tutto storti.',
        ),
        UnitTheorySection(
          'Il cubo sacro',
          'Il cubo ha in molte culture un significato particolare, perché '
              'lunghezza, larghezza e altezza sono uguali — un\'immagine della perfezione. '
              'Il Santo dei Santi nel tempio e nel tabernacolo era a forma di cubo. '
              'La Kaaba alla Mecca, il cui nome significa «cubo», è un '
              'santuario cubico nero. Anche la «nuova Gerusalemme» della '
              'Bibbia viene descritta come un cubo gigantesco.\n\n'
              'In molte religioni vale inoltre la giusta misura come '
              'sacro dovere. La Bibbia ebraica esige un «giusto '
              'efa»; il profeta Amos accusa i mercanti che accorciano la misura. '
              'Il Corano dedica un\'intera sura a coloro che misurano scarso. Chi '
              'misura male, pecca — questa idea si ritrova in tutto il '
              'globo.\n\n'
              'Anche il sistema metrico porta questo spirito, solo in modo laico: invece '
              'che da un sovrano, esso deriva la sua misura dalla Terra stessa. '
              'Il metro è una frazione della circonferenza terrestre, il metro cubo il suo '
              'spazio — misura dalla natura invece che dal potere.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Attorno alle antiche costruzioni si intrecciano audaci teorie sul volume. Alcuni '
              'sostengono che la piramide di Cheope nasconda una «pinta piramidale» o '
              'una misura sacra di origine divina. Altri ritengono che '
              'i cerchi di pietre dell\'età della pietra usassero una «iarda megalitica», dalla '
              'quale risulterebbe esattamente una pinta come cubo.\n\n'
              'Il mondo scientifico lo ritiene confutato. Tali teorie selezionano tra '
              'molte misure solo quelle adatte e interpretano le coincidenze come '
              'intenzione. Affascinanti da leggere, ma nessuna prova.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'Dal chicco al carico',
          'I pesi avevano ovunque due radici. Le misure più piccole derivavano da '
              'semi e chicchi, le grandi da ciò che un uomo o un '
              'animale poteva portare.\n\n'
              'L\'inglese «grain» è letteralmente un chicco d\'orzo, circa 65 '
              'milligrammi. Il «carato» dei gioiellieri deriva dal seme del '
              'carrubo. In India si pesava l\'oro in «ratti», i semi '
              'di un legume rosso. All\'altro estremo c\'era il carico: il '
              'greco «talento» e l\'indiano «maund» erano all\'incirca tanto '
              'quanto un uomo poteva portare. La «tonnellata» deriva dalla più grande '
              'botte da vino, il «tun», che riempita pesava circa una tonnellata.\n\n'
              'Un terzo filo collega peso e denaro: siclo, dracma, '
              'libbra e tola erano insieme nomi di moneta e di peso. Il denaro era '
              'in origine metallo pesato — si pesava l\'argento, invece di contare '
              'le monete.',
        ),
        UnitTheorySection(
          'Libbra, oncia e l\'eredità romana',
          'Le nostre parole per il peso provengono da Roma. La romana «libra» era una '
              'bilancia e un peso di circa 329 grammi, diviso in dodici '
              '«unciae». Da «libra» derivò la sigla «lb» per la libbra e il '
              'simbolo «£» per la sterlina britannica. Da «uncia» — letteralmente «il '
              'dodicesimo» — derivò sia l\'«oncia» sia il «pollice».\n\n'
              'Da questa radice crebbero due sistemi diversi. La '
              'libbra «avoirdupois» della vita quotidiana si divide in 16 once — un '
              'numero che si lascia dimezzare sempre di nuovo. La libbra «troy» del '
              'commercio dei metalli preziosi mantenne le dodici once romane. Un\'oncia '
              'troy (l\'oncia fine) è perciò più pesante di un\'oncia '
              'quotidiana, la libbra troy però più leggera — una confusione '
              'tuttora frequente.',
        ),
        UnitTheorySection(
          'Pesi in tutto il mondo',
          'Quasi ogni cultura aveva i suoi gradini. La Mesopotamia contava in siclo, '
              'mina e talento secondo base sessanta. L\'Egitto calcolava in modo decimale in '
              'deben e kite. La Cina usa ancora oggi jin, liang e il piccolo '
              'mace. In Giappone il «momme» (3,75 grammi) è per legge ancora '
              'l\'unità mondiale nel commercio delle perle.\n\n'
              'Molti pesi antichi vivono ancora. In Gran Bretagna e Irlanda '
              'il peso corporeo viene indicato in «stone» da 14 libbre («undici '
              'stone e quattro»). La libbra tedesca oggi indica esattamente 500 grammi. Nel '
              'Sud-est asiatico si commercia l\'oro in «tola» (circa 11,7 grammi). E il '
              'siclo israeliano porta il nome di un antichissimo peso da bilancia.\n\n'
              'Una misura era particolarmente frammentata: lo stone pesava a seconda della merce '
              'una volta 5, una volta 8, una volta 14 libbre. Solo le leggi del XIX '
              'secolo crearono ordine.',
        ),
        UnitTheorySection(
          'La bilancia come simbolo',
          'In molte culture il pesare è più che tecnica — è un\'immagine '
              'della giustizia. Nell\'antico Egitto nel giudizio dei morti si pesava '
              'il cuore contro la piuma della verità. In Omero Zeus tiene una '
              'bilancia d\'oro sul destino degli eroi. Nell\'Islam la '
              '«mizan» pesa nel Giorno del Giudizio le azioni, e nemmeno il peso '
              'di un granello di senape va perduto.\n\n'
              'Il latino «libra» significa bilancia — da cui anche il segno zodiacale '
              'Bilancia, l\'unico che non è un essere vivente. Molte religioni '
              'esigono la giusta misura: la Bibbia ebraica definisce i pesi falsi '
              'un\'abominazione, il Corano rimprovera coloro che pesano scarso. E '
              'la parola «talento» mutò dal peso al dono — attraverso '
              'la parabola biblica dei talenti affidati.',
        ),
        UnitTheorySection(
          'Il dodici nel peso — e una riserva',
          'Il dodici si trova soprattutto nel sistema troy: dodici once nella libbra, e '
              'la finezza dell\'oro si conta in 24 carati (due volte dodici). Tali numeri '
              'sono apprezzati perché dodici ha sei divisori — si può dividere senza resto '
              'a metà, in terzi e in quarti. Un terzo di dodici è '
              'pulitamente quattro; un terzo di dieci è 3,33…\n\n'
              'L\'onesta riserva: il peso quotidiano non segue il dodici. '
              'La libbra avoirdupois ha 16 once — questo è base due, il '
              'continuo dimezzare. La Mesopotamia contava in base sessanta. Il '
              'mondo dei pesi è dunque un mosaico di due, tre, dodici '
              'e sessanta — costruito per la divisione nel commercio, non per il calcolo in '
              'decine.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Da dove viene la predilezione per il dodici? Una nota, ma '
              'indimostrata supposizione la riconduce al contare le falangi delle dita: '
              'il pollice tocca le tre falangi delle quattro dita — '
              'dodici per mano. Se lo si conta cinque volte, si arriva a sessanta.\n\n'
              'Una seconda storia è addirittura confutata: che il carato si basi '
              'sui semi particolarmente uniformi del carrubo. '
              'Il nome è corretto — i semi però oscillano nel peso tanto '
              'quanto gli altri. L\'uniformità è un mito.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Due eredità: Babilonia ed Egitto',
          'Il nostro tempo proviene da due antiche fonti. L\'ora viene dall\'Egitto, '
              'minuto e secondo da Babilonia.\n\n'
              'Gli Egizi dividevano il giorno e la notte in dodici ore ciascuno — '
              'probabilmente perché di notte vedevano sorgere dodici costellazioni. '
              'Così nacque il giorno di 24 ore. Ma poiché giorno e notte sono '
              'di lunghezza diversa, queste ore erano in estate e in inverno '
              'di durata disuguale. Solo l\'orologio meccanico le rese uguali.\n\n'
              'Babilonia calcolava in base sessanta. Per questo abbiamo sessanta '
              'minuti nell\'ora e sessanta secondi nel minuto. «Minuto» '
              'significa «parte rimpicciolita», «secondo» il «secondo rimpicciolimento». '
              'La stessa base sessanta si trova nel cerchio con i suoi 360 gradi — '
              'tempo e angolo sono imparentati.',
        ),
        UnitTheorySection(
          'Luna, sole e settimana',
          'Il giorno viene dalla rotazione della Terra, il mese dalla Luna, l\'anno dal '
              'Sole. Questi tre non si accordano in modo netto, e ciò '
              'spiega quasi ogni complicazione del calendario.\n\n'
              'La settimana ha sette giorni — presumibilmente in base alle quattro fasi lunari '
              'di circa sette giorni ciascuna. In seguito si assegnò a ogni giorno uno dei '
              'sette corpi celesti visibili. Questa serie vive in molte '
              'lingue: in inglese «Saturday» è il giorno di Saturno, nelle '
              'lingue romanze «lundi/lunes» è il giorno della Luna. I Germani sostituirono '
              'gli dèi romani con i propri — dal giorno di Giove divenne '
              'il giorno di Thor, il «Thursday».\n\n'
              'Anche antichi modi di contare risuonano: l\'inglese «fortnight» '
              '(quattordici notti) ricorda che i Germani calcolavano in notti '
              'invece che in giorni.',
        ),
        UnitTheorySection(
          'Il tempo in tutto il mondo',
          'Non ovunque l\'orologio andava allo stesso modo. La Cina divideva il giorno in dodici '
              'doppie ore, denominate secondo gli animali — l\'ora del Topo cadeva attorno a '
              'mezzanotte. Il Giappone divideva giorno e notte in sei sezioni ciascuno, '
              'che con le stagioni si allungavano e si accorciavano; orologi appositi '
              'dovevano regolarsi di conseguenza.\n\n'
              'Il calendario islamico segue puramente la Luna ed è undici giorni '
              'più corto dell\'anno solare — per questo il Ramadan migra lentamente '
              'attraverso tutte le stagioni. I Maya intrecciavano addirittura più '
              'cicli, tra cui un ciclo sacro di 260 giorni. In Etiopia '
              'il giorno comincia ancora oggi all\'alba: ciò che lì sono le «sei» '
              'è altrove mezzogiorno.\n\n'
              'Molti di questi antichi ritmi vivono ancora — nelle feste, nei tempi della preghiera '
              'e nei giorni fortunati —, mentre la vita quotidiana segue ovunque il calendario '
              'gregoriano.',
        ),
        UnitTheorySection(
          'Numeri sacri del tempo',
          'Il tempo era quasi ovunque anche sacro. A Babilonia dodici e '
              'sessanta valevano come numeri perfetti. In Egitto il dio del '
              'Sole attraversava nelle dodici ore notturne l\'oltretomba. Il sette '
              'della settimana sta nella tradizione ebraica per la completezza — '
              'nel settimo giorno Dio si riposò.\n\n'
              'Notevole è un contrasto: per ebraismo, cristianesimo e islam '
              'il tempo scorre dritto, verso una meta. Nell\'induismo gira '
              'in cerchio — immense ere del mondo, gli «yuga», vengono '
              'e svaniscono sempre di nuovo, un solo giorno del dio creatore '
              'dura miliardi di anni. Molte culture temevano inoltre i '
              'giorni in eccesso a fine anno come pericoloso «tempo intermedio».',
        ),
        UnitTheorySection(
          'Perché non decimale — e il riferimento al dodici',
          'Il tempo è l\'avversario più tenace del sistema decimale. Secondo, '
              'minuto, ora, giorno, settimana, mese, anno — nessuno di questi gradini '
              'è un tondo numero in base dieci.\n\n'
              'Il motivo è di nuovo la divisibilità. Un terzo di un\'ora '
              'è un tondo venti minuti, un quarto è quindici. Con '
              'dieci non tornerebbe. Dodici e sessanta si lasciano dividere per '
              'tre, dieci no.\n\n'
              'Lo si è comunque tentato in modo decimale. Nella Rivoluzione '
              'francese c\'erano giorni di dieci ore, ore di cento '
              'minuti. Durò solo circa un anno e mezzo. Diversamente dalle misure di '
              'lunghezza e di peso, la conversione non portò alcun vantaggio — '
              'gli orologi antichi andavano già ovunque allo stesso modo. La divisione per dodici e per '
              'sessanta era semplicemente più pratica.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Come arrivarono gli uomini a dodici e sessanta? Un\'idea elegante, ma '
              'indimostrabile: si contavano con il pollice le tre falangi delle '
              'quattro dita — dodici per mano —, e cinque tali passaggi '
              'danno sessanta.\n\n'
              'Più in là si trovano affermazioni secondo cui l\'anno avrebbe avuto davvero '
              'esattamente 360 giorni e sarebbe stato modificato da catastrofi cosmiche. '
              'Per questo non esiste alcuna prova scientifica; '
              'i 360 sono molto più probabilmente un numero di calcolo tondo e ben divisibile.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'Il cerchio da Babilonia',
          'Dividiamo il cerchio intero in 360 gradi, il grado in 60 primi d\'arco, '
              'il primo in 60 secondi. Quest\'ordine è antichissimo e viene dalla '
              'Mesopotamia. I Babilonesi calcolavano in base sessanta, un '
              'numero con particolarmente molti divisori.\n\n'
              'Perché proprio 360? Il loro anno aveva circa 360 giorni, e il Sole '
              'percorre in tal modo poco meno di un grado al giorno — giorno e grado coincidevano. '
              'Le parole tradiscono l\'origine: «minuto» deriva dal '
              'latino «prima piccola parte», «secondo» dal «secondo '
              'rimpicciolimento». Esattamente le stesse parole usiamo per il tempo — '
              'angolo e tempo sono fratelli della stessa radice babilonese.\n\n'
              'Un\'onesta avvertenza: perché divenne 360 e non 60 non è '
              'documentato con certezza. La storia del giorno-per-grado è la più plausibile, '
              'ma non una spiegazione dimostrata.',
        ),
        UnitTheorySection(
          'Dalla stella all\'ora',
          'Il dodici nel cerchio viene dall\'Egitto. Lì dodici '
              'costellazioni nascenti scandivano la notte — da ciò vennero dodici '
              'ore notturne e infine il giorno di 24 ore e il '
              'quadrante dell\'orologio.\n\n'
              'I Greci ordinarono il sistema. Ipparco e più tardi Tolomeo '
              'ripresero la divisione per 360 e posero così le fondamenta della '
              'trigonometria. Da lì il sapere migrò oltre: studiosi indiani '
              'inventarono la tavola dei seni, il mondo islamico la perfezionò. '
              'La nostra parola «seno» è perfino un errore di traduzione — dalla '
              'parola indiana per «corda d\'arco» derivò, attraverso l\'arabo, la '
              'parola latina per «insenatura».',
        ),
        UnitTheorySection(
          'Angoli in tutto il mondo',
          'Non ogni cultura divideva il cerchio allo stesso modo. La Cina calcolava '
              'in modo autonomo: il cerchio aveva lì 365¼ parti — una per ogni '
              'giorno dell\'anno. Solo l\'influsso europeo portò i 360. La '
              'bussola del feng shui cinese divide l\'orizzonte in 24 '
              'direzioni.\n\n'
              'L\'India divideva lo zodiaco in dodici segni e in 27 '
              'case lunari. L\'astronomia islamica ci donò molte '
              'parole di direzione: «azimut», «zenit» e «nadir» sono tutte '
              'arabe — l\'obbligo di trovare la direzione della preghiera verso la Mecca '
              'spinse avanti l\'arte degli angoli.\n\n'
              'In mare si divideva la rosa dei venti: quattro venti principali, poi otto, poi '
              '32 punti di 11¼ gradi ciascuno. Recitare tutti i 32 nel cerchio — «boxing '
              'the compass» — faceva parte del mestiere del timoniere. I '
              'nomi mediterranei dei venti Tramontana, Levante, Scirocco vivono fino a '
              'oggi nel linguaggio meteorologico.',
        ),
        UnitTheorySection(
          'Direzioni e numeri sacri',
          'Il cielo era quasi ovunque divino. Per i Babilonesi l\'astronomia '
              'era un messaggio degli dèi, lo zodiaco la loro scrittura. Il '
              'dodici valeva per molti come numero sacro — dodici segni zodiacali, '
              'dodici Olimpi, dodici tribù, dodici ore.\n\n'
              'Particolarmente ampio è l\'ordine delle quattro direzioni cardinali. '
              'Nell\'induismo ogni direzione è custodita da un proprio dio, in Cina da '
              'un proprio essere animale — drago a oriente, tigre a occidente. La '
              'ruota di medicina dei Lakota dà a ogni direzione colore e significato. '
              'E nell\'Islam la direzione della preghiera ordina tutto il mondo attorno alla '
              'Kaaba.\n\n'
              'Volutamente senza tale simbolismo vennero le misure più recenti: la '
              'misura in radianti segue solo la matematica, il gon la '
              'Rivoluzione francese, il millesimo militare unicamente la '
              'balistica.',
        ),
        UnitTheorySection(
          'Dodici e sessanta nel cerchio — e una riserva',
          'I 360 sono un miracolo di divisibilità: hanno 24 divisori. Terzi, '
              'quarti, sesti di un cerchio danno tutti numeri di gradi tondi. '
              'Un cerchio in cento parti non potrebbe — un terzo sarebbe '
              '33,33…\n\n'
              'Lo si è tentato in modo decimale. Nella Rivoluzione francese venne '
              'il cerchio di 400 gon. Rimase una nicchia degli agrimensori, perché '
              '400 ha meno divisori di 360. Anche il tempo decimale fallì — '
              'tra l\'altro perché non si lasciava dividere pulitamente in quarti.\n\n'
              'L\'onesta riserva: i 360 non sono obbligatori. La divisione '
              'cinese in 365 lo dimostra. E nella matematica superiore vince la '
              'misura in radianti, perché lì non conta la divisibilità, ma le '
              'formule semplici. Il mondo del dodici è dunque forte, ma non '
              'privo di alternative.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Da dove la predilezione per dodici e sessanta? La nota, ma '
              'indimostrata supposizione: dal contare le falangi delle dita. Il pollice '
              'tocca le tre falangi delle quattro dita — dodici per mano —, e '
              'cinque passaggi danno sessanta.\n\n'
              'Affascinante è un parallelo numerico: la saga nordica dà '
              'al Valhalla 540 porte, attraverso ciascuna passano 800 guerrieri — insieme '
              '432 000, lo stesso numero di un\'era del mondo indiana. Il '
              'mondo scientifico lo ritiene una coincidenza, non un\'eredità comune. '
              'Bello da raccontare, ma nessuna prova.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'Il denaro era peso',
          'Molto prima che esistessero le monete, il denaro era metallo pesato. Si pesava '
              'argento o grano. Per questo i più antichi nomi del denaro sono '
              'in realtà nomi di peso.\n\n'
              'In Mesopotamia si contava in siclo, mina e talento — secondo '
              'base sessanta, sessanta sicli per una mina. Il siclo era '
              'dapprima un peso, tarato sul chicco d\'orzo. La greca '
              '«dracma» significa letteralmente «una manciata», cioè sei sottili '
              'spiedi di metallo.\n\n'
              'Notevole: si coniava per lo più solo la moneta più piccola. Le grandi '
              'unità come mina e talento erano pure grandezze di calcolo — nessuno '
              'teneva un talento in mano, ci si calcolava soltanto.',
        ),
        UnitTheorySection(
          'Sterlina, scellino, penny',
          'Il denaro europeo proviene da Roma. La moneta «denarius» diede al '
              'penny la sigla «d» e a molte lingue la parola per denaro '
              '(spagnolo «dinero», arabo «dinar»).\n\n'
              'Carlo Magno lo riordinò: una libbra d\'argento (libra) = 20 '
              'scellini (solidus) = 240 denari (denarius), quindi dodici denari '
              'per scellino. Anche qui solo il denaro era una vera '
              'moneta; libbra e scellino servivano per il calcolo. Questo sistema '
              'durò oltre mille anni.\n\n'
              'L\'Inghilterra lo adottò come sterlina, scellino, penny — la «£sd». Il '
              'simbolo «£» è una L decorata per «libra», la bilancia. Così '
              'il denaro pende dalla stessa parola del segno zodiacale Bilancia e della '
              'libbra di peso.',
        ),
        UnitTheorySection(
          'Monete in tutto il mondo',
          'Quasi ogni regione aveva i suoi gradini. Nell\'area della Germania meridionale valevano '
              'sessanta kreuzer per un fiorino — di nuovo la babilonese '
              'sessanta. Il «tallero» dalla boema Joachimsthal diede al '
              '«dollaro» il nome. Il tallero di Maria Teresa era così apprezzato '
              'che ancora nel XX secolo valeva come denaro in Arabia ed Etiopia.\n\n'
              'Altrove il denaro aveva un aspetto del tutto diverso. In Africa occidentale si pagava '
              'per secoli con conchiglie cauri. Gli Aztechi usavano '
              'fave di cacao come spiccioli e mantelli standardizzati come denaro grande — '
              'contati in ventine. L\'India calcolava la rupia in 16 anna, '
              'la Cina infilava monete forate a formare stringhe.\n\n'
              'Il dollaro spagnolo «pezzo da otto» si lasciava spezzare in otto parti. '
              'Due di esse erano «two bits» — fino a oggi il '
              'soprannome americano per il quarto di dollaro.',
        ),
        UnitTheorySection(
          'Denaro, fede e simbolo',
          'Le monete erano spesso più che mezzo di pagamento. I Greci mettevano al morto '
              'una moneta in bocca — il pedaggio per Caronte, che porta l\'anima '
              'oltre il fiume dei morti. Senza moneta essa restava sulla riva.\n\n'
              'Nel Nuovo Testamento Gesù tiene in alto un denaro con l\'effigie dell\'imperatore: '
              '«Date a Cesare ciò che è di Cesare.» I trenta denari d\'argento '
              'di Giuda erano probabilmente sicli di Tiro — proprio '
              'monete con un dio pagano sopra, al tempo stesso la moneta ufficiale '
              'del tempio.\n\n'
              'E sempre di nuovo il sacro dodici: dodici tribù e apostoli nel '
              'giudaismo e nel cristianesimo, dodici divinità solari nell\'induismo, dodici '
              'anelli della catena causale nel buddismo, dodici imam nello '
              'sciismo, dodici rami terrestri in Cina. Il numero collega denaro, '
              'calendario e fede.',
        ),
        UnitTheorySection(
          'Perché dodici e venti — e una riserva',
          'Il motivo di tutti questi gradini storti è la divisibilità. Un fiorino '
              'di sessanta kreuzer si lascia dividere in terzi senza resto: venti kreuzer. '
              'Un terzo di dollaro invece è 33,33… cent — un numero infinito. '
              'Chi nel commercio divide spesso è meglio servito da dodici, venti o sessanta '
              'che da dieci.\n\n'
              'Per questo il dodici vive ancora nel commercio: la dozzina (12), la grossa '
              '(144) e la grande grossa (1728). Una grossa significa a Londra come a '
              'New York la stessa quantità.\n\n'
              'L\'onesta riserva: il denaro antico non era un puro '
              'sistema dodicesimale. I venti scellini nella sterlina sono una '
              'logica per venti (dita delle mani e dei piedi). E nel 1971 la '
              'Gran Bretagna passò a cento pence — con un certo disordine, '
              'ma in modo duraturo. Oggi quasi tutto il mondo calcola in modo decimale.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Perché così tante culture scelsero il dodici? La nota, ma '
              'indimostrata supposizione la riconduce al contare le falangi delle dita: '
              'tre falangi su quattro dita, toccate dal pollice, '
              'danno dodici.\n\n'
              'Altre interpretazioni vanno oltre: il dodici sarebbe «tre per quattro», '
              'cielo per terra, un numero della completezza. Alcuni affermano '
              'persino che un dio solare con dodici compagni sia stato il modello dei '
              'dodici apostoli. Tali paralleli sono interpretazione, non '
              'storia certa — da prendere con cautela.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'Dal termoscopio al termometro',
          'La temperatura è un\'invenzione tardiva. A lungo si poté solo '
              'sentire il calore, non misurarlo. Il primo passo lo fece l\'osservazione '
              'che aria e liquidi si dilatano con il calore.\n\n'
              'Attorno al 1600 Galileo Galilei costruì un «termoscopio»: una sfera di vetro '
              'con un tubo, nel quale un livello d\'acqua saliva e scendeva. Indicava '
              'il calore, ma non aveva scala. La prima scala numerica la introdusse '
              'poco dopo il medico Santorio — un termometro è un '
              'termoscopio con scala.\n\n'
              'Affinché le misurazioni siano confrontabili, servono punti di riferimento fissi. '
              'Ci si accordò su punti naturali: il punto di congelamento e il '
              'punto di ebollizione dell\'acqua. A essi pendono ancora oggi tutte le scale.',
        ),
        UnitTheorySection(
          'Tre scale, tre zeri',
          'Le scale note si distinguono soprattutto in dove esse '
              'collocano lo zero.\n\n'
              'Daniel Fahrenheit pose attorno al 1724 il suo zero al punto più freddo '
              'che poteva produrre con certezza: una miscela di ghiaccio, '
              'acqua e sale. Il punto di congelamento dell\'acqua pura lo pose a '
              '32, la temperatura corporea a 96. Così i normali inverni non '
              'scendevano sotto lo zero. In seguito si ricalibrò la scala su congelamento (32) e '
              'ebollizione (212) — esattamente 180 gradi in mezzo.\n\n'
              'Réaumur scelse 0 e 80. Anders Celsius pose 0 e 100 a '
              'congelamento ed ebollizione — e dispose la scala dapprima persino '
              'al contrario (0 era il punto di ebollizione). Solo dopo la sua morte '
              'la si girò nella forma odierna. La divisione tonda in 100 '
              'si adattava perfettamente al nuovo sistema metrico.',
        ),
        UnitTheorySection(
          'Perché il mondo misura in modo diverso',
          'Quasi tutto il mondo usa oggi i Celsius — vennero con il sistema '
              'metrico. Le grandi eccezioni sono gli USA e alcuni paesi strettamente '
              'legati a loro, che rimasero al Fahrenheit. Una legge '
              'del 1975 rese lì la conversione volontaria, e così restò '
              'al vecchio.\n\n'
              'Le scale antiche sono tenaci. La Réaumur era nel XVIII e XIX secolo '
              'diffusa in Francia, Germania e Russia e si mantenne in '
              'Russia particolarmente a lungo. Per questo la letteratura russa — '
              'ad esempio in Dostoevskij o Tolstoj — parla di «gradi di gelo», intesi '
              'come gradi Réaumur.\n\n'
              'Quale scala sembri più «naturale» è pura abitudine. '
              'I Celsius si legano all\'acqua, i Fahrenheit coprono grossolanamente da 0 '
              '(molto freddo) a 100 (molto caldo) il clima umano. Entrambi '
              'sono convenzione, non un vantaggio oggettivo.',
        ),
        UnitTheorySection(
          'Fuoco e ghiaccio',
          'Caldo e freddo portano in quasi tutte le culture un significato profondo — '
              'e notevolmente spesso entrambi stanno al tempo stesso per creazione e per '
              'punizione.\n\n'
              'Nella saga nordica il mondo nasce dalla tensione '
              'tra il regno del fuoco Muspelheim e il regno del ghiaccio Niflheim — '
              'il freddo qui non è un male, bensì una forza creatrice. '
              'L\'inferno lo si immagina per lo più come fuoco, ma nell\'Inferno di Dante '
              'il cerchio più profondo è un lago ghiacciato: il tradimento è il '
              'raffreddarsi di ogni calore umano. Il buddismo conosce sia '
              'inferni caldi sia inferni freddi, graduati secondo la colpa.\n\n'
              'Il fuoco è altrove sacro e puro: Agni nell\'induismo, il '
              'fuoco eterno nello zoroastrismo. E la parola «nirvana» significa '
              'letteralmente «spegnimento» — l\'estinguersi dell\'ardore interiore.',
        ),
        UnitTheorySection(
          'Il vero zero: Kelvin',
          'Che cos\'è in realtà la temperatura? È una misura di quanto velocemente '
              'si muovono le particelle più piccole. Caldo significa: le particelle '
              'si agitano di più.\n\n'
              'Da ciò consegue che esiste una temperatura più bassa possibile — il '
              'punto in cui questo movimento è minimo. È lo '
              'zero assoluto a −273,15 °C. Più freddo non si può. Lord Kelvin '
              'pose nel 1848 una scala esattamente lì: zero kelvin è lo zero '
              'assoluto, un passo kelvin è grande quanto un grado Celsius.\n\n'
              'Solo questa scala permette veri rapporti: 200 kelvin sono '
              'davvero il doppio «caldi» di 100. Con i Celsius o i Fahrenheit '
              'questo non vale — «20 gradi sono il doppio caldi di 10 gradi» è '
              'semplicemente falso. Per la scienza il kelvin è perciò l\'unità '
              'fondamentale.',
        ),
        UnitTheorySection(
          'Perché qui il dodici aiuta poco — onestamente',
          'Nelle altre misure il dodici è forte, perché si può dividere bene una '
              'quantità: un terzo di piede è un tondo quattro pollici. Per la '
              'temperatura questo argomento non vale — e va detto '
              'onestamente.\n\n'
              'Il motivo è lo zero spostato. Zero gradi Celsius '
              'non significa «nessun calore», ma solo «l\'acqua congela». '
              'Per questo non si possono dimezzare o dividere sensatamente le temperature '
              'in terzi — «metà caldo» non esiste su una tale scala. La '
              'bella divisibilità del dodici qui va a vuoto.\n\n'
              'Solo in un punto si trova comunque un pensiero di divisibilità: nella '
              'suddivisione della scala stessa. I 96 di Fahrenheit e i 64 passi '
              'fino al ghiaccio si lasciano spesso dimezzare. Ma se si divida la visualizzazione '
              'in 10, 12 o 100 passi è pura cosmesi. La '
              'temperatura è l\'onesto controesempio: qui la scelta della '
              'base è indifferente — l\'affermazione vera sta nello zero '
              'assoluto, non nella divisione della scala.',
        ),
        UnitTheorySection(
          'Speculativo (con cautela)',
          'Attorno alla scala di Fahrenheit si intrecciano leggende. Una sostiene che i 96 fossero '
              'la temperatura febbrile della moglie malata — per questo non c\'è '
              'alcuna prova. Un\'altra dice che lo zero fosse l\'inverno più freddo '
              'della sua città natale Danzica; più probabile è la '
              'riproducibile miscela di ghiaccio e sale.\n\n'
              'Persino la spiegazione di Fahrenheit dei suoi punti fissi è considerata '
              'in parte abbellita a posteriori — molto lo riprese semplicemente dalla '
              'più antica scala dell\'astronomo Rømer. Belle storie, ma '
              'da leggere con cautela.',
        ),
      ];
    // Tutte e otto le aree di teoria sono ora presenti in italiano.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesIt(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return [
        Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
        Source('Gross (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Gross_(unit)', 'R2', 'A1'),
        Source('Great gross — Wikipedia', 'https://en.wikipedia.org/wiki/Great_gross', 'R2', 'A1'),
        Source('Baker’s dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Baker%27s_dozen', 'R2', 'A1'),
        Source('Assize of Bread and Ale — Wikipedia', 'https://en.wikipedia.org/wiki/Assize_of_Bread_and_Ale', 'R2', 'A1'),
        Source('dozen — Online Etymology Dictionary', 'https://www.etymonline.com/word/dozen', 'R2', 'A1'),
        Source('gross — Online Etymology Dictionary', 'https://www.etymonline.com/word/gross', 'R2', 'A1'),
      ];
    case UnitCategory.dist:
      return [
        Source('Measurement — MacTutor History of Mathematics', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Measurement/', 'R1', 'A1'),
        Source('Proportionate measurements (Vastu-Shastra) — wisdomlib.org', 'https://www.wisdomlib.org/hinduism/book/vastu-shastra-indian-architecture/d/doc1085304.html', 'R1', 'A1'),
        Source('Cubit — Wikipedia', 'https://en.wikipedia.org/wiki/Cubit', 'R2', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('The nautical mile — IHO', 'https://ihr.iho.int/articles/the-nautical-mile/', 'R1', 'A2'),
      ];
    case UnitCategory.area:
      return [
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A1'),
        Source('Acre — Wikipedia', 'https://en.wikipedia.org/wiki/Acre', 'R2', 'A1'),
        Source('Hectare — Wikipedia', 'https://en.wikipedia.org/wiki/Hectare', 'R2', 'A1'),
        Source('Jugerum — Wikipedia', 'https://en.wikipedia.org/wiki/Jugerum', 'R2', 'A1'),
        Source('Mathematical accuracy of Aztec land surveys (Codex Vergara) — PNAS', 'https://www.pnas.org/doi/10.1073/pnas.1107737108', 'R1', 'A2'),
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A2'),
      ];
    case UnitCategory.space:
      return [
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Hekat — Wikipedia', 'https://en.wikipedia.org/wiki/Hekat', 'R2', 'A1'),
        Source('Medimnos — Wikipedia', 'https://en.wikipedia.org/wiki/Medimnos', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('Jialiang — Wikipedia', 'https://en.wikipedia.org/wiki/Jialiang', 'R2', 'A1'),
      ];
    case UnitCategory.weight:
      return [
        Source('Hanging in the Balance: Precision Weighing in Antiquity — Penn Museum', 'https://www.penn.museum/sites/expedition/hanging-in-the-balance-2/', 'R1', 'A1'),
        Source('Avoirdupois — Wikipedia', 'https://en.wikipedia.org/wiki/Avoirdupois', 'R2', 'A1'),
        Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
        Source('Mina (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Mina_(unit)', 'R2', 'A1'),
        Source('Cubical Weights — Harappa.com', 'https://www.harappa.com/blog/cubical-weights', 'R1', 'A2'),
        Source('Legume Seeds for Weighing Gold in India — ResearchGate', 'https://www.researchgate.net/publication/344088688', 'R1', 'A2'),
      ];
    case UnitCategory.time:
      return [
        Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
        Source('Hour — Wikipedia', 'https://en.wikipedia.org/wiki/Hour', 'R2', 'A1'),
        Source('Minute — Wikipedia', 'https://en.wikipedia.org/wiki/Minute', 'R2', 'A1'),
        Source('Decimal time — Wikipedia', 'https://en.wikipedia.org/wiki/Decimal_time', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A3'),
        Source('Telling Time in Ancient Egypt — Metropolitan Museum of Art', 'https://www.metmuseum.org/essays/telling-time-in-ancient-egypt', 'R1', 'A3'),
      ];
    case UnitCategory.angle:
      return [
        Source('Babylonian mathematics — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/', 'R1', 'A1'),
        Source('Why did the Babylonians use 360 degrees? — UNLV', 'https://www.physics.unlv.edu/~jeffery/astro/babylon/babylonian_360_degrees.html', 'R1', 'A1'),
        Source('Hipparchus — MacTutor', 'https://mathshistory.st-andrews.ac.uk/Biographies/Hipparchus/', 'R1', 'A1'),
        Source('Angles in the SI: the radian as an independent unit — arXiv', 'https://arxiv.org/pdf/2101.01578', 'R1', 'A1'),
        Source('Decimal time — MacTutor', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Decimal_time/', 'R1', 'A1'),
      ];
    case UnitCategory.price:
      return [
        Source('£sd — Wikipedia', 'https://en.wikipedia.org/wiki/%C2%A3sd', 'R2', 'A1'),
        Source('Denarius — Wikipedia', 'https://en.wikipedia.org/wiki/Denarius', 'R2', 'A1'),
        Source('Shekel — Wikipedia', 'https://en.wikipedia.org/wiki/Shekel', 'R2', 'A1'),
        Source('Non-decimal currency — Wikipedia', 'https://en.wikipedia.org/wiki/Non-decimal_currency', 'R2', 'A1'),
        Source('Charon\'s obol — Wikipedia', 'https://en.wikipedia.org/wiki/Charon\'s_obol', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A2'),
      ];
    case UnitCategory.temp:
      return [
        Source('Kelvin: History — NIST', 'https://www.nist.gov/si-redefinition/kelvin/kelvin-history', 'R1', 'A1'),
        Source('Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Fahrenheit', 'R2', 'A1'),
        Source('Daniel Gabriel Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Daniel_Gabriel_Fahrenheit', 'R2', 'A1'),
        Source('Réaumur scale — Wikipedia', 'https://en.wikipedia.org/wiki/R%C3%A9aumur_scale', 'R2', 'A1'),
        Source('Thermodynamic temperature — Wikipedia', 'https://en.wikipedia.org/wiki/Thermodynamic_temperature', 'R2', 'A1'),
        Source('Rankine scale — Wikipedia', 'https://en.wikipedia.org/wiki/Rankine_scale', 'R2', 'A1'),
      ];
    default:
      return const [];
  }
}
