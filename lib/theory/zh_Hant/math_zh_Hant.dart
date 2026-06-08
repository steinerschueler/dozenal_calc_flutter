// 「十二進位數學」章節的繁體中文散文。part of
// ../math_theory.dart。針對複雜主題使用簡單、清晰的句子（較易翻譯）。
// 應用程式內部運作章節取自原始碼
// （logic/rational.dart、logic/expression.dart、state.dart）；數學／歷史
// 章節則由 docs/research/math_*.md 提煉而成。
//
// 排序慣例：數學與歷史章節在前；應用程式內部運作章節
// （「這台計算機如何運算」）保留在最後。

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersZhHant() => const [
  ProseChapter('因數、分數與循環節', [
    ProseSection(
      '為何十二如此容易整除',
      '在十二進位中，我們會寫出十二個數字：0 到 9，再加上代表十的 A '
          '和代表十一的 B。因此這裡的「10」其實代表十二。\n\n'
          '十二可以被特別多的數整除：1、'
          '2、3、4、6 和 12。十則只能被 1、2、5 和 10 整除。其'
          '原因藏在數字的組成方式裡：十是二乘以五，十二'
          '是二乘以二乘以三。十二把它的組成因子放進了'
          '較小、較常用的因數 2 和 3 — 因此能被 3 和 '
          '4 整除，而十在這方面卻辦不到。數值大小並不'
          '是關鍵：16 比較大，卻只能被 2 的次方'
          '整除。',
    ),
    ProseSection(
      '哪些分數會整除',
      '一個分數會不會化成有限小數，取決於一條簡單的'
          '規則：當且僅當分母只由基底的'
          '質因數組成時，它才會整除。\n\n'
          '因為十二之中含有三，許多日常分數在'
          '十二進位中都會整除：二分之一 = 0.6；三分之一 = 0.4；四分之一 '
          '= 0.3；六分之一 = 0.2；九分之一 = 0.14；十二分之一 = 0.1。'
          '相對地，在十進位中，三分之一、六分之一和九分之一卻會'
          '無限延續。十二的代價是：分母含五的分數會變得'
          '不規則 — 五分之一在十二進位中是 0.2497，並會循環。',
    ),
    ProseSection(
      '當它開始循環',
      '若一個分數無法整除，從某一位開始就會有一組固定的'
          '數字反覆出現 — 也就是循環節。它有多長，遵循一條明確'
          '的數論規則，並取決於基底與分母。\n\n'
          '有些情況在兩種進位裡同樣棘手：七分之一在'
          '十進位（0.142857）和十二進位（0.186A35）中都有'
          '六位的循環節。整體而言，在十二進位中，較小分母的'
          '循環分數比在十進位中略少一些'
          '— 不過當循環節出現時，它們的長度可能會'
          '稍長一些。',
    ),
    ProseSection(
      '一眼看出整除性',
      '十二的優勢在整除規則上格外明顯。'
          '一個數能否被 2、3、4 或 6 整除，在十二進位中'
          '看最後一位數字就知道了。在十進位中，這只對 2、'
          '5 和 10 成立。\n\n'
          '對於十一（B），有一條數字和規則 — 就跟'
          '十進位中眾所周知的九的驗算法一樣，因為十二比十一'
          '多一。只有七，就像在十進位中一樣，沒有'
          '簡單的判別法。',
    ),
    ProseSection(
      '沒有任何基底處處皆優',
      '因此十二在三等分和四等分上有真正的優勢 — '
          '但在五等分上也有真正的劣勢，而五等分對百分比和金錢'
          '很重要。它是以一者換取另一者。\n\n'
          '因數更多也不見得就一味更好：否則'
          '六十就會佔上風，因為它能被更多的數整除 — 但'
          '它會需要六十個數字以及一張龐大的乘法表。'
          '十二進位的提倡團體把十二視為良好的折衷：只多'
          '兩個額外符號、乘法表很小，卻擁有因數 2、3 和 '
          '4。這是他們的權衡，並非證明。',
    ),
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('各種數字基底的比較', [
    ProseSection(
      '什麼是基底',
      '位值制依據每個數字的位置賦予它一個值。'
          '基底說明了一共有多少個數字，以及每一位'
          '是以多少倍成長。十進位使用十個數字，十二'
          '進位使用十二個（0–9、A、B），二進位只有兩個（0 和 1）。\n\n'
          '同一個數依基底不同而看起來不一樣，但意思相同。'
          '小基底需要很多位數（二進位會變得很長），'
          '大基底則需要很多不同的符號。',
    ),
    ProseSection(
      '六種基底速寫',
      '• 基底 2（二進位）：電腦的語言 — 一個開關不是開'
          '就是關。\n'
          '• 基底 8（八進位）：如今是個小眾用途，例如 '
          'Unix 下的檔案權限。\n'
          '• 基底 10（十進位）：我們的日常與公制系統。\n'
          '• 基底 12（十二進位）：一打、時鐘和英寸 — 也是'
          '十二進位運動的訴求。\n'
          '• 基底 16（十六進位）：電腦資料的'
          '精簡寫法。\n'
          '• 基底 60（六十進位）：時間與角度，源自巴比倫的遺產。',
    ),
    ProseSection(
      '在各基底之間換算',
      '數字依固定的方法從一種基底轉換到另一種。'
          '整數部分要反覆除以目標基底，並由下往上'
          '讀取餘數。小數部分則反覆'
          '乘以目標基底，並由上往下'
          '讀取整數位。\n\n'
          '範例：0.5 在十二進位中變成 0.6；0.125 變成 0.16。'
          '在彼此相關的基底之間更為簡單：因為十六'
          '是二的次方，一個十六進位數字正好對應四'
          '個二進位位 — 只需分組即可。',
    ),
    ProseSection(
      '哪種基底適合用在何處',
      '電腦以二進位運算，因為電晶體只有兩種狀態。'
          '十六進位是它便利的簡寫 — 它出現在'
          '記憶體位址、像 #FF00FF 這樣的網頁色彩，以及 Unicode 編號中。時間'
          '與角度遵循六十：六十分鐘、360 度，容易'
          '分成三分之一和四分之一。日常生活與幾乎整個'
          '科學界都以十進位運作 — 主要是出於習慣，也因為'
          '公制系統建立在它之上。\n\n'
          '十二則在一打、籮、時鐘和英寸中延續著。自 18 '
          '世紀起就有人提倡真正的十二進位運算 — '
          '從布豐、艾薩克・皮特曼，到 1935 年寫下第一本'
          '相關書籍的法蘭克・愛默生・安德魯斯。專門的學會至今'
          '仍在推動這個理念；更多內容見「十二進位學會」一節。',
    ),
    ProseSection(
      '沒有任何基底處處最佳',
      '每種基底都有其用途。二和十六並非「對'
          '人類更好」，而是對機器最理想。十既熟悉又'
          '根深蒂固。十二能漂亮地分成三分之一和四分之一，卻'
          '在五分之一上吃虧。六十的分割能力最強，但有六十個符號'
          '對日常生活而言太過龐大。\n\n'
          '說到度量衡系統，最終重要的與其說是基底本身，不如說是'
          '堅持只用單一基底的徹底程度：'
          '公制系統之所以勝出，是因為一切都圍繞著同一個十運作 — '
          '由英里、碼、英尺和英寸混合而成的系統，在任何'
          '基底下都不會有這項優勢。',
    ),
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('位值制的簡史', [
    ProseSection(
      '在位值出現之前',
      '長久以來，人們是透過把符號相加來寫數字。羅馬'
          '數字就是這樣一種系統：XVII 代表十加五加一'
          '加一。它便於辨讀，卻不利於運算，而且'
          '大數會變得難以處理。\n\n'
          '巨大的飛躍是位值制：同一個數字'
          '依位置不同而代表不同的意義。唯有如此，才能讓'
          '用任意大的數做筆算變得簡單 — 並'
          '需要一個代表「這一位什麼都沒有」的數字：零。',
    ),
    ProseSection(
      '巴比倫與六十',
      '第一個真正的位值制出現於蘇美人和'
          '巴比倫人之間，距今四千多年前，採用基底六十。它'
          '被視為他們最偉大的數學成就。\n\n'
          '不過他們還沒有完整的零：他們知道一個'
          '用來表示中間空位的佔位符號，卻從未用於一個數的'
          '末尾。他們的遺產直到今天仍伴隨著我們 — 體現在一小時的六十'
          '分鐘，以及圓的 360 度之中。',
    ),
    ProseSection(
      '印度發明了零',
      '今天帶有零的十進位系統來自印度。阿耶波多'
          '在 5 世紀使用了位值寫法；婆羅摩笈多'
          '於 628 年首次把零視為一個有自身'
          '運算規則的獨立數字，而不僅僅是一個空缺。\n\n'
          '阿拉伯與波斯的學者從那裡承襲了它 — '
          '花拉子米約於 825 年寫下相關著作 —，並經由他們傳入'
          '歐洲。因此我們的數字至今仍叫做「阿拉伯'
          '數字」，儘管這個概念源自印度。',
    ),
    ProseSection(
      '機器的基底',
      '隨著計算機器的出現，新的基底也來臨了。哥特佛萊德・威廉・萊布尼茲'
          '於 1703 年發表了僅由 0 和 1 組成的二進位系統 — 他甚至'
          '在其中重新看見了中國《易經》的古老'
          '卦象。\n\n'
          '如今電腦以二進位運算，但大多以'
          '十六進位書寫：隨著 1960 年代 IBM System/360 的 '
          '8 位元位元組，基底十六確立了地位，因為兩個十六進位數字'
          '正好構成一個位元組。每種基底就這樣找到了自己的位置 — 不是'
          '因為它「最好」，而是因為它'
          '適合它的任務。',
    ),
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
  ProseChapter('這台計算機如何運算', [
    ProseSection(
      '兩台計算機合而為一',
      '當你按下等號鍵時，這個應用程式並不只算一次，'
          '而是算兩次 — 用兩台截然不同的機器。\n\n'
          '第一台是精確的分數計算機。它完全不'
          '四捨五入，使用任意大的整數運算。第二台是'
          '快速的小數計算機，幾乎每台計算機都有 — '
          '它以有限的精度運算，但能處理一切，包括'
          '正弦、平方根和對數。每按一次'
          '等號，兩者都會同時啟動。',
    ),
    ProseSection(
      '精確的分數',
      '分數計算機把數字保存為兩個整數的'
          '比值。三分之一真的就是三分之一，而不是 0.333… 只有'
          '在顯示時，它才把分數轉換成十二進位的小數位。\n\n'
          '在此過程中，它會辨識小數位是否開始循環。三'
          '分之一在十二進位中正好是 0.4。五分之一則會'
          '循環：0.2497 2497 2497 … 應用程式會在'
          '反覆出現的那一組數字上方加一條橫線，並以一個點標出'
          '循環節的起始。如此一來結果便保持精確，而不會被'
          '悄悄四捨五入。',
    ),
    ProseSection(
      '當分數不夠用時',
      '有些運算無法寫成分數。一旦出現'
          '正弦、平方根、對數或類似的函式 — 或是除以'
          '零 —，分數計算機就會'
          '放棄。\n\n'
          '這時小數計算機就會接手。它的結果只是'
          '近似的，因此應用程式會在它前面加上一個「≈」符號：'
          '「大約」。若兩條路徑都行得通，總是由精確的分數勝出。'
          '所以「≈」只會出現在真正需要近似的地方。',
    ),
    ProseSection(
      '長循環節與顯示',
      '精確的結果可能變得非常長。有些分數的'
          '循環節超過一百位 — 遠多於一行所能'
          '容納的數量。\n\n'
          '為了不讓任何內容溢出顯示區，應用程式會從右邊省去'
          '最末端（最低位）的若干位，直到剩餘部分能'
          '放進該行為止，並加上一個「…」作為後面'
          '仍有內容的標記。循環節標記也會'
          '一併乾淨地縮短。因此這個數依然誠實：被截去的部分'
          '會明顯地顯示出來，而不是被藏起來。',
    ),
  ]),
];
