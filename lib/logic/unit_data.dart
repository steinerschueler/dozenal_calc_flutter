// Pure data + types for the unit converter (the second calculator mode).
// No Flutter imports — shared by the converter state, keypad and tests.
// Full design rationale: docs/unit-converter.md
//
// Two "worlds", toggled by Doz/Dez:
//   - imperial (Doz world): imperial/dozenal units, base-12 digits
//   - metric   (Dez world): metric/SI units, base-10 digits
// Every category stores both ladders; conversions route through a single
// per-category base value (usually the SI base). The { } bracket shows the
// same quantity in the *other* world.

/// Which world a unit belongs to. Doz world = imperial; Dez world = metric.
enum UnitWorld { imperial, metric }

/// The 16 conversion categories. Order matches the keypad layout
/// (Set 3/4 in the main view, Set 8/9 in the overlay).
enum UnitCategory {
  count, dist, area, space, // Set 3
  weight, time, angle, price, // Set 4
  temp, press, force, work, // Set 8
  power, cook, liquid, moment, // Set 9
}

/// One unit on a category's ladder. Relationship to the category base value:
///
///   linear:  base = a * value          value = base / a
///   affine:  base = a * value + b       value = (base - b) / a   (temperature)
///   inverse: base = a / value           value = a / base    (reciprocal scales)
///
/// `a` is the factor to the category base (SI for most categories). `world`
/// decides whether the unit shows in the Doz (imperial) or Dez (metric) ladder.
class Unit {
  final String symbol;
  final UnitWorld world;
  final double a;
  final double b;
  final bool inverse;

  const Unit(
    this.symbol,
    this.world,
    this.a, {
    this.b = 0,
    this.inverse = false,
  });

  double toBase(double v) => inverse ? a / v : a * v + b;
  double fromBase(double base) => inverse ? a / base : (base - b) / a;
}

/// A category definition: its ordered units (both worlds interleaved) plus
/// flags for the two structural specialities.
class CategoryDef {
  final UnitCategory category;

  /// English key used as the keypad label and the l10n lookup key.
  final String label;

  /// All units, both worlds. Filter with [ladderFor].
  final List<Unit> units;

  /// `time` is single-system: the same ladder serves both worlds and the
  /// bracket is a digit-base swap rather than a unit conversion.
  final bool singleWorld;

  /// Imperial breakdown cascade — unit symbols, largest → smallest. Empty means
  /// no breakdown. Only used in the imperial (Doz) world; the metric world uses
  /// plain decimals. Each symbol must exist in [units] and the factors must be
  /// strictly descending.
  final List<String> breakdown;

  /// Affine category (temperature): values cannot be summed, so it stays
  /// single-term (each magnitude tap replaces the term) and has no breakdown.
  final bool affine;

  const CategoryDef({
    required this.category,
    required this.label,
    required this.units,
    this.singleWorld = false,
    this.breakdown = const [],
    this.affine = false,
  });

  bool get hasBreakdown => breakdown.isNotEmpty;

  /// The breakdown cascade resolved to [Unit]s (largest → smallest).
  List<Unit> breakdownUnits() =>
      [for (final s in breakdown) unitBySymbol(s)!];

  /// Units visible in [world]. For [singleWorld] categories the full list is
  /// returned regardless.
  List<Unit> ladderFor(UnitWorld world) =>
      singleWorld ? units : units.where((u) => u.world == world).toList();

  Unit? unitBySymbol(String symbol) {
    for (final u in units) {
      if (u.symbol == symbol) return u;
    }
    return null;
  }
}

const UnitWorld _imp = UnitWorld.imperial;
const UnitWorld _met = UnitWorld.metric;

