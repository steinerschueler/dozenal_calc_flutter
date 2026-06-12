// Traducción al español de los capítulos «Recomendaciones». part of
// ../recommendations.dart. Registro de usuario avanzado con conocimientos
// técnicos (trigonometría de carpintería/DMS, referencia en base doce,
// valor didáctico del código abierto, RPN, aritmética exacta/simbólica).
// Evergreen: sin precios, versiones ni fechas.

part of '../recommendations.dart';

List<RecChapter> _recChaptersEs() => const [
  // ── Físico ────────────────────────────────────────────────────────────
  RecChapter(
    'Físico',
    intro:
        'Se busca un dispositivo compacto de bolsillo — no una calculadora '
        'gráfica voluminosa — que sea programable o incorpore un núcleo de '
        'cálculo abierto. Las calculadoras gráficas (NumWorks, TI-Nspire, '
        'Casio fx-CG) quedan fuera por su factor de forma; la clásica HP 35s '
        'está descatalogada y solo se consigue de segunda mano a precios de '
        'coleccionista.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Propietaria · científica programable',
        blurb:
            'Calculadora de bolsillo programable con memoria de fórmulas y '
            'visualización natural. Para fórmulas recurrentes de construcción '
            'en madera (profundidad de muesca, geometría de ensambles) se '
            'pueden almacenar programas con parámetros.',
        pros: [
          'Compacta y apta para el bolsillo',
          'Programable, con biblioteca de fórmulas',
          'Entrada algebraica familiar, grados/minutos/segundos',
          'Excelente relación calidad-precio',
        ],
        cons: [
          'En Europa generalmente solo disponible por importación',
          'Propietaria — sin acceso al código',
          'Sin salida en base doce',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Núcleo Free42 (GPL-2.0) · RPN · gama alta',
        blurb:
            'Calculadora RPN insignia y homenaje a la HP-42S, en carcasa de '
            'acero inoxidable fresada por CNC con USB-C. El núcleo de cálculo '
            'es el Free42 de código abierto de Thomas Okken con aritmética '
            'decimal-128 (34 dígitos).',
        pros: [
          'Núcleo de cálculo abierto (Free42, GPL) — comportamiento estudiable',
          'Idéntico al motor de escritorio/móvil, programas portables',
          'Precisión extrema (34 dígitos decimales)',
          'Construcción de reliquia, almacenamiento masivo USB-C',
        ],
        cons: [
          'Solo RPN — requiere adaptación',
          'Precio de gama alta, a veces difícil de encontrar',
          'Funciones BASE sin base doce',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Propietaria · científica (económica)',
        blurb:
            'El ClassWiz actual, no programable — la opción económica y '
            'disponible en cualquier lugar para quienes no necesitan '
            'programabilidad.',
        pros: [
          'Económica y disponible prácticamente en cualquier parte',
          'Visualización natural, amplio conjunto de funciones',
          'Compacta, robusta',
        ],
        cons: [
          'No programable',
          'Propietaria',
          'Notablemente más lenta en operaciones complejas',
          'Sin base doce',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'Conclusión: el fx-5800P es la elección racional — programable, '
        'compacta, entrada familiar. El DM42n es la pieza de entusiasta con '
        'núcleo abierto (aunque solo RPN y precio de gama alta). Consejo: '
        'prueba RPN gratis con Free42/Plus42 antes de comprar el hardware.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Para el uso cotidiano en el teléfono. Aquí las aplicaciones más '
        'potentes disponibles a través de Google Play de forma habitual — las '
        'opciones puramente de código abierto siguen en el capítulo siguiente '
        '(F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Propietaria · CAS y gráficas',
        blurb:
            'Calculadora científica con álgebra simbólica, gráficas, '
            'ecuaciones, derivadas e integrales. Muy extendida, mantenida '
            'activamente, con diseños para distintos tamaños de pantalla.',
        pros: [
          'Gran conjunto de funciones (CAS, gráficas, alta cantidad de dígitos)',
          'Visualización de fracciones y decimales periódicos',
          'Mantenida activamente, diseños personalizables',
        ],
        cons: [
          'Propietaria — sin valor didáctico para proyectos propios',
          'El conjunto completo de funciones es de pago',
          'Sin salida en base doce',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Reimplementación completa de la HP-42S sin código de HP. Plus42 '
            'la amplía con ecuaciones algebraicas y un solver, reduciendo '
            'notablemente la barrera de entrada a RPN.',
        pros: [
          'Código abierto (GPL), código como material de aprendizaje',
          'Idéntico entre plataformas — programas portables',
          'Precisión decimal-128',
          'Plus42 con ecuaciones algebraicas',
        ],
        cons: [
          'Lógica RPN (Plus42 lo suaviza)',
          'Funciones BASE sin base doce',
          'De pago en móvil (gratis en escritorio)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'Conclusión: HiPER Calc Pro como la herramienta cotidiana más potente '
        'del Play Store; Free42/Plus42 como la vía RPN de código abierto con '
        'precisión decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Aplicaciones puramente de código abierto de la tienda F-Droid (o '
        'directamente del desarrollador): código inspeccionable, sin '
        'rastreadores — y por tanto material de aprendizaje y referencia para '
        'proyectos propios.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS y unidades',
        blurb:
            'La interfaz Android oficial del motor Qalculate!: una UI en '
            'Kotlin/Java sobre la biblioteca nativa C++ libqalculate. Cálculo '
            'simbólico, precisión arbitraria, aritmética de intervalos, '
            'conversión de unidades — el motor más potente del campo.',
        pros: [
          'Código abierto (GPL), motor más potente (CAS, unidades, precisión)',
          'Calcula también en base doce (duodecimal) — el único aquí',
          'Arquitectura instructiva: UI en Kotlin sobre núcleo nativo',
          'Sin rastreadores',
        ],
        cons: [
          'Se obtiene principalmente a través de F-Droid o compilación directa',
          'El proyecto rechaza la verificación de desarrollador de Google — '
              'la instalabilidad por canales habituales es incierta en el '
              'futuro (irrelevante a través de F-Droid)',
          'Mayor barrera de entrada que una calculadora simple',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Calculadora ligera y bien mantenida, escrita íntegramente en '
            'Kotlin. No es un campeón en funciones, pero el código es legible '
            'y compacto — destaca especialmente el cambio documentado de los '
            'números internos de Double a BigDecimal, exactamente la cuestión '
            'de precisión que también debe resolver una calculadora en base doce.',
        pros: [
          'Código abierto (GPL-3.0), código Kotlin limpio',
          'Objeto de aprendizaje y referencia ideal',
          'Historial, UI sobria, sin rastreadores',
        ],
        cons: [
          'Sin CAS, sin programabilidad',
          'Funcionalmente no es rival para HiPER/Qalculate',
          'Sin base doce',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'Conclusión: Qalculate! es la opción de código abierto más potente — '
        'y la única con salida en base doce. OpenCalc es la «mirada al motor» '
        'para desarrolladores.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS es la plataforma más débil para calculadoras de código abierto '
        '— aunque cuenta con una herramienta propietaria sobresaliente. '
        'Dicho con honestidad: la competencia FOSS real brilla por su '
        'ausencia.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Propietaria · herramienta de referencia',
        blurb:
            'Considerada la referencia en plataformas Apple desde los años '
            'noventa: amplias conversiones, entrada RPN de primera clase, '
            'profunda personalización (temas, distribuciones de teclas, cinta '
            'de papel). Funciona en iPhone, iPad, Apple Watch y Apple TV.',
        pros: [
          'Herramienta de primera clase, muy madura',
          'Modo RPN opcional, historial editable',
          'Muchas conversiones y constantes',
          'Versión Lite gratuita para empezar',
        ],
        cons: [
          'Propietaria — sin valor didáctico',
          'De pago',
          'La abundancia de funciones puede abrumar al principio',
          'Sin base doce',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Cubre el hueco del código abierto en iOS: Free42 es gratuito en '
            'el App Store y usa el mismo motor que en el resto de plataformas.',
        pros: [
          'Código abierto (GPL), Free42 gratuito',
          'Idéntico entre plataformas',
          'Precisión decimal-128',
          'Plus42 con ecuaciones algebraicas',
        ],
        cons: [
          'Lógica RPN (Plus42 lo suaviza)',
          'Sin base doce',
          'Plus42 es de pago',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclusión: PCalc como herramienta principal (sin competencia FOSS '
        'seria en iOS), Free42/Plus42 como recomendación de código abierto y '
        'una entrada limpia a RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'En el Mac confluyen la mejor herramienta nativa y el motor abierto '
        'más potente — conviene repartir roles: trabajo rápido con teclado '
        'aquí, trabajo exacto y simbólico allá.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · motor más potente',
        blurb:
            'La potencia de escritorio (también para Windows y Linux): '
            'simbólico, precisión arbitraria, conversión de unidades, '
            'representación gráfica. Instalable vía Homebrew; el CLI «qalc» '
            'se comporta igual que en Linux.',
        pros: [
          'Código abierto, motor más potente (CAS, unidades, fracciones exactas)',
          'Calcula también en base doce (duodecimal)',
          'Ampliable con funciones propias, CLI programable',
        ],
        cons: [
          'Menos pulido de forma «nativa Mac» que PCalc',
          'Su potencia requiere algo de aprendizaje',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Propietaria · calidad Mac nativa',
        blurb:
            'Las mismas fortalezas que en iOS, en una aplicación Mac pulida: '
            'profunda personalización y «Magic Variables» para reutilizar '
            'expresiones, más Handoff entre dispositivos Apple.',
        pros: [
          'Aplicación Mac nativa y madura',
          'RPN, cinta de papel, muchas conversiones',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Propietaria, de pago',
          'Sin base doce',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Disponible también para macOS — gratuito en escritorio. El mismo '
            'motor que el núcleo de cálculo del hardware DM42.',
        pros: [
          'Código abierto (GPL), gratuito en escritorio',
          'Precisión decimal-128',
          'Idéntico entre plataformas',
        ],
        cons: [
          'Lógica RPN',
          'Sin base doce',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclusión: PCalc para el trabajo rápido con teclado, Qalculate! '
        'para el trabajo exacto y simbólico (y base doce). Como especialistas '
        'de nicho: Numi (entrada en lenguaje natural) y Soulver (cálculo '
        'estilo bloc de notas).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'En Linux la situación es clara — un motor domina, y la verdadera '
        'pregunta es «¿GUI o terminal?». Para calculadoras estándar sencillas '
        'también están los clásicos de escritorio.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · sin rival',
        blurb:
            'Interfaces GTK y Qt más el CLI «qalc». El conjunto completo de '
            'libqalculate: simbólico, precisión arbitraria, propagación de '
            'incertidumbre, representación gráfica. «qalc» es programable '
            '(expresión como argumento o desde un archivo) y está empaquetado '
            'en todas las distribuciones principales.',
        pros: [
          'Código abierto, disponible en todas las distribuciones',
          'Motor más potente, calcula también en base doce',
          'CLI programable — alias, pipes, bibliotecas de funciones propias',
        ],
        cons: [
          'La abundancia de funciones requiere algo de aprendizaje',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · estándar de KDE',
        blurb:
            'La calculadora de KDE con modos científico y programador, y '
            'distribuciones de teclas personalizables — una base sólida.',
        pros: [
          'Código abierto, ligera',
          'Modo programador (bin/oct/hex)',
          'Bien integrada en KDE Plasma',
        ],
        cons: [
          'Sin CAS',
          'Sin base doce',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · estándar de GNOME',
        blurb:
            'La calculadora estándar de GNOME con unidades y divisas, más '
            'modos avanzado, financiero y de programador. Por debajo de '
            'Qalculate en potencia, pero sólidamente fiable.',
        pros: [
          'Código abierto, fácil de usar',
          'Unidades y divisas integradas',
        ],
        cons: [
          'Menos potente que Qalculate',
          'Sin base doce',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · desarrollo inactivo',
        blurb:
            'El antiguo secreto bien guardado: entrada rápida centrada en el '
            'teclado con resaltado de sintaxis y autocompletado, alta '
            'precisión, variables como en una hoja de cálculo. Estable — pero '
            'sin nueva versión desde hace años.',
        pros: [
          'Código abierto, entrada por teclado muy rápida',
          'Alta precisión, portable sin instalación',
        ],
        cons: [
          'Desarrollo inactivo — sin perspectiva de futuro',
          'Funcionalmente superado por Qalculate',
          'Sin base doce',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'Conclusión: Qalculate!/qalc sin competencia seria — la elección es '
        'en realidad solo GUI frente a flujos de trabajo en terminal. KCalc y '
        'GNOME Calculator como calculadoras estándar ligeras; SpeedCrunch '
        'utilizable, pero sin futuro.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'En Windows la competencia es escasa — un motor destaca, acompañado '
        'por el raro caso de una referencia con licencia permisiva cuyo '
        'código se puede reutilizar (a diferencia de GPL) sin complicaciones '
        'legales.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · ganador claro',
        blurb:
            'Compilaciones oficiales para Windows (qalculate-qt) con el mismo '
            'motor potente que en Mac y Linux: simbólico, precisión arbitraria, '
            'unidades, representación gráfica.',
        pros: [
          'Código abierto, motor más potente',
          'Calcula también en base doce (duodecimal)',
          'Ampliable con funciones propias',
        ],
        cons: [
          'Menos pulido de forma «nativa Windows»',
          'Su potencia requiere algo de aprendizaje',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Calculadora de Windows (Microsoft)',
        tag: 'MIT · preinstalada',
        blurb:
            'Código abierto en GitHub desde 2019 — y bajo la licencia MIT. '
            'Es el raro caso de una licencia permisiva en este campo y, por '
            'tanto, la referencia de código legalmente más sencilla (C++/C#). '
            'Ofrece un modo programador con bin/oct/hex.',
        pros: [
          'Código abierto bajo MIT — reutilización de código sin complicaciones legales',
          'Preinstalada y familiar',
          'Modo programador (bin/oct/hex)',
        ],
        cons: [
          'Sin CAS, sin programabilidad',
          'Precisión limitada',
          'Sin base doce',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · desarrollo inactivo',
        blurb:
            'Entrada rápida centrada en el teclado con resaltado de sintaxis '
            'y autocompletado, alta precisión, portable sin instalación — pero '
            'sin nueva versión desde hace años.',
        pros: [
          'Código abierto, entrada por teclado muy rápida',
          'Alta precisión, portable',
        ],
        cons: [
          'Desarrollo inactivo — sin perspectiva de futuro',
          'Funcionalmente superado por Qalculate',
          'Sin base doce',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Para los aficionados a RPN: gratuito en escritorio, el mismo '
            'motor que el núcleo de cálculo del hardware DM42.',
        pros: [
          'Código abierto (GPL), gratuito en escritorio',
          'Precisión decimal-128',
          'Idéntico entre plataformas',
        ],
        cons: [
          'Lógica RPN (Plus42 lo suaviza)',
          'Sin base doce',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclusión: Qalculate! como elección clara. Tener en mente la '
        'Calculadora de Windows como referencia de código con licencia MIT, '
        'SpeedCrunch solo con advertencia de mantenimiento, Free42/Plus42 '
        'para los aficionados a RPN.',
  ),
];
