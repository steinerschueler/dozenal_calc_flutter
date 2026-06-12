// es manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_es.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersEs() => const [
  ManualChapter('Grundbedienung', [
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
      "advertencia) borra toda la entrada y el resultado ; Del "
      "elimina el carácter a la izquierda del cursor.",
    ),
    _H("Ayuda y teoría"),
    _P(
      "A la izquierda y a la derecha de la tecla =, dos botones "
      "redondos: (i) abre estos doce capítulos teóricos, (?) "
      "reproduce el recorrido rápido con los marcadores rojos. El "
      "recorrido se abre automáticamente en el primer lanzamiento.",
    ),
    _H("Cursor y navegación"),
    _P(
      "La barra roja en el campo de entrada es el cursor. Usa ◀ "
      "y ▶ para moverlo, insertando o eliminando caracteres en "
      "medio de una fórmula. Después de un cálculo, el cursor se "
      "mueve al campo de resultado — las flechas mueven entonces "
      "el cursor del resultado. Tan pronto comienzas una nueva "
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
      "además de EXP y DRG. La misma tecla lo cierra, o un toque fuera del "
      "panel. En tabletas todos los conjuntos están visibles uno "
      "al lado del otro de todos modos — no hay superposición.",
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
];
