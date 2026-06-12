// Pure result-presentation helpers, extracted from DozenalCalcState so they
// can be unit-tested in isolation and to keep the orchestrator focused on
// dispatch + calculation rather than string formatting. No Flutter imports.

import '../tokens.dart';
import 'dozenal_converter.dart';
import 'dozenal_digit.dart';
import 'rational.dart';

/// Fractional-digit budget for the compact cross-base reference strings.
const int _crossFracDigits = 6;

/// A result buffer rendered as a plain 0-9/A/B string: digits, a decimal
/// point, and a leading minus. Period/overline and the ≈/… display markers
/// are dropped — only the shown digits are emitted, matching the screen.
/// Used for the clipboard copy and as the same-representation check that
/// suppresses a redundant cross-base bracket.
String resultBufferToString(List<CalcToken> resultBuffer) {
  final sb = StringBuffer();
  for (final t in resultBuffer) {
    if (t is Digit) {
      sb.write(_digitChar(t.value.value));
    } else if (t is Decimal) {
      sb.write('.');
    } else if (t is Negate) {
      sb.write('-');
    }
  }
  return sb.toString();
}

/// Exact rational → compact base-[base] string (0-9AB). The fractional part is
/// capped at [_crossFracDigits] with a trailing "…" when more digits or a
/// period follow.
String compactRationalString(Rational r, int base) {
  final dec = r.toDozenalPeriodic(base: base);
  final sb = StringBuffer();
  if (r.num.isNegative) sb.write('-');
  sb.write(_digitsToAscii(dec.intDigits));
  if (dec.preDigits.isNotEmpty || dec.period.isNotEmpty) {
    sb.write('.');
    final shown = <DozenalDigit>[];
    for (final d in dec.preDigits) {
      if (shown.length >= _crossFracDigits) break;
      shown.add(d);
    }
    var i = 0;
    while (shown.length < _crossFracDigits && dec.period.isNotEmpty) {
      shown.add(dec.period[i % dec.period.length]);
      i++;
    }
    sb.write(_digitsToAscii(shown));
    if (dec.preDigits.length > _crossFracDigits || dec.period.isNotEmpty) {
      sb.write('…');
    }
  }
  return sb.toString();
}

/// f64 → compact base-[base] string. Always approximate, so a fractional part
/// always ends in "…".
String compactF64String(double v, int base) {
  if (v.isNaN) return 'NaN';
  if (v.isInfinite) return '∞';
  final sb = StringBuffer();
  // Snap near-integer f64 noise (e.g. tan(45°) = 0.9999…) onto the integer so
  // the cross-base reference shows "1", not "0.BBBBBB…". Mirrors the snap in
  // formatF64Result; the signed snap also avoids a "-0" bracket.
  var x = (v - v.roundToDouble()).abs() < fracEpsilon ? v.roundToDouble() : v;
  if (x < 0) {
    sb.write('-');
    x = x.abs();
  }
  sb.write(_digitsToAscii(DozenalConverter.fromDecimal(x, base: base)));
  final frac = x - x.floorToDouble();
  if (frac > fracEpsilon) {
    sb.write('.');
    sb.write(_digitsToAscii(
        DozenalConverter.fracToDigits(frac, _crossFracDigits, base: base)));
    sb.write('…');
  }
  return sb.toString();
}

String _digitsToAscii(List<DozenalDigit> ds) {
  final sb = StringBuffer();
  for (final d in ds) {
    sb.write(_digitChar(d.value));
  }
  return sb.toString();
}

String _digitChar(int v) => v < 10 ? '$v' : (v == 10 ? 'A' : 'B');
