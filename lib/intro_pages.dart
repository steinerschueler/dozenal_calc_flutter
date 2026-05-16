// Bedienungs-Intro: PageView, das frischen Nutzern den Rechner erklärt.
// Jede Seite zeigt einen Screenshot mit roten Highlight-Markierungen
// (Kreise und/oder Rechtecke) plus einen kurzen Erklärtext. Alle
// Koordinaten sind relativ (0..1), damit sie auf jeder Bildschirmgröße
// passen.

import 'package:flutter/material.dart';

const Color _kHighlight = Color(0xFFFF3030);

class HighlightCircle {
  /// Center as fraction of screenshot width/height.
  final Offset center;

  /// Radius as fraction of screenshot height.
  final double radius;

  const HighlightCircle({required this.center, required this.radius});
}

class HighlightRect {
  /// Left/top/right/bottom in fractional screenshot coordinates (0..1).
  final Rect rect;

  const HighlightRect({required this.rect});
}

/// A numeric label drawn over a digit cell on the decoder slide, so the
/// user can map the unfamiliar dozenal glyph to its everyday value.
class DigitLabel {
  /// Cell centre as fraction of screenshot width/height.
  final Offset center;

  /// Label text — e.g. "0", "1", ..., "9", "10", "11".
  final String text;

  const DigitLabel({required this.center, required this.text});
}

class _IntroSlide {
  final String image;
  final List<HighlightCircle> circles;
  final List<HighlightRect> rects;
  final List<DigitLabel> labels;
  final String text;

  const _IntroSlide({
    required this.image,
    this.circles = const [],
    this.rects = const [],
    this.labels = const [],
    required this.text,
  });
}

// ---------------------------------------------------------------------------
// Standard coordinates derived from the 576×1280 screenshots in
// assets/intro/. Adjust here if a future screenshot moves anything.
// ---------------------------------------------------------------------------

// Rectangle covering the full 4×3 dozenal digit block on new4.png.
const Rect _kDigitBlock = Rect.fromLTRB(0.02, 0.225, 0.98, 0.455);

// Rectangle covering the two-line display window on new4.png.
const Rect _kDisplay = Rect.fromLTRB(0.02, 0.045, 0.98, 0.235);

// Rectangle covering the 4×4 function-key (op-grid) block on new4.png.
const Rect _kOpBlock = Rect.fromLTRB(0.02, 0.475, 0.98, 0.685);

// Rectangle covering the twelve theory chapters list on new1.png.
const Rect _kChapterList = Rect.fromLTRB(0.02, 0.10, 0.98, 0.72);

// Digit-glyph cell centres in the 4×3 grid of new4.png. Layout matches
// keypad.dart::_digitGrid:
//   row 0: 10, 11,  0   (column x: 0.165, 0.50, 0.835)
//   row 1:  7,  8,  9   (row     y: 0.282, 0.336, 0.390, 0.443)
//   row 2:  4,  5,  6
//   row 3:  1,  2,  3
//
// Decoder labels sit just to the right of each glyph (x + 0.085) so the
// pairing glyph ↔ everyday number is visually obvious.
const List<DigitLabel> _kDecoderLabels = [
  // Row 0
  DigitLabel(center: Offset(0.25, 0.267), text: '10'),
  DigitLabel(center: Offset(0.585, 0.267), text: '11'),
  DigitLabel(center: Offset(0.92, 0.267), text: '0'),
  // Row 1
  DigitLabel(center: Offset(0.25, 0.321), text: '7'),
  DigitLabel(center: Offset(0.585, 0.321), text: '8'),
  DigitLabel(center: Offset(0.92, 0.321), text: '9'),
  // Row 2
  DigitLabel(center: Offset(0.25, 0.375), text: '4'),
  DigitLabel(center: Offset(0.585, 0.375), text: '5'),
  DigitLabel(center: Offset(0.92, 0.375), text: '6'),
  // Row 3
  DigitLabel(center: Offset(0.25, 0.428), text: '1'),
  DigitLabel(center: Offset(0.585, 0.428), text: '2'),
  DigitLabel(center: Offset(0.92, 0.428), text: '3'),
];

