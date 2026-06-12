// English translation of the "Empfehlungen" (Recommendations) chapters. part of
// ../recommendations.dart. Mirrors the German source 1:1 in structure; product
// names, URLs and technical terms (RPN, GPL, MIT, CAS, base 12, decimal-128,
// bin/oct/hex) are preserved. Reference translation for the other languages.

part of '../recommendations.dart';

List<RecChapter> _recChaptersEn() => const [
  // ── Physical ──────────────────────────────────────────────────────────
  RecChapter(
    'Physical',
    intro:
        'The goal is a compact, pocket-sized device — not a bulky graphing '
        'calculator — that is either programmable or ships with an open '
        'computation core. Graphing calculators (NumWorks, TI-Nspire, Casio '
        'fx-CG) are left out on form-factor grounds; the classic HP 35s is '
        'discontinued and only available used at collector prices.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Proprietary · programmable scientific',
        blurb:
            'A programmable pocket calculator with formula storage and a natural '
            'display. For recurring timber-construction formulas (notch depth, '
            'scarf-joint geometry) you can store parameterised programs.',
        pros: [
          'Compact and pocket-friendly',
          'Programmable, with a formula library',
          'Familiar algebraic entry, degrees/minutes/seconds',
          'Excellent value for money',
        ],
        cons: [
          'In Europe usually only available via import',
          'Proprietary — no insight into the code',
          'No base-12 output',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Free42 core (GPL-2.0) · RPN · premium',
        blurb:
            'A flagship RPN calculator and homage to the HP-42S, in a CNC-milled '
            'stainless-steel case with USB-C. Its computation core is Thomas '
            'Okken\'s open-source Free42 with decimal-128 arithmetic (34 digits).',
        pros: [
          'Open computation core (Free42, GPL) — behaviour is studyable',
          'Identical to the desktop/mobile engine, programs portable',
          'Extreme precision (34 decimal digits)',
          'Built like an heirloom, USB-C mass storage',
        ],
        cons: [
          'RPN only — takes getting used to',
          'Premium price, at times hard to find',
          'BASE functions without base 12',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Proprietary · scientific (budget)',
        blurb:
            'The current, non-programmable ClassWiz — the inexpensive, widely '
            'available option for anyone who does not need programmability.',
        pros: [
          'Inexpensive and available almost everywhere',
          'Natural display, broad function set',
          'Compact, sturdy',
        ],
        cons: [
          'Not programmable',
          'Proprietary',
          'Noticeably slower on complex operations',
          'No base 12',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'Bottom line: the fx-5800P is the rational pick — programmable, compact, '
        'familiar entry. The DM42n is the enthusiast\'s piece with an open core '
        '(but RPN-only and premium-priced). Tip: try RPN for free with '
        'Free42/Plus42 before buying the hardware.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'For everyday use on the phone. Here are the strongest apps available '
        'through Google Play in the usual way — the purely open-source options '
        'follow in the next chapter (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Proprietary · CAS & graphs',
        blurb:
            'A scientific calculator with symbolic algebra, graphs, equations, '
            'and derivatives and integrals. Widely used, actively maintained, '
            'with layouts for different screen sizes.',
        pros: [
          'Large feature set (CAS, graphs, high digit count)',
          'Fraction and repeating-decimal display',
          'Actively maintained, customizable layouts',
        ],
        cons: [
          'Proprietary — no learning value for your own projects',
          'Full feature set is paid',
          'No base-12 output',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'A complete reimplementation of the HP-42S with no HP code. Plus42 '
            'extends it with algebraic equations and a solver, markedly lowering '
            'the RPN entry barrier.',
        pros: [
          'Open source (GPL), code as learning material',
          'Identical across platforms — programs portable',
          'Decimal-128 precision',
          'Plus42 with algebraic equations',
        ],
        cons: [
          'RPN logic (Plus42 softens this)',
          'BASE functions without base 12',
          'Paid on mobile (free on desktop)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'Bottom line: HiPER Calc Pro as the strongest everyday tool from the '
        'Play Store; Free42/Plus42 as the open-source RPN track with '
        'decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Purely open-source apps from the F-Droid store (or straight from the '
        'developer): inspectable code, no trackers — and therefore learning and '
        'reference material for your own projects.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & units',
        blurb:
            'The official Android front-end for the Qalculate! engine: a '
            'Kotlin/Java UI over the native C++ library libqalculate. Symbolic '
            'computation, arbitrary precision, interval arithmetic, unit '
            'calculation — the most powerful engine in the field.',
        pros: [
          'Open source (GPL), most powerful engine (CAS, units, precision)',
          'Also computes in base 12 (duodecimal) — the only one here',
          'Instructive architecture: a Kotlin UI over a native core',
          'No trackers',
        ],
        cons: [
          'Obtained mainly via F-Droid or a direct build',
          'The project declines Google\'s developer verification — future '
              'installability through regular channels is uncertain (not an '
              'issue via F-Droid)',
          'Higher entry barrier than a simple calculator',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'A lean, well-maintained calculator written entirely in Kotlin. Not '
            'a feature champion, but the code is readable and compact — notably '
            'its documented switch of internal numbers from Double to '
            'BigDecimal, exactly the precision question a base-12 calculator '
            'also has to solve.',
        pros: [
          'Open source (GPL-3.0), clean Kotlin code',
          'An ideal learning and reference object',
          'History, plain UI, no trackers',
        ],
        cons: [
          'No CAS, no programmability',
          'Functionally no rival to HiPER/Qalculate',
          'No base 12',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'Bottom line: Qalculate! is the most powerful open-source choice — and '
        'the only one with base-12 output. OpenCalc is the “look under the '
        'hood” for developers.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS is the weakest platform for open-source calculators — but it has '
        'one outstanding proprietary tool. To be honest: real FOSS competition '
        'is missing.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Proprietary · reference tool',
        blurb:
            'Regarded as the reference on Apple platforms since the 1990s: '
            'extensive conversions, first-class RPN entry, deep customizability '
            '(themes, key layouts, paper tape). Runs on iPhone, iPad, Apple '
            'Watch and Apple TV.',
        pros: [
          'First-class, very mature tool',
          'Optional RPN mode, editable history',
          'Many conversions and constants',
          'Free Lite version to start',
        ],
        cons: [
          'Proprietary — no learning value',
          'Paid',
          'The wealth of features can overwhelm at first',
          'No base 12',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Closes the open-source gap on iOS: Free42 is free on the App Store '
            'and uses the same engine as on every other platform.',
        pros: [
          'Open source (GPL), Free42 free',
          'Identical across platforms',
          'Decimal-128 precision',
          'Plus42 with algebraic equations',
        ],
        cons: [
          'RPN logic (Plus42 softens this)',
          'No base 12',
          'Plus42 is paid',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Bottom line: PCalc as the main tool (no serious FOSS competition on '
        'iOS), Free42/Plus42 as the open-source recommendation and a clean way '
        'into RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'On the Mac the best native tool meets the most powerful open engine — '
        'a division of labour pays off: fast key-driven work here, exact and '
        'symbolic work there.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · most powerful engine',
        blurb:
            'The desktop powerhouse (also for Windows and Linux): symbolic, '
            'arbitrary precision, unit calculation, plotting. Installable via '
            'Homebrew; the “qalc” CLI behaves identically to Linux.',
        pros: [
          'Open source, most powerful engine (CAS, units, exact fractions)',
          'Also computes in base 12 (duodecimal)',
          'Extensible with your own functions, scriptable CLI',
        ],
        cons: [
          'Less “Mac-native” polished than PCalc',
          'Its power needs some learning',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Proprietary · native Mac quality',
        blurb:
            'The same strengths as on iOS, in a polished Mac app: deep '
            'customizability and “Magic Variables” for reusing expressions, plus '
            'Handoff between Apple devices.',
        pros: [
          'Native, mature Mac app',
          'RPN, paper tape, many conversions',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Proprietary, paid',
          'No base 12',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Available for macOS too — free on the desktop. The same engine as '
            'the computation core of the DM42 hardware.',
        pros: [
          'Open source (GPL), free on the desktop',
          'Decimal-128 precision',
          'Identical across platforms',
        ],
        cons: [
          'RPN logic',
          'No base 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Bottom line: PCalc for fast key-driven use, Qalculate! for exact and '
        'symbolic work (and base 12). As niche specialists: Numi (natural-'
        'language input) and Soulver (notepad-style calculation).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'On Linux the situation is clear — one engine dominates, and the real '
        'question is “GUI or terminal?”. For plain standard calculators there '
        'are also the desktop classics.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · unrivaled',
        blurb:
            'GTK and Qt front-ends plus the “qalc” CLI. The full libqalculate '
            'feature set: symbolic, arbitrary precision, uncertainty '
            'propagation, plotting. “qalc” is scriptable (an expression as an '
            'argument or from a file) and packaged in every major distribution.',
        pros: [
          'Open source, available in every distribution',
          'Most powerful engine, also computes in base 12',
          'Scriptable CLI — aliases, pipes, your own function libraries',
        ],
        cons: [
          'The wealth of features needs some learning',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · KDE standard',
        blurb:
            'The KDE calculator with scientific and programmer modes and '
            'customizable key layouts — a solid baseline.',
        pros: [
          'Open source, lightweight',
          'Programmer mode (bin/oct/hex)',
          'Well integrated into KDE Plasma',
        ],
        cons: [
          'No CAS',
          'No base 12',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · GNOME standard',
        blurb:
            'The GNOME standard calculator with units and currencies plus '
            'advanced, financial and programming modes. Below Qalculate '
            'functionally, but thoroughly solid.',
        pros: [
          'Open source, easy to use',
          'Units and currencies built in',
        ],
        cons: [
          'Less powerful than Qalculate',
          'No base 12',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · dormant development',
        blurb:
            'The former insider tip: fast, keyboard-centric entry with syntax '
            'highlighting and autocompletion, high precision, variables as in a '
            'spreadsheet. Stable — but without a new version for years.',
        pros: [
          'Open source, very fast keyboard entry',
          'High precision, portable without installation',
        ],
        cons: [
          'Development is dormant — no future outlook',
          'Functionally overtaken by Qalculate',
          'No base 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'Bottom line: Qalculate!/qalc with no serious competition — the choice '
        'is really just GUI versus terminal workflows. KCalc and GNOME '
        'Calculator as lightweight standard calculators; SpeedCrunch usable, '
        'but without a future.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'On Windows the competition is thin — one engine stands out, joined by '
        'the rare case of a permissively licensed reference whose code you may '
        '(unlike GPL) reuse without legal complications.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · clear winner',
        blurb:
            'Official Windows builds (qalculate-qt) with the same powerful '
            'engine as on Mac and Linux: symbolic, arbitrary precision, units, '
            'plotting.',
        pros: [
          'Open source, most powerful engine',
          'Also computes in base 12 (duodecimal)',
          'Extensible with your own functions',
        ],
        cons: [
          'Less “Windows-native” polished',
          'Its power needs some learning',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Windows Calculator (Microsoft)',
        tag: 'MIT · preinstalled',
        blurb:
            'Open source on GitHub since 2019 — and under the MIT license at '
            'that. That is the rare case of a permissive license in the field '
            'and thus the legally simplest code reference (C++/C#). Offers a '
            'programmer mode with bin/oct/hex.',
        pros: [
          'Open source under MIT — code reuse legally uncomplicated',
          'Preinstalled and familiar',
          'Programmer mode (bin/oct/hex)',
        ],
        cons: [
          'No CAS, no programmability',
          'Limited precision',
          'No base 12',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · dormant development',
        blurb:
            'Fast, keyboard-centric entry with syntax highlighting and '
            'autocompletion, high precision, portable without installation — but '
            'without a new version for years.',
        pros: [
          'Open source, very fast keyboard entry',
          'High precision, portable',
        ],
        cons: [
          'Development is dormant — no future outlook',
          'Functionally overtaken by Qalculate',
          'No base 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'For RPN fans: free on the desktop, the same engine as the '
            'computation core of the DM42 hardware.',
        pros: [
          'Open source (GPL), free on the desktop',
          'Decimal-128 precision',
          'Identical across platforms',
        ],
        cons: [
          'RPN logic (Plus42 softens this)',
          'No base 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Bottom line: Qalculate! as the clear pick. Keep the Windows Calculator '
        'in mind as an MIT-licensed code reference, SpeedCrunch only with a '
        'maintenance warning, Free42/Plus42 for RPN fans.',
  ),
];
