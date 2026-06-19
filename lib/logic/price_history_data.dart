// The compiled historical price dataset for the Werterechner chart. Pure data,
// no Flutter imports. Source of truth: a multi-agent compile + adversarial-
// verify run (see docs/asset-converter.md). DELIBERATELY COARSE and honestly
// framed — a curated reconstruction, not an authoritative series.
//
// Framing (verified): one consistent UNIT per series, each plotted alone:
//   - gold   = the GOLD/SILVER RATIO (dimensionless) — the strongest cross-era
//              series (antiquity → today; no currency conversion needed).
//   - silver = nominal price in USD per troy ounce (modern only, familiar).
//   - wheat  = grams of fine silver per litre of grain (cross-era: antiquity
//              anchors + modern, derived from wheat$ ÷ silver$).
//
// Honesty rules the chart enforces: antiquity/sparse points are DISCRETE dots
// (Era != modern), never joined by a line; lines connect only adjacent modern
// points; gaps stay gaps; no decimal over-precision on reconstructed values.
// All caveats live on the sources screen (price_sources_page.dart).

import 'price_history.dart';

/// Freely-citable sources (public-domain / CC-BY / citable academic facts).
/// Restrictive compilations (MeasuringWorth, FRED bulk, dealer tables) were
/// used only as cross-checks and are NOT bundled. Points reference these by
/// index via [PricePoint.sourceId].
const List<PriceSource> kPriceSources = [
  PriceSource(
    'World Bank — Commodity Markets „Pink Sheet", Historical Annual Data (Gold London PM, Silber London Fix, Weizen US HRW)',
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
    'Wikipedia — „Coinage Act of 1834 / 1873" (Bimetall-Verhältnisse 15:1 → 16:1)',
    'CC-BY-SA 4.0',
    'https://en.wikipedia.org/wiki/Coinage_Act_of_1873',
  ),
  PriceSource(
    'Wikipedia — „Edict on Maximum Prices" (Diokletian 301, gesetzliches Maximum)',
    'CC-BY-SA 4.0 (Edikt selbst Public Domain)',
    'https://en.wikipedia.org/wiki/Edict_on_Maximum_Prices',
  ),
  PriceSource(
    'World Economic Forum — „A short history of the British pound" (Newtons Münzpreis 1717, GBP 4,25/oz)',
    'Editorial source for a public historical fact',
    'https://www.weforum.org/stories/2016/06/a-short-history-of-the-british-pound/',
  ),
];

// ── Series ───────────────────────────────────────────────────────────────────

/// GOLD = gold/silver ratio (oz silver per oz gold), dimensionless. The
/// cross-era backbone — runs from early antiquity to today with no currency
/// conversion. Antiquity/medieval points are discrete (Era != modern).
const PriceSeries _gold = PriceSeries(
  id: PriceSeriesId.gold,
  unit: 'Au/Ag',
  sourceIds: [4, 10, 1, 0],
  points: [
    PricePoint(-3200, 2.5, Era.reconstructed,
        label: 'Frühes Ägypten', sourceId: 4),
    PricePoint(-1900, 6, Era.reconstructed,
        label: 'Mittleres Reich, Ägypten', sourceId: 4),
    PricePoint(-1150, 3, Era.reconstructed,
        label: 'Spätbronzezeit', sourceId: 4),
    PricePoint(-690, 15, Era.reconstructed,
        label: 'Babylonische Aufzeichnungen', sourceId: 4),
    PricePoint(-546, 13, Era.reconstructed, label: 'Lydien', sourceId: 4),
    PricePoint(-348, 10, Era.reconstructed,
        label: 'Klassisches Griechenland', sourceId: 4),
    PricePoint(-210, 8, Era.reconstructed, label: 'Hellenismus', sourceId: 4),
    PricePoint(-46, 11.5, Era.reconstructed,
        label: 'Römische Republik', sourceId: 4),
    PricePoint(1250, 11, Era.sparse, label: 'Hochmittelalter', sourceId: 10),
    PricePoint(1500, 11, Era.sparse, label: 'Spätmittelalter', sourceId: 10),
    PricePoint(1700, 15, Era.sparse, label: 'Frühe Neuzeit', sourceId: 10),
    PricePoint(1792, 15, Era.modern), // US-Münzgesetz 15:1
    PricePoint(1834, 16, Era.modern), // 16:1
    PricePoint(1869, 16, Era.modern),
    PricePoint(1900, 33, Era.modern),
    PricePoint(1915, 38, Era.modern),
    PricePoint(1933, 75, Era.modern),
    PricePoint(1939, 98, Era.modern), // Vor-Floating-Hoch
    PricePoint(1971, 20, Era.modern),
    PricePoint(1980, 17, Era.modern),
    PricePoint(1991, 100, Era.modern),
    PricePoint(2000, 55, Era.modern),
    PricePoint(2008, 56, Era.modern),
    PricePoint(2011, 44, Era.modern),
    PricePoint(2015, 75, Era.modern),
    PricePoint(2020, 125, Era.modern),
    PricePoint(2024, 88, Era.modern),
  ],
);

