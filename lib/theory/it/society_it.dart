part of '../society_theory.dart';

List<ProseChapter> _societyChaptersIt() => const [
  ProseChapter('Un movimento per il dodici', [
    ProseSection(
      'Singoli precursori',
      'L\'idea di calcolare in dodici anziché in dieci è antica. A lungo, però, '
          'ci furono solo singoli sostenitori, non un movimento. Già nel XVIII '
          'secolo viene citato il naturalista Buffon — la fonte precisa, '
          'tuttavia, è incerta e passa da un\'opera di consultazione '
          'all\'altra.\n\n'
          'Diventa più concreto nel XIX secolo. L\'inventore della stenografia '
          'Isaac Pitman, a partire dal 1857, si fece promotore del dodici e '
          'propose simboli propri per il dieci e l\'undici. Il filosofo Herbert '
          'Spencer sostenne questa causa nel 1896, espressamente contro il '
          'sistema metrico.',
    ),
    ProseSection(
      'Andrews e «New Numbers»',
      'A dare concretezza alla cosa fu un americano: Frank Emerson Andrews. Nel '
          '1934 uscì il suo saggio «An Excursion in Numbers» sull\'Atlantic '
          'Monthly — una rivista che, per sua stessa ammissione, non aveva mai '
          'pubblicato matematica prima di allora e che corredò il testo, in '
          'mezzo alla pagina, di un avviso per i lettori restii alla '
          'matematica.\n\n'
          'Nel 1935 seguì il suo libro «New Numbers», il primo del suo genere '
          'negli Stati Uniti. Il suo argomento era semplice: il dodici è '
          'divisibile per 2, 3, 4 e 6, il dieci solo per 2 e 5. Andrews era però '
          'realista — riteneva improbabile un\'effettiva conversione, contro la '
          '«tenace forza dell\'abitudine».',
    ),
    ProseSection(
      'Nascono le società',
      'Dalle lettere giunte in risposta all\'articolo di Andrews nacque una '
          'cerchia di corrispondenti e da questa, nel 1944, la «Duodecimal '
          'Society of America». Il nome glielo diede scherzosamente Ralph '
          '«Whiskers» Beard; il capitale iniziale lo donò George Terry. Più '
          'tardi venne rinominata «Dozenal Society of America» — perché nella '
          'parola «duodecimal» è contenuto il decimale «decimal».\n\n'
          'Nel 1959 si aggiunse la consorella britannica, la Dozenal Society of '
          'Great Britain, con il matematico A. C. Aitken come membro di spicco. '
          'La società americana pubblica ancora oggi il «Duodecimal Bulletin»; '
          'tra i suoi membri onorari figurava lo scrittore di fantascienza Isaac '
          'Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('Nuove cifre per il dieci e l\'undici', [
    ProseSection(
      'Il problema dei simboli',
      'Chi calcola in dodici ha bisogno di due cifre aggiuntive — per il dieci '
          'e per l\'undici. Quali debbano essere non è chiarito in modo unitario '
          'ancora oggi; persino la società americana non prescrive una notazione '
          'fissa.\n\n'
          'Esistono diverse varianti: il due e il tre rovesciati di Pitman (↊ e '
          '↋), la X corsiva e la E arrotondata di Andrews, un sestile e un '
          'doppio cancelletto (ispirati ai tasti del telefono), i glifi del '
          'disegnatore di caratteri Dwiggins — e semplicemente le lettere A e B '
          'del mondo informatico.',
    ),
    ProseSection(
      'Pitman, Unicode e il cambiamento del 2026',
      'La società americana cambiò i propri simboli più volte: sestile e doppio '
          'cancelletto fino al 2008 circa, poi i glifi di Dwiggins, dal 2015 le '
          'cifre di Pitman. Nel 2015 anche lo standard Unicode accolse '
          'ufficialmente i simboli di Pitman.\n\n'
          'All\'inizio del 2026 la società convertì i propri siti web alle '
          'lettere A e B — non perché rinunciasse a Pitman, ma perché i caratteri '
          'speciali su molti browser e telefoni non vengono ancora visualizzati '
          'in modo affidabile. Nel bollettino stampato le cifre di Pitman '
          'restano lo standard. (Questa app mostra sul display, a scelta, glifi '
          'propri oppure 0–9 / A, B.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'Il pezzo di dozenale più noto nella cultura popolare è una canzone: '
          '«Little Twelvetoes» dalla serie didattica statunitense Schoolhouse '
          'Rock, scritta e cantata da Bob Dorough, trasmessa per la prima volta '
          'nel 1973.\n\n'
          'In essa un amichevole extraterrestre con dodici dita dei piedi mostra '
          'come qualcuno con dodici «dita» avrebbe inventato due nuove cifre — '
          'pronunciate «dek» per il dieci ed «el» per l\'undici. Era ritenuta '
          'troppo difficile per i bambini delle elementari e veniva trasmessa più '
          'di rado degli altri episodi, ma rimase impressa nella memoria di '
          'molti.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, gro, mo — parlare dozenale', [
    ProseSection(
      'Dozzina, grossa e grossa di grosse',
      'Il dodici, in base dodici, diventa «10». Per le sue posizioni esistono da '
          'tempo parole quotidiane: dodici pezzi sono una dozzina, dodici dozzine '
          '(144) una grossa, dodici grosse (1728) una grossa di grosse.\n\n'
          'È notevole: queste familiari parole commerciali sono in realtà già '
          'valori posizionali dozenali — una dozzina è il «10», la grossa il '
          '«100», la grossa di grosse il «1000» del mondo del dodici.',
    ),
    ProseSection(
      'Dek, el e la denominazione sistematica',
      'Le due nuove cifre si pronunciano per lo più «dek» (dieci) ed «el» '
          '(undici). Per le posizioni si usano in breve do, gro, mo (da dozen, '
          'gross, great gross).\n\n'
          'Accanto a ciò esiste una denominazione sistematica, sviluppata nella '
          'comunità online: radici lessicali fisse per le cifre (un, bi, tri … '
          'dec, lev) più desinenze per le potenze del dodici — «-qua» verso '
          'l\'alto, «-cia» verso il basso. Bello in tutto questo: «uncia» è '
          'esattamente un dodicesimo — la stessa parola latina da cui sono nati '
          '«pollice» (inch) e «oncia».',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, società e strumenti oggi', [
    ProseSection(
      'TGM — un sistema di misura dozenale',
      'Tom Pendlebury, della società britannica, progettò un sistema di misura '
          'dozenale completo: TGM, dal nome delle sue tre unità fondamentali '
          'Tim, Grafut e Maz.\n\n'
          'Diversamente dal sistema metrico, non comincia dalla lunghezza, ma dal '
          'tempo e ricava tutto dalla gravità terrestre. Il «Grafut» (piede '
          'gravitazionale) è poco al di sotto di un piede. Da esso seguono in '
          'modo coerente le unità per superficie, volume, velocità e forza — un '
          'corrispettivo in sé compiuto del sistema metrico, interamente in '
          'dodici.',
    ),
    ProseSection(
      'Le società oggi',
      'Entrambe le società esistono tuttora, ma sono piccole e basate sul '
          'volontariato; cifre attendibili sui membri non ce ne sono. Quella '
          'americana pubblica ancora il Duodecimal Bulletin e mette a '
          'disposizione strumenti di apprendimento e di conversione, quella '
          'britannica cura soprattutto il materiale sul TGM.\n\n'
          'Il luogo più vivace è il forum online «Dozensonline». Lì nacquero la '
          'denominazione sistematica dei numeri e il dibattito mai del tutto '
          'concluso sulle cifre giuste. La comunità è piccola, ma attiva.',
    ),
    ProseSection(
      'Calcolatrici, app — e questa app',
      'Attorno al dodici è nata una scena di strumenti sorprendentemente vivace: '
          'calcolatrici dozenali, convertitori di misure, persino un orologio '
          'dozenale e un calendario, molti dei quali open source e costruiti da '
          'membri delle società.\n\n'
          'Questa app si inserisce proprio lì — una calcolatrice che calcola '
          'nativamente in base dodici, con glifi propri, frazioni esatte e una '
          'parte dedicata alle unità. È un piccolo contributo a una lunga e '
          'amorevole tradizione di nicchia.',
    ),
    ProseSection(
      'Perché il mondo resta comunque decimale',
      'Che il dodici non si affermi non dipende quasi affatto dalla matematica — '
          'questa è dalla sua parte. Dipende dall\'abitudine: il sistema decimale '
          'è radicato nella lingua, nella scuola, nel diritto e nella tecnica, e '
          'una conversione sarebbe enormemente onerosa. Persino il ben più '
          'piccolo passaggio degli USA al sistema metrico fallì per questo '
          'motivo.\n\n'
          'Di conseguenza, oggi, la maggior parte di chi se ne occupa intende la '
          'cosa più come un affascinante esperimento mentale che come un serio '
          'piano di conversione. Mostra che la scelta della base numerica non è '
          'scontata — e affina lo sguardo sui numeri con cui abbiamo a che fare '
          'ogni giorno.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — una calcolatrice dozenale', [
    ProseSection('Un\'app per la base dodici', 'Dozecal è una calcolatrice per iPhone che calcola nativamente in base dodici. È stata pubblicata nel 2020 dallo sviluppatore indipendente Johan Kovacs; l\'app è gratuita. Il suo obiettivo dichiarato è promuovere l\'uso della base dodici nella matematica e nelle scienze.\n\nIl calcolo avviene a scelta in modalità duodecimale o decimale. Quando si passa dall\'una all\'altra, il valore visualizzato viene convertito automaticamente. Le funzioni trigonometriche operano con i gradi come unità di misura.'),
    ProseSection('Notazione polacca inversa', 'Una particolarità di Dozecal è l\'inserimento in notazione polacca inversa (RPN). Invece di «3 + 4 =» si digita «3 4 +» — prima i due numeri, poi l\'operazione di calcolo. All\'inizio risulta insolito, ma fa del tutto a meno delle parentesi ed è stato a lungo diffuso su molte calcolatrici scientifiche (per esempio quelle della Hewlett-Packard).'),
    ProseSection('Parte del panorama degli strumenti dozenali', 'Dozecal non è realizzata da un\'associazione, bensì da una singola persona; nella sua descrizione rimanda alla Dozenal Society of America per ulteriori informazioni sulla base dodici. In questo modo appartiene al piccolo ma vivace panorama degli strumenti dozenali — accanto a questa app, ai materiali TGM e ad altre calcolatrici.'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Il Dozenal Calculator di Paul Rapoport', [
    ProseSection('Una calcolatrice nel browser', 'Il Dozenal Calculator di Paul Rapoport è una calcolatrice scientifica che funziona direttamente nel browser web: gratuita e senza installazione. Calcola in base dodici e può mostrare i risultati anche in forma decimale in qualsiasi momento; la base numerica si può cambiare liberamente, e sono disponibili più registri indipendenti. Una guida dettagliata è allegata in formato PDF.'),
    ProseSection('Forte nella teoria dei numeri', 'Particolarmente ricca è la teoria dei numeri, cosa che si addice bene a una base apprezzata proprio per la sua divisibilità. La calcolatrice trova il massimo comune divisore e il minimo comune multiplo, elenca tutti i divisori di un numero e lo scompone in fattori primi (a scelta con la loro molteplicità). A ciò si aggiungono la somma dei divisori, il numero dei divisori e la funzione φ di Eulero, ovvero la quantità di numeri minori che sono coprimi con esso.'),
    ProseSection('L\'intera cassetta degli attrezzi scientifica', 'Anche per il resto la cassetta degli attrezzi è completa: quadrato e radice quadrata, potenze e radici arbitrarie, la funzione esponenziale e i logaritmi — il logaritmo naturale così come le basi due e dieci e un logaritmo a base arbitraria. Vi sono inoltre le funzioni trigonometriche e iperboliche con le loro inverse, la combinatoria (combinazioni e permutazioni, anche con ripetizione), la statistica di base (media e deviazione standard), il fattoriale, una funzione percentuale, la funzione Gamma e l\'unità immaginaria i.'),
    ProseSection('Moltissime grandezze', 'Oltre al puro calcolo, il programma copre decine di grandezze fisiche e le converte le une nelle altre: tempo e ora del giorno, frequenza, velocità, lunghezza, area, volume secco e volume liquido, massa, forza, pressione, energia, potenza, temperatura e angolo. Sono incluse anche le unità di tempo dozenali.'),
    ProseSection('Fino all\'elettrotecnica', 'Insolito per una calcolatrice dozenale è quanto si spinga nella fisica applicata: dispone di propri ambiti di grandezza per l\'impedenza elettrica, la quantità elettrica (carica), il potenziale elettrico (tensione) e la corrente elettrica. In questo modo si può eseguire in base dodici anche il calcolo dell\'elettrotecnica.'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
