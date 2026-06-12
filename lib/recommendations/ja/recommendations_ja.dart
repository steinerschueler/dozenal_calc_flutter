// Japanese translation of the "Recommendations" chapters. part of
// ../recommendations.dart.

part of '../recommendations.dart';

List<RecChapter> _recChaptersJa() => const [
  // ── 物理 ──────────────────────────────────────────────────────────────
  RecChapter(
    '物理',
    intro:
        '求めているのは、ポケットに収まるコンパクトな機器です — かさばるグラフ電卓では'
        'なく、プログラム可能であるか、オープンな演算コアを備えたものが対象です。'
        'グラフ電卓（NumWorks、TI-Nspire、Casio fx-CG）はフォームファクターの観点で'
        '除外しており、定番のHP 35sは生産終了となり、コレクター向け価格でしか'
        '中古品が手に入りません。',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'プロプライエタリ · プログラム可能な関数電卓',
        blurb:
            'フォーミュラメモリと自然表示を備えたプログラム可能なポケット電卓です。'
            '木工建築で繰り返し使う計算式（刻み深さ、継手の幾何学）を'
            'パラメータ付きプログラムとして保存できます。',
        pros: [
          'コンパクトでポケットに収まるサイズ',
          'プログラム可能、数式ライブラリ搭載',
          '馴染みやすい代数入力、度/分/秒（DMS）対応',
          'コストパフォーマンスに優れる',
        ],
        cons: [
          'ヨーロッパでは通常、輸入でしか入手できない',
          'プロプライエタリ — コードを確認する手段がない',
          '十二進法出力に非対応',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Free42コア（GPL-2.0） · RPN · プレミアム',
        blurb:
            'HP-42Sへのオマージュとして作られたフラグシップRPN電卓で、'
            'CNC切削のステンレス筐体にUSB-Cを搭載しています。演算コアは'
            'Thomas Okkenのオープンソースであるdecimal-128演算（34桁）の'
            'Free42です。',
        pros: [
          'オープンな演算コア（Free42、GPL） — 動作の仕組みを学べる',
          'デスクトップ/モバイル版エンジンと完全に同一 — プログラムを移植可能',
          '極めて高精度（34桁）',
          '堅牢な作りで末永く使え、USB-Cマスストレージ対応',
        ],
        cons: [
          'RPNのみ — 慣れるまで時間が必要',
          'プレミアム価格帯、入手困難な時期もある',
          'BASE機能に十二進法は含まれない',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'プロプライエタリ · 関数電卓（廉価版）',
        blurb:
            '現行の非プログラム型ClassWizで、プログラム機能が不要な方向けの'
            'リーズナブルでどこでも手に入る選択肢です。',
        pros: [
          '手頃な価格でほぼどこでも購入可能',
          '自然表示、豊富な機能',
          'コンパクトで頑丈',
        ],
        cons: [
          'プログラム不可',
          'プロプライエタリ',
          '複雑な演算で若干処理が遅い',
          '十二進法に非対応',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'まとめ: fx-5800Pは合理的な選択です — プログラム可能、コンパクト、'
        '馴染みやすい入力方式。DM42nはオープンな演算コアを持つ愛好家向けの一台です'
        '（ただしRPN必須かつプレミアム価格）。ヒント: ハードウェアを購入する前に'
        'Free42/Plus42で無料でRPNを試してみましょう。',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        '日常のスマートフォン利用向けです。ここではGoogle Playで通常入手できる'
        '強力なアプリを紹介します — 純粋なオープンソース版は次の章（F-Droid）で'
        '取り上げます。',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'プロプライエタリ · CAS & グラフ',
        blurb:
            '記号代数、グラフ、方程式、微分・積分を備えた関数電卓です。'
            '広く普及しており、精力的にメンテナンスされ、さまざまな画面サイズ向けの'
            'レイアウトも用意されています。',
        pros: [
          '豊富な機能（CAS、グラフ、高桁数演算）',
          '分数および循環小数の表示に対応',
          '継続的にメンテナンスされ、レイアウトをカスタマイズ可能',
        ],
        cons: [
          'プロプライエタリ — 自分のプロジェクトに活かせる学習的価値がない',
          '全機能は有料',
          '十二進法出力に非対応',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'HPのコードを一切使わないHP-42Sの完全再実装です。Plus42は代数方程式と'
            'ソルバーを追加し、RPN入門の壁を大幅に下げています。',
        pros: [
          'オープンソース（GPL）、コードが学習教材になる',
          'プラットフォーム間で完全に同一 — プログラムを移植可能',
          'Decimal-128精度',
          'Plus42は代数方程式に対応',
        ],
        cons: [
          'RPN方式（Plus42が緩和してくれる）',
          'BASE機能に十二進法は含まれない',
          'モバイル版は有料（デスクトップ版は無料）',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'まとめ: Play Storeでの最強の日常ツールとしてHiPER Calc Pro、'
        'decimal-128を備えたオープンソースRPN系としてFree42/Plus42を推薦します。',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'F-Droidストア（あるいは開発者から直接）入手できる純粋なオープンソースアプリです。'
        'コードを確認でき、トラッカーもなく、自分のプロジェクトの学習・参考資料にも'
        'なります。',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & 単位変換',
        blurb:
            'Qalculate!エンジンの公式Androidフロントエンドで、ネイティブC++ライブラリ'
            'libqalculateの上にKotlin/Java UIを構築しています。記号計算、任意精度演算、'
            '区間演算、単位計算を備えた、この分野で最も強力なエンジンです。',
        pros: [
          'オープンソース（GPL）、最も強力なエンジン（CAS、単位変換、高精度）',
          '十二進法（duodecimal）でも計算できる — この中で唯一',
          '教育的なアーキテクチャ: ネイティブコアの上にKotlin UIを重ねた構造',
          'トラッカーなし',
        ],
        cons: [
          '主にF-Droidまたは直接ビルドで入手',
          'プロジェクトがGoogleの開発者認証を拒否しているため、通常チャネルでの'
              '将来の入手可否は不確か（F-Droid経由なら問題なし）',
          '単純な電卓より入門の敷居が高い',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            '完全にKotlinで書かれた、軽量でメンテナンスの行き届いた電卓です。機能面の'
            '王者ではありませんが、コードが読みやすくコンパクトです — 内部の数値型を'
            'DoubleからBigDecimalに切り替えた変更がドキュメントで記録されており、'
            '十二進法電卓が解決しなければならない精度問題とまさに同じ課題に向き合って'
            'います。',
        pros: [
          'オープンソース（GPL-3.0）、整ったKotlinコード',
          '学習・参照のための理想的な対象',
          '履歴機能、シンプルなUI、トラッカーなし',
        ],
        cons: [
          'CASなし、プログラム機能なし',
          '機能面ではHiPER/Qalculateの競合にならない',
          '十二進法に非対応',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'まとめ: Qalculate!は最も強力なオープンソースの選択肢であり、'
        '十二進法出力に対応する唯一のアプリです。OpenCalcは開発者向けの'
        '「内部構造を覗く窓」です。',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOSはオープンソース電卓において最も選択肢の少ないプラットフォームです — '
        'ただし、優れたプロプライエタリツールが一つあります。正直に言えば、'
        '真のFOSS競合は存在しません。',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'プロプライエタリ · リファレンスツール',
        blurb:
            '1990年代からAppleプラットフォームのリファレンスとして知られています。'
            '豊富な単位変換、一流のRPN入力、高い柔軟性（テーマ、キーレイアウト、'
            'ペーパーテープ）を備え、iPhone、iPad、Apple Watch、Apple TVで動作します。',
        pros: [
          '一流の非常に成熟したツール',
          'オプションのRPNモード、編集可能な履歴',
          '豊富な単位変換と定数',
          '無料のLite版で試すことができる',
        ],
        cons: [
          'プロプライエタリ — 学習的価値がない',
          '有料',
          '機能が豊富すぎて最初は圧倒されることがある',
          '十二進法に非対応',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'iOSのオープンソース空白を埋める存在です。Free42はApp Storeで無料で入手でき、'
            '他のすべてのプラットフォームと同じエンジンを使用しています。',
        pros: [
          'オープンソース（GPL）、Free42は無料',
          'プラットフォーム間で完全に同一',
          'Decimal-128精度',
          'Plus42は代数方程式に対応',
        ],
        cons: [
          'RPN方式（Plus42が緩和してくれる）',
          '十二進法に非対応',
          'Plus42は有料',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'まとめ: メインツールとしてPCalc（iOS上に真剣なFOSS競合なし）、'
        'オープンソースのRPN推薦とRPN入門としてFree42/Plus42を推薦します。',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Macでは、最良のネイティブツールと最も強力なオープンエンジンが出会います — '
        '役割を分担するのが得策です。高速なキー操作はこちら、正確な記号計算はあちら。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 最強エンジン',
        blurb:
            'WindowsとLinuxにも対応するデスクトップの強力ツールです。記号計算、'
            '任意精度、単位計算、プロット機能を持ちます。Homebrewでインストール可能で、'
            'CLIの「qalc」はLinux版と同一の動作をします。',
        pros: [
          'オープンソース、最強エンジン（CAS、単位変換、厳密な分数計算）',
          '十二進法（duodecimal）でも計算できる',
          '自作関数で拡張可能、CLIはスクリプト対応',
        ],
        cons: [
          'PCalcほどMacネイティブなポリッシュはない',
          '機能の豊富さには慣れが必要',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'プロプライエタリ · ネイティブMac品質',
        blurb:
            'iOSと同じ強みを、磨き上げられたMacアプリで発揮します。高い柔軟性と'
            '式を再利用するためのMagic Variables、さらにAppleデバイス間のHandoffに'
            '対応しています。',
        pros: [
          'ネイティブで成熟したMacアプリ',
          'RPN、ペーパーテープ、豊富な単位変換',
          'Magic Variables、Handoff iOS/macOS',
        ],
        cons: [
          'プロプライエタリ、有料',
          '十二進法に非対応',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'macOSでも利用可能です — デスクトップ版は無料。DM42ハードウェアの'
            '演算コアと同じエンジンを使用しています。',
        pros: [
          'オープンソース（GPL）、デスクトップ版は無料',
          'Decimal-128精度',
          'プラットフォーム間で完全に同一',
        ],
        cons: [
          'RPN方式',
          '十二進法に非対応',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'まとめ: 高速なキー操作にはPCalc、正確な記号計算（および十二進法）には'
        'Qalculate!を推薦します。ニッチな専門ツールとして: Numi（自然言語入力）と'
        'Soulver（ノートパッド形式の計算）も挙げておきます。',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Linuxでは状況は明確です — 一つのエンジンが圧倒的で、本当の問題は'
        '「GUIかターミナルか」だけです。純粋な標準電卓としてはデスクトップの'
        '定番アプリも選択肢に入ります。',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · 対抗なし',
        blurb:
            'GTKとQtのフロントエンドに加えてCLIの「qalc」を提供します。'
            'libqalculateのフル機能: 記号計算、任意精度、不確かさの伝播、プロット。'
            '「qalc」はスクリプト対応（式を引数やファイルから受け取り）で、'
            'すべての主要なディストリビューションにパッケージされています。',
        pros: [
          'オープンソース、すべてのディストリビューションで利用可能',
          '最強エンジン、十二進法でも計算できる',
          'CLIはスクリプト対応 — エイリアス、パイプ、自作関数ライブラリ',
        ],
        cons: [
          '豊富な機能を使いこなすには学習が必要',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · KDE標準',
        blurb:
            '関数モードとプログラマーモード、カスタマイズ可能なキーレイアウトを持つ'
            'KDE電卓です — しっかりとした基本機能を備えています。',
        pros: [
          'オープンソース、軽量',
          'プログラマーモード（bin/oct/hex）',
          'KDE Plasmaに深く統合されている',
        ],
        cons: [
          'CASなし',
          '十二進法に非対応',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · GNOME標準',
        blurb:
            '単位変換と通貨換算、さらに高度・財務・プログラマーモードを備えた'
            'GNOMEの標準電卓です。機能面ではQalculateに及びませんが、全体的に'
            'しっかりしています。',
        pros: [
          'オープンソース、使いやすい',
          '単位変換と通貨換算を内蔵',
        ],
        cons: [
          'Qalculateより機能が少ない',
          '十二進法に非対応',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 開発停止',
        blurb:
            'かつての穴場アプリです。シンタックスハイライトと自動補完を持つ高速な'
            'キーボード中心の入力、高精度演算、スプレッドシートのような変数機能を'
            '備えています。安定していますが、長年新バージョンが出ていません。',
        pros: [
          'オープンソース、非常に高速なキーボード入力',
          '高精度、インストール不要でポータブル',
        ],
        cons: [
          '開発が停止しており将来性がない',
          '機能面でQalculateに追い越されている',
          '十二進法に非対応',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'まとめ: Qalculate!/qalcに真剣な競合はなく、選択の余地は実質的に'
        'GUIかターミナルワークフローかだけです。KCalcとGNOME Calculatorは'
        '軽量な標準電卓として、SpeedCrunchは使えますが将来性はありません。',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Windowsでは競合は薄く、一つのエンジンが際立ちます。加えて、GPLとは異なり'
        '法的に手軽にコードを再利用できる、寛容なライセンスのリファレンスという'
        '珍しいケースもあります。',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · 明確な勝者',
        blurb:
            'MacとLinuxと同じ強力なエンジンを持つ公式Windowsビルド（qalculate-qt）です。'
            '記号計算、任意精度、単位変換、プロット機能を備えています。',
        pros: [
          'オープンソース、最強エンジン',
          '十二進法（duodecimal）でも計算できる',
          '自作関数で拡張可能',
        ],
        cons: [
          'Windowsネイティブなポリッシュには欠ける',
          '機能の豊富さには慣れが必要',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Windows 電卓 (Microsoft)',
        tag: 'MIT · プリインストール済み',
        blurb:
            '2019年よりGitHubでオープンソース化されており、MITライセンスです。'
            'この分野では珍しいパーミッシブライセンスのケースであり、'
            '法的に最もシンプルなコードリファレンス（C++/C#）です。'
            'bin/oct/hexを備えたプログラマーモードも搭載しています。',
        pros: [
          'MITライセンスのオープンソース — コード流用が法的にシンプル',
          'プリインストール済みで馴染みやすい',
          'プログラマーモード（bin/oct/hex）',
        ],
        cons: [
          'CASなし、プログラム機能なし',
          '精度に限界がある',
          '十二進法に非対応',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · 開発停止',
        blurb:
            'シンタックスハイライトと自動補完を持つ高速なキーボード中心の入力、'
            '高精度演算、インストール不要でポータブル — ただし長年新バージョンが'
            '出ていません。',
        pros: [
          'オープンソース、非常に高速なキーボード入力',
          '高精度、ポータブル',
        ],
        cons: [
          '開発が停止しており将来性がない',
          '機能面でQalculateに追い越されている',
          '十二進法に非対応',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'RPNファン向け: デスクトップ版は無料で、DM42ハードウェアの演算コアと'
            '同じエンジンを使用しています。',
        pros: [
          'オープンソース（GPL）、デスクトップ版は無料',
          'Decimal-128精度',
          'プラットフォーム間で完全に同一',
        ],
        cons: [
          'RPN方式（Plus42が緩和してくれる）',
          '十二進法に非対応',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'まとめ: Qalculate!が明確な選択肢です。Windows 電卓はMITライセンスの'
        'コードリファレンスとして頭に入れておきましょう。SpeedCrunchは'
        'メンテナンス停止の注意付きで、Free42/Plus42はRPNファンに向けて推薦します。',
  ),
];
