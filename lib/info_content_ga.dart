part of 'info_content.dart';

/// Irish (Gaeilge) chapter content. Uses the locale-specific dozenal
/// pronunciation convention designed for Irish grammar:
///   * Base unit "dosaen" (Irish loan-word for "dozen"), masculine.
///     Lenition/eclipsis rules apply per Irish numeric agreement:
///     1 → dosaen ; 2 → dhá dhosaen (lenited) ; 3–6 → trí/ceithre/cúig/sé
///     dhosaen (lenited) ; 7–10 → seacht/ocht/naoi/deich ndosaen
///     (eclipsed) ; 11 → aon dosaen déag (Irish "teens" affix).
///   * A = "deich" (10), B = "aon déag" (11) — same values as Irish
///     decimal counting forms.
///   * Higher magnitudes 12²–12⁷ are transliterated Germanic loan-words:
///     "quader, cuber, tesser, penter, hexer, hepter" — invariant, no
///     Irish mutations (foreign-stem convention).
///   * Pure juxtaposition between magnitudes (mirrors Irish decimal
///     "céad fiche a trí" = 123); "a" particle before the final unit
///     position only (parallel to "fiche a trí").
///   * Multiplier 1 implicit (dosaen not "aon dosaen"; quader not
///     "aon quader").
///   * Western digits throughout for math content (matches calc
///     display); Irish for prose.
///
/// Quality note: drafted without native-speaker review — Irish
/// mathematical idiom may need polishing. Mutation rules applied
/// systematically but stylistic naturalness benefits from review by
/// a Gaeilge speaker.
List<Widget> _chapterGa(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H("Na figiúir"),
        const _P(
          "Úsáideann an t-áireamhán seo siombailí dá chuid féin do gach "
          "dáréag figiúr. Tá ceithre fhigiúr ancaire ina mbarra ríme "
          "stílithe ag taispeáint sna ceithre treo cardiacha — 1 (suas), "
          "4 (ar chlé), 7 (ar dheis), A (síos). Roinneann siad an ciorcal "
          "uimhreach ina cheithre ghrúpa de thrí, cosúil leis na huaireanta "
          "12, 3, 6 agus 9 ar aghaidh chloig.",
        ),
        const _P(
          "Tá gach figiúr eile eatarthu tógtha ó leathchiorcail agus "
          "ciorcail iomlána. Is ciorcal simplí an náid, agus is ciorcal "
          "líonta B (= aon déag).",
        ),
        const _DigitLegend(),
        const _H("Bunúsach"),
        const _P(
          "Iontráil uimhreacha agus oibreoirí cosúil le háireamhán póca "
          "gnáth. Brúigh an eochair leathan = ag an mbun chun an toradh a "
          "ríomh. Glanann AC (i ndearg foláirimh) an t-ionchur agus an "
          "toradh ar fad ; baineann Del an carachtar ar chlé an chúrsóra.",
        ),
        const _H("Cabhair agus teoiric"),
        const _P(
          "Ar chlé agus ar dheis na heochrach =, suíonn dhá chnaipe "
          "ciorclacha: osclaíonn (i) an dáréag caibidil teoirice seo, "
          "athchasann (?) an turas tapa leis na marcóirí dearga. Osclaíonn "
          "an turas go huathoibríoch ar an chéad tús.",
        ),
        const _H("Cúrsóir agus loingseoireacht"),
        const _P(
          "Is é an barra dearg sa réimse ionchuir an cúrsóir. Bain úsáid "
          "as ◀ agus ▶ chun é a bhogadh, carachtair a chur isteach nó a "
          "scriosadh i lár foirmle. Tar éis ríomhadh, bogann an cúrsóir "
          "isteach sa réimse toraidh — bogann na saigheada an cúrsóir "
          "toraidh ansin. Chomh luath agus a thosaíonn tú ionchur nua, "
          "léimeann an cúrsóir ar ais chuig an réimse ionchuir.",
        ),
        const _H("Leanúint ar ríomhadh"),
        const _P(
          "Tar éis ríomhadh, is féidir leat leanúint go díreach le "
          "hoibreoir. Iontráil + 5 = mar shampla, agus úsáideann an "
          "t-áireamhán an toradh deireanach go huathoibríoch mar an chéad "
          "operand. Chun ríomhadh ar fad nua a thosú, brúigh AC ar dtús.",
        ),
        const _H("Brú dúbailte d'fheidhmeanna inbhéartacha"),
        const _P(
          "Athraíonn an dara brú ar eochair feidhme í chuig a "
          "inbhéartach: éiríonn sin ina sin⁻¹, cos ina cos⁻¹, agus mar "
          "sin de. Baineann an riail chéanna leis na feidhmeanna "
          "hipearbólacha sa phána síneadh. Léiríonn ponc beag órga ar an "
          "eochair go ndéanfaidh an chéad bhrú eile inbhéartú.",
        ),
        const _H("Oibreoirí speisialta"),
        const _P(
          "Cearnaíonn x² an uimhir roimhe. Ríomhann √ an fhréamh chearnach "
          "— má sheasann uimhir ar a chlé, úsáidtear an uimhir sin mar "
          "céim na fréimhe: tugann 3√27 fréamh chiúbach 27. Ríomhann log "
          "an logartam le bonn na huimhreach roimhe. Ríomhann ⊕ an "
          "suim chomhthreomhar: a ⊕ b = (a·b)/(a+b), úsáideach do "
          "fhriotaí comhthreomhara.",
        ),
        const _H("Pána síneadh"),
        const _P(
          "Osclaíonn an eochair … ag bun na láimhe deise an pána síneadh "
          "le feidhmeanna breise: cuimhne, tairisigh (π, e, φ, √2), "
          "feidhmeanna hipearbólacha, oibreoirí ardleibhéil agus "
          "socruithe. Dúnann an eochair chéanna é, nó cniogadh lasmuigh "
          "den phána. Ar tháibléid tá na tacair go léir le feiceáil le "
          "chéile pé scéal é — níl forshrac ann.",
        ),
        const _Pre(
          "  6 — Cuimhne:       STO   RCL   MC    Ans\n"
          "  7 — Tairisigh:     π     e     φ     √2\n"
          "  8 — Hipearbólach:  sinh  cosh  tanh  coth\n"
          "  9 — Ardleibhéil:   n!    |x|   1/x   mod\n"
          "  10 — Móid:         Doz   Dez   DRG   …",
        ),
        const _H("Cuimhne"),
        const _P(
          "Stórálann STO an toradh reatha, cuireann RCL an luach stóráilte "
          "isteach san ionchur, glanann MC an chuimhne. Léiríonn M beag "
          "ar an taispeáint go bhfuil rud éigin stóráilte. Cuireann Ans "
          "toradh an ríomhaidh deireanaigh isteach — stóráiltear luachanna "
          "réasúnacha cruinne go hiomlán, caomhnaítear an phriacúlacht.",
        ),
        const _H("Líne na tréimhse"),
        const _P(
          "Nuair is codán peiriadach an toradh, marcálann an t-áireamhán "
          "na figiúir athrá le líne os a gcionn. Sampla: tugann 1/5 "
          "0.2497 le líne os cionn na ceithre figiúr ar fad. Le haghaidh "
          "tréimhsí níos faide ná cúig fhigiúr, taispeántar ach an chéad "
          "chúig, agus ina dhiaidh sin …",
        ),
        const _H("Córas uimhrithe: Doz / Dez"),
        const _P(
          "Sa phána síneadh, suíonn dhá eochair Doz agus Dez taobh le "
          "taobh. Tá ceann amháin díobh i gcónaí gníomhach (le himlíne), "
          "agus taispeántar an córas gníomhach ag barr na láimhe deise "
          "den taispeáint. I mód Doz ríomhann an t-áireamhán i mbonn 12 "
          "(réamhshocrú) ; i mód Dez i mbonn 10.",
        ),
        const _P(
          "Ag aistriú, déantar an uimhir reatha le feiceáil a thiontú go "
          "huathoibríoch chuig an gcóras eile. Éiríonn « 10 » i nDoz ina "
          "« 12 » i nDez. I mód Dez éiríonn na siombailí do 10 agus 11 "
          "neamhghníomhach (liath), mar ní bhíonn siad ann mar fhigiúir "
          "aonair i mbonn 10 — le haghaidh Doz, ach aistrigh ar ais.",
        ),
        const _H("Mód uillinne"),
        const _P(
          "Athraíonn DRG mód na huillinne d'fheidhmeanna triantánaíochta: "
          "DEG → RAD → GRAD → DEG. Taispeántar an mód reatha ag barr na "
          "láimhe deise den taispeáint, díreach os cionn an táscaire "
          "Doz/Dez. Réamhshocrú: DEG.",
        ),
      ];
    case 1:
      return [
        const _H("An prionsabal"),
        const _P(
          "Sa chóras deachúil, tá luach gach suímh deich n-oiread níos "
          "mó ná an ceann ar a dheis: aonaid, deich, céadta. Sa chóras "
          "dosaenach, is é dáréag an bonn, ní deich. Is cumhachtaí 12 "
          "iad luachanna na suímh: aonaid, dosaeineacha, "
          "céad-daichead-a-ceathaireacha. Ní chiallaíonn an uimhir "
          "« 100 » deich faoi dheich anseo ach dáréag faoi dháréag — "
          "is é sin 144 i ndeachúil.",
        ),
        const _P(
          "Teastaíonn dáréag figiúr in ionad deich figiúr chuige seo. "
          "Cuirtear dhá cheann nua leis do na luachanna deich agus aon "
          "déag, agus tugann an t-áireamhán seo siombailí dá gcuid féin "
          "dóibh (A = deich, B = aon déag). Sampla: 2B (dosaenach) = "
          "2·12 + 11 = 35 (deachúil).",
        ),
        const _H("Conas an córas dosaenach a fhuaimniú?"),
        const _P(
          "Fanann na haonaid 0–9 mar atá aithne agat orthu: a náid, a "
          "haon, a dó … a naoi. Léitear na glifeanna nua A agus B mar "
          "deich agus aon déag — an chéad luach is na focail aitheanta, "
          "gan stór focal nua le foghlaim. Léitear an dáréag féin — "
          "scríofa mar « 10 » — mar dosaen. Chun mearbhall a sheachaint "
          "idir uimhreacha deachúla agus dosaenacha sa chaibidil seo, "
          "marcaíonn réimír bheag e an léamh deachúil agus o beag an "
          "léamh dosaenach: e144 = o100, an luach céanna ag an dá rud.",
        ),
        const _P(
          "Leanann an t-ord focal loighic na Gaeilge: an mhéid is mó "
          "ar dtús, an mhéid is lú ina dhiaidh. Sa raon faoi-quader "
          "(dosaeineacha + aonaid), tá an fhoirm le particúl « a » roimh "
          "an aonad, mar atá in « fiche a trí »: léitear o11 mar "
          "« dosaen a haon », o23 mar « dhá dhosaen a trí ». Téann "
          "iolraitheoirí 2 go B roimh dosaen mar fhocal scartha: dhá "
          "dhosaen (o20 = e24), trí dhosaen, …, naoi ndosaen (o90 = e108). "
          "Le A nó B i suíomh na ndosaeineacha: deich ndosaen (oA0 = "
          "e120), aon dosaen déag (oB0 = e132). Tá iolraitheoir 1 "
          "intuigthe: léitear o10 mar « dosaen » go simplí, ní mar "
          "« dosaen amháin ».",
        ),
        const _P(
          "Baineann rialacha séimhithe agus uraithe na Gaeilge le "
          "« dosaen »: iolraitheoir 1 → dosaen (gan athrú) ; 2–6 → dhá/"
          "trí/ceithre/cúig/sé dhosaen (séimhiú: d → dh) ; 7–10 → "
          "seacht/ocht/naoi/deich ndosaen (urú: d → nd) ; 11 → aon "
          "dosaen déag (foirm na ndéagóirí).",
        ),
        const _P(
          "Cuireann an Ghaeilge na méideanna le chéile trí "
          "ghluaisteánú gan cheangaltach — mar atá in « céad fiche a "
          "trí » (123), ní « céad agus fiche a trí ». Mar sin léitear "
          "o101 mar « quader a haon », o123 mar « quader dhá dhosaen "
          "a trí », o2300 mar « dhá cuber trí quader ». Léimtear "
          "thar mhéideanna folmha: léitear o1023 mar « cuber dhá "
          "dhosaen a trí », ní mar « cuber náid quader … ».",
        ),
        const _Pre(
          "Deachúil    Dosaenach    Fuaimniú\n"
          "       10           A    deich\n"
          "       11           B    aon déag\n"
          "       12          10    dosaen\n"
          "       13          11    dosaen a haon\n"
          "       14          12    dosaen a dó\n"
          "       20          18    dosaen a hocht\n"
          "       22          1A    dosaen a deich\n"
          "       23          1B    dosaen aon déag\n"
          "       24          20    dhá dhosaen\n"
          "       25          21    dhá dhosaen a haon\n"
          "       36          30    trí dhosaen\n"
          "       48          40    ceithre dhosaen\n"
          "       60          50    cúig dhosaen\n"
          "       72          60    sé dhosaen\n"
          "       84          70    seacht ndosaen\n"
          "       96          80    ocht ndosaen\n"
          "      101          85    ocht ndosaen a cúig\n"
          "      108          90    naoi ndosaen\n"
          "      120          A0    deich ndosaen\n"
          "      132          B0    aon dosaen déag\n"
          "      143          BB    aon dosaen déag aon déag\n"
          "      ...         ...    agus mar sin de…",
        ),
        const _H("Na méideanna níos airde"),
        const _P(
          "Os cionn an dosaen tagann sraith méideanna spreagtha go "
          "céimseatúil — ceann le haghaidh gach suímh dhosaenach, ceann "
          "le haghaidh gach toise. Ainmníonn quader an cearnóg 2T "
          "(12² = e144), cuber an ciúb clasaiceach (12³ = e1728), "
          "tesser an teasarach ceithre-thoiseach (12⁴), agus ansin "
          "leanann na hipirchiúbanna uimhrithe le Gréigis: penter "
          "(12⁵), hexer (12⁶), hepter (12⁷). Tá gach céim toise amháin "
          "níos airde agus suíomh dosaenach amháin níos faide.",
        ),
        const _Pre(
          " Deachúil    Dosaenach    Fuaimniú\n"
          "      144         100    quader   (12²)\n"
          "     1728        1000    cuber    (12³)\n"
          "    20736       10000    tesser   (12⁴)\n"
          "   248832      100000    penter   (12⁵)\n"
          "  2985984     1000000    hexer    (12⁶)\n"
          " 35831808    10000000    hepter   (12⁷)\n"
          "      ...         ...    agus mar sin de…",
        ),
        const _P(
          "Fanann na méideanna iasachta germanacha (quader, cuber, "
          "tesser, penter, hexer, hepter) gan athrú — gan séimhiú ná "
          "urú — toisc gur focail iasachta iad. Baineann séimhiú agus "
          "urú le « dosaen » amháin, an focal dúchasach Gaeilge.",
        ),
        const _H("Cén fáth dáréag go díreach?"),
        const _P(
          "Is é an inroinnteacht an chúis. Tá sé roinnteoirí ag dáréag: "
          "1, 2, 3, 4, 6 agus 12. Níl ach ceithre cinn ag deich: 1, 2, "
          "5 agus 10. Is cosúil go bhfuil sin difríocht bheag, ach tá "
          "an tionchar ar ríomhaireacht laethúil suntasach — go háirithe "
          "le codáin.",
        ),
        const _H("Aoncodáin i gcomparáid"),
        const _Pre(
          "  Codán       Bonn 10    Bonn 12\n"
          "  1/2         0.5        0.6\n"
          "  1/3         0.333…     0.4\n"
          "  1/4         0.25       0.3\n"
          "  1/5         0.2        0.2497…\n"
          "  1/6         0.166…     0.2\n"
          "  1/8         0.125      0.16\n"
          "  1/9         0.111…     0.14\n"
          "  1/10        0.1        0.1249…\n"
          "  1/12        0.0833…    0.1",
        ),
        const _P(
          "I mbonn 10 is codáin pheiriadacha gan teorainn iad na "
          "tríonna agus na séú. I mbonn 12 tá siad gairid agus cruinn. "
          "Mar mhalairt éiríonn na cúigiú agus na deichiú peiriadach — "
          "trádáil chothrom má smaoinítear ar cé chomh minic a "
          "roinneann muid ar a trí agus a ceathair, i gcomparáid le "
          "cúig.",
        ),
        const _H("An riail taobh thiar"),
        const _P(
          "Cén codáin atá teoranta agus cén cinn a éiríonn peiriadach, "
          "leanann sé dlí simplí: tá léiriú teoranta ag codán 1/n i "
          "mbonn b díreach nuair atá gach príomhfhachtóir n ina "
          "phríomhfhachtóir b chomh maith. Príomhfhachtóirí 12 — sin 2 "
          "agus 3. Mar sin tá gach codán teoranta a bhfuil a "
          "ainmneoir comhdhéanta de dhónna agus tríonna amháin. Tá "
          "gach rud eile — ainmneoirí le 5, 7 nó 11 — peiriadach. "
          "Marcaíonn an t-áireamhán an phriacúlacht seo le líne os "
          "cionn na bhfigiúr athrá.",
        ),
        const _H("Loirg sa stair"),
        const _P(
          "Tá an dáréag mar mhéid eagrúcháin níos sine ná aon chóras "
          "uimhrithe. Bhí na Babylónaigh ag ríomhadh i mbonn 60 ach "
          "d'eagraigh siad a bhfigiúir i ngrúpaí 12. Sa tráchtáil "
          "comhairtí daoine de réir dosaeineacha (12) agus ghrósanna "
          "(144 = 12²). Tá 2×12 uair an chloig sa lá, 12 mhí sa "
          "bhliain, an ciorcal iomlán 360 = 30×12 céim.",
        ),
        const _P(
          "Oibríonn an Cumann Dosaenach Mheiriceá (Dozenal Society of "
          "America, bunaithe i 1944, le craobhacha i dtíortha eile inniu) "
          "chun buntáistí bhonn 12 a chur ar an eolas níos fearr. "
          "Seasann an t-áireamhán seo sa traidisiún seo — ní mar "
          "éileamh ar athrú córais, ach mar uirlis taiscéalaíochta "
          "agus mhachnaimh.",
        ),
      ];
    case 2:
      return [
        const _H("144 — áit a gcasann dhá shaol"),
        const _P(
          "Tosaíonn an tsraith Fibonacci le 1, 1, agus is é suim an dá "
          "uimhir roimhe gach uimhir eile: 1, 1, 2, 3, 5, 8, 13, 21, "
          "34, 55, 89, 144, … Fásann sí go heaspónantúil. Fásann na "
          "huimhreacha cearnacha — 1, 4, 9, 16, 25, 36, … — go "
          "céadarúil amháin. Is annamh a bhíonn cúis ag dhá shraith "
          "chomh difriúil seo casadh le chéile. Agus fós déanann siad "
          "sin: is é 144 an dóú huimhir déag Fibonacci, agus 144 = 12².",
        ),
        const _P(
          "Chruthaigh J. H. E. Cohn in 1964 nach comhtharlú é seo ach "
          "imeacht uathúil: seachas F(1) = F(2) = 1, níl aon "
          "uimhir Fibonacci eile ina cearnóg foirfe ag an am céanna. "
          "Seasann an dáréag ag crosbhealach uathúil de dhá shraith "
          "uimhreach bhunaidh.",
        ),
        const _H("An cóimheas órga"),
        const _P(
          "Is é φ = (1+√5)/2 ≈ 1.618 an teorainn ag cóimheas uimhreacha "
          "Fibonacci as a chéile: F(n+1)/F(n) → φ. I mbonn 12: φ ≈ "
          "1.74BB677… — tá φ ag an áireamhán mar thairiseach sa phána "
          "síneadh.",
        ),
        const _P(
          "Má iontrálann tú φ² =, feicfidh tú gurb é φ+1 an toradh go "
          "díreach — sainghné an chóimheasa órga. Déanann an aitheantas "
          "seo de φ tairiseach algéabrach uathúil.",
        ),
        const _H(
            "12 = 2² × 3 — díscaoileadh príomhfhachtóirí le hiarmhairtí"),
        const _P(
          "Is uimhir an-ilchodach í dáréag (highly composite number): "
          "tá níos mó roinnteoirí aici ná aon uimhir nádúrtha níos lú. "
          "Is iad roinnteoirí 12: 1, 2, 3, 4, 6, 12 — sin sé cinn. "
          "Sainmhínigh agus rinne Srinivasa Ramanujan staidéar ar an "
          "rang uimhreacha seo i bpáipéar cáiliúil 1915 in Proceedings "
          "of the London Mathematical Society.",
        ),
        const _P(
          "Is í an dáréag freisin an uimhir is lú flúirseach: tá suim "
          "a roinnteoirí dílseacht (1+2+3+4+6 = 16) níos mó ná an "
          "uimhir féin. Le formhór na n-uimhreacha beaga is é a "
          "mhalairt: do 10, tá 1+2+5 = 8, atá níos lú ná 10. Is í an "
          "dáréag an chéad uimhir ina « sceitheann » na roinnteoirí.",
        ),
        const _H("Cathair idéalach Phlatóin"),
        const _P(
          "Ina « Dlíthe » (Leabhar V), cuireann Platón an cheist cé "
          "mhéad saoránach a bheadh ag cathair idéalach. A fhreagra: "
          "5040. Níl an argóint mistéireach ach praiticiúil: caithfidh "
          "cathair a saoránaigh a roinnt go leanúnach i ngrúpaí "
          "comhionann. Tá 5040 inroinnte ag gach uimhir ó 1 go 12 (le "
          "haon eisceacht 11).",
        ),
        const _P(
          "An rud a chuireann Platón síos go hintuiseach, sin an léargas "
          "céanna ar a bhfuil an córas dosaenach bunaithe: sa saol "
          "laethúil, is iad na roinnteoirí beaga atá tábhachtach. Is "
          "í 5040 = 7! deirfiúr mhór an dáréag — an fealsúnacht "
          "inroinnteachta céanna á cur i bhfeidhm ar daonra "
          "uirbeach iomlán.",
        ),
      ];
    case 3:
      return [
        const _H("Cad is dóideacagán rialta ann?"),
        const _P(
          "Is iolán é dóideacagán rialta a bhfuil dhá thaobh dhéag "
          "chomhionann aige agus dhá uillinn istigh dhéag chomhionann. "
          "Tomhaiseann gach uillinn istigh 150° — nó, in dosaenach, "
          "106°. Is ceann de na cruthanna geoiméadracha is sine agus "
          "is minice úsáidte é: feictear é ar aghaidheanna cloig, ar "
          "bhoinn airgid, ar mhaisiúcháin ailtireachta agus ar phatrúin "
          "pábháilte.",
        ),
        const _H("Scian Eilvéiseach na n-iolán"),
        const _P(
          "An rud a fhágann an dóideacagán uathúil ní hé a chruth féin "
          "ach gach a bhfuil istigh ann. Trí gach ceathrú rinn a "
          "cheangal, faightear triantán comhshleasach — go cruinn, ní "
          "le neasluach. Tugann gach tríú rinn cearnóg. Gach dara rinn "
          "tugann sé heicseagán rialta. Suíonn na trí chruth go cruinn "
          "san aon chiorcal a chuimsíonn an dóideacagán.",
        ),
        const _P(
          "Ciallaíonn sé seo: tá na trí iolán rialta bhunúsacha de "
          "ghéiméadracht san dóideacagán mar shubhsléanna cruinne. Ní "
          "féidir le haon iolán eile a bhfuil chomh beag de rinní aige "
          "an méid céanna a rá faoi féin. Toradh díreach ar "
          "inroinnteacht 12 le 2, 3, 4 agus 6.",
        ),
        const _H("Inthógtha le compás agus rialóir"),
        const _P(
          "Ní féidir gach iolán rialta a thógáil go cruinn le compás "
          "agus rialóir. Tá an dóideacagán, áfach, inthógtha: tosaítear "
          "le ciorcal, roinntear é ina shé phíosa chomhionanna (éiríonn "
          "leis seo, mar tá an heicseagán inthógtha), ansin déantar "
          "gach ceann de na stuanna seo a dhéthapscaiteoireacht, agus "
          "faighimid dhá phointe déag scaipthe go cothrom ar an "
          "gciorcal.",
        ),
        const _P(
          "An bonn matamaiticiúil: tá n-uillíoch rialta inthógtha go "
          "díreach nuair atá n ina dtáirge cumhachta dhá agus "
          "príomhuimhreacha Fermat éagsúla (Gauss, 1796). Le haghaidh "
          "12 = 2² × 3, comhlíontar é seo, mar is príomhuimhir Fermat "
          "í 3.",
        ),
        const _H("Siméadracht"),
        const _P(
          "Tá 24 siméadracht ag an dóideacagán rialta: 12 rothlú (de "
          "0°, 30°, 60°, …, 330°) agus 12 frithchaitheamh (6 trí "
          "rinní os comhair a chéile, 6 trí lárphointí na dtaobhanna "
          "os comhair a chéile). I dteanga an algéabra cruthaíonn na 24 "
          "siméadracht seo an grúpa dé-dromchla D₁₂. Tá 2n siméadracht "
          "go díreach ag gach n-uillíoch rialta.",
        ),
        const _Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H("54 trasnán"),
        const _P(
          "Ceanglaíonn trasnán dhá rinn neamhchóngarach in iolán. "
          "Tugann an fhoirmle n(n−3)/2 don dóideacagán 12×9/2 = 54 "
          "trasnán. Tá an fhuaim seo cosúil le líonra casta — ach tá "
          "an struchtúr eagraithe go suntasach.",
        ),
        const _H("Sé fhad éagsúla"),
        const _P(
          "Léimeann gach trasnán líon áirithe rinní. Toisc go bhfuil "
          "an dóideacagán siméadrach, tá an fhad chéanna ag gach "
          "trasnán a léimeann an líon céanna rinní. Tá cúig leithead "
          "léim féideartha (1 go 5 rinní), móide an trastomhas le 6 — "
          "is é sin sé chineál fad san iomlán. Ag fad taoibhe s = 1:",
        ),
        const _Pre(
          "  Cineál      Léim            Fad (cruinn)         Neas.\n"
          "  s (taobh)   —               1                    1.000\n"
          "  d₂          1 rinn          √(2+√3)              1.932\n"
          "  d₃          2 rinn          1+√3                 2.732\n"
          "  d₄          3 rinn          (3√2+√6)/2           3.346\n"
          "  d₅          4 rinn          2+√3                 3.732\n"
          "  d₆ (⌀)      5 rinn          √6+√2                3.864",
        ),
        const _H("Patrúin folaithe"),
        const _P(
          "Tá an tríú agus an cúigiú trasnán difriúil go díreach 1: "
          "d₃ = 1+√3 agus d₅ = 2+√3. Tá an difríocht cothrom le fad "
          "an taoibh féin — fíric gheoiméadrach, ní ríomhaireachtúil.",
        ),
        const _P(
          "Tá an trastomhas d₆ go díreach dhá oiread chomh fada leis "
          "an trasnán is giorra d₂: √6+√2 = 2·√(2+√3). Tá an "
          "trastomhas agus an trasnán is giorra sa chóimheas 2:1 — an "
          "comhréir chéanna leis an ochtréad sa cheol.",
        ),
        const _H("An t-eangach 15 chéim"),
        const _P(
          "Tá gach uillinn a thagann chun cinn sa dóideacagán — idir "
          "taobhanna, idir trasnáin — ina iolraí de 15°. Tá sé seo "
          "amhlaidh toisc go roinneann an dáréag rinn an ciorcal "
          "iomlán ina dáréag earnáil de 30° an ceann. 15° = 1/24 den "
          "chiorcal iomlán. In dosaenach: 15° = 13°doz, agus 30° = "
          "26°doz. Is féidir gach uillinn a thagann i láthair a "
          "scríobh in dosaenach mar iolraí slán de 13°.",
        ),
        const _Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H("Achar an dóideacagán"),
        const _P(
          "Tá achar A = 3s²(2+√3) ag dóideacagán rialta le fad taoibhe "
          "s. Tá an díorthú intuiteach: gearrtar an dóideacagán óna "
          "lárphointe ina 12 thriantán chomhshleasach chomhionanna, "
          "ríomhtar achar triantáin amháin, agus iolraítear ar 12.",
        ),
        const _P(
          "Ag s = 1 tugann sé seo A ≈ 11.196 (deachúil). Le "
          "comparáid: tá achar πR² ≈ 11.725 ag an gciorcal "
          "imchuimsíoch. Líonann an dóideacagán a chiorcal "
          "imchuimsíoch níos mó ná 95% — go suntasach níos fearr ná "
          "heicseagán (83%) agus i bhfad níos fearr ná cearnóg "
          "(64%) nó triantán (41%).",
        ),
        const _H("3/π — cóimheas galánta"),
        const _P(
          "Simplítear an cóimheas idir achar an dóideacagán agus achar "
          "an chiorcail imchuimsíoch go 3/π. Úsáideann an díorthú "
          "sin²(15°) = (2−√3)/4, a chealaíonn an fachtóir (2+√3)(2−√3) "
          "go 1 sa chóimheas, ag fágáil 3/π go cruinn.",
        ),
        const _P(
          "3/π ≈ 0.9549 (deachúil) — gabhann an dóideacagán 95.5% "
          "d'achar an chiorcail. Iontráil 3 / π = san áireamhán chun "
          "é seo a dheimhniú.",
        ),
        const _H("Ceithre iolán i gcomparáid"),
        const _P(
          "Comhroinneann na cruthanna seo a leanas an ciorcal "
          "imchuimsíoch céanna. Foirmle: A = (n/2)·R²·sin(2π/n).",
        ),
        const _Pre(
          "  Cruth         Sciar     Foirmle\n"
          "  Triantán      41.3%     3√3/(4π)\n"
          "  Cearnóg       63.7%     2/π\n"
          "  Heicseagán    82.7%     3√3/(2π)\n"
          "  Dóideacagán   95.5%     3/π",
        ),
        const _P(
          "Tá go díreach faoi dhó achar an triantáin ag an heicseagán "
          "(tá an fachtóir 3√3 in araon). Agus tugann gach céim "
          "fáltas achair níos mó, mar bhrúnn na rinní níos cóngaraí "
          "ar an gciorcal.",
        ),
        const _H("Airciméidéas agus π"),
        const _P(
          "Ríomh Airciméidéas π trí na n-iolán. D'úsáid sé 96-uillíoch "
          "— 96 = 12×8 = 12×2³. Thosaigh sé leis an heicseagán (atá "
          "inthógtha go simplí) agus dhúbail líon na rinní trí huaire: "
          "6→12→24→48→96. Mar sin bhí an dóideacagán mar phointe "
          "tosaigh dá mhodh.",
        ),
        const _P(
          "An toradh aige: 3 + 10/71 < π < 3 + 1/7. Líonann 96-uillíoch "
          "an ciorcal imchuimsíoch 99.93%. Ó 95.5% an dóideacagán go "
          "99.93% níl ach trí chéim dúblaithe — ráta cóineasaithe "
          "suntasach.",
        ),
      ];
    case 6:
      return [
        const _H("Dáréag aghaidh"),
        const _P(
          "Is é an dóideicéadrón corp tógtha as dáréag cúigeán rialta. "
          "Tá gach aghaidh comhionann, gach imeall ar comhfhad, agus "
          "tagann trí chúigeán le chéile go cruinn ag gach rinn. San "
          "iomlán tá 12 aghaidh, 30 imeall agus 20 rinn aige. Is ceann "
          "de na cúig chorp Phlatónach é — na coirp dhronnacha "
          "amháin a bhfuil a n-aghaidheanna comhdhéanta go heisiach de "
          "iolán rialta chomhionanna.",
        ),
        const _H("Na cúig chorp Phlatónach"),
        const _Pre(
          "  Corp                Aghaidh  Rinn  Imeall  Cruth\n"
          "  Teitreaihéadrón         4      4       6   Triantán\n"
          "  Ciúb                    6      8      12   Cearnóg\n"
          "  Oicteaihéadrón          8      6      12   Triantán\n"
          "  Dóideicéadrón          12     20      30   Cúigeán\n"
          "  Íocoiseiicéadrón       20     12      30   Triantán",
        ),
        const _P(
          "Is é an dóideicéadrón an t-aon chorp Phlatónach le "
          "h-aghaidheanna cúigeánacha. Sa chosmeolaíocht aige, chuir "
          "Platón na ceithre choirp eile in oiriúint do na heilimintí "
          "— agus an dóideicéadrón don chosmas féin.",
        ),
        const _H("Cén chuma atá air?"),
        const _P(
          "Aithníonn an té a imríonn cluichí rólimeartha é mar D12 — "
          "an dísle dhá-thaobhach-déag. Suíonn sé go compordach sa "
          "láimh agus titeann sé go iontaofa ar aghaidh amháin. Ní "
          "dóideicéadrón é an liathróid peile: is icoiseiicéadrón "
          "teasctha de 12 chúigeán agus 20 heicseagán é.",
        ),
        const _H("Dóideicéadróin cúigeánacha Gallrómhánacha"),
        const _P(
          "Aimsíodh níos mó ná céad bréagán beag cré-umhaí i gcruth "
          "dóideicéadrón i dtuaisceart na hEorpa, le dáta sna haoiseanna "
          "2–4 AD. Tá dhá aghaidh dhéag chúigeánacha acu le poill "
          "chiorclacha de mhéideanna éagsúla iontu. Níl a fhios ag "
          "aon duine go cinnte cad chuige ar úsáideadh iad. Téann na "
          "hipitéisí ó choinnleoirí trí ionstraimí suirbhéireachta go "
          "rudaí reiligiúnacha. Tá an puzal fós gan réiteach.",
        ),
        const _H("Foirmle iolaihéadrán Euler"),
        const _P(
          "Le haghaidh gach iolaihéadrán dronnach feidhmíonn coibhneas "
          "simplí: rinní lúide imeall móide aghaidheanna, comhionann "
          "le dó i gcónaí. Chruthaigh Leonhard Euler an dlí seo i 1758. "
          "Don dóideicéadrón: 20 − 30 + 12 = 2. Feidhmíonn an "
          "fhoirmle do na cúig chorp Phlatónacha, do gach priosma, do "
          "gach pirimid, do gach iolaihéadrán dronnach ar bith.",
        ),
      ];
    case 7:
      return [
        const _H("An cóimheas órga sa dhóideicéadrón"),
        const _P(
          "Is cúigeán rialta gach aghaidh den dóideicéadrón — agus is "
          "é an cúigeán rialta baile an chóimheasa órga. Tá an "
          "trasnán de chúigeán mar sin sa chóimheas céanna lena thaobh "
          "is atá φ = (1+√5)/2 ≈ 1.618 (deachúil) le 1. Bíonn an "
          "comhréir seo i réim ar an gcorp ar fad.",
        ),
        const _Pre(
          "  Cainníocht           Foirmle              Deachúil\n"
          "  Toirt                (15+7√5)/4           ≈ 7.663\n"
          "  Achar dromchla       3√(25+10√5)          ≈ 20.646\n"
          "  Imchorda             √3·φ/2               ≈ 1.401\n"
          "  Ga inscríofa         √(25+11√5)/(2√10)    ≈ 1.114",
        ),
        const _P(
          "Má iontrálann tú φ² = san áireamhán, faigheann tú φ+1. Sin "
          "sainghné an chóimheasa órga — agus an chúis go dtagann φ "
          "chun cinn i go leor d'fhoirmlí an dóideicéadrón.",
        ),
        const _H("Déchas — scáthán an icoiseiicéadrón"),
        const _P(
          "Tá corp dé ag gach corp Phlatónach: cuirtear rinn (i lár "
          "an aghaidh) in ionad gach aghaidhe agus ceanglaítear na "
          "rinní comharsana nua le himill. Don dóideicéadrón cruthaítear "
          "an t-icoiseiicéadrón — agus a mhalairt:",
        ),
        const _Pre(
          "                    Dóideicéadrón   Íocoiseiicéadrón\n"
          "  Aghaidheanna           12              20\n"
          "  Imill                  30              30\n"
          "  Rinní                  20              12",
        ),
        const _P(
          "Mhalairníonn na haghaidheanna agus na rinní a n-áiteanna ; "
          "fanann líon na n-imeall mar an gcéanna. Tagann an uimhir "
          "12 chun cinn sa dá chorp — uair amháin mar líon "
          "aghaidheanna, uair amháin mar líon rinní.",
        ),
        const _H("120 siméadracht"),
        const _P(
          "Tá an tsiméadracht is saibhre i measc na gcorp Phlatónacha "
          "ag an dóideicéadrón: an grúpa icoiseiicéadrach Iₕ le 120 "
          "ball — 60 rothlú agus 60 frithchaitheamh-rothlú. Le "
          "comparáid: níl ach 48 siméadracht ag an gciúb, 24 ag an "
          "teitreaihéadrón.",
        ),
        const _P(
          "120 = 5! = 2³×3×5. Is iad na trí phríomhfhachtóir 2, 3 agus "
          "5 go díreach iad sin a chuirtear le chéile in aghaidheanna "
          "an dóideicéadrón (cúigeáin) agus in inroinnteacht 12 "
          "(= 2²×3).",
        ),
      ];
    case 8:
      return [
        const _H("360 céim agus na Babylónaigh"),
        const _P(
          "Ní tairiseach nádúrtha é go bhfuil 360 céim ag ciorcal "
          "iomlán — comhshocrú daonna atá ann a théann siar go dtí na "
          "Babylónaigh. Bhain matamaitic na mBabylónach úsáid as bonn "
          "60, agus 360 = 6×60. Ach is féidir 360 a scríobh freisin "
          "mar 12×30, agus is amhlaidh go díreach a roinn na "
          "Babylónaigh an spéir: roinneadh conair leithscarthach na "
          "gréine (an éiclipt) ina 12 rannóga chomhionanna 30° an "
          "ceann. Sannadh réaltbhuíon le gach rannóg — an dáréag "
          "comhartha stoidiaca.",
        ),
        const _P(
          "Ní rogha comhtharlaíoch é roghnú 12. D'eagraigh na "
          "Babylónaigh a gcóras bun-60 go hinmheánach i ngrúpaí 12, "
          "toisc 60 = 12×5. Dóibh siúd ba foaonad nádúrtha é dáréag "
          "— in tomhas ama, i bhféilire, sa réalteolaíocht.",
        ),
        const _H("An ghealach agus an dáréag"),
        const _P(
          "Cén fáth dáréag rannóga den spéir go díreach? Toisc go "
          "molann an dúlra féin roinnt dháreagach: tá bliain ghréine "
          "amháin beagnach go díreach 12 thimthriall gealaí ann. "
          "Maireann mí sionoideach thart ar 29.53 lá. Tugann 12 "
          "timthriall gealaí 354.4 lá — díreach 11 lá níos giorra ná "
          "bliain ghréine 365.24 lá. Rinne an gar-chomhthiteachas seo "
          "an dáréag mar an roinnt soiléir den bhliain.",
        ),
        const _H("Ord sa spéir"),
        const _P(
          "Bhí roinnt dháreagach na spéire i bhfad níos mó ná córas "
          "comhordanáidí do na cultúir ársa. Mionsonra suimiúil: "
          "imíonn pointe an earraigh go mall trí na réaltbhuíonta, "
          "toisc go luascann ais an Domhain mar mhullán "
          "(réamhcheasaíocht, tréimhse thart ar 25,800 bliain). "
          "Tugtar aoiseanna ar na réaltbhuíonta a n-imíonn pointe an "
          "earraigh tríothu mar sin. Anseo freisin struchtúraíonn an "
          "dáréag an t-am: dáréag réaltbhuíon, dáréag aois, ciorcal "
          "mór amháin.",
        ),
        const _H("An dáréag i n-áiteanna eile sa spéir"),
        const _P(
          "Roinn na hÉigiptigh ársa an lá agus an oíche ina 12 uair "
          "an ceann — uaidh sin tagann ár roinnt 24 uaire. Comhairtí "
          "an stoidiac Síneach freisin dáréag comhartha i dtimthrialla "
          "12 bhliain, díorthaithe ón bhfithis 12 bhliain Iúpatair. "
          "D'eascair an dá thraidisiún go neamhspleách ar a chéile. "
          "Tá an cóineasú ar an uimhir 12 suntasach.",
        ),
      ];
    case 9:
      return [
        const _H("Pirít — dóideicéadrón an amadáin"),
        const _P(
          "Críostlaíonn pirít (FeS₂), atá ar a dtugtar « ór an "
          "amadáin » dá lonradh órga, go minic i gcruth atá go "
          "meabhlach cosúil leis an dhóideicéadrón Phlatónach: an "
          "pirítohéadrón. Tá 12 aghaidh chúigeánacha, 20 rinn agus 30 "
          "imeall aige — an topagrafa céanna leis an dóideicéadrón "
          "rialta as caibidil 7. Ach má bhreathnaíonn tú go géar, ní "
          "rialta na cúigeáin. I gcriostalagrafaíocht, ní féidir "
          "fíor-shiméadracht rothlaithe cúigear le criostail "
          "thréimhsiúla — ní cheadaítear ach siméadrachtaí d'ordanna "
          "1, 2, 3, 4 agus 6. Téann an pirítohéadrón timpeall ar an "
          "riail seo le cúigeáin neamhrialta.",
        ),
        const _H("Garnait — corp eile dhá-aghaidh-dhéag"),
        const _P(
          "Críostlaíonn mianraí ghrúpa na garnaite go fabhrach mar "
          "dhóideicéadróin rómbacha — corp eile freisin le dáréag "
          "aghaidh, ach de chineál go hiomlán difriúil: is rómbaí na "
          "haghaidheanna, ní cúigeáin. Tá 14 rinn agus 24 imeall ag an "
          "dhóideicéadrón rómbach agus baineann sé leis an gcóras "
          "criostalach ciúbach. Tíleann sé an spás gan bhearnaí — "
          "comhionann tríthoiseach na coirceoige.",
        ),
        const _P(
          "Úsáideann an dúlra an uimhir 12 mar líon na n-aghaidheanna "
          "ar dhá chineál criostail go hiomlán difriúil — cúigeáin sa "
          "phirít, rómbaí sa gharnait. Níl an dáréag ceangailte le "
          "géiméadracht áirithe.",
        ),
        const _H("Raidealáraí — cnámharlaigh as gloine"),
        const _P(
          "Is orgánaigh muirí aoncheallacha iad raidealáraí, ar éigean "
          "níos mó ná deichiú milliméadar trasna, a thógann "
          "cnámharlaigh ealaíonta ó shilice. Cruthaíonn roinnt speiceas "
          "cnámharlaigh le siméadracht íocoiseihéadrach — siméadracht "
          "an icoiseiicéadrón, dé an dhóideicéadrón. Tharraing an "
          "bitheolaí Gearmánach Ernst Haeckel na horgánaigh seo i "
          "1904 ina shaothar « Cruthanna Ealaíonta na Dúlra » le "
          "mionsonraíocht atá fós suntasach inniu.",
        ),
        const _H("Cuasichriostail — an eisceacht a dheimhníonn an riail"),
        const _P(
          "I 1982 d'aimsigh Dan Shechtman patrún le siméadracht "
          "íocoiseihéadrach in cóimhiotal alúmanam-mangainéise — "
          "siméadracht atá toirmiscthe i ngnáth-chriostail. Bhain "
          "comhphobal na saineolaithe diúltú ar dtús leis. Ach mhair "
          "an breathnú, agus i 2011 bhuaigh Shechtman duais Nobel "
          "sa cheimic. Tá siméadracht íocoiseihéadrach ag na "
          "cuasichriostail seo, a chuimsíonn an chéiméadracht "
          "dhóideicéadrach agus an cheann icoiseiicéadrach araon. "
          "Aimsíodh cuasichriostail nádúrtha — an mhianra "
          "icoiseihéadrít — i 2009 i ndreigít in Kamchatka.",
        ),
      ];
    case 10:
      return [
        const _H("Dáréag ar láimh amháin"),
        const _P(
          "Coinnigh láimh romhat, an ordóg scartha amach, agus féach "
          "ar na ceithre mhéar. Tá trí alt (faillne) ag gach méar, "
          "scartha ó alt go alt ag altaí infheicthe. Ceithre mhéar "
          "iolraithe faoi thrí alt — sin dáréag. Is féidir leis an "
          "ordóg feidhmiú mar phointeoir: teagmhaíonn sí gach alt de "
          "na ceithre mhéar ar a seal agus comhairtí mar sin ó cheann "
          "go dáréag.",
        ),
        const _P(
          "Ní aireagán nua-aimseartha é seo. I gcodanna d'oirdheisceart "
          "na hÁise, na hIndia agus an Mheán-Oirthir, baintear úsáid "
          "as leis na céadta bliain. Tá buntáiste cinniúnach aige "
          "thar chuntas a dhéanamh ar mhéara mar a dhéantar san "
          "Iarthar: úsáideann sé láimh amháin do dháréag aonad in "
          "ionad cúig.",
        ),
        const _H("Ó dháréag go seasca"),
        const _P(
          "Comhairtí an dara láimh na timthriallta iomlána. Gach uair "
          "a chríochnaíonn an chéad lámh babhta dháreagach, sineann "
          "an dara lámh méar amach. Cúig mhéar iolraithe faoi "
          "dháréag — sin seasca. Le dhá lámh is féidir comhaireamh "
          "go 60, gan aon áis bhreise.",
        ),
        const _P(
          "Is dócha nach comhtharlú é an ceangal seo idir 12 agus "
          "60: d'fhéadfadh go bhfuil bunús an chórais shíneasaichmigh "
          "Babylónaigh (bonn 60) sa mhodh comhaireamh seo go díreach. "
          "60 = 12×5 — leá galánta na hanatamaíochta agus na "
          "huimhríochta.",
        ),
        const _H("Dáréagóirí eile in anatamaíocht an duine"),
        const _Pre(
          "  — 12 phéire easnacha (anatamaíocht caighdeánach)\n"
          "  — 12 phéire néaróg chloigeann (I Boltanach go XII Hipiglosach)\n"
          "  — 12 veirteabra throwracaí (ceangailte leis na 12 phéire easnacha)",
        ),
        const _P(
          "Tarlaíonn éagsúlachtaí anatamacha (is féidir 11 nó 13 "
          "phéire easnach a bheith ann go hannamh).",
        ),
        const _H("Ar mhúnlaigh an lámh an córas uimhrithe?"),
        const _P(
          "Cibé an raibh tionchar ag anatamaíocht na bhfaillne ar "
          "theacht chun cinn na gcóras uimhrithe dosaenacha, nó a "
          "mhalairt, ní féidir é a chinneadh go cinnte go stairiúil. "
          "B'fhéidir gur neartú frithpháirteach a bhí ann: thosaigh "
          "daoine ag comhaireamh ar fhaillní toisc go raibh an "
          "dáréag tábhachtach ina gcultúr cheana féin. An rud atá "
          "cinnte: tugann lámh an duine bonn fisiciúil nádúrtha don "
          "dáréag.",
        ),
      ];
    case 11:
      return [
        const _H("Dáréagóirí sa saol laethúil"),
        const _Pre(
          "  12 orlach   = 1 troigh\n"
          "  12 unsa     = 1 punt troia (miotail luachmhara)\n"
          "  12 phéine   = 1 scilling (airgead Briotanach go dtí 1971)\n"
          "  12 phíosa   = 1 dosaen\n"
          "  144         = 12² = 1 grós",
        ),
        const _P(
          "Ní comhtharlúintí stairiúla iad na deighiltí seo — "
          "roghnaíodh iad toisc go n-éascaíonn siad an deighilt. "
          "Roinnt troigh ina dhá pháirt chomhionanna (6 orlach an "
          "ceann), ina trí (4 orlach an ceann), ina cheithre (3 "
          "orlach an ceann) agus ina sé (2 orlach an ceann). Tagann "
          "gach ceann de na deighiltí seo amach go cruinn.",
        ),
        const _P(
          "Roinneann méadar, ar a malairt, ina dhá pháirt "
          "chomhionanna (50 cm an ceann) agus ina cúig (20 cm an "
          "ceann), ach is é trian méadar 33.333… cm — codán "
          "gan teorainn chomh luath agus is mian leis a bheith cruinn. "
          "I gceird ina ndéantar trian agus ceathrúna go leanúnach, "
          "tá an dáréag níos praiticiúla ná an deich.",
        ),
        const _H("An córas méadrach — agus a phointe dall"),
        const _P(
          "Tá láidreachtaí móra ag an gcóras méadrach: tá sé "
          "comhleanúnach (oireann na haonaid go léir le chéile), "
          "scálaítear é go deachúlach (cíleo, méige, milli, micrea), "
          "agus tá sé caighdeánaithe go hidirnáisiúnta. Tá na "
          "buntáistí seo réadúil agus suntasach. Ní bheadh aon duine "
          "réasúnach ag moladh SI a chur ar ceal.",
        ),
        const _P(
          "Ach faigheann an córas méadrach lagchúiteacht a bhoinn le "
          "hoidhreacht. I mbonn 10 is codán gan teorainn é trian: "
          "0.333… I gcóras méadrach dosaenach bheadh 1/3 ina 0.4 — "
          "cruinn, gairid, gan fuíoll. Choinnídh galántacht an "
          "phrionsabail mhéadraigh — bheadh an bonn níos fearr amháin.",
        ),
        const _H("TGM Tom Pendlebury"),
        const _P(
          "Lean Tom Pendlebury, ball den Chumann Dosaenach na "
          "Breataine Móire, an smaoineamh seo go dtí an deireadh. "
          "Tugtar TGM ar a chóras — ainmnithe i ndiaidh a thrí "
          "n-aonad bonn: Tim (am), Grafut (fad), Maz (mais). Ní "
          "thosaigh Pendlebury leis an bhfad ach leis an am: roinn sé "
          "an uair an chloig ina 12⁴ páirteanna comhionanna. Ón Tim "
          "díorthaigh sé an Grafut tríd an luas imtharraingthe an "
          "Domhain (≈ 29.6 cm), agus aonad mais an Maz ó thoirt "
          "Grafut chiúbach uisce.",
        ),
        const _P(
          "Tá an toradh ina chóras aonad comhleanúnach go hiomlán, ina "
          "bhfuil na hathruithe go léir ina gcumhachtaí 12. Níor "
          "glacadh leis an TGM riamh thar chiorcail díograiseach, ach "
          "léiríonn sé go mbeadh córas méadrach dosaenach ní hamháin "
          "féideartha — i roinnt slite bheadh sé níos fearr ná an "
          "ceann deachúlach.",
        ),
        const _H("Cad a thaispeánann an t-áireamhán seo"),
        const _P(
          "Iontráil 1 / 3 = agus feic 0.4 — gairid, cruinn, gan líne "
          "tréimhse — agus tuigfidh tú i soicind an rud nach féidir "
          "le leathanaigh argóintí a chur in iúl. Ní réiteofar an "
          "cheist « dosaenach nó deachúil? » riamh i gcleachtas. Ach "
          "tá buntáistí matamaiticiúla bhonn 12 oibiachtúil agus "
          "intomhasach, agus déanann an t-áireamhán seo iad "
          "soléirithe.",
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
