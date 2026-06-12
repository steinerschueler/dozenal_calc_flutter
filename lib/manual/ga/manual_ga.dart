// ga manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_ga.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersGa() => const [
  ManualChapter('Grundbedienung', [
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
      "DEG → RAD → GRAD → DEG. Taispeántar an mód reatha ag barr na "
      "láimhe deise den taispeáint, díreach os cionn an táscaire "
      "Doz/Dez. Réamhshocrú: DEG.",
    ),
  ]),
];
