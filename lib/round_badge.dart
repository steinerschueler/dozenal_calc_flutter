// Shared leading badges for the Menü (info list) and Einstellungen rows.
// Replaces the former small grey icons and the variable-width flag thumbnails
// with a single visual family: colored circular discs of one uniform
// diameter. Icon rows get a solid hue + white glyph; language rows get the
// flag cropped (cover-fit) into the same circle, with a faint edge ring so
// flags with light areas still read as discs against the scaffold.

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'language_options.dart';

/// One uniform diameter for every leading badge (icon or flag) across the
/// Menü and Einstellungen lists — the single knob the design hangs on.
const double kBadgeDiameter = 30.0;

/// Start indent for the rows revealed when a section expands, so they read as
/// nested *under* their category header (right of the header's badge, aligned
/// with its title) rather than sitting at — or left of — the top-level column.
/// Roughly tracks a top-level title's start (contentPadding 16 + badge 30 +
/// gap 16).
const double kSubItemIndent = 64.0;

/// Curated, theme-independent disc hues. Mid-saturation tones chosen to carry
/// a white glyph and to read on both the dark and light scaffolds. Decorative
/// only — deliberately outside the semantic [AppColors] palette, which models
/// the calculator/world colour code, not menu chrome.
abstract final class BadgeHue {
  static const Color blue = Color(0xFF3D7EEA);
  static const Color teal = Color(0xFF12A89E);
  static const Color violet = Color(0xFF8E63E5);
  static const Color amber = Color(0xFFDE8A33);
  static const Color indigo = Color(0xFF5C6BC0);
  static const Color green = Color(0xFF2FA45E);
  static const Color bronze = Color(0xFF9C7B4D);
  static const Color pink = Color(0xFFE5547B);
  static const Color cyan = Color(0xFF2796C9);
  static const Color slate = Color(0xFF6C7A89);
}

/// Solid colored disc with a centered white icon, at the uniform
/// [kBadgeDiameter]. The leading visual for every non-language row.
class RoundIconBadge extends StatelessWidget {
  const RoundIconBadge({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: kBadgeDiameter,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Icon(icon, color: Colors.white, size: kBadgeDiameter * 0.56),
        ),
      ),
    );
  }
}

/// A language flag cropped (cover-fit) into the same circular disc as
/// [RoundIconBadge], with a faint contrasting ring so light-edged flags
/// (Japan's white field, the white tricolor bands) still read as a disc.
/// The painter keeps its canonical aspect ratio inside the [FittedBox]; the
/// [ClipOval] does the cropping, so every language shares one diameter.
class RoundFlagBadge extends StatelessWidget {
  const RoundFlagBadge({super.key, required this.option});

  final LanguageOption option;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final ring = t.isDark
        ? Colors.white.withValues(alpha: 0.22)
        : Colors.black.withValues(alpha: 0.16);
    final flag = option.canonicalFlagSize;
    return SizedBox.square(
      dimension: kBadgeDiameter,
      child: Stack(
        children: [
          ClipOval(
            child: SizedBox.square(
              dimension: kBadgeDiameter,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: flag.width,
                  height: flag.height,
                  child: CustomPaint(size: flag, painter: option.flagPainter),
                ),
              ),
            ),
          ),
          // Edge ring on top so the flag can't paint over it.
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ring, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
