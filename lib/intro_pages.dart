// Bedienungs-Intro: PageView, das frischen Nutzern die App erklärt. Vier
// Seiten, jede mit einem Screenshot + roten Highlight-Markierungen (Kreise
// oder Rechtecke) plus kurzem Erklärtext:
//   1 — die (i)-Taste (öffnet das Menü)
//   2 — die (?)-Taste (ruft dieses Intro erneut auf)
//   3 — das Wischen zwischen Haupt- und Einheitenrechner
//   4 — Zahlensystem + Glyphen-Stil in den Einstellungen
// Alle Koordinaten sind relativ (0..1), passen also auf jede Bildschirmgröße.
// Screenshots (assets/intro/v4_*.png) sind Telefon-Captures (720×1448, Status-
// und Navigationsleiste beschnitten); Layout-Metadata ist sprach-neutral, nur
// die Texte kommen aus dem ARB-System der aktiven Locale.

import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

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

class _IntroSlide {
  final String image;
  final List<HighlightCircle> circles;
  final List<HighlightRect> rects;
  final String text;

  const _IntroSlide({
    required this.image,
    this.circles = const [],
    this.rects = const [],
    required this.text,
  });
}

// ---------------------------------------------------------------------------
// Coordinates for the 720×1448 phone screenshots in assets/intro/ (the status
// bar and the navigation pill were cropped off, so the app fills the frame).
// Re-measure here if a future screenshot moves anything.
// ---------------------------------------------------------------------------

/// Aspect ratio of the cropped intro screenshots.
const double _kIntroAspect = 720 / 1448;

// The two round buttons in the equals row of v4_calc.png.
const HighlightCircle _kInfoButton =
    HighlightCircle(center: Offset(0.121, 0.956), radius: 0.036);
const HighlightCircle _kHelpButton =
    HighlightCircle(center: Offset(0.879, 0.956), radius: 0.036);

// On v4_settings.png: the two glyph rows (Ziffern im Display + auf Tasten)
// grouped into one box, and the number-system row below.
const HighlightRect _kGlyphRows =
    HighlightRect(rect: Rect.fromLTRB(0.035, 0.158, 0.965, 0.312));
const HighlightRect _kNumberSystemRow =
    HighlightRect(rect: Rect.fromLTRB(0.035, 0.632, 0.965, 0.707));

/// The slide list depends on AppLocalizations for the per-slide prose, so it
/// can't be a top-level const. Layout metadata (image, highlight rects/
/// circles) stays const; only the text strings come from the current locale.
List<_IntroSlide> _buildSlides(AppLocalizations l) => [
      // 1 — the (i) button: opens the menu.
      _IntroSlide(
        image: 'assets/intro/v4_calc.png',
        circles: const [_kInfoButton],
        text: l.introSlide1,
      ),
      // 2 — the (?) button: re-opens this intro.
      _IntroSlide(
        image: 'assets/intro/v4_calc.png',
        circles: const [_kHelpButton],
        text: l.introSlide2,
      ),
      // 3 — swiping between the two calculators (swipe graphic baked in).
      _IntroSlide(
        image: 'assets/intro/v4_swipe.png',
        text: l.introSlide3,
      ),
      // 4 — number system + glyph style in the settings.
      _IntroSlide(
        image: 'assets/intro/v4_settings.png',
        rects: const [_kGlyphRows, _kNumberSystemRow],
        text: l.introSlide4,
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
  late List<_IntroSlide> _slides;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _slides = _buildSlides(AppLocalizations.of(context));
  }

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
    final l = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        title: Text(l.introTitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l.introSkip,
                style: const TextStyle(color: Colors.white70)),
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
                    _page == _slides.length - 1 ? l.introDone : l.introNext,
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
              aspectRatio: _kIntroAspect,
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
