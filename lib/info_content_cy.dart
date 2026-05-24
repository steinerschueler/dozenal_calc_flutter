part of 'info_content.dart';

/// Welsh (Cymraeg) chapter content. Drafted from the English and German
/// sources. Uses a locale-specific dozenal pronunciation convention
/// shaped for Welsh:
///   * Base unit "dwsin" (standard Welsh loan-word for "dozen"),
///     masculine. Soft mutation after "dau" (2): dau ddwsin. Other
///     numeric multipliers (tri, pedwar, pump→pum, chwech→chwe,
///     saith, wyth, naw, deg) trigger no mutation here.
///   * A = "deg" (10), B = "un ar ddeg" (11), the traditional Welsh
///     forms still used universally for naming numbers up to 12.
///   * Higher magnitudes 12²–12⁷ are transliterated Germanic
///     loan-words: "quader, cuber, tesser, penter, hexer, hepter" —
///     invariant, no Welsh mutations (foreign-stem convention,
///     matching the sister Celtic ga locale).
///   * Pure juxtaposition between magnitudes (mirrors Welsh decimal
///     "cant dau ddeg tri" = 123 without coordinator between hundreds
///     and tens). An "a" / "ac" coordinator appears only before the
///     final units position (parallel to "cant a thri" = 103, or
///     "mil ac un" = 1001).
///   * "a" causes aspirate mutation on c → ch, p → ph, t → th in the
///     following unit word ("a thri", "a phedwar"). "ac" replaces "a"
///     before vowels and the semi-vowel w ("ac un", "ac wyth").
///   * Multiplier 1 implicit (dwsin not "un dwsin"; quader not
///     "un quader"), parallel to English "dozen" and Irish "dosaen".
///   * Western digits throughout for math content; Welsh for prose.
///
/// Welsh has a deep history with non-decimal counting: the traditional
/// system was vigesimal (base 20) with quinary breaks at 15 — "deunaw"
/// (18 = two nines), "ugain" (20), "deugain" (40 = two twenties),
/// "trigain" (60 = three twenties), "pedwar ugain" (80 = four twenties).
/// Modern Welsh adopted a decimal system in the 1940s for schools and
/// arithmetic, but the vigesimal forms remain in idiom and literary
/// usage. The dozenal convention here is a third alternative — added
/// to the menagerie, not replacing what already exists.
///
/// Quality note: drafted without native-speaker review. Mutation rules
/// applied systematically but stylistic naturalness benefits from
/// review by a Cymraeg speaker.
List<Widget> _chapterCy(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H("Y ffigurau"),
        const _P(
          "Defnyddia'r cyfrifiannell hwn ei symbolau ei hun ar gyfer y "
          "deuddeg ffigur i gyd. Mae pedwar ffigur ancr yn bennau saeth "
          "wedi'u stileiddio sy'n pwyntio i'r pedwar cyfeiriad cardinal "
          "— 1 (i fyny), 4 (i'r chwith), 7 (i'r dde), A (i lawr). Maent "
          "yn rhannu'r cylch rhif yn bedwar grŵp o dri, fel oriau 12, 3, "
          "6 a 9 ar wyneb cloc.",
        ),
        const _P(
          "Adeiledir pob ffigur rhyngddynt o hanner-gylchoedd a chylchoedd "
          "llawn. Cylch syml yw sero, a chylch wedi'i lenwi yw B "
          "(= un ar ddeg).",
        ),
        const _DigitLegend(),
        const _H("Defnydd sylfaenol"),
        const _P(
          "Tapiwch rifau a gweithredwyr fel ar gyfrifiannell poced "
          "cyffredin. Gwasgwch y fysell lydan = ar yr ymyl gwaelod i "
          "gyfrifo'r canlyniad. Mae AC (mewn coch rhybudd) yn clirio'r "
          "mewnbwn a'r canlyniad cyfan ; mae Del yn dileu'r cymeriad i "
          "chwith y cyrchwr.",
        ),
        const _H("Cymorth a damcaniaeth"),
        const _P(
          "I chwith ac i ddeau'r fysell =, eistedda dau fotwm crwn: mae "
          "(i) yn agor y deuddeg pennod ddamcaniaeth hyn, mae (?) yn "
          "ailchwarae'r daith weithredu gyda'r marciau coch. Mae'r daith "
          "yn agor yn awtomatig ar y lansiad cyntaf.",
        ),
        const _H("Y cyrchwr a llywio"),
        const _P(
          "Y bar coch yn y maes mewnbwn yw'r cyrchwr. Defnyddiwch ◀ a ▶ "
          "i'w symud, gan fewnosod neu ddileu cymeriadau yng nghanol "
          "fformiwla. Ar ôl cyfrifiad, mae'r cyrchwr yn symud i'r maes "
          "canlyniad — mae'r saethau wedyn yn symud cyrchwr y canlyniad. "
          "Cyn gynted ag y dechreuwch fewnbwn newydd, mae'r cyrchwr yn "
          "neidio'n ôl i'r maes mewnbwn.",
        ),
        const _H("Parhau cyfrifiad"),
        const _P(
          "Ar ôl cyfrifiad gallwch barhau'n syth gyda gweithredydd. "
          "Tapiwch + 5 = er enghraifft, ac mae'r cyfrifiannell yn "
          "defnyddio'r canlyniad olaf yn awtomatig fel yr operand cyntaf. "
          "I ddechrau cyfrifiad cwbl newydd, gwasgwch AC yn gyntaf.",
        ),
        const _H("Tap dwbl ar gyfer swyddogaethau gwrthdroëdig"),
        const _P(
          "Mae ail dap ar fysell swyddogaeth yn ei throi i'w gwrthdroad: "
          "daw sin yn sin⁻¹, daw cos yn cos⁻¹, ac yn y blaen. Mae'r un "
          "rheol yn berthnasol i'r swyddogaethau hyperbolig yn y panel "
          "estyniad. Mae dot bach euraidd ar y fysell yn dynodi y bydd "
          "y tap nesaf yn gwrthdroi.",
        ),
        const _H("Gweithredwyr arbennig"),
        const _P(
          "Mae x² yn sgwario'r rhif blaenorol. Mae √ yn cyfrifo'r gwraidd "
          "sgwâr — os yw rhif yn sefyll i'w chwith, defnyddir y rhif "
          "hwnnw fel gradd y gwraidd: mae 3√27 yn rhoi gwraidd ciwbig 27. "
          "Mae log yn cyfrifo'r logarithm i fôn y rhif blaenorol. Mae ⊕ "
          "yn cyfrifo'r swm cyfochrog: a ⊕ b = (a·b)/(a+b), defnyddiol "
          "ar gyfer gwrthyddion cyfochrog.",
        ),
        const _H("Y panel estyniad"),
        const _P(
          "Mae'r fysell … yn y gornel dde isaf yn agor y panel estyniad "
          "gyda mwy o swyddogaethau: cof, cysonion (π, e, φ, √2), "
          "swyddogaethau hyperbolig, gweithredwyr datblygedig, a "
          "gosodiadau. Mae'r un fysell yn ei chau, neu dapio y tu allan "
          "i'r panel. Ar dabledi mae pob set ochr yn ochr beth bynnag "
          "— does dim haen.",
        ),
        const _Pre(
          "  6 — Cof:           STO   RCL   MC    Ans\n"
          "  7 — Cysonion:      π     e     φ     √2\n"
          "  8 — Hyperbolig:    sinh  cosh  tanh  coth\n"
          "  9 — Datblygedig:   n!    |x|   1/x   mod\n"
          "  10 — Moddau:       Doz   Dez   DRG   …",
        ),
        const _H("Cof"),
        const _P(
          "Mae STO yn storio'r canlyniad cyfredol, mae RCL yn mewnosod "
          "y gwerth wedi'i storio i'r mewnbwn, mae MC yn clirio'r cof. "
          "Mae M bach ar y sgrin yn dangos bod rhywbeth wedi'i storio. "
          "Mae Ans yn mewnosod canlyniad y cyfrifiad olaf — caiff "
          "gwerthoedd rhesymol manwl gywir eu storio'n llawn, cedwir "
          "cyfnodoldeb.",
        ),
        const _H("Y bar cyfnod"),
        const _P(
          "Pan fo'r canlyniad yn ffracsiwn cyfnodol, mae'r cyfrifiannell "
          "yn marcio'r ffigurau sy'n ailadrodd gyda bar uwch eu pen. "
          "Enghraifft: mae 1/5 yn rhoi 0.2497 gyda bar uwchben y pedwar "
          "ffigur i gyd. Ar gyfer cyfnodau hwy na phum ffigur, dim ond "
          "y pum cyntaf a ddangosir, gan ddilyn …",
        ),
        const _H("System rifau: Doz / Dez"),
        const _P(
          "Yn y panel estyniad eistedda dwy fysell Doz a Dez ochr yn "
          "ochr. Mae union un ohonynt bob amser yn weithredol (ag ymyl), "
          "ac mae'r system weithredol yn cael ei dangos yng nghornel "
          "dde uchaf y sgrin. Ym modd Doz mae'r cyfrifiannell yn cyfrifo "
          "ym môn 12 (diofyn) ; ym modd Dez ym môn 10.",
        ),
        const _P(
          "Wrth newid, caiff y rhif sy'n weladwy ar hyn o bryd ei "
          "drosglwyddo'n awtomatig i'r system arall. Daw « 10 » yn Doz "
          "yn « 12 » yn Dez. Ym modd Dez daw'r symbolau ar gyfer 10 ac "
          "11 yn anweithredol (llwyd), gan nad ydynt yn bodoli fel "
          "ffigurau unigol ym môn 10 — pan fydd angen Doz, newidiwch "
          "yn ôl.",
        ),
        const _H("Modd ongl"),
        const _P(
          "Mae DRG yn cylchu modd ongl y swyddogaethau trigonometrig: "
          "DEG → RAD → GRAD → DEG. Dangosir y modd cyfredol yng nghornel "
          "dde uchaf y sgrin, yn union uwchben y dangosydd Doz/Dez. "
          "Diofyn yw DEG.",
        ),
      ];
    case 1:
      return [
        const _H("Yr egwyddor"),
        const _P(
          "Yn y system ddegol, mae gan bob safle ddeg gwaith gwerth y "
          "safle i'w dde: unedau, degau, cannoedd. Yn y system ddwsin, "
          "nid deg yw'r bôn ond deuddeg. Pwerau 12 yw'r gwerthoedd "
          "safle: unedau, dwsinau, cant-pedwar-deg-pedwarau. Nid yw "
          "« 100 » yma yn golygu deg-gwaith-deg ond deuddeg-gwaith-"
          "deuddeg — sef 144 yn ddegol.",
        ),
        const _P(
          "Mae hyn yn galw am ddeuddeg ffigur yn lle deg. Ychwanegir dau "
          "newydd ar gyfer y gwerthoedd deg ac un ar ddeg, ac mae'r "
          "cyfrifiannell hwn yn rhoi eu symbolau eu hunain iddynt "
          "(A = deg, B = un ar ddeg). Enghraifft: 2B (dwsin) = 2·12 + 11 "
          "= 35 (degol).",
        ),
        const _H("Sut i ynganu rhifau dwsin?"),
        const _P(
          "Mae'r unedau 0–9 yn aros fel y'u hadwaenir gennych: sero, un, "
          "dau … naw. Darllenir y glyffiau newydd A a B fel deg ac un "
          "ar ddeg — yr un maint â'r geiriau cyfarwydd, dim angen "
          "geirfa newydd. Darllenir deuddeg ei hun — wedi'i ysgrifennu "
          "fel « 10 » — fel dwsin. I osgoi dryswch rhwng rhifau degol a "
          "dwsin yn y bennod hon, mae rhagddodiad bach e yn marcio'r "
          "darlleniad degol a rhagddodiad bach o y darlleniad dwsin: "
          "e144 = o100, yr un gwerth yw'r ddau.",
        ),
        const _P(
          "Mae'r drefn geiriau'n dilyn rhesymeg arferol y Gymraeg: y "
          "maint mwyaf yn gyntaf, y lleiaf wedyn. O fewn y rhediad sub-"
          "quader (dwsinau + unedau), mae'r ffurf gyda particl « a » "
          "cyn yr uned, fel yn « cant a thri »: darllenir o11 fel "
          "« dwsin ac un », o23 fel « dau ddwsin a thri ». Mae lluosyddion "
          "2 hyd at B yn rhag-osod dwsin fel gair ar wahân: dau ddwsin "
          "(o20 = e24, treiglad meddal d → dd ar ôl « dau »), tri "
          "dwsin, …, naw dwsin (o90 = e108). Gyda A neu B yn safle'r "
          "dwsinau: deg dwsin (oA0 = e120), un dwsin ar ddeg (oB0 = "
          "e132). Mae lluosydd 1 yn ddealledig: darllenir o10 fel "
          "« dwsin » yn syml, nid « un dwsin ».",
        ),
        const _P(
          "Mae'r particl « a » yn achosi treiglad llaes ar c, p, t yn yr "
          "uned ddilynol: « a thri », « a phedwar », « a phump » (→ "
          "« a phump » heb newid pellach gan fod ph yn bodoli'n barod). "
          "Daw « ac » yn lle « a » cyn llafariaid ac w hanner-llafarog: "
          "« ac un », « ac wyth ». Mae'r maint mwy yn pentyrru drwy "
          "gyfosodiad heb gysylltair — fel yn « cant dau ddeg tri » "
          "(123) modern, neu'r « mil ac un » (1001) traddodiadol. Felly "
          "darllenir o101 fel « quader ac un », o123 fel « quader dau "
          "ddwsin a thri », o2300 fel « dau cuber tri quader ». Caiff "
          "meintiau gwag eu hepgor: nid « cuber sero quader … » yw "
          "o1023 ond « cuber dau ddwsin a thri ».",
        ),
        const _Pre(
          "Degol      Dwsin       Ynganiad\n"
          "      10        A      deg\n"
          "      11        B      un ar ddeg\n"
          "      12       10      dwsin\n"
          "      13       11      dwsin ac un\n"
          "      14       12      dwsin a dau\n"
          "      20       18      dwsin ac wyth\n"
          "      22       1A      dwsin a deg\n"
          "      23       1B      dwsin un ar ddeg\n"
          "      24       20      dau ddwsin\n"
          "      25       21      dau ddwsin ac un\n"
          "      36       30      tri dwsin\n"
          "      48       40      pedwar dwsin\n"
          "      60       50      pum dwsin\n"
          "      72       60      chwe dwsin\n"
          "      84       70      saith dwsin\n"
          "      96       80      wyth dwsin\n"
          "     101       85      wyth dwsin a phump\n"
          "     108       90      naw dwsin\n"
          "     120       A0      deg dwsin\n"
          "     132       B0      un dwsin ar ddeg\n"
          "     143       BB      un dwsin ar ddeg un ar ddeg\n"
          "     ...      ...      ac yn y blaen…",
        ),
        const _H("Y meintiau uwch"),
        const _P(
          "Uwchben y dwsin daw cyfres o feintiau wedi'u sbarduno'n "
          "geometrig — un fesul safle dwsin, un fesul dimensiwn. Mae "
          "quader yn nodi'r sgwâr 2D (12² = e144), cuber y ciwb "
          "clasurol (12³ = e1728), tesser y tesserract pedwar-"
          "ddimensiwn (12⁴), ac oddi yno yr hyper-giwbiau rhif-Groeg: "
          "penter (12⁵), hexer (12⁶), hepter (12⁷). Mae pob cam un "
          "dimensiwn yn uwch ac un safle dwsin ymhellach.",
        ),
        const _Pre(
          " Degol     Dwsin       Ynganiad\n"
          "     144       100     quader   (12²)\n"
          "    1728      1000     cuber    (12³)\n"
          "   20736     10000     tesser   (12⁴)\n"
          "  248832    100000     penter   (12⁵)\n"
          " 2985984   1000000     hexer    (12⁶)\n"
          "35831808  10000000     hepter   (12⁷)\n"
          "     ...      ...      ac yn y blaen…",
        ),
        const _P(
          "Erys y meintiau Germanaidd benthyg (quader, cuber, tesser, "
          "penter, hexer, hepter) heb newid — heb dreigladau — gan eu "
          "bod yn eiriau benthyg estron. Dim ond i « dwsin », y gair "
          "Cymraeg cynhenid, y mae'r treiglad meddal ar ôl « dau » yn "
          "berthnasol.",
        ),
        const _H("Pam deuddeg yn benodol?"),
        const _P(
          "Y rheswm yw rhanadwyedd. Mae gan ddeuddeg chwe rhannydd: "
          "1, 2, 3, 4, 6 a 12. Pedwar yn unig sydd gan ddeg: 1, 2, 5 "
          "a 10. Mae hynny'n swnio fel gwahaniaeth bach, ond mae'r "
          "effaith ar gyfrifiadau bob dydd yn sylweddol — yn enwedig "
          "gyda ffracsiynau.",
        ),
        const _H("Ffracsiynau uned wedi'u cymharu"),
        const _Pre(
          "  Ffracsiwn  Bôn 10     Bôn 12\n"
          "  1/2        0.5        0.6\n"
          "  1/3        0.333…     0.4\n"
          "  1/4        0.25       0.3\n"
          "  1/5        0.2        0.2497…\n"
          "  1/6        0.166…     0.2\n"
          "  1/8        0.125      0.16\n"
          "  1/9        0.111…     0.14\n"
          "  1/10       0.1        0.1249…\n"
          "  1/12       0.0833…    0.1",
        ),
        const _P(
          "Ym môn 10, mae trydraniadau a chwedraniadau yn ffracsiynau "
          "ailadroddus diddiwedd. Ym môn 12 maent yn fyr ac yn fanwl "
          "gywir. Yn gyfnewid, daw pumdraniadau a degraniadau yn "
          "ailadroddus — cyfnewid teg, o ystyried pa mor amlach y "
          "rhennir wrth dri a phedwar nag wrth bump.",
        ),
        const _H("Y rheol y tu ôl iddi"),
        const _P(
          "Mae pa ffracsiynau sy'n gorffen a pha rai sy'n dod yn "
          "ailadroddus yn dilyn cyfraith syml: mae gan ffracsiwn 1/n "
          "gynrychiolaeth derfynol ym môn b yn union pan fo pob ffactor "
          "cysefin n hefyd yn ffactor cysefin b. Ffactorau cysefin 12 "
          "yw 2 a 3. Felly mae pob ffracsiwn y mae ei enwadur wedi'i "
          "wneud o ddeuon a thrïau yn unig yn gorffen. Mae popeth arall "
          "— enwaduron â 5, 7 neu 11 — yn dod yn ailadroddus. Mae'r "
          "cyfrifiannell yn marcio'r cyfnodoldeb hwn gyda bar uwchben "
          "y ffigurau sy'n ailadrodd.",
        ),
        const _H("Olion drwy hanes"),
        const _P(
          "Mae deuddeg fel maint trefnu yn hŷn nag unrhyw system rifau. "
          "Roedd y Babiloniaid yn cyfrifo ym môn 60, ond yn trefnu eu "
          "ffigurau yn grwpiau o 12. Mewn masnach, cyfrifid pethau "
          "mewn dwsinau (12) a grosiau (144 = 12²). Mae gan y dydd "
          "2×12 o oriau, y flwyddyn 12 mis, y cylch llawn 360 = "
          "30×12 gradd.",
        ),
        const _P(
          "Mae gan y Gymraeg ei pherthynas ddwfn ei hun â chyfrif "
          "an-degol: cafodd y system draddodiadol ei threfnu'n "
          "ugeiniol (bôn 20) gyda thoriadau pum-rannol ar 15 — "
          "« deunaw » (18 = dau naw), « ugain » (20), « deugain » "
          "(40), « hanner cant » (50), « trigain » (60), « pedwar "
          "ugain » (80). Aeth y Gymraeg fodern at system ddegol yn y "
          "1940au ar gyfer ysgolion a rhifyddeg, ond mae'r ffurfiau "
          "ugeiniol yn aros mewn idiom a defnydd llenyddol. Mae'r "
          "confensiwn dwsin yma yn drydydd dewis — wedi'i ychwanegu "
          "at y casgliad, nid yn cymryd lle'r hyn sydd eisoes yn bod.",
        ),
        const _H("Y Gymraeg a'r deuddeg"),
        const _P(
          "Mae gan y Gymraeg berthynas gyfeillgar arbennig â'r rhif "
          "deuddeg, wedi'i hysgrifennu i mewn i strwythur ei geiriau "
          "rhif. Yn y system draddodiadol, mae'r rhan fwyaf o rifau o "
          "11 i 19 yn dilyn patrwm rheolaidd: un ar ddeg (1+10), tri "
          "ar ddeg (3+10), pedwar ar ddeg (4+10) — felly y mae bron i "
          "bob un. Ond mae deuddeg yn torri'r rheol — gair annibynnol "
          "ydyw, uned wedi'i hasio yn hytrach na chyfansoddiad o "
          "« dau ar ddeg ». Yr un statws arbennig sy'n disgyn ar "
          "pymtheg (15) a deunaw (18, « dau naw »): nid ydynt hwythau "
          "chwaith wedi'u hadeiladu o'r patrwm rheolaidd.",
        ),
        const _P(
          "Olion ŷnt o arfer cyfrif lle roedd deuddeg, pymtheg a "
          "deunaw unwaith yn bwyntiau torri naturiol — cyn i'r "
          "confensiwn degol modern eu llyfn-droi. Daw'r Gymraeg, "
          "felly, at gyfrif dwsin gyda thir wedi'i baratoi: nid yw "
          "deuddeg yn estron i'w chof iaith, bu dwsin yn arian "
          "beunyddiol ers canrifoedd, ac mae'r hen gyfarwydd-deb â "
          "chyfrif an-degol yn dal yn fyw mewn idiom. I gyfrifiannell "
          "sy'n meddwl mewn dwsinau, mae'r Gymraeg ymhlith yr "
          "ieithoedd mwyaf croesawgar.",
        ),
        const _P(
          "(In English: Welsh carries an especially friendly "
          "relationship with the number twelve, written into the "
          "structure of its number words. In the traditional system, "
          "most numbers from 11 to 19 follow a regular pattern: un ar "
          "ddeg (1+10), tri ar ddeg (3+10), pedwar ar ddeg (4+10) — "
          "almost all of them do. But deuddeg breaks the rule — it is "
          "its own independent word, a fused unit rather than a "
          "compound from « dau ar ddeg ». The same special status "
          "falls on pymtheg (15) and deunaw (18, « two nines »): "
          "these are not built from the regular pattern either. They "
          "are traces of a counting practice where twelve, fifteen, "
          "and eighteen were once natural break-points — before the "
          "modern decimal convention smoothed them over. Welsh "
          "therefore comes to dozenal counting with prepared ground: "
          "deuddeg is not foreign to its linguistic memory, dwsin has "
          "been daily currency for centuries, and the old familiarity "
          "with non-decimal counting still lives in idiom. For a "
          "calculator that thinks in dozens, Welsh is among the most "
          "welcoming languages.)",
        ),
        const _P(
          "Mae Cymdeithas Ddwsin America (sefydlwyd 1944, gyda chwaer-"
          "gymdeithasau heddiw mewn gwledydd eraill) yn gweithio i "
          "wneud manteision bôn 12 yn fwy adnabyddus. Mae'r cyfrifiannell "
          "hwn yn sefyll yn y traddodiad hwnnw — nid fel galwad am "
          "newid system, ond fel offeryn i archwilio a rhyfeddu.",
        ),
      ];
    case 2:
      return [
        const _H("144 — lle mae dau fyd yn cyfarfod"),
        const _P(
          "Mae dilyniant Fibonacci yn dechrau gyda 1, 1, ac mae pob "
          "rhif pellach yn swm y ddau flaenorol: 1, 1, 2, 3, 5, 8, 13, "
          "21, 34, 55, 89, 144, … Mae'n tyfu'n esbonyddol. Mae'r "
          "rhifau sgwâr — 1, 4, 9, 16, 25, 36, … — yn tyfu'n cwadratig "
          "yn unig. Nid oes gan ddau ddilyniant mor wahanol bron unrhyw "
          "reswm i gyfarfod erioed. Ac eto fe wnânt: 144 yw'r deuddegfed "
          "rhif Fibonacci, ac 144 = 12².",
        ),
        const _P(
          "Profodd J. H. E. Cohn ym 1964 nad cyd-ddigwyddiad yw hyn ond "
          "digwyddiad unigryw: heblaw F(1) = F(2) = 1, nid yw'r un rhif "
          "Fibonacci arall yn sgwâr perffaith ar yr un pryd. Saif "
          "deuddeg ar groesffordd unigryw rhwng dau ddilyniant rhif "
          "sylfaenol.",
        ),
        const _H("Y gymhareb euraidd"),
        const _P(
          "φ = (1+√5)/2 ≈ 1.618 yw terfan y gymhareb rhwng rhifau "
          "Fibonacci olynol: F(n+1)/F(n) → φ. Ym môn 12: φ ≈ 1.74BB677… "
          "— mae gan y cyfrifiannell φ fel cysonyn yn y panel estyniad.",
        ),
        const _P(
          "Tapiwch φ² = ac fe welwch fod y canlyniad yn union φ+1 — "
          "priodwedd ddiffiniol y gymhareb euraidd. Mae'r hunaniaeth "
          "hon yn gwneud φ yn gysonyn algebraidd unigryw.",
        ),
        const _H("12 = 2² × 3 — ffactoreiddiad cysefin â chanlyniadau"),
        const _P(
          "Mae deuddeg yn rhif gyfansawdd uchel: mae ganddo fwy o "
          "rhanyddion nag unrhyw rif naturiol llai. Rhanyddion 12 yw "
          "1, 2, 3, 4, 6, 12 — chwech i gyd. Diffiniodd ac astudiodd "
          "Srinivasa Ramanujan y dosbarth hwn o rifau mewn papur enwog "
          "ym 1915 yn Achos y Gymdeithas Fathemategol Llundain.",
        ),
        const _P(
          "Deuddeg hefyd yw'r rhif helaeth lleiaf: mae swm ei rhanyddion "
          "priodol (1+2+3+4+6 = 16) yn fwy na'r rhif ei hun. Ar gyfer "
          "y rhan fwyaf o rifau bach gwrthwyneb yw'r sefyllfa — ar "
          "gyfer 10, mae 1+2+5 = 8, sy'n llai na 10. Deuddeg yw'r rhif "
          "cyntaf lle mae'r rhanyddion yn « gorlifo ».",
        ),
        const _H("Dinas ddelfrydol Platon"),
        const _P(
          "Yn ei « Gyfreithiau » (Llyfr V), gofynna Platon faint o "
          "ddinasyddion ddylai fod gan ddinas ddelfrydol. Ei ateb: "
          "5040. Nid yw'r ddadl yn ddirgel ond yn ymarferol: rhaid i "
          "ddinas rannu ei dinasyddion yn barhaus yn grwpiau o faint "
          "cyfartal. Mae 5040 yn rhanadwy gan bob rhif o 1 hyd at 12 "
          "(gyda'r eithriad sengl o 11).",
        ),
        const _P(
          "Yr hyn y mae Platon yn ei ddisgrifio'n reddfol yw'r un "
          "weledigaeth sy'n sail i'r system ddwsin: mewn bywyd bob dydd "
          "y rhanyddion bach yw'r rhai pwysig. Mae 5040 = 7! yn chwaer "
          "fawr deuddeg — yr un athroniaeth rhanadwyedd wedi'i "
          "chymhwyso i boblogaeth drefol gyfan.",
        ),
      ];
    case 3:
      return [
        const _H("Beth yw deuddegongl rheolaidd?"),
        const _P(
          "Mae deuddegongl rheolaidd yn polygon â deuddeg ochr gyfartal "
          "a deuddeg ongl mewnol gyfartal. Mae pob ongl mewnol yn mesur "
          "150° — neu, wedi'i fynegi yn ddwsin, 106°. Mae'n un o'r "
          "siapiau geometrig hynaf a mwyaf cyffredin ei ddefnyddio: "
          "fe'i cewch ar wynebau cloc, ar ddarnau arian, ar addurniadau "
          "pensaernïol ac ar batrymau palmantu.",
        ),
        const _H("Cyllell Swisaidd y polygonau"),
        const _P(
          "Yr hyn sy'n gwneud y deuddegongl yn unigryw nid ei siâp fel "
          "y cyfryw ond popeth a guddir y tu mewn iddo. Cysylltwch bob "
          "pedwerydd fertig ac fe gewch driongl hafalochrog — manwl "
          "gywir, nid bras. Mae pob trydydd fertig yn rhoi sgwâr. Mae "
          "pob ail fertig yn rhoi chweongl rheolaidd. Mae'r tri siâp "
          "yn eistedd yn berffaith o fewn yr un cylch sy'n amgylchu'r "
          "deuddegongl.",
        ),
        const _P(
          "Mae hyn yn golygu bod y deuddegongl yn cynnwys tri pholygon "
          "rheolaidd sylfaenol geometreg fel is-ffigurau manwl gywir. "
          "Nid oes polygon arall â chyn lleied o fertigau y gellir "
          "hawlio hyn amdano. Canlyniad uniongyrchol o rhanadwyedd 12 "
          "gan 2, 3, 4 a 6.",
        ),
        const _H("Cynadeiladwy gyda chwmpas a llinyn"),
        const _P(
          "Nid yw pob polygon rheolaidd yn gynadeiladwy yn fanwl gyda "
          "chwmpas a llinyn. Y mae'r deuddegongl yn gallu bod: "
          "dechreuwch gyda chylch, rhannwch ef yn chwe rhan gyfartal "
          "(mae'r chweongl yn gynadeiladwy), yna deurannwch bob arc, "
          "ac fe gewch ddeuddeg pwynt wedi'u gwasgaru'n gyfartal ar "
          "y cylch.",
        ),
        const _P(
          "Y sail fathemategol: mae n-ongl rheolaidd yn gynadeiladwy "
          "yn union pan fo n yn lluoswm o bŵer o ddau a rhifau cysefin "
          "Fermat gwahanol (Gauss, 1796). Ar gyfer 12 = 2² × 3 mae hyn "
          "yn dal, oherwydd bod 3 yn rhif cysefin Fermat.",
        ),
        const _H("Cymesuredd"),
        const _P(
          "Mae gan y deuddegongl rheolaidd 24 cymesuredd: 12 cylchdro "
          "(o 0°, 30°, 60°, …, 330°) a 12 adlewyrchiad (6 drwy "
          "fertigau cyferbyniol, 6 drwy ganol ymylon cyferbyniol). "
          "Yn iaith algebra mae'r 24 cymesuredd hyn yn ffurfio'r "
          "grŵp deuocheddrol D₁₂. Mae gan bob n-ongl rheolaidd union "
          "2n o gymesureddau.",
        ),
        const _Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H("54 o groesliniau"),
        const _P(
          "Mae croeslin yn cysylltu dau fertig anghyfagos polygon. Mae'r "
          "fformiwla n(n−3)/2 yn rhoi 12×9/2 = 54 o groesliniau i'r "
          "deuddegongl. Mae hynny'n swnio fel rhwydwaith trafferthus — "
          "ond mae'r strwythur yn drefnus iawn.",
        ),
        const _H("Chwe hyd gwahanol"),
        const _P(
          "Mae pob croeslin yn neidio dros nifer penodol o fertigau. "
          "Gan fod y deuddegongl yn gymesur, mae pob croeslin sy'n "
          "neidio dros yr un nifer o fertigau yn rhannu'r un hyd. Mae "
          "pum lled naid bosibl (1 hyd at 5 fertig), yn ogystal â'r "
          "diamedr sy'n croesi 6 — chwe math o hyd i gyd. Ar gyfer "
          "hyd ochr s = 1:",
        ),
        const _Pre(
          "  Math        Neidiau       Hyd (manwl)        Tua\n"
          "  s (ochr)    —             1                  1.000\n"
          "  d₂          1 fertig      √(2+√3)            1.932\n"
          "  d₃          2 fertig      1+√3               2.732\n"
          "  d₄          3 fertig      (3√2+√6)/2         3.346\n"
          "  d₅          4 fertig      2+√3               3.732\n"
          "  d₆ (⌀)      5 fertig      √6+√2              3.864",
        ),
        const _H("Patrymau cudd"),
        const _P(
          "Mae'r drydedd a'r bumed groeslin yn gwahaniaethu o union 1: "
          "d₃ = 1+√3 a d₅ = 2+√3. Mae'r gwahaniaeth yn hafal i hyd yr "
          "ochr ei hun — ffaith geometrig, nid un gyfrifiadol.",
        ),
        const _P(
          "Mae'r diamedr d₆ yn union ddwbl hyd y groeslin fyrraf d₂: "
          "√6+√2 = 2·√(2+√3). Mae'r diamedr a'r groeslin fyrraf yn "
          "sefyll yn y gymhareb 2:1 — yr un gyfran â'r wythawd mewn "
          "cerddoriaeth.",
        ),
        const _H("Y grid 15 gradd"),
        const _P(
          "Mae pob ongl sy'n digwydd yn y deuddegongl — rhwng ochrau, "
          "rhwng croesliniau — yn lluoswm o 15°. Mae hyn oherwydd bod "
          "y deuddeg fertig yn rhannu'r cylch llawn yn ddeuddeg sector "
          "o 30° yr un. 15° = 1/24 o'r cylch llawn. Yn ddwsin: 15° = "
          "13°doz, a 30° = 26°doz. Gellir ysgrifennu pob ongl sy'n "
          "digwydd yn ddwsin fel lluoswm cyfanrif o 13°.",
        ),
        const _Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H("Arwynebedd y deuddegongl"),
        const _P(
          "Mae gan ddeuddegongl rheolaidd â hyd ochr s arwynebedd A = "
          "3s²(2+√3). Mae'r tarddiad yn reddfol: torrwch y deuddegongl "
          "o'i ganol yn 12 o drionglau isosgeles cyfath, cyfrifwch "
          "arwynebedd un triongl, a lluosi â 12.",
        ),
        const _P(
          "Ar gyfer s = 1 mae hyn yn rhoi A ≈ 11.196 (degol). Er "
          "cymhariaeth: mae gan y cylch amgylchol arwynebedd πR² ≈ "
          "11.725. Mae'r deuddegongl yn llenwi ei gylch amgylchol i "
          "fwy na 95% — yn sylweddol well na chweongl (83%) ac yn "
          "llawer gwell na sgwâr (64%) neu driongl (41%).",
        ),
        const _H("3/π — cymhareb gain"),
        const _P(
          "Mae cymhareb arwynebedd y deuddegongl i arwynebedd y cylch "
          "amgylchol yn symleiddio i 3/π. Mae'r tarddiad yn defnyddio "
          "sin²(15°) = (2−√3)/4, sy'n canslo'r ffactor (2+√3)(2−√3) "
          "i 1 yn y gymhareb, gan adael yn union 3/π.",
        ),
        const _P(
          "3/π ≈ 0.9549 (degol) — mae'r deuddegongl yn dal 95.5% o "
          "arwynebedd y cylch. Tapiwch 3 / π = yn y cyfrifiannell i "
          "wirio.",
        ),
        const _H("Pedwar polygon wedi'u cymharu"),
        const _P(
          "Mae'r holl ffigurau isod yn rhannu'r un cylch amgylchol. "
          "Fformiwla: A = (n/2)·R²·sin(2π/n).",
        ),
        const _Pre(
          "  Ffigwr         Cyfran    Fformiwla\n"
          "  Triongl        41.3%     3√3/(4π)\n"
          "  Sgwâr          63.7%     2/π\n"
          "  Chweongl       82.7%     3√3/(2π)\n"
          "  Deuddegongl    95.5%     3/π",
        ),
        const _P(
          "Mae gan y chweongl union ddwbl arwynebedd y triongl (mae'r "
          "ddau yn cynnwys y ffactor 3√3). Ac mae pob cam yn rhoi "
          "enillion arwynebedd mwy, gan fod y fertigau yn cofleidio'r "
          "cylch yn fwy tynn.",
        ),
        const _H("Archimedes a π"),
        const _P(
          "Cyfrifodd Archimedes π drwy bolygonau. Defnyddiodd 96-ongl "
          "— 96 = 12×8 = 12×2³. Dechreuodd gyda'r chweongl (yn "
          "gynadeiladwy yn drosgynnol) a dyblu'r cyfrif fertig dair "
          "gwaith: 6→12→24→48→96. Felly y deuddegongl oedd man "
          "cychwyn ei ddull.",
        ),
        const _P(
          "Ei ganlyniad: 3 + 10/71 < π < 3 + 1/7. Mae 96-ongl yn llenwi "
          "y cylch amgylchol i 99.93%. O 95.5% y deuddegongl i 99.93% "
          "dim ond tri cham dyblu sydd — cyfradd cydgyfeirio "
          "trawiadol.",
        ),
      ];
    case 6:
      return [
        const _H("Deuddeg wyneb"),
        const _P(
          "Mae'r dodecahedron yn solid wedi'i adeiladu o ddeuddeg "
          "pentagon rheolaidd. Mae pob wyneb yn unfath, pob ymyl yn "
          "hafal o ran hyd, ac mae union dri pentagon yn cyfarfod ar "
          "bob fertig. Mae ganddo 12 wyneb, 30 ymyl ac 20 fertig i "
          "gyd. Mae'n un o'r pum solid Platonig — yr unig solidau "
          "cwfor y mae eu hwynebau yn cynnwys polygonau rheolaidd "
          "unfath yn unig.",
        ),
        const _H("Y pum solid Platonig"),
        const _Pre(
          "  Solid              Wynebau  Fertigau  Ymylon  Siâp\n"
          "  Tetrahedron          4         4         6   Trionglau\n"
          "  Ciwb                 6         8        12   Sgwariau\n"
          "  Octahedron           8         6        12   Trionglau\n"
          "  Dodecahedron        12        20        30   Pentagonau\n"
          "  Icosahedron         20        12        30   Trionglau",
        ),
        const _P(
          "Y dodecahedron yw'r unig solid Platonig sydd ag wynebau "
          "pentagonal. Yn ei gosmoleg neilltuodd Platon y pedwar solid "
          "arall i'r elfennau — a'r dodecahedron i'r cosmos ei hun.",
        ),
        const _H("Sut mae'n edrych?"),
        const _P(
          "Bydd unrhyw un sy'n chwarae gemau rôl yn ei adnabod fel y "
          "D12 — y dis deuddeg-ochrog. Mae'n eistedd yn gyfforddus yn "
          "y llaw ac yn dod i orffwys yn ddibynadwy ar un wyneb. Nid "
          "dodecahedron yw'r bêl droed: icosahedron toredig o 12 "
          "pentagon ac 20 chweongl ydyw.",
        ),
        const _H("Dodecahedronau pentagonal Gallo-Rufeinig"),
        const _P(
          "Mae dros gant o wrthrychau efydd bach siâp dodecahedron "
          "wedi'u darganfod yng ngogledd Ewrop, wedi'u dyddio i'r "
          "2il–4ydd ganrif OC. Mae ganddynt ddeuddeg wyneb pentagonal "
          "â thyllau crwn o faint amrywiol. Nid oes neb yn gwybod yn "
          "sicr i ba beth y'u defnyddiwyd. Mae damcaniaethau yn "
          "amrywio o ganwyllbrennau drwy offer arolygu i wrthrychau "
          "crefyddol. Erys y dirgelwch heb ei ddatrys.",
        ),
        const _H("Fformiwla polyhedron Euler"),
        const _P(
          "Ar gyfer pob polyhedron cwfor mae perthynas syml yn dal: "
          "mae fertigau llai ymylon plws wynebau bob amser yn hafal "
          "i ddau. Mynegodd Leonhard Euler y gyfraith hon yn 1758. "
          "Ar gyfer y dodecahedron: 20 − 30 + 12 = 2. Mae'r fformiwla "
          "yn dal ar gyfer y pum solid Platonig i gyd, ar gyfer pob "
          "prism, ar gyfer pob pyramid, ar gyfer pob polyhedron cwfor "
          "yn unrhyw fath.",
        ),
      ];
    case 7:
      return [
        const _H("Y gymhareb euraidd yn y dodecahedron"),
        const _P(
          "Mae pob wyneb o'r dodecahedron yn pentagon rheolaidd — a'r "
          "pentagon rheolaidd yw cartref y gymhareb euraidd. Mae "
          "croeslin pentagon o'r fath i'w ochr yn union fel y mae φ = "
          "(1+√5)/2 ≈ 1.618 (degol) i 1. Mae'r gyfran hon yn treiddio "
          "drwy'r solid cyfan.",
        ),
        const _Pre(
          "  Maint            Fformiwla           Degol\n"
          "  Cyfaint          (15+7√5)/4          ≈ 7.663\n"
          "  Arwynebedd       3√(25+10√5)         ≈ 20.646\n"
          "  Cylchradiws      √3·φ/2              ≈ 1.401\n"
          "  Mewnradiws       √(25+11√5)/(2√10)   ≈ 1.114",
        ),
        const _P(
          "Tapiwch φ² = yn y cyfrifiannell ac fe gewch φ+1. Dyna "
          "briodwedd ddiffiniol y gymhareb euraidd — a'r rheswm pam "
          "y mae φ yn ymddangos yn gymaint o fformiwlâu'r dodecahedron.",
        ),
        const _H("Deuoliaeth — drych yr icosahedron"),
        const _P(
          "Mae gan bob solid Platonig solid deuol: amnewidiwch bob "
          "wyneb â fertig (yng nghanol yr wyneb) a chysylltwch fertigau "
          "newydd cyfagos ag ymylon. Ar gyfer y dodecahedron mae hyn "
          "yn cynhyrchu'r icosahedron — ac i'r gwrthwyneb:",
        ),
        const _Pre(
          "                Dodecahedron   Icosahedron\n"
          "  Wynebau           12             20\n"
          "  Ymylon            30             30\n"
          "  Fertigau          20             12",
        ),
        const _P(
          "Mae wynebau a fertigau yn cyfnewid lleoedd; mae cyfrif yr "
          "ymylon yn aros yr un peth. Mae'r rhif 12 yn ymddangos yn y "
          "ddau solid — unwaith fel cyfrif wynebau, unwaith fel cyfrif "
          "fertigau.",
        ),
        const _H("120 cymesuredd"),
        const _P(
          "Mae gan y dodecahedron y cymesuredd cyfoethocaf ymhlith y "
          "solidau Platonig: y grŵp icosaheidrol Iₕ â 120 o elfennau "
          "— 60 cylchdro a 60 cylchdro-adlewyrchiad. Er cymhariaeth: "
          "dim ond 48 cymesuredd sydd gan y ciwb, 24 gan y tetrahedron.",
        ),
        const _P(
          "120 = 5! = 2³×3×5. Y tri ffactor cysefin 2, 3 a 5 yn union "
          "yw'r rhai sy'n cydgyfeirio yn wynebau'r dodecahedron "
          "(pentagonau) ac yn rhanadwyedd 12 (= 2²×3).",
        ),
      ];
    case 8:
      return [
        const _H("360 gradd a'r Babiloniaid"),
        const _P(
          "Nid cysonyn naturiol yw'r ffaith bod gan gylch llawn 360 "
          "gradd — confensiwn dynol ydyw, sy'n mynd yn ôl at y "
          "Babiloniaid. Defnyddiodd mathemateg Babilonaidd bôn 60, ac "
          "mae 360 = 6×60. Ond gellir ysgrifennu 360 hefyd fel 12×30, "
          "a dyna'n union sut y rhannodd y Babiloniaid yr awyr: "
          "rhannwyd llwybr arddangos yr haul (yr ecliptig) yn 12 "
          "rhan gyfartal o 30° yr un. Neilltuwyd cytser i bob rhan — "
          "deuddeg arwydd y sidydd.",
        ),
        const _P(
          "Nid damwain oedd dewis 12. Trefnodd y Babiloniaid eu system "
          "bôn-60 yn fewnol yn grwpiau o 12, gan fod 60 = 12×5. Iddynt "
          "hwy roedd deuddeg yn is-uned naturiol — mewn cadw amser, "
          "mewn calendr, mewn seryddiaeth.",
        ),
        const _H("Y lleuad a'r deuddeg"),
        const _P(
          "Pam deuddeg adran-awyr yn benodol? Oherwydd bod natur ei "
          "hun yn awgrymu rhaniad deuddeg-plyg: mae un flwyddyn solar "
          "yn cynnwys bron yn union 12 cylch lleuad. Mae mis synodig "
          "yn para tua 29.53 diwrnod. Mae 12 cylch lleuad yn rhoi "
          "354.4 diwrnod — dim ond 11 diwrnod yn brin o flwyddyn solar "
          "o 365.24 diwrnod. Roedd y bron-cyd-ddigwyddiad hwn yn "
          "gwneud deuddeg yn rhaniad amlwg y flwyddyn.",
        ),
        const _H("Trefn yn yr awyr"),
        const _P(
          "Roedd rhaniad deuddeg-plyg yr awyr yn llawer mwy na system "
          "gyfesurynnau i ddiwylliannau hynafol. Manylyn hudol: mae "
          "pwynt y gwanwyn yn drifftio'n araf drwy'r cytserau "
          "oherwydd bod echelin y ddaear yn gwegian fel top "
          "(rhagdrefniad, cyfnod o tua 25,800 mlynedd). Felly gelwir "
          "y cytserau y mae pwynt y gwanwyn yn drifftio drwyddynt "
          "hefyd yn oesoedd. Yma hefyd mae'r deuddeg yn strwythuro "
          "amser: deuddeg cytser, deuddeg oes, un cylch mawr.",
        ),
        const _H("Deuddeg mewn mannau eraill yn y nefoedd"),
        const _P(
          "Rhannodd yr hen Aifftiaid ddydd a nos yn 12 awr yr un — "
          "felly ein dydd 24-awr. Mae sidydd Tseiniaidd hefyd yn "
          "cyfrif deuddeg arwydd mewn cylchoedd 12-mlynedd, wedi'i "
          "deillio o orbit 12-mlynedd Iau. Cododd y ddau draddodiad "
          "yn annibynnol. Mae'r cydgyfeirio ar y rhif 12 yn drawiadol.",
        ),
      ];
    case 9:
      return [
        const _H("Pyrit — dodecahedron y ffŵl"),
        const _P(
          "Mae pyrit (FeS₂), a adweinir fel « aur ffŵl » oherwydd ei "
          "ddisgleirdeb euraidd, yn aml yn cristalu mewn ffurf debyg "
          "twyllodrus i'r dodecahedron Platonig: y pyritohedron. Mae "
          "ganddo ddeuddeg wyneb pentagonal, 20 fertig a 30 ymyl — "
          "yr un topoleg â'r dodecahedron rheolaidd o bennod 7. Ond "
          "ar archwiliad agos nid yw'r pentagonau yn rheolaidd. Mewn "
          "crisialograffeg, mae gwir cymesuredd cylchdroi pum-plyg "
          "yn amhosibl i grisialau cyfnodol — dim ond cymesureddau "
          "o orderau 1, 2, 3, 4 a 6 sydd wedi'u caniatáu. Mae'r "
          "pyritohedron yn sleifio heibio'r rheol hon gyda phentagonau "
          "afreolaidd.",
        ),
        const _H("Garnet — solid arall â deuddeg wyneb"),
        const _P(
          "Mae mwynau grŵp y garnet yn cristalu'n ffafriol fel "
          "dodecahedronau rhombig — hefyd yn solid â deuddeg wyneb, "
          "ond o natur hollol wahanol: rhombi yw'r wynebau, nid "
          "pentagonau. Mae gan y dodecahedron rhombig 14 fertig a 24 "
          "ymyl ac mae'n perthyn i'r system crisial ciwbig. Mae'n "
          "teilio gofod heb fylchau — y cyfartaledd tri-dimensiwn o'r "
          "fêl-grwybr.",
        ),
        const _P(
          "Mae natur yn defnyddio'r rhif 12 fel cyfrif wynebau ar "
          "gyfer dau ffurf crisial hollol wahanol — pentagonau mewn "
          "pyrit, rhombi mewn garnet. Nid yw deuddeg wedi'i rwymo i "
          "geometreg arbennig.",
        ),
        const _H("Radiolariaid — sgerbydau o wydr"),
        const _P(
          "Mae radiolariaid yn organebau morol un-gell, prin "
          "ddegfed milimedr ar draws, sy'n adeiladu sgerbydau filigrî "
          "o silica. Mae rhai rhywogaethau yn ffurfio sgerbydau â "
          "chymesuredd icosaheidrol — cymesuredd yr icosahedron, "
          "deuol y dodecahedron. Tynnodd y biolegydd Almaenig Ernst "
          "Haeckel yr organebau hyn yn 1904 yn ei waith « Ffurfiau "
          "Celf Natur » gyda manylder sy'n dal i argraffu heddiw.",
        ),
        const _H("Cwasi-grisialau — yr eithriad sy'n profi'r rheol"),
        const _P(
          "Yn 1982 darganfu Dan Shechtman batrwm â chymesuredd "
          "icosaheidrol mewn aloi alwminiwm-manganîs — cymesuredd sydd "
          "wedi'i wahardd mewn crisialau cyffredin. Ymatebodd y "
          "gymuned arbenigol yn gyntaf â gwrthod. Ond fe ddaliodd yr "
          "arsylwad, ac yn 2011 derbyniodd Shechtman Wobr Nobel mewn "
          "Cemeg. Mae gan y cwasi-grisialau hyn gymesuredd icosaheidrol, "
          "sy'n cynnwys geometreg dodecaheidrol ac icosaheidrol "
          "fel ei gilydd. Darganfuwyd cwasi-grisialau naturiol — y "
          "mwyn icosahedrit — yn 2009 mewn meteor yn Kamchatka.",
        ),
      ];
    case 10:
      return [
        const _H("Deuddeg ar un llaw"),
        const _P(
          "Daliwch law o'ch blaen, y bawd wedi'i hymestyn allan, ac "
          "edrychwch ar y pedwar bys. Mae gan bob bys dri segment "
          "(ffalangau), wedi'u gwahanu gan gymalau gweladwy. Pedwar "
          "bys gwaith tri segment — dyna deuddeg. Gall y bawd "
          "wasanaethu fel pwyntydd: mae'n cyffwrdd â phob segment o'r "
          "pedwar bys yn eu tro ac yn cyfrif o un i ddeuddeg.",
        ),
        const _P(
          "Nid dyfais fodern yw'r dull hwn. Mewn rhannau o dde-"
          "ddwyrain Asia, India a'r Dwyrain Agos, fe'i defnyddiwyd "
          "ers canrifoedd. Mae ganddo fantais bendant dros gyfrif "
          "bysedd Gorllewinol: mae'n defnyddio un llaw ar gyfer "
          "deuddeg uned yn lle ar gyfer pump.",
        ),
        const _H("O ddeuddeg i drigain"),
        const _P(
          "Mae'r ail law yn cyfrif y pasys cyflawn. Bob tro y mae'r "
          "llaw gyntaf wedi gorffen rownd o ddeuddeg, mae'r ail law "
          "yn ymestyn bys. Pum bys gwaith deuddeg — mae hynny'n "
          "cynhyrchu trigain. Gyda dwy law gallwch gyfrif i 60, heb "
          "unrhyw gymorth.",
        ),
        const _P(
          "Mae'r cysylltiad rhwng 12 a 60 yn debyg o fod yn ddim "
          "damwain: mae'n debyg bod y system sexagesimal Babilonaidd "
          "(bôn 60) â'i tharddiad yn union yn y dull cyfrif hwn. "
          "60 = 12×5 — uniad cain o anatomi ac arithmetig.",
        ),
        const _H("Mwy o ddeuddegau yn anatomi'r corff dynol"),
        const _Pre(
          "  — 12 pâr o asennau (anatomeg safonol)\n"
          "  — 12 pâr o nerfau cranïaidd (I Olfactol drwy XII Hypoglosol)\n"
          "  — 12 fertebra thorasig (cysylltiedig â'r 12 pâr asennau)",
        ),
        const _P(
          "Mae amrywiadau anatomegol yn digwydd (mae 11 neu 13 pâr "
          "o asennau yn brin yn bosibl).",
        ),
        const _H("A wnaeth y llaw siapio'r system rifau?"),
        const _P(
          "Ni ellir setlo â sicrwydd hanesyddol pa un a wnaeth anatomeg "
          "cymalau bysedd ddylanwadu ar ymddangosiad systemau rhifau "
          "dwsin, neu i'r gwrthwyneb. Efallai mai atgyfnerthiad "
          "cilyddol oedd: dechreuodd pobl gyfrif ar gymalau bysedd "
          "oherwydd bod deuddeg eisoes yn bwysig yn eu diwylliant. Yr "
          "hyn sy'n sicr: mae'r llaw ddynol yn cynnig sail gorfforol "
          "naturiol ar gyfer deuddeg.",
        ),
      ];
    case 11:
      return [
        const _H("Deuddegau ym mywyd beunyddiol"),
        const _Pre(
          "  12 modfedd  = 1 droedfedd\n"
          "  12 owns     = 1 pwys troy (metelau gwerthfawr)\n"
          "  12 ceiniog  = 1 swllt (arian Prydeinig hyd 1971)\n"
          "  12 darn     = 1 dwsin\n"
          "  144         = 12² = 1 grôs",
        ),
        const _P(
          "Nid damweiniau hanesyddol yw'r rhaniadau hyn — fe'u dewiswyd "
          "oherwydd eu bod yn gwneud rhannu'n hawdd. Mae troedfedd yn "
          "rhannu'n ddwy ran gyfartal (6 modfedd yr un), yn dair (4 "
          "modfedd yr un), yn bedair (3 modfedd yr un) ac yn chwech "
          "(2 fodfedd yr un). Mae pob un o'r rhaniadau hyn yn dod allan "
          "yn fanwl gywir.",
        ),
        const _P(
          "Mae metr, ar y llaw arall, yn rhannu'n ddwy ran gyfartal "
          "(50 cm yr un) ac yn bump (20 cm yr un), ond mae traean "
          "metr yn 33.333… cm — ffracsiwn diddiwedd cyn gynted ag y "
          "byddwch yn mynd ag ef yn fanwl gywir. Mewn crefftau lle "
          "mae traninnu a chwarteru yn barhaus, mae deuddeg yn fwy "
          "ymarferol na deg.",
        ),
        const _H("Y system fetrig — a'i man dall"),
        const _P(
          "Mae gan y system fetrig gryfderau mawr: mae'n gyson (mae'r "
          "holl unedau yn gweddu i'w gilydd), mae'n graddio'n ddegol "
          "(kilo, mega, mili, micro), ac mae wedi'i safoni'n "
          "rhyngwladol. Mae'r manteision hyn yn wir ac yn drwm. Ni "
          "fyddai unrhyw berson synhwyrol yn cynnig dileu SI.",
        ),
        const _P(
          "Ond mae'r system fetrig yn etifeddu gwendid ei bôn. Ym môn "
          "10 mae traean yn ffracsiwn diddiwedd: 0.333… Mewn system "
          "fetrig dwsin byddai 1/3 yn 0.4 — manwl gywir, byr, heb "
          "weddill. Byddai ceinder yr egwyddor fetrig yn cael ei "
          "gadw — dim ond y bôn fyddai'n well.",
        ),
        const _H("TGM Tom Pendlebury"),
        const _P(
          "Dilynodd Tom Pendlebury, aelod o Gymdeithas Ddwsin Prydain "
          "Fawr, y meddwl hwn i'w gasgliad. Galwir ei system TGM — "
          "wedi'i henwi ar ôl ei thair uned sylfaen Tim (amser), "
          "Grafut (hyd), Maz (màs). Dechreuodd Pendlebury nid â hyd "
          "ond ag amser: rhannodd yr awr yn 12⁴ rhan gyfartal. O'r "
          "Tim deilliodd y Grafut drwy gyflymiad disgyrchol y ddaear "
          "(≈ 29.6 cm), a'r uned màs Maz o gyfaint Grafut ciwbig o ddŵr.",
        ),
        const _P(
          "Y canlyniad yw system gwbl gyson o unedau, lle mae'r holl "
          "drosglwyddiadau yn bwerau o 12. Nid yw TGM erioed wedi'i "
          "fabwysiadu y tu hwnt i gylchoedd brwdfrydwyr, ond mae'n "
          "dangos na fyddai system fetrig dwsin yn bosibl yn unig — "
          "mewn rhai parthau byddai'n well na'r un ddegol.",
        ),
        const _H("Beth y mae'r cyfrifiannell hwn yn ei ddangos"),
        const _P(
          "Tapiwch 1 / 3 = a gweld 0.4 — byr, manwl gywir, heb far "
          "ailadrodd — ac fe ddeallwch mewn eiliad yr hyn na all "
          "tudalennau o ddadleuon ei drosglwyddo. Ni fydd y cwestiwn "
          "« dwsin neu ddegol? » byth yn cael ei setlo'n ymarferol. "
          "Ond mae manteision mathemategol bôn 12 yn wrthrychol ac "
          "yn fesuradwy, ac mae'r cyfrifiannell hwn yn eu gwneud yn "
          "ganfyddadwy.",
        ),
        const _P(
          "Awgrym: mae offeryn «Trawsnewidiadau imperialaidd-12» yn y "
          "ddewislen wybodaeth sy'n datgymalu unrhyw werth dros yr "
          "ysgolion uned hyn — eitemau/dwsinau/grôs, modfeddi/"
          "troedfeddi/llathenni/milltiroedd, ownsiau troy hyd at "
          "tunelli hir, ceiniogau/sylltau/punnau, amser ac ongl. "
          "Teipiwch rif a gwelwch sut y mae'r un gwerth yn datgymalu "
          "ar draws ysgol pob parth.",
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
