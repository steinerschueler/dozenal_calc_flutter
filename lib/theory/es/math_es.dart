// Prosa en español para los capítulos de "Matemáticas dozenales". part of
// ../math_theory.dart. Frases sencillas y claras (más fáciles de traducir) para
// temas complejos. El capítulo sobre el funcionamiento interno de la app está
// escrito a partir del código fuente (logic/rational.dart, logic/expression.dart,
// state.dart); los capítulos de matemáticas/historia se destilan de
// docs/research/math_*.md.
//
// Convención de orden: primero vienen los capítulos de matemáticas e historia;
// el capítulo sobre el funcionamiento interno ("Cómo calcula esta calculadora")
// queda al final.

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersEs() => const [
  ProseChapter(
    'Divisores, fracciones y periodos',
    [
      ProseSection(
        'Por qué el doce es tan divisible',
        'En base doce escribimos doce dígitos: del 0 al 9, más A para diez '
            'y B para once. Así que aquí «10» significa doce.\n\n'
            'El doce se puede dividir de forma exacta entre muchos números: 1, '
            '2, 3, 4, 6 y 12. El diez, en cambio, solo entre 1, 2, 5 y 10. La '
            'razón está en la estructura de los números: diez es dos por cinco, '
            'doce es dos por dos por tres. El doce reparte sus componentes entre '
            'los divisores pequeños y frecuentes 2 y 3 — y por eso es divisible '
            'entre 3 y entre 4, algo en lo que el diez fracasa. El tamaño no '
            'importa: el 16 es mayor, pero solo es divisible entre potencias '
            'de dos.',
      ),
      ProseSection(
        'Qué fracciones salen exactas',
        'Que una fracción dé un número decimal finito depende de una regla '
            'sencilla: sale exacta justo cuando el denominador se compone '
            'únicamente de factores primos de la base.\n\n'
            'Como en el doce está el tres, muchas fracciones cotidianas resultan '
            'exactas en base doce: un medio = 0,6; un tercio = 0,4; un cuarto '
            '= 0,3; un sexto = 0,2; un noveno = 0,14; un doceavo = 0,1. '
            'En base diez, en cambio, los tercios, sextos y novenos se '
            'extienden infinitamente. El precio del doce: las fracciones con '
            'cinco en el denominador quedan irregulares — un quinto es en base '
            'doce 0,2497, con repetición.',
      ),
      ProseSection(
        'Cuando se repite',
        'Si una fracción no sale exacta, a partir de cierta posición se repite '
            'un grupo fijo de dígitos: el periodo. Su longitud sigue una regla '
            'clara de la teoría de números y depende de la base y del '
            'denominador.\n\n'
            'Algunas cosas son igual de engorrosas en ambos mundos: un séptimo '
            'tiene tanto en base diez (0,142857) como en base doce (0,186A35) '
            'un periodo de seis cifras. En conjunto, entre los denominadores '
            'pequeños hay en base doce algo menos de fracciones periódicas que '
            'en base diez — a cambio, los periodos, cuando aparecen, pueden '
            'resultar algo más largos.',
      ),
      ProseSection(
        'La divisibilidad de un vistazo',
        'En la práctica, la fortaleza del doce se nota en las reglas de '
            'divisibilidad. Si un número es divisible entre 2, 3, 4 o 6, en base '
            'doce ya lo revela el último dígito. En base diez eso solo funciona '
            'para 2, 5 y 10.\n\n'
            'Para el once (B) existe una regla de suma de cifras — igual que la '
            'conocida prueba del nueve en base diez, porque el doce está uno por '
            'encima del once. Solo el siete no tiene, como tampoco en base diez, '
            'una prueba sencilla.',
      ),
      ProseSection(
        'Ninguna base gana en todo',
        'El doce tiene, pues, una ventaja real al dividir en tercios y cuartos '
            '— y una desventaja real al dividir en quintos, que es importante '
            'para los porcentajes y el dinero. Cambia una cosa por la otra.\n\n'
            'Más divisores tampoco es siempre mejor sin más: si no, el sesenta '
            'llevaría ventaja, ya que es divisible entre aún más números — pero '
            'necesitaría sesenta dígitos y una tabla de multiplicar enorme. Las '
            'sociedades dozenales ven el doce como un buen término medio: solo '
            'dos signos adicionales, una tabla de multiplicar pequeña, pero con '
            'los divisores 2, 3 y 4. Esa es su valoración, no una demostración.',
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
    'Números cíclicos',
    [
      ProseSection(
        'El séptimo y sus parientes',
        'Un séptimo no sale exacto en base doce, sino que se repite: '
            'un séptimo = 0,186A35, luego otra vez 186A35, sin fin. (A '
            'representa diez, B representa once.) El grupo que se repite es el '
            'periodo; aquí tiene seis cifras de longitud.\n\n'
            'Lo sorprendente se ve al colocar los demás séptimos uno al lado del '
            'otro. Dos séptimos = 0,35186A; tres séptimos = 0,5186A3; cuatro '
            'séptimos = 0,6A3518; cinco séptimos = 0,86A351; seis séptimos = '
            '0,A35186. Son siempre las mismas seis cifras en el mismo orden — solo '
            'que la secuencia comienza en un lugar distinto. Se pueden imaginar '
            'dispuestas en un anillo que gira un poco con cada fracción.',
      ),
      ProseSection(
        'Cuando los múltiplos rotan',
        'La misma rotación está en la tabla de multiplicar del propio periodo. '
            'Si se toma la secuencia de cifras 186A35 como número entero y se '
            'multiplica sucesivamente, solo aparecen rotaciones: 186A35 × 2 = '
            '35186A; × 3 = 5186A3; × 4 = 6A3518; × 5 = 86A351; × 6 = A35186. '
            'Un número con esta propiedad se llama número cíclico.\n\n'
            'El séptimo paso cierra el círculo: 186A35 × 7 = BBBBBB. Solo onces '
            '— la cifra más alta de la base doce, seis veces seguidas. No es '
            'casualidad: BBBBBB es exactamente uno menos que la siguiente posición '
            'redonda. En base diez se conoce el mismo truco con el famoso número '
            '142857 (el periodo de un séptimo en el sistema decimal): también allí '
            'los múltiplos dan rotaciones, y 142857 × 7 = 999999. Las cifras son '
            'distintas; la estructura, la misma.',
      ),
      ProseSection(
        'Por qué exactamente seis cifras',
        'Que el periodo tenga exactamente seis cifras — y no menos — tiene una '
            'razón clara. Al dividir por escrito, después de cada paso queda un '
            'resto, y el periodo termina en cuanto se repite alguno. Con un séptimo '
            'aparecen sucesivamente todos los seis restos posibles, del 1 al 6, '
            'antes de que se repita el primero. Con el siete no puede haber más de '
            'seis restos distintos, así que seis es la longitud máxima posible.\n\n'
            'Un número primo cuyo inverso alcanza este periodo máximo se llama '
            'número primo de periodo completo. Solo en ese caso los múltiplos '
            'recorren todas las rotaciones, y solo entonces surge un número cíclico. '
            'Que un primo sea de periodo completo depende de cómo se comportan las '
            'potencias de la base — aquí doce — al dividirlas por ese primo.',
      ),
      ProseSection(
        'El complemento a la cifra más alta',
        'El periodo 186A35 encierra aún un segundo patrón. Si se divide por la '
            'mitad y se suman las dos mitades, sale 186 + A35 = BBB — de nuevo solo '
            'onces, esta vez tres. Las dos mitades se complementan exactamente '
            'hasta la cifra más alta.\n\n'
            'Este es un teorema general (de Étienne Midy, 1836) y vale en cualquier '
            'base: en base diez es 142 + 857 = 999. El efecto muestra que la segunda '
            'mitad del periodo no es material nuevo, sino el reflejo especular de la '
            'primera.',
      ),
      ProseSection(
        'No todos los primos participan',
        'La hermosa rotación es la excepción, no la regla. Un onceavo muestra en '
            'base doce solo el periodo 0,1 — un único uno que se repite, porque el '
            'doce está uno por encima del once (el equivalente al noveno = 0,1 en el '
            'sistema decimal). Un treceavo da 0,0B con el periodo corto 0B. Tales '
            'números primos no generan ningún número cíclico.\n\n'
            'Entre los primos pequeños, en base doce son números de periodo completo '
            'el 5, el 7, el 17, el 31, el 41 y el 43 (contados en decimal) — '
            'curiosamente todos con dígito final 5 o 7 en base doce. Esa es una '
            'condición necesaria, pero no suficiente: el diecinueve también termina '
            'en 7, pero solo tiene un periodo de seis cifras. El cambio de base '
            'también influye: el cinco es de periodo completo en base doce (un quinto '
            '= 0,2497, periodo 2497), mientras que en base diez un quinto sale exacto. '
            'Qué primos participan pertenece, pues, al par formado por la base y el '
            'primo, no al primo solo.',
      ),
      ProseSection(
        'Cuántos hay — una pregunta abierta',
        'Podría pensarse que una propiedad tan clara ya estaría contada. No es así. '
            'Cuántos números de periodo completo existen en base doce — si infinitos '
            '— no está demostrado hasta hoy.\n\n'
            'Una conjetura de Emil Artin del año 1927 predice que aproximadamente '
            'treinta y siete de cada cien números primos deberían ser de periodo '
            'completo, en base doce como en cualquier otra base válida. La '
            'observación con números pequeños es compatible con ese orden de '
            'magnitud. Pero la conjetura es justamente eso, una conjetura: a pesar '
            'de grandes esfuerzos, no ha sido demostrada para ninguna base '
            'individual. Eso forma parte de la presentación honesta — un patrón que '
            'parece sencillo, detrás del cual se esconde un problema aún abierto.',
      ),
      ProseSection(
        'Probarlo en la calculadora',
        'Todo esto puede comprobarse aquí. Si se teclea un séptimo y el signo '
            'igual, la pantalla muestra 0, con una raya sobre 186A35 — las seis '
            'cifras del periodo. Con dos séptimos aparece la misma secuencia como '
            '35186A, rotada; no es redondeo, sino exactamente el mismo patrón. '
            'Un quinto muestra la raya sobre 2497; un onceavo, solo sobre el único '
            'dígito 1.\n\n'
            'Ejemplos más grandes hacen visibles los límites: una fracción con '
            'denominador treinta y uno (en decimal) tiene un periodo de treinta '
            'cifras — aquí la pantalla trunca con tres puntos, porque no todo cabe '
            'en una línea. Cómo calcula la calculadora fracciones exactas y sus '
            'periodos se explica en el capítulo «Cómo calcula esta calculadora».',
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
        'Midy\'s theorem — Wikipedia',
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
        'Artin\'s conjecture on primitive roots — Wikipedia',
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
    'Divisibilidad y la prueba del once',
    [
      ProseSection(
        'El último dígito revela mucho',
        'En base doce, el último dígito de un número no es más que su resto al '
            'dividirlo entre doce. Por eso, con solo mirar la cifra final se sabe '
            'inmediatamente si el número es divisible entre alguno de los divisores '
            'del doce. Las cifras finales pares (0, 2, 4, 6, 8, A) indican '
            'divisibilidad entre dos. Si el número termina en 0, 3, 6 o 9, es '
            'divisible entre tres; en 0, 4 u 8, entre cuatro; en 0 o 6, entre '
            'seis; solo en 0, entre doce. (A representa aquí diez.)\n\n'
            'Esta es una ventaja concreta del doce. En el sistema decimal, el '
            'último dígito solo revela la divisibilidad entre dos, cinco y diez '
            '— para tres, cuatro o seis hay que calcular. El doce expone '
            'precisamente los divisores pequeños más frecuentes.',
      ),
      ProseSection(
        'La prueba del once: la suma de cifras cuenta',
        'Para el once (B) el último dígito no ayuda, pero existe un procedimiento '
            'igualmente sencillo: la suma de cifras, es decir, la suma de todos los '
            'dígitos. Un número es divisible entre once en base doce exactamente '
            'cuando su suma de cifras es divisible entre once. La razón es elegante: '
            'el doce deja resto uno al dividirlo entre once, y lo mismo ocurre con '
            'cada posición superior — por eso solo importa lo que suman las cifras '
            'juntas.\n\n'
            'Esto es el equivalente exacto de la conocida prueba del nueve en el '
            'sistema decimal, donde la suma de cifras verifica el nueve. En base '
            'doce verifica el once — de ahí el nombre «prueba del once». Un '
            'ejemplo: el número 4B7 tiene la suma de cifras 4 + B + 7, es decir, '
            'catorce más ocho, que es veintidós — y veintidós es dos veces once, '
            'así que 4B7 es divisible entre once. Como la prueba del nueve, la '
            'prueba del once sirve como comprobación rápida: si la prueba falla, '
            'hay un error en el resultado.',
      ),
      ProseSection(
        'El trece mediante la suma alternada',
        'Una segunda prueba detecta el trece. Aquí se suman las cifras '
            'alternando signo positivo y negativo, comenzando por la derecha: '
            'la suma alternada. Si esta es divisible entre trece, también lo es '
            'el número entero. La razón es el espejo de la prueba del once: el '
            'doce está uno por debajo del trece, por lo que las posiciones '
            'alternan de signo al dividir entre trece.\n\n'
            'Un pequeño tropiezo para quienes están acostumbrados al sistema '
            'decimal: allí la «prueba del once» es precisamente la variante '
            'alternada, porque el once está uno por encima del diez. En base doce '
            'los papeles están intercambiados — la suma simple pertenece al once '
            'y la alternada al trece. (El trece mismo se escribe en base doce, '
            'por cierto, como 11, un doce y un uno; siempre se habla de su valor.)',
      ),
      ProseSection(
        'Donde el doce tiene dificultades',
        'Ninguna ventaja es gratis. El cinco y el siete no comparten ningún factor '
            'con el doce, y tampoco encajan con el once o el trece — para ellos no '
            'existe en base doce ninguna regla cómoda de cifra final o suma de '
            'cifras. Precisamente el cinco, que en el sistema decimal tiene la '
            'prueba más sencilla de todas (cifra final cero o cinco), se vuelve aquí '
            'engorroso.\n\n'
            'Este es el intercambio honesto: el doce nos regala las pruebas fáciles '
            'para el tres, el cuatro y el seis, y a cambio nos quita la prueba '
            'sencilla del cinco. Qué lado pesa más depende de qué divisores se '
            'necesitan con más frecuencia en la vida cotidiana — y suelen ser los '
            'pequeños.',
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
    'Trucos en la tabla de multiplicar',
    [
      ProseSection(
        'Series con cola corta',
        'La tabla de multiplicar del doce tiene doce series, y algunas casi se '
            'aprenden solas — las de sus divisores. Sus múltiplos terminan en '
            'patrones cortos y repetitivos. La serie del seis termina '
            'alternativamente en 6 y 0 (6, 10, 16, 20, 26, 30, …). La serie del '
            'cuatro sigue 4, 8, 0, 4, 8, 0; la del tres, 3, 6, 9, 0 y de nuevo '
            'desde el principio; la del dos siempre termina en cifra par.\n\n'
            'Dos operaciones resultan especialmente cómodas. Multiplicar por doce '
            'equivale simplemente a añadir un cero: siete por doce es 70. Y la '
            'serie del seis es la mitad de la del doce — seis por un número par '
            'termina en 0; seis por un número impar, en 6.',
      ),
      ProseSection(
        'La serie del once como espejo',
        'La serie más elegante pertenece al once (B): B, 1A, 29, 38, 47, 56, 65, '
            '74, 83, 92, A1, B0. Encierra dos patrones a la vez. La cifra delantera '
            'sube paso a paso — 0, 1, 2, 3, … —, mientras la trasera baja al mismo '
            'ritmo. Y en cada resultado las dos cifras suman once: uno y diez, dos '
            'y nueve, tres y ocho.\n\n'
            'Es exactamente el reflejo de la serie del nueve en el sistema decimal, '
            'donde las cifras se complementan hasta nueve. De ello se deriva un '
            'truco cómodo: en lugar de multiplicar por once, se multiplica por doce '
            'y se resta el número una vez. Once por siete es, pues, setenta menos '
            'siete, lo que da 65 en base doce — y efectivamente, en la tabla, once '
            'por siete aparece como 65.',
      ),
      ProseSection(
        'Las series rebeldes: cinco y siete',
        'No todas las series son tan dóciles. El cinco y el siete no comparten '
            'ningún factor con el doce, y sus series recorren por eso las doce '
            'cifras finales posibles antes de que algo se repita — sin ciclo corto '
            'que ayude a memorizar. La serie del cinco termina sucesivamente en '
            '5, A, 3, 8, 1, 6, B, 4, 9, 2, 7, 0; la del siete es igualmente '
            'saltarina.\n\n'
            'Aquí reaparece un antiguo cuarteto: precisamente las series del uno, '
            'el cinco, el siete y el once recorren todas las cifras finales '
            'completamente — los mismos cuatro números que en el reloj de horas '
            'generan todo el círculo y que terminan en números primos. Y por eso '
            'exactamente un quinto y un séptimo tienen esos periodos largos y '
            'completos del capítulo sobre números cíclicos. En el sistema decimal '
            'es la serie del siete la famosamente engorrosa; en base doce lo son el '
            'cinco y el siete conjuntamente.',
      ),
      ProseSection(
        'Cuadrados y la gruesa',
        'Si se recorre la tabla en diagonal de arriba izquierda a abajo derecha, '
            'aparecen los cuadrados perfectos: 1, 4, 9, 14, 21, 30, 41, 54, 69, '
            '84, A1 — y finalmente 100. Este último es doce por doce, es decir, '
            'ciento cuarenta y cuatro, que en base doce se escribe sencillamente '
            '«100» y desde antiguo se llama una gruesa. El doce escribe su propio '
            'cuadrado tan redondo como el sistema decimal escribe el cien.\n\n'
            'También doblar y halver resulta fácil en base doce, porque el doce es '
            'par y divisible entre cuatro: la mitad de 10 es 6, la mitad de 6 es 3, '
            'la mitad de 3 es 1,6. Así muchas operaciones pueden descomponerse '
            'mentalmente en pasos pequeños y limpios — la razón real por la que '
            'los aficionados al doce encuentran agradable calcular con él.',
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
    'Las bases numéricas en comparación',
    [
      ProseSection(
        'Qué es una base',
        'Un sistema posicional da a cada dígito un valor según su posición. La '
            'base indica cuántos dígitos hay y por qué factor crece cada '
            'posición. La base diez usa diez dígitos; la base doce, doce (0–9, '
            'A, B); la base dos, solo dos (0 y 1).\n\n'
            'El mismo número se ve distinto según la base, pero significa lo '
            'mismo. Una base pequeña necesita muchas posiciones (en binario se '
            'vuelve muy largo); una base grande, muchos signos distintos.',
      ),
      ProseSection(
        'Seis bases en su ficha',
        '• Base 2 (binario): el lenguaje de los ordenadores — un interruptor '
            'está encendido o apagado.\n'
            '• Base 8 (octal): hoy un nicho, por ejemplo para los permisos de '
            'archivo en Unix.\n'
            '• Base 10 (decimal): nuestra vida diaria y el sistema métrico.\n'
            '• Base 12 (dozenal): la docena, el reloj y la pulgada — y el '
            'objetivo del movimiento dozenal.\n'
            '• Base 16 (hexadecimal): notación compacta para datos '
            'informáticos.\n'
            '• Base 60 (sexagesimal): el tiempo y los ángulos, una herencia de '
            'Babilonia.',
      ),
      ProseSection(
        'Convertir entre bases',
        'Los números pasan de una base a otra mediante procedimientos fijos. La '
            'parte entera se divide repetidamente entre la base de destino y se '
            'leen los restos de abajo hacia arriba. La parte decimal se '
            'multiplica repetidamente por la base de destino y se leen las '
            'partes enteras de arriba hacia abajo.\n\n'
            'Ejemplo: 0,5 se convierte en base doce en 0,6; 0,125 se convierte '
            'en 0,16. Entre bases emparentadas es aún más sencillo: como el '
            'dieciséis es una potencia de dos, un dígito hexadecimal equivale '
            'exactamente a cuatro posiciones binarias — basta con agrupar.',
      ),
      ProseSection(
        'Dónde está en casa cada base',
        'Los ordenadores calculan en binario, porque un transistor solo conoce '
            'dos estados. El hexadecimal es la cómoda abreviatura para ello — '
            'está en las direcciones de memoria, en los colores web como '
            '#FF00FF y en los números Unicode. El tiempo y los ángulos siguen '
            'el sesenta: sesenta minutos, 360 grados, fácilmente divisibles en '
            'tercios y cuartos. La vida cotidiana y casi toda la ciencia '
            'funcionan en decimal — sobre todo por costumbre y porque el '
            'sistema métrico se basa en él.\n\n'
            'El doce pervive en la docena, la gruesa, el reloj y la pulgada. '
            'Desde el siglo XVIII hay defensores de un verdadero cálculo en '
            'doce — desde Buffon, pasando por Isaac Pitman, hasta Frank Emerson '
            'Andrews, que en 1935 escribió el primer libro sobre el tema. '
            'Sociedades propias cultivan la idea hasta hoy; más sobre esto en '
            'el bloque «La sociedad dozenal».',
      ),
      ProseSection(
        'Ninguna base es la mejor en todo',
        'Cada base tiene su propósito. El dos y el dieciséis no son «mejores '
            'para las personas», sino ideales para las máquinas. El diez es '
            'familiar y está firmemente arraigado. El doce divide bien en '
            'tercios y cuartos, pero pierde con el quinto. El sesenta divide '
            'mejor que nadie, pero con sesenta signos es demasiado grande para '
            'la vida diaria.\n\n'
            'En los sistemas de medida, al final cuenta menos la base en sí que '
            'la coherencia con que uno se mantiene en una única base: el sistema '
            'métrico gana porque todo funciona sobre el mismo diez — un sistema '
            'mixto de milla, yarda, pie y pulgada no tendría esa ventaja en '
            'ninguna base.',
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
    'Una breve historia de los sistemas posicionales',
    [
      ProseSection(
        'Antes del valor posicional',
        'Durante mucho tiempo se escribían los números sumando signos. Los '
            'números romanos son uno de esos sistemas: XVII significa diez más '
            'cinco más uno más uno. Eso es bueno para leer, pero trabajoso para '
            'calcular, y los números grandes se vuelven inmanejables.\n\n'
            'El gran salto fue el sistema posicional: el mismo dígito significa '
            'algo distinto según su posición. Solo eso facilita el cálculo '
            'escrito con números arbitrariamente grandes — y exige un dígito '
            'para «nada en esta posición»: el cero.',
      ),
      ProseSection(
        'Babilonia y el sesenta',
        'El primer verdadero sistema posicional surgió entre los sumerios y los '
            'babilonios, hace más de cuatro mil años, en base sesenta. Se '
            'considera su mayor logro matemático.\n\n'
            'Pero aún no tenían un cero pleno: conocían un signo marcador de '
            'posición para los huecos en medio, pero nunca al final de un '
            'número. Su herencia nos acompaña hasta hoy — en los sesenta '
            'minutos de la hora y en los 360 grados del círculo.',
      ),
      ProseSection(
        'La invención india del cero',
        'El actual sistema decimal con el cero viene de la India. Aryabhata usó '
            'en el siglo V la notación posicional; Brahmagupta trató en el 628 '
            'el cero por primera vez como un número propio con sus propias '
            'reglas de cálculo, no solo como un hueco.\n\n'
            'De allí lo adoptaron los eruditos árabes y persas — al-Juarismi '
            'escribió sobre ello hacia el 825 —, y a través de ellos llegó a '
            'Europa. Por eso nuestros dígitos se siguen llamando hasta hoy '
            '«números arábigos», aunque la idea proceda de la India.',
      ),
      ProseSection(
        'Las bases de las máquinas',
        'Con las máquinas de calcular llegaron nuevas bases. Gottfried Wilhelm '
            'Leibniz publicó en 1703 el sistema binario, formado solo por 0 y 1 '
            '— incluso veía en él reflejados los antiguos hexagramas del I '
            'Ching chino.\n\n'
            'Hoy los ordenadores calculan en binario, pero lo escriben casi '
            'siempre en hexadecimal: con el byte de 8 bits del IBM System/360 '
            'en los años sesenta se impuso la base dieciséis, porque dos dígitos '
            'hexadecimales forman exactamente un byte. Así cada base encontró su '
            'lugar — no porque fuera «la mejor», sino porque encaja con su '
            'cometido.',
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
  ProseChapter('Cómo calcula esta calculadora', [
    ProseSection(
      'Dos calculadoras en una',
      'Cuando pulsas la tecla de igual, la app no calcula una vez, sino dos '
          '— con dos máquinas completamente distintas.\n\n'
          'La primera es una calculadora de fracciones exacta. Calcula sin '
          'ningún redondeo, con números enteros arbitrariamente grandes. La '
          'segunda es una calculadora decimal rápida, como la que tiene casi '
          'cualquier calculadora de bolsillo — calcula con precisión '
          'limitada, pero con todo, también con seno, raíz y logaritmo. Ambas '
          'arrancan con cada signo de igual.',
    ),
    ProseSection(
      'La fracción exacta',
      'La calculadora de fracciones guarda los números como la razón entre '
          'dos enteros. Un tercio sigue siendo realmente un tercio, no '
          '0,333… Solo al mostrarlo convierte la fracción en decimales '
          'dozenales.\n\n'
          'Al hacerlo, detecta cuándo se repiten los decimales. Un tercio es '
          'en base doce exactamente 0,4. Un quinto, en cambio, es periódico: '
          '0,2497 2497 2497 … La app lo muestra con una raya sobre el grupo '
          'que se repite y un punto que marca el comienzo del periodo. Así el '
          'resultado se mantiene exacto, en lugar de redondearse en silencio.',
    ),
    ProseSection(
      'Cuando la fracción no basta',
      'Algunos cálculos no se pueden escribir como fracción. En cuanto '
          'aparece un seno, una raíz, un logaritmo o una función similar — o '
          'se divide entre cero —, la calculadora de fracciones se rinde.\n\n'
          'Entonces interviene la calculadora decimal. Su resultado es solo '
          'aproximado, por eso la app le antepone un signo «≈»: '
          '«aproximadamente». Si ambos caminos funcionan, gana siempre la '
          'fracción exacta. El «≈» aparece, por tanto, solo allí donde es '
          'necesaria una verdadera aproximación.',
    ),
    ProseSection(
      'Periodos largos y la pantalla',
      'Los resultados exactos pueden volverse muy largos. Algunas fracciones '
          'tienen periodos de más de cien cifras — mucho más de lo que cabe '
          'en una línea.\n\n'
          'Para que nada se salga de la pantalla, la app omite por la derecha '
          'tantas de las últimas cifras (las menos significativas) como haga '
          'falta hasta que el resto quepa en la línea, y pone un «…» como '
          'señal de que aún sigue. La marca del periodo se acorta limpiamente '
          'junto con ello. El número se mantiene, pues, honesto: lo que se ha '
          'recortado se muestra de forma visible, no se oculta.',
    ),
  ]),
  ProseChapter(
    'Fibonacci, cuadrados y curiosidades',
    [
      ProseSection(
        '144 — donde se cruzan dos mundos',
        'La sucesión de Fibonacci empieza con 1, 1, y cada número siguiente es '
            'la suma de los dos anteriores: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Crece exponencialmente: los términos se hacen muy grandes '
            'con rapidez. Los cuadrados perfectos 1, 4, 9, 16, 25, 36, … crecen '
            'solo cuadráticamente, es decir, mucho más despacio. Dos sucesiones '
            'que crecen de manera tan distinta tienen casi ningún motivo para '
            'encontrarse alguna vez.\n\n'
            'Y sin embargo lo hacen: el duodécimo número de Fibonacci es 144, y '
            '144 = 12² es un cuadrado perfecto. Llamamos a este término F₁₂ = 144. '
            'En base 12, 144 es a la vez «100», el primer número de tres cifras, '
            'y en el comercio la gruesa: una docena de docenas. Tres propiedades '
            'coinciden en un único número.\n\n'
            'Que esto no sea una mera casualidad, sino un caso único, fue probado '
            'por J. H. E. Cohn en 1964: fuera de 0, 1 y 144, en toda la infinita '
            'sucesión de Fibonacci no existe ningún otro número que sea a la vez '
            'un cuadrado perfecto. Su demostración es elemental pero no sencilla; '
            'emplea la estrechamente relacionada sucesión de Lucas y argumentos de '
            'divisibilidad. El doce se sitúa así en una intersección probada y '
            'única de dos sucesiones numéricas fundamentales: una peculiaridad, no '
            'misticismo.\n\n'
            'Un teorema aún más fuerte de 2006 (Bugeaud, Mignotte y Siksek) va '
            'más lejos: las únicas potencias perfectas en toda la sucesión de '
            'Fibonacci son 0, 1, 8 = 2³ y 144 = 12². El enunciado de Cohn sobre '
            'los cuadrados es el caso particular de ese resultado.',
      ),
      ProseSection(
        'La razón áurea',
        'Si se divide un número de Fibonacci entre su predecesor, estas razones '
            'se aproximan cada vez más a un número fijo: la razón áurea '
            'φ = (1+√5)/2 ≈ 1,618. Formalmente F(n+1)/F(n) → φ. Johannes Kepler '
            'observó esta aproximación ya en 1611. En base 12, φ ≈ 1,74BB677…; '
            'la calculadora incluye φ como constante en el campo ampliado.\n\n'
            'φ tiene una propiedad definitoria simple: φ² = φ + 1. Es el único '
            'número positivo cuyo cuadrado es exactamente 1 mayor que él mismo. '
            'Quien teclee φ² = en la calculadora obtiene exactamente φ + 1: la '
            'identidad se hace visible de inmediato.\n\n'
            'En la naturaleza φ aparece realmente donde hojas y semillas crecen '
            'desplazadas por el «ángulo áureo»; los números de espirales de '
            'girasoles o piñas son entonces a menudo números de Fibonacci '
            'consecutivos. Mucho de lo que se atribuye a φ no resiste el examen: '
            'la espiral del nautilo no sigue φ, y un uso consciente en el '
            'Partenón o en da Vinci no está documentado. φ es real en la '
            'matemática y en la filotaxis; no en todas partes.',
      ),
      ProseSection(
        'El doce como número altamente compuesto',
        'La teoría de números conoce varias maneras precisas de describir un '
            'número como «rico en divisores», y el doce aparece en algunas de '
            'ellas. El doce es altamente compuesto: tiene más divisores que '
            'cualquier número menor. Sus divisores son 1, 2, 3, 4, 6, 12: seis '
            'en total; ningún número menor que 12 tiene tantos. Srinivasa '
            'Ramanujan estudió esta clase en 1915 en un famoso artículo en las '
            'Proceedings of the London Mathematical Society.\n\n'
            'El doce es además el número abundante más pequeño: la suma de sus '
            'divisores propios, 1+2+3+4+6 = 16, supera al número mismo. Con los '
            'números menores ocurre lo contrario: con 10, 1+2+5 = 8, menos que '
            '10. El doce es el primer número cuyos divisores «desbordan».\n\n'
            'Una propiedad más rara: el doce es un número sublime. Esto significa '
            'que dos indicadores de sus divisores son a su vez números perfectos. '
            'La cantidad de divisores es 6 (y 6 = 1+2+3 es perfecto). La suma de '
            'todos los divisores es 1+2+3+4+6+12 = 28 (y 28 = 1+2+4+7+14 también '
            'es perfecto). Hasta hoy solo se conocen dos números sublimes: el doce '
            'y un número de 76 cifras. El concepto procede, no obstante, de la '
            'matemática recreativa y está construido de forma estrecha; su rareza '
            'no es prueba de significado cósmico, sino consecuencia de una '
            'definición especial.',
      ),
      ProseSection(
        'Una pirámide de balas de cañón',
        'Si se apilan balas de cañón formando una pirámide de base cuadrada, la '
            'n-ésima pirámide contiene 1² + 2² + … + n² balas. Thomas Harriot '
            'dedujo esta fórmula de suma hacia 1587, cuando Sir Walter Raleigh '
            'quiso saber cómo contar balas apiladas.\n\n'
            'Una pregunta más difícil es: ¿cuándo es una pirámide así a la vez un '
            'cuadrado perfecto de balas? Solo existe un caso no trivial, y es '
            'hermoso: 1² + 2² + … + 24² = 4900 = 70². Las mismas 4900 balas '
            'pueden disponerse como una pirámide de 24 capas o como un cuadrado '
            'de 70×70. Édouard Lucas conjeturó en 1875 que esta es la única '
            'solución; no fue demostrado completamente hasta 1918 por G. N. Watson, '
            'pues el problema era verdaderamente difícil.\n\n'
            'El número 24 es justo el doble de 12. Es una observación bonita, pero '
            'honestamente no una razón probada: el 24 aparece aquí porque la '
            'ecuación subyacente tiene exactamente esa solución, no por una '
            'conexión con la base doce.',
      ),
      ProseSection(
        'La ciudad ideal de Platón',
        'En sus «Leyes» (libro V), Platón pregunta cuántos ciudadanos debe tener '
            'una ciudad ideal. Su respuesta: 5040. El argumento no es místico sino '
            'práctico: una ciudad debe poder dividir a sus ciudadanos en grupos '
            'iguales constantemente, y 5040 es divisible por todos los números '
            'del 1 al 12, con la única excepción del 11. (Para la divisibilidad '
            'por 11, Platón propone restar dos familias.)\n\n'
            'Lo que Platón describe aquí es la misma intuición que subyace al '
            'sistema docenal: en la vida cotidiana los divisores pequeños son los '
            'importantes. 5040 = 7! es en cierto modo la hermana mayor del doce: '
            'la misma filosofía de la divisibilidad, aplicada a toda una población '
            'urbana en lugar de a un sistema numérico.',
      ),
      ProseSection(
        'La curiosidad no es numerología',
        'El doce lleva muchas etiquetas a la vez: altamente compuesto, abundante, '
            'sublime, índice del único cuadrado de Fibonacci no trivial. Esta '
            'acumulación impresiona, pero cada propiedad es una definición propia '
            'e independiente. Que coincidan todas no es causa ni símbolo de algo '
            'superior. Lo que de verdad distingue al doce es su pequeñez: es el '
            'número más pequeño con estas propiedades; números mayores como 24, '
            '36 o 60 tienen incluso más divisores.\n\n'
            'Conviene señalar un error extendido: el doce se llama a menudo '
            '«número perfecto». Eso es matemáticamente falso. Perfecto significa '
            'que la suma de los divisores propios da el número mismo, como en el '
            '6 (1+2+3) o en el 28 (1+2+4+7+14). En el caso del doce, los '
            'divisores propios suman 16, es decir, más que 12. El doce es '
            'abundante, no perfecto. La confusión se remonta a Nicómaco de '
            'Gerasa (hacia el año 100 d. C.), quien asoció estas clases numéricas '
            'con valoraciones morales: una interpretación de la Antigüedad, no '
            'matemática.\n\n'
            'El valor de este capítulo reside precisamente en la distinción: el '
            'teorema de Cohn, la identidad de las balas de cañón y el número '
            'abundante más pequeño son hechos probados. Merecen verse por lo que '
            'son: matemática hermosa y honesta, que no necesita carga mística.',
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
    'El reloj como grupo (ℤ/12ℤ)',
    [
      ProseSection(
        'Calcular como en la esfera del reloj',
        'En el reloj, las once más dos horas no dan trece, sino la una. Se calcula '
            'normalmente y al final se toma el resto al dividir entre doce. '
            'Visualmente, la recta numérica infinita se enrolla sobre un círculo '
            'con doce marcas; cada número cae en una de las marcas del 0 al 11.\n\n'
            'Estas doce marcas con la suma de horas forman un pequeño sistema de '
            'cálculo bien definido. Siempre permanece cerrado sobre sí mismo (toda '
            'suma es de nuevo una de las doce marcas), existe el cero como «no '
            'cambia nada», y para cada paso hay un camino de vuelta: cinco adelante '
            'queda compensado por siete atrás, pues 5 + 7 = 12 = 0. Un sistema de '
            'cálculo con estas propiedades se llama en matemáticas un grupo. El '
            'reloj de horas es el ejemplo más intuitivo que existe; su nombre es '
            'ℤ/12ℤ, que se lee «Z módulo doce».',
      ),
      ProseSection(
        'Qué pasos alcanzan todas las posiciones',
        'Si se avanza de uno en uno alrededor del círculo, se alcanza '
            'sucesivamente cada una de las doce marcas antes de volver al inicio. '
            'Pero esto no funciona con cualquier longitud de paso. Si se salta '
            'siempre de tres en tres, se aterriza solo en 0, 3, 6, 9 y al cabo de '
            'cuatro saltos se está de vuelta — ocho posiciones quedan sin tocar. '
            'Si se salta de cuatro en cuatro, solo se alcanzan 0, 4, 8.\n\n'
            'Un paso alcanza las doce posiciones exactamente cuando no tiene ningún '
            'divisor común con el doce. Eso se cumple para cuatro pasos: 1, 5, 7 y '
            'B (= once). Exactamente cuatro — no es casualidad, sino una cantidad '
            'característica del doce que reaparece dos veces más. Estos cuatro son '
            'los pasos «buenos» que generan todo el círculo.',
      ),
      ProseSection(
        'Los subgrupos en la esfera del reloj',
        'Los pasos que solo alcanzan una parte de las marcas dibujan en la esfera '
            'figuras geométricas regulares. El paso de seis conecta el 0 y el 6 '
            'en una línea cruzando el centro. El paso de cuatro dibuja el triángulo '
            '0–4–8; el de tres, el cuadrado 0–3–6–9; el de dos, el hexágono de '
            'las horas pares. Cada una de estas figuras es a su vez un pequeño '
            'reloj cerrado sobre sí mismo — un subgrupo.\n\n'
            'Lo notable: a cada divisor del doce — 1, 2, 3, 4, 6, 12 — le '
            'corresponde exactamente una de esas figuras, ni más ni menos. El doce '
            'tiene más divisores que cualquier número menor, por eso su esfera '
            'alberga tantas figuras limpias. Un imaginario reloj de diez horas '
            'solo tendría los divisores 1, 2, 5, 10 — ningún triángulo, ningún '
            'cuadrado. La misma divisibilidad que distingue al doce como base de '
            'numeración hace también tan rica su esfera.',
      ),
      ProseSection(
        'El mismo reloj en la música',
        'Los doce semitonos de una octava forman el mismo círculo: tras doce pasos '
            'de semitono se regresa al tono inicial, una octava más arriba. '
            'Transportar una melodía a otra tonalidad significa girar todos los '
            'tonos el mismo número de pasos — suma en el círculo de tonos.\n\n'
            'El círculo de quintas, que los músicos aprenden de memoria, no es más '
            'que el paso de siete en ese círculo: una quinta justa son siete '
            'semitonos, y como el siete es uno de los cuatro pasos buenos, el '
            'círculo recorre los doce tonos antes de cerrarse. La cuarta (cinco '
            'semitonos) gira el mismo círculo en sentido inverso. Los pasos con '
            'divisor común, en cambio, quedan atrapados en una figura y producen '
            'exactamente los conocidos acordes simétricos: la tercera mayor el '
            'triángulo, el tritono la línea. Por qué precisamente doce semitonos '
            'y cómo suenan se trata en el capítulo sobre el doce en la música; '
            'aquí solo importa que es el mismo círculo.',
      ),
      ProseSection(
        'Y en los dígitos primos',
        'Un tercer lugar muestra el mismo cuarteto. Si se escriben los números '
            'primos en base doce, cada primo mayor que tres termina en uno de los '
            'dígitos 1, 5, 7 o B. Otros dígitos finales son imposibles: un número '
            'que termina en 0, 2, 4, 6, 8 o A es par; uno que termina en 3, 6, 9 '
            'es divisible entre tres. Quedan exactamente los cuatro dígitos que no '
            'comparten ningún divisor con el doce — de nuevo 1, 5, 7, B.\n\n'
            'Son los mismos cuatro que los pasos buenos y los intervalos que '
            'generan el círculo. Sin embargo, un dígito final de ese cuarteto es '
            'solo una condición necesaria, no una prueba: el 25 termina en base '
            'doce en 1, pero es cinco por cinco. El dígito excluye muchos números '
            'como primos, pero no corona ninguno.',
      ),
      ProseSection(
        'Sumar siempre, dividir no siempre',
        'En el reloj de horas también se puede multiplicar — y aquí termina la '
            'hermosa completitud. Al sumar, cada paso tiene un camino de vuelta; '
            'al multiplicar, no. No existe ninguna hora por la que se pueda '
            'multiplicar el dos para llegar exactamente al uno, porque el doble '
            'siempre es par. El dos no tiene inverso en el reloj de doce.\n\n'
            'Solo tienen inverso los cuatro números buenos 1, 5, 7, B — y cada '
            'uno es el suyo propio: cinco por cinco es 25, que es 1 en el reloj '
            'de doce; lo mismo con siete por siete y B por B. Si el reloj tuviera '
            'un número primo de horas, como once o trece, cada hora tendría un '
            'inverso. El doce es demasiado divisible para eso — la misma riqueza '
            'de divisores que adorna su esfera le quita la división limpia. Eso no '
            'es una deficiencia, sino la naturaleza de los números compuestos; un '
            'reloj de diez estaría igual.',
      ),
      ProseSection(
        'Módulo doce no es base doce',
        'Una última distinción importante que se confunde con facilidad. El reloj '
            'calcula «módulo doce» — conserva solo el resto al dividir entre doce. '
            'Eso es distinto de «base doce», la escritura de esta calculadora, en '
            'la que las posiciones representan unidades, docenas, gruesas, etc. '
            'Módulo indica en qué clase de resto cae un número; la base indica '
            'cómo se escribe.\n\n'
            'Ambas giran en torno al número doce, pero por la misma razón más '
            'profunda — sus muchos divisores —, no porque sean lo mismo. Cada día '
            'se calcula módulo doce en el reloj y sin embargo se escribe la hora '
            'en el sistema decimal. Este tipo de cálculo de restos lo introdujo '
            'Carl Friedrich Gauss en 1801 como notación propia; hoy está '
            'invisiblemente integrado en los dígitos de control de números de libro '
            'y de cuentas bancarias, y en toda fórmula para calcular el día de '
            'la semana.',
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
    '12! y los órdenes',
    [
      ProseSection(
        '¿Cuántos órdenes posibles?',
        '¿Cuántas posibilidades hay de colocar una docena de cosas en fila — '
            'doce invitados alrededor de una mesa, los doce meses en una lista, '
            'doce libros en una estantería? Para la primera posición hay doce '
            'candidatos, para la segunda quedan once, luego diez, y así hasta '
            'la última, para la que solo queda uno. Se multiplican todas las '
            'posibilidades: 12 · 11 · 10 · … · 2 · 1.\n\n'
            'Este producto de todos los números del 1 al doce se escribe abreviado '
            '«12!» y se llama factorial de doce. En general, n! es el producto de '
            'todos los números del 1 al n y cuenta los órdenes posibles de n cosas. '
            'Una curiosidad al margen: 0! se define como 1 — existe exactamente '
            'una forma de ordenar nada, la vacía.',
      ),
      ProseSection(
        'El número 12!',
        'Calculado, 12! = 479001600 en el sistema decimal — casi quinientos '
            'millones de órdenes posibles para solo doce cosas. En base doce ese '
            'mismo número se escribe como 114500000, con cinco ceros al final. '
            'Estos ceros son terreno familiar del doce: como 12! contiene los '
            'factores dos y tres tantas veces, y cada uno de estos ceros finales '
            'separa exactamente un doce, cinco de ellos salen exactos. En el '
            'sistema decimal, 12! solo termina en dos ceros.\n\n'
            'Qué grande es medio millardo de órdenes? Si se mostrara una nueva '
            'cada segundo, se tardaría más de quince años en agotarlas. Si la '
            'docena se sienta en cambio alrededor de una mesa redonda, donde solo '
            'importa quién está al lado y no el asiento de partida, la cifra se '
            'reduce al factorial de once — casi cuarenta millones. La calculadora '
            'puede responder: la tecla de factorial devuelve 12! al instante en '
            'base doce.',
      ),
      ProseSection(
        'Selección con y sin orden',
        'A menudo no se quiere ordenar los doce, sino solo elegir algunos — y '
            'entonces importa si el orden cuenta. Tres corredores en el podio '
            '(oro, plata, bronce) de entre doce: 12 · 11 · 10 = 1320 posibilidades '
            'ordenadas. El orden importa aquí, pues el primero y el segundo no son '
            'lo mismo.\n\n'
            'Si en cambio se elige un grupo de seis entre doce sin clasificación '
            '— por ejemplo seis voluntarios —, hay 924 posibilidades; dos de doce '
            'como pareja son 66. Ambos conteos se apoyan en el factorial. En el '
            'lenguaje cotidiano se confunden con facilidad: una «combinación de '
            'una cerradura» exige en realidad un orden determinado — debería '
            'llamarse «permutación de una cerradura».',
      ),
      ProseSection(
        'Campanas que repican todos los órdenes',
        'En los campanarios ingleses existe un arte antiguo que hace exactamente '
            'esto: el repique por cambios. En lugar de melodías, los campaneros '
            'repican sus campanas en órdenes siempre nuevos, cada orden exactamente '
            'una vez. En cada cambio, cada campana solo puede desplazarse una '
            'posición — una realización física de la transposición de elementos '
            'adyacentes, que los campaneros dominaban ya hacia 1621, mucho antes '
            'de que los matemáticos describieran el mismo truco.\n\n'
            'Para cada número de campanas existe un nombre; doce campanas se llaman '
            'Maximus. Repicar todos los órdenes de doce campanas significaría '
            'recorrer 12! = unos 479 millones de cambios — a dos segundos por '
            'cambio, serían décadas de repique ininterrumpido. Nadie lo ha logrado '
            'jamás y se considera imposible; las piezas más largas realmente '
            'repicadas con doce campanas alcanzan solo unas decenas de miles de '
            'cambios. Una extensión completa solo se ha repicado con ocho campanas: '
            '40320 cambios, casi dieciocho horas, en 1963 en Loughborough.',
      ),
      ProseSection(
        'Del número a un grupo',
        'Si se reúnen las 12! reordenaciones de una docena y se entiende «primero '
            'una, luego la otra» como regla de cálculo, surge de nuevo un grupo — '
            'el grupo completo de reordenaciones de doce cosas. A diferencia del '
            'reloj de horas, aquí importa el orden de los pasos: primero '
            'intercambiar y luego desplazar da un resultado distinto que a la '
            'inversa. Este grupo es enorme y no conmutativo.\n\n'
            'En él se esconde un último asombro. Entre los casi quinientos millones '
            'de reordenaciones hay una minúscula selección de solo 95040 que hace '
            'algo casi increíble: dada la asignación de cinco puntos cualesquiera '
            'de los doce a cinco destinos cualesquiera, existe entre esas 95040 '
            'reordenaciones exactamente una que lo realiza. Que algo así sea '
            'posible precisamente con doce puntos pertenece a las apariciones más '
            'raras de las matemáticas — y es el tema del siguiente capítulo.',
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
    'El grupo de Mathieu M₁₂',
    [
      ProseSection(
        'Una selección entre casi quinientos millones',
        'El capítulo anterior terminó con una promesa: entre los casi '
            'quinientos millones de reordenaciones de una docena hay una '
            'minúscula selección de exactamente 95040 que puede hacer algo '
            'casi increíble. Elige cinco de los doce puntos e indica adónde '
            'debe ir cada uno — entonces entre esas 95040 reordenaciones hay '
            'exactamente una que lo hace. No dos, no ninguna: exactamente una.\n\n'
            'De esa única propiedad se deduce ya el total. Para el destino del '
            'primer punto hay doce opciones, para el segundo once, luego diez, '
            'nueve, ocho — y con eso el resto queda determinado. Doce por once '
            'por diez por nueve por ocho da 95040. Esta rara colección de '
            'reordenaciones lleva un nombre: el grupo de Mathieu M₁₂.',
      ),
      ProseSection(
        'El sistema de Steiner S(5,6,12)',
        '¿Qué mantiene inamovible ese conjunto de 95040 reordenaciones? Una '
            'figura combinatoria delicada. Entre doce puntos pueden elegirse '
            'ciertos grupos de seis de tal forma que cualquier selección de '
            'cinco puntos esté contenida en exactamente uno de esos grupos. '
            'Existen exactamente 132 de esos grupos de seis, y este '
            'arreglo es el único posible salvo renombrar los puntos.\n\n'
            'Esta estructura finamente equilibrada se llama el sistema de Steiner '
            'S(5,6,12). El grupo de Mathieu es exactamente el conjunto de '
            'reordenaciones que envía cada uno de los 132 grupos de seis a otro '
            'grupo de seis — las simetrías de esa figura. Los dos números, 132 '
            'grupos de seis y 95040 simetrías, se escriben en base doce, por '
            'cierto, como B0 y 47000.',
      ),
      ProseSection(
        'Por qué precisamente el doce',
        'Lo verdaderamente asombroso no es que M₁₂ sea tan regular, sino cuán '
            'rara es esa regularidad en general. Camille Jordan demostró en 1872: '
            'dejando de lado los casos ordinarios y evidentes, un conjunto de '
            'reordenaciones que puede colocar cinco puntos libremente de exactamente '
            'una manera solo es posible con una única cantidad de puntos — doce. '
            'La cosa correspondiente para cuatro puntos existe como excepción solo '
            'con once puntos.\n\n'
            'Precisamente con once y doce puntos — y en ningún otro sitio más allá '
            'de los casos ordinarios — existen estas simetrías extraordinariamente '
            'perfectas. El doce es así uno de solo un puñado de números que pueden '
            'albergar algo así. Es un resultado matemático claro, no misticismo '
            'numérico — pero una razón para el asombro.',
      ),
      ProseSection(
        'La primera de su clase',
        'Los grupos finitos tienen bloques constructivos que no pueden descomponerse '
            'más — los grupos simples, los átomos de la teoría de grupos. «Simple» '
            'significa aquí indescomponible, no sencillo. La mayoría de esos átomos '
            'pertenece a unas pocas familias infinitas; junto a ellas hay exactamente '
            'veintiséis solitarios: los grupos esporádicos. M₁₂ es uno de ellos.\n\n'
            'Émile Mathieu describió M₁₂ ya en 1861 — fue el primer grupo esporádico '
            'descubierto jamás, casi cien años antes que los demás. Su existencia '
            'estuvo durante mucho tiempo en disputa; algunos especialistas la '
            'pusieron en duda, y no fue hasta 1938 cuando Ernst Witt la situó sobre '
            'base firme. La serie de grupos esporádicos que comenzó con M₁₂ termina '
            'con el fabulosamente grande «Monstruo», y su catalogación completa es '
            'una de las mayores obras colectivas de las matemáticas.',
      ),
      ProseSection(
        'Para tocar: cartas y un juego',
        'Por abstracto que parezca, existen accesos tangibles. Según fuentes '
            'citadas, si se barajan doce cartas de dos maneras determinadas, siempre '
            'las mismas, una y otra vez, se generan exactamente las reordenaciones '
            'del grupo de Mathieu. Y el matemático John Conway inventó un '
            '«blackjack matemático» con los doce números del cero al B, cuya '
            'estrategia ganadora se basa directamente en los 132 grupos de seis.\n\n'
            'Siendo honestos: este capítulo apenas tiene una tecla en la calculadora '
            'que le corresponda — es pura belleza teórica, no una herramienta. Pero '
            'a veces eso es precisamente el atractivo: que el propio doce, que marca '
            'el ritmo de esta calculadora, sea uno de los pocos números en los que '
            'las matemáticas han escondido una simetría tan rara y perfecta.',
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
    'El dodecágono',
    [
      ProseSection(
        'Qué es un dodecágono regular',
        'Un dodecágono regular (del griego dōdeka = doce, gōnía = ángulo) es un '
            'polígono con doce lados iguales y doce ángulos interiores iguales. '
            'Los doce vértices se distribuyen uniformemente sobre un círculo, la '
            'circunferencia circunscrita, separados 30° entre sí.\n\n'
            'Cada ángulo interior mide exactamente 150°. Esto se deduce de una '
            'consideración simple: al recorrer la figura completa, uno gira un '
            'total de 360° en los doce vértices, es decir, 30° por vértice. Este '
            'ángulo exterior y el interior suman 180°, por lo que resta '
            '180° − 30° = 150°. En el sistema docenal, 150° se escribe como 106°, '
            'y el ángulo exterior 30° como 26°. Todos los ángulos que aparecen en '
            'el dodecágono son múltiplos de 15°, que en docenal es 13°.\n\n'
            'El dodecágono pertenece a las figuras que pueden trazarse exactamente '
            'con compás y regla. El proceso es breve: trazar un círculo, dividirlo '
            'en seis partes iguales (esto se logra solo con el compás, porque en '
            'el hexágono el lado es igual al radio), y luego bisectar cada uno de '
            'los seis arcos: resultan doce puntos equidistantes. Que esto sea '
            'posible no es casualidad: un polígono regular de n lados es '
            'construible si y solo si n se compone de una potencia de dos y '
            'distintos números primos de Fermat (teorema de Gauss y Wantzel). '
            'Para 12 = 2² × 3 se cumple, porque 3 es uno de esos primos.',
      ),
      ProseSection(
        'Tres polígonos comparten los vértices',
        'Lo notable del dodecágono es menos su forma que lo que contiene. Si se '
            'unen solo cada dos vértices, resulta un hexágono regular. Cada tercer '
            'vértice da un cuadrado, y cada cuarto vértice un triángulo equilátero: '
            'los tres exactos, no aproximados, y todos en la misma circunferencia '
            'circunscrita que el dodecágono.\n\n'
            'Detrás hay una regla general: un polígono regular de m lados encaja '
            'con los mismos vértices en un polígono de n lados si y solo si m '
            'divide a n; entonces se unen cada (n/m)-ésimo vértice. El hexágono, '
            'el cuadrado y el triángulo están en el dodecágono porque 12 es '
            'divisible entre 6, 4 y 3. Y 12 es el número más pequeño divisible a '
            'la vez entre 3, 4 y 6: su mínimo común múltiplo. Por eso el '
            'dodecágono es el polígono regular más pequeño que contiene '
            'conjuntamente esas tres figuras básicas; un pentágono, un octógono '
            'o un decágono no pueden hacerlo.\n\n'
            'Es exactamente la misma divisibilidad que hace tan cómodo el sistema '
            'docenal. Que el 12 sea divisible entre 2, 3, 4 y 6 hace que '
            'geométricamente los tres polígonos coincidan en el dodecágono, y '
            'aritméticamente convierte la mitad, un tercio, un cuarto y un sexto '
            'en fracciones dozenales cortas y exactas. La forma y el cálculo '
            'fraccionario tienen la misma raíz.',
      ),
      ProseSection(
        'Cincuenta y cuatro diagonales, seis longitudes',
        'Una diagonal une dos vértices no adyacentes. La fórmula n(n−3)/2 da '
            'para el dodecágono 12 × 9 / 2 = 54 diagonales. Parece mucho, pero '
            'está estrictamente ordenado: como el dodecágono es tan simétrico, '
            'todas las diagonales que saltan el mismo número de vértices son '
            'iguales. Hay cinco longitudes de salto más el diámetro: solo seis '
            'longitudes distintas en total. Con lado de longitud 1:\n\n'
            'd₂ salta un vértice y mide √(2+√3) ≈ 1,932. d₃ salta dos vértices, '
            '1+√3 ≈ 2,732. d₄ salta tres vértices, (3√2+√6)/2 ≈ 3,346. d₅ salta '
            'cuatro vértices, 2+√3 ≈ 3,732. d₆ une vértices opuestos: es el '
            'diámetro, √6+√2 ≈ 3,864.\n\n'
            'En estos valores se esconden patrones limpios. La quinta y la tercera '
            'diagonal difieren exactamente en la longitud del lado: '
            '(2+√3) − (1+√3) = 1. Y el diámetro es exactamente el doble de la '
            'diagonal más corta, d₆ = 2 · d₂: la misma relación 2:1 que la '
            'octava en música. Todos los ángulos entre las diagonales son a su vez '
            'múltiplos de 15°, pues los doce vértices dividen el círculo completo '
            'en pasos de 30°.',
      ),
      ProseSection(
        'El área y el «tres redondo»',
        'Para hallar el área se descompone el dodecágono desde el centro en doce '
            'triángulos iguales y estrechos. Cada uno tiene dos lados de longitud '
            'R (el radio circunscrito, la distancia del centro a un vértice) y un '
            'ángulo de 30° en el vértice. Al sumar los doce triángulos emerge algo '
            'hermoso:\n\n'
            'A = 3 · R².\n\n'
            'El factor es un tres exacto y entero, sin raíces. Esto es posible '
            'porque en el cálculo aparece sen(30°) = un medio, y 30° es '
            'precisamente el ángulo en el vértice del dodecágono. Entre los '
            'polígonos construibles con compás y regla, es el único mayor en el '
            'que la fórmula del área resulta tan limpia; en el hexágono, por '
            'ejemplo, queda una raíz. Si se prefiere trabajar con el lado s, el '
            'área es A = 3(2+√3)·s² ≈ 11,196·s².\n\n'
            'Si se pone el área en relación con la circunferencia circunscrita, '
            'cuya área es π·R², se cancela R² y queda exactamente 3/π ≈ 0,9549. '
            'El dodecágono rellena su círculo circunscrito en un 95,5 %: mucho '
            'más que un hexágono (unos 83 %), un cuadrado (unos 64 %) o un '
            'triángulo (unos 41 %). En lugar del irracional π aparece el tres '
            'redondo: con R = 1 el área del dodecágono es exactamente 3, justo '
            'por debajo de π ≈ 3,1416.\n\n'
            'Esta proximidad ya la aprovechó Arquímedes. Aproximó π mediante '
            'polígonos, comenzó por el fácilmente trazable hexágono y fue '
            'doblando el número de lados: 6, 12, 24, 48, 96. El dodecágono fue '
            'su primer paso. El 96-ágono, que en docenal es 12 × 8, ya ocupa el '
            '99,93 % del círculo y le dio 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Dónde aparece el dodecágono como forma',
        'Las doce marcas horarias de un reloj analógico forman un dodecágono '
            'regular: doce puntos separados 30° sobre el círculo. Que el círculo '
            'completo mida 360° = 12 × 30° y el día tenga dos veces doce horas es '
            'la misma cuadrícula de 30° que emplean también las rosas de los '
            'vientos para doce direcciones.\n\n'
            'Varios países acuñaron monedas de doce lados, sobre todo para que '
            'pudieran distinguirse de las monedas redondas al tacto. El «penique '
            'de tres» de latón británico (desde 1937) fue la primera moneda de '
            'circulación no redonda en Gran Bretaña; la moneda de libra de doce '
            'lados (desde 2017) se introdujo contra las falsificaciones y fue '
            'diseñada conscientemente según ese modelo. A diferencia de lo que '
            'a veces se afirma, estas monedas no tienen anchura constante: esa '
            'propiedad la tienen las monedas británicas heptagonales de 20 y 50 '
            'peniques, que no son dodecágonos.\n\n'
            'El dodecágono no pavimenta el plano por sí solo: 150° no se '
            'distribuye exactamente en 360°. Pero sí junto con otros polígonos, '
            'por ejemplo con triángulos o con cuadrados y hexágonos, cuyos '
            'ángulos se complementan hasta 360° en cada vértice. Tales patrones '
            'duodecimales constituyen una base del arte ornamental de la geometría '
            'islámica. Cómo ha llegado el doce más allá a la arquitectura y al '
            'arte lo trata el capítulo «El doce en la construcción».',
      ),
      ProseSection(
        'Geometría, no misticismo numérico',
        'Las propiedades del dodecágono son hechos matemáticos reales, no '
            'secretos. Que el área guarde la relación 3/π con la circunferencia '
            'circunscrita se deduce necesariamente de sen(30°) = un medio; solo '
            'muestra que el dodecágono aproxima bien el círculo, y no establece '
            'ninguna conexión secreta entre el tres y π. Del mismo modo, el tres '
            'limpio en «área = 3·R²» es consecuencia del ángulo en el vértice, '
            'no un milagro.\n\n'
            'También el enunciado «A = 3·R²» exige la lectura correcta: el tres '
            'exacto vale para el radio circunscrito. Con lado de longitud 1 el '
            'área es unos 11,2, no 3. Y en las diagonales conviene ser preciso: '
            'la cuarta es (3√2+√6)/2 ≈ 3,346, una expresión irracional no más '
            'simple; en algunas fuentes circulan valores incorrectos.\n\n'
            'Por último, la facilidad de construcción solo dice que la figura '
            'surge con herramientas sencillas. Explica bien por qué los '
            'dodecágonos son tan frecuentes en la artesanía, en monedas y en el '
            'ornamento. Pero por qué el reloj tiene doce horas es una cuestión '
            'de tradición, no de geometría. El dodecágono es una hermosa '
            'herramienta geométrica, y nada más debería atribuírsele.',
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
    'Teselaciones arquimedianas',
    [
      ProseSection(
        'El dodecágono no cubre el plano solo',
        'Un dodecágono regular es una figura hermosa y redonda — pero no puede '
            'cubrir un suelo por sí solo sin dejar huecos. La razón es su ángulo '
            'interior de 150 grados. Alrededor de un vértice, las figuras '
            'adyacentes deben completar exactamente 360 grados, pero 360 dividido '
            'entre 150 da dos coma cuatro — no es un número entero. Dos dodecágonos '
            'dejan un hueco en un vértice; tres se solapan.\n\n'
            'El dodecágono necesita, pues, compañeros. Si se colocan las figuras '
            'adecuadas en los huecos, surgen patrones sin fisuras y muy regulares: '
            'las teselaciones arquimedianas. Así se llaman los embaldosados del '
            'plano formados únicamente por polígonos regulares que tienen el mismo '
            'aspecto en cada vértice. En total solo existen once de esos patrones.',
      ),
      ProseSection(
        'Dos patrones con dodecágono',
        'De esos once patrones, exactamente dos contienen un dodecágono regular. '
            'En el primero, pequeños triángulos equiláteros rellenan los huecos '
            'entre los dodecágonos — en cada vértice se encuentran un triángulo '
            'y dos dodecágonos, y sus ángulos suman 60 más 150 más 150, es decir, '
            'exactamente 360 grados.\n\n'
            'El segundo es el más rico y el que aparece en la ilustración: alrededor '
            'de cada dodecágono se dispone una corona de cuadrados y hexágonos '
            'alternados. En cada vértice se encuentran un cuadrado, un hexágono y '
            'un dodecágono — 90 más 120 más 150 grados, de nuevo exactamente 360. '
            'Como la suma es exacta, la corona cierra sin ningún hueco y el patrón '
            'se extiende en todas direcciones.',
      ),
      ProseSection(
        'Por qué solo caben tres, cuatro y seis',
        'Junto a un dodecágono solo encajan tres tipos de vecinos: triángulos, '
            'cuadrados y hexágonos. No es casualidad. Sus ángulos interiores son '
            '60, 90 y 120 grados — que son exactamente 360 dividido entre seis, '
            'entre cuatro y entre tres. Es decir, aparecen precisamente los '
            'divisores tres, cuatro y seis del doce.\n\n'
            'Esos mismos tres divisores son los que en base doce hacen que las '
            'fracciones un tercio, un cuarto y un sexto salgan exactas. El hermoso '
            'embaldosado y la fracción cómoda brotan de la misma raíz: la rica '
            'divisibilidad del doce. Es un parentesco genuino, pero no una '
            'obligación — los ángulos vienen de la geometría, las fracciones exactas '
            'de la escritura; ambos solo dependen del mismo número.',
      ),
      ProseSection(
        'Kepler, mezquitas y cristales',
        'El primero en enumerar completamente estos patrones fue Johannes Kepler '
            'en 1619, en una obra sobre la armonía del mundo. El nombre '
            '«arquimediano» es solo una alusión a los cuerpos arquimedianos; no '
            'se conserva ningún escrito antiguo en el que el propio Arquímedes '
            'tratara teselaciones.\n\n'
            'Mucho antes de Kepler, sin embargo, el dodecágono ya vivía en el arte: '
            'las estrellas de doce puntas pertenecen a los motivos más espléndidos '
            'de la ornamentación geométrica islámica, construidas con compás y '
            'regla a partir de pura geometría — ya en la mezquita de Konya '
            '(1220). Y en la naturaleza reaparece el mismo orden duodecimal en '
            'los cuasicristales, de los que trata un capítulo propio. El dodecágono, '
            'que solo no cubre ningún suelo, es en compañía una de las formas '
            'más fecundas del plano.',
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
    'El dodecaedro',
    [
      ProseSection(
        'Doce pentágonos en el espacio',
        'El dodecaedro (del griego dōdeka = doce, hédra = cara) es un sólido '
            'formado por doce pentágonos regulares e iguales. Todas las caras son '
            'idénticas, todas las aristas tienen la misma longitud, y en cada '
            'vértice se juntan exactamente tres pentágonos. En total: doce caras, '
            'treinta aristas y veinte vértices.\n\n'
            'Es uno de los cinco sólidos platónicos: los sólidos convexos cuyas '
            'caras están formadas exclusivamente por polígonos regulares iguales '
            'y en cuyos vértices se juntan siempre el mismo número de caras. Los '
            'otros cuatro son el tetraedro (cuatro triángulos), el cubo (seis '
            'cuadrados), el octaedro (ocho triángulos) y el icosaedro (veinte '
            'triángulos). Entre estos cinco, el dodecaedro es el único con caras '
            'pentagonales.\n\n'
            'En notación abreviada el dodecaedro se escribe {5, 3}: pentágonos '
            'como caras, tres de ellos en cada vértice. El ángulo diedro entre '
            'dos caras adyacentes es de unos 116,57° (en decimal). Para comparar: '
            'en el cubo es de 90°.',
      ),
      ProseSection(
        'Por qué existen exactamente cinco',
        'Que solo puedan existir cinco sólidos de ese tipo —ni más ni menos— es '
            'un resultado demostrado. Hay dos caminos para llegar a él, y ambos '
            'conducen al mismo resultado.\n\n'
            'El primer camino es un sencillo conteo: la fórmula de Euler para '
            'poliedros. Para todo sólido convexo se cumple: vértices menos '
            'aristas más caras igual a dos. En el dodecaedro: 20 − 30 + 12 = 2. '
            'Leonhard Euler estableció esta relación hacia 1750; la primera '
            'demostración sin lagunas la dio Cauchy en 1811. La fórmula vale para '
            'todo sólido convexo sin agujeros, para cualquier pirámide o prisma. '
            'Si se combina con la exigencia de que las caras sean polígonos '
            'regulares iguales, quedan exactamente cinco soluciones.\n\n'
            'El segundo camino es más intuitivo y examina un solo vértice. El '
            'ángulo interior de un pentágono regular es 108°. Si en un vértice '
            'se juntan tres pentágonos, sus ángulos suman 324°. Los 36° que '
            'faltan para el círculo completo son exactamente el hueco que se '
            'dobla hacia el espacio: así se forma un vértice del dodecaedro. '
            'Cuatro pentágonos ya darían 432° y no cabrían en un vértice. Por '
            'eso tres pentágonos son la única posibilidad, y el dodecaedro el '
            'único sólido con caras pentagonales.',
      ),
      ProseSection(
        'La razón áurea en el pentágono y en el sólido',
        'Cada cara del dodecaedro es un pentágono regular, y el pentágono es el '
            'lugar plano más simple donde la razón áurea φ = (1+√5)/2 ≈ 1,618 '
            'aparece como proporción de segmentos. La diagonal de un pentágono '
            'regular mide exactamente φ veces su lado. Quien teclee φ² = en la '
            'calculadora obtiene φ+1: esa es la ecuación definitoria de la razón '
            'áurea.\n\n'
            'Como cada cara lleva esa proporción, φ recorre todo el sólido. Si '
            'se coloca el dodecaedro en un sistema de coordenadas, φ aparece '
            'literalmente en los números de sus veinte vértices. Ocho de esos '
            'vértices forman por sí mismos un cubo; en total pueden inscribirse '
            'cinco cubos distintos en el dodecaedro. Otros vértices definen tres '
            'rectángulos áureos, rectángulos con proporción de lados φ a uno, '
            'perpendiculares entre sí dos a dos.\n\n'
            'φ aparece aquí no por magia, sino por necesidad: donde hay '
            'pentágonos regulares, está φ. Las interpretaciones más amplias de '
            'la razón áurea como «proporción divina» son atribuciones humanas, '
            'no una propiedad de la geometría en sí.',
      ),
      ProseSection(
        'Dualidad y la simetría más rica',
        'A cada sólido platónico le corresponde un sólido dual: se coloca un '
            'nuevo vértice en el centro de cada cara y se unen los vértices de '
            'caras adyacentes. En el dodecaedro así surge el icosaedro, y '
            'viceversa. Caras y vértices intercambian sus roles: el dodecaedro '
            'tiene 12 caras y 20 vértices; el icosaedro, 20 caras y 12 vértices. '
            'El número de aristas, 30, es el mismo en ambos. El doce aparece en '
            'los dos: una vez como número de caras, otra como número de vértices.\n\n'
            'Como ambos comparten la misma estructura, tienen también la misma '
            'simetría, la más rica entre todos los sólidos platónicos: 120 '
            'simetrías, es decir, 60 rotaciones y 60 rotaciones con reflexión. '
            'El cubo solo tiene 48; el tetraedro, 24. Las 60 rotaciones se '
            'distribuyen entre seis ejes de orden cinco (por los centros de caras '
            'opuestas), diez ejes de orden tres (por vértices opuestos) y quince '
            'ejes de orden dos (por los centros de aristas opuestas).\n\n'
            'El número 120 puede escribirse como 5! (5 × 4 × 3 × 2 × 1) y '
            'descomponerse en los factores primos 2, 3 y 5: los mismos tres '
            'números que reaparecen en los ejes y en la forma pentagonal de las '
            'caras. Estos ejes de orden cinco son también la razón por la que '
            'ningún cristal ordinario puede formar un dodecaedro verdadero: una '
            'red periódica no admite simetría de orden cinco (véase el capítulo '
            'sobre la pirita).',
      ),
      ProseSection(
        'El doce de Euler: por qué siempre doce pentágonos',
        'Un último resultado conecta el dodecaedro con cosas que a primera vista '
            'nada tienen que ver con él. La pregunta es: ¿puede construirse una '
            'cubierta cerrada y esférica solo con hexágonos regulares? La '
            'respuesta es no. Los hexágonos puros forman una superficie plana; '
            'para curvarla hasta cerrar una esfera, deben insertarse exactamente '
            'doce pentágonos, sin importar cuántos hexágonos más se usen.\n\n'
            'Esto se deduce de nuevo del teorema de Euler. Con cero hexágonos '
            'surge el dodecaedro regular. Con doce pentágonos y veinte hexágonos '
            'surge el clásico balón de fútbol; y justo aquí hay un error frecuente: '
            'el balón de fútbol no es un dodecaedro. Es un icosaedro truncado con '
            '32 caras: doce pentágonos más veinte hexágonos. Ambos comparten '
            'solo los doce pentágonos; el dodecaedro, en cambio, no tiene ningún '
            'hexágono.\n\n'
            'El dodecaedro regular es así el caso más puro de esta '
            'duodecimalidad: doce pentágonos y nada más.',
      ),
      ProseSection(
        'Cubo, dodecágono y piritoedro: lo que no es',
        'En los juegos de rol el dodecaedro es conocido como D12, el dado de '
            'doce caras. Porque de los cinco sólidos se acerca más a una esfera, '
            'rueda con suavidad y se detiene de forma fiable sobre una cara; sus '
            'doce caras iguales lo hacen justo.\n\n'
            'Vale la pena aclarar tres confusiones habituales. Primera: el '
            'dodecágono no es el dodecaedro. Ambas palabras llevan «dodeca-» '
            '(doce), pero el dodecágono es un polígono plano de doce lados y el '
            'dodecaedro un sólido tridimensional de doce caras. Segunda: el '
            'piritoedro del mineral pirita también tiene doce caras pentagonales, '
            'pero no es un dodecaedro regular: sus pentágonos están deformados y '
            'carece de verdadera simetría de orden cinco (véase el capítulo sobre '
            'la pirita). Tercera: Platón asignó el dodecaedro al cosmos en su '
            'conjunto; es una antigua interpretación filosófica, no un resultado '
            'matemático. La geometría del sólido se sostiene por sí misma, con '
            'independencia del significado que los seres humanos le hayan dado.',
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
