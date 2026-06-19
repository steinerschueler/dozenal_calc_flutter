// The compiled historical price dataset for the Werterechner chart. Pure data,
// no Flutter imports. Source of truth: multi-agent compile + adversarial-verify
// runs (see docs/asset-converter.md). DELIBERATELY COARSE and honestly framed —
// a curated reconstruction, not an authoritative series.
//
// FRAMING (gold-referenced, indexed): the chart shows each series RELATIVE TO
// GOLD, indexed to its OLDEST value (oldest → the "0" baseline line; up = more
// expensive in gold, down = cheaper). One consistent measure per series:
//   - silver = SILVER IN GOLD   (oz gold per oz silver)   = 1 / gold-silver ratio
//   - wheat  = GRAIN IN GOLD    (g gold per litre)        = grain-in-silver ÷ ratio
//   - gold   = GOLD IN GRAIN    (gold's food purchasing power) = reciprocal of wheat
//
// Each antiquity/sparse point carries an uncertainty band (valueLow/High); the
// chart shades it. Honesty rules the chart enforces: reconstructed/sparse points
// are discrete dots, never joined by a line; lines connect only adjacent modern
// points; gaps stay gaps; no decimal over-precision. Caveats: sources screen.

import 'price_history.dart';

/// Freely-citable sources (public-domain / CC-BY / citable academic facts).
/// Points reference these by index via [PricePoint.sourceId].
const List<PriceSource> kPriceSources = [
  PriceSource(
    'World Bank — Commodity Markets „Pink Sheet", Historical Annual Data (Gold/Silber London Fix, Weizen US HRW)',
    'CC-BY 4.0',
    'https://www.worldbank.org/en/research/commodity-markets',
  ),
  PriceSource(
    'Federal Reserve History — „Gold Reserve Act of 1934" (US-Statutpreise 20,67 / 35,00 USD/oz)',
    'US Government work — Public Domain',
    'https://www.federalreservehistory.org/essays/gold-reserve-act',
  ),
  PriceSource(
    'U.S. Mint — „Mint History: the Crime of 1873" (Silber-Demonetarisierung)',
    'US Federal — Public Domain',
    'https://www.usmint.gov/news/inside-the-mint/mint-history-crime-of-1873',
  ),
  PriceSource(
    'NBER Macrohistory — Wholesale Price of Wheat, Chicago 1841–1944 (via FRED)',
    'Public Domain (US federal / NBER)',
    'https://fred.stlouisfed.org/series/M04F1AUS16980M260NNBR',
  ),
  PriceSource(
    'Ross, J. & Bettenay, L. — „Gold and Silver: Relative Values in the Ancient Past", Cambridge Archaeological Journal (2024)',
    'Academic; year/value facts freely citable with attribution',
    'https://www.cambridge.org/core/journals/cambridge-archaeological-journal',
  ),
  PriceSource(
    'Harper, K. — „People, Plagues, and Prices in the Roman World", Journal of Economic History 76:3 (2016) — ägyptische Weizenpreise',
    'Academic; numeric facts freely citable',
    'https://www.cambridge.org/core/journals/journal-of-economic-history',
  ),
  PriceSource(
    'Clark, G. — „The Price History of English Agriculture, 1209–1914" — mittelalterliche englische Weizenpreise',
    'Author-hosted working paper; freely citable',
    'https://faculty.econ.ucdavis.edu/faculty/gclark/papers/Agprice.pdf',
  ),
  PriceSource(
    'Babylonische „Astronomical Diaries" (Slotsky & Wallenfels; van der Spek/Vargyas) — Gerstenpreise in Silber',
    'Academic; metrological constants + figures freely citable',
    'https://www.academia.edu/10863477/',
  ),
  PriceSource(
    'Loomis / Bresson — klassisches Athen (Demosthenes 34, ~5 Drachmen/Medimnos)',
    'Academic; ancient testimonia public domain',
    'https://en.wikipedia.org/wiki/Ancient_Greek_units_of_measurement',
  ),
  PriceSource(
    'Wikipedia — „Silver Thursday" (1980 Hunt-Peak ~50 USD/oz, 18.01.1980)',
    'CC-BY-SA 4.0',
    'https://en.wikipedia.org/wiki/Silver_Thursday',
  ),
  PriceSource(
    'Wikipedia — „Coinage Act of 1834 / 1873 / 1792" (Bimetall-Verhältnisse 15:1 → 16:1)',
    'CC-BY-SA 4.0',
    'https://en.wikipedia.org/wiki/Coinage_Act_of_1873',
  ),
  PriceSource(
    'Wikipedia — „Edict on Maximum Prices" (Diokletian 301, gesetzliches Maximum)',
    'CC-BY-SA 4.0 (Edikt selbst Public Domain)',
    'https://en.wikipedia.org/wiki/Edict_on_Maximum_Prices',
  ),
];

