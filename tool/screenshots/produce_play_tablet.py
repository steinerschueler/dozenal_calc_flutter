#!/usr/bin/env python3
# Android-Play-TABLET-Listing-Screenshots (Build 18+), Linux/ImageMagick+Pango.
# Schwester von produce_play.py (Telefon). Vier gerahmte Shots je Sprache, auf
# wechselndem Farb-Hintergrund — genau EIN Querformat-Shot (damit Nutzer wissen,
# dass es das Breit-Layout gibt), der Rest hoch:
#   1_calc_full  (QUER) — Hauptrechner 1÷7, Breit-Keypad (alle Tasten inline)
#                         → "Voller Funktionsumfang"
#   2_calc_exact (HOCH) — Hauptrechner 1÷13, Periode-Überstrich + {Dozenal}
#                         → "Exakte Brüche, keine Rundung"
#   3_units      (HOCH) — Umrechner "3 mi 80 yd 9 ft 11 in" + {cm}
#                         → "Zusammengesetzte Einheiten"
#   4_theory     (HOCH) — Theorie "Zwölf und die Welt", Kap. 5 + Meta-Untertitel
#                         → "Die Zwölf und die Welt"
#
# Quelle  : store/screenshots/raw/android-tablet/
#             calc_ls.png (2000x1200, sprachneutral),
#             calc_pt.png (1200x2000, sprachneutral),
#             converter-<loc>.png (1200x2000), theory-<loc>.png (1200x2000)
#           Geräte-Captures (Lenovo Tab, adb; gewöhnliche Ziffern, dezimal,
#           SystemUI-Demo-Statusleiste). 6 px Beschnitt = CCleaner-Randlinie.
# Captions: DE = Quelle; übrige Sprachen nach Muttersprachler-Review (s2/s3/s3sub
#           identisch zum Telefon-Set, full/exact neu).
# Ausgabe : store/screenshots/play-tablet/<loc>/
#             {1_calc_full,2_calc_exact,3_units,4_theory}.png
#
# Voraussetzungen: ImageMagick-6 mit Pango-Delegate, Noto-Fonts.
# Aufruf (Repo-Wurzel):  python3 tool/screenshots/produce_play_tablet.py [loc ...]
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
RAW = os.path.join(ROOT, 'store/screenshots/raw/android-tablet')
OUT = os.path.join(ROOT, 'store/screenshots/play-tablet')
TMP = '/tmp/produce_play_tablet_work'
os.makedirs(TMP, exist_ok=True)

PT_W, PT_H = 1600, 2560   # Hochformat-Canvas
LS_W, LS_H = 2560, 1600   # Querformat-Canvas

# Captions: full/exact sind neu (Tablet); s2/s3/s3sub verbatim aus produce_play.py
# (dort schon muttersprachlich gegengelesen).
CAPT = {
    'de': {'full': 'Voller Funktionsumfang', 'exact': 'Exakte Brüche, keine Rundung',
           's2': 'Zusammengesetzte Einheiten', 's3': 'Die Zwölf und die Welt',
           's3sub': '34 Theorie-Kapitel · 2 Bedienungsanleitungen · 14 Sprachen'},
    'en': {'full': 'The full feature set', 'exact': 'Exact fractions, no rounding',
           's2': 'Compound units', 's3': 'Twelve and the World',
           's3sub': '34 theory chapters · 2 manuals · 14 languages'},
    'fr': {'full': 'Toutes les fonctions', 'exact': 'Fractions exactes, sans arrondi',
           's2': 'Unités composées', 's3': 'Le douze et le monde',
           's3sub': '34 chapitres de théorie · 2 manuels · 14 langues'},
    'es': {'full': 'Todas las funciones', 'exact': 'Fracciones exactas, sin redondeo',
           's2': 'Unidades compuestas', 's3': 'El doce y el mundo',
           's3sub': '34 capítulos de teoría · 2 manuales · 14 idiomas'},
    'it': {'full': 'Tutte le funzioni', 'exact': 'Frazioni esatte, senza arrotondamenti',
           's2': 'Unità composte', 's3': 'Il dodici e il mondo',
           's3sub': '34 capitoli di teoria · 2 manuali · 14 lingue'},
    'ru': {'full': 'Полный набор функций', 'exact': 'Точные дроби, без округления',
           's2': 'Составные единицы', 's3': 'Двенадцать и мир',
           's3sub': '34 главы теории · 2 руководства · 14 языков'},
    'hi': {'full': 'पूरा फ़ंक्शन सेट', 'exact': 'सटीक भिन्न, कोई पूर्णांकन नहीं',
           's2': 'मिश्रित इकाइयाँ', 's3': 'बारह और संसार',
           's3sub': '34 सिद्धांत अध्याय · 2 मैनुअल · 14 भाषाएँ'},
    'ja': {'full': '全機能をひと目で', 'exact': '正確な分数、丸めなし',
           's2': '複合単位', 's3': '十二と世界',
           's3sub': '理論34章 · 取扱説明書2点 · 14言語'},
    'zh-Hans': {'full': '全部功能一览', 'exact': '精确分数，绝不舍入',
                's2': '复合单位', 's3': '十二与世界',
                's3sub': '34 章理论 · 2 部手册 · 14 种语言'},
    'zh-Hant': {'full': '全部功能一覽', 'exact': '精確分數，絕不捨入',
                's2': '複合單位', 's3': '十二與世界',
                's3sub': '34 章理論 · 2 部手冊 · 14 種語言'},
    'ar': {'full': 'جميع الوظائف', 'exact': 'كسور دقيقة، بلا تقريب',
           's2': 'وحدات مركّبة', 's3': 'الاثنا عشر والعالم',
           's3sub': '34 فصلاً نظرياً · دليلان · 14 لغة'},
}
# per-shot background ("wechselnde Farbe"): blau / teal / violett / gold
BG = {
    'full':  ('#1c2c52', '#0a0e16', '#33548c'),
    'exact': ('#13302b', '#0a1512', '#1f6e57'),
    's2':    ('#2c1d46', '#100a1a', '#5a3a8e'),
    's3':    ('#3a3015', '#15110a', '#7d5f1f'),
}

