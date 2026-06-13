// Persisted calculator preferences behind the settings page: how the
// extended keypad sets are reached (overlay pages vs. one scrolling column),
// how much of the keypad is shown (full vs. simple), plus the numeral system
// and angle mode so simple-profile users — whose keypad has no Doz/Dez/DRG
// keys — keep their choice across restarts. Mirrors the GlyphStyleNotifier /
// HapticsNotifier shape: a ChangeNotifier behind an InheritedNotifier.

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tokens.dart' show AngleMode, NumeralSystem;

/// How the Hoch keypad reaches the extended sets (Sets 6-10 + function keys).
enum KeypadMode {
  /// Default: the Expand key swaps the middle section to the two overlay
  /// pages (OLL/OLR). In Breit mode the third group pages via edge arrows.
  overlay,

  /// All sets stacked in one vertically scrolling column (Hoch); in Breit
  /// mode every column is inline and the row scrolls horizontally.
  scroll,
}

/// How much of the keypad is shown.
enum KeypadProfile {
  /// Default: every set, including the extended sets and function keys.
  full,

  /// Digits + Sets 1-4 + AC/DEL/. only — no Expand, no extended sets.
  /// Doz/Dez and DRG then live exclusively in the settings page.
  simple,
}

/// User-selectable text size, applied app-wide via [effectiveTextScale].
enum FontSize { normal, large, xlarge }

extension FontSizeFactor on FontSize {
  /// The user-chosen multiplier (on top of the automatic tablet baseline).
  double get factor => switch (this) {
        FontSize.normal => 1.0,
        FontSize.large => 1.2,
        FontSize.xlarge => 1.4,
      };
}

/// Effective text scale: the user's [FontSize] choice times an automatic
/// tablet baseline. Phones (shortestSide ≤ 600 dp) get exactly 1.0 at
/// [FontSize.normal], so they're unchanged; tablets scale up so text isn't
/// lost on the wide screen. Drives the app-wide MediaQuery textScaler and the
/// custom-painted converter display (which the textScaler can't reach).
double effectiveTextScale(FontSize fontSize, double shortestSide) {
  final tablet = shortestSide <= 600
      ? 1.0
      : (1.0 + (shortestSide - 600) / 300).clamp(1.0, 1.6);
  return fontSize.factor * tablet;
}

class CalcPrefsNotifier extends ChangeNotifier {
  static const String _kModeKey = 'keypad_mode_v1';
  static const String _kProfileKey = 'keypad_profile_v1';
  static const String _kNumeralKey = 'numeral_system_v1';
  static const String _kAngleKey = 'angle_mode_v1';
  static const String _kFontSizeKey = 'font_size_v1';

  KeypadMode _mode = KeypadMode.overlay;
  KeypadProfile _profile = KeypadProfile.full;
  NumeralSystem _numeralSystem = NumeralSystem.dez; // decimal by default
  AngleMode _angleMode = AngleMode.deg;
  FontSize _fontSize = FontSize.normal;
  bool _loaded = false;

  KeypadMode get mode => _mode;
  KeypadProfile get profile => _profile;
  NumeralSystem get numeralSystem => _numeralSystem;
  AngleMode get angleMode => _angleMode;
  FontSize get fontSize => _fontSize;
  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _mode = _enumFromName(KeypadMode.values, prefs.getString(_kModeKey), _mode);
    _profile = _enumFromName(
      KeypadProfile.values,
      prefs.getString(_kProfileKey),
      _profile,
    );
    _numeralSystem = _enumFromName(
      NumeralSystem.values,
      prefs.getString(_kNumeralKey),
      _numeralSystem,
    );
    _angleMode = _enumFromName(
      AngleMode.values,
      prefs.getString(_kAngleKey),
      _angleMode,
    );
    _fontSize = _enumFromName(
      FontSize.values,
      prefs.getString(_kFontSizeKey),
      _fontSize,
    );
    _loaded = true;
    notifyListeners();
  }

  Future<void> setMode(KeypadMode next) async {
    if (next == _mode) return;
    _mode = next;
    notifyListeners();
    await _persist(_kModeKey, next.name);
  }

  Future<void> setProfile(KeypadProfile next) async {
    if (next == _profile) return;
    _profile = next;
    notifyListeners();
    await _persist(_kProfileKey, next.name);
  }

  Future<void> setNumeralSystem(NumeralSystem next) async {
    if (next == _numeralSystem) return;
    _numeralSystem = next;
    notifyListeners();
    await _persist(_kNumeralKey, next.name);
  }

  Future<void> setAngleMode(AngleMode next) async {
    if (next == _angleMode) return;
    _angleMode = next;
    notifyListeners();
    await _persist(_kAngleKey, next.name);
  }

  Future<void> setFontSize(FontSize next) async {
    if (next == _fontSize) return;
    _fontSize = next;
    notifyListeners();
    await _persist(_kFontSizeKey, next.name);
  }

  static Future<void> _persist(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static T _enumFromName<T extends Enum>(List<T> values, String? raw, T fb) {
    if (raw == null) return fb;
    for (final v in values) {
      if (v.name == raw) return v;
    }
    return fb;
  }
}

class CalcPrefsScope extends InheritedNotifier<CalcPrefsNotifier> {
  const CalcPrefsScope({
    super.key,
    required CalcPrefsNotifier super.notifier,
    required super.child,
  });

  static CalcPrefsNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CalcPrefsScope>();
    assert(scope != null, 'CalcPrefsScope.of called outside the prefs scope.');
    return scope!.notifier!;
  }

  /// Like [of] but returns null outside the scope (the converter display and
  /// preview/test harnesses read the font size defensively).
  static CalcPrefsNotifier? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CalcPrefsScope>()?.notifier;
}
