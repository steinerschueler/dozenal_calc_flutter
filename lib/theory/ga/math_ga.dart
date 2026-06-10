part of '../math_theory.dart';

List<ProseChapter> _mathChaptersGa() => const [
  ProseChapter(
    'Roinnteoirí, codáin agus tréimhsí',
    [
      ProseSection(
        'Cén fáth a bhfuil a Dó Dhéag chomh hinroinnte',
        'I mBonn a Dó Dhéag scríobhaimid dhá dhigit déag: 0 go 9, mar aon le A do '
            'Dheich agus B do Aon Déag. Ciallaíonn „10" anseo mar sin a Dó Dhéag.\n\n'
            'Is féidir a Dó Dhéag a roinnt go glan ar líon an-mhór uimhreacha: 1, '
            '2, 3, 4, 6 agus 12. Níl a Deich inroinnte ach ar 1, 2, 5 agus 10. Tá '
            'an chúis i ndéanamh na n-uimhreacha: is é a Deich dhá uair a cúig, is '
            'é a Dó Dhéag dhá uair dhá uair a trí. Cuireann a Dó Dhéag a chuid '
            'bunchlocha sna roinnteoirí beaga coitianta 2 agus 3 — agus dá bharr '
            'sin tá sé inroinnte ar 3 agus ar 4, rud a theipeann ar a Deich. Ní '
            'hé an mhéid is tábhachtaí: tá an 16 níos mó, ach níl sé inroinnte ach '
            'ar chumhachtaí de dhó.',
      ),
      ProseSection(
        'Cé na codáin a thagann amach go glan',
        'Cé acu an dtugann codán uimhir dheachúil chríochnaitheach nó nach '
            'dtugann, braitheann sé ar riail shimplí: tagann sé amach go glan go '
            'beacht nuair nach bhfuil san ainmneoir ach príomhfhachtóirí an '
            'bhoinn.\n\n'
            'Toisc go bhfuil a Trí istigh sa Dó Dhéag, tagann go leor codán '
            'laethúil amach go glan i mBonn a Dó Dhéag: leath = 0,6; trian = 0,4; '
            'ceathrú = 0,3; séú = 0,2; naoú = 0,14; an dóú cuid déag = 0,1. I '
            'mBonn a Deich, áfach, ritheann trian, séú agus naoú gan chríoch. '
            'Praghas an Dó Dhéag: bíonn codáin a bhfuil a Cúig san ainmneoir acu '
            'cam — is é cúigiú i mBonn a Dó Dhéag 0,2497, le hathrá.',
      ),
      ProseSection(
        'Nuair a athraítear é',
        'Mura dtagann codán amach go glan, athraítear grúpa seasta digití ó '
            'phointe áirithe ar aghaidh — an tréimhse. Leanann a fad riail '
            'shoiléir de chuid theoiric na n-uimhreacha agus braitheann sé ar an '
            'mbonn agus ar an ainmneoir.\n\n'
            'Tá rudaí áirithe chomh hachrannach céanna sa dá shaol: tá tréimhse '
            'sé dhigit ag seachtú i mBonn a Deich (0,142857) díreach mar atá i '
            'mBonn a Dó Dhéag (0,186A35). San iomlán tá beagáinín níos lú codán '
            'tréimhsiúil ann i measc na n-ainmneoirí beaga i mBonn a Dó Dhéag ná '
            'i mBonn a Deich — ach is féidir leis na tréimhsí, nuair a tharlaíonn '
            'siad, a bheith beagáinín níos faide.',
      ),
      ProseSection(
        'Inroinnteacht ar an toirt',
        'Go praiticiúil léirítear neart an Dó Dhéag sna rialacha '
            'inroinnteachta. An bhfuil uimhir inroinnte ar 2, 3, 4 nó 6, nochtann '
            'an digit deiridh é cheana i mBonn a Dó Dhéag. I mBonn a Deich ní '
            'oibríonn sé sin ach do 2, 5 agus 10.\n\n'
            'Don Aon Déag (B) tá riail suim-na-ndigití ann — díreach mar an '
            'tástáil aitheanta ar a naoi i mBonn a Deich, toisc go bhfuil a Dó '
            'Dhéag aon thar a hAon Déag. Níl ag a Seacht amháin, mar atá i mBonn '
            'a Deich freisin, aon tástáil shimplí.',
      ),
      ProseSection(
        'Ní bhuann aon bhonn i ngach áit',
        'Tá buntáiste fíor mar sin ag a Dó Dhéag agus tú ag roinnt ina dtrí agus '
            'ina cheathrú — agus míbhuntáiste fíor agus tú ag roinnt ina chúig, '
            'rud atá tábhachtach do chéatadáin agus d\'airgead. Malartaíonn sé '
            'ceann amháin ar an gceann eile.\n\n'
            'Ní hionann níos mó roinnteoirí agus níos fearr gan teorainn ach an '
            'oiread: mura mbeadh, bheadh buntáiste ag a Seasca, atá inroinnte ar '
            'fós níos mó uimhreacha — ach theastódh seasca digit uaidh agus tábla '
            'iolraithe ollmhór. Feiceann na cumainn dhuodaiseimeacha a Dó Dhéag '
            'mar bhealach maith meánach: gan ach dhá chomhartha sa bhreis, tábla '
            'iolraithe beag, ach na roinnteoirí 2, 3 agus 4. Sin a meá siúd, ní '
            'cruthúnas é.',
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
    'Uimhreacha Timthriallach',
    [
      ProseSection(
        'An seachtú agus a ghaolta',
        'Ní thagann seachtú amach go glan i mBonn a Dó Dhéag, ach athraítear é: '
            'seachtú = 0,186A35, ansin 186A35 arís, gan stad. (Seasann A do Dheich, '
            'B d\'Aon Déag.) Is í an ghrúpa a athraítear an tréimhse; tá sí sé dhigit '
            'ar fhad anseo.\n\n'
            'Feictear an rud iontach nuair a leagtar na seachtaí eile taobh le taobh. '
            'Dhá sheachtú = 0,35186A, trí sheachtú = 0,5186A3, ceithre sheachtú = '
            '0,6A3518, cúig sheachtú = 0,86A351, sé sheachtú = 0,A35186. Na sé dhigit '
            'céanna sa tseicheamh céanna gach uair — ach tosaíonn an tsraith ag pointe '
            'difriúil. Is féidir iad a shamhlú ar fháinne, an fáinne á chasadh '
            'beagáinín ar gach codán.',
      ),
      ProseSection(
        'Nuair a rothaíonn na hiolruithe',
        'Tá an rothlú céanna i dtábla iolraithe na tréimhse í féin. Más glactar le '
            'seicheamh na ndigití 186A35 mar shlánuimhir agus iolraítear de réir a '
            'chéile í, ní thagann amach ach rothluithe: 186A35 × 2 = 35186A, × 3 = '
            '5186A3, × 4 = 6A3518, × 5 = 86A351, × 6 = A35186. Tugtar uimhir '
            'thimthriallach ar uimhir a bhfuil an t-airíonna seo aici.\n\n'
            'Dúnann an seachtú céim an ciorcal: 186A35 × 7 = BBBBBB. Aon Déag amháin '
            'ar fad — an digit is airde i mBonn a Dó Dhéag, sé huaire as a chéile. '
            'Ní coinchidéans é sin: is ionann BBBBBB agus an ionad cruinn eile lúide '
            'a haon. I mBonn a Deich aithníonn daoine an cleas céanna ón uimhir '
            'cháiliúil 142857 (tréimhse seachtú i gcóras an Deich): tugann na '
            'hiolruithe rothluithe ann freisin, agus 142857 × 7 = 999999. '
            'Na digití difriúil, an struchtúr mar a chéile.',
      ),
      ProseSection(
        'Cén fáth go díreach sé shuíomh',
        'Go bhfuil an tréimhse go díreach sé shuíomh ar fhad — agus níos lú — tá '
            'cúis shoiléir leis. Le linn roinnt scríofa fanann fuíoll tar éis gach '
            'céime, agus críochnaíonn an tréimhse chomh luath is a athraítear fuíoll. '
            'I gcás seachtú tagann na sé fhuíoll féideartha 1 go 6 go léir chun cinn '
            'as a chéile sula n-athraítear an chéad cheann. Níl níos mó ná sé '
            'fhuíoll éagsúla ag an tSeacht, mar sin is é sé an fad is faide '
            'is féidir.\n\n'
            'Tugtar uimhir lán-tréimhsiúil ar phríomhuimhir a shroicheann an '
            'tréimhse is faide féideartha seo lena cuid comhléimneach. Is iad sin '
            'amháin a ritheann trí gach rothlú, agus is iad amháin a chruthaíonn '
            'uimhir thimthriallach. Cé acu príomhuimhreacha atá lán-tréimhsiúil '
            'braitheann ar conas a iompar cumhachtaí an bhoinn — anseo a Dó Dhéag — '
            'agus iad á roinnt ar an bpríomhuimhir.',
      ),
      ProseSection(
        'An comhlánú go dtí an digit is airde',
        'Iompaíonn an tréimhse 186A35 patrún dara freisin. Má roinntear í ina lár '
            'agus suimítear na dhá leath, tagann 186 + A35 = BBB amach — Aon Déag '
            'arís, trí cinn an iarraidh seo. Comhlánaíonn an dá leath a chéile '
            'go dtí an digit is airde.\n\n'
            'Is tairiscint ghinearálta é sin (de réir Étienne Midy, 1836) agus '
            'bailíonn sé i ngach bonn: i mBonn a Deich is é 142 + 857 = 999. '
            'Léiríonn an éifeacht nach ábhar nua an dara leath den tréimhse, '
            'ach scáthán na chéad leath.',
      ),
      ProseSection(
        'Ní ghlacann gach príomhuimhir páirt',
        'Is eisceacht í an rothlú álainn, ní riail. I mBonn a Dó Dhéag ní '
            'thaispeánann aon chuid déag ach an tréimhse 0,1 — aon a haon amháin '
            'ag athrá, toisc go bhfuil a Dó Dhéag aon thar Aon Déag (an malairt '
            'ar naontú = 0,1 i gcóras an Deich). Tugann tríú cuid déag 0,0B '
            'leis an tréimhse ghearr 0B. Ní chruthaíonn príomhuimhreacha den sórt '
            'sin uimhir thimthriallach.\n\n'
            'I measc na bpríomhuimhreacha beaga is iad 5, 7, 17, 31, 41 agus '
            '43 (comhairte go deachúlach) na huimhreacha lán-tréimhsiúla i mBonn '
            'a Dó Dhéag — iad go léir, is suntasach sin, le críochdigit 5 nó 7 i '
            'mBonn a Dó Dhéag. Is riachtanas ach ní dóthain sin: críochnaíonn '
            'naoi déag ar 7 freisin, ach níl ach tréimhse sé shuíomh aige. '
            'Imríonn an t-athrú boinn ról freisin: tá an Cúig lán-tréimhsiúil '
            'i mBonn a Dó Dhéag (cúigiú = 0,2497, tréimhse 2497), agus sa '
            'Deich tagann cúigiú amach go glan. Mar sin baineann na príomhuimhreacha '
            'a ghlacann páirt leis an mbeirte bonn agus príomhuimhir, ní leis an '
            'bpríomhuimhir amháin.',
      ),
      ProseSection(
        'Cé mhéad a bhfuil ann — ceist oscailte',
        'D\'fhéadfaí ceapadh go mbeadh airíonna chomh soiléir sin comhairte le '
            'fada. Níl. Cé mhéad uimhir lán-tréimhsiúil atá ann i mBonn a Dó Dhéag '
            '— cé acu an bhfuil a líon éigríochta — níl sé cruthaithe go dtí seo.\n\n'
            'Tuar ó Emil Artin ón mbliain 1927 deir go bhfuil thart ar '
            'tríocha is seacht as céad príomhuimhreacha lán-tréimhsiúil, i mBonn '
            'a Dó Dhéag chomh maith le haon bhonn oiriúnach eile. Oireann an '
            'breathnóireacht ar uimhreacha beaga don mhéid seo. Ach is tuar é '
            'an tuar: d\'ainneoin dua mhór ní cruthaithe é d\'aon bhonn amháin. '
            'Baineann sé seo leis an gcur i láthair macánta — patrún simplí ar '
            'chosúlacht, ach fadhb oscailte ina bhun go dtí an lá inniu.',
      ),
      ProseSection(
        'A thriail san áireamhán',
        'Is féidir é seo go léir a sheiceáil anseo. Nuair a chlóscríobhtar '
            'seachtú agus Comhionann, taispeánann an scáileán 0, le stríoc os '
            'cionn 186A35 — sé shuíomh na tréimhse. Le dhá sheachtú feictear an '
            'tsraith chéanna mar 35186A, rothlaithe; ní slánadh é sin, ach an '
            'patrún céanna go díreach. Taispeánann cúigiú an stríoc os cionn 2497, '
            'aon chuid déag os cionn an aon digit 1.\n\n'
            'Déanann samplaí níos mó na teorainneacha soiléir: tá tréimhse tríocha '
            'shuíomh ar codán le hainmneoir aon is tríocha (deachúlach) — giorrann '
            'an taispeáint le trí phointe, toisc nach oireann an méid go léir ar '
            'líne amháin. Conas a dhéanann an t-áireamhán amach codáin bheachta agus '
            'a dtréimhsí, tá sin sa chaibidil "Conas a ríomhann an t-áireamhán seo".',
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
    'Inroinnteacht agus Tástáil an Aon Déag',
    [
      ProseSection(
        'Nochtann an digit deiridh mórán',
        'I mBonn a Dó Dhéag níl sa digit deiridh d\'uimhir ach a fuíoll á roinnt '
            'ar a dó dhéag. Mar sin feictear láithreach ón gcríochdigit an bhfuil '
            'uimhir inroinnte ar roinnteoirí an Dó Dhéag. Ciallaíonn críochdigití '
            'cothroim (0, 2, 4, 6, 8, A) inroinnteacht ar a dó. Más é an críochdigit '
            '0, 3, 6 nó 9, tá sé inroinnte ar a trí; ar 0, 4 nó 8, ar a ceathair; '
            'ar 0 nó 6, ar a sé; ar 0 amháin, ar a dó dhéag. '
            '(Seasann A anseo do dheich.)\n\n'
            'Is buntáiste láidir é sin don Dó Dhéag. I gcóras an Deich ní '
            'nochtann an críochdigit ach inroinnteacht ar a dó, a cúig agus a deich '
            '— le haghaidh a trí, a ceathair nó a sé caithfear ríomh. Leagann an '
            'Dó Dhéag na roinnteoirí beaga coitianta nochta go díreach.',
      ),
      ProseSection(
        'Tástáil an Aon Déag: comhairíonn an tsuim-dhigití',
        'Ní cabhraíonn an críochdigit don Aon Déag (B), ach tá greim chomh '
            'héasca céanna: an tsuim-dhigití, is é sin suim na ndigití go léir. '
            'I mBonn a Dó Dhéag tá uimhir inroinnte ar aon déag go díreach nuair '
            'is inroinnte a suim-dhigití ar aon déag. Tá an chúis álainn: fágann '
            'a Dó Dhéag fuíoll a haon agus é á roinnt ar aon déag, agus mar an '
            'gcéanna gach ionad níos airde — mar sin is cuma ach cad a thugann '
            'na digití le chéile.\n\n'
            'Sin comhpháirt chruinn na tástála aitheanta ar a naoi i gcóras an '
            'Deich, inar seiceálann an tsuim-dhigití an Naoi. I mBonn a Dó Dhéag '
            'seiceálann sí Aon Déag — agus sin an fáth ar tugadh Tástáil an Aon '
            'Déag uirthi. Sampla: tá an tsuim-dhigití ag 4B7 ná 4 + B + 7, sin '
            'ceathair déag móide ocht, is é sin dhá is fiche — agus dhá oiread '
            'aon déag é dhá is fiche, mar sin tá 4B7 inroinnte ar aon déag. '
            'Mar an tástáil ar a naoi, feidhmíonn Tástáil an Aon Déag mar '
            'sheiceáil ríomha thapa: mura n-éiríonn leis an tástáil, tá earráid '
            'sa toradh.',
      ),
      ProseSection(
        'An tríú déag ag an tsuim-dhigití mhalartach',
        'Glacann tástáil eile leis an tríú déag. Comhairíonn na digití '
            'malartach móide agus lúide, ag tosú ar dheis — an tsuim-dhigití '
            'mhalartach. Más inroinnte é sin ar tríú déag, tá an uimhir féin '
            'inroinnte. Is scáthán é sin ar thástáil an Aon Déag: luíonn a Dó '
            'Dhéag aon faoi bhun an tríú déag, mar sin athraíonn na hionaid '
            'comhartha agus iad á roinnt ar an tríú déag.\n\n'
            'Seans go meabhraítear d\'daoine atá cleachta le córas an Deich: ann '
            'sin is ionann "Tástáil an Aon Déag" agus an leagan malartach, toisc '
            'go bhfuil an Aon Déag aon os cionn a deich. I mBonn a Dó Dhéag '
            'tá na róil iompaithe — is leis an Aon Déag an tsuim-dhigití shimplí, '
            'agus leis an tríú déag an ceann malartach. (Scríobhtar an tríú déag '
            'féin i mBonn a Dó Dhéag mar 11, dosaen amháin agus aon amháin; is '
            'é a luach i gcónaí atá i gceist.)',
      ),
      ProseSection(
        'Cá mbíonn an Dó Dhéag i gcruachás',
        'Ní ganntanas saor in aisce aon bhuntáiste. Ní roinneann an Cúig ná '
            'an tSeacht aon fhachtóir leis an Dó Dhéag agus ní oireann siad don '
            'Aon Déag ná don tríú déag ach an oiread — níl riail áisiúil '
            'críochdigite nó suim-dhigití ann dóibh i mBonn a Dó Dhéag. Go '
            'díreach an Cúig, ar a bhfuil an tástáil is simplí i gcóras an Deich '
            '(críochdigit náid nó cúig), éiríonn achrannach anseo.\n\n'
            'Sin an malartú macánta: bronann an Dó Dhéag orainn na tástálacha '
            'éasca le haghaidh a trí, a ceathair agus a sé agus baineann uainn '
            'tástáil éasca an Cúig. Cé acu taobh is troime braitheann ar cé na '
            'roinnteoirí is minice a theastaíonn sa ghnáthshaol — agus is gnách '
            'gurb iad sin na cinn bheaga.',
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
    'Cleasanna sa Tábla Iolraithe',
    [
      ProseSection(
        'Sraitheanna le heireaball gearr',
        'Tá dhá shraith déag i dtábla iolraithe an Dó Dhéag, agus foghlaimítear '
            'cuid acu beagnach leo féin — is iad sin sraitheanna na roinnteoirí. '
            'Críochnaíonn a n-iolruithe ar phatrúin ghearr a athraítear. '
            'Críochnaíonn an tsraith sé malartach ar 6 agus 0 (6, 10, 16, 20, '
            '26, 30 …). Ritheann an tsraith ceathair mar 4, 8, 0, 4, 8, 0; '
            'ritheann an tsraith trí mar 3, 6, 9, 0 agus ar ais; fanann an '
            'tsraith dhó i gcónaí cothrom.\n\n'
            'Tá dhá bheart go háirithe áisiúil. Is ionann iolrú le Dó Dhéag '
            'agus náid a chur leis: is é seacht uair a dó dhéag 70. Agus is '
            'leath na sraithe Dó Dhéag an tsraith sé — críochnaíonn sé uair '
            'uimhir chothrom ar 0, sé uair uimhir neamhchothrom ar 6.',
      ),
      ProseSection(
        'Sraith an Aon Déag mar scáthán',
        'Is le sraith an Aon Déag (B) an patrún is gleoite: B, 1A, 29, 38, 47, '
            '56, 65, 74, 83, 92, A1, B0. Tá dhá phatrún inti. Dreapann an digit '
            'tosaigh céim ar chéim in airde — 0, 1, 2, 3 agus mar sin de —, '
            'agus ag an gcomhchéim titim siar an ceann deiridh. Agus i ngach '
            'toradh suimíonn an dá dhigit go dtí aon déag: a haon agus a deich, '
            'a dhó agus a naoi, a trí agus a hocht.\n\n'
            'Sin go díreach scáthán shraith na naoi ó chóras an Deich, inar '
            'gcomhlánaíonn na digití go naoi. As sin leanas cleas áisiúil: '
            'in ionad iolrú le haon déag, glactar le dó dhéag agus déantar '
            'an uimhir a bhaint uair amháin. Mar sin is é aon déag uair a seacht '
            'seachtó lúide seacht, sin 65 i mBonn a Dó Dhéag — agus go deimhin '
            'tá 65 sa tábla ar aon déag uair a seacht.',
      ),
      ProseSection(
        'Na sraitheanna stuacánta: Cúig agus Seacht',
        'Níl gach sraith chomh caoithiúil sin. Ní roinneann an Cúig ná an '
            'tSeacht aon fhachtóir leis an Dó Dhéag, agus ritheann a sraitheanna '
            'mar sin trí na dhá chríochdigit déag go léir sula n-athraíonn '
            'aon rud — gan timthriall gearr a chuideodh le foghlaim. '
            'Críochnaíonn sraith na cúig as a chéile ar 5, A, 3, 8, 1, 6, B, '
            '4, 9, 2, 7, 0; tá an tSeacht cosúil le preabadh.\n\n'
            'Filleann seanchiathairim annseo: go díreach sraitheanna a haon, '
            'a cúig, a seacht agus Aon Déag ritheann na críochdigití go léir '
            'go hiomlán — an ceathairréad céanna a ghineann an timthriall iomlán '
            'ar chloc na n-uaireanta agus a chríochnaíonn ar phríomhuimhreacha. '
            'Agus go díreach dá bharr tá tréimhsí fada, iomlána ag cúigiú agus '
            'seachtú ón gcaibidil ar uimhreacha timthriallach. I gcóras an Deich '
            'is í sraith na seacht an cheann is achrannach go hiomráiteach; '
            'i mBonn a Dó Dhéag is iad an Cúig agus an tSeacht le chéile.',
      ),
      ProseSection(
        'Cearnóga agus an Grós',
        'Ag dul ar aghaidh ar fiar ó uachtar ar chlé go bun ar dheis, tá na '
            'huimhreacha cearnógacha ann: 1, 4, 9, 14, 21, 30, 41, 54, 69, 84, '
            'A1 — agus ar deireadh 100. Is ionann an ceann deireanach agus a dó '
            'dhéag uair a dó dhéag, sin céad is daichead a ceathair, a scríobhtar '
            'go néata mar "100" i mBonn a Dó Dhéag agus a thugtar an Grós air le '
            'fada. Scríobhann an Dó Dhéag a huimhir chearnóige féin chomh cruinn '
            'leis an gcéad i gcóras an Deich.\n\n'
            'Titeann dúbailt agus leathú go héasca freisin i mBonn a Dó Dhéag, '
            'toisc go bhfuil a dó dhéag cothrom agus inroinnte ar a ceathair: '
            'is é leath 10 ná 6, leath 6 ná 3, leath 3 ná 1,6. Ar an gcaoi sin '
            'is féidir mórán a bhriseadh i gceann ina gcéimeanna beaga, glanmhara '
            'sa cheann — sin an fáth fíor inar aimsíonn cairde an Dó Dhéag '
            'an ríomh léi taitneamhach.',
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
    'Na boinn uimhreacha i gcomparáid',
    [
      ProseSection(
        'Cad is bonn ann',
        'Tugann córas suíomhluacha luach do gach digit de réir a shuímh. '
            'Insíonn an bonn cé mhéad digit atá ann agus cén fachtóir a fhásann '
            'gach ionad. Úsáideann Bonn a Deich deich ndigit, Bonn a Dó Dhéag a '
            'dó dhéag (0–9, A, B), Bonn a Dó dhá cheann amháin (0 agus 1).\n\n'
            'Breathnaíonn an uimhir chéanna difriúil de réir an bhoinn, ach is é '
            'an rud céanna a chiallaíonn sé. Teastaíonn go leor ionad ó bhonn '
            'beag (éiríonn an dénártha an-fhada), agus go leor comharthaí '
            'difriúla ó bhonn mór.',
      ),
      ProseSection(
        'Sé bhonn faoi sheoid',
        '• Bonn 2 (dénártha): teanga na ríomhairí — tá lasc air nó as.\n'
            '• Bonn 8 (ochtnártha): nideoga inniu, mar shampla do chearta comhad '
            'faoi Unix.\n'
            '• Bonn 10 (deachúlach): ár saol laethúil agus an córas méadrach.\n'
            '• Bonn 12 (duodaiseimeach): dosaen, clog agus orlach — agus ábhar '
            'imní ghluaiseacht an Dó Dhéag.\n'
            '• Bonn 16 (heicseadaiseimeach): nodaireacht dhlúth do shonraí '
            'ríomhaire.\n'
            '• Bonn 60 (seascaiseimeach): am agus uillinn, oidhreacht na Bablóine.',
      ),
      ProseSection(
        'Tiontú idir na boinn',
        'Bogann uimhreacha de réir nósanna imeachta seasta ó bhonn amháin go '
            'bonn eile. An chuid iomlán, roinneann tú arís agus arís í ar an '
            'sprioc-bhonn agus léann tú na fuíll ó bhun go barr. An chuid '
            'dheachúlach, iolraíonn tú arís agus arís í faoin sprioc-bhonn agus '
            'léann tú na codanna iomlána ó bharr go bun.\n\n'
            'Sampla: éiríonn 0,5 ina 0,6 i mBonn a Dó Dhéag; éiríonn 0,125 ina '
            '0,16. Idir boinn ghaolmhara tá sé níos éasca fós: toisc gur cumhacht '
            'de dhó é a Sé Déag, freagraíonn digit heicse go díreach do cheithre '
            'ionad dhénártha — ní gá ach grúpáil a dhéanamh.',
      ),
      ProseSection(
        'Cén áit ina bhfuil baile ag gach bonn',
        'Ríomhann ríomhairí go dénártha, toisc nach n-aithníonn trasraitheoir ach '
            'dhá staid. Is é heicseadaiseimeach an ghiorrúchán áisiúil dó sin — '
            'tá sé i seoltaí cuimhne, i ndathanna gréasáin ar nós #FF00FF agus in '
            'uimhreacha Unicode. Leanann am agus uillinn an Seasca: seasca '
            'nóiméad, 360 céim, inroinnte go héasca ina dtrí agus ina cheathrú. '
            'Ritheann an saol laethúil agus beagnach an eolaíocht iomlán go '
            'deachúlach — go háirithe as nós agus toisc go bhfuil an córas '
            'méadrach tógtha air sin.\n\n'
            'Maireann a Dó Dhéag ar aghaidh i ndosaen, i ngrós, i gclog agus in '
            'orlach. Ón 18ú haois ar aghaidh bhí lucht tacaíochta ann do ríomh '
            'fíor-dhuodaiseimeach — ó Buffon trí Isaac Pitman go Frank Emerson '
            'Andrews, a scríobh an chéad leabhar faoi in 1935. Coinníonn cumainn '
            'dá gcuid féin an smaoineamh beo go dtí an lá inniu; tuilleadh faoi '
            'sin sa bhloc „An Cumann Duodaiseimeach".',
      ),
      ProseSection(
        'Níl aon bhonn ar fearr é i ngach áit',
        'Tá a chuspóir féin ag gach bonn. Níl a Dó agus a Sé Déag „níos fearr do '
            'dhaoine", ach idéalach do mheaisíní. Tá a Deich teann agus '
            'daingnithe go domhain. Roinneann a Dó Dhéag go deas ina dtrí agus '
            'ina cheathrú, ach cailleann sé ag an gcúigiú. Roinneann a Seasca is '
            'fearr ar fad, ach le seasca comhartha tá sé rómhór don saol '
            'laethúil.\n\n'
            'Le córais tomhais is lú a chuntasaíonn ar deireadh an bonn é féin ná '
            'an chomhsheasmhacht lena bhfantar ar bhonn aonair amháin: buann an '
            'córas méadrach toisc go ritheann gach rud ar an a Deich chéanna — ní '
            'bheadh an buntáiste sin ag córas measctha de mhíle, slat, troigh '
            'agus orlach in aon bhonn.',
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
    'Stair ghairid na gcóras suíomhluacha',
    [
      ProseSection(
        'Roimh an suíomhluach',
        'Le fada scríobhadh daoine uimhreacha trí chomharthaí a shuimiú le '
            'chéile. Is córas den sórt sin iad na huimhreacha Rómhánacha: '
            'ciallaíonn XVII deich móide a cúig móide a haon móide a haon. Tá sé '
            'sin go maith le léamh, ach maslach le ríomh, agus éiríonn uimhreacha '
            'móra achrannach.\n\n'
            'Ba é an córas suíomhluacha an léim mhór: ciallaíonn an digit céanna '
            'rud difriúil de réir a shuímh. Sin amháin a fhágann go bhfuil ríomh '
            'scríofa le huimhreacha chomh mór agus is mian leat éasca — agus '
            'éilíonn sé digit do „faic san ionad seo": an náid.',
      ),
      ProseSection(
        'An Bhablóin agus an Seasca',
        'Tháinig an chéad chóras suíomhluacha fíor chun cinn ag na Súiméirigh '
            'agus na Bablónaigh, breis is ceithre mhíle bliain ó shin, ar Bhonn a '
            'Seasca. Meastar gurb é an éacht matamaiticiúil is mó acu é.\n\n'
            'Ní raibh náid iomlán acu fós, áfach: bhí comhartha sealbhóra ionaid '
            'ar eolas acu d\'ionaid fholmha sa lár, ach riamh ag deireadh '
            'uimhreach. Gabhann a n-oidhreacht linn go dtí an lá inniu — i seasca '
            'nóiméad na huaire agus i 360 céim an chiorcail.',
      ),
      ProseSection(
        'Aireagán Indiach na náide',
        'Tagann córas na ndeicheanna an lae inniu leis an náid ón India. Bhain '
            'Aryabhata úsáid as an scríbhneoireacht shuíomhluacha sa 5ú haois; '
            'phléigh Brahmagupta in 628 an náid den chéad uair mar uimhir aici '
            'féin le rialacha ríofa dá cuid féin, ní amháin mar bhearna.\n\n'
            'Uaidh sin ghlac scoláirí Arabacha agus Peirseacha leis — scríobh '
            'al-Khwarizmi faoi thart ar 825 —, agus tríothu sin tháinig sé go dtí '
            'an Eoraip. Sin an fáth a dtugtar „uimhreacha Arabacha" ar ár '
            'ndigití go dtí an lá inniu, cé gur ón India a thagann an smaoineamh.',
      ),
      ProseSection(
        'Boinn na meaisíní',
        'Leis na meaisíní ríofa tháinig boinn nua. D\'fhoilsigh Gottfried Wilhelm '
            'Leibniz in 1703 an córas dénártha nach raibh ann ach 0 agus 1 — '
            'chonaic sé fiú na sean-heicseagraim de chuid an I Ching Síneach ann '
            'arís.\n\n'
            'Inniu ríomhann ríomhairí go dénártha, ach scríobhann siad é den '
            'chuid is mó go heicseadaiseimeach: leis an mbeart 8-ngiotán de chuid '
            'an IBM System/360 sna 1960idí tháinig Bonn a Sé Déag chun cinn, '
            'toisc go dtugann dhá dhigit heicse beart amháin go díreach. Fuair '
            'gach bonn a áit mar sin — ní toisc gurbh é „an ceann is fearr" é, '
            'ach toisc go n-oireann sé dá thasc.',
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
  ProseChapter('Conas a ríomhann an t-áireamhán seo', [
    ProseSection(
      'Dhá áireamhán in aon cheann',
      'Nuair a bhrúnn tú an eochair chothroime, ní ríomhann an aip uair amháin, '
          'ach dhá uair — le dhá mheaisín an-difriúla.\n\n'
          'Is áireamhán codán beacht an chéad cheann. Ríomhann sé gan aon '
          'slánú, le huimhreacha iomlána chomh mór agus is mian leat. Is '
          'áireamhán deachúil gasta an dara ceann, mar atá ag beagnach gach '
          'áireamhán póca — ríomhann sé le cruinneas teoranta, ach le gach rud, '
          'le síneas, fréamh agus logartam san áireamh. Ritheann an dá cheann '
          'ag gach comhartha cothroime.',
    ),
    ProseSection(
      'An codán beacht',
      'Coinníonn an t-áireamhán codán uimhreacha mar chóimheas idir dhá uimhir '
          'iomlán. Fanann trian ina thrian i ndáiríre, ní 0,333… Ní '
          'thiontaíonn sé an codán ina ionaid dheachúlacha dhuodaiseimeacha go '
          'dtí an taispeáint.\n\n'
          'Agus é sin á dhéanamh aithníonn sé nuair a athraítear na hionaid '
          'dheachúlacha. Tá trian glan 0,4 i mBonn a Dó Dhéag. Ritheann '
          'cúigiú, áfach, go tréimhsiúil: 0,2497 2497 2497 … Taispeánann an aip '
          'é sin le stríoc os cionn an ghrúpa a athraítear agus le pointe a '
          'mharcálann tús na tréimhse. Mar sin fanann an toradh beacht, in '
          'ionad é a shlánú go ciúin.',
    ),
    ProseSection(
      'Nuair nach leor an codán',
      'Ní féidir ríomhanna áirithe a scríobh mar chodán. Chomh luath agus a '
          'thagann síneas, fréamh, logartam nó feidhm den sórt sin chun cinn — '
          'nó a roinntear ar náid —, géilleann an t-áireamhán codán.\n\n'
          'Ansin léimeann an t-áireamhán deachúil isteach. Níl a thoradh ach '
          'neasach, agus dá bhrí sin cuireann an aip comhartha „≈" roimhe: '
          '„timpeall". Má oibríonn an dá bhealach, buann an codán beacht i '
          'gcónaí. Ní thagann an „≈" chun cinn mar sin ach san áit a bhfuil '
          'fíor-neas riachtanach.',
    ),
    ProseSection(
      'Tréimhsí fada agus an taispeáint',
      'Is féidir le torthaí beachta éirí an-fhada. Tá tréimhsí de bhreis is '
          'céad ionad ag codáin áirithe — i bhfad níos mó ná mar a oireann ar '
          'líne amháin.\n\n'
          'Ionas nach rithfidh aon rud thar an taispeáint, fágann an aip ón '
          'taobh deas as an oiread sin de na hionaid is faide siar (is ísle '
          'luach) go dtí go n-oireann an chuid eile sa líne, agus cuireann sí '
          '„…" mar chomhartha go bhfuil tuilleadh ann fós. Giorraítear marc na '
          'tréimhse go néata in éineacht leis sin. Fanann an uimhir macánta mar '
          'sin: an méid atá gearrtha, taispeántar go feiceálach é, ní '
          'cheiltear é.',
    ),
  ]),
  ProseChapter(
    'Fibonacci, Uimhreacha Cearnógacha agus Corais',
    [
      ProseSection(
        '144 — áit a gcasann dhá dhomhan',
        'Tosaíonn sraith Fibonacci le 1, 1, agus is é gach uimhir eile '
            'suim an dá cheann roimhe: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, '
            '89, 144, … Fásann sí go heaspónantúil — éiríonn na baill '
            'an-mhór go tapa. Fásann na huimhreacha cearnógacha 1, 4, 9, '
            '16, 25, 36, … ar bhealach cearnógach amháin, i bhfad níos '
            'moille. Is beag cúis atá le dhá shraith ag fás chomh '
            'difriúil lena chéile casadh ar a chéile riamh.\n\n'
            'Agus casann siad: is é an dóú uimhir Fibonacci déag 144, agus '
            'is uimhir chearnógach í 144 = 12². Scríobhaimid an ball seo '
            'go gearr mar F₁₂ = 144. I mBonn 12 is é 144 "100" freisin, '
            'an chéad uimhir thrí-shuíomh, agus sa trádáil an ghrós — '
            'dosaen dosaen. Titid trí airíonna isteach in uimhir amháin '
            'anseo.\n\n'
            'Gur tarlú aonuaire, ní coinchidéans amháin é seo, chruthaigh '
            'J. H. E. Cohn in 1964: seachas 0, 1 agus 144 níl aon uimhir '
            'eile sa tsraith Fibonacci iomlán éigríochta ar uimhir '
            'chearnógach í freisin. Tá an cruthúnas bunúsach ach ní '
            'simplí; úsáideann sé an tsraith Lucas atá dlúth-ghaolmhar '
            'agus argóintí in-roinnte. Seasann an dó dhéag mar sin ag '
            'crosbhóthar cruthaithe, aonuaire de dhá shraith uimhreacha '
            'bunúsacha — cáilíocht, ní misticism.\n\n'
            'Téann tairiscint níos láidre ó 2006 (Bugeaud, Mignotte agus '
            'Siksek) níos faide: is iad 0, 1, 8 = 2³ agus 144 = 12² na '
            'cumhachtaí iomlána amháin sa tsraith Fibonacci ar chor ar bith. '
            'Is cás speisialta de sin ráiteas Cohn faoi na huimhreacha '
            'cearnógacha.',
      ),
      ProseSection(
        'An Cóimheas Órga',
        'Nuair a roinntear uimhir Fibonacci ar an gcéann roimpi, druidean '
            'na cóimheasa seo de réir a chéile le huimhir sheasta: an '
            'Cóimheas Órga φ = (1+√5)/2 ≈ 1.618. Go foirmiúil F(n+1)/F(n) '
            '→ φ. Thug Johannes Kepler faoi deara an druidim seo cheana '
            'in 1611. I mBonn 12 is é φ ≈ 1;74BB677…; iompraíonn an '
            't-áireamhán φ mar thairiseach sa réimse leathnaithe.\n\n'
            'Tá airíonna sainmhínithe simplí ag φ: φ² = φ + 1. Is í '
            'an t-aon uimhir dhearfach amháin í arb é a cearnóg díreach '
            '1 níos mó ná í féin. Nuair a chlóscríobhann tú φ² = san '
            'áireamhán, faigheann tú φ + 1 go díreach — feictear an '
            'chomhaoinseithe láithreach.\n\n'
            'In ainm na fírinne feictear φ sa dúlra san áit ina bhfásann '
            'duilleoga agus hataí timpeall ar an "uillinn órga"; is '
            'uimhreacha Fibonacci comharsanacha iad uimhreacha an chuar '
            'de lus na gréine nó buaircíní péine go minic. Ach ní '
            'sheasann a lán de na rudaí eile a chuirtear i leith φ an '
            'scrúdú: ní leanann cuach na Nautilus φ, agus ní chruthaithe '
            'é go bhfuarthas úsáid fheasach sa Parthenon nó i saothar da '
            'Vinci. Is fíor φ sa mhatamaitic agus i bhfoilleagán — '
            'ní chuile áit.',
      ),
      ProseSection(
        'An Dó Dhéag mar Uimhir Ilroinnte',
        'Aithníonn an teoiric uimhreacha roinnt bealaí cruinne chun uimhir '
            'a dhescríobh mar "ilroinnte" — agus feictear an dó dhéag i '
            'roinnt acu. Tá an dó dhéag ardchomhdhéanta: tá níos mó '
            'roinnteoirí aige ná aon uimhir níos lú. Is iad a roinnteoirí '
            '1, 2, 3, 4, 6, 12 — sé cinn; níl an líon sin ag uimhir ar bith '
            'faoi 12. D\'iniúch Srinivasa Ramanujan an rang seo in 1915 i '
            'bpáipéar cáiliúil i Proceedings an London Mathematical '
            'Society.\n\n'
            'Is í an dó dhéag freisin an uimhir fhlúirseach is lú: sáraíonn '
            'suim a fíorroinnteoirí, 1+2+3+4+6 = 16, an uimhir féin. '
            'I gcás uimhreacha níos lú tá a mhalairt — do 10 tugann '
            '1+2+5 = 8, níos lú ná 10. Is í an dó dhéag an chéad uimhir '
            'ina "dteachtann" na roinnteoirí thar maoil.\n\n'
            'Airíonna níos annamha: is uimhir shublaimte í an dó dhéag. '
            'Ciallaíonn sin go bhfuil dhá táscaire dá roinnteoirí iad '
            'féin ina n-uimhreacha foirfe. Is é 6 líon na roinnteoirí '
            '(agus is foirfe 6 = 1+2+3). Is é 1+2+3+4+6+12 = 28 '
            'suim na roinnteoirí uile (agus is foirfe freisin 28 = '
            '1+2+4+7+14). Go dtí inniu níl ach dhá uimhir shublaimte '
            'ar eolas — an dó dhéag agus uimhir 76-shuíomh. Tagann an '
            'téarma ó mhatamaitic fóillíochta áfach agus tá sé déanta '
            'go cúng; ní cruthúnas ar thábhacht chosmach a tearc, ach '
            'toradh sainmhínithe speisialta.',
      ),
      ProseSection(
        'Pirimid de Liathróidí Gunna Móir',
        'Má charnann tú liathróidí gunna móir i bpirimid le bun '
            'cearnógach, tá 1² + 2² + … + n² liathróid sa n-ú pirimid. '
            'Rinne Thomas Harriot an fhoirmle suime seo timpeall 1587 '
            'amach, nuair a bhí Sir Walter Raleigh ag iarraidh a fhios '
            'a bheith aige conas liathróidí carntha a chomhaireamh.\n\n'
            'Is ceisteanna níos deacra: cén uair atá pirimid den sórt '
            'sin ina chearnóg foirfe liathróidí ag an am céanna? Níl ach '
            'cás amháin neamhthriviálach ann, agus tá sé álainn: '
            '1² + 2² + … + 24² = 4900 = 70². Is féidir na 4900 liathróid '
            'céanna mar sin a leagan mar phirimid le 24 shraith nó mar '
            'chearnóg 70×70. Mheas Édouard Lucas in 1875 gurb í seo an '
            't-aon réiteach; níor cruthaíodh go hiomlán é ach in 1918 '
            'ag G. N. Watson — bhí an fhadhb deacair i ndáiríre.\n\n'
            'Is é 24 díreach dhá oiread 12. Is breathnóireacht bhreá é '
            'sin — ach go macánta ní cúis dhoiciméadaithe í: feictear 24 '
            'anseo toisc gur é sin an réiteach atá ag an gcomhcothromóid '
            'bhunúsach, ní mar gheall ar nasc le Bonn Dó Dhéag.',
      ),
      ProseSection(
        'Cathair Idéalach Phlatóin',
        'Ina "Dlíthe" (Leabhar V) fiafraíonn Platón cé mhéad saoránach '
            'ba chóir do chathair idéalach a bheith. A fhreagra: 5040. '
            'Ní misticiúil ach praiticiúil an argóint — caithfidh cathair '
            'a saoránaigh a roinnt go leanúnach ina ngrúpaí comhionanna, '
            'agus tá 5040 inroinnte ar gach uimhir ó 1 go 12, leis an '
            't-aon eisceacht 11. (Do na hinroinnte le 11 molann Platón dhá '
            'theaghlach a bhaint.)\n\n'
            'An rud a dhéanann Platón anseo cur síos ar, is é an léargas '
            'céanna atá mar bhunús an chórais dhóidéagaigh: sa ghnáthshaol '
            'is iad na roinnteoirí beaga na cinn thábhachtacha. Is é '
            '5040 = 7! deartháir mór na dó dhéag mar dhea — an '
            'fhealsúnacht in-roinnte chéanna, curtha i bhfeidhm ar '
            'dhaonra iomlán cathrach seachas ar chóras uimhreacha.',
      ),
      ProseSection(
        'Ní Neiméadáil í an Corais',
        'Iompraíonn an dó dhéag go leor lipéad ag an am céanna: '
            'ardchomhdhéanta, flúirseach, sublaimte, innéacs na '
            'huimhreach Fibonacci cearnóige neamhthriviála amháin. '
            'Feictear an carnú seo iontach — ach is sainmhíniú neamhspleách '
            'é gach airíonna. Ní cúis ná siombail uachtaraí é a '
            'gcomhtharlú. An rud a sheasann an dó dhéag amach i ndáiríre '
            'is é a bheith beag: is í an uimhir is lú í leis na hairíonna '
            'seo; tá níos mó roinnteoirí fiú ag uimhreacha níos mó '
            'cosúil le 24, 36 nó 60.\n\n'
            'Déantar earráid choitianta a ainmniú go soiléir: tugtar '
            '"uimhir fhoirfe" ar an dó dhéag go minic. Tá sé sin '
            'mícheart ó thaobh matamaitice. Ciallaíonn foirfe: tugann '
            'suim na bhfíorroinnteoirí an uimhir féin — mar atá le 6 '
            '(1+2+3) nó le 28 (1+2+4+7+14). Le haghaidh an dó dhéag '
            'tugann na fíorroinnteoirí 16, níos mó ná 12. Is flúirseach '
            'an dó dhéag, ní foirfe. Tagann an meascadh ó Nicomachus '
            'Gerasa (thart ar 100 AD), a cheangail na ranganna uimhreacha '
            'seo le luachálacha morálta — léirmhíniú na sean-aimsire, '
            'ní matamaitic.\n\n'
            'Luíonn luach an chaibidil seo go díreach san idirdhealú: '
            'tá tairiscint Cohn, comhaoinseithe na liathróidí gunna móir '
            'agus an uimhir fhlúirseach is lú ina gfíricí cruthaithe. '
            'Is fiú iad a fheiceáil mar an méid is ea iad — matamaitic '
            'álainn, mhacánta, nach dteastaíonn luchtú misticiúil uaithi.',
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
    'An Clog mar Ghrúpa (ℤ/12ℤ)',
    [
      ProseSection(
        'Ríomh mar a dhéanann an aghaidh cloig',
        'Ar an gclog ní thugann a haon déag a chlog móide dhá uair an chloig '
            'trí déag, ach a haon a chlog. Ríomhtar go gnách agus glactar ar '
            'deireadh leis an bhfuíoll á roinnt ar a dó dhéag. Íomhánach, '
            'caitear an líne uimhreacha gan teorainn ar chiorcal le dhá mharc '
            'dhéag; tuirlingíonn gach uimhir ar cheann amháin de na marcanna '
            '0 go 11.\n\n'
            'Cruthaíonn na dhá mharc dhéag seo lena suimíocht uaireanta '
            'córas ríomha beag néata. Fanann sé dúnta i gcónaí (tá gach suim '
            'ina marc den dó dhéag arís), tá an náid ann mar "ní athraíonn '
            'aon rud", agus tá cosán ar ais do gach céim: cuireann cúig ar '
            'aghaidh seacht ar ais ina chothromaíocht, mar is ionann 5 + 7 = '
            '12 = 0. Tugtar grúpa ar chóras ríomha leis na hairíonna seo sa '
            'mhatamaitic. Is é aghaidh an chloig an sampla is soiléire dá '
            'bhfuil ann; is é a ainm ℤ/12ℤ, ráite "Z modulo a dó dhéag".',
      ),
      ProseSection(
        'Cé na coiscéimeanna a bhuaileann na páirceanna go léir',
        'Ag dul i gcéimeanna a haon timpeall an chiorcail, buailtear gach '
            'ceann de na dhá mharc dhéag as a chéile sula bhfilltear ar '
            'dtús. Ach ní éiríonn le gach coiscéim é sin. Ag léim trí '
            'chuid cúig i gcónaí, tuirlingítear ar 0, 3, 6, 9 amháin agus '
            'tar éis ceithre léim táthar ar ais — fágtar ocht bpáirc gan '
            'bhaint leo. Ag léim trí cheithre cinn, buailtear 0, 4, 8 '
            'amháin.\n\n'
            'Baineann coiscéim le dhá mharc dhéag go léir go díreach nuair '
            'nach bhfuil roinnteoirí coiteanna aige leis an Dó Dhéag. '
            'Baineann sin le ceithre choiscéim: 1, 5, 7 agus B (= aon '
            'déag). Go díreach ceithre cinn — ní coinchidéans é sin, ach '
            'tomhas comhairthe den Dó Dhéag a chasfar linn arís dhá uair '
            'eile. Is iad sin na ceithre "choiscéim mhaithe" a ghineann '
            'an ciorcal iomlán.',
      ),
      ProseSection(
        'Na fohghrúpaí ar an aghaidh cloig',
        'Tarraingíonn na coiscéimeanna a bhuaileann cuid de na marcanna '
            'amháin figiúirí rialta ar an aghaidh cloig. Ceanglaíonn '
            'coiscéim sé 0 agus 6 le líne trasna an láir. Tarraingíonn '
            'coiscéim ceathair an triantán 0–4–8, coiscéim trí an '
            'cearnóg 0–3–6–9, coiscéim dhó heicsigean na n-uaireanta '
            'cothroim. Is clog beag dúnta i gcónaí gach ceann de na '
            'figiúirí seo — fohghrúpa.\n\n'
            'Rud suntasach: is ionann roinnteoirí an Dó Dhéag — 1, 2, 3, '
            '4, 6, 12 — agus a líon figiúirí, ní níos mó agus ní níos lú. '
            'Tá an oiread roinnteoirí ag an Dó Dhéag agus nach bhfuil ag '
            'aon uimhir níos lú, agus dá bhrí sin iompraíonn a haghaidh '
            'cloig an líon sin figiúirí glanmhara. Ní bheadh ag clog '
            'deich n-uaire ach roinnteoirí 1, 2, 5, 10 — gan triantán, '
            'gan cearnóg. Déanann an inroinnteacht chéanna a shainíonn an '
            'Dó Dhéag mar bhonn comhairimh a haghaidh cloig saibhir freisin.',
      ),
      ProseSection(
        'An clog céanna sa cheol',
        'Cruthaíonn na dhá leathton déag d\'ochtach an ciorcal céanna: '
            'tar éis dhá chéim leathtoin déag, táthar ar ais ag an ton '
            'tosaigh, ochtach níos airde. Is ionann ceoil a aistriú go '
            'gléas eile agus na tonanna go léir a chasadh an méid céanna '
            'ar aghaidh — suimiú ar chiorcal na dton.\n\n'
            'An ciorcal cúigiú a fhoghlaimíonn ceoltóirí de ghlanmheabhair '
            'níl ann ach coiscéim a seacht ar an gciorcal sin: is seacht '
            'leathton cúirt chúige bhreá, agus toisc go bhfuil an tSeacht '
            'ar cheann de na ceithre choiscéimeanna maithe, ritheann an '
            'ciorcal trí na tonanna go léir sula ndúnann sé. Casann an '
            'ceathrú (cúig leathton) an ciorcal céanna ar gcúl. Fanann '
            'coiscéimeanna le roinnteoirí coiteanna i bhfigiúir agus '
            'tugann go díreach na cóird shiméadracha aitheanta: an '
            'triatán mór an triantán, an trítean an líne. Cén fáth go '
            'díreach dhá leathton dhéag agus conas a fhuaimníonn siad, '
            'tá sin sa chaibidil ar an Dó Dhéag sa cheol; anseo is '
            'cuma ach go bhfuil sé an ciorcal céanna.',
      ),
      ProseSection(
        'Agus sna príomhdhigití',
        'Léiríonn tríú ionad an ceathairréad céanna. Agus príomhuimhreacha '
            'á scríobh i mBonn a Dó Dhéag, críochnaíonn gach príomhuimhir '
            'os cionn a Trí ar cheann de na digití 1, 5, 7 nó B. Tá '
            'críochdigití eile dodhéanta: tá uimhir a chríochnaíonn ar '
            '0, 2, 4, 6, 8 nó A cothrom; tá uimhir a chríochnaíonn ar '
            '3, 6, 9 inroinnte ar a trí. Fágtar go díreach na ceithre '
            'dhigit nach bhfuil roinnteoirí coiteanna acu leis an Dó '
            'Dhéag — arís 1, 5, 7, B.\n\n'
            'Is iad sin na ceithre cinn chéanna leis na coiscéimeanna '
            'maithe agus na heatraimh a ghineann an ciorcal. Ach ní '
            'hionann críochdigit ón gceathairréad sin agus cruthúnas: '
            'críochnaíonn 25 ar 1 i mBonn a Dó Dhéag, ach is í cúig '
            'uair a cúig í. Fágann an digit go leor uimhreacha as '
            'áireamh mar phríomhuimhreacha, ach ní corónann sí ceann ar bith.',
      ),
      ProseSection(
        'Suimiú i gcónaí, roinnt ní i gcónaí',
        'Is féidir iolrú ar an gclog uaireanta freisin — agus is ansin '
            'a stopann an dúnadh álainn. Le suimiú tá cosán ar ais ag '
            'gach céim; le hiolrú níl. Níl aon uair ann ar féidir an Dó '
            'a iolrú léi agus tuirlingt go glan ar a haon, toisc go '
            'bhfuil dúbailt i gcónaí cothrom. Níl comhléimneach ag an '
            'Dó ar chloc an Dó Dhéag.\n\n'
            'Níl comhléimneach ach ag na ceithre uimhir mhaithe 1, 5, 7, '
            'B — agus is é gach ceann acu a chomhléimneach féin: is é '
            'cúig uair a cúig 25, is ionann sin agus 1 ar chloc an Dó '
            'Dhéag; mar an gcéanna seacht uair a seacht agus B uair a B. '
            'Dá mbeadh príomhuimhir-uaire ag an gclog — aon déag nó trí '
            'déag mar shampla — bheadh comhléimneach ag gach uair. Tá an '
            'Dó Dhéag róchumhda chuige sin — an saibhreas roinnteoirí '
            'céanna a mhaisiíonn a haghaidh cloig, baineann sé an '
            'roinnt réidh di. Ní mímhaith é sin, ach cineál uimhreacha '
            'comhdhéanta; gheobhadh clog deich n-uaire an scéal céanna.',
      ),
      ProseSection(
        'Modulo a dó dhéag ní hionann agus Bonn a Dó Dhéag',
        'Idirdhealú deireanach tábhachtach atá éasca a mheascadh. '
            'Ríomhann an clog "modulo a dó dhéag" — ní choinníonn sé '
            'ach an fuíoll á roinnt ar a dó dhéag. Is rud difriúil é '
            'sin le "Bonn a Dó Dhéag", nodaireacht an áireamháin seo, '
            'ina seasann na hionaid d\'aonaid, dosaen, grós agus mar '
            'sin de. Insíonn modulo cén rang fuíll a bhfuil uimhir ann; '
            'insíonn bonn conas í a scríobh.\n\n'
            'Druidann an dá cheann thart ar an uimhir dó dhéag, ach ón '
            'gcúis bhunúsach chéanna — a roinnteoirí iomadúla — ní '
            'toisc go bhfuil siad mar a chéile. Ríomhtar modulo a dó '
            'dhéag ar an gclog gach lá agus scríobhtar an t-am i gcóras '
            'an Deich mar sin féin. Thug Carl Friedrich Gauss an '
            'cineál ríomha fuíll seo isteach mar nodaireacht féin in '
            '1801; inniu tá sé i bhfolach i ndigití seiceála uimhreacha '
            'leabhair agus cuntais agus i ngach foirmle lae seachtaine.',
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
    '12! agus na hOrduithe',
    [
      ProseSection(
        'Cé mhéad ordú?',
        'Cé mhéad bealach ann chun dosaen rud a chur in ord — dhá '
            'chuairteoir déag ag bord, na dhá mhí dhéag ar liosta, dhá '
            'leabhar dhéag ar sheilf? Don chéad ionad tá dhá iarrthóir '
            'dhéag agat, don dara ceann aon déag fós, ansin deich, '
            'agus mar sin go dtí an ceann deireanach a bhfuil duine '
            'amháin fágtha dó. Iolraítear na féidearthachtaí go léir: '
            '12 · 11 · 10 · … · 2 · 1.\n\n'
            'Scríobhtar an táirgeadh seo na n-uimhreacha go léir ó 1 '
            'go dtí a dó dhéag go gearr mar "12!" agus tugtar Fachtóir '
            'Dhó Dhéag air. Go ginearálta is é n! táirgeadh na n-uimhreacha '
            'go léir ó 1 go n agus comhairíonn sé orduithe n rud. Rud '
            'curios cois: is ionann 0! agus 1 de réir coinbhinsiúin — '
            'níl ach bealach amháin ann chun faic a ordú, is é sin an '
            'leagan folamh.',
      ),
      ProseSection(
        'An uimhir 12!',
        'Go hoibrithe is é 12! = 479001600 i gcóras an Deich — beagnach '
            'leath billiún ordú do dhá rud dhéag amháin. I mBonn a Dó '
            'Dhéag scríobhtar an uimhir chéanna mar 114500000, le cúig '
            'náid ag an deireadh. Is baile don Dó Dhéag na náid sin: '
            'toisc go bhfuil na fachtóirí Dhó agus Trí chomh fairsing '
            'i 12! agus go ngearrann gach ceann de na náid deiridh '
            'díreach Dó Dhéag amháin, tagann cúig cinn amach go glan. '
            'I gcóras an Deich ní chríochnaíonn 12! ach ar dhá náid.\n\n'
            'Cé chomh mór leath billiún ordú? Dá dtaispeánfaí ceann nua '
            'gach soicind, bheifí críochnaithe tar éis thart ar cúig '
            'bliana déag. Má shuíonn an dosaen ag bord cruinn, áfach, '
            'ina gcomharsanacht amháin is cúis agus gan ionad tosaigh '
            'ann, srionadh an líon go fachtóir a haon déag — beagnach '
            'daichead milliún. Is féidir ceist a chur ar an áireamhán: '
            'tugann eochair an fhachtóra 12! láithreach i mBonn a Dó Dhéag.',
      ),
      ProseSection(
        'Roghnú le hordú agus gan ordú',
        'Go minic ní iarrtar gach dosaen a ordú ach cuid a roghnú — '
            'agus ansin is difriúil é cé acu a chomhairíonn an t-ordú. '
            'Trí reathaí ar chéim na n-onóracha (ór, airgead, cré-umha) '
            'as dosaen: 12 · 11 · 10 = 1320 féidearthacht ordaithe. '
            'Comhairíonn ordú anseo, óir ní hionann an chéad agus an '
            'dara háit.\n\n'
            'Más é sé cinn as dosaen a roghnaítear mar ghrúpa amháin — '
            'sé oibrí deonacha cuir i gcás —, tá 924 féidearthacht; '
            'péire as dosaen tá 66. Braitheann an dá chóir chomhairimh '
            'ar an bhfachtóir. Sa chaint cumastar iad go minic: éilíonn '
            '"glas uimhreach" ar ndóigh ord faoi leith — ba chóir '
            '"glas ordaithe" a thabhairt air.',
      ),
      ProseSection(
        'Cloig a bhuaileann na horduithe go léir',
        'I dtúir eaglaise in Sasana tá seanealáin a dhéanann go díreach '
            'é seo: an cloigíneacht athraí. In ionad foinn buaileann na '
            'cloigirí a gcloig in orduithe nua i gcónaí, gach ordú díreach '
            'uair amháin. Ag gach athrú ní cheadaítear d\'aon chlog ach '
            'aon ionad amháin a bhogadh — leagan coirp de shuíomhanna '
            'comharsanacha a mhalartú, maistir ag cloigirí ó 1621, '
            'i bhfad sula gcur síos na matamaiticeoirí ar an gcleas '
            'céanna.\n\n'
            'Tá ainm ar gach méid cloig; tugtar Maximus ar dhá chlog '
            'dhéag. Gach ordú de dhá chlog dhéag a bhualadh chiallódh '
            '12! = thart ar 479 milliún athrú a rith — ar dhá shoicind '
            'in aghaidh an athraithe, bheadh sin blianta fada d\'fhuaimniú '
            'gan stad. Níor éirigh le haon duine é sin riamh agus '
            'meastar nach féidir; ní shroicheann na píosaí is faide '
            'a buaileadh ar dhá chlog dhéag ach roinnt deichna míle '
            'athrú. Níor buaileadh leathnú iomlán ach ar ocht gcloig: '
            '40320 athrú, beagnach ocht n-uaire déag, i 1963 i '
            'Loughborough.',
      ),
      ProseSection(
        'Éiríonn uimhir ina grúpa',
        'Má bhailítear na 12! athoiriúnú go léir ar dhosaen agus '
            'glactar le "an ceann seo ar dtús, ansin an ceann eile" '
            'mar riail ríomha, tagann grúpa chun cinn arís — grúpa '
            'iomlán athoiriúnaithe na dó dhéag rud. Murab ionann agus '
            'ar chloc na n-uaireanta, tá tábhacht ag ord na gcéimeanna '
            'anseo: is rud difriúil é malartú ar dtús, ansin brú, ó '
            'inbhéartú an oird sin. Tá an grúpa seo ollmhór agus '
            'neamh-mhalartach.\n\n'
            'Folaithe ann tá iontas deireanach. I measc na beagnach '
            'leath billiún athoiriúnú tá roghnú beag an-rialta de '
            '95040 ceann amháin a bhrúnn aon cúig cinn as na dhá '
            'phointe dhéag go dtí cúig spriocanna ar dhóigh amháin '
            'díreach. Gur féidir a leithéid a bheith ar go díreach '
            'dhá phointe dhéag ar chor ar bith, baineann sin le '
            'feiniméan de na cinn is annamha sa mhatamaitic — '
            'agus is é ábhar na caibidile seo chugainn.',
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
    'An Grúpa Mathieu M₁₂',
    [
      ProseSection(
        'Roghnú as beagnach leath billiún',
        'Chríochnaigh an chaibidil roimhe seo le gealltanas: i measc na '
            'beagnach leath billiún athoiriúnú ar dhosaen, tá roghnú beag '
            'de go díreach 95040 a bhfuil cumhacht ann nach mór docreidte. '
            'Roghnaigh cúig cinn de na dhá phointe dhéag agus abair cá '
            'rachaidh gach ceann acu ar leith — ansin tá go díreach '
            'athoiriúnú amháin sa 95040 sin a dhéanann é sin. Ní dhá '
            'cheann, ní ceann ar bith: go díreach ceann amháin.\n\n'
            'As an airíonna amháin sin leanas an líon iomlán cheana. '
            'Don sprioc ar an gcéad phointe tá dhá rogha dhéag ann, '
            'don dara ceann aon déag, ansin deich, naoi, ocht — agus '
            'leagtar síos an chuid eile. Dhá oiread a haon déag uair '
            'a deich uair a naoi uair a hocht tugann 95040. Tugtar '
            'grúpa Mathieu M₁₂ ar an mbailiúchán annamh athoiriúnaithe seo.',
      ),
      ProseSection(
        'An córas Steiner S(5,6,12)',
        'Cad a choinníonn na 95040 athoiriúnú seo daingean? Figiúr '
            'comhcheangailteach mín. Is féidir grúpaí de shé cinn a '
            'roghnú as dhá phointe dhéag ar bhealach go bhfuil gach '
            'roghnú féideartha d\'aon cúig phointe i gcónaí i díreach '
            'ceann amháin de na grúpaí sé chinn sin. Tá go díreach '
            '132 grúpa den sórt sin, agus is é an socrú seo an ceann '
            'amháin is féidir — cé is moite de athainmniú na bpointí.\n\n'
            'Tugtar córas Steiner S(5,6,12) ar an struchtúr mín-chothromaithe '
            'seo. Is é grúpa Mathieu go díreach an tacar athoiriúnaithe '
            'a mhapálann na 132 grúpa sé chinn ar ais ar ghrúpaí sé '
            'chinn — siméadrachtaí an fhigiúra seo. Tá na dhá uimhir, '
            '132 grúpa sé chinn agus 95040 siméadracht, i mBonn a Dó '
            'Dhéag B0 agus 47000 faoi seach.',
      ),
      ProseSection(
        'Cén fáth go díreach an Dó Dhéag',
        'An rud is iontaí ní hea chomh rialta is atá M₁₂, ach chomh '
            'hannamh a tharlaíonn a leithéid de rialtacht ar chor ar '
            'bith. Chruthaigh Camille Jordan in 1872: más fágtar as '
            'áireamh na cásanna soiléire coitianta, níl tacar '
            'athoiriúnaithe a bhfuil cúig phointe in ann a shocrú ar '
            'dhóigh dhíreach amháin aige indéanta ach ar líon pointí '
            'amháin — ar a dó dhéag. Tá an mhalairt le haghaidh '
            'ceithre phointe ann mar eisceacht ar aon déag pointe '
            'amháin.\n\n'
            'Ar go díreach aon déag agus dhá phointe dhéag — agus '
            'in áit ar bith eile taobh amuigh de na cásanna coitianta '
            '— maireann na siméadrachtaí thar a bheith foirfe seo. '
            'Is ionann sin agus a rá gur ceann de mhuirear beag '
            'uimhreacha amháin an Dó Dhéag a bhfuil a leithéid d\'airíonna '
            'acu. Is toradh matamaiticiúil soiléir é sin, ní '
            'neiméadáil — ach cúis iontas i ndáiríre.',
      ),
      ProseSection(
        'An chéad cheann dá saghas',
        'Tá bunchlocha ag grúpaí teoranta nach féidir a bhriseadh níos '
            'faide — na grúpaí simplí, adamh na teoirice grúpaí. '
            'Ciallaíonn "simplí" anseo dobhriste, ní éasca. Baineann '
            'formhór na n-adamh seo le roinnt teaghlach éigríochta; '
            'ina dteannta sin tá go díreach sé ghrúpa is fiche aonair, '
            'na grúpaí eisceachtúla. Is ceann de na grúpaí sin M₁₂.\n\n'
            'Chuir Émile Mathieu síos ar M₁₂ chomh luath le 1861 — ba '
            'é an chéad ghrúpa eisceachtúil riamh a aimsíodh, beagnach '
            'céad bliain roimh an gcuid eile. D\'fhan a bhith ann '
            'conspóideach ar feadh i bhfad, agus rinne roinnt saineolaí '
            'amhras faoi; níor cuireadh ar bhonn daingean é ach in 1938 '
            'ag Ernst Witt. Tosaíonn an tsraith grúpaí eisceachtúla le '
            'M₁₂ agus críochnaíonn sí ag an "Ollphéist" ollmhór '
            'iomráiteach, agus is ceann de na saothair comhoibríocha '
            'is mó sa mhatamaitic ar fad a n-aithris iomlán.',
      ),
      ProseSection(
        'Le sonrú: cártaí agus cluiche',
        'Chomh teibí agus is cosúil é — tá bealaí inláimhsithe ann. '
            'De réir foinsí tuairiscithe, má mheasctar dhá chárta '
            'dhéag ar dhá bhealach shonracha comhsheasmhacha arís '
            'agus arís eile, gintear go díreach athoiriúnú ghrúpa '
            'Mathieu. Agus chum an matamaiticeoir John Conway "blackjack '
            'matamaiticiúil" leis na dhá uimhir dhéag Náid go dtí B, '
            'arb ionann a straitéis bhuach agus na 132 grúpa sé chinn '
            'go díreach.\n\n'
            'Fan macánta: níl mórán eochair sa áireamhán sa chaibidil '
            'seo a fhreagraíonn dó — is áilleacht theoirice ghlan é, '
            'ní uirlis. Ach is minic gur é sin díreach an mealladh: gur '
            'é go díreach an Dó Dhéag, a thugann a rithim don áireamhán '
            'seo, ceann de na huimhreacha beaga ar a bhfuil siméadracht '
            'chomh hannamh, chomh foirfe sin i bhfolach ag an '
            'mhatamaitic.',
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
    'An Dóideacagán (Dódhéagán)',
    [
      ProseSection(
        'Cad é an dóideacagán rialta',
        'Is polagán é an dóideacagán rialta (Gréigis dodeka = dhá dhéag, '
            'gōnía = uillinn) le dhá thaobh chomhfhada déag agus dhá '
            'uillinn inmheánacha chomhionanna déag. Luíonn na dá choirnéal '
            'déag go cothrom ar chiorcal, an timchiorcal, 30° ó chéile.\n\n'
            'Tomhaiseann gach uillinn inmheánach 150° go beacht. Leanann sé '
            'sin ó réasúnaíocht shimplí: más siúlann tú timpeall na '
            'figiúire go huile, casann tú ag na dá choirnéal déag le chéile '
            'ar 360° iomlán, .i. 30° in aghaidh an chúinne. Comhlánaíonn '
            'an uillinn sheachtrach agus an uillinn inmheánach 180°, mar '
            'sin fanann 180° − 30° = 150°. Sa chóras dóidéagach scríobhann '
            '150° mar 106°, an uillinn sheachtrach 30° mar 26°. Is iolraí '
            'de 15° — dóidéagach 13° — gach uillinn a fhaightear san '
            'dóideacagán.\n\n'
            'Tá an dóideacagán ar cheann de na foirmeacha ar féidir é a '
            'tharraingt go cruinn le compás agus rialóir. Tá an bealach '
            'gearr: buail ciorcal, roinn é ina shé chuid chomhionanna (éiríonn '
            'leis sin le compás amháin, toisc go gcomhionannóidh an taobh '
            'le ga sa heicsigean), ansin roinn gach arc de na sé ina dhó — '
            'tá dhá phointe déag dáilte go cothrom déanta. Ní coinchidéans '
            'é sin: is inógaire polagán rialta n-taobhach go díreach nuair '
            'a chomhdhéanann n cumhacht de dhó agus príomhuimhreacha éagsúla '
            'Fermat (teoirim Gauss agus Wantzel). Do 12 = 2² × 3 '
            'comhlíontar é, mar is príomhuimhir den sórt sin 3.',
      ),
      ProseSection(
        'Trí pholagán ag roinnt na gcoirnéal',
        'Is lú an rud suntasach faoin dóideacagán ná a chruth ach an rud '
            'atá laistigh de. Má nascann tú gach dara coirnéal dá chuid, '
            'cruthaítear heicsigean rialta. Tugann gach tríú coirnéal '
            'cearnóg, tugann gach ceathrú coirnéal trídhéach comhchosúil '
            '— na trí cinn go cruinn, ní gar dó, agus iad uile ar an '
            'timchiorcal céanna leis an dóideacagán féin.\n\n'
            'Tá riail ghinearálta laistiar de sin: oireann polagán rialta '
            'm-thaobhach go díreach le na coirnéil chéanna i bpolagán '
            'n-thaobhach nuair a roinneann m an uimhir n; nascann tú ansin '
            'gach (n/m)-ú coirnéal. Tá heicsigean, cearnóg agus trídhéach '
            'sa dóideacagán toisc gur inroinnte 12 ar 6, 4 agus 3. Agus '
            'is í 12 an uimhir is lú atá inroinnte ar 3, 4 agus 6 ag an '
            'am céanna — a gcomhiolrán is lú. Mar sin is é an dóideacagán '
            'an polagán rialta is lú ina bhfuil na trí bhunfhoirm le '
            'chéile; ní féidir le polagán cúig-, ocht- nó deich-thaobhach '
            'é sin a dhéanamh.\n\n'
            'Is in-roinnte díreach í sin a dhéanann an córas dóidéagach '
            'chomh taitneamhach. Go bhfuil 12 inroinnte ar 2, 3, 4 agus '
            '6 ligeann go céimseata do na trí pholagán titim le chéile i '
            'ndóideacagán — agus déanann sé go huimhríoch de leath, trian, '
            'ceathrú agus séú codáin ghearr, ghlan dhóidéagacha. '
            'Tá an fhréamh chéanna ag foirm agus ag codáin.',
      ),
      ProseSection(
        'Caoga is ceithre dhiagonáil, sé fhad',
        'Nascann diagonáil dhá choirnéal nach bhfuil comharsanacha. '
            'Tugann an fhoirmle n(n−3)/2 do dhóideacagán 12 × 9 / 2 = 54 '
            'diagonál. Feictear sin neamhord, ach tá ord daingean air: '
            'mar atá an dóideacagán chomh siméadrach, tá fad comhionann '
            'ag na diagonáil uile a léimeann an líon céanna coirnéal. Tá '
            'cúig fhad-léime den sórt sin agus an trastomhas ina theannta '
            '— sé fhad éagsúla amháin mar sin. Le taobhfhad 1:\n\n'
            'd₂ léimeann coirnéal amháin agus tomhaiseann √(2+√3) ≈ 1.932. '
            'd₃ léimeann dhá choirnéal, 1+√3 ≈ 2.732. d₄ léimeann trí '
            'choirnéal, (3√2+√6)/2 ≈ 3.346. d₅ léimeann ceithre choirnéal, '
            '2+√3 ≈ 3.732. Nascann d₆ ar deireadh coirnéil os comhair a '
            'chéile — is é sin an trastomhas, √6+√2 ≈ 3.864.\n\n'
            'Folaithe sna luachanna sin tá patrúin ghlan. Difríonn an '
            'cúigiú agus an tríú diagonáil díreach fad an taobh: '
            '(2+√3) − (1+√3) = 1. Agus tá an trastomhas dhá oiread an '
            'diagonáil is giorra go díreach, d₆ = 2 · d₂ — an cóimheas '
            'céanna 2:1 leis an ochtach sa cheol. Tá gach uillinn idir na '
            'diagonáil arís ina n-iolraí de 15°, mar go roinneann na dá '
            'choirnéal déag an ciorclán iomlán i gcéimeanna de 30°.',
      ),
      ProseSection(
        'An achar agus an "trí cruinn"',
        'Chun an t-achar a fháil, déantar an dóideacagán a dheighilt ón '
            'lár ina dhá thriantán déag chomhionanna, caola. Tá dhá chos '
            'den fhad R ar gach ceann — is é sin ga an timchiorcail, '
            'an fad ón lár go coirnéal — agus tá an uillinn 30° ar a '
            'bharr. Nuair a shuimítear na dhá thriantán déag, eascraíonn '
            'rud álainn:\n\n'
            'A = 3 · R².\n\n'
            'Is é an fachtóir trí ghlan, iomlán gan aon fhréamh. Éiríonn '
            'leis seo toisc go bhfuil sin(30°) = a leath sa ríomh, agus '
            'is í 30° uillinn an chúinne den dóideacagán díreach. Ar na '
            'polagáin is féidir a tharraingt le compás agus rialóir is é '
            'an t-aon cheann mór amháin é ina dtagann an fhoirmle achair '
            'amach chomh glan sin; san heicsigean mar shampla fanann '
            'fréamh. Más fearr leat s an taobhfhad, is é an t-achar '
            'A = 3(2+√3)·s² ≈ 11.196·s².\n\n'
            'Má chuirtear an t-achar i gcoibhneas leis an timchiorcal, ar '
            'achar π·R², gearrann R² amach agus fanann 3/π ≈ 0.9549 go '
            'díreach. Líonann an dóideacagán mar sin thart ar 95.5% dá '
            'thimchiorcal — i bhfad níos mó ná heicsigean (thart ar 83%), '
            'cearnóg (thart ar 64%) nó trídhéach (thart ar 41%). In áit '
            'uimhir na gciorclán casta π seasann an trí chuinn: le R = 1 '
            'is é an t-achar dóideacagánach 3 go díreach agus luíonn sé '
            'beagán faoi π ≈ 3.1416.\n\n'
            'D\'úsáid Archimedes an gaire seo cheana. Dhruid sé π tríd '
            'polagáin, ag tosú leis an heicsigean éasca a tharraingt agus '
            'ag déanamh dúbailte ar an líon coirnéal: 6, 12, 24, 48, 96. '
            'Ba é an dóideacagán a chéad chéim. Líonann an 96-phach — '
            '12 × 8 ó thaobh dóidéagach — an ciorcal cheana 99.93% agus '
            'thug dó 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Cá bhfeictear an dóideacagán mar fhoirm',
        'Cruthaíonn dhá mharc uaire déag cloig analógaigh dóideacagán '
            'rialta: dhá phointe déag ag eatraimh 30° ar an gciorcal. '
            'Go gclúdaíonn 360° = 12 × 30° an ciorclán iomlán agus go '
            'bhfuil dhá uair an chloig déag faoi dhó sa lá, is é an '
            'raistar 30° céanna é a úsáideann róisíní compáis do dhá '
            'threo dhéag.\n\n'
            'Bhuail roinnt tíortha boinn dhá thaobh dhéag — go príomha '
            'ionas gur féidir iad a aithint ón mothú ó bhoinn chruinne. '
            'Bhí an "Threepence" Briotanach práis (ó 1937) ar an gcéad '
            'píosa reatha neamhchruinn sa Bhreatain Mhór; tugadh isteach '
            'an bonn punt dhá thaobhach déag (ó 2017) in aghaidh '
            'falsaithe agus dearadh go cúramach de réir an eiseamláir '
            'sin. Murab ionann agus a maítear uaireanta níl leithead '
            'cothrom ag boinn den sórt sin — tá an airíonna sin ag boinn '
            'seacht-thaobhacha Bhriotanacha na 20 agus 50 pingin, nach '
            'dóideacagáin iad.\n\n'
            'Ní dhéanann an dóideacagán ina aonar tíleáil ar an eitleán: '
            'ní théann 150° go glan isteach in 360°. In éineacht le '
            'polagáin eile áfach éiríonn leis — mar shampla le '
            'triantáin nó le cearnóga agus heicsigean, a bhfuil a '
            'n-uillinn ag suimseadh go 360° ag gach coirnéal. '
            'Cruthaíonn patrúin dhá dhéag-uimhreacha den sórt sin '
            'bunús ornáideachta céimseata Ioslamaí. Mar a tháinig an '
            'dó dhéag isteach sa tógáil agus san ealaín ina theannta '
            'sin, pléitear é sa chaibidil "An Dó Dhéag sa Tógáil".',
      ),
      ProseSection(
        'Céimseata, ní uimhireolaíocht',
        'Is fíricí matamaiticiúla iomchuí iad airíonna an dóideacagáin, '
            'ní rúndiamhair. Go bhfuil an t-achar i gcoibhneas 3/π leis '
            'an timchiorcal leanann go héigeantach ó sin(30°) = a leath; '
            'léiríonn sé amháin go ndéanann an dóideacagán maith-áitriú '
            'ar an gciorcal, agus ní bunnaíonn sé aon nasc rúnda idir an '
            'trí agus π. Ar an gcaoi chéanna is toradh an uillinn chúinne '
            'an trí simplí i "Achar = 3·R²", ní iontas.\n\n'
            'Éilíonn "A = 3·R²" freisin an léamh ceart: baineann an trí '
            'ghlán leis an ga timchiorcail. Le taobhfhad 1 is thart ar '
            '11.2 an t-achar, ní 3. Agus le diagonáil is fiú bheith '
            'cruinn — is é an ceathrú (3√2+√6)/2 ≈ 3.346, ní slonn '
            'fréamhaí níos simplí; foilsítear luachanna mícheart i '
            'roinnt foinsí.\n\n'
            'Ar deireadh ní deir an inógaireacht éasca ach go dtagann '
            'an fhoirm le huirlis shimplí. Míníonn sé go maith cén fáth '
            'nach bhfuil dóideacagáin chomh minic sin i gceardaíocht, ar '
            'bhoinn agus in ornáid. Ach cén fáth a bhfuil dhá uair an '
            'chloig déag ar chloig is ceist traidisiúin, ní céimseata. '
            'Is uirlis chéimseata álainn é an dóideacagán — agus ní '
            'chóir aon rud eile a chur ina leith.',
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
    'Tíleálacha Archimédacha',
    [
      ProseSection(
        'Ní líonann an dóideacagán an plána leis féin',
        'Is figiúr álainn cruinn é an dóideacagán rialta — ach ní féidir '
            'leis urlár a chlúdach leis féin gan bearnaí. Is í an chúis a '
            'uillinn inmheánach de 150 céim. Timpeall coirnéil caithfidh '
            'na figiúirí comharsanacha comhlánú go díreach go 360 céim, '
            'ach tugann 360 roinnte ar 150 dhá phointe a ceathair — ní '
            'slánuimhir é sin. Fágann dhá dhóideacagán bearna ag coirnéal, '
            'forluíonn trí cinn.\n\n'
            'Teastaíonn páirtithe ón dóideacagán mar sin. Agus na figiúirí '
            'cearta á gcur eatarthu, tagann patrúin dlútha an-rialta chun '
            'cinn — tíleálacha Archimédacha. Sin na tíleálacha den phlána '
            'nach bhfuil iontu ach polagáin rialta agus a bhfuil an '
            'chosúlacht chéanna ag gach coirnéal acu. Ní ann ach aon '
            'phatrún déag den sórt sin ar fad.',
      ),
      ProseSection(
        'Dhá phatrún leis an dóideacagán',
        'As na haon phatrún déag sin ní bhfuil dóideacagán rialta ach i '
            'ndó acu. Sa chéad cheann líonann triantáin chomhchosúla beaga '
            'na cúinní idir na dóideacagáin — ag gach coirnéal tagann '
            'triantán amháin agus dhá dhóideacagán le chéile, agus '
            'suimíonn a n-uillinn 60 móide 150 móide 150, sin go '
            'díreach 360 céim.\n\n'
            'Is é an dara ceann an ceann níos saibhre agus an ceann atá '
            'léirithe san íomhá: timpeall gach dóideacagáin feistítear '
            'fleasc de chearnóga agus heicsigean malartach. Ag gach '
            'coirnéal tagann cearnóg amháin, heicsigean amháin agus '
            'dóideacagán amháin le chéile — 90 móide 120 móide 150 '
            'céim, arís go díreach 360. Toisc go gcomhshuimíonn, '
            'dúnann an fleasc gan bhearna ar bith, agus leanann an '
            'patrún ar aghaidh i ngach treo.',
      ),
      ProseSection(
        'Cén fáth nach n-oireann ach Trí, Ceathair, Sé',
        'Taobh le dóideacagán, ní oireann ach trí chineál comharsan: '
            'triantáin, cearnóga agus heicsigean. Ní coinchidéans é sin. '
            'Is iad a n-uillinn inmheánacha 60, 90 agus 120 céim — agus '
            'sin go díreach 360 roinnte ar sé, ar cheathair agus ar thrí. '
            'Is iad mar sin go díreach roinnteoirí trí, ceathair agus sé '
            'den Dó Dhéag a thagann chun cinn.\n\n'
            'Is iad na trí roinnteoirí céanna sin a fhágann go dtagann '
            'trian, ceathrú agus séú amach go glan i mBonn a Dó Dhéag. '
            'Tá an tíleáil álainn agus an codán áisiúil ag eascairt ón '
            'bhfréamh chéanna: inroinnteacht shaibhir an Dó Dhéag. Is '
            'gaol fíor é sin, ach ní éigean — tagann na huillinn ón '
            'gcéimseata, tagann na codáin ghlanmhara ón nodaireacht; '
            'braitheann an dá cheann ar an uimhir chéanna amháin.',
      ),
      ProseSection(
        'Kepler, moscanna agus criostal',
        'Ba é Johannes Kepler an chéad duine a rinne liosta iomlán de '
            'na patrúin seo, in 1619, i saothar ar chomhchuíbheas an '
            'domhain. Is tagairt do na coirp Archimédacha amháin an '
            't-ainm "Archimédach" san; níl scríbhinn ársa ann inar '
            'phléigh Archimedes féin tíleálacha.\n\n'
            'I bhfad roimh Kepler bhí an dóideacagán ina chónaí sa '
            'chealaíon cheana: baineann réaltaí dhá dhéag pointeach '
            'de na móitíf is glórmhaire d\'ornáideachas céimseata '
            'Ioslamach, tógtha le compás agus rialóir ó ghéimseata '
            'ghlan — go luath mar shampla ar mhoscanna Konya (1220). '
            'Agus sa dúlra filleann an t-ord céanna dhá dhéag-chuíosach '
            'sna quasachriostail, a bhfuil caibidil féin faoi. An '
            'dóideacagán nach líonann urlár leis féin, is í ar an gcomhpháirtíocht '
            'ceann de na foirmeacha is torthúla i gcéimseata an phlána.',
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
    'An Dóideacaeadrón',
    [
      ProseSection(
        'Dhá chúigeach déag sa spás',
        'Is corp é an dóideacaeadrón (Gréigis dōdeka = dhá dhéag, hédra = '
            'aghaidh) ó dhá chúigeach chomhionanna, rialta déag. Tá na '
            'haghaidheanna go léir comhionann, tá na himill go léir ar '
            'comhfhad, agus buaileann díreach trí chúigeach le chéile ag '
            'gach coirnéal. Ríomhtar sin mar dhá aghaidh déag, tríocha '
            'imeall agus fiche coirnéal.\n\n'
            'Is ceann é de chúig chorp Phlatónacha — na coirp comhchruinne '
            'a bhfuil a n-aghaidheanna comhdhéanta go heisiach as polagáin '
            'chomhionanna, rialta agus ag a coirnéil a chuireann an líon '
            'céanna aghaidheanna le chéile i gcónaí. Is iad na ceithre '
            'cinn eile an teitraeadrón (ceithre thriantán), an cíob (sé '
            'cearnóg), an ochtaeadrón (ocht dtriantán) agus an íosacaeadrón '
            '(fiche triantán). Ar na cúig cinn sin is é an dóideacaeadrón '
            'an t-aon cheann le haghaidheanna cúigeacha.\n\n'
            'Go gearr cuirtear síos ar an dóideacaeadrón mar {5, 3}: '
            'cúigeacha mar aghaidheanna, trí cinn acu ag gach coirnéal. '
            'Tomhaiseann an uillinn idir dhá aghaidh chomharsanacha thart '
            'ar 116.57° (deachúlach). Mar chomparáid: 90° an uillinn sin '
            'sa chíob.',
      ),
      ProseSection(
        'Cén fáth go bhfuil díreach cúig cinn ann',
        'Gur féidir cúig cinn den sórt sin amháin a bheith ann — ní '
            'níos mó agus ní níos lú — is toradh cruthaithe é. Treoraíonn '
            'dhá bhealach chuige, agus tagann an dá cheann ar an gcéanna.\n\n'
            'Is comhaireamh simplí an chéad bhealach, teoirim pholaéadrach '
            'Euler: do gach corp comhchruinn tá coirnéil lúide imill '
            'móide aghaidheanna comhionann le dhó. Don dóideacaeadrón: '
            '20 − 30 + 12 = 2. Thug Leonhard Euler faoi deara an '
            'caidreamh seo timpeall 1750; sholáthair Cauchy an chéad '
            'chruthúnas gan bhearna in 1811. Baineann an fhoirmle le '
            'gach corp comhchruinn gan poll, le gach pirimid, gach priosma. '
            'Nuair a chomhcheanglaítear í leis an éileamh go bhfuil na '
            'haghaidheanna ina bpolagáin chomhionanna rialta, fanann go '
            'díreach cúig réiteach.\n\n'
            'Tá an dara bealach níos léiriúla agus breathnaíonn sé ar '
            'choirnéal amháin. Is é 108° uillinn inmheánach cúigeach '
            'rialta. Má bhuaileann trí chúigeach le coirnéal, suimíonn '
            'a n-uillinn go 324°. Is é na 36° in easnamh go dtí an '
            'ciorclán iomlán an bhearna a fhillfeann i dtreo an spáis '
            'go díreach — mar sin cruthaítear coirnéal den dóideacaeadrón. '
            'Thabharfadh ceithre chúigeach 432° cheana féin agus ní '
            'oireann sin do choirnéal. Mar sin is é trí chúigeach an '
            't-aon fhéidearthacht, agus is é an dóideacaeadrón an t-aon '
            'chorp le haghaidheanna cúigeacha.',
      ),
      ProseSection(
        'An Cóimheas Órga sa Chúigeach agus sa Chorp',
        'Is cúigeach rialta gach aghaidh den dóideacaeadrón — agus is '
            'é an cúigeach an áit phlánach is simplí ina dtéann cóimheas '
            'φ = (1+√5)/2 ≈ 1.618 i bhfeidhm mar chóimheas faid. Tá '
            'diagonáil cúigigh rialta díreach φ-uair fad a taobh. Nuair '
            'a chlóscríobhann tú φ² = san áireamhán, faigheann tú φ+1 '
            '— is é sin an comhchothroman sainmhínithe den Chóimheas Órga.\n\n'
            'Mar go n-iompraíonn gach aghaidh an cóimheas seo, teann φ '
            'tríd an gcorp iomlán. Má leagtar an dóideacaeadrón i gcreat '
            'comhordanáidí, feictear φ go litriúil i ndámhsa uimhriúil a '
            'fhiche coirnéal. Cruthaíonn ocht gcinn de na coirnéil seo '
            'dóibh féin cíob; is féidir cúig cíob éagsúla ar fad a '
            'inscríobh sa dóideacaeadrón. Cruthaíonn coirnéil eile trí '
            'dronuillinn órga — dronuillinní le cóimheas taobh φ go haon '
            '— atá ag seasamh go hingearach ar a chéile ina péirí.\n\n'
            'Ní as draíocht a fheictear φ anseo, ach as riachtanas: áit '
            'a bhfuil cúigeacha rialta, tá φ. Is léiriúcháin dhaonna '
            'iad na hathléiriú breise ar an gCóimheas Órga mar "chomhréir '
            'dhiaga", ní airíonna na céimseata féin.',
      ),
      ProseSection(
        'Dualacht agus an tsiméadracht is saibhre',
        'Do gach corp Platónach tá corp dúalach: cuirtear coirnéal nua '
            'i lár gach aghaidhe agus nasctar coirnéil na n-aghaidheanna '
            'comharsanacha. Cruthaítear don dóideacaeadrón mar sin an '
            'íosacaeadrón — agus ar a mhalairt. Malartaítear aghaidheanna '
            'agus coirnéil ina bpoist: tá 12 aghaidh agus 20 coirnéal ag '
            'an dóideacaeadrón, 20 aghaidh agus 12 coirnéal ag an '
            'íosacaeadrón. Fanann líon na n-imill 30 ag an dá cheann. '
            'Feictear an dó dhéag sa dá cheann — mar líon na n-aghaidheanna '
            'uair amháin, mar líon na gcoirnéal uair eile.\n\n'
            'Mar go roinneann an dá cheann an dearadh céanna, roinneann '
            'siad an tsiméadracht chéanna freisin — agus is í sin an '
            'tsiméadracht is saibhre de na coirp Phlatónacha: 120 '
            'siméadracht, .i. 60 rothlú agus 60 fhrithchaithfhilleadh. '
            'Níl ach 48 ag an gcíob, 24 ag an teitraeadrón. Roinntear '
            'na 60 rothlú ar sé ais cúigchéimneacha tríd na láir '
            'aghaidheanna os comhair a chéile, deich n-ais trícéimneacha '
            'tríd na coirnéil os comhair a chéile agus cúig ais '
            'déchéimneacha déag tríd na láir imill os comhair a chéile.\n\n'
            'Is féidir an uimhir 120 a scríobh mar 5! (5 × 4 × 3 × 2 × 1) '
            'agus í a dheighilt ina príomhfhachtóirí 2, 3 agus 5 — na trí '
            'uimhir chéanna a fhilleann sna hais agus i bhfoirm na '
            'haghaidhean cúigeacha. Is é na hais cúigchéimneacha seo '
            'freisin an chúis nach féidir le gnáthchriostal fíor-'
            'dhóideacaeadrón a chruthú: ní oireann siméadracht a cúig '
            'le laitís tréimhsiúil (féach an chaibidil ar phírít).',
      ),
      ProseSection(
        'An Dó Dhéag Euler: cén fáth dhá chúigeach déag i gcónaí',
        'Nascann toradh deireanach an dóideacaeadrón le rudaí nach '
            'bhféachann ar dtús mar bhaineann leis. Is é an cheist: an '
            'féidir clúdach dúnta, sféarúil a thógáil le seiseanna '
            'rialta amháin? Is é an freagra ní féidir. Tugann seiseanna '
            'amháin dromchla cothrom; chun é a chuarú ina sféar, ní mór '
            'go díreach dhá chúigeach déag a thógáil isteach — cuma '
            'cé mhéad seiseanna a úsáidtear eile.\n\n'
            'Leanann sé sin arís ó theoirim Euler. Gan seiseanna ar bith '
            'cruthaítear an dóideacaeadrón rialta. Le dhá chúigeach déag '
            'agus fiche seisean cruthaítear an liathróid chlasaiceach '
            'sacair — agus anseo go díreach tá earráid choitianta: ní '
            'dóideacaeadrón é an liathróid sacair. Is é íosacaeadrón '
            'truaillíthe le 32 aghaidh é, .i. dhá chúigeach déag móide '
            'fiche seisean. Roinneann an dá cheann na dhá chúigeach '
            'déag amháin; ach níl seiseanna ar bith ag an '
            'dóideacaeadrón.\n\n'
            'Is é an dóideacaeadrón rialta mar sin an cás is glanmhaire '
            'den dóidéagacht seo: dhá chúigeach déag agus rud ar bith '
            'eile.',
      ),
      ProseSection(
        'Cíob, dóideacagán agus píríteadrón — cad nach é',
        'Sa chluichíocht rólghlactha tá aithne ar an dóideacaeadrón mar '
            'D12, an dísle dhá thaobh dhéag. Toisc go dtagann sé is '
            'gaire de na cúig chorp don sféar, rollann sé go deas agus '
            'suíonn go hiontaofa ar aghaidh; déanann a dhá aghaidh '
            'chomhionanna déag cóir é.\n\n'
            'Is fiú na trí mheascadh a shoiléiriú. Ar dtús: ní hionann '
            'an dóideacagán agus an dóideacaeadrón. Iompraíonn an dá '
            'fhocal "dodeka-" (dhá dhéag), ach is dóideacagán polagán '
            'cothrom le dhá thaobh dhéag, agus is corp spásúil le dhá '
            'aghaidh déag an dóideacaeadrón. Ar an dara dul síos: tá '
            'dhá aghaidh chúigeacha déag freisin ag píríteadrón an '
            'mhianra phíríte, ach ní dóideacaeadrón rialta é — tá a '
            'chúigeacha claonta agus níl fíor-siméadracht chúigchodach '
            'aige (mínithe go mion sa chaibidil ar phírít). Ar an tríú '
            'dul síos ar deireadh shann Platón an dóideacaeadrón don '
            'chosmas ina iomláine; is sean-léirmhíniú fealsúnachta é '
            'sin, ní toradh matamaiticiúil. Seasann céimseata an choirp '
            'dá chuid féin, go hiomlán neamhspleách ar cibé brí a '
            'thug daoine dó.',
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
