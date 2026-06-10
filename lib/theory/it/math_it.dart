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
  ProseChapter(
    'Divisori, frazioni e periodi',
    [
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
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
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
        'Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2',
        'A1',
      ),
      Source(
        'Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html',
        'R1',
        'A2',
      ),
      Source(
        'Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Numeri ciclici',
    [
      ProseSection(
        'Il settimo e i suoi parenti',
        'Un settimo in base dodici non viene netto, ma si ripete: un settimo = 0,186A35, poi di nuovo 186A35, senza fine. (A sta per dieci, B per undici.) Il gruppo che si ripete è il periodo; qui è lungo sei cifre.\n\n'
            'La cosa stupefacente appare quando si affiancano gli altri settimi. Due settimi = 0,35186A, tre settimi = 0,5186A3, quattro settimi = 0,6A3518, cinque settimi = 0,86A351, sei settimi = 0,A35186. Ogni volta sono le stesse sei cifre nella stessa sequenza — ma la sequenza inizia in un punto diverso. Le si può immaginare disposte su un anello che ruota di un passo ad ogni frazione.',
      ),
      ProseSection(
        'Quando i multipli ruotano',
        'La stessa rotazione si nasconde nella tavola pitagorica del periodo stesso. Se si prende la sequenza di cifre 186A35 come numero intero e la si moltiplica in ordine, si ottengono di nuovo solo rotazioni: 186A35 × 2 = 35186A, × 3 = 5186A3, × 4 = 6A3518, × 5 = 86A351, × 6 = A35186. Un numero con questa proprietà si chiama numero ciclico.\n\n'
            'Il settimo passo chiude il cerchio: 186A35 × 7 = BBBBBB. Solo undici — la cifra più alta della base dodici, sei volte di seguito. Non è un caso: BBBBBB è esattamente uno in meno della posizione tonda successiva. In base dieci si conosce lo stesso trucco con il famoso numero 142857 (il periodo di un settimo nel sistema decimale): anche lì i multipli danno rotazioni, e 142857 × 7 = 999999. Le cifre sono diverse, la struttura è la stessa.',
      ),
      ProseSection(
        'Perché esattamente sei cifre',
        'Che il periodo sia lungo esattamente sei cifre — e non di meno — ha una ragione chiara. Nella divisione scritta rimane un resto ad ogni passo, e il periodo finisce non appena si ripete un resto. Per un settimo compaiono in sequenza tutti e sei i possibili resti da 1 a 6, prima che il primo si ripeta. Non ci possono essere più di sei resti diversi per il sette, quindi sei è la lunghezza massima possibile.\n\n'
            'Un numero primo il cui reciproco raggiunge questo periodo di massima lunghezza si chiama numero primo a periodo completo. Solo in quel caso i multipli attraversano tutte le rotazioni, e solo allora nasce un numero ciclico. Se un numero primo è a periodo completo dipende da come le potenze della base — qui dodici — si comportano divise per quel numero primo.',
      ),
      ProseSection(
        'Il complemento alla cifra più alta',
        'Il periodo 186A35 porta in sé anche un secondo schema. Se lo si divide a metà e si sommano le due metà, si ottiene 186 + A35 = BBB — di nuovo solo undici, questa volta tre. Le due metà si completano esattamente fino alla cifra più alta.\n\n'
            'È un teorema generale (di Étienne Midy, 1836) e vale in qualsiasi base: in base dieci è 142 + 857 = 999. L\'effetto mostra che la seconda metà del periodo non è materiale nuovo, ma il riflesso della prima.',
      ),
      ProseSection(
        'Non ogni numero primo partecipa',
        'La bella rotazione è l\'eccezione, non la regola. Un undicesimo mostra in base dodici solo il periodo 0,1 — un unico uno che si ripete, perché dodici sta uno sopra undici (il corrispettivo di un nono = 0,1 nel sistema decimale). Un tredicesimo dà 0,0B con il breve periodo 0B. Tali numeri primi non generano un numero ciclico.\n\n'
            'Tra i numeri primi piccoli, in base dodici 5, 7, 17, 31, 41 e 43 (contati in decimale) sono numeri primi a periodo completo — notevolmente tutti con la cifra finale 5 o 7 in base dodici. Questa è una condizione necessaria, ma non sufficiente: il diciannove termina anch\'esso con 7, ma ha solo un periodo di sei cifre. Anche il cambiamento di base conta: il cinque è a periodo completo in base dodici (un quinto = 0,2497, periodo 2497), mentre nel sistema decimale un quinto è netto. Quali numeri primi partecipano appartiene quindi alla coppia formata da base e numero primo, non al numero primo da solo.',
      ),
      ProseSection(
        'Quanti ce ne sono — una questione aperta',
        'Si potrebbe pensare che una proprietà così netta sia già stata contata da tempo. Non è così. Quanti numeri primi a periodo completo esistono in base dodici — se siano infiniti — non è ancora dimostrato.\n\n'
            'Una congettura di Emil Artin del 1927 prevede che circa trentasette primi su cento debbano essere a periodo completo, in base dodici come in ogni altra base adatta. Le osservazioni sui numeri piccoli si accordano con questo ordine di grandezza. Ma la congettura è appunto una congettura: nonostante grandi sforzi, non è dimostrata per nessuna singola base. Questo fa parte di una presentazione onesta — uno schema dall\'apparenza semplice, dietro cui si cela un problema ancora aperto oggi.',
      ),
      ProseSection(
        'Da provare nella calcolatrice',
        'Tutto ciò si può verificare qui. Se si digita un settimo e si preme uguale, il display mostra 0, con una linea sopra 186A35 — le sei cifre del periodo. Per due settimi appare la stessa sequenza come 35186A, ruotata; non è un arrotondamento, ma esattamente lo stesso schema. Un quinto mostra la linea sopra 2497, un undicesimo solo sopra la singola cifra 1.\n\n'
            'Gli esempi più grandi rendono visibili i limiti: una frazione con denominatore trentuno (in decimale) ha un periodo lungo trenta cifre — qui il display accorcia con tre puntini, perché non tutto entra in una riga. Come la calcolatrice calcoli le frazioni esatte e i loro periodi è spiegato nel capitolo «Come calcola questa calcolatrice».',
      ),
    ],
    sources: [
      Source(
        'Cyclic number — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_number',
        'R2',
        'A1',
      ),
      Source(
        'Full reptend prime — Wikipedia',
        'https://en.wikipedia.org/wiki/Full_reptend_prime',
        'R2',
        'A1',
      ),
      Source(
        '142857 — Wikipedia',
        'https://en.wikipedia.org/wiki/142857',
        'R2',
        'A1',
      ),
      Source(
        'Midy’s theorem — Wikipedia',
        'https://en.wikipedia.org/wiki/Midy%27s_theorem',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative order — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_order',
        'R2',
        'A1',
      ),
      Source(
        'Artin’s conjecture on primitive roots — Wikipedia',
        'https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots',
        'R2',
        'A1',
      ),
      Source(
        'Orders of Units in Modular Arithmetic (Keith Conrad, UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
      Source(
        'OEIS A019340 — Primes with primitive root 12',
        'https://oeis.org/A019340',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Divisibilità e la prova dell’undici',
    [
      ProseSection(
        'L’ultima cifra rivela molto',
        'In base dodici l’ultima cifra di un numero non è altro che il suo resto nella divisione per dodici. Per questo si vede subito dall’ultima cifra se il numero è divisibile per uno dei divisori del dodici. Le cifre finali pari (0, 2, 4, 6, 8, A) significano divisibilità per due. Se il numero termina con 0, 3, 6 o 9, è divisibile per tre; con 0, 4 o 8, per quattro; con 0 o 6, per sei; con il solo 0, per dodici. (A sta qui per dieci.)\n\n'
            'Questo è un vantaggio concreto del dodici. Nel sistema decimale l’ultima cifra rivela solo la divisibilità per due, cinque e dieci — per tre, quattro o sei bisogna calcolare. Il dodici mette in evidenza esattamente i piccoli divisori frequenti.',
      ),
      ProseSection(
        'La prova dell’undici: conta la somma delle cifre',
        'Per l’undici (B) l’ultima cifra non aiuta, ma c’è un’operazione altrettanto semplice: la somma delle cifre. Un numero è divisibile per undici in base dodici esattamente quando la sua somma delle cifre è divisibile per undici. Il motivo è elegante: dodici lascia il resto uno nella divisione per undici, e così fa ogni posizione superiore — quindi conta solo il totale delle cifre.\n\n'
            'È l’esatto corrispettivo della nota prova del nove nel sistema decimale, dove la somma delle cifre verifica il nove. In base dodici verifica l’undici — da qui il nome prova dell’undici. Un esempio: il numero 4B7 ha la somma delle cifre 4 + B + 7, cioè quattordici più otto, che fa ventidue — e ventidue è due volte undici, quindi 4B7 è divisibile per undici. Come la prova del nove, la prova dell’undici serve come rapido controllo del calcolo: se la prova non torna, nel risultato c’è un errore.',
      ),
      ProseSection(
        'Il tredici alla somma alternata',
        'Una seconda prova cattura il tredici. Qui si sommano le cifre alternatamente più e meno, cominciando da destra — la somma alternata. Se questa è divisibile per tredici, lo è anche il numero. Il motivo è lo specchio della prova dell’undici: dodici si trova uno sotto tredici, perciò le posizioni cambiano segno nella divisione per tredici.\n\n'
            'Un piccolo ostacolo per chi è abituato al sistema decimale: lì la «prova dell’undici» è proprio la variante alternata, perché l’undici si trova uno sopra dieci. In base dodici i ruoli sono scambiati — la semplice somma appartiene all’undici, quella alternata al tredici. (Il tredici stesso si scrive in base dodici come 11, un dodici e un’unità; si intende sempre il suo valore.)',
      ),
      ProseSection(
        'Dove il dodici fa fatica',
        'Nessun vantaggio è gratuito. Il cinque e il sette non condividono alcun fattore con il dodici e non si adattano nemmeno all’undici o al tredici — per loro non esiste in base dodici una comoda regola sull’ultima cifra o sulla somma. Proprio il cinque, che nel sistema decimale ha la prova più semplice di tutte (ultima cifra zero o cinque), diventa qui scomodo.\n\n'
            'È lo scambio onesto: il dodici ci regala le prove facili per tre, quattro e sei, e in cambio ci toglie la facile prova del cinque. Quale lato pesa di più dipende da quali divisori si usano più spesso nella vita quotidiana — e di solito sono quelli piccoli.',
      ),
    ],
    sources: [
      Source(
        'Divisibility rule — Wikipedia',
        'https://en.wikipedia.org/wiki/Divisibility_rule',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Casting out nines — Wikipedia',
        'https://en.wikipedia.org/wiki/Casting_out_nines',
        'R2',
        'A1',
      ),
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Trucchi nella tavola pitagorica',
    [
      ProseSection(
        'Serie con una coda corta',
        'La tavola pitagorica del dodici ha dodici serie, e alcune si imparano quasi da sole — quelle dei divisori. I loro multipli terminano con schemi brevi e ricorrenti. La serie del sei termina alternativamente con 6 e 0 (6, 10, 16, 20, 26, 30 …). La serie del quattro va 4, 8, 0, 4, 8, 0; quella del tre 3, 6, 9, 0 e di nuovo dall’inizio; quella del due rimane sempre pari.\n\n'
            'Due operazioni sono particolarmente comode. Moltiplicare per dodici significa semplicemente aggiungere uno zero: sette per dodici è 70. E la serie del sei è la metà della serie del dodici — sei per un numero pari termina con 0, sei per un numero dispari con 6.',
      ),
      ProseSection(
        'La serie dell’undici come specchio',
        'La serie più bella appartiene all’undici (B): B, 1A, 29, 38, 47, 56, 65, 74, 83, 92, A1, B0. Contiene due schemi insieme. La cifra anteriore sale passo dopo passo — 0, 1, 2, 3 e così via —, mentre quella posteriore scende al medesimo ritmo. E in ogni risultato le due cifre sommano a undici: uno e dieci, due e nove, tre e otto.\n\n'
            'È esattamente lo specchio della serie del nove nel sistema decimale, dove le cifre si completano a nove. Ne deriva un trucco comodo: invece di moltiplicare per undici, si prende per dodici e si sottrae il numero una volta. Undici per sette fa quindi settanta meno sette, cioè 65 in base dodici — e in effetti nella tabella undici per sette appare 65.',
      ),
      ProseSection(
        'Le serie ostinate: cinque e sette',
        'Non tutte le serie sono così accomodanti. Il cinque e il sette non condividono alcun fattore con il dodici, e le loro serie percorrono perciò tutte e dodici le possibili ultime cifre prima che qualcosa si ripeta — nessun ciclo breve che aiuti a memorizzare. La serie del cinque termina in ordine con 5, A, 3, 8, 1, 6, B, 4, 9, 2, 7, 0; quella del sette è ugualmente discontinua.\n\n'
            'Qui ritorna un antico quartetto: proprio le serie dell’uno, del cinque, del sette e dell’undici percorrono per intero tutte le ultime cifre — gli stessi quattro numeri che sull’orologio generano l’intero cerchio e corrispondono alle terminazioni dei numeri primi. Ed è esattamente per questo che un quinto e un settimo hanno quei periodi lunghi e completi del capitolo sui numeri ciclici. Nel sistema decimale la serie del sette è la famosa ostica; in base dodici sono il cinque e il sette insieme.',
      ),
      ProseSection(
        'Quadrati e la grossa',
        'Percorrendo la tabella in diagonale da sinistra in alto verso destra in basso, si trovano i numeri quadrati: 1, 4, 9, 14, 21, 30, 41, 54, 69, 84, A1 — e infine 100. Quest’ultimo è dodici per dodici, cioè centoquarantaquattro, che in base dodici si chiama semplicemente «100» ed è noto da sempre come la grossa. Il dodici scrive il proprio numero quadrato in modo tanto tondo quanto il sistema decimale scrive il cento.\n\n'
            'Anche raddoppiare e dimezzare è facile in base dodici, perché dodici è pari e divisibile per quattro: la metà di 10 è 6, la metà di 6 è 3, la metà di 3 è 1,6. Così molte operazioni si scompongono nella testa in passi piccoli e puliti — il vero motivo per cui gli amici del dodici trovano piacevole calcolare con esso.',
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
        'Multiplication table — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplication_table',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Le basi numeriche a confronto',
    [
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
    ],
    sources: [
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Octal — Wikipedia',
        'https://en.wikipedia.org/wiki/Octal',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Una breve storia dei sistemi posizionali',
    [
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
    ],
    sources: [
      Source(
        'Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2',
        'A2',
      ),
      Source(
        'Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number',
        'R3',
        'A2',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360',
        'R2',
        'A2',
      ),
    ],
  ),
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
  ProseChapter(
    'Fibonacci, quadrati e curiosità',
    [
      ProseSection(
        '144 — dove due mondi si incontrano',
        'La successione di Fibonacci inizia con 1, 1, e ogni numero successivo '
            'è la somma dei due precedenti: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Cresce in modo esponenziale — i termini diventano '
            'molto grandi rapidamente. I numeri quadrati 1, 4, 9, 16, 25, 36, … '
            'crescono invece solo in modo quadratico, quindi molto più '
            'lentamente. Due successioni che crescono così diversamente non '
            'hanno quasi alcun motivo di incontrarsi mai.\n\n'
            'Eppure lo fanno: il dodicesimo numero di Fibonacci è 144, e '
            '144 = 12² è un numero quadrato. Scriviamo questo termine '
            'brevemente F₁₂ = 144. In base 12 il 144 è anche «100», il primo '
            'numero a tre cifre, e nel commercio la grossa — una dozzina di '
            'dozzine. Tre proprietà coincidono in un unico numero.\n\n'
            'Che questo non sia mera coincidenza ma un caso unico lo ha '
            'dimostrato J. H. E. Cohn nel 1964: a parte 0, 1 e 144 non esiste '
            'nella successione infinita di Fibonacci nessun altro numero che '
            'sia al tempo stesso un quadrato perfetto. La sua dimostrazione è '
            'elementare ma non semplice; usa la successione di Lucas, strettamente '
            'correlata, e argomenti di divisibilità. Il dodici si trova così a '
            'un incrocio provato e unico di due successioni numeriche '
            'fondamentali — una particolarità, non misticismo.\n\n'
            'Un teorema ancora più forte del 2006 (Bugeaud, Mignotte e Siksek) '
            'va oltre: le uniche potenze perfette in tutta la successione di '
            'Fibonacci sono 0, 1, 8 = 2³ e 144 = 12². L\'affermazione di Cohn '
            'sui quadrati ne è il caso speciale.',
      ),
      ProseSection(
        'La sezione aurea',
        'Dividendo un numero di Fibonacci per il suo predecessore, questi '
            'rapporti si avvicinano sempre di più a un numero fisso: la sezione '
            'aurea φ = (1+√5)/2 ≈ 1,618. Formalmente F(n+1)/F(n) → φ. Johannes '
            'Kepler notò questa approssimazione già nel 1611. In base 12 '
            'φ ≈ 1,74BB677…; il calcolatore porta φ come costante nel '
            'pannello espanso.\n\n'
            'φ ha una semplice proprietà definitoria: φ² = φ + 1. È l\'unico '
            'numero positivo il cui quadrato è maggiore di esattamente 1. '
            'Chi digita φ² = nel calcolatore ottiene esattamente φ + 1 — '
            'l\'identità diventa immediatamente visibile.\n\n'
            'In natura φ appare davvero dove foglie e semi crescono sfalsati '
            'dell\'«angolo aureo»; i numeri delle spirali di girasoli o pigne '
            'sono spesso numeri di Fibonacci adiacenti. Molto di ciò che viene '
            'attribuito a φ non regge però all\'esame: la spirale della '
            'Nautilus non segue φ, e un uso consapevole nel Partenone o in '
            'Leonardo da Vinci non è documentato. φ è reale in matematica e '
            'nella fillotassi — non ovunque.',
      ),
      ProseSection(
        'Il dodici come numero con molti divisori',
        'La teoria dei numeri conosce diversi modi precisi per descrivere un '
            'numero come «ricco di divisori» — e il dodici compare in alcuni di '
            'essi. Il dodici è altamente composto: ha più divisori di qualsiasi '
            'numero più piccolo. I suoi divisori sono 1, 2, 3, 4, 6, 12 — '
            'sei in tutto; nessun numero inferiore a 12 ne ha altrettanti. '
            'Srinivasa Ramanujan studiò questa classe nel 1915 in un celebre '
            'articolo nei Proceedings of the London Mathematical Society.\n\n'
            'Il dodici è inoltre il più piccolo numero abbondante: la somma '
            'dei suoi divisori propri, 1+2+3+4+6 = 16, supera il numero stesso. '
            'Per i numeri più piccoli è il contrario — per 10 si ottiene '
            '1+2+5 = 8, meno di 10. Il dodici è il primo numero in cui i '
            'divisori «traboccano».\n\n'
            'Una proprietà più rara: il dodici è un numero sublime. Ciò '
            'significa che ben due quantità caratteristiche dei suoi divisori '
            'sono esse stesse numeri perfetti. Il numero dei divisori è 6 '
            '(e 6 = 1+2+3 è perfetto). La somma di tutti i divisori è '
            '1+2+3+4+6+12 = 28 (e 28 = 1+2+4+7+14 è anch\'esso perfetto). '
            'Ad oggi sono noti solo due numeri sublimi — il dodici e un numero '
            'di 76 cifre. Il termine proviene però dalla matematica ricreativa '
            'ed è strettamente costruito; la sua rarità non è quindi prova di '
            'un significato cosmico, ma conseguenza di una definizione speciale.',
      ),
      ProseSection(
        'Una piramide di palle da cannone',
        'Impilando palle da cannone in una piramide a base quadrata, la '
            'n-esima piramide contiene 1² + 2² + … + n² palle. Thomas Harriot '
            'derivò questa formula delle somme intorno al 1587, quando Sir '
            'Walter Raleigh volle sapere come contare le palle impilate.\n\n'
            'Una domanda più difficile è: quando una tale piramide è al tempo '
            'stesso un quadrato perfetto di palle? Esiste un solo caso non '
            'banale, e si presenta bello: '
            '1² + 2² + … + 24² = 4900 = 70². Le stesse 4900 palle si possono '
            'disporre come piramide di 24 strati o come quadrato 70×70. '
            'Édouard Lucas congetturò nel 1875 che questa sia l\'unica '
            'soluzione; la dimostrazione completa arrivò solo nel 1918 da '
            'G. N. Watson — il problema era davvero difficile.\n\n'
            'Il numero 24 è esattamente il doppio di 12. È una bella '
            'osservazione — ma onestamente non un motivo documentato: il 24 '
            'compare qui perché l\'equazione sottostante ha esattamente questa '
            'soluzione, non per un legame con la base dodici.',
      ),
      ProseSection(
        'La città ideale di Platone',
        'Nelle sue «Leggi» (libro V) Platone chiede quanti cittadini dovrebbe '
            'avere una città ideale. La sua risposta: 5040. L\'argomento non è '
            'mistico, ma pratico — una città deve dividere continuamente i '
            'propri cittadini in gruppi uguali, e 5040 è divisibile per ogni '
            'numero da 1 a 12, con la sola eccezione dell\'11. '
            '(Per la divisibilità per 11 Platone suggerisce di sottrarre due '
            'famiglie.)\n\n'
            'Ciò che Platone descrive qui è la stessa intuizione alla base del '
            'sistema dozenale: nella vita quotidiana i piccoli divisori sono '
            'quelli importanti. 5040 = 7! è in un certo senso la sorella '
            'maggiore del dodici — la stessa filosofia della divisibilità, '
            'applicata a un\'intera popolazione cittadina anziché a un sistema '
            'numerico.',
      ),
      ProseSection(
        'La curiosità non è numerologia',
        'Il dodici porta molte etichette insieme: altamente composto, '
            'abbondante, sublime, indice dell\'unico quadrato di Fibonacci non '
            'banale. Questa concentrazione fa impressione — ma ogni proprietà è '
            'una definizione propria e indipendente. Il fatto che coincidano non '
            'è causa né simbolo di qualcosa di superiore. Ciò che distingue '
            'davvero il dodici è la sua piccolezza: è il più piccolo numero con '
            'queste proprietà; numeri più grandi come 24, 36 o 60 hanno '
            'addirittura più divisori.\n\n'
            'Un errore diffuso va chiarito apertamente: il dodici viene spesso '
            'chiamato «numero perfetto». Matematicamente è falso. '
            'Perfetto significa: la somma dei divisori propri dà il numero '
            'stesso — come per 6 (1+2+3) o 28 (1+2+4+7+14). Per il dodici i '
            'divisori propri danno 16, cioè più di 12. Il dodici è abbondante, '
            'non perfetto. La confusione risale a Nicomaco di Gerasa '
            '(intorno al 100 d.C.), che associava queste classi numeriche a '
            'giudizi morali — un\'interpretazione dell\'antichità, non matematica.\n\n'
            'Il valore di questo capitolo sta esattamente nella distinzione: '
            'il teorema di Cohn, l\'identità delle palle da cannone e il più '
            'piccolo numero abbondante sono fatti dimostrati. Meritano di essere '
            'visti per quello che sono — bella e onesta matematica, che non ha '
            'bisogno di cariche mistiche.',
      ),
    ],
    sources: [
      Source(
        'Square Fibonacci Numbers, Etc. (J. H. E. Cohn, 1964)',
        'https://math.la.asu.edu/~checkman/SquareFibonacci.html',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci and Lucas perfect powers (Bugeaud, Mignotte, Siksek, 2006) — Annals of Mathematics',
        'https://annals.math.princeton.edu/2006/163-3/p05',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci sequence — Wikipedia',
        'https://en.wikipedia.org/wiki/Fibonacci_sequence',
        'R2',
        'A1',
      ),
      Source(
        'Cannonball problem — Wikipedia',
        'https://en.wikipedia.org/wiki/Cannonball_problem',
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
        'Abundant number — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundant_number',
        'R2',
        'A1',
      ),
      Source(
        'Sublime number — Wikipedia',
        'https://en.wikipedia.org/wiki/Sublime_number',
        'R2',
        'A1',
      ),
      Source(
        '5040 (number) — Wikipedia',
        'https://en.wikipedia.org/wiki/5040_(number)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'L’orologio come gruppo (ℤ/12ℤ)',
    [
      ProseSection(
        'Calcolare come sul quadrante',
        'Sull’orologio le undici più due ore non fanno tredici, ma l’una. Si calcola normalmente e alla fine si prende il resto nella divisione per dodici. In modo figurato, la retta dei numeri infinita viene avvolta su un cerchio con dodici tacche; ogni numero atterra su una delle tacche da 0 a 11.\n\n'
            'Queste dodici tacche con l’addizione delle ore formano un piccolo sistema di calcolo ben definito. Rimane sempre chiuso in sé (ogni somma è di nuovo una delle dodici tacche), esiste lo zero come «non cambia nulla», e per ogni passo esiste una via di ritorno: cinque in avanti è compensato da sette indietro, perché 5 + 7 = 12 = 0. Un sistema di calcolo con queste proprietà si chiama in matematica un gruppo. L’orologio delle ore è l’esempio più intuitivo in assoluto; il suo nome è ℤ/12ℤ, pronunciato «Z modulo dodici».',
      ),
      ProseSection(
        'Quali passi raggiungono tutti i campi',
        'Muovendosi a passi di uno attorno al cerchio, si raggiunge una dopo l’altra ogni tacca prima di tornare al punto di partenza. Ma non con qualsiasi ampiezza di passo. Saltando sempre di tre, si atterra solo su 0, 3, 6, 9 e dopo quattro salti si è di ritorno — otto campi restano intatti. Saltando di quattro, si raggiunge solo 0, 4, 8.\n\n'
            'Tutte e dodici le tacche vengono raggiunte da un’ampiezza di passo esattamente quando essa non ha alcun divisore comune con il dodici. Questo vale per quattro passi: 1, 5, 7 e B (= undici). Esattamente quattro — non è un caso, ma un valore caratteristico del dodici che incontreremo ancora due volte. Questi quattro sono i passi «buoni» che generano l’intero cerchio.',
      ),
      ProseSection(
        'I sottogruppi sul quadrante',
        'Le ampiezze di passo che raggiungono solo una parte delle tacche disegnano sul quadrante figure regolari. Il passo di sei collega 0 e 6 in una linea attraverso il centro. Il passo di quattro disegna il triangolo 0–4–8, il passo di tre il quadrato 0–3–6–9, il passo di due l’esagono delle ore pari. Ognuna di queste figure è a sua volta un piccolo orologio chiuso in sé — un sottogruppo.\n\n'
            'È notevole: ad ogni divisore del dodici — 1, 2, 3, 4, 6, 12 — corrisponde esattamente una tale figura, né più né meno. Il dodici ha tanti divisori quanti nessun numero più piccolo, perciò il suo quadrante porta così tante figure ordinate. Un ipotetico orologio a dieci ore avrebbe solo i divisori 1, 2, 5, 10 — nessun triangolo, nessun quadrato. La stessa divisibilità che caratterizza il dodici come base di conteggio rende il suo quadrante così ricco.',
      ),
      ProseSection(
        'Lo stesso orologio in musica',
        'I dodici semitoni di un’ottava formano lo stesso cerchio: dopo dodici passi di semitono si è di ritorno alla nota di partenza, un’ottava più in alto. Trasportare una melodia in un’altra tonalità significa ruotare tutti i suoni dello stesso passo — addizione sul cerchio dei suoni.\n\n'
            'Il circolo delle quinte, che i musicisti imparano a memoria, non è altro che il passo di sette su questo cerchio: una quinta pura misura sette semitoni, e poiché il sette è uno dei quattro passi buoni, il circolo percorre tutti e dodici i suoni prima di chiudersi. La quarta (cinque semitoni) ruota lo stesso circolo al contrario. I passi con un divisore comune, invece, rimangono intrappolati in una figura e danno esattamente gli accordi simmetrici noti: la terza maggiore il triangolo, il tritono la linea. Perché ci siano esattamente dodici semitoni e come suonino è trattato nel capitolo sul dodici in musica; qui conta solo che sia lo stesso cerchio.',
      ),
      ProseSection(
        'E nei numeri primi',
        'Un terzo luogo mostra lo stesso quartetto. Se si scrivono i numeri primi in base dodici, ogni numero primo superiore al tre termina con una delle cifre 1, 5, 7 o B. Altre ultime cifre sono impossibili: un numero che termina con 0, 2, 4, 6, 8 o A è pari; uno che termina con 3, 6, 9 è divisibile per tre. Restano esattamente le quattro cifre che non condividono alcun divisore con il dodici — di nuovo 1, 5, 7, B.\n\n'
            'Sono le stesse quattro dei passi buoni e degli intervalli che generano il circolo. Un’ultima cifra di questo quartetto è però solo una condizione necessaria, non una prova: 25 termina in base dodici con 1, ma è cinque per cinque. La cifra esclude molti numeri come primi, ma non ne incorona nessuno.',
      ),
      ProseSection(
        'Addizionare sempre, dividere non sempre',
        'Sull’orologio delle ore si può anche moltiplicare — e qui finisce la bella chiusura. Nell’addizione ogni passo ha una via di ritorno; nella moltiplicazione no. Non esiste un’ora per cui si possa moltiplicare il due e arrivare netto all’uno, perché il doppio è sempre pari. Il due non ha un inverso sull’orologio del dodici.\n\n'
            'Un inverso ce l’hanno solo i quattro buoni numeri 1, 5, 7, B — e ognuno è l’inverso di sé stesso: cinque per cinque è 25, cioè 1 sull’orologio del dodici; ugualmente sette per sette e B per B. Se l’orologio avesse un numero di ore primo come undici o tredici, allora ogni ora avrebbe un inverso. Il dodici è per questo troppo divisibile — la stessa ricchezza di divisori che orna il suo quadrante gli sottrae la divisione netta. Non è un difetto, ma la natura dei numeri composti; un orologio a dieci ore andrebbe allo stesso modo.',
      ),
      ProseSection(
        'Modulo dodici non è base dodici',
        'Un’ultima differenza importante, che si confonde facilmente. L’orologio calcola «modulo dodici» — conserva solo il resto nella divisione per dodici. Questo è diverso dalla «base dodici», la notazione di questa calcolatrice, in cui le posizioni valgono unità, dodici, grossa e così via. Modulo dice in quale classe di resto cade un numero; la base dice come lo si scrive.\n\n'
            'Entrambi ruotano attorno al numero dodici, ma per la stessa ragione più profonda — i suoi molti divisori —, non perché siano la stessa cosa. Si calcola ogni giorno modulo dodici sull’orologio e si scrive l’ora ugualmente nel sistema decimale. Questo tipo di calcolo con i resti fu introdotto da Carl Friedrich Gauss nel 1801 come notazione propria; oggi è invisibilmente presente nelle cifre di controllo dei codici ISBN e dei conti correnti e in ogni formula per il giorno della settimana.',
      ),
    ],
    sources: [
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A1',
      ),
      Source(
        'Cyclic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_group',
        'R2',
        'A1',
      ),
      Source(
        'Subgroups of cyclic groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Subgroups_of_cyclic_groups',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A1',
      ),
      Source(
        'Circle of fifths — Wikipedia',
        'https://en.wikipedia.org/wiki/Circle_of_fifths',
        'R2',
        'A1',
      ),
      Source(
        'Pitch class — Wikipedia',
        'https://en.wikipedia.org/wiki/Pitch_class',
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
        'Disquisitiones Arithmeticae — Wikipedia',
        'https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    '12! e le sequenze',
    [
      ProseSection(
        'Quante sequenze?',
        'Quante possibilità ci sono di mettere in fila una dozzina di cose — dodici ospiti a una tavola, i dodici mesi su una lista, dodici libri su uno scaffale? Per il primo posto si hanno dodici candidati, per il secondo undici, poi dieci, e così via fino all’ultimo, per cui rimane solo uno. Si moltiplicano tutte le possibilità: 12 · 11 · 10 · … · 2 · 1.\n\n'
            'Questo prodotto di tutti i numeri da 1 a dodici si scrive in breve «12!» e si chiama fattoriale di dodici. In generale n! è il prodotto di tutti i numeri da 1 a n e conta le sequenze di n elementi. Una curiosità marginale: 0! è definito come 1 — c’è esattamente un modo di non disporre nulla, cioè quello vuoto.',
      ),
      ProseSection(
        'Il numero 12!',
        'Calcolato, 12! = 479001600 nel sistema decimale — quasi mezzo miliardo di sequenze per soli dodici elementi. In base dodici lo stesso numero si scrive come 114500000, con cinque zeri in fondo. Questi zeri sono un terreno di gioco del dodici: poiché 12! contiene così tante volte i fattori due e tre, e ogni zero finale stacca esattamente un dodici, cinque di essi vengono netti. Nel sistema decimale 12! termina con soli due zeri.\n\n'
            'Quanto è grande mezzo miliardo di sequenze? Se se ne mostrasse una al secondo, ci vorrebbero più di quindici anni per esaurirle tutte. Se invece la dozzina siede a un tavolo rotondo, dove conta solo la vicinanza e non il posto di partenza, il numero si riduce a undici fattoriale — quasi quaranta milioni. Si può chiedere alla calcolatrice: il tasto del fattoriale fornisce 12! subito in base dodici.',
      ),
      ProseSection(
        'Selezione con e senza ordine',
        'Spesso non si vuole disporre tutti e dodici, ma solo sceglierne alcuni — e in quel caso fa differenza se l’ordine conta. Tre atleti sul podio (oro, argento, bronzo) su dodici: 12 · 11 · 10 = 1320 possibilità ordinate. L’ordine conta qui, perché primo e secondo non sono la stessa cosa.\n\n'
            'Se invece si scelgono sei dei dodici come semplice gruppo, senza classifica — ad esempio sei volontari —, sono 924 le possibilità; due dei dodici come coppia sono 66. Entrambi i metodi di conteggio si fondano sul fattoriale. Nel linguaggio comune vengono spesso confusi: una «combinazione» di numeri richiede in realtà una sequenza precisa — dovrebbe chiamarsi serratura a permutazione.',
      ),
      ProseSection(
        'Campane che suonano tutte le sequenze',
        'Nei campanili inglesi esiste un’antica arte che fa esattamente questo: il change ringing, il suono a variazione. Invece di melodie, i suonatori fanno risuonare le loro campane in sequenze sempre nuove, ognuna esattamente una volta. Ad ogni cambio ogni campana può avanzare solo di una posizione — una versione fisica dello scambio di elementi adiacenti, che i campanari padroneggiavano già intorno al 1621, molto prima che i matematici descrivessero lo stesso trucco.\n\n'
            'Per ogni numero di campane esiste un nome; dodici campane si chiamano Maximus. Suonare tutte le sequenze di dodici campane significherebbe percorrere 12! = circa 479 milioni di cambi — a due secondi per cambio sarebbero decenni di suono ininterrotto. Nessuno lo ha mai compiuto e si ritiene impossibile; i pezzi più lunghi effettivamente suonati su dodici campane raggiungono solo alcune decine di migliaia di cambi. Un extent completo è stato suonato solo su otto campane: 40320 cambi, quasi diciotto ore, nel 1963 a Loughborough.',
      ),
      ProseSection(
        'Dal numero nasce un gruppo',
        'Raccogliendo tutte le 12! riorganizzazioni di una dozzina e intendendo «prima l’una, poi l’altra» come regola di calcolo, nasce di nuovo un gruppo — il gruppo completo delle permutazioni dei dodici elementi. A differenza dell’orologio, qui l’ordine dei passi conta: scambiare prima e poi spostare dà qualcosa di diverso che fare il contrario. Questo gruppo è enorme e non commutativo.\n\n'
            'Al suo interno si nasconde una meraviglia finale. Tra le quasi cinquecento milioni di permutazioni esiste una minuscola selezione straordinariamente regolare di soli 95040 elementi, che sposta cinque qualsiasi dei dodici punti verso cinque destinazioni qualsiasi esattamente in un’unica maniera. Che su dodici punti sia possibile qualcosa di simile appartiene alle rarità più rare della matematica — ed è il tema del prossimo capitolo.',
      ),
    ],
    sources: [
      Source(
        'Factorial — Wikipedia',
        'https://en.wikipedia.org/wiki/Factorial',
        'R2',
        'A1',
      ),
      Source(
        'Permutation — Wikipedia',
        'https://en.wikipedia.org/wiki/Permutation',
        'R2',
        'A1',
      ),
      Source(
        'Combination — Wikipedia',
        'https://en.wikipedia.org/wiki/Combination',
        'R2',
        'A1',
      ),
      Source(
        'Change ringing — Wikipedia',
        'https://en.wikipedia.org/wiki/Change_ringing',
        'R2',
        'A1',
      ),
      Source(
        'Extent (change ringing) — Wikipedia',
        'https://en.wikipedia.org/wiki/Extent_(change_ringing)',
        'R2',
        'A1',
      ),
      Source(
        'Symmetric group — Wikipedia',
        'https://en.wikipedia.org/wiki/Symmetric_group',
        'R2',
        'A1',
      ),
      Source(
        'Steinhaus–Johnson–Trotter algorithm — Wikipedia',
        'https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Il gruppo di Mathieu M₁₂',
    [
      ProseSection(
        'Una selezione tra quasi mezzo miliardo',
        'Il capitolo precedente si è concluso con una promessa: tra le quasi cinquecento milioni di permutazioni di una dozzina esiste una minuscola selezione di esattamente 95040, capace di qualcosa di quasi incredibile. Scegli cinque dei dodici punti e indica dove deve andare ognuno — tra queste 95040 permutazioni ce n’è esattamente una che lo fa. Non due, non nessuna: esattamente una.\n\n'
            'Da questa sola proprietà segue già l’intero numero. Per la destinazione del primo punto si hanno dodici scelte, per il secondo undici, poi dieci, nove, otto — e il resto è determinato. Dodici per undici per dieci per nove per otto fa 95040. Questa rara raccolta di permutazioni porta un nome: il gruppo di Mathieu M₁₂.',
      ),
      ProseSection(
        'Il sistema di Steiner S(5,6,12)',
        'Cosa tengono fermo queste 95040 permutazioni in modo inamovibile? Una figura combinatoria elegante. Tra dodici punti si possono scegliere certi gruppi di sei in modo tale che ogni scelta qualsiasi di cinque punti sia contenuta in esattamente uno di questi gruppi di sei. Ce ne sono esattamente 132, e questa disposizione è l’unica possibile a meno di rinominare i punti.\n\n'
            'Questa costruzione finemente bilanciata si chiama il sistema di Steiner S(5,6,12). Il gruppo di Mathieu è esattamente l’insieme delle permutazioni che mappano tutti i 132 gruppi di sei su altri gruppi di sei — le simmetrie di questa figura. I due numeri, 132 gruppi di sei e 95040 simmetrie, si scrivono in base dodici come B0 e 47000.',
      ),
      ProseSection(
        'Perché proprio il dodici',
        'La cosa davvero sorprendente non è che M₁₂ sia così regolare, ma quanto raramente si presenti una tale regolarità. Camille Jordan dimostrò nel 1872: se si escludono i casi ovvi e ordinari, un insieme di permutazioni capace di posizionare liberamente cinque punti in esattamente un modo è possibile su un’unica quantità di punti — dodici. La cosa analoga per quattro punti esiste come eccezione solo su undici punti.\n\n'
            'Su esattamente undici e dodici punti — e in nessun altro luogo al di là dei casi ordinari — esistono queste simmetrie straordinariamente perfette. Il dodici è quindi uno dei pochissimi numeri capaci di portare qualcosa di simile. È un risultato matematico chiaro, non misticismo numerico — ma una ragione di meraviglia.',
      ),
      ProseSection(
        'La prima della sua specie',
        'I gruppi finiti hanno elementi costitutivi che non si possono scomporre ulteriormente — i gruppi semplici, gli atomi della teoria dei gruppi. «Semplice» significa qui indecomponibile, non facile. La maggior parte di questi atomi appartiene a poche famiglie infinite; accanto a esse si trovano esattamente ventisei solitari, i gruppi sporadici. M₁₂ è uno di loro.\n\n'
            'Émile Mathieu descrisse M₁₂ già nel 1861 — fu il primissimo gruppo sporadico mai scoperto, quasi cento anni prima degli altri. La sua esistenza rimase a lungo controversa, alcuni esperti la mettevano in dubbio; solo Ernst Witt la pose su basi solide nel 1938. La serie dei gruppi sporadici, iniziata con M₁₂, si conclude con il leggendario «Mostro», e la loro classificazione completa è una delle più grandi imprese collettive della matematica in assoluto.',
      ),
      ProseSection(
        'Da toccare con mano: carte e un gioco',
        'Per quanto astratto possa sembrare — esistono accessi concreti. Mescolando dodici carte da gioco in due modi specifici e sempre uguali più e più volte, si generano, secondo le fonti riportate, esattamente le permutazioni del gruppo di Mathieu. E il matematico John Conway inventò un «blackjack matematico» con i dodici numeri da zero a B, la cui strategia vincente si fonda direttamente sui 132 gruppi di sei.\n\n'
            'Va detto onestamente: questo capitolo ha quasi nessun tasto nella calcolatrice che gli corrisponda — è pura bellezza teorica, non uno strumento. Ma a volte è proprio questo il fascino: che proprio il dodici, che dà il ritmo a questa calcolatrice, sia uno dei pochissimi numeri in cui la matematica ha nascosto una simmetria così rara e perfetta.',
      ),
    ],
    sources: [
      Source(
        'Mathieu group M12 — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group_M12',
        'R2',
        'A1',
      ),
      Source(
        'Mathieu group — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group',
        'R2',
        'A1',
      ),
      Source(
        'Steiner system — Wikipedia',
        'https://en.wikipedia.org/wiki/Steiner_system',
        'R2',
        'A1',
      ),
      Source(
        'Sporadic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Sporadic_group',
        'R2',
        'A1',
      ),
      Source(
        'Multiply transitive group — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiply_transitive_group',
        'R2',
        'A1',
      ),
      Source(
        'Classification of finite simple groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups',
        'R2',
        'A1',
      ),
      Source(
        'Émile Léonard Mathieu — Wikipedia',
        'https://en.wikipedia.org/wiki/%C3%89mile_L%C3%A9onard_Mathieu',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Il dodecagono (poligono di dodici lati)',
    [
      ProseSection(
        'Che cos\'è un dodecagono regolare',
        'Un dodecagono regolare (dal greco dodekagon: dōdeka = dodici, '
            'gōnía = angolo) è un poligono con dodici lati uguali e dodici '
            'angoli interni uguali. Tutti e dodici i vertici giacciono '
            'equamente distribuiti su una circonferenza, la circonscritta, '
            'distanti 30° l\'uno dall\'altro.\n\n'
            'Ogni angolo interno misura esattamente 150°. Questo segue da una '
            'considerazione semplice: percorrendo la figura per intero, ci si '
            'ruota ai dodici vertici complessivamente di 360°, cioè 30° per '
            'vertice. Questo angolo esterno e quello interno si completano a '
            '180°, quindi resta 180° − 30° = 150°. Nel sistema dozenale 150° '
            'si scrive 106°, l\'angolo esterno 30° come 26°. Tutti gli angoli '
            'presenti nel dodecagono sono multipli di 15° — dozenale 13°.\n\n'
            'Il dodecagono è tra le figure costruibili con riga e compasso in '
            'modo esatto. Il procedimento è breve: tracciare un cerchio, '
            'dividerlo in sei parti uguali (lo si fa col solo compasso, perché '
            'nell\'esagono il lato è uguale al raggio), poi bisecare ognuno '
            'dei sei archi — si ottengono dodici punti equamente distribuiti. '
            'Che ciò sia possibile non è casuale: un poligono regolare di n lati '
            'è costruibile se e solo se n è prodotto di una potenza di due e di '
            'distinti numeri primi di Fermat (teorema di Gauss e Wantzel). '
            'Per 12 = 2² × 3 la condizione è soddisfatta, perché 3 è tale '
            'numero primo.',
      ),
      ProseSection(
        'Tre poligoni condividono i vertici',
        'La cosa notevole del dodecagono è meno la sua forma che ciò che '
            'contiene. Collegando solo ogni secondo vertice si ottiene un '
            'esagono regolare. Ogni terzo vertice dà un quadrato, ogni quarto '
            'un triangolo equilatero — tutti e tre esatti, non approssimati, '
            'e tutti sulla stessa circonscritta del dodecagono.\n\n'
            'Dietro c\'è una regola generale: un poligono regolare di m lati '
            'entra in uno di n lati con gli stessi vertici se e solo se m '
            'divide n; si collegano allora ogni (n/m)-esimo vertice. Esagono, '
            'quadrato e triangolo stanno nel dodecagono perché 12 è divisibile '
            'per 6, 4 e 3. E 12 è il più piccolo numero divisibile per 3, 4 e '
            '6 contemporaneamente — il loro minimo comune multiplo. Per questo '
            'il dodecagono è il più piccolo poligono regolare che contiene '
            'insieme queste tre figure fondamentali; un pentagono, un ottagono '
            'o un decagono non possono farlo.\n\n'
            'È esattamente la stessa divisibilità che rende il sistema dozenale '
            'così comodo. Che 12 si divida per 2, 3, 4 e 6 fa sì che '
            'geometricamente i tre poligoni coincidano in un dodecagono — '
            'e aritmeticamente rende le frazioni un mezzo, un terzo, un quarto '
            'e un sesto brevi e nette in base dodici. Forma e aritmetica delle '
            'frazioni hanno la stessa radice.',
      ),
      ProseSection(
        'Cinquantaquattro diagonali, sei lunghezze',
        'Una diagonale collega due vertici non adiacenti. La formula n(n−3)/2 '
            'dà per il dodecagono 12 × 9 / 2 = 54 diagonali. Sembra '
            'disordinato, ma è rigorosamente ordinato: poiché il dodecagono '
            'è così simmetrico, tutte le diagonali che saltano lo stesso numero '
            'di vertici sono uguali in lunghezza. Ci sono cinque distanze di '
            'salto più il diametro — solo sei lunghezze diverse. Con lato 1:\n\n'
            'd₂ salta un vertice e misura √(2+√3) ≈ 1,932. d₃ salta due '
            'vertici, 1+√3 ≈ 2,732. d₄ salta tre vertici, (3√2+√6)/2 ≈ '
            '3,346. d₅ salta quattro vertici, 2+√3 ≈ 3,732. d₆ infine '
            'collega vertici opposti — è il diametro, √6+√2 ≈ 3,864.\n\n'
            'In questi valori si nascondono schemi nitidi. La quinta e la '
            'terza diagonale differiscono esattamente di un lato: '
            '(2+√3) − (1+√3) = 1. E il diametro è esattamente il doppio della '
            'diagonale più corta, d₆ = 2 · d₂ — lo stesso rapporto 2:1 '
            'dell\'ottava in musica. Tutti gli angoli tra le diagonali sono '
            'ancora multipli di 15°, perché i dodici vertici suddividono '
            'il cerchio completo in passi di 30°.',
      ),
      ProseSection(
        'L\'area e il «tre tondo»',
        'Per trovare l\'area si scompone il dodecagono, dal centro, in dodici '
            'triangoli uguali e sottili. Ognuno ha due lati di lunghezza R — '
            'il raggio della circonscritta, la distanza dal centro a un vertice '
            '— e all\'apice un angolo di 30°. Sommando i dodici triangoli '
            'emerge qualcosa di bello:\n\n'
            'A = 3 · R².\n\n'
            'Il fattore è un netto intero tre, senza radici. Questo riesce '
            'perché nel calcolo compare sin(30°) = un mezzo, e 30° è proprio '
            'l\'angolo al vertice del dodecagono. Tra i poligoni costruibili con '
            'riga e compasso è l\'unico più grande in cui la formula dell\'area '
            'risulta così netta; nell\'esagono, ad esempio, rimane una radice. '
            'Se si preferisce usare il lato s, l\'area è A = 3(2+√3)·s² ≈ 11,196·s².\n\n'
            'Rapportando l\'area alla circonscritta, la cui area è π·R², R² si '
            'semplifica e resta esattamente 3/π ≈ 0,9549. Il dodecagono riempie '
            'la sua circonscritta per circa il 95,5 % — molto di più '
            'dell\'esagono (circa 83 %), del quadrato (circa 64 %) o del '
            'triangolo (circa 41 %). Al posto del numero complicato π sta il '
            'tre tondo: con R = 1 l\'area del dodecagono è esattamente 3 e '
            'si trova appena sotto π ≈ 3,1416.\n\n'
            'Questa vicinanza fu già sfruttata da Archimede. Approssimò π '
            'tramite poligoni, iniziò dall\'esagono facile da disegnare e '
            'raddoppiò il numero di lati: 6, 12, 24, 48, 96. Il dodecagono '
            'fu il suo primo passo. Il 96-gono — dozenale 12 × 8 — riempie '
            'già il cerchio al 99,93 % e gli fornì 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Dove il dodecagono appare come forma',
        'I dodici segni orari di un orologio analogico formano un dodecagono '
            'regolare: dodici punti a 30° di distanza sul cerchio. Il fatto '
            'che il cerchio completo misuri 360° = 12 × 30° e il giorno abbia '
            'due volte dodici ore è la stessa griglia a 30° che le rose dei '
            'venti usano per dodici direzioni.\n\n'
            'Diversi paesi hanno coniato monete a dodici lati — soprattutto '
            'affinché la forma le distinguesse al tatto dalle monete rotonde. '
            'Il «threepence» britannico in ottone (dal 1937) fu il primo pezzo '
            'non circolare in circolazione nel Regno Unito; la sterlina a dodici '
            'lati (dal 2017) fu introdotta come misura antifalsificazione e '
            'deliberatamente modellata su quell\'esempio. Contrariamente a '
            'quanto si sostiene talvolta, tali monete non hanno larghezza '
            'costante — questa proprietà appartiene ai pezzi britannici da 20 '
            'e 50 penny a sette lati, che non sono dodecagoni.\n\n'
            'Il dodecagono da solo non tassella il piano: 150° non si divide '
            'esattamente in 360°. Insieme ad altri poligoni sì — ad esempio '
            'con triangoli o con quadrati ed esagoni, i cui angoli si sommano '
            'a 360° a ogni vertice. Tali motivi a simmetria dodecagonale '
            'costituiscono un fondamento dell\'ornamentazione geometrica '
            'islamica. Come il dodici sia entrato nell\'architettura e '
            'nell\'arte è trattato nel capitolo «Il dodici nell\'arte».',
      ),
      ProseSection(
        'Geometria, non misticismo numerico',
        'Le proprietà del dodecagono sono veri fatti matematici, non segreti. '
            'Che l\'area stia nel rapporto 3/π con la circonscritta deriva '
            'necessariamente da sin(30°) = un mezzo; mostra solo che il '
            'dodecagono approssima bene il cerchio, e non stabilisce alcuna '
            'connessione segreta tra il tre e π. Allo stesso modo il semplice '
            'tre in «area = 3·R²» è conseguenza dell\'angolo al vertice, '
            'non un prodigio.\n\n'
            'Anche il teorema «A = 3·R²» richiede la lettura corretta: il tre '
            'netto vale per il raggio della circonscritta. Con lato 1 l\'area '
            'è circa 11,2, non 3. E per le diagonali vale la precisione — '
            'la quarta è (3√2+√6)/2 ≈ 3,346, non un\'espressione con radice '
            'più semplice; in alcune fonti circolano valori errati.\n\n'
            'Infine la facile costruibilità dice solo che la forma si ottiene '
            'con strumenti semplici. Spiega bene perché i dodecagoni siano '
            'così frequenti nell\'artigianato, sulle monete e nell\'ornamento. '
            'Perché però l\'orologio ha dodici ore è una questione di tradizione, '
            'non di geometria. Il dodecagono è un bello strumento geometrico — '
            'e non gli si dovrebbe attribuire nulla di più.',
      ),
    ],
    sources: [
      Source(
        'Dodecagon — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Constructible polygon — Wikipedia',
        'https://en.wikipedia.org/wiki/Constructible_polygon',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagon (12-gon) calculator and formulas — RedCrab Software',
        'https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Area of a Dodecagon — Alison Kiddle',
        'https://alisonkiddle.co.uk/area-of-a-dodecagon/',
        'R3',
        'A1',
      ),
      Source(
        'Getting Closer to π: Inscribing and Circumscribing Polygons — Univ. Alberta',
        'https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf',
        'R3',
        'A1',
      ),
      Source(
        'Archimedes on the Circumference and Area of a Circle — AMS Feature Column',
        'https://www.ams.org/publicoutreach/feature-column/fc-2012-02',
        'R2',
        'A1',
      ),
      Source(
        'Brass threepence — Wikipedia',
        'https://en.wikipedia.org/wiki/Brass_threepence',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagonal coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagonal_coin',
        'R2',
        'A1',
      ),
    ],
    imageId: 'math/dodekagon',
  ),
  ProseChapter(
    'Pavimentazioni archimedee',
    [
      ProseSection(
        'Il dodecagono non riempie il piano da solo',
        'Un dodecagono regolare è una figura bella e rotonda — ma non riesce a ricoprire da solo un pavimento senza lasciare spazi vuoti. Il motivo è il suo angolo interno di 150 gradi. Attorno a ogni vertice le figure adiacenti devono completarsi esattamente a 360 gradi, ma 360 diviso 150 fa due virgola quattro — non un numero intero. Due dodecagoni lasciano uno spazio a un vertice, tre si sovrappongono.\n\n'
            'Il dodecagono ha bisogno di partner. Se si inseriscono le figure giuste tra di essi, nascono motivi regolari e privi di lacune — le pavimentazioni archimedee. Così si chiamano le tassellature del piano composte solo da poligoni regolari che hanno lo stesso aspetto ad ogni vertice. In totale esistono solo undici tali motivi.',
      ),
      ProseSection(
        'Due motivi con il dodecagono',
        'Di questi undici motivi, esattamente due contengono un dodecagono regolare. Nel primo, piccoli triangoli equilateri riempiono gli spigoli tra i dodecagoni — a ogni vertice si incontrano un triangolo e due dodecagoni, e i loro angoli danno 60 più 150 più 150, cioè esattamente 360 gradi.\n\n'
            'Il secondo è il più ricco ed è quello mostrato nella figura: attorno a ogni dodecagono si dispone una corona alternata di quadrati ed esagoni. A ogni vertice si incontrano un quadrato, un esagono e un dodecagono — 90 più 120 più 150 gradi, di nuovo esattamente 360. Poiché la somma torna, la corona si chiude senza alcuna lacuna e il motivo si estende in tutte le direzioni.',
      ),
      ProseSection(
        'Perché si adattano solo tre, quattro, sei',
        'Accanto a un dodecagono si adattano solo tre tipi di vicini: triangoli, quadrati ed esagoni. Non è un caso. I loro angoli interni sono 60, 90 e 120 gradi — e questi sono esattamente 360 diviso sei, diviso quattro e diviso tre. Compaiono quindi esattamente i divisori tre, quattro e sei del dodici.\n\n'
            'Sono gli stessi tre divisori che in base dodici fanno venire nette le frazioni un terzo, un quarto e un sesto. La bella pavimentazione e la comoda frazione nascono dalla stessa radice: la ricca divisibilità del dodici. È una vera parentela, ma non una costrizione — gli angoli vengono dalla geometria, le frazioni nette dalla notazione; entrambi dipendono solo dallo stesso numero.',
      ),
      ProseSection(
        'Keplero, moschee e cristalli',
        'A enumerarli per la prima volta fu Johannes Kepler nel 1619, in un’opera sull’armonia del mondo. Il nome «archimedeo» è solo un riferimento ai solidi archimedei; non è nota alcuna opera antica in cui Archimede stesso avesse trattato le pavimentazioni.\n\n'
            'Ben prima di Keplero il dodecagono viveva già nell’arte: le stelle a dodici punte sono tra i motivi più splendidi dell’ornamentazione geometrica islamica, costruiti con compasso e riga dalla pura geometria — già in tempi antichi, ad esempio nella moschea di Konya (1220). E in natura la stessa struttura a dodici appaiono nei quasicristalli, cui è dedicato un capitolo a parte. Il dodecagono, che da solo non riesce a riempire un piano, è in associazione una delle forme più feconde della superficie.',
      ),
    ],
    sources: [
      Source(
        'Euclidean tilings by convex regular polygons — Wikipedia',
        'https://en.wikipedia.org/wiki/Euclidean_tilings_by_convex_regular_polygons',
        'R2',
        'A1',
      ),
      Source(
        'Truncated hexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_hexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Truncated trihexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_trihexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Archimedean Tilings and Egyptian Fractions (John Baez)',
        'https://math.ucr.edu/home/baez/egyptian.html',
        'R3',
        'A1',
      ),
      Source(
        'Islamic geometric patterns — Wikipedia',
        'https://en.wikipedia.org/wiki/Islamic_geometric_patterns',
        'R2',
        'A1',
      ),
      Source(
        'Harmonices Mundi — Wikipedia',
        'https://en.wikipedia.org/wiki/Harmonices_Mundi',
        'R2',
        'A2',
      ),
    ],
    imageId: 'math/parkettierung',
  ),
  ProseChapter(
    'Il dodecaedro',
    [
      ProseSection(
        'Dodici pentagoni nello spazio',
        'Il dodecaedro (dal greco dōdeka = dodici, hédra = faccia) è un '
            'solido composto da dodici pentagoni regolari uguali. Tutte le '
            'facce sono identiche, tutti gli spigoli uguali, e in ogni vertice '
            'si incontrano esattamente tre pentagoni. Il conteggio dà dodici '
            'facce, trenta spigoli e venti vertici.\n\n'
            'È uno dei cinque solidi platonici — i solidi convessi le cui '
            'facce sono composte esclusivamente da poligoni regolari uguali e '
            'in ogni vertice dei quali si incontrano sempre lo stesso numero '
            'di facce. Gli altri quattro sono il tetraedro (quattro triangoli), '
            'il cubo (sei quadrati), l\'ottaedro (otto triangoli) e '
            'l\'icosaedro (venti triangoli). Tra questi cinque il dodecaedro '
            'è l\'unico con facce pentagonali.\n\n'
            'In notazione compatta il dodecaedro si scrive {5, 3}: pentagoni '
            'come facce, tre per ogni vertice. L\'angolo diedro tra due facce '
            'adiacenti è circa 116,57° (in decimale). Per confronto: nel '
            'cubo è 90°.',
      ),
      ProseSection(
        'Perché ne esistono esattamente cinque',
        'Che possano esistere solo cinque solidi di questo tipo — né più né '
            'meno — è un risultato dimostrato. Due vie conducono ad esso, '
            'entrambe con lo stesso esito.\n\n'
            'La prima via è un semplice conteggio, la formula di Eulero per i '
            'poliedri: per ogni solido convesso vale vertici meno spigoli più '
            'facce uguale due. Per il dodecaedro: 20 − 30 + 12 = 2. '
            'Leonhard Euler annotò questa relazione intorno al 1750; la prima '
            'dimostrazione rigorosa la fornì Cauchy nel 1811. La formula vale '
            'per ogni solido convesso privo di buchi, per ogni piramide, '
            'ogni prisma. Combinandola con il requisito che le facce siano '
            'poligoni regolari uguali, restano esattamente cinque soluzioni.\n\n'
            'La seconda via è più intuitiva e considera un singolo vertice. '
            'L\'angolo interno di un pentagono regolare è 108°. Se in un '
            'vertice si incontrano tre pentagoni, i loro angoli sommano 324°. '
            'I 36° mancanti al cerchio completo sono esattamente la lacuna '
            'che si piega verso lo spazio — così nasce un vertice del '
            'dodecaedro. Quattro pentagoni darebbero già 432° e non '
            'entrerebbero più in un vertice. Per questo tre pentagoni sono '
            'l\'unica possibilità, e il dodecaedro è l\'unico solido con '
            'facce pentagonali.',
      ),
      ProseSection(
        'La sezione aurea nel pentagono e nel solido',
        'Ogni faccia del dodecaedro è un pentagono regolare — e il pentagono '
            'è il più semplice luogo piano dove la sezione aurea '
            'φ = (1+√5)/2 ≈ 1,618 appare come rapporto di segmenti. La '
            'diagonale di un pentagono regolare è esattamente φ volte il lato. '
            'Chi digita φ² = nel calcolatore ottiene φ+1 — questa è '
            'l\'equazione definitoria della sezione aurea.\n\n'
            'Poiché ogni faccia porta questo rapporto, φ pervade l\'intero '
            'solido. Collocando il dodecaedro in un sistema di coordinate, φ '
            'appare letteralmente nelle coordinate dei suoi venti vertici. '
            'Otto di questi vertici formano da soli un cubo; in totale si '
            'possono inscrivere cinque cubi diversi nel dodecaedro. Altri '
            'vertici definiscono tre rettangoli aurei — rettangoli con rapporto '
            'tra i lati pari a φ a uno —, disposti a coppie perpendicolari '
            'tra loro.\n\n'
            'φ appare qui non per magia, ma per necessità: dove ci sono '
            'pentagoni regolari, c\'è φ. Le interpretazioni ulteriori della '
            'sezione aurea come «divina proporzione» sono attribuzioni umane, '
            'non una proprietà della geometria stessa.',
      ),
      ProseSection(
        'Dualità e la simmetria più ricca',
        'A ogni solido platonico corrisponde un solido duale: si pone un '
            'nuovo vertice al centro di ogni faccia e si collegano i vertici '
            'di facce adiacenti. Dal dodecaedro nasce così l\'icosaedro — e '
            'viceversa. Nel processo facce e vertici si scambiano i ruoli: '
            'il dodecaedro ha 12 facce e 20 vertici, l\'icosaedro 20 facce '
            'e 12 vertici. Il numero di spigoli, 30, rimane lo stesso in '
            'entrambi. Il dodici compare in entrambi — una volta come numero '
            'di facce, una volta come numero di vertici.\n\n'
            'Poiché entrambi condividono la stessa struttura, hanno anche la '
            'stessa simmetria — ed è la più ricca tra tutti i solidi platonici: '
            '120 simmetrie, ovvero 60 rotazioni e 60 roto-riflessioni. Il cubo '
            'ne ha solo 48, il tetraedro 24. Le 60 rotazioni si distribuiscono '
            'su sei assi di ordine cinque attraverso centri di facce opposte, '
            'dieci assi di ordine tre attraverso vertici opposti e quindici '
            'assi di ordine due attraverso punti medi di spigoli opposti.\n\n'
            'Il numero 120 si scrive come 5! (5 × 4 × 3 × 2 × 1) e si '
            'fattorizza in 2, 3 e 5 — gli stessi tre numeri che ricorrono '
            'negli assi e nella forma pentagonale delle facce. Questi assi di '
            'ordine cinque sono anche il motivo per cui nessun cristallo '
            'ordinario può formare un vero dodecaedro: un reticolo periodico '
            'non può avere simmetria quinaria '
            '(vedi il capitolo sulla pirite).',
      ),
      ProseSection(
        'Il dodici di Eulero: perché sempre dodici pentagoni',
        'Un ultimo risultato collega il dodecaedro a cose che inizialmente '
            'non sembrano averlo a che fare. La domanda è: si può costruire '
            'un involucro chiuso, simile a una sfera, usando solo esagoni '
            'regolari? La risposta è no. I soli esagoni danno una superficie '
            'piatta; per curvarla in una sfera bisogna inserire esattamente '
            'dodici pentagoni — indipendentemente da quanti esagoni si usino '
            'altrimenti.\n\n'
            'Ciò segue di nuovo dal teorema di Eulero. Con zero esagoni nasce '
            'il dodecaedro regolare. Con dodici pentagoni e venti esagoni '
            'nasce il classico pallone da calcio — e proprio qui si trova un '
            'errore frequente: il pallone da calcio non è un dodecaedro. È un '
            'icosaedro troncato con 32 facce, cioè dodici pentagoni più venti '
            'esagoni. Entrambi condividono solo i dodici pentagoni; il '
            'dodecaedro però non ha esagoni.\n\n'
            'Il dodecaedro regolare è quindi il caso più puro di questa '
            'dodicesimità: dodici pentagoni e nient\'altro.',
      ),
      ProseSection(
        'Cubo, dodecagono e piritoedro — ciò che non è',
        'Nei giochi di ruolo il dodecaedro è noto come D12, il dado a dodici '
            'facce. Poiché tra tutti e cinque i solidi è quello più vicino '
            'alla sfera, rotola piacevolmente e si ferma affidabilmente su una '
            'faccia; le sue dodici facce uguali lo rendono equo.\n\n'
            'Tre confusioni meritano chiarimento. Primo: il dodecagono non è '
            'il dodecaedro. Entrambe le parole portano «dodeka-» (dodici), ma '
            'il dodecagono è un poligono piatto con dodici lati, il dodecaedro '
            'un solido tridimensionale con dodici facce. '
            'Secondo: il piritoedro del minerale pirite ha anch\'esso dodici '
            'facce pentagonali, ma non è un dodecaedro regolare — i suoi '
            'pentagoni sono deformati e non ha vera simmetria quinaria '
            '(in dettaglio nel capitolo sulla pirite). Terzo infine: '
            'Platone assegnò il dodecaedro al cosmo nella sua interezza; è '
            'un\'antica interpretazione filosofica, non un risultato matematico. '
            'La geometria del solido sta per sé, del tutto indipendentemente '
            'dal significato che gli esseri umani vi hanno attribuito.',
      ),
    ],
    sources: [
      Source(
        'Regular dodecahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Regular_dodecahedron',
        'R2',
        'A1',
      ),
      Source(
        'Dodekaeder — Wikipedia (de)',
        'https://de.wikipedia.org/wiki/Dodekaeder',
        'R2',
        'A1',
      ),
      Source(
        'Platonic solid — Wikipedia',
        'https://en.wikipedia.org/wiki/Platonic_solid',
        'R2',
        'A1',
      ),
      Source(
        'Eulers Polyederformel — Plus Maths (Cambridge)',
        'https://plus.maths.org/content/eulers-polyhedron-formula',
        'R1',
        'A1',
      ),
      Source(
        'Platonic Solids: Why Five? — MathsIsFun',
        'https://www.mathsisfun.com/geometry/platonic-solids-why-five.html',
        'R1',
        'A1',
      ),
      Source(
        'Golden ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Golden_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Phi in 3D Geometry (Ron Knott) — University of Surrey',
        'https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html',
        'R2',
        'A1',
      ),
      Source(
        'Icosahedral symmetry — Wikipedia',
        'https://en.wikipedia.org/wiki/Icosahedral_symmetry',
        'R2',
        'A1',
      ),
      Source(
        'Truncated icosahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_icosahedron',
        'R2',
        'A1',
      ),
    ],
  ),
];
