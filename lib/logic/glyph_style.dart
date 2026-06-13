// Holds the user's preferences for digit rendering: one for the display
// (input/output buffers, key glyph_style_v1) and one for the keypad digit
// keys (key keypad_glyph_style_v1). Both default to conventional
// Hindu-Arabic digits; the custom glyph system is opt-in on the settings
// page. (The no-scope fallbacks below stay custom — they serve the brand
// asset generators in tool/, whose glyph identity must not change.)

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// How digits are rendered (display and keypad have independent prefs).
enum GlyphStyle {
  /// Custom glyph system: twelve stylised symbols painted by
  /// [paintDozenalDigitAt]. Unique-to-this-app visual identity; opt-in.
  custom,

  /// Conventional Hindu-Arabic digits 0..9 plus Pitman/Dwiggins
  /// extension A=10, B=11 for the two dozenal positions beyond 9 (default).
  /// Familiar to readers of academic dozenal literature.
  conventional,
}

class GlyphStyleNotifier extends ChangeNotifier {
  static const String _prefsKey = 'glyph_style_v1';
  static const String _keypadPrefsKey = 'keypad_glyph_style_v1';

  GlyphStyle _style = GlyphStyle.conventional;
  GlyphStyle _keypadStyle = GlyphStyle.conventional;
  bool _loaded = false;

  /// Digit style of the two-line display.
  GlyphStyle get style => _style;

  /// Digit style of the keypad digit keys (main calculator and converter).
  GlyphStyle get keypadStyle => _keypadStyle;

  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    // Default is conventional; only an explicitly saved 'custom' opts back in.
    if (prefs.getString(_prefsKey) == 'custom') {
      _style = GlyphStyle.custom;
    }
    if (prefs.getString(_keypadPrefsKey) == 'custom') {
      _keypadStyle = GlyphStyle.custom;
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

  /// Subscribing read of the display digit style, with the same no-scope
  /// fallback as [keypadStyleOf] (isolated widget tests / tool generators).
  /// Used by the unit-converter display, which shares the main display's
  /// "Ziffern im Display" preference.
  static GlyphStyle styleOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<GlyphStyleScope>();
    return scope?.notifier?.style ?? GlyphStyle.custom;
  }
}
