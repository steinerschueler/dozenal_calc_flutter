// es manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_es.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersEs() => const [
  ManualChapter('Primeros pasos', [
    _H("Los dígitos"),
    _P(
      "Esta calculadora usa sus propios símbolos para los doce "
      "dígitos. Cuatro dígitos ancla son puntas de flecha "
      "estilizadas que apuntan en las cuatro direcciones "
      "cardinales — 1 (arriba), 4 (izquierda), 7 (derecha), A "
      "(abajo). Dividen el círculo numérico en cuatro grupos de "
      "tres, como las horas 12, 3, 6 y 9 en una esfera de reloj.",
    ),
    _P(
      "Todos los dígitos intermedios están construidos a partir "
      "de semicírculos y círculos completos. El cero es un "
      "círculo simple, B (= once) un semicírculo sobre un círculo completo.",
    ),
    _DigitLegend(),
    _H("Uso básico"),
    _P(
      "Toca números y operadores como en una calculadora de "
      "bolsillo ordinaria. Pulsa la tecla ancha = en la parte "
      "inferior para calcular el resultado. AC (en rojo de "
      "advertencia) borra toda la entrada y el resultado; Del "
      "elimina el carácter a la izquierda del cursor.",
    ),
    _H("Ayuda y teoría"),
    _P(
      "A la izquierda y a la derecha de la tecla = hay dos botones "
      "redondos: (i) abre estos doce capítulos teóricos, (?) "
      "reproduce el recorrido de uso con los marcadores rojos. El "
      "recorrido se abre automáticamente en el primer inicio.",
    ),
    _H("Cursor y navegación"),
    _P(
      "La barra roja en el campo de entrada es el cursor. Usa ◀ "
      "y ▶ para moverlo, insertando o eliminando caracteres en "
      "medio de una fórmula. Después de un cálculo, el cursor se "
      "mueve al campo de resultado — las flechas mueven entonces "
      "el cursor del resultado. Tan pronto como inicias una nueva "
      "entrada, el cursor vuelve al campo de entrada.",
    ),
    _H("Continuar un cálculo"),
    _P(
      "Después de un cálculo puedes continuar directamente con "
      "un operador. Toca + 5 = por ejemplo, y la calculadora usa "
      "automáticamente el último resultado como primer operando. "
      "Para empezar un cálculo completamente nuevo, pulsa primero "
      "AC.",
    ),
    _H("Doble toque para funciones inversas"),
    _P(
      "Un segundo toque en una tecla de función la convierte en "
      "su inversa: sin se convierte en sin⁻¹, cos en cos⁻¹, y así "
      "sucesivamente. La misma regla se aplica a las funciones "
      "hiperbólicas en el panel de extensión. Un pequeño punto "
      "dorado en la tecla indica que el siguiente toque "
      "invertirá.",
    ),
    _H("Pulsación larga para más funciones"),
    _P(
      "Las teclas con una pequeña esquina abajo a la derecha "
      "ofrecen funciones relacionadas con una pulsación larga: x□ "
      "contiene x², log contiene ln, log₁₂ y eˣ, − contiene ±, "
      "STO contiene M+ y M−, n! contiene nCr y nPr. Para elegir, "
      "desliza el dedo hasta la opción deseada y suelta — o "
      "suelta y toca la opción. Un toque fuera cierra el panel.",
    ),
    _H("Operadores especiales"),
    _P(
      "x² eleva al cuadrado el número anterior. √ calcula la raíz "
      "cuadrada; si hay un número a su izquierda, ese número se usa "
      "como grado de la raíz: 3√8 da la raíz cúbica de 8, es decir 2. "
      "log calcula un logaritmo donde el número de la izquierda es el "
      "argumento y el de la derecha es la base: 8 log 2 es el logaritmo "
      "de 8 en base 2, es decir 3. "
      "⊕ calcula la suma paralela: a ⊕ b = (a·b)/(a+b), útil "
      "para resistencias en paralelo.",
    ),
    _H("Panel de extensión"),
    _P(
      "La tecla … en la parte inferior derecha abre el panel de "
      "extensión con más funciones: memoria, constantes (π, e, "
      "φ, √2), funciones hiperbólicas, operadores avanzados, "
      "además de EXP y DRG. La misma tecla lo cierra, o un toque "
      "fuera del panel. En tabletas todos los conjuntos están "
      "visibles uno al lado del otro de todos modos — no hay "
      "superposición.",
    ),
    _Pre(
      "  6 — Memoria:        STO   RCL   MC    Ans\n"
      "  7 — Constantes:     π     e     φ     √2\n"
      "  8 — Hiperbólicas:   sinh  cosh  tanh  coth\n"
      "  9 — Avanzados:      n!    |x|   1/x   mod\n"
      "  10 — Modos:         EXP   DRG   …",
    ),
    _H("Memoria"),
    _P(
      "STO almacena el resultado actual, RCL inserta el valor "
      "almacenado en la entrada, MC borra la memoria. Una pequeña "
      "M en la pantalla indica que algo está almacenado. Ans "
      "inserta el resultado del último cálculo — los valores "
      "racionales exactos se almacenan completos, la periodicidad "
      "se conserva.",
    ),
    _H("Barra de período"),
    _P(
      "Cuando el resultado es una fracción periódica, la "
      "calculadora marca los dígitos repetidos con una barra "
      "encima. Ejemplo: 1/5 da 0.2497 con barra sobre los cuatro "
      "dígitos. Para períodos de más de cinco dígitos, solo se "
      "muestran los primeros cinco, seguidos de …",
    ),
    _H("Sistema numérico: Doz / Dez"),
    _P(
      "El sistema numérico se cambia en los ajustes, accesibles "
      "a través de la tecla (i): duodecimal calcula en base 12 "
      "(predeterminado), decimal en base 10. El sistema activo "
      "se muestra en la parte superior derecha de la pantalla.",
    ),
    _P(
      "Al cambiar, el número actualmente visible se convierte "
      "automáticamente al otro sistema. «10» en Doz se convierte "
      "en «12» en Dez. En modo Dez los símbolos de 10 y 11 se "
      "vuelven inactivos (grises), ya que no existen como dígitos "
      "únicos en base 10 — para Doz simplemente cambia de vuelta.",
    ),
    _H("Modo de ángulo"),
    _P(
      "DRG cicla el modo de ángulo para las funciones "
      "trigonométricas: DEG → RAD → GRAD → DEG. El modo actual se "
      "muestra en la parte superior derecha de la pantalla, "
      "justo encima del indicador Doz/Dez. Predeterminado: DEG.",
    ),
  ]),
  ManualChapter('Exponentes, raíces y logaritmos', [
    _H('Tres preguntas sobre una misma relación'),
    _P(
      'Elevar a una potencia, extraer una raíz y calcular un logaritmo parecen '
      'tres operaciones distintas. En realidad son tres preguntas sobre una '
      'misma relación: b elevado a e da n, en síntesis b^e = n. Aquí b es la '
      'base, e el exponente y n el resultado. Si conoces dos de estas tres '
      'cantidades puedes encontrar la tercera — y para eso existen exactamente '
      'las tres teclas x^□, √ y log.',
    ),
    _P(
      'La potencia responde: la base y el exponente son conocidos, ¿cuánto vale '
      'el resultado? La raíz responde: el resultado y el exponente son conocidos, '
      '¿cuál era la base? El logaritmo responde: la base y el resultado son '
      'conocidos, ¿qué exponente se esconde detrás? La raíz y el logaritmo son '
      'pues las dos inversas de la potencia.',
    ),
    PowerTriangleFigure(power: 'Potencia', base: 'Base', exponent: 'Exponente'),
    _H('Potencias: multiplicación repetida'),
    _P(
      'La potencia b^e significa, en principio, nada más que multiplicar b por '
      'sí mismo exactamente e veces. Así, 2^3 = 2·2·2 = 8 y 3^2 = 3·3 = 9. '
      'Elevar a una potencia condensa una multiplicación, igual que la '
      'multiplicación condensa una suma.',
    ),
    _P(
      'De esta idea simple se derivan las leyes de los exponentes, que se '
      'comprenden al instante contando los factores. Multiplicar dos potencias '
      'de la misma base suma los exponentes: b^m · b^n = b^(m+n) — basta con '
      'concatenar los factores. Elevar una potencia a otra potencia multiplica '
      'los exponentes: (b^m)^n = b^(m·n).',
    ),
    _P(
      'Dos casos especiales se derivan de la misma regla. b^0 es siempre 1, '
      'porque b^1 dividido entre b^1 da tanto 1 como b^(1−1) = b^0. Y un '
      'exponente negativo significa el recíproco: b^(−n) = 1/b^n, pues '
      'b^n · b^(−n) debe dar b^0 = 1.',
    ),
    _P(
      'Si se representan los valores de una potencia como 2^x se obtiene una '
      'curva que sube cada vez más empinada — la imagen familiar del crecimiento '
      'exponencial.',
    ),
    ExpCurveFigure(),
    _H('La raíz — la primera inversa'),
    _P(
      'La raíz deshace la potencia cuando el exponente es conocido. La raíz '
      'cuadrada de 9 es 3, porque 3^2 = 9; la raíz cúbica de 8 es 2, porque '
      '2^3 = 8. En la calculadora, √ representa la raíz cuadrada; si se escribe '
      'un número a su izquierda, ese número se convierte en el índice de la raíz '
      '— 3√8 es la raíz cúbica de 8.',
    ),
    _P(
      'Una raíz no es más que una potencia con exponente fraccionario: la '
      'raíz n-ésima de x es x^(1/n). Esto no es mera notación, sino que se '
      'deduce directamente de la ley de los exponentes — elevar x^(1/n) a la '
      'potencia n da x^((1/n)·n) = x^1 = x. Si se dibujan y = x² e y = √x en '
      'la misma figura, son imágenes especulares respecto a la recta y = x. '
      'Ese es el signo visible de que una función invierte a la otra.',
    ),
    SquareRootFigure(),
    _H('El logaritmo — la segunda inversa'),
    _P(
      'El logaritmo deshace la potencia cuando la base es conocida. Responde: '
      '¿con qué exponente debo elevar la base para obtener el resultado? Se '
      'escribe log_b(n) = e. Así, log_2(8) = 3, porque 2^3 = 8. En la '
      'calculadora se introduce como 8 log 2 — el argumento a la izquierda, '
      'la base a la derecha.',
    ),
    _P(
      'El logaritmo también es una imagen especular: y = log_2(x) surge de '
      'y = 2^x por reflexión respecto a la recta y = x. Donde la curva '
      'exponencial sube empinada, el logaritmo crece apenas — convierte '
      'enormes rangos en números manejables.',
    ),
    ExpLogFigure(),
    _H('Las leyes de los logaritmos'),
    _P(
      'Porque el logaritmo invierte las potencias, las leyes de los exponentes '
      'se convierten en leyes especulares de los logaritmos. Un producto se '
      'convierte en suma: log(x·y) = log x + log y. Un cociente se convierte '
      'en diferencia: log(x/y) = log x − log y. Y un exponente en el argumento '
      'se convierte en un factor delante: log(x^k) = k · log x.',
    ),
    _P(
      'Esta conversión de multiplicaciones en sumas fue durante siglos el '
      'propósito real de los logaritmos: con las tablas de logaritmos, las '
      'tediosas multiplicaciones podían sustituirse por simples consultas y '
      'sumas. El mismo principio subyace en toda escala logarítmica — desde '
      'la escala de decibelios del sonido hasta la magnitud de los terremotos.',
    ),
    _P(
      'La base de un logaritmo es de libre elección, y cualquier base se '
      'convierte en cualquier otra: log_b(x) = log_c(x) / log_c(b). ln (base e), '
      'log en base 2 y log₁₂ no son por tanto funciones fundamentalmente '
      'distintas, sino la misma pregunta en una escala diferente — solo difieren '
      'en un factor constante.',
    ),
    _H('En esta calculadora'),
    _P(
      'Las tres teclas básicas están en el Set 2: x^□ para la potencia, √ para '
      'la raíz, log para el logaritmo. x² en el menú de pulsación larga de la '
      'tecla de potencia es la forma abreviada de «al cuadrado». Con una '
      'pulsación larga sobre log también se accede a ln, log₁₂ y eˣ; estas '
      'abren un paréntesis directamente para que escribas el argumento.',
    ),
    _P(
      'El operador de potencia es asociativo por la derecha: 2^2^3 significa '
      '2^(2^3) = 2^8, no (2^2)^3. Los exponentes enteros y la notación '
      'científica EXP (a EXP b = a·12^b) son exactos; las raíces y los '
      'logaritmos, en cambio, muestran un «≈» incluso cuando el resultado es '
      'un número entero — se calculan mediante el evaluador aproximado.',
    ),
    _Pre(
      'Entrada       Resultado   (decimal)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          raíz cúbica\n'
      '8 log 2    ≈   3          log en base 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H('Potencias de doce y log₁₂'),
    _P(
      'En base doce las potencias de doce son los números redondos, exactamente '
      'como las potencias de diez lo son en el sistema decimal: doce se escribe '
      '«10», ciento cuarenta y cuatro como «100», mil setecientos veintiocho '
      'como «1000». Así, cuando lees «100» en la calculadora, estás pensando en '
      'un salto de 144, no de 100.',
    ),
    _P(
      'Por eso log₁₂ es el contador natural de dígitos en el sistema duodecimal '
      '— igual que el logaritmo en base diez lo es en el sistema decimal. Para '
      'una potencia de doce su valor es exactamente el número de dígitos menos '
      'uno: log₁₂(«10») = 1, log₁₂(«100») = 2, log₁₂(«1000») = 3.',
    ),
    _P(
      'Los cuadrados y cubos tienen un aspecto desconocido en duodecimal, pero '
      'son los mismos valores — simplemente escritos de forma diferente. 4² es '
      '«14» (dieciséis), 5² es «21» (veinticinco), A² es «84» (cien), B² es '
      '«A1» (ciento veintiuno). Las matemáticas nunca cambian con la base de '
      'escritura; e y ln también son independientes de la base. Solo cambia la '
      'cadena de dígitos, no el valor.',
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H('Qué tener en cuenta'),
    _P(
      'Algunas entradas no están definidas y conducen a un error: el logaritmo '
      'de cero o de un número negativo, así como las bases 0 y 1. La raíz '
      'cuadrada de un número negativo tampoco existe en los reales. Los '
      'exponentes negativos y fraccionarios, en cambio, están permitidos sin '
      'restricciones — 8^(−1/3) es 1/2.',
    ),
    _P(
      'Y una vez más sobre el «≈»: no significa «inexacto». Las raíces y los '
      'logaritmos siempre pasan por el evaluador de coma flotante y por eso '
      'llevan este signo, incluso cuando el resultado es un número entero '
      'limpio. El valor mostrado es correcto — el signo solo revela el método.',
    ),
  ]),
  ManualChapter('Suma paralela (⊕)', [
    _H('Una quinta operación'),
    _P(
      'Junto a las cuatro operaciones básicas, la calculadora incorpora una '
      'quinta, menos conocida: la suma paralela, escrita con el signo ⊕. Se '
      'define como a ⊕ b = (a·b)/(a+b). Debe su nombre a la electrotécnica '
      '— describe la resistencia total de dos resistencias conectadas en '
      'paralelo —, pero la misma fórmula aparece en todos los contextos donde '
      'no son las magnitudes en sí las que se suman, sino sus recíprocos.',
    ),
    _H('La corriente busca el camino más fácil'),
    _P(
      'Si se conectan dos resistencias en paralelo, quedan entre los mismos dos '
      'puntos; ambas tienen la misma tensión, y la corriente se reparte entre '
      'los dos caminos. Cuánto fluye por cada ramal depende de su resistencia '
      '— por el camino de menor resistencia fluye más.',
    ),
    _P(
      'Lo que importa es la conductancia, el recíproco de la resistencia '
      '(G = 1/R): indica cuán bien deja pasar la corriente un componente. En '
      'una conexión en paralelo las conductancias se suman: 1/R = 1/R₁ + 1/R₂. '
      'Despejando R se obtiene exactamente la suma paralela: '
      'R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.',
    ),
    ParallelCircuitFigure(),
    _H('Siempre menor que el menor'),
    _P(
      'El resultado sorprendente: la resistencia total es siempre menor que la '
      'menor de las dos resistencias individuales. Un segundo camino deja pasar '
      'corriente adicional, sin importar cuán alta sea su resistencia. Dos '
      'resistencias iguales en paralelo reducen a la mitad el valor: '
      '6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. Una resistencia de 6 Ω y otra de 3 Ω dan '
      '18/9 = 2 Ω — menos que 3.',
    ),
    _P(
      'Intuitivamente: dos puertas juntas dejan pasar más personas que una; '
      'abrir una segunda caja acorta la cola. Más caminos significan menos '
      'resistencia y mayor caudal.',
    ),
    ParallelBarFigure(lessThanBoth: 'menor que cualquier valor individual'),
    _H('Derivación de la fórmula'),
    _P(
      'El punto de partida es la regla de que los recíprocos se suman: '
      '1/(a⊕b) = 1/a + 1/b. Llevando el lado derecho a denominador común se '
      'obtiene (a+b)/(a·b). El recíproco de eso es a ⊕ b = (a·b)/(a+b). No '
      'hay más — toda la operación es «suma los recíprocos y toma el recíproco '
      'del resultado».',
    ),
    _H('Propiedades'),
    _P(
      'Las reglas de cálculo se derivan de la simetría de la fórmula. ⊕ es '
      'conmutativa (a ⊕ b = b ⊕ a) y asociativa, por lo que se pueden combinar '
      'cualquier número de valores: con tres términos simplemente se suman tres '
      'recíprocos, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Los valores iguales se '
      'simplifican especialmente bien — n números iguales en paralelo dan a/n, '
      'así que a ⊕ a = a/2 y a ⊕ a ⊕ a = a/3.',
    ),
    _P(
      'Para números positivos el resultado siempre está por debajo del operando '
      'menor. Dos casos límite completan el panorama: a ⊕ 0 = 0 — un camino '
      'sin resistencia, un cortocircuito, absorbe toda la corriente. Y cuanto '
      'mayor se hace b, más se acerca a ⊕ b al valor a; una resistencia '
      'infinitamente grande, una interrupción, no aporta nada. «Infinito» es '
      'por tanto el elemento neutro de la suma paralela — igual que el cero es '
      'el elemento neutro de la suma ordinaria.',
    ),
    _H('Media armónica y dualidad'),
    _P(
      'La suma paralela está estrechamente relacionada con la media armónica: '
      'la media armónica de dos números es 2·(a ⊕ b), y a ⊕ b es '
      'inversamente la mitad de ella. De las tres medias clásicas, la armónica '
      'siempre está más abajo — por debajo de la geométrica y la aritmética.',
    ),
    _P(
      'Visto en mayor profundidad, ⊕ es la imagen especular de la suma '
      'ordinaria bajo la aplicación recíproca x → 1/x: sumar normalmente en el '
      'espacio de recíprocos equivale a sumar en paralelo aquí, y viceversa. '
      'La conexión en serie y en paralelo son duales entre sí en este sentido '
      '— la misma relación que entre muelles en cadena y en paralelo.',
    ),
    _H('En esta calculadora'),
    _P(
      'La tecla ⊕ se encuentra entre los glifos de operadores del Set 2, junto '
      'a x^□, √ y log. Se introduce a ⊕ b como un cálculo ordinario: primero a, '
      'luego ⊕, luego b, luego =. A diferencia de la raíz y el logaritmo, ⊕ '
      'calcula de forma exacta — funciona en la vía de fracciones con detección '
      'de período y por tanto no muestra «≈».',
    ),
    _Pre(
      'Entrada         Resultado   (decimal)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, período 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      'El último ejemplo muestra el encanto duodecimal: «10» ⊕ «20» — es '
      'decir, doce en paralelo con veinticuatro ohmios — da exactamente 8. '
      'Y 2 ⊕ 3 es periódico en base doce (1.2497… con barra sobre 2497), '
      'pero aun así exacto; en base diez el mismo resultado sería simplemente '
      '1,2.',
    ),
    _H('Cuando la suma se hace cero'),
    _P(
      'Hay un caso en que ⊕ falla: si a + b = 0, por ejemplo 5 ⊕ (−5), '
      'hay un cero en el denominador y la calculadora notifica una división '
      'por cero. Tras el error la expresión se puede editar directamente '
      '— navega dentro de ella con las teclas de flecha y corrige el valor; '
      'AC reinicia todo.',
    ),
  ]),
  ManualChapter('Trigonometría', [
    _H('Ángulos y sus medidas'),
    _P(
      'La trigonometría es el estudio de las relaciones entre ángulos y '
      'longitudes. Un ángulo describe una rotación — cuánto hay que girar un '
      'rayo alrededor de su extremo. Se mide en tres unidades habituales: en '
      'grados (un círculo completo es 360°), en radianes (un círculo completo '
      'es 2π) y en gradianes o gonios (un círculo completo es 400). La unidad '
      'que se elija no cambia el ángulo en sí — solo el número que lo describe. '
      'La calculadora cambia entre ellas con la tecla DRG.',
    ),
    _H('Seno, coseno, tangente en el triángulo'),
    _P(
      'En un triángulo rectángulo cada ángulo agudo θ tiene un significado '
      'fijo. El lado más largo, opuesto al ángulo recto, es la hipotenusa. '
      'El lado opuesto a θ es el cateto opuesto, el que está junto a él es '
      'el cateto adyacente.',
    ),
    _P(
      'A partir de estos tres lados se forman tres razones que son siempre '
      'las mismas para un ángulo dado — independientemente del tamaño del '
      'triángulo: seno = opuesto/hipotenusa, coseno = adyacente/hipotenusa, '
      'tangente = opuesto/adyacente = sin/cos. La cotangente es el recíproco '
      'de la tangente. La regla mnemotécnica SOH-CAH-TOA resume las tres '
      'primeras.',
    ),
    RightTriangleFigure(
      adjacent: 'Adyacente',
      opposite: 'Opuesto',
      hypotenuse: 'Hipotenusa',
      sinRatio: 'sin θ = Op / Hip',
      cosRatio: 'cos θ = Ad / Hip',
      tanRatio: 'tan θ = Op / Ad',
    ),
    _H('El círculo unitario'),
    _P(
      'Los triángulos solo cubren ángulos entre 0° y 90°. El círculo unitario '
      '— un círculo de radio 1 centrado en el origen — extiende la vista a '
      'todos los ángulos. A cada ángulo θ le corresponde un punto en el '
      'círculo: partiendo del punto (1, 0) se gira en sentido antihorario un '
      'ángulo θ. Entonces el coseno es la coordenada x de ese punto y el seno '
      'es su coordenada y.',
    ),
    _P(
      'De esta forma los ángulos mayores de 90° y los ángulos negativos también '
      'tienen un lugar natural. A 180° el punto está en (−1, 0): '
      'cos 180° = −1, sin 180° = 0. A 270° en (0, −1). La tangente sigue '
      'siendo la razón sin/cos y coincide con la definición del triángulo.',
    ),
    UnitCircleFigure(),
    _H('Pitágoras en el círculo'),
    _P(
      'Como el círculo unitario tiene radio 1, todo punto sobre él satisface '
      'x² + y² = 1. En notación trigonométrica: cos²θ + sin²θ = 1. Esta no es '
      'una fórmula nueva, sino el teorema de Pitágoras en el círculo unitario. '
      'De ella se deduce inmediatamente sin²θ = 1 − cos²θ — la base de muchas '
      'transformaciones.',
    ),
    _H('Ondas y períodos'),
    _P(
      'Tras una vuelta completa se regresa al punto de partida: seno y coseno '
      'se repiten con un período de 360° (o 2π). Si se representa sin θ sobre '
      'el ángulo, aparece la familiar onda sinusoidal, que oscila entre −1 y '
      '+1; el coseno es la misma onda, solo desplazada 90°. Estas ondas '
      'describen el sonido, la luz y la corriente alterna — toda oscilación.',
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
    _H('Las funciones inversas'),
    _P(
      'A veces se conoce la razón y se busca el ángulo. Para eso existen las '
      'funciones inversas sin⁻¹, cos⁻¹, tan⁻¹ (las funciones arco): de '
      'sin θ = 0,5 se obtiene sin⁻¹(0,5) = 30°. Como seno y coseno son '
      'periódicos, a cada razón le corresponden infinitos ángulos; las '
      'funciones arco devuelven por tanto solo un rango distinguido — sin⁻¹ '
      'y tan⁻¹ de −90° a +90°, cos⁻¹ de 0° a 180°.',
    ),
    _H('En esta calculadora'),
    _P(
      'Las cuatro funciones sin, cos, tan y cot están en el teclado principal '
      'y abren un paréntesis en cuanto se pulsan (sin( con el cursor dentro). '
      'Un segundo toque en la misma tecla cambia a la función inversa — un '
      'punto dorado indica que el siguiente toque invertirá. La tecla DRG '
      'cambia el modo de ángulo (DEG → RAD → GRAD), mostrado en la parte '
      'superior derecha; en el perfil «Simple» esto se hace a través de '
      'los Ajustes.',
    ),
    _P(
      'Hay una trampa duodecimal que hay que tener en cuenta: el ángulo se '
      'introduce en el sistema numérico activo. En modo duodecimal «90» no '
      'son noventa grados sino 9·12 = 108. Para calcular sin(90°) se escribe '
      '«76» (ya que 7·12+6 = 90). Aquí están los valores habituales:',
    ),
    _Pre(
      'Grados (decimal)    Entrada (duodecimal)\n'
      '30°                 26\n'
      '45°                 39\n'
      '60°                 50\n'
      '90°                 76\n'
      '180°                130\n'
      '360°                260',
    ),
    _P('Y algunos ejemplos calculados en modo DEG:'),
    _Pre(
      'Entrada        significa     Resultado\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       ángulo para 1 ≈76  (= 90°)',
    ),
    _P(
      'Todos los resultados trigonométricos llevan un «≈», porque sin, cos y '
      'tan son en general irracionales — incluso cuando el valor es tan limpio '
      'como sin(90°) = 1. tan(90°) no está definida; la calculadora muestra '
      'allí un número muy grande, porque cos(90°) computacionalmente no es '
      'exactamente cero.',
    ),
    _H('Ángulos en base doce'),
    _P(
      'Incluso los valores de círculo completo familiares tienen un aspecto '
      'extraño en duodecimal: 360° se escribe «260» (2·144 + 6·12), 400 '
      'gonios «294». Solo el radián escapa a la cuestión — 2π es una '
      'constante, independiente del sistema numérico; quien trabaja en RAD '
      'evita la trampa por completo.',
    ),
    _P(
      'Que el círculo completo tenga 360 partes encaja bien con el doce: '
      '360 tiene muchísimos divisores (dos docenas de ellos), por lo que el '
      'círculo se divide limpiamente en mitades, tercios, cuartos, sextos y '
      'más — y 12·30 = 360, una doceava parte del círculo es exactamente 30°. '
      'Como siempre: la trigonometría en sí es independiente del sistema '
      'numérico. sin(30°) es ½, tanto si se escribe el ángulo «30» en decimal '
      'como «26» en duodecimal. Solo cambian los dígitos de la entrada.',
    ),
  ]),
  ManualChapter('Almacenar y recuperar', [
    _P(
      'Una calculadora solo se vuelve verdaderamente rápida cuando no tienes '
      'que volver a escribir números constantemente. Cuatro herramientas te '
      'ahorran ese trabajo: el último resultado (Ans), una memoria con nombre '
      '(STO/RCL), un acumulador (M+/M−) y la cinta de historial de la sesión. '
      'No se solapan, sino que cada una cubre una situación diferente.',
    ),
    _H('El último resultado: Ans'),
    _P(
      'Tras cada cálculo la calculadora memoriza el resultado con el nombre Ans. '
      'Si sigues directamente con un operador — por ejemplo «× 2 =» justo '
      'después de un resultado — Ans se usa automáticamente como primer '
      'operando, sin tocar la tecla en absoluto. Este es el movimiento más '
      'habitual al calcular en cadena: el resultado de un paso se convierte '
      'silenciosamente en el inicio del siguiente.',
    ),
    _P(
      'Si necesitas el último resultado no al principio sino en medio de una '
      'nueva fórmula, lo insertas explícitamente con Ans. Importante: Ans '
      'guarda siempre el resultado completo — incluyendo una fracción periódica, '
      'no solo los dígitos visibles.',
    ),
    _H('La memoria: STO, RCL, MC'),
    _P(
      'Ans tiene una debilidad: el siguiente «=» lo sobreescribe. Para mantener '
      'un valor a lo largo de varios cálculos independientes, guárdalo con STO '
      'en la memoria. Una pequeña «M» en la parte superior de la pantalla '
      'indica que hay algo guardado. RCL (recall) inserta el valor almacenado '
      'en la entrada en la posición del cursor — tantas veces como se quiera. '
      'MC (memory clear) vacía la memoria, y la «M» se apaga.',
    ),
    _P(
      'Un escenario típico: calculas el radio de un círculo y luego lo '
      'necesitas tanto para el área como para la circunferencia. El radio se '
      'guarda una vez con STO; ambas fórmulas lo recuperan independientemente '
      'con RCL, sin necesidad de volver a escribirlo.',
    ),
    _H('El acumulador: M+ y M−'),
    _P(
      'A veces no quieres guardar un solo valor sino ir construyendo una suma '
      'acumulada — por ejemplo al sumar muchos elementos. Para eso están M+ y '
      'M−, accesibles con una pulsación larga sobre STO. M+ suma el último '
      'resultado al valor almacenado, M− lo resta. La memoria crece o decrece '
      'con cada operación, sin que tengas que ver ni anotar el subtotal. RCL '
      'muestra el total al final, MC pone el acumulador a cero.',
    ),
    MemoryFlowFigure(result: 'Resultado', store: 'Memoria', input: 'Entrada'),
    _P(
      'El esquema resume los caminos: STO lleva el resultado a la memoria, RCL '
      'lo trae de allí a la entrada. Ans toma el atajo directamente del '
      'resultado a la entrada y evita la memoria (línea discontinua). '
      'M+/M− devuelve el resultado en un bucle a la memoria y lo suma allí.',
    ),
    _H('¿Ans o memoria — cuándo cuál?'),
    _P(
      'La elección sigue una regla sencilla. Usa Ans cuando el resultado se '
      'necesita inmediatamente en el siguiente paso — rápido y sin preparación. '
      'Usa la memoria cuando un valor deba estar disponible en varios cálculos '
      'separados o estar protegido del siguiente «=». M+ y M− están un nivel '
      'por encima: no están pensados para recuperar un solo valor, sino para '
      'acumular muchos resultados individuales en un total.',
    ),
    _H('Almacenado con exactitud — sin error de redondeo'),
    _P(
      'La mayoría de las calculadoras trabajan internamente con números de coma '
      'flotante de precisión fija. Lo que muestran ya está redondeado — y '
      'exactamente ese valor redondeado llega a la memoria. Si sigues '
      'calculando, arrastras el error contigo; tras varios pasos, un resultado '
      'que debería ser exactamente 1 muestra «0,9999…».',
    ),
    _P(
      'Esta calculadora en cambio guarda los resultados racionales como una '
      'fracción verdadera de enteros arbitrariamente grandes — sin redondeo. '
      'Y exactamente esa fracción va a la memoria: STO, RCL, Ans y el '
      'acumulador conservan numerador y denominador completos, no solo los '
      'dígitos visibles. Un ejemplo: 1 ÷ 7 es periódico en duodecimal '
      '(bloque 186A35). Guarda el resultado y multiplícalo luego por 7, y '
      'obtienes exactamente 1 — porque la calculadora nunca ha guardado otra '
      'cosa que 1/7. Un dispositivo que solo guarda los dígitos mostrados '
      'llegaría a «0,BBBB…».',
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (período, con barra)\n'
      '… STO          →  aparece «M»; almacenado: exactamente 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (no 0.BBBB…)',
    ),
    _P(
      'La calculadora es honesta en su límite: los resultados irracionales '
      '— raíces, logaritmos, trigonometría — no pueden guardarse como fracción. '
      'Llevan un «≈» y se almacenan como aproximación. La regla es fácil de '
      'leer: si un «≈» precede al valor, lo almacenado es una aproximación; '
      'si no está, es exacto.',
    ),
    _H('La cinta de historial'),
    _P(
      'Para usar de nuevo un cálculo anterior, desliza hacia abajo sobre la '
      'pantalla. Eso abre la cinta de historial de la sesión actual — el '
      'cálculo más reciente en la parte superior, hasta treinta entradas. '
      'Incluso AC no la borra; se conserva durante toda la sesión. Un toque '
      'en una entrada devuelve su valor de resultado a la entrada, igual que '
      'Ans — solo que para cualquier paso anterior.',
    ),
    HistoryBandFigure(swipe: 'deslizar', newCap: 'nuevo', tap: 'tocar'),
    _P(
      'La cinta de historial no es un almacén permanente sino una mirada atrás: '
      'mantiene el hilo de una sesión y te permite recuperar un valor que '
      'calculaste pero no guardaste expresamente.',
    ),
    _H('En esta calculadora'),
    _P(
      'STO, RCL, MC y Ans están en el panel de extensión: ábrelo con la tecla '
      '«…» y luego toca la función deseada. M+ y M− se ocultan tras una '
      'pulsación larga sobre STO — la pequeña esquina en la parte inferior '
      'derecha de la tecla lo indica; en el popup se elige M+ o M−. En el '
      'perfil «Simple» no hay panel de extensión; las funciones de memoria '
      'no están disponibles allí.',
    ),
    _P('Tres ejemplos calculados (en modo duodecimal):'),
    _Pre(
      'Guardar e insertar después\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  aparece «M»\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Continuar directamente con Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 automáticamente)',
    ),
    _Pre(
      'Acumular elementos con M+\n'
      '  … MC                        limpiar memoria\n'
      '  5 =   … STO(mant.) M+   →  memoria 5\n'
      '  7 =   … STO(mant.) M+   →  memoria 10\n'
      '  3 =   … STO(mant.) M+   →  memoria 13\n'
      '  … RCL                   →  13',
    ),
    _P(
      'Para verificar en decimal: 5 + 7 + 3 = 15, y 15 es duodecimal «13» '
      '(1·12 + 3). Las cuatro herramientas — Ans, memoria, acumulador y cinta '
      'de historial — trabajan sobre el mismo valor exacto; quien las conoce '
      'apenas necesita escribir un número a mano ni mantener un subtotal en '
      'la cabeza.',
    ),
  ]),
  ManualChapter('Funciones hiperbólicas', [
    _P(
      'En la escuela se aprenden el seno y el coseno como coordenadas de un '
      'punto en el círculo unitario. Menos conocidos, pero igualmente '
      'fundamentales, son sus contrapartidas hiperbólicas sinh y cosh. Surgen '
      'cuando se reemplaza el círculo por una hipérbola — y la clave para '
      'ellas es la función exponencial eˣ.',
    ),
    _H('Las mitades par e impar de eˣ'),
    _P(
      'Cualquier función puede dividirse en una parte par (simétrica respecto '
      'al eje y) y una parte impar (simétrica por punto respecto al origen). '
      'Para eˣ se pueden escribir directamente ambas partes: cosh es la par, '
      'sinh la impar. Si se vuelven a sumar, eˣ regresa — pues '
      'eˣ = cosh x + sinh x, y e⁻ˣ = cosh x − sinh x. Esta descomposición no '
      'es arbitraria, sino la única posible.',
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      'tanh es el cociente, coth su recíproco (y por tanto definido solo para '
      'x ≠ 0). A la derecha están las inversas, a las que volveremos en breve.',
    ),
    _H('La hipérbola unitaria'),
    _P(
      'En el círculo unitario todo punto (cos t, sin t) satisface la ecuación '
      'x² + y² = 1. Para las funciones hiperbólicas rige una identidad casi '
      'idéntica pero crucialmente diferente. Sustituyendo las definiciones y '
      'calculando la diferencia de cuadrados, los términos mixtos se cancelan:',
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      'Así, el punto (cosh t, sinh t) siempre se encuentra en la curva '
      'x² − y² = 1, la hipérbola unitaria. Como cosh t nunca es menor que 1, '
      'el punto siempre permanece en la rama derecha. La identidad '
      'cosh²t − sinh²t = 1 desempeña en el mundo hiperbólico el mismo papel '
      'que cos²t + sin²t = 1 en el circular — solo que el más se ha '
      'convertido en menos.',
    ),
    UnitHyperbolaFigure(area: 'Área = t/2'),
    _H('El parámetro: un área, no un ángulo'),
    _P(
      'Aquí radica la diferencia más profunda con la trigonometría. En el '
      'círculo el parámetro t es el ángulo en radianes — y al mismo tiempo la '
      'longitud del arco y el doble del área del sector; estos tres '
      'significados coinciden allí por casualidad. En la hipérbola no existe '
      'tal ángulo. Lo que queda es el área: t es el doble del área del sector '
      'hiperbólico entre el origen, el vértice (1, 0) y el punto '
      '(cosh t, sinh t) — exactamente el área sombreada en la figura anterior.',
    ),
    _P(
      'De ahí el nombre de las inversas. Se denominan funciones área — arsinh, '
      'arcosh, artanh — del latín «area». El extendido «arcsinh» de algunos '
      'dispositivos es estrictamente incorrecto: traslada el prefijo de arco '
      '(«arc») a una función en la que no hay ningún arco. arsinh(y) es aquel '
      'valor del parámetro t con sinh t = y — es decir, un área, no un arco.',
    ),
    _H('La forma de las cuatro curvas'),
    _P(
      'cosh es una cubeta abierta hacia arriba, simétricamente axial, con su '
      'punto más bajo en (0, 1), pues cosh 0 = 1; su valor nunca es menor '
      'que 1. sinh es simétrica por punto, pasa por el origen y crece sin '
      'límite en ambas direcciones. Para x grande ambas se aproximan a la '
      'curva eˣ/2.',
    ),
    _P(
      'tanh es una curva de saturación en forma de S: estrictamente creciente, '
      'que pasa por el origen y permanece estrictamente entre −1 y +1 — estos '
      'límites se aproximan pero nunca se alcanzan. coth, finalmente, se '
      'comporta como el recíproco de tanh, pero como sinh 0 = 0 tiene un polo '
      'en x = 0 y permanece fuera de [−1, 1].',
    ),
    HyperbolicCurvesFigure(),
    _H('Parentesco con la trigonometría'),
    _P(
      'Ambas familias están tejidas del mismo material: la función exponencial. '
      "La fórmula de Euler escribe las funciones circulares de manera análoga "
      '— cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). El patrón es '
      'el mismo; solo que para las funciones circulares la exponencial corre '
      'sobre el eje imaginario (argumento i·t), para las hiperbólicas sobre '
      'el real (argumento x). Si los números complejos aún son desconocidos, '
      'puedes saltarte este pensamiento — lo único importante es: en su núcleo '
      'es la misma función.',
    ),
    _P(
      'Geométricamente es la misma construcción — un punto en una curva, '
      'parametrizado por el doble del área del sector —, solo que una vez en '
      'el círculo, otra en la hipérbola. De esto se deduce el signo invertido: '
      'cos² + sin² = 1 frente a cosh² − sinh² = 1. Si se sustituye un '
      'argumento imaginario, las familias pasan directamente de una a otra: '
      'cos(i·x) = cosh x y sin(i·x) = i·sinh x. Las funciones hiperbólicas '
      'son por tanto «las funciones trigonométricas con argumento imaginario».',
    ),
    _P(
      'Los teoremas de adición también son paralelos: '
      'sinh(a+b) = sinh a·cosh b + cosh a·sinh b, igual que para el seno. '
      'Para el coseno, en cambio, se invierte un signo — cos(a+b) tiene un '
      'menos, cosh(a+b) un más. Esta es la regla de Osborn: toda identidad '
      'trigonométrica se vuelve hiperbólica sustituyendo sin→sinh, cos→cosh '
      'e invirtiendo el signo donde aparezca un producto de dos factores '
      'seno. Un signo incorrecto casi siempre se encuentra exactamente en '
      'ese punto.',
    ),
    _H('Aplicaciones en el mundo'),
    _P(
      'La más conocida es la catenaria. Una cuerda que cuelga libremente entre '
      'dos puntos no forma una parábola — incluso Galileo cayó en ese error '
      '—, sino la curva y = a·cosh(x/a). Con una flecha pequeña las dos '
      'parecen similares; con una grande la diferencia se hace clara: la '
      'catenaria crece más rápido que cualquier parábola. A la inversa — como '
      'arco de cosh abierto hacia abajo — describe la forma ideal de una '
      'bóveda portante que transmite su carga puramente por compresión.',
    ),
    CatenaryFigure(catenary: 'Catenaria', parabola: 'Parábola'),
    _P(
      'La caída con resistencia del aire también corresponde aquí: si la fuerza '
      'de frenado crece con el cuadrado de la velocidad, la velocidad sigue '
      'una curva tanh y se aproxima suavemente a la velocidad terminal, sin '
      'superarla jamás — la saturación de tanh es aquí la física misma.',
    ),
    _P(
      'En la relatividad, por último, las velocidades cercanas a la velocidad '
      'de la luz no se suman simplemente. Si se introduce la «rapidez» φ '
      'mediante v = c·tanh φ, la complicada fórmula de adición se vuelve '
      'simple de nuevo: las rapideces se suman ordinariamente (φ = φ₁ + φ₂), '
      'precisamente porque tanh tiene su teorema de adición. Lo que el radián '
      'es en la geometría plana, la rapidez lo es en la geometría del '
      'espaciotiempo.',
    ),
    _H('En esta calculadora'),
    _P(
      'Las cuatro funciones están en el Set 8, el panel de extensión: ábrelo '
      'con la tecla «…» y luego toca sinh, cosh, tanh o coth. Cada una abre '
      'un paréntesis inmediatamente (sinh( con el cursor dentro); si falta '
      'el paréntesis de cierre, la calculadora lo añade al pulsar «=». Un '
      'segundo toque en la misma tecla cambia a la función área '
      '(sinh ↔ arsinh y así sucesivamente) — un punto dorado indica que el '
      'siguiente toque invertirá.',
    ),
    _P(
      'La diferencia más importante respecto a la trigonometría: el argumento '
      'es un número puro, no un ángulo. El modo de ángulo (DEG/RAD/GRD) no '
      'tiene ningún efecto sobre las funciones hiperbólicas — sin conversión '
      'de grados, sin trampa duodecimal de ángulos como con sin y cos. '
      'sinh(2) significa lo mismo en cualquier modo. Como estas funciones son '
      'trascendentes, sus resultados llevan siempre un «≈».',
    ),
    _P('Ejemplos calculados (todos los resultados ≈, duodecimal abreviado):'),
    _Pre(
      'Entrada       decimal     duodecimal\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1,1752      1.2128B7B6…\n'
      'cosh(1)       1,5431      1.66253A10…\n'
      'tanh(1)       0,7616      0.91804BB6…\n'
      'arsinh(1)     0,8814      0.A6B01B51…\n'
      'arcosh(2)     1,3170      1.397853260…',
    ),
    _P(
      'La identidad básica puede verificarse directamente: cosh(2)² − sinh(2)² '
      'da ≈1. Matemáticamente es exactamente 1; el pequeño resto de coma '
      'flotante está por debajo del umbral de visualización, y la calculadora '
      'lo redondea al 1 limpio.',
    ),
    _P(
      'Fuera de su dominio las funciones notifican un error — entonces hay '
      'que reiniciar con AC:',
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = dec. 0,5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      'arsinh está definida para cualquier número; arcosh requiere x ≥ 1; '
      'artanh requiere |x| < 1; arcoth vive exactamente fuera, con |x| > 1. '
      'Quien lo tiene presente evita los mensajes de error desde el principio.',
    ),
  ]),
  ManualChapter('Set 9 y 10', [
    _P(
      'Los dos últimos paneles del campo de extensión agrupan lo que una '
      'calculadora científica necesita además: el conteo (factorial y '
      'combinatoria), tres operadores útiles (valor absoluto, recíproco, '
      'resto) y la notación científica. Todo se encuentra detrás de la '
      'tecla «…».',
    ),
    _H('Factorial: la puerta al conteo'),
    _P(
      'El factorial de un número entero n, escrito n!, es el producto de todos '
      'los números de 1 a n: n! = 1·2·3·…·n. Como caso especial, 0! = 1. Los '
      'primeros valores son inofensivos — 3! = 6, 4! = 20, 5! = A0 (= 120 '
      'decimal) —, pero luego la sucesión explota: 10! (doce factorial) es ya '
      '114500000 en base doce, casi medio millardo.',
    ),
    _P(
      '¿Para qué? n! cuenta ordenaciones. Cinco invitados pueden sentarse en '
      'fila de 5! = A0 maneras: cinco opciones para el primer asiento, luego '
      'cuatro para el segundo, tres para el tercero, y así sucesivamente. El '
      'factorial es el bloque de construcción para todo lo demás. En la '
      'calculadora n! es exacto — el resultado no lleva «≈».',
    ),
    _H('Permutaciones: selección con orden'),
    _P(
      'A menudo no se ordena todo, sino que se eligen r de n cosas — y el '
      'orden importa. Una carrera con ocho pilotos: ¿cuántos podios (1.º, 2.º, '
      '3.º) son posibles? Ocho para el oro, siete para la plata, seis para el '
      'bronce: 8·7·6 = 240 (= 336 decimal). En general esto es nPr '
      '(n permuta r) = n!/(n−r)!. Se divide entre (n−r)! porque los factores '
      'inferiores desaparecen.',
    ),
    _H('Combinaciones: selección sin orden'),
    _P(
      'A veces el orden es irrelevante — en una mano de cartas, en la lotería, '
      'en un apretón de manos. El número de selecciones no ordenadas se llama '
      'nCr («n elige r») = n!/(r!·(n−r)!). La relación es simple: cada '
      'selección no ordenada de r cosas puede ordenarse de r! maneras, así '
      'que nCr = nPr/r!. Tres de seis para un comité: 6 nCr 3 = 18 (= 20 '
      'decimal). Los apretones de manos en un grupo de n personas son n nCr 2 '
      '— con cinco personas A (= 10), con una docena ya 56 (= 66 decimal).',
    ),
    _P(
      'Una sutileza de estos dos: nCr y nPr se construyen a partir de '
      'factoriales en coma flotante y por tanto siempre llevan un «≈», incluso '
      'cuando el resultado — como casi siempre — es un número entero. En la '
      'lotería (seis de 49), por ejemplo, 49 nCr 6 da ≈48245A0 — unos catorce '
      'millones de posibilidades para un boleto.',
    ),
    _H("El triángulo de Pascal"),
    _P(
      'Si se ordenan los valores nCr fila por fila aparece un patrón: en la '
      'fila n están sucesivamente n nCr 0, n nCr 1, …, n nCr n. Cada número '
      'es la suma de los dos que están encima — así crece el triángulo '
      'completamente sin factoriales. Los bordes son todos unos, y es '
      'simétrico (n nCr r = n nCr (n−r)).',
    ),
    PascalTriangleFigure(title: 'Triángulo de Pascal'),
    _P(
      'En base doce el triángulo tiene casi el mismo aspecto que de costumbre '
      '— solo en la fila 5 aparece una «A» en lugar de diez. Esos mismos '
      'números son, por cierto, los coeficientes de (a+b)ⁿ: de la fila 4 '
      '(1, 4, 6, 4, 1) se lee directamente '
      '(a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴. Esto enlaza la combinatoria '
      'y el álgebra en una sola imagen.',
    ),
    _H('Valor absoluto y recíproco'),
    _P(
      'El valor absoluto |x| es la distancia de un número al cero — el signo '
      'se descarta, |−7| = 7. Una sutileza de entrada: los operadores postfijos '
      '(|x|, n!, 1/x) se ligan más fuertemente que el menos inicial. «−5» '
      'seguido de |x| da por tanto −(|5|) = −5; si quieres el valor absoluto '
      'del número negativo, usa paréntesis: (−5) y luego |x| da 5.',
    ),
    _P(
      'El recíproco 1/x es el compañero multiplicativo: x · (1/x) = 1, y la '
      'calculadora lo guarda exactamente como fracción. Duodecimal lo muestra '
      'especialmente bien — 1/4 es un limpio 0.3 (tres dozavos son un cuarto) '
      'y 1/3 es 0.4, donde la base diez ya entra en el periódico 0,333…. '
      'El recíproco de cero no está definido.',
    ),
    _H('Módulo: restos y ciclos'),
    _P(
      'Siete dividido entre tres es dos, resto uno — y exactamente ese resto '
      'es lo que da «7 mod 3 = 1». La imagen más intuitiva es el reloj: '
      'tras doce la cuenta comienza de nuevo, «las 14:00» son «las 2 de la '
      'tarde», porque 14 mod 12 = 2. El reloj cuenta en base doce — no es '
      'coincidencia.',
    ),
    ModuloClockFigure(
      title: 'Módulo — aritmética del reloj',
      wrap: 'vuelta al inicio',
      note: '(= 17 dec., 17 mod 12 = 5)',
    ),
    _P(
      'El módulo es la herramienta natural para la divisibilidad: a mod b = 0 '
      'significa exactamente que b divide a. Duodecimal da a esto una nitidez '
      'especial, porque doce tiene un número inusualmente alto de divisores '
      '— 1, 2, 3, 4, 6 y 12, frente a solo 1, 2, 5, 10 para el diez. La '
      'divisibilidad por dos, tres, cuatro o seis a menudo se puede leer '
      'directamente de los últimos dígitos en duodecimal.',
    ),
    _H('Notación científica en potencias de doce'),
    _P(
      'Los números muy grandes o pequeños se escriben de forma compacta como '
      'mantisa por potencia de la base. En decimal «3 EXP 8» significa el '
      'valor 3 × 10⁸. Esta calculadora lleva el principio de forma consistente '
      'a la base doce: en modo duodecimal «a EXP b» no significa a × 10ᵇ sino '
      'a × 12ᵇ. El exponente cuenta potencias de doce.',
    ),
    DozenalPowersScaleFigure(
      title: 'Potencias de doce — 1 EXP n',
      dozLabel: 'Dod.',
      decLabel: 'Dec.',
    ),
    _P(
      'Estas potencias incluso tienen sus propios nombres: 12¹ = una docena, '
      '12² = 144 = un grueso, 12³ = 1728 = un gran grueso. Escritas en '
      'duodecimal son exactamente las posiciones redondas 10, 100, 1000. Así, '
      '«1 EXP 2» da el valor 100 (= 144 decimal) y «1 EXP 3» el valor 1000 '
      '(= 1728). Para exponentes enteros calcula la vía exacta; en modo '
      'decimal EXP cuenta de nuevo en potencias de diez.',
    ),
    _H('Modo de ángulo y cerrar'),
    _P(
      'El Set 10 también contiene DRG y Close. DRG cicla el modo de ángulo '
      '(DEG → RAD → GRD) para las funciones trigonométricas — tratado en '
      'detalle en el capítulo de trigonometría; en el perfil «Simple» se '
      'configura a través de los Ajustes. Close pliega el panel de extensión '
      'de nuevo, la contraparte de la tecla «…». El antiguo interruptor '
      'Doz/Dez ha pasado del teclado a los Ajustes.',
    ),
    _H('En esta calculadora'),
    _P(
      'Todas estas teclas se alcanzan a través del panel de extensión «…» '
      '(en el perfil «Simple» el Set 9 y 10 están ocultos). n!, |x| y 1/x '
      'actúan en postfijo — primero el número, luego la tecla; mod, nCr y nPr '
      'son binarios (a mod b). Una pulsación larga sobre n! abre el popup '
      'con nCr y nPr; la pequeña esquina en la parte inferior derecha de la '
      'tecla lo señala.',
    ),
    _P('Ejemplos calculados (en modo duodecimal):'),
    _Pre(
      'Entrada       significa              Resultado\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       recíproco de 4        0.3     (exacto)\n'
      '7 mod 3       resto de 7 ÷ 3        1\n'
      '5 nCr 2       combinaciones         ≈A      (= 10)\n'
      '8 nPr 3       permutaciones         ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      'Son exactos n!, |x|, 1/x y mod (sin «≈»); solo nCr y nPr llevan el '
      'signo de aproximación. Fuera del rango válido las funciones notifican '
      'un error — entonces reinicia con AC:',
    ),
    _Pre(
      '0 → 1/x       recíproco de cero     DIV BY ZERO\n'
      '7 mod 0       resto dividido cero   DOMAIN ERROR\n'
      '(−4)!         factorial negativo    DOMAIN ERROR',
    ),
    _P(
      'Con esto la caja de herramientas está completa: desde la simple pulsación '
      'de dígitos de los conceptos básicos hasta la combinatoria, el módulo y '
      'la notación duodecimal de orden de magnitud, la calculadora calcula con '
      'exactitud donde puede, y honestamente con «≈» donde solo es posible '
      'una aproximación.',
    ),
  ]),
];
