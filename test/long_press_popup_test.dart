// Tests for the long-press popups on the keypad host keys (the
// smartphone-keyboard accent pattern that replaced the function page):
// the host map, both selection modes (slide-and-release / release-then-
// tap), the tap-outside dismissal, the a11y hold hint, and the Set-10
// EXP slot that took over from the removed Doz/Dez keys.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/calc_prefs.dart';
import 'package:dozenal_calc_flutter/keypad.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

Widget _wrap(
  Size size,
  List<CalcToken> tapped, {
  bool overlayOpen = false,
  DisabledPredicate? isDisabled,
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
            onTap: tapped.add,
            overlayOpen: overlayOpen,
            isDisabled: isDisabled,
            keypadMode: KeypadMode.overlay,
            keypadProfile: KeypadProfile.full,
          ),
        ),
      ),
    ),
  );
}

/// Long-presses the key labelled [label] and returns the still-down gesture
/// (popup is open when this returns).
Future<TestGesture> _holdKey(WidgetTester tester, String label) async {
  final gesture = await tester.startGesture(
    tester.getCenter(find.bySemanticsLabel(label)),
  );
  await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
  return gesture;
}

void main() {
  const Size hochArea = Size(400, 700);

  group('longPressOptionsFor', () {
    test('maps the six hosts to their related functions', () {
      expect(longPressOptionsFor(const ExpTopRight()), const [Square()]);
      expect(longPressOptionsFor(const LogBotRight()), const [
        Ln(),
        Log12(),
        ExpE(),
      ]);
      expect(longPressOptionsFor(const Sub()), const [PlusMinus()]);
      expect(longPressOptionsFor(const Sto()), const [
        MemPlus(),
        MemMinus(),
      ]);
      expect(longPressOptionsFor(const Factorial()), const [NCr(), NPr()]);
      expect(longPressOptionsFor(const ConvAns()), const [AssetAns()]);
    });

    test('returns empty for non-host tokens', () {
      expect(longPressOptionsFor(const Add()), isEmpty);
      expect(longPressOptionsFor(const Equals()), isEmpty);
      expect(longPressOptionsFor(const Sin()), isEmpty);
      expect(longPressOptionsFor(const Ac()), isEmpty);
    });
  });

  group('popup interaction', () {
    testWidgets('slide-and-release selects the hovered option', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));

      final gesture = await _holdKey(tester, 'minus');
      expect(find.bySemanticsLabel('Toggle sign'), findsOneWidget);

      await gesture.moveTo(
        tester.getCenter(find.bySemanticsLabel('Toggle sign')),
      );
      await tester.pump();
      await gesture.up();
      await tester.pump();

      expect(tapped, const [PlusMinus()]);
      expect(find.bySemanticsLabel('Toggle sign'), findsNothing);
      handle.dispose();
    });

    testWidgets('release in place keeps the popup open for a tap', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));

      final gesture = await _holdKey(tester, 'minus');
      await gesture.up();
      await tester.pump();
      // Released on the host key itself — nothing selected yet.
      expect(tapped, isEmpty);
      expect(find.bySemanticsLabel('Toggle sign'), findsOneWidget);

      await tester.tap(find.bySemanticsLabel('Toggle sign'));
      await tester.pump();
      expect(tapped, const [PlusMinus()]);
      expect(find.bySemanticsLabel('Toggle sign'), findsNothing);
      handle.dispose();
    });

    testWidgets('tap outside dismisses without dispatching', (tester) async {
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));

      final gesture = await _holdKey(tester, 'minus');
      await gesture.up();
      await tester.pump();
      expect(find.bySemanticsLabel('Toggle sign'), findsOneWidget);

      await tester.tapAt(const Offset(5, 5)); // empty scaffold corner
      await tester.pump();
      expect(find.bySemanticsLabel('Toggle sign'), findsNothing);
      expect(tapped, isEmpty);
      handle.dispose();
    });

    testWidgets('tap on another key closes the popup AND types that key', (
      tester,
    ) async {
      // The barrier must not swallow input (device-found): like a
      // smartphone-keyboard accent popup, tapping elsewhere acts normally.
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));

      final gesture = await _holdKey(tester, 'minus');
      await gesture.up();
      await tester.pump();
      expect(find.bySemanticsLabel('Toggle sign'), findsOneWidget);

      // × sits below the host, clear of the popup row (the + key above is
      // covered by the option cell — tapping there selects ±, also fine).
      await tester.tap(find.bySemanticsLabel('times'));
      await tester.pump();
      expect(find.bySemanticsLabel('Toggle sign'), findsNothing);
      expect(tapped, const [Mul()]);
      handle.dispose();
    });

    testWidgets('multi-option popup lists all log functions', (tester) async {
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));

      final gesture = await _holdKey(tester, 'logarithm');
      expect(find.bySemanticsLabel('Natural logarithm'), findsOneWidget);
      expect(find.bySemanticsLabel('Logarithm base twelve'), findsOneWidget);
      expect(find.bySemanticsLabel('e to the power x'), findsOneWidget);

      await gesture.moveTo(
        tester.getCenter(find.bySemanticsLabel('Natural logarithm')),
      );
      await tester.pump();
      await gesture.up();
      await tester.pump();
      expect(tapped, const [Ln()]);
      handle.dispose();
    });

    testWidgets('a quick tap on a host still dispatches the host token', (
      tester,
    ) async {
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(hochArea, tapped));
      await tester.tap(find.bySemanticsLabel('minus'));
      await tester.pump();
      expect(tapped, const [Sub()]);
    });

    testWidgets('CONV hosts the asset bridge (VAL) in its popup', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      // CONV sits in Set 10 — the overlay page in Hoch mode.
      await tester.pumpWidget(_wrap(hochArea, tapped, overlayOpen: true));

      final gesture = await _holdKey(
        tester,
        "Insert the unit converter's result",
      );
      expect(
        find.bySemanticsLabel("Insert the value calculator's result"),
        findsOneWidget,
      );

      await gesture.moveTo(
        tester.getCenter(
          find.bySemanticsLabel("Insert the value calculator's result"),
        ),
      );
      await tester.pump();
      await gesture.up();
      await tester.pump();
      expect(tapped, const [AssetAns()]);
      handle.dispose();
    });

    testWidgets('a fully disabled host offers no popup', (tester) async {
      // Both bridge sources empty → CONV is greyed and must not open the
      // VAL popup (disabled keys host nothing).
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(
        hochArea,
        tapped,
        overlayOpen: true,
        isDisabled: (t) => t is ConvAns || t is AssetAns,
      ));

      final gesture = await tester.startGesture(
        tester.getCenter(
          find.bySemanticsLabel("Insert the unit converter's result"),
        ),
      );
      await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
      expect(
        find.bySemanticsLabel("Insert the value calculator's result"),
        findsNothing,
      );
      await gesture.up();
      await tester.pump();
      expect(tapped, isEmpty);
      handle.dispose();
    });

    testWidgets('a greyed popup option neither dispatches nor closes', (
      tester,
    ) async {
      // Converter holds a value, asset does not: CONV stays enabled and
      // hosts the popup, but VAL renders greyed and inert — the same
      // "grey = nothing to pull" affordance as the keys.
      final handle = tester.ensureSemantics();
      final tapped = <CalcToken>[];
      await tester.pumpWidget(_wrap(
        hochArea,
        tapped,
        overlayOpen: true,
        isDisabled: (t) => t is AssetAns,
      ));

      final gesture = await _holdKey(
        tester,
        "Insert the unit converter's result",
      );
      await gesture.up();
      await tester.pump();
      expect(
        find.bySemanticsLabel("Insert the value calculator's result"),
        findsOneWidget,
      );

      await tester.tap(
        find.bySemanticsLabel("Insert the value calculator's result"),
      );
      await tester.pump();
      expect(tapped, isEmpty); // inert: nothing dispatched…
      expect(
        find.bySemanticsLabel("Insert the value calculator's result"),
        findsOneWidget, // …and the popup stays open
      );
      handle.dispose();
    });
  });

  group('a11y', () {
    testWidgets('host keys carry the hold hint, plain keys do not', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(_wrap(hochArea, <CalcToken>[]));

      final host = tester.getSemantics(find.bySemanticsLabel('minus'));
      expect(host.hint, 'Hold for more functions');

      final plain = tester.getSemantics(find.bySemanticsLabel('plus'));
      expect(plain.hint, isEmpty);
      handle.dispose();
    });
  });

  group('Set 10 after the Doz/Dez removal', () {
    testWidgets('overlay shows EXP but no Doz/Dez keys', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        _wrap(hochArea, <CalcToken>[], overlayOpen: true),
      );

      expect(find.bySemanticsLabel('Scientific notation'), findsOneWidget);
      expect(find.bySemanticsLabel('dozenal mode'), findsNothing);
      expect(find.bySemanticsLabel('decimal mode'), findsNothing);
      handle.dispose();
    });
  });
}