// ── SILBER IN GOLD = oz gold per oz silver = 1 / gold-silver ratio ───────────
// Baseline (oldest, -3200) = 0.4. Silver became far cheaper in gold over the
// millennia (down to ~0.011 today) — the curve falls below the 0 line.
const PriceSeries _silver = PriceSeries(
  id: PriceSeriesId.silver,
  unit: 'Ag→Au',
  sourceIds: [4, 10, 0],
  points: [
    PricePoint(-3200, 0.4, Era.reconstructed,
        valueLow: 0.2, valueHigh: 0.6, label: 'Frühes Ägypten', sourceId: 4),
    PricePoint(-1900, 0.167, Era.reconstructed,
        valueLow: 0.083, valueHigh: 0.25, label: 'Ägypten', sourceId: 4),
    PricePoint(-1150, 0.333, Era.reconstructed,
        valueLow: 0.167, valueHigh: 0.5, label: 'Spätbronzezeit', sourceId: 4),
    PricePoint(-690, 0.0667, Era.reconstructed,
        valueLow: 0.0333, valueHigh: 0.1, label: 'Babylon', sourceId: 4),
    PricePoint(-546, 0.0769, Era.reconstructed,
        valueLow: 0.0385, valueHigh: 0.115, label: 'Lydien', sourceId: 4),
    PricePoint(-348, 0.1, Era.reconstructed,
        valueLow: 0.05, valueHigh: 0.15,
        label: 'Klassisches Griechenland', sourceId: 4),
    PricePoint(-210, 0.125, Era.reconstructed,
        valueLow: 0.0625, valueHigh: 0.188, label: 'Hellenismus', sourceId: 4),
    PricePoint(-46, 0.087, Era.reconstructed,
        valueLow: 0.0435, valueHigh: 0.13,
        label: 'Römische Republik', sourceId: 4),
    PricePoint(1250, 0.0909, Era.sparse,
        valueLow: 0.0727, valueHigh: 0.109,
        label: 'Hochmittelalter', sourceId: 11),
    PricePoint(1500, 0.0909, Era.sparse,
        valueLow: 0.0727, valueHigh: 0.109,
        label: 'Spätmittelalter', sourceId: 11),
    PricePoint(1700, 0.0667, Era.sparse,
        valueLow: 0.0533, valueHigh: 0.08, label: 'Frühe Neuzeit', sourceId: 11),
    PricePoint(1792, 0.0667, Era.sparse,
        valueLow: 0.0533, valueHigh: 0.08,
        label: 'US-Münzgesetz 1792', sourceId: 11),
    PricePoint(1834, 0.0625, Era.modern, valueLow: 0.0594, valueHigh: 0.0656),
    PricePoint(1869, 0.0625, Era.modern, valueLow: 0.0594, valueHigh: 0.0656),
    PricePoint(1900, 0.0303, Era.modern, valueLow: 0.0288, valueHigh: 0.0318),
    PricePoint(1915, 0.0263, Era.modern, valueLow: 0.025, valueHigh: 0.0276),
    PricePoint(1933, 0.0133, Era.modern, valueLow: 0.0127, valueHigh: 0.014),
    PricePoint(1939, 0.0102, Era.modern, valueLow: 0.0097, valueHigh: 0.0107),
    PricePoint(1971, 0.05, Era.modern, valueLow: 0.0475, valueHigh: 0.0525),
    PricePoint(1980, 0.0588, Era.modern,
        valueLow: 0.0559, valueHigh: 0.0618, label: 'Hunt-Spitze', sourceId: 9),
    PricePoint(1991, 0.01, Era.modern, valueLow: 0.0095, valueHigh: 0.0105),
    PricePoint(2000, 0.0182, Era.modern, valueLow: 0.0173, valueHigh: 0.0191),
    PricePoint(2008, 0.0179, Era.modern, valueLow: 0.017, valueHigh: 0.0188),
    PricePoint(2011, 0.0227, Era.modern, valueLow: 0.0216, valueHigh: 0.0239),
    PricePoint(2015, 0.0133, Era.modern, valueLow: 0.0127, valueHigh: 0.014),
    PricePoint(2020, 0.008, Era.modern, valueLow: 0.0076, valueHigh: 0.0084),
    PricePoint(2024, 0.0114, Era.modern, valueLow: 0.0108, valueHigh: 0.0119),
  ],
);

