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
    'Rhifau cylchol',
    [
      ProseSection(
        'Y seithfed a’i berthnasau',
        'Nid yw seithfed yn dod allan yn lân ym môn Deuddeg, ond yn ailadrodd: '
            'seithfed = 0,186A35, yna 186A35 eto, yn ddiddiwedd. (Mae A yn sefyll '
            'am Ddeg, B am Un ar ddeg.) Y grŵp sy’n ailadrodd yw’r cyfnod; mae’n '
            'chwe digid o hyd yma.\n\n'
            'Gwelir yr hyn sy’n syfrdanol wrth osod y seithfedau eraill yn '
            'eu hymyl. Dau seithfed = 0,35186A, tri seithfed = 0,5186A3, pedwar '
            'seithfed = 0,6A3518, pump seithfed = 0,86A351, chwe seithfed = '
            '0,A35186. Yr un chwe digid yn yr un drefn sydd ym mhob un — dim '
            'ond bod y dilyniant yn dechrau mewn lle gwahanol. Gellir eu dychmygu '
            'wedi eu rhestru ar gylch sy’n cael ei droi ychydig ymhellach gyda '
            'phob ffracsiwn.',
      ),
      ProseSection(
        'Pan fo’r lluosrifau’n cylchdroi',
        'Mae’r un tro yn llechu yn nhabl lluosi’r cyfnod ei hun. Os cymryd y '
            'dilyniant digidau 186A35 fel rhif cyfan a’i luosi yn eu trefn, nid '
            'ond cylchdroeon a geir: 186A35 × 2 = 35186A, × 3 = 5186A3, × 4 = '
            '6A3518, × 5 = 86A351, × 6 = A35186. Gelwir rhif sydd â’r priodwedd '
            'hon yn rhif cylchol.\n\n'
            'Mae’r seithfed cam yn cau’r cylch: 186A35 × 7 = BBBBBB. Un ar ddeg '
            'ym mhobman — y digid uchaf ym môn Deuddeg, chwe gwaith yn olynol. '
            'Nid damwain yw hyn: mae BBBBBB union un yn llai na’r safle crwn '
            'nesaf. Ym môn Deg adwaenir yr un gamp gyda’r rhif enwog 142857 '
            '(cyfnod seithfed yn y system ddegol): yno hefyd mae’r lluosrifau’n '
            'rhoi cylchdroeon, a 142857 × 7 = 999999. Mae’r digidau’n wahanol, '
            'ond mae’r strwythur yr un fath.',
      ),
      ProseSection(
        'Pam union chwe digid',
        'Mae rheswm eglur pam y mae’r cyfnod yn union chwe digid o hyd — ac nid '
            'yn llai. Wrth rannu ysgrifenedig, mae gweddill yn aros ar ôl pob cam, '
            'a’r cyfnod yn terfynu cyn gynted ag y mae gweddill yn ailadrodd. Gyda '
            'seithfed, mae’r chwe gweddill posibl 1 i 6 i gyd yn ymddangos yn eu '
            'tro cyn i’r cyntaf ailadrodd. Ni all fod mwy na chwe gweddill gwahanol '
            'gyda’r Saith, felly chwe yw’r hyd mwyaf posibl.\n\n'
            'Gelwir rhif cysefin y mae cyfnod ei gilydd yn cyrraedd yr hyd mwyaf '
            'posibl hwn yn rif cyfnod llawn. Dim ond ganddo ef y mae’r lluosrifau’n '
            'mynd trwy bob cylchdro, a dim ond yna y ffurfir rhif cylchol. Mae a yw '
            'rhif cysefin yn llawn yn dibynnu ar sut y mae pwerau’r bôn — Deuddeg '
            'yma — yn ymddwyn wrth eu rhannu â’r rhif cysefin.',
      ),
      ProseSection(
        'Y cyflenwad at y digid uchaf',
        'Mae ail batrwm yn y cyfnod 186A35 hefyd. Os ei rannu yn ei hanner a '
            'chael swm y ddwy hanner, ceir 186 + A35 = BBB — un ar ddeg ym '
            'mhobman eto, tair gwaith y tro hwn. Mae’r ddwy hanner yn cyflenwi’r '
            'digid uchaf yn union.\n\n'
            'Theorem gyffredinol yw hon (ar ôl Étienne Midy, 1836) ac mae’n wir '
            'ym mhob bôn: ym môn Deg mae 142 + 857 = 999. Mae’r effaith yn dangos '
            'nad yw ail hanner y cyfnod yn ddeunydd newydd, ond adlewyrchiad o’r '
            'hanner cyntaf.',
      ),
      ProseSection(
        'Nid pob rhif cysefin sy’n cymryd rhan',
        'Mae’r cylchdro prydferth yn eithriad, nid y norm. Nid yw unfed rhan ar '
            'ddeg ym môn Deuddeg ond â’r cyfnod 0,1 — un Uned yn ailadrodd yn unig, '
            'am fod Deuddeg un yn fwy nag Un ar ddeg (cyfatebol i nawfed = 0,1 yn '
            'y system ddegol). Mae drydedd rhan ar ddeg yn rhoi 0,0B gyda’r cyfnod '
            'byr 0B. Nid yw rhifau cysefin o’r fath yn cynhyrchu rhif cylchol.\n\n'
            'Ymhlith y rhifau cysefin bach, mae 5, 7, 17, 31, 41 a 43 (wedi eu '
            'cyfrif yn ddegol) yn rhifau cyfnod llawn ym môn Deuddeg — yn '
            'nodedig, pob un â’r digid olaf 5 neu 7 ym môn Deuddeg. Mae hynny’n '
            'amod angenrheidiol, ond nid yn ddigonol: mae Un ar bymtheg hefyd yn '
            'terfynu ar 7, ond dim ond cyfnod chwe-digid sydd ganddo. Mae newid '
            'y bôn hefyd yn effeithio: mae Pump yn llawn ym môn Deuddeg (pumed = '
            '0,2497, cyfnod 2497), ond ym môn Deg mae pumed yn dod allan yn lân. '
            'Mae pa rifau cysefin sy’n cymryd rhan felly’n perthyn i’r pâr o fôn '
            'a rhif cysefin, nid i’r rhif cysefin ar ei ben ei hun.',
      ),
      ProseSection(
        'Faint sydd — cwestiwn agored',
        'Gallai rhywun feddwl bod priodwedd mor eglur eisoes wedi ei chyfrif i '
            'gyd. Nid felly y mae. Ni phrofwyd hyd heddiw faint o rifau cyfnod '
            'llawn sydd ym môn Deuddeg — na ph’un a oes ddiddiwedd ohonynt ai '
            'peidio.\n\n'
            'Mae dyfaliad gan Emil Artin o 1927 yn rhagfynegi y dylai tua '
            'saith ar hugain o bob cant o rifau cysefin fod yn llawn, ym môn '
            'Deuddeg fel ym mhob bôn addas arall. Mae’r arsylwad ar rifau bach '
            'yn cyfateb i’r maint hwn. Ond dyfaliad yw’r dyfaliad: Er gwaethaf '
            'ymdrechion mawr, ni phrofwyd mohono ar gyfer unrhyw fôn unigol. '
            'Mae hynny’n rhan o’r darlun gonest — patrwm sy’n swnio’n syml, '
            'y tu ôl iddo broblem heb ei datrys hyd heddiw.',
      ),
      ProseSection(
        'Rhoi cynnig arni yn y cyfrifiannell',
        'Gellir gweld y cwbl hwn yma. Wrth deipio seithfed a Hafal, mae’r '
            'arddangosfa’n dangos 0, gyda llinell uwchben 186A35 — chwe digid y '
            'cyfnod. Gyda dau seithfed ymddengys yr un dilyniant fel 35186A, '
            'wedi ei gylchdroi; nid talgrynnu yw hynny, ond yr un patrwm union. '
            'Mae pumed yn dangos y llinell uwchben 2497, ac unfed rhan ar ddeg '
            'dim ond uwchben y digid sengl 1.\n\n'
            'Mae enghreifftiau mwy yn gwneud y cyfyngiadau’n weladwy: mae gan '
            'ffracsiwn ag enwadur Un ar ddeg ar hugain (degol) gyfnod o ddeg ar '
            'hugain digid — mae’r arddangosfa yma’n talfyrru â thri phwynt, am '
            'nad yw’r cwbl yn ffitio ar un llinell. Sut y mae’r cyfrifiannell yn '
            'pennu ffracsiynau union a’u cyfnodau, mae hynny’n cael ei esbonio '
            'yn y bennod „Sut mae’r cyfrifiannell hwn yn cyfrifo".',
      ),
    ],
    sources: [
      Source(
        'Cyclic number — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_number',
        'R2',
        'A1',
      ),
      Source(
        'Full reptend prime — Wikipedia',
        'https://en.wikipedia.org/wiki/Full_reptend_prime',
        'R2',
        'A1',
      ),
      Source(
        '142857 — Wikipedia',
        'https://en.wikipedia.org/wiki/142857',
        'R2',
        'A1',
      ),
      Source(
        'Midy’s theorem — Wikipedia',
        'https://en.wikipedia.org/wiki/Midy%27s_theorem',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative order — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_order',
        'R2',
        'A1',
      ),
      Source(
        'Artin’s conjecture on primitive roots — Wikipedia',
        'https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots',
        'R2',
        'A1',
      ),
      Source(
        'Orders of Units in Modular Arithmetic (Keith Conrad, UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
      Source(
        'OEIS A019340 — Primes with primitive root 12',
        'https://oeis.org/A019340',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Rhanadwyedd a’r prawf un-ar-ddeg',
    [
      ProseSection(
        'Mae’r digid olaf yn datgelu llawer',
        'Ym môn Deuddeg, nid yw digid olaf rhif yn ddim mwy na’i weddill wrth '
            'ei rannu â deuddeg. Felly gellir gweld ar unwaith o’r digid terfynol '
            'a yw’r rhif yn rhanadwy’n lân ag unrhyw ranydd o Ddeuddeg. Mae '
            'digidau olaf eilrif (0, 2, 4, 6, 8, A) yn golygu rhanadwy â dau. '
            'Os yw’r rhif yn terfynu ar 0, 3, 6 neu 9, mae’n rhanadwy â thri; '
            'ar 0, 4 neu 8, â phedwar; ar 0 neu 6, â chwe; ar 0 yn unig, â '
            'deuddeg. (Mae A yn sefyll am ddeg yma.)\n\n'
            'Dyma fantais gadarn Deuddeg. Yn y system ddegol nid yw’r digid olaf '
            'ond yn datgelu rhanadwyedd â dau, pump a deg — ar gyfer tri, pedwar '
            'neu chwe mae’n rhaid cyfrifo. Mae Deuddeg yn amlygu’r rhanyddion '
            'bach, cyffredin yn union.',
      ),
      ProseSection(
        'Y prawf un-ar-ddeg: mae’r swm digidau’n bwysig',
        'Nid yw’r digid olaf yn helpu ar gyfer Un ar ddeg (B), ond mae '
            'dull yr un mor syml: y swm digidau, sef swm pob digid. Mae rhif ym '
            'môn Deuddeg yn rhanadwy ag un ar ddeg yn union pan fo’i swm digidau '
            'yn rhanadwy ag un ar ddeg. Y rheswm yw hardd: mae Deuddeg yn gadael '
            'gweddill un wrth ei rannu ag un ar ddeg, a’r un modd pob safle uwch '
            '— felly dim ond yr hyn y mae’r digidau’n ei roi gyda’i gilydd '
            'sy’n cyfrif.\n\n'
            'Dyma union wrthbwynt y prawf naw cyfarwydd yn y system ddegol, '
            'lle mae’r swm digidau’n profi’r Naw. Ym môn Deuddeg mae’n profi’r '
            'Un ar ddeg — dyna darddiad yr enw prawf un-ar-ddeg. Enghraifft: '
            'Mae’r rhif 4B7 â swm digidau 4 + B + 7, sef pedwar plws un ar ddeg '
            'plws saith, sy’n bump ar hugain — ac mae pump ar hugain yn ddau '
            'waith un ar ddeg, felly mae 4B7 yn rhanadwy ag un ar ddeg. Fel y '
            'prawf naw, mae’r prawf un-ar-ddeg yn gwasanaethu fel gwiriad cyflym: '
            'os nad yw’r prawf yn gweithio, mae gwall yn y canlyniad.',
      ),
      ProseSection(
        'Y Deuddegfed ar ôl y swm eiledol',
        'Mae prawf arall yn dal y Tri ar ddeg. Yma caiff y digidau eu hadio '
            'bob yn ail yn bositif a negatif, gan ddechrau o’r dde — y swm '
            'digidau eiledol. Os yw hwn yn rhanadwy â thri ar ddeg, yna mae’r '
            'rhif ei hun hefyd. Y rheswm yw adlewyrchiad y prawf un-ar-ddeg: '
            'mae Deuddeg un yn llai na thri ar ddeg, felly mae’r safleoedd yn '
            'newid arwydd wrth eu rhannu â thri ar ddeg.\n\n'
            'Un rhwystr bach i bawb sy’n gyfarwydd â’r system ddegol: yno y '
            'gair „prawf un ar ddeg" yw’r fersiwn eiledol, am fod Un ar ddeg '
            'yno un yn fwy na Deg. Ym môn Deuddeg mae’r rolau wedi eu cyfnewid '
            '— mae’r swm syml yn perthyn i’r Un ar ddeg, a’r swm eiledol i’r '
            'Tri ar ddeg. (Mae’r Tri ar ddeg ei hun, gyda llaw, yn ysgrifennu '
            'fel 11 ym môn Deuddeg, un Deuddeg ac un Uned; ei werth a olygir '
            'bob amser.)',
      ),
      ProseSection(
        'Ble y mae Deuddeg yn cael anhawster',
        'Nid yw unrhyw fantais yn rhad ac am ddim. Nid yw’r Pump na’r Saith yn '
            'rhannu ffactor â Deuddeg, ac nid ydynt yn cyfateb i’r Un ar ddeg '
            'na’r Tri ar ddeg ychwaith — ar eu cyfer hwy nid oes rheol digid-olaf '
            'na swm-digidau hwylus ym môn Deuddeg. Y Pump yn enwedig, sydd â’r '
            'prawf hawddaf o ddigon yn y system ddegol (digid olaf sero neu bump), '
            'a ddaw yn drafferthus yma.\n\n'
            'Dyna’r cyfnewid gonest: mae Deuddeg yn rhoi inni’r profion hawdd ar '
            'gyfer tri, pedwar a chwe ac yn cymryd oddi arnom brawf hawdd y Pump. '
            'Pa ochr sy’n bwysicach yn y fantol yn dibynnu ar ba ranyddion a '
            'ddefnyddir amlaf yn y bywyd bob dydd — a’r rhai bach yw’r rheini '
            'fel arfer.',
      ),
    ],
    sources: [
      Source(
        'Divisibility rule — Wikipedia',
        'https://en.wikipedia.org/wiki/Divisibility_rule',
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
        'Casting out nines — Wikipedia',
        'https://en.wikipedia.org/wiki/Casting_out_nines',
        'R2',
        'A1',
      ),
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Triciau yn y tabl lluosi',
    [
      ProseSection(
        'Rhesi â chynffon fyr',
        'Mae gan dabl lluosi Deuddeg ddeuddeg rhes, ac mae rhai ohonynt bron '
            'yn dysgu eu hunain — sef y rhesi rhanyddion. Mae eu lluosrifau’n '
            'terfynu mewn patrymau byr sy’n ailadrodd. Mae’r rhes chwechau’n '
            'terfynu bob yn ail ar 6 ac 0 (6, 10, 16, 20, 26, 30 …). Mae’r '
            'rhes pedwarau’n rhedeg 4, 8, 0, 4, 8, 0; mae’r rhes trioedd yn '
            'rhedeg 3, 6, 9, 0 ac yna’n ail-gychwyn; mae’r rhes dauoedd bob '
            'amser yn eilrif.\n\n'
            'Mae dau dric yn arbennig o hwylus. Lluosi â Deuddeg yn syml yw '
            'ychwanegu sero: mae saith llwaith deuddeg yn 70. Ac mae’r rhes '
            'chwechau’n hanner y rhes deuddegau — mae chwe llwaith rhif eilrif '
            'yn terfynu ar 0, a chwe llwaith rhif odrif ar 6.',
      ),
      ProseSection(
        'Rhes Un ar ddeg fel drych',
        'Y rhes brydferttaf yw un Un ar ddeg (B): B, 1A, 29, 38, 47, 56, '
            '65, 74, 83, 92, A1, B0. Mae dau batrwm yn llechu ynddi. Mae’r digid '
            'blaen yn dringo gam wrth gam — 0, 1, 2, 3 ac yn y blaen — tra '
            'bo’r digid ôl yn disgyn yr un cam. Ac ym mhob canlyniad mae’r ddau '
            'ddigid gyda’i gilydd yn rhoi un ar ddeg: un a deg, dau a naw, tri '
            'ac wyth.\n\n'
            'Dyma union adlewyrchiad rhes y Naw o’r system ddegol, lle mae’r '
            'digidau’n cyflenwi naw. O hynny daw tric hwylus: yn lle lluosi ag '
            'un ar ddeg, cymryd lluoswm deuddeg a thynnu’r rhif unwaith. Felly '
            'un ar ddeg llwaith saith yw saith deg llai saith, sef 65 ym môn '
            'Deuddeg — ac yn wir mae 65 yn y tabl ar gyfer un ar ddeg llwaith '
            'saith.',
      ),
      ProseSection(
        'Y rhesi ystyfnig: Pump a Saith',
        'Nid yw pob rhes mor rwydd. Nid yw Pump na Saith yn rhannu ffactor â '
            'Deuddeg, a’u rhesi felly’n mynd trwy bob un o’r deuddeg digid '
            'terfynol posibl cyn i unrhyw beth ailadrodd — dim cylch byr i gynnal '
            'y cof. Mae rhes y pumau’n terfynu yn eu trefn ar 5, A, 3, 8, 1, '
            '6, B, 4, 9, 2, 7, 0; mae rhes y sauoedd yr un mor neidiol.\n\n'
            'Dyma bedwarawd cyfarwydd yn dychwelyd: yn union y rhesi Un, Pump, '
            'Saith ac Un ar ddeg sy’n mynd trwy bob digid terfynol yn llawn '
            '— yr un pedwar rhif sy’n creu’r cylch cyfan ar gloc yr oriau ac '
            'yn terfynu ar rifau cysefin. A dyna union pam y mae gan bumed a '
            'seithfed y cyfnodau hir a llawn hynny o’r bennod ar rifau cylchol. '
            'Yn y system ddegol rhes y Sauoedd yw’r un enwog am fod yn '
            'ystyfnig; ym môn Deuddeg Pump a Saith gyda’i gilydd sydd felly.',
      ),
      ProseSection(
        'Sgwariau a’r Gros',
        'Wrth fynd ar draws y tabl o’r gornel chwith uchaf i’r gornel dde '
            'isaf, mae’r rhifau sgwâr yno: 1, 4, 9, 14, 21, 30, 41, 54, 69, '
            '84, A1 — ac yn olaf 100. Deuddeg llwaith deuddeg yw’r olaf hwn, '
            'sef cant a phedwar a deugain, sy’n ysgrifennu fel „100" yn lân ym '
            'môn Deuddeg ac a elwir ers amser maith yn Ros. Mae Deuddeg yn '
            'ysgrifennu ei sgwâr ei hun mor grwn â’r system ddegol yn ysgrifennu '
            'Cant.\n\n'
            'Mae dyblu a haneru hefyd yn rhwydd ym môn Deuddeg, am fod deuddeg '
            'yn eilrif ac yn rhanadwy â phedwar: hanner 10 yw 6, hanner 6 yw 3, '
            'hanner 3 yw 1,6. Felly gellir torri llawer o broblemau pen yn '
            'gamau bach taclus — dyna’r gwir reswm pam y mae cyfeillion Deuddeg '
            'yn ei chael yn bleserus cyfrifo â hi.',
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
        'Multiplication table — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplication_table',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
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
    'Y cloc fel grŵp (ℤ/12ℤ)',
    [
      ProseSection(
        'Cyfrifo fel ar wyneb y cloc',
        'Ar y cloc, nid yw un ar ddeg o’r gloch plws dwy awr yn dair ar ddeg, '
            'ond yn un o’r gloch. Mae rhywun yn cyfrifo’n normal ac yna’n cymryd '
            'y gweddill wrth rannu â deuddeg. Yn weledol, mae’r llinell rifau '
            'ddiddiwedd yn cael ei dirwyn ar gylch â deuddeg marc; mae pob rhif '
            'yn glanio ar un o’r marciau 0 i 11.\n\n'
            'Mae’r deuddeg marc hyn gydag adio oriau’n ffurfio system fathemategol '
            'fechan daclus. Mae’n aros yn gaeëdig bob amser (mae pob swm yn un '
            'o’r deuddeg marc eto), mae’r sero yno fel „yn newid dim", ac i '
            'bob cam mae llwybr yn ôl: mae pump ymlaen yn cael ei wneud yn '
            'iawn gan saith yn ôl, oherwydd 5 + 7 = 12 = 0. Gelwir system '
            'gyfrifo â’r priodweddau hyn yn grŵp mewn mathemateg. Cloc yr '
            'oriau yw’r enghraifft fwyaf gweladwy o ddigon; ei enw yw ℤ/12ℤ, '
            'ynganir „Z modwlws deuddeg".',
      ),
      ProseSection(
        'Pa gamau sy’n cyrraedd pob maes',
        'Wrth fynd mewn camau o un o amgylch y cylch, cyrhaeddir pob un o’r '
            'deuddeg marc yn ei dro cyn dychwelyd i’r dechrau. Ond nid pob '
            'hyd cam sy’n llwyddo. Os neidio bob tro o dri, dim ond ar 0, 3, '
            '6, 9 y glenir, a’r dychwelyd ar ôl pedwar naid — mae wyth maes '
            'heb eu cyffwrdd. Os neidio o bedwar, ni thir ond 0, 4, 8.\n\n'
            'Cyrhaeddir pob un o’r deuddeg maes gan hyd cam yn union pan '
            'nad oes ganddo ranydd cyffredin â Deuddeg. Mae hynny’n wir am bedwar '
            'cam: 1, 5, 7 a B (= un ar ddeg). Pedwar yn union — nid damwain '
            'yw hynny, ond mesur cyfrif Deuddeg y down ar ei draws ddwywaith '
            'eto. Y pedwar hyn yw’r camau „da" sy’n creu’r cylch cyfan.',
      ),
      ProseSection(
        'Y is-grwpiau ar wyneb y cloc',
        'Mae’r camau sy’n cyffwrdd dim ond rhan o’r marciau yn lluniadu '
            'ffigurau rheolaidd ar wyneb y cloc. Mae’r cam chwech yn cysylltu 0 '
            'a 6 yn llinell ar draws y canol. Mae’r cam pedwar yn lluniadu’r '
            'triongl 0–4–8, y cam tri y sgwâr 0–3–6–9, y cam dau hecsagon '
            'yr oriau eilrif. Mae pob un o’r ffigurau hyn ei hun yn gloc '
            'bach caeëdig — yn is-grŵp.\n\n'
            'Yn nodedig: i bob rhanydd o Ddeuddeg — 1, 2, 3, 4, 6, 12 — '
            'mae union un ffigur o’r fath, dim mwy a dim llai. Mae gan '
            'Deuddeg gynifer o ranyddion ag unrhyw rif llai, dyna pam y mae '
            'ei wyneb cloc yn cario cynifer o ffigurau taclus. Dim ond ar y '
            'rhanyddion 1, 2, 5, 10 y byddai cloc deg-awr dychmygol — dim '
            'triongl, dim sgwâr. Yr un rhanadwyedd sy’n nodi Deuddeg fel '
            'sylfaen gyfrif hefyd sy’n gwneud ei wyneb cloc mor gyfoethog.',
      ),
      ProseSection(
        'Yr un cloc mewn cerddoriaeth',
        'Mae deuddeg hanner-tôn octif yn ffurfio’r un cylch: ar ôl deuddeg '
            'cam hanner-tôn, dychwelir i’r tôn gwreiddiol, octif yn uwch. Mae '
            'symud alaw i gyweirnod arall yn golygu troi pob tôn yr un cam '
            'ymhellach — adio ar y cylch tonau.\n\n'
            'Nid yw cylch y pumed, y mae cerddorion yn ei ddysgu ar eu cof, '
            'ond yn gam saith ar y cylch hwn: mae pumed perffaith yn saith '
            'hanner-tôn, a chan fod Saith yn un o’r pedwar cam da, mae’r cylch '
            'yn rhedeg trwy’r deuddeg tôn i gyd cyn cau. Mae’r bedwaredd (pum '
            'hanner-tôn) yn troi’r un cylch yn ôl. Mae camau â rhanydd cyffredin, '
            'ar y llaw arall, yn aros mewn ffigur ac yn rhoi union y cordiau '
            'cymesur cyfarwydd: mae’r drydedd fawr yn rhoi’r triongl, a’r '
            'triton y llinell. Mae’r rheswm pam yn union deuddeg hanner-tôn a '
            'sut y maent yn swnio i’w gael yn y bennod am y Deuddeg mewn '
            'cerddoriaeth; yr hyn sy’n bwysig yma yn unig yw mai’r un cylch yw.',
      ),
      ProseSection(
        'Ac yn y rhifau cysefin',
        'Mae ail leoliad yn dangos yr un grŵp o bedwar. Os ysgrifennu rhifau '
            'cysefin ym môn Deuddeg, mae pob rhif cysefin uwchlaw Tri yn '
            'terfynu ar un o’r digidau 1, 5, 7 neu B. Mae digidau terfynol '
            'eraill yn amhosibl: mae rhif sy’n terfynu ar 0, 2, 4, 6, 8 neu '
            'A yn eilrif; mae un sy’n terfynu ar 3, 6, 9 yn rhanadwy â thri. '
            'Yr hyn sy’n weddill yw union y pedwar digid nad oes ganddynt '
            'ranydd cyffredin â Deuddeg — eto 1, 5, 7, B.\n\n'
            'Yr un pedwar â’r camau da a’r cyfyngau sy’n creu’r cylch yw’r rhain. '
            'Fodd bynnag, nid yw digid terfynol o’r grŵp pedwar hwn ond yn '
            'amod angenrheidiol, nid yn brawf: mae 25 yn terfynu ym môn '
            'Deuddeg ar 1, ond pump llwaith pump yw. Mae’r digid yn diystyru '
            'llawer o rifau fel rhifau cysefin, ond nid yw’n coronni neb.',
      ),
      ProseSection(
        'Adio bob amser, rhannu ddim bob amser',
        'Ar gloc yr oriau gellir lluosi hefyd — a dyna lle y mae’r caeëdrwydd '
            'prydferth yn dod i ben. Wrth adio mae llwybr yn ôl i bob cam; wrth '
            'luosi, nac oes. Nid oes awr y gellid lluosi’r Ddau â hi i gael '
            'Uned yn lân, oherwydd mae’r dwbl bob amser yn eilrif. Nid oes gan '
            'y Ddau werth cilyddol ar gloc deuddeg.\n\n'
            'Dim ond y pedwar rhif da 1, 5, 7, B sydd â gwerth cilyddol — a '
            'phob un ohonynt yw ei gilydd ei hun: mae pump llwaith pump yn 25, '
            'sef 1 ar gloc deuddeg; yr un modd saith llwaith saith a B llwaith '
            'B. Pe bai gan y cloc nifer cysefin o oriau fel un ar ddeg neu dri '
            'ar ddeg, byddai gan bob awr werth cilyddol. Mae Deuddeg yn rhy '
            'ranadwy ar gyfer hynny — yr un cyfoeth o ranyddion sy’n addurno’i '
            'wyneb cloc sy’n ei amddifadu o’r rhaniad llyfn. Nid diffyg yw '
            'hwnnw, ond natur rhifau cyfansawdd; byddai cloc degol yr un fath.',
      ),
      ProseSection(
        'Modwlws deuddeg nid yw’n fôn deuddeg',
        'Un gwahaniaeth olaf, pwysig, y mae’n hawdd ei gymysgu. Mae’r cloc yn '
            'cyfrifo „modwlws deuddeg" — dim ond y gweddill wrth rannu â deuddeg '
            'a gedwir. Mae hynny’n wahanol i „bôn Deuddeg", y nodiant y '
            'mae’r cyfrifiannell hwn yn ei ddefnyddio, lle mae’r safleoedd yn '
            'cynrychioli Unedau, Deuddegau, Rosau ac ati. Mae modwlws yn dweud '
            'i ba ddosbarth gweddill y mae rhif yn perthyn; mae bôn yn dweud '
            'sut yr ysgrifennir ef.\n\n'
            'Mae’r ddau yn troi o amgylch y rhif deuddeg, ond o’r un rheswm '
            'dyfnach — ei lawer o ranyddion — nid am eu bod yr un peth. Mae '
            'rhywun yn cyfrifo modwlws deuddeg bob dydd ar y cloc ac eto’n '
            'ysgrifennu’r amser yn y system ddegol. Cyflwynodd Carl Friedrich '
            'Gauss y math hwn o gyfrifo gweddillion fel nodiant ei hun yn 1801; '
            'heddiw mae’n llechu’n anweledig mewn digidau gwiriad rhifau llyfrau '
            'a chyfrifon ac ym mhob fformwla diwrnod-o’r-wythnos.',
      ),
    ],
    sources: [
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A1',
      ),
      Source(
        'Cyclic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_group',
        'R2',
        'A1',
      ),
      Source(
        'Subgroups of cyclic groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Subgroups_of_cyclic_groups',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A1',
      ),
      Source(
        'Circle of fifths — Wikipedia',
        'https://en.wikipedia.org/wiki/Circle_of_fifths',
        'R2',
        'A1',
      ),
      Source(
        'Pitch class — Wikipedia',
        'https://en.wikipedia.org/wiki/Pitch_class',
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
        'Disquisitiones Arithmeticae — Wikipedia',
        'https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    '12! a’r trefniadau',
    [
      ProseSection(
        'Faint o drefniadau?',
        'Faint o ffyrdd sydd o osod dwsin o bethau mewn rhes — deuddeg gwestai '
            'wrth fwrdd, y deuddeg mis ar restr, deuddeg llyfr ar silff? Ar gyfer '
            'y lle cyntaf mae deuddeg ymgeisydd, ar gyfer yr ail un ar ddeg, yna '
            'deg, ac yn y blaen hyd at yr olaf, lle nad oes ond un ar ôl. Lluosir '
            'pob posibilrwydd â’i gilydd: 12 · 11 · 10 · … · 2 · 1.\n\n'
            'Ysgrifennir y lluoswm hwn o bob rhif o 1 i ddeuddeg yn fyr fel „12!" '
            'a’i alw’n Ffactorial Deuddeg. Yn gyffredinol, n! yw lluoswm pob '
            'rhif o 1 i n ac mae’n cyfrif trefniadau n peth. Chwilfrydedd ar yr '
            'ymyl: diffinnir 0! fel 1 — mae union un ffordd o drefnu dim byd, '
            'sef y ffordd wag.',
      ),
      ProseSection(
        'Y rhif 12!',
        'Mae 12! = 479001600 yn y system ddegol — bron hanner biliwn o '
            'drefniadau ar gyfer deuddeg peth yn unig. Ym môn Deuddeg ysgrifennir '
            'yr un rhif fel 114500000, â phum sero ar y diwedd. Mae’r seroau '
            'hyn yn hawdd eu deall o safbwynt Deuddeg: am fod 12! yn cynnwys '
            'ffactorau Dau a Thri mor aml, ac am fod pob un o’r seroau terfynol '
            'hyn yn wahanu union un Deuddeg, mae pump ohonynt yn dod allan yn '
            'lân. Yn y system ddegol nid yw 12! ond yn terfynu ar ddau sero.\n\n'
            'Mor fawr yw hanner biliwn o drefniadau? Pe dangosid un newydd bob '
            'eiliad, ni fyddai’r gwaith drosodd tan ar ôl pymtheg mlynedd. Os '
            'eistedd y dwsin wrth fwrdd crwn, lle dim ond y cymdogaeth sy’n '
            'bwysig nid y lle cychwyn, mae’r rhif yn crebachu i ffactorial un '
            'ar ddeg — tua deugain miliwn. Gellir gofyn i’r cyfrifiannell: mae’r '
            'fysell ffactorial yn rhoi 12! ar unwaith ym môn Deuddeg.',
      ),
      ProseSection(
        'Dewis gyda threfn a heb drefn',
        'Yn aml nid yw rhywun am drefnu’r deuddeg i gyd, ond dim ond dewis '
            'rhai — ac yna mae’n wahaniaeth a yw’r drefn yn cyfrif. Tri rhedwr '
            'ar y podiwm (aur, arian, efydd) allan o ddeuddeg: 12 · 11 · 10 = '
            '1320 o bosibilrwydd wedi eu trefnu. Mae’r drefn yn cyfrif yma, '
            'oherwydd nid yr un peth yw’r cyntaf a’r ail.\n\n'
            'Os dewis chwe pherson allan o ddeuddeg yn unig fel grŵp, heb '
            'raddio — er enghraifft chwe gwirfoddolwr — mae 924 o bosibilrwydd; '
            'dau allan o ddeuddeg fel pâr yw 66. Mae’r ddwy ffordd gyfrif yn '
            'seilio ar y ffactorial. Yn yr iaith bob dydd cyfysgir y ddwy’n aml: '
            'mae „clo cyfuniad" mewn gwirionedd yn gofyn am drefn benodol — '
            'dylid ei alw’n glo trefn.',
      ),
      ProseSection(
        'Clychau sy’n canu pob trefn',
        'Mewn tyrau eglwysi yn Lloegr mae hen gelfyddyd sy’n gwneud yn union '
            'hyn: canu newidiadau. Yn lle alawon, mae clochyddion yn canu eu '
            'clychau mewn trefniadau newydd o hyd, pob trefn union unwaith. Ar '
            'bob newid dim ond un safle y caniateir i bob cloch symud — ffordd '
            'gorfforol o gyfnewid elfennau cyfagos, yr oedd clochyddion yn ei '
            'meistroli erbyn tua 1621, ymhell cyn i fathemategwyr ddisgrifio’r '
            'un tric.\n\n'
            'Ar gyfer pob nifer o glychau mae enw; gelwir deuddeg cloch yn '
            'Maximus. Canu pob trefn o ddeuddeg cloch fyddai mynd trwy 12! = '
            'tua 479 miliwn o newidiadau — ar ddwy eiliad y newid, byddai hynny’n '
            'ddegawdau o ganu di-baid. Ni wnaeth neb hynny erioed a bernir ei '
            'fod yn amhosibl; mae’r darnau a ganwyd hiraf go iawn ar ddeuddeg '
            'cloch yn cyrraedd dim ond rhai degau o filoedd o newidiadau. Dim '
            'ond ar wyth cloch y canwyd cyfaint cyflawn erioed: 40320 o '
            'newidiadau, bron ddeunaw awr, ym 1963 yn Loughborough.',
      ),
      ProseSection(
        'O’r rhif i grŵp',
        'Os casglu pob un o’r 12! ailadrefniad o ddwsin a deall „y naill yn '
            'gyntaf, yna’r llall" fel rheol gyfrifo, ffurfir grŵp eto — grŵp '
            'ailadrefnu llawn y deuddeg peth. Yn wahanol i gloc yr oriau, mae’r '
            'drefn y cymrir y camau ynddi yn bwysig yma: cyfnewid ac yna '
            'llithro yn rhoi rhywbeth gwahanol i lithro ac yna cyfnewid. Mae’r '
            'grŵp hwn yn enfawr ac nid yw’n gymeradwy.\n\n'
            'Yn llechu ynddo mae rhyfeddod olaf. Ymhlith y bron hanner biliwn '
            'o ailadrefniadau mae detholiad bach, arbennig o reolaidd o union '
            '95040 sy’n symud unrhyw bum pwynt o’r deuddeg i unrhyw bum '
            'targed mewn union un ffordd. Y ffaith fod hyn yn bosibl o gwbl ar '
            'ddeuddeg pwynt yn union yw un o’r ymddangosiadau prinnaf mewn '
            'mathemateg — a theitl y bennod nesaf.',
      ),
    ],
    sources: [
      Source(
        'Factorial — Wikipedia',
        'https://en.wikipedia.org/wiki/Factorial',
        'R2',
        'A1',
      ),
      Source(
        'Permutation — Wikipedia',
        'https://en.wikipedia.org/wiki/Permutation',
        'R2',
        'A1',
      ),
      Source(
        'Combination — Wikipedia',
        'https://en.wikipedia.org/wiki/Combination',
        'R2',
        'A1',
      ),
      Source(
        'Change ringing — Wikipedia',
        'https://en.wikipedia.org/wiki/Change_ringing',
        'R2',
        'A1',
      ),
      Source(
        'Extent (change ringing) — Wikipedia',
        'https://en.wikipedia.org/wiki/Extent_(change_ringing)',
        'R2',
        'A1',
      ),
      Source(
        'Symmetric group — Wikipedia',
        'https://en.wikipedia.org/wiki/Symmetric_group',
        'R2',
        'A1',
      ),
      Source(
        'Steinhaus–Johnson–Trotter algorithm — Wikipedia',
        'https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Y Grŵp Mathieu M₁₂',
    [
      ProseSection(
        'Detholiad ymhlith bron hanner biliwn',
        'Terfynodd y bennod flaenorol â’r addewid hwn: ymhlith bron hanner '
            'biliwn o ailadrefniadau dwsin mae detholiad bach o union 95040 sy’n '
            'gallu gwneud rhywbeth bron yn anghredadwy. Dewis pum pwynt o’r '
            'deuddeg a dweud i ble y dylai pob un fynd — yna mae union un o’r '
            '95040 ailadrefniad yn gwneud hynny. Nid dau, nid dim: union un.\n\n'
            'O’r un priodwedd hon y deillia’r cyfanswm cyfan eisoes. Ar gyfer '
            'cyrchfan y pwynt cyntaf mae deuddeg dewis, ar gyfer yr ail un ar '
            'ddeg, yna deg, naw, wyth — ac mae’r gweddill yn benodol. Mae deuddeg '
            'llwaith un ar ddeg llwaith deg llwaith naw llwaith wyth yn rhoi '
            '95040. Enw’r casgliad prin hwn o ailadrefniadau yw Grŵp Mathieu M₁₂.',
      ),
      ProseSection(
        'System Steiner S(5,6,12)',
        'Beth y mae’r 95040 ailadrefniad hyn yn ei gadw’n ddigyfnewid? Ffigur '
            'cyfuniadol cain. Gellir dewis grwpiau o chwech o ddeuddeg pwynt fel '
            'hyn: mae pob dewis o bum pwynt wedi ei gynnwys mewn union un o’r '
            'grwpiau chwech. Mae union 132 grŵp o chwech, a’r trefniad hwn yw’r '
            'unig un posibl ac eithrio ail-enwi’r pwyntiau.\n\n'
            'Gelwir yr adeiledd cain hwn yn System Steiner S(5,6,12). Y Grŵp '
            'Mathieu yw union y set o ailadrefniadau sy’n mapio’r 132 grŵp-chwech '
            'i grwpiau-chwech — cymesureddau’r ffigur hwn. Mae’r ddau rif, 132 '
            'grŵp-chwech a 95040 cymesuredd, ym môn Deuddeg gyda llaw yn B0 a '
            '47000.',
      ),
      ProseSection(
        'Pam yn union ddeuddeg',
        'Yr hyn sy’n wirioneddol ryfeddol nid yw’r ffaith fod M₁₂ mor reolaidd, '
            'ond pa mor anaml y daw rheoleidd-dra o’r fath i fodolaeth o gwbl. '
            'Profodd Camille Jordan yn 1872: Os eithrio’r achosion cyffredin '
            'amlwg, mae set ailadrefniad sy’n gallu gosod pum pwynt yn rhydd '
            'mewn union un ffordd yn bosibl ar un nifer o bwyntiau yn unig — ar '
            'ddeuddeg. Mae’r peth cyfatebol ar gyfer pedwar pwynt yn bodoli fel '
            'eithriad dim ond ar un ar ddeg pwynt.\n\n'
            'Ar union un ar ddeg a deuddeg pwynt — a dim arall y tu hwnt i’r '
            'achosion cyffredin — mae’r cymesureddau rhyfeddol berffaith hyn yn '
            'bodoli. Felly mae Deuddeg yn un o ddim ond llond llaw o rifau sy’n '
            'cynnal peth o’r fath. Canlyniad mathemategol eglur yw hwn, nid '
            'cyfrineg rhifau — ond mae’n rheswm dros ryfeddu.',
      ),
      ProseSection(
        'Y cyntaf o’i bath',
        'Mae gan grwpiau meidraidd flociau adeiladu na ellir eu dadelfennu '
            'ymhellach — y grwpiau syml, atomau theori grwpiau. Mae „syml" yma’n '
            'golygu heb ei ddadelfennu, nid hawdd. Mae’r rhan fwyaf o’r atomau '
            'hyn yn perthyn i ychydig deuluoedd diderfyn; wrth eu hymyl mae '
            'union chwe grŵp ar hugain yn unigolion, y grwpiau ysbeidiol. '
            'Un ohonynt yw M₁₂.\n\n'
            'Disgrifiodd Émile Mathieu M₁₂ eisoes yn 1861 — dyma’r grŵp ysbeidiol '
            'cyntaf a ganfuwyd erioed, bron ganrif cyn y gweddill. Bu ei '
            'fodolaeth yn ddadleuol am amser hir, gyda rhai arbenigwyr yn ei '
            'amau; ni osodwyd ef ar dir diogel tan Ernst Witt yn 1938. Mae’r '
            'rhes o grwpiau ysbeidiol a ddechreuodd gyda M₁₂ yn terfynu ar '
            'y „Bwystfil" enfawr enwog, a’u rhestriad cyflawn yn un o '
            'gampweithiau cydweithredol mwyaf mathemateg erioed.',
      ),
      ProseSection(
        'I’w gyffwrdd: cardiau a gêm',
        'Mor haniaethol â’r hyn a swnio — mae ffyrdd diriaethol at ei ddeall. '
            'Yn ôl ffynonellau a adroddir, os cymysgu deuddeg cerdyn chwarae '
            'mewn dwy ffordd benodol, gyson, drosodd a throsodd, cynhyrchir yn '
            'union ailadrefniadau Grŵp Mathieu. A dyfeisiodd y mathemategydd '
            'John Conway „Blackjack mathemategol" â’r deuddeg rhif Sero i B, '
            'y mae ei strategaeth ennill yn seilio’n uniongyrchol ar y 132 '
            'grŵp-chwech.\n\n'
            'Yn onest rhaid nodi: nid oes bron unrhyw fysell yn y cyfrifiannell '
            'yn cyfateb i’r bennod hon — theori bur, hardd yw hi, nid offeryn. '
            'Ond weithiau dyna’n union yw’r atyniad: mai Deuddeg, sy’n rhoi ei '
            'rhythm i’r cyfrifiannell hwn, yw un o’r ychydig rifau lle y '
            'mae mathemateg wedi cuddio cymesuredd mor brin a pherffaith.',
      ),
    ],
    sources: [
      Source(
        'Mathieu group M12 — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group_M12',
        'R2',
        'A1',
      ),
      Source(
        'Mathieu group — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group',
        'R2',
        'A1',
      ),
      Source(
        'Steiner system — Wikipedia',
        'https://en.wikipedia.org/wiki/Steiner_system',
        'R2',
        'A1',
      ),
      Source(
        'Sporadic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Sporadic_group',
        'R2',
        'A1',
      ),
      Source(
        'Multiply transitive group — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiply_transitive_group',
        'R2',
        'A1',
      ),
      Source(
        'Classification of finite simple groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups',
        'R2',
        'A1',
      ),
      Source(
        'Émile Léonard Mathieu — Wikipedia',
        'https://en.wikipedia.org/wiki/%C3%89mile_L%C3%A9onard_Mathieu',
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
    'Teiliadu Archimedes',
    [
      ProseSection(
        'Nid yw’r deuddegoch yn llenwi’r plân ar ei ben ei hun',
        'Mae deuddegoch rheolaidd yn ffigur hardd a chrwn — ond ni all orchuddio '
            'llawr ar ei ben ei hun heb fylchau. Y rheswm yw ei ongl fewnol o '
            '150 gradd. O amgylch cornel, rhaid i’r ffigurau cyfagos gyflenwi’n '
            'union i 360 gradd, ond mae 360 wedi ei rannu â 150 yn rhoi dau '
            'goma pedwar — nid cyfanrif. Mae dau ddeuddegoch yn gadael bwlch '
            'wrth gornel, mae tri yn gorgyffwrdd.\n\n'
            'Mae angen partneriaid ar y deuddegoch felly. Os gosod y ffigurau '
            'iawn rhyngddynt, crëir patrymau di-fwlch, hynod reolaidd — '
            'teiliadu Archimedes. Felly y gelwir gorchuddo’r plân â pholygonau '
            'rheolaidd yn unig, â’r un golwg ym mhob cornel. Dim ond un ar ddeg '
            'patrwm o’r fath sy’n bodoli i gyd.',
      ),
      ProseSection(
        'Dau batrwm â deuddegoch',
        'O’r un ar ddeg patrwm hyn, mae union ddau yn cynnwys deuddegoch '
            'rheolaidd. Yn y cyntaf, mae trionglau hafalochrog bach yn llenwi’r '
            'bylchau rhwng y deuddegochau — wrth bob cornel mae triongl a dau '
            'ddeuddegoch yn cyfarfod, a’u honcglau’n rhoi 60 plws 150 plws 150, '
            'sef union 360 gradd.\n\n'
            'Yr ail yw’r un mwy cyfoethog a ddangosir yn y darlun: o amgylch '
            'pob deuddegoch mae torch o sgwariau a hecsagonau yn eu tro. Wrth '
            'bob cornel mae sgwâr, hecsagon a deuddegoch yn cyfarfod — 90 plws '
            '120 plws 150 gradd, eto union 360. Am fod y swm yn cydio, mae’r '
            'dorch yn cau heb unrhyw fwlch, a’r patrwm yn parhau i bob '
            'cyfeiriad.',
      ),
      ProseSection(
        'Pam mai dim ond Tri, Pedwar, Chwe sy’n ffitio',
        'Wrth ymyl deuddegoch dim ond tair math o gymydog sy’n ffitio: '
            'trionglau, sgwariau a hecsagonau. Nid damwain yw hynny. Mae eu '
            'honcglau mewnol yn 60, 90 a 120 gradd — a dyna union 360 wedi ei '
            'rannu â chwe, â phedwar, ac â thri. Felly union y rhanyddion tri, '
            'pedwar a chwe o Ddeuddeg sy’n ymddangos.\n\n'
            'Yr un tri rhanydd yw sy’n gwneud y ffracsiynau traean, chwarter '
            'a chweched yn dod allan yn lân ym môn Deuddeg. Mae’r teiliad '
            'prydferth a’r ffracsiwn hwylus yn tarddu o’r un gwreiddyn: '
            'rhanadwyedd cyfoethog Deuddeg. Perthynas wirioneddol yw honno, '
            'ond nid gorfodaeth — mae’r onglau’n dod o geometreg, y '
            'ffracsiynau llyfn o’r nodiant; mae’r ddau ond yn dibynnu ar '
            'yr un rhif.',
      ),
      ProseSection(
        'Kepler, mosgiau a chrisialau',
        'Johannes Kepler oedd y cyntaf i restru’r patrymau hyn yn gyflawn '
            'ym 1619, mewn gwaith ar gytgord y byd. Nid yw’r enw „Archimedes" '
            'ond yn gyfeiriad at y cyrff Archimedeaidd; ni chadwyd unrhyw '
            'ysgrifen hynafol lle y byddai Archimedes ei hun wedi trafod '
            'teiliadu.\n\n'
            'Ond ymhell cyn Kepler roedd y deuddegoch eisoes yn byw mewn '
            'celfyddyd: mae sêr deuddeg-blaenig ymhlith y cymhellion mwyaf '
            'ysblennydd mewn addurnwaith geometregol Islamaidd, wedi eu '
            'hadeiladu â chwmpawd a phren mesur o bur geometreg — yn gynnar '
            'er enghraifft yn Mosg Konya (1220). Ac yn y byd naturiol mae’r '
            'un drefn ddeuddegol yn dychwelyd mewn cwasigrisialau, y mae '
            'pennod ar wahân yn eu hadrodd. Mae’r deuddegoch, na all lenwi '
            'llawr ar ei ben ei hun, yn un o ffurfiau mwyaf ffrwythlon y plân '
            'mewn partneriaeth.',
      ),
    ],
    sources: [
      Source(
        'Euclidean tilings by convex regular polygons — Wikipedia',
        'https://en.wikipedia.org/wiki/Euclidean_tilings_by_convex_regular_polygons',
        'R2',
        'A1',
      ),
      Source(
        'Truncated hexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_hexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Truncated trihexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_trihexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Archimedean Tilings and Egyptian Fractions (John Baez)',
        'https://math.ucr.edu/home/baez/egyptian.html',
        'R3',
        'A1',
      ),
      Source(
        'Islamic geometric patterns — Wikipedia',
        'https://en.wikipedia.org/wiki/Islamic_geometric_patterns',
        'R2',
        'A1',
      ),
      Source(
        'Harmonices Mundi — Wikipedia',
        'https://en.wikipedia.org/wiki/Harmonices_Mundi',
        'R2',
        'A2',
      ),
    ],
    imageId: 'math/parkettierung',
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
