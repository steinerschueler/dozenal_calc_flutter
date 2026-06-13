// Smoke tests for the settings page: all rows render, the segment toggles
// drive their notifiers, and the calc-state rows (numeral system / angle
// mode) appear only when a CalcStateScope is present.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/calc_prefs.dart';
import 'package:dozenal_calc_flutter/calc_scope.dart';
import 'package:dozenal_calc_flutter/haptics.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:dozenal_calc_flutter/settings_page.dart';
import 'package:dozenal_calc_flutter/state.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

Widget _wrap({
  required CalcPrefsNotifier prefs,
  required GlyphStyleNotifier glyphs,
  required HapticsNotifier haptics,
  DozenalCalcState? calcState,
  ThemeNotifier? theme,
}) {
  Widget page = const SettingsPage();
  if (calcState != null) {
    page = CalcStateScope(notifier: calcState, child: page);
  }
  Widget tree = GlyphStyleScope(
    notifier: glyphs,
    child: HapticsScope(
      notifier: haptics,
      child: CalcPrefsScope(
        notifier: prefs,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: page,
        ),
      ),
    ),
  );
  if (theme != null) {
    tree = ThemeScope(notifier: theme, child: tree);
  }
  return tree;
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('renders all rows when a calc state is present', (tester) async {
    final state = DozenalCalcState();
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
        calcState: state,
      ),
    );
    expect(tester.takeException(), isNull);
    // EN locale resolves in tests.
    expect(find.text('Function keys'), findsOneWidget);
    expect(find.text('Functions'), findsOneWidget);
    expect(find.text('Number base'), findsOneWidget);
    expect(find.text('Angle mode'), findsOneWidget);
    // Written-out labels (since the Doz/Dez keys left the keypad overlay,
    // this row is the primary base switch).
    expect(find.text('Dozenal'), findsOneWidget);
    expect(find.text('DEG'), findsOneWidget);
    state.dispose();
  });

  testWidgets('hides the calc-state rows without a CalcStateScope', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('Function keys'), findsOneWidget);
    expect(find.text('Number base'), findsNothing);
    expect(find.text('Angle mode'), findsNothing);
    // No ThemeScope in this wrap either → theme row hidden too.
    expect(find.text('Appearance'), findsNothing);
  });

  testWidgets('theme segment renders and drives ThemeNotifier', (
    tester,
  ) async {
    final theme = ThemeNotifier();
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
        theme: theme,
      ),
    );
    expect(find.text('Appearance'), findsOneWidget);
    expect(theme.setting, ThemeSetting.dark);

    await tester.tap(find.text('Light'));
    await tester.pump();
    expect(theme.setting, ThemeSetting.light);

    await tester.tap(find.text('System'));
    await tester.pump();
    expect(theme.setting, ThemeSetting.system);
  });

  testWidgets('keypad-glyphs segment drives setKeypadStyle', (tester) async {
    final glyphs = GlyphStyleNotifier();
    // Both prefs now default to conventional; start on the custom glyphs so
    // tapping the conventional segment is a real change and the display
    // pref's independence stays observable.
    await glyphs.setKeypadStyle(GlyphStyle.custom);
    await glyphs.setStyle(GlyphStyle.custom);
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: glyphs,
        haptics: HapticsNotifier(),
      ),
    );
    expect(find.text('Keypad digits'), findsOneWidget);
    expect(glyphs.keypadStyle, GlyphStyle.custom);

    // Two glyph rows share the segment labels (display + keypad); the
    // keypad row is the second one.
    await tester.tap(find.text('0–9, A, B').last);
    await tester.pump();
    expect(glyphs.keypadStyle, GlyphStyle.conventional);
    expect(glyphs.style, GlyphStyle.custom, reason: 'display pref untouched');
  });

  testWidgets('keypad-mode segment drives CalcPrefsNotifier', (tester) async {
    final prefs = CalcPrefsNotifier();
    await prefs.load();
    await tester.pumpWidget(
      _wrap(
        prefs: prefs,
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
      ),
    );
    await tester.tap(find.text('Scroll'));
    await tester.pump();
    expect(prefs.mode, KeypadMode.scroll);

    await tester.tap(find.text('Basic'));
    await tester.pump();
    expect(prefs.profile, KeypadProfile.simple);
  });

  testWidgets('Decimal segment switches the live calc state', (tester) async {
    final state = DozenalCalcState();
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
        calcState: state,
      ),
    );
    expect(state.numeralSystem, NumeralSystem.doz);
    await tester.tap(find.text('Decimal'));
    await tester.pump();
    expect(state.numeralSystem, NumeralSystem.dez);
    state.dispose();
  });

  testWidgets('angle segment calls setAngleMode', (tester) async {
    final state = DozenalCalcState();
    await tester.pumpWidget(
      _wrap(
        prefs: CalcPrefsNotifier(),
        glyphs: GlyphStyleNotifier(),
        haptics: HapticsNotifier(),
        calcState: state,
      ),
    );
    await tester.tap(find.text('RAD'));
    await tester.pump();
    expect(state.angleMode, AngleMode.rad);
    state.dispose();
  });
}
