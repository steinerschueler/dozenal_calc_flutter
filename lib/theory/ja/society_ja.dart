part of '../society_theory.dart';

List<ProseChapter> _societyChaptersJa() => const [
  ProseChapter('十二を求める運動', [
    ProseSection(
      '孤立した先駆者たち',
      '十ではなく十二で数えるという発想は古い。しかし長いあいだ、それを唱える者は'
          '個々におり、運動とはならなかった。すでに十八世紀には、博物学者ビュフォン'
          'の名が挙げられている——もっとも、その正確な典拠はあやふやで、参考文献から'
          '参考文献へと渡り歩いている。\n\n'
          '十九世紀になると、それはより具体的になる。速記法の考案者アイザック・'
          'ピットマンは一八五七年から十二を提唱し、十と十一のための独自の記号を'
          '提案した。哲学者ハーバート・スペンサーは一八九六年、メートル法に明確に'
          '反対する立場から、これを支持した。',
    ),
    ProseSection(
      'アンドリュースと『New Numbers』',
      'これを本格的な議題にしたのは一人のアメリカ人、フランク・エマーソン・'
          'アンドリュースだった。一九三四年、彼の論考「An Excursion in Numbers」が'
          'アトランティック・マンスリー誌に掲載された——同誌は、これまで数学を'
          '掲載したことは一度もないと自ら述べ、その本文の途中に、数学を敬遠する'
          '読者への注意書きを添えた。\n\n'
          '一九三五年には著書『New Numbers』が続き、これはアメリカで初めての種類の'
          '本となった。彼の論拠は単純だった。十二は二、三、四、六で割り切れるが、'
          '十は二と五でしか割り切れない。それでもアンドリュースは冷静で、「頑固な'
          '習慣の力」を前に、本当の移行は起こりにくいと考えていた。',
    ),
    ProseSection(
      '諸協会の誕生',
      'アンドリュースの記事に寄せられた手紙から文通の輪が生まれ、そこから一九四四年に'
          '「Duodecimal Society of America」が誕生した。その名を冗談まじりに付けたのは'
          'ラルフ・「ウィスカーズ」・ビアードであり、設立資金はジョージ・テリーが'
          '寄付した。のちにそれは「Dozenal Society of America」へと改称された'
          '——「duodecimal」という語のなかに十進の「decimal」が含まれているからである。\n\n'
          '一九五九年にはイギリスの姉妹協会、Dozenal Society of Great Britain が'
          '加わり、数学者A・C・エイトケンを著名な会員に擁した。アメリカの協会は今日まで'
          '「Duodecimal Bulletin」を発行している。その名誉会員には、SF作家の'
          'アイザック・アシモフも名を連ねていた。',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('十と十一のための新しい数字', [
    ProseSection(
      '記号の問題',
      '十二で計算する者には、十のためと十一のための二つの追加の数字が必要になる。'
          'それがどの記号であるべきかは、今日に至るまで統一されていない。'
          'アメリカの協会でさえ、固定した記法を定めてはいない。\n\n'
          'いくつもの変種がある。ピットマンの回転させた二と三（↊ と ↋）、'
          'アンドリュースの斜体のXと丸みを帯びたE、セクスティルと二重十字'
          '（電話のボタンに着想を得たもの）、書体設計者ドウィギンズのグリフ'
          '——そして単に、コンピュータの世界に由来する文字AとBである。',
    ),
    ProseSection(
      'ピットマン、Unicode、そして二〇二六年の切り替え',
      'アメリカの協会は記号を幾度も変えてきた。およそ二〇〇八年までは'
          'セクスティルと二重十字、それからドウィギンズのグリフ、'
          '二〇一五年からはピットマンの数字である。二〇一五年には'
          'Unicode標準もピットマンの記号を正式に収録した。\n\n'
          '二〇二六年の初め、協会はそのウェブサイトを文字AとBへと'
          '切り替えた——ピットマンを放棄するからではなく、その特殊記号が'
          '多くのブラウザや携帯電話ではいまだ確実には表示されないからである。'
          '印刷される会報のなかでは、ピットマンの数字が標準のままである。'
          '（このアプリは、表示において独自のグリフか、0–9 / A, B かを選べる。）',
    ),
    ProseSection(
      'リトル・トゥエルブトウズ',
      'ポップカルチャーのなかで最もよく知られた十二進法のかけらは、一つの歌である。'
          'アメリカの教育番組スクールハウス・ロックの「Little Twelvetoes」で、'
          'ボブ・ドロウが作詞・歌唱し、初放送は一九七三年だった。\n\n'
          'そのなかでは、十二本の足指をもつ親しみやすい宇宙人が、十二本の「指」を'
          'もつ者なら二つの新しい数字をどう発明していたかを示す——十を「dek」、'
          '十一を「el」と発音する。それは小学生には難しすぎると見なされ、'
          'ほかの回より放送回数は少なかったが、多くの人の記憶には残った。',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('ド、グロ、モ——十二進法で話す', [
    ProseSection(
      'ダース、グロス、グレートグロス',
      '十二は、十二進法では「10」になる。その桁を表す、ずっと前から日常で使われて'
          'いる言葉がある。十二個で一ダース、十二ダース（144）で一グロス、'
          '十二グロス（1728）で一グレートグロスである。\n\n'
          'これは注目に値する。こうした馴染み深い商業の言葉は、実は'
          'すでに十二進法の桁の値なのだ——一ダースは「10」、一グロスは「100」、'
          '一グレートグロスは十二の世界の「1000」である。',
    ),
    ProseSection(
      'デク、エル、そして体系的な命名',
      '二つの新しい数字は、たいてい「dek」（十）と「el」（十一）と発音する。'
          '桁については、短く do、gro、mo を使う（dozen、gross、great gross より）。\n\n'
          'そのほかに、オンライン共同体のなかで発展した体系的な命名がある。'
          '数字に固定した語根（un、bi、tri … dec、lev）を与え、それに十二の'
          'べき乗のための語尾を付ける——上方向へは「-qua」、下方向へは「-cia」。'
          'おもしろいのは「uncia」がちょうど十二分の一であることだ'
          '——「inch」（インチ）や「ounce」（オンス）が生まれた、まさにその同じ'
          'ラテン語の言葉である。',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM、諸協会、そして今日の道具', [
    ProseSection(
      'TGM——十二進法の度量衡',
      'イギリスの協会のトム・ペンドルベリーは、完全な十二進法の度量衡を'
          '構想した。TGMである。その名は、三つの基本単位 Tim、Grafut、Maz に'
          '由来する。\n\n'
          'メートル法とは異なり、それは長さからではなく時間から始まり、'
          'すべてを地球の引力から導き出す。「Grafut」（重力フィート）は'
          '一フィートのわずかに下にある。そこから面積、体積、速度、力の単位が'
          '整合的に導かれる——メートル法に対する、それ自体で閉じた対応物であり、'
          'まるごと十二で成り立っている。',
    ),
    ProseSection(
      '今日の諸協会',
      '両協会は存続しているが、規模は小さく、運営は無償の有志による。'
          '信頼できる会員数は存在しない。アメリカの協会は引き続き'
          'Duodecimal Bulletin を発行し、学習用および換算用の道具を'
          '提供しており、イギリスの協会はとりわけTGMの資料を維持している。\n\n'
          '最も活気のある場所は、オンライン・フォーラム「Dozensonline」である。'
          'そこで、体系的な数字の命名と、ついぞ完全には決着しなかった'
          '正しい数字をめぐる論争が生まれた。この共同体は小さいが、活発である。',
    ),
    ProseSection(
      '計算機、アプリ——そしてこのアプリ',
      '十二をめぐって、驚くほど活発な道具の世界が生まれた。十二進法の'
          '電卓、度量衡の換算器、さらには十二進法の時計やカレンダーまであり、'
          'その多くはオープンソースで、協会の会員たちによって作られたものである。\n\n'
          'このアプリも、まさにそこに連なる——独自のグリフ、正確な分数、'
          'そして単位の部分を備え、ネイティブに十二進法で計算する電卓である。'
          'それは、長く愛され続けてきたニッチな伝統への、ささやかな貢献である。',
    ),
    ProseSection(
      'それでも世界が十進法のままである理由',
      '十二が広まらないのは、数学のせいではほとんどない——数学はその味方である。'
          'それは習慣のせいだ。十進法は言語、学校、法律、技術のなかに染み込んで'
          'おり、移行は途方もなく手間のかかるものになるだろう。はるかに小さな'
          'はずのアメリカのメートル法への切り替えでさえ、それで頓挫した。\n\n'
          'それに応じて、関係者の多くは今日、この件を真剣な移行計画というよりは、'
          'むしろ魅力的な思考実験として捉えている。それは、数の基数の選択が'
          '自明ではないことを示し——そして、私たちが日々付き合っている数への'
          'まなざしを研ぎ澄ませてくれる。',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — 十二進法の電卓', [
    ProseSection('十二進法のためのアプリ', 'Dozecalは、ネイティブに十二進法で計算するiPhone向けの電卓です。2020年に独立系開発者のJohan Kovacsによって公開されたもので、アプリは無料です。その掲げる目的は、数学と科学における十二進法の利用を促進することにあります。\n\n計算は十二進モードと十進モードのいずれかを選んで行えます。両者を切り替えると、表示されている値は自動的に換算されます。三角関数は度を測定単位として動作します。'),
    ProseSection('逆ポーランド記法', 'Dozecalの特徴のひとつは、逆ポーランド記法（RPN）による入力です。「3 + 4 =」と打つ代わりに、ここでは「3 4 +」と入力します。つまり、まず2つの数を入れ、それから演算を指定するのです。最初は慣れないように感じられますが、括弧をまったく必要とせず、（Hewlett-Packardなどの）多くの科学電卓で長らく広く用いられてきました。'),
    ProseSection('十二進法のツール群の一部として', 'Dozecalは団体によって作られたものではなく、一個人によって作られたものであり、その説明文では十二進法に関するさらなる情報についてDozenal Society of Americaを参照するよう案内しています。こうしてDozecalは、十二進法のツールから成る小さくも生き生きとした世界の一部となっています。すなわち、このアプリやTGMの資料、そしてその他の電卓と並ぶ存在です。'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Paul Rapoport の Dozenal Calculator', [
    ProseSection('ブラウザで動く電卓', 'Paul Rapoport の Dozenal Calculator は、ウェブブラウザ上で直接動作する科学電卓で、無料かつインストール不要です。十二進法で計算しますが、いつでも十進表示に切り替えることもでき、数の基数は自由に変更できます。さらに、複数の独立したレジスタが利用できます。詳しい使い方は PDF として付属しています。'),
    ProseSection('数論に強い', 'とりわけ数論の機能が充実しており、これはまさにその割り切りやすさゆえに評価される基数によく合っています。この電卓は最大公約数と最小公倍数を求め、ある数のすべての約数を列挙し、それを素因数に分解します（重複度を付けるかどうかも選べます）。さらに、約数の総和、約数の個数、そしてオイラーの φ 関数 — その数より小さく、その数と互いに素な数の個数 — も扱えます。'),
    ProseSection('充実した科学計算のツール一式', 'それ以外の道具立ても完備しています。平方と平方根、任意のべき乗と累乗根、指数関数と対数 — 自然対数のほか、底が二と十の対数、そして任意の底に対する対数があります。加えて、三角関数と双曲線関数およびそれらの逆関数、組合せ論（組合せと順列、重複を許す場合も含む）、簡単な統計（平均と標準偏差）、階乗、パーセント機能、Gamma 関数、そして虚数単位 i も備えています。'),
    ProseSection('実に多くの量', '単なる計算にとどまらず、このプログラムは数十種類もの物理量を扱い、それらを相互に換算します。すなわち、時間と時刻、周波数、速度、長さ、面積、乾量と液量、質量、力、圧力、エネルギー、仕事率、温度、角度です。十二進法の時間単位も含まれています。'),
    ProseSection('電気工学にまで及ぶ', '十二進法の電卓としては異例なほど、応用物理学の領域にまで踏み込んでいます。電気インピーダンス、電気量（電荷）、電位（電圧）、電流といった独自の量の範囲を備えているのです。これによって、電気工学までも十二進法で計算しきることができます。'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
