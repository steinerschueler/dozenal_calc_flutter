// Tests for the theme system: ThemeNotifier defaults, SharedPreferences
// round-trip, fallback on unknown stored values, notification behavior,
// the system-mode brightness resolution, the scope-less AppColors.of
// fallback, and a light-mode smoke test of the whole app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('defaults to dark = the pre-theme behavior', () {
    final theme = ThemeNotifier();
    expect(theme.setting, ThemeSetting.dark);
    expect(theme.colors, AppColors.dark);
    expect(theme.loaded, isFalse);
  });

  test('load with empty storage keeps dark and flips loaded', () async {
    SharedPreferences.setMockInitialValues({});
    final theme = ThemeNotifier();
    await theme.load();
    expect(theme.setting, ThemeSetting.dark);
    expect(theme.loaded, isTrue);
  });

  test('setSetting persists and a fresh notifier restores it', () async {
    SharedPreferences.setMockInitialValues({});
    final first = ThemeNotifier();
    await first.load();
    await first.setSetting(ThemeSetting.light);

    final second = ThemeNotifier();
    await second.load();
    expect(second.setting, ThemeSetting.light);
    expect(second.colors, AppColors.light);
  });

  test('unknown stored string falls back to dark', () async {
    SharedPreferences.setMockInitialValues({'theme_mode_v1': 'sepia'});
    final theme = ThemeNotifier();
    await theme.load();
    expect(theme.setting, ThemeSetting.dark);
    expect(theme.colors, AppColors.dark);
  });

  test('setSetting notifies on change and no-ops on equal values', () async {
    SharedPreferences.setMockInitialValues({});
    final theme = ThemeNotifier();
    await theme.load();

    var notifications = 0;
    theme.addListener(() => notifications++);

    await theme.setSetting(ThemeSetting.light);
    expect(notifications, 1);
    await theme.setSetting(ThemeSetting.light);
    expect(notifications, 1);
  });

  test('system mode resolves via platform brightness', () async {
    SharedPreferences.setMockInitialValues({});
    final theme = ThemeNotifier();
    await theme.setSetting(ThemeSetting.system);

    theme.updatePlatformBrightness(Brightness.dark);
    expect(theme.colors, AppColors.dark);
    theme.updatePlatformBrightness(Brightness.light);
    expect(theme.colors, AppColors.light);
  });

  test('platform brightness only notifies in system mode', () async {
    SharedPreferences.setMockInitialValues({});
    final theme = ThemeNotifier();
    theme.updatePlatformBrightness(Brightness.dark);

    var notifications = 0;
    theme.addListener(() => notifications++);

    // Explicit dark: OS brightness flips must not notify — the resolved
    // palette cannot change.
    theme.updatePlatformBrightness(Brightness.light);
    expect(notifications, 0);

    await theme.setSetting(ThemeSetting.system);
    notifications = 0;
    theme.updatePlatformBrightness(Brightness.dark);
    expect(notifications, 1);
    // Same value again: no notification.
    theme.updatePlatformBrightness(Brightness.dark);
    expect(notifications, 1);
  });

  testWidgets('AppColors.of without a ThemeScope falls back to dark', (
    tester,
  ) async {
    late AppColors resolved;
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          resolved = AppColors.of(context);
          return const SizedBox.shrink();
        },
      ),
    );
    expect(resolved, AppColors.dark);
  });

  testWidgets('app boots in light mode without errors', (tester) async {
    SharedPreferences.setMockInitialValues({
      'theme_mode_v1': 'light',
      // Skip the onboarding intro (matches _kIntroSeenFlag in main.dart).
      'intro_seen_v4': true,
    });
    await tester.pumpWidget(const DozenalCalcApp());
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.theme!.brightness, Brightness.light);
    expect(app.theme!.scaffoldBackgroundColor, AppColors.light.scaffoldBg);
  });
}
