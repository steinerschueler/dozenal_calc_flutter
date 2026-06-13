// ga manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_ga.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersGa() => const [
  ManualChapter('Ag tosú', [
    _H("Na figiúir"),
    _P(
      "Úsáideann an t-áireamhán seo siombailí dá chuid féin do gach "
      "dáréag figiúr. Tá ceithre fhigiúr ancaire ina mbarra ríme "
      "stílithe ag taispeáint sna ceithre treo cardiacha — 1 (suas), "
      "4 (ar chlé), 7 (ar dheis), A (síos). Roinneann siad an ciorcal "
      "uimhreach ina cheithre ghrúpa de thrí, cosúil leis na huaireanta "
      "12, 3, 6 agus 9 ar aghaidh chloig.",
    ),
    _P(
      "Tá gach figiúr eile eatarthu tógtha ó leathchiorcail agus "
      "ciorcail iomlána. Is ciorcal simplí an náid, agus is leathchiorcal "
      "os cionn ciorcail iomláin B (= aon déag).",
    ),
    _DigitLegend(),
    _H("Bunúsach"),
    _P(
      "Iontráil uimhreacha agus oibreoirí cosúil le háireamhán póca "
      "gnáth. Brúigh an eochair leathan = ag an mbun chun an toradh a "
      "ríomh. Glanann AC (i ndearg foláirimh) an t-ionchur agus an "
      "toradh ar fad ; baineann Del an carachtar ar chlé an chúrsóra.",
    ),
    _H("Cabhair agus teoiric"),
    _P(
      "Ar chlé agus ar dheis na heochrach =, suíonn dhá chnaipe "
      "ciorclacha: osclaíonn (i) an dáréag caibidil teoirice seo, "
      "athchasann (?) an turas tapa leis na marcóirí dearga. Osclaíonn "
      "an turas go huathoibríoch ar an chéad tús.",
    ),
    _H("Cúrsóir agus loingseoireacht"),
    _P(
      "Is é an barra dearg sa réimse ionchuir an cúrsóir. Bain úsáid "
      "as ◀ agus ▶ chun é a bhogadh, carachtair a chur isteach nó a "
      "scriosadh i lár foirmle. Tar éis ríomhadh, bogann an cúrsóir "
      "isteach sa réimse toraidh — bogann na saigheada an cúrsóir "
      "toraidh ansin. Chomh luath agus a thosaíonn tú ionchur nua, "
      "léimeann an cúrsóir ar ais chuig an réimse ionchuir.",
    ),
    _H("Leanúint ar ríomhadh"),
    _P(
      "Tar éis ríomhadh, is féidir leat leanúint go díreach le "
      "hoibreoir. Iontráil + 5 = mar shampla, agus úsáideann an "
      "t-áireamhán an toradh deireanach go huathoibríoch mar an chéad "
      "operand. Chun ríomhadh ar fad nua a thosú, brúigh AC ar dtús.",
    ),
    _H("Brú dúbailte d'fheidhmeanna inbhéartacha"),
    _P(
      "Athraíonn an dara brú ar eochair feidhme í chuig a "
      "inbhéartach: éiríonn sin ina sin⁻¹, cos ina cos⁻¹, agus mar "
      "sin de. Baineann an riail chéanna leis na feidhmeanna "
      "hipearbólacha sa phána síneadh. Léiríonn ponc beag órga ar an "
      "eochair go ndéanfaidh an chéad bhrú eile inbhéartú.",
    ),
    _H("Brú fada le haghaidh tuilleadh"),
    _P(
      "Tugann eochracha le cúinne beag ag bun na láimhe deise "
      "feidhmeanna gaolmhara le brú fada: tá x² in x□, tá ln, "
      "log₁₂ agus eˣ in log, tá ± in −, tá M+ agus M− in STO, tá "
      "nCr agus nPr in n!. Chun rogha a dhéanamh, sleamhnaigh do "
      "mhéar chuig an rogha atá uait agus scaoil — nó scaoil agus "
      "tapáil an rogha. Dúnann cniogadh lasmuigh an fhuinneog.",
    ),
    _H("Oibreoirí speisialta"),
    _P(
      "Cearnaíonn x² an uimhir roimhe. Ríomhann √ an fhréamh chearnach; "
      "má sheasann uimhir ar a chlé, úsáidtear an uimhir sin mar céim "
      "na fréimhe: tugann 3√8 fréamh chiúbach 8, is é sin 2. Ríomhann "
      "log logartam ina bhfuil an uimhir ar chlé mar argóint agus an "
      "uimhir ar dheis mar bhonn: is é 8 log 2 logartam 8 le bonn 2, is "
      "é sin 3. Ríomhann ⊕ an "
      "suim chomhthreomhar: a ⊕ b = (a·b)/(a+b), úsáideach do "
      "fhriotaí comhthreomhara.",
    ),
    _H("Pána síneadh"),
    _P(
      "Osclaíonn an eochair … ag bun na láimhe deise an pána síneadh "
      "le feidhmeanna breise: cuimhne, tairisigh (π, e, φ, √2), "
      "feidhmeanna hipearbólacha, oibreoirí ardleibhéil, chomh "
      "maith le EXP agus DRG. Dúnann an eochair chéanna é, nó cniogadh lasmuigh "
      "den phána. Ar tháibléid tá na tacair go léir le feiceáil le "
      "chéile pé scéal é — níl forshrac ann.",
    ),
    _Pre(
      "  6 — Cuimhne:       STO   RCL   MC    Ans\n"
      "  7 — Tairisigh:     π     e     φ     √2\n"
      "  8 — Hipearbólach:  sinh  cosh  tanh  coth\n"
      "  9 — Ardleibhéil:   n!    |x|   1/x   mod\n"
      "  10 — Móid:         EXP   DRG   …",
    ),
    _H("Cuimhne"),
    _P(
      "Stórálann STO an toradh reatha, cuireann RCL an luach stóráilte "
      "isteach san ionchur, glanann MC an chuimhne. Léiríonn M beag "
      "ar an taispeáint go bhfuil rud éigin stóráilte. Cuireann Ans "
      "toradh an ríomhaidh deireanaigh isteach — stóráiltear luachanna "
      "réasúnacha cruinne go hiomlán, caomhnaítear an phriacúlacht.",
    ),
    _H("Líne na tréimhse"),
    _P(
      "Nuair is codán peiriadach an toradh, marcálann an t-áireamhán "
      "na figiúir athrá le líne os a gcionn. Sampla: tugann 1/5 "
      "0.2497 le líne os cionn na ceithre figiúr ar fad. Le haghaidh "
      "tréimhsí níos faide ná cúig fhigiúr, taispeántar ach an chéad "
      "chúig, agus ina dhiaidh sin …",
    ),
    _H("Córas uimhrithe: Doz / Dez"),
    _P(
      "Athraíonn tú an córas uimhrithe sna socruithe, ar fáil "
      "tríd an eochair (i): ríomhann dosaenach i mbonn 12 "
      "(réamhshocrú), deachúil i mbonn 10. Taispeántar an córas "
      "gníomhach ag barr na láimhe deise den taispeáint.",
    ),
    _P(
      "Ag aistriú, déantar an uimhir reatha le feiceáil a thiontú go "
      "huathoibríoch chuig an gcóras eile. Éiríonn « 10 » i nDoz ina "
      "« 12 » i nDez. I mód Dez éiríonn na siombailí do 10 agus 11 "
      "neamhghníomhach (liath), mar ní bhíonn siad ann mar fhigiúir "
      "aonair i mbonn 10 — le haghaidh Doz, ach aistrigh ar ais.",
    ),
    _H("Mód uillinne"),
    _P(
      "Athraíonn DRG mód na huillinne d'fheidhmeanna triantánaíochta: "
      "DEG → RAD → GRD → DEG. Taispeántar an mód reatha ag barr na "
      "láimhe deise den taispeáint, díreach os cionn an táscaire "
      "Doz/Dez. Réamhshocrú: DEG.",
    ),
  ]),
  ManualChapter('Easpónaint, Fréamhacha & Logartaim', [
    _H('Trí cheist faoi aon ghaol amháin'),
    _P(
      'Breathnaíonn ardú le cumhacht, fréamh a bhaint agus logartam a thógáil '
      'cosúil le trí oibríocht éagsúla. Go fírinneach is iad trí cheist iad '
      'faoin aon ghaol amháin: b ardaithe go e tugann n, gearr b^e = n. '
      'Anseo is é b an bonn, e an t-easpónant agus n an toradh. Má tá dhá '
      'cheann den triúr sin ar eolas agat, is féidir leat an tríú ceann a '
      'aimsiú — agus is chuige sin go díreach atá na trí eochair x^□, √ agus '
      'log ann.',
    ),
    _P(
      'Freagraíonn an chumhacht: tá an bonn agus an t-easpónant ar eolas, cé '
      'chomh mór is atá an toradh? Freagraíonn an fhréamh: tá an toradh agus '
      'an t-easpónant ar eolas, cad é an bonn a bhí ann? Freagraíonn an '
      'logartam: tá an bonn agus an toradh ar eolas, cén t-easpónant atá '
      'taobh thiar de? Mar sin, is iad an fhréamh agus an logartam an dá '
      'inbhéartach d\'ardú le cumhacht.',
    ),
    PowerTriangleFigure(power: 'Cumhacht', base: 'Bonn', exponent: 'Easpónant'),
    _H('Cumhachtaí: iolrú arís agus arís eile'),
    _P(
      'Ní chiallaíonn an chumhacht b^e, ar dtús, níos mó ná b a iolrú leis '
      'féin go díreach e uaire. Mar sin is é 2^3 = 2·2·2 = 8 agus 3^2 = 3·3 = 9. '
      'Déanann ardú le cumhacht iolrú a chomhdhlúthú, díreach mar a dhéanann '
      'iolrú suimiú a chomhdhlúthú.',
    ),
    _P(
      'Leanann dlíthe na n-easpónant ón smaoineamh simplí seo, a thuigeann '
      'tú láithreach trí na fachtóirí a chomhaireamh. Nuair a iolraíonn tú dhá '
      'chumhacht den bhonn céanna, suimitear na heaspónaint: '
      'b^m · b^n = b^(m+n) — cuireann tú na fachtóirí le chéile. Cumhacht a '
      'ardú le cumhacht iolraíonn na heaspónaint: (b^m)^n = b^(m·n).',
    ),
    _P(
      'Leanann dhá chás speisialta ón riail chéanna. Is é b^0 i gcónaí 1, '
      'mar tugann b^1 roinnte ar b^1 araon 1 agus b^(1−1) = b^0. Agus ciallaíonn '
      'easpónant diúltach an coipriosclach: b^(−n) = 1/b^n, óir ní mór do '
      'b^n · b^(−n) b^0 = 1 a thabhairt.',
    ),
    _P(
      'Má phléascann tú luachanna cumhachta cosúil le 2^x ar ghraf, faigheann '
      'tú cuar atá ag éirí níos géire i gcónaí — pictiúr eolach an fháis '
      'easpónantaigh.',
    ),
    ExpCurveFigure(),
    _H('An fhréamh — an chéad inbhéartach'),
    _P(
      'Cúlaithe ardú le cumhacht nuair a bhíonn an t-easpónant ar eolas. Is é '
      'fréamh chearnach 9 ná 3, mar is é 3^2 = 9; is é fréamh chiúbach 8 ná 2, '
      'mar is é 2^3 = 8. Ar an áireamhán seasann √ don fhréamh chearnach; má '
      'chlóscríobhann tú uimhir ar a chlé, bíonn an uimhir sin ina céim '
      'fréimhe — is é 3√8 fréamh chiúbach 8.',
    ),
    _P(
      'Níl fréamh ann ach cumhacht le easpónant codánach: is é n-ú fréamh x '
      'ná x^(1/n). Níl sé seo ina ghiorratú amháin ach leanann sé go díreach '
      'ó dhlí na n-easpónant — ardaigh x^(1/n) go cumhacht n agus gheobhaidh '
      'tú x^((1/n)·n) = x^1 = x. Tarraing y = x² agus y = √x san aon phictiúr '
      'agus is scáthánú iad ar a chéile trasna na líne y = x. Sin an comhartha '
      'infheicthe go n-inbhéartaíonn feidhm amháin an ceann eile.',
    ),
    SquareRootFigure(),
    _H('An logartam — an dara hinbhéartach'),
    _P(
      'Cúlaithe an logartam ardú le cumhacht nuair a bhíonn an bonn ar eolas. '
      'Freagraíonn sé: cén t-easpónant lena gcaithfidh mé an bonn a ardú chun '
      'an toradh a fháil? Scríobhann tú log_b(n) = e. Mar sin is é '
      'log_2(8) = 3, mar is é 2^3 = 8. Ar an áireamhán iontráil tú é seo mar '
      '8 log 2 — an argóint ar chlé, an bonn ar dheis.',
    ),
    _P(
      'Is scáthán é an logartam freisin: tagann y = log_2(x) ó y = 2^x trí '
      'scáthánú trasna na líne y = x. Nuair a fhásann an cuar easpónantach '
      'go géar, ní fhásann an logartam ach go mall — déanann sé raonta ollmhóra '
      'ina n-uimhreacha inláimhsithe.',
    ),
    ExpLogFigure(),
    _H('Dlíthe na logartam'),
    _P(
      'Ós rud é go n-inbhéartaíonn an logartam cumhachtaí, athraíonn dlíthe '
      'na n-easpónant ina ndlíthe scáthánaithe logartam. Athraíonn táirgeadh '
      'ina shuimiú: log(x·y) = log x + log y. Athraíonn comhfhachtóir ina '
      'dhifríocht: log(x/y) = log x − log y. Agus bíonn easpónant san argóint '
      'ina fhachtóir roimhe: log(x^k) = k · log x.',
    ),
    _P(
      'Ba é an t-iompú iolraithe go suimiú seo cuspóir fíor na logartam ar '
      'feadh na gcéadta bliain: le táblaí logartam, bhí sé indéanta iolrú '
      'ciotach a ionadú le cuardach simplí agus suimiú. Tá an prionsabal '
      'céanna i ngach scála logartamach — ó scála deicibeal an fhuaime go dtí '
      'méid na crithtalún.',
    ),
    _P(
      'Is saor bonn logartaim a roghnú, agus is féidir aon bhonn a thiontú go '
      'bonn eile: log_b(x) = log_c(x) / log_c(b). Dá bhrí sin ní feidhmeanna '
      'bunúsach éagsúla iad ln (bonn e), log le bonn 2 agus log₁₂, ach an '
      'cheist chéanna ar scála difriúil — ní bhíonn difríocht eatarthu ach '
      'fachtóir seasta.',
    ),
    _H('Na siombailí ar na heochracha'),
    _P(
      'Ní iompraíonn an t-áireamhán seo comharthaí coitianta ar nós √ nó '
      '"log". Ina áit taispeánann gach ceann de na heochracha seo x le cearnóg '
      'bheag □ i gcúinne. Is ionann an cearnóg agus an áireamhán don uimhir a '
      'sholáthraíonn tú — agus insíonn an cúinne sin an oibríocht, '
      'mar go n-aithrisíonn an suíomh an gnáthnodaireacht mhatamaitice.',
    ),
    KeyGlyphsFigure(
      square: 'Cearnóg',
      power: 'Cumhacht',
      root: 'Fréamh',
      logarithm: 'Logartam',
    ),
    _P(
      'Ciallaíonn cearnóg ar bharr na láimhe deise (x^□) ardú le cumhacht — '
      'x go dtí □, díreach mar a shuíonn an t-easpónant ar bharr na láimhe '
      'deise in xⁿ. Ciallaíonn cearnóg ar bharr na láimhe clé (□√x) fréamh '
      'a bhaint — □-ú fréamh x, díreach mar a shuíonn céim na fréimhe ar '
      'bharr na láimhe clé in ⁿ√x. Ciallaíonn cearnóg ag bun na láimhe '
      'deise (x_□) logartam — logartam x le bonn □, díreach mar a shuíonn '
      'an bonn ag bun na láimhe deise in log_b. Is é x² díreach an ghiorrúchán '
      'réidh do "cearnaithe". (Is í an ceathrú marcuillinn — cearnóg ag bun '
      'na láimhe clé le + beag — an tsuim chomhthreomhar ⊕ agus tá caibidil '
      'dá cuid féin aici.)',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      'Tá na trí bhuneochair i Set 2: x^□ (cumhacht), □√x (fréamh) agus '
      'x_□ (logartam). Is é x² sa roghchlár brú fada na heochrach cumhachta an '
      'ghiorrúchán do "cearnaithe". Le brú fada ar log gheobhaidh tú freisin '
      'ln, log₁₂ agus eˣ; osclaíonn siad lúibín láithreach le do chuid '
      'argóinte a chlóscríobh.',
    ),
    _P(
      'Tá an t-oibreoir cumhachta deis-chomhlachach: ciallaíonn 2^2^3 '
      '2^(2^3) = 2^8, ní (2^2)^3. Fanann easpónaint shlánuimhreach agus '
      'nodaireacht eolaíoch EXP (a EXP b = a·12^b) cruinn; léiríonn fréamhacha '
      'agus logartaim "≈" áfach, fiú nuair atá an toradh ina shlánuimhir — '
      'ritheann siad tríd an measúnóir garbhála.',
    ),
    _Pre(
      'Ionchur        Toradh      (deachúil)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          fréamh chiúbach\n'
      '8 log 2    ≈   3          log le bonn 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H('Cumhachtaí dó dhéag agus log₁₂'),
    _P(
      'I mbonn dó dhéag is iad cumhachtaí dó dhéag na huimhreacha cruinne, '
      'díreach mar atá cumhachtaí deiche sa chóras deachúil: scríobhann tú '
      '"10" do dó dhéag, "100" do céad daichead a ceathair, "1000" do míle '
      'seacht gcéad fiche a hocht. Mar sin nuair a léann tú "100" ar an '
      'áireamhán, smaoiníonn tú ar léim de 144, ní de 100.',
    ),
    _P(
      'Sin é an fáth gurb é log₁₂ an t-áiritheoir figiúr nádúrtha sa chóras '
      'dosaenach — díreach mar atá an logartam bonn-deich sa chóras deachúil. '
      'Do chumhacht dó dhéag is ionann a luach agus líon na bhfigiúr lúide a '
      'haon: log₁₂("10") = 1, log₁₂("100") = 2, log₁₂("1000") = 3.',
    ),
    _P(
      'Breathnaíonn cearnóga agus ciúbanna aisteach i ndosaenach, ach is iad '
      'na luachanna céanna iad — scríofa ar bhealach difriúil amháin. Is é 4² '
      '"14" (sé déag), is é 5² "21" (fiche a cúig), is é A² "84" (céad), is é '
      'B² "A1" (céad fiche a haon). Ní athraíonn an mhatamaitic riamh leis an '
      'mbonnchlóscríobh; tá e agus ln neamhspleách ar an mbonn freisin. Ní '
      'athraíonn ach an tsraith figiúr, ní an luach.',
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H('Cad is ceart a bheith cúramach faoi'),
    _P(
      'Tá roinnt ionchuir gan sainmhíniú agus is cúis earráide iad: logartam '
      'nialais nó uimhreach diúltaí, mar aon leis na bunanna 0 agus 1. Níl '
      'fréamh chearnach uimhir dhiúltaí ann sa réaltacht ach oiread. Tá '
      'easpónaint dhiúltacha agus chodánacha ceadaithe gan teorainn, áfach — '
      'is é 8^(−1/3) ná 1/2.',
    ),
    _P(
      'Agus arís faoin "≈": ní chiallaíonn sé "míchruinn". Ritheann fréamhacha '
      'agus logartaim i gcónaí tríd an measúnóir phointe snámha agus iompraíonn '
      'siad an comhartha sin dá bhrí sin, fiú nuair is slánuimhir ghlan é an '
      'toradh. Tá an luach a thaispeántar ceart — ní nochta an comhartha ach '
      'an modh ríomha.',
    ),
  ]),
  ManualChapter('Suim chomhthreomhar (⊕)', [
    _H('Cúigiú oibríocht'),
    _P(
      'In éineacht leis na ceithre bhun-oibríocht iompraíonn an t-áireamhán '
      'cúigiú ceann, nach bhfuil chomh cáiliúil sin: an tsuim chomhthreomhar, '
      'scríofa leis an gcomhartha ⊕. Sainmhínítear é mar a ⊕ b = (a·b)/(a+b). '
      'Tá a ainm ag teacht ón innealtóireacht leictreach — déanann sé cur síos '
      'ar fhriotaíocht iomlán dhá fhriotóir atá ceangailte go comhthreomhar — '
      'ach léiríonn an fhoirmle chéanna i ngach áit nach suimitear na '
      'cainníochtaí féin ach a gcoipriosclach.',
    ),
    _H('Glacann sruth an bealach is éasca'),
    _P(
      'Nuair a nasctar dhá fhriotóir go comhthreomhar, suíonn siad idir an dá '
      'phointe chéanna; tá an voltas céanna trasna an dá cheann, agus roinneann '
      'an sruth idir an dá chonair. Is é a bhfuil ag sileadh trí gach géag ag '
      'brath ar a friotaíocht — sileann níos mó tríd an gcosán '
      'ísealfhriotaíochta.',
    ),
    _P(
      'Is é an stiúrachas, coipriosclach na friotaíochta (G = 1/R), an rud '
      'atá tábhachtach: insíonn sé chomh maith is a ligeann comhpháirt sruth '
      'tríd. I gcomhnasc comhthreomhar suimitear na stiúrachtaí: '
      '1/R = 1/R₁ + 1/R₂. Réitigh é sin do R agus gheofar an tsuim '
      'chomhthreomhar go díreach: R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.',
    ),
    ParallelCircuitFigure(),
    _H('Níos lú i gcónaí ná an ceann is lú'),
    _P(
      'An toradh iontach: tá an fhriotaíocht iomlán i gcónaí níos lú ná '
      'friotaíocht is lú den dá cheann aonair. Ligeann conair dhara sruth '
      'breise tríd, is cuma chomh ard is atá a friotaíocht. Déanann dhá '
      'fhriotóir chomhionanna go comhthreomhar an luach a leath: '
      '6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. Tugann friotóir 6 Ω agus friotóir 3 Ω '
      '18/9 = 2 Ω — níos lú ná 3.',
    ),
    _P(
      'Ó thaobh na samhla de: ligeann dhá dhoras taobh le taobh níos mó daoine '
      'tríd ná doras amháin; giorraithe an scuaine nuair a osclaítear cuntar '
      'nua. Ciallaíonn níos mó cosán níos lú friotaíochta agus tréchur níos '
      'airde.',
    ),
    ParallelBarFigure(lessThanBoth: 'níos lú ná an dá luach'),
    _H('An fhoirmle a dhíorthú'),
    _P(
      'Is é an pointe tosaigh an riail go suimitear na coipriosclach: '
      '1/(a⊕b) = 1/a + 1/b. Cuir an taobh deas ar chomhainmneoir agus '
      'gheobhaidh tú (a+b)/(a·b). Is é coipriosclach sin '
      'a ⊕ b = (a·b)/(a+b). Níl níos mó ná sin ann — is é an oibríocht '
      'iomlán "suimigh na coipriosclach agus tóg coipriosclach an toraidh".',
    ),
    _H('Airíonna'),
    _P(
      'Leanann na rialacha ríomha ó shiméadracht na foirmle. Tá ⊕ comhiomlaíoch '
      '(a ⊕ b = b ⊕ a) agus comhlachach, mar sin is féidir leat aon líon '
      'luachanna a chomhcheangal: le trí théarma, suimitear trí choipriosclach '
      'go simplí, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Simpliúchán i gcás luachanna '
      'comhionanna go háirithe — tugann n uimhreacha comhionanna go '
      'comhthreomhar a/n, mar sin a ⊕ a = a/2 agus a ⊕ a ⊕ a = a/3.',
    ),
    _P(
      'Do uimhreacha dearfacha luíonn an toradh i gcónaí faoi bhun an '
      'oiperaind is lú. Cruinnítear an pictiúr ag dhá chás teorannach: '
      'a ⊕ 0 = 0 — tarraingíonn conair gan friotaíocht, geardnasc, an sruth '
      'ar fad chuici. Agus is mó a thagann a ⊕ b in aice le a de réir mar a '
      'mhéadaíonn b; ní chuireann friotaíocht gan teorainn, briseadh, aon rud '
      'leis. Dá bhrí sin is é "gan teorainn" eilimint neodrach na suime '
      'comhthreomhaire — díreach mar atá nialas ina eilimint neodrach den '
      'suimiú gnáth.',
    ),
    _H('Meán armónach agus déachúlacht'),
    _P(
      'Tá an tsuim chomhthreomhar dlúth-ghaolmhar leis an meán armónach: '
      'is é meán armónach dhá uimhir 2·(a ⊕ b), agus is é a ⊕ b ar a mhalairt '
      'a leath. De na trí mheán clasaiceach luíonn an meán armónach i gcónaí '
      'is ísle — faoin meán geoiméadrach agus faoin meán uimhríochtúil.',
    ),
    _P(
      'Ag féachaint níos doimhne, is scáthán é ⊕ den suimiú gnáth faoi '
      'léarscáiliú coipriosclach x → 1/x: suimigh go gnáth i bhfearann an '
      'choipriosclach agus suimítear go comhthreomhar anseo, agus vice versa. '
      'Is déach le chéile nasc sraithe agus nasc comhthreomhar sa chiall seo '
      '— an gaol céanna atá idir earraíochtaí ceann ar cheann agus taobh le '
      'taobh.',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      "Suíonn an eochair ⊕ i measc na glifanna oibreora i Set 2, in aice le "
      "x^□, √ agus log. Iontráil tú a ⊕ b cosúil le ríomhadh gnáth: ar dtús "
      "a, ansin ⊕, ansin b, ansin =. Murab ionann le fréamh agus logartam, "
      "ríomhann ⊕ go cruinn — ritheann sé ar an rian codánach le braite "
      "tréimhse agus dá bhrí sin ní thaispeánann sé \"≈\".",
    ),
    _Pre(
      'Ionchur          Toradh      (deachúil)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, tréimhse 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      'Léiríonn an sampla deireanach taitneamh an dosaenach: "10" ⊕ "20" — '
      'is é sin dó dhéag go comhthreomhar le ceithre fichid is a ceathair ohm '
      '— tugann 8 glan. Agus tá 2 ⊕ 3 peiriadach i mbonn dó dhéag '
      '(1.2497… le barline os cionn 2497), ach fós cruinn; i mbonn deich '
      'bheadh an toradh céanna go simplí 1.2.',
    ),
    _H('Nuair a éiríonn an tsuimiú nialasach'),
    _P(
      'Tá cás amháin ina dteipeann ⊕: má tá a + b = 0, mar shampla '
      '5 ⊕ (−5), tá nialas sa ainmneoir, agus tuairiscíonn an t-áireamhán '
      'roinnt le nialas. Tar éis na hearráide is féidir an slonn a chur '
      'in eagar go díreach — déan nascleanúint isteach ann leis na heochracha '
      'saighde agus ceartaigh an luach; athshocraíonn AC gach rud.',
    ),
  ]),
  ManualChapter('Triantánaíocht', [
    _H('Uillinn agus a dtomhas'),
    _P(
      'Is é an triantánaíocht an staidéar ar na gaolta idir uillinn agus '
      'fad. Déanann uillinn cur síos ar rothlú — cé chomh fada is a gcaithfear '
      'ga a chasadh thart ar a phointe críche. Tomhaistear í i dtrí aonad '
      'coitianta: i gcéimeanna (is é ciorcal iomlán 360°), i radainí (is é '
      'ciorcal iomlán 2π) agus i ngradianna nó gon (is é ciorcal iomlán 400). '
      'Ní athraíonn an t-aonad a roghnaíonn tú an uillinn féin — ach an '
      'uimhir a dhéanann cur síos uirthi. Leis an eochair DRG aistreoidh an '
      't-áireamhán eatarthu.',
    ),
    _H('Sin, cosán, tadhgán sa triantán'),
    _P(
      'I dtriantán dronuilleach tá brí shocraithe ag gach uillinn ghéar θ. Is é an '
      'taobh is faide, os comhair na huillinn cearta, an hipitéis. Is é an '
      'taobh os comhair θ an taobh os comhair, agus an ceann in aice leis '
      'an taobh cóngarach.',
    ),
    _P(
      'Ó na trí thaobh seo cruthaítear trí chothromán atá i gcónaí mar '
      'an gcéanna d\'uillinn ar leith — neamhspleách ar mhéid an triantáin: '
      'sin = os comhair/hipitéis, cosán = cóngarach/hipitéis, '
      'tadhgán = os comhair/cóngarach = sin/cos. Is é an cotadhgán '
      'coipriosclach an tadhgán. Cuimsíonn an nathán cuimhne SOH-CAH-TOA na '
      'trí chéad cheann.',
    ),
    RightTriangleFigure(
      adjacent: 'Cóngarach',
      opposite: 'Os Comhair',
      hypotenuse: 'Hipitéis',
      sinRatio: 'sin θ = OsC / Hip',
      cosRatio: 'cos θ = Cón / Hip',
      tanRatio: 'tan θ = OsC / Cón',
    ),
    _H('An ciorcal aonaid'),
    _P(
      'Ní chlúdaíonn triantáin ach uillinn idir 0° agus 90°. Síneann an '
      'ciorcal aonaid — ciorcal le ga 1 thart ar an tionscnamh — an radharc '
      'chuig gach uillinn. Baineann pointe ar an gciorcal le gach uillinn θ: '
      'ag tosú ó (1, 0) casann tú in aghaidh na gcimthuathchló de θ. Ansin '
      'is é an cosán comhordanáid-x an phointe sin agus is é an sin a '
      'chomhordanáid-y.',
    ),
    _P(
      'Ar an mbealach seo faigheann uillinn os cionn 90° agus uillinn '
      'dhiúltacha áit nádúrtha freisin. Ag 180° tá an pointe ag (−1, 0): '
      'cos 180° = −1, sin 180° = 0. Ag 270° ag (0, −1). Fanann an tadhgán '
      'ina chothromán sin/cos agus comhaontaíonn sé leis an sainmhíniú '
      'triantánach.',
    ),
    UnitCircleFigure(),
    _H('Pythagoras ar an gciorcal'),
    _P(
      'Ós rud é go bhfuil ga 1 ag an gciorcal aonaid, sásaíonn gach pointe '
      'air x² + y² = 1. I nodaireacht thriantánaíochta: cos²θ + sin²θ = 1. '
      'Níl sé seo ina fhoirmle nua ach teoirim Pythagoras ar an gciorcal '
      'aonaid. Leanann sin²θ = 1 − cos²θ láithreach uaidh — bunús go leor '
      'athchruthanna.',
    ),
    _H('Tonnta agus tréimhsí'),
    _P(
      'Tar éis rothlú iomlán tá tú ar ais ag an bpointe tosaigh: athdhéanann '
      'sin agus cos le tréimhse 360° (nó 2π). Más rud é go bpléascann tú '
      'sin θ os cionn na huillinn, feiceann tú an tonn sín eolach ag luaineacht '
      'idir −1 agus +1; is é an cosán an tonn chéanna, ach caochta 90°. '
      'Déanann tonnta den sórt seo cur síos ar fhuaim, '
      'solas agus sruth ailtéarnach — gach creathán.',
    ),
    _Pre(
      'θ      sin θ    cos θ    tan θ\n'
      '0°     0        1        0\n'
      '30°    1/2      √3/2     1/√3\n'
      '45°    √2/2     √2/2     1\n'
      '60°    √3/2     1/2      √3\n'
      '90°    1        0        —',
    ),
    SineWaveFigure(),
    _H('Na feidhmeanna inbhéartacha'),
    _P(
      'Uaireanta bíonn an cothromán ar eolas agat agus tá tú ag lorg na '
      'huillinn. Chuige sin tá na feidhmeanna inbhéartacha sin⁻¹, cos⁻¹, '
      'tan⁻¹ (na feidhmeanna bogha): ó sin θ = 0.5 tagann sin⁻¹(0.5) = 30°. '
      'Ós rud é go bhfuil sin agus cos peiriadach, baineann uillinn gan '
      'teorainn le gach cothromán; ní thugann na feidhmeanna bogha mar sin '
      'ach raon amháin tréithiúil — sin⁻¹ agus tan⁻¹ ó −90° go +90°, '
      'cos⁻¹ ó 0° go 180°.',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      'Tá na ceithre fheidhm sin, cos, tan agus cot ar an bpríomheochraí agus '
      'osclaíonn siad lúibín a luaithe agus a bhrúitear iad (sin( leis an '
      'gcúrsóir istigh). Athraíonn an dara tapáil ar an eochair chéanna go '
      'dtí an fheidhm inbhéartach — léiríonn ponc órga go n-inbhéartóidh an '
      'chéad tapáil eile. Athraíonn an eochair DRG mód na huillinn '
      '(DEG → RAD → GRD), taispeánta ag barr na láimhe deise; sa phróifíl '
      '"Simplí" déantar é seo tríd na Socruithe.',
    ),
    _P(
      'Tá gaiste dosaenach le bheith airdeallach faoi: iontráiltear an uillinn '
      'sa chóras uimhrithe gníomhach. I mód dosaenach ní hé "90" nócha céim '
      'ach 9·12 = 108. Chun sin(90°) a ríomh, chlóscríobhann tú "76" (ós '
      'rud é 7·12+6 = 90). Seo na luachanna coitianta:',
    ),
    _Pre(
      'Céimeanna (deachúil)    Ionchur (dosaenach)\n'
      '30°                     26\n'
      '45°                     39\n'
      '60°                     50\n'
      '90°                     76\n'
      '180°                    130\n'
      '360°                    260',
    ),
    _P('Agus roinnt samplaí ríofa i mód DEG:'),
    _Pre(
      'Ionchur        ciall         Toradh\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       uillinn do 1  ≈76  (= 90°)',
    ),
    _P(
      'Iompraíonn gach toradh triantánaíochta "≈", mar tá sin, cos agus tan '
      'go ginearálta neamhréasúnach — fiú nuair atá an luach glan mar '
      'sin(90°) = 1. Níl tan(90°) sainmhínithe; taispeánann an t-áireamhán '
      'uimhir an-mhór ansin, toisc nach bhfuil cos(90°) ríomhairí beagnach '
      'nialas.',
    ),
    _H('Uillinn i mBonn Dó Dhéag'),
    _P(
      "Breathnaíonn fiú na luachanna ciorcal-iomlán eolach coimhthíoch i "
      "ndosaenach: scríobhann tú 360° mar \"260\" (2·144 + 6·12), 400 gradian "
      "\"294\". Ní éalaíonn ach an raidián ón gceist — is tairiseach 2π, "
      "neamhspleách ar an gcóras uimhrithe; seachnaíonn cibé a oibríonn i "
      "RAD an gaiste go hiomlán.",
    ),
    _P(
      'Go bhfuil 360 cuid ag an gciorcal iomlán oireann go maith don dó '
      'dhéag: tá go leor rannóirí ag 360 (dhá dhosaen díobh), mar sin '
      'roinneann an ciorcal go mín ina leath, trian, ceathrú, séú cuid agus '
      'níos mó — agus 12·30 = 360, is é dó dhéagú cuid den chiorcal go díreach '
      '30°. Mar is gnáth: tá an triantánaíocht féin neamhspleách ar an gcóras '
      'uimhrithe. Is é sin(30°) ½, cibé acu a scríobhann tú an uillinn '
      '"30" i ndeachúil nó "26" i ndosaenach. Ní athraíonn ach figiúir an '
      'ionchuir.',
    ),
  ]),
  ManualChapter('Stóráil & Athghairm', [
    _P(
      'Ní bhíonn áireamhán i ndáiríre tapa go dtí nach mbíonn ort uimhreacha '
      'a athchlóscríobh arís agus arís eile. Tógann ceithre uirlis an obair '
      'seo díot: an toradh deireanach (Ans), cuimhne ainmnithe (STO/RCL), '
      'carnadóir (M+/M−) agus téip staire na seisiúin. Ní chuimsíonn siad a '
      'chéile ach clúdaíonn gach ceann acu cás difriúil.',
    ),
    _H('An toradh deireanach: Ans'),
    _P(
      'Tar éis gach ríomhadh meabhraíonn an t-áireamhán an toradh faoin '
      'ainm Ans. Má chlóscríobhann tú díreach ar aghaidh le hoibreoir — '
      'abair "× 2 =" díreach tar éis toradh — úsáidtear Ans go huathoibríoch '
      'mar an chéad oiperand, gan an eochair a bhualadh ar chor ar bith. Sin '
      'an gluaiseacht is coitianta agus tú ag ríomh i slabhra: éiríonn toradh '
      'céim amháin ina thús ciúin don chéad cheann eile.',
    ),
    _P(
      'Mura bhfuil an toradh deireanach uait ag an tús ach i lár foirmle '
      'nua, cuireann tú isteach go follasach é le Ans. Tábhachtach: coinníonn '
      'Ans an toradh iomlán i gcónaí — codán peiriadach san áireamh, ní na '
      'figiúir infheicthe amháin.',
    ),
    _H('An chuimhne: STO, RCL, MC'),
    _P(
      'Tá laige ag Ans: forscríobhann an chéad "=" eile é. Chun luach a '
      'choinneáil thar roinnt ríomhaí neamhspleácha, stóráil é le STO sa '
      'chuimhne. Léiríonn "M" beag ag barr na taispeána go bhfuil rud éigin '
      'ann. Cuireann RCL an luach stóráilte ar ais san ionchur ag suíomh an '
      'chúrsóra — chomh minic agus is mian leat. Folamhaíonn MC an chuimhne, '
      'agus múchann an "M".',
    ),
    _P(
      'Cás tipiciúil: ríomhann tú ga ciorcail agus teastaíonn uait é ansin '
      'araon don achar agus don imlíne. Stóráiltear an ga uair amháin le STO; '
      'glaodh an dá fhoirmle air ansin go neamhspleách le RCL, gan é a '
      'athchlóscríobh riamh.',
    ),
    _H('An carnadóir: M+ agus M−'),
    _P(
      'Uaireanta ní theastaíonn uait luach aonair a choinneáil ach iomlán '
      'reatha a thógáil — mar shampla nuair a bhíonn tú ag suimiú go leor '
      'míreanna. Chuige sin tá M+ agus M−, inrochtana le brú fada ar STO. '
      'Suimíonn M+ an toradh deireanach leis an luach stóráilte, déanann M− '
      'é a asbhaint. Fásann nó crapthar an chuimhne le gach tapáil, gan ort '
      'an fofhomhaid a fheiceáil nó a nótáil. Léiríonn RCL an t-iomlán mór '
      'ag an deireadh, athshocraíonn MC an carnadóir go nialas.',
    ),
    MemoryFlowFigure(result: 'Toradh', store: 'Cuimhne', input: 'Ionchur'),
    _P(
      'Achoimríonn an sceitse na cosáin: iompraíonn STO an toradh isteach sa '
      'chuimhne, faigheann RCL ón gcuimhne isteach san ionchur é. Glacann Ans '
      'an gearrchonair díreach ó thoradh go hionchur agus seachnaíonn an '
      'chuimhne (stríoctha). Cuireann M+/M− an toradh ar ais sa chuimhne i '
      'lúb agus suimíonn é ansin.',
    ),
    _H('Ans nó cuimhne — cé acu?'),
    _P(
      'Leanann an rogha riail shimpil. Glac Ans nuair a theastaíonn an toradh '
      'láithreach sa chéad chéim eile — tapa agus gan ullmhúchán. Glac an '
      'chuimhne nuair ba chóir luach a bheith réidh thar roinnt ríomhaí '
      'scartha nó a bheith cosanta go sábháilte ón gcéad "=" eile. Tá M+ agus '
      'M− céim os a gcionn: ní hiad atá ceaptha chun luach aonair a athghairm '
      'ach chun go leor torthaí aonair a shuimiú go hiomlán.',
    ),
    _H('Stóráilte go cruinn — gan earráid shlánaithe'),
    _P(
      'Oibríonn an chuid is mó de na háireamháin go hinmheánach le huimhreacha '
      'pointe snámha de chruinneas seasta. Tá a bhfuil á thaispeáint acu '
      'slánaithe cheana féin — agus is é an luach slánaithe seo go díreach a '
      'théann isteach sa chuimhne. Lean ag ríomh agus iompraíonn tú an '
      'earráid leat; tar éis roinnt céimeanna léiríonn toradh ar chóir a '
      'bheith go díreach 1 "0.9999…".',
    ),
    _P(
      'Coinníonn an t-áireamhán seo torthaí réasúnacha ina gcuid codán fíor '
      'de shlánuimhreacha arbitráireacha ina ionad — gan slánú. Agus téann an '
      'codán cruinn seo isteach sa chuimhne: caomhnaíonn STO, RCL, Ans agus '
      'an carnadóir an uimhreoir agus an ainmneoir go hiomlán, ní na figiúir '
      'infheicthe amháin. Sampla: tá 1 ÷ 7 peiriadach i ndosaenach (bloc '
      '186A35). Stóráil an toradh agus iolraigh níos déanaí é faoi 7, agus '
      'tagann 1 cruinn amach — toisc nach raibh aon rud iompraithe ag an '
      'áireamhán riamh ach 1/7. Thiocfadh "0.BBBB…" ó ghléas a stóráilann '
      'na figiúir taispeána amháin.',
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (tréimhse, le barline)\n'
      '… STO          →  taispeántar "M"; stóráilte: go díreach 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (ní 0.BBBB…)',
    ),
    _P(
      'Fanann an t-áireamhán macánta ag a teorainn: ní féidir leis torthaí '
      'neamhréasúnacha — fréamhacha, logartaim, triantánaíocht — a choinneáil '
      'mar chodán. Iompraíonn siad "≈" agus stóráiltear iad mar ghar-luach. '
      'Is éasca an riail a léamh: má thagann "≈" roimh an luach, is '
      'ghar-luach é atá stóráilte; mura bhfuil sé ann, tá sé cruinn.',
    ),
    _H('An téip staire'),
    _P(
      'Chun ríomhadh níos luaithe a úsáid arís, svuáil síos ar an taispeáint. '
      'Osclaíonn sé sin téip staire na seisiúin reatha — an ríomhadh is nua '
      'thuas, suas le tríocha iontráil. Ní ghlanann fiú AC é; coinníonn sé '
      'an tseisiún ar fad. Tugann tapáil ar iontráil a luach toradh ar ais '
      'san ionchur, díreach cosúil le Ans — ach do chéim níos luaithe ar bith.',
    ),
    HistoryBandFigure(swipe: 'svuáil', newCap: 'nua', tap: 'tapáil'),
    _P(
      'Ní stóras buan é an téip staire ach féachaint siar: coinníonn sé snáithe '
      'seisiúin agus ligeann duit luach a aisghabháil a ríomh tú ach nár '
      'stóráil tú go sainráite.',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      'Tá STO, RCL, MC agus Ans sa phána síneadh: oscail é leis an eochair '
      '"…" agus tapáil an fheidhm atá uait. Folaíonn M+ agus M− taobh thiar '
      'de bhrú fada ar STO — is leid é an cúinne beag ag bun na láimhe deise '
      'den eochair; sa phóca roghnóidh tú M+ nó M−. Sa phróifíl "Simplí" níl '
      'pána síneadh ann; níl na feidhmeanna cuimhne ar fáil ansin.',
    ),
    _P('Trí shampla ríofa (i mód dosaenach):'),
    _Pre(
      'Stóráil agus cuir isteach níos déanaí\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  taispeántar "M"\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Lean ar aghaidh go díreach le Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 go huathoibríoch)',
    ),
    _Pre(
      'Suimigh míreanna le M+\n'
      '  … MC                   glan cuimhne\n'
      '  5 =   … STO(fada) M+   →  cuimhne 5\n'
      '  7 =   … STO(fada) M+   →  cuimhne 10\n'
      '  3 =   … STO(fada) M+   →  cuimhne 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      'Le seiceáil i ndeachúil: 5 + 7 + 3 = 15, agus is é 15 i ndosaenach '
      '"13" (1·12 + 3). Oibríonn na ceithre uirlis ar fad — Ans, cuimhne, '
      'carnadóir agus téip staire — ar an aon luach cruinn amháin; ní '
      'ghá do dhuine a bhfuil aithne aige orthu uimhir a chlóscríobh de '
      'láimh nó fofhomhaid a choinneáil ina cheann.',
    ),
  ]),
  ManualChapter('Feidhmeanna Hipearbólacha', [
    _P(
      'Ag an scoil foghlaimeann tú sin agus cos mar chomhordanáidí pointe ar '
      'an gciorcal aonaid. Níos lú cáiliúil, ach chomh bunúsach céanna, tá a '
      'gcomhprotháigh hipearbólacha sinh agus cosh. Tagann siad chun cinn nuair '
      'a chuirtear an hipéarbail in áit an chiorcail — agus is é an eochair '
      'chucu an fheidhm easpónantach eˣ.',
    ),
    _H('Na leath chothrom agus corr de eˣ'),
    _P(
      'Is féidir gach feidhm a roinnt ina chuid chothrom (siméadrach i leith '
      'an ais-y) agus ina chuid chorr (pointe-siméadrach i leith an tionscnaimh). '
      'Do eˣ is féidir an dá chuid a scríobh go díreach: is é cosh an ceann '
      'cothrom, sinh an ceann corr. Suimigh arís iad agus filleann eˣ — '
      'mar eˣ = cosh x + sinh x, agus e⁻ˣ = cosh x − sinh x. Ní roghnach '
      'é an dianscaoileadh seo ach an t-aon cheann amháin atá indéanta.',
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      'Is é tanh an ceathrúnach, coth a choipriosclach (agus dá bhrí sin '
      'sainmhínithe ach do x ≠ 0). Ar dheis tá na hinbhéartaigh, a bhfillfimid '
      'orthu ar ball.',
    ),
    _H('An hipéarbail aonaid'),
    _P(
      'Ar an gciorcal aonaid sásaíonn gach pointe (cos t, sin t) an cothromóid '
      'x² + y² = 1. Do na feidhmeanna hipearbólacha tá féiniúlacht beagnach '
      'comhionann, ach go bunúsach difriúil ann. Cuir isteach na sainmhínithe '
      'agus ríomh an difríocht de na cearnóga, agus ceallaíonn na téarmaí '
      'measctha:',
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      'Mar sin luíonn an pointe (cosh t, sinh t) i gcónaí ar an gcuar '
      'x² − y² = 1, an hipéarbail aonaid. Toisc nach mbíonn cosh t níos lú '
      'ná 1 riamh, fanann an pointe i gcónaí ar an gcraobh dheas. Tá ról '
      'ag féiniúlacht cosh²t − sinh²t = 1 sa domhan hipearbólach atá comhionann '
      'leis an ról atá ag cos²t + sin²t = 1 sa domhan ciorclach — ach gur '
      'athraíodh an comhartha móide go mínus.',
    ),
    UnitHyperbolaFigure(area: 'Achar = t/2'),
    _H('An paraiméadar: achar, ní uillinn'),
    _P(
      'Anseo luíonn an difríocht is doimhne leis an triantánaíocht. Ar an '
      'gciorcal is é an paraiméadar t an uillinn i radainí — agus ag an am '
      'céanna fad an bogha agus dhá oiread achar an earnáin; teagmhaíonn na '
      'trí chiall seo le chéile ann de thaisme. Ar an hipéarbail níl uillinn '
      'den sórt sin ann. Fanann an t-achar: is é t dhá oiread achar an '
      'earnáin hipearbólaigh idir an tionscnamh, an rinn (1, 0) agus an pointe '
      '(cosh t, sinh t) — go díreach an t-achar lí sa figiúr thuas.',
    ),
    _P(
      'As sin tagann ainm na n-inbhéartach. Tugtar feidhmeanna achair orthu '
      '— arsinh, arcosh, artanh — ón Laidin "area", achar. Tá an "arcsinh" '
      'coitianta ar roinnt gléasanna mícheart ó bhun go barr: iompraíonn sé '
      'an réimír bogha ("arc") chuig feidhm nach bhfuil bá ar bith aige le '
      'boga. Is é arsinh(y) an luach paraiméadar t sin ina bhfuil sinh t = y '
      '— is é sin achar, ní boga.',
    ),
    _H('Cruth na gceithre cuar'),
    _P(
      'Is é cosh dabhach oscailte suas, siméadrach-ais lena phointe íochtair '
      'ag (0, 1), ós rud é cosh 0 = 1; ní bhíonn a luach níos lú ná 1 riamh. '
      'Tá sinh pointe-siméadrach, ritheann tríd an tionscnamh agus fásann gan '
      'teorainn i ndá threo. Do x mór druidtear le cosh agus sinh araon chuig '
      'an gcuar eˣ/2.',
    ),
    _P(
      'Is é tanh cuar sáithiúcháin S-chruthach: ag méadú go dian, tríd an '
      'tionscnamh, agus fanann sé go dian idir −1 agus +1 — druidtear leis na '
      'teorainneacha sin, ní sroichtear iad riamh. Iompraíonn coth ar deireadh '
      'cosúil le coipriosclach tanh, ach toisc sinh 0 = 0 tá pol aige ag '
      'x = 0 agus fanann sé lasmuigh de [−1, 1].',
    ),
    HyperbolicCurvesFigure(),
    _H('Gaol leis an triantánaíocht'),
    _P(
      "Tá an dá theaghlach ceilte ón ábhar céanna: an fheidhm easpónantach. "
      "Scríobhann foirmle Euler na feidhmeanna ciorclach go hanalagach — "
      "cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). Tá an patrún "
      "mar an gcéanna; ach ní ritheann an fheidhm easpónantach don cheann "
      "ciorclach ach ar an ais shamhailteach (argóint i·t), don cheann "
      "hipearbólach ar an ais réadach (argóint x). Má tá uimhreacha casta fós "
      "coimhthíoch duit, is féidir leat an smaoineamh seo a scipeáil — is é "
      "an rud tábhachtach amháin: is í an aon fheidhm chéanna í ina croí.",
    ),
    _P(
      'Go geoiméadrach is é an aon tógáil chéanna é — pointe ar chuar, '
      'paraiméadraithe de dhá oiread achar an earnáin — ach uair amháin ar '
      'an gciorcal, uair amháin ar an hipéarbail. As sin leanann an comhartha '
      'caochta: cos² + sin² = 1 i gcoinne cosh² − sinh² = 1. Cuir argóint '
      'shamhailteach isteach agus trasnaíonn na teaghlaigh a chéile go '
      'díreach: cos(i·x) = cosh x agus sin(i·x) = i·sinh x. Mar sin is iad '
      'na feidhmeanna hipearbólacha "na feidhmeanna triantánaíochta le '
      'hargóint shamhailteach".',
    ),
    _P(
      'Ritheann na teoirimí breisithe go comhthreomhar freisin: '
      'sinh(a+b) = sinh a·cosh b + cosh a·sinh b, díreach mar atá le sin. '
      'Don chasán, áfach, casann comhartha — tá míneas ag cos(a+b), ach móide ag '
      'cosh(a+b). Is é seo riail Osborn: bíonn gach féiniúlacht '
      'thriantánaíochta hipearbólach trí sin→sinh, cos→cosh a chur ina '
      'ionad agus an comhartha a athrú i ngach áit ina bhfuil táirgeadh de '
      'dhá fhachtóir sin. Luíonn comhartha mícheart beagnach i gcónaí go '
      'díreach ag an bpointe seo.',
    ),
    _H('Feidhmeanna sa domhan mór'),
    _P(
      'Is é an ceann is cáiliúla an caténaire. Ní pairéabóla a dhéanann rópa '
      'a chrochadh go saor idir dhá phointe — thit Galileo féin sa mhearú seo '
      '— ach an cuar y = a·cosh(x/a). Le crochóir éadrom tá cosúlacht idir '
      'an dá cheann; le crochóir doimhin éiríonn an difríocht soiléir: fásann '
      'an caténaire níos tapúla ná aon phaireabóla. Mar mhalairt — mar stua '
      'cosh oscailte síos — déanann sé cur síos ar an gcruth idéalach d\'arsa '
      'súnta a ritheann a lód go hiomlán trí chomhbhrú.',
    ),
    CatenaryFigure(catenary: 'Caténaire', parabola: 'Pairéabóla'),
    _P(
      'Baineann titim le friotaíocht aeir leis seo freisin: má fhásann an fórsa '
      'coscach le cearnóg na luaise, leanann an luas cuar tanh agus druidtear '
      'leis an luas críochnaíoch go réidh, gan é a shárú riamh — is é sáithiú '
      'tanh anseo an fhisic féin.',
    ),
    _P(
      'Sa teoiric choibhneasa ar deireadh ní suimítear go simplí luasanna '
      'in aice le luas an tsolais. Cuir isteach an "tapúlacht" φ trí '
      'v = c·tanh φ agus éiríonn an fhoirmle bhreisithe casta simplí arís: '
      'suimitear na tapúlachtaí go gnáth (φ = φ₁ + φ₂), go díreach toisc '
      'go bhfuil a theoirim bhreisithe ag tanh. Is é don gheoimetric plánach '
      'an raidián, is é don gheoimetric spás-ama an tapúlacht.',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      'Tá na ceithre fheidhm i Set 8, an pána síneadh: clap leis an eochair '
      '"…", ansin tapáil sinh, cosh, tanh nó coth. Osclaíonn gach ceann '
      'lúibín láithreach (sinh( leis an gcúrsóir istigh); mura bhfuil an '
      'ceann dúnta ann, cuireann an t-áireamhán leis é ag an "=". Athraíonn '
      'an dara tapáil ar an eochair chéanna go dtí an fheidhm achaireach '
      '(sinh ↔ arsinh agus mar sin de) — léiríonn ponc órga go n-inbhéartóidh '
      'an chéad tapáil eile.',
    ),
    _P(
      'An difríocht is tábhachtaí ón triantánaíocht: is uimhir ghlan é an '
      'argóint, ní uillinn. Níl aon éifeacht ag mód na huillinn (DEG/RAD/GRD) '
      'ar na feidhmeanna hipearbólacha — gan tiontú céimeanna, gan gaiste '
      'uillinne dosaenach mar atá le sin agus cos. Ciallaíonn sinh(2) an rud '
      'céanna i ngach mód. Ós rud é go bhfuil na feidhmeanna seo trasaendalach, '
      'iompraíonn a dtorthaí "≈" i gcónaí.',
    ),
    _P('Samplaí ríofa (gach toradh ≈, dosaenach gearrtha):'),
    _Pre(
      'Ionchur       deachúil    dosaenach\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1.1752      1.2128B7B6…\n'
      'cosh(1)       1.5431      1.66253A10…\n'
      'tanh(1)       0.7616      0.91804BB6…\n'
      'arsinh(1)     0.8814      0.A6B01B51…\n'
      'arcosh(2)     1.3170      1.397853260…',
    ),
    _P(
      'Is féidir an fhéiniúlacht bunúsach a sheiceáil go díreach: tugann '
      'cosh(2)² − sinh(2)² ≈1. Go matamaiticiúil is é go díreach 1 é; tá an '
      'fhuílleach beag pointe snámha faoi bhun thairseach na taispeána, agus '
      'ceapann an t-áireamhán ar an 1 ghlan é.',
    ),
    _P(
      'Lasmuigh dá réimse sainmhínithe tuairiscíonn na feidhmeanna earráid — '
      'ní mór ansin athshocrú le AC:',
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = deach. 0.5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      'Tá arsinh sainmhínithe do gach uimhir; éilíonn arcosh x ≥ 1; éilíonn '
      'artanh |x| < 1; maireann arcoth go díreach lasmuigh, ag |x| > 1. '
      'Duine a choinníonn é sin ina cheann seachnaíonn teachtaireachtaí '
      'earráide ón tús.',
    ),
  ]),
  ManualChapter('Set 9 & 10', [
    _P(
      'Cuachann an dá phainéal deiridh den phána síneadh a bhfuil de dhíth ar '
      'áireamhán eolaíoch eile: comhaireamh (fachtóiriúil agus comhchumasc), '
      'trí oibreoir úsáideach (luach absalóideach, coipriosclach, fuílleach) '
      'agus nodaireacht eolaíoch. Tá gach rud taobh thiar den eochair "…".',
    ),
    _H('Fachtóiriúil: geata an chomhairimh'),
    _P(
      'Is é fachtóiriúil slánuimhir n, scríofa n!, táirgeadh na n-uimhreacha '
      'ar fad ó 1 go n: n! = 1·2·3·…·n. Cás speisialta: 0! = 1. Tá na chéad '
      'luachanna neamhdhíobhálach — 3! = 6, 4! = 20, 5! = A0 (= 120 deachúil) '
      '— ach ansin pléascann an tsraith: tá 10! (fachtóiriúil dó dhéag) cheana '
      'féin 114500000 i mbonn dó dhéag, beagnach leath billiún.',
    ),
    _P(
      'Cén úsáid atá leis? Comhairíonn n! socruithe. Is féidir cúig aoi a '
      'shuí i gcomhair i 5! = A0 bealach: cúig rogha don chéad suíochán, '
      'ansin ceithre don dara ceann, trí don tríú ceann agus mar sin de. Is '
      'é an fachtóiriúil an bloc tógála do gach rud ina dhiaidh sin. Ar an '
      'áireamhán tá n! cruinn — ní iompraíonn an toradh "≈".',
    ),
    _H('Permutáidí: roghnú le hord'),
    _P(
      'Go minic ní socraíonn tú gach rud ach roghnaíonn r as n rudaí — agus '
      'tá ord tábhachtach. Rás le hocht tiománaí: cé mhéad podium (1ú, 2ú, '
      "3ú) atá indéanta? Ocht d'ór, seacht d'airgead, sé do chré-umha: "
      '8·7·6 = 240 (= 336 deachúil). Go ginearálta is é seo nPr '
      '(n permutáid r) = n!/(n−r)!. Roinntear ar (n−r)! toisc go dteipeann '
      'na fachtóirí íochtaracha.',
    ),
    _H('Comhchumasc: roghnú gan ord'),
    _P(
      'Uaireanta is cuma faoi ord — i lámh cártaí, sa chrannchur, i gcroitheadh '
      'láimhe. Tugtar nCr ("n roghnaigh r") ar líon na roghanna neamhordaithe '
      '= n!/(r!·(n−r)!). Tá an nasc simplí: is féidir gach rogha neamhordaithe '
      'de r rud a shocrú ar r! bealach, mar sin nCr = nPr/r!. Trí as sé do '
      'choiste: 6 nCr 3 = 18 (= 20 deachúil). Is é croitheadh láimhe i ngrúpa '
      'n duine n nCr 2 — le cúig dhuine A (= 10), le dosaen cheana 56 '
      '(= 66 deachúil).',
    ),
    _P(
      'Mínphointe faoin dá cheann: tógtar nCr agus nPr ó fhachtóiriúil '
      'pointe snámha agus dá bhrí sin iompraíonn siad "≈" i gcónaí, fiú nuair '
      'is slánuimhir é an toradh — mar atá beagnach i gcónaí. Sa chrannchur '
      'uimhreacha (sé as 49), mar shampla, tugann 49 nCr 6 ≈48245A0 — breis '
      'agus ceithre mhilliún déag féidearthacht do thicéad amháin.',
    ),
    _H("Triantán Pascal"),
    _P(
      'Socraigh na luachanna nCr líne ar líne agus feictear patrún: i líne n '
      'tá, ceann i ndiaidh a chéile, n nCr 0, n nCr 1, …, n nCr n. Is é gach '
      'uimhir suim na beirte os a cionn — mar sin fásann an triantán gan aon '
      'fhachtóiriúil. Is aon-uimhreacha iad na heagannaigh, agus tá sé '
      'siméadrach (n nCr r = n nCr (n−r)).',
    ),
    PascalTriangleFigure(title: "Triantán Pascal"),
    _P(
      'I mbonn dó dhéag breathnaíonn an triantán beagnach mar is gnáth — ach '
      'amháin go n-i líne 5 feictear "A" in ionad deich. Is iad na huimhreacha '
      'céanna, ar ndóigh, comhéifeachtaí (a+b)ⁿ: ó líne 4 (1, 4, 6, 4, 1) '
      'léitear (a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴ go díreach. Nascann '
      'sé seo comhchumasc agus ailgéabar in aon phictiúr amháin.',
    ),
    _H('Luach absalóideach agus coipriosclach'),
    _P(
      'Is é luach absalóideach |x| fad uimhir ó nialas — caitear an comhartha '
      'ar gcúl, |−7| = 7. Mínphointe ionchuir: ceanglaíonn na hoibreoirí '
      'iarchruinne (|x|, n!, 1/x) níos dlúithe ná míneas tosaigh. Tugann '
      '"−5" agus |x| ina dhiaidh dá bhrí sin −(|5|) = −5; más luach '
      'absalóideach na huimhre diúltaí atá uait, úsáid lúibíní: tugann '
      '(−5) ansin |x| 5.',
    ),
    _P(
      'Is é an coipriosclach 1/x an comhpháirtí iolraitheach: x · (1/x) = 1, '
      'agus coinníonn an t-áireamhán go cruinn é mar chodán. Léiríonn '
      'dosaenach seo go hálainn — is é 1/4 0.3 glan (trí dhosaoithe is '
      'ceathrú) agus is é 1/3 0.4, áit a bhfuil bonn deich ag dul isteach '
      'cheana sa 0.333… peiriadach. Níl coipriosclach nialais sainmhínithe.',
    ),
    _H('Modúl: fuílligh agus timthriallta'),
    _P(
      'Seacht roinnte ar thrí is ea dhó, fuílleach a haon — agus is é go '
      'díreach an fuílleach sin a thugann "7 mod 3 = 1". Is í an clog an '
      'pictiúr is soiléire: tar éis dó dhéag tosnaíonn an comhaireamh arís, '
      'is "2 a chlog tráthnóna" "14:00", toisc 14 mod 12 = 2. Ríomhann an '
      'clog i mbonn dó dhéag — ní taisme é sin.',
    ),
    ModuloClockFigure(
      title: 'Modúl — uimhríocht chloig',
      wrap: 'fillte timpeall',
      note: '(= 17 deach., 17 mod 12 = 5)',
    ),
    _P(
      'Is é modúl an uirlis nádúrtha don roinntacht: ciallaíonn a mod b = 0 '
      'go díreach go roinneann b a. Tugann dosaenach géire speisialta dó seo, '
      'toisc go bhfuil go leor rannóirí ag dó dhéag — 1, 2, 3, 4, 6 agus 12, '
      'i gcoinne ach 1, 2, 5, 10 do dheich. Is minic is féidir roinntacht ar '
      'dhó, trí, ceathair nó sé a léamh ó na figiúir deiridh i ndosaenach.',
    ),
    _H('Nodaireacht eolaíoch i gcumhachtaí dó dhéag'),
    _P(
      'Scríobhtar uimhreacha an-mhóra nó beaga go gonta mar mhantís in iolrú '
      'cumhacht an bhonin. I ndeachúil ciallaíonn "3 EXP 8" an luach 3 × 10⁸. '
      'Cuireann an t-áireamhán seo an prionsabal i bhfeidhm go comhsheasmhach '
      'i mbonn dó dhéag: i mód dosaenach ciallaíonn "a EXP b" ní a × 10ᵇ ach '
      'a × 12ᵇ. Comhairítear cumhachtaí dó dhéag leis an easpónant.',
    ),
    DozenalPowersScaleFigure(
      title: 'Cumhachtaí dó dhéag — 1 EXP n',
      dozLabel: 'Doz.',
      decLabel: 'Deach.',
    ),
    _P(
      'Tá ainmneacha féin ag na cumhachtaí seo: 12¹ = dosaen, 12² = 144 = '
      'gros, 12³ = 1728 = gros mór. I ndosaenach scríofa is iad sin go díreach '
      'na háiteanna cruinne 10, 100, 1000. Mar sin tugann "1 EXP 2" an luach '
      '100 (= 144 deachúil) agus "1 EXP 3" an luach 1000 (= 1728). Do '
      'easpónaint shlánuimhreacha ríomhann an rian cruinn; i mód deachúil '
      'comhairítear EXP i gcumhachtaí deiche arís.',
    ),
    _H('Mód uillinne agus dúnadh'),
    _P(
      'Tá DRG agus Close i Set 10 freisin. Rothlaíonn DRG mód na huillinn '
      '(DEG → RAD → GRD) do na feidhmeanna triantánaíochta — clúdaítear go '
      'mionchúiseach é sa chaibidil triantánaíochta; sa phróifíl "Simplí" '
      'socraítear é tríd na Socruithe. Fillean Close an pána síneadh arís, '
      'an frithpháirtí don eochair "…". D\'aistrigh an t-athróg Doz/Dez '
      'roimhe seo ó eochraíocht go Socruithe.',
    ),
    _H('Ar an áireamhán seo'),
    _P(
      'Sroichtear na heochracha seo ar fad tríd an bpána síneadh "…" (sa '
      'phróifíl "Simplí" tá Set 9 agus 10 ceilte). Gníomhaíonn n!, |x| agus '
      '1/x iarchruinn — ar dtús an uimhir, ansin an eochair; tá mod, nCr '
      'agus nPr déthoiseach (a mod b). Osclaíonn brú fada ar n! an phóca le '
      'nCr agus nPr; is leid é an cúinne beag ag bun na láimhe deise den '
      'eochair.',
    ),
    _P('Samplaí ríofa (i mód dosaenach):'),
    _Pre(
      'Ionchur       ciall                 Toradh\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       coipriosclach 4       0.3     (cruinn)\n'
      '7 mod 3       fuílleach 7 ÷ 3       1\n'
      '5 nCr 2       comhchumasc           ≈A      (= 10)\n'
      '8 nPr 3       permutáidí            ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      'Tá n!, |x|, 1/x agus mod cruinn (gan "≈"); ní iompraíonn ach nCr agus '
      'nPr an comhartha garbhála. Lasmuigh den raon bailí tuairiscíonn na '
      'feidhmeanna earráid — ansin athshocraigh le AC:',
    ),
    _Pre(
      '0 → 1/x       coipriosclach nialais DIV BY ZERO\n'
      '7 mod 0       fuílleach ar nialas   DOMAIN ERROR\n'
      '(−4)!         fachtóiriúil diúltach DOMAIN ERROR',
    ),
    _P(
      'Leis sin tá an bosca uirlisí iomlán: ó bhrú simplí figiúr na '
      'bunúsachta go comhchumasc, modúl agus nodaireacht ord-méide dosaenach, '
      'ríomhann an t-áireamhán go cruinn i ngach áit is féidir, agus go '
      'macánta le "≈" i ngach áit nach bhfuil indéanta ach garbhál.',
    ),
  ]),
];

// ---------------------------------------------------------------------------
// An tiontaire aonad a úsáid — an dara rannán den lámhleabhar. Aistriúchán
// iomlán ar an mbunleagan Gearmáinise (_converterManualChaptersDe).
// ---------------------------------------------------------------------------

List<ManualChapter> _converterManualChaptersGa() => const [
  ManualChapter('An dara háireamhán', [
    _P(
      'Taobh thiar den phríomháireamhán luíonn tiontaire aonad '
      'lánfheidhmiúil: tiontaíonn sé faid, meáchain, amanna, teochtaí '
      'agus dosaen catagóir eile idir an córas méadrach agus an córas '
      'impiriúil — i bhfigiúir dhosaenacha nó dheachúlacha, mar is '
      'rogha leat.',
    ),
    _H('Athrú anonn is anall'),
    _P(
      'Svuáil ar chlé ar an bpríomháireamhán, agus taispeánfar an '
      'tiontaire aonad. Svuáil ar dheis ar an tiontaire aonad, agus tá '
      'tú ar ais. Agus tú ag athrú, taispeánann dhá chárta '
      'thréshoilseacha ar feadh meandair cén leathanach ar a bhfuil tú — is é '
      'an cárta leis an imlíne órga an leathanach gníomhach.',
    ),
    _P(
      'Coinníonn an dá áireamhán a n-ionchur agus tú ag athrú: is '
      'féidir leat svuáil chuig an bpríomháireamhán i lár tiontaithe, '
      'rud éigin a ríomh ansiúd agus leanúint ar aghaidh gan uaim.',
    ),
  ]),
  ManualChapter('Catagóir, uimhir, aonad', [
    _P(
      'Cuimsíonn tiontú trí thapáil: catagóir a roghnú, uimhir a '
      'chlóscríobh, aonad a thapáil.',
    ),
    _H('An chatagóir'),
    _P(
      'Taispeánann an dá cholún eochracha ar dheis na catagóirí (Fad, '
      'Meáchan, Am, …; tuilleadh sa phainéal breisithe "…"). Osclaíonn '
      'tapáil ar chatagóir a dréimire aonad — taispeánann na heochracha '
      'timpeall na catagóire leis an imlíne órga a haonaid anois. '
      'Dúnann an dara tapáil an dréimire arís.',
    ),
    _H('Uimhir agus aonad'),
    _P(
      'Clóscríobh uimhir agus ansin eochair aonaid: tugann "144" agus '
      '"ft" 144 troigh. Taispeánann líne an toraidh láithreach an '
      'chainníocht chéanna in aonad eile, agus taispeánann an lúibín '
      'slabhrach lena hais an luach sa chóras eile.',
    ),
    _H('An eochair ='),
    _P(
      'Taispeánann gach brú ar = an chéad aonad eile den dréimire — '
      'mar sin siúlann tú trí léirithe uile na cainníochta céanna. Sa '
      'domhan impiriúil tagann an nodaireacht mheasctha ag an deireadh, '
      'mar shampla "1 yd 2 ft 3 in", sula dtosaíonn an timthriall arís '
      'ón tús.',
    ),
    _P(
      'Má athraíonn tú go catagóir eile, caitear na téarmaí '
      'críochnaithe i leataobh — ach fanann uimhir atá clóscríofa '
      'cheana, mar sin is féidir leat an uimhir a roghnú ar dtús agus '
      'ansin an chatagóir.',
    ),
  ]),
  ManualChapter('Méadrach, impiriúil agus na dathanna', [
    _H('An dá eochair chruinne'),
    _P(
      'Ar chlé agus ar dheis na heochrach =, suíonn "met" (uaine) agus '
      '"imp" (corcra). Athraíonn siad idir an córas aonad méadrach agus '
      'an córas impiriúil — fanann an luach mar an gcéanna go '
      'fisiciúil: éiríonn 144 ft ina 43.89 m, ní ina 144 m. Iompraíonn '
      'an taobh gníomhach fáinne ina dhath féin.',
    ),
    _H('Córas na ndathanna'),
    _P(
      'Seasann uaine i ngach áit san aip do dhomhan an deich: aonaid '
      'mhéadracha agus figiúir dheachúlacha. Seasann corcra do dhomhan '
      'an dó dhéag: aonaid impiriúla agus figiúir dhosaenacha. '
      'Taispeántar siombailí aonaid mar "m" nó "ft" i ndath a gcórais, '
      'an comhartha DOZ/DEZ ag bun na láimhe deise i ndath a bhoinn — '
      'agus lonraíonn an lúibín slabhrach i gcónaí i ndath an domhain '
      'a thaispeánann sé.',
    ),
    _H('Dosaenach nó deachúil'),
    _P(
      'Tá bonn na bhfigiúr neamhspleách ar chóras na n-aonad agus '
      'baineann sé leis an dá áireamhán i gcomhpháirt. Athraíonn tú é '
      'sna Socruithe → Córas uimhreacha — fiú i lár tiontaithe; '
      'caomhnaítear na luachanna. Mar sin is féidir leat aonaid '
      'mhéadracha a léamh go dosaenach, nó cinn impiriúla go deachúil.',
    ),
  ]),
  ManualChapter('Roinnt téarmaí: + agus −', [
    _P(
      'Laistigh de chatagóir is féidir leat cainníochtaí a nascadh le '
      'chéile: tugann "5" "ft" "3" "in" 5 troigh móide 3 orlach. Fanann '
      'an comhartha móide dofheicthe chomh fada agus atá na haonaid '
      'éagsúil; taispeántar é le haonaid chomhionanna ("3 h + 2 h").',
    ),
    _P(
      'Dealaíonn an eochair − an chéad téarma eile: tugann "5" "ft" '
      '"−" "3" "in" 5 troigh lúide 3 orlach. Bíonn an comhartha lúide '
      'le feiceáil i gcónaí, agus iompraíonn an eochair − fráma órga '
      'fad atá sí ar tinneall.',
    ),
    _H('Ceartú'),
    _P(
      'Tapáil ar líne an ionchuir chun an cúrsóir dearg a shocrú — i '
      'lár uimhreach nó idir dhá théarma. Taispeántar figiúir ag an '
      'gcúrsóir, baineann Del an carachtar roimhe; má sheasann an '
      'cúrsóir ag teorainn téarma, baineann Del an téarma iomlán '
      'roimhe. Glanann AC gach rud.',
    ),
  ]),
  ManualChapter('Ríomh san ionchur: × ÷ ⊕ ^ √ ㏒', [
    _P(
      'Is féidir leis an uimhir chlóscríofa féin a bheith ina ríomhadh '
      'beag: tugann "3 × 2" agus ansin "ft" 6 troigh. Ríomhtar go '
      'docht ó chlé go deas é, ag an tapáil ar an aonad.',
    ),
    _P(
      'Má bhrúnn tú oibreoir ríomha agus slonn críochnaithe ann '
      'cheana, tiontaítear é ar dtús ina fhigiúir ar féidir iad a chur '
      'in eagar — an luach iomlán san aonad is déanaí a úsáideadh. '
      'Éiríonn "5 ft 3 in" agus "×" mar sin ina uimhir faoi …, a '
      'chríochnaíonn tú le "2" agus aonad.',
    ),
    _H('Na hoibreoirí speisialta'),
    _P(
      'I gcás fréimhe agus logartaim seasann an chéim nó an bonn ar '
      'chlé: is é "2 √ 9" fréamh chearnach 9, is é sin 3; is é "2 ㏒ 8" '
      'logartam 8 le bonn 2, is é sin 3. Cruthaíonn an ⊕ an tsuim '
      'chomhthreomhar a·b/(a+b), atá ar eolas ó fhriotóirí '
      'comhthreomhara.',
    ),
    _P(
      'Féadfaidh gach deighleog den ríomhadh a pointe deachúlach féin '
      'a iompar ("1.6 × 0.6"). Nuair a athraítear bonn na bhfigiúr, '
      'tiontaítear uimhreacha uile an ríomhaidh ceann ar cheann.',
    ),
  ]),
  ManualChapter('Cuimhne, tairisigh agus an droichead', [
    _H('An chuimhne'),
    _P(
      'Sa phainéal breisithe "…" tá STO, RCL agus MC: meabhraíonn STO '
      'uimhir líne an toraidh — nó, mura bhfuil aonad roghnaithe fós, '
      'an t-ionchur clóscríofa. Cuireann RCL an luach stóráilte '
      'isteach arís, glanann MC é. Má tá RCL agus MC liath, tá an '
      'chuimhne folamh.',
    ),
    _H('Na tairisigh'),
    _P(
      'Cuireann π, e, φ agus √2 a luach mar fhigiúir in áit na '
      'huimhreach ag an gcúrsóir — áisiúil d\'imlínte agus do '
      'chóimheasa: tugann "3" "×" "π" "ft" imlíne ciorcail le '
      'trastomhas 3 troigh.',
    ),
    _H('An droichead chuig an bpríomháireamhán'),
    _P(
      'Faigheann an eochair Ans toradh deireanach an phríomháireamháin '
      'isteach san ionchur — ríomh rud éigin ansiúd, svuáil anall agus '
      'tabhair aonad don luach. Os a choinne sin, faigheann an eochair '
      'CONV i bpainéal breisithe an phríomháireamháin an uimhir ó líne '
      'thoraidh an tiontaire aonad. Taistealaíonn luachanna mar '
      'uimhir, agus taispeántar iad go huathoibríoch i mbonn an '
      'leathanaigh sprice.',
    ),
  ]),
];
