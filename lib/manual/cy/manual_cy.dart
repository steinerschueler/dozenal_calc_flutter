// cy manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_cy.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersCy() => const [
  ManualChapter('Dechrau arni', [
    _H("Y ffigurau"),
    _P(
      "Defnyddia'r cyfrifiannell hwn ei symbolau ei hun ar gyfer y "
      "deuddeg ffigur i gyd. Mae pedwar ffigur ancr yn bennau saeth "
      "wedi'u stileiddio sy'n pwyntio i'r pedwar cyfeiriad cardinal "
      "— 1 (i fyny), 4 (i'r chwith), 7 (i'r dde), A (i lawr). Maent "
      "yn rhannu'r cylch rhif yn bedwar grŵp o dri, fel oriau 12, 3, "
      "6 a 9 ar wyneb cloc.",
    ),
    _P(
      "Adeiledir pob ffigur rhyngddynt o hanner-gylchoedd a chylchoedd "
      "llawn. Cylch syml yw sero, a hanner-cylch uwchben cylch llawn yw B "
      "(= un ar ddeg).",
    ),
    _DigitLegend(),
    _H("Defnydd sylfaenol"),
    _P(
      "Tapiwch rifau a gweithredwyr fel ar gyfrifiannell poced "
      "cyffredin. Gwasgwch y fysell lydan = ar yr ymyl gwaelod i "
      "gyfrifo'r canlyniad. Mae AC (mewn coch rhybudd) yn clirio'r "
      "mewnbwn a'r canlyniad cyfan; mae Del yn dileu'r cymeriad i "
      "chwith y cyrchwr.",
    ),
    _H("Cymorth a damcaniaeth"),
    _P(
      "I chwith ac i ddeau'r fysell =, eistedda dau fotwm crwn: mae "
      "(i) yn agor y deuddeg pennod ddamcaniaeth hyn, mae (?) yn "
      "ailchwarae'r daith weithredu gyda'r marciau coch. Mae'r daith "
      "yn agor yn awtomatig ar y lansiad cyntaf.",
    ),
    _H("Y cyrchwr a llywio"),
    _P(
      "Y bar coch yn y maes mewnbwn yw'r cyrchwr. Defnyddiwch ◀ a ▶ "
      "i'w symud, gan fewnosod neu ddileu cymeriadau yng nghanol "
      "fformiwla. Ar ôl cyfrifiad, mae'r cyrchwr yn symud i'r maes "
      "canlyniad — mae'r saethau wedyn yn symud cyrchwr y canlyniad. "
      "Cyn gynted ag y dechreuwch fewnbwn newydd, mae'r cyrchwr yn "
      "neidio'n ôl i'r maes mewnbwn.",
    ),
    _H("Parhau cyfrifiad"),
    _P(
      "Ar ôl cyfrifiad gallwch barhau'n syth gyda gweithredydd. "
      "Tapiwch + 5 = er enghraifft, ac mae'r cyfrifiannell yn "
      "defnyddio'r canlyniad olaf yn awtomatig fel yr operand cyntaf. "
      "I ddechrau cyfrifiad cwbl newydd, gwasgwch AC yn gyntaf.",
    ),
    _H("Tap dwbl ar gyfer swyddogaethau gwrthdroëdig"),
    _P(
      "Mae ail dap ar fysell swyddogaeth yn ei throi i'w gwrthdroad: "
      "daw sin yn sin⁻¹, daw cos yn cos⁻¹, ac yn y blaen. Mae'r un "
      "rheol yn berthnasol i'r swyddogaethau hyperbolig yn y panel "
      "estyniad. Mae dot bach euraidd ar y fysell yn dynodi y bydd "
      "y tap nesaf yn gwrthdroi.",
    ),
    _H("Pwysiad hir am ragor"),
    _P(
      "Mae bysellau â chornel fach yn y gornel dde isaf yn cynnig "
      "swyddogaethau cysylltiedig gyda phwysiad hir: mae x□ yn "
      "cynnwys x², mae log yn cynnwys ln, log₁₂ ac eˣ, mae − yn "
      "cynnwys ±, mae STO yn cynnwys M+ ac M−, mae n! yn cynnwys "
      "nCr ac nPr. I ddewis, llithrwch eich bys i'r opsiwn a "
      "ddymunir a gollyngwch — neu gollyngwch a thapiwch yr "
      "opsiwn. Mae tap y tu allan yn cau'r naidlen.",
    ),
    _H("Gweithredwyr arbennig"),
    _P(
      "Mae x² yn sgwario'r rhif blaenorol. Mae √ yn cyfrifo'r gwraidd "
      "sgwâr; os yw rhif yn sefyll i'w chwith, hwnnw yw gradd y "
      "gwraidd: mae 3√8 yn rhoi gwraidd ciwbig 8, hynny yw 2. Mae log "
      "yn cyfrifo logarithm lle mae'r rhif ar y chwith yn fewnbwn a'r "
      "rhif ar y dde yn fôn: 8 log 2 yw logarithm 8 i fôn 2, hynny yw "
      "3. Mae ⊕ "
      "yn cyfrifo'r swm cyfochrog: a ⊕ b = (a·b)/(a+b), defnyddiol "
      "ar gyfer gwrthyddion cyfochrog.",
    ),
    _H("Y panel estyniad"),
    _P(
      "Mae'r fysell … yn y gornel dde isaf yn agor y panel estyniad "
      "gyda mwy o swyddogaethau: cof, cysonion (π, e, φ, √2), "
      "swyddogaethau hyperbolig, gweithredwyr datblygedig, "
      "ynghyd ag EXP a DRG. Mae'r un fysell yn ei chau, neu dapio y tu allan "
      "i'r panel. Ar dabledi mae pob set ochr yn ochr beth bynnag "
      "— does dim haen.",
    ),
    _Pre(
      "  6 — Cof:           STO   RCL   MC    Ans\n"
      "  7 — Cysonion:      π     e     φ     √2\n"
      "  8 — Hyperbolig:    sinh  cosh  tanh  coth\n"
      "  9 — Datblygedig:   n!    |x|   1/x   mod\n"
      "  10 — Moddau:       EXP   DRG   …",
    ),
    _H("Cof"),
    _P(
      "Mae STO yn storio'r canlyniad cyfredol, mae RCL yn mewnosod "
      "y gwerth wedi'i storio i'r mewnbwn, mae MC yn clirio'r cof. "
      "Mae M bach ar y sgrin yn dangos bod rhywbeth wedi'i storio. "
      "Mae Ans yn mewnosod canlyniad y cyfrifiad olaf — caiff "
      "gwerthoedd rhesymol manwl gywir eu storio'n llawn, cedwir "
      "cyfnodoldeb.",
    ),
    _H("Y bar cyfnod"),
    _P(
      "Pan fo'r canlyniad yn ffracsiwn cyfnodol, mae'r cyfrifiannell "
      "yn marcio'r ffigurau sy'n ailadrodd gyda bar uwch eu pen. "
      "Enghraifft: mae 1/5 yn rhoi 0.2497 gyda bar uwchben y pedwar "
      "ffigur i gyd. Ar gyfer cyfnodau hwy na phum ffigur, dim ond "
      "y pum cyntaf a ddangosir, gan ddilyn …",
    ),
    _H("System rifau: Doz / Dez"),
    _P(
      "Newidiwch y system rifau yn y gosodiadau, ar gael drwy'r "
      "fysell (i): mae dwsin yn cyfrifo ym môn 12 (diofyn), degol "
      "ym môn 10. Dangosir y system weithredol yng nghornel dde "
      "uchaf y sgrin.",
    ),
    _P(
      "Wrth newid, caiff y rhif sy'n weladwy ar hyn o bryd ei "
      "drosglwyddo'n awtomatig i'r system arall. Daw « 10 » yn Doz "
      "yn « 12 » yn Dez. Ym modd Dez daw'r symbolau ar gyfer 10 ac "
      "11 yn anweithredol (llwyd), gan nad ydynt yn bodoli fel "
      "ffigurau unigol ym môn 10 — pan fydd angen Doz, newidiwch "
      "yn ôl.",
    ),
    _H("Modd ongl"),
    _P(
      "Mae DRG yn cylchu modd ongl y swyddogaethau trigonometrig: "
      "DEG → RAD → GRD → DEG. Dangosir y modd cyfredol yng nghornel "
      "dde uchaf y sgrin, yn union uwchben y dangosydd Doz/Dez. "
      "Diofyn yw DEG.",
    ),
  ]),
  ManualChapter('Esbonyddion, Gwreiddiau a Logarithmau', [
    _H('Tair cwestiwn am un berthynas'),
    _P(
      'Mae codi i bŵer, tynnu gwraidd a chymryd logarithm yn edrych fel tair '
      'gweithred wahanol. Mewn gwirionedd, tair cwestiwn am yr un berthynas '
      'ydynt: b i rym e yn rhoi n, yn fyr b^e = n. Yma b yw\'r sylfaen, e yw\'r '
      'esbonydd ac n yw\'r canlyniad. Os oes gennych ddau o\'r tri maint hyn '
      'gallwch ddod o hyd i\'r trydydd — a dyna\'n union bwrpas y tair bysell '
      'x^□, √ a log.',
    ),
    _P(
      "Mae'r pŵer yn ateb: mae'r sylfaen a'r esbonydd yn hysbys, pa mor fawr "
      "yw'r canlyniad? Mae'r gwraidd yn ateb: mae'r canlyniad a'r esbonydd yn "
      "hysbys, pa sylfaen oedd hi? Mae'r logarithm yn ateb: mae'r sylfaen a'r "
      "canlyniad yn hysbys, pa esbonydd sy'n cuddio y tu ôl iddynt? Felly "
      "gwrthdroeon y broses godi i bŵer yw'r gwraidd a'r logarithm.",
    ),
    PowerTriangleFigure(power: 'Pŵer', base: 'Sylfaen', exponent: 'Esbonydd'),
    _H('Pwerau: lluosi dro ar ôl tro'),
    _P(
      'Nid yw\'r pŵer b^e yn golygu dim mwy i ddechrau na lluosi b â\'i hun yn '
      'union e o weithiau. Felly mae 2^3 = 2·2·2 = 8 a 3^2 = 3·3 = 9. Mae codi '
      'i bŵer yn cywasgu lluosiad, yn union fel mae lluosiad yn cywasgu adiad.',
    ),
    _P(
      "O'r syniad syml hwn deillia deddfau esbonyddion, y gallwch eu deall "
      "ar unwaith drwy gyfrif y ffactorau. Os lluosir dau bŵer o'r un sylfaen, "
      "mae'r esbonyddion yn adio: b^m · b^n = b^(m+n) — rhestrir y ffactorau "
      "yn syml. Mae codi pŵer i bŵer yn lluosi'r esbonyddion: (b^m)^n = b^(m·n).",
    ),
    _P(
      "Daw dau achos arbennig o'r un ddeddf. Mae b^0 bob amser yn 1, oherwydd "
      "mae b^1 wedi'i rannu gan b^1 yn rhoi 1 a hefyd b^(1−1) = b^0. Ac mae "
      "esbonydd negatif yn golygu'r cilydd: b^(−n) = 1/b^n, gan fod "
      "b^n · b^(−n) yn rhaid bod yn b^0 = 1.",
    ),
    _P(
      "Os plotir gwerthoedd pŵer fel 2^x, ceir cromlin sy'n codi'n fwyfwy "
      "serth — y darlun cyfarwydd o dwf esbonyddol.",
    ),
    ExpCurveFigure(),
    _H("Y gwraidd — y gwrthdroad cyntaf"),
    _P(
      "Mae'r gwraidd yn dadwneud codi i bŵer pan fo'r esbonydd yn hysbys. "
      "Gwraidd sgwâr 9 yw 3, oherwydd 3^2 = 9; gwraidd ciwbig 8 yw 2, oherwydd "
      "2^3 = 8. Ar y cyfrifiannell mae √ yn sefyll am y gwraidd sgwâr; teipiwch "
      "rif i'w chwith a daw'r rhif hwnnw yn raddfa'r gwraidd — mae 3√8 yn wraidd "
      "ciwbig 8.",
    ),
    _P(
      "Nid yw gwraidd yn ddim ond pŵer ag esbonydd ffracsiynol: gwraidd n-fed x "
      "yw x^(1/n). Nid confensiwn yn unig mo hyn ond mae'n dilyn yn uniongyrchol "
      "o ddeddf esbonyddion — codwch x^(1/n) i rym n a chewch "
      "x^((1/n)·n) = x^1 = x. Lluniwch y = x² a y = √x yn yr un darlun a "
      "byddant yn ddelweddau drych ar hyd y llinell y = x. Dyna'r arwydd gweladwy "
      "fod un ffwythiant yn gwrthdroi'r llall.",
    ),
    SquareRootFigure(),
    _H("Y logarithm — yr ail wrthdroad"),
    _P(
      "Mae'r logarithm yn dadwneud codi i bŵer pan fo'r sylfaen yn hysbys. "
      "Mae'n ateb: â pha esbonydd mae'n rhaid codi'r sylfaen er mwyn cael y "
      "canlyniad? Ysgrifennir log_b(n) = e. Felly mae log_2(8) = 3, oherwydd "
      "2^3 = 8. Ar y cyfrifiannell, teipiwch 8 log 2 — yr arg ar y chwith, "
      "y sylfaen ar y dde.",
    ),
    _P(
      "Mae'r logarithm hefyd yn ddelwedd drych: daw y = log_2(x) o y = 2^x "
      "drwy adlewyrchu ar hyd y llinell y = x. Lle mae'r gromlin esbonyddol "
      "yn dringo'n serth, nid yw'r logarithm ond yn tyfu'n araf — mae'n troi "
      "ystodau enfawr yn rifau hwylus.",
    ),
    ExpLogFigure(),
    _H("Deddfau logarithmau"),
    _P(
      "Oherwydd bod y logarithm yn gwrthdroi pwerau, mae deddfau esbonyddion "
      "yn troi'n ddeddfau logarithmau fel delwedd drych. Daw lluoswm yn swm: "
      "log(x·y) = log x + log y. Daw rhaniad yn wahaniaeth: "
      "log(x/y) = log x − log y. Ac mae esbonydd yn yr arg yn dod yn ffactor "
      "o'i flaen: log(x^k) = k · log x.",
    ),
    _P(
      "Bu'r trawsnewidiad hwn o luosiad yn adiad yn bwrpas gwirioneddol "
      "logarithmau am ganrifoedd: gyda thablau logarithmau, gellid disodli "
      "lluosiadau blin â chyfeiriadau a adiad syml. Yr un egwyddor sy'n "
      "sail i bob graddfa logarithmig — o raddfa decibel sain i faint daeargryn.",
    ),
    _P(
      "Mae sylfaen logarithm yn rhydd i'w dewis, a gellir trosi unrhyw "
      "sylfaen i unrhyw un arall: log_b(x) = log_c(x) / log_c(b). Nid yw ln "
      "(sylfaen e), log i sylfaen 2 a log₁₂ yn swyddogaethau hollol wahanol, "
      "ond yr un cwestiwn ar raddfa wahanol — maent yn wahanol dim ond gan "
      "ffactor sefydlog.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Mae'r tair bysell sylfaenol yn Set 2: x^□ ar gyfer y pŵer, √ ar gyfer "
      "y gwraidd, log ar gyfer y logarithm. Mae x² ym mlwch pwysiad hir y "
      "fysell bŵer yn ffurf fer am 'sgwâr'. Mae pwysiad hir ar log hefyd yn "
      "rhoi ln, log₁₂ ac eˣ; mae'r rhain yn agor cromfach ar unwaith i chi "
      "deipio'r arg i mewn iddi.",
    ),
    _P(
      "Mae'r gweithredydd pŵer yn gysylltol dde: mae 2^2^3 yn golygu "
      "2^(2^3) = 2^8, nid (2^2)^3. Mae esbonyddion cyfanrif a'r nodiant "
      "gwyddonol EXP (a EXP b = a·12^b) yn aros yn union; mae gwreiddiau a "
      "logarithmau, ar y llaw arall, yn dangos '≈' hyd yn oed pan fo'r "
      "canlyniad yn rhif cyfan — maent yn rhedeg drwy'r gwerthuswr bras.",
    ),
    _Pre(
      'Mewnbwn       Canlyniad   (degol)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          gwraidd ciwbig\n'
      '8 log 2    ≈   3          log i sylfaen 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H("Pwerau deuddeg a log₁₂"),
    _P(
      "Ym môn deuddeg, pwerau deuddeg yw'r rhifau crwn, yn union fel y mae "
      "pwerau deg yn y system ddegol: ysgrifennir deuddeg yn '10', cant a "
      "pedwar deg a phedwar yn '100', mil saith cant dau ddeg ac wyth yn '1000'. "
      "Felly pan welwch '100' yn y cyfrifiannell, rydych yn meddwl am naid o "
      "144, nid 100.",
    ),
    _P(
      "Dyna pam mai log₁₂ yw'r cyfriffigur naturiol yn y system ddwsinol — "
      "yn union fel y logarithm deg yn y system ddegol. Ar gyfer pŵer o "
      "ddeuddeg, ei werth yw nifer y ffigurau llai un yn union: "
      "log₁₂('10') = 1, log₁₂('100') = 2, log₁₂('1000') = 3.",
    ),
    _P(
      "Mae sgwariau a chwibiau yn edrych yn anghyfarwydd yn ddwsinol, ond yr "
      "un gwerthoedd ydynt — dim ond wedi'u hysgrifennu'n wahanol. Mae 4² yn "
      "'14' (un deg chwech), 5² yn '21' (dau ddeg pump), A² yn '84' (cant), "
      "B² yn 'A1' (cant dau ddeg un). Nid yw'r mathemateg byth yn newid gyda "
      "sylfaen ysgrifennu; mae e a ln hefyd yn annibynnol ar sylfaen. Dim ond "
      "y dilyniant ffigurau sy'n newid, nid y gwerth.",
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H("Beth i'w wylio"),
    _P(
      "Mae rhai mewnbynnau heb eu diffinio ac yn arwain at wall: logarithm "
      "sero neu rif negatif, yn ogystal â'r sylfaenau 0 ac 1. Nid yw gwraidd "
      "sgwâr rhif negatif ychwaith yn bodoli yn y rhifau real. Esbonyddion "
      "negatif a ffracsiynol, ar y llaw arall, a ganiateir heb gyfyngiad "
      "— mae 8^(−1/3) yn 1/2.",
    ),
    _P(
      "Ac unwaith eto am y '≈': nid yw'n golygu 'amhur'. Mae gwreiddiau a "
      "logarithmau bob amser yn rhedeg drwy'r gwerthuswr pwynt arnofio ac "
      "felly'n dwyn yr arwydd hwn, hyd yn oed pan fo'r canlyniad yn rhif cyfan "
      "taclus. Mae'r gwerth a ddangosir yn gywir — dim ond y dull cyfrifo y "
      "mae'r arwydd yn ei ddatgelu.",
    ),
  ]),
  ManualChapter('Adiad cyfochrog (⊕)', [
    _H('Pumed gweithred'),
    _P(
      "Ochr yn ochr â'r pedair gweithred sylfaenol, mae'r cyfrifiannell yn "
      "cario pumed gweithred lai adnabyddus: adiad cyfochrog, ysgrifennir â'r "
      "arwydd ⊕. Diffinnir ef fel a ⊕ b = (a·b)/(a+b). Mae'n cael ei enw o "
      "peirianneg drydanol — mae'n disgrifio cyfanswm gwrthiant dau wrthydd "
      "mewn cyfochrogedd — ond mae'r un fformiwla'n ymddangos ym mhobman "
      "lle nad y meintiau eu hunain ond eu cilyddion sy'n adio.",
    ),
    _H("Mae cerrynt yn cymryd y llwybr haws"),
    _P(
      "Os cysylltir dau wrthydd yn gyfochrog, maent rhwng yr un ddau bwynt; "
      "mae'r un foltedd ar draws y ddau, ac mae'r cerrynt yn rhannu rhwng "
      "y ddau lwybr. Faint sy'n llifo drwy bob cangen yn dibynnu ar ei "
      "gwrthiant — mae mwy yn llifo drwy'r llwybr gwrthiant is.",
    ),
    _P(
      "Y dargludedd yw'r hyn sy'n bwysig, cilydd y gwrthiant (G = 1/R): "
      "mae'n dweud pa mor dda y mae cydran yn gadael cerrynt drwodd. Mewn "
      "cyfochrogedd mae'r dargludeddau'n adio: 1/R = 1/R₁ + 1/R₂. Datryswch "
      "hyn ar gyfer R a chewch yr adiad cyfochrog yn union: "
      "R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.",
    ),
    ParallelCircuitFigure(),
    _H('Bob amser yn llai na\'r lleiaf'),
    _P(
      "Y canlyniad syn: mae cyfanswm y gwrthiant bob amser yn llai na'r lleiaf "
      "o'r ddau wrthiant unigol. Mae ail lwybr yn gadael cerrynt ychwanegol "
      "drwodd, beth bynnag fo'i wrthiant. Mae dau wrthydd hafal yn gyfochrog "
      "yn haneru'r gwerth: 6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. Mae gwrthydd 6 Ω a "
      "gwrthydd 3 Ω yn rhoi 18/9 = 2 Ω — llai na 3.",
    ),
    _P(
      "Yn reddfol: mae dwy ddrws ochr yn ochr yn gadael mwy o bobl drwodd "
      "nag un; mae agor ail til yn byrhau'r ciw. Mae mwy o lwybrau'n golygu "
      "llai o wrthiant a mwy o drwygyrch.",
    ),
    ParallelBarFigure(lessThanBoth: "llai na'r naill werth na'r llall"),
    _H('Deillio\'r fformiwla'),
    _P(
      "Y man cychwyn yw'r rheol fod y cilyddion yn adio: "
      "1/(a⊕b) = 1/a + 1/b. Rhowch yr ochr dde dros enwadur cyffredin a daw "
      "yn (a+b)/(a·b). Cilydd hwnnw yw a ⊕ b = (a·b)/(a+b). Nid oes dim mwy "
      "i'r peth — y gweithred gyfan yw 'adio'r cilyddion a chymryd cilydd y "
      "canlyniad'.",
    ),
    _H('Priodweddau'),
    _P(
      "Deillia rheolau cyfrifo o gymesuredd y fformiwla. Mae ⊕ yn "
      "gymudiannol (a ⊕ b = b ⊕ a) ac yn gysylltol, felly gallwch gyfuno "
      "unrhyw nifer o werthoedd: gyda thri therm, mae tri chilydd yn adio'n "
      "syml, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Mae gwerthoedd hafal yn symlhau'n "
      "arbennig o daclus — mae n rhif hafal yn gyfochrog yn rhoi a/n, felly "
      "mae a ⊕ a = a/2 ac a ⊕ a ⊕ a = a/3.",
    ),
    _P(
      "Ar gyfer rhifau positif mae'r canlyniad bob amser o dan yr operand "
      "lleiaf. Mae dau achos terfynol yn cwblhau'r darlun: a ⊕ 0 = 0 — mae "
      "llwybr heb wrthiant, cylched fer, yn tynnu'r holl gerrynt. A pho "
      "fwyaf y daw b, y nesaf y daw a ⊕ b at a; nid yw gwrthiant anfeidrol "
      "fawr, toriad, yn cyfrannu dim. 'Anfeidredd' felly yw'r elfen niwtral "
      "o adiad cyfochrog — fel y mae sero yn elfen niwtral adiad cyffredin.",
    ),
    _H("Cymedr harmonig a deuoledd"),
    _P(
      "Mae adiad cyfochrog yn agos at y cymedr harmonig: cymedr harmonig dau "
      "rif yw 2·(a ⊕ b), ac mae a ⊕ b yn hanner hwnnw. O'r tri chymedr "
      "clasurol, y cymedr harmonig yw'r isaf bob amser — o dan y geometrig "
      "a'r rhifyddol.",
    ),
    _P(
      "Yn ddyfnach, ⊕ yw delwedd drych adiad cyffredin o dan y mapio cilydd "
      "x → 1/x: adiwch yn normal yn y gofod cilydd ac rydych yn adio'n "
      "gyfochrog yma, a'r gwrthwyneb. Mae cyfres a chyfochrogedd yn ddeuol "
      "i'w gilydd yn yr ystyr hwn — yr un berthynas â sbringiau pen wrth ben "
      "ac ochr yn ochr.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Mae'r fysell ⊕ ymhlith glypiau'r gweithredwyr yn Set 2, wrth ymyl "
      "x^□, √ a log. Teipiwch a ⊕ b fel cyfrifiad cyffredin: yn gyntaf a, "
      "yna ⊕, yna b, yna =. Yn wahanol i'r gwraidd a'r logarithm, mae ⊕ yn "
      "cyfrifo'n union — mae'n rhedeg ar y trac ffracsiwn â chanfyddiad cyfnod "
      "a felly nid yw'n dangos '≈'.",
    ),
    _Pre(
      'Mewnbwn        Canlyniad   (degol)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, cyfnod 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      "Mae'r enghraifft olaf yn dangos swyn y dwsinol: '10' ⊕ '20' — hynny "
      "yw, deuddeg yn gyfochrog ag ugain a phedair ohm — yn rhoi 8 taclus. Ac "
      "mae 2 ⊕ 3 yn gyfnodol ym môn deuddeg (1.2497… gyda gorlein uwchben "
      "2497), ond yn union serch hynny; ym môn deg byddai'r un canlyniad yn "
      "syml yn 1.2.",
    ),
    _H('Pan fo\'r swm yn sero'),
    _P(
      "Mae un achos lle mae ⊕ yn methu: os yw a + b = 0, er enghraifft "
      "5 ⊕ (−5), mae sero yn yr enwadur a bydd y cyfrifiannell yn adrodd "
      "rhaniad â sero. Ar ôl y gwall gellir golygu'r mynegiad yn uniongyrchol "
      "— llywiwch iddo â'r bysellau saeth a chywirwch y gwerth; mae AC yn "
      "ailosod popeth.",
    ),
  ]),
  ManualChapter('Trigonometreg', [
    _H('Onglau a\'u mesurau'),
    _P(
      "Astudio'r berthynas rhwng onglau a hydoedd yw trigonometreg. Mae ongl "
      "yn disgrifio cylchdro — pa mor bell y mae'n rhaid troi pelydryn o "
      "amgylch ei bwynt terfyn. Mesurir ef mewn tair uned gyffredin: mewn "
      "graddau (cylch llawn yw 360°), mewn radianau (cylch llawn yw 2π) ac "
      "mewn gradianau neu gon (cylch llawn yw 400). Nid yw'r mesur a "
      "ddewiswch yn newid yr ongl ei hun — dim ond y rhif sy'n ei disgrifio. "
      "Mae'r cyfrifiannell yn newid rhyngddynt â'r fysell DRG.",
    ),
    _H('Sin, cosin, tangiad yn y triongl'),
    _P(
      "Mewn triongl ongl sgwâr mae gan bob ongl lem θ ystyr benodol. Yr ochr "
      "hiraf, gyferbyn â'r ongl sgwâr, yw'r hypotenws. Yr ochr gyferbyn â θ "
      "yw'r ochr gyferbyn, a'r un nesaf ati yw'r ochr gyfagos.",
    ),
    _P(
      "O'r tair ochr hyn ffurfir tair cymhareb sy'n gyson ar gyfer ongl "
      "benodol — yn annibynnol ar faint y triongl: "
      "sin = cyferbyn/hypotenws, cosin = cyfagos/hypotenws, "
      "tangiad = cyferbyn/cyfagos = sin/cos. Cilydd y tangiad yw'r cotangiad. "
      "Mae'r cofair Saesneg SOH-CAH-TOA yn crynhoi'r tair cyntaf.",
    ),
    RightTriangleFigure(
      adjacent: 'Cyfagos',
      opposite: 'Cyferbyn',
      hypotenuse: 'Hypotenws',
      sinRatio: 'sin θ = Cyf / Hyp',
      cosRatio: 'cos θ = Cga / Hyp',
      tanRatio: 'tan θ = Cyf / Cga',
    ),
    _H('Y cylch uned'),
    _P(
      "Nid yw trionglau ond yn cwmpasu onglau rhwng 0° a 90°. Mae'r cylch "
      "uned — cylch â radiws 1 o amgylch y tarddbwynt — yn ehangu'r golwg i "
      "bob ongl. I bob ongl θ mae pwynt ar y cylch: gan gychwyn o'r pwynt "
      "(1, 0) trowch yn wrthglocwedd drwy θ. Yna cosin yw cyfesuryn-x y "
      "pwynt hwn a sin yw ei gyfesuryn-y.",
    ),
    _P(
      "Yn y modd hwn mae onglau uwchlaw 90° ac onglau negyddol hefyd yn cael "
      "lle naturiol. Ar 180° mae'r pwynt yn (−1, 0): cos 180° = −1, "
      "sin 180° = 0. Ar 270° yn (0, −1). Mae'r tangiad yn parhau'n gymhareb "
      "sin/cos ac yn cytuno â diffiniad y triongl.",
    ),
    UnitCircleFigure(),
    _H('Pythagoras ar y cylch'),
    _P(
      "Gan fod gan y cylch uned radiws 1, mae pob pwynt arno'n bodloni "
      "x² + y² = 1. Mewn nodiant trigonometrig: cos²θ + sin²θ = 1. Nid "
      "fformiwla newydd mo hon ond theorem Pythagoras ar y cylch uned. "
      "O hyn deillia sin²θ = 1 − cos²θ ar unwaith — sail llawer o "
      "drawsffurfiadau.",
    ),
    _H('Tonnau a chyfnodau'),
    _P(
      "Ar ôl tro llawn rydych yn ôl yn y man cychwyn: mae sin a cosin yn "
      "ailadrodd â chyfnod o 360° (neu 2π). Plotiwch sin θ dros yr ongl a "
      "daw'r don sin gyfarwydd i'r golwg, yn siglo rhwng −1 a +1; mae'r "
      "cosin yr un don, wedi'i symud 90° yn unig. Mae tonnau o'r fath yn "
      "disgrifio sain, golau a cherrynt eiledol — pob dirgryniad.",
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
    _H('Y swyddogaethau gwrthdro'),
    _P(
      "Weithiau fe wyddoch y gymhareb ac fe geisiwch yr ongl. Ar gyfer hynny "
      "mae'r swyddogaethau gwrthdro sin⁻¹, cos⁻¹, tan⁻¹ (y swyddogaethau "
      "arc): o sin θ = 0.5 daw sin⁻¹(0.5) = 30°. Oherwydd bod sin a cosin yn "
      "gyfnodol, mae onglau anfeidrol lawer yn perthyn i bob cymhareb; felly "
      "dim ond un amrediad nodedig a ddychwel y swyddogaethau arc — sin⁻¹ a "
      "tan⁻¹ o −90° i +90°, cos⁻¹ o 0° i 180°.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Mae'r pedair swyddogaeth sin, cos, tan a cot ar y prif allweddell ac "
      "yn agor cromfach ar unwaith wrth eu pwyso (sin( â'r cyrchwr y tu "
      "mewn). Mae ail dap ar yr un fysell yn newid i'r swyddogaeth wrthdro — "
      "mae dot euraidd yn dangos y bydd y tap nesaf yn gwrthdroi. Mae'r "
      "fysell DRG yn newid y modd ongl (DEG → RAD → GRD), a ddangosir "
      "yn dde uchaf; yn y proffil 'Syml' gwneir hyn drwy'r Gosodiadau.",
    ),
    _P(
      "Mae trap dwsinol i wylio amdano: teipir yr ongl yn y system rifau "
      "weithredol. Ym modd dwsinol, nid naw deg gradd yw '90' ond "
      "9·12 = 108. I gyfrifo sin(90°) teipiwch '76' (gan fod 7·12+6 = 90). "
      "Dyma'r gwerthoedd cyffredin:",
    ),
    _Pre(
      'Graddau (degol)     Mewnbwn (dwsinol)\n'
      '30°                  26\n'
      '45°                  39\n'
      '60°                  50\n'
      '90°                  76\n'
      '180°                 130\n'
      '360°                 260',
    ),
    _P('Ac ychydig o enghreifftiau wedi eu gweithio ym modd DEG:'),
    _Pre(
      'Mewnbwn        ystyr         Canlyniad\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       ongl ar gyfer 1   ≈76  (= 90°)',
    ),
    _P(
      "Mae pob canlyniad trigonometrig yn dwyn '≈', oherwydd mae sin, cos a "
      "tan yn gyffredinol afresymol — hyd yn oed pan fo'r gwerth mor daclus â "
      "sin(90°) = 1. Nid yw tan(90°) wedi'i ddiffinio; mae'r cyfrifiannell yn "
      "dangos rhif mawr iawn yno, oherwydd nid yw cos(90°) yn union sero o "
      "safbwynt cyfrifiadurol.",
    ),
    _H('Onglau ym môn deuddeg'),
    _P(
      "Hyd yn oed mae gwerthoedd cylch llawn cyfarwydd yn edrych yn ddieithr "
      "yn ddwsinol: ysgrifennir 360° yn '260' (2·144 + 6·12), 400 gradian yn "
      "'294'. Dim ond y radian sy'n osgoi'r cwestiwn — mae 2π yn gysonyn, "
      "yn annibynnol ar y system rifau; mae pwy bynnag sy'n gweithio yn RAD "
      "yn osgoi'r trap yn llwyr.",
    ),
    _P(
      "Mae'r ffaith fod y cylch llawn â 360 rhan yn cyd-fynd â deuddeg yn "
      "dda: mae gan 360 nifer fawr iawn o ranyddion (dau ddwsin ohonynt), "
      "felly gellir rhannu'r cylch yn daclus yn hanner, traean, chwarter, "
      "chweched a mwy — a 12·30 = 360, un ddeuddegfed o'r cylch yw 30° yn "
      "union. Fel bob amser: mae trigonometreg ei hun yn annibynnol ar y "
      "system rifau. Mae sin(30°) yn ½, boed yr ongl yn '30' yn ddegol neu "
      "yn '26' yn ddwsinol. Dim ond ffigurau'r mewnbwn sy'n newid.",
    ),
  ]),
  ManualChapter('Storio a Galw yn ôl', [
    _P(
      "Nid yw cyfrifiannell yn wirioneddol gyflym nes na fydd yn rhaid i chi "
      "ail-deipio rhifau'n barhaus. Mae pedwar teclyn yn cymryd y gwaith hwn "
      "oddi arnoch: y canlyniad olaf (Ans), cof â enw (STO/RCL), croniadur "
      "(M+/M−) a thâp hanes y sesiwn. Nid ydynt yn gorgyffwrdd ond mae pob "
      "un yn cwmpasu sefyllfa wahanol.",
    ),
    _H('Y canlyniad olaf: Ans'),
    _P(
      "Ar ôl pob cyfrifiad mae'r cyfrifiannell yn cofio'r canlyniad o dan yr "
      "enw Ans. Os teipiwch ymlaen yn syth â gweithredydd — dyweder '× 2 =' "
      "ar unwaith ar ôl canlyniad — defnyddir Ans yn awtomatig fel yr operand "
      "cyntaf, heb gyffwrdd y fysell o gwbl. Dyma'r symudiad mwyaf cyffredin "
      "wrth gyfrifo mewn cadwyn: mae canlyniad un cam yn dawel yn dechrau'r "
      "cam nesaf.",
    ),
    _P(
      "Os oes angen y canlyniad olaf arnoch nid ar y dechrau ond yng nghanol "
      "fformiwla newydd, mewnosodir ef yn benodol â Ans. Pwysig: mae Ans "
      "bob amser yn dal y canlyniad cyflawn — gan gynnwys ffracsiwn cyfnodol, "
      "nid dim ond y ffigurau gweladwy.",
    ),
    _H('Y cof: STO, RCL, MC'),
    _P(
      "Mae gwendid i Ans: mae'r '=' nesaf yn ei drosysgrifo. I gadw gwerth "
      "ar draws sawl cyfrifiad annibynnol, storiwch ef gyda STO yn y cof. "
      "Mae 'M' bach ar frig y sgrin wedyn yn dangos bod rhywbeth wedi'i "
      "storio. Mae RCL (galw'n ôl) yn mewnosod y gwerth a storiwyd yn ôl "
      "i'r mewnbwn yn safle'r cyrchwr — cymaint o weithiau ag a fynnwch. "
      "Mae MC (clirio cof) yn gwagu'r cof, a'r 'M' yn diffodd.",
    ),
    _P(
      "Senario nodweddiadol: cyfrifwch radiws cylch a'i angen wedyn ar "
      "gyfer yr arwynebedd a'r cylchedd. Storiwyd y radiws unwaith gyda STO; "
      "mae'r ddwy fformiwla wedyn yn ei alw'n ôl yn annibynnol â RCL, heb "
      "ei ail-deipio unwaith.",
    ),
    _H('Y croniadur: M+ ac M−'),
    _P(
      "Weithiau nid am gadw un gwerth yr ydych ond am adeiladu cyfanswm "
      "rhedegol — er enghraifft wrth adio llawer o eitemau. Ar gyfer hynny "
      "mae M+ ac M−, ar gael drwy bwysiad hir ar STO. Mae M+ yn adio'r "
      "canlyniad olaf at y gwerth a storiwyd, mae M− yn ei dynnu. Mae'r cof "
      "yn tyfu neu'n crebachu â phob tro, heb i chi orfod gweld na nodi'r "
      "is-gyfanswm eich hun. Mae RCL yn dangos y cyfanswm terfynol, mae MC "
      "yn ailosod y croniadur i sero.",
    ),
    MemoryFlowFigure(result: 'Canlyniad', store: 'Cof', input: 'Mewnbwn'),
    _P(
      "Mae'r braslun yn crynhoi'r llwybrau: mae STO yn cario'r canlyniad "
      "i'r cof, mae RCL yn ei nôl oddi yno i'r mewnbwn. Mae Ans yn cymryd "
      "y llwybr byr yn uniongyrchol o'r canlyniad i'r mewnbwn, gan osgoi'r "
      "cof (torlinell). Mae M+/M− yn dolen y canlyniad yn ôl i'r cof ac yn "
      "ei adio yno.",
    ),
    _H('Ans neu gof — pryd pa un?'),
    _P(
      "Mae'r dewis yn dilyn rheol syml. Defnyddiwch Ans pan fo angen y "
      "canlyniad ar unwaith yn y cam nesaf — yn gyflym a heb baratoi. "
      "Defnyddiwch y cof pan ddylai gwerth fod ar gael ar draws sawl "
      "cyfrifiad ar wahân neu fod yn ddiogel rhag y '=' nesaf. Mae M+ ac M− "
      "un lefel uwchlaw: nid ar gyfer galw un gwerth yn ôl y'u bwriedir ond "
      "ar gyfer adio llawer o ganlyniadau unigol yn gyfanswm.",
    ),
    _H('Wedi ei storio yn union — dim gwall talgrynnu'),
    _P(
      "Mae'r rhan fwyaf o gyfrifiannellau'n gweithio'n fewnol â rhifau "
      "pwynt arnofio o fanwl gywirdeb penodol. Mae'r hyn a ddangosir eisoes "
      "wedi ei dalgrynnu — a'r union werth talgrynnu hwnnw sy'n cyrraedd y "
      "cof. Cyfrifwch ymlaen a byddwch yn cario'r gwall gyda chi; ar ôl sawl "
      "cam mae canlyniad a ddylai fod yn union 1 yn dangos '0.9999…'.",
    ),
    _P(
      "Mae'r cyfrifiannell hwn yn dal canlyniadau rhesymol fel gwir ffracsiwn "
      "o gyfanrifau mympwyol fawr — heb dalgrynnu. A'r union ffracsiwn hwn "
      "sy'n mynd i'r cof: mae STO, RCL, Ans a'r croniadur yn cadw'r rhifiadur "
      "a'r enwadur yn llawn, nid dim ond y ffigurau gweladwy. Enghraifft: "
      "mae 1 ÷ 7 yn gyfnodol yn ddwsinol (bloc 186A35). Storiwch y canlyniad "
      "a lluoswch ef â 7 wedyn, a daw 1 yn union allan — oherwydd ni "
      "chariodd y cyfrifiannell ddim ond 1/7 erioed. Byddai dyfais sy'n "
      "storio dim ond y ffigurau a ddangosir yn cyrraedd '0.BBBB…'.",
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (cyfnod, gyda gorlein)\n'
      '… STO          →  "M" yn ymddangos; wedi storio: union 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (nid 0.BBBB…)',
    ),
    _P(
      "Mae'r cyfrifiannell yn onest yn ei derfyn: ni all ganlyniadau afresymol "
      "— gwreiddiau, logarithmau, trigonometreg — eu dal fel ffracsiwn. Maent "
      "yn dwyn '≈' ac yn cael eu storio fel brasamcan. Mae'r rheol yn hawdd "
      "i'w darllen: os yw '≈' o flaen y gwerth, brasamcan yw'r hyn a "
      "storiwyd; os yw'n absennol, mae'n union.",
    ),
    _H("Tâp yr hanes"),
    _P(
      "I ddefnyddio cyfrifiad cynharach eto, swipiwch i lawr ar y sgrin. "
      "Mae hynny'n agor tâp hanes y sesiwn gyfredol — y cyfrifiad diweddaraf "
      "ar y brig, hyd at ddeg ar hugain o gofnodion. Nid yw hyd yn oed AC "
      "yn ei glirio; cedwir ef am y sesiwn gyfan. Mae tap ar gofnod yn dod "
      "â'i werth canlyniad yn ôl i'r mewnbwn, yn union fel Ans — dim ond ar "
      "gyfer unrhyw gam cynharach.",
    ),
    HistoryBandFigure(swipe: 'sweipio', newCap: 'newydd', tap: 'tapio'),
    _P(
      "Nid storfa barhaol mo dâp yr hanes ond edrychiad yn ôl: mae'n "
      "cadw edefyn sesiwn ac yn gadael i chi adfer gwerth a gyfrifwyd "
      "ond na chafodd ei storio'n benodol.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Mae STO, RCL, MC ac Ans yn y panel estyniad: agorwch ef â'r "
      "fysell '…' ac yna tapiwch y swyddogaeth a ddymunir. Mae M+ ac M− "
      "yn cuddio y tu ôl i bwysiad hir ar STO — mae'r gornel fach yn y "
      "gornel dde isaf o'r fysell yn pwyntio ato; yn y naidlen dewiswch "
      "M+ neu M−. Yn y proffil 'Syml' nid oes panel estyniad; nid yw'r "
      "swyddogaethau cof ar gael yno.",
    ),
    _P('Tair enghraifft wedi eu gweithio (ym modd dwsinol):'),
    _Pre(
      'Storio a mewnosod yn ddiweddarach\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  "M" yn ymddangos\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      "Parhau'n uniongyrchol gydag Ans\n"
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 yn awtomatig)',
    ),
    _Pre(
      "Adio eitemau â M+\n"
      '  … MC                   clirio cof\n'
      '  5 =   … STO(dal) M+   →  cof 5\n'
      '  7 =   … STO(dal) M+   →  cof 10\n'
      '  3 =   … STO(dal) M+   →  cof 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      "I wirio yn ddegol: 5 + 7 + 3 = 15, a 15 yn ddwsinol yw '13' "
      "(1·12 + 3). Mae'r pedwar teclyn i gyd — Ans, cof, croniadur a thâp "
      "hanes — yn gweithio ar yr un union werth; pwy bynnag sy'n eu hadnabod "
      "prin y mae angen iddo deipio rhif â llaw na chadw is-gyfanswm yn ei ben.",
    ),
  ]),
  ManualChapter('Swyddogaethau hyperbolig', [
    _P(
      "Yn yr ysgol dysgir sin a cosin fel cyfesurynnau pwynt ar y cylch "
      "uned. Llai adnabyddus, ond yr un mor sylfaenol, yw eu cymheiriad "
      "hyperbolig sinh a cosh. Maent yn codi pan amidir'r cylch â hyperbol "
      "— a'r allwedd iddynt yw'r ffwythiant esbonyddol eˣ.",
    ),
    _H("Y rhan ffwythiant eilrif a'r rhan ffwythiant odrif o eˣ"),
    _P(
      "Gellir hollti pob ffwythiant yn ran ffwythiant eilrif (cymesur am echelin-y) a "
      "rhan ffwythiant odrif (cymesuredd pwynt am y tarddbwynt). Ar gyfer eˣ gellir "
      "ysgrifennu'r ddwy ran yn uniongyrchol: cosh yw'r rhan ffwythiant eilrif, sinh yw'r "
      "rhan ffwythiant odrif. Adiwch hwy eto a daw eˣ yn ôl — oherwydd "
      "eˣ = cosh x + sinh x, ac e⁻ˣ = cosh x − sinh x. Nid mympwyol yw'r "
      "deiliad hwn ond yr unig un posibl.",
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      "tanh yw'r ilosfwyd, a coth yw ei gilydd (ac felly wedi'i ddiffinio "
      "dim ond ar gyfer x ≠ 0). Ar y dde mae'r gwrthdroeon, y ddown atynt "
      "yn fuan.",
    ),
    _H('Y hyperbol uned'),
    _P(
      "Ar y cylch uned mae pob pwynt (cos t, sin t) yn bodloni'r hafaliad "
      "x² + y² = 1. Ar gyfer y swyddogaethau hyperbolig mae hunaniaeth bron "
      "yr un fath, ond un hollbwysig wahanol, yn dal. Amnewid y diffiniadau "
      "a chyfrifo gwahaniaeth y sgwariau, a bydd y termau cymysg yn canslo:",
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      "Felly mae'r pwynt (cosh t, sinh t) bob amser ar y gromlin x² − y² = 1, "
      "yr hyperbol uned. Oherwydd nad yw cosh t byth yn llai nag 1, mae'r "
      "pwynt bob amser ar y gangen dde. Mae'r hunaniaeth cosh²t − sinh²t = 1 "
      "yn chwarae'r un rôl yn y byd hyperbolig ag y mae cos²t + sin²t = 1 "
      "yn y byd crwn — ond mae'r plws wedi troi'n finws.",
    ),
    UnitHyperbolaFigure(area: 'Arwynebedd = t/2'),
    _H('Y paramedr: arwynebedd, nid ongl'),
    _P(
      "Dyma'r gwahaniaeth dyfnaf â thrigonometreg. Ar y cylch mae'r "
      "paramedr t yn ongl mewn radianau — ac ar yr un pryd hyd yr arc a "
      "dwywaith arwynebedd y sector; mae'r tair ystyr hyn yn digwydd cyd-"
      "daro yno. Ar yr hyperbol nid oes y fath ongl. Yr hyn sy'n aros yw'r "
      "arwynebedd: t yw dwywaith arwynebedd y sector hyperbolig rhwng y "
      "tarddbwynt, y fertig (1, 0) a'r pwynt (cosh t, sinh t) — union yr "
      "arwynebedd lliwio yn y ffigur uchod.",
    ),
    _P(
      "Oddi yno daw enw'r gwrthdroeon. Fe'u gelwir yn swyddogaethau arwynebedd "
      "— arsinh, arcosh, artanh — o'r Lladin 'area', arwynebedd. Mae'r "
      "'arcsinh' cyffredin ar rai dyfeisiau'n anghywir yn llym: mae'n "
      "trosglwyddo'r rhagddodiad arc i swyddogaeth lle nad oes arc o gwbl. "
      "Mae arsinh(y) yn y gwerth paramedr t hwnnw lle mae sinh t = y — hynny "
      "yw, arwynebedd, nid arc.",
    ),
    _H('Siâp y pedair gromlin'),
    _P(
      "Mae cosh yn drap cymesur am yr echelin sy'n agor i fyny â'i bwynt "
      "isaf yn (0, 1), gan fod cosh 0 = 1; nid yw ei werth byth yn llai nag "
      "1. Mae sinh yn gymesur am y pwynt, yn rhedeg drwy'r tarddbwynt ac yn "
      "tyfu heb derfyn yn y ddau gyfeiriad. Ar gyfer x mawr mae'r ddau'n "
      "agosáu at y gromlin eˣ/2.",
    ),
    _P(
      "Mae tanh yn gromlin ddirlawnder ar ffurf S: yn codi'n gyson, drwy'r "
      "tarddbwynt, ac yn aros yn llym rhwng −1 a +1 — agosêir at y ffiniau "
      "hyn, ond ni chyrhaeddir hwy byth. Mae coth o'r diwedd yn ymddwyn fel "
      "cilydd tanh, ond oherwydd bod sinh 0 = 0 mae ganddo bolion yn x = 0 "
      "ac mae'n aros y tu allan i [−1, 1].",
    ),
    HyperbolicCurvesFigure(),
    _H('Perthynas â thrigonometreg'),
    _P(
      "Mae'r ddau deulu wedi'u plethu o'r un defnydd: y ffwythiant esbonyddol. "
      "Mae fformiwla Euler yn ysgrifennu'r swyddogaethau crwn yn hollol gyffredin "
      "— cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). Mae'r patrwm yr "
      "un peth; dim ond bod y ffwythiant esbonyddol ar gyfer y swyddogaethau "
      "crwn yn rhedeg ar yr echelin dychmygol (arg i·t), ac ar gyfer y rhai "
      "hyperbolig ar yr echelin real (arg x). Os yw rhifau cymhlyg yn dal yn "
      "anghyfarwydd, gallwch hepgor y syniad hwn — yr unig beth pwysig yw: "
      "yr un ffwythiant yw yn y bôn.",
    ),
    _P(
      "Yn geometrig mae'r un adeiladwaith — pwynt ar gromlin, wedi'i "
      "baramedradu gan ddwywaith arwynebedd y sector — ond unwaith ar y "
      "cylch, unwaith ar yr hyperbol. O hyn deillia'r arwydd troëdig: "
      "cos² + sin² = 1 yn erbyn cosh² − sinh² = 1. Amnewid arg dychmygol "
      "a bydd y teuluoedd yn mynd yn uniongyrchol i'w gilydd: "
      "cos(i·x) = cosh x a sin(i·x) = i·sinh x. Felly mae'r swyddogaethau "
      "hyperbolig yn 'swyddogaethau trigonometrig ag arg dychmygol'.",
    ),
    _P(
      "Mae theoremau adio hefyd yn rhedeg yn gyfochrog: "
      "sinh(a+b) = sinh a·cosh b + cosh a·sinh b, yn union fel ar gyfer y sin. "
      "Ar gyfer y cosin, fodd bynnag, mae arwydd yn troi — mae cos(a+b) â "
      "minws, mae cosh(a+b) â phlws. Rheol Osborn yw hon: mae pob hunaniaeth "
      "trigonometrig yn dod yn hyperbolig drwy amnewid sin→sinh, cos→cosh a "
      "throi'r arwydd ym mhobman lle mae lluoswm dau ffactor sin. Mae arwydd "
      "anghywir bron bob amser yn union yn y fan honno.",
    ),
    _H('Cymwysiadau yn y byd'),
    _P(
      "Y mwyaf adnabyddus yw'r gadwynlin. Nid parabolig y ffurfio rhaff yn "
      "hongian yn rhydd rhwng dau bwynt — aeth Galileo ei hun ar gyfeiliorn "
      "yma — ond y gromlin y = a·cosh(x/a). Gydag ogwydd bas mae'r ddau'n "
      "debyg; gydag un dwfn daw'r gwahaniaeth i'r amlwg: mae'r gadwynlin yn "
      "tyfu'n gyflymach nag unrhyw barabola. I'r gwrthwyneb — fel bwa cosh "
      "sy'n agor i lawr — mae'n disgrifio ffurf ddelfrydol bwa cynhaliol sy'n "
      "trosglwyddo ei lwyth drwy wasgu yn unig.",
    ),
    CatenaryFigure(catenary: 'Cadwynlin', parabola: 'Parabola'),
    _P(
      "Mae cwympo ag aer-wrthiant hefyd yma: os tyf y grym brecio â sgwâr y "
      "cyflymder, mae'r cyflymder yn dilyn cromlin tanh ac yn agosáu at y "
      "buanedd terfynol yn dawel, heb ei orfodi byth — dirlawnder tanh yw'r "
      "ffiseg ei hun yma.",
    ),
    _P(
      "Yn y ddamcaniaeth berthydedd, yn olaf, nid yw cyflymderau ger "
      "cyflymder golau yn adio'n syml. Diffinniwch y 'buanrwydd' φ drwy "
      "v = c·tanh φ a daw'r fformiwla adio gymhleth yn syml eto: mae'r "
      "buanrwyddau'n adio'n gyffredin (φ = φ₁ + φ₂), yn union am fod gan "
      "tanh ei theorem adio. Yr hyn yw'r radian mewn geometreg wastad yw'r "
      "buanrwydd mewn geometreg gofod-amser.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Mae'r pedair swyddogaeth yn Set 8, y panel estyniad: agorwch ef â'r "
      "fysell '…', yna tapiwch sinh, cosh, tanh neu coth. Mae pob un yn agor "
      "cromfach ar unwaith (sinh( â'r cyrchwr y tu mewn); os yw'r un cau ar "
      "goll, mae'r cyfrifiannell yn ei hychwanegu wrth '='. Mae ail dap ar yr "
      "un fysell yn newid i'r swyddogaeth arwynebedd (sinh ↔ arsinh ac yn y "
      "blaen) — mae dot euraidd yn dangos y bydd y tap nesaf yn gwrthdroi.",
    ),
    _P(
      "Y gwahaniaeth pwysicaf rhag trigonometreg: nid ongl yw'r arg ond rhif "
      "pur. Nid oes unrhyw effaith o gwbl gan y modd ongl (DEG/RAD/GRD) ar y "
      "swyddogaethau hyperbolig — dim trosi graddau, dim trap ongl dwsinol fel "
      "gyda sin a cos. Mae sinh(2) yn golygu'r un peth ym mhob modd. Gan fod "
      "y swyddogaethau hyn yn drawsgrisiol, mae eu canlyniadau bob amser yn dwyn "
      "'≈'.",
    ),
    _P('Enghreifftiau wedi eu gweithio (pob canlyniad ≈, dwsinol wedi ei gwtogi):'),
    _Pre(
      'Mewnbwn       degol       dwsinol\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1.1752      1.2128B7B6…\n'
      'cosh(1)       1.5431      1.66253A10…\n'
      'tanh(1)       0.7616      0.91804BB6…\n'
      'arsinh(1)     0.8814      0.A6B01B51…\n'
      'arcosh(2)     1.3170      1.397853260…',
    ),
    _P(
      "Gellir gwirio'r hunaniaeth sylfaenol yn uniongyrchol: mae cosh(2)² "
      "− sinh(2)² yn rhoi ≈1. Yn fathemategol mae'n union 1; mae'r gweddill "
      "pwynt arnofio bach o dan y trothwy dangos, a bydd y cyfrifiannell yn "
      "ei gloi ar yr 1 taclus.",
    ),
    _P(
      "Y tu allan i'w parth diffiniad mae'r swyddogaethau'n adrodd gwall — "
      "rhaid ailosod ag AC wedyn:",
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = deg. 0.5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      "Mae arsinh wedi'i ddiffinio ar gyfer pob rhif; mae arcosh yn gofyn "
      "am x ≥ 1; mae artanh yn gofyn am |x| < 1; mae arcoth yn byw yn union "
      "y tu allan, yn |x| > 1. Pwy bynnag sy'n cadw hynny mewn cof, mae'n "
      "osgoi'r negeseuon gwall o'r dechrau.",
    ),
  ]),
  ManualChapter('Set 9 & 10', [
    _P(
      "Mae'r ddau banel olaf o'r maes estyniad yn bwndelu'r hyn sydd ei "
      "angen ar gyfrifiannell gwyddonol ymhellach: cyfrif (ffactoriol a "
      "cyfuniadeg), tri gweithredydd defnyddiol (gwerth absoliwt, cilydd, "
      "gweddill) a nodiant gwyddonol. Mae'r cyfan y tu ôl i'r fysell '…'.",
    ),
    _H("Ffactoriol: porth i gyfrif"),
    _P(
      "Lluoswm pob rhif o 1 i n yw ffactoriol cyfanrif n, ysgrifennir n!: "
      "n! = 1·2·3·…·n. Fel achos arbennig mae 0! = 1. Mae'r gwerthoedd "
      "cyntaf yn ddiniwed — 3! = 6, 4! = 20, 5! = A0 (= 120 degol) — ond "
      "wedyn mae'r dilyniant yn ffrwydro: mae 10! (ffactoriol deuddeg) eisoes "
      "yn 114500000 ym môn deuddeg, bron hanner biliwn.",
    ),
    _P(
      "I beth? Mae n! yn cyfrif trefniadau. Gellir eistedd pum gwestai mewn "
      "rhes mewn 5! = A0 o ffyrdd: pum dewis ar gyfer y sedd gyntaf, pedwar "
      "ar gyfer yr ail, tair ar gyfer y drydedd ac yn y blaen. Y ffactoriol "
      "yw'r elfen adeiladu ar gyfer popeth sy'n dilyn. Ar y cyfrifiannell mae "
      "n! yn union — nid yw'r canlyniad yn dwyn '≈'.",
    ),
    _H("Amrywiadau: dewis â threfn"),
    _P(
      "Yn aml nid ydych yn trefnu popeth ond yn dewis r o n beth — a mae "
      "trefn yn bwysig. Ras ag wyth gyrrwr: faint o bodiwm (1af, 2il, 3ydd) "
      "sy'n bosibl? Wyth ar gyfer aur, saith ar gyfer arian, chwech ar gyfer "
      "efydd: 8·7·6 = 240 (= 336 degol). Yn gyffredinol nPr (n amrywio r) "
      "= n!/(n−r)!. Rhennir â (n−r)! oherwydd bod y ffactorau is yn cwympo.",
    ),
    _H("Cyfuniadau: dewis heb drefn"),
    _P(
      "Weithiau nid yw trefn yn berthnasol — mewn llaw cardiau, yn y loteri, "
      "mewn ysgwyd llaw. nCr ('n dewis r') = n!/(r!·(n−r)!) yw nifer y "
      "detholion heb drefn. Mae'r cysylltiad yn syml: gellir trefnu pob "
      "detholiad heb drefn o r beth ar r! o ffyrdd, felly nCr = nPr/r!. "
      "Tair o chwech ar gyfer pwyllgor: 6 nCr 3 = 18 (= 20 degol). Mae "
      "ysgwydau llaw mewn grŵp o n o bobl yn n nCr 2 — gyda phum person A "
      "(= 10), gyda dwsin eisoes 56 (= 66 degol).",
    ),
    _P(
      "Manylyn i'r ddau hyn: mae nCr ac nPr wedi eu hadeiladu o ffactorialau "
      "pwynt arnofio a felly bob amser yn dwyn '≈', hyd yn oed pan fo'r "
      "canlyniad — fel y mae bron bob amser — yn rhif cyfan. Yn y loteri rhif "
      "(chwech o 49), er enghraifft, mae 49 nCr 6 yn rhoi ≈48245A0 — tua "
      "phedair ar ddeg miliwn ar y nod o bosibiliadau am un tocyn.",
    ),
    _H("Triongl Pascal"),
    _P(
      "Trefnwch werthoedd nCr fesul rhes ac mae patrwm yn ymddangos: yn rhes "
      "n mae n nCr 0, n nCr 1, …, n nCr n, un ar ôl y llall. Swm y ddau "
      "uwch ei ben yw pob rhif — felly mae'r triongl yn tyfu heb ffactorialau "
      "o gwbl. Mae'r ymylon i gyd yn unedau, ac mae'n gymesur "
      "(n nCr r = n nCr (n−r)).",
    ),
    PascalTriangleFigure(title: "Triongl Pascal"),
    _P(
      "Ym môn deuddeg mae'r triongl yn edrych bron yr un fath â'r arfer — "
      "dim ond yn rhes 5 y mae 'A' yn ymddangos yn lle deg. Yr un rhifau, "
      "gyda llaw, yw cyfernodau (a+b)ⁿ: o res 4 (1, 4, 6, 4, 1) darllenon "
      "ni (a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴ yn uniongyrchol. Mae hyn "
      "yn cysylltu cyfuniadeg ac algebra mewn un darlun.",
    ),
    _H("Gwerth absoliwt a chilydd"),
    _P(
      "Pellter rhif o sero yw'r gwerth absoliwt |x| — mae'r arwydd yn cael "
      "ei daflu, |−7| = 7. Manylyn mewnbwn: mae'r gweithredwyr ôl-dreiglad "
      "(|x|, n!, 1/x) yn rhwymo'n dynnach na minws blaenllaw. Mae '−5' ac "
      "wedyn |x| felly'n rhoi −(|5|) = −5; os am werth absoliwt y rhif "
      "negatif, defnyddiwch gromfachau: mae (−5) ac wedyn |x| yn rhoi 5.",
    ),
    _P(
      "Yr unig bartner lluosog yw'r cilydd 1/x: mae x · (1/x) = 1, a bydd "
      "y cyfrifiannell yn ei gadw'n union fel ffracsiwn. Mae dwsinol yn "
      "dangos hyn yn arbennig o daclus — mae 1/4 yn 0.3 glân (tair deuddegfed "
      "yw chwarter) a 1/3 yn 0.4, lle mae môn deg eisoes yn rhedeg i'r "
      "0.333… cyfnodol. Nid yw cilydd sero wedi'i ddiffinio.",
    ),
    _H("Modwlo: gweddillion a chylchoedd"),
    _P(
      "Saith wedi'i rannu â thri yw dau, gweddill un — a dyma'n union yr hyn "
      "y mae '7 mod 3 = 1' yn ei roi. Y darlun mwyaf amlwg yw'r cloc: ar ôl "
      "deuddeg mae'r cyfrif yn ailddechrau, '14:00' yw '2 y prynhawn', am "
      "fod 14 mod 12 = 2. Mae'r cloc yn cyfrifo ym môn deuddeg — dim "
      "cyd-ddigwyddiad.",
    ),
    ModuloClockFigure(
      title: 'Modwlo — rhifeg cloc',
      wrap: "amlapio",
      note: '(= 17 deg., 17 mod 12 = 5)',
    ),
    _P(
      "Modwlo yw'r teclyn naturiol ar gyfer rhannadwyedd: a mod b = 0 yn "
      "golygu'n union fod b yn rhannu a. Mae dwsinol yn rhoi miniogedd "
      "arbennig i hyn, oherwydd mae gan ddeuddeg nifer anghyffredin o "
      "ranyddion — 1, 2, 3, 4, 6 a 12, yn erbyn dim ond 1, 2, 5, 10 ar "
      "gyfer deg. Yn aml gellir darllen rhannadwyedd â dau, tair, pedwar neu "
      "chwech oddi wrth yr olaf ffigurau yn ddwsinol.",
    ),
    _H("Nodiant gwyddonol mewn pwerau deuddeg"),
    _P(
      "Ysgrifennir rhifau mawr neu fach iawn yn gryno fel mantisa lluoswm "
      "pŵer y sylfaen. Yn ddegol mae '3 EXP 8' yn golygu'r gwerth 3 × 10⁸. "
      "Mae'r cyfrifiannell hwn yn cario'r egwyddor drwodd yn gyson ym môn "
      "deuddeg: ym modd dwsinol nid a × 10ᵇ yw ystyr 'a EXP b' ond a × 12ᵇ. "
      "Mae'r esbonydd yn cyfrif pwerau deuddeg.",
    ),
    DozenalPowersScaleFigure(
      title: 'Pwerau deuddeg — 1 EXP n',
      dozLabel: 'Dwsin.',
      decLabel: 'Degol.',
    ),
    _P(
      "Mae gan y pwerau hyn enwau eu hunain hyd yn oed: 12¹ = dwsin, "
      "12² = 144 = gros, 12³ = 1728 = gros mawr. Yn ddwsinol mae'r rhain yn "
      "union yn y lleoedd crwn 10, 100, 1000. Felly mae '1 EXP 2' yn rhoi'r "
      "gwerth 100 (= 144 degol) a '1 EXP 3' y gwerth 1000 (= 1728). Ar gyfer "
      "esbonyddion cyfanrif mae'r trac union yn cyfrifo; ym modd degol mae "
      "EXP yn cyfrif mewn pwerau deg eto.",
    ),
    _H("Modd ongl a chau"),
    _P(
      "Mae Set 10 hefyd yn dal DRG a Close. Mae DRG yn cylchu modd ongl "
      "(DEG → RAD → GRD) ar gyfer y swyddogaethau trigonometrig — trafodir "
      "yn fanwl ym mhennod trigonometreg; yn y proffil 'Syml' gosodid ef "
      "drwy'r Gosodiadau. Mae Close yn plygu'r panel estyniad yn ôl i mewn, "
      "cyfatebol i'r fysell '…'. Mae'r cyn-switsh Doz/Dez wedi symud o'r "
      "allweddell i'r Gosodiadau.",
    ),
    _H('Ar y cyfrifiannell hwn'),
    _P(
      "Cyrchir yr holl fysellau hyn drwy'r panel estyniad '…' (yn y proffil "
      "'Syml' mae Set 9 a 10 wedi'u cuddio). Mae n!, |x| ac 1/x yn gweithredu "
      "ôl-dreiglad — yn gyntaf y rhif, yna'r fysell; mae mod, nCr ac nPr yn "
      "ddeuaidd (a mod b). Mae pwysiad hir ar n! yn agor y naidlen â nCr ac "
      "nPr; mae'r gornel fach yn y gornel dde isaf o'r fysell yn pwyntio ato.",
    ),
    _P('Enghreifftiau wedi eu gweithio (ym modd dwsinol):'),
    _Pre(
      'Mewnbwn       ystyr                 Canlyniad\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       cilydd 4              0.3     (union)\n'
      '7 mod 3       gweddill 7 ÷ 3        1\n'
      '5 nCr 2       cyfuniadau            ≈A      (= 10)\n'
      '8 nPr 3       amrywiadau            ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      "Mae n!, |x|, 1/x a mod yn union (dim '≈'); dim ond nCr ac nPr sy'n "
      "dwyn yr arwydd brasamcan. Y tu allan i'r amrediad dilys mae'r "
      "swyddogaethau'n adrodd gwall — ailosodwch ag AC wedyn:",
    ),
    _Pre(
      '0 → 1/x       cilydd sero           DIV BY ZERO\n'
      '7 mod 0       gweddill drwy sero    DOMAIN ERROR\n'
      '(−4)!         ffactoriol negatif    DOMAIN ERROR',
    ),
    _P(
      "Gyda hynny mae'r blwch offer yn gyflawn: o'r pwysiad ffigur syml yn y "
      "defnydd sylfaenol at cyfuniadeg, modwlo a nodiant maint-graddfa "
      "dwsinol, mae'r cyfrifiannell yn cyfrifo'n union lle gall, ac yn onest "
      "â '≈' lle mai brasamcan yn unig sy'n bosibl.",
    ),
  ]),
];
