// Conversion logic for the asset converter (metals & currencies). Pure Dart,
// no Flutter imports. Mirrors unit_convert.dart but drills through the genus
// level. Design: docs/asset-converter.md.

import 'dart:math' as math;

import 'asset_data.dart';
import 'unit_convert.dart' show convert;
import 'unit_data.dart';

export 'unit_convert.dart' show convert;

/// Step to the next unit in [unit]'s visible ladder for [genus] in [world],
/// wrapping at the end. Drives the `=` key (walk the quantity through the
/// ladder). Returns [unit] unchanged if it is not on the ladder.
Unit assetNextInLadder(AssetGenus genus, UnitWorld world, Unit unit) {
  final ladder = genus.ladderFor(world);
  final i = ladder.indexWhere((u) => u.symbol == unit.symbol);
  if (i < 0) return unit;
  return ladder[(i + 1) % ladder.length];
}

/// The unit shown in the `{ }` bracket for [unit] — the same quantity in the
/// *other* world (the magnitude-nearest partner). Single-world genera
/// (currencies) have no cross-world partner; the state shows a numeral-base
/// swap instead, so this returns null for them.
Unit? assetBracketPartner(AssetGenus genus, Unit unit) {
  if (genus.singleWorld) return null;
  final other = unit.world == UnitWorld.imperial
      ? UnitWorld.metric
      : UnitWorld.imperial;
  final candidates = genus.units.where((u) => u.world == other).toList();
  if (candidates.isEmpty) return null;
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

/// The value shown in the `{ }` bracket, or null when there is no cross-world
/// partner (single-world genera).
double? assetBracketValue(AssetGenus genus, Unit unit, double value) {
  final partner = assetBracketPartner(genus, unit);
  if (partner == null) return null;
  return convert(value, unit, partner);
}

/// Greedy mixed-radix breakdown of [totalBase] into [genus]'s cascade
/// (largest whole of each magnitude, the remainder cascading down, the
/// smallest unit carrying the fractional rest so the sum stays exact).
/// Empty for genera without a cascade.
({bool negative, List<(Unit unit, double value)> parts}) assetBreakdown(
    AssetGenus genus, double totalBase) {
  if (!genus.hasBreakdown) return (negative: false, parts: const []);
  final units = genus.breakdownUnits();
  final negative = totalBase < 0;
  var remaining = totalBase.abs();
  final parts = <(Unit, double)>[];
  for (var i = 0; i < units.length; i++) {
    final u = units[i];
    final base = u.a; // linear cascade: base value per 1 unit (b == 0)
    if (i == units.length - 1) {
      parts.add((u, remaining / base));
    } else {
      // Nudge by a tiny epsilon before flooring: the kilogram-based troy
      // factors accumulate f64 undershoot, which would otherwise render e.g.
      // "3 dwt" as "2 dwt + ~24 gr". 1e-9 is far below any real digit and
      // matches formatBaseNum's snapping threshold.
      final whole = (remaining / base + 1e-9).floorToDouble();
      parts.add((u, whole));
      remaining -= whole * base;
    }
  }
  return (negative: negative, parts: parts);
}
