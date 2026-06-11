// Smoke tests for the orientation-driven Keypad layout introduced in
// Build 4. We don't assert pixel-exact geometry — we just verify the keypad
// builds without throwing across the matrix of orientations × heights, and
// that the panel-swap renders both states.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/calc_prefs.dart';
import 'package:dozenal_calc_flutter/keypad.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';

Widget _wrap(
  Size size, {
  bool overlayOpen = false,
  int overlayPage = 0,
  ValueChanged<int>? onOverlayPageChanged,
  KeypadMode keypadMode = KeypadMode.overlay,
  KeypadProfile keypadProfile = KeypadProfile.full,
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Keypad(
            onTap: (_) {},
            overlayOpen: overlayOpen,
            overlayPage: overlayPage,
            onOverlayPageChanged: onOverlayPageChanged,
            keypadMode: keypadMode,
            keypadProfile: keypadProfile,
          ),
        ),
      ),
    ),
  );
}

// English semantics labels (test locale resolves to en) used to identify
// specific keys across the mode/profile matrix.
const String _expandLabel = 'open extension panel';
const String _sinhLabel = 'hyperbolic sine';

void main() {
  // Hoch (portrait) — three keypad-height classes.
  testWidgets('Hoch keypad builds at comfortable height (>= 560)', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 700)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Hoch keypad builds in tight regime (480 ≤ h < 560)', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(_wrap(const Size(400, 520)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Hoch keypad falls back to scroll below 480', (tester) async {
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
  testWidgets('Breit keypad builds on phone-landscape proportions', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 400));
    await tester.pumpWidget(_wrap(const Size(800, 300)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Breit keypad builds on tablet portrait proportions', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 1800));
    await tester.pumpWidget(_wrap(const Size(1200, 1000)));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Breit keypad builds on tablet landscape proportions', (
    tester,
  ) async {
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
  testWidgets('Breit keypad scrolls vertically when height is too small', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 200));
    await tester.pumpWidget(_wrap(const Size(800, 200)));
    expect(
      tester.takeException(),
      isNull,
      reason: 'no RenderFlex overflow on tiny landscape',
    );
    expect(
      find.byType(SingleChildScrollView),
      findsWidgets,
      reason: 'scroll fallback engaged',
    );
  });

  // Regression: Build 6 — Breit mode computed buttonSize from height only,
  // so phone-landscape (e.g. Pixel 7 ≈ 891 × 290 keypad area) produced a
  // button big enough that the 13-column row overflowed the available
  // width by ~30 dp. The fix derives buttonSize from min(height, width)
  // and stretches the inter-set gap (up to a cap) to absorb any remaining
  // horizontal slack so the row fills the viewport instead of leaving a
  // band of whitespace on the right.
  testWidgets('Breit keypad fills width on phone-landscape (Pixel-class)', (
    tester,
  ) async {
    const Size keypadArea = Size(891, 290);
    await tester.binding.setSurfaceSize(keypadArea);
    await tester.pumpWidget(_wrap(keypadArea));
    expect(tester.takeException(), isNull);

    final rowFinder = find.descendant(
      of: find.byWidgetPredicate(
        (w) =>
            w is SingleChildScrollView && w.scrollDirection == Axis.horizontal,
      ),
      matching: find.byType(Row),
    );
    expect(rowFinder, findsWidgets);
    expect(
      tester.getSize(rowFinder.first).width,
      closeTo(keypadArea.width, 0.5),
      reason:
          'inter-set gap should stretch so the row fills the viewport, '
          'no band of whitespace on the right',
    );
  });

  // Regression: a compact phone (~829 × 274 dp keypad area) is height-limited
  // and used to show a ~41 dp horizontal gap on the right. Same assertion
  // covers a different phone-landscape aspect ratio.
  testWidgets('Breit keypad fills width on compact-phone landscape', (
    tester,
  ) async {
    const Size keypadArea = Size(829, 274);
    await tester.binding.setSurfaceSize(keypadArea);
    await tester.pumpWidget(_wrap(keypadArea));
    expect(tester.takeException(), isNull);

    final rowFinder = find.descendant(
      of: find.byWidgetPredicate(
        (w) =>
            w is SingleChildScrollView && w.scrollDirection == Axis.horizontal,
      ),
      matching: find.byType(Row),
    );
    expect(
      tester.getSize(rowFinder.first).width,
      closeTo(keypadArea.width, 0.5),
    );
  });

  // Regression: a very compact phone (~670 × 240 dp keypad area in landscape)
  // used to scroll on BOTH axes because the 44 dp touch-target floor pushed
  // buttonSize uniformly too big — naturalHeight=262>240 AND baseNaturalWidth=688>670.
  // With breitMinTouchTarget = 36 the button shrinks to ~40 dp and the whole
  // layout fits both axes without any scroll fallback engaging.
  testWidgets('Breit keypad fits compact-phone landscape without scrolling', (
    tester,
  ) async {
    const Size keypadArea = Size(670, 240);
    await tester.binding.setSurfaceSize(keypadArea);
    await tester.pumpWidget(_wrap(keypadArea));
    expect(tester.takeException(), isNull);

    // Outer vertical scroll fallback must NOT engage at this size.
    final outerVertical = find.byWidgetPredicate(
      (w) => w is SingleChildScrollView && w.scrollDirection == Axis.vertical,
    );
    expect(
      outerVertical,
      findsNothing,
      reason: 'with the 36 dp Breit floor, height fits — no vertical scroll',
    );

    // Content row should span the viewport (group-gap absorbs slack).
    final rowFinder = find.descendant(
      of: find.byWidgetPredicate(
        (w) =>
            w is SingleChildScrollView && w.scrollDirection == Axis.horizontal,
      ),
      matching: find.byType(Row),
    );
    expect(rowFinder, findsWidgets);
    expect(
      tester.getSize(rowFinder.first).width,
      closeTo(keypadArea.width, 1.0),
      reason: 'row should fill width without horizontal clipping',
    );
  });

  // Third-group paging (Breit): page 1 swaps Sets 6-10 for the function-key
  // columns at identical total width, so the same compact-phone fit guarantee
  // must hold — no vertical scroll, row fills the viewport.
  testWidgets('Breit function page fits compact-phone landscape too', (
    tester,
  ) async {
    const Size keypadArea = Size(670, 240);
    await tester.binding.setSurfaceSize(keypadArea);
    await tester.pumpWidget(_wrap(keypadArea, overlayPage: 1));
    expect(tester.takeException(), isNull);

    final outerVertical = find.byWidgetPredicate(
      (w) => w is SingleChildScrollView && w.scrollDirection == Axis.vertical,
    );
    expect(
      outerVertical,
      findsNothing,
      reason: 'function page must not change the fit math',
    );

    final rowFinder = find.descendant(
      of: find.byWidgetPredicate(
        (w) =>
            w is SingleChildScrollView && w.scrollDirection == Axis.horizontal,
      ),
      matching: find.byType(Row),
    );
    expect(rowFinder, findsWidgets);
    expect(
      tester.getSize(rowFinder.first).width,
      closeTo(keypadArea.width, 1.0),
      reason: 'page 1 row should fill width exactly like page 0',
    );
  });

  // The edge arrow flips the third-group page: right arrow on page 0 fires
  // onOverlayPageChanged(1); left arrow on page 1 fires (0).
  testWidgets('Breit edge arrows fire the page-changed callback', (
    tester,
  ) async {
    const Size keypadArea = Size(800, 300);
    await tester.binding.setSurfaceSize(keypadArea);

    int? requested;
    await tester.pumpWidget(
      _wrap(
        keypadArea,
        overlayPage: 0,
        onOverlayPageChanged: (p) => requested = p,
      ),
    );
    await tester.tap(find.byIcon(Icons.chevron_right));
    expect(requested, 1, reason: 'right arrow requests the function page');

    await tester.pumpWidget(
      _wrap(
        keypadArea,
        overlayPage: 1,
        onOverlayPageChanged: (p) => requested = p,
      ),
    );
    await tester.tap(find.byIcon(Icons.chevron_left));
    expect(requested, 0, reason: 'left arrow requests the sets page');
  });

  // Settings-driven keypad modes (Build 15): KeypadMode.scroll stacks all
  // sets in one scrolling column, KeypadProfile.simple drops the extended
  // sets entirely. Defaults (overlay + full) must reproduce the pre-settings
  // keypad exactly — covered implicitly by every test above.
  group('keypad mode / profile prefs', () {
    test('Keypad defaults to overlay mode and full profile', () {
      final k = Keypad(onTap: (_) {});
      expect(k.keypadMode, KeypadMode.overlay);
      expect(k.keypadProfile, KeypadProfile.full);
    });

    testWidgets('Hoch full profile shows the Expand key', (tester) async {
      final semantics = tester.ensureSemantics();
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(_wrap(const Size(400, 700)));
      expect(find.bySemanticsLabel(_expandLabel), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('Hoch simple profile omits Expand and extended sets', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        _wrap(const Size(400, 700), keypadProfile: KeypadProfile.simple),
      );
      expect(tester.takeException(), isNull);
      expect(find.bySemanticsLabel(_expandLabel), findsNothing);
      expect(find.bySemanticsLabel(_sinhLabel), findsNothing);
      semantics.dispose();
    });

    testWidgets('Hoch scroll mode stacks extended sets without Expand', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        _wrap(const Size(400, 700), keypadMode: KeypadMode.scroll),
      );
      expect(tester.takeException(), isNull);
      // One vertical scroll column instead of the panel swap…
      expect(
        find.byWidgetPredicate(
          (w) =>
              w is SingleChildScrollView && w.scrollDirection == Axis.vertical,
        ),
        findsOneWidget,
      );
      // …no Expand toggle, but the extended keys are in the tree.
      expect(find.bySemanticsLabel(_expandLabel), findsNothing);
      expect(find.bySemanticsLabel(_sinhLabel), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('Hoch scroll mode ignored for the simple profile', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        _wrap(
          const Size(400, 700),
          keypadMode: KeypadMode.scroll,
          keypadProfile: KeypadProfile.simple,
        ),
      );
      expect(tester.takeException(), isNull);
      // Simple has nothing to scroll to — no scroll view at this height.
      expect(find.byType(SingleChildScrollView), findsNothing);
      expect(find.bySemanticsLabel(_sinhLabel), findsNothing);
      semantics.dispose();
    });

    testWidgets('Breit scroll mode inlines function columns, no arrows', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();
      const Size keypadArea = Size(800, 300);
      await tester.binding.setSurfaceSize(keypadArea);
      await tester.pumpWidget(_wrap(keypadArea, keypadMode: KeypadMode.scroll));
      expect(tester.takeException(), isNull);
      expect(find.byIcon(Icons.chevron_right), findsNothing);
      expect(find.byIcon(Icons.chevron_left), findsNothing);
      // Function keys sit inline with Sets 6-10 on the same row.
      expect(find.bySemanticsLabel(_sinhLabel), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('Breit simple profile drops the third group entirely', (
      tester,
    ) async {
      final semantics = tester.ensureSemantics();
      const Size keypadArea = Size(800, 300);
      await tester.binding.setSurfaceSize(keypadArea);
      await tester.pumpWidget(
        _wrap(keypadArea, keypadProfile: KeypadProfile.simple),
      );
      expect(tester.takeException(), isNull);
      expect(find.byIcon(Icons.chevron_right), findsNothing);
      expect(find.bySemanticsLabel(_sinhLabel), findsNothing);
      // Row still spans the viewport (outer SizedBox forces it).
      final rowFinder = find.descendant(
        of: find.byWidgetPredicate(
          (w) =>
              w is SingleChildScrollView &&
              w.scrollDirection == Axis.horizontal,
        ),
        matching: find.byType(Row),
      );
      expect(rowFinder, findsWidgets);
      expect(
        tester.getSize(rowFinder.first).width,
        closeTo(keypadArea.width, 1.0),
      );
      semantics.dispose();
    });
  });
}
