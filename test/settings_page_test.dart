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
    expect(find.text('Doz'), findsOneWidget);
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

  testWidgets('Dez segment switches the live calc state', (tester) async {
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
    await tester.tap(find.text('Dez'));
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
