// Light/dark theming. The app barely uses Material color roles — almost
// everything is custom-painted — so theming runs through a semantic
// palette ([AppColors]) instead of ThemeData lookups. Two const palettes
// (dark = the historical hardcoded colors, light = a tuned counterpart
// that keeps the egui accent identity) are switched by [ThemeNotifier]
// and distributed via [ThemeScope], following the GlyphStyleNotifier
// pattern.
//
// Access is fallback-safe: `AppColors.of(context)` returns the dark
// palette when no scope is present, so widget tests that pump subtrees
// standalone keep seeing the pre-theme colors without any wiring.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The user's theme choice. `system` follows the OS brightness (fed into
/// [ThemeNotifier.platformBrightness] by the app root's
/// didChangePlatformBrightness observer).
enum ThemeSetting { dark, light, system }

/// Semantic color slots. Dark values are exactly the colors that used to
/// be hardcoded across the widgets/painters; light values are their tuned
/// counterparts (same hue identity, adjusted for contrast on light
/// backgrounds).
class AppColors {
  const AppColors({
    required this.brightness,
    // Chrome
    required this.scaffoldBg,
    required this.appBarBg,
    required this.divider,
    required this.hairline,
    required this.cardFill,
    required this.inputFill,
    required this.cardBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textFaint,
    required this.link,
    required this.accentGold,
    // Display
    required this.displayBg,
    required this.displayBorder,
    required this.displayText,
    required this.displayDim,
    required this.displaySub,
    required this.displayError,
    // Keypad
    required this.digit,
    required this.digitPressed,
    required this.digitDisabled,
    required this.op,
    required this.opPressed,
    required this.equals,
    required this.keyBorder,
    required this.keyBorderDisabled,
    required this.ac,
    required this.acPressed,
    required this.pagerFill,
    required this.pagerBorder,
    required this.expandHintBg,
    required this.dotsIcon,
    // Converter keypad extras
    required this.magnitude,
    required this.inertKey,
    // Illustrations (theory diagrams): neutral strokes/labels only — the
    // colored polygon accents stay theme-independent.
    required this.illusLine,
    required this.illusFaint,
    required this.illusDot,
  });

  final Brightness brightness;

  final Color scaffoldBg;
  final Color appBarBg;
  final Color divider; // 1-dp list dividers (dark: 0xFF2C2C2C)
  final Color hairline; // keypad/display hairlines (dark: 0xFF333333)
  final Color cardFill; // cards, toggle fills (dark: 0xFF2A2A2A)
  final Color inputFill; // text-field fills (dark: 0xFF1F1F1F)
  final Color cardBorder; // card/field borders (dark: 0xFF3C3C3C/404040)
  final Color textPrimary; // dark: white
  final Color textSecondary; // dark: 0xFFD0D0D0/D8D8D8/E0E0E0
  final Color textTertiary; // dark: 0xFFC8C8C8/B0B0B0
  final Color textMuted; // dark: 0xFFA0A0A0
  final Color textFaint; // dark: 0xFF808080/8C8C8C
  final Color link; // dark: 0xFF64C8FF (also info icons, world badge)
  final Color accentGold; // dark: 0xFFFFD700

  final Color displayBg; // dark: 0xFF101010
  final Color displayBorder; // dark: 0xFF333333
  final Color displayText; // dark: white
  final Color displayDim; // dark: 0xFFB4B4B4 (ellipsis/overflow)
  final Color displaySub; // dark: 0xFF8A8A8A (memory/sub line)
  final Color displayError; // dark: redAccent.shade100

  final Color digit; // dark: white
  final Color digitPressed; // dark: GOLD 0xFFFFD700
  final Color digitDisabled; // dark: 0xFF606060
  final Color op; // dark: LIGHT_BLUE 0xFF98C8FF
  final Color opPressed; // dark: LIGHT_RED 0xFFFF9090
  final Color equals; // dark: LIGHT_GREEN 0xFF8CDC8C
  final Color keyBorder; // dark: 0xFF505050
  final Color keyBorderDisabled; // dark: 0xFF303030
  final Color ac; // dark: 0xFFFF4040
  final Color acPressed; // dark: 0xFFFF8080
  final Color pagerFill; // dark: 0xFF2A2A2A
  final Color pagerBorder; // dark: 0xFF555555
  final Color expandHintBg; // dark: 0x14FFFFFF
  final Color dotsIcon; // dark: 0xFF6E6E6E

  final Color magnitude; // dark: 0xFFE6C77A (converter magnitude keys)
  final Color inertKey; // dark: 0xFF555555 (converter inert op keys)

  final Color illusLine; // dark: 0xFFD0D0D0
  final Color illusFaint; // dark: 0xFF6E6E6E
  final Color illusDot; // dark: 0xFF646464

  bool get isDark => brightness == Brightness.dark;

  /// Soft variant of [accentGold] used for armed-state glows.
  Color get accentGoldSoft => accentGold.withAlpha(0x66);

  /// Fallback-safe palette lookup: dark when no [ThemeScope] is present
  /// (widget tests pumping subtrees standalone, golden-style tools).
  static AppColors of(BuildContext context) =>
      ThemeScope.maybeOf(context)?.colors ?? dark;

