// Holds the user's preference for digit rendering on the display
// (input/output buffers). Keypad buttons always use the custom glyphs
// — they are the app's visual identity. The toggle lives in the Info
// list directly under the chapter section.

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// How the two-line display renders digits.
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

  GlyphStyle _style = GlyphStyle.custom;
  bool _loaded = false;

  GlyphStyle get style => _style;
  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == 'conventional') _style = GlyphStyle.conventional;
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
}
