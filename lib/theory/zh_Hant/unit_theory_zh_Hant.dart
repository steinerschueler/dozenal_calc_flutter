// 繁體中文單位理論文章。part of ../unit_theory.dart。
// 內文以簡短、淺白的句子撰寫（較易翻譯）。內容萃取自
// docs/research/ 中的研究檔案。`count` 刻意沒有條目——
// 「一打／十二」的故事存在於 App 的 12 個教學章節中。

part of '../unit_theory.dart';

List<UnitTheorySection> _unitTheoryZhHant(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          '源自身體的尺度',
          '最古老的長度單位來自人體。指頭的寬度成了吋，前臂成了肘，腳成了'
              '呎，雙臂張開的幅度成了噚。這很實用，因為'
              '每個人都隨身帶著自己的尺度。但它也不準確，因為沒有兩個'
              '身體完全一樣。\n\n'
              '最早的固定標準出現在美索不達米亞與'
              '埃及。在埃及通行的是皇家肘，約 52 公分。它'
              '是法老的前臂，並以原器的形式刻在石頭上'
              '保存。木製的工作肘會定期與它'
              '校對——這就是檢校的開端。',
        ),
        UnitTheorySection(
          '從羅馬到中世紀',
          '羅馬人把這套系統整理得井然有序。他們的呎（pes）含十二個「uncia」。'
              '由 uncia 衍生出「吋」一詞（英文 inch）——也衍生出'
              '「盎司」。他們的哩叫「mille passus」，意為一千個複步，'
              '約 1480 公尺。它是後來所有哩的源頭。\n\n'
              '在中世紀，幾乎每座城市都有自己的尺度。一吋被'
              '定義為三粒大麥前後相連的長度。至於'
              '呎，則有些奇特的做法：1535 年 Jacob Köbel 描述，應'
              '在星期天讓十六名男子離開教堂後腳跟接腳尖'
              '排成一列——其十六分之一即為「正確的呎」。如此一來'
              '便把差異平均掉了。儘管如此，在德國呎仍'
              '從 235 變動到 408 公釐。',
        ),
        UnitTheorySection(
          '世界各地的尺度',
          '同樣的模式到處可見。在中國以尺（呎）與'
              '寸（吋）來量，在印度以 hasta（肘）與 angula（指）來量，在'
              '伊斯蘭世界則用各種肘。從肘部'
              '到指尖的肘幾乎見於所有大陸——'
              '身體就是共同的源頭。\n\n'
              '在許多文化裡，身體被視為神聖的尺度，人'
              '是世界秩序的縮影。埃及神廟、聖經中'
              '方舟的建造以及印度教神廟，都是用肘來度量的。\n\n'
              '語言也保存了這些尺度。「給他們一吋，'
              '他們就拿走一哩」原本是「……他們就拿走一'
              '肘」。「貓一跳的距離」指的是很短的路程。'
              '水手測深的喊聲「mark twain」（深兩噚）成了'
              '馬克・吐溫的筆名。',
        ),
        UnitTheorySection(
          '為什麼是十二——以及一個誠實的保留',
          '為什麼呎偏偏是十二吋？因為可被整除。'
              '十二可以乾淨地對半分、三分、四分以及'
              '六分。十只能對半分與五分。三分之一呎恰好是'
              '四吋；換成十進位則是 0.333… 公尺。對於工藝與'
              '貿易來說，在小數點出現之前，這是實實在在的優勢。'
              '早在羅馬人就出於這個理由選擇了十二。\n\n'
              '誠實的保留不可少：英制系統並不是'
              '一以貫之的十二進位系統。只有呎與吋——以及'
              '貴金屬的十二金衡盎司——才是真正的十二進位。'
              '碼有三呎，哩有 1760 碼：都是不整齊的數字。而吋'
              '在日常裡被分成二分之一、四分之一、八分之一，也就是按'
              '二進位。所以十二只藏在個別之處，並不'
              '貫穿整個系統。',
        ),
        UnitTheorySection(
          '今日的用途',
          '今天主要是美國與英國在日常中使用'
              '這些尺度。但在航空與航海中它們仍通行全球：'
              '飛機以呎測高度，以節測速度，'
              '以海哩測航程。一海哩是地球上的一'
              '角分——它依循六十進位的劃分，而非'
              '十二。螢幕、輪胎與管材幾乎'
              '到處都以吋計。在斯堪地那維亞，「mil」等於十'
              '公里。在公制國家，這些古老尺度只殘存於'
              '俗語之中。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '有些說法很有吸引力，卻不確定。其中一說稱，'
              '十二來自用拇指數手指的指節——'
              '看似合理，但未經證實。其他理論如'
              '「金字塔吋」或「巨石碼」聲稱'
              '古老建築中藏有失傳的高深知識。它們在'
              '學界被視為已被駁斥：因為人們從眾多尺度中只挑出'
              '那些符合論點的來用。',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          '土地即勞動',
          '面積是透過把長度與長度相乘來量度的。然而'
              '古老的土地單位並非出自幾何，而是出自'
              '勞動。一塊田有多大，就是一個人一天能'
              '耕作多少。\n\n'
              '德文的「Morgen」之所以這樣叫，是因為它是在一個上午'
              '犁完的。英文的「acre」是一組'
              '八頭牛一天能耕作的面積。羅馬的「iugerum」'
              '源自「iugum」，即牛的軛。阿拉伯文的'
              '「feddan」同樣意指牛軛。各地都是同一個概念：土地就是'
              '勞動。\n\n'
              '在古埃及，每次尼羅河氾濫後都必須重新'
              '丈量田地，因為河水抹去了界線。丈量者'
              '拉開打結的繩索；希臘人後來稱他們為'
              '「拉繩者」。在美索不達米亞，基本單位是「sar」——一個'
              '十二乘十二肘的正方形。',
        ),
        UnitTheorySection(
          '英畝與它不整齊的數字',
          '英畝有個不尋常的形狀：一條狹長的長條，'
              '一弗隆長、一鏈寬（660 乘 66 呎）。這'
              '反映了犁田的實務：長犁溝、窄犁道。如此便得出'
              '43560 平方呎，即 4840 平方碼。\n\n'
              '為什麼是 4840 這個不整齊的數字？這是歷史的一場意外。'
              '當英格蘭在 13 世紀縮短呎時，桿'
              '與弗隆在地產界線中維持不變。於是英畝'
              '從 4000 舊平方碼跳到 4840 新平方碼。這不整齊的'
              '數字並非刻意，而是一次度量改革的'
              '殘留物。',
        ),
        UnitTheorySection(
          '世界各地的面積單位',
          '今天，公頃（10000 平方公尺）是全世界'
              '最普及的土地單位。但古老的單位頑強地存續著。在'
              '泰國，萊（Rai）甚至登記在官方地籍簿上。在印度'
              '與孟加拉，土地買賣以比格（Bigha）計算。在韓國，'
              '坪（Pyeong）儘管遭禁，仍通行於日常。埃及保留了'
              'Feddan，中國保留了畝。在以色列、土耳其與巴爾幹半島，'
              '人們以杜納畝（Dunam）來量。在德國，Morgen、Joch 與'
              'Tagwerk 仍存活於農業與語言之中。\n\n'
              '最頑強存續的，是那些被固定在整齊公制'
              '數值上的單位——一萊恰好是 1600，一杜納畝恰好是'
              '1000 平方公尺。',
        ),
        UnitTheorySection(
          '面積中的十二——以及一個保留',
          '在小單位上，十二顯現得最為漂亮。一'
              '平方呎是 144 平方吋，因為十二乘十二是 144。'
              '寫成十二進位則是整齊的「100」。一平方碼'
              '是九平方呎。\n\n'
              '在大型土地單位上，這套秩序便瓦解了。擁有'
              '4840 平方碼的英畝套不進任何簡單的進位制。原因'
              '在於，土地單位出自勞動，而非出自'
              '計算。\n\n'
              '儘管如此仍有一個實際的要點：三分之一公頃是'
              '3333.33… 平方公尺——一個不整齊的數字。三分之一 Feddan'
              '則恰好是八 Kirat。在常需三分的地方，一個'
              '可被三整除的進位制更佔優勢。十二做的'
              '正是這件事。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '對十二的偏愛從何而來？一個著名卻'
              '未經證實的猜測：來自數手指的指節。拇指'
              '依序點觸其他四指的三個指節——每隻手便得出'
              '十二。這種計數法直到今天在亞洲部分地區'
              '與近東仍有記載。但要證明它是確切的'
              '源頭，卻辦不到。',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          '先有容器，後有立方體',
          '體積是透過把三個長度相乘來量度的——一個立方體。'
              '但幾乎沒有任何地方是這樣開始的。最初是容器：一個'
              '裝滿的罐子、一袋穀物、一瓢油。人們量的，'
              '是能吃、能扛或能交易的東西，而不是能'
              '計算的東西。\n\n'
              '參照物多半是某種食物的量。希臘的'
              '「choinix」是一名工人一天的穀物口糧。日本的'
              '「石（Koku）」是一個人一年所吃的稻米量'
              '——約 180 公升。德文的「Scheffel」大約是一'
              '個扛得動的袋子。\n\n'
              '直到有了行政管理的大帝國，才從長度單位'
              '推導出體積。羅馬人邁出第一個清楚的步伐：他們的'
              '「Amphora」恰好容納一立方呎，約 26 公升。至此'
              '體積首次成了源自呎的真正立方體——'
              '立方呎、公升與立方公尺的直系祖先。',
        ),
        UnitTheorySection(
          '尺度、地位與財富',
          '容量單位往往不只是分量——它們規範了整個'
              '社會。在日本，一塊封地的財富以'
              '石的稻米產量來衡量。產量達一萬石，領主便被稱為「大名」，'
              '即諸侯。連武士的俸祿與船隻的大小'
              '都以石計。\n\n'
              '在羅馬，士兵的口糧以「modii」分配，那是一種'
              '近九公升的乾量單位。在美索不達米亞、埃及與'
              '中國，統治者透過校準過的標準容器來掌控度量。'
              '其中最著名的是中國約在'
              '西元元年前後的「嘉量」：單一一件青銅鑄器，同時'
              '體現五個體積單位。它立於皇帝的'
              '殿前，作為其統治之統一與公正的象徵。',
        ),
        UnitTheorySection(
          '世界各地的體積單位',
          '幾乎沒有哪個度量領域像體積這樣支離破碎。德文的'
              'Scheffel 視城市不同，從約 5 到 250 公升不等。'
              '英格蘭、美國與大英帝國光是加侖就有三種。'
              '美制加侖（3.79 公升）直到今天仍比'
              '英制（4.55 公升）小約五分之一。\n\n'
              '這些單位有許多仍存續著。全球的穀物貿易'
              '以「蒲式耳（Bushel）」計——美國關於玉米、黃豆與'
              '小麥的收成報告只用它。石油以 42 美制加侖'
              '為一「桶（Barrel）」交易，那是一種古老的英式酒桶'
              '單位。在英國與愛爾蘭，啤酒依法以'
              '英制品脫供應（568 毫升）。在日本，電鍋裡的量杯'
              '恰好是一「合（Gō）」。柴薪以堆積立方公尺、'
              '實積立方公尺，或在北美以「考得（Cord）」交易。\n\n'
              '在美國，立方單位深植於日常：引擎以'
              '立方吋標示（一具「350」），營建中的混凝土與泥土以'
              '立方碼計，天然氣以立方呎計。',
        ),
        UnitTheorySection(
          '空間中的十二——以及一個保留',
          '在立方體中，十二顯現得最為強烈。一立方呎是 1728'
              '立方吋——而 1728 是十二的三次方。寫成'
              '十二進位則是整齊的「1000」。這個數字有特別'
              '多的因數，因為它由二與三構成。一'
              '立方呎因此可以乾淨地對半分、三分、四分、'
              '六分以及八分。\n\n'
              '相對地，一立方公尺只能被二與五整除。'
              '三分之一立方公尺是 0.333…——一個無盡的數字。在常'
              '需三分的地方，十二便佔優勢。\n\n'
              '誠實的保留：這套漂亮的秩序只適用於'
              '從長度推導出的立方單位。古老的容量單位——蒲式耳、'
              '加侖、Scheffel——並不依循任何純粹的進位制。它們是從'
              '袋子與木桶中生長出來的，而非出自計算，並混雜了二、'
              '三以及全然不整齊的步級。',
        ),
        UnitTheorySection(
          '神聖的立方體',
          '立方體在許多文化裡都有特殊意義，因為'
              '長、寬、高相等——一幅完美的圖像。'
              '神廟與會幕中的至聖所都是立方形的。'
              '麥加的克爾白，其名意為「立方體」，是一座'
              '黑色的立方聖所。聖經中的「新耶路撒冷」'
              '也被描述為一座巨大的立方體。\n\n'
              '此外，在許多宗教中，公正的度量被視為'
              '神聖的義務。希伯來聖經要求「公正的'
              '伊法」；先知阿摩司控訴那些把尺度縮水的商人。'
              '《古蘭經》以整整一章談論那些斤兩不足的人。誰'
              '量錯了，就是犯罪——這個觀念遍佈'
              '全球。\n\n'
              '公制系統也承載著這種精神，只是世俗化了：它不'
              '從某位統治者，而是從地球本身推導出自己的尺度。'
              '公尺是地球周長的一個分數，立方公尺是它的'
              '空間——尺度出自自然，而非出自權力。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '圍繞著古老建築，流傳著一些大膽的體積理論。有些人'
              '聲稱，古夫金字塔藏有一種「金字塔品脫」或'
              '一種源自神聖的尺度。另一些人認為，'
              '石器時代的石圈使用了一種「巨石碼」，'
              '由它恰好能得出一品脫的立方體。\n\n'
              '學界認為這些已被駁斥。這類理論從'
              '眾多尺度中只挑出合適的，並把巧合解讀為'
              '刻意。讀來饒富興味，卻不是證據。',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          '從穀粒到負載',
          '重量到處都有兩個源頭。最小的單位來自'
              '種子與穀粒，大的則來自一個人或一頭'
              '牲口所能扛負的量。\n\n'
              '英文的「grain」字面上就是一粒大麥，約 65'
              '毫克。珠寶商的「克拉（Karat）」來自'
              '長角豆樹的種子。在印度，黃金以「Ratti」秤量，那是'
              '一種紅色豆科作物的種子。另一端則是負載：'
              '希臘的「他連得（Talent）」與印度的「Maund」大約就是'
              '一個人所能扛負的量。「噸（Tonne）」來自最大的'
              '酒桶，即「Tun」，裝滿時約重一噸。\n\n'
              '第三條線索把重量與金錢連在一起：舍客勒、德拉克馬、'
              '鎊與托拉，同時是貨幣名與重量名。金錢起初'
              '就是秤過的金屬——人們秤出白銀，而不是數'
              '錢幣。',
        ),
        UnitTheorySection(
          '鎊、盎司與羅馬遺產',
          '我們的重量詞彙源自羅馬。羅馬的「libra」是一架'
              '天平，也是一個約 329 公克的重量，分成十二'
              '「unciae」。由「libra」衍生出鎊的縮寫「lb」與'
              '英鎊的符號「£」。由「uncia」——字面意為「'
              '十二分之一」——既衍生出「盎司」也衍生出「吋」。\n\n'
              '從這個源頭長出兩套不同的系統。日常用的'
              '「常衡（Avoirdupois）」鎊分成 16 盎司——這個'
              '數字可以一再對半分。貴金屬交易用的「金衡'
              '（Troy）」鎊則保留了羅馬的十二盎司。一'
              '金衡盎司（即金衡安士）因此比一日常'
              '盎司重，金衡鎊卻比較輕——這是直到今天仍'
              '常見的混淆。',
        ),
        UnitTheorySection(
          '世界各地的重量單位',
          '幾乎每種文化都有自己的層級。美索不達米亞按'
              '六十進位以舍客勒、彌那與他連得計數。埃及以'
              '德本與凱特按十進位計算。中國直到今天仍'
              '使用斤、兩與小小的錢。在日本，「匁（Momme）」（3.75 公克）依法仍是'
              '全球珍珠貿易的單位。\n\n'
              '許多古老重量仍存續著。在英國與愛爾蘭，'
              '體重以一英石 14 鎊的「英石（Stone）」標示（「十一'
              '英石四」）。德文的鎊今天指整齊的 500 公克。在'
              '南亞，黃金以「托拉（Tola）」交易（約 11.7 公克）。而'
              '以色列的舍客勒承襲了一個遠古秤量重量的名字。\n\n'
              '有一個單位特別支離破碎：英石視貨物不同，'
              '時而 5 鎊、時而 8 鎊、時而 14 鎊。直到 19'
              '世紀的法律才建立起秩序。',
        ),
        UnitTheorySection(
          '天平作為象徵',
          '在許多文化裡，秤量不只是技術——它是'
              '公正的圖像。在古埃及，亡者審判中人們把'
              '心臟與真理之羽對秤。在荷馬筆下，宙斯舉起一架'
              '黃金天平來權衡英雄的命運。在伊斯蘭中，'
              '「米贊（Mizan）」在末日秤量人的行為，連一粒'
              '芥菜種的重量也不會遺漏。\n\n'
              '拉丁文的「libra」意為天平——故也是星座'
              '天秤座的由來，那是唯一一個不是生物的星座。許多宗教'
              '都要求誠實的度量：希伯來聖經稱不實的'
              '砝碼為可憎之物，《古蘭經》斥責那些斤兩不足的人。而'
              '「Talent」一詞從重量轉變為才能——經由'
              '聖經中那則託付他連得的比喻。',
        ),
        UnitTheorySection(
          '重量中的十二——以及一個保留',
          '十二主要藏在金衡系統裡：一鎊十二盎司，而'
              '黃金的純度以 24 克拉計（兩個十二）。這類數字'
              '受歡迎，是因為十二有六個因數——可以乾淨地'
              '對半分、三分與四分。十二的三分之一是'
              '乾淨的四；十的三分之一是 3.33…\n\n'
              '誠實的保留：日常重量並不依循十二。'
              '常衡鎊有 16 盎司——那是二進位，是'
              '不斷的對半分。美索不達米亞按六十進位計數。'
              '重量的世界因此是一張由二、三、十二'
              '與六十拼成的拼布——為了在貿易中分割而打造，而非為了在'
              '十進位中計算。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '對十二的偏愛從何而來？一個著名卻'
              '未經證實的猜測，把它追溯到數手指的指節：'
              '拇指依序點觸四指的三個指節——'
              '每隻手十二。數五輪，就到六十。\n\n'
              '第二個故事甚至已被駁斥：說克拉是建立在'
              '長角豆樹特別均勻的種子之上。'
              '這名字沒錯——但這些種子的重量其實波動得'
              '跟其他種子一樣大。所謂的均勻是一則神話。',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          '兩份遺產：巴比倫與埃及',
          '我們的時間來自兩個古老的源頭。小時來自'
              '埃及，分與秒來自巴比倫。\n\n'
              '埃及人把白天與黑夜各分成十二小時——'
              '大概是因為他們在夜裡看見十二個星座升起。'
              '由此產生了 24 小時的一天。但因為白天與黑夜'
              '長短不同，這些小時在夏天與冬天'
              '不一樣長。直到機械鐘才使它們相等。\n\n'
              '巴比倫按六十進位計算。因此我們有六十'
              '分鐘為一小時，六十秒為一分鐘。「分（Minute）」'
              '意為「被縮小的部分」，「秒（Sekunde）」意為「第二次縮小」。'
              '同樣的六十進位也藏在含 360 度的圓裡——'
              '時間與角度是親屬。',
        ),
        UnitTheorySection(
          '月、太陽與週',
          '日來自地球自轉，月來自月亮，年來自'
              '太陽。這三者並不乾淨地相合，而這'
              '幾乎解釋了所有曆法上的糾葛。\n\n'
              '一週有七天——大概是依著各約七天的四個'
              '月相。後來人們把七個肉眼可見的天體'
              '各配給一天。這個序列存活於許多'
              '語言中：英文裡「Saturday」是土星之日，在'
              '羅曼語裡「lundi/lunes」是月亮之日。日耳曼人用自己的'
              '神取代了羅馬諸神——木星之日變成了'
              '索爾之日，即「Thursday」。\n\n'
              '古老的計數方式也仍有迴響：英文的「fortnight」'
              '（十四夜）讓人想起，日耳曼人是以夜'
              '而非以日來計算的。',
        ),
        UnitTheorySection(
          '世界各地的時間',
          '並非各地的鐘都走得一樣。中國把一天分成十二'
              '個時辰，以動物命名——子時（鼠）落在'
              '午夜前後。日本把白天與黑夜各分成六段，'
              '它們隨著季節變長變短；專門的鐘'
              '必須據此調整。\n\n'
              '伊斯蘭曆純粹依著月亮，比太陽年短十一'
              '天——因此齋戒月緩慢地'
              '走過所有季節。馬雅人同時交織著好幾個'
              '週期，其中包括一個 260 天的神聖循環。在衣索比亞，'
              '一天直到今天仍從日出開始：在那裡是「六點」'
              '的時刻，在別處是正午。\n\n'
              '這些古老的節律有許多仍存續著——在節慶、禮拜時刻'
              '與吉日之中——而日常各地都依循格里高利'
              '曆。',
        ),
        UnitTheorySection(
          '時間的神聖數字',
          '時間幾乎到處也是神聖的。在巴比倫，十二與'
              '六十被視為完美的數字。在埃及，'
              '太陽神在十二個夜間時辰中穿越冥界。週的'
              '七在猶太傳統中代表完整——'
              '在第七天上帝歇息了。\n\n'
              '一個對比引人注目：對猶太教、基督教與伊斯蘭'
              '而言，時間筆直前行，朝向一個終點。在印度教中，它'
              '繞圈旋轉——巨大的世界時代，即「劫（Yugas）」，'
              '反覆地來而又去，創造神的一天'
              '長達數十億年。此外許多文化還畏懼年末'
              '那些多出來的日子，視之為危險的「中間時段」。',
        ),
        UnitTheorySection(
          '為什麼不用十進位——以及與十二的關聯',
          '時間是十進位制最頑強的對手。秒、'
              '分、時、日、週、月、年——這些步級沒有一個'
              '是整齊的十的倍數。\n\n'
              '原因又是可被整除性。一小時的三分之一'
              '是整齊的二十分鐘，四分之一是十五。用'
              '十就行不通了。十二與六十可以被'
              '三整除，十不行。\n\n'
              '人們還是試過十進位制。在法國大革命中'
              '曾有一天十小時、一小時一百'
              '分鐘。它只維持了約一年半。不同於長度'
              '與重量單位，這次改制並未帶來好處——'
              '舊的鐘本來各地就走得一樣。十二與'
              '六十的劃分就是更實用。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '人們是怎麼想到十二與六十的？一個優雅卻'
              '無法證明的想法：人們用拇指數'
              '四指的三個指節——每隻手十二——而五輪這樣的'
              '循環便得出六十。\n\n'
              '更遠處則有一些主張，說一年從前真的曾'
              '恰好有 360 天，並因宇宙災變而'
              '被改變。這沒有任何科學證據；'
              '360 更像是一個圓整、易於整除的計算數字。',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          '來自巴比倫的圓',
          '我們把整圓分成 360 度，一度分成 60 角分，'
              '一分分成 60 秒。這套秩序十分古老，來自'
              '美索不達米亞。巴比倫人按六十進位計算，那是一個'
              '有特別多因數的數字。\n\n'
              '為什麼偏偏是 360？他們的一年約有 360 天，而太陽'
              '在這期間每天約移動一度——日與度因此'
              '重合。這些詞洩露了源頭：「分（Minute）」來自'
              '拉丁文的「第一個小部分」，「秒（Sekunde）」來自「第二次'
              '縮小」。我們在時間上用的正是同樣的詞——'
              '角度與時間是出自同一巴比倫'
              '根源的手足。\n\n'
              '一個誠實的提示：為什麼成了 360 而不是 60，並沒有'
              '確切的記載。「每天一度」的說法是最可信的，'
              '但並非已被證明的解釋。',
        ),
        UnitTheorySection(
          '從星到時',
          '圓上的十二來自埃及。在那裡，十二個'
              '升起的星座劃分了黑夜——由此產生了十二個'
              '夜間時辰，最終產生了 24 小時的一天以及'
              '鐘面。\n\n'
              '希臘人把這套系統整理得井然有序。喜帕恰斯與後來的托勒密'
              '採用了 360 的劃分，並以此奠定了'
              '三角學的基礎。知識從那裡繼續流傳：印度'
              '學者發明了正弦表，伊斯蘭世界加以'
              '精煉。我們的詞「正弦（Sinus）」甚至是一個翻譯錯誤——由'
              '印度文表示「弓弦」的字，經由阿拉伯文成了'
              '拉丁文表示「海灣」的字。',
        ),
        UnitTheorySection(
          '世界各地的角度',
          '並非每種文化都把圓分得一樣。中國'
              '自成一格地計算：圓在那裡有 365¼ 個分劃——'
              '一年每一天各一個。直到歐洲影響才帶來 360。'
              '中國的風水羅盤把地平線分成 24 個'
              '方位。\n\n'
              '印度把黃道分成十二宮以及 27 個'
              '月宿。伊斯蘭天文學送給我們許多'
              '方位詞：「方位角（Azimut）」、「天頂（Zenit）」與「天底（Nadir）」全是'
              '阿拉伯文——尋找朝向麥加之禮拜方向的義務'
              '推動了角度之學。\n\n'
              '在海上，人們劃分羅盤花：四個主風，再來八個，再來'
              '32 個各 11¼ 度的點。把圓上全部 32 個背誦出來——「boxing'
              ' the compass」——是舵手的本領之一。'
              '地中海的風名 Tramontana、Levante、Scirocco 直到'
              '今天仍存活於氣象語言中。',
        ),
        UnitTheorySection(
          '神聖的方向與數字',
          '天空幾乎到處都是神聖的。對巴比倫人而言，'
              '天文學是諸神的訊息，黃道是他們的文字。'
              '十二被許多人視為神聖的數字——十二宮、'
              '十二位奧林匹斯神、十二支派、十二時辰。\n\n'
              '尤其廣泛的是四個方位的秩序。在'
              '印度教中，每個方位由各自的神守護，在中國則由'
              '各自的靈獸——東方青龍，西方白虎。'
              '拉科塔人的藥輪賦予每個方向顏色與意義。'
              '而在伊斯蘭中，禮拜的方向把整個世界圍繞著'
              '克爾白排列。\n\n'
              '較晚近的單位則刻意不帶這類象徵：'
              '弧度（Radiant）只依循數學，分度梯（Gon）依循法國'
              '大革命，軍用密位則僅依循'
              '彈道學。',
        ),
        UnitTheorySection(
          '圓中的十二與六十——以及一個保留',
          '360 是一個可整除性的奇蹟：它有 24 個因數。一個圓的'
              '三分之一、四分之一、六分之一全都得出整齊的度數。'
              '一個百分劃的圓做不到——三分之一會是'
              '33.33…\n\n'
              '人們試過十進位。在法國大革命中出現了'
              '400 分度梯的圓。它仍是測量者的一個小眾，因為'
              '400 的因數比 360 少。十進位時間也失敗了——'
              '原因之一是它無法被乾淨地四分。\n\n'
              '誠實的保留：360 並非必然。中國的'
              '365 分劃證明了這點。而在高等數學中，'
              '弧度勝出，因為在那裡重點不在於可整除性，而在於'
              '簡單的公式。十二的世界因此很強，卻並非'
              '別無選擇。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '對十二與六十的偏愛從何而來？那個著名卻'
              '未經證實的猜測：來自數手指的指節。拇指'
              '依序點觸四指的三個指節——每隻手十二——而'
              '五輪循環便得出六十。\n\n'
              '一個數字上的對應引人入勝：北歐傳說給瓦爾哈拉'
              '540 道門，每一道走出 800 名戰士——加起來'
              '432000，與印度的一個世界時代是同一個數字。學界'
              '認為這是巧合，而非共同的遺產。'
              '說起來很美，卻不是證據。',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          '金錢曾是重量',
          '在錢幣出現之前的漫長歲月裡，金錢是秤過的金屬。人們秤出'
              '白銀或穀物。因此最古老的金錢名字'
              '其實是重量名。\n\n'
              '在美索不達米亞，人們以舍客勒、彌那與他連得計數——按'
              '六十進位，六十舍客勒為一彌那。舍客勒'
              '起先是一個重量，以大麥校準。希臘的'
              '「德拉克馬（Drachme）」字面意為「一把」，也就是六根細'
              '金屬籤。\n\n'
              '引人注目的是：鑄造出來的多半只有最小的錢幣。大的'
              '單位如彌那與他連得是純粹的計算量——沒有人'
              '把一個他連得握在手裡，人們只用它來計算。',
        ),
        UnitTheorySection(
          '鎊、先令、便士',
          '歐洲的金錢源自羅馬。錢幣「Denarius」給了'
              '便士縮寫「d」，並給了許多語言表示金錢的詞'
              '（西班牙文「dinero」，阿拉伯文「Dinar」）。\n\n'
              '查理大帝把它重新整理：一鎊白銀（libra）= 20'
              '先令（solidus）= 240 芬尼（denarius），也就是十二芬尼'
              '為一先令。這裡同樣只有芬尼是真正的'
              '錢幣；鎊與先令是用來計算的。這套系統'
              '維持了一千多年。\n\n'
              '英格蘭把它採納為鎊、先令、便士——即「£sd」。'
              '符號「£」是一個花飾的 L，代表「libra」，即天平。於是'
              '金錢與星座天秤座以及重量鎊'
              '繫於同一個字。',
        ),
        UnitTheorySection(
          '世界各地的錢幣',
          '幾乎每個地區都有自己的層級。在南德地區通行'
              '六十克羅采為一盾——又是巴比倫的'
              '六十。源自波希米亞 Joachimsthal 的「塔勒（Taler）」給了'
              '「美元（Dollar）」這個名字。瑪麗亞・特蕾莎塔勒如此受歡迎，'
              '以至於它在 20 世紀仍在阿拉伯與衣索比亞作為金錢'
              '通行。\n\n'
              '別處的金錢樣貌全然不同。在西非，人們'
              '幾世紀以來用瑪瑙貝付款。阿茲特克人用'
              '可可豆作為小額貨幣，用標準化的斗篷作為大額貨幣——'
              '以二十為單位計數。印度把盧比分成 16 安那，'
              '中國把有孔的錢幣串成一串。\n\n'
              '西班牙的「八里亞爾（Stück-zu-acht）」美元可以掰成八份。'
              '其中兩份就是「two bits」——直到今天仍是'
              '美國對二十五美分硬幣的暱稱。',
        ),
        UnitTheorySection(
          '金錢、信仰與象徵',
          '錢幣往往不只是支付工具。希臘人在亡者'
              '口中放一枚錢幣——付給卡戎的渡資，由他把靈魂'
              '渡過冥河。沒有錢幣，靈魂就留在岸邊。\n\n'
              '在《新約》中，耶穌舉起一枚帶有皇帝肖像的第納爾：'
              '「凱撒的歸給凱撒。」猶大的三十塊銀錢'
              '大概是來自泰爾的舍客勒——偏偏是'
              '上頭刻著一位異教神祇的錢幣，同時又是官方的'
              '聖殿貨幣。\n\n'
              '而神聖的十二一再出現：猶太教與基督教中有十二支派'
              '與十二使徒，印度教中有十二位太陽神，佛教中有'
              '十二因緣，什葉派中有十二位伊瑪目，中國有'
              '十二地支。這個數字把金錢、'
              '曆法與信仰連結起來。',
        ),
        UnitTheorySection(
          '為什麼是十二與二十——以及一個保留',
          '所有這些不整齊層級的原因是可整除性。一盾'
              '六十克羅采可以乾淨地三分：二十克羅采。'
              '相對地，三分之一美元是 33.33… 美分——一個無盡的數字。'
              '在貿易中常需分割的人，用十二、二十或六十'
              '會比用十更得心應手。\n\n'
              '因此十二在貿易中存續著：一打（12）、一籮（Gros，'
              '144）以及大籮（1728）。一籮在倫敦與在'
              '紐約都是同樣的量。\n\n'
              '誠實的保留：舊的金錢並不是純粹的'
              '十二進位系統。一鎊中的二十先令是一種'
              '二十進位邏輯（手指與腳趾）。而 1971 年英國'
              '改成一鎊一百便士——雖然有些混亂，'
              '卻是永久性的。今天幾乎全世界都按十進位計算。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '為什麼這麼多文化選擇了十二？那個著名卻'
              '未經證實的猜測把它追溯到數手指的指節：'
              '四指上的三個指節，由拇指依序點觸，'
              '便得出十二。\n\n'
              '其他詮釋走得更遠：說十二是「三乘四」，'
              '天乘地，一個代表完整的數字。有些人甚至'
              '聲稱，一位帶著十二位同伴的太陽神是'
              '十二使徒的原型。這類對應是詮釋，而非'
              '確鑿的歷史——請審慎品味。',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          '從驗溫器到溫度計',
          '溫度是一項晚近的發明。長久以來人們只能'
              '感覺熱，無法測量熱。邁出第一步的是這樣的觀察：'
              '空氣與液體遇熱會膨脹。\n\n'
              '約於 1600 年，伽利略・伽利萊製作了一具「驗溫器」：一個帶管的'
              '玻璃球，裡頭的水位會升降。它能顯示'
              '熱，卻沒有刻度。第一個數字刻度由醫師'
              'Santorio 在不久後加上去——一具溫度計就是一具'
              '帶刻度的驗溫器。\n\n'
              '為了使測量可以比較，需要固定的參照點。'
              '人們協議採用自然點：水的冰點與'
              '沸點。直到今天所有刻度都繫於它們。',
        ),
        UnitTheorySection(
          '三種刻度，三個零點',
          '這些知名的刻度，差異主要在於它們把'
              '零點放在哪裡。\n\n'
              '丹尼爾・華倫海特約於 1724 年把他的零點設在他'
              '能可靠製出的最冷之處：一種冰、'
              '水與鹽的混合物。純水的冰點他定在'
              '32，體溫定在 96。如此一來，正常的冬天就不會'
              '低於零。後來人們把刻度重新校準在冰點（32）與'
              '沸點（212）——兩者之間恰好 180 度。\n\n'
              '列氏（Réaumur）選了 0 與 80。攝氏（Celsius）則把 0 與 100 設在'
              '冰點與沸點——而且一開始甚至把刻度排'
              '反了（0 是沸點）。直到他死後'
              '人們才把它轉成今天的形式。圓整的 100 劃分'
              '完美地契合了新的公制系統。',
        ),
        UnitTheorySection(
          '為什麼世界各地量法不同',
          '今天幾乎全世界都用攝氏——它隨著公制'
              '系統而來。最大的例外是美國以及一些與'
              '它緊密相連的國家，它們留在華氏。1975 年的一條'
              '法律使那裡的改制成了自願，於是一切'
              '照舊。\n\n'
              '舊的刻度很頑強。列氏在 18 與 19 世紀於'
              '法國、德國與俄國頗為流行，並在'
              '俄國特別持久。因此俄國文學——'
              '例如杜斯妥也夫斯基或托爾斯泰——談到「幾度'
              '嚴寒」時，指的是列氏度。\n\n'
              '哪種刻度感覺起來「比較自然」，純屬習慣。'
              '攝氏把自己繫於水，華氏粗略地從 0'
              '（非常冷）到 100（非常熱）涵蓋了人所感受的天氣。兩者'
              '都是約定俗成，並無客觀的優劣。',
        ),
        UnitTheorySection(
          '火與冰',
          '在幾乎所有文化裡，熱與冷都承載著深刻的意義——'
              '而引人注目的是，兩者往往同時代表創造與'
              '懲罰。\n\n'
              '在北歐傳說中，世界誕生於火之國穆斯佩爾海姆'
              '與冰之國尼夫爾海姆之間的張力——'
              '寒冷在這裡並非惡，而是一種創造之力。'
              '地獄多半被想像成火，然而在但丁的'
              '《地獄篇》中，最底層卻是一座冰封的湖：背叛就是'
              '一切人類溫情的冷卻。佛教既知道'
              '熱地獄，也知道冷地獄，按罪過分級。\n\n'
              '火在別處則是神聖而潔淨的：印度教的阿耆尼、'
              '祆教的不滅之火。而「涅槃」一詞字面意為'
              '「熄滅」——熄滅內在的燃燒。',
        ),
        UnitTheorySection(
          '真正的零點：凱氏',
          '溫度究竟是什麼？它是一個衡量最微小'
              '粒子運動有多快的尺度。熱意味著：粒子'
              '抖動得更厲害。\n\n'
              '由此可知存在一個最低的可能溫度——'
              '在這一點上，這種運動最微弱。這就是'
              '−273.15 °C 的絕對零度。再冷就不可能了。凱爾文勳爵'
              '在 1848 年把一條刻度恰好定在那裡：零凱氏是絕對'
              '零度，一個凱氏步級與一個攝氏度一樣大。\n\n'
              '唯有這條刻度才容許真正的比例：200 凱氏真的'
              '比 100 「熱」一倍。在攝氏或華氏中'
              '這不成立——「20 度比 10 度熱一倍」'
              '根本是錯的。因此對科學而言，凱氏是'
              '基本單位。',
        ),
        UnitTheorySection(
          '為什麼十二在這裡幾乎幫不上忙——誠實地說',
          '在其他度量上，十二很強，因為一個量能被乾淨地'
              '分割：三分之一呎是整齊的四吋。在'
              '溫度上，這個論點站不住腳——而這應該誠實地'
              '說出來。\n\n'
              '原因是被移動過的零點。攝氏零度'
              '並不意味著「沒有熱」，而只意味著「水結冰」。'
              '因此溫度無法有意義地對半分或'
              '三分——在這樣一條刻度上沒有「熱一半」這回事。'
              '十二那漂亮的可整除性在這裡落了空。\n\n'
              '只有一處仍藏著可整除性的思維：在刻度'
              '本身的劃分裡。華氏的 96 以及到冰點的 64 個'
              '步級往往可以對半分。但要把顯示'
              '分成 10、12 還是 100 個步級，純屬表面工夫。'
              '溫度是那個誠實的反例：在這裡進位制的選擇'
              '無關緊要——真正的陳述藏在絕對'
              '零度裡，而不在刻度的劃分中。',
        ),
        UnitTheorySection(
          '臆測之說（請審慎看待）',
          '圍繞著華氏的刻度流傳著一些傳說。一說稱，96 是'
              '他生病妻子的發燒體溫——這沒有'
              '任何證據。另一說稱，零是他家鄉但澤'
              '最冷的冬天；更可能的是那個'
              '可重現的冰鹽混合物。\n\n'
              '甚至連華倫海特本人對其固定點的解釋，也被認為'
              '部分是事後美化過的——許多東西他根本是承襲自'
              '天文學家 Rømer 較早的刻度。動人的故事，但'
              '請審慎閱讀。',
        ),
      ];
    // Alle acht Theorie-Bereiche sind nun auf Deutsch vorhanden.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesZhHant(UnitCategory cat) {
  switch (cat) {
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
