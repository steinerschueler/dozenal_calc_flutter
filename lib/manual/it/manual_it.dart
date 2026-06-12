// it manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_it.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersIt() => const [
  ManualChapter('Grundbedienung', [
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
      "tutto l'input e il risultato ; Del rimuove il carattere a "
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
      "trigonometriche: DEG → RAD → GRAD → DEG. La modalità "
      "corrente è mostrata in alto a destra del display, "
      "direttamente sopra l'indicatore Doz/Dez. Predefinito: "
      "DEG.",
    ),
  ]),
];