/// SILVER = nominal price in USD per troy ounce (modern only). The pre-1873
/// flat 1.29 is a statutory mint/monetary anchor, not a market observation;
/// 1980/2011 are peaks (not annual averages) — labelled per point.
const PriceSeries _silver = PriceSeries(
  id: PriceSeriesId.silver,
  unit: 'USD/oz t',
  sourceIds: [0, 2, 9, 10],
  points: [
    PricePoint(1700, 1.29, Era.sparse,
        label: 'gesetzlicher Münzpreis', sourceId: 2),
    PricePoint(1800, 1.29, Era.sparse,
        label: 'gesetzlicher Münzpreis', sourceId: 2),
    PricePoint(1873, 1.29, Era.sparse,
        label: 'Ende des Bimetallismus', sourceId: 2),
    PricePoint(1900, 0.62, Era.sparse, label: 'Markt (grob)', sourceId: 0),
    PricePoint(1980, 50, Era.modern, label: 'Hunt-Peak (Intraday)', sourceId: 9),
    PricePoint(1990, 4.82, Era.modern),
    PricePoint(2000, 4.95, Era.modern),
    PricePoint(2008, 14.99, Era.modern),
    PricePoint(2011, 49.5, Era.modern, label: 'Peak (April 2011)', sourceId: 0),
    PricePoint(2020, 20.69, Era.modern),
    PricePoint(2024, 28.5, Era.modern),
  ],
);

/// WHEAT = grams of fine silver per litre of grain. Antiquity anchors are
/// computed from each era's coin/weight standard (silver-equivalent); the
/// modern points are derived from the wheat$/silver$ market ratio. Discrete
/// antiquity dots; modern line; the ~1500→1900 gap stays a gap.
const PriceSeries _wheat = PriceSeries(
  id: PriceSeriesId.wheat,
  unit: 'g Ag/L',
  sourceIds: [7, 8, 5, 11, 6, 0],
  points: [
    PricePoint(-380, 0.046, Era.reconstructed,
        label: 'Gerste, Babylon (Norm)', sourceId: 7),
    PricePoint(-335, 0.41, Era.reconstructed,
        label: 'Weizen, Athen', sourceId: 8),
    PricePoint(50, 0.175, Era.reconstructed,
        label: 'Weizen, Römisches Ägypten', sourceId: 5),
    PricePoint(200, 0.37, Era.reconstructed,
        label: 'Weizen, Röm. Ägypten (post-Pest)', sourceId: 5),
    PricePoint(301, 0.17, Era.reconstructed,
        label: 'Diokletian-Edikt (Maximum)', sourceId: 11),
    PricePoint(1300, 0.32, Era.sparse, label: 'Weizen, England', sourceId: 6),
    PricePoint(1400, 0.21, Era.sparse,
        label: 'Weizen, England (post-Pest)', sourceId: 6),
    PricePoint(1500, 0.18, Era.sparse,
        label: 'Weizen, England (vor Preisrevolution)', sourceId: 6),
    PricePoint(1900, 0.88, Era.sparse,
        label: 'aus Markt-Weizen/Silber', sourceId: 0),
    PricePoint(1990, 0.68, Era.modern),
    PricePoint(2000, 0.57, Era.modern),
    PricePoint(2008, 0.52, Era.modern),
    PricePoint(2020, 0.26, Era.modern),
    PricePoint(2024, 0.30, Era.modern),
  ],
);

/// The dataset: one series per [PriceSeriesId].
const Map<PriceSeriesId, PriceSeries> kPriceSeries = {
  PriceSeriesId.gold: _gold,
  PriceSeriesId.silver: _silver,
  PriceSeriesId.wheat: _wheat,
};