def run(cmd):
    r = subprocess.run([str(c) for c in cmd], capture_output=True, text=True)
    if r.returncode != 0:
        print('FAIL', ' '.join(str(c) for c in cmd[:8]), '\n', r.stderr[-500:]); sys.exit(1)

def ident(p, f):
    return subprocess.run(['identify', '-format', f, p], capture_output=True, text=True).stdout.strip()

def make_bg(out, w, h, c1, c2, glow):
    b = f'{TMP}/_bb.png'; g = f'{TMP}/_bg2.png'
    run(['convert', '-size', f'{w}x{h}', f'gradient:{c1}-{c2}', b])
    run(['convert', '-size', f'{w}x{h}', f'radial-gradient:{glow}-#0a0a0a', g])
    run(['convert', b, g, '-compose', 'screen', '-composite', out])

def text_png(out, text, pt, wrap, color='#FFFFFF', weight='bold', gap=18):
    parts = []
    for i, ln in enumerate(text.split('\n')):
        esc = ln.replace('&', '&#38;').replace('<', '&#60;').replace('>', '&#62;')
        m = f'<span font="Sans {weight} {pt}" foreground="{color}">{esc}</span>'
        p = f'{TMP}/_t{i}.png'
        run(['convert', '-background', 'none', '-density', '96',
             '-define', 'pango:align=center', '-size', f'{wrap}x', 'pango:' + m, p])
        parts.append(p)
    if len(parts) == 1:
        run(['convert', parts[0], '-trim', '+repage', out])
    else:
        sp = []
        for i, p in enumerate(parts):
            s = f'{TMP}/_ts{i}.png'
            run(['convert', p, '-background', 'none', '-gravity', 'north', '-splice', f'0x{gap}', s]); sp.append(s)
        run(['convert'] + sp + ['-background', 'none', '-gravity', 'center', '-append', '-trim', '+repage', out])
    return int(ident(out, '%h'))

def device(raw, out, dev_w, dev_h, scale=100, shave=6, radius=22, bezel=12):
    s = f'{TMP}/_d_sh.png'; run(['convert', raw, '-shave', f'{shave}x{shave}', '+repage', s])
    w = dev_w - 2 * shave; h = dev_h - 2 * shave
    mask = f'{TMP}/_d_m.png'; rd = f'{TMP}/_d_r.png'; bz = f'{TMP}/_d_b.png'; fr = f'{TMP}/_d_f.png'
    run(['convert', '-size', f'{w}x{h}', 'xc:none', '-fill', 'white',
         '-draw', f'roundrectangle 0,0,{w-1},{h-1},{radius},{radius}', mask])
    run(['convert', s, mask, '-alpha', 'off', '-compose', 'CopyOpacity', '-composite', rd])
    bw, bh = w + 2 * bezel, h + 2 * bezel
    run(['convert', '-size', f'{bw}x{bh}', 'xc:none', '-fill', '#0b0b0d',
         '-draw', f'roundrectangle 0,0,{bw-1},{bh-1},{radius+10},{radius+10}', bz])
    run(['convert', bz, rd, '-gravity', 'center', '-composite', fr])
    if scale != 100:
        run(['convert', fr, '-resize', f'{scale}%', fr])
    run(['convert', fr, '(', '+clone', '-background', 'black', '-shadow', '70x24+0+16', ')',
         '+swap', '-background', 'none', '-layers', 'merge', '+repage', out])

def shot(loc, key, rawname, outname, orient, sub=None):
    d = f'{OUT}/{loc}'; os.makedirs(d, exist_ok=True)
    if orient == 'ls':
        CW, CH, dw, dh, dev_y, cap_y = LS_W, LS_H, 2000, 1200, 64, 110
    else:
        CW, CH, dw, dh, dev_y, cap_y = PT_W, PT_H, 1200, 2000, 80, 170
    bg = f'{TMP}/_bg.png'; make_bg(bg, CW, CH, *BG[key])
    dev = f'{TMP}/_dev.png'; device(f'{RAW}/{rawname}', dev, dw, dh, scale=100)
    head = f'{TMP}/_head.png'; hh = text_png(head, CAPT[loc][key], 66, CW - 220)
    cmd = ['convert', bg,
           dev, '-gravity', 'south', '-geometry', f'+0+{dev_y}', '-composite',
           head, '-gravity', 'north', '-geometry', f'+0+{cap_y}', '-composite']
    if sub and CAPT[loc].get(sub):
        si = f'{TMP}/_sub.png'
        text_png(si, CAPT[loc][sub], 44, CW - 220, color='#E8D9A8', weight='normal')
        cmd += [si, '-gravity', 'north', '-geometry', f'+0+{cap_y + hh + 70}', '-composite']
    cmd += [f'{d}/{outname}']
    run(cmd)

if __name__ == '__main__':
    locs = sys.argv[1:] or list(CAPT.keys())
    for loc in locs:
        shot(loc, 'full',  'calc_ls.png',           '1_calc_full.png',  'ls')
        shot(loc, 'exact', 'calc_pt.png',           '2_calc_exact.png', 'pt')
        shot(loc, 's2',    f'converter-{loc}.png',  '3_units.png',      'pt')
        shot(loc, 's3',    f'theory-{loc}.png',     '4_theory.png',     'pt', sub='s3sub')
        print(f'  {loc} -> store/screenshots/play-tablet/{loc}/')
