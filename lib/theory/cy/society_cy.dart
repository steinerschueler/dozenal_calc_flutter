part of '../society_theory.dart';

//  Rhyddiaith Gymraeg ar gyfer penodau 'Y Gymdeithas Ddwsinol'. Rhan o
//  ../society_theory.dart. Brawddegau syml (haws i'w cyfieithu). Ffeithiau a
//  safbwyntiau a briodolir; gonest am briodoliadau ansicr (rhaeadrau dyfynnu),
//  heb ddyfarniadau gan adroddwr. Wedi'i ddistyllu o docs/research/society_*.md.

List<ProseChapter> _societyChaptersCy() => const [
  ProseChapter('Mudiad dros y Deuddeg', [
    ProseSection(
      'Meddylwyr unigol',
      'Mae\'r syniad o rifo yn Neuddeg yn hytrach na Deg yn hen. Ond am amser '
          'hir, dim ond eiriolwyr unigol oedd yna, nid mudiad. Mor gynnar â\'r '
          '18fed ganrif, cyfeirir at y naturiaethwr Buffon — er bod y ffynhonnell '
          'union ar gyfer hynny\'n ansicr ac yn crwydro o un llyfr cyfeirio i\'r '
          'llall.\n\n'
          'Daw\'n fwy diriaethol yn y 19eg ganrif. Bu i ddyfeisiwr llaw-fer '
          'Isaac Pitman hyrwyddo\'r Deuddeg o 1857 ymlaen a chynnig ei arwyddion '
          'ei hun ar gyfer Deg ac Un ar ddeg. Bu i\'r athronydd Herbert Spencer '
          'sefyll drosto yn 1896, yn benodol yn erbyn y system fetrig.',
    ),
    ProseSection(
      'Andrews a „New Numbers"',
      'Americanwr a wnaeth fater ohono: Frank Emerson Andrews. Yn 1934 '
          'ymddangosodd ei draethawd „An Excursion in Numbers" yn yr Atlantic '
          'Monthly — cylchgrawn nad oedd, yn ôl ei air ei hun, erioed wedi argraffu '
          'mathemateg o\'r blaen ac a roddodd nodyn rhybudd ynghanol y testun ar '
          'gyfer darllenwyr swil o fathemateg.\n\n'
          'Yn 1935 dilynodd ei lyfr „New Numbers", y cyntaf o\'i fath yn yr '
          'Unol Daleithiau. Roedd ei ddadl yn syml: mae Deuddeg yn rhanadwy â 2, '
          '3, 4 a 6, Deg yn unig â 2 a 5. Roedd Andrews yn sobr ynghylch hyn — '
          'roedd o\'n credu bod newid go iawn yn annhebygol yn erbyn „grym '
          'gwydn arferiad".',
    ),
    ProseSection(
      'Y cymdeithasau\'n ymffurfio',
      'O\'r llythyrau a ddaeth mewn ymateb i erthygl Andrews tyfodd cylch '
          'gohebu, ac o hynny yn 1944 y „Duodecimal Society of America". '
          'Ralph „Whiskers" Beard a roddodd yr enw iddi\'n gellweirus; George '
          'Terry a roddodd y cyfalaf cychwynnol. Yn ddiweddarach fe\'i hailenwyd '
          'yn „Dozenal Society of America" — am fod y „decimal" degol wedi\'i '
          'guddio yn y gair „duodecimal".\n\n'
          'Yn 1959 ymunodd y chwaer Brydeinig, y Dozenal Society of Great '
          'Britain, gyda\'r mathemategydd A. C. Aitken yn aelod amlwg. Mae\'r '
          'gymdeithas Americanaidd yn parhau hyd heddiw i gyhoeddi\'r '
          '„Duodecimal Bulletin"; ymhlith ei haelodau anrhydeddus yr oedd yr '
          'awdur ffuglen wyddonol Isaac Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('Rhifau newydd ar gyfer Deg ac Un ar ddeg', [
    ProseSection(
      'Problem y symbolau',
      'Mae unrhyw un sy\'n rhifo yn Neuddeg angen dwy ffigur ychwanegol — un '
          'ar gyfer Deg ac un ar gyfer Un ar ddeg. Pa rai ddylen nhw fod, nid '
          'yw hynny wedi\'i setlo\'n unffurf hyd heddiw; nid yw hyd yn oed y '
          'gymdeithas Americanaidd yn rhagnodi nodiant sefydlog.\n\n'
          'Mae sawl amrywiad: dau a thri Pitman wedi\'u troi (↊ a ↋), X italig '
          'ac E crwn Andrews, secstil a chroes ddwbl (wedi\'u hysbrydoli gan '
          'fotymau ffôn), glyffau\'r cynllunydd llythrennau Dwiggins — a\'r '
          'llythrennau A a B yn syml o fyd y cyfrifiaduron.',
    ),
    ProseSection(
      'Pitman, Unicode a\'r newid yn 2026',
      'Newidiodd y gymdeithas Americanaidd ei harwyddion sawl gwaith: secstil '
          'a chroes ddwbl hyd at tua 2008, yna glyffau Dwiggins, ac ers 2015 '
          'ffigurau Pitman. Yn 2015 mabwysiadodd safon Unicode hefyd arwyddion '
          'Pitman yn swyddogol.\n\n'
          'Ar ddechrau 2026 trodd y gymdeithas ei thudalennau gwe at y '
          'llythrennau A a B — nid am ei bod yn rhoi\'r gorau i Pitman, ond am '
          'nad yw\'r nodau arbennig eto\'n cael eu harddangos yn ddibynadwy ar '
          'lawer o boryddion a ffonau. Yn y bwletin printiedig mae ffigurau '
          'Pitman yn parhau\'n safon. (Mae\'r ap hwn yn dangos ar y sgrin naill '
          'ai glyffau ei hun neu 0–9 / A, B.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'Y darn enwocaf o ddwsinoldeb ym mhoblddiwylliant yw cân: „Little '
          'Twelvetoes" o\'r gyfres addysg Americanaidd Schoolhouse Rock, a '
          'ysgrifennwyd ac a ganwyd gan Bob Dorough, a ddarlledwyd am y tro '
          'cyntaf yn 1973.\n\n'
          'Ynddi mae estron cyfeillgar â deuddeg bys troed yn dangos sut y '
          'byddai rhywun â deuddeg „bys" wedi dyfeisio dwy ffigur newydd — a '
          'ynganir „dek" am Deg a „el" am Un ar ddeg. Fe\'i hystyriwyd yn rhy '
          'anodd i blant ysgol gynradd a chafodd ei darlledu\'n llai aml na\'r '
          'penodau eraill, ond arhosodd yng nghof llawer.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, Gro, Mo — siarad yn ddwsinol', [
    ProseSection(
      'Dwsin, gros a gros mawr',
      'Daw\'r Deuddeg yn „10" yn sail Deuddeg. Ar gyfer ei lleoedd mae geiriau '
          'bob-dydd wedi bodoli ers tro: deuddeg darn yw dwsin, deuddeg dwsin '
          '(144) yw gros, deuddeg gros (1728) yw gros mawr.\n\n'
          'Mae hynny\'n nodedig: mewn gwirionedd mae\'r geiriau masnach '
          'cyfarwydd hyn eisoes yn werthoedd lle dwsinol — dwsin yw\'r „10", '
          'gros yw\'r „100", a gros mawr yw\'r „1000" ym myd y Deuddeg.',
    ),
    ProseSection(
      'Dek, el a\'r enwi systematig',
      'Yngenir y ddwy ffigur newydd fel arfer yn „dek" (Deg) a „el" (Un ar '
          'ddeg). Ar gyfer y lleoedd defnyddir do, gro, mo yn fyr (o dozen, '
          'gross, great gross).\n\n'
          'Ochr yn ochr â hynny mae enwi systematig, a ddatblygwyd yn y '
          'gymuned ar-lein: gwreiddiau gair sefydlog ar gyfer y ffigurau (un, '
          'bi, tri … dec, lev) ynghyd â therfyniadau ar gyfer pwerau\'r '
          'Deuddeg — „-qua" tuag i fyny, „-cia" tuag i lawr. Yn brydferth yn '
          'hyn: mae „uncia" yn union yn ddeuddegfed — yr un gair Lladin yr '
          'aeth „modfedd" (inch) a „owns" (ounce) ohono.',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, cymdeithasau ac offer heddiw', [
    ProseSection(
      'TGM — system fesur ddwsinol',
      'Cynlluniodd Tom Pendlebury o\'r gymdeithas Brydeinig system fesur '
          'ddwsinol gyflawn: TGM, a enwyd ar ôl ei thair uned sylfaenol Tim, '
          'Grafut a Maz.\n\n'
          'Yn wahanol i\'r system fetrig, nid yw\'n dechrau gyda hyd, ond gyda '
          'amser, ac mae\'n deillio popeth o ddisgyrchiant y Ddaear. Mae\'r '
          '„Grafut" (troedfedd ddisgyrchiant) ychydig o dan droedfedd. O hynny '
          'mae unedau ar gyfer arwynebedd, cyfaint, cyflymder a grym yn dilyn '
          'yn gydlynol — gwrthbwynt cyflawn i\'r system fetrig, yn gyfan gwbl '
          'yn Neuddeg.',
    ),
    ProseSection(
      'Y cymdeithasau heddiw',
      'Mae\'r ddwy gymdeithas yn parhau i fodoli, ond maen nhw\'n fach ac yn '
          'wirfoddol; nid oes ffigurau aelodaeth dibynadwy. Mae\'r un '
          'Americanaidd yn dal i gyhoeddi\'r Duodecimal Bulletin ac yn darparu '
          'offer dysgu a throsi, tra bod yr un Brydeinig yn meithrin yn bennaf '
          'y deunydd TGM.\n\n'
          'Y lle bywiocaf yw\'r fforwm ar-lein „Dozensonline". Yno y '
          'datblygodd yr enwi systematig ar rifau a\'r ddadl na ddaeth byth i '
          'ben yn llwyr am y ffigurau cywir. Mae\'r gymuned yn fach, ond yn '
          'weithgar.',
    ),
    ProseSection(
      'Cyfrifianellau, apiau — a\'r ap hwn',
      'O amgylch y Deuddeg mae golygfa offer rhyfeddol o fywiog wedi codi: '
          'cyfrifianellau dwsinol, trosyddion mesur, hyd yn oed cloc dwsinol a '
          'chalendr, llawer ohono\'n ffynhonnell agored ac wedi\'i adeiladu gan '
          'aelodau\'r cymdeithasau.\n\n'
          'Mae\'r ap hwn yn ffitio\'n union yno — cyfrifiannell sy\'n rhifo '
          'yn sail Deuddeg, nid yn sail Deg, gyda\'i glyffau ei hun, ffracsiynau union '
          'a rhan unedau. Mae\'n gyfraniad bach i draddodiad cilfachol hir a '
          'chariadus.',
    ),
    ProseSection(
      'Pam mae\'r byd yn aros yn ddegol er hynny',
      'Nid oherwydd mathemateg y mae\'r Deuddeg yn methu â chael ei dderbyn — '
          'mae honno ar ei ochr. Arferiad sydd ar fai: mae\'r system ddegol '
          'wedi\'i gwreiddio mewn iaith, ysgol, cyfraith a thechnoleg, a byddai '
          'newid yn aruthrol o gostus. Methodd hyd yn oed newid llawer llai\'r '
          'Unol Daleithiau i\'r system fetrig oherwydd hynny.\n\n'
          'Yn unol â hynny, mae\'r rhan fwyaf o\'r rhai sy\'n ymwneud â\'r mater '
          'heddiw\'n ei ddeall yn fwy fel arbrawf meddwl deniadol nag fel cynllun '
          'newid o ddifrif. Mae\'n dangos nad yw dewis sail y rhifau yn '
          'rhywbeth amlwg — ac mae\'n miniogi\'r golwg ar y rhifau yr ydym yn '
          'ymdrin â nhw bob dydd.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — cyfrifiannell ddwsinol', [
    ProseSection('Ap ar gyfer y bôn deuddeg', 'Cyfrifiannell ar gyfer yr iPhone yw Dozecal, un sy\'n cyfrifo\'n frodorol yn y bôn deuddeg. Cafodd ei gyhoeddi yn 2020 gan y datblygwr annibynnol Johan Kovacs; mae\'r ap am ddim. Ei nod datganedig yw hyrwyddo\'r defnydd o\'r bôn deuddeg mewn mathemateg a gwyddoniaeth.\n\nGellir cyfrifo naill ai yn y modd deuddegol neu yn y modd degol. Wrth newid rhwng y ddau, caiff y gwerth a ddangosir ei drosi\'n awtomatig. Mae\'r ffwythiannau trigonometrig yn gweithio gyda graddau fel uned fesur.'),
    ProseSection('Nodiant Pwylaidd Gwrthdro', 'Un o nodweddion arbennig Dozecal yw\'r mewnbwn mewn nodiant Pwylaidd gwrthdro (RPN). Yn lle „3 + 4 =", rydych yn teipio „3 4 +" yno — y ddau rif yn gyntaf, ac yna\'r gweithrediad rhifyddol. Mae hyn yn ymddangos yn anghyfarwydd i ddechrau, ond mae\'n gwneud heb gromfachau o gwbl ac roedd yn gyffredin am amser hir ar lawer o gyfrifianellau gwyddonol (gan Hewlett-Packard, er enghraifft).'),
    ProseSection('Rhan o dirwedd offer dwsinol', 'Nid gan gymdeithas y crëwyd Dozecal, ond gan unigolyn; yn ei ddisgrifiad, mae\'n cyfeirio at y Dozenal Society of America am ragor o wybodaeth am y bôn deuddeg. Felly mae\'n perthyn i\'r dirwedd fechan ond bywiog o offer dwsinol — ochr yn ochr â\'r ap hwn, deunyddiau TGM a chyfrifianellau eraill.'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Dozenal Calculator Paul Rapoport', [
    ProseSection('Cyfrifiannell yn y porwr', 'Cyfrifiannell wyddonol yw\'r Dozenal Calculator gan Paul Rapoport sy\'n rhedeg yn uniongyrchol yn y porwr gwe — yn rhad ac am ddim a heb angen ei osod. Mae\'n cyfrifo yn sail deuddeg, a gall ddangos yn ddegol unrhyw bryd hefyd; gellir newid sail y rhifau yn rhydd, ac mae sawl cofrestrydd annibynnol ar gael. Daw canllaw manwl gyda hi ar ffurf PDF.'),
    ProseSection('Cryf ym maes damcaniaeth rhifau', 'Mae\'n arbennig o gyfoethog ym maes damcaniaeth rhifau — sy\'n gweddu\'n dda i sail a werthfawrogir yn arbennig am ei rhanadwyedd. Mae\'r gyfrifiannell yn canfod y rhannydd cyffredin mwyaf a\'r lluosrif cyffredin lleiaf, yn rhestru holl ffactorau rhif ac yn ei dadelfennu\'n ffactorau cysefin (gyda lluosedd, os dymunir). At hynny daw swm y ffactorau, nifer y ffactorau a swyddogaeth φ Euler — sef nifer y rhifau llai sy\'n gydgysefin â hi.'),
    ProseSection('Y blwch offer gwyddonol llawn', 'Y tu hwnt i hynny mae\'r blwch offer yn gyflawn: sgwâr ac ail isradd, pwerau ac isradd unrhyw radd, y swyddogaeth esbonyddol a logarithmau — y logarithm naturiol yn ogystal â\'r seiliau dau a deg a logarithm i unrhyw sail. Ychwaneger at hynny y swyddogaethau trigonometrig (onglau) a hyperbolig gyda\'u gwrthdroadau, cyfuniadeg (cyfuniadau a thrynewidiadau, hefyd gydag ailadrodd), ystadegaeth syml (cymedr a gwyriad safonol), y ffactorial, swyddogaeth canran, swyddogaeth Gamma a\'r uned ddychmygol i.'),
    ProseSection('Llawer iawn o feintiau', 'Y tu hwnt i\'r cyfrifo pur, mae\'r rhaglen yn cwmpasu dwsinau o feintiau ffisegol ac yn eu trosi rhwng ei gilydd: amser ac amser y dydd, amledd, buanedd, hyd, arwynebedd, cyfaint sych a hylif, màs, grym, gwasgedd, egni, pŵer, tymheredd ac ongl. Mae unedau amser deuddegol yn eu plith hefyd.'),
    ProseSection('Hyd at beirianneg drydanol', 'Yn anarferol i gyfrifiannell ddeuddegol yw pa mor bell y mae\'n ymestyn i ffiseg gymhwysol: mae ganddi feysydd maint penodol ar gyfer rhwystriant trydanol, maint trydanol (gwefr), potensial trydanol (foltedd) a cherrynt trydanol. Â hynny gellir cyfrifo peirianneg drydanol hefyd yn sail deuddeg.'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
