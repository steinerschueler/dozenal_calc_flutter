// Aistriúchán Gaeilge de chaibidlí na "Moltaí". Cuid de
// ../recommendations.dart.
part of '../recommendations.dart';

List<RecChapter> _recChaptersGa() => const [
  // ── Fisiciúil ─────────────────────────────────────────────────────────
  RecChapter(
    'Fisiciúil',
    intro:
        'Táimid ag lorg gléas dlúth, pócamhail — ní áireamhán grafaíochta '
        'toirtiúil — atá inríomhchláraithe nó a thagann le croílár '
        'ríomhaireachta oscailte. Fágtar áireamháin ghrafaíochta (NumWorks, '
        'TI-Nspire, Casio fx-CG) ar leataobh mar gheall ar chruth an fhearainn; '
        'tá an clasaiceach HP 35s deireadh leis agus níl sé ar fáil ach ar '
        'phraghsanna bailitheoirí.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Dílseánach · eolaíoch inríomhchláraithe',
        blurb:
            'Áireamhán póca inríomhchláraithe le stóras foirmlí agus taispeáint '
            'nádúrtha. Do fhoirmlí tógála adhmaid athmhuiríneacha (doimhneacht '
            'eang, geoiméadracht comhcheangail) is féidir cláir le paraiméadair '
            'a stóráil.',
        pros: [
          'Dlúth agus oiriúnach don phóca',
          'Inríomhchláraithe, le leabharlann foirmlí',
          'Ionchur ailgéabrach aitheanta, céimeanna/nóiméid/soicindí',
          'Luach ar airgead an-mhaith',
        ],
        cons: [
          'San Eoraip, ní bhíonn sé ar fáil ach trí allmhairiú de ghnáth',
          'Dílseánach — níl aon léargas ar an gcód',
          'Gan aschur bonn a dó dhéag',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Croílár Free42 (GPL-2.0) · RPN · préimhe',
        blurb:
            'Áireamhán RPN suaitheanta agus ómós don HP-42S, i gcás cruach '
            'dhosmálta múnlaithe CNC le USB-C. Is é croílár ríomhaireachta an '
            'gléis Free42 foinse-oscailte Thomas Okken le huimhríocht decimal-128 '
            '(34 digit).',
        pros: [
          'Croílár ríomhaireachta oscailte (Free42, GPL) — is féidir an t-iompar a staidéar',
          'Comhionann leis an inneall deisce/móibíleach, cláir iniompartha',
          'Cruinneas iontach (34 digit deachúil)',
          'Tógtha cosúil le oidhreacht, stóras mais USB-C',
        ],
        cons: [
          'RPN amháin — teastaíonn cleachtadh',
          'Praghas préimhe, deacair a fháil ó am go chéile',
          'Feidhmeanna BASE gan bonn a dó dhéag',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Dílseánach · eolaíoch (buiséad)',
        blurb:
            'An ClassWiz reatha, neamh-inríomhchláraithe — an rogha saor, '
            'forleathan do gach duine nach bhfuil inríomhchláraitheacht ag teastáil uaidh.',
        pros: [
          'Saor agus ar fáil beagnach i ngach áit',
          'Taispeáint nádúrtha, raon feidhme fairsing',
          'Dlúth, láidir',
        ],
        cons: [
          'Ní inríomhchláraithe',
          'Dílseánach',
          'Níos moille go sonrach ar oibríochtaí casta',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'Conclúid: is é an fx-5800P an rogha réasúnach — inríomhchláraithe, '
        'dlúth, ionchur aitheanta. Is é an DM42n an píosa díograiseora le croílár '
        'oscailte (ach RPN éigeantach agus praghas préimhe). Leid: bain triail as '
        'RPN saor in aisce le Free42/Plus42 sula gceannaítear an crua-earraí.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Don úsáid laethúil ar an bhfón. Seo na haipeanna is láidre atá ar '
        'fáil go rialta trí Google Play — leanann na roghanna foinse-oscailte '
        'amháin sa chaibidil seo a leanas (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Dílseánach · CAS & graif',
        blurb:
            'Áireamhán eolaíoch le ailgéabar siombalach, graif, cothromóidí, '
            'agus díorthaigh agus comhshuimeanna. Úsáidtear go forleathan é, '
            'cothabháiltear go gníomhach é, le leaganacha do mhéideanna scáileáin '
            'éagsúla.',
        pros: [
          'Raon feidhme mór (CAS, graif, líon digit ard)',
          'Taispeáint codánach agus deachúlach tréimhsiúil',
          'Cothabháiltear go gníomhach, leaganacha inoiriúnaithe',
        ],
        cons: [
          'Dílseánach — níl aon luach foghlama do thionscadail féin',
          'Raon feidhme iomlán íoctha',
          'Gan aschur bonn a dó dhéag',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Athchur iomlán den HP-42S gan cód HP ar bith. Leathnaonn Plus42 é '
            'le cothromóidí ailgéabracha agus réiteoir, ag laghdú bacainne '
            'iontráil RPN go suntasach.',
        pros: [
          'Foinse oscailte (GPL), cód mar ábhar foghlama',
          'Comhionann ar fud gach ardán — cláir iniompartha',
          'Cruinneas decimal-128',
          'Plus42 le cothromóidí ailgéabracha',
        ],
        cons: [
          'Loighic RPN (maolann Plus42 é sin)',
          'Feidhmeanna BASE gan bonn a dó dhéag',
          'Íoctha ar mhóibíl (saor ar dheisce)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'Conclúid: HiPER Calc Pro mar uirlis laethúil is láidre ón Play Store; '
        'Free42/Plus42 mar rian RPN foinse-oscailte le decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Aipeanna foinse-oscailte amháin ón siopa F-Droid (nó díreach ón '
        'bhforbróir): cód sofheicthe, gan rianairí — agus mar sin ábhar '
        'foghlama agus tagartha do thionscadail féin.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & aonaid',
        blurb:
            'Comhéadan Android oifigiúil inneall Qalculate!: Kotlin/Java-UI os '
            'cionn na leabharlainne dúchais C++ libqalculate. Ríomhaireacht '
            'shiombalach, cruinneas roghnach, uimhríocht eatraimh, ríomhanna '
            'aonaid — an t-inneall is cumhachtaí sa réimse.',
        pros: [
          'Foinse oscailte (GPL), inneall is cumhachtaí (CAS, aonaid, cruinneas)',
          'Ríomhann freisin i mbonn a dó dhéag (dáréagúil) — an t-aon cheann anseo',
          'Ailtireacht theagascach: Kotlin-UI os cionn croíláir dhúchasaigh',
          'Gan rianairí',
        ],
        cons: [
          'Faightear é go príomha trí F-Droid nó tógáil dhíreach',
          'Diúltaíonn an tionscadal fíorú forbróra Google — níl sé cinnte '
              'go mbeidh sé in-suiteáilte trí chainéil ghnátha sa todhchaí '
              '(ní fadhb trí F-Droid)',
          'Bacainn iontrála níos airde ná áireamhán simplí',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Áireamhán caol, cothabhálta, scríofa go hiomlán i Kotlin. Ní '
            'seaimpín gnéithe é, ach tá an cód inléite agus achomair — suntasach '
            'an t-athrú doiciméadaithe ó Double go BigDecimal mar uimhreacha '
            'inmheánacha, díreach an cheist chruinnis a chaithfidh áireamhán '
            'bonn a dó dhéag a réiteach freisin.',
        pros: [
          'Foinse oscailte (GPL-3.0), cód Kotlin glan',
          'Réad foghlama agus tagartha idéalach',
          'Stair, comhéadan simplí, gan rianairí',
        ],
        cons: [
          'Gan CAS, gan inríomhchláraitheacht',
          'Ó thaobh feidhmiúlachta, ní iomaíonn sé le HiPER/Qalculate',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'Conclúid: is é Qalculate! an rogha foinse-oscailte is cumhachtaí — '
        'agus an t-aon cheann le haschur bonn a dó dhéag. Is é OpenCalc an '
        '"breathnú isteach sa mheaisín" do fhorbróirí.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'Is é iOS an t-ardán is laige d’áireamháin foinse-oscailte — ach '
        'tá uirlis dhílseánach shuntasach amháin ann. Le bheith macánta: '
        'tá iomaíocht fhíor FOSS in easnamh.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Dílseánach · uirlis tagartha',
        blurb:
            'Meastar é mar thagart ar ardáin Apple ó na 1990í: tiontuithe '
            'fairsinge, ionchur RPN den scoth, inoiriúnaitheacht dhomhain '
            '(téamaí, leaganacha eochrach, téip pháipéir). Ritheann sé ar '
            'iPhone, iPad, Apple Watch agus Apple TV.',
        pros: [
          'Uirlis den scoth, an-aibí',
          'Mód RPN roghnach, stair ineagarthóireachta',
          'Tiontuithe agus tairisigh iomadúla',
          'Leagan Lite saor chun tosú',
        ],
        cons: [
          'Dílseánach — gan luach foghlama',
          'Íoctha',
          'Féadann an iomarca gnéithe a bheith ró-mhór ar dtús',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Dúnann sé an bhearna foinse-oscailte ar iOS: tá Free42 saor '
            'ar an App Store agus úsáideann sé an t-inneall céanna le gach '
            'ardán eile.',
        pros: [
          'Foinse oscailte (GPL), Free42 saor',
          'Comhionann ar fud gach ardán',
          'Cruinneas decimal-128',
          'Plus42 le cothromóidí ailgéabracha',
        ],
        cons: [
          'Loighic RPN (maolann Plus42 é sin)',
          'Gan bonn a dó dhéag',
          'Plus42 íoctha',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclúid: PCalc mar phríomhuirlis (gan iomaíocht dháiríre FOSS ar iOS), '
        'Free42/Plus42 mar mholadh foinse-oscailte agus bealach glan isteach i RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Ar an Mac, buaileann an uirlis dhúchais is fearr leis an inneall '
        'oscailte is cumhachtaí — is fiú roinnt oibre: obair thapa méarchláir '
        'anseo, obair chruinn agus shiombalach ansiúd.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · inneall is cumhachtaí',
        blurb:
            'Cumhacht deisce (freisin do Windows agus Linux): siombalach, '
            'cruinneas roghnach, ríomhanna aonaid, plótáil. In-suiteáilte trí '
            'Homebrew; iompraíonn an CLI "qalc" go comhionann le Linux.',
        pros: [
          'Foinse oscailte, inneall is cumhachtaí (CAS, aonaid, codáin chruinne)',
          'Ríomhann freisin i mbonn a dó dhéag (dáréagúil)',
          'Inleathnaigh le feidhmeanna féin, CLI inscriptáilte',
        ],
        cons: [
          'Níos lú "Mac-dhúchasach" slíoctha ná PCalc',
          'Teastaíonn cleachtadh lena chumhacht a úsáid',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Dílseánach · cáilíocht dhúchasach Mac',
        blurb:
            'Na láidreachtaí céanna le iOS, i bhfeidhlím Mac slíoctha: '
            'inoiriúnaitheacht dhomhain agus "Magic Variables" chun nathanna '
            'a athúsáid, chomh maith le Handoff idir gléasanna Apple.',
        pros: [
          'Feidhlím Mac dhúchasach, an-aibí',
          'RPN, téip pháipéir, tiontuithe iomadúla',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Dílseánach, íoctha',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Ar fáil do macOS freisin — saor ar an deisce. An t-inneall '
            'céanna le croílár ríomhaireachta chrua-earraí an DM42.',
        pros: [
          'Foinse oscailte (GPL), saor ar an deisce',
          'Cruinneas decimal-128',
          'Comhionann ar fud gach ardán',
        ],
        cons: [
          'Loighic RPN',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclúid: PCalc don úsáid thapa méarchláir, Qalculate! d’obair '
        'chruinn agus shiombalach (agus bonn a dó dhéag). Mar speisialtóirí ar '
        'imeall: Numi (ionchur teanga nádúrtha) agus Soulver (ríomhaireacht '
        'blocshnota).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Ar Linux tá an scéal soiléir — rialaíonn inneall amháin, agus is '
        'é an fíorcheist "GUI nó teirminéal?". Do ghnátháireamháin '
        'caighdeánacha tá na clasaicigh deisce ann chomh maith.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · gan iomaíocht',
        blurb:
            'Comhéadain GTK agus Qt móide an CLI "qalc". Raon iomlán '
            'libqalculate: siombalach, cruinneas roghnach, iomadú éiginnteachais, '
            'plótáil. Tá "qalc" inscriptáilte (nath mar argóint nó ó '
            'chomhad) agus pacáistithe i ngach dáileadh mór.',
        pros: [
          'Foinse oscailte, ar fáil i ngach dáileadh',
          'Inneall is cumhachtaí, ríomhann freisin i mbonn a dó dhéag',
          'CLI inscriptáilte — ailíosanna, píopaí, leabharlanna feidhme féin',
        ],
        cons: [
          'Teastaíonn foghlaim leis an raon feidhme a mhaistiú',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · caighdeán KDE',
        blurb:
            'Áireamhán KDE le móid eolaíoch agus ríomhchláraitheora '
            'agus leaganacha eochrach inoiriúnaithe — bunuirlisí daingne.',
        pros: [
          'Foinse oscailte, éadrom',
          'Mód ríomhchláraitheora (bin/oct/hex)',
          'Comhtháite go maith i KDE Plasma',
        ],
        cons: [
          'Gan CAS',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · caighdeán GNOME',
        blurb:
            'Áireamhán caighdeánach GNOME le haonaid agus airgeadraí '
            'agus móid fhairsinge, airgeadais agus ríomhchláraithe. '
            'Níos laige ó thaobh feidhmiúlachta ná Qalculate, ach '
            'daingean go hiomlán.',
        pros: [
          'Foinse oscailte, éasca a úsáid',
          'Aonaid agus airgeadraí ionsuite',
        ],
        cons: [
          'Níos laige ná Qalculate',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · forbairt ina codladh',
        blurb:
            'An leide inmheánach fadó: ionchur tapa, méarclár-lárnaithe le '
            'aibhsiú comhréire agus uathchríochnú, cruinneas ard, '
            'athróga cosúil le scarbhileog. Cobhsaí — ach gan leagan nua '
            'le blianta.',
        pros: [
          'Foinse oscailte, ionchur méarchláir an-tapa',
          'Cruinneas ard, iniompartha gan suiteáil',
        ],
        cons: [
          'Forbairt ina codladh — gan todhchaí',
          'Sáraíodh go feidhmiúil é ag Qalculate',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'Conclúid: Qalculate!/qalc gan iomaíocht dháiríre — is é an rogha i '
        'ndáiríre ná GUI in aghaidh sreafaí oibre teirminéil. KCalc agus '
        'GNOME Calculator mar ghnátháireamháin éadroma; SpeedCrunch úsáidtear, '
        'ach gan todhchaí.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Ar Windows tá an iomaíocht gann — seasann inneall amháin amach, '
        'maraon leis an gcás neamhchoitianta de thagart ceadúnaithe go '
        'cead-réidh ar féidir leat (murab ionann agus GPL) a chód a '
        'athúsáid gan castachtaí dlíthiúla.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · buaiteoir soiléir',
        blurb:
            'Tógálacha Windows oifigiúla (qalculate-qt) leis an inneall '
            'cumhachtach céanna le Mac agus Linux: siombalach, cruinneas '
            'roghnach, aonaid, plótáil.',
        pros: [
          'Foinse oscailte, inneall is cumhachtaí',
          'Ríomhann freisin i mbonn a dó dhéag (dáréagúil)',
          'Inleathnaigh le feidhmeanna féin',
        ],
        cons: [
          'Níos lú "Windows-dhúchasach" slíoctha',
          'Teastaíonn cleachtadh lena chumhacht a úsáid',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Áireamhán Windows (Microsoft)',
        tag: 'MIT · réamhshuiteáilte',
        blurb:
            'Foinse oscailte ar GitHub ó 2019 — agus faoin gceadúnas MIT. '
            'Sin an cás neamhchoitianta de cheadúnas ceadúnach sa réimse '
            'agus mar sin an tagart cód is simplí ó thaobh dlí (C++/C#). '
            'Tairgeann mód ríomhchláraitheora le bin/oct/hex.',
        pros: [
          'Foinse oscailte faoi MIT — athúsáid chóid simplithe ó thaobh dlí',
          'Réamhshuiteáilte agus aitheanta',
          'Mód ríomhchláraitheora (bin/oct/hex)',
        ],
        cons: [
          'Gan CAS, gan inríomhchláraitheacht',
          'Cruinneas teoranta',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · forbairt ina codladh',
        blurb:
            'Ionchur tapa, méarclár-lárnaithe le aibhsiú comhréire agus '
            'uathchríochnú, cruinneas ard, iniompartha gan suiteáil — '
            'ach gan leagan nua le blianta.',
        pros: [
          'Foinse oscailte, ionchur méarchláir an-tapa',
          'Cruinneas ard, iniompartha',
        ],
        cons: [
          'Forbairt ina codladh — gan todhchaí',
          'Sáraíodh go feidhmiúil é ag Qalculate',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Do lucht leanúna RPN: saor ar an deisce, an t-inneall céanna '
            'le croílár ríomhaireachta chrua-earraí an DM42.',
        pros: [
          'Foinse oscailte (GPL), saor ar an deisce',
          'Cruinneas decimal-128',
          'Comhionann ar fud gach ardán',
        ],
        cons: [
          'Loighic RPN (maolann Plus42 é sin)',
          'Gan bonn a dó dhéag',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'Conclúid: Qalculate! mar rogha shoiléir. An t-Áireamhán Windows a '
        'choinneáil i gcuimhne mar thagart cóid faoi MIT, SpeedCrunch le '
        'rabhadh cothabhála amháin, Free42/Plus42 do lucht leanúna RPN.',
  ),
];
