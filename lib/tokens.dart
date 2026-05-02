// Port of src/tokens.rs.
// One-to-one with the Rust CalcToken enum, AngleMode, and InfoState. The
// DozenalCalcApp struct is intentionally not ported here — see PORTING.md
// step 9 (state-management lands as DozenalCalcState extends ChangeNotifier).
//
// Rust enums with mixed payloads are ported as sealed Dart classes so
// downstream code can use exhaustive `switch` pattern matching, mirroring
// Rust `match`. Payload-free variants are const-singleton subclasses.

import 'logic/dozenal_digit.dart';
import 'logic/rational.dart';

// ---------------------------------------------------------------------------
// CalcToken
// ---------------------------------------------------------------------------

sealed class CalcToken {
  const CalcToken();
}

// --- Main keypad ---

final class Digit extends CalcToken {
  final DozenalDigit value;
  const Digit(this.value);

  @override
  bool operator ==(Object other) => other is Digit && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

final class Add extends CalcToken {
  const Add();
}

final class Sub extends CalcToken {
  const Sub();
}

final class Mul extends CalcToken {
  const Mul();
}

final class Div extends CalcToken {
  const Div();
}

final class ExpTopRight extends CalcToken {
  const ExpTopRight();
}

final class RootTopLeft extends CalcToken {
  const RootTopLeft();
}

final class OplusBotLeft extends CalcToken {
  const OplusBotLeft();
}

final class LogBotRight extends CalcToken {
  const LogBotRight();
}

final class Sin extends CalcToken {
  const Sin();
}

final class Cos extends CalcToken {
  const Cos();
}

final class Tan extends CalcToken {
  const Tan();
}

final class Cot extends CalcToken {
  const Cot();
}

final class ArcSin extends CalcToken {
  const ArcSin();
}

final class ArcCos extends CalcToken {
  const ArcCos();
}

final class ArcTan extends CalcToken {
  const ArcTan();
}

final class ArcCot extends CalcToken {
  const ArcCot();
}

final class ParenOpen extends CalcToken {
  const ParenOpen();
}

final class ParenClose extends CalcToken {
  const ParenClose();
}

final class TriangleRight extends CalcToken {
  const TriangleRight();
}

final class TriangleLeft extends CalcToken {
  const TriangleLeft();
}

final class Ac extends CalcToken {
  const Ac();
}

final class Del extends CalcToken {
  const Del();
}

final class Decimal extends CalcToken {
  const Decimal();
}

final class Equals extends CalcToken {
  const Equals();
}

final class Expand extends CalcToken {
  const Expand();
}

/// Unary minus in result_buffer; distinct from Sub (binary) to survive
/// re-insertion.
final class Negate extends CalcToken {
  const Negate();
}

/// Exact rational literal inserted by Ans / RCL. Carries the value through
/// the pipeline so periodicity survives a STO→RCL or Ans re-use roundtrip
/// without precision loss.
final class RatLit extends CalcToken {
  final Rational value;
  const RatLit(this.value);

  @override
  bool operator ==(Object other) => other is RatLit && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

// --- Overlay Set 6 — Memory ---

final class Sto extends CalcToken {
  const Sto();
}

final class Rcl extends CalcToken {
  const Rcl();
}

final class Mc extends CalcToken {
  const Mc();
}

final class Ans extends CalcToken {
  const Ans();
}

// --- Overlay Set 7 — Constants ---

final class ConstPi extends CalcToken {
  const ConstPi();
}

final class ConstE extends CalcToken {
  const ConstE();
}

final class ConstPhi extends CalcToken {
  const ConstPhi();
}

final class ConstSqrt2 extends CalcToken {
  const ConstSqrt2();
}

// --- Overlay Set 8 — Hyperbolic ---

final class Sinh extends CalcToken {
  const Sinh();
}

final class Cosh extends CalcToken {
  const Cosh();
}

final class Tanh extends CalcToken {
  const Tanh();
}

final class Coth extends CalcToken {
  const Coth();
}

final class ArSinh extends CalcToken {
  const ArSinh();
}

final class ArCosh extends CalcToken {
  const ArCosh();
}

final class ArTanh extends CalcToken {
  const ArTanh();
}

final class ArCoth extends CalcToken {
  const ArCoth();
}

// --- Overlay Set 9 — Extended ---

final class Factorial extends CalcToken {
  const Factorial();
}

final class AbsVal extends CalcToken {
  const AbsVal();
}

final class Reciprocal extends CalcToken {
  const Reciprocal();
}

final class Mod extends CalcToken {
  const Mod();
}

// --- Overlay Set 10 — Modes & Meta ---

final class DozDec extends CalcToken {
  const DozDec();
}

final class Drg extends CalcToken {
  const Drg();
}

final class Info extends CalcToken {
  const Info();
}

final class Close extends CalcToken {
  const Close();
}

// ---------------------------------------------------------------------------
// AngleMode
// ---------------------------------------------------------------------------

enum AngleMode {
  deg,
  rad,
  grad;

  String get label => switch (this) {
        AngleMode.deg => 'DEG',
        AngleMode.rad => 'RAD',
        AngleMode.grad => 'GRD',
      };

  AngleMode get next => switch (this) {
        AngleMode.deg => AngleMode.rad,
        AngleMode.rad => AngleMode.grad,
        AngleMode.grad => AngleMode.deg,
      };

  /// Converts an angle from this mode to radians.
  double toRad(double x) => switch (this) {
        AngleMode.deg => x * 3.141592653589793 / 180.0,
        AngleMode.rad => x,
        AngleMode.grad => x * 3.141592653589793 / 200.0,
      };

  /// Converts a result in radians to this mode's unit (for inverse trig).
  double radToUnit(double x) => switch (this) {
        AngleMode.deg => x * 180.0 / 3.141592653589793,
        AngleMode.rad => x,
        AngleMode.grad => x * 200.0 / 3.141592653589793,
      };
}

// ---------------------------------------------------------------------------
// InfoState
// ---------------------------------------------------------------------------

sealed class InfoState {
  const InfoState();
}

final class InfoClosed extends InfoState {
  const InfoClosed();
}

final class InfoList extends InfoState {
  const InfoList();
}

final class InfoChapter extends InfoState {
  final int index;
  const InfoChapter(this.index);

  @override
  bool operator ==(Object other) =>
      other is InfoChapter && other.index == index;

  @override
  int get hashCode => index.hashCode;
}
