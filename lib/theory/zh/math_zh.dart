// “十二进制数学”章节的简体中文散文。属于 ../math_theory.dart 的一部分。
// 对复杂主题使用简单、清晰的句子（更易于翻译）。应用内部机制章节
// 取材自源代码（logic/rational.dart、logic/expression.dart、state.dart）；
// 数学／历史章节则提炼自 docs/research/math_*.md。
//
// 顺序约定：数学与历史章节排在前面；应用内部机制章节
//（“这台计算器如何计算”）始终放在最后。

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersZh() => const [
  ProseChapter('约数、分数与循环节', [
    ProseSection(
      '为什么十二如此易于整除',
      '在十二进制里我们写十二个数字：0 到 9，再加上 A 表示十、'
          'B 表示十一。所以这里的“10”指的是十二。\n\n'
          '十二可以被特别多的数整除：1、2、3、4、6 和 12。'
          '而十只能被 1、2、5 和 10 整除。原因在于这些数的构造：'
          '十是二乘五，十二是二乘二乘三。十二把它的构造因子放进了'
          '小而常用的约数 2 和 3 里——因此它能被 3 和被 4 整除，'
          '而十在这两点上做不到。大小并不是关键：16 更大，'
          '但只能被 2 的幂整除。',
    ),
    ProseSection(
      '哪些分数能整除得尽',
      '一个分数是否会得到有限小数，取决于一条简单的'
          '规则：当且仅当分母只由该进制的质因子组成时，它才会除尽。\n\n'
          '因为十二里含有三，许多日常分数在十二进制下都会除尽：'
          '二分之一 = 0,6；三分之一 = 0,4；四分之一'
          '= 0,3；六分之一 = 0,2；九分之一 = 0,14；十二分之一 = 0,1。'
          '而在十进制下，三分之一、六分之一和九分之一却会'
          '无限延续。十二的代价是：分母含五的分数会变得'
          '不规整——五分之一在十二进制下是 0,2497，并且会循环。',
    ),
    ProseSection(
      '当它开始循环',
      '如果一个分数除不尽，那么从某一位起就会重复一组固定的'
          '数字——这就是循环节。它有多长，遵循数论中一条清晰的'
          '规则，并取决于进制和分母。\n\n'
          '有些情况在两个世界里同样棘手：七分之一在'
          '十进制（0,142857）和十二进制（0,186A35）里都有一个'
          '六位的循环节。总体而言，在较小的分母中，'
          '十二进制下的循环分数比十进制下略少一些'
          '——但作为代价，循环节一旦出现，长度可能会稍微'
          '长一些。',
    ),
    ProseSection(
      '一眼看出整除性',
      '十二的优势在整除规则上体现得很实际。'
          '一个数能否被 2、3、4 或 6 整除，在十二进制下'
          '只看最后一位就能知道。在十进制下，这只对 2、'
          '5 和 10 成立。\n\n'
          '对于十一（B），有一条数字和规则——就和十进制里'
          '熟知的“弃九法”一样，因为十二比十一大一。'
          '只有七，和十进制里一样，没有'
          '简单的检验法。',
    ),
    ProseSection(
      '没有一种进制处处占优',
      '所以十二在三等分和四等分上确实有优势——'
          '但在五等分上确实有劣势，而五等分对百分比和金钱'
          '很重要。它是用一头换另一头。\n\n'
          '约数越多也并非越好：否则六十就会更占优势，'
          '它能被更多的数整除——但它需要六十个数字和一张'
          '庞大的乘法表。十二进制学会把十二看作一个良好的折中：'
          '只需两个额外符号，乘法表小，却拥有约数 2、3 和'
          '4。这是他们的权衡，而非证明。',
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
  ProseChapter('各种数制的比较', [
    ProseSection(
      '什么是进制',
      '位值系统按每个数字的位置赋予它一个值。'
          '进制说明有多少个数字，以及每一位以怎样的'
          '倍数增长。十进制用十个数字，十二进制'
          '用十二个（0–9、A、B），二进制只用两个（0 和 1）。\n\n'
          '同一个数在不同进制下看起来不一样，但表示的是同一件事。'
          '小进制需要很多位（二进制会变得很长），'
          '大进制则需要很多不同的符号。',
    ),
    ProseSection(
      '六种进制的小档案',
      '• 二进制：计算机的语言——一个开关要么开'
          '要么关。\n'
          '• 八进制：如今属于小众用途，例如 Unix 下的'
          '文件权限。\n'
          '• 十进制：我们的日常生活和公制系统。\n'
          '• 十二进制：一打、钟表和英寸——也是'
          '十二进制运动的主张。\n'
          '• 十六进制：计算机数据的紧凑'
          '写法。\n'
          '• 六十进制：时间和角度，是巴比伦的遗产。',
    ),
    ProseSection(
      '在各进制之间换算',
      '数字按固定的方法从一个进制转到另一个进制。'
          '整数部分要反复除以目标进制，并把'
          '余数从下往上读出来。小数部分则反复'
          '乘以目标进制，并把整数部分从上'
          '往下读出来。\n\n'
          '例如：0,5 在十二进制下变成 0,6；0,125 变成 0,16。'
          '在相关联的进制之间还更简单：因为十六'
          '是二的幂，一个十六进制数字恰好对应四'
          '个二进制位——只需分组即可。',
    ),
    ProseSection(
      '哪种进制属于哪个领域',
      '计算机用二进制运算，因为一个晶体管只有两种状态。'
          '十六进制是其方便的速记法——它出现在'
          '内存地址、像 #FF00FF 这样的网页颜色以及 Unicode 编号里。'
          '时间和角度遵循六十：六十分钟、360 度，'
          '易于分成三等分和四等分。日常生活和几乎整个'
          '科学界都用十进制——主要是出于习惯，也因为'
          '公制系统建立在它之上。\n\n'
          '十二仍存活于一打、罗（Gros）、钟表和英寸之中。自十八'
          '世纪以来就有人主张真正的十二进制运算——'
          '从布丰，到艾萨克·皮特曼，再到弗兰克·埃默森·安德鲁斯，'
          '后者在 1935 年写出了第一本相关著作。专门的学会至今'
          '仍在培育这一理念；更多内容见“十二进制学会”这一板块。',
    ),
    ProseSection(
      '没有一种进制处处最好',
      '每种进制都有它的用途。二和十六并不是“对'
          '人类更好”，而是对机器最理想。十是熟悉的、根基'
          '牢固的。十二能漂亮地分成三等分和四等分，却'
          '在五等分上吃亏。六十分得最好，但用六十个符号'
          '对日常来说太大了。\n\n'
          '说到度量系统，最终重要的与其说是进制本身，不如说是'
          '坚持只用单一进制的彻底程度：'
          '公制之所以胜出，是因为一切都基于同一个十——'
          '一个由英里、码、英尺和英寸混合而成的系统在'
          '任何进制下都不会有这种优势。',
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
  ProseChapter('位值系统简史', [
    ProseSection(
      '位值之前',
      '很长时间里，人们通过把符号累加起来书写数字。罗马'
          '数字就是这样一种系统：XVII 表示十加五加一'
          '加一。它便于读出，但运算起来很费力，而且'
          '大数会变得难以处理。\n\n'
          '巨大的飞跃是位值系统：同一个数字'
          '因位置不同而表示不同的东西。正是它才使得'
          '用任意大的数进行笔算变得简单——并且'
          '需要一个表示“此位无物”的数字：零。',
    ),
    ProseSection(
      '巴比伦与六十',
      '第一个真正的位值系统诞生于苏美尔人和'
          '巴比伦人之中，在四千多年前，采用六十进制。它'
          '被视为他们最伟大的数学成就。\n\n'
          '不过他们还没有完整的零：他们知道一个'
          '用于中间空位的占位符号，却从不用在'
          '一个数的末尾。他们的遗产至今仍伴随我们——存在于一小时的'
          '六十分钟和一个圆的 360 度之中。',
    ),
    ProseSection(
      '印度对零的发明',
      '如今带有零的十进制系统来自印度。阿耶波多'
          '在 5 世纪使用了位值写法；婆罗摩笈多'
          '在 628 年首次把零当作一个有自己'
          '运算规则的独立数来处理，而不仅仅是一个空缺。\n\n'
          '阿拉伯和波斯的学者从那里接受了它——'
          '花拉子米约在 825 年写到过它——并经由他们传入'
          '欧洲。因此我们的数字至今仍被称为“阿拉伯'
          '数字”，尽管这个理念源自印度。',
    ),
    ProseSection(
      '机器的进制',
      '随着计算机的出现，新的进制也随之而来。戈特弗里德·威廉·莱布尼茨'
          '在 1703 年发表了只由 0 和 1 组成的二进制系统——他甚至'
          '在其中重新认出了中国《易经》古老的'
          '卦象。\n\n'
          '今天计算机用二进制运算，却大多用'
          '十六进制书写：随着 1960 年代 IBM System/360 的'
          '8 位字节，十六进制确立了地位，因为两个十六进制数字'
          '恰好构成一个字节。每种进制就这样找到了自己的位置——不是'
          '因为它“最好”，而是因为它'
          '契合自己的任务。',
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
  ProseChapter('这台计算器如何计算', [
    ProseSection(
      '二合一的计算器',
      '当你按下等号键时，应用并不是只算一次，'
          '而是算两次——用两台完全不同的机器。\n\n'
          '第一台是精确的分数计算器。它不做任何'
          '舍入，使用任意大的整数。第二台是一台'
          '快速的小数计算器，几乎每台袖珍计算器都有这种——'
          '它以有限的精度运算，但能算一切，包括'
          '正弦、平方根和对数。每次按下等号，两台都会'
          '启动。',
    ),
    ProseSection(
      '精确的分数',
      '分数计算器把数字保持为两个整数之比。'
          '三分之一就真的是三分之一，而不是 0,333…。只有'
          '到显示时它才把分数转换为十二进制的小数位。\n\n'
          '在此过程中它会识别小数位是否开始重复。'
          '三分之一在十二进制下是规整的 0,4。而五分之一则会'
          '循环：0,2497 2497 2497 …。应用会用一条横线'
          '标在重复的那组数字上方，再用一个点来标记'
          '循环节的开端。这样结果就保持精确，而不是'
          '被悄悄舍入。',
    ),
    ProseSection(
      '当分数不够用时',
      '有些运算无法写成分数。一旦出现'
          '正弦、平方根、对数或类似的函数'
          '——或者发生除以零——分数计算器就会'
          '放弃。\n\n'
          '这时小数计算器登场。它的结果只是'
          '近似的，因此应用会在它前面加上一个“≈”符号：'
          '“大约”。如果两条路都走得通，永远是精确的分数胜出。'
          '所以“≈”只会出现在真正需要近似的地方。',
    ),
    ProseSection(
      '长循环节与显示屏',
      '精确的结果可能会变得非常长。有些分数的'
          '循环节超过一百位——远比一行容得下的'
          '要多。\n\n'
          '为了不让任何内容溢出显示屏，应用会从右边省去'
          '尽可能多的靠后（最低位）的位数，直到剩下的部分'
          '能放进这一行，并放上一个“…”，作为后面'
          '还有内容的标记。循环节的标记也会随之干净地'
          '一并缩短。所以这个数仍然是诚实的：被截掉的内容'
          '会被明显地标示出来，而不是被藏起来。',
    ),
  ]),
];