// ── GETREIDE IN GOLD = grams of fine gold per litre of grain ─────────────────
// = grain-in-silver ÷ gold-silver ratio. Baseline (oldest, -380) = 0.0046.
const PriceSeries _wheat = PriceSeries(
  id: PriceSeriesId.wheat,
  unit: 'Korn→Au',
  sourceIds: [7, 8, 5, 11, 6, 0],
  points: [
    PricePoint(-380, 0.0046, Era.reconstructed,
        valueLow: 0.0021, valueHigh: 0.01,
        label: 'Gerste, Babylon', sourceId: 7),
    PricePoint(-335, 0.041, Era.reconstructed,
        valueLow: 0.019, valueHigh: 0.09, label: 'Weizen, Athen', sourceId: 8),
    PricePoint(50, 0.015, Era.reconstructed,
        valueLow: 0.0065, valueHigh: 0.035,
        label: 'Weizen, Römisches Ägypten', sourceId: 5),
    PricePoint(200, 0.032, Era.reconstructed,
        valueLow: 0.014, valueHigh: 0.074,
        label: 'Röm. Ägypten (post-Pest)', sourceId: 5),
    PricePoint(301, 0.015, Era.reconstructed,
        valueLow: 0.0065, valueHigh: 0.035,
        label: 'Diokletian-Edikt (Maximum)', sourceId: 11),
    PricePoint(1300, 0.029, Era.sparse,
        valueLow: 0.018, valueHigh: 0.046, label: 'Weizen, England', sourceId: 6),
    PricePoint(1400, 0.019, Era.sparse,
        valueLow: 0.012, valueHigh: 0.03, label: 'Weizen, England', sourceId: 6),
    PricePoint(1500, 0.016, Era.sparse,
        valueLow: 0.01, valueHigh: 0.026, label: 'Weizen, England', sourceId: 6),
    PricePoint(1900, 0.027, Era.sparse,
        valueLow: 0.019, valueHigh: 0.038, label: '1900', sourceId: 0),
    PricePoint(1990, 0.0068, Era.modern, valueLow: 0.004, valueHigh: 0.012),
    PricePoint(2000, 0.01, Era.modern, valueLow: 0.0077, valueHigh: 0.013),
    PricePoint(2008, 0.0093, Era.modern, valueLow: 0.0072, valueHigh: 0.012),
    PricePoint(2020, 0.0021, Era.modern, valueLow: 0.0012, valueHigh: 0.0036),
    PricePoint(2024, 0.0034, Era.modern, valueLow: 0.0026, valueHigh: 0.0044),
  ],
);

/// GOLD IN GRAIN = gold's purchasing power in food = the reciprocal of
/// grain-in-gold (so the single source of truth is [_wheat]). Litres of grain
/// per gram of gold; baseline = the oldest (-380). A band's reciprocal flips
/// low↔high.
PriceSeries _goldFromWheat() => PriceSeries(
      id: PriceSeriesId.gold,
      unit: 'Au→Korn',
      sourceIds: _wheat.sourceIds,
      points: [
        for (final p in _wheat.points)
          PricePoint(p.year, 1 / p.value, p.era,
              valueLow: p.valueHigh == null ? null : 1 / p.valueHigh!,
              valueHigh: p.valueLow == null ? null : 1 / p.valueLow!,
              label: p.label,
              sourceId: p.sourceId),
      ],
    );

/// The dataset: one gold-referenced series per [PriceSeriesId].
final Map<PriceSeriesId, PriceSeries> kPriceSeries = {
  PriceSeriesId.gold: _goldFromWheat(),
  PriceSeriesId.silver: _silver,
  PriceSeriesId.wheat: _wheat,
};
