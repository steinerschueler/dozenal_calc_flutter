part of '../society_theory.dart';

// Prósa Ghaeilge do na caibidlí "Cumann na nDózónacht". Cuid de
// ../society_theory.dart. Abairtí simplí (níos fusa le haistriú). Fíricí
// agus tuairimí curtha i leith daoine; macánta faoi leithdháiltí
// neamhchinnte (cascáidí lua), gan breithiúnais ón reacaire. Coimrithe ó
// docs/research/society_*.md.

List<ProseChapter> _societyChaptersGa() => const [
  ProseChapter('Gluaiseacht ar son a Dó Dhéag', [
    ProseSection(
      'Réamhsmaointeoirí aonair',
      'Tá an smaoineamh áirimh i nDó Dhéag seachas i nDeich sean go maith. Le '
          'fada, áfach, ní raibh ann ach abhcóidí aonair, ní gluaiseacht. Cheana '
          'féin san 18ú haois luaitear an nádúraí Buffon — ach tá an fhoinse '
          'chruinn dó sin éiginnte agus téann sí ó leabhar tagartha go leabhar '
          'tagartha.\n\n'
          'Éiríonn sé níos láimhsithe sa 19ú haois. Mhol an cumadóir '
          'gearrscríofa Isaac Pitman an Dó Dhéag ó 1857 ar aghaidh agus mhol sé '
          'comharthaí dá chuid féin do Dheich agus Aon Déag. Sheas an fealsamh '
          'Herbert Spencer ar a shon in 1896, go follasach in aghaidh an chórais '
          'mhéadraigh.',
    ),
    ProseSection(
      'Andrews agus „New Numbers"',
      'Rinne Meiriceánach beart dáiríre den scéal: Frank Emerson Andrews. In '
          '1934 foilsíodh a aiste „An Excursion in Numbers" san Atlantic '
          'Monthly — iris a dúirt í féin nár chuir sí matamaitic i gcló riamh '
          'roimhe sin agus a chuir foláireamh i lár an téacs do léitheoirí a '
          'bhfuil eagla orthu roimh an matamaitic.\n\n'
          'In 1935 lean a leabhar „New Numbers" é, an chéad cheann dá '
          'shaghas sna Stáit Aontaithe. Bhí a argóint simplí: tá an Dó Dhéag '
          'inroinnte ar 2, 3, 4 agus 6, an Deich ar 2 agus 5 amháin. Bhí Andrews '
          'stuama faoi seo, áfach — mheas sé go raibh athrú iarbhír '
          'neamhdhóchúil in aghaidh „cumhacht righin an chleachtaidh".',
    ),
    ProseSection(
      'Tagann na cumainn chun cinn',
      'As na litreacha mar fhreagra ar alt Andrews d\'fhás ciorcal '
          'comhfhreagrais agus as sin in 1944 an „Duodecimal Society of '
          'America". Thug Ralph „Whiskers" Beard an t-ainm uirthi mar mhagadh; '
          'bhronn George Terry an caipiteal tosaigh. Níos déanaí athainmníodh í '
          'mar „Dozenal Society of America" — toisc go bhfuil an deachúlach '
          '„decimal" san fhocal „duodecimal".\n\n'
          'In 1959 tháinig an deirfiúr Briotanach léi, an Dozenal Society of '
          'Great Britain, agus an matamaiticeoir A. C. Aitken ina bhall '
          'mór le rá. Foilsíonn an cumann Meiriceánach an „Duodecimal Bulletin" '
          'go dtí an lá inniu; i measc a chuid ball oinigh bhí an t-údar '
          'ficsin eolaíochta Isaac Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('Digití nua do Dheich agus Aon Déag', [
    ProseSection(
      'Fadhb na siombailí',
      'An té a áiríonn i nDó Dhéag, teastaíonn dhá dhigit bhreise uaidh — do '
          'Dheich agus do Aon Déag. Níor socraíodh go haonfhoirmeach go dtí an '
          'lá inniu cé na cinn ar cheart iad a bheith; ní fhorordaíonn fiú an '
          'cumann Meiriceánach nodaireacht sheasta.\n\n'
          'Tá roinnt leaganacha ann: an Dó agus an Trí casta de chuid Pitman (↊ '
          'agus ↋), an X cló iodálach agus an E cruinnithe de chuid Andrews, '
          'séisteal agus crois dhúbailte (spreagtha ag cnaipí teileafóin), '
          'glifeanna an dearthóra cló Dwiggins — agus go simplí na litreacha A '
          'agus B as saol na ríomhairí.',
    ),
    ProseSection(
      'Pitman, Unicode agus an t-athrú 2026',
      'D\'athraigh an cumann Meiriceánach a chuid comharthaí arís agus arís '
          'eile: séisteal agus crois dhúbailte go dtí thart ar 2008, ansin '
          'glifeanna Dwiggins, ó 2015 digití Pitman. In 2015 ghlac an caighdeán '
          'Unicode comharthaí Pitman isteach go hoifigiúil freisin.\n\n'
          'Go luath in 2026 d\'aistrigh an cumann a chuid leathanach gréasáin '
          'go dtí na litreacha A agus B — ní toisc go raibh sé ag tabhairt suas '
          'Pitman, ach toisc nach dtaispeántar na carachtair speisialta go '
          'hiontaofa fós ar a lán brabhsálaithe agus fón póca. Sa Bhulaitín '
          'clóite fanann digití Pitman mar an caighdeán. (Taispeánann an feidhmchlár '
          'seo glifeanna dá chuid féin nó 0–9 / A, B ar an taispeáint, de réir '
          'do roghnaithe.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'Is é an píosa Dózónach is cáiliúla sa chultúr coiteann ná amhrán: '
          '„Little Twelvetoes" as an tsraith oideachais Mheiriceánach '
          'Schoolhouse Rock, scríofa agus canta ag Bob Dorough, craolta den '
          'chéad uair in 1973.\n\n'
          'Taispeánann eachtrán cairdiúil le dhá mhéar choise dhéag ann conas a '
          'bheadh dhá dhigit nua cumtha ag duine le dhá „mhéar" déag — ráite '
          '„dek" do Dheich agus „el" do Aon Déag. Measadh é róchrua do pháistí '
          'bunscoile agus craoladh é níos annaimhe ná na heipeasóidí eile, ach '
          'd\'fhan sé i gcuimhne a lán daoine.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, Gro, Mo — Dózónach a labhairt', [
    ProseSection(
      'Dosaen, gros agus mórghros',
      'Éiríonn an Dó Dhéag ina „10" i mBonn a Dó Dhéag. Tá focail '
          'laethúla ann le fada dá chuid áiteanna: dhá phíosa dhéag is '
          'dosaen iad, dhá dhosaen déag (144) is gros, dhá ghros déag (1728) is '
          'mórghros.\n\n'
          'Tá sé sin suntasach: is luachanna áite Dózónacha cheana féin iad na '
          'focail trádála aithnidiúla seo i ndáiríre — is é an dosaen an „10", '
          'an gros an „100", an mórghros an „1000" de shaol an Dó Dhéag.',
    ),
    ProseSection(
      'Dek, el agus an t-ainmniú córasach',
      'Labhraítear an dá dhigit nua de ghnáth mar „dek" (Deich) agus „el" '
          '(Aon Déag). Do na háiteanna úsáidtear go gairid do, gro, mo (ó dozen, '
          'gross, great gross).\n\n'
          'Lena chois sin tá ainmniú córasach ann, forbartha sa phobal ar '
          'líne: fréamhacha focal seasta do na digití (un, bi, tri … dec, lev) '
          'maille le foircinn do na cumhachtaí den Dó Dhéag — „-qua" suas, '
          '„-cia" síos. Rud deas faoi: is é „uncia" go díreach an dóú cuid déag '
          '— an focal Laidine céanna ar díobh a d\'eascair „orlach" (inch) agus '
          '„unsa" (ounce).',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, cumainn agus uirlisí inniu', [
    ProseSection(
      'TGM — córas tomhais Dózónach',
      'Cheap Tom Pendlebury ón gcumann Briotanach córas tomhais Dózónach '
          'iomlán: TGM, ainmnithe i ndiaidh a thrí bhunaonad Tim, Grafut agus '
          'Maz.\n\n'
          'Murab ionann agus an córas méadrach, ní thosaíonn sé leis an bhfad, '
          'ach leis an am, agus díorthaíonn sé gach rud trí dhomhantarraingt an '
          'Domhain. Tá an „Grafut" (troigh dhomhantarraingthe) díreach faoi '
          'bhun troighe. Leanann aonaid don achar, don toirt, don luas agus don '
          'fhórsa go comhleanúnach as sin — frithpháirtí dúnta inti féin don '
          'chóras méadrach, go hiomlán i nDó Dhéag.',
    ),
    ProseSection(
      'Na cumainn inniu',
      'Maireann an dá chumann ar aghaidh, ach tá siad beag agus deonach; níl '
          'figiúirí ballraíochta iontaofa ann. Foilsíonn an ceann Meiriceánach '
          'an Duodecimal Bulletin i gcónaí agus cuireann sé uirlisí foghlama '
          'agus tiontaithe ar fáil, cothaíonn an ceann Briotanach an t-ábhar '
          'TGM go háirithe.\n\n'
          'Is é an áit is beoga ná an fóram ar líne „Dozensonline". Is ann a '
          'tháinig an t-ainmniú córasach uimhreacha chun cinn agus an díospóireacht '
          'nár críochnaíodh riamh go hiomlán faoi na digití cearta. Tá an pobal '
          'beag, ach gníomhach.',
    ),
    ProseSection(
      'Áireamháin, feidhmchláir — agus an feidhmchlár seo',
      'Timpeall an Dó Dhéag tá radharc uirlisí thar a bheith beoga tagtha chun '
          'cinn: áireamháin Dhózónacha, tiontaitheoirí tomhais, fiú clog '
          'Dózónach agus féilire, cuid mhór díobh ina bhfoinse oscailte agus '
          'tógtha ag baill na gcumann.\n\n'
          'Tagann an feidhmchlár seo go díreach isteach ansin — áireamhán a '
          'áiríonn i mBonn a Dó Dhéag seachas i mBonn a deich, le glifeanna dá chuid féin, '
          'codáin chruinne agus cuid aonad. Is rannchuidiú beag é le traidisiún '
          'fada grách nideoige.',
    ),
    ProseSection(
      'Cén fáth a bhfanann an domhan deachúlach mar sin féin',
      'Is ar éigean atá an mhatamaitic ina cúis nach mbuann an Dó Dhéag — tá '
          'sise ar a thaobh. Is é an cleachtadh is cúis leis: tá an córas '
          'deicheanna fite isteach sa teanga, sa scoil, sa dlí agus sa '
          'teicneolaíocht, agus bheadh athrú thar a bheith costasach. Theip fiú '
          'ar an athrú i bhfad níos lú a rinne na Stáit Aontaithe go dtí an '
          'córas méadrach mar gheall air sin.\n\n'
          'Dá réir sin tuigeann formhór na ndaoine atá páirteach an scéal inniu '
          'níos mó mar thurgnamh smaoinimh mealltach seachas mar phlean athraithe '
          'dáiríre. Léiríonn sé nach rud bunúsach é rogha bhonn na n-uimhreacha '
          '— agus géaraíonn sé an tsúil ar na huimhreacha a láimhseálaimid go '
          'laethúil.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — áireamhán dóisíneach', [
    ProseSection('Aip don bhonn a dó dhéag', 'Is áireamhán don iPhone é Dozecal a oibríonn go dúchasach sa bhonn a dó dhéag. D\'fhoilsigh an forbróir neamhspleách Johan Kovacs é in 2020; tá an aip saor in aisce. Is é an cuspóir follasach atá aici úsáid an bhoinn a dó dhéag sa mhatamaitic agus san eolaíocht a chur chun cinn.\n\nDéantar an áireamh sa mhód dóisíneach nó sa mhód deachúlach, de réir mar is rogha leat. Agus tú ag aistriú idir an dá mhód, déantar an luach atá ar taispeáint a thiontú go huathoibríoch. Oibríonn na feidhmeanna triantánaíochta le céimeanna mar aonad tomhais.'),
    ProseSection('Nodaireacht Pholannach Inbhéartaithe', 'Sainghné de chuid Dozecal is ea an t-ionchur i Nodaireacht Pholannach Inbhéartaithe (RPN). In ionad „3 + 4 =" a chlóscríobh, clóscríobhann tú „3 4 +" — an dá uimhir ar dtús, agus ansin an oibríocht áirimh. Bíonn sé seo aisteach ar dtús, ach ní theastaíonn lúibíní ar bith uaidh, agus bhí sé coitianta le fada an lá ar go leor áireamhán eolaíoch (óna leithéid Hewlett-Packard).'),
    ProseSection('Cuid de thírdhreach na n-uirlisí dóisíneach', 'Ní cumann a thóg Dozecal, ach duine aonair; ina chur síos, treoraíonn sé thú chuig an Dozenal Society of America le haghaidh tuilleadh eolais faoin mbonn a dó dhéag. Mar sin, baineann sé leis an tírdhreach beag bríomhar de uirlisí dóisíneacha — taobh leis an aip seo, le hábhair TGM agus le háireamháin eile.'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Dozenal Calculator Paul Rapoport', [
    ProseSection('Áireamhán sa bhrabhsálaí', 'Is áireamhán eolaíoch é an Dozenal Calculator le Paul Rapoport a ritheann go díreach sa bhrabhsálaí gréasáin — saor in aisce agus gan suiteáil ar bith. Ríomhann sé i mbonn a dó dhéag agus is féidir leis taispeáint go deachúlach am ar bith freisin; is féidir bonn na n-uimhreacha a athrú saor in aisce, agus tá roinnt cláir neamhspleácha ar fáil. Tá treoir mhionsonraithe ag gabháil leis mar PDF.'),
    ProseSection('Láidir sa teoiric uimhreacha', 'Tá an teoiric uimhreacha thar a bheith saibhir — rud a oireann go maith do bhonn a bhfuil meas air go háirithe mar gheall ar a inroinnteacht. Aimsíonn an t-áireamhán an comhroinnteoir is mó coiteann agus an comhiolraí is lú coiteann, liostaíonn sé roinnteoirí uile uimhreach agus déanann sé í a dhianscaoileadh ina príomhfhachtóirí (le hiolrachas más mian leat). Lena chois sin tá suim na roinnteoirí, líon na roinnteoirí agus feidhm φ Euler — líon na n-uimhreacha is lú a bhfuil sí coinitheach leo.'),
    ProseSection('An bosca uirlisí eolaíoch iomlán', 'Seachas sin tá an bosca uirlisí iomlán freisin: cearnóg agus fréamh chearnach, cumhachtaí agus fréamhacha treallacha, an fheidhm easpónantúil agus logartaim — an logartam nádúrtha chomh maith leis na boinn a dó agus a deich agus logartam le bonn treallach. Lena chois sin tá na feidhmeanna uillinne (triantánúla) agus na feidhmeanna hipearbóleacha lena n-inbhéartaigh, an chomhairimh (cuir agus iomalartuithe, le hathrá freisin), staitisticí simplí (meán agus diall caighdeánach), an fachtóireach, feidhm chéatadáin, an fheidhm Gamma agus an t-aonad samhailteach i.'),
    ProseSection('An-chuid cainníochtaí', 'Seachas an ríomh amháin clúdaíonn an clár mórán cainníochtaí fisiceacha agus athraíonn sé eatarthu iad: am agus am an lae, minicíocht, treoluas, fad, achar, toirt thirim agus thaisligh, mais, fórsa, brú, fuinneamh, cumhacht, teocht agus uillinn. Tá aonaid ama dhozenacha san áireamh freisin.'),
    ProseSection('Isteach san innealtóireacht leictreach', 'Is neamhghnách d\'áireamhán dozenach an méid a shíneann sé isteach san fhisic fheidhmeach: tá raonta cainníochta dá chuid féin aige don choisíocht leictreach (impedance), don chainníocht leictreach (lucht), don photaisiúl leictreach (voltas) agus don tsruth leictreach. Leis sin is féidir an innealtóireacht leictreach a ríomh i mbonn a dó dhéag freisin.'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
