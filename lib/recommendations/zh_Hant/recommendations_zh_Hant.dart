// Traditional Chinese translation of the "Recommendations" chapters. part of
// ../recommendations.dart.

part of '../recommendations.dart';

List<RecChapter> _recChaptersZhHant() => const [
  // ── 實體 ──────────────────────────────────────────────────────────────
  RecChapter(
    '實體',
    intro:
        '目標是一台小巧、可放入口袋的裝置——不是笨重的繪圖計算機——'
        '且須具備可程式性或搭載開放式運算核心。繪圖計算機（NumWorks、'
        'TI-Nspire、Casio fx-CG）因機型因素排除在外；'
        '經典款 HP 35s 已停產，二手市場僅以收藏家價格流通。',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: '專有 · 可程式科學計算機',
        blurb:
            '可程式口袋計算機，具備公式記憶體與自然顯示功能。'
            '針對反覆出現的木工計算公式（榫槽深度、斜接幾何），'
            '可儲存附參數的程式以便隨時調用。',
        pros: [
          '小巧便攜，適合放入口袋',
          '可程式，附公式函式庫',
          '熟悉的代數輸入方式，支援度/分/秒',
          '性價比極佳',
        ],
        cons: [
          '在歐洲通常只能透過進口取得',
          '專有軟體——無法查看原始碼',
          '不支援十二進制輸出',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Free42 核心 (GPL-2.0) · RPN · 旗艦級',
        blurb:
            '旗艦 RPN 計算機，致敬 HP-42S，採用 CNC 銑製不鏽鋼外殼，配備 USB-C 介面。'
            '運算核心為 Thomas Okken 的開源 Free42，採用 decimal-128 算術（34 位有效數字）。',
        pros: [
          '開放運算核心（Free42，GPL）——行為可深入研究',
          '與桌面/行動版引擎完全相同，程式可跨平台移植',
          '極高精度（34 位十進制有效數字）',
          '質感如傳家之寶，具 USB-C 大容量儲存',
        ],
        cons: [
          '僅支援 RPN——需要適應期',
          '旗艦級售價，有時難以購得',
          'BASE 功能不支援十二進制',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: '專有 · 科學計算機（入門級）',
        blurb:
            '現行款不可程式 ClassWiz——價格實惠、幾乎隨處可買到，'
            '適合不需要可程式性的使用者。',
        pros: [
          '價格實惠，幾乎隨處可購得',
          '自然顯示，功能齊全',
          '小巧耐用',
        ],
        cons: [
          '不可程式',
          '專有軟體',
          '執行複雜運算時明顯較慢',
          '不支援十二進制',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        '總結：fx-5800P 是理性之選——可程式、小巧、輸入方式熟悉。'
        'DM42n 則是開放核心的發燒友收藏品（但需接受 RPN 及旗艦售價）。'
        '建議：購買硬體前，先免費使用 Free42/Plus42 體驗 RPN。',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        '日常手機使用首選。以下為可透過 Google Play 正常取得的最強應用程式——'
        '純開源選項將於下一章（F-Droid）介紹。',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: '專有 · CAS & 繪圖',
        blurb:
            '科學計算機，具備符號代數、繪圖、方程式及微積分功能。'
            '廣泛使用，持續維護，並針對不同螢幕尺寸提供對應版面。',
        pros: [
          '功能豐富（CAS、繪圖、高位數精度）',
          '支援分數與循環小數顯示',
          '持續維護，版面可自訂',
        ],
        cons: [
          '專有軟體——對自身專案無學習參考價值',
          '完整功能需付費解鎖',
          '不支援十二進制輸出',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '對 HP-42S 的完整重新實作，不含任何 HP 原始碼。'
            'Plus42 進一步加入代數方程式與求解器，大幅降低 RPN 的入門門檻。',
        pros: [
          '開源（GPL），程式碼可作為學習材料',
          '跨平台完全一致——程式可移植',
          'Decimal-128 精度',
          'Plus42 支援代數方程式',
        ],
        cons: [
          'RPN 邏輯（Plus42 已有所緩解）',
          'BASE 功能不支援十二進制',
          '行動版需付費（桌面版免費）',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        '總結：HiPER Calc Pro 是 Play Store 中最強的日常工具；'
        'Free42/Plus42 則是具備 decimal-128 精度的開源 RPN 方案。',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        '來自 F-Droid 商店（或直接由開發者提供）的純開源應用程式：'
        '程式碼可查閱、無追蹤器——同時也是自身專案的學習與參考素材。',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & 單位換算',
        blurb:
            'Qalculate! 引擎的官方 Android 前端：以 Kotlin/Java 介面層包裹原生 C++ 函式庫 libqalculate。'
            '支援符號運算、任意精度、區間算術、單位換算——是此領域最強大的引擎。',
        pros: [
          '開源（GPL），最強大引擎（CAS、單位換算、精度）',
          '支援十二進制（十二進位）運算——此處唯一支援者',
          '架構具教學價值：Kotlin 介面層覆蓋原生運算核心',
          '無追蹤器',
        ],
        cons: [
          '主要透過 F-Droid 或直接建置取得',
          '專案拒絕 Google 開發者驗證——透過一般管道安裝的可用性未來存有不確定性（透過 F-Droid 不受影響）',
          '入門門檻高於一般簡易計算機',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            '精簡、維護良好的計算機，完全以 Kotlin 撰寫。功能雖非頂尖，'
            '但程式碼易讀且架構清晰——值得關注的是其有文件記錄的內部數字'
            '從 Double 遷移至 BigDecimal 的過程，恰好就是十二進制計算機同樣需要解決的精度問題。',
        pros: [
          '開源（GPL-3.0），Kotlin 程式碼整潔',
          '理想的學習與參考對象',
          '支援歷史紀錄，介面簡潔，無追蹤器',
        ],
        cons: [
          '無 CAS，不可程式化',
          '功能上無法與 HiPER/Qalculate 競爭',
          '不支援十二進制',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        '總結：Qalculate! 是最強的開源選擇——也是唯一支援十二進制輸出的選項。'
        'OpenCalc 則是供開發者「一窺引擎室」的參考項目。',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS 是開源計算機最薄弱的平台——但這裡有一款出色的專有工具。'
        '坦白說：真正的 FOSS 競爭者付之闕如。',
    calcs: [
      RecCalc(
        'PCalc',
        tag: '專有 · 參考級工具',
        blurb:
            '自 1990 年代起被視為 Apple 平台的基準之作：'
            '豐富的單位換算、頂級 RPN 輸入、深度可自訂性（主題、按鍵版面、紙帶）。'
            '支援 iPhone、iPad、Apple Watch 及 Apple TV。',
        pros: [
          '頂級、高度成熟的工具',
          '可選 RPN 模式，歷史紀錄可編輯',
          '豐富的單位換算與常數',
          '提供免費精簡版供入門體驗',
        ],
        cons: [
          '專有軟體——無學習參考價值',
          '需付費',
          '功能繁多，初期可能令人不知所措',
          '不支援十二進制',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '填補 iOS 上的開源空缺：Free42 在 App Store 免費提供，'
            '採用與其他所有平台相同的引擎。',
        pros: [
          '開源（GPL），Free42 免費',
          '跨平台完全一致',
          'Decimal-128 精度',
          'Plus42 支援代數方程式',
        ],
        cons: [
          'RPN 邏輯（Plus42 已有所緩解）',
          '不支援十二進制',
          'Plus42 需付費',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '總結：PCalc 作為主要工具（iOS 上無正式 FOSS 競爭者），'
        'Free42/Plus42 作為開源推薦選項，亦是進入 RPN 的清晰起點。',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        '在 Mac 上，最佳原生工具與最強大的開放引擎相遇——'
        '分工合作效益顯著：快速鍵盤操作交由此端，精確與符號運算交由彼端。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 最強大引擎',
        blurb:
            '桌面級強力工具（同時支援 Windows 與 Linux）：符號運算、任意精度、'
            '單位換算、繪圖。可透過 Homebrew 安裝；CLI「qalc」與 Linux 版行為完全一致。',
        pros: [
          '開源，最強大引擎（CAS、單位換算、精確分數）',
          '支援十二進制（十二進位）運算',
          '可擴充自訂函式，CLI 可腳本化',
        ],
        cons: [
          '相較 PCalc，Mac 原生質感略遜',
          '強大功能需花時間熟悉',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: '專有 · 原生 Mac 品質',
        blurb:
            '與 iOS 版具備相同優勢，呈現於精緻的 Mac 應用程式中：'
            '深度可自訂性、用於重複使用運算式的「Magic Variables」，'
            '以及跨 Apple 裝置的 Handoff 功能。',
        pros: [
          '原生、成熟的 Mac 應用程式',
          '支援 RPN、紙帶、豐富單位換算',
          'Magic Variables，Handoff iOS/macOS',
        ],
        cons: [
          '專有軟體，需付費',
          '不支援十二進制',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '同樣支援 macOS——桌面版免費。'
            '與 DM42 硬體運算核心採用相同引擎。',
        pros: [
          '開源（GPL），桌面版免費',
          'Decimal-128 精度',
          '跨平台完全一致',
        ],
        cons: [
          'RPN 邏輯',
          '不支援十二進制',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '總結：PCalc 適合快速鍵盤操作，Qalculate! 適合精確與符號運算（以及十二進制）。'
        '邊緣專科工具：Numi（自然語言輸入）與 Soulver（筆記本式計算）。',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        '在 Linux 上局面清晰——一款引擎獨霸，真正的問題只是「GUI 還是終端機？」。'
        '對於純粹的標準計算需求，也有幾款桌面經典可供選擇。',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · 無可匹敵',
        blurb:
            'GTK 與 Qt 圖形介面加上 CLI「qalc」。完整 libqalculate 功能集：'
            '符號運算、任意精度、不確定度傳播、繪圖。'
            '「qalc」可腳本化（運算式作為參數或從檔案讀取），並已收錄於各大主流發行版。',
        pros: [
          '開源，各大發行版均可取得',
          '最強大引擎，支援十二進制運算',
          'CLI 可腳本化——別名、管道、自訂函式庫',
        ],
        cons: [
          '豐富功能需投入時間學習',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · KDE 標準',
        blurb:
            'KDE 計算機，具備科學模式與程式設計師模式，以及可自訂按鍵版面——扎實的基本配備。',
        pros: [
          '開源，輕量',
          '程式設計師模式（bin/oct/hex）',
          '與 KDE Plasma 整合良好',
        ],
        cons: [
          '無 CAS',
          '不支援十二進制',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · GNOME 標準',
        blurb:
            'GNOME 標準計算機，內建單位換算與貨幣功能，並提供進階、財務及程式設計師模式。'
            '功能上略遜於 Qalculate，但全面扎實。',
        pros: [
          '開源，操作簡便',
          '內建單位換算與貨幣',
        ],
        cons: [
          '功能不及 Qalculate 強大',
          '不支援十二進制',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 開發停滯',
        blurb:
            '昔日的秘密利器：快速的鍵盤導向輸入、語法高亮與自動補全、'
            '高精度、如試算表般的變數支援。穩定——但多年來已無新版本。',
        pros: [
          '開源，鍵盤輸入極為快速',
          '高精度，免安裝可攜帶使用',
        ],
        cons: [
          '開發停滯——無未來展望',
          '功能上已被 Qalculate 超越',
          '不支援十二進制',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        '總結：Qalculate!/qalc 無正式競爭對手——選擇其實只在 GUI 與終端機工作流之間。'
        'KCalc 與 GNOME Calculator 作為輕量標準計算機；SpeedCrunch 可用，但前景不明。',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        '在 Windows 上競爭者稀少——一款引擎脫穎而出，'
        '加上一個罕見案例：採用寬鬆授權的參考作品，'
        '其程式碼（不同於 GPL）在法律上可無繁複手續地直接再利用。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 明確首選',
        blurb:
            '官方 Windows 建置版（qalculate-qt），搭載與 Mac 及 Linux 版相同的強大引擎：'
            '符號運算、任意精度、單位換算、繪圖。',
        pros: [
          '開源，最強大引擎',
          '支援十二進制（十二進位）運算',
          '可擴充自訂函式',
        ],
        cons: [
          '相較原生 Windows 應用程式，精緻度略遜',
          '強大功能需花時間熟悉',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Windows 計算機 (Microsoft)',
        tag: 'MIT · 預裝',
        blurb:
            '自 2019 年起以 MIT 授權在 GitHub 開源。'
            '這是此領域罕見的寬鬆授權案例，因此也是法律上最無障礙的程式碼參考（C++/C#）。'
            '提供具備 bin/oct/hex 的程式設計師模式。',
        pros: [
          '以 MIT 授權開源——程式碼再利用在法律上無繁複手續',
          '預裝且為人熟知',
          '程式設計師模式（bin/oct/hex）',
        ],
        cons: [
          '無 CAS，不可程式化',
          '精度有限',
          '不支援十二進制',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 開發停滯',
        blurb:
            '快速的鍵盤導向輸入、語法高亮與自動補全、高精度、免安裝可攜帶使用——'
            '但多年來已無新版本。',
        pros: [
          '開源，鍵盤輸入極為快速',
          '高精度，可攜帶使用',
        ],
        cons: [
          '開發停滯——無未來展望',
          '功能上已被 Qalculate 超越',
          '不支援十二進制',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            '適合 RPN 愛好者：桌面版免費，與 DM42 硬體運算核心採用相同引擎。',
        pros: [
          '開源（GPL），桌面版免費',
          'Decimal-128 精度',
          '跨平台完全一致',
        ],
        cons: [
          'RPN 邏輯（Plus42 已有所緩解）',
          '不支援十二進制',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        '總結：Qalculate! 是明確之選。'
        '將 Windows 計算機列為 MIT 授權程式碼參考備用；'
        'SpeedCrunch 附維護警示可用；Free42/Plus42 供 RPN 愛好者選擇。',
  ),
];
