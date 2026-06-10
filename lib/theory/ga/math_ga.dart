part of '../math_theory.dart';

List<ProseChapter> _mathChaptersGa() => const [
  ProseChapter(
    'Roinnteoirí, codáin agus tréimhsí',
    [
      ProseSection(
        'Cén fáth a bhfuil a Dó Dhéag chomh hinroinnte',
        'I mBonn a Dó Dhéag scríobhaimid dhá dhigit déag: 0 go 9, mar aon le A do '
            'Dheich agus B do Aon Déag. Ciallaíonn „10" anseo mar sin a Dó Dhéag.\n\n'
            'Is féidir a Dó Dhéag a roinnt go glan ar líon an-mhór uimhreacha: 1, '
            '2, 3, 4, 6 agus 12. Níl a Deich inroinnte ach ar 1, 2, 5 agus 10. Tá '
            'an chúis i ndéanamh na n-uimhreacha: is é a Deich dhá uair a cúig, is '
            'é a Dó Dhéag dhá uair dhá uair a trí. Cuireann a Dó Dhéag a chuid '
            'bunchlocha sna roinnteoirí beaga coitianta 2 agus 3 — agus dá bharr '
            'sin tá sé inroinnte ar 3 agus ar 4, rud a theipeann ar a Deich. Ní '
            'hé an mhéid is tábhachtaí: tá an 16 níos mó, ach níl sé inroinnte ach '
            'ar chumhachtaí de dhó.',
      ),
      ProseSection(
        'Cé na codáin a thagann amach go glan',
        'Cé acu an dtugann codán uimhir dheachúil chríochnaitheach nó nach '
            'dtugann, braitheann sé ar riail shimplí: tagann sé amach go glan go '
            'beacht nuair nach bhfuil san ainmneoir ach príomhfhachtóirí an '
            'bhoinn.\n\n'
            'Toisc go bhfuil a Trí istigh sa Dó Dhéag, tagann go leor codán '
            'laethúil amach go glan i mBonn a Dó Dhéag: leath = 0,6; trian = 0,4; '
            'ceathrú = 0,3; séú = 0,2; naoú = 0,14; an dóú cuid déag = 0,1. I '
            'mBonn a Deich, áfach, ritheann trian, séú agus naoú gan chríoch. '
            'Praghas an Dó Dhéag: bíonn codáin a bhfuil a Cúig san ainmneoir acu '
            'cam — is é cúigiú i mBonn a Dó Dhéag 0,2497, le hathrá.',
      ),
      ProseSection(
        'Nuair a athraítear é',
        'Mura dtagann codán amach go glan, athraítear grúpa seasta digití ó '
            'phointe áirithe ar aghaidh — an tréimhse. Leanann a fad riail '
            'shoiléir de chuid theoiric na n-uimhreacha agus braitheann sé ar an '
            'mbonn agus ar an ainmneoir.\n\n'
            'Tá rudaí áirithe chomh hachrannach céanna sa dá shaol: tá tréimhse '
            'sé dhigit ag seachtú i mBonn a Deich (0,142857) díreach mar atá i '
            'mBonn a Dó Dhéag (0,186A35). San iomlán tá beagáinín níos lú codán '
            'tréimhsiúil ann i measc na n-ainmneoirí beaga i mBonn a Dó Dhéag ná '
            'i mBonn a Deich — ach is féidir leis na tréimhsí, nuair a tharlaíonn '
            'siad, a bheith beagáinín níos faide.',
      ),
      ProseSection(
        'Inroinnteacht ar an toirt',
        'Go praiticiúil léirítear neart an Dó Dhéag sna rialacha '
            'inroinnteachta. An bhfuil uimhir inroinnte ar 2, 3, 4 nó 6, nochtann '
            'an digit deiridh é cheana i mBonn a Dó Dhéag. I mBonn a Deich ní '
            'oibríonn sé sin ach do 2, 5 agus 10.\n\n'
            'Don Aon Déag (B) tá riail suim-na-ndigití ann — díreach mar an '
            'tástáil aitheanta ar a naoi i mBonn a Deich, toisc go bhfuil a Dó '
            'Dhéag aon thar a hAon Déag. Níl ag a Seacht amháin, mar atá i mBonn '
            'a Deich freisin, aon tástáil shimplí.',
      ),
      ProseSection(
        'Ní bhuann aon bhonn i ngach áit',
        'Tá buntáiste fíor mar sin ag a Dó Dhéag agus tú ag roinnt ina dtrí agus '
            'ina cheathrú — agus míbhuntáiste fíor agus tú ag roinnt ina chúig, '
            'rud atá tábhachtach do chéatadáin agus d\'airgead. Malartaíonn sé '
            'ceann amháin ar an gceann eile.\n\n'
            'Ní hionann níos mó roinnteoirí agus níos fearr gan teorainn ach an '
            'oiread: mura mbeadh, bheadh buntáiste ag a Seasca, atá inroinnte ar '
            'fós níos mó uimhreacha — ach theastódh seasca digit uaidh agus tábla '
            'iolraithe ollmhór. Feiceann na cumainn dhuodaiseimeacha a Dó Dhéag '
            'mar bhealach maith meánach: gan ach dhá chomhartha sa bhreis, tábla '
            'iolraithe beag, ach na roinnteoirí 2, 3 agus 4. Sin a meá siúd, ní '
            'cruthúnas é.',
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
    'Na boinn uimhreacha i gcomparáid',
    [
      ProseSection(
        'Cad is bonn ann',
        'Tugann córas suíomhluacha luach do gach digit de réir a shuímh. '
            'Insíonn an bonn cé mhéad digit atá ann agus cén fachtóir a fhásann '
            'gach ionad. Úsáideann Bonn a Deich deich ndigit, Bonn a Dó Dhéag a '
            'dó dhéag (0–9, A, B), Bonn a Dó dhá cheann amháin (0 agus 1).\n\n'
            'Breathnaíonn an uimhir chéanna difriúil de réir an bhoinn, ach is é '
            'an rud céanna a chiallaíonn sé. Teastaíonn go leor ionad ó bhonn '
            'beag (éiríonn an dénártha an-fhada), agus go leor comharthaí '
            'difriúla ó bhonn mór.',
      ),
      ProseSection(
        'Sé bhonn faoi sheoid',
        '• Bonn 2 (dénártha): teanga na ríomhairí — tá lasc air nó as.\n'
            '• Bonn 8 (ochtnártha): nideoga inniu, mar shampla do chearta comhad '
            'faoi Unix.\n'
            '• Bonn 10 (deachúlach): ár saol laethúil agus an córas méadrach.\n'
            '• Bonn 12 (duodaiseimeach): dosaen, clog agus orlach — agus ábhar '
            'imní ghluaiseacht an Dó Dhéag.\n'
            '• Bonn 16 (heicseadaiseimeach): nodaireacht dhlúth do shonraí '
            'ríomhaire.\n'
            '• Bonn 60 (seascaiseimeach): am agus uillinn, oidhreacht na Bablóine.',
      ),
      ProseSection(
        'Tiontú idir na boinn',
        'Bogann uimhreacha de réir nósanna imeachta seasta ó bhonn amháin go '
            'bonn eile. An chuid iomlán, roinneann tú arís agus arís í ar an '
            'sprioc-bhonn agus léann tú na fuíll ó bhun go barr. An chuid '
            'dheachúlach, iolraíonn tú arís agus arís í faoin sprioc-bhonn agus '
            'léann tú na codanna iomlána ó bharr go bun.\n\n'
            'Sampla: éiríonn 0,5 ina 0,6 i mBonn a Dó Dhéag; éiríonn 0,125 ina '
            '0,16. Idir boinn ghaolmhara tá sé níos éasca fós: toisc gur cumhacht '
            'de dhó é a Sé Déag, freagraíonn digit heicse go díreach do cheithre '
            'ionad dhénártha — ní gá ach grúpáil a dhéanamh.',
      ),
      ProseSection(
        'Cén áit ina bhfuil baile ag gach bonn',
        'Ríomhann ríomhairí go dénártha, toisc nach n-aithníonn trasraitheoir ach '
            'dhá staid. Is é heicseadaiseimeach an ghiorrúchán áisiúil dó sin — '
            'tá sé i seoltaí cuimhne, i ndathanna gréasáin ar nós #FF00FF agus in '
            'uimhreacha Unicode. Leanann am agus uillinn an Seasca: seasca '
            'nóiméad, 360 céim, inroinnte go héasca ina dtrí agus ina cheathrú. '
            'Ritheann an saol laethúil agus beagnach an eolaíocht iomlán go '
            'deachúlach — go háirithe as nós agus toisc go bhfuil an córas '
            'méadrach tógtha air sin.\n\n'
            'Maireann a Dó Dhéag ar aghaidh i ndosaen, i ngrós, i gclog agus in '
            'orlach. Ón 18ú haois ar aghaidh bhí lucht tacaíochta ann do ríomh '
            'fíor-dhuodaiseimeach — ó Buffon trí Isaac Pitman go Frank Emerson '
            'Andrews, a scríobh an chéad leabhar faoi in 1935. Coinníonn cumainn '
            'dá gcuid féin an smaoineamh beo go dtí an lá inniu; tuilleadh faoi '
            'sin sa bhloc „An Cumann Duodaiseimeach".',
      ),
      ProseSection(
        'Níl aon bhonn ar fearr é i ngach áit',
        'Tá a chuspóir féin ag gach bonn. Níl a Dó agus a Sé Déag „níos fearr do '
            'dhaoine", ach idéalach do mheaisíní. Tá a Deich teann agus '
            'daingnithe go domhain. Roinneann a Dó Dhéag go deas ina dtrí agus '
            'ina cheathrú, ach cailleann sé ag an gcúigiú. Roinneann a Seasca is '
            'fearr ar fad, ach le seasca comhartha tá sé rómhór don saol '
            'laethúil.\n\n'
            'Le córais tomhais is lú a chuntasaíonn ar deireadh an bonn é féin ná '
            'an chomhsheasmhacht lena bhfantar ar bhonn aonair amháin: buann an '
            'córas méadrach toisc go ritheann gach rud ar an a Deich chéanna — ní '
            'bheadh an buntáiste sin ag córas measctha de mhíle, slat, troigh '
            'agus orlach in aon bhonn.',
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
    'Stair ghairid na gcóras suíomhluacha',
    [
      ProseSection(
        'Roimh an suíomhluach',
        'Le fada scríobhadh daoine uimhreacha trí chomharthaí a shuimiú le '
            'chéile. Is córas den sórt sin iad na huimhreacha Rómhánacha: '
            'ciallaíonn XVII deich móide a cúig móide a haon móide a haon. Tá sé '
            'sin go maith le léamh, ach maslach le ríomh, agus éiríonn uimhreacha '
            'móra achrannach.\n\n'
            'Ba é an córas suíomhluacha an léim mhór: ciallaíonn an digit céanna '
            'rud difriúil de réir a shuímh. Sin amháin a fhágann go bhfuil ríomh '
            'scríofa le huimhreacha chomh mór agus is mian leat éasca — agus '
            'éilíonn sé digit do „faic san ionad seo": an náid.',
      ),
      ProseSection(
        'An Bhablóin agus an Seasca',
        'Tháinig an chéad chóras suíomhluacha fíor chun cinn ag na Súiméirigh '
            'agus na Bablónaigh, breis is ceithre mhíle bliain ó shin, ar Bhonn a '
            'Seasca. Meastar gurb é an éacht matamaiticiúil is mó acu é.\n\n'
            'Ní raibh náid iomlán acu fós, áfach: bhí comhartha sealbhóra ionaid '
            'ar eolas acu d\'ionaid fholmha sa lár, ach riamh ag deireadh '
            'uimhreach. Gabhann a n-oidhreacht linn go dtí an lá inniu — i seasca '
            'nóiméad na huaire agus i 360 céim an chiorcail.',
      ),
      ProseSection(
        'Aireagán Indiach na náide',
        'Tagann córas na ndeicheanna an lae inniu leis an náid ón India. Bhain '
            'Aryabhata úsáid as an scríbhneoireacht shuíomhluacha sa 5ú haois; '
            'phléigh Brahmagupta in 628 an náid den chéad uair mar uimhir aici '
            'féin le rialacha ríofa dá cuid féin, ní amháin mar bhearna.\n\n'
            'Uaidh sin ghlac scoláirí Arabacha agus Peirseacha leis — scríobh '
            'al-Khwarizmi faoi thart ar 825 —, agus tríothu sin tháinig sé go dtí '
            'an Eoraip. Sin an fáth a dtugtar „uimhreacha Arabacha" ar ár '
            'ndigití go dtí an lá inniu, cé gur ón India a thagann an smaoineamh.',
      ),
      ProseSection(
        'Boinn na meaisíní',
        'Leis na meaisíní ríofa tháinig boinn nua. D\'fhoilsigh Gottfried Wilhelm '
            'Leibniz in 1703 an córas dénártha nach raibh ann ach 0 agus 1 — '
            'chonaic sé fiú na sean-heicseagraim de chuid an I Ching Síneach ann '
            'arís.\n\n'
            'Inniu ríomhann ríomhairí go dénártha, ach scríobhann siad é den '
            'chuid is mó go heicseadaiseimeach: leis an mbeart 8-ngiotán de chuid '
            'an IBM System/360 sna 1960idí tháinig Bonn a Sé Déag chun cinn, '
            'toisc go dtugann dhá dhigit heicse beart amháin go díreach. Fuair '
            'gach bonn a áit mar sin — ní toisc gurbh é „an ceann is fearr" é, '
            'ach toisc go n-oireann sé dá thasc.',
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
  ProseChapter('Conas a ríomhann an t-áireamhán seo', [
    ProseSection(
      'Dhá áireamhán in aon cheann',
      'Nuair a bhrúnn tú an eochair chothroime, ní ríomhann an aip uair amháin, '
          'ach dhá uair — le dhá mheaisín an-difriúla.\n\n'
          'Is áireamhán codán beacht an chéad cheann. Ríomhann sé gan aon '
          'slánú, le huimhreacha iomlána chomh mór agus is mian leat. Is '
          'áireamhán deachúil gasta an dara ceann, mar atá ag beagnach gach '
          'áireamhán póca — ríomhann sé le cruinneas teoranta, ach le gach rud, '
          'le síneas, fréamh agus logartam san áireamh. Ritheann an dá cheann '
          'ag gach comhartha cothroime.',
    ),
    ProseSection(
      'An codán beacht',
      'Coinníonn an t-áireamhán codán uimhreacha mar chóimheas idir dhá uimhir '
          'iomlán. Fanann trian ina thrian i ndáiríre, ní 0,333… Ní '
          'thiontaíonn sé an codán ina ionaid dheachúlacha dhuodaiseimeacha go '
          'dtí an taispeáint.\n\n'
          'Agus é sin á dhéanamh aithníonn sé nuair a athraítear na hionaid '
          'dheachúlacha. Tá trian glan 0,4 i mBonn a Dó Dhéag. Ritheann '
          'cúigiú, áfach, go tréimhsiúil: 0,2497 2497 2497 … Taispeánann an aip '
          'é sin le stríoc os cionn an ghrúpa a athraítear agus le pointe a '
          'mharcálann tús na tréimhse. Mar sin fanann an toradh beacht, in '
          'ionad é a shlánú go ciúin.',
    ),
    ProseSection(
      'Nuair nach leor an codán',
      'Ní féidir ríomhanna áirithe a scríobh mar chodán. Chomh luath agus a '
          'thagann síneas, fréamh, logartam nó feidhm den sórt sin chun cinn — '
          'nó a roinntear ar náid —, géilleann an t-áireamhán codán.\n\n'
          'Ansin léimeann an t-áireamhán deachúil isteach. Níl a thoradh ach '
          'neasach, agus dá bhrí sin cuireann an aip comhartha „≈" roimhe: '
          '„timpeall". Má oibríonn an dá bhealach, buann an codán beacht i '
          'gcónaí. Ní thagann an „≈" chun cinn mar sin ach san áit a bhfuil '
          'fíor-neas riachtanach.',
    ),
    ProseSection(
      'Tréimhsí fada agus an taispeáint',
      'Is féidir le torthaí beachta éirí an-fhada. Tá tréimhsí de bhreis is '
          'céad ionad ag codáin áirithe — i bhfad níos mó ná mar a oireann ar '
          'líne amháin.\n\n'
          'Ionas nach rithfidh aon rud thar an taispeáint, fágann an aip ón '
          'taobh deas as an oiread sin de na hionaid is faide siar (is ísle '
          'luach) go dtí go n-oireann an chuid eile sa líne, agus cuireann sí '
          '„…" mar chomhartha go bhfuil tuilleadh ann fós. Giorraítear marc na '
          'tréimhse go néata in éineacht leis sin. Fanann an uimhir macánta mar '
          'sin: an méid atá gearrtha, taispeántar go feiceálach é, ní '
          'cheiltear é.',
    ),
  ]),
  ProseChapter(
    'Fibonacci, Uimhreacha Cearnógacha agus Corais',
    [
      ProseSection(
        '144 — áit a gcasann dhá dhomhan',
        'Tosaíonn sraith Fibonacci le 1, 1, agus is é gach uimhir eile '
            'suim an dá cheann roimhe: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Fásann sí go heaspónantúil — éiríonn na baill '
            'an-mhór go tapa. Fásann na huimhreacha cearnógacha 1, 4, 9, '
            '16, 25, 36, … ar bhealach cearnógach amháin, i bhfad níos '
            'moille. Is beag cúis atá le dhá shraith ag fás chomh '
            'difriúil lena chéile casadh ar a chéile riamh.\n\n'
            'Agus casann siad: is é an dóú uimhir Fibonacci déag 144, agus '
            'is uimhir chearnógach í 144 = 12². Scríobhaimid an ball seo '
            'go gearr mar F₁₂ = 144. I mBonn 12 is é 144 "100" freisin, '
            'an chéad uimhir thrí-shuíomh, agus sa trádáil an ghrós — '
            'dosaen dosaen. Titid trí airíonna isteach in uimhir amháin '
            'anseo.\n\n'
            'Gur tarlú aonuaire, ní coinchidéans amháin é seo, chruthaigh '
            'J. H. E. Cohn in 1964: seachas 0, 1 agus 144 níl aon uimhir '
            'eile sa tsraith Fibonacci iomlán éigríochta ar uimhir '
            'chearnógach í freisin. Tá an cruthúnas bunúsach ach ní '
            'simplí; úsáideann sé an tsraith Lucas atá dlúth-ghaolmhar '
            'agus argóintí in-roinnte. Seasann an dó dhéag mar sin ag '
            'crosbhóthar cruthaithe, aonuaire de dhá shraith uimhreacha '
            'bunúsacha — cáilíocht, ní misticism.\n\n'
            'Téann tairiscint níos láidre ó 2006 (Bugeaud, Mignotte agus '
            'Siksek) níos faide: is iad 0, 1, 8 = 2³ agus 144 = 12² na '
            'cumhachtaí iomlána amháin sa tsraith Fibonacci ar chor ar bith. '
            'Is cás speisialta de sin ráiteas Cohn faoi na huimhreacha '
            'cearnógacha.',
      ),
      ProseSection(
        'An Cóimheas Órga',
        'Nuair a roinntear uimhir Fibonacci ar an gcéann roimpi, druidean '
            'na cóimheasa seo de réir a chéile le huimhir sheasta: an '
            'Cóimheas Órga φ = (1+√5)/2 ≈ 1.618. Go foirmiúil F(n+1)/F(n) '
            '→ φ. Thug Johannes Kepler faoi deara an druidim seo cheana '
            'in 1611. I mBonn 12 is é φ ≈ 1;74BB677…; iompraíonn an '
            't-áireamhán φ mar thairiseach sa réimse leathnaithe.\n\n'
            'Tá airíonna sainmhínithe simplí ag φ: φ² = φ + 1. Is í '
            'an t-aon uimhir dhearfach amháin í arb é a cearnóg díreach '
            '1 níos mó ná í féin. Nuair a chlóscríobhann tú φ² = san '
            'áireamhán, faigheann tú φ + 1 go díreach — feictear an '
            'chomhaoinseithe láithreach.\n\n'
            'In ainm na fírinne feictear φ sa dúlra san áit ina bhfásann '
            'duilleoga agus hataí timpeall ar an "uillinn órga"; is '
            'uimhreacha Fibonacci comharsanacha iad uimhreacha an chuar '
            'de lus na gréine nó buaircíní péine go minic. Ach ní '
            'sheasann a lán de na rudaí eile a chuirtear i leith φ an '
            'scrúdú: ní leanann cuach na Nautilus φ, agus ní chruthaithe '
            'é go bhfuarthas úsáid fheasach sa Parthenon nó i saothar da '
            'Vinci. Is fíor φ sa mhatamaitic agus i bhfoilleagán — '
            'ní chuile áit.',
      ),
      ProseSection(
        'An Dó Dhéag mar Uimhir Ilroinnte',
        'Aithníonn an teoiric uimhreacha roinnt bealaí cruinne chun uimhir '
            'a dhescríobh mar "ilroinnte" — agus feictear an dó dhéag i '
            'roinnt acu. Tá an dó dhéag ardchomhdhéanta: tá níos mó '
            'roinnteoirí aige ná aon uimhir níos lú. Is iad a roinnteoirí '
            '1, 2, 3, 4, 6, 12 — sé cinn; níl an líon sin ag uimhir ar bith '
            'faoi 12. D\'iniúch Srinivasa Ramanujan an rang seo in 1915 i '
            'bpáipéar cáiliúil i Proceedings an London Mathematical '
            'Society.\n\n'
            'Is í an dó dhéag freisin an uimhir fhlúirseach is lú: sáraíonn '
            'suim a fíorroinnteoirí, 1+2+3+4+6 = 16, an uimhir féin. '
            'I gcás uimhreacha níos lú tá a mhalairt — do 10 tugann '
            '1+2+5 = 8, níos lú ná 10. Is í an dó dhéag an chéad uimhir '
            'ina "dteachtann" na roinnteoirí thar maoil.\n\n'
            'Airíonna níos annamha: is uimhir shublaimte í an dó dhéag. '
            'Ciallaíonn sin go bhfuil dhá táscaire dá roinnteoirí iad '
            'féin ina n-uimhreacha foirfe. Is é 6 líon na roinnteoirí '
            '(agus is foirfe 6 = 1+2+3). Is é 1+2+3+4+6+12 = 28 '
            'suim na roinnteoirí uile (agus is foirfe freisin 28 = '
            '1+2+4+7+14). Go dtí inniu níl ach dhá uimhir shublaimte '
            'ar eolas — an dó dhéag agus uimhir 76-shuíomh. Tagann an '
            'téarma ó mhatamaitic fóillíochta áfach agus tá sé déanta '
            'go cúng; ní cruthúnas ar thábhacht chosmach a tearc, ach '
            'toradh sainmhínithe speisialta.',
      ),
      ProseSection(
        'Pirimid de Liathróidí Gunna Móir',
        'Má charnann tú liathróidí gunna móir i bpirimid le bun '
            'cearnógach, tá 1² + 2² + … + n² liathróid sa n-ú pirimid. '
            'Rinne Thomas Harriot an fhoirmle suime seo timpeall 1587 '
            'amach, nuair a bhí Sir Walter Raleigh ag iarraidh a fhios '
            'a bheith aige conas liathróidí carntha a chomhaireamh.\n\n'
            'Is ceisteanna níos deacra: cén uair atá pirimid den sórt '
            'sin ina chearnóg foirfe liathróidí ag an am céanna? Níl ach '
            'cás amháin neamhthriviálach ann, agus tá sé álainn: '
            '1² + 2² + … + 24² = 4900 = 70². Is féidir na 4900 liathróid '
            'céanna mar sin a leagan mar phirimid le 24 shraith nó mar '
            'chearnóg 70×70. Mheas Édouard Lucas in 1875 gurb í seo an '
            't-aon réiteach; níor cruthaíodh go hiomlán é ach in 1918 '
            'ag G. N. Watson — bhí an fhadhb deacair i ndáiríre.\n\n'
            'Is é 24 díreach dhá oiread 12. Is breathnóireacht bhreá é '
            'sin — ach go macánta ní cúis dhoiciméadaithe í: feictear 24 '
            'anseo toisc gur é sin an réiteach atá ag an gcomhcothromóid '
            'bhunúsach, ní mar gheall ar nasc le Bonn Dó Dhéag.',
      ),
      ProseSection(
        'Cathair Idéalach Phlatóin',
        'Ina "Dlíthe" (Leabhar V) fiafraíonn Platón cé mhéad saoránach '
            'ba chóir do chathair idéalach a bheith. A fhreagra: 5040. '
            'Ní misticiúil ach praiticiúil an argóint — caithfidh cathair '
            'a saoránaigh a roinnt go leanúnach ina ngrúpaí comhionanna, '
            'agus tá 5040 inroinnte ar gach uimhir ó 1 go 12, leis an '
            't-aon eisceacht 11. (Do na hinroinnte le 11 molann Platón dhá '
            'theaghlach a bhaint.)\n\n'
            'An rud a dhéanann Platón anseo cur síos ar, is é an léargas '
            'céanna atá mar bhunús an chórais dhóidéagaigh: sa ghnáthshaol '
            'is iad na roinnteoirí beaga na cinn thábhachtacha. Is é '
            '5040 = 7! deartháir mór na dó dhéag mar dhea — an '
            'fhealsúnacht in-roinnte chéanna, curtha i bhfeidhm ar '
            'dhaonra iomlán cathrach seachas ar chóras uimhreacha.',
      ),
      ProseSection(
        'Ní Neiméadáil í an Corais',
        'Iompraíonn an dó dhéag go leor lipéad ag an am céanna: '
            'ardchomhdhéanta, flúirseach, sublaimte, innéacs na '
            'huimhreach Fibonacci cearnóige neamhthriviála amháin. '
            'Feictear an carnú seo iontach — ach is sainmhíniú neamhspleách '
            'é gach airíonna. Ní cúis ná siombail uachtaraí é a '
            'gcomhtharlú. An rud a sheasann an dó dhéag amach i ndáiríre '
            'is é a bheith beag: is í an uimhir is lú í leis na hairíonna '
            'seo; tá níos mó roinnteoirí fiú ag uimhreacha níos mó '
            'cosúil le 24, 36 nó 60.\n\n'
            'Déantar earráid choitianta a ainmniú go soiléir: tugtar '
            '"uimhir fhoirfe" ar an dó dhéag go minic. Tá sé sin '
            'mícheart ó thaobh matamaitice. Ciallaíonn foirfe: tugann '
            'suim na bhfíorroinnteoirí an uimhir féin — mar atá le 6 '
            '(1+2+3) nó le 28 (1+2+4+7+14). Le haghaidh an dó dhéag '
            'tugann na fíorroinnteoirí 16, níos mó ná 12. Is flúirseach '
            'an dó dhéag, ní foirfe. Tagann an meascadh ó Nicomachus '
            'Gerasa (thart ar 100 AD), a cheangail na ranganna uimhreacha '
            'seo le luachálacha morálta — léirmhíniú na sean-aimsire, '
            'ní matamaitic.\n\n'
            'Luíonn luach an chaibidil seo go díreach san idirdhealú: '
            'tá tairiscint Cohn, comhaoinseithe na liathróidí gunna móir '
            'agus an uimhir fhlúirseach is lú ina gfíricí cruthaithe. '
            'Is fiú iad a fheiceáil mar an méid is ea iad — matamaitic '
            'álainn, mhacánta, nach dteastaíonn luchtú misticiúil uaithi.',
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
    'An Dóideacagán (Dódhéagán)',
    [
      ProseSection(
        'Cad é an dóideacagán rialta',
        'Is polagán é an dóideacagán rialta (Gréigis dodeka = dhá dhéag, '
            'gōnía = uillinn) le dhá thaobh chomhfhada déag agus dhá '
            'uillinn inmheánacha chomhionanna déag. Luíonn na dá choirnéal '
            'déag go cothrom ar chiorcal, an timchiorcal, 30° ó chéile.\n\n'
            'Tomhaiseann gach uillinn inmheánach 150° go beacht. Leanann sé '
            'sin ó réasúnaíocht shimplí: más siúlann tú timpeall na '
            'figiúire go huile, casann tú ag na dá choirnéal déag le chéile '
            'ar 360° iomlán, .i. 30° in aghaidh an chúinne. Comhlánaíonn '
            'an uillinn sheachtrach agus an uillinn inmheánach 180°, mar '
            'sin fanann 180° − 30° = 150°. Sa chóras dóidéagach scríobhann '
            '150° mar 106°, an uillinn sheachtrach 30° mar 26°. Is iolraí '
            'de 15° — dóidéagach 13° — gach uillinn a fhaightear san '
            'dóideacagán.\n\n'
            'Tá an dóideacagán ar cheann de na foirmeacha ar féidir é a '
            'tharraingt go cruinn le compás agus rialóir. Tá an bealach '
            'gearr: buail ciorcal, roinn é ina shé chuid chomhionanna (éiríonn '
            'leis sin le compás amháin, toisc go gcomhionannóidh an taobh '
            'le ga sa heicsigean), ansin roinn gach arc de na sé ina dhó — '
            'tá dhá phointe déag dáilte go cothrom déanta. Ní coinchidéans '
            'é sin: is inógaire polagán rialta n-taobhach go díreach nuair '
            'a chomhdhéanann n cumhacht de dhó agus príomhuimhreacha éagsúla '
            'Fermat (teoirim Gauss agus Wantzel). Do 12 = 2² × 3 '
            'comhlíontar é, mar is príomhuimhir den sórt sin 3.',
      ),
      ProseSection(
        'Trí pholagán ag roinnt na gcoirnéal',
        'Is lú an rud suntasach faoin dóideacagán ná a chruth ach an rud '
            'atá laistigh de. Má nascann tú gach dara coirnéal dá chuid, '
            'cruthaítear heicsigean rialta. Tugann gach tríú coirnéal '
            'cearnóg, tugann gach ceathrú coirnéal trídhéach comhchosúil '
            '— na trí cinn go cruinn, ní gar dó, agus iad uile ar an '
            'timchiorcal céanna leis an dóideacagán féin.\n\n'
            'Tá riail ghinearálta laistiar de sin: oireann polagán rialta '
            'm-thaobhach go díreach le na coirnéil chéanna i bpolagán '
            'n-thaobhach nuair a roinneann m an uimhir n; nascann tú ansin '
            'gach (n/m)-ú coirnéal. Tá heicsigean, cearnóg agus trídhéach '
            'sa dóideacagán toisc gur inroinnte 12 ar 6, 4 agus 3. Agus '
            'is í 12 an uimhir is lú atá inroinnte ar 3, 4 agus 6 ag an '
            'am céanna — a gcomhiolrán is lú. Mar sin is é an dóideacagán '
            'an polagán rialta is lú ina bhfuil na trí bhunfhoirm le '
            'chéile; ní féidir le polagán cúig-, ocht- nó deich-thaobhach '
            'é sin a dhéanamh.\n\n'
            'Is in-roinnte díreach í sin a dhéanann an córas dóidéagach '
            'chomh taitneamhach. Go bhfuil 12 inroinnte ar 2, 3, 4 agus '
            '6 ligeann go céimseata do na trí pholagán titim le chéile i '
            'ndóideacagán — agus déanann sé go huimhríoch de leath, trian, '
            'ceathrú agus séú codáin ghearr, ghlan dhóidéagacha. '
            'Tá an fhréamh chéanna ag foirm agus ag codáin.',
      ),
      ProseSection(
        'Caoga is ceithre dhiagonáil, sé fhad',
        'Nascann diagonáil dhá choirnéal nach bhfuil comharsanacha. '
            'Tugann an fhoirmle n(n−3)/2 do dhóideacagán 12 × 9 / 2 = 54 '
            'diagonál. Feictear sin neamhord, ach tá ord daingean air: '
            'mar atá an dóideacagán chomh siméadrach, tá fad comhionann '
            'ag na diagonáil uile a léimeann an líon céanna coirnéal. Tá '
            'cúig fhad-léime den sórt sin agus an trastomhas ina theannta '
            '— sé fhad éagsúla amháin mar sin. Le taobhfhad 1:\n\n'
            'd₂ léimeann coirnéal amháin agus tomhaiseann √(2+√3) ≈ 1.932. '
            'd₃ léimeann dhá choirnéal, 1+√3 ≈ 2.732. d₄ léimeann trí '
            'choirnéal, (3√2+√6)/2 ≈ 3.346. d₅ léimeann ceithre choirnéal, '
            '2+√3 ≈ 3.732. Nascann d₆ ar deireadh coirnéil os comhair a '
            'chéile — is é sin an trastomhas, √6+√2 ≈ 3.864.\n\n'
            'Folaithe sna luachanna sin tá patrúin ghlan. Difríonn an '
            'cúigiú agus an tríú diagonáil díreach fad an taobh: '
            '(2+√3) − (1+√3) = 1. Agus tá an trastomhas dhá oiread an '
            'diagonáil is giorra go díreach, d₆ = 2 · d₂ — an cóimheas '
            'céanna 2:1 leis an ochtach sa cheol. Tá gach uillinn idir na '
            'diagonáil arís ina n-iolraí de 15°, mar go roinneann na dá '
            'choirnéal déag an ciorclán iomlán i gcéimeanna de 30°.',
      ),
      ProseSection(
        'An achar agus an "trí cruinn"',
        'Chun an t-achar a fháil, déantar an dóideacagán a dheighilt ón '
            'lár ina dhá thriantán déag chomhionanna, caola. Tá dhá chos '
            'den fhad R ar gach ceann — is é sin ga an timchiorcail, '
            'an fad ón lár go coirnéal — agus tá an uillinn 30° ar a '
            'bharr. Nuair a shuimítear na dhá thriantán déag, eascraíonn '
            'rud álainn:\n\n'
            'A = 3 · R².\n\n'
            'Is é an fachtóir trí ghlan, iomlán gan aon fhréamh. Éiríonn '
            'leis seo toisc go bhfuil sin(30°) = a leath sa ríomh, agus '
            'is í 30° uillinn an chúinne den dóideacagán díreach. Ar na '
            'polagáin is féidir a tharraingt le compás agus rialóir is é '
            'an t-aon cheann mór amháin é ina dtagann an fhoirmle achair '
            'amach chomh glan sin; san heicsigean mar shampla fanann '
            'fréamh. Más fearr leat s an taobhfhad, is é an t-achar '
            'A = 3(2+√3)·s² ≈ 11.196·s².\n\n'
            'Má chuirtear an t-achar i gcoibhneas leis an timchiorcal, ar '
            'achar π·R², gearrann R² amach agus fanann 3/π ≈ 0.9549 go '
            'díreach. Líonann an dóideacagán mar sin thart ar 95.5% dá '
            'thimchiorcal — i bhfad níos mó ná heicsigean (thart ar 83%), '
            'cearnóg (thart ar 64%) nó trídhéach (thart ar 41%). In áit '
            'uimhir na gciorclán casta π seasann an trí chuinn: le R = 1 '
            'is é an t-achar dóideacagánach 3 go díreach agus luíonn sé '
            'beagán faoi π ≈ 3.1416.\n\n'
            'D\'úsáid Archimedes an gaire seo cheana. Dhruid sé π tríd '
            'polagáin, ag tosú leis an heicsigean éasca a tharraingt agus '
            'ag déanamh dúbailte ar an líon coirnéal: 6, 12, 24, 48, 96. '
            'Ba é an dóideacagán a chéad chéim. Líonann an 96-phach — '
            '12 × 8 ó thaobh dóidéagach — an ciorcal cheana 99.93% agus '
            'thug dó 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Cá bhfeictear an dóideacagán mar fhoirm',
        'Cruthaíonn dhá mharc uaire déag cloig analógaigh dóideacagán '
            'rialta: dhá phointe déag ag eatraimh 30° ar an gciorcal. '
            'Go gclúdaíonn 360° = 12 × 30° an ciorclán iomlán agus go '
            'bhfuil dhá uair an chloig déag faoi dhó sa lá, is é an '
            'raistar 30° céanna é a úsáideann róisíní compáis do dhá '
            'threo dhéag.\n\n'
            'Bhuail roinnt tíortha boinn dhá thaobh dhéag — go príomha '
            'ionas gur féidir iad a aithint ón mothú ó bhoinn chruinne. '
            'Bhí an "Threepence" Briotanach práis (ó 1937) ar an gcéad '
            'píosa reatha neamhchruinn sa Bhreatain Mhór; tugadh isteach '
            'an bonn punt dhá thaobhach déag (ó 2017) in aghaidh '
            'falsaithe agus dearadh go cúramach de réir an eiseamláir '
            'sin. Murab ionann agus a maítear uaireanta níl leithead '
            'cothrom ag boinn den sórt sin — tá an airíonna sin ag boinn '
            'seacht-thaobhacha Bhriotanacha na 20 agus 50 pingin, nach '
            'dóideacagáin iad.\n\n'
            'Ní dhéanann an dóideacagán ina aonar tíleáil ar an eitleán: '
            'ní théann 150° go glan isteach in 360°. In éineacht le '
            'polagáin eile áfach éiríonn leis — mar shampla le '
            'triantáin nó le cearnóga agus heicsigean, a bhfuil a '
            'n-uillinn ag suimseadh go 360° ag gach coirnéal. '
            'Cruthaíonn patrúin dhá dhéag-uimhreacha den sórt sin '
            'bunús ornáideachta céimseata Ioslamaí. Mar a tháinig an '
            'dó dhéag isteach sa tógáil agus san ealaín ina theannta '
            'sin, pléitear é sa chaibidil "An Dó Dhéag sa Tógáil".',
      ),
      ProseSection(
        'Céimseata, ní uimhireolaíocht',
        'Is fíricí matamaiticiúla iomchuí iad airíonna an dóideacagáin, '
            'ní rúndiamhair. Go bhfuil an t-achar i gcoibhneas 3/π leis '
            'an timchiorcal leanann go héigeantach ó sin(30°) = a leath; '
            'léiríonn sé amháin go ndéanann an dóideacagán maith-áitriú '
            'ar an gciorcal, agus ní bunnaíonn sé aon nasc rúnda idir an '
            'trí agus π. Ar an gcaoi chéanna is toradh an uillinn chúinne '
            'an trí simplí i "Achar = 3·R²", ní iontas.\n\n'
            'Éilíonn "A = 3·R²" freisin an léamh ceart: baineann an trí '
            'ghlán leis an ga timchiorcail. Le taobhfhad 1 is thart ar '
            '11.2 an t-achar, ní 3. Agus le diagonáil is fiú bheith '
            'cruinn — is é an ceathrú (3√2+√6)/2 ≈ 3.346, ní slonn '
            'fréamhaí níos simplí; foilsítear luachanna mícheart i '
            'roinnt foinsí.\n\n'
            'Ar deireadh ní deir an inógaireacht éasca ach go dtagann '
            'an fhoirm le huirlis shimplí. Míníonn sé go maith cén fáth '
            'nach bhfuil dóideacagáin chomh minic sin i gceardaíocht, ar '
            'bhoinn agus in ornáid. Ach cén fáth a bhfuil dhá uair an '
            'chloig déag ar chloig is ceist traidisiúin, ní céimseata. '
            'Is uirlis chéimseata álainn é an dóideacagán — agus ní '
            'chóir aon rud eile a chur ina leith.',
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
    'An Dóideacaeadrón',
    [
      ProseSection(
        'Dhá chúigeach déag sa spás',
        'Is corp é an dóideacaeadrón (Gréigis dōdeka = dhá dhéag, hédra = '
            'aghaidh) ó dhá chúigeach chomhionanna, rialta déag. Tá na '
            'haghaidheanna go léir comhionann, tá na himill go léir ar '
            'comhfhad, agus buaileann díreach trí chúigeach le chéile ag '
            'gach coirnéal. Ríomhtar sin mar dhá aghaidh déag, tríocha '
            'imeall agus fiche coirnéal.\n\n'
            'Is ceann é de chúig chorp Phlatónacha — na coirp comhchruinne '
            'a bhfuil a n-aghaidheanna comhdhéanta go heisiach as polagáin '
            'chomhionanna, rialta agus ag a coirnéil a chuireann an líon '
            'céanna aghaidheanna le chéile i gcónaí. Is iad na ceithre '
            'cinn eile an teitraeadrón (ceithre thriantán), an cíob (sé '
            'cearnóg), an ochtaeadrón (ocht dtriantán) agus an íosacaeadrón '
            '(fiche triantán). Ar na cúig cinn sin is é an dóideacaeadrón '
            'an t-aon cheann le haghaidheanna cúigeacha.\n\n'
            'Go gearr cuirtear síos ar an dóideacaeadrón mar {5, 3}: '
            'cúigeacha mar aghaidheanna, trí cinn acu ag gach coirnéal. '
            'Tomhaiseann an uillinn idir dhá aghaidh chomharsanacha thart '
            'ar 116.57° (deachúlach). Mar chomparáid: 90° an uillinn sin '
            'sa chíob.',
      ),
      ProseSection(
        'Cén fáth go bhfuil díreach cúig cinn ann',
        'Gur féidir cúig cinn den sórt sin amháin a bheith ann — ní '
            'níos mó agus ní níos lú — is toradh cruthaithe é. Treoraíonn '
            'dhá bhealach chuige, agus tagann an dá cheann ar an gcéanna.\n\n'
            'Is comhaireamh simplí an chéad bhealach, teoirim pholaéadrach '
            'Euler: do gach corp comhchruinn tá coirnéil lúide imill '
            'móide aghaidheanna comhionann le dhó. Don dóideacaeadrón: '
            '20 − 30 + 12 = 2. Thug Leonhard Euler faoi deara an '
            'caidreamh seo timpeall 1750; sholáthair Cauchy an chéad '
            'chruthúnas gan bhearna in 1811. Baineann an fhoirmle le '
            'gach corp comhchruinn gan poll, le gach pirimid, gach priosma. '
            'Nuair a chomhcheanglaítear í leis an éileamh go bhfuil na '
            'haghaidheanna ina bpolagáin chomhionanna rialta, fanann go '
            'díreach cúig réiteach.\n\n'
            'Tá an dara bealach níos léiriúla agus breathnaíonn sé ar '
            'choirnéal amháin. Is é 108° uillinn inmheánach cúigeach '
            'rialta. Má bhuaileann trí chúigeach le coirnéal, suimíonn '
            'a n-uillinn go 324°. Is é na 36° in easnamh go dtí an '
            'ciorclán iomlán an bhearna a fhillfeann i dtreo an spáis '
            'go díreach — mar sin cruthaítear coirnéal den dóideacaeadrón. '
            'Thabharfadh ceithre chúigeach 432° cheana féin agus ní '
            'oireann sin do choirnéal. Mar sin is é trí chúigeach an '
            't-aon fhéidearthacht, agus is é an dóideacaeadrón an t-aon '
            'chorp le haghaidheanna cúigeacha.',
      ),
      ProseSection(
        'An Cóimheas Órga sa Chúigeach agus sa Chorp',
        'Is cúigeach rialta gach aghaidh den dóideacaeadrón — agus is '
            'é an cúigeach an áit phlánach is simplí ina dtéann cóimheas '
            'φ = (1+√5)/2 ≈ 1.618 i bhfeidhm mar chóimheas faid. Tá '
            'diagonáil cúigigh rialta díreach φ-uair fad a taobh. Nuair '
            'a chlóscríobhann tú φ² = san áireamhán, faigheann tú φ+1 '
            '— is é sin an comhchothroman sainmhínithe den Chóimheas Órga.\n\n'
            'Mar go n-iompraíonn gach aghaidh an cóimheas seo, teann φ '
            'tríd an gcorp iomlán. Má leagtar an dóideacaeadrón i gcreat '
            'comhordanáidí, feictear φ go litriúil i ndámhsa uimhriúil a '
            'fhiche coirnéal. Cruthaíonn ocht gcinn de na coirnéil seo '
            'dóibh féin cíob; is féidir cúig cíob éagsúla ar fad a '
            'inscríobh sa dóideacaeadrón. Cruthaíonn coirnéil eile trí '
            'dronuillinn órga — dronuillinní le cóimheas taobh φ go haon '
            '— atá ag seasamh go hingearach ar a chéile ina péirí.\n\n'
            'Ní as draíocht a fheictear φ anseo, ach as riachtanas: áit '
            'a bhfuil cúigeacha rialta, tá φ. Is léiriúcháin dhaonna '
            'iad na hathléiriú breise ar an gCóimheas Órga mar "chomhréir '
            'dhiaga", ní airíonna na céimseata féin.',
      ),
      ProseSection(
        'Dualacht agus an tsiméadracht is saibhre',
        'Do gach corp Platónach tá corp dúalach: cuirtear coirnéal nua '
            'i lár gach aghaidhe agus nasctar coirnéil na n-aghaidheanna '
            'comharsanacha. Cruthaítear don dóideacaeadrón mar sin an '
            'íosacaeadrón — agus ar a mhalairt. Malartaítear aghaidheanna '
            'agus coirnéil ina bpoist: tá 12 aghaidh agus 20 coirnéal ag '
            'an dóideacaeadrón, 20 aghaidh agus 12 coirnéal ag an '
            'íosacaeadrón. Fanann líon na n-imill 30 ag an dá cheann. '
            'Feictear an dó dhéag sa dá cheann — mar líon na n-aghaidheanna '
            'uair amháin, mar líon na gcoirnéal uair eile.\n\n'
            'Mar go roinneann an dá cheann an dearadh céanna, roinneann '
            'siad an tsiméadracht chéanna freisin — agus is í sin an '
            'tsiméadracht is saibhre de na coirp Phlatónacha: 120 '
            'siméadracht, .i. 60 rothlú agus 60 fhrithchaithfhilleadh. '
            'Níl ach 48 ag an gcíob, 24 ag an teitraeadrón. Roinntear '
            'na 60 rothlú ar sé ais cúigchéimneacha tríd na láir '
            'aghaidheanna os comhair a chéile, deich n-ais trícéimneacha '
            'tríd na coirnéil os comhair a chéile agus cúig ais '
            'déchéimneacha déag tríd na láir imill os comhair a chéile.\n\n'
            'Is féidir an uimhir 120 a scríobh mar 5! (5 × 4 × 3 × 2 × 1) '
            'agus í a dheighilt ina príomhfhachtóirí 2, 3 agus 5 — na trí '
            'uimhir chéanna a fhilleann sna hais agus i bhfoirm na '
            'haghaidhean cúigeacha. Is é na hais cúigchéimneacha seo '
            'freisin an chúis nach féidir le gnáthchriostal fíor-'
            'dhóideacaeadrón a chruthú: ní oireann siméadracht a cúig '
            'le laitís tréimhsiúil (féach an chaibidil ar phírít).',
      ),
      ProseSection(
        'An Dó Dhéag Euler: cén fáth dhá chúigeach déag i gcónaí',
        'Nascann toradh deireanach an dóideacaeadrón le rudaí nach '
            'bhféachann ar dtús mar bhaineann leis. Is é an cheist: an '
            'féidir clúdach dúnta, sféarúil a thógáil le seiseanna '
            'rialta amháin? Is é an freagra ní féidir. Tugann seiseanna '
            'amháin dromchla cothrom; chun é a chuarú ina sféar, ní mór '
            'go díreach dhá chúigeach déag a thógáil isteach — cuma '
            'cé mhéad seiseanna a úsáidtear eile.\n\n'
            'Leanann sé sin arís ó theoirim Euler. Gan seiseanna ar bith '
            'cruthaítear an dóideacaeadrón rialta. Le dhá chúigeach déag '
            'agus fiche seisean cruthaítear an liathróid chlasaiceach '
            'sacair — agus anseo go díreach tá earráid choitianta: ní '
            'dóideacaeadrón é an liathróid sacair. Is é íosacaeadrón '
            'truaillíthe le 32 aghaidh é, .i. dhá chúigeach déag móide '
            'fiche seisean. Roinneann an dá cheann na dhá chúigeach '
            'déag amháin; ach níl seiseanna ar bith ag an '
            'dóideacaeadrón.\n\n'
            'Is é an dóideacaeadrón rialta mar sin an cás is glanmhaire '
            'den dóidéagacht seo: dhá chúigeach déag agus rud ar bith '
            'eile.',
      ),
      ProseSection(
        'Cíob, dóideacagán agus píríteadrón — cad nach é',
        'Sa chluichíocht rólghlactha tá aithne ar an dóideacaeadrón mar '
            'D12, an dísle dhá thaobh dhéag. Toisc go dtagann sé is '
            'gaire de na cúig chorp don sféar, rollann sé go deas agus '
            'suíonn go hiontaofa ar aghaidh; déanann a dhá aghaidh '
            'chomhionanna déag cóir é.\n\n'
            'Is fiú na trí mheascadh a shoiléiriú. Ar dtús: ní hionann '
            'an dóideacagán agus an dóideacaeadrón. Iompraíonn an dá '
            'fhocal "dodeka-" (dhá dhéag), ach is dóideacagán polagán '
            'cothrom le dhá thaobh dhéag, agus is corp spásúil le dhá '
            'aghaidh déag an dóideacaeadrón. Ar an dara dul síos: tá '
            'dhá aghaidh chúigeacha déag freisin ag píríteadrón an '
            'mhianra phíríte, ach ní dóideacaeadrón rialta é — tá a '
            'chúigeacha claonta agus níl fíor-siméadracht chúigchodach '
            'aige (mínithe go mion sa chaibidil ar phírít). Ar an tríú '
            'dul síos ar deireadh shann Platón an dóideacaeadrón don '
            'chosmas ina iomláine; is sean-léirmhíniú fealsúnachta é '
            'sin, ní toradh matamaiticiúil. Seasann céimseata an choirp '
            'dá chuid féin, go hiomlán neamhspleách ar cibé brí a '
            'thug daoine dó.',
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
