// Simplified Chinese translation of the "Recommendations" chapters. part of
// ../recommendations.dart.
part of '../recommendations.dart';

List<RecChapter> _recChaptersZh() => const [
  // ── 实体 ──────────────────────────────────────────────────────────
  RecChapter(
    '实体计算器',
    intro:
        '目标是一款便携式、口袋尺寸的设备——而非笨重的图形计算器——'
        '要么可编程，要么搭载开放的计算核心。'
        '图形计算器（NumWorks、TI-Nspire、Casio fx-CG）因外形尺寸而排除在外；'
        '经典的 HP 35s 已停产，二手市场仅有收藏级高价。',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: '专有 · 可编程科学计算器',
        blurb:
            '带公式存储和自然显示的可编程口袋计算器。'
            '对于反复使用的木工公式（榫口深度、斜切几何），'
            '可将带参数的程序保存备用。',
        pros: [
          '小巧便携',
          '可编程，附带公式库',
          '熟悉的代数输入方式，支持度/分/秒',
          '性价比极高',
        ],
        cons: [
          '欧洲通常只能通过进口获得',
          '专有软件——无法查阅源代码',
          '不支持十二进制输出',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Free42 核心 (GPL-2.0) · RPN · 高端价位',
        blurb:
            '致敬 HP-42S 的旗舰 RPN 计算器，配备 CNC 铣削不锈钢外壳与 USB-C 接口。'
            '计算核心为 Thomas Okken 的开源 Free42，采用 Decimal-128 算术（34位精度）。',
        pros: [
          '开放的计算核心（Free42，GPL）——行为可深入研究',
          '与桌面/移动端引擎完全一致，程序可跨平台移植',
          '极高精度（34位十进制数字）',
          '做工如传家宝，支持 USB-C 大容量存储',
        ],
        cons: [
          '仅支持 RPN——需要适应期',
          '高端价格，有时难以购得',
          'BASE 功能不支持十二进制',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: '专有 · 科学计算器（经济型）',
        blurb:
            '当前款不可编程的 ClassWiz——'
            '适合不需要编程功能的用户，价格实惠，几乎随处可购。',
        pros: [
          '价格低廉，几乎随处有售',
          '自然显示，功能齐全',
          '小巧，坚固',
        ],
        cons: [
          '不可编程',
          '专有软件',
          '复杂运算时明显较慢',
          '不支持十二进制',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        '结论：fx-5800P 是理性之选——可编程、小巧、输入方式熟悉。'
        'DM42n 是开放核心的发烧友珍品（但只支持 RPN 且价格不菲）。'
        '建议：购买硬件前，先用 Free42/Plus42 免费体验 RPN。',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        '日常手机使用。以下是可通过 Google Play 正常获取的最优秀应用——'
        '纯开源选项将在下一章（F-Droid）介绍。',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: '专有 · CAS 与图形',
        blurb:
            '带符号代数、图形、方程、微分与积分的科学计算器。'
            '广泛使用，持续维护，支持多种屏幕尺寸布局。',
        pros: [
          '功能丰富（CAS、图形、高位精度）',
          '分数与循环小数显示',
          '持续维护，布局可自定义',
        ],
        cons: [
          '专有软件——对自身项目无学习价值',
          '完整功能需付费',
          '不支持十二进制输出',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '对 HP-42S 的完整重新实现，不含任何 HP 代码。'
            'Plus42 在此基础上增加了代数方程和求解器，大幅降低了 RPN 的入门门槛。',
        pros: [
          '开源（GPL），代码可作学习材料',
          '跨平台完全一致——程序可移植',
          'Decimal-128 精度',
          'Plus42 支持代数方程',
        ],
        cons: [
          'RPN 逻辑（Plus42 有所缓解）',
          'BASE 功能不支持十二进制',
          '移动端需付费（桌面端免费）',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        '结论：HiPER Calc Pro 是 Play Store 中最强大的日常工具；'
        'Free42/Plus42 是具备 Decimal-128 精度的开源 RPN 路线。',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        '来自 F-Droid 商店（或直接来自开发者）的纯开源应用：'
        '代码可审阅，无追踪器——同时也是自身项目的学习与参考材料。',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS 与单位换算',
        blurb:
            'Qalculate! 引擎的官方 Android 前端：'
            '基于 Kotlin/Java 界面封装原生 C++ 库 libqalculate。'
            '符号计算、任意精度、区间算术、单位换算——该领域最强大的引擎。',
        pros: [
          '开源（GPL），最强引擎（CAS、单位、精度）',
          '支持十二进制计算——此列表中唯一一款',
          '架构具有学习价值：Kotlin 界面封装原生计算核心',
          '无追踪器',
        ],
        cons: [
          '主要通过 F-Droid 或直接构建获取',
          '该项目拒绝 Google 的开发者验证——正规渠道的可安装性前景不明（通过 F-Droid 则无此问题）',
          '入门门槛高于普通计算器',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            '完全用 Kotlin 编写的精简、维护良好的计算器。'
            '功能并不突出，但代码可读性强、结构清晰——'
            '值得关注的是其将内部数字类型从 Double 迁移至 BigDecimal 的有记录变更，'
            '这正是十二进制计算器同样需要解决的精度问题。',
        pros: [
          '开源（GPL-3.0），Kotlin 代码整洁',
          '理想的学习与参考对象',
          '有历史记录，界面简洁，无追踪器',
        ],
        cons: [
          '无 CAS，不可编程',
          '功能上无法与 HiPER/Qalculate 竞争',
          '不支持十二进制',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        '结论：Qalculate! 是最强大的开源之选——也是唯一支持十二进制输出的。'
        'OpenCalc 则是开发者的「引擎室参观通道」。',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS 是开源计算器最薄弱的平台——'
        '但有一款出色的专有工具。坦率地说：真正的 FOSS 竞品在此缺席。',
    calcs: [
      RecCalc(
        'PCalc',
        tag: '专有 · 参考级工具',
        blurb:
            '自 1990 年代起被视为 Apple 平台的标杆：'
            '丰富的换算功能、一流的 RPN 输入、深度可定制性'
            '（主题、按键布局、纸带）。可在 iPhone、iPad、Apple Watch 和 Apple TV 上运行。',
        pros: [
          '一流且非常成熟的工具',
          '可选 RPN 模式，历史记录可编辑',
          '大量换算与常数',
          '免费 Lite 版供入门体验',
        ],
        cons: [
          '专有软件——无学习价值',
          '需付费',
          '功能繁多，初期可能令人应接不暇',
          '不支持十二进制',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '填补了 iOS 上的开源空缺：Free42 在 App Store 免费提供，'
            '与其他所有平台使用同一套引擎。',
        pros: [
          '开源（GPL），Free42 免费',
          '跨平台完全一致',
          'Decimal-128 精度',
          'Plus42 支持代数方程',
        ],
        cons: [
          'RPN 逻辑（Plus42 有所缓解）',
          '不支持十二进制',
          'Plus42 需付费',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '结论：PCalc 作为主力工具（iOS 上无有力的 FOSS 竞品），'
        'Free42/Plus42 作为开源推荐及 RPN 的清晰入门路径。',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        '在 Mac 上，最佳原生工具与最强大的开源引擎相遇——'
        '分工协作颇具价值：这里负责快速键盘操作，那里负责精确的符号运算。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 最强引擎',
        blurb:
            '桌面级强力工具（同样适用于 Windows 和 Linux）：'
            '符号运算、任意精度、单位换算、绘图。'
            '可通过 Homebrew 安装；CLI 工具 qalc 的行为与 Linux 版本完全一致。',
        pros: [
          '开源，最强引擎（CAS、单位、精确分数）',
          '支持十二进制计算',
          '可扩展自定义函数，CLI 支持脚本化',
        ],
        cons: [
          '原生 Mac 质感不及 PCalc 精致',
          '强大功能需要一定的学习成本',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: '专有 · 原生 Mac 品质',
        blurb:
            '与 iOS 版本相同的优势，呈现于精致的 Mac 应用中：'
            '深度可定制性与用于复用表达式的 Magic Variables，'
            '以及 Apple 设备间的 Handoff 功能。',
        pros: [
          '原生、成熟的 Mac 应用',
          'RPN、纸带、丰富换算',
          'Magic Variables，Handoff iOS/macOS',
        ],
        cons: [
          '专有软件，需付费',
          '不支持十二进制',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '同样适用于 macOS——桌面端免费。'
            '与 DM42 硬件计算核心使用同一套引擎。',
        pros: [
          '开源（GPL），桌面端免费',
          'Decimal-128 精度',
          '跨平台完全一致',
        ],
        cons: [
          'RPN 逻辑',
          '不支持十二进制',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '结论：PCalc 用于快速键盘操作，Qalculate! 用于精确与符号运算（以及十二进制）。'
        '作为小众专家工具：Numi（自然语言输入）和 Soulver（记事本式计算）。',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        '在 Linux 上，形势一目了然——一款引擎独领风骚，'
        '真正的问题只是「GUI 还是终端？」。'
        '对于纯粹的标准计算器需求，还有几款桌面经典之选。',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · 无可匹敌',
        blurb:
            'GTK 与 Qt 前端加上 CLI 工具 qalc。'
            '完整的 libqalculate 功能集：符号运算、任意精度、不确定性传播、绘图。'
            'qalc 支持脚本化（表达式作为参数或从文件读取），'
            '并已在所有主流发行版中打包。',
        pros: [
          '开源，各发行版均可获取',
          '最强引擎，支持十二进制计算',
          'CLI 支持脚本化——别名、管道、自定义函数库',
        ],
        cons: [
          '丰富功能需要一定的学习成本',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · KDE 标准',
        blurb:
            'KDE 计算器，具备科学模式与程序员模式，'
            '支持自定义按键布局——功能扎实。',
        pros: [
          '开源，轻量级',
          '程序员模式（bin/oct/hex）',
          '与 KDE Plasma 深度集成',
        ],
        cons: [
          '无 CAS',
          '不支持十二进制',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · GNOME 标准',
        blurb:
            'GNOME 标准计算器，内置单位与货币换算，'
            '以及高级、金融和程序员模式。'
            '功能上不及 Qalculate，但全面扎实。',
        pros: [
          '开源，易于使用',
          '内置单位与货币换算',
        ],
        cons: [
          '功能不及 Qalculate 强大',
          '不支持十二进制',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 开发停滞',
        blurb:
            '曾经的内行之选：快速的键盘中心式输入，'
            '带语法高亮与自动补全，高精度，变量用法如电子表格。'
            '运行稳定——但已多年未发布新版本。',
        pros: [
          '开源，键盘输入极快',
          '高精度，无需安装可移植使用',
        ],
        cons: [
          '开发停滞——无未来展望',
          '功能上已被 Qalculate 超越',
          '不支持十二进制',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        '结论：Qalculate!/qalc 无有力竞争——选择其实只是 GUI 与终端工作流之别。'
        'KCalc 和 GNOME Calculator 作为轻量级标准计算器；'
        'SpeedCrunch 可用，但已无未来。',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        '在 Windows 上竞争相当稀薄——一款引擎脱颖而出，'
        '另加一个罕见案例：一款宽松许可的参考实现，'
        '其代码（不同于 GPL）可在法律上无障碍地复用。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 明显优选',
        blurb:
            '官方 Windows 构建版（qalculate-qt），'
            '与 Mac 和 Linux 版本使用同一套强大引擎：'
            '符号运算、任意精度、单位换算、绘图。',
        pros: [
          '开源，最强引擎',
          '支持十二进制计算',
          '可扩展自定义函数',
        ],
        cons: [
          'Windows 原生质感不够精致',
          '强大功能需要一定的学习成本',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Windows 计算器 (Microsoft)',
        tag: 'MIT · 预装',
        blurb:
            '自 2019 年起在 GitHub 上以开源形式发布——且采用 MIT 许可证。'
            '这是该领域罕见的宽松许可案例，'
            '因此是法律上最简便的代码参考（C++/C#）。'
            '提供带 bin/oct/hex 的程序员模式。',
        pros: [
          '基于 MIT 开源——代码复用法律上无障碍',
          '预装且为用户所熟悉',
          '程序员模式（bin/oct/hex）',
        ],
        cons: [
          '无 CAS，不可编程',
          '精度有限',
          '不支持十二进制',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 开发停滞',
        blurb:
            '快速的键盘中心式输入，带语法高亮与自动补全，'
            '高精度，无需安装可移植使用——'
            '但已多年未发布新版本。',
        pros: [
          '开源，键盘输入极快',
          '高精度，可移植',
        ],
        cons: [
          '开发停滞——无未来展望',
          '功能上已被 Qalculate 超越',
          '不支持十二进制',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '为 RPN 爱好者准备：桌面端免费，'
            '与 DM42 硬件计算核心使用同一套引擎。',
        pros: [
          '开源（GPL），桌面端免费',
          'Decimal-128 精度',
          '跨平台完全一致',
        ],
        cons: [
          'RPN 逻辑（Plus42 有所缓解）',
          '不支持十二进制',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '结论：Qalculate! 是明确之选。'
        '将 Windows 计算器作为 MIT 许可的代码参考备忘，'
        'SpeedCrunch 仅附维护警告推荐，'
        'Free42/Plus42 适合 RPN 爱好者。',
  ),
];
