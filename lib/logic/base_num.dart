// Parse/format a plain number string in an arbitrary base (10 or 12) for the
// unit converter. Pure Dart, no Flutter imports. Digits 0-9 then A, B for
// 10/11; one optional '.', one optional leading '-'.
//
// The main calculator uses the richer Rational/DozenalConverter pipeline; the
// converter only ever handles a single f64 magnitude, so these lightweight
// helpers are enough (and round-trip-tested).

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

/// Format [value] in base-[base] with up to [fracDigits] fractional places,
/// trailing zeros trimmed. NaN/∞ pass through as text.
String formatBaseNum(double value, int base, {int fracDigits = 6}) {
  if (value.isNaN) return 'NaN';
  if (value.isInfinite) return value < 0 ? '-∞' : '∞';

  final neg = value < 0;
  var v = value.abs();
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
