// Parity safety net between the two living implementations of the calculator's
// arithmetic core: the Flutter f64 evaluator (`evalF64` in lib/logic/expression.dart)
// and the watchOS Swift evaluator (Calculator.evaluate in watch/Sources/Calculator.swift).
//
// Both sides replay the SAME fixture file (test/fixtures/watch_parity_fixtures.json,
// referenced as a resource by the watch test target). This Dart half proves the
// fixtures' expected values against the Flutter evaluator; watch/Tests/
// CalculatorParityTests.swift proves them against the Swift evaluator. If the two
// ports ever drift on the shared operator core (+ − × ÷ ^ ( ), unary minus), one
// of the two suites breaks.
//
// Scope is the INTERSECTION of both evaluators only — deliberately excludes what
// the watch cannot do (trig, hyperbolics, factorial, abs, recip, mod, constants,
// the ⊕ custom op, implicit multiplication, the exact Rational track) and the one
// false friend `log` (watch = unary log10; Flutter = binary arbitrary-base). Roots
// are exercised through the `^(1/n)` form both reduce to, not the `√` glyph.
//
// Inputs are written in BASE 12 (the calculator's native tongue) with ASCII
// operators. The watch parses base 12 directly; here we convert each base-12
// literal to its decimal value via the (already round-trip-tested) parseBaseNum
// before handing the expression to evalF64, which parses base 10.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/base_num.dart';
import 'package:dozenal_calc_flutter/logic/expression.dart';
import 'package:dozenal_calc_flutter/tokens.dart' show AngleMode;

/// Rewrite every maximal base-12 number literal in [expr] to its decimal value,
/// leaving operators and parentheses untouched, so the base-10 [evalF64] sees
/// the same magnitudes the watch's base-12 parser would.
String litsToBase10(String expr) => expr.replaceAllMapped(
      RegExp(r'[0-9AaBb.]+'),
      (m) => parseBaseNum(m.group(0)!, 12).toString(),
    );

void main() {
  test('Flutter evaluator matches the shared watch-parity fixtures', () {
    final raw = File('test/fixtures/watch_parity_fixtures.json').readAsStringSync();
    final fixtures = (json.decode(raw) as List).cast<Map<String, dynamic>>();
    expect(fixtures, isNotEmpty, reason: 'fixture file is empty');

    for (final fx in fixtures) {
      final expr = fx['expr'] as String;
      final expected = (fx['expect'] as num).toDouble();
      final v = evalF64(litsToBase10(expr), AngleMode.rad);
      expect(v, isNotNull, reason: 'evalF64 returned null for "$expr"');
      expect(
        (v! - expected).abs(),
        lessThan(1e-9),
        reason: 'parity drift on "$expr": evalF64 gave $v, fixture expects $expected',
      );
    }
  });
}
