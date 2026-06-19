// Pure data + types for the asset converter (the third calculator mode:
// precious metals & currencies). No Flutter imports — shared by the asset
// state, keypad and tests. Full design + roadmap: docs/asset-converter.md.
//
// THREE hierarchies (vs. the unit converter's two):
//   Klasse (AssetClass)  →  Gattung (AssetGenus)  →  Einheit (Unit)
//   e.g. Edelmetall      →  Gold                  →  troy oz / g / kg
//
// v1 scope = EXACT conversions only (no prices/rates — those are Phase 2):
//   - metal: a single troy/avoirdupois weight ladder, shared by every metal
//     genus. The genus (which metal) is mathematically inert for pure weight
//     (a troy ounce of gold weighs the same as a troy ounce of silver); it
//     becomes meaningful only when a spot price attaches in Phase 2.
//   - currency: each currency genus carries its own exact denomination ladder
//     (£ = 20 sh = 240 d, $ = 100 ¢). Cross-currency conversion needs rates
//     and stays out until Phase 2 — so currency genera never share a base.
//
// Reuses [Unit] / [UnitWorld] from unit_data.dart: for v1 every factor is
// "Tier 1" — an exact definitional multiple of a shared base, the very model
// `Unit.toBase`/`fromBase` already implements. (Tier 2, the density/energy-
// dependent commodity conversions that must carry a "≈" suffix, arrives with
// the commodity class in a later phase and will extend this file then.)

import 'unit_data.dart';

const UnitWorld _imp = UnitWorld.imperial;
const UnitWorld _met = UnitWorld.metric;

/// Top hierarchy level. `crypto` and `commodity` follow in a later phase.
enum AssetClass { metal, currency }

/// One genus (Gattung) inside a class: a localization key, its class, the
/// units that hang under it, and the two structural flags mirrored from
/// [CategoryDef]. For metals every genus points at the *same* [units] list;
/// for currencies each has its own.
class AssetGenus {
  /// English key used as the l10n lookup key (and the keypad fallback label).
  final String key;

  final AssetClass assetClass;

  /// All units of this genus, both worlds interleaved (filter with [ladderFor]).
  final List<Unit> units;

  /// Imperial breakdown cascade — symbols largest → smallest (e.g. troy
  /// lb/oz/dwt/grain, or £/sh/d). Empty = plain decimals only. Each symbol
  /// must exist in [units] and the factors must be strictly descending.
  final List<String> breakdown;

  /// Single-system genus: the same ladder serves both met/imp worlds and the
  /// met/imp keys are inert. True for every currency (money has no metric vs
  /// imperial axis) and reserved for future single-world metal cases.
  final bool singleWorld;

  const AssetGenus({
    required this.key,
    required this.assetClass,
    required this.units,
    this.breakdown = const [],
    this.singleWorld = false,
  });

  bool get hasBreakdown => breakdown.isNotEmpty;

  /// Units visible in [world]. Single-world genera return the full list.
  List<Unit> ladderFor(UnitWorld world) =>
      singleWorld ? units : units.where((u) => u.world == world).toList();

  Unit? unitBySymbol(String symbol) {
    for (final u in units) {
      if (u.symbol == symbol) return u;
    }
    return null;
  }

  /// The breakdown cascade resolved to [Unit]s (largest → smallest).
  List<Unit> breakdownUnits() => [for (final s in breakdown) unitBySymbol(s)!];
}

