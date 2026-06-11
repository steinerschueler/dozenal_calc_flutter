// Holds the user's preferences for digit rendering: one for the display
// (input/output buffers, key glyph_style_v1) and one for the keypad digit
// keys (key keypad_glyph_style_v1). Both default to the custom glyphs —
// the app's visual identity. The toggles live on the settings page.

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// How digits are rendered (display and keypad have independent prefs).
enum GlyphStyle {
  /// Custom glyph system (default): twelve stylised symbols painted by
  /// [paintDozenalDigitAt]. Unique-to-this-app visual identity.
  custom,

  /// Conventional Hindu-Arabic digits 0..9 plus Pitman/Dwiggins
  /// extension A=10, B=11 for the two dozenal positions beyond 9.
  /// Familiar to readers of academic dozenal literature.
  conventional,
}

class GlyphStyleNotifier extends ChangeNotifier {
  static const String _prefsKey = 'glyph_style_v1';
  static const String _keypadPrefsKey = 'keypad_glyph_style_v1';

  GlyphStyle _style = GlyphStyle.custom;
  GlyphStyle _keypadStyle = GlyphStyle.custom;
  bool _loaded = false;

  /// Digit style of the two-line display.
  GlyphStyle get style => _style;

  /// Digit style of the keypad digit keys (main calculator and converter).
  GlyphStyle get keypadStyle => _keypadStyle;

  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_prefsKey) == 'conventional') {
      _style = GlyphStyle.conventional;
    }
    if (prefs.getString(_keypadPrefsKey) == 'conventional') {
      _keypadStyle = GlyphStyle.conventional;
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> setStyle(GlyphStyle next) async {
    if (next == _style) return;
    _style = next;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, next.name);
    notifyListeners();
  }

  Future<void> setKeypadStyle(GlyphStyle next) async {
    if (next == _keypadStyle) return;
    _keypadStyle = next;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keypadPrefsKey, next.name);
    notifyListeners();
  }
}

class GlyphStyleScope extends InheritedNotifier<GlyphStyleNotifier> {
  const GlyphStyleScope({
    super.key,
    required GlyphStyleNotifier super.notifier,
    required super.child,
  });

  static GlyphStyleNotifier of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<GlyphStyleScope>();
    assert(scope != null, 'GlyphStyleScope.of called outside the style scope.');
    return scope!.notifier!;
  }

  /// Subscribing read of the keypad digit style. Falls back to the custom
  /// glyphs when no scope is present — e.g. isolated widget tests and the
  /// tool/ golden generators that pump a keypad without the app shell.
  static GlyphStyle keypadStyleOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<GlyphStyleScope>();
    return scope?.notifier?.keypadStyle ?? GlyphStyle.custom;
  }
}
