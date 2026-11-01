// Onboarding intro: a PageView that explains the app to new users. Four slides,
// each a screenshot with red highlights (circles or rectangles) and a short text:
//   1 - the menu key
//   2 - the intro entry in the menu, which reopens this intro
//   3 - the switch key between the calculators
//   4 - number system and glyph style in the settings
// All coordinates are fractions (0..1), so they fit any screen. The screenshots
// (assets/intro/v5_*.png) are phone captures with status and navigation bar cropped.
// Layout metadata is language-neutral, the texts come from the ARB locale.

import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

const Color _kHighlight = Color(0xFFFF3030);

class HighlightCircle {
  const HighlightCircle({required this.center, required this.radius});

  /// Center as fraction of screenshot width/height.
  final Offset center;

  /// Radius as fraction of screenshot height.
  final double radius;
}

class HighlightRect {
  const HighlightRect({required this.rect});

  /// Left/top/right/bottom in fractional screenshot coordinates (0..1).
  final Rect rect;
}

class _IntroSlide {
  const _IntroSlide({
    required this.image,
    required this.text,
    this.circles = const [],
    this.rects = const [],
  });
  final String image;
  final List<HighlightCircle> circles;
  final List<HighlightRect> rects;
  final String text;
}

// ---------------------------------------------------------------------------
// Coordinates for the 720×1394 phone screenshots in assets/intro/ (the status
// bar and the navigation pill were cropped off, so the app fills the frame).
// Re-measure here if a future screenshot moves anything.
// ---------------------------------------------------------------------------

/// Aspect ratio of the cropped intro screenshots.
const double _kIntroAspect = 720 / 1394;

// The two round keys beside the equals bar in v5_calc.png.
const HighlightCircle _kMenuKey = HighlightCircle(
  center: Offset(0.114, 0.9405),
  radius: 0.044,
);
const HighlightCircle _kSwitchKey = HighlightCircle(
  center: Offset(0.885, 0.9405),
  radius: 0.044,
);

// The intro row in v5_menu.png.
const HighlightRect _kIntroRow = HighlightRect(
  rect: Rect.fromLTRB(0.03, 0.130, 0.97, 0.211),
);

// In v5_settings.png: the two glyph rows grouped into one box, and the
// number-system row.
const HighlightRect _kGlyphRows = HighlightRect(
  rect: Rect.fromLTRB(0.035, 0.171, 0.965, 0.333),
);
const HighlightRect _kNumberSystemRow = HighlightRect(
  rect: Rect.fromLTRB(0.035, 0.661, 0.965, 0.742),
);

/// The slide list depends on AppLocalizations for the per-slide prose, so it
/// can't be a top-level const. Layout metadata (image, highlight rects/
/// circles) stays const; only the text strings come from the current locale.
List<_IntroSlide> _buildSlides(AppLocalizations l) => [
  _IntroSlide(
    image: 'assets/intro/v5_calc.png',
    circles: const [_kMenuKey],
    text: l.introSlide1,
  ),
  _IntroSlide(
    image: 'assets/intro/v5_menu.png',
    rects: const [_kIntroRow],
    text: l.introSlide2,
  ),
  _IntroSlide(
    image: 'assets/intro/v5_calc.png',
    circles: const [_kSwitchKey],
    text: l.introSlide3,
  ),
  _IntroSlide(
    image: 'assets/intro/v5_settings.png',
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
            child: Text(
              l.introSkip,
              style: const TextStyle(color: Colors.white70),
            ),
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
  const _SlideView({required this.slide});
  final _IntroSlide slide;

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
  _SlidePainter(this.slide);
  final _IntroSlide slide;

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
  const _PageDots({required this.count, required this.current});
  final int count;
  final int current;

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
