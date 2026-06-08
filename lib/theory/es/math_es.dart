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
  ProseChapter('Divisores, fracciones y periodos', [
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
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('Las bases numéricas en comparación', [
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
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('Una breve historia de los sistemas posicionales', [
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
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
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
];
