// Tests for GlyphStyleNotifier's two independent prefs (display digits,
// keypad digit keys): defaults, persistence round-trips, independence, and
// the scope-less keypadStyleOf fallback used by the keypads.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/logic/glyph_style.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('defaults: both prefs are conventional digits', () {
    final n = GlyphStyleNotifier();
    expect(n.style, GlyphStyle.conventional);
    expect(n.keypadStyle, GlyphStyle.conventional);
  });

  test('keypad pref persists and reloads independently of the display pref',
      () async {
    final first = GlyphStyleNotifier();
    await first.load();
    await first.setKeypadStyle(GlyphStyle.custom); // non-default
    expect(first.style, GlyphStyle.conventional, reason: 'display pref untouched');

    final second = GlyphStyleNotifier();
    await second.load();
    expect(second.keypadStyle, GlyphStyle.custom);
    expect(second.style, GlyphStyle.conventional);
  });

  test('display pref persists without affecting the keypad pref', () async {
    final first = GlyphStyleNotifier();
    await first.load();
    await first.setStyle(GlyphStyle.custom); // non-default

    final second = GlyphStyleNotifier();
    await second.load();
    expect(second.style, GlyphStyle.custom);
    expect(second.keypadStyle, GlyphStyle.conventional);
  });

  test('unknown stored strings fall back to the conventional default',
      () async {
    SharedPreferences.setMockInitialValues({
      'glyph_style_v1': 'comic-sans',
      'keypad_glyph_style_v1': 'wingdings',
    });
    final n = GlyphStyleNotifier();
    await n.load();
    expect(n.style, GlyphStyle.conventional);
    expect(n.keypadStyle, GlyphStyle.conventional);
  });

  test('setKeypadStyle notifies on change and no-ops on equal values',
      () async {
    final n = GlyphStyleNotifier();
    await n.load();
    var notifications = 0;
    n.addListener(() => notifications++);

    await n.setKeypadStyle(GlyphStyle.custom); // non-default → changes
    expect(notifications, 1);
    await n.setKeypadStyle(GlyphStyle.custom);
    expect(notifications, 1);
  });

  testWidgets('keypadStyleOf without a scope falls back to custom', (
    tester,
  ) async {
    late GlyphStyle resolved;
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          resolved = GlyphStyleScope.keypadStyleOf(context);
          return const SizedBox.shrink();
        },
      ),
    );
    expect(resolved, GlyphStyle.custom);
  });

  testWidgets('keypadStyleOf reads the scoped notifier', (tester) async {
    // Default keypad style is conventional — distinct from the no-scope
    // fallback (custom), so this proves the scope's value is read.
    final n = GlyphStyleNotifier();
    late GlyphStyle resolved;
    await tester.pumpWidget(
      GlyphStyleScope(
        notifier: n,
        child: Builder(
          builder: (context) {
            resolved = GlyphStyleScope.keypadStyleOf(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(resolved, GlyphStyle.conventional);
  });
}
