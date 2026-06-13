// Tests for CalcPrefsNotifier: defaults, SharedPreferences round-trip,
// graceful fallback on unknown stored values, and notification behavior.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/calc_prefs.dart';
import 'package:dozenal_calc_flutter/tokens.dart' show AngleMode, NumeralSystem;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('defaults: decimal numerals, overlay/full/deg keypad', () {
    final prefs = CalcPrefsNotifier();
    expect(prefs.mode, KeypadMode.overlay);
    expect(prefs.profile, KeypadProfile.full);
    expect(prefs.numeralSystem, NumeralSystem.dez);
    expect(prefs.angleMode, AngleMode.deg);
    expect(prefs.fontSize, FontSize.normal);
    expect(prefs.loaded, isFalse);
  });

  test('load with empty storage keeps defaults and flips loaded', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = CalcPrefsNotifier();
    await prefs.load();
    expect(prefs.mode, KeypadMode.overlay);
    expect(prefs.profile, KeypadProfile.full);
    expect(prefs.numeralSystem, NumeralSystem.dez);
    expect(prefs.angleMode, AngleMode.deg);
    expect(prefs.fontSize, FontSize.normal);
    expect(prefs.loaded, isTrue);
  });

  test('setters persist and a fresh notifier restores them', () async {
    SharedPreferences.setMockInitialValues({});
    final first = CalcPrefsNotifier();
    await first.load();
    await first.setMode(KeypadMode.scroll);
    await first.setProfile(KeypadProfile.simple);
    await first.setNumeralSystem(NumeralSystem.doz); // non-default → real roundtrip
    await first.setAngleMode(AngleMode.rad);
    await first.setFontSize(FontSize.large);

    final second = CalcPrefsNotifier();
    await second.load();
    expect(second.mode, KeypadMode.scroll);
    expect(second.profile, KeypadProfile.simple);
    expect(second.numeralSystem, NumeralSystem.doz);
    expect(second.angleMode, AngleMode.rad);
    expect(second.fontSize, FontSize.large);
  });

  test('effectiveTextScale: phones unchanged at Normal, tablets boosted', () {
    expect(effectiveTextScale(FontSize.normal, 360), 1.0); // phone
    expect(effectiveTextScale(FontSize.normal, 600), 1.0); // phone/tablet edge
    expect(effectiveTextScale(FontSize.normal, 800), greaterThan(1.3)); // tablet
    expect(effectiveTextScale(FontSize.large, 360), closeTo(1.2, 1e-9));
    expect(effectiveTextScale(FontSize.xlarge, 360), closeTo(1.4, 1e-9));
    // User choice and tablet baseline compose.
    expect(effectiveTextScale(FontSize.large, 800),
        closeTo(effectiveTextScale(FontSize.normal, 800) * 1.2, 1e-9));
  });

  test('unknown stored strings fall back to the defaults', () async {
    SharedPreferences.setMockInitialValues({
      'keypad_mode_v1': 'sideways',
      'keypad_profile_v1': '',
      'numeral_system_v1': 'hexadecimal',
      'angle_mode_v1': 'turns',
    });
    final prefs = CalcPrefsNotifier();
    await prefs.load();
    expect(prefs.mode, KeypadMode.overlay);
    expect(prefs.profile, KeypadProfile.full);
    expect(prefs.numeralSystem, NumeralSystem.dez);
    expect(prefs.angleMode, AngleMode.deg);
  });

  test('setters notify on change and no-op on equal values', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = CalcPrefsNotifier();
    await prefs.load();

    var notifications = 0;
    prefs.addListener(() => notifications++);

    await prefs.setMode(KeypadMode.scroll);
    expect(notifications, 1);
    // Same value again: no notification, no disk write.
    await prefs.setMode(KeypadMode.scroll);
    expect(notifications, 1);

    await prefs.setAngleMode(AngleMode.grad);
    expect(notifications, 2);
    await prefs.setAngleMode(AngleMode.grad);
    expect(notifications, 2);
  });
}
