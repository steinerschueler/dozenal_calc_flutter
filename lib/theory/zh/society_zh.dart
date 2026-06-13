// 关于“十二进制协会”章节的中文散文。属于 ../society_theory.dart 的一部分。
// 句子简单（更易翻译）。陈述事实和有出处的观点；对不确定的归属（引用链）
// 保持诚实，不作叙述者的评判。提炼自 docs/research/society_*.md。

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersZh() => const [
  ProseChapter('一场为“十二”而生的运动', [
    ProseSection(
      '个别的先行者',
      '宁愿用十二而非十来计算，这个想法由来已久。但长期以来只有零星的'
          '倡导者，并未形成一场运动。早在18世纪，博物学家布丰就被提及——'
          '不过其确切出处并不可靠，在各种参考书之间辗转流传。\n\n'
          '到了19世纪，这一切变得更为具体。速记法发明者艾萨克·皮特曼从'
          '1857年起为“十二”奔走呼号，并为十和十一提出了自己的符号。哲学家'
          '赫伯特·斯宾塞在1896年也表示支持，并明确反对公制系统。',
    ),
    ProseSection(
      '安德鲁斯与《新数字》',
      '真正把它付诸实践的是一位美国人：弗兰克·爱默生·安德鲁斯。1934年，'
          '他的文章《数字漫游》刊登于《大西洋月刊》——这本杂志自称从未刊印'
          '过数学内容，还在文章正中给惧怕数学的读者加了一句警示。\n\n'
          '1935年，他的著作《新数字》问世，这是美国同类书籍中的首部。他的'
          '论点很朴素：十二可被2、3、4和6整除，而十只能被2和5整除。安德鲁斯'
          '对此态度冷静——他认为，面对“顽固的习惯之力”，真正的改制不太可能'
          '实现。',
    ),
    ProseSection(
      '协会的诞生',
      '从安德鲁斯文章引来的读者来信中，渐渐形成了一个通信圈子，并由此在'
          '1944年成立了“美国十二进制协会”。这个名字是拉尔夫·“络腮胡”·比尔德'
          '半开玩笑取的；启动资金由乔治·特里捐助。后来它更名为“美国十二进制'
          '协会（Dozenal）”——因为“duodecimal”一词里含有十进制的“decimal”。\n\n'
          '1959年，英国的姊妹组织——大不列颠十二进制协会——也加入进来，数学家'
          'A. C. 艾特肯是其知名成员。美国协会至今仍出版《十二进制公报》；'
          '其荣誉会员中包括科幻作家艾萨克·阿西莫夫。',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('为十和十一设立新数字', [
    ProseSection(
      '符号难题',
      '凡是用十二来计算的人，都需要两个额外的数字——一个表示十，一个表示'
          '十一。这两个该用什么符号，至今没有统一的定论；连美国协会也不规定'
          '固定的记法。\n\n'
          '有多种方案：皮特曼旋转过的二和三（↊ 和 ↋）、安德鲁斯的斜体X和'
          '圆角E、一个六角星和一个井号（受电话按键启发）、字体设计师德威金斯'
          '的字形——以及干脆借用计算机世界里的字母A和B。',
    ),
    ProseSection(
      '皮特曼、Unicode 与 2026 年的转变',
      '美国协会数次更换其符号：约到2008年用六角星和井号，随后是德威金斯'
          '字形，自2015年起用皮特曼数字。2015年，Unicode标准也正式收录了'
          '皮特曼符号。\n\n'
          '2026年初，协会把其网页改用字母A和B——并非因为放弃皮特曼，而是因为'
          '这些特殊字符在许多浏览器和手机上仍无法可靠显示。在印刷版公报里，'
          '皮特曼数字仍是标准。（本应用的显示屏可在自有字形与 0–9 / A、B '
          '之间任选。）',
    ),
    ProseSection(
      'Little Twelvetoes',
      '流行文化中最著名的十二进制片段是一首歌曲：《Little Twelvetoes》，'
          '出自美国教学剧集《Schoolhouse Rock》，由鲍勃·多劳夫创作并演唱，'
          '于1973年首播。\n\n'
          '歌中，一位长着十二根脚趾的友善外星人展示了，一个拥有十二根“手指”'
          '的人会如何发明出两个新数字——读作“dek”表示十，“el”表示十一。它'
          '被认为对小学生太难，播出次数比其他各集都少，但仍让许多人记忆'
          '犹新。',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do、Gro、Mo——用十二进制说话', [
    ProseSection(
      '一打、一罗与一大罗',
      '十二在十二进制里写作“10”。它的各个数位早就有了日常词汇：十二个为'
          '一打，十二打（144）为一罗，十二罗（1728）为一大罗。\n\n'
          '这一点很值得玩味：这些熟悉的商贸词汇其实早已是十二进制的数位——'
          '一打就是十二世界里的“10”，一罗是“100”，一大罗是“1000”。',
    ),
    ProseSection(
      'Dek、el 与系统化命名',
      '这两个新数字通常读作“dek”（十）和“el”（十一）。对于数位，则简短地'
          '用 do、gro、mo（来自 dozen、gross、great gross）。\n\n'
          '此外还有一套系统化命名，由网络社区发展而来：为各数字设固定的'
          '词根（un、bi、tri … dec、lev），再加上表示十二次幂的词尾——向上'
          '用“-qua”，向下用“-cia”。妙的是：“uncia”正好是十二分之一——这正是'
          '同一个拉丁词，“英寸”（inch）和“盎司”（ounce）都由它衍生而来。',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM、协会与今天的工具', [
    ProseSection(
      'TGM——一套十二进制的计量体系',
      '英国协会的汤姆·彭德伯里设计了一套完整的十二进制计量体系：TGM，'
          '取名自它的三个基本单位 Tim、Grafut 和 Maz。\n\n'
          '与公制不同，它不是从长度出发，而是从时间出发，并把一切都从地球'
          '引力推导出来。“Grafut”（引力英尺）略短于一英尺。由此连贯地导出'
          '面积、体积、速度和力的单位——一套自成一体、完全基于十二的、与'
          '公制对应的体系。',
    ),
    ProseSection(
      '今天的协会',
      '两个协会都仍然存续，但规模很小、由志愿者运作；并没有可靠的会员'
          '数字。美国协会继续出版《十二进制公报》，并提供学习和换算工具，'
          '英国协会则主要维护 TGM 相关材料。\n\n'
          '最活跃的地方是网络论坛“Dozensonline”。系统化的数字命名，以及那场'
          '始终未能彻底了结的“正确数字之争”，都诞生于此。这个社区虽小，'
          '却很活跃。',
    ),
    ProseSection(
      '计算器、应用程序——以及本应用',
      '围绕着“十二”，意外地兴起了一个相当活跃的工具圈子：十二进制计算器、'
          '度量换算器，甚至还有一只十二进制的钟和一份历法，其中许多都是开源'
          '的、由协会成员打造。\n\n'
          '本应用正归属于此——一个不以十进制、而以十二进制计数的计算器，配有自有字形、'
          '精确分数和一个单位换算部分。它是对一项漫长而充满热爱的小众传统的'
          '一点微薄贡献。',
    ),
    ProseSection(
      '为什么世界仍然停留在十进制',
      '十二之所以未能推广开来，几乎不是数学的问题——数学是站在它这一边的。'
          '问题在于习惯：十进制系统深植于语言、教育、法律和技术之中，而一次'
          '改制将是极其浩大的工程。即便是美国那次小得多的改用公制之举，也'
          '正因此而失败。\n\n'
          '因此，如今大多数参与者更愿意把这件事看作一个引人入胜的思想实验，'
          '而非一项认真的改制计划。它表明，数字基数的选择并非理所当然——也'
          '让我们更敏锐地去看待那些每天与我们打交道的数字。',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — 一款十二进制计算器', [
    ProseSection('一款基于十二进制的应用', 'Dozecal 是一款用于 iPhone 的计算器，它以十二进制为底进行原生运算。它于 2020 年由独立开发者 Johan Kovacs 发布，应用本身免费。其明确的目标是推动十二进制在数学和科学中的使用。\n\n运算可在十二进制或十进制模式下任选其一进行。在两种模式之间切换时，所显示的数值会自动换算。三角函数以度作为计量单位。'),
    ProseSection('逆波兰表示法', 'Dozecal 的一个特色是采用逆波兰表示法（RPN）进行输入。在这里，你不是键入「3 + 4 =」，而是键入「3 4 +」——先输入两个数字，再输入运算符。这一开始会让人感到陌生，但它完全不需要括号，并且长期以来在许多科学计算器（例如惠普 Hewlett-Packard 的产品）上十分常见。'),
    ProseSection('十二进制工具生态的一部分', 'Dozecal 并非由某个学会打造，而是出自个人之手；在其说明中，它将关于十二进制的更多信息指向美国十二进制学会（Dozenal Society of America）。如此一来，它便归属于那个虽小却充满活力的十二进制工具生态——与这款应用、TGM 相关资料以及其他计算器并列其中。'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Paul Rapoport 的 Dozenal Calculator', [
    ProseSection('浏览器中的计算器', 'Paul Rapoport 的 Dozenal Calculator 是一款直接在网页浏览器中运行的科学计算器——免费且无需安装。它以十二进制进行运算，并可随时切换为十进制显示；数字基底可以自由切换，同时还提供多个相互独立的寄存器。一份详尽的使用说明以 PDF 的形式随附其中。'),
    ProseSection('数论方面的强大功能', '它在数论方面尤为丰富——这恰好契合了一个正因其可整除性而备受推崇的进制。该计算器能求最大公约数与最小公倍数，列出一个数的所有约数，并将其分解为质因数（可选择是否标注重数）。此外还包括约数之和、约数个数，以及欧拉 φ 函数——即比它小且与它互质的数的个数。'),
    ProseSection('完整的科学计算工具箱', '在其他方面，这套工具箱同样一应俱全：平方与平方根，任意次幂与方根，指数函数与对数——自然对数以及以二和以十为底的对数，还有以任意底数为底的对数。此外还有三角函数与双曲函数及其反函数，组合学（组合与排列，也支持可重复的情形），简单统计（平均值与标准差），阶乘，一个百分比函数，Gamma 函数，以及虚数单位 i。'),
    ProseSection('涵盖众多物理量', '除了纯粹的运算之外，该程序还涵盖了数十种物理量，并能在它们之间相互换算：时间与一天中的时刻、频率、速度、长度、面积、干量体积与液量体积、质量、力、压强、能量、功率、温度和角度。其中也包含十二进制的时间单位。'),
    ProseSection('延伸至电工学', '对于一款十二进制计算器而言，它在应用物理领域所延伸的范围之广颇为罕见：它专门设置了电阻抗、电量（电荷）、电势（电压）以及电流等量值范围。借此，电工学也可以用十二进制来进行计算。'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
