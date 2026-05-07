// Step 11 of PORTING.md: info-modal content.
// Port of src/info_content.rs (chapter prose) + the painting.rs helpers
// (info_h / info_p / info_pre, draw_digit_legend, draw_chapter4_svg,
// draw_chapter5_svg). German prose is reproduced verbatim from the Rust
// source; one-line surface-level edits are not allowed without an explicit
// content change request.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'glyph_painter.dart';

/// Chapter list titles (12 chapters, fixed). Mirrors Rust `INFO_TITLES`.
const List<String> infoTitles = [
  'Bedienung des Rechners',
  'Was ist das Dozenalsystem?',
  'Fibonacci, Quadratzahlen und Kuriositäten',
  'Das Zwölfeck — Grundlagen',
  'Das Zwölfeck — Winkel und Diagonalen',
  'Das Zwölfeck — Flächen und Verhältnisse',
  'Der Dodekaeder — zwölf Fünfecke im Raum',
  'Der Dodekaeder — φ, Dualität und Symmetrie',
  'Zwölf Tierkreiszeichen und der Himmel',
  'Zwölf Flächen in Kristallen und Lebewesen',
  'Zwölf Glieder an der Hand',
  'Zoll, Fuss, Pfund — und warum sie dozenal Sinn ergeben',
];

// ---------------------------------------------------------------------------
// Helper widgets (port of info_h, info_p, info_pre).
// ---------------------------------------------------------------------------

class _H extends StatelessWidget {
  final String text;
  const _H(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 4),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );
}

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            height: 1.45,
            color: Color(0xFFE0E0E0),
          ),
        ),
      );
}

class _Pre extends StatelessWidget {
  final String text;
  const _Pre(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.5,
            color: Color(0xFFE0E0E0),
          ),
        ),
      );
}

// ---------------------------------------------------------------------------
// Digit legend (chapter 1).
// ---------------------------------------------------------------------------

class _DigitLegend extends StatelessWidget {
  const _DigitLegend();

  @override
  Widget build(BuildContext context) {
    Widget row(int v) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CustomPaint(
                  painter: DozenalGlyphPainter(
                    digit: DozenalDigit.values[v],
                    strokeWidth: 1.4,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '= $v',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  color: Color(0xFFC8C8C8),
                ),
              ),
            ],
          ),
        );
    Widget col(Iterable<int> values) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map(row).toList(),
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          col([0, 1, 2, 3, 4, 5]),
          const SizedBox(width: 24),
          col([6, 7, 8, 9, 10, 11]),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Chapter-4 illustration: dodecagon + inscribed triangle/square/hexagon.
// Port of painting.rs::draw_chapter4_svg.
// ---------------------------------------------------------------------------

