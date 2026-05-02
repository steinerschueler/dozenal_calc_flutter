// Port of DozenalDigit from src/logic.rs.
// Pure data layer: no Flutter / UI imports.

enum DozenalDigit {
  d0,
  d1,
  d2,
  d3,
  d4,
  d5,
  d6,
  d7,
  d8,
  d9,
  d10,
  d11;

  /// Numeric value 0..11 (mirrors Rust `to_value`; equivalent to `index`).
  int get value => index;

  /// Builds a digit from a value 0..11. Returns null otherwise.
  /// Mirrors Rust `from_value` returning `Option<Self>`.
  static DozenalDigit? fromValue(int v) {
    if (v < 0 || v >= 12) return null;
    return values[v];
  }
}