const List<_IntroSlide> _slides = [
  // 1 — Welcome + introduction of the strange glyphs.
  _IntroSlide(
    image: 'assets/intro/new4.png',
    rects: [HighlightRect(rect: _kDigitBlock)],
    text: 'Willkommen! Im Zahlenblock siehst du die zwölf dozenalen '
        'Ziffern in unserem neuen Glyphensystem. Wische weiter, um die '
        'Übersetzung zu entdecken.',
  ),

  // 2 — Decoder: same screenshot + Arabic numerals overlaid.
  _IntroSlide(
    image: 'assets/intro/new4.png',
    rects: [HighlightRect(rect: _kDigitBlock)],
    labels: _kDecoderLabels,
    text: 'Das hier bedeuten die Glyphen. Wische ein paar Mal vor und '
        'zurück, bis du sie sicher liest. Beachte: 10 und 11 sind '
        'eigene Ziffern wie A und B im Hexadezimalsystem.',
  ),

  // 3 — Display area.
  _IntroSlide(
    image: 'assets/intro/new4.png',
    rects: [HighlightRect(rect: _kDisplay)],
    text: 'Oben das Display: links die Eingabe mit Cursor, rechts unten '
        'das Ergebnis nach Drücken von =.',
  ),

  // 4 — Function-key block.
  _IntroSlide(
    image: 'assets/intro/new4.png',
    rects: [HighlightRect(rect: _kOpBlock)],
    text: 'Der Funktionstastenblock: Grundrechenarten links, Potenzen '
        'und Wurzeln daneben, Winkelfunktionen und Cursor-Pfeile rechts.',
  ),

  // 5 — Round (i) and (?) buttons.
  _IntroSlide(
    image: 'assets/intro/new4.png',
    circles: [
      HighlightCircle(center: Offset(0.087, 0.772), radius: 0.04),
      HighlightCircle(center: Offset(0.91, 0.772), radius: 0.04),
    ],
    text: 'Links unten die (i)-Taste — sie öffnet zwölf Theorie-Kapitel '
        'über das Dozenalsystem. Rechts unten die (?)-Taste, die dieses '
        'Intro erneut zeigt.',
  ),

  // 6 — AC and "…".
  _IntroSlide(
    image: 'assets/intro/new4.png',
    circles: [
      HighlightCircle(center: Offset(0.14, 0.71), radius: 0.04),
      HighlightCircle(center: Offset(0.86, 0.71), radius: 0.04),
    ],
    text: 'AC (rot) löscht alles. Die »…«-Taste rechts daneben öffnet ein '
        'Overlay mit weiteren Funktionen — Konstanten, hyperbolische '
        'Funktionen, Speicher und Modus-Auswahl.',
  ),

  // 7 — Doz/Dez mode toggle in the overlay.
  _IntroSlide(
    image: 'assets/intro/new3.png',
    circles: [
      HighlightCircle(center: Offset(0.14, 0.715), radius: 0.045),
      HighlightCircle(center: Offset(0.38, 0.715), radius: 0.045),
      // Small DOZ indicator at top-right of the display.
      HighlightCircle(center: Offset(0.93, 0.085), radius: 0.022),
    ],
    text: 'Im Overlay: Doz/Dez schaltet zwischen Dozenal- (Basis 12) und '
        'Dezimal-Eingabe (Basis 10) um. Die aktive Taste ist umrandet, '
        'und oben rechts im Display zeigt eine kleine Anzeige den '
        'aktuellen Modus. Beim Umschalten wird die aktuelle Zahl '
        'automatisch umgerechnet. Im Dez-Modus werden die Symbole für '
        '10 und 11 inaktiv — sie existieren nur im Dozenalsystem.',
  ),

  // 8 — Theory chapter list reached via (i).
  _IntroSlide(
    image: 'assets/intro/new1.png',
    rects: [HighlightRect(rect: _kChapterList)],
    text: 'Über die (i)-Taste erreichst du diese Liste mit zwölf '
        'didaktischen Kapiteln — von der Bedienung des Rechners bis hin '
        'zu Dodekaedern und den zwölf Tierkreiszeichen.',
  ),
];

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_page == _slides.length - 1) {
      Navigator.of(context).pop();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        title: const Text('Bedienungs-Intro'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Überspringen',
                style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (ctx, i) => _SlideView(slide: _slides[i]),
              ),
            ),
            _PageDots(count: _slides.length, current: _page),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _next,
                  child: Text(
                    _page == _slides.length - 1 ? 'Fertig' : 'Weiter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlideView extends StatelessWidget {
  final _IntroSlide slide;

  const _SlideView({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 576 / 1280,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(slide.image, fit: BoxFit.contain),
                  CustomPaint(painter: _SlidePainter(slide)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            slide.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SlidePainter extends CustomPainter {
  final _IntroSlide slide;

  _SlidePainter(this.slide);

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = _kHighlight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    for (final r in slide.rects) {
      final rect = Rect.fromLTRB(
        r.rect.left * size.width,
        r.rect.top * size.height,
        r.rect.right * size.width,
        r.rect.bottom * size.height,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(8)),
        stroke,
      );
    }

    for (final c in slide.circles) {
      final center = Offset(
        c.center.dx * size.width,
        c.center.dy * size.height,
      );
      canvas.drawCircle(center, c.radius * size.height, stroke);
    }

    for (final l in slide.labels) {
      _paintLabel(canvas, size, l);
    }
  }

  void _paintLabel(Canvas canvas, Size size, DigitLabel label) {
    final fontSize = size.height * 0.022;
    final center = Offset(
      label.center.dx * size.width,
      label.center.dy * size.height,
    );
    final tp = TextPainter(
      text: TextSpan(
        text: label.text,
        style: TextStyle(
          color: _kHighlight,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant _SlidePainter old) => old.slide != slide;
}

class _PageDots extends StatelessWidget {
  final int count;
  final int current;

  const _PageDots({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == current
                  ? const Color(0xFF64C8FF)
                  : const Color(0xFF505050),
            ),
          ),
        ],
      ],
    );
  }
}
