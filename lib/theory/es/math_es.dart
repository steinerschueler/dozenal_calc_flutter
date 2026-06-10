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
