// Welsh translation of the "Recommendations" chapters. part of
// ../recommendations.dart.
part of '../recommendations.dart';

List<RecChapter> _recChaptersCy() => const [
  // ── Ffisegol ──────────────────────────────────────────────────────────
  RecChapter(
    'Ffisegol',
    intro:
        'Yr hyn a geisir yw dyfais gryno, faint poced — nid cyfrifiannell '
        'graffiau trwsgl — sy’n rhaglennadwy neu’n dod â chraidd cyfrifo '
        'agored. Mae cyfrifianellau graffiau (NumWorks, TI-Nspire, Casio '
        'fx-CG) wedi’u gadael allan ar sail ffactor ffurf; mae’r HP 35s '
        'clasurol wedi’i ddi-gynhyrchu a dim ond ar gael ail-law am brisiau '
        'casglwyr.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Perchnogol · gwyddonol rhaglennadwy',
        blurb:
            'Cyfrifiannell poced rhaglennadwy gyda storfa fformiwlâu a '
            'sgrin naturiol. Ar gyfer fformiwlâu adeiladu pren sy’n '
            'dychwelyd (dyfnder rhicyn, geometreg uniad scarf) gellir '
            'storio rhaglenni ag union baramedrau.',
        pros: [
          'Cryno ac addas i’r boced',
          'Rhaglennadwy, gyda llyfrgell fformiwlâu',
          'Mynediad algebraidd cyfarwydd, graddau/munudau/eiliadau',
          'Gwerth am arian ardderchog',
        ],
        cons: [
          'Yn Ewrop, ar gael trwy fewnforio fel arfer yn unig',
          'Perchnogol — dim cipolwg ar y cod',
          'Dim allbwn bôn 12',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Craidd Free42 (GPL-2.0) · RPN · premiwm',
        blurb:
            'Cyfrifiannell RPN blaenllaw a theyrnged i’r HP-42S, mewn '
            'casin dur gwrthstaen wedi’i freinio â CNC gyda USB-C. Mae ei '
            'graidd cyfrifo yn Free42 ffynhonnell-agored Thomas Okken gyda '
            'rhifyddeg decimal-128 (34 digid).',
        pros: [
          'Craidd cyfrifo agored (Free42, GPL) — gellir astudio’r ymddygiad',
          'Yn union yr un fath â’r peiriant bwrdd gwaith/symudol, rhaglenni’n gludadwy',
          'Manwl gywirdeb eithafol (34 digid degol)',
          'Adeilad fel etifeddiaeth, storfa màs USB-C',
        ],
        cons: [
          'RPN yn unig — angen cyfnod ymgyfarwyddo',
          'Pris premiwm, weithiau’n anodd dod o hyd iddo',
          'Swyddogaethau BASE heb fôn 12',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Perchnogol · gwyddonol (cyllideb)',
        blurb:
            'Y ClassWiz cyfredol, di-raglennadwy — yr opsiwn rhad, sydd ar '
            'gael ym mron ymhobman, i bawb nad oes arnynt angen '
            'rhaglennadwyedd.',
        pros: [
          'Rhad ac ar gael bron ym mhobman',
          'Sgrin naturiol, set swyddogaethau eang',
          'Cryno, cadarn',
        ],
        cons: [
          'Ddim yn rhaglennadwy',
          'Perchnogol',
          'Sylweddol arafach ar weithrediadau cymhleth',
          'Dim bôn 12',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'Crynodeb: yr fx-5800P yw’r dewis rhesymol — rhaglennadwy, cryno, '
        'mynediad cyfarwydd. Mae’r DM42n yn ddarn brwdfrydig gyda chraidd '
        'agored (ond RPN yn unig a phris premiwm). Awgrym: profwch RPN am '
        'ddim gyda Free42/Plus42 cyn prynu’r caledwedd.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Ar gyfer defnydd bob dydd ar y ffôn. Dyma’r apiau cryfaf sydd ar '
        'gael trwy Google Play yn y ffordd arferol — mae’r opsiynau ffynhonnell-'
        'agored pur yn dilyn yn y bennod nesaf (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Perchnogol · CAS a graffiau',
        blurb:
            'Cyfrifiannell gwyddonol gydag algebra symbolig, graffiau, '
            'hafaliadau, a deilliadau ac integrannau. Defnydd eang, yn cael '
            'ei gynnal yn weithgar, gyda gosodiadau ar gyfer gwahanol '
            'feintiau sgrin.',
        pros: [
          'Set nodweddion fawr (CAS, graffiau, nifer uchel o ddigidau)',
          'Arddangosiad ffracsiynau a degolion cylchol',
          'Yn cael ei gynnal yn weithgar, gosodiadau y gellir eu haddasu',
        ],
        cons: [
          'Perchnogol — dim gwerth dysgu ar gyfer eich prosiectau chi',
          'Set llawn o nodweddion ar dâl',
          'Dim allbwn bôn 12',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Ail-weithrediad cyflawn o’r HP-42S heb unrhyw god HP. Mae Plus42 '
            'yn ei ymestyn gyda hafaliadau algebraidd a datrysydd, gan ostwng '
            'y rhwystr mynediad RPN yn sylweddol.',
        pros: [
          'Ffynhonnell agored (GPL), cod fel deunydd dysgu',
          'Yn union yr un fath ar draws platfformau — rhaglenni’n gludadwy',
          'Manwl gywirdeb Decimal-128',
          'Plus42 gyda hafaliadau algebraidd',
        ],
        cons: [
          'Rhesymeg RPN (mae Plus42 yn lliniaru hyn)',
          'Swyddogaethau BASE heb fôn 12',
          'Ar dâl ar symudol (am ddim ar fwrdd gwaith)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'Crynodeb: HiPER Calc Pro fel yr offeryn bob dydd cryfaf o’r Play '
        'Store; Free42/Plus42 fel y llwybr RPN ffynhonnell-agored gyda '
        'decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Apiau ffynhonnell-agored pur o’r siop F-Droid (neu’n uniongyrchol '
        'gan y datblygwr): cod y gellir ei archwilio, dim olrheinyddion — ac '
        'felly deunydd dysgu a chyfeirio ar gyfer eich prosiectau chi.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS ac unedau',
        blurb:
            'Rhyngwyneb Android swyddogol ar gyfer peiriant Qalculate!: UI '
            'Kotlin/Java dros y llyfrgell C++ frodorol libqalculate. Cyfrifiad '
            'symbolig, manwl gywirdeb mympwyol, rhifyddeg cyfwng, cyfrifiad '
            'unedau — y peiriant mwyaf pwerus yn y maes.',
        pros: [
          'Ffynhonnell agored (GPL), y peiriant mwyaf pwerus (CAS, unedau, manwl gywirdeb)',
          'Hefyd yn cyfrifo mewn bôn 12 (deuddegol) — yr unig un yma',
          'Pensaernïaeth addysgiadol: UI Kotlin dros graidd brodorol',
          'Dim olrheinyddion',
        ],
        cons: [
          'Wedi’i gael yn bennaf trwy F-Droid neu adeiladiad uniongyrchol',
          'Mae’r prosiect yn gwrthod dilysu datblygwr Google — mae hyfywedd '
              'gosodiad yn y dyfodol trwy sianelau arferol yn ansicr (nid yn '
              'broblem trwy F-Droid)',
          'Rhwystr mynediad uwch na chyfrifiannell syml',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Cyfrifiannell main, wedi’i gynnal yn dda, wedi’i ysgrifennu’n '
            'gyfan gwbl yn Kotlin. Nid pencampwr nodweddion, ond mae’r cod yn '
            'ddarllenadwy a chryno — yn nodiadwy ei newid dogfennedig o rifau '
            'mewnol o Double i BigDecimal, yr union gwestiwn manwl gywirdeb y '
            'mae’n rhaid i gyfrifiannell bôn 12 hefyd ei ddatrys.',
        pros: [
          'Ffynhonnell agored (GPL-3.0), cod Kotlin glân',
          'Gwrthrych dysgu a chyfeirio delfrydol',
          'Hanes, UI plaen, dim olrheinyddion',
        ],
        cons: [
          'Dim CAS, dim rhaglennadwyedd',
          'Yn swyddogaethol nid yw’n gystadleuydd i HiPER/Qalculate',
          'Dim bôn 12',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'Crynodeb: Qalculate! yw’r dewis ffynhonnell-agored mwyaf pwerus — '
        'a’r unig un gydag allbwn bôn 12. OpenCalc yw’r "cipolwg o dan y '
        'bonet" i ddatblygwyr.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS yw’r platfform gwannaf ar gyfer cyfrifianellau ffynhonnell-agored '
        '— ond mae ganddo un offeryn perchnogol nodedig. I fod yn onest: mae '
        'cystadleuaeth FOSS go iawn yn absennol.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Perchnogol · offeryn cyfeirio',
        blurb:
            'Wedi’i ystyried yn gyfeirnod ar blatfformau Apple ers y 1990au: '
            'trosiadau helaeth, mynediad RPN dosbarth cyntaf, addasadwyedd '
            'dwfn (themâu, gosodiadau allweddi, tâp papur). Yn rhedeg ar '
            'iPhone, iPad, Apple Watch ac Apple TV.',
        pros: [
          'Offeryn dosbarth cyntaf, aeddfed iawn',
          'Modd RPN dewisol, hanes y gellir ei olygu',
          'Llawer o drawsnewidiadau a chysonion',
          'Fersiwn Lite am ddim i ddechrau',
        ],
        cons: [
          'Perchnogol — dim gwerth dysgu',
          'Ar dâl',
          'Gall cyfoeth y nodweddion lethu ar y dechrau',
          'Dim bôn 12',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Yn llenwi’r bwlch ffynhonnell-agored ar iOS: mae Free42 am ddim '
            'yn yr App Store ac yn defnyddio’r un peiriant â phob platfform arall.',
        pros: [
          'Ffynhonnell agored (GPL), Free42 am ddim',
          'Yn union yr un fath ar draws platfformau',
          'Manwl gywirdeb Decimal-128',
          'Plus42 gyda hafaliadau algebraidd',
        ],
        cons: [
          'Rhesymeg RPN (mae Plus42 yn lliniaru hyn)',
          'Dim bôn 12',
          'Plus42 ar dâl',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Crynodeb: PCalc fel y prif offeryn (dim cystadleuaeth FOSS ddifrifol '
        'ar iOS), Free42/Plus42 fel yr argymhelliad ffynhonnell-agored a '
        'ffordd glân i mewn i RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Ar y Mac mae’r offeryn brodorol gorau yn cwrdd â’r peiriant agored '
        'mwyaf pwerus — mae rhaniad o lafur yn talu ar ei ganfed: gwaith cyflym '
        'â’r bysellfwrdd yma, gwaith manwl gywir a symbolig acw.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · y peiriant mwyaf pwerus',
        blurb:
            'Yr offeryn bwrdd gwaith pwerus (hefyd ar gyfer Windows a Linux): '
            'symbolig, manwl gywirdeb mympwyol, cyfrifiad unedau, plotio. '
            'Gosodadwy trwy Homebrew; mae’r CLI "qalc" yn ymddwyn yn union yr '
            'un fath â Linux.',
        pros: [
          'Ffynhonnell agored, y peiriant mwyaf pwerus (CAS, unedau, ffracsiynau manwl gywir)',
          'Hefyd yn cyfrifo mewn bôn 12 (deuddegol)',
          'Estynadwy gyda’ch swyddogaethau chi, CLI y gellir ei sgriptio',
        ],
        cons: [
          'Llai wedi’i loywi’n "frodorol Mac" na PCalc',
          'Mae ei bŵer angen rhywfaint o ddysgu',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Perchnogol · ansawdd Mac brodorol',
        blurb:
            'Yr un cryfderau ag ar iOS, mewn ap Mac wedi’i loywi: addasadwyedd '
            'dwfn a "Magic Variables" ar gyfer ailddefnyddio mynegiadau, ynghyd â '
            'Handoff rhwng dyfeisiau Apple.',
        pros: [
          'Ap Mac brodorol, aeddfed',
          'RPN, tâp papur, llawer o drawsnewidiadau',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Perchnogol, ar dâl',
          'Dim bôn 12',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Ar gael ar gyfer macOS hefyd — am ddim ar y bwrdd gwaith. Yr un '
            'peiriant â chraidd cyfrifo caledwedd DM42.',
        pros: [
          'Ffynhonnell agored (GPL), am ddim ar y bwrdd gwaith',
          'Manwl gywirdeb Decimal-128',
          'Yn union yr un fath ar draws platfformau',
        ],
        cons: [
          'Rhesymeg RPN',
          'Dim bôn 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Crynodeb: PCalc ar gyfer defnydd cyflym â’r bysellfwrdd, Qalculate! '
        'ar gyfer gwaith manwl gywir a symbolig (a bôn 12). Fel arbenigwyr '
        'niche: Numi (mynediad iaith naturiol) a Soulver (cyfrifo arddull '
        'bloc nodiadau).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Ar Linux mae’r sefyllfa’n glir — mae un peiriant yn dominyddu, a’r '
        'cwestiwn gwirioneddol yw "GUI neu derfynell?". Ar gyfer cyfrifianellau '
        'safonol plaen mae’r clasigion bwrdd gwaith hefyd.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · heb gystadleuydd',
        blurb:
            'Rhyngwynebau GTK a Qt ynghyd â’r CLI "qalc". Set lawn '
            'libqalculate: symbolig, manwl gywirdeb mympwyol, lledaeniad '
            'ansicrwydd, plotio. Mae "qalc" yn sgriptadwy (mynegiad fel '
            'dadl neu o ffeil) a’i becynnu ym mhob dosbarthiad mawr.',
        pros: [
          'Ffynhonnell agored, ar gael ym mhob dosbarthiad',
          'Y peiriant mwyaf pwerus, hefyd yn cyfrifo mewn bôn 12',
          'CLI sgriptadwy — aliaswyr, pibellau, eich llyfrgelloedd swyddogaethau chi',
        ],
        cons: [
          'Mae cyfoeth y nodweddion angen rhywfaint o ddysgu',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · safon KDE',
        blurb:
            'Cyfrifiannell KDE gyda modau gwyddonol a rhaglennwr a gosodiadau '
            'allweddi y gellir eu haddasu — sylfaen gadarn.',
        pros: [
          'Ffynhonnell agored, ysgafn',
          'Modd rhaglennwr (bin/oct/hex)',
          'Wedi’i integreiddio’n dda i KDE Plasma',
        ],
        cons: [
          'Dim CAS',
          'Dim bôn 12',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · safon GNOME',
        blurb:
            'Cyfrifiannell safonol GNOME gydag unedau ac arian cyfredol yn '
            'ogystal â modau datblygedig, ariannol a rhaglennu. O dan '
            'Qalculate yn swyddogaethol, ond cadarn drwyddi draw.',
        pros: [
          'Ffynhonnell agored, hawdd ei ddefnyddio',
          'Unedau ac arian cyfredol wedi’u hymgorffori',
        ],
        cons: [
          'Llai pwerus na Qalculate',
          'Dim bôn 12',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · datblygiad segur',
        blurb:
            'Y gyfrinach fewnol gynt: mynediad cyflym, canolog ar fysellfwrdd '
            'gyda’r amlygu cystrawen a chwblhad awtomatig, manwl gywirdeb uchel, '
            'newidynnau fel mewn taenlen. Sefydlog — ond heb fersiwn newydd ers '
            'blynyddoedd.',
        pros: [
          'Ffynhonnell agored, mynediad bysellfwrdd cyflym iawn',
          'Manwl gywirdeb uchel, gludadwy heb osodiad',
        ],
        cons: [
          'Datblygiad yn segur — dim rhagolwg yn y dyfodol',
          'Wedi’i ragori’n swyddogaethol gan Qalculate',
          'Dim bôn 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'Crynodeb: Qalculate!/qalc heb gystadleuaeth ddifrifol — y dewis mewn '
        'gwirionedd yw dim ond GUI yn erbyn llif gwaith terfynell. KCalc a '
        'GNOME Calculator fel cyfrifianellau safonol ysgafn; SpeedCrunch yn '
        'ddefnyddiadwy, ond heb ddyfodol.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Ar Windows mae’r gystadleuaeth yn denau — mae un peiriant yn sefyll '
        'allan, ynghyd ag achos prin o gyfeirnod â thrwydded ganiatâol y gallwch '
        '(yn wahanol i GPL) ailddefnyddio ei god heb gymhlethdodau cyfreithiol.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · enillydd clir',
        blurb:
            'Adeiladau Windows swyddogol (qalculate-qt) gyda’r un peiriant pwerus '
            'ag ar Mac a Linux: symbolig, manwl gywirdeb mympwyol, unedau, plotio.',
        pros: [
          'Ffynhonnell agored, y peiriant mwyaf pwerus',
          'Hefyd yn cyfrifo mewn bôn 12 (deuddegol)',
          'Estynadwy gyda’ch swyddogaethau chi',
        ],
        cons: [
          'Llai wedi’i loywi’n "frodorol Windows"',
          'Mae ei bŵer angen rhywfaint o ddysgu',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Cyfrifiannell Windows (Microsoft)',
        tag: 'MIT · wedi’i ragosod',
        blurb:
            'Ffynhonnell agored ar GitHub ers 2019 — ac o dan y drwydded MIT '
            'ar ben hynny. Dyma’r achos prin o drwydded ganiatâol yn y maes ac '
            'felly’r cyfeirnod cod mwyaf syml yn gyfreithiol (C++/C#). Yn '
            'cynnig modd rhaglennwr gyda bin/oct/hex.',
        pros: [
          'Ffynhonnell agored o dan MIT — ailddefnydd cod yn syml yn gyfreithiol',
          'Wedi’i ragosod a chyfarwydd',
          'Modd rhaglennwr (bin/oct/hex)',
        ],
        cons: [
          'Dim CAS, dim rhaglennadwyedd',
          'Manwl gywirdeb cyfyngedig',
          'Dim bôn 12',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · datblygiad segur',
        blurb:
            'Mynediad cyflym, canolog ar fysellfwrdd gyda’r amlygu cystrawen a '
            'chwblhad awtomatig, manwl gywirdeb uchel, gludadwy heb osodiad — '
            'ond heb fersiwn newydd ers blynyddoedd.',
        pros: [
          'Ffynhonnell agored, mynediad bysellfwrdd cyflym iawn',
          'Manwl gywirdeb uchel, gludadwy',
        ],
        cons: [
          'Datblygiad yn segur — dim rhagolwg yn y dyfodol',
          'Wedi’i ragori’n swyddogaethol gan Qalculate',
          'Dim bôn 12',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Ar gyfer selogion RPN: am ddim ar y bwrdd gwaith, yr un peiriant â '
            'chraidd cyfrifo caledwedd DM42.',
        pros: [
          'Ffynhonnell agored (GPL), am ddim ar y bwrdd gwaith',
          'Manwl gywirdeb Decimal-128',
          'Yn union yr un fath ar draws platfformau',
        ],
        cons: [
          'Rhesymeg RPN (mae Plus42 yn lliniaru hyn)',
          'Dim bôn 12',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Crynodeb: Qalculate! fel y dewis clir. Cadwch Gyfrifiannell Windows '
        'mewn cof fel cyfeirnod cod â thrwydded MIT, SpeedCrunch dim ond gyda '
        'rhybudd cynhaliaeth, Free42/Plus42 ar gyfer selogion RPN.',
  ),
];
