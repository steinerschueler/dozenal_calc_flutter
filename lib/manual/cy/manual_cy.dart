// cy manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_cy.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersCy() => const [
  ManualChapter('Grundbedienung', [
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
      "mewnbwn a'r canlyniad cyfan ; mae Del yn dileu'r cymeriad i "
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
      "DEG → RAD → GRAD → DEG. Dangosir y modd cyfredol yng nghornel "
      "dde uchaf y sgrin, yn union uwchben y dangosydd Doz/Dez. "
      "Diofyn yw DEG.",
    ),
  ]),
];
