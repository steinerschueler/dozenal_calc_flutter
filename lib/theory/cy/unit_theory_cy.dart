// Rhyddiaith theori unedau yn Gymraeg. part of ../unit_theory.dart.
// Cedwir y cyrff mewn brawddegau syml, byr (haws i\'w cyfieithu). Wedi\'i grynhoi
// o ddogfennau ymchwil docs/research/. Mae `count` yn ymdrin ag unedau cyfrif
// (dwsin/gros/gros mawr/dwsin y pobydd); mae\'n ategu Theori → Hanfodion.

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroCy() {
  return const [
    UnitTheorySection(
      'Beth all y cyfrifydd ei wneud',
      'Mae\'r cyfrifydd unedau yn trosi rhwng y byd imperial-deuddegol '
          '(sylfaen deuddeg) a\'r byd metrig (sylfaen deg) — ar draws pob '
          'categori: hyd, arwynebedd, cyfaint, pwysau, amser, ongl, '
          'arian cyfred, tymheredd, a rhagor fel pwysedd, grym, egni, '
          'pŵer, coginio a throrym.\n\n'
          'Mae\'r braced { } bob amser yn dangos y gwerth yn y system arall. '
          'Gellir cyfuno sawl uned yn un gwerth — er enghraifft '
          '1 ft 6 in neu 2 h 30 min. Mae pwyso = yn cylchu drwy\'r '
          'cynrychioliadau uned a\'r dadansoddiad graddedig; mae pwyso\'n hir '
          'ar uned yn dangos diffiniad byr. Mae\'r digidau\'n ymddangos fel '
          'glifiau deuddegol neu fel 0–9/A/B cyffredin, yn dibynnu ar '
          'y gosodiad arddangos.',
    ),
    UnitTheorySection(
      'Beth na all ei wneud',
      'Cyfnewidydd yw hwn, nid cyfrifydd gwyddonol: dim ffwythiannau fel '
          'sin neu logarithm, dim rhifyddeg rydd â × a ÷, dim cof a dim '
          'modd ongl. Dyna bwrpas y prif gyfrifydd.\n\n'
          'Mae\'r adran arian cyfred (ceiniogau/swllt/punt) yn adlewyrchu\'r '
          'gymhareb Brydeinig hanesyddol — deuddeg ceiniog i\'r swllt, ugain '
          'swllt i\'r bunt — nid cyfraddau cyfnewid cyfredol. Mae\'n dangos '
          'strwythur deuddegol yr hen arian, nid gwerthoedd ariannol heddiw. '
          'Mae\'r set o unedau wedi\'i phennu ymlaen llaw.',
    ),
    UnitTheorySection(
      'Sut i\'w ddefnyddio',
      'Tapiwch gategori (hyd, dyweder) — mae ei ysgol o unedau yn agor yn '
          'y golofn gyferbyn. Tapiwch uned, teipiwch ddigidau, a chyfunwch '
          'sawl uned yn un gwerth. Mae\'r botwm DOZ/DEZ yn newid rhwng y byd '
          'imperial a\'r byd metrig; mae\'r braced { } yn dangos y cyfwerth. '
          'Mae = yn cylchu\'r cynrychioliadau, mae pwyso\'n hir ar uned yn '
          'dangos ei hystyr, ac mae tapio ar y llinell fewnbwn yn symud '
          'y cyrchwr.\n\n'
          'Enghraifft — rhowch 1 ft 6 in a darllenwch y gwerth yn y byd arall:',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryCy(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Pentyrru mewn deuddegau',
          'Gellir bwndelu cyfrifon mewn degau — neu mewn deuddegau. Mae dwsin '
              'yn ddeuddeg o eitemau, gros yn ddeuddeg dwsin (144), a gros mawr '
              'yn ddeuddeg gros (1728). Dyma\'r un ysgol â rhai, degau, cannoedd '
              'a miloedd, ond ym môn deuddeg: dwsin = 12¹, gros = 12², gros '
              'mawr = 12³. Wedi\'u hysgrifennu ym môn deuddeg maent yn dod allan '
              'yn lân fel 10, 100 a 1000 — felly\'r gros mawr yw\'r „mil '
              'ddeuddegol".\n\n'
              'Mae\'r rheswm pam y mae deuddeg yn rhannu mor gyfleus, a sut y '
              'cyfrifir at ddeuddeg ar dair cymal y pedwar bys, wedi\'i drafod yn '
              'Damcaniaeth → Hanfodion. Yma edrychwn ar yr unedau cyfrif eu '
              'hunain.',
        ),
        UnitTheorySection(
          'O ble daeth yr enwau',
          'Daw „dwsin" drwy\'r hen Ffrangeg douzaine o\'r Lladin duodecim, '
              '„dau a deg"; mae\'r gair yn golygu union ddeuddeg, nid tua '
              'deuddeg. Mae\'r Sbaeneg docena, yr Eidaleg dozzina a\'r Saesneg '
              'dozen oll yn perthyn.\n\n'
              'Daw „gros" o\'r grosse douzaine, y „dwsin mawr", ac fe\'i '
              'tystiolir o ddechrau\'r 15fed ganrif. Yn y fasnach gyfanwerthu, '
              'cyfrid a phaciwyd nwyddau mân — pensiliau, botymau, nodwyddau — '
              'fesul gros; mae rhai bocsys pensiliau hyd heddiw yn darllen '
              '„1 gros". Y gros mawr (1728) yw\'r dwsin o rosiau — ac, fel y '
              'digwydd, hefyd nifer y modfeddi ciwbig mewn troedfedd giwbig '
              '(12 × 12 × 12). Mae wyau\'n dal i\'w gwerthu fesul dwsin heddiw.',
        ),
        UnitTheorySection(
          'Dwsin y pobydd',
          'Mae dwsin y pobydd yn dri ar ddeg — un yn ychwaneg at ddwsin '
              'cyffredin; gelwir y dorth ychwanegol yn „vantage loaf". Mae\'r '
              'esboniad cyffredin yn cyfeirio at gyfraith bara canoloesol '
              'Lloegr (yr Assize of Bread, 13eg ganrif): roedd gwerthu bara '
              'rhy ysgafn yn peryglu cosbau, felly ychwanegai\'r pobydd un '
              'dorth yn ychwaneg i fod ar yr ochr ddiogel.\n\n'
              'Perthyn amheuaeth onest i hyn: mae\'r tarddiad hwn yn gredadwy '
              'ac yn cael ei ailadrodd yn helaeth, ond nid yw\'n hysbys mewn '
              'cofnodion. Nid yw\'r dystiolaeth ysgrifenedig gynharaf am y '
              'Saesneg „baker’s dozen" ond o ddiwedd y 16eg ganrif — ymhell '
              'ar ôl y gyfraith.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Mesurau o\'r corff',
          'Mae\'r mesurau hyd hynaf yn dod o gorff y dyn. Daeth lled bys yn '
              'fodfedd, yr elin yn gufydd, y droed yn droedfedd, a lled y '
              'breichiau yn wryd. Roedd hynny\'n ymarferol, oherwydd roedd '
              'pawb yn cario ei fesur ei hun gydag ef. Ond roedd yn ansicr, '
              'oherwydd nid yw unrhyw gorff yr un fath ag un arall.\n\n'
              'Cododd y safonau sefydlog cyntaf ym Mesopotamia a\'r Aifft. Yn '
              'yr Aifft yr oedd cufydd y brenin, tua 52 centimetr. Braich '
              'isaf y Pharo ydoedd, ac fe\'i cadwyd mewn carreg fel mesur '
              'gwreiddiol. Roedd cufyddau gwaith o bren yn cael eu cymharu ag '
              'ef yn rheolaidd — dyna ddechrau\'r safoni.',
        ),
        UnitTheorySection(
          'O Rufain hyd at yr Oesoedd Canol',
          'Trefnodd y Rhufeiniaid y system. Roedd gan eu troedfedd (pes) '
              'ddeuddeg „uncia". O uncia y daeth y gair „inch" yn Saesneg — a '
              '„owns" hefyd. Enw eu milltir oedd „mille passus", mil o gamau '
              'dwbl, tua 1480 metr. Hi yw gwreiddyn pob milltir ddiweddarach.\n\n'
              'Yn yr Oesoedd Canol roedd gan bron bob tref ei mesurau ei hun. '
              'Diffinnir modfedd fel tri gronyn haidd wedi\'u gosod yn rhes. Ar '
              'gyfer y droedfedd roedd dulliau rhyfedd: ym 1535 disgrifiodd '
              'Jacob Köbel sut y dylid ar y Sul osod un ar bymtheg o ddynion '
              'o\'r eglwys droed wrth droed — a bod un rhan o un ar bymtheg o '
              'hynny yn „droedfedd gywir". Felly cyfartalwyd y gwahaniaethau. '
              'Yn yr Almaen, serch hynny, amrywiai\'r droedfedd o 235 hyd '
              '408 milimetr.',
        ),
        UnitTheorySection(
          'Mesurau ledled y byd',
          'Mae\'r un patrwm i\'w gael ym mhob man. Yn Tsieina mesurid mewn chi '
              '(troedfedd) a cun (modfedd), yn India mewn hasta (cufydd) ac '
              'angula (bys), ac yn y byd Islamaidd mewn cufyddau amrywiol. '
              'Ceir y cufydd o\'r penelin hyd flaen y bys ar bron pob '
              'cyfandir — y corff yw\'r tarddiad cyffredin.\n\n'
              'Mewn llawer o ddiwylliannau ystyrid y corff yn fesur sanctaidd, '
              'a\'r dyn yn ddelw o drefn y byd. Mesurwyd temlau\'r Aifft, '
              'adeiladwaith arch y Beibl, a themlau Hindŵaidd mewn cufyddau.\n\n'
              'Cadwodd yr iaith y mesurau hefyd. Roedd „Rho fodfedd iddynt, ac '
              'fe gymerant filltir" yn golygu yn wreiddiol „… ac fe gymerant '
              'gufydd". Mae „naid cath" yn bellter byr. Daeth galwad y '
              'morwyr wrth fesur dyfnder, „mark twain" (dau wryd o ddyfnder), '
              'yn enw celfyddydol i Mark Twain.',
        ),
        UnitTheorySection(
          'Pam deuddeg — ac amheuaeth onest',
          'Pam fod gan y droedfedd ddeuddeg modfedd, o bopeth? Oherwydd y '
              'rhanadwyedd. Gellir haneru, traean, chwarteru a chwecheru '
              'deuddeg yn lân. Dim ond haneru a phumed y gellir deg. Mae '
              'traean troedfedd yn union bedair modfedd; yn ddegol byddai\'n '
              '0.333… metr. I grefftwaith a masnach, ymhell cyn y pwynt degol, '
              'roedd hynny\'n fantais wirioneddol. Dewisodd y Rhufeiniaid eisoes '
              'y deuddeg am yr union reswm hwn.\n\n'
              'Perthyn amheuaeth onest i hyn: nid yw\'r system imperial yn '
              'system ddeuddeg drwyddi draw. Dim ond troedfedd a modfedd — a\'r '
              'deuddeg owns troy ar fetel gwerthfawr — sy\'n wirioneddol '
              'ddeuddegol. Mae gan y llath dair troedfedd, a chan y filltir '
              '1760 llath: rhifau cam. Ac yn y bywyd bob dydd rhennir modfeddi '
              'yn hanner, chwarter ac wythfed, hynny yw yn ôl bôn dau. Felly '
              'nid yw\'r deuddeg ond mewn ambell fan, nid yn y system gyfan.',
        ),
        UnitTheorySection(
          'Ar waith heddiw',
          'Heddiw, yr Unol Daleithiau a Phrydain Fawr yn bennaf sy\'n defnyddio '
              'y mesurau hyn yn y bywyd bob dydd. Ond ar draws y byd maent yn '
              'dal mewn awyrennaeth a morwriaeth: mae awyrennau\'n mesur eu '
              'huchder mewn troedfeddi, eu cyflymder mewn clymau, a\'u pellter '
              'mewn milltiroedd môr. Mae milltir fôr yn funud arc ar bêl y ddaear '
              '— mae\'n dilyn rhaniad y trigain, nid y deuddeg. Mae sgriniau, '
              'teiars a phibellau mewn modfeddi bron ym mhob man. Yn Sgandinafia '
              'mae\'r „mil" yn ddeg cilometr. Mewn gwledydd metrig nid yw\'r hen '
              'fesurau\'n byw ond mewn dywediadau.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'Mae rhai esboniadau\'n ddeniadol, ond yn ansicr. Dywed un fod y '
              'deuddeg yn tarddu o gyfri\'r esgyrn bysedd â\'r bawd — yn '
              'gredadwy, ond heb ei brofi. Mae damcaniaethau eraill fel y '
              '„fodfedd byramid" neu\'r „llath fegalithig" yn honni gwybodaeth '
              'gudd uchel mewn hen adeiladau. Ystyrir hwy\'n anghywir gan yr '
              'arbenigwyr: dewisir o\'u plith fesurau lawer dim ond y rhai sy\'n '
              'cyd-fynd â\'r ddamcaniaeth.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'Tir fel llafur',
          'Mesurir arwynebeddau drwy gysylltu hyd â hyd. Ond ni chododd yr hen '
              'fesurau tir o geometreg, ond o lafur. Roedd cae mor fawr â\'r hyn '
              'y gellid ei drin mewn un diwrnod.\n\n'
              'Enw\'r „Morgen" Almaeneg yw hynny am ei fod yn cael ei aredig '
              'mewn un bore. Yr „acer" Saesneg oedd yr arwynebedd y gallai '
              'gwedd o wyth ych ei wneud mewn un diwrnod. Daw\'r „iugerum" '
              'Rhufeinig o „iugum", iau yr ychen. Mae\'r „feddan" Arabaidd yn '
              'golygu iau ych hefyd. Yr un syniad ym mhob man: tir yw llafur.\n\n'
              'Yn yr hen Aifft roedd yn rhaid ailfesur y caeau ar ôl pob '
              'gorlif y Nîl, oherwydd roedd y dŵr yn dileu\'r ffiniau. Roedd y '
              'mesurwyr yn estyn rhaffau clymog; galwodd y Groegiaid hwy yn '
              'ddiweddarach yn „estynwyr rhaff". Ym Mesopotamia y mesur sylfaenol '
              'oedd y „sar" — sgwâr o ddeuddeg wrth ddeuddeg cufydd.',
        ),
        UnitTheorySection(
          'Yr acer a\'i rif cam',
          'Mae gan yr acer ffurf anarferol: stribed hir, cul, un ffyrlong o '
              'hyd ac un gadwyn o led (660 wrth 66 troedfedd). Mae hynny\'n '
              'adlewyrchu arfer yr aradr: cwys hir, llwybr cul. Felly ceir '
              '43,560 troedfedd sgwâr neu 4840 llath sgwâr.\n\n'
              'Pam y rhif cam hwn, 4840? Damwain hanes ydyw. Pan gwtogodd '
              'Lloegr y droedfedd yn y 13eg ganrif, arhosodd y rhwd a\'r ffyrlong '
              'yn ddigyfnewid yn ffiniau\'r tiroedd. O ganlyniad neidiodd yr '
              'acer o 4000 llath sgwâr hen i 4840 newydd. Felly nid bwriad yw\'r '
              'rhif cam, ond gweddill diwygiad mesur.',
        ),
        UnitTheorySection(
          'Mesurau arwynebedd ledled y byd',
          'Heddiw, yr hectar (10,000 metr sgwâr) yw\'r mesur tir mwyaf '
              'cyffredin yn fyd-eang. Ond mae hen fesurau\'n parhau\'n styfnig. '
              'Yng Ngwlad Thai mae\'r Rai hyd yn oed yn y gofrestr tir '
              'swyddogol. Yn India a Bangladesh rhennir mewn Bigha yn y fasnach '
              'tir. Yng Nghorea mae\'r Pyeong yn arferol yn y bywyd bob dydd er '
              'gwaethaf gwaharddiad. Cadwodd yr Aifft y Feddan, a Tsieina y Mu. '
              'Yn Israel, Twrci a\'r Balcanau mesurir mewn Dunam. Yn yr Almaen '
              'mae Morgen, Joch a Tagwerk yn dal i fyw yn amaethyddiaeth ac '
              'yn yr iaith.\n\n'
              'Y mesurau mwyaf styfnig yw\'r rhai sydd wedi\'u pennu i werthoedd '
              'metrig taclus — mae Rai yn union 1600, a Dunam yn union 1000 metr '
              'sgwâr.',
        ),
        UnitTheorySection(
          'Deuddeg yn yr arwynebedd — ac amheuaeth',
          'Yn yr unedau bach y mae\'r deuddeg yn dangos ei hun harddaf. Mae '
              'troedfedd sgwâr yn 144 modfedd sgwâr, oherwydd deuddeg wrth '
              'ddeuddeg yw 144. Wedi\'i ysgrifennu ym mhridd deuddeg mae hynny\'n '
              'lân „100". Mae llath sgwâr yn naw troedfedd sgwâr.\n\n'
              'Yn y mesurau tir mawr mae\'r drefn yn torri. Nid yw\'r acer â\'i '
              '4840 llath sgwâr yn ffitio i unrhyw sail syml. Y rheswm yw bod y '
              'mesurau tir wedi codi o lafur, nid o gyfrifo.\n\n'
              'Eto mae pwynt ymarferol yn aros: mae traean hectar yn 3333.33… '
              'metr sgwâr — rhif cam. Mae traean feddan, ar y llaw arall, yn '
              'lân wyth kirat. Lle rhennir yn aml yn dri, mae sail sy\'n '
              'rhanadwy â thri o fantais. Dyna\'n union beth a wna\'r deuddeg.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'O ble daeth yr hoffter o\'r deuddeg? Tybiaeth adnabyddus, ond '
              'heb ei phrofi: o gyfri\'r esgyrn bysedd. Mae\'r bawd yn cyffwrdd â '
              'thair cymal y pedwar bys arall — rhydd hynny ddeuddeg ar bob llaw. '
              'Mae\'r dechneg gyfri hon i\'w gweld hyd heddiw mewn rhannau o Asia '
              'a\'r Dwyrain Agos. Ond ni ellir ei phrofi fel tarddiad sicr.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'Y llestr yn gyntaf, yna\'r ciwb',
          'Mesurir cyfaint drwy gysylltu tri hyd — ciwb. Ond felly y dechreuodd '
              'bron yn unman. Yn y dechrau roedd y llestr: jwg llawn, sach o ŷd, '
              'lletwad o olew. Mesurid yr hyn y gellid ei fwyta, ei gario neu ei '
              'fasnachu, nid yr hyn y gellid ei gyfrifo.\n\n'
              'Cyfaint bwyd oedd y cyfeirnod yn aml. Yr „choinix" Groegaidd oedd '
              'dogn ŷd dyddiol gweithiwr. Roedd y „Koku" Siapaneaidd cymaint o '
              'reis ag y bydd dyn yn ei fwyta mewn blwyddyn — tua 180 litr. Roedd '
              'y „Scheffel" Almaeneg tua sach y gellid ei chario.\n\n'
              'Dim ond ymerodraethau mawr â gweinyddiaeth a ddeilliodd y cyfaint '
              'o\'r mesur hyd. Cymerodd y Rhufeiniaid y cam clir cyntaf: roedd eu '
              '„Amffora" yn dal yn union un droedfedd giwbig, tua 26 litr. Felly, '
              'am y tro cyntaf, roedd cyfaint yn giwb gwirioneddol o\'r mesur '
              'troed — hynafiad uniongyrchol y droedfedd giwbig, y litr a\'r '
              'metr ciwbig.',
        ),
        UnitTheorySection(
          'Mesur, gradd a chyfoeth',
          'Roedd mesurau ceudod yn aml yn fwy na meintiau — roeddent yn trefnu '
              'cymdeithasau cyfan. Yn Siapan mesurid cyfoeth arglwyddiaeth mewn '
              'Koku o gnwd reis. O ddeng mil Koku ymlaen ystyrid arglwydd yn '
              '„Daimyō", yn dywysog. Hyd yn oed cyflog y samurai a maint '
              'llongau, cyfrifid hwy mewn Koku.\n\n'
              'Yn Rhufain dosbarthid dogn y milwr mewn „modii", mesur sych o '
              'ychydig llai na naw litr. Ym Mesopotamia, yr Aifft a Tsieina '
              'rheolai\'r llywodraethwyr y mesurau drwy lestri safonol cymeradwy. '
              'Yr enwocaf yw\'r „Jialiang" Tsieineaidd o\'r cyfnod tua\'r '
              'flwyddyn sero: un castiad efydd yn unig sy\'n ymgorffori pum uned '
              'cyfaint ar unwaith. Safai o flaen neuaddau\'r ymerawdwr fel '
              'arwydd o undod a chyfiawnder ei lywodraeth.',
        ),
        UnitTheorySection(
          'Cyfaint ledled y byd',
          'Prin fod unrhyw faes mesur mor ddrylliedig â chyfaint. Amrywiai\'r '
              'Scheffel Almaeneg, yn ôl y dref, o tua 5 hyd 250 litr. Roedd gan '
              'Loegr, yr Unol Daleithiau a\'r Ymerodraeth dair galwyn '
              'wahanol ar eu pen eu hunain. Mae\'r galwyn UDA (3.79 litr) hyd '
              'heddiw tua phumed rhan yn llai na\'r un Brydeinig (4.55 litr).\n\n'
              'Mae llawer o\'r mesurau hyn yn parhau. Cyfrif y fasnach ŷd '
              'fyd-eang mewn „Bushels" — ymddengys adroddiadau cynhaeaf UDA ar '
              'gyfer corn, soia a gwenith ynddynt yn unig. Masnachir olew mewn '
              '„Barrel" o 42 galwyn UDA, hen fesur casgen win Saesneg. Ym '
              'Mhrydain Fawr ac Iwerddon gweinir cwrw yn ôl y gyfraith yn y '
              'peint imperial (568 mililitr). Yn Siapan mae\'r cwpan yn y popty '
              'reis yn mesur yn union un „Gō". Masnachir coed tân mewn metrau '
              'stwc, metrau solet neu, yng Ngogledd America, yn y „Cord".\n\n'
              'Yn yr Unol Daleithiau mae\'r mesurau ciwb yn rhan o\'r bywyd bob '
              'dydd: rhoddir injans mewn modfeddi ciwbig (yr „350"), concrit a '
              'phridd mewn adeiladu mewn llath giwbig, nwy naturiol mewn '
              'troedfeddi ciwbig.',
        ),
        UnitTheorySection(
          'Deuddeg yn y gofod — ac amheuaeth',
          'Yn y ciwb y mae\'r deuddeg yn dangos ei hun gryfaf. Mae troedfedd '
              'giwbig yn 1728 modfedd ciwbig — a 1728 yw deuddeg i\'r pŵer tri. '
              'Wedi\'i ysgrifennu ym mhridd deuddeg mae hynny\'n „1000" lân. Mae '
              'gan y rhif hwn nifer arbennig o ffactorau, oherwydd ei fod wedi\'i '
              'adeiladu o ddau a thri. Felly gellir haneru, traean, chwarteru, '
              'chwecheru ac wythfedu troedfedd giwbig yn lân.\n\n'
              'Metr ciwbig, ar y llaw arall, dim ond drwy ddau a phump y mae\'n '
              'rhannu\'n lân. Mae traean metr ciwbig yn 0.333… — rhif diddiwedd. '
              'Lle rhennir yn aml yn dri, mae\'r deuddeg o fantais.\n\n'
              'Yr amheuaeth onest: dim ond i\'r mesurau ciwb sydd wedi\'u '
              'deillio o hydoedd y mae\'r drefn brydferth hon yn dal. Nid yw\'r '
              'hen fesurau ceudod — bushel, galwyn, scheffel — yn dilyn unrhyw '
              'sail bur. Tyfasant o sachau a chasgenni, nid o gyfrifo, ac maent '
              'yn cymysgu camau dau, tri a rhai cwbl gam.',
        ),
        UnitTheorySection(
          'Y ciwb sanctaidd',
          'Mae gan y ciwb ystyr arbennig mewn llawer o ddiwylliannau, oherwydd '
              'bod hyd, lled ac uchder yn gyfartal — delwedd o berffeithrwydd. '
              'Roedd cysegr sancteiddiolaf y deml a\'r babell ar ffurf ciwb. '
              'Mae\'r Kaaba ym Mecca, sy\'n golygu „ciwb" yn ei henw, yn gysegr '
              'ciwbig du. Disgrifir „Jerwsalem newydd" y Beibl hefyd fel ciwb '
              'anferth.\n\n'
              'Ar draws llawer o grefyddau ystyrir y mesur cyfiawn yn '
              'ddyletswydd sanctaidd. Mae Beibl yr Hebraeg yn galw am „effa '
              'gyfiawn"; cyhudda\'r proffwyd Amos fasnachwyr sy\'n cwtogi\'r '
              'mesur. Mae\'r Coran yn neilltuo sura cyfan i\'r rhai sy\'n mesur '
              'yn brin. Pwy bynnag sy\'n mesur ar gam, mae\'n pechu — ceir y '
              'syniad hwn o gwmpas y byd.\n\n'
              'Mae\'r system fetrig hithau\'n cario\'r ysbryd hwn, dim ond yn '
              'fydol: yn lle o law llywodraethwr, mae\'n deillio ei mesur o\'r '
              'ddaear ei hun. Mae\'r metr yn ffracsiwn o gylchedd y ddaear, a\'r '
              'metr ciwbig ei ofod — mesur o natur yn lle o rym.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'O gwmpas hen adeiladau y mae damcaniaethau cyfaint beiddgar. Honna '
              'rhai fod pyramid Cheops yn cuddio „peint pyramid" neu fesur '
              'sanctaidd o darddiad dwyfol. Cred eraill fod cylchoedd cerrig '
              'oes y cerrig yn defnyddio „llath fegalithig" y ceir ohoni yn '
              'union un peint fel ciwb.\n\n'
              'Mae\'r arbenigwyr yn ystyried hyn yn anghywir. Mae damcaniaethau '
              'o\'r fath yn dewis o lawer o fesurau dim ond y rhai sy\'n cyd-fynd '
              'ac yn dehongli cyd-ddigwyddiadau fel bwriad. Difyr i\'w darllen, '
              'ond heb dystiolaeth.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'O\'r gronyn i\'r llwyth',
          'Roedd gan bwysau ddau wreiddyn ym mhob man. Daeth y mesurau lleiaf '
              'o hadau a gronynnau, a\'r rhai mawr o\'r hyn y gallai dyn neu '
              'anifail ei gario.\n\n'
              'Mae\'r „grain" Saesneg yn llythrennol yn ronyn haidd, tua 65 '
              'miligram. Daw „carat" y gemyddion o had y goeden garob. Yn India '
              'pwysid aur mewn „Ratti", had codlysiau coch. Ar y pen arall '
              'safai\'r llwyth: roedd y „Talent" Groegaidd a\'r „Maund" Indiaidd '
              'tua chymaint ag y gallai dyn ei gario. Daw\'r „dunnell" o\'r '
              'gasgen win fwyaf, y „Tun", a oedd, wedi\'i llenwi, yn pwyso tua '
              'dunnell.\n\n'
              'Mae trydydd edefyn yn cysylltu pwysau ac arian: roedd siecel, '
              'drachma, punt a tola yn enwau arian ac yn enwau pwysau ar yr un '
              'pryd. Metel wedi\'i bwyso oedd arian yn wreiddiol — pwysid arian '
              '(silver) yn lle cyfri darnau arian.',
        ),
        UnitTheorySection(
          'Punt, owns a\'r etifeddiaeth Rufeinig',
          'Daw ein geiriau pwysau o Rufain. Roedd y „libra" Rufeinig yn glorian '
              'ac yn bwysau o tua 329 gram, wedi\'i rannu\'n ddeuddeg „unciae". '
              'O „libra" y daeth y byrfodd „lb" ar gyfer punt a\'r arwydd „£" ar '
              'gyfer y bunt Brydeinig. O „uncia" — yn llythrennol „y deuddegfed" '
              '— y daeth y „owns" a hefyd y „fodfedd" (inch).\n\n'
              'O\'r gwreiddyn hwn tyfodd dwy system wahanol. Mae punt '
              '„Avoirdupois" y bywyd bob dydd yn rhannu\'n 16 owns — rhif y '
              'gellir ei haneru dro ar ôl tro. Cadwodd punt „Troy" masnach y '
              'metelau gwerthfawr y deuddeg owns Rufeinig. Mae owns troy (yr '
              'owns fanwl) felly\'n drymach nag owns bob dydd, ond mae\'r '
              'bunt troy yn ysgafnach — dryswch poblogaidd hyd heddiw.',
        ),
        UnitTheorySection(
          'Pwysau ledled y byd',
          'Roedd gan bron bob diwylliant ei raddfeydd. Cyfrai Mesopotamia mewn '
              'siecel, mina a thalent yn ôl bôn trigain. Cyfrifai\'r Aifft yn '
              'ddegol mewn deben a kite. Defnyddia Tsieina hyd heddiw jin, liang '
              'a\'r mace bach. Yn Siapan mae\'r „Momme" (3.75 gram) yn dal yn ôl '
              'y gyfraith yn uned fyd-eang masnach y perlau.\n\n'
              'Mae llawer o hen bwysau\'n parhau. Ym Mhrydain Fawr ac Iwerddon '
              'rhoddir pwysau\'r corff mewn „Stone" o 14 punt („un ar ddeg stone '
              'pedwar"). Mae\'r punt Almaeneg heddiw\'n golygu 500 gram lân. Yn '
              'Ne Asia masnachir aur mewn „Tola" (tua 11.7 gram). Ac mae siecel '
              'Israel yn dwyn enw hen bwysau clorian.\n\n'
              'Roedd un mesur yn arbennig o ddrylliedig: pwysai\'r stone, yn ôl '
              'y nwydd, weithiau 5, weithiau 8, weithiau 14 punt. Dim ond '
              'deddfau\'r 19eg ganrif a greodd drefn.',
        ),
        UnitTheorySection(
          'Y glorian fel arwyddlun',
          'Mewn llawer o ddiwylliannau mae pwyso\'n fwy na thechneg — mae\'n '
              'ddelwedd o gyfiawnder. Yn yr hen Aifft pwysid y galon yn erbyn '
              'pluen y gwirionedd yn llys y meirw. Yn Homer dalia Zeus glorian '
              'aur dros dynged yr arwyr. Yn Islam mae\'r „Mizan" yn pwyso\'r '
              'gweithredoedd ar Ddydd y Farn, ac ni chyll hyd yn oed pwysau '
              'gronyn mwstard.\n\n'
              'Mae\'r „libra" Lladin yn golygu clorian — dyna hefyd arwydd y '
              'sêr Libra, yr unig un nad yw\'n greadur byw. Mae llawer o '
              'grefyddau\'n mynnu\'r mesur onest: galwa Beibl yr Hebraeg bwysau '
              'ffug yn ffieidd-dra, a chŵyna\'r Coran am y rhai sy\'n pwyso\'n '
              'brin. A throdd y gair „talent" o bwysau\'n ddawn — drwy ddameg '
              'feiblaidd y talentau a ymddiriedwyd.',
        ),
        UnitTheorySection(
          'Deuddeg yn y pwysau — ac amheuaeth',
          'Mae\'r deuddeg yn bennaf yn y system Troy: deuddeg owns yn y bunt, '
              'a chyfrifir purdeb aur mewn 24 carat (dwywaith deuddeg). Mae '
              'rhifau o\'r fath yn boblogaidd, oherwydd bod gan ddeuddeg chwe '
              'ffactor — gellir haneru, traean a chwarteru\'n lân. Mae traean '
              'deuddeg yn bedwar taclus; mae traean deg yn 3.33…\n\n'
              'Yr amheuaeth onest: nid yw\'r pwysau bob dydd yn dilyn y deuddeg. '
              'Mae gan y bunt Avoirdupois 16 owns — dyna fôn dau, yr haneru '
              'parhaus. Cyfrai Mesopotamia mewn bôn trigain. Felly mae byd y '
              'pwysau\'n glytwaith o ddau, tri, deuddeg a thrigain — adeiladwyd '
              'ar gyfer rhannu mewn masnach, nid ar gyfer cyfrifo mewn '
              'degau.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'O ble daeth yr hoffter o\'r deuddeg? Tybiaeth adnabyddus, ond '
              'heb ei phrofi, sy\'n ei holrhain i gyfri\'r esgyrn bysedd: mae\'r '
              'bawd yn cyffwrdd â thair cymal y pedwar bys — deuddeg ar bob '
              'llaw. Os cyfrifir hynny bum gwaith, deuir at drigain.\n\n'
              'Mae ail stori hyd yn oed wedi\'i gwrthbrofi: bod y carat yn '
              'seiliedig ar hadau arbennig o gyson y goeden garob. Mae\'r enw\'n '
              'gywir — ond mae\'r hadau\'n amrywio cymaint o ran pwysau ag '
              'eraill. Myth yw\'r cysondeb.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Dwy etifeddiaeth: Babilon a\'r Aifft',
          'Daw ein hamser o ddwy ffynhonnell hynafol. Daw\'r awr o\'r Aifft, a\'r '
              'funud a\'r eiliad o Fabilon.\n\n'
              'Rhannodd yr Eifftiaid ddydd a nos yn ddeuddeg awr yr un — yn '
              'debygol oherwydd iddynt weld deuddeg cytser yn codi yn y nos. '
              'Felly y cododd y dydd 24 awr. Ond gan fod dydd a nos o hyd '
              'gwahanol, roedd yr oriau hyn o hyd anghyfartal yn yr haf a\'r '
              'gaeaf. Dim ond y cloc mecanyddol a\'u gwnaeth yn gyfartal.\n\n'
              'Cyfrai Babilon mewn bôn trigain. Dyna pam y mae gennym drigain '
              'munud yn yr awr a thrigain eiliad yn y funud. Mae „minute" yn '
              'golygu „rhan wedi\'i lleihau", a „second" yr „ail leihad". Mae\'r '
              'un bôn trigain yn y cylch â\'i 360 gradd — mae amser ac ongl yn '
              'perthyn.',
        ),
        UnitTheorySection(
          'Lleuad, haul ac wythnos',
          'Daw\'r dydd o droad y ddaear, y mis o\'r lleuad, a\'r flwyddyn o\'r '
              'haul. Nid yw\'r tri hyn yn ffitio\'n lân â\'i gilydd, ac mae '
              'hynny\'n esbonio bron bob cymhlethdod calendr.\n\n'
              'Mae gan yr wythnos saith diwrnod — yn ôl pob tebyg ar ôl pedwar '
              'cyfnod y lleuad o tua saith diwrnod yr un. Yn ddiweddarach '
              'neilltuwyd i bob dydd un o\'r saith corff nefol gweladwy. Mae\'r '
              'rhes hon yn byw mewn llawer o ieithoedd: yn Saesneg „Saturday" '
              'yw dydd Sadwrn, ac yn yr ieithoedd Romáwns „lundi/lunes" yw dydd '
              'y lleuad. Cyfnewidiodd y Germaniaid dduwiau Rhufain am rai eu '
              'hunain — daeth dydd Iau (Jupiter) yn ddiwrnod Thor, y '
              '„Thursday".\n\n'
              'Mae hen ddulliau cyfri\'n atseinio hefyd: mae\'r „fortnight" '
              'Saesneg (pedair nos ar ddeg) yn ein hatgoffa fod y Germaniaid '
              'yn cyfrif mewn nosweithiau yn lle dyddiau.',
        ),
        UnitTheorySection(
          'Amser ledled y byd',
          'Ni redodd y cloc yr un fath ym mhob man. Rhannodd Tsieina y dydd yn '
              'ddeuddeg awr ddwbl, wedi\'u henwi ar ôl anifeiliaid — roedd awr y '
              'llygoden tua hanner nos. Rhannodd Siapan ddydd a nos yn chwe '
              'rhan yr un, a fyddai\'n hwy ac yn fyrrach gyda\'r tymhorau; '
              'roedd yn rhaid i glociau arbennig addasu i hynny.\n\n'
              'Dilyna\'r calendr Islamaidd y lleuad yn unig ac mae un diwrnod ar '
              'ddeg yn fyrrach na\'r flwyddyn heulog — dyna pam y mae Ramadan yn '
              'crwydro\'n araf drwy\'r holl dymhorau. Plethodd y Maya sawl cylch '
              'ar unwaith, gan gynnwys cylch sanctaidd o 260 diwrnod. Yn '
              'Ethiopia mae\'r dydd hyd heddiw\'n dechrau ar godiad haul: yr '
              'hyn sy\'n „chwech o\'r gloch" yno yw canol dydd mewn man arall.\n\n'
              'Mae llawer o\'r hen rhythmau hyn yn parhau — mewn gwyliau, '
              'amserau gweddi a dyddiau lwcus — tra bod y bywyd bob dydd ym '
              'mhob man yn dilyn y calendr Gregoraidd.',
        ),
        UnitTheorySection(
          'Rhifau sanctaidd amser',
          'Roedd amser bron ym mhob man hefyd yn sanctaidd. Ym Mabilon '
              'ystyrid deuddeg a thrigain yn rifau perffaith. Yn yr Aifft '
              'teithiai duw\'r haul drwy\'r isfyd yn ystod deuddeg awr y nos. '
              'Mae saith yr wythnos yn sefyll am gyflawnder yn nhraddodiad yr '
              'Iddewon — gorffwysodd Duw ar y seithfed dydd.\n\n'
              'Mae cyferbyniad trawiadol: i\'r Iddewiaeth, y Cristnogaeth a\'r '
              'Islam mae amser yn rhedeg yn syth ymlaen, tuag at nod. Yn yr '
              'Hindŵaeth mae\'n troi mewn cylch — mae oesoedd byd anferth, y '
              '„Yugas", yn dod ac yn mynd dro ar ôl tro, ac mae un diwrnod o\'r '
              'duw creawdwr yn para biliynau o flynyddoedd. Roedd llawer o '
              'ddiwylliannau\'n ofni hefyd y dyddiau ychwanegol ar ddiwedd y '
              'flwyddyn fel „cyfnod rhwng" peryglus.',
        ),
        UnitTheorySection(
          'Pam nid yn ddegol — a\'r cysylltiad â deuddeg',
          'Amser yw gelyn mwyaf styfnig y system ddegol. Eiliad, munud, awr, '
              'dydd, wythnos, mis, blwyddyn — nid yw\'r un o\'r camau hyn yn rif '
              'deg taclus.\n\n'
              'Y rheswm eto yw\'r rhanadwyedd. Mae traean awr yn ugain munud '
              'taclus, a chwarter yn bymtheg. Â deg ni byddai hynny\'n gweithio '
              'allan. Gellir rhannu deuddeg a thrigain â thri, ond nid deg.\n\n'
              'Ceisiwyd y system ddegol serch hynny. Yn y Chwyldro Ffrengig '
              'roedd dyddiau o ddeg awr, ac oriau o gant munud. Dim ond tua '
              'blwyddyn a hanner y parhaodd. Yn wahanol i\'r mesurau hyd a '
              'phwysau, ni ddaeth y newid â budd — roedd yr hen glociau eisoes '
              'yn rhedeg yr un fath ym mhob man. Roedd rhaniad y deuddeg a\'r '
              'trigain yn syml yn fwy ymarferol.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'Sut y daeth pobl at ddeuddeg a thrigain? Syniad cain, ond '
              'amhrofadwy: cyfrid â\'r bawd tair cymal y pedwar bys — deuddeg ar '
              'bob llaw —, ac mae pum tro o\'r fath yn rhoi trigain.\n\n'
              'Ymhellach allan y mae honiadau fod y flwyddyn yn flaenorol wedi '
              'cael yn union 360 diwrnod ac wedi\'i newid gan drychinebau '
              'cosmig. Nid oes tystiolaeth wyddonol am hynny; mae\'r 360 yn '
              'llawer mwy tebygol o fod yn rif crwn, hawdd ei rannu, ar gyfer '
              'cyfrifo.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'Y cylch o Fabilon',
          'Rhannwn y cylch llawn yn 360 gradd, y gradd yn 60 munud arc, a\'r '
              'funud yn 60 eiliad. Mae\'r drefn hon yn hynafol ac yn dod o '
              'Fesopotamia. Cyfrai\'r Babiloniaid mewn bôn trigain, rhif â nifer '
              'arbennig o ffactorau.\n\n'
              'Pam 360, o bopeth? Roedd eu blwyddyn tua 360 diwrnod, ac mae\'r '
              'haul yn crwydro\'n agos at radd y dydd — roedd dydd a gradd yn '
              'cyd-fynd. Mae\'r geiriau\'n bradychu\'r tarddiad: daw „minute" '
              'o\'r Lladin „rhan fach gyntaf", a „second" o\'r „ail leihad". Yr '
              'un union eiriau a ddefnyddiwn ar gyfer amser — mae ongl ac amser '
              'yn frodyr o\'r un gwreiddyn Babilonaidd.\n\n'
              'Awgrym onest: nid yw\'n sicr pam y daeth yn 360 ac nid 60. Stori '
              'y diwrnod-y-gradd yw\'r fwyaf credadwy, ond nid yw\'n esboniad '
              'profedig.',
        ),
        UnitTheorySection(
          'O\'r seren i\'r awr',
          'Daw\'r deuddeg ar y cylch o\'r Aifft. Yno roedd deuddeg cytser yn '
              'codi yn trefnu\'r nos — ohonynt y daeth deuddeg awr y nos ac yn y '
              'pen draw y dydd 24 awr a wyneb y cloc.\n\n'
              'Trefnodd y Groegiaid y system. Cymerodd Hipparchos ac yn '
              'ddiweddarach Ptolemaios y rhaniad 360 a gosod felly sylfaen '
              'trigonometreg. Oddi yno crwydrodd y wybodaeth ymlaen: dyfeisiodd '
              'ysgolheigion Indiaidd y tabl sin, a mireiniodd y byd Islamaidd '
              'ef. Mae ein gair „sin" hyd yn oed yn gamgyfieithiad — o\'r gair '
              'Indiaidd am „dant bwa" daeth, drwy\'r Arabeg, y gair Lladin am '
              '„bae".',
        ),
        UnitTheorySection(
          'Onglau ledled y byd',
          'Ni rannodd pob diwylliant y cylch yr un fath. Cyfrai Tsieina yn '
              'annibynnol: roedd gan y cylch yno 365¼ rhan — un am bob diwrnod '
              'o\'r flwyddyn. Dim ond dylanwad Ewropeaidd a ddaeth â\'r 360. '
              'Rhanna cwmpawd Feng-Shui Tsieineaidd y gorwel yn 24 cyfeiriad.\n\n'
              'Rhannodd India\'r Sidydd yn ddeuddeg arwydd ac yn 27 tŷ lleuad. '
              'Rhoddodd seryddiaeth Islamaidd lawer o eiriau cyfeiriad i ni: '
              'mae „azimwth", „zenith" a „nadir" oll yn Arabaidd — gyrrodd y '
              'ddyletswydd i ganfod cyfeiriad gweddi tuag at Mecca y grefft '
              'ongl ymlaen.\n\n'
              'Ar y môr rhannid rhosyn y gwynt: pedwar prif wynt, yna wyth, '
              'yna 32 pwynt o 11¼ gradd yr un. Roedd adrodd y 32 oll yn y cylch '
              '— „boxing the compass" — yn rhan o grefft y llywiwr. Mae enwau '
              'gwynt Môr y Canoldir, Tramontana, Levante, Scirocco, yn byw '
              'hyd heddiw yn iaith y tywydd.',
        ),
        UnitTheorySection(
          'Cyfeiriadau a rhifau sanctaidd',
          'Roedd y nefoedd bron ym mhob man yn ddwyfol. I\'r Babiloniaid roedd '
              'seryddiaeth yn neges gan y duwiau, a\'r Sidydd yn ysgrifen iddynt. '
              'Ystyrid y deuddeg gan lawer yn rif sanctaidd — deuddeg arwydd '
              'y Sidydd, deuddeg Olympiad, deuddeg llwyth, deuddeg awr.\n\n'
              'Mae trefn y pedwar prif gyfeiriad yn arbennig o eang. Yn yr '
              'Hindŵaeth gwarchoda duw ei hun bob cyfeiriad, ac yn Tsieina '
              'fod anifeilaidd ei hun — draig yn y dwyrain, teigr yn y '
              'gorllewin. Rhydd olwyn feddyginiaeth y Lakota liw ac ystyr i '
              'bob cyfeiriad. Ac yn Islam mae cyfeiriad gweddi yn trefnu\'r byd '
              'cyfan o gwmpas y Kaaba.\n\n'
              'Heb symbolaeth o\'r fath o fwriad y daeth y mesurau iau: mae\'r '
              'mesur bwa (radian) yn dilyn mathemateg yn unig, y gon o\'r '
              'Chwyldro Ffrengig, a\'r llinell filwrol o falisteg yn unig.',
        ),
        UnitTheorySection(
          'Deuddeg a thrigain yn y cylch — ac amheuaeth',
          'Mae\'r 360 yn wyrth rhanadwyedd: mae ganddi 24 ffactor. Mae traean, '
              'chwarter a chweched cylch oll yn rhoi rhifau gradd lân. Ni allai '
              'cylch o gant ran wneud hynny — byddai traean yn 33.33…\n\n'
              'Ceisiwyd ef yn ddegol. Yn y Chwyldro Ffrengig daeth y cylch o '
              '400 gon. Arhosodd yn gornel i fesurwyr, oherwydd bod gan 400 lai '
              'o ffactorau na 360. Methodd yr amser degol hefyd — ymhlith '
              'pethau eraill, am na ellid ei chwarteru\'n lân.\n\n'
              'Yr amheuaeth onest: nid yw\'r 360 yn anorfod. Mae rhaniad 365 '
              'Tsieina yn ei brofi. Ac mewn mathemateg uwch enilla\'r mesur bwa, '
              'oherwydd nad rhanadwyedd sydd o bwys yno ond fformiwlâu syml. '
              'Felly mae byd y deuddeg yn gryf, ond heb fod heb ddewis arall.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'O ble daeth yr hoffter o ddeuddeg a thrigain? Y dybiaeth adnabyddus, '
              'ond heb ei phrofi: o gyfri\'r esgyrn bysedd. Mae\'r bawd yn '
              'cyffwrdd â thair cymal y pedwar bys — deuddeg ar bob llaw —, ac '
              'mae pum tro yn rhoi trigain.\n\n'
              'Mae cyfochredd rhifol yn ddeniadol: rhydd y chwedl Norsaidd i '
              'Walhalla 540 drws, ac drwy bob un cerdda 800 o ryfelwyr — ynghyd '
              '432,000, yr un rhif ag oes byd Indiaidd. Mae\'r arbenigwyr yn '
              'ystyried hyn yn gyd-ddigwyddiad, nid yn etifeddiaeth gyffredin. '
              'Hyfryd i\'w adrodd, ond heb dystiolaeth.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'Arian oedd pwysau',
          'Ymhell cyn bod darnau arian, metel wedi\'i bwyso oedd arian. Pwysid '
              'arian (silver) neu ŷd. Dyna pam fod yr enwau arian hynaf mewn '
              'gwirionedd yn enwau pwysau.\n\n'
              'Ym Mesopotamia cyfrid mewn siecel, mina a thalent — yn ôl bôn '
              'trigain, trigain siecel i\'r mina. Pwysau oedd y siecel yn '
              'gyntaf, wedi\'i safoni wrth y gronyn haidd. Mae\'r „drachma" '
              'Groegaidd yn golygu\'n llythrennol „llond llaw", sef chwe '
              'gwaywffon fetel denau.\n\n'
              'Trawiadol: dim ond y darn arian lleiaf a fathwyd fynychaf. Roedd '
              'yr unedau mawr fel mina a thalent yn feintiau cyfrif pur — ni '
              'ddaliodd neb dalent yn ei law, dim ond cyfrif ag ef.',
        ),
        UnitTheorySection(
          'Punt, swllt, ceiniog',
          'Daw arian Ewrop o Rufain. Rhoddodd y darn arian „Denarius" i\'r '
              'geiniog y byrfodd „d" ac i lawer o ieithoedd y gair am arian '
              '(„dinero" Sbaeneg, „Dinar" Arabaidd).\n\n'
              'Aildrefnodd Siarlymaen ef: un bunt o arian (libra) = 20 swllt '
              '(solidus) = 240 ceiniog (denarius), hynny yw deuddeg ceiniog '
              'i\'r swllt. Yma eto dim ond y geiniog oedd ddarn arian '
              'gwirioneddol; gwasanaethai punt a swllt ar gyfer cyfrif. '
              'Parhaodd y system hon dros fil o flynyddoedd.\n\n'
              'Mabwysiadodd Lloegr ef fel punt, swllt, ceiniog — yr „£sd". Mae\'r '
              'arwydd „£" yn L wedi\'i addurno am „libra", y glorian. Felly mae\'r '
              'arian yn hongian wrth yr un gair â\'r arwydd sêr Libra a\'r bunt '
              'bwysau.',
        ),
        UnitTheorySection(
          'Darnau arian ledled y byd',
          'Roedd gan bron bob rhanbarth ei raddfeydd. Yn ne\'r Almaen roedd '
              'trigain Kreuzer i un Gulden — y trigain Babilonaidd unwaith eto. '
              'Rhoddodd y „Taler" o Joachimsthal yn Bohemia ei enw i\'r '
              '„Dollar". Roedd Taler Maria Theresa mor boblogaidd nes ei fod '
              'hyd at yr 20fed ganrif yn dal yn arian yn Arabia ac Ethiopia.\n\n'
              'Mewn mannau eraill roedd arian yn edrych yn gwbl wahanol. Yng '
              'Ngorllewin Affrica talwyd am ganrifoedd â chregyn cowri. '
              'Defnyddiodd yr Astecaid ffa coco fel mân arian a chlogynnau '
              'safonol fel arian mawr — wedi\'u cyfri mewn ugeiniau. Cyfrifodd '
              'India\'r rwpî mewn 16 Anna, a llinynnodd Tsieina ddarnau arian â '
              'thwll yn rhesi.\n\n'
              'Gellid torri\'r doler Sbaeneg „darn-i-wyth" yn wyth darn. Roedd '
              'dau ohonynt yn „two bits" — hyd heddiw\'r llysenw Americanaidd am '
              'y darn chwarter doler.',
        ),
        UnitTheorySection(
          'Arian, ffydd a symbol',
          'Roedd darnau arian yn aml yn fwy na chyfrwng talu. Gosodai\'r '
              'Groegiaid ddarn arian yng ngheg y marw — y tâl cludo i Charon, '
              'a ddaw â\'r enaid dros afon y meirw. Heb ddarn arian, arhosai ar '
              'y lan.\n\n'
              'Yn y Testament Newydd dalia Iesu ddenarius â llun yr ymerawdwr i '
              'fyny: „Rhowch i Gesar yr hyn sy\'n eiddo i Gesar." Roedd deg '
              'darn arian ar hugain Jwdas yn ôl pob tebyg yn siecel o Tyrus — '
              'darnau arian, o bopeth, â duw paganaidd arnynt, ac ar yr un pryd '
              'arian swyddogol y deml.\n\n'
              'A\'r deuddeg sanctaidd dro ar ôl tro: deuddeg llwyth ac apostol '
              'yn yr Iddewiaeth a\'r Gristnogaeth, deuddeg duw haul yn yr '
              'Hindŵaeth, deuddeg cymal y gadwyn achos yn y Bwdhaeth, deuddeg '
              'imam yn y Shia, deuddeg cangen ddaear yn Tsieina. Mae\'r rhif yn '
              'cysylltu arian, calendr a ffydd.',
        ),
        UnitTheorySection(
          'Pam deuddeg ac ugain — ac amheuaeth',
          'Y rheswm dros yr holl raddfeydd cam yw\'r rhanadwyedd. Gellir traean '
              'Gulden o drigain Kreuzer yn lân: ugain Kreuzer. Mae traean doler, '
              'ar y llaw arall, yn 33.33… cent — rhif diddiwedd. Pwy bynnag '
              'sy\'n rhannu\'n aml mewn masnach, fe\'i gwasanaethir yn well â '
              'deuddeg, ugain neu drigain nag â deg.\n\n'
              'Dyna pam y mae\'r deuddeg yn byw ymlaen mewn masnach: y dwsin (12), '
              'y gros (144) a\'r gros mawr (1728). Mae gros yn golygu yn Llundain '
              'fel yn Efrog Newydd yr un maint.\n\n'
              'Yr amheuaeth onest: nid system ddeuddeg bur oedd yr hen arian. '
              'Mae\'r ugain swllt yn y bunt yn rhesymeg ugain (bysedd a bysedd '
              'traed). Ac ym 1971 newidiodd Prydain Fawr i gant ceiniog — gyda '
              'pheth dryswch, ond yn barhaol. Heddiw mae bron y byd cyfan yn '
              'cyfrif yn ddegol.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'Pam y dewisodd cynifer o ddiwylliannau\'r deuddeg? Mae\'r dybiaeth '
              'adnabyddus, ond heb ei phrofi, yn ei holrhain i gyfri\'r esgyrn '
              'bysedd: tair cymal ar bedwar bys, wedi\'u cyffwrdd â\'r bawd, '
              'sy\'n rhoi deuddeg.\n\n'
              'Â dehongliadau eraill ymhellach: bod y deuddeg yn „dri wrth '
              'bedwar", nef wrth ddaear, yn rif cyflawnder. Honna rhai hyd yn '
              'oed fod duw haul â deuddeg cydymaith yn batrwm i\'r deuddeg '
              'apostol. Dehongliad yw cyfochredd o\'r fath, nid hanes sicr — '
              'i\'w fwynhau\'n ofalus.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'O\'r thermosgop i\'r thermomedr',
          'Dyfais ddiweddar yw\'r tymheredd. Am amser hir dim ond teimlo gwres '
              'y gellid, nid ei fesur. Gwnaeth y cam cyntaf gan y sylw fod aer a '
              'hylifau\'n ehangu â gwres.\n\n'
              'Tua 1600 adeiladodd Galileo Galilei „thermosgop": pelen wydr â '
              'phibell, ynddi yr oedd lefel dŵr yn codi a gostwng. Dangosai '
              'wres, ond nid oedd ganddo raddfa. Daeth y raddfa rifau gyntaf yn '
              'fuan wedyn gan y meddyg Santorio — thermomedr yw thermosgop â '
              'graddfa.\n\n'
              'Er mwyn i fesuriadau fod yn gymaradwy, mae angen pwyntiau cyfeirio '
              'sefydlog. Cytunwyd ar bwyntiau naturiol: rhewbwynt a berwbwynt y '
              'dŵr. Wrthynt hwy y mae pob graddfa\'n hongian hyd heddiw.',
        ),
        UnitTheorySection(
          'Tair graddfa, tri sero',
          'Mae\'r graddfeydd adnabyddus yn gwahaniaethu\'n bennaf yn yr ystyr o '
              'ble y gosodant y sero.\n\n'
              'Gosododd Daniel Fahrenheit tua 1724 ei sero ar y pwynt oeraf y '
              'gallai ei gynhyrchu\'n sicr: cymysgedd o iâ, dŵr a halen. Gosododd '
              'rewbwynt y dŵr pur ar 32, a thymheredd y corff ar 96. Felly ni '
              'syrthiodd y gaeafau arferol o dan sero. Yn ddiweddarach '
              'ailsafonwyd y raddfa ar y rhewbwynt (32) a\'r berwbwynt (212) — '
              'union 180 gradd rhyngddynt.\n\n'
              'Dewisodd Réaumur 0 a 80. Gosododd Celsius, ar y llaw arall, 0 a '
              '100 ar rewi a berwi — a gosododd y raddfa ar y dechrau hyd yn oed '
              'tu chwith (0 oedd y berwbwynt). Dim ond ar ôl ei farwolaeth y '
              'troed hi i\'r ffurf gyfredol. Roedd rhaniad crwn y cant yn ffitio\'n '
              'berffaith i\'r system fetrig newydd.',
        ),
        UnitTheorySection(
          'Pam mae\'r byd yn mesur yn wahanol',
          'Defnyddia bron y byd cyfan Celsius heddiw — daeth â\'r system fetrig. '
              'Y prif eithriadau yw\'r Unol Daleithiau a rhai gwledydd yn agos '
              'gysylltiedig â hwy, a arhosodd gyda Fahrenheit. Gwnaeth deddf o '
              '1975 y newid yno\'n wirfoddol, ac felly yr arhosodd pethau fel '
              'yr oeddent.\n\n'
              'Mae hen raddfeydd yn styfnig. Roedd Réaumur yn yr 18fed a\'r '
              '19eg ganrif yn gyffredin yn Ffrainc, yr Almaen a Rwsia, ac '
              'arhosodd yn Rwsia\'n arbennig o hir. Dyna pam y mae llenyddiaeth '
              'Rwsia — fel yn Dostoevsky neu Tolstoy — yn sôn am „raddau '
              'rhew", a Réaumur sydd ar ei meddwl.\n\n'
              'Pa raddfa sy\'n teimlo\'n „fwy naturiol" — arferiad pur ydyw. Mae '
              'Celsius yn clymu wrth y dŵr, a Fahrenheit yn rhychwantu\'n fras o '
              '0 (oer iawn) hyd 100 (poeth iawn) y tywydd dynol. Confensiwn yw\'r '
              'ddau, nid mantais wrthrychol.',
        ),
        UnitTheorySection(
          'Tân ac iâ',
          'Mae gwres ac oerfel yn cario ystyr ddofn ym mron pob diwylliant — '
              'ac yn drawiadol o aml maent ill dau yn sefyll ar yr un pryd am '
              'greadigaeth ac am gosb.\n\n'
              'Yn y chwedl Norsaidd cyfyd y byd o\'r tyndra rhwng teyrnas dân '
              'Muspelheim a theyrnas iâ Niflheim — nid drwg yw oerfel yma, ond '
              'grym creu. Dychmygir uffern fynychaf fel tân, ond yn Inferno '
              'Dante mae\'r cylch dyfnaf yn llyn rhewedig: brad yw oeri pob '
              'gwres dynol. Mae\'r Bwdhaeth yn adnabod uffernau poeth ac '
              'oer fel ei gilydd, wedi\'u graddio yn ôl yr euogrwydd.\n\n'
              'Mewn mannau eraill mae tân yn sanctaidd ac yn bur: Agni yn yr '
              'Hindŵaeth, y tân tragwyddol yn y Soroastriaeth. Ac mae\'r gair '
              '„Nirvana" yn golygu\'n llythrennol „diffodd" — diffodd y llosgi '
              'mewnol.',
        ),
        UnitTheorySection(
          'Y sero go iawn: Kelvin',
          'Beth yw tymheredd mewn gwirionedd? Mesur ydyw o ba mor gyflym y mae\'r '
              'gronynnau lleiaf yn symud. Mae poeth yn golygu: mae\'r gronynnau\'n '
              'crynu\'n gryfach.\n\n'
              'O hynny dilyna fod tymheredd isaf posibl yn bod — y pwynt lle mae\'r '
              'symudiad hwn ar ei leiaf. Dyma\'r sero absoliwt ar −273.15 °C. Ni '
              'all fynd yn oerach. Gosododd yr Arglwydd Kelvin ym 1848 raddfa\'n '
              'union yno: sero Kelvin yw\'r sero absoliwt, ac mae cam Kelvin mor '
              'fawr â gradd Celsius.\n\n'
              'Dim ond y raddfa hon sy\'n caniatáu cymarebau gwirioneddol: mae '
              '200 Kelvin yn wirioneddol ddwywaith mor „gynnes" â 100. Â Celsius '
              'neu Fahrenheit nid yw hynny\'n dal — mae „mae 20 gradd ddwywaith '
              'mor gynnes â 10 gradd" yn syml yn anghywir. I wyddoniaeth, felly, '
              'Kelvin yw\'r uned sylfaenol.',
        ),
        UnitTheorySection(
          'Pam nad yw deuddeg yn helpu llawer yma — yn onest',
          'Yn y mesurau eraill mae\'r deuddeg yn gryf, am y gellir rhannu maint '
              'yn dda: mae traean troedfedd yn bedair modfedd lân. Â\'r '
              'tymheredd nid yw\'r ddadl hon yn gafael — ac mae hynny\'n perthyn '
              'i\'r dweud onest.\n\n'
              'Y rheswm yw\'r sero a symudwyd. Nid yw sero gradd Celsius yn '
              'golygu „dim gwres", dim ond „mae dŵr yn rhewi". Dyna pam na ellir '
              'haneru na thraean tymheredd yn ystyrlon — nid oes „hanner mor '
              'gynnes" ar raddfa o\'r fath. Mae rhanadwyedd brydferth y deuddeg '
              'yn rhedeg i\'r gwagle yma.\n\n'
              'Dim ond mewn un man y mae meddwl rhanadwyedd, serch hynny: yn '
              'rhaniad y raddfa ei hun. Gellir haneru\'n aml 96 Fahrenheit a\'r '
              '64 cam hyd at yr iâ. Ond p\'un a rennir y dangosydd yn 10, 12 neu '
              '100 cam, cosmeteg pur ydyw. Y tymheredd yw\'r gwrth-enghraifft '
              'onest: yma mae\'r dewis o sail yn ddi-wahaniaeth — mae\'r datganiad '
              'gwirioneddol yn y sero absoliwt, nid yn rhaniad y raddfa.',
        ),
        UnitTheorySection(
          'Damcaniaethol (â gofal)',
          'O gwmpas graddfa Fahrenheit y mae chwedlau. Dywed un mai 96 oedd '
              'tymheredd twymyn ei wraig glaf — nid oes tystiolaeth am hynny. '
              'Dywed un arall mai\'r sero oedd gaeaf oeraf ei dref enedigol '
              'Danzig; mae\'r cymysgedd iâ-halen ailadroddadwy yn fwy tebygol.\n\n'
              'Hyd yn oed esboniad Fahrenheit ei hun o\'i bwyntiau sefydlog '
              'ystyrir yn rannol wedi\'i harddu wedi\'r digwyddiad — cymerodd '
              'lawer yn syml o raddfa hŷn y seryddwr Rømer. Storïau hyfryd, ond '
              'i\'w darllen yn ofalus.',
        ),
      ];
    // Mae pob un o\'r naw maes theori bellach ar gael yn Gymraeg.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesCy(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return [
        Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
        Source('Gross (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Gross_(unit)', 'R2', 'A1'),
        Source('Great gross — Wikipedia', 'https://en.wikipedia.org/wiki/Great_gross', 'R2', 'A1'),
        Source('Baker’s dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Baker%27s_dozen', 'R2', 'A1'),
        Source('Assize of Bread and Ale — Wikipedia', 'https://en.wikipedia.org/wiki/Assize_of_Bread_and_Ale', 'R2', 'A1'),
        Source('dozen — Online Etymology Dictionary', 'https://www.etymonline.com/word/dozen', 'R2', 'A1'),
        Source('gross — Online Etymology Dictionary', 'https://www.etymonline.com/word/gross', 'R2', 'A1'),
      ];
    case UnitCategory.dist:
      return [
        Source('Measurement — MacTutor History of Mathematics', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Measurement/', 'R1', 'A1'),
        Source('Proportionate measurements (Vastu-Shastra) — wisdomlib.org', 'https://www.wisdomlib.org/hinduism/book/vastu-shastra-indian-architecture/d/doc1085304.html', 'R1', 'A1'),
        Source('Cubit — Wikipedia', 'https://en.wikipedia.org/wiki/Cubit', 'R2', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('The nautical mile — IHO', 'https://ihr.iho.int/articles/the-nautical-mile/', 'R1', 'A2'),
      ];
    case UnitCategory.area:
      return [
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A1'),
        Source('Acre — Wikipedia', 'https://en.wikipedia.org/wiki/Acre', 'R2', 'A1'),
        Source('Hectare — Wikipedia', 'https://en.wikipedia.org/wiki/Hectare', 'R2', 'A1'),
        Source('Jugerum — Wikipedia', 'https://en.wikipedia.org/wiki/Jugerum', 'R2', 'A1'),
        Source('Mathematical accuracy of Aztec land surveys (Codex Vergara) — PNAS', 'https://www.pnas.org/doi/10.1073/pnas.1107737108', 'R1', 'A2'),
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A2'),
      ];
    case UnitCategory.space:
      return [
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Hekat — Wikipedia', 'https://en.wikipedia.org/wiki/Hekat', 'R2', 'A1'),
        Source('Medimnos — Wikipedia', 'https://en.wikipedia.org/wiki/Medimnos', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('Jialiang — Wikipedia', 'https://en.wikipedia.org/wiki/Jialiang', 'R2', 'A1'),
      ];
    case UnitCategory.weight:
      return [
        Source('Hanging in the Balance: Precision Weighing in Antiquity — Penn Museum', 'https://www.penn.museum/sites/expedition/hanging-in-the-balance-2/', 'R1', 'A1'),
        Source('Avoirdupois — Wikipedia', 'https://en.wikipedia.org/wiki/Avoirdupois', 'R2', 'A1'),
        Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
        Source('Mina (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Mina_(unit)', 'R2', 'A1'),
        Source('Cubical Weights — Harappa.com', 'https://www.harappa.com/blog/cubical-weights', 'R1', 'A2'),
        Source('Legume Seeds for Weighing Gold in India — ResearchGate', 'https://www.researchgate.net/publication/344088688', 'R1', 'A2'),
      ];
    case UnitCategory.time:
      return [
        Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
        Source('Hour — Wikipedia', 'https://en.wikipedia.org/wiki/Hour', 'R2', 'A1'),
        Source('Minute — Wikipedia', 'https://en.wikipedia.org/wiki/Minute', 'R2', 'A1'),
        Source('Decimal time — Wikipedia', 'https://en.wikipedia.org/wiki/Decimal_time', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A3'),
        Source('Telling Time in Ancient Egypt — Metropolitan Museum of Art', 'https://www.metmuseum.org/essays/telling-time-in-ancient-egypt', 'R1', 'A3'),
      ];
    case UnitCategory.angle:
      return [
        Source('Babylonian mathematics — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/', 'R1', 'A1'),
        Source('Why did the Babylonians use 360 degrees? — UNLV', 'https://www.physics.unlv.edu/~jeffery/astro/babylon/babylonian_360_degrees.html', 'R1', 'A1'),
        Source('Hipparchus — MacTutor', 'https://mathshistory.st-andrews.ac.uk/Biographies/Hipparchus/', 'R1', 'A1'),
        Source('Angles in the SI: the radian as an independent unit — arXiv', 'https://arxiv.org/pdf/2101.01578', 'R1', 'A1'),
        Source('Decimal time — MacTutor', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Decimal_time/', 'R1', 'A1'),
      ];
    case UnitCategory.price:
      return [
        Source('£sd — Wikipedia', 'https://en.wikipedia.org/wiki/%C2%A3sd', 'R2', 'A1'),
        Source('Denarius — Wikipedia', 'https://en.wikipedia.org/wiki/Denarius', 'R2', 'A1'),
        Source('Shekel — Wikipedia', 'https://en.wikipedia.org/wiki/Shekel', 'R2', 'A1'),
        Source('Non-decimal currency — Wikipedia', 'https://en.wikipedia.org/wiki/Non-decimal_currency', 'R2', 'A1'),
        Source('Charon\'s obol — Wikipedia', 'https://en.wikipedia.org/wiki/Charon\'s_obol', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A2'),
      ];
    case UnitCategory.temp:
      return [
        Source('Kelvin: History — NIST', 'https://www.nist.gov/si-redefinition/kelvin/kelvin-history', 'R1', 'A1'),
        Source('Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Fahrenheit', 'R2', 'A1'),
        Source('Daniel Gabriel Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Daniel_Gabriel_Fahrenheit', 'R2', 'A1'),
        Source('Réaumur scale — Wikipedia', 'https://en.wikipedia.org/wiki/R%C3%A9aumur_scale', 'R2', 'A1'),
        Source('Thermodynamic temperature — Wikipedia', 'https://en.wikipedia.org/wiki/Thermodynamic_temperature', 'R2', 'A1'),
        Source('Rankine scale — Wikipedia', 'https://en.wikipedia.org/wiki/Rankine_scale', 'R2', 'A1'),
      ];
    default:
      return const [];
  }
}
