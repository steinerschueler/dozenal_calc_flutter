part of '../math_theory.dart';

List<ProseChapter> _mathChaptersCy() => const [
  ProseChapter(
    'Rhanyddion, ffracsiynau a chyfnodau',
    [
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
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2',
        'A1',
      ),
      Source(
        'Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html',
        'R1',
        'A2',
      ),
      Source(
        'Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Y bonau rhif o\'u cymharu',
    [
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
    ],
    sources: [
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Octal — Wikipedia',
        'https://en.wikipedia.org/wiki/Octal',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Hanes byr y systemau gwerth-safle',
    [
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
    ],
    sources: [
      Source(
        'Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2',
        'A2',
      ),
      Source(
        'Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number',
        'R3',
        'A2',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360',
        'R2',
        'A2',
      ),
    ],
  ),
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
  ProseChapter(
    'Fibonacci, rhifau sgwâr a chwreinion',
    [
      ProseSection(
        '144 — lle mae dau fyd yn cyfarfod',
        'Mae dilyniant Fibonacci yn dechrau gydag 1, 1, a phob rhif sy’n '
            'dilyn yw swm y ddau flaenorol: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Mae’n tyfu’n esponyddol — mae’r aelodau’n mynd yn fawr '
            'iawn yn gyflym. Mae’r rhifau sgwâr 1, 4, 9, 16, 25, 36, … ond yn '
            'tyfu’n sgwaraidd, felly lawer yn arafach. Nid oes bron unrhyw '
            'reswm i ddwy ddilyniant sy’n tyfu mor wahanol gyfarfod erioed.\n\n'
            'Ac eto maent: y deuddegfed rhif Fibonacci yw 144, a '
            '144 = 12² yw rhif sgwâr. Rydym yn ysgrifennu’r aelod hwn yn fyr '
            'F₁₂ = 144. Yn sail 12, mae 144 hefyd yn „100“, y rhif tair-digid '
            'cyntaf, ac yn y fasnach y gros — dwsin o ddwsinau. Mae tair '
            'priodwedd yn cyd-daro mewn un rhif unigol.\n\n'
            'Mae’r ffaith nad cyd-ddigwyddiad yn unig yw hyn, ond achos unigryw, '
            'wedi ei brofi gan J. H. E. Cohn yn 1964: heblaw 0, 1 a 144, nid '
            'oes unrhyw rif arall yn y dilyniant Fibonacci diderfyn cyfan sy’n '
            'rhif sgwâr ar yr un pryd. Mae ei brawf yn elfennol ond nid yn hawdd; '
            'mae’n defnyddio’r dilyniant Lucas sy’n agos gysylltiedig a '
            'dadleuon rhanadwyedd. Mae’r deuddeg felly ar groesffordd brofiedig, '
            'unigryw o ddwy ddilyniant rifol sylfaenol — arbenigrwydd, nid '
            'cyfrinaeth.\n\n'
            'Mae theorem gryfach fyth o 2006 (Bugeaud, Mignotte a Siksek) yn '
            'mynd ymhellach: yr unig bwerau perffaith o gwbl yn y dilyniant '
            'Fibonacci yw 0, 1, 8 = 2³ a 144 = 12². Achos arbennig y theorem '
            'honno yw honiad Cohn am y rhifau sgwâr.',
      ),
      ProseSection(
        'Y Gymhareb Aur',
        'O rannu rhif Fibonacci â’i ragflaenydd, mae’r cymarebau hyn yn '
            'nesáu fwyfwy at rif sefydlog: y Gymhareb Aur φ = (1+√5)/2 ≈ 1.618. '
            'Yn ffurfiol F(n+1)/F(n) → φ. Sylwodd Johannes Kepler ar y '
            'nesâd hwn eisoes yn 1611. Yn sail 12 mae '
            'φ ≈ 1.74BB677…; mae’r cyfrifiannell yn cario φ fel cysonyn yn y '
            'maes estyniad.\n\n'
            'φ sydd â phriodwedd ddiffinniol syml: φ² = φ + 1. Dyma’r unig rif '
            'positif y mae ei sgwâr yn union 1 yn fwy nag ef ei hun. Os '
            'teipiwch φ² = yn y cyfrifiannell, cewch φ + 1 yn union — mae’r '
            'hunaniaeth yn weladwy ar unwaith.\n\n'
            'Yn y byd naturiol mae φ yn ymddangos mewn gwirionedd lle mae '
            'dail a hadau yn tyfu ar yr „Ongl Aur“; mae niferoedd troellog '
            'blodau haul neu gonau pinwydd wedyn yn aml yn rhifau Fibonacci '
            'cyfagos. Ond nid yw llawer o’r hyn a briodolir i φ yn dal '
            'dan brawf: nid yw troell y nawtilos yn dilyn φ, ac nid yw '
            'unrhyw ddefnydd bwriadol ym Mharthenon na da Vinci wedi ei brofi. '
            'Mae φ yn wir mewn mathemateg ac mewn trefn dail — nid ym '
            'mhobman.',
      ),
      ProseSection(
        'Y deuddeg fel rhif cymhlethdodol uchel',
        'Mae damcaniaeth rhifau yn adnabod sawl ffordd union o ddisgrifio '
            'rhif fel „un â llawer o ranyddion“ — ac mae’r deuddeg yn ymddangos '
            'mewn rhai ohonynt. Mae deuddeg yn „uchel gymhlethdodol“: mae ganddo '
            'fwy o ranyddion na’r un rhif llai. Ei ranyddion yw 1, 2, 3, 4, 6, '
            '12 — chwech ohonynt; nid oes gan unrhyw rif o dan 12 gynifer. '
            'Astudiodd Srinivasa Ramanujan y dosbarth hwn yn 1915 mewn papur '
            'enwog yn Nhrafodion Cymdeithas Fathemateg Llundain.\n\n'
            'Yn ogystal, deuddeg yw’r rhif amdaniol lleiaf: mae swm ei '
            'ranyddion priodol, 1+2+3+4+6 = 16, yn rhagori ar y rhif ei hun. '
            'Ar gyfer rhifau llai mae’r gwrthwyneb yn wir — ar gyfer 10 mae '
            '1+2+5 = 8, llai na 10. Deuddeg yw’r rhif cyntaf lle mae’r '
            'ranyddion yn „gorlenwi“.\n\n'
            'Priodwedd arafach: mae deuddeg yn rhif aruchel. Mae hynny’n '
            'golygu bod dau fesur allweddol o’i ranyddion eu hunain yn rhifau '
            'perffaith. Y nifer o ranyddion yw 6 (ac mae 6 = 1+2+3 yn berffaith). '
            'Swm pob rhanydd yw 1+2+3+4+6+12 = 28 (ac mae 28 = 1+2+4+7+14 '
            'hefyd yn berffaith). Hyd heddiw dim ond dau rif aruchel sy’n '
            'hysbys — y deuddeg a rhif 76-digid. Ond mae’r term wedi dod o '
            'fathemateg hamdden ac wedi ei adeiladu’n gul; felly nid yw ei '
            'brinder yn brawf o arwyddocâd cosmig, ond yn ganlyniad diffiniad '
            'arbennig.',
      ),
      ProseSection(
        'Pyramid o beli canon',
        'Wrth bentyrru peli canon i byramid â sylfaen sgwâr, mae’r n-fed '
            'byramid yn cynnwys 1² + 2² + … + n² o beli. Cafodd Thomas Harriot '
            'y fformwla swm hon tua 1587, pan oedd Syr Walter Raleigh yn '
            'dymuno gwybod sut i gyfrif peli pentyrrog.\n\n'
            'Cwestiwn anoddach yw: pryd y mae pyramid o’r fath yr un pryd yn '
            'sgwâr perffaith o beli? Dim ond un achos anhryfiol sydd, ac mae’n '
            'brydferth: '
            '1² + 2² + … + 24² = 4900 = 70². Gellir gosod yr un 4900 o beli '
            'felly fel pyramid â 24 haen neu fel sgwâr 70×70. Amheuaeth Lucas '
            'yn 1875 oedd mai hon yw’r unig ateb; ni phrofwyd hi’n llawn tan '
            '1918 gan G. N. Watson — roedd y broblem yn wirioneddol anodd.\n\n'
            'Yr union ddwbl yw’r rhif 24 o 12. Mae hwn yn arsylwad del — ond '
            'yn onest nid rheswm wedi ei brofi: ymddengys y 24 yma am fod yr '
            'hafaliad sylfaenol yn union yn cael yr ateb hwn, nid o achos '
            'cysylltiad â sail deuddeg.',
      ),
      ProseSection(
        'Dinas ddelfrydol Platon',
        'Yn ei „Deddfau“ (Llyfr V) mae Platon yn gofyn faint o ddinasyddion '
            'y dylai dinas ddelfrydol fod. Ei ateb: 5040. Nid cyfriniol yw’r '
            'ddadl, ond ymarferol — mae’n rhaid i ddinas rannu ei dinasyddion '
            'yn grwpiau cyfartal yn barhaus, a gellir rhannu 5040 â phob rhif '
            'o 1 i 12, ar wahân i 11 yn unig. (Ar gyfer rhaniad â 11 mae Platon '
            'yn awgrymu tynnu dwy deulu.)\n\n'
            'Yr hyn y mae Platon yn ei ddisgrifio yma yw’r un mewnwelediad '
            'sy’n sail i’r system ddeuddegol: yn y bywyd bob dydd, y rhannyddion '
            'bach yw’r rhai pwysig. Mae 5040 = 7! rywsut yn chwaer fawr i’r '
            'deuddeg — yr un athroniaeth rhanadwyedd, wedi ei gymhwyso at '
            'boblogaeth dinas gyfan yn lle system rifau.',
      ),
      ProseSection(
        'Nid numerolog yw cwreinrwydd',
        'Mae’r deuddeg yn cario llawer o labelau ar yr un pryd: uchel '
            'gymhlethdodol, amdaniol, aruchel, mynegai’r unig rif Fibonacci '
            'sgwâr anhryfiol. Mae’r crynhoad hwn yn ymddangos yn drawiadol — '
            'ond mae pob priodwedd yn ddiffiniad annibynnol ar wahân. Nid yw eu '
            'cydymddangosiad yn achos na symbol o rywbeth uwch. Yr hyn sy’n '
            'wirioneddol yn gosod y deuddeg ar wahân yw ei fychander: y lleiaf '
            'yw’r rhif cyntaf â’r priodweddau hyn; mae rhifau mwy fel 24, 36 '
            'neu 60 hyd yn oed yn cael mwy o ranyddion.\n\n'
            'Mae camgymeriad cyffredin yn haeddu ei nodi’n glir: caiff y '
            'deuddeg ei alw’n aml yn „rhif perffaith“. Mae hynny’n fathemategol '
            'anghywir. Perffaith yw’r golygu: mae swm y ranyddion priodol yn '
            'rhoi’r rhif ei hun — fel gyda 6 (1+2+3) neu 28 (1+2+4+7+14). '
            'Gyda’r deuddeg mae’r ranyddion priodol yn rhoi 16, felly mwy na '
            '12. Mae’r deuddeg yn amdaniol, nid perffaith. Mae’r dryswch yn '
            'mynd yn ôl i Nicomachus o Gerasa (tua 100 OC), a oedd yn cysylltu’r '
            'dosbarthiadau rhifau hyn â gwerthoedd moesol — dehongliad yr '
            'Henfyd, nid mathemateg.\n\n'
            'Mae gwerth y bennod hon yn union yn y gwahanu hwn: mae theorem '
            'Cohn, hunaniaeth y bêl canon a’r rhif amdaniol lleiaf yn '
            'ffeithiau wedi eu profi. Maent yn haeddu cael eu gweld am yr hyn '
            'ydynt — mathemateg brydferth, onest, sy’n dod ymlaen heb unrhyw '
            'drydan cyfriniol.',
      ),
    ],
    sources: [
      Source(
        'Square Fibonacci Numbers, Etc. (J. H. E. Cohn, 1964)',
        'https://math.la.asu.edu/~checkman/SquareFibonacci.html',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci and Lucas perfect powers (Bugeaud, Mignotte, Siksek, 2006) — Annals of Mathematics',
        'https://annals.math.princeton.edu/2006/163-3/p05',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci sequence — Wikipedia',
        'https://en.wikipedia.org/wiki/Fibonacci_sequence',
        'R2',
        'A1',
      ),
      Source(
        'Cannonball problem — Wikipedia',
        'https://en.wikipedia.org/wiki/Cannonball_problem',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Abundant number — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundant_number',
        'R2',
        'A1',
      ),
      Source(
        'Sublime number — Wikipedia',
        'https://en.wikipedia.org/wiki/Sublime_number',
        'R2',
        'A1',
      ),
      Source(
        '5040 (number) — Wikipedia',
        'https://en.wikipedia.org/wiki/5040_(number)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Y Deuddegoch (Dodecagon)',
    [
      ProseSection(
        'Beth yw deuddegoch rheolaidd',
        'Deuddegoch rheolaidd (Groeg Dodecagon: dōdeka = deuddeg, '
            'gōnía = ongl) yw polygon â deuddeg ochr o’r un hyd a '
            'deuddeg ongl fewnol o’r un maint. Mae’r deuddeg fertig yn '
            'gorwedd wedi eu gwasgaru’n gyfartal ar gylch, y cylch amgylch, '
            'pob un 30° oddi wrth ei gilydd.\n\n'
            'Mae pob ongl fewnol yn mesur 150° yn union. Mae hynny’n dilyn o '
            'ystyriaeth syml: wrth gerdded unwaith o amgylch y ffigur cyfan, '
            'trowch 360° ar y cyfan yn y deuddeg cornel, sef 30° yr un. Mae’r '
            'ongl allanol hon a’r ongl fewnol yn cydadio i 180°, felly mae '
            '180° − 30° = 150° yn weddill. Yn y system ddeuddegol ysgrifennir '
            '150° fel 106°, yr ongl allanol 30° fel 26°. Mae pob ongl sy’n '
            'ymddangos yn y deuddegoch yn lluosrifau o 15° — deuddegol 13°.\n\n'
            'Mae’r deuddegoch ymhlith y siapiau y gellir eu llunio’n fanwl '
            'gywir â chwmpawd a phren mesur. Mae’r ffordd yn fyr: taro cylch, '
            'rhannu’n chwe rhan gyfartal (llwyddir â’r cwmpawd yn unig, am '
            'fod ochr y hecsagon yn union hafal i’r radiws), yna haneru pob '
            'un o’r chwe bwa — dyna ddeuddeg pwynt wedi eu rhannu’n gyfartal. '
            'Nid yw’r ffaith bod hyn yn gweithio yn ddamweiniol: mae polygon '
            'rheolaidd n-ochrog yn adeiladwy os a dim ond os yw n yn cynnwys '
            'pŵer o ddau a gwahanol rif cysefin Fermat (theorem Gauss a '
            'Wantzel). Ar gyfer 12 = 2² × 3 mae’r amod hwn wedi ei ddiwallu, '
            'am fod 3 yn rhif o’r fath.',
      ),
      ProseSection(
        'Tair polygon yn rhannu’r corneli',
        'Yr hyn sy’n nodedig am y deuddegoch yw llai ei ffurf ei hun na’r '
            'hyn sy’n llechu ynddi. O gysylltu dim ond bob yn ail gornel, '
            'ffurfir hecsagon rheolaidd. Mae pob trydydd cornel yn rhoi sgwâr, '
            'a’r pedwerydd bob yn un yn rhoi triongl hafalochrog — y tri yn '
            'union, nid brasamcan, a’r tri ar yr un cylch amgylch â’r '
            'deuddegoch ei hun.\n\n'
            'Mae rheol gyffredinol yn gorwedd y tu ôl i hyn: mae polygon '
            'rheolaidd m-ochr yn ffitio’n union â’r un pwyntiau cornel mewn '
            'polygon n-ochr pan fo m yn rhannu n; mae rhywun wedyn yn cysylltu '
            'pob (n/m)-fed cornel. Mae hecsagon, sgwâr a thriongl yn llechu yn '
            'y deuddegoch am fod 12 yn rhanadwy â 6, 4 a 3. A 12 yw’r rhif '
            'lleiaf sy’n rhanadwy â 3, 4 a 6 ar yr un pryd — eu lluosrif '
            'cyffredin lleiaf. Felly’r deuddegoch yw’r polygon rheolaidd '
            'lleiaf sy’n cynnwys y tair ffurf sylfaenol hynny ar y cyd; ni '
            'all pentagon, octagon na decagon wneud hynny.\n\n'
            'Yr un rhanadwyedd yn union yw sy’n gwneud y system ddeuddegol '
            'mor ddymunol. Gan fod 12 yn rhannu â 2, 3, 4 a 6, mae’r tair '
            'polygon geometregol yn cyd-daro mewn deuddegoch — a’r ffracsiynau '
            'hanner, traean, chwarter a chweched yn ffracsiynau deuddegol byr, '
            'llyfn yn rifyddegol. Mae ffurf a chyfrifo ffracsiynau yn rhannu’r '
            'un gwreiddyn.',
      ),
      ProseSection(
        'Pedair croeslin ar hugain a deg, chwe hyd',
        'Mae croeslin yn cysylltu dau gornel nad ydynt yn ymylol. Mae’r '
            'fformwla n(n−3)/2 yn rhoi i’r deuddegoch 12 × 9 / 2 = 54 '
            'croeslin. Mae hynny’n ymddangos yn annhrefnus, ond mae’n '
            'drefnus yn llym: am fod y deuddegoch mor gymesur, mae pob croeslin '
            'sy’n neidio’r un nifer o gorneli yr un hyd. Ceir pum pellter '
            'naid a’r diamedr hefyd — dim ond chwe hyd gwahanol felly. Gydag '
            'ochr o hyd 1:\n\n'
            'd₂ yn neidio un cornel ac yn mesur √(2+√3) ≈ 1.932. d₃ yn neidio '
            'dau gornel, 1+√3 ≈ 2.732. d₄ yn neidio tair cornel, (3√2+√6)/2 ≈ '
            '3.346. d₅ yn neidio pedwar cornel, 2+√3 ≈ 3.732. d₆ yn y diwedd '
            'yn cysylltu corneli cyferbyn — y diamedr yw hwn, √6+√2 ≈ 3.864.\n\n'
            'Cuddiwyd patrymau clir yn y gwerthoedd hyn. Mae’r bumed a’r '
            'drydedd croeslin yn wahanol i’w gilydd o union hyd yr ochr: '
            '(2+√3) − (1+√3) = 1. A’r diamedr yn union ddwywaith hyd y '
            'groeslin fyrraf, d₆ = 2 · d₂ — yr un gymhareb 2:1 â’r octif '
            'mewn cerddoriaeth. Mae pob ongl rhwng y croesliniau eto’n '
            'lluosrifau o 15°, oherwydd mae’r deuddeg cornel yn rhannu’r '
            'cylch llawn yn gamau o 30°.',
      ),
      ProseSection(
        'Y arwynebedd a’r „Tri Crwn“',
        'Er mwyn dod o hyd i’r arwynebedd, mae rhywun yn torri’r deuddegoch '
            'o’r canol yn ddeuddeg triongl cyfartal, main. Mae gan bob un ddau '
            'goes o hyd R — radiws y cylch amgylch, y pellter o’r canol i '
            'gornel — ac yn y brig yr ongl 30°. Wrth gyfrifo’r deuddeg triongl '
            'gyda’i gilydd, mae rhywbeth hardd yn dod i’r amlwg:\n\n'
            'A = 3 · R².\n\n'
            'Tri llyfn, cyfan yw’r ffactor, heb unrhyw israddyn. Mae hynny’n '
            'llwyddo am fod sin(30°) = hanner yn ymddangos yn y cyfrifiad, a '
            '30° yn union yw ongl gornel y deuddegoch. Ymhlith y polygonau y '
            'gellir eu llunio â chwmpawd a phren mesur, dyma’r unig un mwy '
            'y mae ei fformwla arwynebedd yn terfynu mor lyfn; gyda’r '
            'hecsagon er enghraifft mae israddyn yn aros. Wrth gyfrifo gydag '
            'ochr o hyd s, yr arwynebedd yw A = 3(2+√3)·s² ≈ 11.196·s².\n\n'
            'O gymharu’r arwynebedd â’r cylch amgylch, sydd â arwynebedd '
            'π·R², mae R² yn canslo a dim ond 3/π ≈ 0.9549 yn weddill. '
            'Mae’r deuddegoch felly’n llenwi tua 95.5% o’i gylch amgylch — '
            'llawer mwy na hecsagon (tua 83%), sgwâr (tua 64%) neu driongl '
            '(tua 41%). Yn lle’r rhif cylch creigiog π mae’r tri crwn yma: '
            'gyda R = 1, arwynebedd y deuddegoch yw union 3 ac felly ychydig '
            'o dan π ≈ 3.1416.\n\n'
            'Defnyddiodd Archimedes y nesâd hwn eisoes. Nesodd π drwy '
            'bolygonau, gan ddechrau gyda’r hecsagon sy’n hawdd ei lunio ac '
            'yn dyblu’r nifer o gorneli: 6, 12, 24, 48, 96. Y deuddegoch oedd '
            'ei gam cyntaf. Roedd y polygon 96-ochr — yn ddeuddegol 12 × 8 — '
            'eisoes yn llenwi’r cylch 99.93% ac yn rhoi iddo 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Ble mae’r deuddegoch yn ymddangos fel ffurf',
        'Mae’r deuddeg marc awr ar gloc analog yn ffurfio deuddegoch '
            'rheolaidd: deuddeg pwynt ar bellter 30° ar y cylch. Gan fod y '
            'cylch llawn yn 360° = 12 × 30° a’r diwrnod ddwywaith deuddeg awr, '
            'mae hwnnw’r un raster 30° â phwyntiau cwmpawd ar gyfer deuddeg '
            'cyfeiriad.\n\n'
            'Bathwyd darnau arian deuddegochrog mewn sawl gwlad — yn bennaf er '
            'mwyn eu hadnabod wrth gyffwrdd yn wahanol i ddarnau crwn. Y '
            '„Threepence“ pres Prydeinig (o 1937 ymlaen) oedd y darn nad '
            'yw’n grwn cyntaf i fod mewn cylchrediad ym Mhrydain; cyflwynwyd '
            'y darn punt deuddegochrog (o 2017) yn erbyn ffugwaith ac fe’i '
            'luniwyd yn fwriadol ar yr un patrwm. Yn wahanol i’r hyn a '
            'honnir weithiau, nid oes gan ddarnau o’r fath led cyson — mae’r '
            'priodwedd honno gan ddarnau saith-ochr Prydeinig o 20 a 50 ceiniog, '
            'nad ydynt yn ddeuddegochau.\n\n'
            'Nid yw’r deuddegoch yn teilio’r plân ar ei ben ei hun: nid yw '
            '150° yn rhannu’n union yn 360°. Ond gyda pholygonau eraill gall '
            'wneud hynny — gyda thrionglau er enghraifft neu gyda sgwariau '
            'a hecsagonau, lle mae’r onglau yn adio i 360° ym mhob cornel. '
            'Mae patrymau deuddegol o’r fath yn ffurfio sylfaen addurniadaeth '
            'geometreg Islamaidd. Sut y cyrhaeddodd y deuddeg y tu hwnt i hynny '
            'mewn adeiladu ac yn y celfyddydau, mae’r bennod „Y Deuddeg mewn '
            'Pensaernïaeth“ yn trafod hynny.',
      ),
      ProseSection(
        'Geometreg, nid rhifeg gyfriniol',
        'Mae priodweddau’r deuddegoch yn ffeithiau mathemategol go iawn, '
            'nid cyfrinachau. Mae’r ffaith bod yr arwynebedd mewn cymhareb '
            '3/π â’r cylch amgylch yn dilyn o reidrwydd o sin(30°) = hanner; '
            'mae’n dangos ond bod y deuddegoch yn nesu’n dda at y cylch, ac '
            'nid yw’n creu cysylltiad dirgel rhwng y tri a π. Yn yr un '
            'modd, mae’r tri syml yn „Arwynebedd = 3·R²“ yn ganlyniad yr '
            'ongl gornel, nid rhyfeddod.\n\n'
            'Mae’r theorem „A = 3·R²“ hefyd yn gofyn am y ddarlleniad '
            'cywir: mae’r tri llyfn yn berthnasol i’r radiws amgylch. Gydag '
            'ochr o hyd 1 tua 11.2 yw’r arwynebedd, nid 3. A chyda’r '
            'croesliniau mae manwl gywirdeb yn talu — mae’r bedwaredd yn '
            '(3√2+√6)/2 ≈ 3.346, nid mynegiant israddyn symlach; ceir '
            'gwerthoedd anghywir yn cylchredeg yn rhai ffynonellau.\n\n'
            'Yn olaf, mae adeiladwraeth hawdd yn dweud ond bod y ffurf yn codi '
            'gyda’r offer symlaf. Mae’n esbonio’n dda pam y mae deuddegochau '
            'mor gyffredin mewn creft, ar ddarnau arian ac yn yr addurnwaith. '
            'Ond pam y mae gan y cloc ddeuddeg awr, cwestiwn traddodiad yw, '
            'nid geometreg. Mae’r deuddegoch yn offeryn geometregol prydferth '
            '— a dim mwy na hynny y dylid ei briodoli iddo.',
      ),
    ],
    sources: [
      Source(
        'Dodecagon — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Constructible polygon — Wikipedia',
        'https://en.wikipedia.org/wiki/Constructible_polygon',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagon (12-gon) calculator and formulas — RedCrab Software',
        'https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Area of a Dodecagon — Alison Kiddle',
        'https://alisonkiddle.co.uk/area-of-a-dodecagon/',
        'R3',
        'A1',
      ),
      Source(
        'Getting Closer to π: Inscribing and Circumscribing Polygons — Univ. Alberta',
        'https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf',
        'R3',
        'A1',
      ),
      Source(
        'Archimedes on the Circumference and Area of a Circle — AMS Feature Column',
        'https://www.ams.org/publicoutreach/feature-column/fc-2012-02',
        'R2',
        'A1',
      ),
      Source(
        'Brass threepence — Wikipedia',
        'https://en.wikipedia.org/wiki/Brass_threepence',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagonal coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagonal_coin',
        'R2',
        'A1',
      ),
    ],
    imageId: 'math/dodekagon',
  ),
  ProseChapter(
    'Y Dodecahedron',
    [
      ProseSection(
        'Deuddeg pentagon yn y gofod',
        'Y dodecahedron (Groeg dōdeka = deuddeg, hédra = wyneb) yw corff o '
            'ddeuddeg pentagon rheolaidd hafal. Mae pob wyneb yn unffurf, pob '
            'ymyl yr un hyd, ac yn union tair pentagon yn cwrdd ym mhob cornel. '
            'Wrth gyfrif mae hynny’n rhoi deuddeg wyneb, deg ar hugain o ymylon '
            'ac ugain cornel.\n\n'
            'Mae’n un o’r pum solid Platonaidd — y cyrff cyfan y mae eu '
            'hwynebau’n cynnwys polygon rheolaidd cyfwerth yn unig, ac â’r un '
            'nifer o wynebau yn cwrdd ym mhob cornel. Y pedwar arall yw’r '
            'tetrahedron (pedwar triongl), y ciwb (chwe sgwâr), yr octahedron '
            '(wyth triongl) a’r icosahedron (ugain triongl). Ymhlith y pump, '
            'y dodecahedron yw’r unig un â wynebau pentagon.\n\n'
            'Yn gryno, enw’r dodecahedron yw {5, 3}: pentagonau fel wynebau, '
            'tair ohonynt ym mhob cornel. Mae’r ongl rhwng dau wyneb cyfagos '
            'tua 116.57° (degol). O’i gymharu: gyda’r ciwb mae’n 90°.',
      ),
      ProseSection(
        'Pam y mae union bump ohonynt',
        'Mae’r ffaith nad oes ond pump o’r cyrff hynny — dim mwy a dim llai '
            '— yn ganlyniad wedi ei brofi. Mae dwy ffordd yn arwain ato, a’r '
            'ddwy’n cyrraedd yr un casgliad.\n\n'
            'Y ffordd gyntaf yw cyfrifiad syml, theorem polyhedron Euler: ar '
            'gyfer pob corff cyfan mae corneli minws ymylon plws wynebau yn '
            'hafal i ddau. Ar gyfer y dodecahedron: 20 − 30 + 12 = 2. '
            'Nododd Leonhard Euler y berthynas hon tua 1750; rhoddodd Cauchy '
            'y prawf di-fwlch cyntaf yn 1811. Mae’r fformwla’n berthnasol '
            'i bob corff cyfan amhloc, i bob pyramid, pob prism. Wrth ei '
            'cyfuno â’r gofyniad bod yr wynebau’n bolygonau rheolaidd '
            'cyfwerth, dim ond pum ateb sy’n aros.\n\n'
            'Mae’r ail ffordd yn fwy gweladwy ac yn edrych ar un cornel. '
            'Ongl fewnol pentagon rheolaidd yw 108°. Pan fo tair pentagon yn '
            'cwrdd mewn cornel, mae eu honcglau’n adio i 324°. Y 36° '
            'coll hyd at y cylch llawn yw union y bwlch sy’n plygu tuag at '
            'y gofod — dyna sut y mae cornel y dodecahedron yn ffurfio. '
            'Byddai pedair pentagon eisoes yn rhoi 432° ac ni fyddent yn '
            'ffitio mewn cornel. Felly tair pentagon yw’r unig bosibilrwydd, '
            'a’r dodecahedron yw’r unig gorff â wynebau pentagon.',
      ),
      ProseSection(
        'Y Gymhareb Aur yn y pentagon ac yn y corff',
        'Mae pob wyneb o’r dodecahedron yn bentagon rheolaidd — a’r pentagon '
            'yw’r lleoliad plân symlaf lle mae’r Gymhareb Aur '
            'φ = (1+√5)/2 ≈ 1.618 yn ymddangos fel cymhareb hyd. Mae '
            'croeslin pentagon rheolaidd yn union φ gwaith hyd ei ochr. Os '
            'teipiwch φ² = yn y cyfrifiannell, cewch φ+1 — dyna hafaliad '
            'diffinniol y Gymhareb Aur.\n\n'
            'Am fod pob wyneb yn cario’r gymhareb hon, mae φ yn treiddio '
            'drwy’r corff cyfan. Wrth osod y dodecahedron mewn system '
            'cyfesuryn, mae φ yn ymddangos yn llythrennol yn rhifau ei ugain '
            'cornel. Mae wyth o’r corneli hyn ar eu pennau eu hunain yn '
            'ffurfio ciwb; gellir amgylchysgrifennu pump ciwb gwahanol yn y '
            'dodecahedron i gyd. Mae pwyntiau cornel eraill yn ymestyn tair '
            'petryal euraid — petryelau â chymhareb ochrau φ i un — sy’n '
            'sefyll yn berpendicwlar i’w gilydd fesul dwy.\n\n'
            'Nid swyngyfaredd sy’n dod â φ yma, ond angenrheidrwydd: '
            'lle mae pentagonau rheolaidd, mae φ yno. Mae’r dehongliadau '
            'pellach o’r Gymhareb Aur fel „proportiwn ddwyfol“ yn '
            'briodoliadau dynol, nid priodwedd y geometreg ei hun.',
      ),
      ProseSection(
        'Deuoliaeth a’r cymesuredd cyfoethocaf',
        'Mae i bob solid Platonaidd gorff deuol: mae rhywun yn gosod cornel '
            'newydd yng nghanol pob wyneb ac yn cysylltu corneli’r wynebau '
            'cyfagos. Gyda’r dodecahedron daw’r icosahedron i’r amlwg — a '
            'vice versa. Yn hynny mae wynebau a chorneli’n cyfnewid lle: '
            'mae gan y dodecahedron 12 wyneb ac 20 cornel, gan yr icosahedron '
            '20 wyneb a 12 cornel. Mae’r nifer ymylon, 30, yr un yn y ddau. '
            'Mae’r deuddeg yn ymddangos yn y ddau — unwaith fel nifer wynebau, '
            'unwaith fel nifer corneli.\n\n'
            'Am eu bod yn rhannu’r un adeilad, mae ganddynt hefyd yr un '
            'cymesuredd — a dyma’r cyfoethocaf ymhlith yr holl solidau '
            'Platonaidd: 120 cymesuredd, sef 60 cylchdro a 60 '
            'adlewyrchiad-cylchdro. Dim ond 48 sydd gan y ciwb, 24 gan y '
            'tetrahedron. Mae’r 60 cylchdro wedi eu dosbarthu ar chwe echel '
            'pum-blyg drwy ganolau wynebau cyferbyn, deg echel tair-blyg drwy '
            'gorneli cyferbyn a phymtheg echel dwy-blyg drwy ganolau ymylon '
            'cyferbyn.\n\n'
            'Gellir ysgrifennu’r rhif 120 fel 5! (5 × 4 × 3 × 2 × 1) a’i '
            'rannu’n ffactorau cysefin 2, 3 a 5 — yr un tair rhif sy’n '
            'ailymddangos yn yr echelau ac yn ffurf y wyneb pentagon. Yr '
            'echelau pum-blyg hyn yw hefyd y rheswm pam na all unrhyw grisial '
            'cyffredin ffurfio dodecahedron gwir: ni all rhwyll gyfnodol '
            'gynnwys cymesuredd pump '
            '(gweler y bennod am byrit).',
      ),
      ProseSection(
        'Deuddeg Euler: pam deuddeg pentagon bob amser',
        'Mae un canlyniad olaf yn cysylltu’r dodecahedron â phethau sy’n '
            'ymddangos i ddechrau nad oes ganddynt unrhyw beth i’w wneud ag '
            'ef. Y cwestiwn yw: a ellir adeiladu plisgyn caeedig, sfferig o '
            'hecsagonau rheolaidd yn unig? Yr ateb yw na. Mae hecsagonau pur '
            'yn rhoi arwyneb fflat; i’w blygu’n sffêr, rhaid adeiladu union '
            'ddeuddeg pentagon — ni waeth faint o hecsagonau eraill y '
            'defnyddir.\n\n'
            'Mae hynny’n dilyn eto o theorem Euler. Gyda dim hecsagonau daw’r '
            'dodecahedron rheolaidd. Gyda deuddeg pentagon ac ugain hecsagon '
            'daw’r pêl-droed glasurol — a dyma le mae camsyniad cyffredin: '
            'nid dodecahedron yw’r bêl-droed. Icosahedron wedi ei docio yw '
            'hi â 32 wyneb, sef deuddeg pentagon ac ugain hecsagon. Dim ond y '
            'deuddeg pentagon sy’n gyffredin rhyngddynt; ond nid oes gan y '
            'dodecahedron unrhyw hecsagon o gwbl.\n\n'
            'Y dodecahedron rheolaidd felly yw achos puraf y '
            'deuddeg-blygrwydd: deuddeg pentagon a dim arall.',
      ),
      ProseSection(
        'Dis, deuddegoch a phyritohedron — yr hyn nad yw',
        'Yn y gêmau rôl mae’r dodecahedron yn adnabyddus fel y D12, y '
            'dis deuddeg-ochrog. Am ei fod o’r pum corff agosaf at y sffêr, '
            'mae’n rholio’n esmwyth ac yn ymestyn yn ddibynadwy ar wyneb; '
            'mae ei ddeuddeg wyneb hafal yn ei wneud yn deg.\n\n'
            'Mae tair cyfundeb yn haeddu eu hegluro. Yn gyntaf: nid y '
            'dodecahedron yw’r dodecagon. Mae’r ddau air yn cario „dedeka-“ '
            '(deuddeg), ond polygon fflat deuddeg-ochrog yw’r dodecagon, '
            'a chorff tri-dimensiwn â deuddeg wyneb yw’r dodecahedron. '
            'Yn ail: mae’r pyritohedron o’r mwyn pyrit hefyd â deuddeg '
            'wyneb pentagon, ond nid dodecahedron rheolaidd mohono — mae ei '
            'bentagonau’n ystumiedig, ac nid oes ganddo gymesuredd pum-blyg '
            'gwir (manylion yn y bennod am byrit). Yn drydydd, priodolodd '
            'Platon y dodecahedron i’r cosmos cyfan; dehongliad athronyddol '
            'hen yw hwnnw, nid canlyniad mathemategol. Mae geometreg y corff '
            'yn sefyll ar ei ben ei hun, yn gwbl annibynnol ar ba ystyr y '
            'mae pobl wedi ei roi iddo.',
      ),
    ],
    sources: [
      Source(
        'Regular dodecahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Regular_dodecahedron',
        'R2',
        'A1',
      ),
      Source(
        'Dodekaeder — Wikipedia (de)',
        'https://de.wikipedia.org/wiki/Dodekaeder',
        'R2',
        'A1',
      ),
      Source(
        'Platonic solid — Wikipedia',
        'https://en.wikipedia.org/wiki/Platonic_solid',
        'R2',
        'A1',
      ),
      Source(
        'Eulers Polyederformel — Plus Maths (Cambridge)',
        'https://plus.maths.org/content/eulers-polyhedron-formula',
        'R1',
        'A1',
      ),
      Source(
        'Platonic Solids: Why Five? — MathsIsFun',
        'https://www.mathsisfun.com/geometry/platonic-solids-why-five.html',
        'R1',
        'A1',
      ),
      Source(
        'Golden ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Golden_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Phi in 3D Geometry (Ron Knott) — University of Surrey',
        'https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html',
        'R2',
        'A1',
      ),
      Source(
        'Icosahedral symmetry — Wikipedia',
        'https://en.wikipedia.org/wiki/Icosahedral_symmetry',
        'R2',
        'A1',
      ),
      Source(
        'Truncated icosahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_icosahedron',
        'R2',
        'A1',
      ),
    ],
  ),
];
