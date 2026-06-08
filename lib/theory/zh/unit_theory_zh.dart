// 中文（简体）单位理论文本。属于 ../unit_theory.dart。
// 正文保持简短的句子（便于翻译）。从 docs/research/ 中的研究资料提炼而来。
// `count` 故意没有条目——一打/十二的故事写在应用的 12 个教学章节里。

part of '../unit_theory.dart';

List<UnitTheorySection> _unitTheoryZh(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          '源自身体的尺度',
          '最古老的长度单位来自人的身体。手指的宽度成了英寸，前臂成了腕尺，'
              '脚成了英尺，双臂伸开的宽度成了寻。这很实用，因为'
              '每个人都随身带着自己的尺度。但它并不精确，因为没有'
              '哪两个身体是一样的。\n\n'
              '最早的固定标准出现在美索不达米亚和'
              '埃及。在埃及通行的是王室腕尺，约 52 厘米。它'
              '是法老的前臂，被作为原器刻在石头上保存下来。木制的工作腕尺会定期'
              '以它为准校对——这就是校准的开端。',
        ),
        UnitTheorySection(
          '从罗马到中世纪',
          '罗马人把这套体系整理了一番。他们的英尺（pes）含十二个“uncia”。'
              '由 uncia 演变出了“英寸”一词（英语 inch）——以及'
              '“盎司”。他们的英里叫“mille passus”，即一千个复步，'
              '约 1480 米。它是后来所有英里的根源。\n\n'
              '在中世纪，几乎每座城市都有自己的尺度。一英寸被'
              '定义为三粒大麦首尾相接的长度。至于'
              '英尺，人们有些奇特的办法：1535 年雅各布·克贝尔描述说，'
              '星期天应让十六个男子从教堂出来脚接脚地'
              '站成一排——其十六分之一便是“正确的英尺”。这样'
              '就把差异平均掉了。即便如此，德国的'
              '英尺仍从 235 毫米到 408 毫米不等。',
        ),
        UnitTheorySection(
          '世界各地的尺度',
          '同样的模式无处不在。在中国用尺（脚）和'
              '寸（英寸）来量，在印度用 hasta（腕尺）和 angula（手指），在'
              '伊斯兰世界用各种不同的腕尺。从肘部'
              '到指尖的腕尺几乎在所有大陆上都能找到——'
              '身体是共同的源头。\n\n'
              '在许多文化里，身体被视为神圣的尺度，人'
              '被看作世界秩序的映像。埃及的神庙、圣经里方舟的'
              '建造以及印度教的神庙都是用腕尺来丈量的。\n\n'
              '语言也保留了这些尺度。“给他们一寸，'
              '他们就会拿走一英里”原本是“……他们就会拿走一'
              '腕尺”。一个“猫跳之遥”指的是很短的距离。'
              '水手测深时的呼喊“mark twain”（两寻深）成了'
              '马克·吐温的笔名。',
        ),
        UnitTheorySection(
          '为什么是十二——以及一个诚实的保留',
          '为什么英尺偏偏有十二英寸？因为可整除。'
              '十二可以被整齐地二等分、三等分、四等分和'
              '六等分。十只能被二等分和五等分。三分之一英尺恰好'
              '是四英寸；按十进制则是 0.333… 米。对于手工和'
              '贸易，在小数点出现之前很久，这是一个实实在在的优势。早在'
              '罗马人就是出于这个原因选择了十二。\n\n'
              '一个诚实的保留也是少不了的：英制体系'
              '并不是一个贯彻始终的十二进制。只有英尺和英寸——以及'
              '贵金属里的十二金衡盎司——才真正是十二进制的。'
              '码有三英尺，英里有 1760 码：都是不整齐的数字。而英寸'
              '在日常中被分成二分之一、四分之一、八分之一，也就是按'
              '二进制。十二只藏在个别地方，并不'
              '贯穿整个体系。',
        ),
        UnitTheorySection(
          '今天的使用',
          '今天主要是美国和英国在日常中使用'
              '这些尺度。不过它们在全世界的航空和航海中通行：'
              '飞机用英尺测量高度，用节测量速度，'
              '用海里测量航程。一海里是地球上的'
              '一弧分——它遵循六十进制的划分，'
              '而非十二。屏幕、轮胎和管道几乎'
              '到处都以英寸标注。在斯堪的纳维亚，“mil”等于十'
              '公里。在采用公制的国家，旧尺度只活在'
              '俗语里。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '有些解释很吸引人，但并不确定。一种说法称，'
              '十二来自用拇指数手指的指节——'
              '听上去合理，却未经证实。另一些理论，如'
              '“金字塔英寸”或“巨石码”，声称古代建筑里'
              '藏着隐秘的高深知识。它们在'
              '学界被认为是已被驳倒的：人们从众多尺度中只挑出'
              '那些符合论点的来用。',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          '土地即劳作',
          '测量面积时，人们把长度与长度相乘。然而'
              '古老的土地单位并非源自几何，而是源自'
              '劳作。一块田有多大，就是一天能'
              '耕作多少。\n\n'
              '德语的“Morgen（晨亩）”得名于人们能在一个上午'
              '把它犁完。英语的“acre（英亩）”是一队'
              '八头牛一天能完成的面积。罗马的“iugerum”'
              '来自“iugum”，即牛的轭。阿拉伯语的'
              '“feddan”同样意为牛轭。处处是同一个想法：土地即'
              '劳作。\n\n'
              '在古埃及，每次尼罗河泛滥之后都必须重新'
              '丈量田地，因为河水冲乱了边界。丈量者'
              '拉起打了结的绳子；希腊人后来称他们为'
              '“拉绳者”。在美索不达米亚，基本单位是“sar”——一个'
              '十二乘十二腕尺的正方形。',
        ),
        UnitTheorySection(
          '英亩及其不整齐的数字',
          '英亩有一个不寻常的形状：一条又长又窄的地带，'
              '长一弗隆、宽一链（660 乘 66 英尺）。这'
              '反映了犁地的实践：长长的犁沟，窄窄的地条。于是'
              '得出 43 560 平方英尺，即 4840 平方码。\n\n'
              '为什么会是 4840 这个不整齐的数字？这是历史的'
              '一个意外。当英格兰在 13 世纪缩短了英尺，'
              '地块边界里的杆和弗隆却保持不变。于是'
              '英亩从 4000 旧平方码跳到了 4840 新平方码。这个不整齐的'
              '数字并非有意为之，而是一次度量'
              '改革的残留。',
        ),
        UnitTheorySection(
          '世界各地的面积单位',
          '今天，公顷（10 000 平方米）是全世界'
              '最普遍的土地单位。然而旧单位顽强地活着。在'
              '泰国，莱（rai）甚至列在官方的土地登记簿里。在印度'
              '和孟加拉国，土地买卖按 bigha 来算。在韩国，'
              '坪（pyeong）尽管被禁止仍在日常通用。埃及保留了'
              'feddan，中国保留了亩。在以色列、土耳其和巴尔干，'
              '人们用 dunam 来量。在德国，Morgen、Joch 和'
              'Tagwerk 还活在农业和语言里。\n\n'
              '最顽固存活的是那些被固定为整齐公制'
              '数值的单位——一莱正好是 1600 平方米，一 dunam 正好是'
              '1000 平方米。',
        ),
        UnitTheorySection(
          '面积里的十二——以及一个保留',
          '在小单位上，十二展现得最美。一'
              '平方英尺是 144 平方英寸，因为十二乘十二是 144。'
              '写成十二进制就是整齐的“100”。一平方码'
              '是九平方英尺。\n\n'
              '到了大的土地单位，秩序就崩坏了。英亩'
              '那 4840 平方码套不进任何简单的进制。这是'
              '因为土地单位源自劳作，而非源自'
              '计算。\n\n'
              '不过仍有一个实际的要点：三分之一公顷是'
              '3333.33… 平方米——一个不整齐的数字。三分之一 feddan'
              '却正好是八 kirat。在经常需要三等分的地方，一个'
              '能被三整除的进制更占优势。十二'
              '正好做到这一点。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '对十二的偏爱从何而来？一个广为人知却'
              '未经证实的猜测：来自数手指的指节。拇指'
              '点过其余四根手指的三个指节——每只手得出'
              '十二。这种计数法直到今天仍在亚洲'
              '部分地区和近东有记录。但作为确凿的源头，'
              '它无法被证明。',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          '先有容器，后有立方体',
          '测量体积时，人们把三个长度相乘——一个立方体。'
              '然而几乎没有哪里是这样开始的。最初是容器：一'
              '装满的罐子、一袋谷物、一勺油。人们测量'
              '的是能吃、能扛或能交易的东西，而不是能'
              '算出来的东西。\n\n'
              '参照物多半是一份食物的量。希腊的'
              '“choinix”是一个工人一天的谷物口粮。日本的'
              '“石”是一个人一年吃的稻米量——'
              '约 180 升。德语的“Scheffel（蒲式耳）”大约是一'
              '能扛动的袋子。\n\n'
              '直到拥有行政管理的大帝国，才从长度'
              '单位推导出体积。罗马人迈出了第一步明确的脚步：他们的'
              '“Amphora（双耳瓶）”恰好容纳一立方英尺，约 26 升。由此'
              '体积第一次成为由英尺单位构成的真正立方体——它是'
              '立方英尺、升和立方米的直接祖先。',
        ),
        UnitTheorySection(
          '度量、地位与财富',
          '容量单位往往不止是量——它们规整着整个'
              '社会。在日本，人们用稻米产量的石数来衡量一块封地的'
              '财富。从一万石起，一位领主就算“大名”，'
              '即诸侯。甚至武士的俸禄和船只的大小'
              '也用石来计数。\n\n'
              '在罗马，士兵的口粮按“modii”分配，这是一种'
              '近九升的干量单位。在美索不达米亚、埃及和'
              '中国，统治者通过校准过的标准容器来掌控度量。'
              '最著名的是中国的“嘉量”，制于'
              '公元零年前后：一件整体铸成的青铜器，同时'
              '体现五种体积单位。它立在皇帝的殿堂前，'
              '作为其统治之统一与公正的象征。',
        ),
        UnitTheorySection(
          '世界各地的体积单位',
          '几乎没有哪个度量领域像体积这样四分五裂。德语的'
              'Scheffel 视城市不同，从约 5 升到 250 升不等。'
              '英格兰、美国和帝国单单加仑就有三种不同的版本。'
              '美制加仑（3.79 升）直到今天仍比英制加仑'
              '（4.55 升）小约五分之一。\n\n'
              '许多这样的单位还活着。全世界的谷物贸易'
              '按“蒲式耳（bushel）”来算——美国关于玉米、大豆和'
              '小麦的收成报告只用它。石油按 42 美制加仑的'
              '“桶（barrel）”来交易，这是一种古老的英格兰'
              '酒桶单位。在英国和爱尔兰，啤酒按法律以'
              '帝国品脱（568 毫升）出售。在日本，电饭锅里的量杯'
              '恰好是一“合（gō）”。柴火按立方米堆积量、'
              '实积立方米，或在北美按“考得（cord）”来交易。\n\n'
              '在美国，立方单位深植于日常：发动机用'
              '立方英寸标注（一台“350”），建筑里的混凝土和泥土用'
              '立方码，天然气用立方英尺。',
        ),
        UnitTheorySection(
          '空间里的十二——以及一个保留',
          '在立方体里，十二展现得最强。一立方英尺是 1728'
              '立方英寸——而 1728 是十二的三次方。写成'
              '十二进制就是整齐的“1000”。这个数字有特别'
              '多的因数，因为它是由二和三搭成的。一'
              '立方英尺因此可以被干净地二等分、三等分、四等分、'
              '六等分和八等分。\n\n'
              '一立方米则只能被二和五整除。'
              '三分之一立方米是 0.333…——一个无尽的数字。在经常'
              '需要三等分的地方，十二占优势。\n\n'
              '诚实的保留：这种美好的秩序只适用于'
              '由长度推导出来的立方单位。古老的容量单位——蒲式耳、'
              '加仑、Scheffel——并不遵循任何纯粹的进制。它们生长自'
              '袋子和木桶，而非源自计算，混合了二、'
              '三和完全不整齐的步级。',
        ),
        UnitTheorySection(
          '神圣的立方体',
          '立方体在许多文化里有着特别的意义，因为'
              '长、宽、高相等——是完美的一种象征。'
              '神庙和会幕里的至圣所是立方形的。'
              '麦加的克尔白，其名意为“立方体”，是一座'
              '黑色的立方圣殿。圣经里的“新耶路撒冷”'
              '也被描述为一个巨大的立方体。\n\n'
              '在许多宗教中，公正的度量还被视为'
              '神圣的义务。希伯来圣经要求一个“公正的'
              '伊法”；先知阿摩司控诉那些克扣度量的商人。'
              '《古兰经》用整整一章谴责那些短斤少两的人。谁'
              '度量不公，谁就犯罪——这个观念遍布'
              '全球。\n\n'
              '公制也承载着这种精神，只是世俗化了：它'
              '不从某个统治者，而从地球本身推导出自己的度量。'
              '米是地球周长的一个分数，立方米是它的'
              '空间——度量出自自然，而非出自权力。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '围绕古代建筑，缠绕着一些大胆的体积理论。有些'
              '声称胡夫金字塔藏着一个“金字塔品脱”，或'
              '一个源自神明的神圣度量。另一些则认为，'
              '石器时代的环状石阵使用了一种“巨石码”，由它'
              '恰好能得出一品脱的立方体。\n\n'
              '学界认为这是已被驳倒的。这类理论从'
              '众多尺度里只挑出合适的，把巧合当作'
              '有意。读来有趣，却不是证据。',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          '从谷粒到负载',
          '重量单位处处有两个根源。最小的单位来自'
              '种子和谷粒，大的来自一个人或一头'
              '牲畜能扛动的量。\n\n'
              '英语的“grain（格令）”字面就是一粒大麦，约 65'
              '毫克。珠宝商的“克拉”来自'
              '角豆树的种子。在印度，黄金用“Ratti”来称，那是'
              '一种红色豆科植物的种子。另一端是负载：'
              '希腊的“塔兰特”和印度的“Maund”大约就是'
              '一个男子能扛动的量。“吨（Tonne）”来自最大的'
              '酒桶“Tun”，它装满约重一吨。\n\n'
              '第三条线索把重量与货币连在一起：舍客勒、德拉克马、'
              '镑和 Tola 同时是钱币和重量的名字。钱'
              '最初就是称过的金属——人们称量白银，而不是数'
              '钱币。',
        ),
        UnitTheorySection(
          '镑、盎司与罗马的遗产',
          '我们的重量词汇来自罗马。罗马的“libra”是一杆'
              '秤，也是一个约 329 克的重量，分成十二个'
              '“unciae”。由“libra”来了镑的缩写“lb”和'
              '英镑的符号“£”。由“uncia”——字面意为“那'
              '十二分之一”——既来了“盎司”，也来了“英寸”。\n\n'
              '从这个根源生长出两套不同的体系。日常的'
              '“常衡（Avoirdupois）”镑分成 16 盎司——一个'
              '可以一再二等分的数字。贵金属交易的'
              '“金衡（Troy）”镑保留了罗马的十二盎司。一'
              '金衡盎司（精炼盎司）因此比一'
              '日常盎司重，金衡镑却更轻——一个至今'
              '常见的混淆。',
        ),
        UnitTheorySection(
          '世界各地的重量单位',
          '几乎每种文化都有自己的层级。美索不达米亚按舍客勒、'
              'mina 和塔兰特，以六十进制来数。埃及以十进制按'
              'deben 和 kite 来算。中国直到今天还用斤、两和小小的'
              '钱（mace）。在日本，“匁（momme）”（3.75 克）依法仍是'
              '全世界珍珠交易的单位。\n\n'
              '许多旧重量还活着。在英国和爱尔兰，'
              '体重按 14 镑一“石（stone）”来标注（“十一'
              '石四”）。德国的“磅”今天指整齐的 500 克。在'
              '南亚，黄金按“Tola”（约 11.7 克）来交易。而'
              '以色列的舍客勒承载着一个远古称量重量的名字。\n\n'
              '有一个单位特别四分五裂：石视货物不同，'
              '时而 5 镑、时而 8 镑、时而 14 镑。直到 19 世纪的'
              '法律才建立起秩序。',
        ),
        UnitTheorySection(
          '作为象征的天平',
          '在许多文化里，称量不止是技术——它是'
              '公正的象征。在古埃及，人们在冥间审判中称量'
              '心脏，与真理之羽相权衡。在荷马笔下，宙斯举起一杆'
              '金秤称量英雄们的命运。在伊斯兰教里，'
              '“米赞（Mizan）”在末日称量人的行为，连一粒'
              '芥子的重量都不会丢失。\n\n'
              '拉丁语的“libra”意为秤——由此也来了星座'
              '天秤座，它是唯一不是生物的星座。许多宗教'
              '要求诚实的度量：希伯来圣经称不公的'
              '砝码是可憎之物，《古兰经》斥责那些克扣称量的人。而'
              '“塔兰特（talent）”一词从重量演变为天赋——经由'
              '圣经里那则关于托付的塔兰特的比喻。',
        ),
        UnitTheorySection(
          '重量里的十二——以及一个保留',
          '十二主要藏在金衡体系里：一镑十二盎司，而'
              '黄金的纯度按 24 克拉（两个十二）来数。这样的数字'
              '受欢迎，因为十二有六个因数——可以整齐地'
              '二等分、三等分和四等分。十二的三分之一'
              '干净地是四；十的三分之一是 3.33…\n\n'
              '诚实的保留：日常重量并不遵循十二。'
              '常衡镑有 16 盎司——那是二进制，即'
              '不断的二等分。美索不达米亚按六十进制来数。'
              '重量的世界因此是一床由二、三、十二'
              '和六十拼成的百衲被——为贸易里的分割而造，而非为以'
              '十为单位的计算。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '对十二的偏爱从何而来？一个广为人知却'
              '未经证实的猜测把它追溯到数手指的'
              '指节：拇指点过四根手指的三个指节——'
              '每只手十二。数五遍，就得出六十。\n\n'
              '第二个故事甚至已被驳倒：即克拉源于'
              '角豆树那特别均匀的种子。'
              '名字是对的——但这些种子的重量波动得'
              '和其他种子一样大。所谓的均匀是一个神话。',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          '两份遗产：巴比伦与埃及',
          '我们的时间源自两个古老的源头。小时来自'
              '埃及，分和秒来自巴比伦。\n\n'
              '埃及人把白天和黑夜各分成十二个小时——'
              '大概是因为他们在夜里看到十二个星座升起。'
              '于是产生了二十四小时的一天。但因为白天和黑夜'
              '长短不同，这些小时在夏天和冬天'
              '长短不等。直到机械钟才使它们相等。\n\n'
              '巴比伦以六十进制来算。所以我们一小时有六十'
              '分钟，一分钟有六十秒。“分钟（minute）”'
              '意为“被缩小的部分”，“秒（Sekunde）”意为“第二次缩小”。'
              '同样的六十进制也藏在有 360 度的圆里——'
              '时间和角度是亲属。',
        ),
        UnitTheorySection(
          '月亮、太阳与一周',
          '日来自地球的自转，月来自月亮，年来自'
              '太阳。这三者并不整齐地相合，这'
              '几乎解释了每一处历法的纠葛。\n\n'
              '一周有七天——大概是按月亮的四个相位、'
              '每个约七天来定的。后来人们给每一天'
              '配上七个肉眼可见的天体之一。这套排列活在许多'
              '语言里：英语里“Saturday”是土星之日，'
              '罗曼语里“lundi/lunes”是月亮之日。日耳曼人用自己的'
              '神替换了罗马的神——朱庇特之日变成了'
              '托尔之日，即“Thursday”。\n\n'
              '古老的计数方式也还在回响：英语的“fortnight”'
              '（十四夜）让人想起日耳曼人是以夜'
              '而非以日来计算的。',
        ),
        UnitTheorySection(
          '世界各地的时间',
          '钟表并非处处一样地走。中国把一天分成十二个'
              '时辰，以动物命名——子时在'
              '午夜前后。日本把白天和黑夜各分成六个时段，'
              '它们随季节变长变短；专门的钟表'
              '必须随之调整。\n\n'
              '伊斯兰历法纯粹依从月亮，比太阳年'
              '短十一天——所以斋月缓缓地穿行过'
              '所有季节。玛雅人同时交织好几套'
              '周期，其中包括一个 260 天的神圣轮回。在埃塞俄比亚，'
              '一天直到今天都从日出开始：那里的“六点钟”，'
              '在别处是正午。\n\n'
              '许多这样的古老节律仍在延续——在节日、礼拜时间'
              '和吉日里——而日常生活处处遵循公历。',
        ),
        UnitTheorySection(
          '时间的神圣数字',
          '时间几乎处处也是神圣的。在巴比伦，十二和'
              '六十被视为完美的数字。在埃及，太阳神'
              '在十二个夜间小时里穿越冥界。一周里的七'
              '在犹太传统中代表完整——'
              '在第七天上帝歇息了。\n\n'
              '一个对立很引人注意：对犹太教、基督教和伊斯兰教而言，'
              '时间笔直向前，朝着一个目标。在印度教里，它'
              '绕圈打转——巨大的世界纪元，即“宇迦（Yugas）”，'
              '一次次到来又消逝，造物之神的'
              '一天长达数十亿年。许多文化此外还畏惧'
              '年末多出来的那些天，把它们当作危险的“过渡期”。',
        ),
        UnitTheorySection(
          '为什么不用十进制——以及与十二的关联',
          '时间是十进制最顽固的对手。秒、'
              '分、小时、天、周、月、年——这些步级没有一个'
              '是整齐的十进制数字。\n\n'
              '原因又是可整除。一小时的三分之一'
              '是整齐的二十分钟，四分之一是十五分钟。用'
              '十就除不尽。十二和六十可以被'
              '三整除，十不行。\n\n'
              '人们还是尝试过十进制。在法国大革命'
              '中曾有一天十小时、一小时一百分钟。'
              '它只维持了约一年半。和长度与重量'
              '单位不同，这次改制并未带来好处——'
              '旧钟表本来就处处走得一致。十二进制和'
              '六十进制的划分就是更实用。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '人们是怎么想到十二和六十的？一个优雅却'
              '无法证明的想法：用拇指数四根手指的三个'
              '指节——每只手十二——而五个这样的轮回'
              '就得出六十。\n\n'
              '更离谱的是一些主张，称一年从前真的'
              '正好有 360 天，后来被宇宙灾难'
              '改变了。这没有任何科学证据；'
              '360 更可能是一个圆整、好整除的计算数字。',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          '来自巴比伦的圆',
          '我们把整圆分成 360 度，每度分成 60 弧分，'
              '每分分成 60 秒。这套秩序极其古老，来自'
              '美索不达米亚。巴比伦人以六十进制来算，那是一个'
              '因数特别多的数字。\n\n'
              '为什么偏偏是 360？他们的一年约有 360 天，太阳'
              '在此期间每天移动近一度——天和度'
              '正好相合。这些词语透露了源头：“分（minute）”来自'
              '拉丁语“第一个小部分”，“秒（Sekunde）”来自“第二次'
              '缩小”。我们用于时间的正是这两个词——'
              '角度和时间是同一个巴比伦'
              '根源的兄弟姐妹。\n\n'
              '一个诚实的提示：为什么成了 360 而不是 60，并没有'
              '确凿的证据。天对度的故事是最'
              '说得通的，却不是已被证明的解释。',
        ),
        UnitTheorySection(
          '从星辰到小时',
          '圆上的十二来自埃及。在那里，十二个'
              '升起的星座划分了夜空——由此产生了十二个'
              '夜间小时，最终是二十四小时的一天和钟表的'
              '表盘。\n\n'
              '希腊人整理了这套体系。喜帕恰斯以及后来的托勒密'
              '沿用了 360 的划分，由此奠定了'
              '三角学的基础。知识从那里继续游走：印度的'
              '学者发明了正弦表，伊斯兰世界把它'
              '加以精化。我们的“正弦（Sinus）”一词甚至是一个翻译错误——'
              '印度语里“弓弦”一词经由阿拉伯语变成了'
              '拉丁语里“海湾”一词。',
        ),
        UnitTheorySection(
          '世界各地的角度',
          '并非每种文化都同样地划分圆。中国自成一体地'
              '计算：那里的圆有 365¼ 份——一年每天'
              '一份。直到欧洲的影响才带来 360。'
              '中国的风水罗盘把地平线分成 24 个'
              '方向。\n\n'
              '印度把黄道分成十二个星座和 27 个'
              '月站。伊斯兰天文学赠给我们许多'
              '方向词：“方位角（Azimut）”、“天顶（Zenit）”和“天底（Nadir）”都是'
              '阿拉伯语——找到朝麦加礼拜方向的'
              '义务推动了角度学的发展。\n\n'
              '在海上，人们划分风玫瑰：四个主风，然后八个，然后'
              '32 个点、每点 11¼ 度。把全部 32 个绕圈背出来——'
              '“boxing the compass”——是舵手手艺的一部分。'
              '地中海的风名 Tramontana、Levante、Scirocco 直到'
              '今天还活在气象用语里。',
        ),
        UnitTheorySection(
          '神圣的方向与数字',
          '天空几乎处处是神圣的。对巴比伦人而言，'
              '天文学是诸神的信息，黄道是他们的文字。'
              '十二被许多人视为神圣的数字——十二个黄道星座、'
              '十二位奥林匹斯神、十二个部族、十二个小时。\n\n'
              '尤其广泛的是四个方位的秩序。在'
              '印度教里，每个方向都由一位独立的神守护，在中国则由一个'
              '独立的兽来守——东方的龙、西方的虎。'
              '拉科塔人的医药轮给每个方向赋予颜色和意义。'
              '而在伊斯兰教里，礼拜的方向把整个世界都'
              '围绕克尔白来安排。\n\n'
              '较晚的度量则有意不带这类象征：'
              '弧度（radiant）只遵循数学，gon 来自'
              '法国大革命，军用密位则只遵循'
              '弹道学。',
        ),
        UnitTheorySection(
          '圆里的十二与六十——以及一个保留',
          '360 是一个可整除的奇迹：它有 24 个因数。一个圆的'
              '三分之一、四分之一、六分之一都得出整齐的度数。'
              '一个分成一百份的圆做不到这一点——三分之一会是'
              '33.33…\n\n'
              '人们试过十进制。在法国大革命中出现了'
              '分成 400 gon 的圆。它停留在测量者的小众里，因为'
              '400 的因数比 360 少。十进制时间同样失败了——'
              '其中一个原因是它无法被整齐地四等分。\n\n'
              '诚实的保留：360 并非必然。中国的'
              '365 划分证明了这一点。而在高等数学里，弧度'
              '胜出，因为那里看重的不是可整除，而是'
              '简单的公式。十二的世界因此很强大，却并非'
              '别无选择。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '对十二和六十的偏爱从何而来？那个广为人知却'
              '未经证实的猜测：来自数手指的指节。拇指'
              '点过四根手指的三个指节——每只手十二——而'
              '五个轮回就得出六十。\n\n'
              '一个数字上的巧合很吸引人：北欧传说说'
              '瓦尔哈拉有 540 道门，每道门里走出 800 名战士——合计'
              '432 000，与一个印度世界纪元同样的数字。'
              '学界认为这是巧合，而非共同的传承。'
              '讲起来动听，却不是证据。',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          '钱曾经就是重量',
          '在钱币出现之前很久，钱就是称过的金属。人们称量'
              '白银或谷物。所以最古老的货币名其实'
              '都是重量名。\n\n'
              '在美索不达米亚，人们按舍客勒、mina 和塔兰特来数——按'
              '六十进制，六十舍客勒为一 mina。舍客勒'
              '起初是一种重量，以大麦粒校准。希腊的'
              '“德拉克马”字面意为“一把”，即六根细'
              '金属签。\n\n'
              '引人注意的是：被铸造的多半只是最小的钱币。大的'
              '单位如 mina 和塔兰特纯粹是计算数——没有人'
              '把一塔兰特拿在手里，人们只用它来算账。',
        ),
        UnitTheorySection(
          '镑、先令、便士',
          '欧洲的钱来自罗马。钱币“Denarius（第纳留斯）”给了'
              '便士缩写“d”，也给了许多语言表示钱的'
              '词（西班牙语“dinero”、阿拉伯语“Dinar”）。\n\n'
              '查理大帝重新整理了它：一磅白银（libra）= 20'
              '先令（solidus）= 240 芬尼（denarius），也就是十二芬尼'
              '为一先令。这里同样只有芬尼是真正的'
              '钱币；镑和先令用于算账。这套体系'
              '维持了一千多年。\n\n'
              '英格兰把它接收为镑、先令、便士——即“£sd”。符号'
              '“£”是一个装饰过的 L，代表“libra”，即秤。于是'
              '钱挂在与天秤座星座和重量的镑'
              '同一个词上。',
        ),
        UnitTheorySection(
          '世界各地的钱币',
          '几乎每个地区都有自己的层级。在德国南部地区，'
              '六十克罗伊策为一盾——又是巴比伦的'
              '六十。来自波希米亚约阿希姆斯塔尔的“塔勒”给了'
              '“美元（dollar）”这个名字。玛丽亚·特蕾西亚塔勒太受欢迎了，'
              '以至于直到 20 世纪在阿拉伯和埃塞俄比亚还作为钱'
              '通用。\n\n'
              '在别处，钱的样子完全不同。在西非，人们'
              '几百年来用宝贝壳付钱。阿兹特克人用'
              '可可豆作零钱，用规格化的斗篷作大额钱——'
              '以二十为单位来数。印度把卢比算成 16 安那，'
              '中国把带孔的钱币串成串。\n\n'
              '西班牙的“八片币”美元可以掰成八份。'
              '其中两份就是“two bits”——直到今天还是美国人'
              '对四分之一美元硬币的俗称。',
        ),
        UnitTheorySection(
          '钱、信仰与象征',
          '钱币往往不止是支付手段。希腊人会在死者的'
              '口中放一枚钱币——给卡戎的摆渡费，他把灵魂'
              '渡过冥河。没有钱币，灵魂就留在岸边。\n\n'
              '在新约里，耶稣举起一枚带着皇帝像的第纳留斯：'
              '“凯撒的归凯撒。”犹大的三十块银钱'
              '大概是来自提尔的舍客勒——偏偏是'
              '带着一位异教神祇的钱币，同时又是官方的'
              '圣殿货币。\n\n'
              '又一次是神圣的十二：犹太教和基督教里的十二个部族和'
              '使徒，印度教里的十二位太阳神，佛教里因果链的十二'
              '支，什叶派的十二位伊玛目，中国的十二地支。这个'
              '数字把钱、历法和信仰连在一起。',
        ),
        UnitTheorySection(
          '为什么是十二和二十——以及一个保留',
          '所有这些不整齐层级的原因是可整除。一盾'
              '六十克罗伊策可以整齐地三等分：二十克罗伊策。'
              '三分之一美元却是 33.33… 美分——一个无尽的数字。'
              '谁在贸易里经常分割，用十二、二十或六十'
              '就比用十更顺手。\n\n'
              '所以十二在贸易里继续活着：一打（12）、一罗（gros，'
              '144）和一大罗（1728）。一罗在伦敦和'
              '纽约都指同样的数量。\n\n'
              '诚实的保留：旧时的钱并不是一个纯粹的'
              '十二进制。一镑里的二十先令是一种'
              '二十进制的逻辑（手指和脚趾）。而 1971 年英国'
              '改制为一百便士——虽有些混乱，'
              '但持久了下来。今天几乎整个世界都按十进制算账。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '为什么这么多文化选择了十二？那个广为人知却'
              '未经证实的猜测把它追溯到数手指的'
              '指节：四根手指的三个指节，由拇指点过，'
              '得出十二。\n\n'
              '另一些解释走得更远：十二是“三乘四”，'
              '天乘地，一个完整的数字。有些人甚至'
              '声称，一位带着十二个同伴的太阳神是'
              '十二使徒的原型。这类平行对应是诠释，而非'
              '确凿的历史——须谨慎品味。',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          '从验温器到温度计',
          '温度是一项晚出的发明。长久以来人们只能感觉'
              '到热，却无法测量。第一步来自一个观察，'
              '即空气和液体遇热会膨胀。\n\n'
              '约在 1600 年，伽利略·伽利雷造了一个“验温器”：一个'
              '带管的玻璃球，里面的水位会上升和下降。它显示'
              '热，却没有刻度。第一个数字刻度不久之后由'
              '医生桑托里奥加上——温度计就是一个'
              '带刻度的验温器。\n\n'
              '为了让测量可以比较，需要固定的参照点。'
              '人们一致选定了自然的点：水的冰点和'
              '沸点。直到今天，所有刻度都挂在它们上面。',
        ),
        UnitTheorySection(
          '三种刻度，三个零点',
          '人们熟知的几种刻度，主要区别在于它们把'
              '零放在哪里。\n\n'
              '丹尼尔·华氏在约 1724 年把他的零放在他能可靠'
              '制造出来的最冷的点：一种冰、'
              '水和盐的混合物。他把纯水的冰点定在'
              '32，把体温定在 96。这样普通的冬天就不会'
              '降到零度以下。后来人们把刻度重新校准到冰点（32）和'
              '沸点（212）——两者之间正好 180 度。\n\n'
              '列氏选了 0 和 80。而摄氏把 0 和 100 定在'
              '冰点和沸点——而且起初甚至把刻度'
              '颠倒着安排（0 是沸点）。直到他死后'
              '人们才把它转成今天的样子。整齐的一百份划分'
              '与新的公制完美契合。',
        ),
        UnitTheorySection(
          '为什么世界测得各不相同',
          '今天几乎整个世界都用摄氏——它随公制'
              '一同到来。主要的例外是美国和几个与它们'
              '紧密相连的国家，它们保留了华氏。1975 年的'
              '一项法律把那里的改制变成了自愿，于是'
              '一切照旧。\n\n'
              '旧刻度很顽固。列氏在 18、19 世纪曾在'
              '法国、德国和俄国流行，在俄国'
              '保持得尤其久。所以俄国文学——'
              '比如陀思妥耶夫斯基或托尔斯泰——会说“度的严寒”，指的'
              '就是列氏度。\n\n'
              '哪种刻度感觉“更自然”，纯粹是习惯。'
              '摄氏把自己绑在水上，华氏大致从 0'
              '（很冷）到 100（很热）覆盖了人能感受的天气。两者'
              '都是约定，没有客观的优劣。',
        ),
        UnitTheorySection(
          '火与冰',
          '热与冷在几乎所有文化里都承载着深刻的意义——'
              '而且引人注意地常常同时代表创造和'
              '惩罚。\n\n'
              '在北欧传说里，世界诞生于火之国穆斯贝尔海姆'
              '与冰之国尼夫尔海姆之间的张力——'
              '冷在这里不是恶，而是一种创造之力。'
              '人们多半把地狱想象成火，然而在但丁的'
              '《地狱篇》里，最深的一层是一片冰冻的湖：背叛是'
              '一切人间温情的冷却。佛教既知道'
              '热地狱也知道冷地狱，按罪过分级。\n\n'
              '火在别处是神圣而纯净的：印度教里的阿耆尼、'
              '琐罗亚斯德教里的永恒之火。而“涅槃”一词意为'
              '字面的“熄灭”——熄灭内心的燃烧。',
        ),
        UnitTheorySection(
          '真正的零点：开尔文',
          '温度到底是什么？它是衡量最小粒子'
              '运动有多快的尺度。热意味着：粒子'
              '抖动得更厉害。\n\n'
              '由此可知存在一个可能的最低温度——'
              '在那一点，这种运动最小。这就是'
              '−273.15 °C 处的绝对零度。不可能更冷。开尔文勋爵'
              '在 1848 年把一条刻度恰好定在那里：零开尔文是绝对'
              '零度，一个开尔文步级和一个摄氏度一样大。\n\n'
              '只有这条刻度才允许真正的比例：200 开尔文真的'
              '比 100 开尔文“热”一倍。在摄氏或华氏下'
              '这不成立——“20 度比 10 度热一倍”'
              '干脆就是错的。对科学而言，开尔文因此是'
              '基本单位。',
        ),
        UnitTheorySection(
          '为什么十二在这里几乎帮不上忙——说实话',
          '在其他度量上十二很强，因为一个量可以被很好地'
              '分割：三分之一英尺是整齐的四英寸。在'
              '温度上这个论点不成立——这一点也该诚实'
              '地说出来。\n\n'
              '原因是被挪移的零点。零摄氏度'
              '不意味着“没有热”，而只是“水结冰”。'
              '所以温度不能被有意义地二等分或'
              '三等分——在这样一条刻度上没有“热一半”这回事。'
              '十二那美好的可整除性在这里落了空。\n\n'
              '只有一处仍藏着可整除的思路：刻度本身的'
              '划分。华氏的 96 和到冰点的 64 个步级'
              '常常能被二等分。但人们把显示'
              '分成 10、12 还是 100 个步级，纯属表面工夫。'
              '温度是那个诚实的反例：在这里，进制的选择'
              '无关紧要——真正的意义藏在绝对'
              '零度里，而不在刻度的划分里。',
        ),
        UnitTheorySection(
          '推测性的内容（请谨慎看待）',
          '围绕华氏的刻度缠绕着一些传说。一种说法称，96 是'
              '他生病妻子的发烧温度——对此没有'
              '证据。另一种说，那个零是他家乡但泽最冷的'
              '冬天；更可能的是那个可'
              '重现的冰盐混合物。\n\n'
              '就连华氏自己对其固定点的解释也被认为'
              '部分是事后美化的——许多东西他干脆沿用了'
              '天文学家罗默更早的刻度。动听的故事，但'
              '须谨慎阅读。',
        ),
      ];
    // Alle acht Theorie-Bereiche sind nun auf Deutsch vorhanden.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesZh(UnitCategory cat) {
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