class _Chapter4Illustration extends StatelessWidget {
  const _Chapter4Illustration();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: _Chapter4Painter()),
          ),
          const SizedBox(height: 8),
          _legendRow(
            const Color(0x509FE1CB),
            const Color(0xFF0F6E56),
            'Dreieck (jede 4. Ecke)',
          ),
          _legendRow(
            const Color(0x5085B7EB),
            const Color(0xFF185FA5),
            'Quadrat (jede 3. Ecke)',
          ),
          _legendRow(
            const Color(0x50AFA9EC),
            const Color(0xFF534AB7),
            'Sechseck (jede 2. Ecke)',
          ),
        ],
      ),
    );
  }

  Widget _legendRow(Color fill, Color border, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: fill,
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Color(0xFFC8C8C8),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chapter4Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(size.width, size.height) * 0.42;
    final verts = List<Offset>.generate(12, (i) {
      final a = (i * 30 - 90) * math.pi / 180;
      return Offset(cx + r * math.cos(a), cy + r * math.sin(a));
    });

    void fillPolygon(List<int> idx, Color fill, Color stroke) {
      final path = Path()..moveTo(verts[idx[0]].dx, verts[idx[0]].dy);
      for (var i = 1; i < idx.length; i++) {
        path.lineTo(verts[idx[i]].dx, verts[idx[i]].dy);
      }
      path.close();
      canvas.drawPath(path, Paint()..color = fill);
      canvas.drawPath(
        path,
        Paint()
          ..color = stroke
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    }

    // Hexagon (purple)
    fillPolygon(
      [0, 2, 4, 6, 8, 10],
      const Color(0x20AFA9EC),
      const Color(0xFF534AB7),
    );
    // Square (blue)
    fillPolygon(
      [0, 3, 6, 9],
      const Color(0x2085B7EB),
      const Color(0xFF185FA5),
    );
    // Triangle (teal)
    fillPolygon(
      [0, 4, 8],
      const Color(0x209FE1CB),
      const Color(0xFF0F6E56),
    );

    // Dodecagon outline
    final outline = Path()..moveTo(verts.first.dx, verts.first.dy);
    for (var i = 1; i < verts.length; i++) {
      outline.lineTo(verts[i].dx, verts[i].dy);
    }
    outline.close();
    canvas.drawPath(
      outline,
      Paint()
        ..color = const Color(0xFFD0D0D0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    // Corner dots: square vertices (i % 3 == 0) larger/brighter.
    for (var i = 0; i < verts.length; i++) {
      final isPrimary = i % 3 == 0;
      canvas.drawCircle(
        verts[i],
        isPrimary ? 3.5 : 2.5,
        Paint()
          ..color = isPrimary
              ? Colors.white
              : const Color(0xFF8C8C8C),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _Chapter4Painter old) => false;
}

// ---------------------------------------------------------------------------
// Chapter-5 illustration: dodecagon + 6 diagonal types.
// Port of painting.rs::draw_chapter5_svg.
// ---------------------------------------------------------------------------

class _Chapter5Illustration extends StatelessWidget {
  const _Chapter5Illustration();

  static const _diagonals = <(List<int>, Color, String, String)>[
    ([0, 1], Color(0xFF5F5E5A), 's = 1', '≈ 1.000'),
    ([1, 3], Color(0xFF0F6E56), 'd₂ = √(2+√3)', '≈ 1.932'),
    ([0, 3], Color(0xFF185FA5), 'd₃ = 1+√3', '≈ 2.732'),
    ([1, 5], Color(0xFF534AB7), 'd₄ = (3√2+√6)/2', '≈ 3.346'),
    ([0, 5], Color(0xFF993C1D), 'd₅ = 2+√3', '≈ 3.732'),
    ([0, 6], Color(0xFFA32D2D), 'd₆ = √6+√2', '≈ 3.864'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: _Chapter5Painter()),
          ),
          const SizedBox(height: 8),
          for (final d in _diagonals) _legendRow(d.$2, d.$3, d.$4),
        ],
      ),
    );
  }

  Widget _legendRow(Color color, String formula, String approx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 3,
            color: color,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 160,
            child: Text(
              formula,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
          Text(
            approx,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w300,
              color: Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chapter5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(size.width, size.height) * 0.42;
    final verts = List<Offset>.generate(12, (i) {
      final a = (i * 30 - 90) * math.pi / 180;
      return Offset(cx + r * math.cos(a), cy + r * math.sin(a));
    });

    // Subtle dodecagon outline
    final outline = Path()..moveTo(verts.first.dx, verts.first.dy);
    for (var i = 1; i < verts.length; i++) {
      outline.lineTo(verts[i].dx, verts[i].dy);
    }
    outline.close();
    canvas.drawPath(
      outline,
      Paint()
        ..color = const Color(0xFF6E6E6E)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // All vertex dots (subtle)
    for (final v in verts) {
      canvas.drawCircle(v, 2.0, Paint()..color = const Color(0xFF646464));
    }

    // 6 diagonal types
    for (final d in _Chapter5Illustration._diagonals) {
      canvas.drawLine(
        verts[d.$1[0]],
        verts[d.$1[1]],
        Paint()
          ..color = d.$2
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round,
      );
    }

    // Highlight involved vertices
    for (final i in [0, 1, 3, 5, 6]) {
      canvas.drawCircle(verts[i], 4.0, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant _Chapter5Painter old) => false;
}

// ---------------------------------------------------------------------------
// Chapter content. Each entry returns the body widgets for that chapter.
// One-to-one port of src/info_content.rs::draw_info_chapter.
// ---------------------------------------------------------------------------

List<Widget> buildChapterContent(int chapter) {
  switch (chapter) {
    case 0:
      return [
        const _H('Die Ziffern'),
        const _P(
          'Dieser Rechner verwendet eigene Symbole für alle zwölf Ziffern. '
          'Vier Ankerziffern sind stilisierte Pfeilspitzen, die in die vier '
          'Himmelsrichtungen zeigen — 1 (oben), 4 (links), 7 (rechts), '
          'A (unten). Sie teilen den Zahlenkreis in vier Dreiergruppen, wie '
          'die Stunden 12, 3, 6 und 9 auf einem Zifferblatt.',
        ),
        const _P(
          'Alle Ziffern dazwischen bestehen aus Halbkreisen und Vollkreisen. '
          'Die Null ist ein einfacher Kreis, B (= elf) ein gefüllter Kreis.',
        ),
        const _DigitLegend(),
        const _H('Grundbedienung'),
        const _P(
          'Tippe Zahlen und Operatoren wie auf einem gewöhnlichen Taschen'
          'rechner. Drücke die breite Taste am unteren Rand, um das Ergebnis '
          'zu berechnen. AC löscht die gesamte Eingabe und das Ergebnis, Del '
          'entfernt das Zeichen links vom Cursor.',
        ),
        const _H('Cursor und Navigation'),
        const _P(
          'Der rote Strich im Eingabefeld ist der Cursor. Mit ◀ und ▶ bewegst '
          'du ihn, um mitten in einer Formel Zeichen einzufügen oder zu '
          'löschen. Nach einer Berechnung wandert der Cursor ins Ergebnis'
          'feld — die Pfeile bewegen dann den Ergebnis-Cursor. Sobald du eine '
          'neue Eingabe machst, springt der Cursor zurück ins Eingabefeld.',
        ),
        const _H('Weiterrechnen'),
        const _P(
          'Nach einer Berechnung kannst du direkt mit einem Operator weiter'
          'machen. Tippst du zum Beispiel + 5 =, verwendet der Rechner '
          'automatisch das letzte Ergebnis als ersten Operanden. Wenn du '
          'stattdessen eine ganz neue Rechnung beginnen willst, drücke '
          'zuerst AC.',
        ),
        const _H('Doppelklick für Umkehrfunktionen'),
        const _P(
          'Ein zweiter Klick auf eine Funktionstaste wandelt sie in ihre '
          'Umkehrfunktion um: sin wird zu sin⁻¹, cos zu cos⁻¹, und so '
          'weiter. Das gilt auch für die hyperbolischen Funktionen im '
          'Erweiterungsfeld. Ein kleiner goldener Punkt auf der Taste zeigt '
          'an, dass der nächste Klick umkehrt.',
        ),
        const _H('Spezialoperatoren'),
        const _P(
          'x² quadriert die vorangehende Zahl. √ berechnet die Quadratwurzel '
          '— steht links davon eine Zahl, wird diese als Wurzelgrad '
          'verwendet: 3√27 ergibt die dritte Wurzel von 27. log berechnet '
          'den Logarithmus zur Basis der vorangehenden Zahl. ⊕ berechnet '
          'die Paralleladdition: a ⊕ b = (a·b)/(a+b), nützlich für '
          'Parallelschaltungen von Widerständen.',
        ),
        const _H('Erweiterungsfeld'),
        const _P(
          'Die Taste … rechts unten öffnet das Erweiterungsfeld mit weiteren '
          'Funktionen: Speicher, Konstanten (π, e, φ, √2), hyperbolische '
          'Funktionen, erweiterte Operatoren und Einstellungen. Es schliesst '
          'sich über die Taste rechts unten im Erweiterungsfeld selbst.',
        ),
        const _Pre(
          '  6 — Speicher:    STO   RCL   MC    Ans\n'
          '  7 — Konstanten:  π     e     φ     √2\n'
          '  8 — Hyperbel:   sinh  cosh  tanh  coth\n'
          '  9 — Erweitert:  n!    |x|   1/x   mod\n'
          '  10 — Modi:      Doz↔  DRG   Info  ×',
        ),
        const _H('Speicher'),
        const _P(
          'STO speichert das aktuelle Ergebnis, RCL fügt den gespeicherten '
          'Wert in die Eingabe ein, MC löscht den Speicher. Ein kleines M '
          'im Display zeigt an, dass etwas gespeichert ist. Ans fügt das '
          'Ergebnis der letzten Berechnung ein — exakte rationale Werte '
          'werden vollständig mitgespeichert, Periodizität bleibt erhalten.',
        ),
        const _H('Periodenstrich'),
        const _P(
          'Wenn das Ergebnis ein periodischer Bruch ist, zeigt der Rechner '
          'die sich wiederholenden Ziffern mit einem Strich darüber an. '
          'Beispiel: 1/5 ergibt 0.2497 mit Strich über allen vier Ziffern. '
          'Bei Perioden mit mehr als fünf Stellen werden nur die ersten '
          'fünf gezeigt, gefolgt von …',
        ),
        const _H('Anzeige und Winkelmodus'),
        const _P(
          'Doz↔Dec im Erweiterungsfeld schaltet die Anzeige zwischen '
          'dozenal (Basis 12) und dezimal (Basis 10) um — praktisch, um ein '
          'Ergebnis in vertrauter Schreibweise zu überprüfen. DRG wechselt '
          'den Winkelmodus für trigonometrische Funktionen: '
          'Rad → Grad → Gon → Rad, angezeigt oben rechts im Display.',
        ),
      ];
    case 1:
      return [
        const _H('Das Prinzip'),
        const _P(
          'Im Dezimalsystem hat jede Stelle den zehnfachen Wert der Stelle '
          'rechts davon: Einer, Zehner, Hunderter. Im Dozenalsystem ist die '
          'Basis nicht zehn, sondern zwölf. Die Stellenwerte sind Potenzen '
          'von 12: Einer, Zwölfer, Hundertvierundvierziger. Die Zahl »100« '
          'bedeutet hier nicht zehn mal zehn, sondern zwölf mal zwölf — '
          'also 144 im Dezimalen.',
        ),
        const _P(
          'Dafür braucht man zwölf Ziffern statt zehn. Für die Werte zehn '
          'und elf kommen zwei neue hinzu, die dieser Rechner mit eigenen '
          'Symbolen darstellt (A = zehn, B = elf). Beispiel: 2B (dozenal) '
          '= 2·12 + 11 = 35 (dezimal).',
        ),
        const _H('Warum gerade zwölf?'),
        const _P(
          'Der Grund ist Teilbarkeit. Zwölf hat sechs Teiler: 1, 2, 3, 4, '
          '6 und 12. Zehn hat nur vier: 1, 2, 5 und 10. Das klingt nach '
          'einem kleinen Unterschied, aber die Auswirkung auf den Alltag '
          'ist erheblich — vor allem beim Bruchrechnen.',
        ),
        const _H('Stammbrüche im Vergleich'),
        const _Pre(
          '  Bruch   Basis 10    Basis 12\n'
          '  1/2     0.5         0.6\n'
          '  1/3     0.333…      0.4\n'
          '  1/4     0.25        0.3\n'
          '  1/5     0.2         0.2497…\n'
          '  1/6     0.166…      0.2\n'
          '  1/8     0.125       0.16\n'
          '  1/9     0.111…      0.14\n'
          '  1/10    0.1         0.1249…\n'
          '  1/12    0.0833…     0.1',
        ),
        const _P(
          'In Basis 10 sind Drittel und Sechstel unendliche Dezimalbrüche. '
          'In Basis 12 sind sie kurz und exakt. Dafür werden Fünftel und '
          'Zehntel periodisch — ein fairer Tausch, wenn man bedenkt, wie '
          'viel häufiger man durch drei und vier teilt als durch fünf.',
        ),
        const _H('Die Regel dahinter'),
        const _P(
          'Welche Brüche endlich sind und welche periodisch werden, folgt '
          'einem einfachen Gesetz: ein Bruch 1/n hat in einer Basis b genau '
          'dann eine endliche Darstellung, wenn alle Primfaktoren von n '
          'auch Primfaktoren von b sind. Die Primfaktoren von 12 sind 2 '
          'und 3. Also ist jeder Bruch endlich, dessen Nenner nur aus '
          'Zweien und Dreien zusammengesetzt ist. Alles andere — Nenner '
          'mit einer 5, 7 oder 11 — wird periodisch. Der Rechner zeigt '
          'diese Periodizität mit einem Strich über den sich wiederholenden '
          'Ziffern an.',
        ),
        const _H('Spuren in der Geschichte'),
        const _P(
          'Die Zwölf als Ordnungsgrösse ist älter als jedes Zahlensystem. '
          'Die Babylonier rechneten in Basis 60, aber organisierten ihre '
          'Ziffern in Gruppen von 12. Im Handel zählte man in Dutzenden '
          '(12) und Gros (144 = 12²). Der Tag hat 2×12 Stunden, das Jahr '
          '12 Monate, der Vollkreis 360 = 30×12 Grad.',
        ),
        const _P(
          'Die Dozenal Society of America (gegründet 1944, heute mit '
          'weiteren Ablegern) setzt sich dafür ein, die Vorzüge der Basis '
          '12 bekannter zu machen. Dieser Rechner steht in dieser '
          'Tradition — nicht als Forderung nach einer Systemumstellung, '
          'sondern als Werkzeug zum Erforschen und Staunen.',
        ),
      ];
    case 2:
      return [
        const _H('144 — wo sich zwei Welten treffen'),
        const _P(
          'Die Fibonacci-Folge beginnt mit 1, 1, und jede weitere Zahl ist '
          'die Summe der beiden vorangehenden: 1, 1, 2, 3, 5, 8, 13, 21, '
          '34, 55, 89, 144, … Sie wächst exponentiell. Die Quadratzahlen '
          '— 1, 4, 9, 16, 25, 36, … — wachsen dagegen nur quadratisch. '
          'Zwei so unterschiedliche Folgen haben fast keinen Grund, sich '
          'jemals zu treffen. Und doch tun sie es: die zwölfte Fibonacci-'
          'Zahl ist 144, und 144 = 12².',
        ),
        const _P(
          'J. H. E. Cohn bewies 1964, dass dies kein Zufall ist, sondern '
          'ein Unikat: abgesehen von F(1) = F(2) = 1 gibt es keine weitere '
          'Fibonacci-Zahl, die zugleich eine perfekte Quadratzahl ist. '
          'Die Zwölf steht an einer einmaligen Kreuzung zweier '
          'fundamentaler Zahlenfolgen.',
        ),
        const _H('Der Goldene Schnitt'),
        const _P(
          'φ = (1+√5)/2 ≈ 1.618 ist der Grenzwert des Verhältnisses '
          'aufeinanderfolgender Fibonacci-Zahlen: F(n+1)/F(n) → φ. In '
          'Basis 12: φ ≈ 1.74BB677… — der Rechner hat φ als Konstante im '
          'Erweiterungsfeld.',
        ),
        const _P(
          'Wer φ² = tippt, wird sehen, dass das Ergebnis genau φ+1 ist — '
          'die definierende Eigenschaft des Goldenen Schnitts. Diese '
          'Identität macht φ zu einer algebraisch einzigartigen Konstante.',
        ),
        const _H('12 = 2² × 3 — eine Primfaktorzerlegung mit Folgen'),
        const _P(
          'Zwölf ist eine hochzusammengesetzte Zahl (highly composite '
          'number): sie hat mehr Teiler als jede kleinere natürliche '
          'Zahl. Die Teiler von 12 sind 1, 2, 3, 4, 6, 12 — das sind '
          'sechs Stück. Srinivasa Ramanujan definierte und untersuchte '
          'diese Klasse von Zahlen in einer berühmten Arbeit von 1915 in '
          'den Proceedings of the London Mathematical Society.',
        ),
        const _P(
          'Zwölf ist auch die kleinste abundante Zahl: die Summe ihrer '
          'echten Teiler (1+2+3+4+6 = 16) übertrifft die Zahl selbst. '
          'Bei den meisten kleinen Zahlen ist es umgekehrt — bei 10 '
          'ergibt 1+2+5 = 8, was kleiner ist als 10. Zwölf ist die erste '
          'Zahl, bei der die Teiler »überquellen«.',
        ),
        const _H('Platons ideale Stadt'),
        const _P(
          'In seinen »Gesetzen« (Buch V) stellt Platon die Frage, wie '
          'viele Bürger eine ideale Stadt haben sollte. Seine Antwort: '
          '5040. Das Argument ist nicht mystisch, sondern praktisch: '
          'eine Stadt muss ihre Bürger ständig in gleich grosse Gruppen '
          'einteilen. 5040 ist durch jede Zahl von 1 bis 12 teilbar '
          '(mit der einzigen Ausnahme von 11).',
        ),
        const _P(
          'Was Platon intuitiv beschreibt, ist dieselbe Einsicht, die '
          'dem Dozenalsystem zugrunde liegt: im Alltag sind die kleinen '
          'Teiler die wichtigen. 5040 = 7! ist die grosse Schwester der '
          'Zwölf — dieselbe Teilbarkeitsphilosophie auf eine ganze '
          'Stadtbevölkerung angewendet.',
        ),
      ];
    case 3:
      return [
        const _H('Was ist ein regelmässiges Zwölfeck?'),
        const _P(
          'Ein regelmässiges Zwölfeck (Dodekagon) ist ein Vieleck mit '
          'zwölf gleich langen Seiten und zwölf gleich grossen Innen'
          'winkeln. Jeder dieser Innenwinkel beträgt 150° — oder, im '
          'Dozenalsystem ausgedrückt, 106°. Es ist eine der ältesten '
          'und am häufigsten verwendeten geometrischen Formen: man '
          'findet sie in Zifferblättern, Münzen, Bauornamentik und '
          'Pflastermustern.',
        ),
        const _H('Das Schweizer Taschenmesser der Vielecke'),
        const _P(
          'Was das Zwölfeck einzigartig macht, ist nicht seine Form an '
          'sich, sondern was alles in ihm steckt. Verbindet man jede '
          'vierte Ecke, entsteht ein gleichseitiges Dreieck — exakt, '
          'nicht angenähert. Jede dritte Ecke ergibt ein Quadrat. Jede '
          'zweite Ecke ein regelmässiges Sechseck. Alle drei Figuren '
          'liegen perfekt im selben Kreis, der auch das Zwölfeck '
          'umschliesst.',
        ),
        const _P(
          'Das bedeutet: das Zwölfeck enthält die drei fundamentalen '
          'regulären Vielecke der Geometrie als exakte Teilfiguren. '
          'Kein anderes Vieleck mit so wenigen Ecken kann das von sich '
          'behaupten. Eine direkte Folge der Teilbarkeit von 12 durch '
          '2, 3, 4 und 6.',
        ),
        const _H('Konstruierbar mit Zirkel und Lineal'),
        const _P(
          'Nicht jedes regelmässige Vieleck lässt sich mit Zirkel und '
          'Lineal exakt konstruieren. Das Zwölfeck dagegen ist konstru'
          'ierbar: man beginnt mit einem Kreis, teilt ihn in sechs '
          'gleiche Teile (das gelingt, weil das Sechseck konstruierbar '
          'ist), halbiert dann jeden dieser Bögen, und hat zwölf '
          'gleichmässig verteilte Punkte auf dem Kreis.',
        ),
        const _P(
          'Die mathematische Grundlage: ein reguläres n-Eck ist genau '
          'dann konstruierbar, wenn n ein Produkt einer Zweierpotenz '
          'und verschiedener Fermat-Primzahlen ist (Gauss, 1796). '
          'Für 12 = 2² × 3 ist das erfüllt, weil 3 eine Fermat-'
          'Primzahl ist.',
        ),
        const _H('Symmetrie'),
        const _P(
          'Das regelmässige Zwölfeck hat 24 Symmetrien: 12 Drehungen '
          '(um 0°, 30°, 60°, …, 330°) und 12 Spiegelungen (6 durch '
          'gegenüberliegende Ecken, 6 durch gegenüberliegende '
          'Seitenmitten). In der Sprache der Algebra bilden diese 24 '
          'Symmetrien die Diedergruppe D₁₂. Jedes reguläre n-Eck hat '
          'genau 2n Symmetrien.',
        ),
        const _Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H('54 Diagonalen'),
        const _P(
          'Eine Diagonale verbindet zwei nicht benachbarte Ecken eines '
          'Vielecks. Die Formel n(n−3)/2 liefert für das Zwölfeck '
          '12×9/2 = 54 Diagonalen. Das klingt nach einem unübersicht'
          'lichen Netz — aber die Struktur ist bemerkenswert geordnet.',
        ),
        const _H('Sechs verschiedene Längen'),
        const _P(
          'Jede Diagonale überspringt eine bestimmte Anzahl von Ecken. '
          'Da das Zwölfeck symmetrisch ist, haben alle Diagonalen, die '
          'gleich viele Ecken überspringen, dieselbe Länge. Es gibt '
          'fünf mögliche Sprungweiten (1 bis 5 Ecken), plus den Durch'
          'messer mit 6 — also sechs verschiedene Längentypen. Bei '
          'Seitenlänge s = 1:',
        ),
        const _Pre(
          '  Typ      Überspringt   Länge (exakt)      Näherung\n'
          '  s (Seite)  —           1                  1.000\n'
          '  d₂         1 Ecke      √(2+√3)           1.932\n'
          '  d₃         2 Ecken     1+√3              2.732\n'
          '  d₄         3 Ecken     (3√2+√6)/2       3.346\n'
          '  d₅         4 Ecken     2+√3              3.732\n'
          '  d₆ (⌀)    5 Ecken     √6+√2             3.864',
        ),
        const _H('Verborgene Muster'),
        const _P(
          'Die dritte und die fünfte Diagonale unterscheiden sich um '
          'genau 1: d₃ = 1+√3 und d₅ = 2+√3. Die Differenz ist die '
          'Seitenlänge selbst — eine geometrische Tatsache, keine '
          'rechnerische.',
        ),
        const _P(
          'Der Durchmesser d₆ ist exakt doppelt so lang wie die '
          'kürzeste Diagonale d₂: √6+√2 = 2·√(2+√3). Durchmesser und '
          'kürzeste Diagonale stehen im Verhältnis 2:1 — dieselbe '
          'Proportion wie die Oktave in der Musik.',
        ),
        const _H('Das 15-Grad-Raster'),
        const _P(
          'Alle Winkel, die im Zwölfeck auftreten — zwischen Seiten, '
          'zwischen Diagonalen — sind Vielfache von 15°. Das liegt '
          'daran, dass die zwölf Ecken den Vollkreis in zwölf '
          'Sektoren zu je 30° teilen. 15° = 1/24 des Vollkreises. '
          'Dozenal: 15° = 13°doz, und 30° = 26°doz. Alle auftretenden '
          'Winkel lassen sich dozenal als ganzzahlige Vielfache von '
          '13° schreiben.',
        ),
        const _Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H('Die Fläche des Zwölfecks'),
        const _P(
          'Ein regelmässiges Zwölfeck mit Seitenlänge s hat die '
          'Fläche A = 3s²(2+√3). Die Herleitung ist anschaulich: '
          'man zerlegt das Zwölfeck vom Mittelpunkt aus in 12 gleich'
          'schenklige Dreiecke, berechnet die Fläche eines einzelnen '
          'Dreiecks und multipliziert mit 12.',
        ),
        const _P(
          'Bei s = 1 ergibt das A ≈ 11.196 (dezimal). Zum Vergleich: '
          'der Umkreis hat die Fläche πR² ≈ 11.725. Das Zwölfeck '
          'füllt seinen Umkreis zu mehr als 95% — deutlich besser '
          'als ein Sechseck (83%) und weit besser als ein Quadrat '
          '(64%) oder ein Dreieck (41%).',
        ),
        const _H('3/π — ein elegantes Verhältnis'),
        const _P(
          'Das Verhältnis der Zwölfeck-Fläche zur Umkreis-Fläche '
          'vereinfacht sich zu 3/π. Die Herleitung nutzt sin²(15°) '
          '= (2−√3)/4, wodurch sich im Flächenverhältnis der Faktor '
          '(2+√3)(2−√3) zu 1 kürzt, und es bleibt genau 3/π übrig.',
        ),
        const _P(
          '3/π ≈ 0.9549 (dezimal) — das Zwölfeck erfasst 95.5% der '
          'Kreisfläche. Tippe 3 / π = im Rechner, um es zu verifizieren.',
        ),
        const _H('Vier Vielecke im Vergleich'),
        const _P(
          'Alle folgenden Figuren teilen denselben Umkreis. '
          'Formel: A = (n/2)·R²·sin(2π/n).',
        ),
        const _Pre(
          '  Figur          Anteil    Formel\n'
          '  Dreieck        41.3%     3√3/(4π)\n'
          '  Quadrat        63.7%     2/π\n'
          '  Sechseck       82.7%     3√3/(2π)\n'
          '  Zwölfeck       95.5%     3/π',
        ),
        const _P(
          'Das Sechseck hat exakt die doppelte Fläche des Dreiecks '
          '(beide enthalten den Faktor 3√3). Und jeder Schritt bringt '
          'einen grösseren Flächenzuwachs, weil die Ecken den Kreis '
          'immer enger umschliessen.',
        ),
        const _H('Archimedes und die Kreiszahl'),
        const _P(
          'Archimedes berechnete π über Vielecke. Er verwendete ein '
          '96-Eck — 96 = 12×8 = 12×2³. Er begann mit dem Sechseck '
          '(das trivial konstruierbar ist) und verdoppelte die '
          'Eckenzahl dreimal: 6→12→24→48→96. Der Ausgangspunkt '
          'seiner Methode war also das Zwölfeck.',
        ),
        const _P(
          'Sein Ergebnis: 3 + 10/71 < π < 3 + 1/7. Ein 96-Eck füllt '
          'den Umkreis zu 99.93%. Von den 95.5% des Zwölfecks zu '
          '99.93% sind es nur drei Verdoppelungsschritte — ein '
          'bemerkenswertes Tempo der Konvergenz.',
        ),
      ];
    case 6:
      return [
        const _H('Zwölf Flächen'),
        const _P(
          'Der Dodekaeder ist ein Körper aus zwölf regelmässigen '
          'Fünfecken. Jede Fläche ist identisch, jede Kante gleich '
          'lang, und an jeder Ecke treffen genau drei Fünfecke '
          'zusammen. Insgesamt hat er 12 Flächen, 30 Kanten und 20 '
          'Ecken. Er ist einer der fünf platonischen Körper — die '
          'einzigen konvexen Körper, deren Flächen ausschliesslich '
          'aus identischen regelmässigen Vielecken bestehen.',
        ),
        const _H('Die fünf platonischen Körper'),
        const _Pre(
          '  Körper           Flächen  Ecken  Kanten  Form\n'
          '  Tetraeder            4      4       6   Dreiecke\n'
          '  Hexaeder/Würfel      6      8      12   Quadrate\n'
          '  Oktaeder             8      6      12   Dreiecke\n'
          '  Dodekaeder          12     20      30   Fünfecke\n'
          '  Ikosaeder           20     12      30   Dreiecke',
        ),
        const _P(
          'Der Dodekaeder ist der einzige platonische Körper mit '
          'fünfeckigen Flächen. Platon ordnete in seiner Kosmologie '
          'die vier anderen Körper den Elementen zu — den Dodekaeder '
          'dem Kosmos selbst.',
        ),
        const _H('Wie sieht er aus?'),
        const _P(
          'Wer Rollenspiele spielt, kennt ihn als D12 — den zwölf'
          'seitigen Würfel. Er liegt angenehm in der Hand und kommt '
          'zuverlässig auf einer Fläche zum Liegen. Der Fussball ist '
          'kein Dodekaeder: er ist ein abgestumpftes Ikosaeder aus '
          '12 Fünfecken und 20 Sechsecken.',
        ),
        const _H('Gallorömische Pentagondodekaeder'),
        const _P(
          'Über hundert kleine Bronzeobjekte in Form des Dodekaeders '
          'wurden in Nordeuropa gefunden, datiert auf das 2. bis 4. '
          'Jahrhundert n. Chr. Sie haben zwölf fünfeckige Flächen '
          'mit unterschiedlich grossen runden Löchern darin. Niemand '
          'weiss mit Sicherheit, wofür sie verwendet wurden. '
          'Hypothesen reichen von Kerzenhaltern über Vermessungs'
          'instrumente bis zu religiösen Gegenständen. Das Rätsel '
          'ist bis heute ungelöst.',
        ),
        const _H('Eulers Polyedersatz'),
        const _P(
          'Für jeden konvexen Polyeder gilt eine einfache Beziehung: '
          'Ecken minus Kanten plus Flächen ist immer gleich zwei. '
          'Leonhard Euler formulierte dieses Gesetz 1758. Für den '
          'Dodekaeder: 20 − 30 + 12 = 2. Diese Formel gilt für alle '
          'fünf platonischen Körper, für jedes Prisma, für jede '
          'Pyramide, für jeden konvexen Körper überhaupt.',
        ),
      ];
    case 7:
      return [
        const _H('Der Goldene Schnitt im Dodekaeder'),
        const _P(
          'Jede Fläche des Dodekaeders ist ein regelmässiges Fünfeck '
          '— und das regelmässige Fünfeck ist die Heimat des Goldenen '
          'Schnitts. Die Diagonale eines solchen Fünfecks verhält '
          'sich zu seiner Seite exakt wie φ = (1+√5)/2 ≈ 1.618 '
          '(dezimal) zu 1. Diese Proportion durchdringt den gesamten '
          'Körper.',
        ),
        const _Pre(
          '  Grösse            Formel              Dezimalwert\n'
          '  Volumen           (15+7√5)/4          ≈ 7.663\n'
          '  Oberfläche        3√(25+10√5)         ≈ 20.646\n'
          '  Umkugelradius     √3·φ/2              ≈ 1.401\n'
          '  Inkugelradius     √(25+11√5)/(2√10)   ≈ 1.114',
        ),
        const _P(
          'Wer im Rechner φ² = tippt, erhält φ+1. Das ist die '
          'definierende Eigenschaft des Goldenen Schnitts — und der '
          'Grund, warum φ in so vielen Formeln des Dodekaeders '
          'erscheint.',
        ),
        const _H('Dualität — der Spiegel des Ikosaeders'),
        const _P(
          'Zu jedem platonischen Körper gibt es einen dualen Körper: '
          'man ersetzt jede Fläche durch eine Ecke (im Mittelpunkt '
          'der Fläche) und verbindet benachbarte neue Ecken mit '
          'Kanten. Beim Dodekaeder entsteht so das Ikosaeder — und '
          'umgekehrt:',
        ),
        const _Pre(
          '               Dodekaeder   Ikosaeder\n'
          '  Flächen            12           20\n'
          '  Kanten             30           30\n'
          '  Ecken              20           12',
        ),
        const _P(
          'Flächen und Ecken tauschen die Plätze, die Kantenzahl '
          'bleibt gleich. Die 12 erscheint in beiden Körpern — einmal '
          'als Flächenzahl, einmal als Eckenzahl.',
        ),
        const _H('120 Symmetrien'),
        const _P(
          'Der Dodekaeder besitzt die reichste Symmetrie unter allen '
          'platonischen Körpern: die Ikosaedergruppe Iₕ mit 120 '
          'Elementen — 60 Drehungen und 60 Dreh-Spiegelungen. Zum '
          'Vergleich: der Würfel hat nur 48 Symmetrien, das Tetraeder '
          '24.',
        ),
        const _P(
          '120 = 5! = 2³×3×5. Die drei Primfaktoren 2, 3 und 5 sind '
          'exakt dieselben, die in den Flächen des Dodekaeders '
          '(Fünfecke) und in der Teilbarkeit von 12 (= 2²×3) '
          'zusammenkommen.',
        ),
      ];
    case 8:
      return [
        const _H('360 Grad und die Babylonier'),
        const _P(
          'Dass ein Vollkreis 360 Grad hat, ist keine Naturkonstante '
          '— es ist eine menschliche Festlegung, und sie geht auf die '
          'Babylonier zurück. Die babylonische Mathematik verwendete '
          'die Basis 60, und 360 = 6×60. Aber 360 lässt sich auch '
          'als 12×30 schreiben, und genau so teilten die Babylonier '
          'den Himmel auf: die scheinbare Sonnenbahn (die Ekliptik) '
          'wurde in 12 gleiche Abschnitte zu je 30° zerlegt. Jedem '
          'Abschnitt wurde ein Sternbild zugeordnet — die zwölf '
          'Tierkreiszeichen.',
        ),
        const _P(
          'Die Wahl von 12 war kein Zufall. Die Babylonier '
          'organisierten ihre 60er-Basis intern in Gruppen von 12, '
          'weil 60 = 12×5. Die Zwölf war für sie eine natürliche '
          'Untereinheit — in der Zeitmessung, im Kalender, in der '
          'Astronomie.',
        ),
        const _H('Der Mond und die Zwölf'),
        const _P(
          'Warum gerade zwölf Abschnitte am Himmel? Weil die Natur '
          'selbst eine Zwölfteilung nahelegt: ein Sonnenjahr enthält '
          'fast genau 12 Mondzyklen. Ein synodischer Monat dauert '
          'etwa 29.53 Tage. 12 Mondzyklen ergeben 354.4 Tage — nur '
          '11 Tage weniger als ein Sonnenjahr von 365.24 Tagen. '
          'Diese Beinahe-Übereinstimmung machte die Zwölf zur '
          'offensichtlichen Einteilung des Jahres.',
        ),
        const _H('Ordnung am Himmel'),
        const _P(
          'Die Zwölfteilung des Himmels war für die alten Kulturen '
          'weit mehr als ein Koordinatensystem. Ein faszinierendes '
          'Detail: der Frühlingspunkt wandert langsam durch die '
          'Sternbilder, weil die Erdachse wie ein Kreisel taumelt '
          '(Präzession, Periode ca. 25\'800 Jahre). Die Sternbilder, '
          'durch die der Frühlingspunkt wandert, heissen deshalb '
          'auch Zeitalter. Auch hier strukturiert die Zwölf die '
          'Zeit: zwölf Sternbilder, zwölf Zeitalter, ein grosser '
          'Kreis.',
        ),
        const _H('Die Zwölf anderswo am Himmel'),
        const _P(
          'Die alten Ägypter teilten Tag und Nacht in je 12 Stunden '
          '— daher unsere 24-Stunden-Einteilung. Der chinesische '
          'Tierkreis zählt ebenfalls zwölf Zeichen in 12-Jahres-'
          'Zyklen, abgeleitet vom 12-jährigen Jupiterumlauf. Beide '
          'Traditionen sind unabhängig voneinander entstanden. Die '
          'Konvergenz auf die Zahl 12 ist bemerkenswert.',
        ),
      ];
    case 9:
      return [
        const _H('Pyrit — das Narren-Dodekaeder'),
        const _P(
          'Pyrit (FeS₂), wegen seines goldenen Glanzes auch als '
          '»Narrengold« bekannt, kristallisiert häufig in einer '
          'Form, die dem platonischen Dodekaeder zum Verwechseln '
          'ähnlich sieht: der Pyritoeder. Er hat zwölf fünfeckige '
          'Flächen, 20 Ecken und 30 Kanten — dieselbe Topologie wie '
          'der reguläre Dodekaeder aus Kapitel 7. Aber bei genauem '
          'Hinsehen sind die Fünfecke nicht regelmässig. In der '
          'Kristallographie ist echte fünfzählige Drehsymmetrie bei '
          'periodischen Kristallen unmöglich — nur Symmetrien der '
          'Ordnung 1, 2, 3, 4 und 6 sind erlaubt. Der Pyritoeder '
          'schummelt sich mit unregelmässigen Fünfecken an dieser '
          'Regel vorbei.',
        ),
        const _H('Granat — ein anderer Zwölfflächner'),
        const _P(
          'Die Minerale der Granat-Gruppe kristallisieren bevorzugt '
          'als Rhombendodekaeder — ebenfalls ein Körper mit zwölf '
          'Flächen, aber ganz anderer Natur: die Flächen sind '
          'Rauten, keine Fünfecke. Der Rhombendodekaeder hat 14 '
          'Ecken und 24 Kanten und gehört zum kubischen Kristall'
          'system. Er füllt den Raum lückenlos — die dreidimensionale '
          'Entsprechung der Bienenwabe.',
        ),
        const _P(
          'Die Natur verwendet die Zahl 12 als Flächenzahl für zwei '
          'völlig verschiedene Kristallformen — Fünfecke beim Pyrit, '
          'Rauten beim Granat. Die Zwölf ist nicht an eine bestimmte '
          'Geometrie gebunden.',
        ),
        const _H('Radiolarien — Skelette aus Glas'),
        const _P(
          'Radiolarien sind einzellige Meeresorganismen, kaum '
          'grösser als ein Zehntel Millimeter, die filigrane '
          'Skelette aus Siliziumdioxid bilden. Einige Arten formen '
          'Skelette mit ikosaedrischer Symmetrie — also der '
          'Symmetrie des Ikosaeders, des Duals zum Dodekaeder. Der '
          'deutsche Biologe Ernst Haeckel zeichnete diese '
          'Organismen 1904 in seinem Werk »Kunstformen der Natur« '
          'mit einer Detailtreue, die bis heute beeindruckt.',
        ),
        const _H('Quasikristalle — die Ausnahme, die die Regel bestätigt'),
        const _P(
          '1982 entdeckte Dan Shechtman in einer Aluminium-Mangan-'
          'Legierung ein Muster mit ikosaedrischer Symmetrie — die '
          'in normalen Kristallen verboten ist. Die Fachwelt '
          'reagierte zunächst mit Ablehnung. Doch die Beobachtung '
          'hielt stand, und 2011 erhielt Shechtman den Nobelpreis '
          'für Chemie. Diese Quasikristalle haben ikosaedrische '
          'Symmetrie, die sowohl Dodekaeder- als auch Ikosaeder-'
          'Geometrie enthält. Natürlich vorkommende Quasikristalle '
          '— das Mineral Icosahedrit — wurden 2009 in einem '
          'Meteoriten in Kamtschatka entdeckt.',
        ),
      ];
    case 10:
      return [
        const _H('Zwölf an einer Hand'),
        const _P(
          'Halte eine Hand vor dich, den Daumen abgespreizt, und '
          'betrachte die vier Finger. Jeder Finger hat drei Glieder '
          '(Phalangen), getrennt durch sichtbare Gelenke. Vier '
          'Finger mal drei Glieder — das sind zwölf. Der Daumen '
          'kann als Zeiger dienen: er berührt nacheinander jedes '
          'Glied der vier Finger und zählt so von eins bis zwölf.',
        ),
        const _P(
          'Diese Methode ist keine moderne Erfindung. In Teilen '
          'Südostasiens, Indiens und des Nahen Ostens wird sie seit '
          'Jahrhunderten verwendet. Sie hat einen entscheidenden '
          'Vorteil gegenüber dem westlichen Fingerzählen: sie nutzt '
          'eine Hand für zwölf Einheiten statt für fünf.',
        ),
        const _H('Von zwölf zu sechzig'),
        const _P(
          'Die zweite Hand zählt die vollen Durchgänge. Jedes Mal, '
          'wenn die erste Hand eine Runde von zwölf vollendet hat, '
          'streckt die zweite Hand einen Finger aus. Fünf Finger '
          'mal zwölf — das ergibt sechzig. Mit zwei Händen kann '
          'man also bis 60 zählen, und das ohne jedes Hilfsmittel.',
        ),
        const _P(
          'Diese Verbindung von 12 und 60 ist vermutlich kein '
          'Zufall: das babylonische Sexagesimalsystem (Basis 60) '
          'könnte seinen Ursprung in genau dieser Zählmethode '
          'haben. 60 = 12×5 — eine elegante Verschmelzung von '
          'Anatomie und Arithmetik.',
        ),
        const _H('Weitere Zwölfer in der Anatomie'),
        const _Pre(
          '  — 12 Rippenpaare (Standardanatomie)\n'
          '  — 12 Hirnnervenpaare (I Olfactorius bis XII Hypoglossus)\n'
          '  — 12 Brustwirbel (mit den 12 Rippenpaaren verbunden)',
        ),
        const _P(
          'Anatomische Variationen kommen vor (11 oder 13 '
          'Rippenpaare sind selten möglich).',
        ),
        const _H('Hat die Hand das Zahlensystem geformt?'),
        const _P(
          'Ob die Fingerglieder-Anatomie die Entstehung dozenaler '
          'Zahlensysteme beeinflusst hat oder umgekehrt, lässt sich '
          'historisch nicht sicher entscheiden. Es könnte auch '
          'eine gegenseitige Verstärkung gewesen sein: die Menschen '
          'begannen an den Fingergliedern zu zählen, weil die '
          'Zwölf in ihrer Kultur bereits wichtig war. Was sicher '
          'ist: die menschliche Hand bietet eine natürliche '
          'physische Grundlage für die Zwölf.',
        ),
      ];
    case 11:
      return [
        const _H('Zwölfer im Alltag'),
        const _Pre(
          '  12 Zoll  = 1 Fuss\n'
          '  12 Unzen = 1 Troy-Pfund (Edelmetalle)\n'
          '  12 Pence = 1 Shilling (brit. Geld bis 1971)\n'
          '  12 Stück = 1 Dutzend\n'
          '  144      = 12² = 1 Gros',
        ),
        const _P(
          'Diese Einteilungen sind keine historischen Zufälle — sie '
          'wurden gewählt, weil sie das Teilen erleichtern. Ein '
          'Fuss lässt sich in zwei gleiche Teile teilen (je 6 '
          'Zoll), in drei (je 4 Zoll), in vier (je 3 Zoll) und in '
          'sechs (je 2 Zoll). Jede dieser Teilungen geht exakt auf.',
        ),
        const _P(
          'Ein Meter dagegen lässt sich in zwei gleiche Teile '
          'teilen (je 50 cm) und in fünf (je 20 cm), aber ein '
          'Drittel Meter ist 33.333… cm — ein unendlicher Bruch, '
          'sobald man es exakt nehmen will. Im Handwerk, wo '
          'ständig gedrittelt und geviertelt wird, ist die Zwölf '
          'praktischer als die Zehn.',
        ),
        const _H('Das metrische System — und sein blinder Fleck'),
        const _P(
          'Das metrische System hat grosse Stärken: es ist '
          'kohärent (alle Einheiten passen zusammen), es skaliert '
          'dezimal (Kilo, Mega, Milli, Mikro), und es ist weltweit '
          'standardisiert. Diese Vorzüge sind real und gewichtig. '
          'Kein vernünftiger Mensch würde vorschlagen, SI '
          'abzuschaffen.',
        ),
        const _P(
          'Aber das metrische System erbt die Schwäche seiner '
          'Basis. In Basis 10 ist ein Drittel ein unendlicher '
          'Bruch: 0.333… In einem dozenalen metrischen System '
          'wäre 1/3 = 0.4 — exakt, kurz, ohne Restfehler. Die '
          'Eleganz des metrischen Prinzips bliebe erhalten — nur '
          'die Basis wäre besser.',
        ),
        const _H('Tom Pendleburys TGM'),
        const _P(
          'Tom Pendlebury, Mitglied der Dozenal Society of Great '
          'Britain, hat diesen Gedanken konsequent zu Ende gedacht. '
          'Sein System heisst TGM — benannt nach seinen drei '
          'Grundeinheiten Tim (Zeit), Grafut (Länge), Maz (Masse). '
          'Pendlebury begann nicht mit der Länge, sondern mit der '
          'Zeit: er teilte die Stunde in 12⁴ gleiche Teile. Aus '
          'dem Tim leitete er über die Erdbeschleunigung den '
          'Grafut ab (≈ 29.6 cm), die Masseeinheit Maz aus dem '
          'Volumen eines Kubik-Grafut Wasser.',
        ),
        const _P(
          'Das Ergebnis ist ein vollständig kohärentes Einheiten'
          'system, in dem alle Umrechnungen in Potenzen von 12 '
          'erfolgen. TGM wurde nie über Enthusiastenkreise hinaus '
          'angenommen, demonstriert aber, dass ein dozenales '
          'Metriksystem nicht nur möglich, sondern in mancher '
          'Hinsicht dem dezimalen überlegen wäre.',
        ),
        const _H('Was dieser Rechner zeigt'),
        const _P(
          'Wer 1 / 3 = tippt und 0.4 sieht — kurz, exakt, ohne '
          'Periodenstrich — versteht in einer Sekunde, was Seiten '
          'voller Argumente nicht vermitteln können. Die Frage '
          '»Dozenal oder Dezimal?« wird in der Praxis nie '
          'entschieden werden. Aber die mathematischen Vorteile '
          'der Basis 12 sind objektiv und messbar, und dieser '
          'Rechner macht sie erlebbar.',
        ),
      ];
    default:
      return [const _P('Kapitel nicht gefunden.')];
  }
}
