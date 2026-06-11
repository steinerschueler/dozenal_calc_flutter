// Exposes the single DozenalCalcState orchestrator to deep widgets — the
// settings page drives the live numeral system (Doz/Dez) and angle mode
// from outside the calculator scaffold. Lives above the Navigator (wired in
// main.dart), so pushed routes such as InfoListPage → SettingsPage can reach
// the state without constructor threading. Kept out of state.dart on purpose:
// that file is the pure logic port (input.rs/eval.rs) without Flutter-widget
// dependencies beyond ChangeNotifier.

import 'package:flutter/widgets.dart';

import 'state.dart';

class CalcStateScope extends InheritedNotifier<DozenalCalcState> {
  const CalcStateScope({
    super.key,
    required DozenalCalcState super.notifier,
    required super.child,
  });

  /// Subscribing read; null when no scope is present (e.g. widget tests that
  /// pump a page standalone). Callers hide state-bound controls in that case.
  static DozenalCalcState? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CalcStateScope>()?.notifier;
}
