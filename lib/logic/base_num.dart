// Parse/format a plain number string in an arbitrary base (10 or 12) for the
// unit converter. Pure Dart, no Flutter imports. Digits 0-9 then A, B for
// 10/11; one optional '.', one optional leading '-'.
//
// The main calculator uses the richer Rational/DozenalConverter pipeline; the
// converter only ever handles a single f64 magnitude, so these lightweight
// helpers are enough (and round-trip-tested).

import 'dart:math' as math;

int? _charValue(String c) {
  final u = c.toUpperCase();
  final code = u.codeUnitAt(0);
  if (code >= 0x30 && code <= 0x39) return code - 0x30; // 0-9
  if (u == 'A') return 10;
  if (u == 'B') return 11;
  return null;
}

String _valueChar(int v) {
  if (v < 10) return String.fromCharCode(0x30 + v);
  return v == 10 ? 'A' : 'B';
}

/// Parse [s] as a base-[base] number to a double. Empty / lone '.' / lone '-'
/// yield 0. Invalid digits are skipped.
double parseBaseNum(String s, int base) {
  if (s.isEmpty) return 0;
  var i = 0;
  var neg = false;
  if (s[0] == '-') {
    neg = true;
    i = 1;
  }
  var intPart = 0.0;
  var frac = 0.0;
  var scale = 1.0;
  var afterDot = false;
  for (; i < s.length; i++) {
    final c = s[i];
    if (c == '.') {
      afterDot = true;
      continue;
    }
    final d = _charValue(c);
    if (d == null || d >= base) continue;
    if (!afterDot) {
      intPart = intPart * base + d;
    } else {
      scale /= base;
      frac += d * scale;
    }
  }
  final v = intPart + frac;
  return neg ? -v : v;
}

/// Operators allowed inside a pending scalar entry (see [parseScalarEntry]).
/// Binary conventions mirror the main calculator: the LEFT operand is the
/// root degree (`2√9` = 3) resp. the logarithm base (`2㏒8` = 3); ⊕ is the
/// parallel sum a·b/(a+b). All single code points so the caret/Del model
/// stays one-keypress-one-char ('㏒' = U+33D2, the square-log glyph).
const String kScalarTimes = '×';
const String kScalarDivide = '÷';
const String kScalarParallel = '⊕';
const String kScalarPower = '^';
const String kScalarRoot = '√';
const String kScalarLog = '㏒';

bool isScalarOpChar(String c) =>
    c == kScalarTimes ||
    c == kScalarDivide ||
    c == kScalarParallel ||
    c == kScalarPower ||
    c == kScalarRoot ||
    c == kScalarLog;

/// Split a pending scalar entry ("3×2÷4") into its number segments and the
/// operators between them. The leading minus of a collapsed negative total
/// stays glued to the first segment (we only split on × and ÷).
(List<String>, List<String>) splitScalarEntry(String s) {
  final segments = <String>[];
  final ops = <String>[];
  final sb = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    final c = s[i];
    if (isScalarOpChar(c)) {
      segments.add(sb.toString());
      sb.clear();
      ops.add(c);
    } else {
      sb.write(c);
    }
  }
  segments.add(sb.toString());
  return (segments, ops);
}

/// Evaluate a pending scalar entry: base-[base] numbers joined by scalar
/// operators, folded strictly left to right (a running entry, not an
/// expression language — no precedence). A trailing or doubled operator
/// contributes nothing ("3×" → 3); an empty entry yields 0; ÷0, 0⊕0 and
/// friends yield ∞/NaN like plain double math (callers display via
/// formatBaseNum's pass-through).
double parseScalarEntry(String s, int base) {
  final (segments, ops) = splitScalarEntry(s);
  var result = parseBaseNum(segments.first, base);
  for (var i = 0; i < ops.length; i++) {
    final seg = segments[i + 1];
    if (seg.isEmpty) continue; // trailing/dangling operator: ignore
    final v = parseBaseNum(seg, base);
    result = switch (ops[i]) {
      kScalarTimes => result * v,
      kScalarDivide => result / v,
      kScalarParallel => result * v / (result + v),
      kScalarPower => math.pow(result, v).toDouble(),
      // Left operand is the degree: 2√9 = 9^(1/2) = 3.
      kScalarRoot => math.pow(v, 1 / result).toDouble(),
      // Left operand is the base: 2㏒8 = ln8/ln2 = 3.
      kScalarLog => math.log(v) / math.log(result),
      _ => result,
    };
  }
  return result;
}

/// Re-render every number of a scalar entry from [from]-base into [to]-base,
/// keeping the operators in place ("13×2" → "15×2"). Value-preserving per
/// segment; empty segments (dangling operator) stay empty.
String reformatScalarEntry(String s, int from, int to) {
  final (segments, ops) = splitScalarEntry(s);
  final sb = StringBuffer();
  for (var i = 0; i < segments.length; i++) {
    if (i > 0) sb.write(ops[i - 1]);
    if (segments[i].isNotEmpty) {
      sb.write(formatBaseNum(parseBaseNum(segments[i], from), to));
    }
  }
  return sb.toString();
}

/// Format [value] in base-[base] with up to [fracDigits] fractional places,
/// trailing zeros trimmed. NaN/∞ pass through as text.
String formatBaseNum(double value, int base, {int fracDigits = 6}) {
  if (value.isNaN) return 'NaN';
  if (value.isInfinite) return value < 0 ? '-∞' : '∞';

  // Snap f64 noise onto adjacent integers before splitting into digits —
  // the SI round trip (unit.toBase → fromBase) lands a hair off whole
  // numbers (e.g. 14 ft → 13.999999999999998), which would otherwise render
  // as 11.BBBBBB instead of 12. Mirrors formatF64Result's snap; the 1e-9
  // threshold matches the fraction cutoff below.
  final snapped = (value - value.roundToDouble()).abs() < 1e-9
      ? value.roundToDouble()
      : value;

  final neg = snapped < 0;
  var v = snapped.abs();
  var intPart = v.floorToDouble();
  var frac = v - intPart;

  final sb = StringBuffer();

  // Integer part.
  if (intPart < 1) {
    sb.write('0');
  } else {
    final digits = <int>[];
    var ip = intPart;
    while (ip >= 1) {
      digits.add((ip % base).floor());
      ip = (ip / base).floorToDouble();
    }
    for (final d in digits.reversed) {
      sb.write(_valueChar(d));
    }
  }

  // Fractional part.
  if (frac > 1e-9 && fracDigits > 0) {
    final fb = StringBuffer();
    var f = frac;
    for (var k = 0; k < fracDigits; k++) {
      f *= base;
      var d = f.floor();
      if (d >= base) d = base - 1;
      if (d < 0) d = 0;
      fb.write(_valueChar(d));
      f -= d;
      if (f < 1e-9) break;
    }
    var fs = fb.toString().replaceAll(RegExp(r'0+$'), '');
    if (fs.isNotEmpty) {
      sb.write('.');
      sb.write(fs);
    }
  }

  return neg ? '-${sb.toString()}' : sb.toString();
}
