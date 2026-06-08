part of '../math_theory.dart';

List<ProseChapter> _mathChaptersGa() => const [
  ProseChapter('Roinnteoirí, codáin agus tréimhsí', [
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
  ProseChapter('Na boinn uimhreacha i gcomparáid', [
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
  ProseChapter('Stair ghairid na gcóras suíomhluacha', [
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
];
