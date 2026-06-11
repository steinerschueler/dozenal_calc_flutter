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

  test('defaults: both prefs are custom glyphs', () {
    final n = GlyphStyleNotifier();
    expect(n.style, GlyphStyle.custom);
    expect(n.keypadStyle, GlyphStyle.custom);
  });

  test('keypad pref persists and reloads independently of the display pref',
      () async {
    final first = GlyphStyleNotifier();
    await first.load();
    await first.setKeypadStyle(GlyphStyle.conventional);
    expect(first.style, GlyphStyle.custom, reason: 'display pref untouched');

    final second = GlyphStyleNotifier();
    await second.load();
    expect(second.keypadStyle, GlyphStyle.conventional);
    expect(second.style, GlyphStyle.custom);
  });

  test('display pref persists without affecting the keypad pref', () async {
    final first = GlyphStyleNotifier();
    await first.load();
    await first.setStyle(GlyphStyle.conventional);

    final second = GlyphStyleNotifier();
    await second.load();
    expect(second.style, GlyphStyle.conventional);
    expect(second.keypadStyle, GlyphStyle.custom);
  });

  test('unknown stored strings fall back to custom', () async {
    SharedPreferences.setMockInitialValues({
      'glyph_style_v1': 'comic-sans',
      'keypad_glyph_style_v1': 'wingdings',
    });
    final n = GlyphStyleNotifier();
    await n.load();
    expect(n.style, GlyphStyle.custom);
    expect(n.keypadStyle, GlyphStyle.custom);
  });

  test('setKeypadStyle notifies on change and no-ops on equal values',
      () async {
    final n = GlyphStyleNotifier();
    await n.load();
    var notifications = 0;
    n.addListener(() => notifications++);

    await n.setKeypadStyle(GlyphStyle.conventional);
    expect(notifications, 1);
    await n.setKeypadStyle(GlyphStyle.conventional);
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
    final n = GlyphStyleNotifier();
    await n.setKeypadStyle(GlyphStyle.conventional);
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
