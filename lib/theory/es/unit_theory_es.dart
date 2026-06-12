// Prosa de teoría de unidades en español. part of ../unit_theory.dart.
// Los cuerpos de texto se mantienen en frases simples y cortas (más fáciles de
// traducir). Destilados de los dosieres de investigación en docs/research/.
// `count` no tiene entrada a propósito — la historia de la docena/del doce vive
// en los 12 capítulos didácticos de la aplicación.

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroEs() {
  return const [
    UnitTheorySection(
      'Qué puede hacer el conversor',
      'El conversor de unidades convierte entre el mundo imperial-dozenal '
          '(base doce) y el mundo métrico (base diez) — en todas las '
          'categorías: longitud, área, volumen, peso, tiempo, ángulo, '
          'moneda, temperatura y otras como presión, fuerza, energía, '
          'potencia, cocina y par de torsión.\n\n'
          'La llave { } muestra siempre el valor en el otro sistema. '
          'Varias unidades pueden combinarse en un único valor — por ejemplo '
          '1 ft 6 in o 2 h 30 min. = cicla las representaciones '
          'de unidades y el desglose escalonado; una pulsación larga sobre '
          'una unidad muestra una definición breve. Las cifras aparecen como '
          'glifos dozenales o como los ordinarios 0–9/A/B, según el ajuste '
          'de visualización.',
    ),
    UnitTheorySection(
      'Qué no puede hacer',
      'Es un conversor, no una calculadora científica: sin funciones como '
          'el seno o el logaritmo, sin aritmética libre con × y ÷, sin '
          'memoria y sin modo de ángulo. Para eso está la calculadora '
          'principal.\n\n'
          'La moneda (penique/chelín/libra) refleja la proporción histórica '
          'británica — doce peniques por chelín, veinte chelines por libra —, '
          'no los tipos de cambio actuales. Muestra la estructura dozenal del '
          'dinero antiguo, no valores monetarios de hoy. El conjunto de '
          'unidades es fijo.',
    ),
    UnitTheorySection(
      'Cómo se usa',
      'Toca una categoría (por ejemplo, longitud) — su escala de unidades '
          'se despliega en la columna opuesta. Toca una unidad, introduce '
          'cifras y combina varias unidades en un solo valor. La tecla '
          'DOZ/DEZ alterna entre el mundo imperial y el métrico; la llave '
          '{ } muestra el valor equivalente. = cicla las representaciones, '
          'una pulsación larga sobre una unidad muestra su significado, y '
          'un toque en la línea de entrada mueve el cursor.\n\n'
          'Un ejemplo — introducir 1 ft 6 in y leer el resultado en el otro mundo:',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryEs(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Apilar en docenas',
          'Se puede agrupar cantidades en decenas — o en docenas. Una docena son '
              'doce unidades, una gruesa son doce docenas (144), una gruesa grande '
              'son doce gruesas (1728). Es la misma escala que unidades, decenas, '
              'centenas y millares, solo que en base doce: docena = 12¹, gruesa = '
              '12², gruesa grande = 12³. Escritas en base doce salen como un limpio '
              '10, 100 y 1000 — así que la gruesa grande es el «millar dozenal».\n\n'
              'Por qué el doce se divide con tanta comodidad, y cómo se cuenta hasta '
              'doce en las tres falanges de los cuatro dedos, está explicado en '
              'Teoría → Fundamentos. Aquí nos ocupamos de las unidades de conteo '
              'en sí.',
        ),
        UnitTheorySection(
          'El origen de los nombres',
          '«Docena» viene a través del francés antiguo douzaine del latín '
              'duodecim, «dos-y-diez»; la palabra significa exactamente doce, no '
              'aproximadamente. El español docena es en sí mismo un cognado — '
              'también el italiano dozzina y el inglés dozen son parientes.\n\n'
              '«Gruesa» viene de la grosse douzaine, la «docena grande», y está '
              'documentada desde principios del siglo XV. En el comercio al por '
              'mayor se contaban y empaquetaban artículos pequeños — lápices, '
              'botones, agujas — por gruesas; algunas cajas de lápices aún llevan '
              'hoy la indicación «1 gross». La gruesa grande (1728) es la docena de '
              'gruesas — y casualmente también el número de pulgadas cúbicas en un '
              'pie cúbico (12 × 12 × 12). Los huevos se siguen vendiendo hoy por '
              'docenas.',
        ),
        UnitTheorySection(
          'La docena del panadero',
          'Una docena del panadero son trece — uno más que una docena corriente; '
              'el decimotercer pan se llama «vantage loaf». La explicación habitual '
              'apunta a la ley medieval inglesa del pan (Assize of Bread, siglo '
              'XIII): vender pan con peso insuficiente acarreaba sanciones, así que '
              'el panadero añadía un pan de más por precaución.\n\n'
              'Una reserva honesta viene al caso: esta derivación es plausible y '
              'muy repetida, pero no está documentada en los registros. Los '
              'testimonios escritos más antiguos del «baker’s dozen» inglés datan '
              'solo de finales del siglo XVI — mucho después de la ley.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Medidas tomadas del cuerpo',
          'Las medidas de longitud más antiguas provienen del cuerpo humano. El '
              'ancho del dedo se convirtió en la pulgada, el antebrazo en el codo, '
              'el pie en el pie, la envergadura de los brazos en la braza. Era '
              'práctico, pues cada uno llevaba su medida consigo. Pero era '
              'impreciso, pues ningún cuerpo es igual a otro.\n\n'
              'Los primeros estándares fijos surgieron en Mesopotamia y Egipto. En '
              'Egipto regía el codo real, de unos 52 centímetros. Era el antebrazo '
              'del faraón y se conservaba en piedra como medida patrón. Los codos '
              'de trabajo, hechos de madera, se cotejaban regularmente con él — ese '
              'fue el comienzo de la calibración.',
        ),
        UnitTheorySection(
          'De Roma a la Edad Media',
          'Los romanos ordenaron el sistema. Su pie (pes) tenía doce «unciae». De '
              'uncia surgió la palabra «pulgada» (en inglés inch) — y también '
              '«onza». Su milla se llamaba «mille passus», mil pasos dobles, unos '
              '1480 metros. Es la raíz de todas las millas posteriores.\n\n'
              'En la Edad Media casi cada ciudad tenía sus propias medidas. Una '
              'pulgada se definía como tres granos de cebada colocados uno tras '
              'otro. Para el pie había procedimientos curiosos: en 1535 Jacob Köbel '
              'describió que el domingo había que colocar a dieciséis hombres a la '
              'salida de la iglesia, pie tras pie — una dieciseisava parte de eso '
              'sería el «pie correcto». Así se promediaban las diferencias. En '
              'Alemania, aun así, el pie iba de 235 a 408 milímetros.',
        ),
        UnitTheorySection(
          'Medidas por todo el mundo',
          'El mismo patrón existe en todas partes. En China se medía en chi (pie) '
              'y cun (pulgada), en la India en hasta (codo) y angula (dedo), en el '
              'mundo islámico en distintos codos. El codo, del codo del brazo a la '
              'punta del dedo, se encuentra en casi todos los continentes — el '
              'cuerpo es el origen común.\n\n'
              'En muchas culturas el cuerpo se consideraba una medida sagrada, el '
              'ser humano como imagen del orden del mundo. Los templos egipcios, la '
              'construcción bíblica del arca y los templos hindúes se midieron en '
              'codos.\n\n'
              'También la lengua ha conservado las medidas. «Dales una pulgada y se '
              'tomarán una milla» decía originalmente «… y se tomarán un codo». Un '
              '«salto de gato» es un trecho corto. El grito de sonda del marinero '
              '«mark twain» (dos brazas de profundidad) se convirtió en el '
              'seudónimo de Mark Twain.',
        ),
        UnitTheorySection(
          'Por qué doce — y una reserva honesta',
          '¿Por qué el pie tiene precisamente doce pulgadas? Por la divisibilidad. '
              'El doce se deja partir limpiamente por la mitad, en tercios, en '
              'cuartos y en sextos. El diez solo por la mitad y en quintos. Un '
              'tercio de pie son exactamente cuatro pulgadas; en decimal serían '
              '0,333… metros. Para el oficio y el comercio, mucho antes de la coma '
              'decimal, eso era una ventaja real. Ya los romanos eligieron el doce '
              'por esa misma razón.\n\n'
              'Conviene añadir una reserva honesta: el sistema imperial no es un '
              'sistema duodecimal continuo. Solo el pie y la pulgada — y las doce '
              'onzas troy del metal precioso — son realmente duodecimales. La yarda '
              'tiene tres pies, la milla 1760 yardas: cifras torcidas. Y las '
              'pulgadas se dividen en la vida diaria en mitades, cuartos y octavos, '
              'es decir, según base dos. El doce está, pues, solo en puntos '
              'sueltos, no en todo el sistema.',
        ),
        UnitTheorySection(
          'En uso hoy',
          'Hoy usan estas medidas en el día a día sobre todo los EE. UU. y el '
              'Reino Unido. Pero en todo el mundo rigen en la aviación y la '
              'navegación: los aviones miden su altura en pies, su velocidad en '
              'nudos y su distancia en millas náuticas. Una milla náutica es un '
              'minuto de arco sobre el globo terrestre — sigue la división de '
              'sesenta, no la del doce. Pantallas, neumáticos y tubos vienen casi '
              'en todas partes en pulgadas. En Escandinavia la «mil» equivale a '
              'diez kilómetros. En los países métricos las viejas medidas solo '
              'sobreviven en los dichos.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          'Algunas explicaciones son atractivas, pero inciertas. Una sostiene que '
              'el doce proviene de contar las falanges de los dedos con el pulgar — '
              'plausible, pero no probado. Otras teorías, como la «pulgada '
              'piramidal» o la «yarda megalítica», afirman que en construcciones '
              'antiguas se esconde un saber elevado y oculto. En el mundo '
              'especializado se consideran refutadas: se escogen, de entre muchas '
              'medidas, solo aquellas que encajan con la tesis.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'La tierra como trabajo',
          'Las superficies se miden uniendo longitud con longitud. Pero las viejas '
              'medidas de tierra no surgieron de la geometría, sino del trabajo. Un '
              'campo era tan grande como lo que se podía labrar en un día.\n\n'
              'El «Morgen» alemán se llama así porque se araba en una mañana. El '
              '«acre» inglés era la superficie que una yunta de ocho bueyes lograba '
              'en un día. El «iugerum» romano viene de «iugum», el yugo de los '
              'bueyes. También el «feddan» árabe significa yugo de bueyes. En todas '
              'partes la misma idea: la tierra es trabajo.\n\n'
              'En el antiguo Egipto había que volver a medir los campos tras cada '
              'crecida del Nilo, porque el agua borraba los lindes. Los agrimensores '
              'tensaban cuerdas con nudos; los griegos los llamaron más tarde '
              '«tensadores de cuerdas». En Mesopotamia la medida base era el «sar» '
              '— un cuadrado de doce por doce codos.',
        ),
        UnitTheorySection(
          'El acre y su cifra torcida',
          'El acre tiene una forma inusual: una franja larga y estrecha, de un '
              'furlong de largo y una chain de ancho (660 por 66 pies). Eso refleja '
              'la práctica del arado: surco largo, banda estrecha. Así resultan '
              '43 560 pies cuadrados o 4840 yardas cuadradas.\n\n'
              '¿Por qué esta cifra torcida, 4840? Es un accidente de la historia. '
              'Cuando Inglaterra acortó el pie en el siglo XIII, la vara y el '
              'furlong quedaron sin cambios en los lindes de las parcelas. Por eso '
              'el acre saltó de 4000 yardas cuadradas viejas a 4840 nuevas. La '
              'cifra torcida no es, pues, intención, sino el residuo de una reforma '
              'de medidas.',
        ),
        UnitTheorySection(
          'Medidas de superficie por todo el mundo',
          'Hoy la hectárea (10 000 metros cuadrados) es la medida de tierra más '
              'extendida del mundo. Pero las viejas medidas siguen vivas con '
              'tenacidad. En Tailandia el rai figura incluso en el registro oficial '
              'de la propiedad. En la India y Bangladés se calcula en bigha en el '
              'comercio de tierras. En Corea el pyeong es usual en la vida diaria '
              'pese a su prohibición. Egipto conservó el feddan, China el mu. En '
              'Israel, Turquía y los Balcanes se mide en dunam. En Alemania, el '
              'Morgen, el Joch y el Tagwerk siguen vivos en la agricultura y en la '
              'lengua.\n\n'
              'Las que más tercamente se mantienen son las medidas que se han '
              'fijado a valores métricos redondos — un rai son exactamente 1600, un '
              'dunam exactamente 1000 metros cuadrados.',
        ),
        UnitTheorySection(
          'El doce en la superficie — y una reserva',
          'En las unidades pequeñas el doce se muestra del modo más hermoso. Un '
              'pie cuadrado son 144 pulgadas cuadradas, pues doce por doce es 144. '
              'Escrito en base doce, eso es un limpio «100». Una yarda cuadrada son '
              'nueve pies cuadrados.\n\n'
              'En las grandes medidas de tierra el orden se rompe. El acre, con sus '
              '4840 yardas cuadradas, no encaja en ninguna base sencilla. Eso se '
              'debe a que las medidas de tierra surgieron del trabajo, no del '
              'cálculo.\n\n'
              'Aun así queda un punto práctico: un tercio de hectárea son 3333,33… '
              'metros cuadrados — una cifra torcida. Un tercio de feddan, en '
              'cambio, son ocho kirat justos. Donde se divide a menudo en tercios, '
              'una base divisible por tres lleva ventaja. Justo eso ofrece el doce.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          '¿De dónde viene la predilección por el doce? Una suposición conocida, '
              'pero no probada: de contar las falanges de los dedos. El pulgar va '
              'tocando las tres falanges de los otros cuatro dedos — eso da doce '
              'por mano. Esta técnica de contar está documentada hasta hoy en '
              'partes de Asia y del Oriente Próximo. Pero no se deja demostrar como '
              'origen seguro.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'Primero el recipiente, luego el cubo',
          'El volumen se mide uniendo tres longitudes — un cubo. Pero así empezó '
              'casi en ninguna parte. Al principio estaba el recipiente: un cántaro '
              'lleno, un saco de grano, un cazo de aceite. Se medía lo que se podía '
              'comer, llevar o comerciar, no lo que se podía calcular.\n\n'
              'La referencia era casi siempre una cantidad de alimento. El '
              '«choinix» griego era la ración diaria de grano de un trabajador. El '
              '«koku» japonés era tanto arroz como come una persona en un año — '
              'unos 180 litros. El «Scheffel» alemán era aproximadamente un saco '
              'transportable.\n\n'
              'Solo los grandes imperios con administración derivaron el volumen de '
              'la medida de longitud. Los romanos dieron el primer paso claro: su '
              '«amphora» contenía exactamente un pie cúbico, unos 26 litros. Con '
              'ello el volumen fue por primera vez un verdadero cubo hecho de la '
              'medida del pie — el antepasado directo del pie cúbico, el litro y el '
              'metro cúbico.',
        ),
        UnitTheorySection(
          'Medida, rango y riqueza',
          'Las medidas de capacidad eran a menudo más que cantidades — ordenaban '
              'sociedades enteras. En Japón se medía la riqueza de un feudo en koku '
              'de cosecha de arroz. A partir de diez mil koku un señor valía como '
              '«daimio», como príncipe. Hasta la paga de los samuráis y el tamaño '
              'de los barcos se contaban en koku.\n\n'
              'En Roma la ración del soldado se repartía en «modii», una medida de '
              'áridos de apenas nueve litros. En Mesopotamia, Egipto y China los '
              'gobernantes controlaban las medidas mediante recipientes patrón '
              'calibrados. El más famoso es el «jialiang» chino, de la época en '
              'torno al año cero: una sola fundición de bronce que encarna a la vez '
              'cinco unidades de volumen. Se erguía ante las salas del emperador '
              'como signo de la unidad y la justicia de su gobierno.',
        ),
        UnitTheorySection(
          'El volumen por todo el mundo',
          'Apenas hubo un campo de medidas tan fragmentado como el del volumen. El '
              '«Scheffel» alemán iba, según la ciudad, de unos 5 a 250 litros. '
              'Inglaterra, los EE. UU. y el Imperio tenían por sí solos tres '
              'galones distintos. El galón estadounidense (3,79 litros) sigue siendo '
              'hoy alrededor de una quinta parte más pequeño que el británico (4,55 '
              'litros).\n\n'
              'Muchas de estas medidas siguen vivas. El comercio mundial de grano '
              'calcula en «bushels» — los informes de cosecha estadounidenses de '
              'maíz, soja y trigo aparecen solo en ellos. El petróleo se comercia '
              'en «barriles» de 42 galones estadounidenses, una vieja medida '
              'inglesa de barrica de vino. En el Reino Unido e Irlanda la cerveza '
              'se sirve legalmente en la pinta imperial (568 mililitros). En Japón '
              'el vaso de la arrocera mide exactamente un «gō». La leña se comercia '
              'en metros cúbicos de pila, metros cúbicos sólidos o, en '
              'Norteamérica, en «cord».\n\n'
              'En los EE. UU. las medidas cúbicas están en la vida diaria: los '
              'motores se indican en pulgadas cúbicas (un «350»), el hormigón y la '
              'tierra en la construcción en yardas cúbicas, el gas natural en pies '
              'cúbicos.',
        ),
        UnitTheorySection(
          'El doce en el espacio — y una reserva',
          'En el cubo el doce se muestra con la mayor fuerza. Un pie cúbico son '
              '1728 pulgadas cúbicas — y 1728 es doce elevado al cubo. Escrito en '
              'base doce, eso es el limpio «1000». Esta cifra tiene especialmente '
              'muchos divisores, porque está construida a partir de doses y treses. '
              'Por eso un pie cúbico se deja partir limpiamente por la mitad, en '
              'tercios, en cuartos, en sextos y en octavos.\n\n'
              'Un metro cúbico, en cambio, solo se divide limpiamente por dos y por '
              'cinco. Un tercio de metro cúbico son 0,333… — una cifra sin fin. '
              'Donde se divide a menudo en tercios, el doce lleva ventaja.\n\n'
              'La reserva honesta: este hermoso orden vale solo para las medidas '
              'cúbicas derivadas de longitudes. Las viejas medidas de capacidad — '
              'bushel, galón, Scheffel — no siguen ninguna base pura. Crecieron de '
              'sacos y barricas, no del cálculo, y mezclan pasos de dos, de tres y '
              'del todo torcidos.',
        ),
        UnitTheorySection(
          'El cubo sagrado',
          'El cubo tiene en muchas culturas un significado especial, porque largo, '
              'ancho y alto son iguales — una imagen de la perfección. El '
              'sanctasanctórum del templo y del tabernáculo era cúbico. La Kaaba de '
              'La Meca, cuyo nombre significa «cubo», es un santuario cúbico negro. '
              'También la «nueva Jerusalén» de la Biblia se describe como un cubo '
              'enorme.\n\n'
              'Además, a lo largo de muchas religiones, la medida justa vale como '
              'deber sagrado. La Biblia hebrea exige un «efa justo»; el profeta '
              'Amós acusa a los comerciantes que recortan la medida. El Corán '
              'dedica una sura entera a quienes miden escaso. Quien mide mal, peca '
              '— esta idea se encuentra por todo el globo.\n\n'
              'También el sistema métrico lleva este espíritu, solo que de modo '
              'secular: en lugar de derivar su medida de un gobernante, la deriva de '
              'la Tierra misma. El metro es una fracción de la circunferencia '
              'terrestre, el metro cúbico su espacio — medida tomada de la '
              'naturaleza en vez de del poder.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          'En torno a las antiguas construcciones se enredan audaces teorías sobre '
              'el volumen. Algunos afirman que la pirámide de Keops esconde una '
              '«pinta piramidal» o una medida sagrada de origen divino. Otros '
              'sostienen que los círculos de piedra de la Edad de Piedra usaban una '
              '«yarda megalítica», de la que resultaría justo una pinta como '
              'cubo.\n\n'
              'El mundo especializado lo tiene por refutado. Tales teorías escogen, '
              'de entre muchas medidas, solo las que encajan e interpretan las '
              'casualidades como intención. Atractivas de leer, pero sin prueba '
              'alguna.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'Del grano a la carga',
          'Los pesos tenían en todas partes dos raíces. Las medidas más pequeñas '
              'venían de semillas y granos; las grandes, de lo que un ser humano o '
              'un animal podía cargar.\n\n'
              'El «grain» inglés es literalmente un grano de cebada, unos 65 '
              'miligramos. El «quilate» de los joyeros viene de la semilla del '
              'algarrobo. En la India se pesaba el oro en «ratti», la semilla de '
              'una leguminosa roja. En el otro extremo estaba la carga: el '
              '«talento» griego y el «maund» indio eran aproximadamente tanto como '
              'un hombre podía cargar. La «tonelada» viene de la mayor barrica de '
              'vino, el «tun», que llena pesaba alrededor de una tonelada.\n\n'
              'Un tercer hilo une peso y dinero: siclo, dracma, libra y tola eran a '
              'la vez nombres de moneda y de peso. El dinero era originalmente metal '
              'pesado — se pesaba la plata en vez de contar monedas.',
        ),
        UnitTheorySection(
          'Libra, onza y la herencia romana',
          'Nuestras palabras para el peso proceden de Roma. La «libra» romana era '
              'una balanza y un peso de unos 329 gramos, dividido en doce «unciae». '
              'De «libra» surgieron la abreviatura «lb» para la libra y el signo '
              '«£» para la libra británica. De «uncia» — literalmente «la docena '
              'parte» — surgieron tanto la «onza» como la «pulgada».\n\n'
              'De esta raíz crecieron dos sistemas distintos. La libra '
              '«avoirdupois» del día a día se divide en 16 onzas — una cifra que se '
              'deja partir una y otra vez por la mitad. La libra «troy» del comercio '
              'de metales preciosos conservó las doce onzas romanas. Una onza troy '
              '(la onza fina) es por eso más pesada que una onza corriente, pero la '
              'libra troy es más ligera — una confusión popular hasta hoy.',
        ),
        UnitTheorySection(
          'Pesos por todo el mundo',
          'Casi cada cultura tenía sus escalones. Mesopotamia contaba en siclo, '
              'mina y talento según base sesenta. Egipto calculaba en decimal en '
              'deben y kite. China usa hasta hoy jin, liang y el pequeño mace. En '
              'Japón el «momme» (3,75 gramos) es por ley aún la unidad mundial en '
              'el comercio de perlas.\n\n'
              'Muchos pesos antiguos siguen vivos. En el Reino Unido e Irlanda el '
              'peso corporal se indica en «stones» de 14 libras («once stones '
              'cuatro»). La libra alemana significa hoy 500 gramos justos. En el '
              'sur de Asia se comercia el oro en «tola» (unos 11,7 gramos). Y el '
              'siclo israelí lleva el nombre de un antiquísimo peso de balanza.\n\n'
              'Una medida estaba especialmente fragmentada: el stone pesaba, según '
              'la mercancía, unas veces 5, otras 8, otras 14 libras. Solo las leyes '
              'del siglo XIX crearon orden.',
        ),
        UnitTheorySection(
          'La balanza como emblema',
          'En muchas culturas el pesar es más que técnica — es una imagen de la '
              'justicia. En el antiguo Egipto, en el juicio de los muertos se '
              'pesaba el corazón contra la pluma de la verdad. En Homero, Zeus '
              'sostiene una balanza de oro sobre el destino de los héroes. En el '
              'islam, la «mizan» pesa las obras el día del Juicio, y ni siquiera el '
              'peso de un grano de mostaza se pierde.\n\n'
              'El latín «libra» significa balanza — de ahí también el signo del '
              'zodíaco Libra, el único que no es un ser vivo. Muchas religiones '
              'exigen la medida honesta: la Biblia hebrea llama a los pesos falsos '
              'una abominación, el Corán reprende a quienes pesan escaso. Y la '
              'palabra «talento» pasó de peso a aptitud — a través de la parábola '
              'bíblica de los talentos confiados.',
        ),
        UnitTheorySection(
          'El doce en el peso — y una reserva',
          'El doce está sobre todo en el sistema troy: doce onzas en la libra, y '
              'la pureza del oro se cuenta en 24 quilates (dos veces doce). Tales '
              'cifras son apreciadas porque el doce tiene seis divisores — se puede '
              'partir limpiamente por la mitad, en tercios y en cuartos. Un tercio '
              'de doce es un limpio cuatro; un tercio de diez es 3,33…\n\n'
              'La reserva honesta: el peso del día a día no sigue al doce. La libra '
              'avoirdupois tiene 16 onzas — eso es base dos, el partir por la mitad '
              'una y otra vez. Mesopotamia contaba en base sesenta. El mundo del '
              'peso es, pues, un mosaico de dos, tres, doce y sesenta — construido '
              'para dividir en el comercio, no para calcular en decenas.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          '¿De dónde viene la predilección por el doce? Una suposición conocida, '
              'pero no probada, la remonta a contar las falanges de los dedos: el '
              'pulgar va tocando las tres falanges de los cuatro dedos — doce por '
              'mano. Contando eso cinco veces, se llega a sesenta.\n\n'
              'Una segunda historia está incluso refutada: la de que el quilate se '
              'base en las semillas especialmente uniformes del algarrobo. El '
              'nombre es cierto — pero las semillas varían en peso tanto como '
              'cualesquiera otras. La uniformidad es un mito.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Dos herencias: Babilonia y Egipto',
          'Nuestro tiempo procede de dos fuentes antiguas. La hora viene de '
              'Egipto; el minuto y el segundo, de Babilonia.\n\n'
              'Los egipcios dividían el día y la noche en doce horas cada uno — '
              'probablemente porque de noche veían salir doce constelaciones. Así '
              'surgió el día de 24 horas. Pero como el día y la noche son de '
              'distinta duración, estas horas eran desiguales en verano y en '
              'invierno. Solo el reloj mecánico las hizo iguales.\n\n'
              'Babilonia calculaba en base sesenta. De ahí tenemos sesenta minutos '
              'en la hora y sesenta segundos en el minuto. «Minuto» significa '
              '«parte empequeñecida», «segundo» la «segunda reducción». La misma '
              'base sesenta está en el círculo con sus 360 grados — el tiempo y el '
              'ángulo son parientes.',
        ),
        UnitTheorySection(
          'Luna, Sol y semana',
          'El día viene de la rotación de la Tierra, el mes de la Luna, el año del '
              'Sol. Estos tres no encajan limpiamente entre sí, y eso explica casi '
              'cada enredo de los calendarios.\n\n'
              'La semana tiene siete días — presumiblemente según las cuatro fases '
              'lunares de unos siete días cada una. Más tarde se asignó a cada día '
              'uno de los siete cuerpos celestes visibles. Esta serie vive en '
              'muchas lenguas: en inglés «Saturday» es el día de Saturno, en las '
              'lenguas romances «lundi/lunes» el día de la Luna. Los germanos '
              'sustituyeron a los dioses romanos por los suyos propios — del día de '
              'Júpiter surgió el día de Thor, el «Thursday».\n\n'
              'También resuenan viejas formas de contar: el «fortnight» inglés '
              '(catorce noches) recuerda que los germanos calculaban en noches en '
              'vez de en días.',
        ),
        UnitTheorySection(
          'El tiempo por todo el mundo',
          'No en todas partes corría el reloj igual. China dividía el día en doce '
              'horas dobles, nombradas según animales — la hora de la rata caía en '
              'torno a la medianoche. Japón dividía el día y la noche en seis '
              'tramos cada uno, que con las estaciones se hacían más largos y más '
              'cortos; relojes especiales debían reajustar eso.\n\n'
              'El calendario islámico sigue puramente la Luna y es once días más '
              'corto que el año solar — por eso el ramadán recorre lentamente todas '
              'las estaciones. Los mayas entrelazaban varios ciclos a la vez, entre '
              'ellos una ronda sagrada de 260 días. En Etiopía el día comienza '
              'hasta hoy al amanecer: lo que allí son «las seis» es en otros sitios '
              'el mediodía.\n\n'
              'Muchos de estos viejos ritmos siguen vivos — en fiestas, horas de '
              'oración y días de suerte —, mientras la vida diaria sigue en todas '
              'partes el calendario gregoriano.',
        ),
        UnitTheorySection(
          'Números sagrados del tiempo',
          'El tiempo fue casi en todas partes también sagrado. En Babilonia el '
              'doce y el sesenta valían como números perfectos. En Egipto el dios '
              'solar atravesaba el inframundo en las doce horas de la noche. El '
              'siete de la semana representa, en la tradición judía, la plenitud — '
              'al séptimo día Dios descansó.\n\n'
              'Llama la atención un contraste: para el judaísmo, el cristianismo y '
              'el islam, el tiempo corre en línea recta, hacia una meta. En el '
              'hinduismo gira en círculo — enormes edades del mundo, los «yugas», '
              'vienen y pasan una y otra vez; un solo día del dios creador dura '
              'miles de millones de años. Además, muchas culturas temían los días '
              'sobrantes al final del año como un peligroso «tiempo intermedio».',
        ),
        UnitTheorySection(
          'Por qué no decimal — y la relación con el doce',
          'El tiempo es el adversario más tenaz del sistema decimal. Segundo, '
              'minuto, hora, día, semana, mes, año — ninguno de estos pasos es una '
              'cifra decimal redonda.\n\n'
              'El motivo es de nuevo la divisibilidad. Un tercio de hora son veinte '
              'minutos justos, un cuarto son quince. Con diez no saldría exacto. El '
              'doce y el sesenta se dejan dividir por tres, el diez no.\n\n'
              'Aun así se intentó el sistema decimal. En la Revolución Francesa hubo '
              'días de diez horas, horas de cien minutos. Solo duró cosa de un año '
              'y medio. A diferencia de las medidas de longitud y de peso, el cambio '
              'no aportó ningún beneficio — al fin y al cabo, los viejos relojes ya '
              'corrían igual en todas partes. La división por doce y por sesenta era '
              'sencillamente más práctica.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          '¿Cómo llegaron las personas al doce y al sesenta? Una idea elegante, '
              'pero indemostrable: se contaba con el pulgar las tres falanges de '
              'los cuatro dedos — doce por mano —, y cinco de tales recorridos dan '
              'sesenta.\n\n'
              'Más lejos quedan las afirmaciones de que el año tuvo antes realmente '
              'exactamente 360 días y fue alterado por catástrofes cósmicas. Para '
              'eso no hay prueba científica alguna; el 360 es mucho más bien una '
              'cifra de cálculo redonda y bien divisible.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'El círculo de Babilonia',
          'Dividimos el círculo completo en 360 grados, el grado en 60 minutos de '
              'arco, el minuto en 60 segundos. Este orden es antiquísimo y viene de '
              'Mesopotamia. Los babilonios calculaban en base sesenta, una cifra '
              'con especialmente muchos divisores.\n\n'
              '¿Por qué precisamente 360? Su año tenía alrededor de 360 días, y el '
              'Sol avanza al hacerlo apenas un grado por día — el día y el grado '
              'coincidían. Las palabras revelan el origen: «minuto» viene del latín '
              '«primera parte pequeña», «segundo» de la «segunda reducción». '
              'Exactamente las mismas palabras usamos para el tiempo — el ángulo y '
              'el tiempo son hermanos de la misma raíz babilónica.\n\n'
              'Una indicación honesta: por qué fue 360 y no 60 no está documentado '
              'con seguridad. La historia del día por grado es la más plausible, '
              'pero no una explicación probada.',
        ),
        UnitTheorySection(
          'De la estrella a la hora',
          'El doce en el círculo viene de Egipto. Allí doce constelaciones '
              'salientes articulaban la noche — de ahí surgieron las doce horas '
              'nocturnas y finalmente el día de 24 horas y la esfera del reloj.\n\n'
              'Los griegos ordenaron el sistema. Hiparco y más tarde Ptolomeo '
              'adoptaron la división en 360 y sentaron con ello la base de la '
              'trigonometría. Desde allí el saber siguió viajando: los eruditos '
              'indios inventaron la tabla de senos, el mundo islámico la refinó. '
              'Nuestra palabra «seno» es incluso un error de traducción — de la '
              'palabra india para «cuerda de arco» surgió, a través del árabe, la '
              'palabra latina para «bahía».',
        ),
        UnitTheorySection(
          'Ángulos por todo el mundo',
          'No toda cultura dividía el círculo igual. China calculaba de forma '
              'propia: el círculo tenía allí 365¼ partes — una por cada día del '
              'año. Solo la influencia europea trajo los 360. La brújula china de '
              'feng shui divide el horizonte en 24 direcciones.\n\n'
              'La India dividía el zodíaco en doce signos y en 27 mansiones '
              'lunares. La astronomía islámica nos regaló muchas palabras de '
              'dirección: «acimut», «cenit» y «nadir» son todas árabes — la '
              'obligación de hallar la dirección de la oración hacia La Meca impulsó '
              'el arte de los ángulos.\n\n'
              'En el mar se dividía la rosa de los vientos: cuatro vientos '
              'principales, luego ocho, luego 32 puntos de 11¼ grados cada uno. '
              'Recitar los 32 del círculo — «boxing the compass» — formaba parte '
              'del oficio del timonel. Los nombres mediterráneos de los vientos, '
              'Tramontana, Levante, Siroco, viven hasta hoy en el lenguaje del '
              'tiempo.',
        ),
        UnitTheorySection(
          'Direcciones y números sagrados',
          'El cielo fue casi en todas partes divino. Para los babilonios la '
              'astronomía era un mensaje de los dioses, el zodíaco su escritura. El '
              'doce valía para muchos como número sagrado — doce signos del '
              'zodíaco, doce dioses olímpicos, doce tribus, doce horas.\n\n'
              'Especialmente amplio es el orden de los cuatro puntos cardinales. En '
              'el hinduismo cada dirección está custodiada por un dios propio, en '
              'China por un ser animal propio — dragón en el este, tigre en el '
              'oeste. La rueda de medicina de los lakota da a cada dirección color '
              'y significado. Y en el islam la dirección de la oración ordena el '
              'mundo entero en torno a la Kaaba.\n\n'
              'Deliberadamente sin tal simbolismo llegaron las medidas más '
              'jóvenes: el radián sigue solo a la matemática, el gon a la '
              'Revolución Francesa, la milésima militar únicamente a la balística.',
        ),
        UnitTheorySection(
          'Doce y sesenta en el círculo — y una reserva',
          'El 360 es un milagro de divisibilidad: tiene 24 divisores. Tercios, '
              'cuartos, sextos de un círculo dan todos cifras de grados limpias. Un '
              'círculo de cien partes no podría hacerlo — un tercio serían '
              '33,33…\n\n'
              'Se intentó en decimal. En la Revolución Francesa apareció el círculo '
              'de 400 gon. Quedó en un nicho de los agrimensores, pues 400 tiene '
              'menos divisores que 360. También el tiempo decimal fracasó — entre '
              'otras cosas porque no se dejaba partir limpiamente en cuartos.\n\n'
              'La reserva honesta: el 360 no es obligatorio. La división china en '
              '365 lo demuestra. Y en la matemática superior gana el radián, porque '
              'allí no importa la divisibilidad, sino las fórmulas sencillas. El '
              'mundo del doce es, pues, fuerte, pero no sin alternativa.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          '¿De dónde la predilección por el doce y el sesenta? La conocida, pero '
              'no probada suposición: de contar las falanges de los dedos. El '
              'pulgar va tocando las tres falanges de los cuatro dedos — doce por '
              'mano —, y cinco recorridos dan sesenta.\n\n'
              'Atractivo es un paralelo numérico: la saga nórdica da a Valhalla 540 '
              'puertas, por cada una pasan 800 guerreros — en total 432 000, la '
              'misma cifra que una edad del mundo india. El mundo especializado lo '
              'tiene por casualidad, no por una herencia común. Bonito de contar, '
              'pero sin prueba.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'El dinero era peso',
          'Mucho antes de que hubiera monedas, el dinero era metal pesado. Se '
              'pesaba plata o grano. Por eso los nombres de dinero más antiguos son '
              'en realidad nombres de peso.\n\n'
              'En Mesopotamia se contaba en siclo, mina y talento — según base '
              'sesenta, sesenta siclos por mina. El siclo fue primero un peso, '
              'calibrado con el grano de cebada. La «dracma» griega significa '
              'literalmente «un puñado», a saber, seis finos asadores de metal.\n\n'
              'Llama la atención: por lo general solo se acuñaba la moneda más '
              'pequeña. Las grandes unidades, como la mina y el talento, eran meras '
              'magnitudes de cálculo — nadie tenía un talento en la mano, solo se '
              'calculaba con él.',
        ),
        UnitTheorySection(
          'Libra, chelín, penique',
          'El dinero europeo procede de Roma. La moneda «denarius» dio al penique '
              'la abreviatura «d» y a muchas lenguas la palabra para dinero (en '
              'español «dinero», en árabe «dinar»).\n\n'
              'Carlomagno lo ordenó de nuevo: una libra de plata (libra) = 20 '
              'chelines (solidus) = 240 peniques (denarius), es decir, doce peniques '
              'por chelín. También aquí solo el penique era una moneda de verdad; la '
              'libra y el chelín servían para calcular. Este sistema se mantuvo más '
              'de mil años.\n\n'
              'Inglaterra lo adoptó como libra, chelín, penique — la «£sd». El '
              'signo «£» es una L adornada de «libra», la balanza. Así el dinero '
              'cuelga de la misma palabra que el signo del zodíaco Libra y la libra '
              'de peso.',
        ),
        UnitTheorySection(
          'Monedas por todo el mundo',
          'Casi cada región tenía sus escalones. En el sur de Alemania regían '
              'sesenta kreuzer por un florín — de nuevo el sesenta babilónico. El '
              '«tálero» del Joachimsthal bohemio dio al «dólar» el nombre. El tálero '
              'de María Teresa era tan apreciado que aún en el siglo XX valía como '
              'dinero en Arabia y Etiopía.\n\n'
              'En otros lugares el dinero tenía un aspecto muy distinto. En el '
              'África occidental se pagó durante siglos con caracolas cauri. Los '
              'aztecas usaban granos de cacao como calderilla y mantos normalizados '
              'como dinero grande — contados en veintenas. La India calculaba la '
              'rupia en 16 annas; China enhebraba en cuerdas las monedas con '
              'agujero.\n\n'
              'El «real de a ocho» español se dejaba partir en ocho trozos. Dos de '
              'ellos eran «two bits» — hasta hoy el apodo estadounidense de la '
              'moneda de cuarto de dólar.',
        ),
        UnitTheorySection(
          'Dinero, fe y símbolo',
          'Las monedas eran a menudo más que medio de pago. Los griegos ponían al '
              'muerto una moneda en la boca — el pasaje para Caronte, que lleva el '
              'alma sobre el río de los muertos. Sin moneda quedaba en la '
              'orilla.\n\n'
              'En el Nuevo Testamento Jesús sostiene en alto un denario con la '
              'imagen del emperador: «Dad al César lo que es del César». Las treinta '
              'monedas de plata de Judas eran presumiblemente siclos de Tiro — '
              'precisamente monedas con un dios pagano grabado, a la vez la moneda '
              'oficial del templo.\n\n'
              'Y una y otra vez el doce sagrado: doce tribus y apóstoles en el '
              'judaísmo y el cristianismo, doce dioses solares en el hinduismo, doce '
              'eslabones de la cadena causal en el budismo, doce imanes en el '
              'chiismo, doce ramas terrestres en China. La cifra une dinero, '
              'calendario y fe.',
        ),
        UnitTheorySection(
          'Por qué doce y veinte — y una reserva',
          'El motivo de todos esos escalones torcidos es la divisibilidad. Un '
              'florín de sesenta kreuzer se deja partir limpiamente en tercios: '
              'veinte kreuzer. Un tercio de dólar, en cambio, son 33,33… centavos — '
              'una cifra sin fin. Quien en el comercio divide a menudo está mejor '
              'servido con doce, veinte o sesenta que con diez.\n\n'
              'Por eso el doce sigue vivo en el comercio: la docena (12), la gruesa '
              '(144) y la gruesa grande (1728). Una gruesa significa en Londres lo '
              'mismo que en Nueva York la misma cantidad.\n\n'
              'La reserva honesta: el viejo dinero no era un sistema duodecimal '
              'puro. Los veinte chelines en la libra son una lógica de veintenas '
              '(dedos de las manos y de los pies). Y en 1971 el Reino Unido se pasó '
              'a cien peniques — con algún desbarajuste, pero de forma duradera. Hoy '
              'casi todo el mundo calcula en decimal.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          '¿Por qué tantas culturas eligieron el doce? La conocida, pero no '
              'probada suposición lo remonta a contar las falanges de los dedos: '
              'tres falanges en cuatro dedos, tocadas con el pulgar, dan doce.\n\n'
              'Otras interpretaciones van más lejos: el doce sería «tres por '
              'cuatro», cielo por tierra, una cifra de la plenitud. Algunos afirman '
              'incluso que un dios solar con doce compañeros fue el modelo de los '
              'doce apóstoles. Tales paralelismos son interpretación, no historia '
              'asegurada — para tomar con cautela.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'Del termoscopio al termómetro',
          'La temperatura es un invento tardío. Durante mucho tiempo el calor solo '
              'se podía sentir, no medir. El primer paso lo dio la observación de '
              'que el aire y los líquidos se dilatan con el calor.\n\n'
              'Hacia 1600 Galileo Galilei construyó un «termoscopio»: una esfera de '
              'vidrio con un tubo en el que un nivel de agua subía y bajaba. '
              'Indicaba el calor, pero no tenía escala. La primera escala numérica '
              'la añadió poco después el médico Santorio — un termómetro es un '
              'termoscopio con escala.\n\n'
              'Para que las mediciones sean comparables hacen falta puntos de '
              'referencia fijos. Se acordaron puntos naturales: el punto de '
              'congelación y el de ebullición del agua. De ellos cuelgan hasta hoy '
              'todas las escalas.',
        ),
        UnitTheorySection(
          'Tres escalas, tres puntos cero',
          'Las escalas conocidas se diferencian sobre todo en dónde colocan el '
              'cero.\n\n'
              'Daniel Fahrenheit fijó hacia 1724 su cero en el punto más frío que '
              'podía producir con seguridad: una mezcla de hielo, agua y sal. El '
              'punto de congelación del agua pura lo puso en 32, la temperatura '
              'corporal en 96. Así los inviernos normales no bajaban de cero. Más '
              'tarde se recalibró la escala sobre el punto de congelación (32) y el '
              'de ebullición (212) — justo 180 grados entre ambos.\n\n'
              'Réaumur eligió 0 y 80. Anders Celsius fijó 0 y 100 en la congelación '
              'y la ebullición — y al principio incluso dispuso la escala al revés '
              '(0 era el punto de ebullición). Solo tras su muerte se le dio la '
              'vuelta a la forma actual. La redonda división en 100 encajaba a la '
              'perfección con el nuevo sistema métrico.',
        ),
        UnitTheorySection(
          'Por qué el mundo mide de forma distinta',
          'Casi todo el mundo usa hoy el Celsius — llegó con el sistema métrico. '
              'Las grandes excepciones son los EE. UU. y algunos países '
              'estrechamente vinculados a ellos, que se quedaron con el Fahrenheit. '
              'Una ley de 1975 hizo allí voluntario el cambio, y así quedó todo '
              'como estaba.\n\n'
              'Las viejas escalas son tenaces. Réaumur estuvo extendido en los '
              'siglos XVIII y XIX en Francia, Alemania y Rusia, y se mantuvo en '
              'Rusia especialmente mucho tiempo. Por eso la literatura rusa — por '
              'ejemplo en Dostoyevski o Tolstói — habla de «grados de helada», con '
              'lo que se refiere a grados Réaumur.\n\n'
              'Qué escala se siente más «natural» es pura costumbre. El Celsius se '
              'ata al agua; el Fahrenheit abarca a grandes rasgos, de 0 (muy frío) '
              'a 100 (muy caliente), el clima humano. Ambas cosas son convención, '
              'no una ventaja objetiva.',
        ),
        UnitTheorySection(
          'Fuego y hielo',
          'El calor y el frío portan en casi todas las culturas un significado '
              'profundo — y llamativamente a menudo ambos representan a la vez la '
              'creación y el castigo.\n\n'
              'En la saga nórdica el mundo nace de la tensión entre el reino del '
              'fuego, Muspelheim, y el reino del hielo, Niflheim — aquí el frío no '
              'es un mal, sino una fuerza creadora. El infierno se imagina casi '
              'siempre como fuego, pero en el Infierno de Dante el círculo más '
              'profundo es un lago congelado: la traición es el enfriamiento de '
              'todo calor humano. El budismo conoce tanto infiernos calientes como '
              'fríos, graduados según la culpa.\n\n'
              'El fuego es en otros lugares sagrado y puro: Agni en el hinduismo, '
              'el fuego eterno en el zoroastrismo. Y la palabra «nirvana» significa '
              'literalmente «extinción» — la extinción del ardor interior.',
        ),
        UnitTheorySection(
          'El verdadero punto cero: el kelvin',
          '¿Qué es en realidad la temperatura? Es una medida de lo rápido que se '
              'mueven las partículas más pequeñas. Caliente significa: las '
              'partículas se agitan con más fuerza.\n\n'
              'De ahí se sigue que existe una temperatura más baja posible — el '
              'punto en que ese movimiento es mínimo. Ese es el cero absoluto, en '
              '−273,15 °C. Más frío no se puede. Lord Kelvin fijó en 1848 una '
              'escala justo ahí: cero kelvin es el cero absoluto, un paso kelvin es '
              'tan grande como un grado Celsius.\n\n'
              'Solo esta escala permite verdaderas proporciones: 200 kelvin son '
              'realmente el doble de «calientes» que 100. Con el Celsius o el '
              'Fahrenheit eso no vale — «20 grados son el doble de calientes que 10 '
              'grados» es sencillamente falso. Por eso, para la ciencia, el kelvin '
              'es la unidad básica.',
        ),
        UnitTheorySection(
          'Por qué el doce apenas ayuda aquí — honestamente',
          'En las demás medidas el doce es fuerte, porque se puede dividir bien '
              'una cantidad: un tercio de pie son cuatro pulgadas justas. En la '
              'temperatura este argumento no agarra — y eso hay que decirlo con '
              'honestidad.\n\n'
              'El motivo es el punto cero desplazado. Cero grados Celsius no '
              'significa «nada de calor», sino solo «el agua se congela». Por eso '
              'no se pueden partir por la mitad ni en tercios las temperaturas de '
              'forma sensata — «la mitad de caliente» no existe en una escala así. '
              'La hermosa divisibilidad del doce se queda aquí en nada.\n\n'
              'Solo en un punto sí hay pensamiento de divisibilidad: en la '
              'partición de la escala misma. Los 96 de Fahrenheit y los 64 pasos '
              'hasta el hielo se dejan partir a menudo por la mitad. Pero si la '
              'indicación se divide en 10, 12 o 100 pasos es pura cosmética. La '
              'temperatura es el honesto contraejemplo: aquí la elección de la base '
              'es indiferente — la afirmación verdadera está en el cero absoluto, '
              'no en la partición de la escala.',
        ),
        UnitTheorySection(
          'Especulativo (con cautela)',
          'En torno a la escala de Fahrenheit se enredan leyendas. Una sostiene '
              'que el 96 era la temperatura de la fiebre de su esposa enferma — '
              'para eso no hay prueba alguna. Otra dice que el cero era el invierno '
              'más frío de su ciudad natal, Danzig; más probable es la '
              'reproducible mezcla de hielo y sal.\n\n'
              'Incluso la propia explicación de Fahrenheit sobre sus puntos fijos '
              'se tiene por en parte adornada a posteriori — mucho lo tomó '
              'sencillamente de la escala más antigua del astrónomo Rømer. Bonitas '
              'historias, pero para leer con cautela.',
        ),
      ];
    // Las ocho áreas de teoría están ahora disponibles en español.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesEs(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return [
        Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
        Source('Gross (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Gross_(unit)', 'R2', 'A1'),
        Source('Great gross — Wikipedia', 'https://en.wikipedia.org/wiki/Great_gross', 'R2', 'A1'),
        Source('Baker’s dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Baker%27s_dozen', 'R2', 'A1'),
        Source('Assize of Bread and Ale — Wikipedia', 'https://en.wikipedia.org/wiki/Assize_of_Bread_and_Ale', 'R2', 'A1'),
        Source('dozen — Online Etymology Dictionary', 'https://www.etymonline.com/word/dozen', 'R2', 'A1'),
        Source('gross — Online Etymology Dictionary', 'https://www.etymonline.com/word/gross', 'R2', 'A1'),
      ];
    case UnitCategory.dist:
      return [
        Source('Measurement — MacTutor History of Mathematics', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Measurement/', 'R1', 'A1'),
        Source('Proportionate measurements (Vastu-Shastra) — wisdomlib.org', 'https://www.wisdomlib.org/hinduism/book/vastu-shastra-indian-architecture/d/doc1085304.html', 'R1', 'A1'),
        Source('Cubit — Wikipedia', 'https://en.wikipedia.org/wiki/Cubit', 'R2', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('The nautical mile — IHO', 'https://ihr.iho.int/articles/the-nautical-mile/', 'R1', 'A2'),
      ];
    case UnitCategory.area:
      return [
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A1'),
        Source('Acre — Wikipedia', 'https://en.wikipedia.org/wiki/Acre', 'R2', 'A1'),
        Source('Hectare — Wikipedia', 'https://en.wikipedia.org/wiki/Hectare', 'R2', 'A1'),
        Source('Jugerum — Wikipedia', 'https://en.wikipedia.org/wiki/Jugerum', 'R2', 'A1'),
        Source('Mathematical accuracy of Aztec land surveys (Codex Vergara) — PNAS', 'https://www.pnas.org/doi/10.1073/pnas.1107737108', 'R1', 'A2'),
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A2'),
      ];
    case UnitCategory.space:
      return [
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Hekat — Wikipedia', 'https://en.wikipedia.org/wiki/Hekat', 'R2', 'A1'),
        Source('Medimnos — Wikipedia', 'https://en.wikipedia.org/wiki/Medimnos', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('Jialiang — Wikipedia', 'https://en.wikipedia.org/wiki/Jialiang', 'R2', 'A1'),
      ];
    case UnitCategory.weight:
      return [
        Source('Hanging in the Balance: Precision Weighing in Antiquity — Penn Museum', 'https://www.penn.museum/sites/expedition/hanging-in-the-balance-2/', 'R1', 'A1'),
        Source('Avoirdupois — Wikipedia', 'https://en.wikipedia.org/wiki/Avoirdupois', 'R2', 'A1'),
        Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
        Source('Mina (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Mina_(unit)', 'R2', 'A1'),
        Source('Cubical Weights — Harappa.com', 'https://www.harappa.com/blog/cubical-weights', 'R1', 'A2'),
        Source('Legume Seeds for Weighing Gold in India — ResearchGate', 'https://www.researchgate.net/publication/344088688', 'R1', 'A2'),
      ];
    case UnitCategory.time:
      return [
        Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
        Source('Hour — Wikipedia', 'https://en.wikipedia.org/wiki/Hour', 'R2', 'A1'),
        Source('Minute — Wikipedia', 'https://en.wikipedia.org/wiki/Minute', 'R2', 'A1'),
        Source('Decimal time — Wikipedia', 'https://en.wikipedia.org/wiki/Decimal_time', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A3'),
        Source('Telling Time in Ancient Egypt — Metropolitan Museum of Art', 'https://www.metmuseum.org/essays/telling-time-in-ancient-egypt', 'R1', 'A3'),
      ];
    case UnitCategory.angle:
      return [
        Source('Babylonian mathematics — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/', 'R1', 'A1'),
        Source('Why did the Babylonians use 360 degrees? — UNLV', 'https://www.physics.unlv.edu/~jeffery/astro/babylon/babylonian_360_degrees.html', 'R1', 'A1'),
        Source('Hipparchus — MacTutor', 'https://mathshistory.st-andrews.ac.uk/Biographies/Hipparchus/', 'R1', 'A1'),
        Source('Angles in the SI: the radian as an independent unit — arXiv', 'https://arxiv.org/pdf/2101.01578', 'R1', 'A1'),
        Source('Decimal time — MacTutor', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Decimal_time/', 'R1', 'A1'),
      ];
    case UnitCategory.price:
      return [
        Source('£sd — Wikipedia', 'https://en.wikipedia.org/wiki/%C2%A3sd', 'R2', 'A1'),
        Source('Denarius — Wikipedia', 'https://en.wikipedia.org/wiki/Denarius', 'R2', 'A1'),
        Source('Shekel — Wikipedia', 'https://en.wikipedia.org/wiki/Shekel', 'R2', 'A1'),
        Source('Non-decimal currency — Wikipedia', 'https://en.wikipedia.org/wiki/Non-decimal_currency', 'R2', 'A1'),
        Source('Charon\'s obol — Wikipedia', 'https://en.wikipedia.org/wiki/Charon\'s_obol', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A2'),
      ];
    case UnitCategory.temp:
      return [
        Source('Kelvin: History — NIST', 'https://www.nist.gov/si-redefinition/kelvin/kelvin-history', 'R1', 'A1'),
        Source('Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Fahrenheit', 'R2', 'A1'),
        Source('Daniel Gabriel Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Daniel_Gabriel_Fahrenheit', 'R2', 'A1'),
        Source('Réaumur scale — Wikipedia', 'https://en.wikipedia.org/wiki/R%C3%A9aumur_scale', 'R2', 'A1'),
        Source('Thermodynamic temperature — Wikipedia', 'https://en.wikipedia.org/wiki/Thermodynamic_temperature', 'R2', 'A1'),
        Source('Rankine scale — Wikipedia', 'https://en.wikipedia.org/wiki/Rankine_scale', 'R2', 'A1'),
      ];
    default:
      return const [];
  }
}
