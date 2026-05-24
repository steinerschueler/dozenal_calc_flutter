part of 'info_content.dart';

/// Spanish chapter content. Uses the locale-specific dozenal
/// pronunciation convention:
///   * Base unit "docena" (feminine, established Spanish word for
///     "dozen"). Plural: "docenas".
///   * A = "diez" (10), B = "once" (11) — same values as Spanish
///     decimal counting.
///   * Higher magnitudes 12²–12⁷ as Spanish-ized -ero nouns
///     (masculine, plural with -os): "cuadero, cubero, tesero, pentero,
///     hexero, heptero". Roots preserved across languages, endings
///     adapted to Spanish gender/morphology — parallels the Italian
///     -era adaptation in [_chapterIt].
///   * Multiplier 1 implicit (docena not "una docena"; cuadero not
///     "un cuadero").
///   * Pure juxtaposition between magnitudes (mirrors Spanish decimal
///     "ciento veintiuno" = 121, no "y" between cien and veinte).
///   * **"y" connector at unit position** when the immediately
///     preceding docena multiplier is 2–B (mirrors Spanish "treinta y
///     uno", "cincuenta y dos"). No "y" when docena multiplier is 1
///     (parallel to "once, doce, trece" being irregular single words).
///   * Western digits throughout for math content; Spanish for prose.
List<Widget> _chapterEs(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H("Los dígitos"),
        const _P(
          "Esta calculadora usa sus propios símbolos para los doce "
          "dígitos. Cuatro dígitos ancla son puntas de flecha "
          "estilizadas que apuntan en las cuatro direcciones "
          "cardinales — 1 (arriba), 4 (izquierda), 7 (derecha), A "
          "(abajo). Dividen el círculo numérico en cuatro grupos de "
          "tres, como las horas 12, 3, 6 y 9 en una esfera de reloj.",
        ),
        const _P(
          "Todos los dígitos intermedios están construidos a partir "
          "de semicírculos y círculos completos. El cero es un "
          "círculo simple, B (= once) un círculo lleno.",
        ),
        const _DigitLegend(),
        const _H("Uso básico"),
        const _P(
          "Toca números y operadores como en una calculadora de "
          "bolsillo ordinaria. Pulsa la tecla ancha = en la parte "
          "inferior para calcular el resultado. AC (en rojo de "
          "advertencia) borra toda la entrada y el resultado ; Del "
          "elimina el carácter a la izquierda del cursor.",
        ),
        const _H("Ayuda y teoría"),
        const _P(
          "A la izquierda y a la derecha de la tecla =, dos botones "
          "redondos: (i) abre estos doce capítulos teóricos, (?) "
          "reproduce el recorrido rápido con los marcadores rojos. El "
          "recorrido se abre automáticamente en el primer lanzamiento.",
        ),
        const _H("Cursor y navegación"),
        const _P(
          "La barra roja en el campo de entrada es el cursor. Usa ◀ "
          "y ▶ para moverlo, insertando o eliminando caracteres en "
          "medio de una fórmula. Después de un cálculo, el cursor se "
          "mueve al campo de resultado — las flechas mueven entonces "
          "el cursor del resultado. Tan pronto comienzas una nueva "
          "entrada, el cursor vuelve al campo de entrada.",
        ),
        const _H("Continuar un cálculo"),
        const _P(
          "Después de un cálculo puedes continuar directamente con "
          "un operador. Toca + 5 = por ejemplo, y la calculadora usa "
          "automáticamente el último resultado como primer operando. "
          "Para empezar un cálculo completamente nuevo, pulsa primero "
          "AC.",
        ),
        const _H("Doble toque para funciones inversas"),
        const _P(
          "Un segundo toque en una tecla de función la convierte en "
          "su inversa: sin se convierte en sin⁻¹, cos en cos⁻¹, y así "
          "sucesivamente. La misma regla se aplica a las funciones "
          "hiperbólicas en el panel de extensión. Un pequeño punto "
          "dorado en la tecla indica que el siguiente toque "
          "invertirá.",
        ),
        const _H("Operadores especiales"),
        const _P(
          "x² eleva al cuadrado el número anterior. √ calcula la raíz "
          "cuadrada — si hay un número a su izquierda, ese número se "
          "usa como grado de la raíz: 3√27 da la raíz cúbica de 27. "
          "log calcula el logaritmo con la base del número anterior. "
          "⊕ calcula la suma paralela: a ⊕ b = (a·b)/(a+b), útil "
          "para resistencias en paralelo.",
        ),
        const _H("Panel de extensión"),
        const _P(
          "La tecla … en la parte inferior derecha abre el panel de "
          "extensión con más funciones: memoria, constantes (π, e, "
          "φ, √2), funciones hiperbólicas, operadores avanzados y "
          "ajustes. La misma tecla lo cierra, o un toque fuera del "
          "panel. En tabletas todos los conjuntos están visibles uno "
          "al lado del otro de todos modos — no hay superposición.",
        ),
        const _Pre(
          "  6 — Memoria:        STO   RCL   MC    Ans\n"
          "  7 — Constantes:     π     e     φ     √2\n"
          "  8 — Hiperbólicas:   sinh  cosh  tanh  coth\n"
          "  9 — Avanzados:      n!    |x|   1/x   mod\n"
          "  10 — Modos:         Doz   Dez   DRG   …",
        ),
        const _H("Memoria"),
        const _P(
          "STO almacena el resultado actual, RCL inserta el valor "
          "almacenado en la entrada, MC borra la memoria. Una pequeña "
          "M en la pantalla indica que algo está almacenado. Ans "
          "inserta el resultado del último cálculo — los valores "
          "racionales exactos se almacenan completos, la periodicidad "
          "se conserva.",
        ),
        const _H("Barra de período"),
        const _P(
          "Cuando el resultado es una fracción periódica, la "
          "calculadora marca los dígitos repetidos con una barra "
          "encima. Ejemplo: 1/5 da 0.2497 con barra sobre los cuatro "
          "dígitos. Para períodos de más de cinco dígitos, solo se "
          "muestran los primeros cinco, seguidos de …",
        ),
        const _H("Sistema numérico: Doz / Dez"),
        const _P(
          "En el panel de extensión, dos teclas Doz y Dez están una "
          "al lado de la otra. Exactamente una de ellas está siempre "
          "activa (con borde), y el sistema activo se muestra en la "
          "parte superior derecha de la pantalla. En modo Doz la "
          "calculadora calcula en base 12 (predeterminado) ; en modo "
          "Dez en base 10.",
        ),
        const _P(
          "Al cambiar, el número actualmente visible se convierte "
          "automáticamente al otro sistema. «10» en Doz se convierte "
          "en «12» en Dez. En modo Dez los símbolos de 10 y 11 se "
          "vuelven inactivos (grises), ya que no existen como dígitos "
          "únicos en base 10 — para Doz simplemente cambia de vuelta.",
        ),
        const _H("Modo de ángulo"),
        const _P(
          "DRG cicla el modo de ángulo para las funciones "
          "trigonométricas: DEG → RAD → GRAD → DEG. El modo actual se "
          "muestra en la parte superior derecha de la pantalla, "
          "justo encima del indicador Doz/Dez. Predeterminado: DEG.",
        ),
      ];
    case 1:
      return [
        const _H("El principio"),
        const _P(
          "En el sistema decimal cada posición tiene un valor diez "
          "veces mayor que la posición a su derecha: unidades, "
          "decenas, centenas. En el sistema duodecimal, la base no es "
          "diez sino doce. Los valores posicionales son potencias de "
          "12: unidades, docenas, cientos-cuarenta-y-cuatros. El "
          "número «100» aquí no significa diez veces diez sino doce "
          "veces doce — es decir, 144 en decimal.",
        ),
        const _P(
          "Esto requiere doce dígitos en lugar de diez. Se añaden dos "
          "nuevos para los valores diez y once, a los que esta "
          "calculadora da sus propios símbolos (A = diez, B = once). "
          "Ejemplo: 2B (duodecimal) = 2·12 + 11 = 35 (decimal).",
        ),
        const _H("¿Cómo se pronuncia duodecimal?"),
        const _P(
          "Las unidades 0–9 se quedan como las conoces: cero, uno, "
          "dos … nueve. Los nuevos glifos A y B se leen diez y once "
          "— la misma magnitud que las palabras familiares, sin nuevo "
          "vocabulario que aprender. El doce mismo — escrito como "
          "«10» — se lee docena. Para evitar confusión entre números "
          "decimales y duodecimales en este capítulo, un pequeño "
          "prefijo e marca la lectura decimal y una pequeña o la "
          "duodecimal: e144 = o100, ambos representan el mismo valor.",
        ),
        const _P(
          "El orden de las palabras sigue la lógica española: la "
          "magnitud mayor primero, las menores después. En el rango "
          "sub-cuadero (docenas + unidades), la estructura es directa: "
          "o11 se lee «docena uno», o23 «dos docenas y tres». Los "
          "multiplicadores 2 a B preceden a docena como palabra "
          "separada: dos docenas (o20 = e24), tres docenas, …, nueve "
          "docenas (o90 = e108). Con A o B en la posición de las "
          "docenas: diez docenas (oA0 = e120), once docenas "
          "(oB0 = e132). El multiplicador 1 es implícito: o10 se lee "
          "simplemente «docena», no «una docena».",
        ),
        const _P(
          "Una particularidad española se mantiene viva: en la "
          "posición de unidad, cuando el multiplicador de docena es "
          "de 2 a B, se escribe «y» entre la docena y la unidad — "
          "exactamente como «treinta y uno», «cincuenta y dos» en "
          "decimal. Así o21 se lee «dos docenas y uno», o32 «tres "
          "docenas y dos», pero o11 sigue siendo «docena uno» "
          "(porque allí el multiplicador es 1 implícito, no de 2 a B).",
        ),
        const _Pre(
          "Decimal    Dozenal    Pronunciación\n"
          "       10        A    diez\n"
          "       11        B    once\n"
          "       12       10    docena\n"
          "       13       11    docena uno\n"
          "       14       12    docena dos\n"
          "       20       18    docena ocho\n"
          "       22       1A    docena diez\n"
          "       23       1B    docena once\n"
          "       24       20    dos docenas\n"
          "       25       21    dos docenas y uno\n"
          "       26       22    dos docenas y dos\n"
          "       36       30    tres docenas\n"
          "       48       40    cuatro docenas\n"
          "       60       50    cinco docenas\n"
          "       72       60    seis docenas\n"
          "       84       70    siete docenas\n"
          "       96       80    ocho docenas\n"
          "      101       85    ocho docenas y cinco\n"
          "      108       90    nueve docenas\n"
          "      120       A0    diez docenas\n"
          "      132       B0    once docenas\n"
          "      143       BB    once docenas y once\n"
          "      ...      ...    etcétera…",
        ),
        const _H("Las magnitudes superiores"),
        const _P(
          "Por encima de la docena sigue una serie de magnitudes "
          "geométricamente motivadas — una por posición duodecimal, "
          "una por dimensión. Cuadero designa el cuadrado 2D (12² = "
          "e144), cubero el cubo clásico (12³ = e1728), tesero el "
          "teseracto cuatridimensional (12⁴), y desde ahí los "
          "hipercubos numerados en griego: pentero (12⁵), hexero "
          "(12⁶), heptero (12⁷). Cada paso es una dimensión más alta "
          "y exactamente una posición duodecimal más lejos.",
        ),
        const _Pre(
          " Decimal    Dozenal    Pronunciación\n"
          "      144       100    cuadero  (12²)\n"
          "     1728      1000    cubero   (12³)\n"
          "    20736     10000    tesero   (12⁴)\n"
          "   248832    100000    pentero  (12⁵)\n"
          "  2985984   1000000    hexero   (12⁶)\n"
          " 35831808  10000000    heptero  (12⁷)\n"
          "      ...      ...    etcétera…",
        ),
        const _P(
          "En español las magnitudes se apilan por simple "
          "yuxtaposición — como en decimal: «ciento veintiuno» (121), "
          "no «ciento y veintiuno». Así o101 se lee «cuadero uno», "
          "o123 «cuadero dos docenas y tres», o2300 «dos cuberos tres "
          "cuaderos». La única «y» aparece en la posición de unidad "
          "cuando el multiplicador de docena es de 2 a B, heredada "
          "del español decimal. Las magnitudes vacías se omiten: "
          "o1023 se lee «cubero dos docenas y tres», no «cubero cero "
          "cuadero …».",
        ),
        const _H("¿Por qué precisamente doce?"),
        const _P(
          "La razón es la divisibilidad. Doce tiene seis divisores: "
          "1, 2, 3, 4, 6 y 12. Diez tiene solo cuatro: 1, 2, 5 y 10. "
          "Parece una diferencia pequeña, pero el efecto en los "
          "cálculos cotidianos es considerable — especialmente con "
          "las fracciones.",
        ),
        const _H("Fracciones unitarias comparadas"),
        const _Pre(
          "  Fracción    Base 10    Base 12\n"
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
          "En base 10 los tercios y los sextos son fracciones "
          "periódicas infinitas. En base 12 son cortos y exactos. A "
          "cambio los quintos y décimos se vuelven periódicos — un "
          "intercambio justo cuando se considera con qué frecuencia "
          "dividimos por tres y cuatro en comparación con cinco.",
        ),
        const _H("La regla detrás"),
        const _P(
          "Qué fracciones terminan y cuáles se vuelven periódicas "
          "sigue una regla simple: una fracción 1/n tiene una "
          "representación finita en base b exactamente cuando todos "
          "los factores primos de n son también factores primos de "
          "b. Los factores primos de 12 son 2 y 3. Así que cada "
          "fracción cuyo denominador esté compuesto solo de dos y "
          "tres termina. Todo lo demás — denominadores con 5, 7 u 11 "
          "— se vuelve periódico. La calculadora marca esta "
          "periodicidad con una barra sobre los dígitos repetidos.",
        ),
        const _H("Huellas en la historia"),
        const _P(
          "El doce como magnitud organizadora es más antiguo que "
          "cualquier sistema numérico. Los babilonios calculaban en "
          "base 60 pero organizaban sus dígitos en grupos de 12. En "
          "el comercio se contaba por docenas (12) y gruesas (144 = "
          "12²). El día tiene 2×12 horas, el año 12 meses, el círculo "
          "completo 360 = 30×12 grados.",
        ),
        const _P(
          "La Sociedad Dozenal de América (Dozenal Society of "
          "America, fundada en 1944, hoy con filiales en otros "
          "países) trabaja para dar a conocer mejor las ventajas de "
          "la base 12. Esta calculadora está en esta tradición — no "
          "como una exigencia de cambio de sistema, sino como una "
          "herramienta de exploración y asombro.",
        ),
      ];
    case 2:
      return [
        const _H("144 — donde dos mundos se encuentran"),
        const _P(
          "La sucesión de Fibonacci comienza con 1, 1, y cada número "
          "siguiente es la suma de los dos anteriores: 1, 1, 2, 3, "
          "5, 8, 13, 21, 34, 55, 89, 144, … Crece exponencialmente. "
          "Los números cuadrados — 1, 4, 9, 16, 25, 36, … — en cambio "
          "crecen solo cuadráticamente. Dos sucesiones tan diferentes "
          "casi no tienen razón para encontrarse. Y sin embargo lo "
          "hacen: el duodécimo número de Fibonacci es 144, y "
          "144 = 12².",
        ),
        const _P(
          "J. H. E. Cohn demostró en 1964 que esto no es coincidencia "
          "sino un evento único: aparte de F(1) = F(2) = 1, ningún "
          "otro número de Fibonacci es simultáneamente un cuadrado "
          "perfecto. El doce se sitúa en un cruce único de dos "
          "sucesiones numéricas fundamentales.",
        ),
        const _H("La razón áurea"),
        const _P(
          "φ = (1+√5)/2 ≈ 1.618 es el límite del cociente de números "
          "de Fibonacci sucesivos: F(n+1)/F(n) → φ. En base 12: φ ≈ "
          "1.74BB677… — la calculadora tiene φ como constante en el "
          "panel de extensión.",
        ),
        const _P(
          "Si tecleas φ² =, verás que el resultado es exactamente "
          "φ+1 — la propiedad definitoria de la razón áurea. Esta "
          "identidad hace de φ una constante algebraicamente única.",
        ),
        const _H(
            "12 = 2² × 3 — una descomposición en factores con consecuencias"),
        const _P(
          "Doce es un número altamente compuesto (highly composite "
          "number): tiene más divisores que cualquier número natural "
          "menor. Los divisores de 12 son 1, 2, 3, 4, 6, 12 — es "
          "decir, seis. Srinivasa Ramanujan definió y estudió esta "
          "clase de números en un artículo famoso de 1915 en los "
          "Proceedings of the London Mathematical Society.",
        ),
        const _P(
          "Doce es también el menor número abundante: la suma de sus "
          "divisores propios (1+2+3+4+6 = 16) supera al propio "
          "número. Para la mayoría de los números pequeños es al "
          "revés — para 10, 1+2+5 = 8, que es menor que 10. Doce es "
          "el primer número en el que los divisores «se desbordan».",
        ),
        const _H("La ciudad ideal de Platón"),
        const _P(
          "En sus «Leyes» (libro V), Platón plantea la pregunta de "
          "cuántos ciudadanos debería tener una ciudad ideal. Su "
          "respuesta: 5040. El argumento no es místico sino "
          "práctico: una ciudad debe dividir continuamente a sus "
          "ciudadanos en grupos de igual tamaño. 5040 es divisible "
          "por cada número del 1 al 12 (con la única excepción de "
          "11).",
        ),
        const _P(
          "Lo que Platón describe intuitivamente es la misma "
          "percepción que subyace al sistema duodecimal: en la vida "
          "cotidiana, los divisores pequeños son los importantes. "
          "5040 = 7! es la hermana mayor del doce — la misma "
          "filosofía de divisibilidad aplicada a toda una población "
          "urbana.",
        ),
      ];
    case 3:
      return [
        const _H("¿Qué es un dodecágono regular?"),
        const _P(
          "Un dodecágono regular es un polígono con doce lados "
          "iguales y doce ángulos interiores iguales. Cada ángulo "
          "interior mide 150° — o, expresado en duodecimal, 106°. Es "
          "una de las formas geométricas más antiguas y más usadas: "
          "se encuentra en esferas de reloj, monedas, ornamentos "
          "arquitectónicos y patrones de pavimentado.",
        ),
        const _H("La navaja suiza de los polígonos"),
        const _P(
          "Lo que hace al dodecágono único no es su forma en sí, "
          "sino todo lo que contiene. Al conectar cada cuarto "
          "vértice, se obtiene un triángulo equilátero — exacto, no "
          "aproximado. Cada tercer vértice da un cuadrado. Cada "
          "segundo vértice un hexágono regular. Las tres figuras "
          "encajan perfectamente en el mismo círculo que circunscribe "
          "al dodecágono.",
        ),
        const _P(
          "Esto significa: el dodecágono contiene los tres polígonos "
          "regulares fundamentales de la geometría como subfiguras "
          "exactas. Ningún otro polígono con tan pocos vértices "
          "puede decir lo mismo de sí. Una consecuencia directa de "
          "la divisibilidad de 12 por 2, 3, 4 y 6.",
        ),
        const _H("Construible con compás y regla"),
        const _P(
          "No todo polígono regular puede construirse exactamente "
          "con compás y regla. El dodecágono, en cambio, es "
          "construible: se comienza con un círculo, se divide en "
          "seis partes iguales (esto se logra, porque el hexágono es "
          "construible), después se bisecta cada uno de estos arcos, "
          "y se tienen doce puntos uniformemente distribuidos en el "
          "círculo.",
        ),
        const _P(
          "El fundamento matemático: un n-ágono regular es "
          "construible exactamente cuando n es un producto de una "
          "potencia de dos y números primos de Fermat distintos "
          "(Gauss, 1796). Para 12 = 2² × 3 esto se cumple, porque 3 "
          "es un primo de Fermat.",
        ),
        const _H("Simetría"),
        const _P(
          "El dodecágono regular tiene 24 simetrías: 12 rotaciones "
          "(de 0°, 30°, 60°, …, 330°) y 12 reflexiones (6 a través "
          "de vértices opuestos, 6 a través de puntos medios opuestos "
          "de lados). En el lenguaje del álgebra estas 24 simetrías "
          "forman el grupo diédrico D₁₂. Cada n-ágono regular tiene "
          "exactamente 2n simetrías.",
        ),
        const _Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H("54 diagonales"),
        const _P(
          "Una diagonal conecta dos vértices no adyacentes de un "
          "polígono. La fórmula n(n−3)/2 da al dodecágono 12×9/2 = 54 "
          "diagonales. Esto suena como una malla intrincada — pero "
          "la estructura es notablemente ordenada.",
        ),
        const _H("Seis longitudes diferentes"),
        const _P(
          "Cada diagonal salta un cierto número de vértices. Como el "
          "dodecágono es simétrico, todas las diagonales que saltan "
          "el mismo número de vértices comparten la misma longitud. "
          "Hay cinco anchuras de salto posibles (1 a 5 vértices), "
          "más el diámetro que abarca 6 — es decir, seis tipos de "
          "longitud en total. Para longitud de lado s = 1:",
        ),
        const _Pre(
          "  Tipo         Saltos          Longitud (exacta)    Aprox.\n"
          "  s (lado)     —               1                    1.000\n"
          "  d₂           1 vértice       √(2+√3)              1.932\n"
          "  d₃           2 vértices      1+√3                 2.732\n"
          "  d₄           3 vértices      (3√2+√6)/2           3.346\n"
          "  d₅           4 vértices      2+√3                 3.732\n"
          "  d₆ (⌀)       5 vértices      √6+√2                3.864",
        ),
        const _H("Patrones ocultos"),
        const _P(
          "La tercera y la quinta diagonal difieren exactamente en "
          "1: d₃ = 1+√3 y d₅ = 2+√3. La diferencia es igual a la "
          "propia longitud del lado — un hecho geométrico, no "
          "computacional.",
        ),
        const _P(
          "El diámetro d₆ es exactamente el doble de largo que la "
          "diagonal más corta d₂: √6+√2 = 2·√(2+√3). El diámetro y "
          "la diagonal más corta están en una razón de 2:1 — la "
          "misma proporción que la octava en música.",
        ),
        const _H("La cuadrícula de 15 grados"),
        const _P(
          "Todos los ángulos que aparecen en el dodecágono — entre "
          "lados, entre diagonales — son múltiplos de 15°. Esto se "
          "debe a que los doce vértices dividen el círculo completo "
          "en doce sectores de 30°. 15° = 1/24 del círculo completo. "
          "En duodecimal: 15° = 13°doz, y 30° = 26°doz. Todos los "
          "ángulos que aparecen pueden escribirse en duodecimal como "
          "múltiplos enteros de 13°.",
        ),
        const _Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H("El área del dodecágono"),
        const _P(
          "Un dodecágono regular con longitud de lado s tiene área "
          "A = 3s²(2+√3). La derivación es intuitiva: se corta el "
          "dodecágono desde su centro en 12 triángulos isósceles "
          "congruentes, se calcula el área de un solo triángulo, y "
          "se multiplica por 12.",
        ),
        const _P(
          "Para s = 1 esto da A ≈ 11.196 (decimal). En comparación: "
          "el círculo circunscrito tiene área πR² ≈ 11.725. El "
          "dodecágono llena su círculo circunscrito en más del 95 % "
          "— notablemente mejor que un hexágono (83 %) y mucho "
          "mejor que un cuadrado (64 %) o un triángulo (41 %).",
        ),
        const _H("3/π — una razón elegante"),
        const _P(
          "La razón entre el área del dodecágono y el área del "
          "círculo circunscrito se simplifica a 3/π. La derivación "
          "usa sin²(15°) = (2−√3)/4, lo que cancela el factor "
          "(2+√3)(2−√3) a 1 en la razón, dejando exactamente 3/π.",
        ),
        const _P(
          "3/π ≈ 0.9549 (decimal) — el dodecágono captura el 95.5 % "
          "del área del círculo. Teclea 3 / π = en la calculadora "
          "para verificarlo.",
        ),
        const _H("Cuatro polígonos comparados"),
        const _P(
          "Todas las figuras siguientes comparten el mismo círculo "
          "circunscrito. Fórmula: A = (n/2)·R²·sin(2π/n).",
        ),
        const _Pre(
          "  Figura          Parte     Fórmula\n"
          "  Triángulo       41.3 %    3√3/(4π)\n"
          "  Cuadrado        63.7 %    2/π\n"
          "  Hexágono        82.7 %    3√3/(2π)\n"
          "  Dodecágono      95.5 %    3/π",
        ),
        const _P(
          "El hexágono tiene exactamente el doble del área del "
          "triángulo (ambos contienen el factor 3√3). Y cada paso "
          "aporta una ganancia mayor de área, porque los vértices "
          "abrazan el círculo cada vez más estrechamente.",
        ),
        const _H("Arquímedes y π"),
        const _P(
          "Arquímedes calculaba π mediante polígonos. Usó un 96-ágono "
          "— 96 = 12×8 = 12×2³. Comenzó con el hexágono "
          "(trivialmente construible) y duplicó el número de "
          "vértices tres veces: 6→12→24→48→96. Por lo tanto, el "
          "punto de partida de su método fue el dodecágono.",
        ),
        const _P(
          "Su resultado: 3 + 10/71 < π < 3 + 1/7. Un 96-ágono llena "
          "el círculo circunscrito al 99.93 %. Del 95.5 % del "
          "dodecágono al 99.93 % son solo tres pasos de duplicación "
          "— una tasa de convergencia notable.",
        ),
      ];
    case 6:
      return [
        const _H("Doce caras"),
        const _P(
          "El dodecaedro es un sólido construido de doce pentágonos "
          "regulares. Cada cara es idéntica, cada arista de igual "
          "longitud, y exactamente tres pentágonos se encuentran en "
          "cada vértice. En total tiene 12 caras, 30 aristas y 20 "
          "vértices. Es uno de los cinco sólidos platónicos — los "
          "únicos sólidos convexos cuyas caras consisten "
          "exclusivamente en polígonos regulares idénticos.",
        ),
        const _H("Los cinco sólidos platónicos"),
        const _Pre(
          "  Sólido             Caras  Vértices  Aristas  Forma\n"
          "  Tetraedro             4      4         6   Triángulos\n"
          "  Cubo                  6      8        12   Cuadrados\n"
          "  Octaedro              8      6        12   Triángulos\n"
          "  Dodecaedro           12     20        30   Pentágonos\n"
          "  Icosaedro            20     12        30   Triángulos",
        ),
        const _P(
          "El dodecaedro es el único sólido platónico con caras "
          "pentagonales. En su cosmología, Platón asignó los otros "
          "cuatro sólidos a los elementos — y el dodecaedro al "
          "cosmos mismo.",
        ),
        const _H("¿Cómo se ve?"),
        const _P(
          "Quien juega juegos de rol lo conoce como D12 — el dado de "
          "doce caras. Cabe cómodamente en la mano y cae con "
          "fiabilidad sobre una cara. El balón de fútbol no es un "
          "dodecaedro: es un icosaedro truncado de 12 pentágonos y "
          "20 hexágonos.",
        ),
        const _H("Dodecaedros pentagonales galo-romanos"),
        const _P(
          "Más de cien pequeños objetos de bronce con forma de "
          "dodecaedro han sido encontrados en el norte de Europa, "
          "datados de los siglos II–IV d. C. Tienen doce caras "
          "pentagonales con agujeros redondos de tamaños variables. "
          "Nadie sabe con certeza para qué se usaban. Las hipótesis "
          "van desde candelabros hasta instrumentos de topografía "
          "pasando por objetos religiosos. El enigma sigue sin "
          "resolver.",
        ),
        const _H("La fórmula del poliedro de Euler"),
        const _P(
          "Para cada poliedro convexo se cumple una relación simple: "
          "vértices menos aristas más caras siempre es igual a dos. "
          "Leonhard Euler formuló esta ley en 1758. Para el "
          "dodecaedro: 20 − 30 + 12 = 2. La fórmula vale para los "
          "cinco sólidos platónicos, para cualquier prisma, para "
          "cualquier pirámide, para cualquier poliedro convexo en "
          "general.",
        ),
      ];
    case 7:
      return [
        const _H("La razón áurea en el dodecaedro"),
        const _P(
          "Cada cara del dodecaedro es un pentágono regular — y el "
          "pentágono regular es la casa de la razón áurea. La "
          "diagonal de tal pentágono está respecto a su lado "
          "exactamente como φ = (1+√5)/2 ≈ 1.618 (decimal) respecto "
          "a 1. Esta proporción impregna todo el sólido.",
        ),
        const _Pre(
          "  Cantidad             Fórmula             Decimal\n"
          "  Volumen              (15+7√5)/4          ≈ 7.663\n"
          "  Superficie           3√(25+10√5)         ≈ 20.646\n"
          "  Radio circunscrito   √3·φ/2              ≈ 1.401\n"
          "  Radio inscrito       √(25+11√5)/(2√10)   ≈ 1.114",
        ),
        const _P(
          "Si tecleas φ² = en la calculadora, obtienes φ+1. Esta es "
          "la propiedad definitoria de la razón áurea — y la razón "
          "por la que φ aparece en tantas fórmulas del dodecaedro.",
        ),
        const _H("Dualidad — el espejo del icosaedro"),
        const _P(
          "A cada sólido platónico le corresponde un sólido dual: se "
          "reemplaza cada cara con un vértice (en el centro de la "
          "cara) y se conectan los nuevos vértices adyacentes con "
          "aristas. Para el dodecaedro esto da el icosaedro — y al "
          "revés:",
        ),
        const _Pre(
          "                  Dodecaedro    Icosaedro\n"
          "  Caras                12          20\n"
          "  Aristas              30          30\n"
          "  Vértices             20          12",
        ),
        const _P(
          "Caras y vértices intercambian lugares ; el número de "
          "aristas se mantiene igual. El número 12 aparece en ambos "
          "sólidos — una vez como número de caras, una vez como "
          "número de vértices.",
        ),
        const _H("120 simetrías"),
        const _P(
          "El dodecaedro posee la simetría más rica entre los "
          "sólidos platónicos: el grupo icosaédrico Iₕ con 120 "
          "elementos — 60 rotaciones y 60 rotaciones-reflexiones. En "
          "comparación: el cubo tiene solo 48 simetrías, el "
          "tetraedro 24.",
        ),
        const _P(
          "120 = 5! = 2³×3×5. Los tres factores primos 2, 3 y 5 son "
          "exactamente aquellos que convergen en las caras del "
          "dodecaedro (pentágonos) y en la divisibilidad de 12 "
          "(= 2²×3).",
        ),
      ];
    case 8:
      return [
        const _H("360 grados y los babilonios"),
        const _P(
          "Que un círculo completo tenga 360 grados no es una "
          "constante natural — es una convención humana, que se "
          "remonta a los babilonios. La matemática babilónica usaba "
          "base 60, y 360 = 6×60. Pero 360 también puede escribirse "
          "como 12×30, y es exactamente así como los babilonios "
          "dividieron el cielo: el camino aparente del sol (la "
          "eclíptica) se dividió en 12 secciones iguales de 30° cada "
          "una. A cada sección se le asignó una constelación — los "
          "doce signos del zodíaco.",
        ),
        const _P(
          "La elección de 12 no fue casual. Los babilonios "
          "organizaron internamente su sistema de base 60 en grupos "
          "de 12, ya que 60 = 12×5. Para ellos el doce era una "
          "subunidad natural — en la medición del tiempo, en el "
          "calendario, en la astronomía.",
        ),
        const _H("La luna y el doce"),
        const _P(
          "¿Por qué precisamente doce secciones del cielo? Porque la "
          "naturaleza misma sugiere una división por doce: un año "
          "solar contiene casi exactamente 12 ciclos lunares. Un mes "
          "sinódico dura alrededor de 29.53 días. 12 ciclos lunares "
          "dan 354.4 días — solo 11 días menos que un año solar de "
          "365.24 días. Esta casi-coincidencia hizo del doce la "
          "división obvia del año.",
        ),
        const _H("Orden en el cielo"),
        const _P(
          "La división duodecimal del cielo era mucho más que un "
          "sistema de coordenadas para las culturas antiguas. Un "
          "detalle fascinante: el punto vernal se desplaza lentamente "
          "a través de las constelaciones porque el eje de la Tierra "
          "se tambalea como un trompo (precesión, período de unos "
          "25 800 años). Las constelaciones a través de las cuales "
          "se desplaza el punto vernal se llaman por eso también "
          "eras. Aquí también el doce estructura el tiempo: doce "
          "constelaciones, doce eras, un gran círculo.",
        ),
        const _H("El doce en otros lugares del cielo"),
        const _P(
          "Los antiguos egipcios dividían el día y la noche en 12 "
          "horas cada uno — de ahí nuestra división de 24 horas. El "
          "zodíaco chino también cuenta doce signos en ciclos de 12 "
          "años, derivados de la órbita de 12 años de Júpiter. Ambas "
          "tradiciones surgieron independientemente. La convergencia "
          "en el número 12 es notable.",
        ),
      ];
    case 9:
      return [
        const _H("Pirita — el dodecaedro del tonto"),
        const _P(
          "La pirita (FeS₂), conocida por su brillo dorado como «oro "
          "de los tontos», cristaliza a menudo en una forma "
          "engañosamente similar al dodecaedro platónico: el "
          "piritoedro. Tiene doce caras pentagonales, 20 vértices y "
          "30 aristas — la misma topología que el dodecaedro regular "
          "del capítulo 7. Pero observando de cerca, los pentágonos "
          "no son regulares. En cristalografía, la verdadera "
          "simetría de rotación de orden cinco es imposible para los "
          "cristales periódicos — solo se permiten simetrías de "
          "órdenes 1, 2, 3, 4 y 6. El piritoedro se salta esta regla "
          "con pentágonos irregulares.",
        ),
        const _H("Granate — otro sólido de doce caras"),
        const _P(
          "Los minerales del grupo del granate cristalizan "
          "preferentemente como dodecaedros rómbicos — también un "
          "sólido de doce caras, pero de naturaleza completamente "
          "diferente: las caras son rombos, no pentágonos. El "
          "dodecaedro rómbico tiene 14 vértices y 24 aristas y "
          "pertenece al sistema cristalino cúbico. Embaldosa el "
          "espacio sin huecos — el equivalente tridimensional del "
          "panal de abejas.",
        ),
        const _P(
          "La naturaleza usa el número 12 como número de caras para "
          "dos formas cristalinas completamente diferentes — "
          "pentágonos en la pirita, rombos en el granate. El doce no "
          "está atado a una geometría particular.",
        ),
        const _H("Radiolarios — esqueletos de vidrio"),
        const _P(
          "Los radiolarios son organismos marinos unicelulares, "
          "apenas mayores que una décima de milímetro, que "
          "construyen esqueletos filigranados de sílice. Algunas "
          "especies forman esqueletos con simetría icosaédrica — la "
          "simetría del icosaedro, el dual del dodecaedro. El "
          "biólogo alemán Ernst Haeckel dibujó estos organismos en "
          "1904 en su obra «Formas Artísticas de la Naturaleza» con "
          "un detalle que aún hoy impresiona.",
        ),
        const _H("Cuasicristales — la excepción que confirma la regla"),
        const _P(
          "En 1982 Dan Shechtman descubrió un patrón con simetría "
          "icosaédrica en una aleación de aluminio-manganeso — "
          "simetría prohibida en los cristales ordinarios. La "
          "comunidad experta reaccionó inicialmente con rechazo. "
          "Pero la observación se mantuvo, y en 2011 Shechtman "
          "recibió el Premio Nobel de Química. Estos cuasicristales "
          "tienen simetría icosaédrica, que contiene tanto la "
          "geometría dodecaédrica como la icosaédrica. "
          "Cuasicristales naturales — el mineral icosaedrita — "
          "fueron descubiertos en 2009 en un meteorito en Kamchatka.",
        ),
      ];
    case 10:
      return [
        const _H("Doce en una mano"),
        const _P(
          "Sostén una mano frente a ti, el pulgar separado, y mira "
          "los cuatro dedos. Cada dedo tiene tres segmentos "
          "(falanges), separados por articulaciones visibles. Cuatro "
          "dedos por tres segmentos — eso es doce. El pulgar puede "
          "servir de puntero: toca por turno cada segmento de los "
          "cuatro dedos y así cuenta de uno a doce.",
        ),
        const _P(
          "Este método no es un invento moderno. En partes del "
          "sudeste asiático, India y Medio Oriente, se usa desde "
          "hace siglos. Tiene una ventaja decisiva sobre el conteo "
          "occidental con los dedos: usa una mano para doce unidades "
          "en lugar de cinco.",
        ),
        const _H("De doce a sesenta"),
        const _P(
          "La segunda mano cuenta las vueltas completas. Cada vez "
          "que la primera mano termina una vuelta de doce, la segunda "
          "mano extiende un dedo. Cinco dedos por doce — eso da "
          "sesenta. Con dos manos se puede contar hasta 60, sin "
          "ningún auxiliar.",
        ),
        const _P(
          "Esta conexión entre 12 y 60 probablemente no es casual: "
          "el sistema sexagesimal babilónico (base 60) podría tener "
          "su origen en este método de conteo. 60 = 12×5 — una "
          "elegante fusión de anatomía y aritmética.",
        ),
        const _H("Otros doces en la anatomía humana"),
        const _Pre(
          "  — 12 pares de costillas (anatomía estándar)\n"
          "  — 12 pares de nervios craneales (I Olfatorio a XII Hipogloso)\n"
          "  — 12 vértebras torácicas (conectadas con los 12 pares de costillas)",
        ),
        const _P(
          "Variaciones anatómicas ocurren (11 o 13 pares de costillas "
          "son raramente posibles).",
        ),
        const _H("¿La mano formó el sistema numérico?"),
        const _P(
          "Si la anatomía de las falanges influyó en la aparición de "
          "sistemas numéricos duodecimales, o al revés, no puede "
          "determinarse con certeza histórica. Pudo ser un refuerzo "
          "mutuo: la gente empezó a contar con las falanges porque "
          "el doce ya era importante en su cultura. Lo que es "
          "seguro: la mano humana ofrece una base física natural "
          "para el doce.",
        ),
      ];
    case 11:
      return [
        const _H("Doces en la vida cotidiana"),
        const _Pre(
          "  12 pulgadas  = 1 pie\n"
          "  12 onzas     = 1 libra troy (metales preciosos)\n"
          "  12 peniques  = 1 chelín (moneda británica hasta 1971)\n"
          "  12 piezas    = 1 docena\n"
          "  144          = 12² = 1 gruesa",
        ),
        const _P(
          "Estas divisiones no son accidentes históricos — fueron "
          "elegidas porque facilitan la repartición. Un pie se "
          "divide en dos partes iguales (6 pulgadas cada una), en "
          "tres (4 pulgadas cada una), en cuatro (3 pulgadas cada "
          "una) y en seis (2 pulgadas cada una). Cada una de estas "
          "divisiones sale exacta.",
        ),
        const _P(
          "Un metro, en cambio, se divide en dos partes iguales "
          "(50 cm cada una) y en cinco (20 cm cada una), pero un "
          "tercio de metro son 33.333… cm — una fracción infinita en "
          "cuanto se quiere exactitud. En los oficios donde se "
          "tercia y cuarta continuamente, el doce es más práctico "
          "que el diez.",
        ),
        const _H("El sistema métrico — y su punto ciego"),
        const _P(
          "El sistema métrico tiene grandes fortalezas: es coherente "
          "(todas las unidades encajan), se escala decimalmente "
          "(kilo, mega, mili, micro), y está estandarizado "
          "internacionalmente. Estas ventajas son reales y "
          "considerables. Ninguna persona sensata propondría abolir "
          "el SI.",
        ),
        const _P(
          "Pero el sistema métrico hereda la debilidad de su base. "
          "En base 10 un tercio es una fracción infinita: 0.333… En "
          "un sistema métrico duodecimal, 1/3 sería 0.4 — exacto, "
          "corto, sin resto. La elegancia del principio métrico se "
          "preservaría — solo la base sería mejor.",
        ),
        const _H("El TGM de Tom Pendlebury"),
        const _P(
          "Tom Pendlebury, miembro de la Sociedad Dozenal de Gran "
          "Bretaña, siguió este pensamiento hasta el final. Su "
          "sistema se llama TGM — nombrado por sus tres unidades "
          "base: Tim (tiempo), Grafut (longitud), Maz (masa). "
          "Pendlebury no partió de la longitud sino del tiempo: "
          "dividió la hora en 12⁴ partes iguales. Del Tim derivó el "
          "Grafut mediante la aceleración gravitatoria de la Tierra "
          "(≈ 29.6 cm), y la unidad de masa Maz a partir del volumen "
          "de un Grafut cúbico de agua.",
        ),
        const _P(
          "El resultado es un sistema de unidades completamente "
          "coherente, en el que todas las conversiones son potencias "
          "de 12. El TGM nunca se adoptó más allá de los círculos "
          "entusiastas, pero demuestra que un sistema métrico "
          "duodecimal no solo sería posible — en algunos aspectos "
          "sería superior al decimal.",
        ),
        const _H("Lo que muestra esta calculadora"),
        const _P(
          "Teclea 1 / 3 = y verás 0.4 — corto, exacto, sin barra de "
          "período — y comprenderás en un segundo lo que páginas de "
          "argumentos no pueden transmitir. La pregunta «¿duodecimal "
          "o decimal?» nunca se decidirá en la práctica. Pero las "
          "ventajas matemáticas de la base 12 son objetivas y "
          "medibles, y esta calculadora las hace perceptibles.",
        ),
        const _P(
          "Consejo: el menú Info incluye una herramienta «Conversiones "
          "imperial-12» que descompone cualquier valor en estas escalas "
          "de unidades — piezas/docenas/gruesa, pulgadas/pies/yardas/"
          "millas, onzas troy hasta long tons, peniques/chelines/libras, "
          "tiempo y ángulo. Ingresa un número y mira cómo el mismo "
          "valor se reparte en la escala de cada dominio.",
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
