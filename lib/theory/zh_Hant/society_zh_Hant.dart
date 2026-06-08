// 「十二進位學會」章節的繁體中文散文。part of
// ../society_theory.dart。簡單句子（較易翻譯）。事實與
// 歸屬的觀點；對不確定的歸屬（引用連鎖）誠實以告，
// 不下敘事者的定論。提煉自 docs/research/society_*.md。

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersZhHant() => const [
  ProseChapter('一場為十二而生的運動', [
    ProseSection(
      '零星的先驅',
      '寧可以十二而非以十來計算的想法，由來已久。不過長久以來'
          '只有零星的倡導者，並未形成運動。早在十八'
          '世紀，博物學家布豐（Buffon）就被提及——然而確切的'
          '出處並不可靠，在各種工具書之間'
          '輾轉相傳。\n\n'
          '到了十九世紀，事情變得更加具體。速記法的發明者'
          '伊薩克·皮特曼（Isaac Pitman）自 1857 年起鼓吹十二，並提出自己的符號'
          '來表示十與十一。哲學家赫伯特·斯賓塞（Herbert Spencer）於 1896 年'
          '為之倡言，並明確反對公制系統。',
    ),
    ProseSection(
      '安德魯斯與《新數字》',
      '一位美國人讓這件事真正進入正題：弗蘭克·愛默生·安德魯斯（Frank Emerson Andrews）。1934 年'
          '他的論文〈數字之旅〉（An Excursion in Numbers）發表於《大西洋'
          '月刊》——這本雜誌自稱從未'
          '刊登過數學，並在文章中間'
          '為怕數學的讀者附上一則'
          '警語。\n\n'
          '1935 年，他的著作《新數字》（New Numbers）問世，是美國'
          '同類書籍中的第一本。他的論點很簡單：十二可被 2、3、4 與 6'
          '整除，十則只能被 2 與 5 整除。安德魯斯對此很冷靜——他認為，'
          '在「根深柢固的習慣力量」面前，真正的改制'
          '不大可能實現。',
    ),
    ProseSection(
      '學會的誕生',
      '從讀者對安德魯斯文章的來信中，逐漸發展出一個通信圈，'
          '並於 1944 年催生了「美國十二進位學會」（Duodecimal Society of America）。這名字是拉爾夫·'
          '「Whiskers」·比爾德（Ralph "Whiskers" Beard）開玩笑取的；創始資金則由喬治·'
          '泰瑞（George Terry）捐贈。後來它更名為「美國 Dozenal 學會」（Dozenal Society of America）'
          '——因為「duodecimal」一詞裡藏著十進位的「decimal」。\n\n'
          '1959 年，英國的姊妹組織加入，即大不列顛 Dozenal 學會'
          '（Dozenal Society of Great Britain），數學家 A. C. 艾特肯（A. C. Aitken）是其'
          '著名成員。美國學會至今仍出版'
          '《十二進位通報》（Duodecimal Bulletin）；其榮譽會員包括'
          '科幻作家以撒·艾西莫夫（Isaac Asimov）。',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('給十與十一的新數字', [
    ProseSection(
      '符號難題',
      '凡是以十二計算的人，都需要兩個額外的數字——用於十與'
          '用於十一。這兩個該是什麼，至今仍無統一'
          '定論；就連美國學會也不規定固定的'
          '記法。\n\n'
          '有好幾種變體：皮特曼旋轉過的二與三（↊ 與 '
          '↋）、安德魯斯的斜體 X 與圓化的 E、一個六角星與一個'
          '雙十字（靈感來自電話按鍵）、字體設計師'
          '德威金斯（Dwiggins）的字形——以及單純取自電腦世界的'
          '字母 A 與 B。',
    ),
    ProseSection(
      '皮特曼、Unicode 與 2026 年的改用',
      '美國學會多次更換它的符號：'
          '六角星與雙十字用到約 2008 年，然後是德威金斯字形，'
          '自 2015 年起改用皮特曼數字。2015 年，Unicode 標準也'
          '正式收錄了皮特曼符號。\n\n'
          '2026 年初，學會將其網站改用'
          '字母 A 與 B——並不是因為要放棄皮特曼，而是'
          '因為這些特殊符號在許多瀏覽器與手機上仍無法'
          '可靠地顯示。在印刷版的通報中，皮特曼數字'
          '仍是標準。（本應用程式的顯示區可選用'
          '自家字形或 0–9 / A、B。）',
    ),
    ProseSection(
      'Little Twelvetoes',
      '流行文化中最知名的一段十二進位內容是一首歌：〈Little '
          'Twelvetoes〉，出自美國教學系列《Schoolhouse Rock》，由'
          '鮑勃·多羅（Bob Dorough）創作並演唱，首次於 1973 年播出。\n\n'
          '歌中，一位友善、長著十二根腳趾的外星人示範了，'
          '一個有十二根「手指」的人會如何發明出兩個新數字'
          '——讀作「dek」表示十、「el」表示十一。它被認為對'
          '小學生來說太難，播出次數比其他單元少，'
          '卻讓許多人記憶猶新。',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do、Gro、Mo——以十二進位來說話', [
    ProseSection(
      '一打、籮與大籮',
      '在十二進位中，十二寫作「10」。對於它的各個位數，'
          '早就有日常用語：十二件是一打，十二'
          '打（144）是一籮（gross），十二籮（1728）是一大籮（great gross）。\n\n'
          '這一點很值得注意：這些熟悉的商業用語其實'
          '早已是十二進位的位值——一打是「10」，'
          '一籮是「100」，一大籮就是十二世界裡的「1000」。',
    ),
    ProseSection(
      'Dek、el 與系統化命名',
      '那兩個新數字通常讀作「dek」（十）與「el」（十一）。'
          '對於各位數，人們簡稱 do、gro、mo（來自 dozen、gross、great '
          'gross）。\n\n'
          '此外還有一套系統化命名，由線上'
          '社群所發展：為各數字設定固定的詞根（un、'
          'bi、tri … dec、lev），再加上表示十二之冪的字尾——往上用「-qua」、'
          '往下用「-cia」。其中巧妙的是：「uncia」正好是'
          '十二分之一——正是「吋」（inch）與'
          '「盎司」（Unze）所源出的那個拉丁字。',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM、學會與當今的工具', [
    ProseSection(
      'TGM——一套十二進位的度量系統',
      '英國學會的湯姆·彭德爾伯里（Tom Pendlebury）設計了一套'
          '完整的十二進位度量系統：TGM，依其三個'
          '基本單位 Tim、Grafut 與 Maz 命名。\n\n'
          '與公制系統不同，它並非從長度出發，'
          '而是從時間出發，並透過地球引力推導出一切。'
          '「Grafut」（重力呎）略短於一呎。由此'
          '可一致地導出面積、體積、速度與'
          '力的單位——一個自成體系、完全以十二為基的'
          '公制對應系統。',
    ),
    ProseSection(
      '當今的學會',
      '兩個學會都仍存在，但規模都很小、由志工維持；'
          '並沒有可靠的會員人數。美國學會'
          '繼續出版《十二進位通報》，並提供學習與'
          '換算工具，英國學會則主要維護'
          'TGM 的資料。\n\n'
          '最具活力的地方是線上論壇「Dozensonline」。系統化的'
          '數字命名，以及那場從未完全'
          '落幕、關於正確數字的爭論，都在那裡誕生。這個社群'
          '雖小，卻很活躍。',
    ),
    ProseSection(
      '計算機、應用程式——以及本程式',
      '圍繞著十二，意外地形成了一個相當熱絡的工具圈：'
          '十二進位的計算機、度量換算器，甚至還有一座'
          '十二進位的時鐘與一部曆法，其中許多都是開放原始碼、由'
          '學會成員打造的。\n\n'
          '本應用程式正好歸屬於此——一台原生'
          '以十二為基計算的計算機，配有自家字形、精確分數，'
          '以及一個單位換算的部分。它是對一個悠久而'
          '充滿熱愛的小眾傳統的一點小小貢獻。',
    ),
    ProseSection(
      '為何世界仍然停留在十進位',
      '十二之所以無法普及，幾乎不是因為數學——'
          '數學是站在它這一邊的。而是因為習慣：'
          '十進位系統深植於語言、學校、法律與技術之中，'
          '一旦改制將極其浩繁。就連美國規模小得多的'
          '改用公制都因此而失敗。\n\n'
          '因此，今天大多數參與者更傾向把這件事視為'
          '一個引人入勝的思想實驗，而非一個認真的改制計畫。'
          '它顯示出，數字基底的選擇並非'
          '理所當然——並讓我們對每天'
          '打交道的那些數字看得更清楚。',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
];