// ── Precious-metal weight ladder ──────────────────────────────────────────
//
// One shared ladder for all four metals (gold/silver/platinum/palladium):
// pure weight is metal-independent. base = kilogram (matching the unit
// converter's `weight` category so the numbers line up). Every factor is an
// EXACT integer multiple of the grain (1 gr = 0.06479891 g, fixed by the 1959
// international yard-and-pound agreement). The dozenal hook is genuine and
// definitional: 12 troy oz = 1 troy lb, and 1 dwt = 24 grains = 2 dozen grains.
//
//   trap (surfaced in the long-press note): troy oz (31.1034768 g) is 9.71 %
//   HEAVIER than the avoirdupois oz (28.349523125 g), yet the troy POUND
//   (373.2417216 g) is LIGHTER than the avoirdupois pound (453.59237 g),
//   because the troy pound has only 12 ounces instead of 16.
const List<Unit> _metalUnits = [
  Unit('gr', _imp, 0.00006479891), // grain = 0.06479891 g exactly
  Unit('dwt', _imp, 0.00155517384), // pennyweight = 24 grains
  Unit('oz', _imp, 0.028349523125), // avoirdupois ounce = 437.5 grains
  Unit('oz t', _imp, 0.0311034768), // troy ounce = 480 grains
  Unit('lb t', _imp, 0.3732417216), // troy pound = 12 troy oz = 5760 grains
  Unit('lb', _imp, 0.45359237), // avoirdupois pound = 7000 grains
  Unit('g', _met, 0.001),
  Unit('kg', _met, 1),
];

const List<String> _troyBreakdown = ['lb t', 'oz t', 'dwt', 'gr'];

AssetGenus _metal(String key) => AssetGenus(
      key: key,
      assetClass: AssetClass.metal,
      units: _metalUnits,
      breakdown: _troyBreakdown,
    );

// ── Currency denomination ladders (exact, single-world) ───────────────────
//
// v1 = denominations only; cross-currency conversion is inert until the Phase-2
// rate layer lands. base = the major unit (factor 1). Symbols are kept ASCII /
// Latin-1 so the monospace display never tofus; localization names the genus,
// the symbols stay international (same convention as the unit converter). The
// curated set is the BIS top-traded majors that have clean ASCII symbols; the
// star is GBP with its historical £sd (12 d = 1 sh, 240 d = 1 £ — natively
// dozenal, same structure the unit converter's `price` category already ships).

const List<AssetGenus> _currencies = [
  AssetGenus(
    key: 'usd',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('\$', _imp, 1), Unit('¢', _imp, 0.01)], // $ , ¢
    breakdown: ['\$', '¢'],
  ),
  AssetGenus(
    key: 'eur',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('€', _imp, 1), Unit('ct', _imp, 0.01)], // € , ct
    breakdown: ['€', 'ct'],
  ),
  AssetGenus(
    key: 'gbp',
    assetClass: AssetClass.currency,
    singleWorld: true,
    // £sd (historical) plus the decimal penny. base = pound.
    units: [
      Unit('£', _imp, 1), // £
      Unit('sh', _imp, 1 / 20), // shilling
      Unit('d', _imp, 1 / 240), // (old) penny
      Unit('p', _imp, 0.01), // decimal penny
    ],
    breakdown: ['£', 'sh', 'd'],
  ),
  AssetGenus(
    key: 'jpy',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('¥', _imp, 1)], // ¥ — no subunit in practice
  ),
  AssetGenus(
    key: 'chf',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('Fr', _imp, 1), Unit('Rp', _imp, 0.01)],
    breakdown: ['Fr', 'Rp'],
  ),
  AssetGenus(
    key: 'cad',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('C\$', _imp, 1), Unit('¢', _imp, 0.01)],
    breakdown: ['C\$', '¢'],
  ),
  AssetGenus(
    key: 'aud',
    assetClass: AssetClass.currency,
    singleWorld: true,
    units: [Unit('A\$', _imp, 1), Unit('¢', _imp, 0.01)],
    breakdown: ['A\$', '¢'],
  ),
];

/// The full asset catalogue: each class maps to its ordered list of genera.
/// Metal genera all share [_metalUnits]; currency genera carry their own.
/// (Currency is capped at seven so a class + its genera fit the keypad's
/// eight-cell drill area — see asset_keypad.dart.)
final Map<AssetClass, List<AssetGenus>> kAssetCatalogue = {
  AssetClass.metal: [
    _metal('gold'),
    _metal('silver'),
    _metal('platinum'),
    _metal('palladium'),
  ],
  AssetClass.currency: _currencies,
};

/// Genera of [c] (the keypad's genus tiles).
List<AssetGenus> generaOf(AssetClass c) => kAssetCatalogue[c] ?? const [];
