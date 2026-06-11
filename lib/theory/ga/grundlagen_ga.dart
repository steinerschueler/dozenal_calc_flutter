part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersGa() => const [
  ProseChapter(
    'Cad é an Córas Dóidéagach?',
    [
      ProseSection(
        'Cad is bonn ann',
        'I gcóras luachanna áite braitheann luach na digit ar a shuíomh. '
            'Sa uimhir 347 seasann an 3 ar thrí chéad, an 4 ar cheathracha, '
            'an 7 ar a seacht. Tá gach suíomh oiread uaire níos mó ná a '
            'chomharsa ar dheis agus a deir an bonn. Sa chóras deachúlach '
            'coitianta is é deich an bonn.\n\n'
            'Tá an bonn dhá dhéag ag an gcóras dóidéagach. Mar sin ní '
            'haonaid, deichniúir agus céadanna na suíomhanna, ach haonaid, '
            'dosaein agus céad is daichead a ceathair. Ciallaíonn "100" '
            'anseo ní céad, ach dhá dhéag faoi dhá dhéag, .i. 144 sa '
            'deachúlach. Agus ciallaíonn "10" díreach dosaen amháin.\n\n'
            'Tá rud tábhachtach le tuiscint: ní athraíonn an méid féin riamh, '
            'ach an litriú amháin. Ainmníonn "cúig déag" agus "dosaen agus a '
            'trí" an méid céanna úll — scríofa "15" go deachúlach agus "13" go '
            'dóidéagach. Ciallaíonn an "13" dóidéagach dosaen agus a trí, ní a '
            'trí déag. Ní dhéanann athrú boinn uimhir níos mó ná níos lú.',
      ),
      ProseSection(
        'Cén fáth a dteastaíonn dhá dhigit nua',
        'Éiríonn leis an gcóras deachúlach le deich gcomhartha (0 go 9), '
            'mar osclaíonn suíomh nua ag an deichiú haon. Ní théann an córas '
            'dóidéagach chuig suíomh nua ach ag an dóú haon déag. Teastaíonn '
            'uaidh dá bhrí sin dhá chomhartha breise — do na luachanna deich '
            'agus aon déag, a ghlacann dhá shuíomh cheana féin sa '
            'deachúlach.\n\n'
            'Scríobhann an t-áireamhán seo iad mar A (= deich) agus B (= aon '
            'déag). Tábhachtach ar fad: ní litreacha iad A agus B anseo agus '
            'ní sealbhóirí ionaid iad, ach digitanna iomlána aon-suíomh — '
            'díreach mar atá 7 nó 9, ach do dheich agus aon déag. Comhairítear '
            'mar seo: 0, 1, 2, …, 9, A, B, 10, 11, …\n\n'
            'Is botún fíor é seo do gach duine atá cleachta le hailgéabra. '
            'Ciallaíonn "2B" an tacar dhá uair B san ailgéabra. Ní hea anseo. '
            'Is uimhir dhá-shuíomh í "2B": 2 sa shuíomh dosaen agus B sa '
            'shuíomh haonaid, .i. dhá dhosaen agus aon haon déag — 35 sa '
            'deachúlach. Dhá uair aon déag ina ionad sin bheadh 22, "1A" sa '
            'dóidéagach, rud éigin go hiomlán difriúil. Cruthaíonn digitanna '
            'taobh le taobh uimhir, ní méadaítear iad. Tuigeann an t-áireamhán '
            'é seo uaidh féin, mar is digitanna daingne A agus B dó, ní '
            'litreacha.\n\n'
            'Tá litrithe eile coitianta, go háirithe na digitanna iompaithe '
            '↊ agus ↋ a mhol Isaac Pitman in 1857 agus a bhfuil a n-áit '
            'Unicode féin acu ó 2015. Níl aon chaighdeán amháin domhanda '
            'bailí go dtí an lá inniu.',
      ),
      ProseSection(
        'An buntáiste: codáin ghlan',
        'Is é mealladh fíor na dó dhéag a in-roinnte. Roinntear a dó dhéag '
            'go glan ar 2, 3, 4 agus 6; ní roinntear deich ach ar 2 agus 5. '
            'Feictear é seo is soiléire le codáin. I mBonn 10 is codáin '
            'deachúlacha gan teorainn, tréimhsiúla iad trian (0.333…) agus '
            'séú cuid (0.1666…). I mBonn 12 tá siad gearr agus cruinn: is '
            'é 0;4 trian agus is é 0;2 an séú cuid.\n\n'
            'Tá riail shimplí laistiar de sin: stopann codán 1/n i mbonn '
            'nuair agus amháin nuair nach bhfuil ag an ainneoir n ach '
            'príomhfhachtóirí an bhoinn. Tá dhá dhéag comhdhéanta de 2 agus '
            '3 — mar sin tá gach codán le hainneorí de dhónna agus de '
            'thríanna glan.\n\n'
            'Ach ní gnóthachan glan é seo, ach malartán. Éiríonn cúigiú, '
            'an 0.2 glan i mBonn 10, tréimhsiúil i mBonn 12 (0;2497…). '
            'Éiríonn deachaí tréimhsiúil freisin. Is fiú an malartán sa '
            'ghnáthshaol, mar roinntear níos minice ar thrí agus ar cheithre '
            'ná ar chúig — ach is malartán é go macánta, ní iontas.',
      ),
      ProseSection(
        'Cá bhfuil an dó dhéag le fada',
        'I bhfad roimh aon teoiric bhí an dó dhéag tugtha isteach cheana '
            'i dtomhais, in am agus i gceannach, díreach mar gheall ar '
            'an in-roinnte seo. Sa trádáil áirítear i ndosaein (12 píosa) '
            'agus i ngrósanna (144 = 12² píosa); tagann an focal "dosaen" '
            'tríd an bhFraincis ón Laidin duodecim, "a dó dhéag".\n\n'
            'Chiallaigh an focal Laidine uncia "an dóú cuid déag" — de '
            'throigh agus de phunt. As sin tháinig na focail Bhéarla inch '
            '(orlach) agus ounce (unsa): déanann 12 orlach troigh. Tá an '
            't-am roinnte ina dhó dhéag freisin: dhá uair an chloig déag '
            'faoi dhó sa lá, dhá mhí déag sa bhliain, agus tá 360 = 30 × 12 '
            'céim sa chiorclán iomlán.\n\n'
            'Tá hipitéis ann fiú cén fáth a dó dhéag go díreach: is féidir '
            'trí chnámh na gceithre mhéar eile a chomhaireamh leis an ordóg, '
            'sin 4 × 3 = 12. Tá an modh comhairimh seo in úsáid fós i '
            'gcodanna d\'Áise. Is míniú plausible é ar bhunús na dó dhéag '
            'comhairimh, ach ní cruthaithe — fanann sé ina hipitéis.',
      ),
      ProseSection(
        'An ghluaiseacht dhóidéagach',
        'Is smaoineamh ársa é buntáiste an dó dhéag a úsáid go feasach, a '
            'fuair foirm eagraithe bheag sa 20ú haois. In 1935 scríobh Frank '
            'Emerson Andrews sna Stáit Aontaithe an chéad leabhar ar an '
            'ábhar; in 1944 bunaíodh Cumann Dóidéagach Mheiriceá, in 1959 '
            'Cumann Dóidéagach na Breataine Móire. Eisíonn an dá cheann '
            'irisí go dtí an lá inniu agus úsáideann siad digitanna '
            'Pitman.\n\n'
            'Ní éilíonn na cumainn seo athrú córais ar fud an domhain. '
            'Tuigeann siad a gcuid oibre mar oideachas agus taiscéalaíocht: '
            'ba mhaith leo a léiriú nach riachtanas nádúrtha í rogha an bhoinn '
            'uimhreacha, ach nós. Rinne an matamaticí Alexander Craig Aitken '
            'abhcóideacht shuntasach ar son na dó dhéag agus mheas sé an '
            'córas deachúlach i bhfad níos neamhéifeachtaí — meastachán '
            'léiriúil, ní luach tomhaiste.',
      ),
      ProseSection(
        'Cén fáth nár éirigh leis riamh',
        'Má bhíonn Bonn 12 níos áisiúla go minic le ríomhaireacht, cén fáth '
            'a ríomhann an domhan iomlán go deachúlach? Ní sa mhatamaitic atá '
            'an freagra, ach sa nós. Tá an córas deachúlach daingnithe le '
            'míleanna bliain — is dócha toisc go bhfuil deich méar ag an '
            'duine. Is cúis anatamaíoch í sin, ní cúis mhatamaiticiúil, ach '
            'tá sí domhain.\n\n'
            'Nuair a chaighdeánaigh an domhan a thomhais sa 18ú agus sa 19ú '
            'haois, bhuaigh an córas deachúlach meádrach; measadh athrú an '
            'chórais comhairimh dodhéanta fiú ansin. Inniu bheadh costais '
            'athrúcháin — leabhair scoile nua, gléasanna, bogearraí, '
            'ath-fhoghlaim do gach duine — comhionann le tógáil ón nua. '
            'Agus ríomhann na ríomhairí go dénártha ar aon nós, áit a '
            'bhfuil an Bonn 16 níos gaire ná an dó dhéag.\n\n'
            'Mar sin ní glao chun athrú iad rianta na dó dhéag in uaireadóirí, '
            'i dtéipe tomhais agus i ndosaein. Léiríonn siad amháin nár '
            'imigh an dó dhéag ar fad riamh — agus go ndéanann ríomh '
            'inti turas i dtír uimhreacha aithnidiúil ach coimhthíoch.',
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
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
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
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Dhá Alt Déag ar an Lámh',
    [
      ProseSection(
        'An modh: dhá alt déag, ordóg amháin',
        'Coimeád lámh amháin romhat agus féach ar na ceithre mhéar in aice '
            'leis an ordóg. Tá trí alt ar gach ceann de na méara sin, '
            'scartha le cnaipí infheicthe: bunchéim, meánchéim agus '
            'barrcéim. Ceithre mhéar faoi thrí alt tugann dhá alt déag — '
            'dhá phointe chomhairimh déag ar lámh amháin.\n\n'
            'Feidhmíonn an ordóg mar phointeálaí agus ní comhairtear í '
            'féin. Leagann sí gach ceann de na dhá alt déag ina seal agus '
            'comhairigh sí ar an gcaoi sin ó haon go dó dhéag. Tosnaíonn an '
            't-ord is mó a chuirtear síos ag an alt is faide amuigh de '
            'mhéar an chlóibhín agus siúlann sí ó mhéar go méar i dtreo '
            'istigh na láimhe. Ach tá leaganacha ann: tosaíonn cuid ag an '
            'gcorrméar, cuid eile comhairíonn ó bharra anuas. Tá an '
            'struchtúr bunúsach daingean amháin — pointeálaí amháin, '
            'ceithre mhéar, trí alt an ceann, suim dhá dhéag.\n\n'
            'Ní rogha chultúrtha í an fhíric go bhfuil díreach trí alt ann, '
            'ach anatamaíocht: roinneann gach duine an fhoirm 2-3-3-3-3 seo '
            '(níl ach dhá alt ag an ordóg) agus is oidhreacht ársa de lámh '
            'na mamaí í. Tháinig na hailt chun cinn chun greim agus dreapadh, '
            'ní chun comhairimh — ach oireann siad go maith dó.',
      ),
      ProseSection(
        'Ó dhá dhéag go seasca',
        'Nuair a chríochnaíonn an ordóg dhá alt déag na chéad láimhe, '
            'tá timthriall iomlán curtha i gcrích. Glacann an dara lámh '
            'an meabhrúchán ansin: síneann sí méar amháin do gach dosaen '
            'iomlán. Cúig mhéar faoi dhá alt déag tugann seasca. Is féidir '
            'le dhá lámh mar sin comhaireamh go 60 gan focal ná áis ar bith.\n\n'
            'Is é an nasc seo 12 × 5 = 60 an míniú is simplí ar cén fáth a '
            'bhfuil an seasca chomh lárnach i gcórais Mesopotamacha — agus '
            'tríothu sin go dtí an lá inniu: 60 soicind sa nóiméad, 60 '
            'nóiméad san uair, 360 = 6 × 60 céim sa chiorclán iomlán.\n\n'
            'Tá coinbhinsiún eile ann freisin, ina gcomhairíonn an dá lámh '
            'ailt; ansin tagtar ar 12 × 12 = 144. Tá an dá mhodh comhairimh '
            'ceart, ach ní córas amháin iad.',
      ),
      ProseSection(
        'Cá gcomhairítear amhlaidh',
        'Ní aireagán nua-aimseartha é an modh comhairimh seo. Rinne an '
            'stair-mhatamaticí Georges Ifrah cáiliúil é ina "Stair Uilíoch na '
            'nUimhreacha" agus chuir síos air mar mhodh fós in úsáid — i '
            'gcrios leathan ó Éigipt tríd an tSiria, an Tuirc, an Iaráic, '
            'an Iaráin, an Afganastáin agus an Phacastáin go dtí an India '
            'agus Indisín.\n\n'
            'Tá nod macánta le déanamh maidir leis an bhfoinse anseo: is í '
            'an liosta tíortha seo an eolas is mó a luaitear ar an ábhar, '
            'ach tagann sé beagnach go hiomlán ón bhfoinse aonair seo. '
            'Díríonn téacsanna níos déanaí ar Ifrah arís go minic. Níl sé '
            'taifeadta cén uair ná conas a rinneadh breathnóireacht; tá '
            'suirbhé córasach níos úire in easnamh.\n\n'
            'Is é cás na gCheapang i Neipeal is fearr a dhoiciméadaíodh. '
            'Rinne na teangeolaíthe Ross Caughley agus Martine Mazaudon '
            'doiciméadú ar an bhfíric go gcomhairíonn na Cheapang ainmhithe '
            'fiáine i ndosaein agus go gcnagann siad ailt na méar lena '
            'linn; tagann a bhfocal do dhá dhéag, hale, ó fhréamh ársa '
            'do "bhonn an chomhairimh". Tá uimhirfhocail dhóidéagacha ag '
            'roinnt teangacha i lár na Nigéire freisin. Maidir leis an dá '
            'chás: is deachúlach a ríomhann daoine sa ghnáthshaol inniu; '
            'is iarsmaí seachas córas beo iomlán iad na rianta dóidéagacha.',
      ),
      ProseSection(
        'An tráchtas mór — agus cén fáth a bhfanann sé oscailte',
        'Chuir Ifrah an hipitéis chun cinn gur as an gcomhaireamh ailt méar '
            'seo a tháinig an córas dóidéagach ar fad — agus córas '
            'seicsidéagach na Bablónach le bonn 60. Tá taobhanna láidre '
            'ag an tráchtas: míníonn sé an dó dhéag agus an seasca araon, '
            'tá sé plausible ó thaobh anatamaíochta, agus léiríonn sé '
            'gníomh concrach seachas comhthitim uimhreach amháin.\n\n'
            'Mar sin féin is hipitéis í, ní stair dheimhnithe. Labhraíonn '
            'Ifrah féin go sainráite ar a phriondachas mar speicleach. Ní '
            'dhéanann aon téacs ársa, clár cré ná léaráid cur síos ar an '
            'modh seo mar bhunús córas na Bablónach. Oireann an modh don '
            'bhunús — ach ní hionann sin agus cruthúnas.\n\n'
            'Is é Éigipt an chontra-argóint is láidre: de réir Ifrah '
            'chomhairigh na hÉigiptigh ar ailt méar freisin — agus d\'fhorbair '
            'siad córas uimhreacha deachúlach ina dhiaidh sin. Ní éigníonn '
            'an modh méar dá bhrí sin an dó dhéag ná an seasca.',
      ),
      ProseSection(
        'Mínithe eile taobh leis',
        'Ní seasann hipitéis na n-alt méar ina haonar. I measc staraithe '
            'meastar hipitéis eile fiú níos forleithne do bhunús an seasca: '
            'go raibh dhá treibh le bonnanna comhairimh éagsúla ag '
            'trádáil le chéile agus go ndeachaigh siad ar 60 mar '
            'iolrán coiteann. Ach níl fianaise staire dhíreach lena aghaidh '
            'sin ach oiread.\n\n'
            'Ina theannta sin tá míniú réalteolaíoch (oireann thart ar dhá '
            'thimthriall ghealaí déag isteach i mbliain, dá bhrí sin dhá '
            'mhí déag agus dhá chomhartha stoidiaca déag) agus míniú '
            'ríomhaireachta (tá go leor roinnteoirí ag an dó dhéag agus ag '
            'an seasca agus is praiticiúil iad dá bhrí sin). Míníonn na '
            'cúiseanna seo go maith cén fáth a gcoinníodh na huimhreacha '
            '— ach ní míníonn siad go riachtanach cén fáth a ndeachthas '
            'chucu ar dtús.\n\n'
            'Is dócha gur oibrigh roinnt fórsaí le chéile: an lámh, an '
            'spéir, an trádáil agus an in-roinnte maith. Sin go díreach an '
            'fáth is deacra aon chúis aonair a scaradh. Seo an toradh '
            'álainn macánta: soláthraíonn lámh an duine bunús nádúrtha '
            'don dó dhéag — cé acu a mhúnlaigh sé an córas uimhreacha, '
            'ní féidir sin a rá go críochnaitheach.',
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
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
