part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersEs() => const [
  ProseChapter(
    '¿Qué es el sistema docenal?',
    [
      ProseSection(
        'Qué es una base',
        'En un sistema posicional, el valor de una cifra depende de su posición. '
            'En el número 347 el 3 representa trescientos, el 4 cuarenta y el 7 '
            'siete. Cada posición vale tantas veces más que su vecina de la derecha '
            'como indica la base. En el familiar sistema decimal la base es diez.\n\n'
            'El sistema docenal tiene la base doce. Las posiciones no son unidades, '
            'decenas y centenas, sino unidades, docenas y ciento cuarenta y cuatros. '
            'El número «100» aquí no significa cien, sino doce por doce, es decir, '
            '144 en decimal. Y «10» significa exactamente una docena.\n\n'
            'Lo importante: la cantidad en sí nunca cambia, solo la escritura. '
            'Quince manzanas siguen siendo quince manzanas, tanto si las escribimos '
            '«15» (decimal) como «13» (docenal). Un número no se hace ni mayor ni '
            'menor al cambiar de base.',
      ),
      ProseSection(
        'Por qué hacen falta dos cifras nuevas',
        'El sistema decimal se arregla con diez símbolos (del 0 al 9), porque '
            'con cada décima unidad comienza una nueva posición. El sistema docenal '
            'no avanza de posición hasta la duodécima unidad. Por eso necesita dos '
            'símbolos adicionales, para los valores diez y once, que en decimal ya '
            'ocupan dos posiciones.\n\n'
            'Esta calculadora los escribe como A (= diez) y B (= once). Importante: '
            'A y B no son letras ni comodines, sino cifras de pleno derecho, igual '
            'que el 7 o el 9, solo que para diez y once. La secuencia de contar es '
            'por tanto: 0, 1, 2, …, 9, A, B, 10, 11, …\n\n'
            'Esto resulta chocante para quien esté acostumbrado al álgebra. Allí '
            '«2B» significa el producto dos por B. Aquí no. «2B» es un número de '
            'dos cifras: un 2 en la posición de las docenas y una B en la posición '
            'de las unidades, es decir, dos docenas y once unidades, 35 en decimal. '
            'El producto dos por once, en cambio, sería 22, que en docenal es «1A», '
            'algo completamente distinto. Las cifras contiguas forman un número, no '
            'se multiplican. La calculadora lo sabe de antemano, porque A y B son '
            'para ella cifras fijas y no letras.\n\n'
            'Existen otras notaciones habituales, sobre todo las cifras giradas ↊ y '
            '↋, que Isaac Pitman propuso en 1857 y que desde 2015 tienen incluso su '
            'propio lugar en Unicode. No existe un único estándar internacionalmente '
            'aceptado.',
      ),
      ProseSection(
        'La ventaja: fracciones exactas',
        'El verdadero atractivo del doce es su divisibilidad. El doce se divide '
            'exactamente entre 2, 3, 4 y 6; el diez solo entre 2 y 5. Esto se '
            'aprecia mejor en el cálculo con fracciones. En base 10, un tercio '
            '(0,333…) y un sexto (0,1666…) son decimales infinitos y periódicos. '
            'En base 12 son cortos y exactos: un tercio es 0;4, un sexto es 0;2.\n\n'
            'Detrás hay una regla sencilla: la fracción 1/n termina en una base '
            'si y solo si el denominador n solo contiene factores primos de la '
            'base. El doce se compone de 2 y 3, así que todas las fracciones con '
            'denominadores formados por doses y treses son exactas.\n\n'
            'Pero esto no es una ganancia pura, sino un intercambio. Un quinto, '
            'que en base 10 es el exacto 0,2, se vuelve periódico en base 12 '
            '(0;2497…). También los décimos son periódicos. El intercambio vale la '
            'pena en la vida cotidiana, porque se divide entre tres y cuatro más '
            'frecuentemente que entre cinco; pero, para ser honestos, es un '
            'intercambio, no un milagro.',
      ),
      ProseSection(
        'Donde el doce ya vive desde hace mucho',
        'Mucho antes de que existiera ninguna teoría, el doce ya se había '
            'asentado en pesos, tiempos y comercio, precisamente por su buena '
            'divisibilidad. En el comercio se cuenta en docenas (12 unidades) y '
            'en gruesas (144 = 12² unidades); la palabra «docena» procede, a través '
            'del francés, del latín duodecim, «doce».\n\n'
            'La palabra latina uncia significaba «una doceava parte», tanto de un '
            'pie como de una libra. De ella proceden las palabras inglesas inch '
            '(pulgada) y ounce (onza): 12 pulgadas hacen un pie. El tiempo también '
            'está dividido por doce: dos veces doce horas al día, doce meses al año, '
            'y el círculo completo tiene 360 = 30 × 12 grados.\n\n'
            'Existe incluso una hipótesis sobre por qué precisamente el doce: con '
            'el pulgar se pueden contar las tres falanges de los otros cuatro dedos, '
            'lo que da 4 × 3 = 12. Esta forma de contar sigue en uso en partes de '
            'Asia hasta hoy. Es una explicación plausible del origen del conteo por '
            'docenas, pero no está probada; sigue siendo una hipótesis.',
      ),
      ProseSection(
        'El movimiento docenal',
        'Aprovechar conscientemente la ventaja del doce es una idea antigua que '
            'encontró una pequeña forma organizada en el siglo XX. En 1935 Frank '
            'Emerson Andrews escribió en EE. UU. el primer libro sobre el tema; en '
            '1944 se fundó la Dozenal Society of America y en 1959 la Dozenal '
            'Society of Great Britain. Ambas siguen publicando boletines hoy en '
            'día y emplean las cifras de Pitman.\n\n'
            'Estas sociedades no reclaman un cambio de sistema mundial. Entienden '
            'su labor como educación y exploración: quieren mostrar que la elección '
            'de la base numérica no es una necesidad natural, sino una costumbre. '
            'El matemático Alexander Craig Aitken abogó públicamente por el doce '
            'y consideró el sistema decimal notablemente menos eficiente: una '
            'estimación ilustrativa, no un valor medido.',
      ),
      ProseSection(
        'Por qué nunca se impuso',
        'Si la base 12 es con frecuencia más cómoda para calcular, ¿por qué '
            'cuenta todo el mundo en decimal? La respuesta no está en la '
            'matemática, sino en la costumbre. El sistema decimal lleva milenios '
            'arraigado, probablemente porque el ser humano tiene diez dedos. Es '
            'una razón anatómica, no matemática, pero está muy arraigada.\n\n'
            'Cuando el mundo unificó sus medidas en los siglos XVIII y XIX, '
            'el sistema métrico decimal se impuso; un cambio del sistema de '
            'numeración ya entonces se consideró inviable. Hoy los costes de una '
            'transición (nuevos libros de texto, dispositivos, software, el '
            'reaprendizaje de toda la población) equivaldrían a una reconstrucción '
            'total. Y los ordenadores calculan en binario de todos modos, donde la '
            'base 16 está más próxima que el doce.\n\n'
            'Los rastros del doce en el reloj, la cinta métrica y la docena no son '
            'por eso un llamamiento al cambio. Solo muestran que el doce nunca '
            'desapareció del todo, y hacen que calcular en él sea un viaje a un '
            'país numérico familiar y, sin embargo, extraño.',
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
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
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
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Doce falanges en la mano',
    [
      ProseSection(
        'El método: doce falanges, un pulgar',
        'Coloca una mano delante de ti y observa los cuatro dedos junto al '
            'pulgar. Cada uno de esos dedos tiene tres falanges, separadas por '
            'articulaciones visibles: una falange proximal, una media y una distal. '
            'Cuatro dedos por tres falanges dan doce: doce puntos contables en una '
            'sola mano.\n\n'
            'El pulgar sirve de puntero y no se cuenta a sí mismo. Va tocando '
            'sucesivamente cada una de las doce falanges y cuenta así del uno al '
            'doce. El orden más descrito comienza en la falange distal del meñique '
            'y avanza dedo a dedo hacia la palma. Existen variantes: algunos '
            'empiezan por el índice, otros cuentan de la punta hacia abajo. Solo '
            'la estructura básica es fija: un puntero, cuatro dedos, tres falanges '
            'cada uno, suma doce.\n\n'
            'Que sean exactamente tres falanges no es una elección cultural, sino '
            'anatomía: esta forma 2-3-3-3-3 (el pulgar solo tiene dos falanges) '
            'es común a todos los seres humanos y es una herencia antigua de la '
            'mano de los mamíferos. Las falanges surgieron para agarrar y trepar, '
            'no para contar, pero se prestan bien para ello.',
      ),
      ProseSection(
        'Del doce al sesenta',
        'Cuando el pulgar ha recorrido las doce falanges de la primera mano, se '
            'ha completado una vuelta entera. Ahora la segunda mano se encarga de '
            'llevar la cuenta: por cada docena completada extiende un dedo. Cinco '
            'dedos por doce falanges da sesenta. Con dos manos se puede contar en '
            'silencio y sin ningún material hasta 60.\n\n'
            'Esta relación 12 × 5 = 60 es la explicación más sencilla de por qué '
            'precisamente el sesenta desempeñó un papel tan importante en los '
            'sistemas mesopotámicos, y a través de ellos hasta hoy: 60 segundos '
            'por minuto, 60 minutos por hora, 360 = 6 × 60 grados en el círculo '
            'completo.\n\n'
            'Existe también otra convención en la que ambas manos cuentan falanges; '
            'entonces se llega a 12 × 12 = 144. Ambos métodos son válidos, pero no '
            'son el mismo sistema.',
      ),
      ProseSection(
        'Dónde se cuenta así',
        'Esta forma de contar no es un invento moderno. El historiador de las '
            'matemáticas Georges Ifrah la dio a conocer en su «Historia universal '
            'de los números» y la describió como aún en uso en una amplia franja '
            'que va desde Egipto, pasando por Siria, Turquía, Irak, Irán, '
            'Afganistán y Pakistán, hasta la India e Indochina.\n\n'
            'Conviene ser honesto sobre las fuentes: esta lista de países es la '
            'cita más repetida sobre el tema, pero procede casi por completo de '
            'esta única fuente. Los textos posteriores suelen remitirse de nuevo a '
            'Ifrah. Cuándo y cómo se observó exactamente no está registrado; '
            'falta un estudio sistemático más reciente.\n\n'
            'El caso mejor documentado es el de los chepang de Nepal. Los '
            'lingüistas Ross Caughley y Martine Mazaudon documentaron que los '
            'chepang cuentan la caza en docenas y van tocando las falanges; su '
            'palabra para doce, hale, remite a una raíz antigua que significa '
            '«base del conteo». Algunas lenguas del centro de Nigeria también '
            'tienen palabras numéricas en docenas. En ambos casos, sin embargo, '
            'en el día a día la gente calcula en decimal; los rastros del doce '
            'son más bien vestigios que un sistema vivo completo.',
      ),
      ProseSection(
        'La gran tesis y por qué permanece abierta',
        'Ifrah planteó la hipótesis de que el sistema docenal en general, y el '
            'sistema sexagesimal babilónico de base 60, habrían surgido de este '
            'conteo de falanges. La tesis tiene puntos fuertes: explica a la vez '
            'el doce y el sesenta, es anatómicamente plausible y señala una acción '
            'concreta en lugar de una mera coincidencia numérica.\n\n'
            'Aun así es una hipótesis, no historia establecida. El propio Ifrah '
            'califica expresamente su derivación de especulativa. Ningún texto '
            'antiguo, ninguna tablilla de arcilla ni ninguna imagen describe este '
            'método como origen del sistema babilónico. El método encaja con el '
            'origen, pero eso no es lo mismo que una prueba.\n\n'
            'El contraargumento más sólido lo aporta Egipto: según Ifrah, los '
            'egipcios también contaban con las falanges, y sin embargo desarrollaron '
            'un sistema numérico decimal. El método de los dedos por sí solo no '
            'impone ni el doce ni el sesenta.',
      ),
      ProseSection(
        'Otras explicaciones paralelas',
        'La tesis de las falanges no está sola. Para el origen del sesenta, '
            'entre los historiadores es incluso más aceptada otra hipótesis: que '
            'dos pueblos con bases de conteo distintas se encontraron en el '
            'comercio y acordaron el 60 como múltiplo común. Tampoco de esto '
            'existe evidencia histórica directa.\n\n'
            'Junto a eso hay una explicación astronómica (unos doce ciclos lunares '
            'caben aproximadamente en un año, de ahí doce meses y doce signos del '
            'zodíaco) y una aritmética (el doce y el sesenta tienen un número '
            'especialmente alto de divisores y por eso son prácticos). Estas '
            'razones explican bien por qué esos números se mantuvieron, pero no '
            'necesariamente por qué se recurrió a ellos en primer lugar.\n\n'
            'Probablemente actuaron varias fuerzas a la vez: la mano, el cielo, '
            'el comercio y la buena divisibilidad. Eso es precisamente lo que hace '
            'tan difícil aislar una única causa. Lo que queda es una conclusión '
            'honesta y hermosa: la mano humana ofrece una base natural para el '
            'doce; si fue eso lo que dio forma al sistema numérico es algo que no '
            'puede afirmarse con certeza.',
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
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
