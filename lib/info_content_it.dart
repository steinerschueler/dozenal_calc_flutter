part of 'info_content.dart';

/// Italian chapter content. Uses the locale-specific dozenal
/// pronunciation convention:
///   * Base unit "dozzina" (feminine, established Italian word for
///     "dozen"). Plural: "dozzine".
///   * A = "dieci" (10), B = "undici" (11) — same values as Italian
///     decimal counting.
///   * Higher magnitudes 12²–12⁷ as Italian-ized -era nouns
///     (feminine, plural with -ere): "quadera, cubera, tessera,
///     pentera, hexera, heptera". Roots preserved across languages,
///     endings adapted to Italian gender/morphology — "tessera" is
///     a genuine Italian word (mosaic tile, from Greek τέσσαρα for
///     "four"), giving extra resonance for the 12⁴ magnitude.
///     Parallels the Spanish -ero adaptation in [_chapterEs].
///   * Multiplier 1 implicit (dozzina not "una dozzina"; quadera
///     not "una quadera").
///   * Pure juxtaposition between all positions — no "e" connector
///     anywhere, mirroring Italian decimal "centoventitré" (123)
///     where magnitudes pack tightly without connectors.
///   * Western digits throughout for math content; Italian for prose.
List<Widget> _chapterIt(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H("Le cifre"),
        const _P(
          "Questa calcolatrice usa simboli propri per tutte le dodici "
          "cifre. Quattro cifre di ancoraggio sono punte di freccia "
          "stilizzate che puntano nelle quattro direzioni cardinali "
          "— 1 (in alto), 4 (a sinistra), 7 (a destra), A (in basso). "
          "Dividono il cerchio numerico in quattro gruppi di tre, "
          "come le ore 12, 3, 6 e 9 su un quadrante d'orologio.",
        ),
        const _P(
          "Tutte le cifre intermedie sono costruite da semicerchi e "
          "cerchi completi. Lo zero è un cerchio semplice, B (= "
          "undici) un cerchio pieno.",
        ),
        const _DigitLegend(),
        const _H("Uso base"),
        const _P(
          "Tocca numeri e operatori come su una calcolatrice "
          "tascabile ordinaria. Premi il tasto largo = in basso per "
          "calcolare il risultato. AC (in rosso d'avviso) cancella "
          "tutto l'input e il risultato ; Del rimuove il carattere a "
          "sinistra del cursore.",
        ),
        const _H("Aiuto e teoria"),
        const _P(
          "A sinistra e a destra del tasto =, due bottoni rotondi: "
          "(i) apre questi dodici capitoli teorici, (?) riproduce il "
          "tour rapido con i marcatori rossi. Il tour si apre "
          "automaticamente al primo avvio.",
        ),
        const _H("Cursore e navigazione"),
        const _P(
          "La barra rossa nel campo di input è il cursore. Usa ◀ e ▶ "
          "per spostarlo, inserendo o eliminando caratteri nel mezzo "
          "di una formula. Dopo un calcolo, il cursore si sposta sul "
          "campo del risultato — le frecce muovono allora il cursore "
          "del risultato. Appena inizi un nuovo input, il cursore "
          "torna al campo di input.",
        ),
        const _H("Continuare un calcolo"),
        const _P(
          "Dopo un calcolo puoi continuare direttamente con un "
          "operatore. Tocca + 5 = per esempio, e la calcolatrice "
          "usa automaticamente l'ultimo risultato come primo "
          "operando. Per iniziare un calcolo completamente nuovo, "
          "premi prima AC.",
        ),
        const _H("Doppio tocco per funzioni inverse"),
        const _P(
          "Un secondo tocco su un tasto di funzione lo trasforma "
          "nella sua inversa: sin diventa sin⁻¹, cos diventa cos⁻¹, "
          "e così via. La stessa regola si applica alle funzioni "
          "iperboliche nel pannello di estensione. Un piccolo punto "
          "dorato sul tasto indica che il prossimo tocco invertirà.",
        ),
        const _H("Operatori speciali"),
        const _P(
          "x² eleva al quadrato il numero precedente. √ calcola la "
          "radice quadrata — se c'è un numero alla sua sinistra, "
          "quel numero è usato come grado della radice: 3√27 dà la "
          "radice cubica di 27. log calcola il logaritmo con la "
          "base del numero precedente. ⊕ calcola la somma "
          "parallela: a ⊕ b = (a·b)/(a+b), utile per resistenze in "
          "parallelo.",
        ),
        const _H("Pannello di estensione"),
        const _P(
          "Il tasto … in basso a destra apre il pannello di "
          "estensione con più funzioni: memoria, costanti (π, e, "
          "φ, √2), funzioni iperboliche, operatori avanzati e "
          "impostazioni. Lo stesso tasto lo chiude, oppure un "
          "tocco fuori dal pannello. Sui tablet tutti i set sono "
          "visibili affiancati comunque — nessuna sovrapposizione.",
        ),
        const _Pre(
          "  6 — Memoria:        STO   RCL   MC    Ans\n"
          "  7 — Costanti:       π     e     φ     √2\n"
          "  8 — Iperboliche:    sinh  cosh  tanh  coth\n"
          "  9 — Avanzati:       n!    |x|   1/x   mod\n"
          "  10 — Modi:          Doz   Dez   DRG   …",
        ),
        const _H("Memoria"),
        const _P(
          "STO memorizza il risultato corrente, RCL inserisce il "
          "valore memorizzato nell'input, MC cancella la memoria. "
          "Una piccola M sul display indica che qualcosa è "
          "memorizzato. Ans inserisce il risultato dell'ultimo "
          "calcolo — i valori razionali esatti sono memorizzati "
          "completi, la periodicità è preservata.",
        ),
        const _H("Barra di periodo"),
        const _P(
          "Quando il risultato è una frazione periodica, la "
          "calcolatrice marca le cifre ripetute con una barra "
          "sopra. Esempio: 1/5 dà 0.2497 con barra sulle quattro "
          "cifre. Per periodi più lunghi di cinque cifre, solo le "
          "prime cinque sono mostrate, seguite da …",
        ),
        const _H("Sistema numerico: Doz / Dez"),
        const _P(
          "Nel pannello di estensione, due tasti Doz e Dez sono "
          "affiancati. Esattamente uno di essi è sempre attivo "
          "(con bordo), e il sistema attivo è mostrato in alto a "
          "destra del display. In modalità Doz la calcolatrice "
          "calcola in base 12 (predefinito) ; in modalità Dez in "
          "base 10.",
        ),
        const _P(
          "Al cambio, il numero attualmente visibile viene "
          "convertito automaticamente nell'altro sistema. «10» in "
          "Doz diventa «12» in Dez. In modalità Dez i simboli di "
          "10 e 11 diventano inattivi (grigi), poiché non esistono "
          "come cifre singole in base 10 — per Doz basta cambiare "
          "di nuovo.",
        ),
        const _H("Modalità angolo"),
        const _P(
          "DRG cicla la modalità angolo per le funzioni "
          "trigonometriche: DEG → RAD → GRAD → DEG. La modalità "
          "corrente è mostrata in alto a destra del display, "
          "direttamente sopra l'indicatore Doz/Dez. Predefinito: "
          "DEG.",
        ),
      ];
    case 1:
      return [
        const _H("Il principio"),
        const _P(
          "Nel sistema decimale ogni posizione ha un valore dieci "
          "volte maggiore della posizione alla sua destra: unità, "
          "decine, centinaia. Nel sistema duodecimale, la base non "
          "è dieci ma dodici. I valori posizionali sono potenze di "
          "12: unità, dozzine, cento-quarantaquattri. Il numero "
          "«100» qui non significa dieci per dieci ma dodici per "
          "dodici — cioè 144 in decimale.",
        ),
        const _P(
          "Questo richiede dodici cifre invece di dieci. Se ne "
          "aggiungono due nuove per i valori dieci e undici, alle "
          "quali questa calcolatrice dà simboli propri (A = dieci, "
          "B = undici). Esempio: 2B (duodecimale) = 2·12 + 11 = 35 "
          "(decimale).",
        ),
        const _H("Come si pronuncia duodecimale?"),
        const _P(
          "Le unità 0–9 restano come le conosci: zero, uno, due … "
          "nove. I nuovi glifi A e B si leggono dieci e undici — la "
          "stessa magnitudine delle parole familiari, senza nuovo "
          "vocabolario da imparare. Il dodici stesso — scritto come "
          "«10» — si legge dozzina. Per evitare confusione tra "
          "numeri decimali e duodecimali in questo capitolo, un "
          "piccolo prefisso e marca la lettura decimale e una "
          "piccola o quella duodecimale: e144 = o100, entrambi "
          "rappresentano lo stesso valore.",
        ),
        const _P(
          "L'ordine delle parole segue la logica italiana: la "
          "magnitudine maggiore prima, le minori dopo. "
          "Nell'intervallo sub-quadera (dozzine + unità), la "
          "struttura è diretta: o11 si legge «dozzina uno», o23 "
          "«due dozzine tre». I moltiplicatori 2 fino a B "
          "precedono dozzina come parola separata: due dozzine "
          "(o20 = e24), tre dozzine, …, nove dozzine (o90 = "
          "e108). Con A o B nella posizione delle dozzine: dieci "
          "dozzine (oA0 = e120), undici dozzine (oB0 = e132). Il "
          "moltiplicatore 1 è implicito: o10 si legge "
          "semplicemente «dozzina», non «una dozzina».",
        ),
        const _P(
          "L'italiano dozenale non ha alcun connettore «e» tra "
          "magnitudini o alla posizione delle unità — pura "
          "giustapposizione, come nel decimale italiano "
          "«centoventitré» (123), non «cento e ventitré». Così "
          "o21 è «due dozzine uno», o32 «tre dozzine due», o123 "
          "«quadera due dozzine tre». La compattezza è una "
          "caratteristica fondamentale dell'aritmetica italiana.",
        ),
        const _Pre(
          "Decimale    Dozenale    Pronuncia\n"
          "       10        A    dieci\n"
          "       11        B    undici\n"
          "       12       10    dozzina\n"
          "       13       11    dozzina uno\n"
          "       14       12    dozzina due\n"
          "       20       18    dozzina otto\n"
          "       22       1A    dozzina dieci\n"
          "       23       1B    dozzina undici\n"
          "       24       20    due dozzine\n"
          "       25       21    due dozzine uno\n"
          "       26       22    due dozzine due\n"
          "       36       30    tre dozzine\n"
          "       48       40    quattro dozzine\n"
          "       60       50    cinque dozzine\n"
          "       72       60    sei dozzine\n"
          "       84       70    sette dozzine\n"
          "       96       80    otto dozzine\n"
          "      101       85    otto dozzine cinque\n"
          "      108       90    nove dozzine\n"
          "      120       A0    dieci dozzine\n"
          "      132       B0    undici dozzine\n"
          "      143       BB    undici dozzine undici\n"
          "      ...      ...    eccetera…",
        ),
        const _H("Le magnitudini superiori"),
        const _P(
          "Sopra la dozzina segue una serie di magnitudini "
          "geometricamente motivate — una per posizione duodecimale, "
          "una per dimensione. Quadera designa il quadrato 2D "
          "(12² = e144), cubera il cubo classico (12³ = e1728), "
          "tessera il tesseratto quadridimensionale (12⁴), e da lì "
          "gli ipercubi numerati in greco: pentera (12⁵), hexera "
          "(12⁶), heptera (12⁷). Ogni passo è una dimensione più "
          "alta ed esattamente una posizione duodecimale più "
          "lontana. Nota: «tessera» è anche una parola italiana "
          "esistente (mosaico, dal greco τέσσαρα per «quattro») — "
          "una coincidenza fortunata, poiché il tesseratto è "
          "letteralmente il cubo a quattro dimensioni.",
        ),
        const _Pre(
          " Decimale    Dozenale    Pronuncia\n"
          "      144       100    quadera  (12²)\n"
          "     1728      1000    cubera   (12³)\n"
          "    20736     10000    tessera  (12⁴)\n"
          "   248832    100000    pentera  (12⁵)\n"
          "  2985984   1000000    hexera   (12⁶)\n"
          " 35831808  10000000    heptera  (12⁷)\n"
          "      ...      ...    eccetera…",
        ),
        const _P(
          "In italiano le magnitudini si impilano per pura "
          "giustapposizione — come nel decimale «centoventuno» "
          "(121), non «cento e ventuno». Così o101 si legge "
          "«quadera uno», o123 «quadera due dozzine tre», o2300 "
          "«due cubere tre quadere». Le magnitudini vuote si "
          "omettono: o1023 si legge «cubera due dozzine tre», non "
          "«cubera zero quadera …». I moltiplicatori sono in "
          "italiano (due, tre, quattro), le magnitudini stesse "
          "sono prestiti germanici italianizzati con suffisso "
          "-era (femminile, plurale -ere).",
        ),
        const _H("Perché proprio dodici?"),
        const _P(
          "Il motivo è la divisibilità. Dodici ha sei divisori: "
          "1, 2, 3, 4, 6 e 12. Dieci ne ha solo quattro: 1, 2, 5 "
          "e 10. Sembra una piccola differenza, ma l'effetto sui "
          "calcoli quotidiani è considerevole — soprattutto con le "
          "frazioni.",
        ),
        const _H("Frazioni unitarie a confronto"),
        const _Pre(
          "  Frazione    Base 10    Base 12\n"
          "  1/2         0.5        0.6\n"
          "  1/3         0.333…     0.4\n"
          "  1/4         0.25       0.3\n"
          "  1/5         0.2        0.2497…\n"
          "  1/6         0.166…     0.2\n"
          "  1/8         0.125      0.16\n"
          "  1/9         0.111…     0.14\n"
          "  1/10        0.1        0.1249…\n"
          "  1/12        0.0833…    0.1",
        ),
        const _P(
          "In base 10 i terzi e i sesti sono frazioni periodiche "
          "infinite. In base 12 sono brevi ed esatte. In cambio i "
          "quinti e i decimi diventano periodici — uno scambio "
          "equo se si considera quanto spesso dividiamo per tre e "
          "quattro rispetto a cinque.",
        ),
        const _H("La regola dietro"),
        const _P(
          "Quali frazioni terminano e quali diventano periodiche "
          "segue una regola semplice: una frazione 1/n ha una "
          "rappresentazione finita in base b esattamente quando "
          "tutti i fattori primi di n sono anche fattori primi di "
          "b. I fattori primi di 12 sono 2 e 3. Quindi ogni "
          "frazione il cui denominatore è composto solo di due e "
          "tre termina. Tutto il resto — denominatori con 5, 7 o "
          "11 — diventa periodico. La calcolatrice marca questa "
          "periodicità con una barra sopra le cifre ripetute.",
        ),
        const _H("Tracce nella storia"),
        const _P(
          "Il dodici come magnitudine organizzatrice è più antico "
          "di qualsiasi sistema numerico. I babilonesi calcolavano "
          "in base 60 ma organizzavano le loro cifre in gruppi di "
          "12. Nel commercio si contava per dozzine (12) e grosse "
          "(144 = 12²). Il giorno ha 2×12 ore, l'anno 12 mesi, il "
          "cerchio completo 360 = 30×12 gradi.",
        ),
        const _P(
          "La Dozenal Society of America (fondata nel 1944, oggi "
          "con filiali in altri paesi) lavora per far conoscere "
          "meglio i vantaggi della base 12. Questa calcolatrice si "
          "inserisce in questa tradizione — non come una richiesta "
          "di cambio di sistema, ma come uno strumento di "
          "esplorazione e meraviglia.",
        ),
      ];
    case 2:
      return [
        const _H("144 — dove due mondi si incontrano"),
        const _P(
          "La successione di Fibonacci inizia con 1, 1, e ogni "
          "numero successivo è la somma dei due precedenti: 1, 1, "
          "2, 3, 5, 8, 13, 21, 34, 55, 89, 144, … Cresce "
          "esponenzialmente. I numeri quadrati — 1, 4, 9, 16, 25, "
          "36, … — invece crescono solo quadraticamente. Due "
          "successioni così diverse non hanno quasi ragione di "
          "incontrarsi. Eppure lo fanno: il dodicesimo numero di "
          "Fibonacci è 144, e 144 = 12².",
        ),
        const _P(
          "J. H. E. Cohn dimostrò nel 1964 che questo non è una "
          "coincidenza ma un evento unico: a parte F(1) = F(2) = 1, "
          "nessun altro numero di Fibonacci è contemporaneamente "
          "un quadrato perfetto. Il dodici si trova in un "
          "crocevia unico di due successioni numeriche "
          "fondamentali.",
        ),
        const _H("La sezione aurea"),
        const _P(
          "φ = (1+√5)/2 ≈ 1.618 è il limite del rapporto tra "
          "numeri di Fibonacci successivi: F(n+1)/F(n) → φ. In "
          "base 12: φ ≈ 1.74BB677… — la calcolatrice ha φ come "
          "costante nel pannello di estensione.",
        ),
        const _P(
          "Se digiti φ² =, vedrai che il risultato è esattamente "
          "φ+1 — la proprietà definitoria della sezione aurea. "
          "Questa identità rende φ una costante algebricamente "
          "unica.",
        ),
        const _H(
            "12 = 2² × 3 — una scomposizione in fattori con conseguenze"),
        const _P(
          "Dodici è un numero altamente composto (highly composite "
          "number): ha più divisori di qualsiasi numero naturale "
          "minore. I divisori di 12 sono 1, 2, 3, 4, 6, 12 — cioè "
          "sei. Srinivasa Ramanujan definì e studiò questa classe "
          "di numeri in un famoso articolo del 1915 sui "
          "Proceedings of the London Mathematical Society.",
        ),
        const _P(
          "Dodici è anche il più piccolo numero abbondante: la "
          "somma dei suoi divisori propri (1+2+3+4+6 = 16) supera "
          "il numero stesso. Per la maggior parte dei numeri "
          "piccoli vale il contrario — per 10, 1+2+5 = 8, che è "
          "minore di 10. Dodici è il primo numero in cui i "
          "divisori «traboccano».",
        ),
        const _H("La città ideale di Platone"),
        const _P(
          "Nelle sue «Leggi» (libro V), Platone pone la domanda di "
          "quanti cittadini dovrebbe avere una città ideale. La "
          "sua risposta: 5040. L'argomento non è mistico ma "
          "pratico: una città deve dividere continuamente i suoi "
          "cittadini in gruppi di uguale dimensione. 5040 è "
          "divisibile per ogni numero da 1 a 12 (con l'unica "
          "eccezione di 11).",
        ),
        const _P(
          "Ciò che Platone descrive intuitivamente è la stessa "
          "intuizione che sta alla base del sistema duodecimale: "
          "nella vita quotidiana, i divisori piccoli sono quelli "
          "importanti. 5040 = 7! è la sorella maggiore del dodici "
          "— la stessa filosofia di divisibilità applicata a "
          "un'intera popolazione urbana.",
        ),
      ];
    case 3:
      return [
        const _H("Che cos'è un dodecagono regolare?"),
        const _P(
          "Un dodecagono regolare è un poligono con dodici lati "
          "uguali e dodici angoli interni uguali. Ogni angolo "
          "interno misura 150° — o, espresso in duodecimale, 106°. "
          "È una delle forme geometriche più antiche e più usate: "
          "si trova su quadranti d'orologio, monete, ornamenti "
          "architettonici e motivi di pavimentazione.",
        ),
        const _H("Il coltellino svizzero dei poligoni"),
        const _P(
          "Ciò che rende il dodecagono unico non è la sua forma in "
          "sé, ma tutto ciò che contiene. Collegando ogni quarto "
          "vertice, si ottiene un triangolo equilatero — esatto, "
          "non approssimato. Ogni terzo vertice dà un quadrato. "
          "Ogni secondo vertice un esagono regolare. Le tre figure "
          "si inseriscono perfettamente nello stesso cerchio che "
          "circoscrive il dodecagono.",
        ),
        const _P(
          "Questo significa: il dodecagono contiene i tre poligoni "
          "regolari fondamentali della geometria come sottofigure "
          "esatte. Nessun altro poligono con così pochi vertici "
          "può dire altrettanto di sé. Una conseguenza diretta "
          "della divisibilità di 12 per 2, 3, 4 e 6.",
        ),
        const _H("Costruibile con compasso e riga"),
        const _P(
          "Non ogni poligono regolare può essere costruito "
          "esattamente con compasso e riga. Il dodecagono, invece, "
          "è costruibile: si inizia con un cerchio, lo si divide "
          "in sei parti uguali (questo è possibile perché "
          "l'esagono è costruibile), poi si biseca ciascuno di "
          "questi archi, e si hanno dodici punti uniformemente "
          "distribuiti sul cerchio.",
        ),
        const _P(
          "Il fondamento matematico: un n-agono regolare è "
          "costruibile esattamente quando n è un prodotto di una "
          "potenza di due e numeri primi di Fermat distinti "
          "(Gauss, 1796). Per 12 = 2² × 3 questo vale, perché 3 è "
          "un primo di Fermat.",
        ),
        const _H("Simmetria"),
        const _P(
          "Il dodecagono regolare ha 24 simmetrie: 12 rotazioni "
          "(di 0°, 30°, 60°, …, 330°) e 12 riflessioni (6 "
          "attraverso vertici opposti, 6 attraverso punti medi "
          "opposti dei lati). Nel linguaggio dell'algebra queste "
          "24 simmetrie formano il gruppo diedrico D₁₂. Ogni "
          "n-agono regolare ha esattamente 2n simmetrie.",
        ),
        const _Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H("54 diagonali"),
        const _P(
          "Una diagonale collega due vertici non adiacenti di un "
          "poligono. La formula n(n−3)/2 dà al dodecagono "
          "12×9/2 = 54 diagonali. Sembra una maglia intricata — "
          "ma la struttura è notevolmente ordinata.",
        ),
        const _H("Sei lunghezze diverse"),
        const _P(
          "Ogni diagonale salta un certo numero di vertici. "
          "Poiché il dodecagono è simmetrico, tutte le diagonali "
          "che saltano lo stesso numero di vertici condividono la "
          "stessa lunghezza. Ci sono cinque ampiezze di salto "
          "possibili (1 a 5 vertici), più il diametro che ne "
          "abbraccia 6 — cioè sei tipi di lunghezza in totale. "
          "Per lunghezza di lato s = 1:",
        ),
        const _Pre(
          "  Tipo         Salti           Lunghezza (esatta)   Approx.\n"
          "  s (lato)     —               1                    1.000\n"
          "  d₂           1 vertice       √(2+√3)              1.932\n"
          "  d₃           2 vertici       1+√3                 2.732\n"
          "  d₄           3 vertici       (3√2+√6)/2           3.346\n"
          "  d₅           4 vertici       2+√3                 3.732\n"
          "  d₆ (⌀)       5 vertici       √6+√2                3.864",
        ),
        const _H("Schemi nascosti"),
        const _P(
          "La terza e la quinta diagonale differiscono esattamente "
          "di 1: d₃ = 1+√3 e d₅ = 2+√3. La differenza è uguale "
          "alla lunghezza stessa del lato — un fatto geometrico, "
          "non computazionale.",
        ),
        const _P(
          "Il diametro d₆ è esattamente il doppio della diagonale "
          "più corta d₂: √6+√2 = 2·√(2+√3). Il diametro e la "
          "diagonale più corta stanno in un rapporto di 2:1 — la "
          "stessa proporzione dell'ottava in musica.",
        ),
        const _H("La griglia di 15 gradi"),
        const _P(
          "Tutti gli angoli che appaiono nel dodecagono — tra "
          "lati, tra diagonali — sono multipli di 15°. Questo "
          "perché i dodici vertici dividono il cerchio completo in "
          "dodici settori di 30°. 15° = 1/24 del cerchio completo. "
          "In duodecimale: 15° = 13°doz, e 30° = 26°doz. Tutti gli "
          "angoli che appaiono possono essere scritti in "
          "duodecimale come multipli interi di 13°.",
        ),
        const _Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H("L'area del dodecagono"),
        const _P(
          "Un dodecagono regolare con lunghezza di lato s ha area "
          "A = 3s²(2+√3). La derivazione è intuitiva: si taglia "
          "il dodecagono dal suo centro in 12 triangoli isosceli "
          "congruenti, si calcola l'area di un singolo triangolo, "
          "e si moltiplica per 12.",
        ),
        const _P(
          "Per s = 1 questo dà A ≈ 11.196 (decimale). In "
          "confronto: il cerchio circoscritto ha area πR² ≈ "
          "11.725. Il dodecagono riempie il suo cerchio "
          "circoscritto per oltre il 95 % — notevolmente meglio "
          "di un esagono (83 %) e molto meglio di un quadrato "
          "(64 %) o un triangolo (41 %).",
        ),
        const _H("3/π — un rapporto elegante"),
        const _P(
          "Il rapporto tra l'area del dodecagono e l'area del "
          "cerchio circoscritto si semplifica a 3/π. La "
          "derivazione usa sin²(15°) = (2−√3)/4, che cancella il "
          "fattore (2+√3)(2−√3) a 1 nel rapporto, lasciando "
          "esattamente 3/π.",
        ),
        const _P(
          "3/π ≈ 0.9549 (decimale) — il dodecagono cattura il "
          "95.5 % dell'area del cerchio. Digita 3 / π = sulla "
          "calcolatrice per verificarlo.",
        ),
        const _H("Quattro poligoni a confronto"),
        const _P(
          "Tutte le figure seguenti condividono lo stesso cerchio "
          "circoscritto. Formula: A = (n/2)·R²·sin(2π/n).",
        ),
        const _Pre(
          "  Figura            Parte     Formula\n"
          "  Triangolo         41.3 %    3√3/(4π)\n"
          "  Quadrato          63.7 %    2/π\n"
          "  Esagono           82.7 %    3√3/(2π)\n"
          "  Dodecagono        95.5 %    3/π",
        ),
        const _P(
          "L'esagono ha esattamente il doppio dell'area del "
          "triangolo (entrambi contengono il fattore 3√3). E ogni "
          "passo porta un guadagno maggiore di area, perché i "
          "vertici abbracciano il cerchio sempre più "
          "strettamente.",
        ),
        const _H("Archimede e π"),
        const _P(
          "Archimede calcolava π tramite poligoni. Usò un 96-agono "
          "— 96 = 12×8 = 12×2³. Iniziò con l'esagono (banalmente "
          "costruibile) e raddoppiò il numero di vertici tre "
          "volte: 6→12→24→48→96. Quindi, il punto di partenza del "
          "suo metodo era il dodecagono.",
        ),
        const _P(
          "Il suo risultato: 3 + 10/71 < π < 3 + 1/7. Un 96-agono "
          "riempie il cerchio circoscritto al 99.93 %. Dal 95.5 % "
          "del dodecagono al 99.93 % sono solo tre passi di "
          "raddoppiamento — un tasso di convergenza notevole.",
        ),
      ];
    case 6:
      return [
        const _H("Dodici facce"),
        const _P(
          "Il dodecaedro è un solido costruito di dodici "
          "pentagoni regolari. Ogni faccia è identica, ogni "
          "spigolo di uguale lunghezza, ed esattamente tre "
          "pentagoni si incontrano in ogni vertice. In totale ha "
          "12 facce, 30 spigoli e 20 vertici. È uno dei cinque "
          "solidi platonici — i soli solidi convessi le cui facce "
          "consistono esclusivamente di poligoni regolari "
          "identici.",
        ),
        const _H("I cinque solidi platonici"),
        const _Pre(
          "  Solido               Facce  Vertici  Spigoli  Forma\n"
          "  Tetraedro              4      4         6   Triangoli\n"
          "  Cubo                   6      8        12   Quadrati\n"
          "  Ottaedro               8      6        12   Triangoli\n"
          "  Dodecaedro            12     20        30   Pentagoni\n"
          "  Icosaedro             20     12        30   Triangoli",
        ),
        const _P(
          "Il dodecaedro è l'unico solido platonico con facce "
          "pentagonali. Nella sua cosmologia, Platone assegnò gli "
          "altri quattro solidi agli elementi — e il dodecaedro "
          "al cosmo stesso.",
        ),
        const _H("Come si presenta?"),
        const _P(
          "Chi gioca giochi di ruolo lo conosce come D12 — il "
          "dado a dodici facce. Sta comodamente in mano e cade "
          "affidabilmente su una faccia. Il pallone da calcio non "
          "è un dodecaedro: è un icosaedro troncato di 12 "
          "pentagoni e 20 esagoni.",
        ),
        const _H("Dodecaedri pentagonali gallo-romani"),
        const _P(
          "Più di cento piccoli oggetti di bronzo a forma di "
          "dodecaedro sono stati trovati nel nord Europa, datati "
          "ai secoli II–IV d. C. Hanno dodici facce pentagonali "
          "con fori rotondi di dimensioni variabili. Nessuno sa "
          "con certezza a cosa servissero. Le ipotesi vanno da "
          "candelieri a strumenti di rilevamento passando per "
          "oggetti religiosi. L'enigma resta irrisolto.",
        ),
        const _H("La formula del poliedro di Eulero"),
        const _P(
          "Per ogni poliedro convesso vale una relazione "
          "semplice: vertici meno spigoli più facce è sempre "
          "uguale a due. Leonhard Eulero formulò questa legge nel "
          "1758. Per il dodecaedro: 20 − 30 + 12 = 2. La formula "
          "vale per i cinque solidi platonici, per ogni prisma, "
          "per ogni piramide, per ogni poliedro convesso in "
          "generale.",
        ),
      ];
    case 7:
      return [
        const _H("La sezione aurea nel dodecaedro"),
        const _P(
          "Ogni faccia del dodecaedro è un pentagono regolare — e "
          "il pentagono regolare è la casa della sezione aurea. "
          "La diagonale di tale pentagono sta al suo lato "
          "esattamente come φ = (1+√5)/2 ≈ 1.618 (decimale) sta "
          "a 1. Questa proporzione permea l'intero solido.",
        ),
        const _Pre(
          "  Quantità             Formula             Decimale\n"
          "  Volume               (15+7√5)/4          ≈ 7.663\n"
          "  Superficie           3√(25+10√5)         ≈ 20.646\n"
          "  Raggio circoscritto  √3·φ/2              ≈ 1.401\n"
          "  Raggio inscritto     √(25+11√5)/(2√10)   ≈ 1.114",
        ),
        const _P(
          "Se digiti φ² = sulla calcolatrice, ottieni φ+1. Questa "
          "è la proprietà definitoria della sezione aurea — e la "
          "ragione per cui φ appare in così tante formule del "
          "dodecaedro.",
        ),
        const _H("Dualità — lo specchio dell'icosaedro"),
        const _P(
          "A ogni solido platonico corrisponde un solido duale: "
          "si sostituisce ogni faccia con un vertice (al centro "
          "della faccia) e si collegano i nuovi vertici adiacenti "
          "con spigoli. Per il dodecaedro questo dà l'icosaedro — "
          "e viceversa:",
        ),
        const _Pre(
          "                  Dodecaedro    Icosaedro\n"
          "  Facce                12          20\n"
          "  Spigoli              30          30\n"
          "  Vertici              20          12",
        ),
        const _P(
          "Facce e vertici si scambiano di posto ; il numero di "
          "spigoli rimane uguale. Il numero 12 appare in entrambi "
          "i solidi — una volta come numero di facce, una volta "
          "come numero di vertici.",
        ),
        const _H("120 simmetrie"),
        const _P(
          "Il dodecaedro possiede la simmetria più ricca tra i "
          "solidi platonici: il gruppo icosaedrico Iₕ con 120 "
          "elementi — 60 rotazioni e 60 rotazioni-riflessioni. In "
          "confronto: il cubo ha solo 48 simmetrie, il tetraedro "
          "24.",
        ),
        const _P(
          "120 = 5! = 2³×3×5. I tre fattori primi 2, 3 e 5 sono "
          "esattamente quelli che convergono nelle facce del "
          "dodecaedro (pentagoni) e nella divisibilità di 12 "
          "(= 2²×3).",
        ),
      ];
    case 8:
      return [
        const _H("360 gradi e i babilonesi"),
        const _P(
          "Che un cerchio completo abbia 360 gradi non è una "
          "costante naturale — è una convenzione umana, che risale "
          "ai babilonesi. La matematica babilonese usava base 60, "
          "e 360 = 6×60. Ma 360 può anche essere scritto come "
          "12×30, ed è esattamente così che i babilonesi divisero "
          "il cielo: il cammino apparente del sole (l'eclittica) "
          "fu diviso in 12 sezioni uguali di 30° ciascuna. A ogni "
          "sezione fu assegnata una costellazione — i dodici "
          "segni dello zodiaco.",
        ),
        const _P(
          "La scelta di 12 non fu casuale. I babilonesi "
          "organizzarono internamente il loro sistema in base 60 "
          "in gruppi di 12, poiché 60 = 12×5. Per loro il dodici "
          "era una sottounità naturale — nella misurazione del "
          "tempo, nel calendario, nell'astronomia.",
        ),
        const _H("La luna e il dodici"),
        const _P(
          "Perché proprio dodici sezioni del cielo? Perché la "
          "natura stessa suggerisce una divisione per dodici: un "
          "anno solare contiene quasi esattamente 12 cicli "
          "lunari. Un mese sinodico dura circa 29.53 giorni. 12 "
          "cicli lunari danno 354.4 giorni — solo 11 giorni meno "
          "di un anno solare di 365.24 giorni. Questa "
          "quasi-coincidenza fece del dodici la divisione ovvia "
          "dell'anno.",
        ),
        const _H("Ordine nel cielo"),
        const _P(
          "La divisione duodecimale del cielo era molto più di un "
          "sistema di coordinate per le culture antiche. Un "
          "dettaglio affascinante: il punto vernale si sposta "
          "lentamente attraverso le costellazioni perché l'asse "
          "della Terra oscilla come una trottola (precessione, "
          "periodo di circa 25 800 anni). Le costellazioni "
          "attraverso le quali si sposta il punto vernale si "
          "chiamano perciò anche ere. Anche qui il dodici "
          "struttura il tempo: dodici costellazioni, dodici ere, "
          "un grande cerchio.",
        ),
        const _H("Il dodici altrove nel cielo"),
        const _P(
          "Gli antichi egizi dividevano il giorno e la notte in "
          "12 ore ciascuno — da qui la nostra divisione di 24 "
          "ore. Lo zodiaco cinese conta anch'esso dodici segni in "
          "cicli di 12 anni, derivati dall'orbita di 12 anni di "
          "Giove. Entrambe le tradizioni sono sorte "
          "indipendentemente. La convergenza sul numero 12 è "
          "notevole.",
        ),
      ];
    case 9:
      return [
        const _H("Pirite — il dodecaedro dello stolto"),
        const _P(
          "La pirite (FeS₂), nota per il suo brillio dorato come "
          "«oro degli stolti», cristallizza spesso in una forma "
          "ingannevolmente simile al dodecaedro platonico: il "
          "piritoedro. Ha dodici facce pentagonali, 20 vertici e "
          "30 spigoli — la stessa topologia del dodecaedro "
          "regolare del capitolo 7. Ma osservando da vicino, i "
          "pentagoni non sono regolari. In cristallografia, la "
          "vera simmetria di rotazione di ordine cinque è "
          "impossibile per i cristalli periodici — sono permesse "
          "solo simmetrie di ordini 1, 2, 3, 4 e 6. Il piritoedro "
          "elude questa regola con pentagoni irregolari.",
        ),
        const _H("Granato — un altro solido a dodici facce"),
        const _P(
          "I minerali del gruppo del granato cristallizzano "
          "preferibilmente come dodecaedri rombici — anche un "
          "solido a dodici facce, ma di natura completamente "
          "diversa: le facce sono rombi, non pentagoni. Il "
          "dodecaedro rombico ha 14 vertici e 24 spigoli e "
          "appartiene al sistema cristallino cubico. Tassella lo "
          "spazio senza vuoti — l'equivalente tridimensionale del "
          "favo d'api.",
        ),
        const _P(
          "La natura usa il numero 12 come numero di facce per "
          "due forme cristalline completamente diverse — "
          "pentagoni nella pirite, rombi nel granato. Il dodici "
          "non è legato a una geometria particolare.",
        ),
        const _H("Radiolari — scheletri di vetro"),
        const _P(
          "I radiolari sono organismi marini unicellulari, "
          "appena più grandi di un decimo di millimetro, che "
          "costruiscono scheletri filigranati di silice. Alcune "
          "specie formano scheletri con simmetria icosaedrica — "
          "la simmetria dell'icosaedro, il duale del dodecaedro. "
          "Il biologo tedesco Ernst Haeckel disegnò questi "
          "organismi nel 1904 nella sua opera «Forme Artistiche "
          "della Natura» con un dettaglio che ancora oggi "
          "impressiona.",
        ),
        const _H("Quasicristalli — l'eccezione che conferma la regola"),
        const _P(
          "Nel 1982 Dan Shechtman scoprì uno schema con simmetria "
          "icosaedrica in una lega di alluminio-manganese — "
          "simmetria proibita nei cristalli ordinari. La comunità "
          "scientifica reagì inizialmente con rifiuto. Ma "
          "l'osservazione tenne, e nel 2011 Shechtman ricevette "
          "il Premio Nobel per la Chimica. Questi quasicristalli "
          "hanno simmetria icosaedrica, che contiene sia la "
          "geometria dodecaedrica sia quella icosaedrica. "
          "Quasicristalli naturali — il minerale icosaedrite — "
          "furono scoperti nel 2009 in un meteorite in Kamčatka.",
        ),
      ];
    case 10:
      return [
        const _H("Dodici in una mano"),
        const _P(
          "Tieni una mano davanti a te, il pollice separato, e "
          "guarda le quattro dita. Ogni dito ha tre segmenti "
          "(falangi), separati da articolazioni visibili. Quattro "
          "dita per tre segmenti — fa dodici. Il pollice può "
          "servire da puntatore: tocca a turno ogni segmento "
          "delle quattro dita e così conti da uno a dodici.",
        ),
        const _P(
          "Questo metodo non è un'invenzione moderna. In parti "
          "del sud-est asiatico, India e Medio Oriente, è usato "
          "da secoli. Ha un vantaggio decisivo sul conteggio "
          "occidentale con le dita: usa una mano per dodici "
          "unità invece di cinque.",
        ),
        const _H("Da dodici a sessanta"),
        const _P(
          "La seconda mano conta i giri completi. Ogni volta che "
          "la prima mano finisce un giro di dodici, la seconda "
          "mano estende un dito. Cinque dita per dodici — fa "
          "sessanta. Con due mani si può contare fino a 60, "
          "senza alcun ausilio.",
        ),
        const _P(
          "Questa connessione tra 12 e 60 probabilmente non è "
          "casuale: il sistema sessagesimale babilonese (base "
          "60) potrebbe avere la sua origine in questo metodo di "
          "conteggio. 60 = 12×5 — un'elegante fusione di "
          "anatomia e aritmetica.",
        ),
        const _H("Altri dodici nell'anatomia umana"),
        const _Pre(
          "  — 12 paia di coste (anatomia standard)\n"
          "  — 12 paia di nervi cranici (I Olfattivo a XII Ipoglosso)\n"
          "  — 12 vertebre toraciche (collegate con le 12 paia di coste)",
        ),
        const _P(
          "Variazioni anatomiche si verificano (11 o 13 paia di "
          "coste sono raramente possibili).",
        ),
        const _H("La mano ha formato il sistema numerico?"),
        const _P(
          "Se l'anatomia delle falangi abbia influenzato la "
          "nascita di sistemi numerici duodecimali, o viceversa, "
          "non può essere determinato con certezza storica. "
          "Potrebbe essere stato un rafforzamento reciproco: la "
          "gente cominciò a contare con le falangi perché il "
          "dodici era già importante nella loro cultura. Ciò che "
          "è sicuro: la mano umana offre una base fisica "
          "naturale per il dodici.",
        ),
      ];
    case 11:
      return [
        const _H("Dozzine nella vita quotidiana"),
        const _Pre(
          "  12 pollici  = 1 piede\n"
          "  12 once     = 1 libbra troy (metalli preziosi)\n"
          "  12 penny    = 1 scellino (moneta britannica fino al 1971)\n"
          "  12 pezzi    = 1 dozzina\n"
          "  144         = 12² = 1 grossa",
        ),
        const _P(
          "Queste divisioni non sono incidenti storici — sono "
          "state scelte perché facilitano la spartizione. Un "
          "piede si divide in due parti uguali (6 pollici "
          "ciascuna), in tre (4 pollici ciascuna), in quattro (3 "
          "pollici ciascuna) e in sei (2 pollici ciascuna). "
          "Ognuna di queste divisioni viene esatta.",
        ),
        const _P(
          "Un metro, invece, si divide in due parti uguali "
          "(50 cm ciascuna) e in cinque (20 cm ciascuna), ma un "
          "terzo di metro sono 33.333… cm — una frazione "
          "infinita appena si vuole esattezza. Nei mestieri dove "
          "si terza e si quarta continuamente, il dodici è più "
          "pratico del dieci.",
        ),
        const _H("Il sistema metrico — e il suo punto cieco"),
        const _P(
          "Il sistema metrico ha grandi forze: è coerente (tutte "
          "le unità si combinano), si scala decimalmente (kilo, "
          "mega, milli, micro), ed è standardizzato a livello "
          "internazionale. Questi vantaggi sono reali e "
          "considerevoli. Nessuna persona ragionevole proporrebbe "
          "di abolire il SI.",
        ),
        const _P(
          "Ma il sistema metrico eredita la debolezza della sua "
          "base. In base 10 un terzo è una frazione infinita: "
          "0.333… In un sistema metrico duodecimale, 1/3 sarebbe "
          "0.4 — esatto, breve, senza resto. L'eleganza del "
          "principio metrico sarebbe preservata — solo la base "
          "sarebbe migliore.",
        ),
        const _H("Il TGM di Tom Pendlebury"),
        const _P(
          "Tom Pendlebury, membro della Dozenal Society of Great "
          "Britain, seguì questo pensiero fino in fondo. Il suo "
          "sistema si chiama TGM — chiamato così dalle sue tre "
          "unità di base: Tim (tempo), Grafut (lunghezza), Maz "
          "(massa). Pendlebury non partì dalla lunghezza ma dal "
          "tempo: divise l'ora in 12⁴ parti uguali. Dal Tim "
          "derivò il Grafut tramite l'accelerazione "
          "gravitazionale terrestre (≈ 29.6 cm), e l'unità di "
          "massa Maz dal volume di un Grafut cubico d'acqua.",
        ),
        const _P(
          "Il risultato è un sistema di unità completamente "
          "coerente, in cui tutte le conversioni sono potenze "
          "di 12. Il TGM non è mai stato adottato oltre i "
          "circoli entusiasti, ma dimostra che un sistema "
          "metrico duodecimale non solo sarebbe possibile — in "
          "alcuni aspetti sarebbe superiore al decimale.",
        ),
        const _H("Cosa mostra questa calcolatrice"),
        const _P(
          "Digita 1 / 3 = e vedrai 0.4 — breve, esatto, senza "
          "barra di periodo — e capirai in un secondo ciò che "
          "pagine di argomenti non possono trasmettere. La "
          "domanda «duodecimale o decimale?» non sarà mai decisa "
          "nella pratica. Ma i vantaggi matematici della base "
          "12 sono oggettivi e misurabili, e questa calcolatrice "
          "li rende percepibili.",
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