/// The full catalogue. Factors are verified in test/unit_convert_test.dart.
const Map<UnitCategory, CategoryDef> kUnitCatalogue = {
  // ── Set 3 ────────────────────────────────────────────────────────────────
  UnitCategory.count: CategoryDef(
    category: UnitCategory.count,
    label: 'count',
    units: [
      Unit('items', _imp, 1),
      Unit('dz', _imp, 12),
      Unit('gr', _imp, 144),
      Unit('ggr', _imp, 1728),
      Unit('ones', _met, 1),
      Unit('ten', _met, 10),
      Unit('hundred', _met, 100),
      Unit('thousand', _met, 1000),
    ],
    breakdown: ['ggr', 'gr', 'dz', 'items'],
  ),
  UnitCategory.dist: CategoryDef(
    category: UnitCategory.dist,
    label: 'dist',
    units: [
      Unit('in', _imp, 0.0254),
      Unit('ft', _imp, 0.3048),
      Unit('yd', _imp, 0.9144),
      Unit('mi', _imp, 1609.344),
      Unit('fathom', _imp, 1.8288),
      Unit('nmi', _imp, 1852),
      Unit('league', _imp, 4828.032),
      Unit('mm', _met, 0.001),
      Unit('cm', _met, 0.01),
      Unit('m', _met, 1),
      Unit('km', _met, 1000),
    ],
    breakdown: ['mi', 'yd', 'ft', 'in'],
  ),
  UnitCategory.area: CategoryDef(
    category: UnitCategory.area,
    label: 'area',
    units: [
      Unit('sq in', _imp, 0.00064516),
      Unit('sq ft', _imp, 0.09290304),
      Unit('sq yd', _imp, 0.83612736),
      Unit('acre', _imp, 4046.8564224),
      Unit('sq mi', _imp, 2589988.110336),
      Unit('cm²', _met, 0.0001),
      Unit('m²', _met, 1),
      Unit('ha', _met, 10000),
      Unit('km²', _met, 1000000),
    ],
    breakdown: ['sq mi', 'acre', 'sq yd', 'sq ft', 'sq in'],
  ),
  UnitCategory.space: CategoryDef(
    category: UnitCategory.space,
    label: 'space',
    units: [
      // base = litre. Geometric (cubic) volume; fluid measures live in liquid.
      Unit('cu in', _imp, 0.016387064),
      Unit('cu ft', _imp, 28.316846592),
      Unit('cu yd', _imp, 764.554857984),
      Unit('cm³', _met, 0.001),
      Unit('m³', _met, 1000),
    ],
    breakdown: ['cu yd', 'cu ft', 'cu in'],
  ),
  // ── Set 4 ────────────────────────────────────────────────────────────────
  UnitCategory.weight: CategoryDef(
    category: UnitCategory.weight,
    label: 'weight',
    units: [
      // base = kilogram. US (short) cwt/ton; troy ounce for precious metals.
      Unit('oz', _imp, 0.028349523125),
      Unit('lb', _imp, 0.45359237),
      Unit('st', _imp, 6.35029318),
      Unit('cwt', _imp, 45.359237),
      Unit('ton', _imp, 907.18474),
      Unit('oz t', _imp, 0.0311034768),
      Unit('g', _met, 0.001),
      Unit('kg', _met, 1),
      Unit('t', _met, 1000),
    ],
    breakdown: ['ton', 'cwt', 'st', 'lb', 'oz'],
  ),
  UnitCategory.time: CategoryDef(
    category: UnitCategory.time,
    label: 'time',
    singleWorld: true,
    units: [
      Unit('s', _met, 1),
      Unit('min', _met, 60),
      Unit('h', _met, 3600),
      Unit('d', _met, 86400),
      Unit('week', _met, 604800),
    ],
    breakdown: ['week', 'd', 'h', 'min', 's'],
  ),
  UnitCategory.angle: CategoryDef(
    category: UnitCategory.angle,
    label: 'angle',
    units: [
      // base = radian.
      Unit('°', _imp, 0.017453292519943295), // pi/180
      Unit('′', _imp, 0.0002908882086657216), // pi/10800
      Unit('″', _imp, 4.84813681109536e-6), // pi/648000
      Unit('sign', _imp, 0.5235987755982988), // pi/6 (30°)
      Unit('turn', _imp, 6.283185307179586), // 2*pi
      Unit('gon', _met, 0.015707963267948967), // pi/200
      Unit('rad', _met, 1),
    ],
    breakdown: ['°', '′', '″'],
  ),
  UnitCategory.price: CategoryDef(
    category: UnitCategory.price,
    label: 'price',
    units: [
      // base = pound (£) as a pure value. £sd ↔ decimal.
      Unit('d', _imp, 1 / 240),
      Unit('sh', _imp, 1 / 20),
      Unit('£', _imp, 1),
      Unit('guinea', _imp, 21 / 20),
      Unit('p', _met, 0.01),
      Unit('£dec', _met, 1),
    ],
    breakdown: ['£', 'sh', 'd'],
  ),
  // ── Set 8 ────────────────────────────────────────────────────────────────
  UnitCategory.temp: CategoryDef(
    category: UnitCategory.temp,
    label: 'temp',
    units: [
      // base = kelvin. Affine.
      Unit('°F', _imp, 5 / 9, b: 459.67 * 5 / 9),
      Unit('°R', _imp, 5 / 9),
      Unit('°C', _met, 1, b: 273.15),
      Unit('K', _met, 1),
    ],
    affine: true,
  ),
  UnitCategory.press: CategoryDef(
    category: UnitCategory.press,
    label: 'press',
    units: [
      // base = pascal.
      Unit('psi', _imp, 6894.757293168361),
      Unit('inHg', _imp, 3386.389),
      Unit('Pa', _met, 1),
      Unit('kPa', _met, 1000),
      Unit('bar', _met, 100000),
      Unit('atm', _met, 101325),
      Unit('mmHg', _met, 133.322387415),
    ],
  ),
  UnitCategory.force: CategoryDef(
    category: UnitCategory.force,
    label: 'force',
    units: [
      // base = newton.
      Unit('lbf', _imp, 4.4482216152605),
      Unit('pdl', _imp, 0.138254954376),
      Unit('N', _met, 1),
      Unit('kN', _met, 1000),
      Unit('kgf', _met, 9.80665),
      Unit('dyn', _met, 1e-5),
    ],
  ),
  UnitCategory.work: CategoryDef(
    category: UnitCategory.work,
    label: 'work',
    units: [
      // base = joule.
      Unit('BTU', _imp, 1055.05585262),
      Unit('ft·lbf', _imp, 1.3558179483314004),
      Unit('J', _met, 1),
      Unit('kJ', _met, 1000),
      Unit('Wh', _met, 3600),
      Unit('kWh', _met, 3600000),
      Unit('cal', _met, 4.184),
      Unit('kcal', _met, 4184),
    ],
  ),
  // ── Set 9 ────────────────────────────────────────────────────────────────
  UnitCategory.power: CategoryDef(
    category: UnitCategory.power,
    label: 'power',
    units: [
      // base = watt.
      Unit('hp', _imp, 745.6998715822702),
      Unit('BTU/h', _imp, 0.29307107017),
      Unit('W', _met, 1),
      Unit('kW', _met, 1000),
      Unit('PS', _met, 735.49875),
    ],
  ),
  UnitCategory.cook: CategoryDef(
    category: UnitCategory.cook,
    label: 'cook',
    units: [
      // base = millilitre. US customary cooking measures.
      Unit('tsp', _imp, 4.92892159375),
      Unit('tbsp', _imp, 14.78676478125),
      Unit('fl oz', _imp, 29.5735295625),
      Unit('cup', _imp, 236.5882365),
      Unit('pint', _imp, 473.176473),
      Unit('mL', _met, 1),
      Unit('L', _met, 1000),
    ],
  ),
  UnitCategory.liquid: CategoryDef(
    category: UnitCategory.liquid,
    label: 'liquid',
    units: [
      // base = litre. US liquid measures (distinct from `space` cubic volume
      // and `cook` recipe measures).
      Unit('fl oz', _imp, 0.0295735296),
      Unit('gill', _imp, 0.11829411825),
      Unit('pint', _imp, 0.473176473),
      Unit('quart', _imp, 0.946352946),
      Unit('gallon', _imp, 3.785411784),
      Unit('mL', _met, 0.001),
      Unit('L', _met, 1),
    ],
    breakdown: ['gallon', 'quart', 'pint', 'gill', 'fl oz'],
  ),
  UnitCategory.moment: CategoryDef(
    category: UnitCategory.moment,
    label: 'moment',
    units: [
      // base = newton-metre.
      Unit('lbf·ft', _imp, 1.3558179483314004),
      Unit('lbf·in', _imp, 0.1129848290276167),
      Unit('N·m', _met, 1),
      Unit('kN·m', _met, 1000),
      Unit('kgf·m', _met, 9.80665),
    ],
  ),
};
