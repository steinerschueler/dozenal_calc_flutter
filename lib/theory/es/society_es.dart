//  Prosa en español para los capítulos de la «Sociedad Dozenal». part of
// ../society_theory.dart. Frases sencillas (más fáciles de traducir). Hechos y
// opiniones atribuidas; honesto sobre las atribuciones inciertas (cascadas de
// citas), sin veredictos del narrador. Destilado de docs/research/society_*.md.

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersEs() => const [
  ProseChapter('Un movimiento a favor del doce', [
    ProseSection(
      'Pensadores aislados',
      'La idea de calcular en doce en lugar de en diez es antigua. Durante '
          'mucho tiempo, sin embargo, solo hubo defensores aislados, no un '
          'movimiento. Ya en el siglo XVIII se menciona al naturalista Buffon '
          '— aunque la fuente exacta de ello es incierta y va pasando de una '
          'obra de consulta a otra.\n\n'
          'Se vuelve más tangible en el siglo XIX. El inventor de la '
          'taquigrafía Isaac Pitman abogó por el doce a partir de 1857 y '
          'propuso signos propios para el diez y el once. El filósofo Herbert '
          'Spencer se pronunció a favor en 1896, explícitamente en contra del '
          'sistema métrico.',
    ),
    ProseSection(
      'Andrews y «New Numbers»',
      'Quien lo llevó al terreno práctico fue un estadounidense: Frank '
          'Emerson Andrews. En 1934 apareció su ensayo «An Excursion in '
          'Numbers» en el Atlantic Monthly — una revista que, según sus '
          'propias palabras, nunca antes había impreso matemáticas y que '
          'colocó en mitad del texto una advertencia para los lectores '
          'reacios a las matemáticas.\n\n'
          'En 1935 siguió su libro «New Numbers», el primero de su clase en '
          'los Estados Unidos. Su argumento era sencillo: el doce es divisible '
          'por 2, 3, 4 y 6; el diez solo por 2 y 5. Andrews era, no obstante, '
          'sobrio — consideraba improbable un cambio real frente al «tenaz '
          'poder de la costumbre».',
    ),
    ProseSection(
      'Nacen las sociedades',
      'De las cartas en respuesta al artículo de Andrews surgió un círculo de '
          'correspondencia y, a partir de él, en 1944 la «Duodecimal Society '
          'of America». El nombre se lo puso en broma Ralph «Whiskers» Beard; '
          'el capital inicial lo donó George Terry. Más tarde se rebautizó como '
          '«Dozenal Society of America» — porque en la palabra «duodecimal» se '
          'esconde el «decimal» del sistema decimal.\n\n'
          'En 1959 se le sumó la hermana británica, la Dozenal Society of '
          'Great Britain, con el matemático A. C. Aitken como miembro '
          'destacado. La sociedad estadounidense publica hasta hoy el '
          '«Duodecimal Bulletin»; entre sus miembros honorarios figuró el '
          'autor de ciencia ficción Isaac Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('Nuevas cifras para el diez y el once', [
    ProseSection(
      'El problema de los símbolos',
      'Quien calcula en doce necesita dos cifras adicionales — para el diez y '
          'para el once. Cuáles deban ser no está unificado hasta hoy; ni '
          'siquiera la sociedad estadounidense prescribe una notación fija.\n\n'
          'Existen varias variantes: el dos y el tres girados de Pitman (↊ y '
          '↋), la X cursiva y la E redondeada de Andrews, un sextil y una '
          'almohadilla (inspirados en las teclas del teléfono), los glifos del '
          'tipógrafo Dwiggins — y simplemente las letras A y B del mundo de la '
          'informática.',
    ),
    ProseSection(
      'Pitman, Unicode y el cambio de 2026',
      'La sociedad estadounidense cambió sus signos varias veces: sextil y '
          'almohadilla hasta alrededor de 2008, luego los glifos de Dwiggins '
          'y, desde 2015, las cifras de Pitman. En 2015 también el estándar '
          'Unicode incorporó oficialmente los signos de Pitman.\n\n'
          'A principios de 2026 la sociedad pasó sus páginas web a las letras '
          'A y B — no porque renunciara a Pitman, sino porque los caracteres '
          'especiales todavía no se muestran de forma fiable en muchos '
          'navegadores y teléfonos. En el boletín impreso, las cifras de '
          'Pitman siguen siendo el estándar. (Esta app muestra en la pantalla, '
          'a elección, glifos propios o 0–9 / A, B.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'La pieza de dozenal más conocida de la cultura popular es una canción: '
          '«Little Twelvetoes», de la serie educativa estadounidense '
          'Schoolhouse Rock, escrita y cantada por Bob Dorough, emitida por '
          'primera vez en 1973.\n\n'
          'En ella, un amable extraterrestre con doce dedos en los pies '
          'muestra cómo alguien con doce «dedos» habría inventado dos cifras '
          'nuevas — pronunciadas «dek» para el diez y «el» para el once. Se '
          'consideró demasiado difícil para los niños de primaria y se emitió '
          'con menos frecuencia que los demás episodios, pero quedó en la '
          'memoria de muchos.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, gro, mo — hablar en dozenal', [
    ProseSection(
      'Docena, gruesa y gran gruesa',
      'El doce se convierte en el «10» en base doce. Para sus posiciones '
          'existen desde hace mucho palabras cotidianas: doce unidades son una '
          'docena, doce docenas (144) una gruesa, doce gruesas (1728) una gran '
          'gruesa.\n\n'
          'Esto es notable: estas familiares palabras del comercio son en '
          'realidad ya valores posicionales dozenales — una docena es el «10», '
          'la gruesa el «100», la gran gruesa el «1000» del mundo del doce.',
    ),
    ProseSection(
      'Dek, el y la denominación sistemática',
      'Las dos cifras nuevas se pronuncian normalmente «dek» (diez) y «el» '
          '(once). Para las posiciones se usan en corto do, gro, mo (de dozen, '
          'gross, great gross).\n\n'
          'Junto a ello existe una denominación sistemática, desarrollada en '
          'la comunidad en línea: raíces fijas para las cifras (un, bi, tri … '
          'dec, lev) más terminaciones para las potencias del doce — «-qua» '
          'hacia arriba, «-cia» hacia abajo. Lo bonito es que «uncia» es '
          'exactamente una doceava parte — la misma palabra latina de la que '
          'nacieron «pulgada» (inch) y «onza».',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, sociedades y herramientas hoy', [
    ProseSection(
      'TGM — un sistema de medidas dozenal',
      'Tom Pendlebury, de la sociedad británica, diseñó un sistema de medidas '
          'dozenal completo: TGM, llamado así por sus tres unidades '
          'fundamentales Tim, Grafut y Maz.\n\n'
          'A diferencia del sistema métrico, no comienza por la longitud, sino '
          'por el tiempo y lo deriva todo a partir de la gravedad terrestre. '
          'El «Grafut» (pie gravitacional) queda algo por debajo de un pie. De '
          'él se siguen de forma coherente unidades para la superficie, el '
          'volumen, la velocidad y la fuerza — una contraparte cerrada en sí '
          'misma del sistema métrico, toda en doce.',
    ),
    ProseSection(
      'Las sociedades hoy',
      'Ambas sociedades siguen existiendo, pero son pequeñas y de carácter '
          'voluntario; no hay cifras fiables de miembros. La estadounidense '
          'sigue publicando el Duodecimal Bulletin y pone a disposición '
          'herramientas de aprendizaje y de conversión; la británica cuida '
          'sobre todo el material de TGM.\n\n'
          'El lugar más vivo es el foro en línea «Dozensonline». Allí '
          'surgieron la denominación sistemática de los números y el debate '
          'nunca del todo cerrado sobre las cifras correctas. La comunidad es '
          'pequeña, pero activa.',
    ),
    ProseSection(
      'Calculadoras, apps — y esta app',
      'En torno al doce ha surgido una escena de herramientas '
          'sorprendentemente animada: calculadoras dozenales, conversores de '
          'medidas, incluso un reloj dozenal y un calendario, muchos de ellos '
          'de código abierto y construidos por miembros de las sociedades.\n\n'
          'Esta app se inscribe justo ahí — una calculadora que calcula de '
          'forma nativa en base doce, con glifos propios, fracciones exactas y '
          'una parte de unidades. Es una pequeña contribución a una larga y '
          'entrañable tradición de nicho.',
    ),
    ProseSection(
      'Por qué el mundo sigue siendo decimal a pesar de todo',
      'Que el doce no se imponga apenas se debe a las matemáticas — estas '
          'están de su lado. Se debe a la costumbre: el sistema decimal está '
          'metido en la lengua, la escuela, el derecho y la técnica, y un '
          'cambio sería enormemente costoso. Incluso el cambio mucho menor de '
          'los Estados Unidos al sistema métrico fracasó por ello.\n\n'
          'En consecuencia, la mayoría de los implicados entienden hoy el '
          'asunto más como un atractivo experimento mental que como un plan '
          'serio de conversión. Muestra que la elección de la base numérica no '
          'es algo evidente — y afina la mirada hacia los números con los que '
          'tratamos a diario.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
];
