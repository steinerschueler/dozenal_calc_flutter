// it manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_it.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersIt() => const [
  ManualChapter('Per iniziare', [
    _H("Le cifre"),
    _P(
      "Questa calcolatrice usa simboli propri per tutte le dodici "
      "cifre. Quattro cifre di ancoraggio sono punte di freccia "
      "stilizzate che puntano nelle quattro direzioni cardinali "
      "— 1 (in alto), 4 (a sinistra), 7 (a destra), A (in basso). "
      "Dividono il cerchio numerico in quattro gruppi di tre, "
      "come le ore 12, 3, 6 e 9 su un quadrante d'orologio.",
    ),
    _P(
      "Tutte le cifre intermedie sono costruite da semicerchi e "
      "cerchi completi. Lo zero è un cerchio semplice, B (= "
      "undici) un semicerchio sopra un cerchio completo.",
    ),
    _DigitLegend(),
    _H("Uso base"),
    _P(
      "Tocca numeri e operatori come su una calcolatrice "
      "tascabile ordinaria. Premi il tasto largo = in basso per "
      "calcolare il risultato. AC (in rosso d'avviso) cancella "
      "tutto l'input e il risultato; Del rimuove il carattere a "
      "sinistra del cursore.",
    ),
    _H("Aiuto e teoria"),
    _P(
      "A sinistra e a destra del tasto =, due bottoni rotondi: "
      "(i) apre questi dodici capitoli teorici, (?) riproduce il "
      "tour rapido con i marcatori rossi. Il tour si apre "
      "automaticamente al primo avvio.",
    ),
    _H("Cursore e navigazione"),
    _P(
      "La barra rossa nel campo di input è il cursore. Usa ◀ e ▶ "
      "per spostarlo, inserendo o eliminando caratteri nel mezzo "
      "di una formula. Dopo un calcolo, il cursore si sposta sul "
      "campo del risultato — le frecce muovono allora il cursore "
      "del risultato. Appena inizi un nuovo input, il cursore "
      "torna al campo di input.",
    ),
    _H("Continuare un calcolo"),
    _P(
      "Dopo un calcolo puoi continuare direttamente con un "
      "operatore. Tocca + 5 = per esempio, e la calcolatrice "
      "usa automaticamente l'ultimo risultato come primo "
      "operando. Per iniziare un calcolo completamente nuovo, "
      "premi prima AC.",
    ),
    _H("Doppio tocco per funzioni inverse"),
    _P(
      "Un secondo tocco su un tasto di funzione lo trasforma "
      "nella sua inversa: sin diventa sin⁻¹, cos diventa cos⁻¹, "
      "e così via. La stessa regola si applica alle funzioni "
      "iperboliche nel pannello di estensione. Un piccolo punto "
      "dorato sul tasto indica che il prossimo tocco invertirà.",
    ),
    _H("Pressione prolungata per più funzioni"),
    _P(
      "I tasti con un piccolo angolo in basso a destra offrono "
      "funzioni correlate con una pressione prolungata: x□ "
      "contiene x², log contiene ln, log₁₂ ed eˣ, − contiene ±, "
      "STO contiene M+ e M−, n! contiene nCr e nPr. Per "
      "scegliere, scorri il dito sull'opzione desiderata e "
      "rilascia — oppure rilascia e tocca l'opzione. Un tocco "
      "fuori chiude il pannello.",
    ),
    _H("Operatori speciali"),
    _P(
      "x² eleva al quadrato il numero precedente. √ calcola la "
      "radice quadrata; se c'è un numero alla sua sinistra, quel "
      "numero è il grado della radice: 3√8 dà la radice cubica di 8, "
      "cioè 2. log calcola un logaritmo dove il numero a sinistra è "
      "l'argomento e quello a destra è la base: 8 log 2 è il logaritmo "
      "di 8 in base 2, cioè 3. ⊕ calcola la somma "
      "parallela: a ⊕ b = (a·b)/(a+b), utile per resistenze in "
      "parallelo.",
    ),
    _H("Pannello di estensione"),
    _P(
      "Il tasto … in basso a destra apre il pannello di "
      "estensione con più funzioni: memoria, costanti (π, e, "
      "φ, √2), funzioni iperboliche, operatori avanzati, più "
      "EXP e DRG. Lo stesso tasto lo chiude, oppure un "
      "tocco fuori dal pannello. Sui tablet tutti i set sono "
      "visibili affiancati comunque — nessuna sovrapposizione.",
    ),
    _Pre(
      "  6 — Memoria:        STO   RCL   MC    Ans\n"
      "  7 — Costanti:       π     e     φ     √2\n"
      "  8 — Iperboliche:    sinh  cosh  tanh  coth\n"
      "  9 — Avanzati:       n!    |x|   1/x   mod\n"
      "  10 — Modi:          EXP   DRG   …",
    ),
    _H("Memoria"),
    _P(
      "STO memorizza il risultato corrente, RCL inserisce il "
      "valore memorizzato nell'input, MC cancella la memoria. "
      "Una piccola M sul display indica che qualcosa è "
      "memorizzato. Ans inserisce il risultato dell'ultimo "
      "calcolo — i valori razionali esatti sono memorizzati "
      "completi, la periodicità è preservata.",
    ),
    _H("Barra di periodo"),
    _P(
      "Quando il risultato è una frazione periodica, la "
      "calcolatrice marca le cifre ripetute con una barra "
      "sopra. Esempio: 1/5 dà 0.2497 con barra sulle quattro "
      "cifre. Per periodi più lunghi di cinque cifre, solo le "
      "prime cinque sono mostrate, seguite da …",
    ),
    _H("Sistema numerico: Doz / Dez"),
    _P(
      "Il sistema numerico si cambia nelle impostazioni, "
      "raggiungibili tramite il tasto (i): duodecimale calcola "
      "in base 12 (predefinito), decimale in base 10. Il sistema "
      "attivo è mostrato in alto a destra del display.",
    ),
    _P(
      "Al cambio, il numero attualmente visibile viene "
      "convertito automaticamente nell'altro sistema. «10» in "
      "Doz diventa «12» in Dez. In modalità Dez i simboli di "
      "10 e 11 diventano inattivi (grigi), poiché non esistono "
      "come cifre singole in base 10 — per Doz basta cambiare "
      "di nuovo.",
    ),
    _H("Modalità angolo"),
    _P(
      "DRG cicla la modalità angolo per le funzioni "
      "trigonometriche: DEG → RAD → GRD → DEG. La modalità "
      "corrente è mostrata in alto a destra del display, "
      "direttamente sopra l'indicatore Doz/Dez. Predefinito: "
      "DEG.",
    ),
  ]),
  ManualChapter('Esponenti, radici e logaritmi', [
    _H('Tre domande su una relazione'),
    _P(
      'Elevare a potenza, estrarre una radice e calcolare un logaritmo '
      'sembrano tre operazioni diverse. In realtà sono tre domande sulla '
      'stessa relazione: b elevato a e dà n, in breve b^e = n. Qui b è la '
      'base, e l\'esponente e n il risultato. Se conosci due di queste tre '
      'quantità puoi trovare la terza — ed è esattamente a questo che servono '
      'i tre tasti x^□, √ e log.',
    ),
    _P(
      'La potenza risponde: base ed esponente sono noti, quanto è grande il '
      'risultato? La radice risponde: risultato ed esponente sono noti, quale '
      'base era? Il logaritmo risponde: base e risultato sono noti, quale '
      'esponente si nasconde? Radice e logaritmo sono quindi le due inverse '
      "dell'elevamento a potenza.",
    ),
    PowerTriangleFigure(power: 'Potenza', base: 'Base', exponent: 'Esponente'),
    _H('Potenze: moltiplicazione ripetuta'),
    _P(
      'La potenza b^e significa, in prima battuta, nient\'altro che '
      'moltiplicare b per se stesso esattamente e volte. Così 2^3 = 2·2·2 = 8 '
      'e 3^2 = 3·3 = 9. '
      "L'elevamento a potenza condensa una moltiplicazione, proprio come la "
      'moltiplicazione condensa un\'addizione.',
    ),
    _P(
      'Da questa semplice idea seguono le leggi degli esponenti, che si '
      'comprendono subito contando i fattori. Moltiplicare due potenze della '
      'stessa base somma gli esponenti: b^m · b^n = b^(m+n) — si mettono '
      'semplicemente i fattori in fila. Elevare una potenza a potenza moltiplica '
      'gli esponenti: (b^m)^n = b^(m·n).',
    ),
    _P(
      'Due casi particolari seguono dalla stessa regola. b^0 vale sempre 1, '
      'perché b^1 diviso b^1 dà sia 1 che b^(1−1) = b^0. E un esponente '
      'negativo significa il reciproco: b^(−n) = 1/b^n, dato che '
      'b^n · b^(−n) deve dare b^0 = 1.',
    ),
    _P(
      'Tracciando i valori di una potenza come 2^x si ottiene una curva che '
      'sale sempre più ripida — la famosa immagine della crescita esponenziale.',
    ),
    ExpCurveFigure(),
    _H('La radice — la prima inversa'),
    _P(
      "La radice annulla l'elevamento a potenza quando l'esponente è noto. "
      'La radice quadrata di 9 è 3, perché 3^2 = 9; la radice cubica di 8 è 2, '
      'perché 2^3 = 8. Sulla calcolatrice √ indica la radice quadrata; se si '
      'digita un numero alla sua sinistra, quel numero diventa l\'indice della '
      'radice — 3√8 è la radice cubica di 8.',
    ),
    _P(
      "Una radice non è altro che una potenza con esponente frazionario: la "
      'radice n-esima di x è x^(1/n). Non è solo una notazione, ma segue '
      'direttamente dalla legge degli esponenti — elevando x^(1/n) alla '
      'potenza n si ottiene x^((1/n)·n) = x^1 = x. Tracciando y = x² e '
      'y = √x sullo stesso grafico, sono immagini speculari rispetto alla '
      'retta y = x. È il segno visibile che una funzione inverte l\'altra.',
    ),
    SquareRootFigure(),
    _H('Il logaritmo — la seconda inversa'),
    _P(
      "Il logaritmo annulla l'elevamento a potenza quando la base è nota. "
      'Risponde: con quale esponente devo elevare la base per ottenere il '
      'risultato? Si scrive log_b(n) = e. Così log_2(8) = 3, perché '
      '2^3 = 8. Sulla calcolatrice si inserisce come 8 log 2 — '
      "l'argomento a sinistra, la base a destra.",
    ),
    _P(
      'Anche il logaritmo è un\'immagine speculare: y = log_2(x) nasce da '
      'y = 2^x per riflessione rispetto alla retta y = x. Dove la curva '
      'esponenziale sale ripida, il logaritmo cresce solo lentamente — '
      'trasforma grandi intervalli in numeri gestibili.',
    ),
    ExpLogFigure(),
    _H('Le leggi dei logaritmi'),
    _P(
      'Poiché il logaritmo inverte le potenze, le leggi degli esponenti si '
      'trasformano in leggi speculari dei logaritmi. Un prodotto diventa una '
      'somma: log(x·y) = log x + log y. Un quoziente diventa una differenza: '
      'log(x/y) = log x − log y. E un esponente nell\'argomento diventa un '
      'fattore davanti: log(x^k) = k · log x.',
    ),
    _P(
      "Questa conversione della moltiplicazione in addizione era per secoli "
      "lo scopo reale dei logaritmi: con le tavole logaritmiche, le "
      "moltiplicazioni faticose potevano essere sostituite da semplici "
      "ricerche e addizioni. Lo stesso principio sta dietro ogni scala "
      "logaritmica — dalla scala dei decibel del suono alla magnitudo dei "
      "terremoti.",
    ),
    _P(
      'La base di un logaritmo è libera, e qualsiasi base si converte in '
      "un'altra: log_b(x) = log_c(x) / log_c(b). ln (base e), log in base 2 "
      'e log₁₂ non sono quindi funzioni fondamentalmente diverse, ma la '
      'stessa domanda su scala diversa — differiscono solo per un fattore '
      'fisso.',
    ),
    _H('I simboli sui tasti'),
    _P(
      'Questa calcolatrice non porta segni familiari come √ o «log». '
      'Al loro posto ogni tasto mostra una x con un piccolo quadrato □ '
      'in un angolo. Il quadrato è il segnaposto per il numero che inserisci '
      '— e l’angolo in cui si trova rivela l’operazione, perché la '
      'posizione rispecchia la consueta notazione matematica.',
    ),
    KeyGlyphsFigure(
      square: 'Quadrato',
      power: 'Potenza',
      root: 'Radice',
      logarithm: 'Logaritmo',
    ),
    _P(
      'Quadrato in alto a destra (x^□) significa elevare a potenza — x alla '
      '□, proprio come l’esponente in xⁿ sta in alto a destra. Quadrato in '
      'alto a sinistra (□√x) significa estrarre una radice — la radice □-esima '
      'di x, proprio come l’indice della radice in ⁿ√x sta in alto a '
      'sinistra. Quadrato in basso a destra (x_□) significa logaritmo — il '
      'logaritmo di x in base □, proprio come la base in log_b sta in basso a '
      'destra. x² è semplicemente la scorciatoia già pronta per «al quadrato». '
      '(Il quarto segno d’angolo — un quadrato in basso a sinistra con un '
      'piccolo + — è l’addizione parallela ⊕, che ha il suo capitolo.)',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'I tre tasti di base si trovano nel Set 2: x^□ (potenza), □√x (radice) '
      'e x_□ (logaritmo). x² nel menu a pressione prolungata '
      'del tasto potenza è la scorciatoia per «al quadrato». Con la pressione '
      'prolungata su log si accede anche a ln, log₁₂ ed eˣ; questi aprono '
      'subito una parentesi in cui digitare l’argomento.',
    ),
    _P(
      "L'operatore potenza è associativo a destra: 2^2^3 significa "
      '2^(2^3) = 2^8, non (2^2)^3. Gli esponenti interi e la notazione '
      'scientifica EXP (a EXP b = a·12^b) rimangono esatti; radici e '
      'logaritmi mostrano invece "≈" anche quando il risultato è un numero '
      'intero — passano attraverso il valutatore approssimato.',
    ),
    _Pre(
      'Input          Risultato   (decimale)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          radice cubica\n'
      '8 log 2    ≈   3          log in base 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H('Potenze di dodici e log₁₂'),
    _P(
      'In base dodici le potenze di dodici sono i numeri tondi, esattamente '
      'come le potenze di dieci nel sistema decimale: dodici si scrive "10", '
      'centoquarantaquattro "100", millesettecentoventotto "1000". Quando si '
      'legge "100" sulla calcolatrice, si pensa a un salto di 144, non di 100.',
    ),
    _P(
      'Per questo log₁₂ è il contatore naturale delle cifre nel sistema '
      'duodecimale — proprio come il logaritmo in base dieci nel sistema '
      'decimale. Per una potenza di dodici, il suo valore è esattamente il '
      'numero di cifre meno uno: log₁₂("10") = 1, log₁₂("100") = 2, '
      'log₁₂("1000") = 3.',
    ),
    _P(
      'Quadrati e cubi sembrano insoliti in duodecimale, ma sono gli stessi '
      'valori — solo scritti diversamente. 4² è "14" (sedici), 5² è "21" '
      '(venticinque), A² è "84" (cento), B² è "A1" (centoventuno). La '
      'matematica non cambia mai con la base di scrittura; anche e e ln sono '
      'indipendenti dalla base. Cambia solo la sequenza di cifre, non il '
      'valore.',
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H('A cosa prestare attenzione'),
    _P(
      'Alcuni input non sono definiti e portano a un errore: il logaritmo '
      'di zero o di un numero negativo, così come le basi 0 e 1. Nemmeno la '
      'radice quadrata di un numero negativo esiste nei reali. Gli esponenti '
      'negativi e frazionari sono invece ammessi senza restrizioni — '
      '8^(−1/3) è 1/2.',
    ),
    _P(
      'E ancora una volta su "≈": non significa "impreciso". Radici e '
      'logaritmi passano sempre attraverso il valutatore in virgola mobile e '
      'portano quindi questo segno, anche quando il risultato è un numero '
      'intero pulito. Il valore visualizzato è corretto — il segno rivela '
      'solo il metodo di calcolo.',
    ),
  ]),
  ManualChapter('Addizione parallela (⊕)', [
    _H("Un'operazione in più"),
    _P(
      'Accanto alle quattro operazioni fondamentali la calcolatrice porta '
      "un'operazione in più, meno nota: l'addizione parallela, scritta con "
      'il segno ⊕. È definita come a ⊕ b = (a·b)/(a+b). Deve il suo nome '
      "all'ingegneria elettrica — descrive la resistenza totale di due "
      'resistori collegati in parallelo — eppure la stessa formula compare '
      'ovunque si sommino non le grandezze stesse, ma i loro reciproci.',
    ),
    _H('La corrente sceglie il percorso più facile'),
    _P(
      'Collegando due resistori in parallelo, si trovano tra gli stessi due '
      'punti; la stessa tensione è su entrambi, e la corrente si divide tra '
      'i due percorsi. Quanta ne scorre in ciascun ramo dipende dalla sua '
      'resistenza — ne scorre di più nel percorso a resistenza minore.',
    ),
    _P(
      'Ciò che conta è la conduttanza, il reciproco della resistenza '
      '(G = 1/R): indica quanto bene un componente lascia passare la '
      'corrente. In un collegamento in parallelo le conduttanze si sommano: '
      '1/R = 1/R₁ + 1/R₂. Risolvendo per R si ottiene esattamente '
      "l'addizione parallela: R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.",
    ),
    ParallelCircuitFigure(),
    _H('Sempre minore del minore'),
    _P(
      'Il risultato sorprendente: la resistenza totale è sempre minore '
      'della minore delle due resistenze singole. Un secondo percorso '
      'lascia passare corrente aggiuntiva, per quanto alta sia la sua '
      'resistenza. Due resistori uguali in parallelo dimezzano il valore: '
      '6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. Un resistore da 6 Ω e uno da 3 Ω danno '
      '18/9 = 2 Ω — meno di 3.',
    ),
    _P(
      'Intuitivamente: due porte affiancate lasciano passare più persone '
      'di una sola; aprire una seconda cassa accorcia la fila. Più percorsi '
      'significano meno resistenza e maggiore flusso.',
    ),
    ParallelBarFigure(lessThanBoth: 'minore di entrambi i valori'),
    _H('Derivare la formula'),
    _P(
      'Il punto di partenza è la regola che i reciproci si sommano: '
      '1/(a⊕b) = 1/a + 1/b. Mettendo il lato destro su un denominatore '
      'comune si ottiene (a+b)/(a·b). Il reciproco di quello è '
      'a ⊕ b = (a·b)/(a+b). Non c\'è altro — l\'intera operazione è '
      '"somma i reciproci e prendi il reciproco del risultato".',
    ),
    _H('Proprietà'),
    _P(
      'Le regole di calcolo seguono dalla simmetria della formula. ⊕ è '
      'commutativa (a ⊕ b = b ⊕ a) e associativa, così si può combinare '
      'qualsiasi numero di valori: con tre termini, si sommano semplicemente '
      'tre reciproci, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. I valori uguali si '
      'semplificano in modo particolarmente elegante — n numeri uguali in '
      'parallelo danno a/n, quindi a ⊕ a = a/2 e a ⊕ a ⊕ a = a/3.',
    ),
    _P(
      "Per i numeri positivi il risultato è sempre inferiore all'operando "
      'minore. Due casi limite completano il quadro: a ⊕ 0 = 0 — un '
      'percorso senza resistenza, un cortocircuito, attira tutta la '
      'corrente. E più b diventa grande, più a ⊕ b si avvicina ad a; una '
      'resistenza infinitamente grande, un\'interruzione, non contribuisce '
      'nulla. "Infinito" è quindi l\'elemento neutro dell\'addizione '
      'parallela — proprio come zero è l\'elemento neutro '
      "dell'addizione ordinaria.",
    ),
    _H('Media armonica e dualità'),
    _P(
      "L'addizione parallela è strettamente legata alla media armonica: la "
      'media armonica di due numeri è 2·(a ⊕ b), e a ⊕ b è al contrario '
      'la metà di essa. Delle tre medie classiche, quella armonica si trova '
      'sempre più in basso — sotto quella geometrica e quella aritmetica.',
    ),
    _P(
      'Visto più in profondità, ⊕ è l\'immagine speculare '
      "dell'addizione ordinaria sotto la mappa dei reciproci x → 1/x: "
      'aggiungere normalmente nello spazio dei reciproci equivale ad '
      'aggiungere in parallelo qui, e viceversa. Il collegamento in serie '
      'e quello in parallelo sono duali in questo senso — la stessa '
      'relazione che intercorre tra molle in serie e in parallelo.',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'Il tasto ⊕ si trova tra i glifi degli operatori nel Set 2, accanto '
      'a x^□, √ e log. Si inserisce a ⊕ b come un calcolo ordinario: '
      'prima a, poi ⊕, poi b, poi =. A differenza di radice e logaritmo, '
      '⊕ calcola esattamente — funziona sulla traccia frazionaria con '
      'rilevamento del periodo e quindi non mostra "≈".',
    ),
    _Pre(
      'Input           Risultato   (decimale)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, periodo 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      "L'ultimo esempio mostra il fascino del duodecimale: "
      '"10" ⊕ "20" — cioè dodici in parallelo a ventiquattro ohm — dà un '
      'netto 8. E 2 ⊕ 3 è periodico in base dodici (1.2497… con sopralineato '
      'su 2497), ma comunque esatto; in base dieci lo stesso risultato '
      'sarebbe semplicemente 1,2.',
    ),
    _H('Quando la somma diventa zero'),
    _P(
      'C\'è un caso in cui ⊕ fallisce: se a + b = 0, ad esempio '
      '5 ⊕ (−5), c\'è uno zero al denominatore, e la calcolatrice segnala '
      'una divisione per zero. Dopo l\'errore si può modificare '
      "l'espressione direttamente — navigarvi con i tasti freccia e "
      'correggere il valore; AC azzera tutto.',
    ),
  ]),
  ManualChapter('Trigonometria', [
    _H('Angoli e le loro misure'),
    _P(
      'La trigonometria è lo studio delle relazioni tra angoli e lunghezze. '
      'Un angolo descrive una rotazione — quanto deve essere ruotato un raggio '
      'attorno al suo punto finale. Si misura in tre unità comuni: in gradi '
      '(un giro completo è 360°), in radianti (un giro completo è 2π) e in '
      'gradianti o gon (un giro completo è 400). La scelta dell\'unità non '
      'cambia l\'angolo stesso — solo il numero che lo descrive. La '
      'calcolatrice passa da una all\'altra con il tasto DRG.',
    ),
    _H('Seno, coseno, tangente nel triangolo'),
    _P(
      'In un triangolo rettangolo ogni angolo acuto θ ha un significato '
      'fisso. Il lato più lungo, opposto all\'angolo retto, è l\'ipotenusa. '
      'Il lato opposto a θ è il cateto opposto, quello adiacente è il '
      'cateto adiacente.',
    ),
    _P(
      'Da questi tre lati si formano tre rapporti che sono sempre uguali '
      'per un angolo dato — indipendentemente dalla dimensione del triangolo: '
      'seno = cateto opposto/ipotenusa, coseno = cateto adiacente/ipotenusa, '
      'tangente = cateto opposto/cateto adiacente = sin/cos. La cotangente è '
      'il reciproco della tangente. Il mnemonico SOH-CAH-TOA riassume i '
      'primi tre.',
    ),
    RightTriangleFigure(
      adjacent: 'Adiacente',
      opposite: 'Opposto',
      hypotenuse: 'Ipotenusa',
      sinRatio: 'sin θ = Opp / Ip',
      cosRatio: 'cos θ = Adi / Ip',
      tanRatio: 'tan θ = Opp / Adi',
    ),
    _H('Il cerchio unitario'),
    _P(
      'I triangoli coprono solo angoli tra 0° e 90°. Il cerchio unitario — '
      'un cerchio di raggio 1 attorno all\'origine — estende la visione a '
      'tutti gli angoli. A ogni angolo θ corrisponde un punto sul cerchio: '
      'si parte dal punto (1, 0) e si ruota in senso antiorario di θ. '
      'Allora il coseno è la coordinata x di questo punto e il seno la '
      'sua coordinata y.',
    ),
    _P(
      'In questo modo anche gli angoli superiori a 90° e gli angoli '
      'negativi trovano posto naturale. A 180° il punto si trova a (−1, 0): '
      'cos 180° = −1, sin 180° = 0. A 270° a (0, −1). La tangente rimane '
      'il rapporto sin/cos e coincide con la definizione del triangolo.',
    ),
    UnitCircleFigure(),
    _H('Pitagora sul cerchio'),
    _P(
      'Poiché il cerchio unitario ha raggio 1, ogni punto su di esso '
      'soddisfa x² + y² = 1. In notazione trigonometrica: '
      'cos²θ + sin²θ = 1. Non è una formula nuova, ma il teorema di '
      'Pitagora applicato al cerchio unitario. Da essa segue subito '
      'sin²θ = 1 − cos²θ — la base di molte trasformazioni.',
    ),
    _H('Onde e periodi'),
    _P(
      'Dopo un giro completo si torna al punto di partenza: seno e coseno '
      'si ripetono con periodo 360° (o 2π). Tracciando sin θ rispetto '
      "all'angolo appare la familiare onda sinusoidale, che oscilla tra "
      '−1 e +1; il coseno è la stessa onda, spostata solo di 90°. Tali '
      'onde descrivono suoni, luce e corrente alternata — ogni oscillazione.',
    ),
    _Pre(
      'θ      sin θ    cos θ    tan θ\n'
      '0°     0        1        0\n'
      '30°    1/2      √3/2     1/√3\n'
      '45°    √2/2     √2/2     1\n'
      '60°    √3/2     1/2      √3\n'
      '90°    1        0        —',
    ),
    SineWaveFigure(),
    _H('Le funzioni inverse'),
    _P(
      "A volte si conosce il rapporto e si cerca l'angolo. Per questo "
      'esistono le funzioni inverse sin⁻¹, cos⁻¹, tan⁻¹ (le funzioni '
      'arco): da sin θ = 0,5 si ricava sin⁻¹(0,5) = 30°. Poiché seno e '
      'coseno sono periodici, a ogni rapporto appartengono infiniti angoli; '
      'le funzioni arco restituiscono quindi solo un intervallo privilegiato '
      '— sin⁻¹ e tan⁻¹ da −90° a +90°, cos⁻¹ da 0° a 180°.',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'Le quattro funzioni sin, cos, tan e cot si trovano sulla tastiera '
      'principale e aprono una parentesi non appena le si preme '
      '(sin( con il cursore all\'interno). Un secondo tocco sullo stesso '
      'tasto passa alla funzione inversa — un punto dorato indica che il '
      'prossimo tocco invertirà. Il tasto DRG cambia la modalità angolo '
      '(DEG → RAD → GRD), mostrata in alto a destra; nel profilo '
      '"Semplice" si fa tramite Impostazioni.',
    ),
    _P(
      'C\'è una trappola duodecimale a cui prestare attenzione: '
      "l'angolo viene inserito nel sistema numerico attivo. In modalità "
      'duodecimale "90" non è novanta gradi ma 9·12 = 108. Per calcolare '
      'sin(90°) si digita "76" (poiché 7·12+6 = 90). Ecco i valori comuni:',
    ),
    _Pre(
      'Gradi (decimale)    Input (duodecimale)\n'
      '30°                 26\n'
      '45°                 39\n'
      '60°                 50\n'
      '90°                 76\n'
      '180°                130\n'
      '360°                260',
    ),
    _P('Qualche esempio calcolato in modalità DEG:'),
    _Pre(
      'Input          significa      Risultato\n'
      'sin(76)        sin 90°        ≈1\n'
      'cos(76)        cos 90°        ≈0\n'
      'sin(26)        sin 30°        ≈0.6\n'
      'cos(50)        cos 60°        ≈0.6\n'
      'sin(39)        sin 45°        ≈0.859A…\n'
      'cos(26)        cos 30°        ≈0.A485…\n'
      'sin⁻¹(1)       angolo per 1   ≈76  (= 90°)',
    ),
    _P(
      'Tutti i risultati trigonometrici portano "≈", perché sin, cos e tan '
      'sono in generale irrazionali — anche quando il valore è netto come '
      'sin(90°) = 1. tan(90°) non è definita; la calcolatrice mostra un '
      'numero molto grande, perché cos(90°) è computazionalmente appena '
      'non zero.',
    ),
    _H('Angoli in base dodici'),
    _P(
      'Anche i consueti valori del giro completo sembrano strani in '
      'duodecimale: 360° si scrive "260" (2·144 + 6·12), 400 gradianti '
      '"294". Solo il radiante sfugge alla questione — 2π è una costante, '
      'indipendente dal sistema numerico; chi lavora in RAD evita del '
      'tutto la trappola.',
    ),
    _P(
      'Che il giro completo abbia 360 parti si adatta bene al dodici: 360 '
      'ha moltissimi divisori (due dozzine), quindi il cerchio si divide '
      'nettamente in metà, terzi, quarti, sesti e altro — e 12·30 = 360, '
      'un dodicesimo del cerchio è esattamente 30°. Come sempre: la '
      'trigonometria stessa è indipendente dal sistema numerico. sin(30°) '
      'è ½, sia che si scriva l\'angolo "30" in decimale sia "26" in '
      'duodecimale. Cambiano solo le cifre dell\'input.',
    ),
  ]),
  ManualChapter('Memorizzare e richiamare', [
    _P(
      'Una calcolatrice diventa veramente veloce solo quando non si devono '
      'più riscrivere continuamente i numeri. Quattro strumenti si prendono '
      'cura di questo lavoro: l\'ultimo risultato (Ans), una memoria con '
      'nome (STO/RCL), un accumulatore (M+/M−) e il nastro della '
      'cronologia della sessione. Non si sovrappongono, ma ciascuno copre '
      'una situazione diversa.',
    ),
    _H("L'ultimo risultato: Ans"),
    _P(
      "Dopo ogni calcolo la calcolatrice memorizza il risultato con il "
      'nome Ans. Se si continua direttamente con un operatore — ad esempio '
      '"× 2 =" subito dopo un risultato — Ans viene usato automaticamente '
      'come primo operando, senza toccare il tasto. Questo è il gesto più '
      'comune quando si calcola in catena: il risultato di un passo diventa '
      'silenziosamente l\'inizio del successivo.',
    ),
    _P(
      "Se si ha bisogno dell'ultimo risultato non all'inizio ma nel mezzo "
      "di una nuova formula, lo si inserisce esplicitamente con Ans. "
      'Importante: Ans conserva sempre il risultato completo — inclusa una '
      'frazione periodica, non solo le cifre visibili.',
    ),
    _H('La memoria: STO, RCL, MC'),
    _P(
      'Ans ha un punto debole: il prossimo "=" lo sovrascrive. Per '
      'conservare un valore attraverso più calcoli indipendenti, si '
      'deposita con STO nella memoria. Una piccola "M" in cima al display '
      'indica che qualcosa è conservato. RCL inserisce il valore '
      'memorizzato di nuovo nell\'input in corrispondenza del cursore — '
      'quante volte si vuole. MC svuota la memoria, e la "M" si spegne.',
    ),
    _P(
      'Uno scenario tipico: si calcola il raggio di un cerchio e poi si ha '
      'bisogno di esso sia per l\'area che per la circonferenza. Il raggio '
      'viene memorizzato una volta con STO; entrambe le formule lo '
      'richiamano indipendentemente con RCL, senza mai riscriverlo.',
    ),
    _H("L'accumulatore: M+ e M−"),
    _P(
      'A volte non si vuole conservare un singolo valore ma costruire un '
      'totale progressivo — ad esempio quando si sommano molte voci. Per '
      'questo ci sono M+ e M−, raggiungibili con una pressione prolungata '
      'su STO. M+ aggiunge l\'ultimo risultato al valore memorizzato, M− '
      'lo sottrae. La memoria cresce o diminuisce ad ogni operazione, senza '
      'dover vedere o annotare il subtotale. RCL mostra il totale finale, '
      'MC azzera l\'accumulatore.',
    ),
    MemoryFlowFigure(result: 'Risultato', store: 'Memoria', input: 'Input'),
    _P(
      'Lo schema riassume i percorsi: STO porta il risultato nella memoria, '
      'RCL lo recupera da lì nell\'input. Ans prende la scorciatoia '
      'direttamente dal risultato all\'input e bypassa la memoria '
      '(tratteggiato). M+/M− riporta il risultato nella memoria in un '
      'ciclo e lo aggiunge lì.',
    ),
    _H('Ans o memoria — quando quale?'),
    _P(
      'La scelta segue una semplice regola pratica. Si usa Ans quando il '
      'risultato è necessario immediatamente nel passo successivo — veloce '
      'e senza preparazione. Si usa la memoria quando un valore deve essere '
      'disponibile attraverso più calcoli separati o protetto al sicuro dal '
      'prossimo "=". M+ e M− sono un livello sopra: non servono a richiamare '
      'un singolo valore, ma a sommare molti risultati individuali in un '
      'totale.',
    ),
    _H('Memorizzato esattamente — nessun errore di arrotondamento'),
    _P(
      'La maggior parte delle calcolatrici lavora internamente con numeri '
      'in virgola mobile a precisione fissa. Ciò che mostrano è già '
      'arrotondato — e proprio questo valore arrotondato finisce in '
      'memoria. Continuando a calcolare, si porta l\'errore con sé; dopo '
      'diversi passi un risultato che dovrebbe essere esattamente 1 mostra '
      '"0,9999…".',
    ),
    _P(
      'Questa calcolatrice invece conserva i risultati razionali come una '
      'vera frazione di interi arbitrariamente grandi — senza arrotondamento. '
      'E proprio questa frazione va in memoria: STO, RCL, Ans e '
      "l'accumulatore preservano numeratore e denominatore completamente, "
      'non solo le cifre visibili. Un esempio: 1 ÷ 7 è periodico in '
      'duodecimale (blocco 186A35). Memorizzando il risultato e '
      'moltiplicandolo poi per 7, viene fuori esattamente 1 — perché la '
      'calcolatrice non ha mai portato altro che 1/7. Un dispositivo che '
      'memorizza solo le cifre visualizzate arriverebbe a "0.BBBB…".',
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (periodo, con sopralineato)\n'
      '… STO          →  "M" appare; memorizzato: esattamente 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (non 0.BBBB…)',
    ),
    _P(
      'La calcolatrice rimane onesta al suo limite: i risultati irrazionali '
      '— radici, logaritmi, trigonometria — non può conservarli come '
      'frazioni. Portano "≈" e vengono memorizzati come approssimazione. '
      'La regola è facile da leggere: se "≈" precede il valore, ciò che è '
      'memorizzato è un\'approssimazione; se è assente, è esatto.',
    ),
    _H('Il nastro della cronologia'),
    _P(
      'Per riutilizzare un calcolo precedente, si scorre verso il basso '
      'sul display. Si apre il nastro della cronologia della sessione '
      'corrente — il calcolo più recente in cima, fino a trenta voci. '
      'Nemmeno AC lo cancella; viene conservato per tutta la sessione. '
      'Un tocco su una voce riporta il suo valore risultante nell\'input, '
      'proprio come Ans — ma per qualsiasi passo precedente.',
    ),
    HistoryBandFigure(swipe: 'scorri', newCap: 'nuovo', tap: 'tocca'),
    _P(
      'Il nastro della cronologia non è una memoria permanente, ma uno '
      'sguardo indietro: conserva il filo di una sessione e permette di '
      'recuperare un valore calcolato ma non memorizzato appositamente.',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'STO, RCL, MC e Ans si trovano nel pannello di estensione: aprirlo '
      'con il tasto "…" e poi toccare la funzione desiderata. M+ e M− si '
      'nascondono dietro una pressione prolungata su STO — il piccolo '
      'angolo in basso a destra del tasto lo indica; nel popup si sceglie '
      'M+ o M−. Nel profilo "Semplice" non c\'è pannello di estensione; '
      'le funzioni di memoria non sono disponibili lì.',
    ),
    _P('Tre esempi calcolati (in modalità duodecimale):'),
    _Pre(
      'Memorizzare e inserire dopo\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  "M" appare\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Continuare direttamente con Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 automaticamente)',
    ),
    _Pre(
      'Sommare voci con M+\n'
      '  … MC                   svuota la memoria\n'
      '  5 =   … STO(tieni) M+  →  memoria 5\n'
      '  7 =   … STO(tieni) M+  →  memoria 10\n'
      '  3 =   … STO(tieni) M+  →  memoria 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      'Come verifica in decimale: 5 + 7 + 3 = 15, e 15 è duodecimale "13" '
      '(1·12 + 3). Tutti e quattro gli strumenti — Ans, memoria, '
      'accumulatore e nastro della cronologia — lavorano sullo stesso '
      'valore esatto; chi li conosce non ha quasi bisogno di digitare un '
      'numero a mano o tenere un subtotale in testa.',
    ),
  ]),
  ManualChapter('Funzioni iperboliche', [
    _P(
      'A scuola si imparano seno e coseno come coordinate di un punto sul '
      'cerchio unitario. Meno noti, ma altrettanto fondamentali, sono i '
      'loro analoghi iperbolici sinh e cosh. Nascono quando si sostituisce '
      'il cerchio con un\'iperbole — e la chiave è la funzione esponenziale '
      'eˣ.',
    ),
    _H('Le metà pari e dispari di eˣ'),
    _P(
      'Ogni funzione può essere divisa in una parte pari (simmetrica '
      "rispetto all'asse y) e una parte dispari (simmetrica rispetto "
      "all'origine). Per eˣ si possono scrivere entrambe le parti "
      'direttamente: cosh è la parte pari, sinh la parte dispari. '
      'Sommandole di nuovo si ottiene eˣ — poiché eˣ = cosh x + sinh x, '
      'e e⁻ˣ = cosh x − sinh x. Questa decomposizione non è arbitraria, '
      'ma l\'unica possibile.',
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      'tanh è il quoziente, coth il suo reciproco (e quindi definito solo '
      'per x ≠ 0). A destra ci sono le inverse, a cui torneremo tra poco.',
    ),
    _H("L'iperbole unitaria"),
    _P(
      "Sul cerchio unitario ogni punto (cos t, sin t) soddisfa l'equazione "
      'x² + y² = 1. Per le funzioni iperboliche vale un\'identità quasi '
      'identica, ma crucialmente diversa. Sostituendo le definizioni e '
      'calcolando la differenza dei quadrati, i termini misti si annullano:',
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      "Quindi il punto (cosh t, sinh t) si trova sempre sulla curva "
      'x² − y² = 1, l\'iperbole unitaria. Poiché cosh t non è mai minore '
      'di 1, il punto rimane sempre sul ramo destro. L\'identità '
      'cosh²t − sinh²t = 1 svolge lo stesso ruolo nel mondo iperbolico '
      'che cos²t + sin²t = 1 in quello circolare — solo che il più è '
      'diventato un meno.',
    ),
    UnitHyperbolaFigure(area: 'Area = t/2'),
    _H('Il parametro: un\'area, non un angolo'),
    _P(
      'Qui sta la differenza più profonda con la trigonometria. Sul cerchio '
      'il parametro t è l\'angolo in radianti — e allo stesso tempo la '
      'lunghezza dell\'arco e il doppio dell\'area del settore; questi tre '
      'significati coincidono casualmente lì. Sull\'iperbole non esiste '
      'un tale angolo. Ciò che rimane è l\'area: t è il doppio dell\'area '
      'del settore iperbolico tra l\'origine, il vertice (1, 0) e il punto '
      '(cosh t, sinh t) — esattamente l\'area ombreggiata nella figura '
      'sopra.',
    ),
    _P(
      'Da qui il nome delle inverse. Si chiamano funzioni area — arsinh, '
      'arcosh, artanh — dal latino "area". Il diffuso "arcsinh" di alcuni '
      'dispositivi è strettamente parlando sbagliato: trasferisce il '
      'prefisso arco ("arc") a una funzione dove non c\'è nessun arco. '
      'arsinh(y) è quel valore del parametro t con sinh t = y — cioè '
      'un\'area, non un arco.',
    ),
    _H('La forma delle quattro curve'),
    _P(
      'cosh è una vasca simmetrica assialmente aperta verso l\'alto con '
      'il punto minimo in (0, 1), poiché cosh 0 = 1; il suo valore non '
      'è mai minore di 1. sinh è simmetrica rispetto all\'origine, '
      'passa per l\'origine e cresce senza limiti in entrambe le direzioni. '
      'Per x grande entrambe si avvicinano alla curva eˣ/2.',
    ),
    _P(
      'tanh è una curva di saturazione a forma di S: strettamente '
      'crescente, attraverso l\'origine, e rimane strettamente tra '
      '−1 e +1 — questi limiti vengono avvicinati, mai raggiunti. coth '
      'infine si comporta come il reciproco di tanh, ma poiché sinh 0 = 0 '
      'ha un polo in x = 0 e rimane al di fuori di [−1, 1].',
    ),
    HyperbolicCurvesFigure(),
    _H('Parentela con la trigonometria'),
    _P(
      'Entrambe le famiglie sono tessute dallo stesso materiale: la '
      'funzione esponenziale. La formula di Eulero scrive le funzioni '
      'circolari in modo del tutto analogo — '
      'cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). Lo schema è '
      'lo stesso; solo per le funzioni circolari la funzione esponenziale '
      'corre sull\'asse immaginario (argomento i·t), per quelle iperboliche '
      "sull'asse reale (argomento x). Se i numeri complessi sono ancora "
      'poco familiari, si può saltare questo pensiero — l\'unica cosa '
      'importante è: nel suo nucleo è la stessa funzione.',
    ),
    _P(
      'Geometricamente è la stessa costruzione — un punto su una curva, '
      'parametrizzato dal doppio dell\'area del settore — solo una volta '
      'sul cerchio, una volta sull\'iperbole. Da questo segue il segno '
      'ribaltato: cos² + sin² = 1 rispetto a cosh² − sinh² = 1. '
      'Sostituendo un argomento immaginario, le famiglie passano '
      'direttamente l\'una nell\'altra: cos(i·x) = cosh x e '
      'sin(i·x) = i·sinh x. Le funzioni iperboliche sono quindi '
      '"le funzioni trigonometriche con argomento immaginario".',
    ),
    _P(
      'Anche i teoremi di addizione corrono in parallelo: '
      'sinh(a+b) = sinh a·cosh b + cosh a·sinh b, esattamente come per '
      'il seno. Per il coseno invece un segno si ribalta — cos(a+b) ha '
      'un meno, cosh(a+b) un più. Questa è la regola di Osborn: ogni '
      'identità trigonometrica diventa iperbolica sostituendo sin→sinh, '
      'cos→cosh e ribaltando il segno ovunque appaia un prodotto di due '
      'fattori seno. Un segno sbagliato si trova quasi sempre esattamente '
      'in questo punto.',
    ),
    _H('Applicazioni nel mondo'),
    _P(
      'La più nota è la catenaria. Una fune appesa liberamente tra due '
      'punti non forma una parabola — persino Galileo cadde in questo '
      'errore — ma la curva y = a·cosh(x/a). Con una freccia bassa le due '
      'sembrano simili; con una profonda la differenza diventa chiara: la '
      'catenaria cresce più velocemente di qualsiasi parabola. Al '
      'contrario — come arco cosh aperto verso il basso — descrive la '
      'forma ideale di una volta portante che trasmette il suo carico '
      'puramente attraverso la compressione.',
    ),
    CatenaryFigure(catenary: 'Catenaria', parabola: 'Parabola'),
    _P(
      'Anche la caduta con resistenza dell\'aria appartiene qui: se la '
      'forza frenante cresce con il quadrato della velocità, la velocità '
      'segue una curva tanh e si avvicina dolcemente alla velocità '
      'terminale, senza mai superarla — la saturazione di tanh è qui la '
      'fisica stessa.',
    ),
    _P(
      'In relatività infine, le velocità vicino alla velocità della luce '
      'non si sommano semplicemente. Introducendo la "rapidità" φ tramite '
      'v = c·tanh φ, la complicata formula di addizione torna semplice: '
      'le rapidità si sommano ordinariamente (φ = φ₁ + φ₂), proprio '
      'perché tanh ha il suo teorema di addizione. Ciò che il radiante '
      'è nella geometria piana, la rapidità è nella geometria dello '
      'spaziotempo.',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'Le quattro funzioni si trovano nel Set 8, il pannello di estensione: '
      'aprirlo con il tasto "…", poi toccare sinh, cosh, tanh o coth. '
      'Ognuna apre subito una parentesi (sinh( con il cursore all\'interno); '
      'se quella di chiusura manca, la calcolatrice la aggiunge al "=". '
      'Un secondo tocco sullo stesso tasto passa alla funzione area '
      '(sinh ↔ arsinh e così via) — un punto dorato indica che il '
      'prossimo tocco invertirà.',
    ),
    _P(
      'La differenza più importante dalla trigonometria: l\'argomento è un '
      'numero puro, non un angolo. La modalità angolo (DEG/RAD/GRD) non ha '
      'alcun effetto sulle funzioni iperboliche — nessuna conversione di '
      'gradi, nessuna trappola degli angoli duodecimali come con sin e cos. '
      'sinh(2) significa lo stesso in qualsiasi modalità. Poiché queste '
      'funzioni sono trascendenti, i loro risultati portano sempre "≈".',
    ),
    _P('Esempi calcolati (tutti i risultati ≈, duodecimale abbreviato):'),
    _Pre(
      'Input         decimale    duodecimale\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1.1752      1.2128B7B6…\n'
      'cosh(1)       1.5431      1.66253A10…\n'
      'tanh(1)       0.7616      0.91804BB6…\n'
      'arsinh(1)     0.8814      0.A6B01B51…\n'
      'arcosh(2)     1.3170      1.397853260…',
    ),
    _P(
      "L'identità fondamentale può essere verificata direttamente: "
      'cosh(2)² − sinh(2)² dà ≈1. Matematicamente è esattamente 1; il '
      'piccolo resto in virgola mobile è sotto la soglia di visualizzazione, '
      'e la calcolatrice lo blocca sul netto 1.',
    ),
    _P(
      'Al di fuori del loro dominio le funzioni segnalano un errore — '
      'bisogna poi azzerare con AC:',
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = dec. 0,5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      'arsinh è definita per qualsiasi numero; arcosh richiede x ≥ 1; '
      'artanh richiede |x| < 1; arcoth vive esattamente al di fuori, '
      'a |x| > 1. Chi lo tiene a mente evita i messaggi di errore '
      'fin dall\'inizio.',
    ),
  ]),
  ManualChapter('Set 9 e 10', [
    _P(
      'Gli ultimi due pannelli del campo di estensione raccolgono ciò di '
      'cui una calcolatrice scientifica ha altrimenti bisogno: il conteggio '
      '(fattoriale e combinatoria), tre operatori utili (valore assoluto, '
      'reciproco, resto) e la notazione scientifica. Tutto si trova dietro '
      'il tasto "…".',
    ),
    _H('Fattoriale: la porta al conteggio'),
    _P(
      'Il fattoriale di un intero n, scritto n!, è il prodotto di tutti i '
      'numeri da 1 a n: n! = 1·2·3·…·n. Come caso speciale vale 0! = 1. '
      'I primi valori sono innocui — 3! = 6, 4! = 20, 5! = A0 (= 120 '
      'decimale) — ma poi la sequenza esplode: 10! (dodici fattoriale) è '
      'già 114500000 in base dodici, quasi mezzo miliardo.',
    ),
    _P(
      'A cosa serve? n! conta le disposizioni. Cinque ospiti possono essere '
      'seduti in fila in 5! = A0 modi: cinque scelte per il primo posto, '
      'poi quattro per il secondo, tre per il terzo e così via. Il '
      'fattoriale è il mattone per tutto il resto. Sulla calcolatrice '
      'n! è esatto — il risultato non porta "≈".',
    ),
    _H('Permutazioni: selezione con ordine'),
    _P(
      'Spesso non si dispone tutto, ma si scelgono r tra n cose — e '
      "l'ordine conta. Una gara con otto piloti: quanti podi (1°, 2°, 3°) "
      'sono possibili? Otto per l\'oro, sette per l\'argento, sei per il '
      'bronzo: 8·7·6 = 240 (= 336 decimale). In generale questo è nPr '
      '(n permuta r) = n!/(n−r)!. Si divide per (n−r)! perché i fattori '
      'inferiori si annullano.',
    ),
    _H('Combinazioni: selezione senza ordine'),
    _P(
      "A volte l'ordine è irrilevante — in un mazzo di carte, al lotto, "
      'in una stretta di mano. Il numero di selezioni non ordinate si '
      'chiama nCr ("n scegli r") = n!/(r!·(n−r)!). Il collegamento è '
      'semplice: ogni selezione non ordinata di r cose può essere disposta '
      'in r! modi, quindi nCr = nPr/r!. Tre su sei per un comitato: '
      '6 nCr 3 = 18 (= 20 decimale). Le strette di mano in un gruppo di '
      'n persone sono n nCr 2 — con cinque persone A (= 10), con una '
      'dozzina già 56 (= 66 decimale).',
    ),
    _P(
      'Una sottigliezza di questi due: nCr e nPr sono costruiti da '
      'fattoriali in virgola mobile e portano quindi sempre "≈", anche '
      'quando il risultato — come quasi sempre — è un numero intero. '
      'Al lotto numerico (sei su 49), ad esempio, 49 nCr 6 dà ≈48245A0 '
      '— ben quattordici milioni di possibilità per una schedina.',
    ),
    _H('Il triangolo di Pascal'),
    _P(
      'Disponendo i valori nCr riga per riga emerge uno schema: nella riga '
      'n si trovano, uno dopo l\'altro, n nCr 0, n nCr 1, …, n nCr n. '
      'Ogni numero è la somma dei due sopra di lui — così il triangolo '
      'cresce interamente senza fattoriali. I bordi sono tutti uno, ed è '
      'simmetrico (n nCr r = n nCr (n−r)).',
    ),
    PascalTriangleFigure(title: 'Triangolo di Pascal'),
    _P(
      'In base dodici il triangolo appare quasi come al solito — solo nella '
      'riga 5 compare una "A" invece di dieci. Gli stessi numeri sono tra '
      "l'altro i coefficienti di (a+b)ⁿ: dalla riga 4 (1, 4, 6, 4, 1) si "
      'legge direttamente (a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴. '
      'Questo collega combinatoria e algebra in un unico quadro.',
    ),
    _H('Valore assoluto e reciproco'),
    _P(
      'Il valore assoluto |x| è la distanza di un numero dallo zero — '
      'il segno viene scartato, |−7| = 7. Una sottigliezza di input: gli '
      'operatori postfix (|x|, n!, 1/x) si legano più strettamente del '
      'meno iniziale. "−5" seguito da |x| dà quindi −(|5|) = −5; se si '
      'vuole il valore assoluto del numero negativo, si usano le parentesi: '
      '(−5) poi |x| dà 5.',
    ),
    _P(
      'Il reciproco 1/x è il partner moltiplicativo: x · (1/x) = 1, e '
      'la calcolatrice lo conserva esattamente come frazione. Il '
      'duodecimale lo mostra in modo particolarmente elegante — 1/4 è un '
      'netto 0.3 (tre dodicesimi sono un quarto) e 1/3 è 0.4, dove la '
      'base dieci cade già nel periodico 0,333…. Il reciproco di zero '
      'non è definito.',
    ),
    _H('Modulo: resti e cicli'),
    _P(
      'Sette diviso tre fa due, resto uno — ed è esattamente questo resto '
      'che dà "7 mod 3 = 1". L\'immagine più intuitiva è l\'orologio: '
      'dopo dodici il conteggio ricomincia, "14:00" è "le 2 del pomeriggio", '
      'perché 14 mod 12 = 2. '
      "L'orologio conta in base dodici — non è un caso.",
    ),
    ModuloClockFigure(
      title: 'Modulo — aritmetica dell\'orologio',
      wrap: 'giro',
      note: '(= 17 dec., 17 mod 12 = 5)',
    ),
    _P(
      'Il modulo è lo strumento naturale per la divisibilità: a mod b = 0 '
      'significa esattamente che b divide a. Il duodecimale ha una '
      'particolare nitidezza, perché dodici ha un numero insolitamente '
      'grande di divisori — 1, 2, 3, 4, 6 e 12, contro solo 1, 2, 5, 10 '
      'per il dieci. La divisibilità per due, tre, quattro o sei si può '
      'spesso leggere dalle ultime cifre in duodecimale.',
    ),
    _H('Notazione scientifica in potenze di dodici'),
    _P(
      'I numeri molto grandi o piccoli si scrivono in modo compatto come '
      'mantissa per una potenza della base. In decimale "3 EXP 8" significa '
      'il valore 3 × 10⁸. Questa calcolatrice porta il principio '
      'coerentemente in base dodici: in modalità duodecimale "a EXP b" '
      'non significa a × 10ᵇ ma a × 12ᵇ. L\'esponente conta le potenze '
      'di dodici.',
    ),
    DozenalPowersScaleFigure(
      title: 'Potenze di dodici — 1 EXP n',
      dozLabel: 'Doz.',
      decLabel: 'Dec.',
    ),
    _P(
      'Queste potenze hanno persino nomi propri: 12¹ = una dozzina, '
      '12² = 144 = un gros, 12³ = 1728 = un grande gros. Scritti in '
      'duodecimale sono esattamente le posizioni tonde 10, 100, 1000. '
      'Così "1 EXP 2" dà il valore 100 (= 144 decimale) e "1 EXP 3" il '
      'valore 1000 (= 1728). Per esponenti interi calcola la traccia '
      'esatta; in modalità decimale EXP conta di nuovo in potenze di dieci.',
    ),
    _H('Modalità angolo e chiusura'),
    _P(
      'Il Set 10 contiene anche DRG e Close. DRG cicla la modalità angolo '
      '(DEG → RAD → GRD) per le funzioni trigonometriche — trattato in '
      'dettaglio nel capitolo sulla trigonometria; nel profilo "Semplice" '
      'si imposta tramite Impostazioni. Close ripiega il pannello di '
      'estensione, il corrispettivo del tasto "…". Il precedente '
      'interruttore Doz/Dez è passato dalla tastiera alle Impostazioni.',
    ),
    _H('Su questa calcolatrice'),
    _P(
      'Tutti questi tasti si raggiungono attraverso il pannello di '
      'estensione "…" (nel profilo "Semplice" il Set 9 e 10 sono nascosti). '
      'n!, |x| e 1/x agiscono in postfix — prima il numero, poi il tasto; '
      'mod, nCr e nPr sono binari (a mod b). Una pressione prolungata su '
      'n! apre il popup con nCr e nPr; il piccolo angolo in basso a destra '
      'del tasto lo indica.',
    ),
    _P('Esempi calcolati (in modalità duodecimale):'),
    _Pre(
      'Input         significa             Risultato\n'
      '5!            5·4·3·2·1            A0      (= 120)\n'
      '4 → 1/x       reciproco di 4       0.3     (esatto)\n'
      '7 mod 3       resto di 7 ÷ 3       1\n'
      '5 nCr 2       combinazioni         ≈A      (= 10)\n'
      '8 nPr 3       permutazioni         ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²              100     (= 144)\n'
      '2 EXP 3       2 × 12³              2000    (= 3456)',
    ),
    _P(
      'Esatti sono n!, |x|, 1/x e mod (nessun "≈"); solo nCr e nPr portano '
      'il segno di approssimazione. Al di fuori dell\'intervallo valido le '
      'funzioni segnalano un errore — poi azzerare con AC:',
    ),
    _Pre(
      '0 → 1/x       reciproco di zero    DIV BY ZERO\n'
      '7 mod 0       resto per zero       DOMAIN ERROR\n'
      '(−4)!         fattoriale negativo  DOMAIN ERROR',
    ),
    _P(
      'Con questo la cassetta degli attrezzi è completa: dalla semplice '
      'pressione di cifre delle operazioni di base fino a combinatoria, '
      'modulo e notazione degli ordini di grandezza duodecimale, la '
      'calcolatrice calcola esattamente ovunque può, e onestamente con '
      '"≈" ovunque è possibile solo un\'approssimazione.',
    ),
  ]),
];
