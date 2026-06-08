part of '../math_theory.dart';

List<ProseChapter> _mathChaptersCy() => const [
  ProseChapter('Rhanyddion, ffracsiynau a chyfnodau', [
    ProseSection(
      'Pam mae Deuddeg mor rhanadwy',
      'Mewn bôn Deuddeg rydyn ni\'n ysgrifennu deuddeg digid: 0 i 9, ynghyd ag A ar gyfer Deg '
          'a B ar gyfer Un ar ddeg. Felly mae „10" yma\'n golygu Deuddeg.\n\n'
          'Gellir rhannu Deuddeg yn lân â llawer iawn o rifau: 1, '
          '2, 3, 4, 6 a 12. Ond dim ond â 1, 2, 5 a 10 y gellir rhannu Deg. Mae\'r '
          'rheswm yng nghynllun y rhifau: Deg yw dwy waith pump, Deuddeg '
          'yw dwy waith dwy waith tri. Mae Deuddeg yn rhoi ei flociau adeiladu yn y '
          'rhanyddion bach, cyffredin 2 a 3 — ac felly mae\'n rhanadwy â 3 ac '
          'â 4, lle mae Deg yn methu. Nid yw maint yn cyfrif: '
          'mae 16 yn fwy, ond dim ond â phwerau dau y gellir ei rannu.',
    ),
    ProseSection(
      'Pa ffracsiynau sy\'n dod allan yn lân',
      'Mae a yw ffracsiwn yn rhoi degolyn meidraidd yn dibynnu ar reol syml: '
          'mae\'n dod allan yn lân yn union pan fo\'r enwadur yn cynnwys '
          'ffactorau cysefin y bôn yn unig.\n\n'
          'Gan fod Tri yn rhan o Ddeuddeg, daw llawer o ffracsiynau bob dydd yn '
          'lân ym môn Deuddeg: hanner = 0,6; traean = 0,4; chwarter '
          '= 0,3; chweched = 0,2; nawfed = 0,14; deuddegfed = 0,1. '
          'Ym môn Deg, ar y llaw arall, mae traean, chweched a nawfed yn '
          'rhedeg yn ddiddiwedd. Pris Deuddeg: daw ffracsiynau â Phump yn yr '
          'enwadur yn anwastad — mae pumed ym môn Deuddeg yn 0,2497, gydag ailadrodd.',
    ),
    ProseSection(
      'Pan fo\'n ailadrodd',
      'Os nad yw ffracsiwn yn dod allan yn lân, mae grŵp penodol o ddigidau\'n '
          'ailadrodd o ryw safle ymlaen — y cyfnod. Mae ei hyd yn dilyn rheol '
          'eglur o ddamcaniaeth rhifau ac yn dibynnu ar y bôn a\'r enwadur.\n\n'
          'Mae rhai pethau yr un mor lletchwith yn y ddau fyd: mae gan '
          'seithfed gyfnod chwe-digid ym môn Deg (0,142857) yn ogystal ag ym '
          'môn Deuddeg (0,186A35). Ar y cyfan, ymhlith yr enwaduron bach, mae '
          'ychydig yn llai o ffracsiynau cyfnodol ym môn Deuddeg nag ym môn Deg '
          '— ond gall y cyfnodau, pan fyddant yn ymddangos, fod ychydig yn hwy.',
    ),
    ProseSection(
      'Rhanadwyedd ar un cipolwg',
      'Yn ymarferol, daw cryfder Deuddeg i\'r amlwg yn y rheolau rhanadwyedd. '
          'Mewn bôn Deuddeg, mae\'r digid olaf eisoes yn datgelu a yw rhif yn '
          'rhanadwy â 2, 3, 4 neu 6. Ym môn Deg, dim ond ar gyfer 2, '
          '5 a 10 y mae hynny\'n gweithio.\n\n'
          'Ar gyfer Un ar ddeg (B) mae rheol swm-digidau — yn union fel y '
          'prawf naw cyfarwydd ym môn Deg, am fod Deuddeg un yn fwy nag Un ar '
          'ddeg. Dim ond Saith sydd, fel ym môn Deg hefyd, heb brawf syml.',
    ),
    ProseSection(
      'Does dim un bôn yn ennill ym mhob man',
      'Felly mae gan Ddeuddeg fantais wirioneddol wrth dreio a chwarteru — '
          'ac anfantais wirioneddol wrth bumio, sy\'n bwysig ar gyfer canrannau '
          'ac arian. Mae\'n cyfnewid y naill am y llall.\n\n'
          'Nid yw mwy o ranyddion bob amser yn well: fel arall byddai '
          'Trigain ar y blaen, gan ei fod yn rhanadwy â hyd yn oed mwy o rifau — '
          'ond byddai angen trigain digid arno a thabl lluosi enfawr. Mae\'r '
          'cymdeithasau deuddegol yn gweld Deuddeg fel cyfaddawd da: dim ond '
          'dau symbol ychwanegol, tabl lluosi bach, ond y rhanyddion 2, 3 a '
          '4. Dyna eu pwyso a mesur nhw, nid prawf.',
    ),
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('Y bonau rhif o\'u cymharu', [
    ProseSection(
      'Beth yw bôn',
      'Mae system werth-safle yn rhoi gwerth i bob digid yn ôl ei safle. '
          'Mae\'r bôn yn dweud faint o ddigidau sydd a chan ba ffactor y mae '
          'pob safle\'n tyfu. Mae bôn Deg yn defnyddio deg digid, bôn '
          'Deuddeg ddeuddeg (0–9, A, B), bôn Dau ddim ond dau (0 ac 1).\n\n'
          'Mae\'r un rhif yn edrych yn wahanol yn ôl y bôn, ond mae\'n golygu\'r un peth. '
          'Mae angen llawer o safleoedd ar fôn bach (mae deuaidd yn mynd yn hir iawn), '
          'a llawer o symbolau gwahanol ar fôn mawr.',
    ),
    ProseSection(
      'Chwe bôn ar fyr',
      '• Bôn 2 (deuaidd): iaith cyfrifiaduron — mae swits naill ai ymlaen '
          'neu i ffwrdd.\n'
          '• Bôn 8 (wythaidd): cilfach heddiw, er enghraifft ar gyfer hawliau ffeil dan '
          'Unix.\n'
          '• Bôn 10 (degol): ein bywyd bob dydd a\'r system fetrig.\n'
          '• Bôn 12 (deuddegol): dwsin, cloc a modfedd — a chenadwri\'r '
          'mudiad deuddegol.\n'
          '• Bôn 16 (hecsadegol): nodiant cryno ar gyfer '
          'data cyfrifiadurol.\n'
          '• Bôn 60 (chwedegol): amser ac onglau, etifeddiaeth Babilon.',
    ),
    ProseSection(
      'Trosi rhwng y bonau',
      'Mae rhifau\'n symud o un bôn i\'r llall yn ôl gweithdrefnau penodol. '
          'Rhennir y rhan gyfan dro ar ôl tro â\'r bôn targed a darllen y '
          'gweddillion o\'r gwaelod i\'r brig. Lluosir y rhan ddegol dro ar ôl '
          'tro â\'r bôn targed a darllen y rhannau cyfan o\'r brig i\'r '
          'gwaelod.\n\n'
          'Enghraifft: daw 0,5 ym môn Deuddeg yn 0,6; daw 0,125 yn 0,16. '
          'Rhwng bonau perthynol mae\'n haws fyth: am fod Un ar bymtheg yn '
          'bŵer o Ddau, mae un digid hecs yn cyfateb i union bedwar safle '
          'deuaidd — does dim ond angen grwpio.',
    ),
    ProseSection(
      'Lle mae pob bôn gartref',
      'Mae cyfrifiaduron yn cyfrifo\'n ddeuaidd, am mai dim ond dau gyflwr y '
          'mae transistor yn eu hadnabod. Hecsadegol yw\'r llawfer hwylus ar '
          'gyfer hynny — mae\'n bresennol mewn cyfeiriadau cof, lliwiau gwe fel '
          '#FF00FF a rhifau Unicode. Mae amser ac onglau\'n dilyn Trigain: '
          'trigain munud, 360 gradd, hawdd eu rhannu\'n drioedd a chwarteri. '
          'Mae bywyd bob dydd a bron y wyddoniaeth gyfan yn rhedeg yn ddegol — '
          'yn bennaf o arfer ac am fod y system fetrig wedi\'i hadeiladu ar '
          'hynny.\n\n'
          'Mae Deuddeg yn parhau i fyw mewn dwsin, gros, cloc a modfedd. Ers y '
          '18fed ganrif bu eiriolwyr dros gyfrifo deuddegol go iawn — '
          'o Buffon trwy Isaac Pitman hyd at Frank Emerson Andrews, a '
          'ysgrifennodd y llyfr cyntaf am y peth ym 1935. Mae cymdeithasau '
          'eu hunain yn meithrin y syniad hyd heddiw; mwy am hyn yn y bloc „Y '
          'Gymdeithas Ddeuddegol".',
    ),
    ProseSection(
      'Nid oes un bôn yn orau ym mhob man',
      'Mae gan bob bôn ei ddiben. Nid yw Dau na Un ar bymtheg yn „well i '
          'fodau dynol", ond yn ddelfrydol ar gyfer peiriannau. Mae Deg yn '
          'gyfarwydd ac wedi\'i wreiddio\'n ddwfn. Mae Deuddeg yn rhannu\'n '
          'hyfryd yn drioedd a chwarteri, ond mae\'n colli ar y pumed. Mae '
          'Trigain yn rhannu orau, ond gyda thrigain symbol mae\'n rhy fawr ar '
          'gyfer bywyd bob dydd.\n\n'
          'Gyda systemau mesur, yr hyn sy\'n cyfrif yn y pen draw yw nid y bôn '
          'ei hun gymaint â\'r cysondeb wrth gadw at un bôn yn unig: mae\'r '
          'system fetrig yn ennill am fod popeth yn rhedeg trwy\'r un Deg — ni '
          'fyddai gan system gymysg o filltir, llath, troedfedd a modfedd y '
          'fantais honno mewn unrhyw fôn.',
    ),
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('Hanes byr y systemau gwerth-safle', [
    ProseSection(
      'Cyn y gwerth-safle',
      'Am amser hir, ysgrifennwyd rhifau trwy adio symbolau at ei gilydd. Mae\'r '
          'rhifolion Rhufeinig yn system felly: mae XVII yn golygu deg plws pump plws un '
          'plws un. Mae hynny\'n dda i\'w ddarllen, ond yn drafferthus i gyfrifo, ac mae '
          'rhifau mawr yn mynd yn lletchwith.\n\n'
          'Y naid fawr oedd y system werth-safle: mae\'r un digid yn '
          'golygu rhywbeth gwahanol yn ôl ei safle. Dim ond hynny sy\'n gwneud '
          'cyfrifo ysgrifenedig â rhifau o unrhyw faint yn hawdd — ac mae\'n '
          'gofyn am ddigid ar gyfer „dim byd yn y safle hwn": y sero.',
    ),
    ProseSection(
      'Babilon a\'r Trigain',
      'Cododd y system werth-safle wirioneddol gyntaf gyda\'r Sumeriaid a\'r '
          'Babiloniaid, dros bedair mil o flynyddoedd yn ôl, ym môn Trigain. '
          'Fe\'i hystyrir yn un o\'u campau mathemategol mwyaf.\n\n'
          'Ond nid oedd ganddynt sero llawn eto: roeddent yn adnabod symbol '
          'deiliad-lle ar gyfer safleoedd gwag yn y canol, ond byth ar '
          'ddiwedd rhif. Mae eu hetifeddiaeth yn ein cyd-deithio hyd heddiw — '
          'yn nhrigain munud yr awr a 360 gradd y cylch.',
    ),
    ProseSection(
      'Dyfais Indiaidd y sero',
      'Daw\'r system ddegol gyfredol gyda\'r sero o India. Defnyddiodd '
          'Aryabhata y nodiant safle yn y 5ed ganrif; trafododd Brahmagupta y sero '
          'am y tro cyntaf yn 628 fel rhif ei hun â\'i reolau cyfrifo ei hun, '
          'nid dim ond fel bwlch.\n\n'
          'Oddi yno cymerodd ysgolheigion Arabaidd a Phersaidd ef — '
          'ysgrifennodd al-Khwarizmi amdano tua 825 —, a thrwyddynt hwy '
          'cyrhaeddodd Ewrop. Dyna pam y gelwir ein digidau hyd heddiw\'n '
          '„rifolion Arabaidd", er bod y syniad yn tarddu o India.',
    ),
    ProseSection(
      'Bonau\'r peiriannau',
      'Gyda\'r peiriannau cyfrifo daeth bonau newydd. Cyhoeddodd Gottfried '
          'Wilhelm Leibniz y system ddeuaidd o ddim ond 0 ac 1 ym 1703 — '
          'gwelodd ynddi hyd yn oed hen hecsagramau\'r I Ching Tsieineaidd '
          'eto.\n\n'
          'Heddiw mae cyfrifiaduron yn cyfrifo\'n ddeuaidd, ond fel arfer yn '
          'ei ysgrifennu\'n hecsadegol: gyda beit 8-did yr IBM System/360 yn y '
          '1960au, ymsefydlodd bôn Un ar bymtheg, am fod dau ddigid hecs yn '
          'rhoi union un beit. Felly cafodd pob bôn ei le — nid am ei fod „yr '
          'orau", ond am ei fod yn gweddu i\'w dasg.',
    ),
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
  ProseChapter('Sut mae\'r cyfrifiannell hwn yn cyfrifo', [
    ProseSection(
      'Dau gyfrifiannell mewn un',
      'Pan wasgi di\'r fysell hafal, nid yw\'r ap yn cyfrifo unwaith, '
          'ond ddwywaith — â dau beiriant cwbl wahanol.\n\n'
          'Y cyntaf yw cyfrifiannell ffracsiwn manwl gywir. Mae\'n cyfrifo heb '
          'unrhyw dalgrynnu, â rhifau cyfan o unrhyw faint. Yr ail yw '
          'cyfrifiannell degol cyflym, fel sydd gan bron bob cyfrifiannell '
          'poced — mae\'n cyfrifo â chywirdeb cyfyngedig, ond â phopeth, '
          'gan gynnwys sin, isradd a logarithm. Mae\'r ddau\'n cychwyn ar bob '
          'arwydd hafal.',
    ),
    ProseSection(
      'Y ffracsiwn manwl gywir',
      'Mae\'r cyfrifiannell ffracsiwn yn dal rhifau fel cymhareb dau rif cyfan. '
          'Mae traean yn aros yn draean go iawn, nid 0,333… Dim ond ar gyfer yr '
          'arddangosfa y mae\'n troi\'r ffracsiwn yn ddegolion deuddegol.\n\n'
          'Wrth wneud hynny mae\'n adnabod pan fydd y degolion yn ailadrodd. Mae '
          'traean ym môn Deuddeg yn lân 0,4. Ond mae pumed yn rhedeg yn '
          'gyfnodol: 0,2497 2497 2497 … Mae\'r ap yn dangos hynny â llinell '
          'dros y grŵp sy\'n ailadrodd a phwynt sy\'n nodi dechrau\'r cyfnod. '
          'Felly mae\'r canlyniad yn aros yn fanwl gywir, yn hytrach na chael '
          'ei dalgrynnu\'n dawel.',
    ),
    ProseSection(
      'Pan nad yw\'r ffracsiwn yn ddigon',
      'Ni ellir ysgrifennu rhai cyfrifiadau fel ffracsiwn. Cyn gynted ag y '
          'bydd sin, isradd, logarithm neu ffwythiant tebyg yn ymddangos — '
          'neu rannu â sero —, mae\'r cyfrifiannell ffracsiwn yn rhoi\'r ffidil '
          'yn y to.\n\n'
          'Yna mae\'r cyfrifiannell degol yn camu i\'r adwy. Dim ond '
          'bras-amcanol yw ei ganlyniad, felly mae\'r ap yn gosod arwydd „≈" o\'i '
          'flaen: „tua". Os yw\'r ddwy ffordd yn gweithio, mae\'r ffracsiwn '
          'manwl gywir bob amser yn ennill. Felly nid yw\'r „≈" yn ymddangos '
          'ond lle bo gwir angen brasamcan.',
    ),
    ProseSection(
      'Cyfnodau hir a\'r arddangosfa',
      'Gall canlyniadau manwl gywir fynd yn hir iawn. Mae gan rai ffracsiynau '
          'gyfnodau o dros gant o safleoedd — llawer mwy nag a ffit ar un '
          'llinell.\n\n'
          'Er mwyn i ddim redeg allan o\'r arddangosfa, mae\'r ap yn gadael '
          'allan o\'r dde gymaint o\'r safleoedd olaf (lleiaf arwyddocaol) nes '
          'bod y gweddill yn ffitio ar y llinell, ac yn gosod „…" fel arwydd '
          'fod mwy i ddod. Caiff marc y cyfnod ei dalfyrru\'n daclus gyda hynny. '
          'Felly mae\'r rhif yn aros yn onest: mae\'r hyn sydd wedi\'i dorri i '
          'ffwrdd yn cael ei ddangos yn weladwy, nid ei guddio.',
    ),
  ]),
];
