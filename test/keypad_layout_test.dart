// Smoke tests for the orientation-driven Keypad layout introduced in
// Build 4. We don't assert pixel-exact geometry — we just verify the keypad
// builds without throwing across the matrix of orientations × heights, and
// that the panel-swap renders both states.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/keypad.dart';

Widget _wrap(Size size, {bool overlayOpen = false}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Keypad(
            onTap: (_) {},
            overlayOpen: overlayOpen,
          ),
        ),
      ),
    ),
  );
}

void main() {
  // Hoch (portrait) — three keypad-height classes.
  testWidgets('Hoch keypad builds at comfortable height (>= 560)',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 700)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Hoch keypad builds in tight regime (480 ≤ h < 560)',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 520)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Hoch keypad falls back to scroll below 480',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 400)));
    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsWidgets);
  });

  // Panel-swap: both states render without error.
  testWidgets('Hoch panel-swap renders with overlay closed', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 700), overlayOpen: false));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Hoch panel-swap renders with overlay open', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 700), overlayOpen: true));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  // Breit (landscape / tablet inline).
  testWidgets('Breit keypad builds on phone-landscape proportions',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 400));
    await tester.pumpWidget(_wrap(const Size(800, 300)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Breit keypad builds on tablet portrait proportions',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 1800));
    await tester.pumpWidget(_wrap(const Size(1200, 1000)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Breit keypad builds on tablet landscape proportions',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1800, 1200));
    await tester.pumpWidget(_wrap(const Size(1800, 800)));
    expect(tester.takeException(), isNull);
  });

  // Toggle wiring — Expand sets state.overlayOpen, but here we just check
  // that the keypad doesn't crash when overlayOpen flips.
  testWidgets('Hoch keypad re-renders when overlayOpen flips', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 700), overlayOpen: false));
    await tester.pumpWidget(_wrap(const Size(400, 700), overlayOpen: true));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  // Sanity: the public Keypad accepts the new overlayOpen parameter.
  test('Keypad accepts overlayOpen parameter', () {
    final k = Keypad(onTap: (_) {}, overlayOpen: true);
    expect(k.overlayOpen, isTrue);
  });

  test('Keypad defaults overlayOpen to false', () {
    final k = Keypad(onTap: (_) {});
    expect(k.overlayOpen, isFalse);
  });

  // Regression: B8 — Breit mode used to overflow vertically when available
  // height was less than the natural row stack. Now a vertical scroll
  // fallback engages.
  testWidgets('Breit keypad scrolls vertically when height is too small',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 200));
    await tester.pumpWidget(_wrap(const Size(800, 200)));
    expect(tester.takeException(), isNull,
        reason: 'no RenderFlex overflow on tiny landscape');
    expect(find.byType(SingleChildScrollView), findsWidgets,
        reason: 'scroll fallback engaged');
  });
}
