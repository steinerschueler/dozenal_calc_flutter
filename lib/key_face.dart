// The look of keys and display text shared by all three calculators: one font,
// one set of sizes, and the key faces. Sizes were chosen on a phone; the phone
// landscape layout makes room for them by sizing each column to its labels.

import 'dart:math' as math;

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:flutter/material.dart';

/// Font of text on keys and in the displays.
const String keyFontFamily = 'JetBrainsMono';

/// Weight of text on keys and in the displays.
const FontWeight keyTextWeight = FontWeight.w700;

/// Size of characters on keys relative to their base size.
const double keyCharacterScale = 1.45;

/// Enlargement of text keys over the base size of a drawn key label.
const double keyLabelBoost = 1.3;

/// Stroke width of drawn operator glyphs.
const double keyTokenStroke = 3;

/// Stroke width of the custom dozenal digit glyphs on keys.
const double keyDigitStroke = 3.2;

/// Height share of the main display's input line.
const double displayInputLineShare = 0.38;

/// Size of characters in the main display relative to their base size.
const double displayCharacterScale = 1.75;

/// Smallest text size in a display wherever the line can hold it.
const double displayMinFontSize = 28;

/// Width of one character of the key font relative to its size.
const double keyFontCharacterWidth = 0.6;

/// Key width that is not available to its label: face margins and air.
const double keyLabelSideSpace = 10;

/// Label size relative to the key height, before boost and character scale.
const double keyBaseLabelShare = 0.35;

/// Text size of worded keys (units, categories) where nothing limits it.
const double keyWordFontSize = 25;

/// Column width of worded keys in characters; longer words shrink on their own.
const int keyWordColumnChars = 6;

/// Longest label on a token key.
const int keyLongestTokenChars = 4;

/// Height kept free for the small hint at the foot of an equals key.
const double keyEqualsHintBand = 12;

/// Air inside a round key, little enough to stay legible on low screens.
const double keySystemKeyPadding = 4;

/// What a key is for, which decides its visual weight.
enum KeyRole { digit, operation, primary }

/// Corner radius of key faces, also of anything drawn as one.
const double keyFaceRadius = 14;
const double _keyFaceAir = 2;

/// Space around a key's visible face. The touch area stays the full cell.
const EdgeInsets keyFaceMargin = EdgeInsets.all(_keyFaceAir);

Color _keyFaceFill(
  AppColors colors,
  KeyRole role, {
  required bool pressed,
  required bool inactive,
}) {
  final base = switch (role) {
    KeyRole.primary => colors.op.withValues(alpha: pressed ? 0.45 : 0.28),
    KeyRole.digit => colors.textPrimary.withValues(
      alpha: pressed ? 0.22 : 0.11,
    ),
    // Neutral on purpose: a blue fill under blue glyphs lowers their contrast.
    KeyRole.operation => colors.textPrimary.withValues(
      alpha: pressed ? 0.16 : 0.045,
    ),
  };
  return inactive ? base.withValues(alpha: base.a * 0.4) : base;
}

/// The visible face of a key. Armed and selected keys carry a frame because
/// that frame has meaning; all others are a plain surface.
BoxDecoration keyFaceDecoration(
  AppColors colors,
  KeyRole role, {
  bool pressed = false,
  bool inactive = false,
  bool selected = false,
  bool gold = false,
  Color? frameOverride,
  double? frameWidthOverride,
}) {
  final frame =
      frameOverride ??
      (gold
          ? colors.accentGold
          : selected
          ? colors.op
          : null);
  return BoxDecoration(
    color: _keyFaceFill(colors, role, pressed: pressed, inactive: inactive),
    borderRadius: BorderRadius.circular(keyFaceRadius),
    border: frame == null
        ? null
        : Border.all(
            color: frame,
            width: frameWidthOverride ?? (gold || selected ? 2 : 1),
          ),
  );
}

/// Largest text sizes a keypad's layout allows, so that labels of a kind share
/// one size instead of each shrinking to its own key.
class KeyLabelFontCap extends InheritedWidget {
  const KeyLabelFontCap({
    required this.tokens,
    required this.words,
    required super.child,
    super.key,
  });

  /// Portrait keypads: columns are equally wide, so the longest label decides.
  factory KeyLabelFontCap.forEqualColumns({
    required double keypadWidth,
    required Widget child,
    Key? key,
  }) {
    final cell =
        (keypadWidth - (_portraitColumns - 1) * _portraitColumnGap) /
        _portraitColumns;
    double fit(int chars) =>
        (cell - keyLabelSideSpace) / (chars * keyFontCharacterWidth);
    return KeyLabelFontCap(
      tokens: fit(keyLongestTokenChars),
      words: fit(keyWordColumnChars),
      key: key,
      child: child,
    );
  }

  static const int _portraitColumns = 4;
  static const double _portraitColumnGap = 8;

  /// Largest size of labels on token keys.
  final double tokens;

  /// Largest size of worded keys.
  final double words;

  static double tokensOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<KeyLabelFontCap>()?.tokens ??
      double.infinity;

  static double wordsOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<KeyLabelFontCap>()?.words ??
      keyWordFontSize;

  @override
  bool updateShouldNotify(KeyLabelFontCap oldWidget) =>
      oldWidget.tokens != tokens || oldWidget.words != words;
}

/// Below this keypad height the landscape rows drop their gaps: each key face
/// keeps its own air, and the height goes to the display instead.
const double compactBreitHeight = 300;

/// Vertical gap between rows of a compact landscape keypad.
const double compactBreitRowGap = 0;

/// Horizontal gap between columns of a compact landscape keypad.
const double compactBreitColumnGap = 0;

/// Gap above the equals row of a compact landscape keypad.
const double compactBreitEqualsGap = 4;

/// Column widths of a compact landscape keypad: one label size everywhere, and
/// each column as wide as its longest label needs. Leftovers widen all columns.
class BreitColumnLayout {
  BreitColumnLayout._(this.labelFont, this._minWidth, this._bonus);

  /// Solves for the largest label size at which [columnChars] (longest label
  /// per column, one entry per column) fit [available].
  factory BreitColumnLayout.solve({
    required List<int> columnChars,
    required double buttonHeight,
    required double available,
  }) {
    double widthAt(int chars, double font) => math.max(
      buttonHeight,
      chars * keyFontCharacterWidth * font + keyLabelSideSpace,
    );
    double totalAt(double font) =>
        columnChars.fold(0, (sum, chars) => sum + widthAt(chars, font));

    var font =
        buttonHeight * keyBaseLabelShare * keyLabelBoost * keyCharacterScale;
    if (totalAt(font) > available) {
      var low = 0.0;
      var high = font;
      for (var i = 0; i < _searchSteps; i++) {
        final middle = (low + high) / 2;
        if (totalAt(middle) <= available) {
          low = middle;
        } else {
          high = middle;
        }
      }
      font = low;
    }
    final bonus = math.min(
      _maxColumnBonus,
      math.max(0, (available - totalAt(font)) / columnChars.length),
    );
    return BreitColumnLayout._(font, buttonHeight, bonus.toDouble());
  }

  static const int _searchSteps = 16;
  static const double _maxColumnBonus = 16;

  /// The one label size of this keypad.
  final double labelFont;
  final double _minWidth;
  final double _bonus;

  /// Width of a column whose longest label has [chars] characters.
  double widthFor(int chars) =>
      math.max(
        _minWidth,
        chars * keyFontCharacterWidth * labelFont + keyLabelSideSpace,
      ) +
      _bonus;
}
