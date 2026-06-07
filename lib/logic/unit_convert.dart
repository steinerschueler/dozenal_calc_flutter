// Conversion logic for the unit converter. Pure Dart, no Flutter imports.
// Design: docs/unit-converter.md §5 (SI hub), §6 (ladders), §9 (bracket rule).

import 'dart:math' as math;

import 'unit_data.dart';

/// Convert a [value] expressed in [from] into [to]. Both must belong to the
/// same category (route through that category's shared base value).
double convert(double value, Unit from, Unit to) =>
    to.fromBase(from.toBase(value));

/// Step to the next unit in [unit]'s visible ladder (the [world] currently
/// shown), wrapping at the end. Drives the `=` key: pressing `=` walks the
/// same physical quantity through the ladder. Returns [unit] unchanged if it
/// is not part of the ladder.
Unit nextInLadder(UnitCategory category, UnitWorld world, Unit unit) {
  final ladder = kUnitCatalogue[category]!.ladderFor(world);
  final i = ladder.indexWhere((u) => u.symbol == unit.symbol);
  if (i < 0) return unit;
  return ladder[(i + 1) % ladder.length];
}

/// The unit shown inside the `{ }` bracket for [unit] — the same quantity in
/// the *other* world.
///
/// Most categories use the magnitude-nearest unit of the other world (smallest
/// `|ln(factor) − ln(factor_shown)|`). Five categories are special:
///   - temp:  °F/°R ↔ °C   and   °C/K ↔ °F   (affine, fixed pair)
///   - price: £sd ↔ £dec                     (fixed pair)
///   - count: any ↔ the other world's base    (shows the plain total)
///   - time:  no cross-world partner          (returns null; UI does a
///            digit-base swap instead)
Unit? bracketPartner(UnitCategory category, Unit unit) {
  final def = kUnitCatalogue[category]!;
  final other = unit.world == UnitWorld.imperial
      ? UnitWorld.metric
      : UnitWorld.imperial;

  switch (category) {
    case UnitCategory.time:
      return null;
    case UnitCategory.temp:
      return def.unitBySymbol(
          unit.world == UnitWorld.imperial ? '°C' : '°F');
    case UnitCategory.price:
      return def.unitBySymbol(
          unit.world == UnitWorld.imperial ? '£dec' : '£');
    case UnitCategory.count:
      // Plain total: the other world's base unit (factor 1).
      return _baseUnitOf(def, other);
    default:
      return _nearestByMagnitude(def, other, unit);
  }
}

/// The value shown inside the `{ }` bracket, or null when the category has no
/// cross-world bracket (time).
double? bracketValue(UnitCategory category, Unit unit, double value) {
  final partner = bracketPartner(category, unit);
  if (partner == null) return null;
  return convert(value, unit, partner);
}

/// Greedy mixed-radix breakdown of [totalSi] into the category's imperial
/// cascade: the highest whole number of each magnitude, largest first, the
/// remainder cascading down. The smallest unit carries any fractional rest so
/// the sum stays exact. Returns empty parts for categories without a cascade.
/// Imperial-world only (the metric world uses plain decimals).
({bool negative, List<(Unit unit, double value)> parts}) breakdown(
    UnitCategory category, double totalSi) {
  final def = kUnitCatalogue[category]!;
  if (!def.hasBreakdown) return (negative: false, parts: const []);
  final units = def.breakdownUnits();
  final negative = totalSi < 0;
  var remaining = totalSi.abs();
  final parts = <(Unit, double)>[];
  for (var i = 0; i < units.length; i++) {
    final u = units[i];
    final si = u.a; // linear cascade: SI per 1 unit (b == 0, not inverse)
    if (i == units.length - 1) {
      parts.add((u, remaining / si));
    } else {
      final whole = (remaining / si).floorToDouble();
      parts.add((u, whole));
      remaining -= whole * si;
    }
  }
  return (negative: negative, parts: parts);
}

Unit _baseUnitOf(CategoryDef def, UnitWorld world) {
  for (final u in def.units) {
    if (u.world == world && !u.inverse && u.a == 1 && u.b == 0) return u;
  }
  // Fallback: first unit of that world.
  return def.units.firstWhere((u) => u.world == world);
}

Unit _nearestByMagnitude(CategoryDef def, UnitWorld other, Unit unit) {
  final candidates = def.units.where((u) => u.world == other).toList();
  final target = math.log(unit.a.abs());
  Unit best = candidates.first;
  var bestDist = double.infinity;
  for (final u in candidates) {
    final d = (math.log(u.a.abs()) - target).abs();
    if (d < bestDist) {
      bestDist = d;
      best = u;
    }
  }
  return best;
}