  /// The historical hardcoded palette, verbatim.
  static const AppColors dark = AppColors(
    brightness: Brightness.dark,
    scaffoldBg: Color(0xFF1F1F1F),
    appBarBg: Color(0xFF1A1A1A),
    divider: Color(0xFF2C2C2C),
    hairline: Color(0xFF333333),
    cardFill: Color(0xFF2A2A2A),
    inputFill: Color(0xFF1F1F1F),
    cardBorder: Color(0xFF3C3C3C),
    textPrimary: Colors.white,
    textSecondary: Color(0xFFD0D0D0),
    textTertiary: Color(0xFFC8C8C8),
    textMuted: Color(0xFFA0A0A0),
    textFaint: Color(0xFF8C8C8C),
    link: Color(0xFF64C8FF),
    accentGold: Color(0xFFFFD700),
    displayBg: Color(0xFF101010),
    displayBorder: Color(0xFF333333),
    displayText: Colors.white,
    displayDim: Color(0xFFB4B4B4),
    displaySub: Color(0xFF8A8A8A),
    displayError: Color(0xFFFF8A80), // redAccent.shade100
    digit: Colors.white,
    digitPressed: Color(0xFFFFD700), // egui GOLD
    digitDisabled: Color(0xFF606060),
    op: Color(0xFF98C8FF), // egui LIGHT_BLUE
    opPressed: Color(0xFFFF9090), // egui LIGHT_RED
    equals: Color(0xFF8CDC8C), // egui LIGHT_GREEN
    keyBorder: Color(0xFF505050),
    keyBorderDisabled: Color(0xFF303030),
    ac: Color(0xFFFF4040),
    acPressed: Color(0xFFFF8080),
    pagerFill: Color(0xFF2A2A2A),
    pagerBorder: Color(0xFF555555),
    expandHintBg: Color(0x14FFFFFF),
    dotsIcon: Color(0xFF6E6E6E),
    magnitude: Color(0xFFE6C77A),
    inertKey: Color(0xFF555555),
    illusLine: Color(0xFFD0D0D0),
    illusFaint: Color(0xFF6E6E6E),
    illusDot: Color(0xFF646464),
  );

  /// Light counterpart: same accent identity (gold/blue/green/red), darkened
  /// for contrast on light surfaces; neutral greys inverted.
  static const AppColors light = AppColors(
    brightness: Brightness.light,
    scaffoldBg: Color(0xFFF2F2F2),
    appBarBg: Color(0xFFE9E9E9),
    divider: Color(0xFFDADADA),
    hairline: Color(0xFFCCCCCC),
    cardFill: Color(0xFFE4E4E4),
    inputFill: Color(0xFFEDEDED),
    cardBorder: Color(0xFFC4C4C4),
    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF333333),
    textTertiary: Color(0xFF4A4A4A),
    textMuted: Color(0xFF5E5E5E),
    textFaint: Color(0xFF747474),
    link: Color(0xFF1565C0),
    accentGold: Color(0xFFA87900),
    displayBg: Color(0xFFFAFAFA),
    displayBorder: Color(0xFFC0C0C0),
    displayText: Color(0xFF1A1A1A),
    displayDim: Color(0xFF5A5A5A),
    displaySub: Color(0xFF707070),
    displayError: Color(0xFFC62828),
    digit: Color(0xFF1A1A1A),
    digitPressed: Color(0xFFA87900), // darkened gold
    digitDisabled: Color(0xFFB4B4B4),
    op: Color(0xFF1565C0), // darkened blue
    opPressed: Color(0xFFC62828), // darkened red
    equals: Color(0xFF2E7D32), // darkened green
    keyBorder: Color(0xFFBDBDBD),
    keyBorderDisabled: Color(0xFFDCDCDC),
    ac: Color(0xFFD32F2F),
    acPressed: Color(0xFFFF8080),
    pagerFill: Color(0xFFE4E4E4),
    pagerBorder: Color(0xFFB0B0B0),
    expandHintBg: Color(0x14000000),
    dotsIcon: Color(0xFF9A9A9A),
    magnitude: Color(0xFF8A6D1F),
    inertKey: Color(0xFFAAAAAA),
    illusLine: Color(0xFF454545),
    illusFaint: Color(0xFFA0A0A0),
    illusDot: Color(0xFFB0B0B0),
  );
}

class ThemeNotifier extends ChangeNotifier {
  static const String _prefsKey = 'theme_mode_v1';

  ThemeSetting _setting = ThemeSetting.dark;
  Brightness _platformBrightness = Brightness.dark;
  bool _loaded = false;

  ThemeSetting get setting => _setting;
  bool get loaded => _loaded;

  /// Resolved palette for the current setting (+ OS brightness in `system`).
  AppColors get colors => switch (_setting) {
    ThemeSetting.dark => AppColors.dark,
    ThemeSetting.light => AppColors.light,
    ThemeSetting.system =>
      _platformBrightness == Brightness.light ? AppColors.light : AppColors.dark,
  };

  /// Fed by the app root (initial value + didChangePlatformBrightness).
  /// Only notifies while in `system` mode — in explicit modes the resolved
  /// palette cannot change with OS brightness.
  void updatePlatformBrightness(Brightness b) {
    if (b == _platformBrightness) return;
    _platformBrightness = b;
    if (_setting == ThemeSetting.system) notifyListeners();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    // Unknown/missing strings fall back to dark = the pre-theme behavior.
    _setting = ThemeSetting.values.asNameMap()[raw] ?? ThemeSetting.dark;
    _loaded = true;
    notifyListeners();
  }

  Future<void> setSetting(ThemeSetting next) async {
    if (next == _setting) return;
    _setting = next;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, next.name);
  }
}

class ThemeScope extends InheritedNotifier<ThemeNotifier> {
  const ThemeScope({
    super.key,
    required ThemeNotifier super.notifier,
    required super.child,
  });

  static ThemeNotifier? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeScope>()?.notifier;

  static ThemeNotifier of(BuildContext context) {
    final scope = maybeOf(context);
    assert(scope != null, 'ThemeScope.of called outside the theme scope.');
    return scope!;
  }
}
