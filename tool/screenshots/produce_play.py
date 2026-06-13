#!/usr/bin/env python3
# Android-Play-Listing-Screenshots (Build 18+ neues Set), Linux/ImageMagick+Pango.
# Loest produce_android.py (intro/calc/converter-Set) ab. Drei gerahmte Shots
# je Sprache auf wechselndem Farb-Hintergrund:
#   1_swipe  — Hauptrechner + Umrechner nebeneinander, Hand-Emoji + ←/→-Pfeile
#              (das Wischen zwischen den beiden Rechnern)
#   2_units  — Umrechner mit Compound "3 mi 80 yd 9 ft 11 in"
#   3_theory — Theorie-Kapitel "Zwoelf und die Welt", Kap. 5 + Meta-Untertitel
#
# Quelle  : store/screenshots/raw/android/{calc.png, converter-<loc>.png,
#           theory-<loc>.png}  (Geraete-Captures, adb; gewoehnliche Ziffern,
#           SystemUI-Demo-Statusleiste). calc.png ist sprachneutral (geteilt).
# Captions: inline unten, pro Sprache von Muttersprachler-Review bestaetigt.
# Ausgabe : store/screenshots/play/<loc>/{1_swipe,2_units,3_theory}.png (1080x2160)
#
# Voraussetzungen: ImageMagick-6 mit Pango-Delegate, Noto-Fonts inkl.
# NotoColorEmoji (Hand 👆). Captures werden 6 px beschnitten (CCleaner-
# Accessibility-Randlinie auf dem Testgeraet).
#
# Aufruf (Repo-Wurzel):  python3 tool/screenshots/produce_play.py [loc ...]
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
RAW = os.path.join(ROOT, 'store/screenshots/raw/android')
OUT = os.path.join(ROOT, 'store/screenshots/play')
TMP = '/tmp/produce_play_work'
CW, CH = 1080, 2160
DEV_W, DEV_H = 720, 1560
os.makedirs(TMP, exist_ok=True)

# Captions: DE = Quelle (von Eric freigegeben), die uebrigen von
# Muttersprachler-Review-Agenten bestaetigt/korrigiert.
CAPT = {
    'de': {'s1': 'Zwei Rechner — einfach wischen', 's2': 'Zusammengesetzte Einheiten',
           's3': 'Die Zwölf und die Welt',
           's3sub': '34 Theorie-Kapitel · 2 Bedienungsanleitungen · 14 Sprachen'},
    'en': {'s1': 'Two calculators — just swipe', 's2': 'Compound units',
           's3': 'Twelve and the World',
           's3sub': '34 theory chapters · 2 manuals · 14 languages'},
    'fr': {'s1': 'Deux calculatrices — il suffit de glisser', 's2': 'Unités composées',
           's3': 'Le douze et le monde',
           's3sub': '34 chapitres de théorie · 2 manuels · 14 langues'},
    'es': {'s1': 'Dos calculadoras — solo desliza', 's2': 'Unidades compuestas',
           's3': 'El doce y el mundo',
           's3sub': '34 capítulos de teoría · 2 manuales · 14 idiomas'},
    'it': {'s1': 'Due calcolatrici — basta scorrere', 's2': 'Unità composte',
           's3': 'Il dodici e il mondo',
           's3sub': '34 capitoli di teoria · 2 manuali · 14 lingue'},
    'ru': {'s1': 'Два калькулятора — просто смахните', 's2': 'Составные единицы',
           's3': 'Двенадцать и мир',
           's3sub': '34 главы теории · 2 руководства · 14 языков'},
    'hi': {'s1': 'दो कैलकुलेटर — बस स्वाइप करें', 's2': 'मिश्रित इकाइयाँ',
           's3': 'बारह और संसार',
           's3sub': '34 सिद्धांत अध्याय · 2 मैनुअल · 14 भाषाएँ'},
    'ja': {'s1': '2つの電卓 — スワイプで切替', 's2': '複合単位',
           's3': '十二と世界',
           's3sub': '理論34章 · 取扱説明書2点 · 14言語'},
    'zh-Hans': {'s1': '两个计算器 — 滑动切换', 's2': '复合单位',
                's3': '十二与世界',
                's3sub': '34 章理论 · 2 部手册 · 14 种语言'},
    'zh-Hant': {'s1': '兩個計算機 — 滑動切換', 's2': '複合單位',
                's3': '十二與世界',
                's3sub': '34 章理論 · 2 部手冊 · 14 種語言'},
    'ar': {'s1': 'حاسبتان — مرِّر فقط', 's2': 'وحدات مركّبة',
           's3': 'الاثنا عشر والعالم',
           's3sub': '34 فصلاً نظرياً · دليلان · 14 لغة'},
}
# per-shot background (the "changing colour"): blue / violet / gold
BG = {
    's1': ('#1c2c52', '#0a0e16', '#33548c'),
    's2': ('#2c1d46', '#100a1a', '#5a3a8e'),
    's3': ('#3a3015', '#15110a', '#7d5f1f'),
}

def run(cmd):
    r = subprocess.run([str(c) for c in cmd], capture_output=True, text=True)
    if r.returncode != 0:
        print('FAIL', ' '.join(str(c) for c in cmd[:8]), '\n', r.stderr[-500:]); sys.exit(1)

def ident(p, f):
    return subprocess.run(['identify', '-format', f, p], capture_output=True, text=True).stdout.strip()

def make_bg(out, c1, c2, glow):
    b = f'{TMP}/_bb.png'; g = f'{TMP}/_bg2.png'
    run(['convert', '-size', f'{CW}x{CH}', f'gradient:{c1}-{c2}', b])
    run(['convert', '-size', f'{CW}x{CH}', f'radial-gradient:{glow}-#0a0a0a', g])
    run(['convert', b, g, '-compose', 'screen', '-composite', out])

def text_png(out, text, pt, wrap, color='#FFFFFF', weight='bold', gap=14):
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

def device(raw, out, rotate=0, scale=100, shave=6):
    s = f'{TMP}/_d_sh.png'; run(['convert', raw, '-shave', f'{shave}x{shave}', '+repage', s])
    w = DEV_W - 2 * shave; h = DEV_H - 2 * shave
    mask = f'{TMP}/_d_m.png'; rd = f'{TMP}/_d_r.png'; bz = f'{TMP}/_d_b.png'; fr = f'{TMP}/_d_f.png'
    run(['convert', '-size', f'{w}x{h}', 'xc:none', '-fill', 'white',
         '-draw', f'roundrectangle 0,0,{w-1},{h-1},40,40', mask])
    run(['convert', s, mask, '-alpha', 'off', '-compose', 'CopyOpacity', '-composite', rd])
    bw, bh = w + 20, h + 20
    run(['convert', '-size', f'{bw}x{bh}', 'xc:none', '-fill', '#0b0b0d',
         '-draw', f'roundrectangle 0,0,{bw-1},{bh-1},50,50', bz])
    run(['convert', bz, rd, '-gravity', 'center', '-composite', fr])
    if scale != 100:
        run(['convert', fr, '-resize', f'{scale}%', fr])
    if rotate:
        run(['convert', fr, '-background', 'none', '-rotate', str(rotate), fr])
    run(['convert', fr, '(', '+clone', '-background', 'black', '-shadow', '60x18+0+12', ')',
         '+swap', '-background', 'none', '-layers', 'merge', '+repage', out])

def swipe_graphic(out):
    hand = f'{TMP}/_hand.png'; ar = f'{TMP}/_ar.png'; al = f'{TMP}/_al.png'; spx = f'{TMP}/_spx.png'
    run(['convert', '-background', 'none', '-density', '160',
         'pango:<span font="Noto Color Emoji 48">\U0001F446</span>', '-trim', '+repage',
         '-resize', 'x170', hand])
    run(['convert', '-size', '150x120', 'xc:none', '-fill', '#FFFFFF',
         '-draw', 'polygon 0,46 78,46 78,14 148,60 78,106 78,74 0,74', ar])
    run(['convert', ar, '-flop', al])
    run(['convert', '-size', '34x10', 'xc:none', spx])
    run(['convert', al, spx, hand, spx, ar, '-background', 'none', '-gravity', 'center', '+append', '+repage', out])
    run(['convert', out, '(', '+clone', '-background', 'black', '-shadow', '90x8+0+5', ')',
         '+swap', '-background', 'none', '-layers', 'merge', '+repage', out])

def shot_swipe(loc):
    d = f'{OUT}/{loc}'; os.makedirs(d, exist_ok=True)
    bg = f'{TMP}/_bg1.png'; make_bg(bg, *BG['s1'])
    calc = f'{TMP}/_pcalc.png'; conv = f'{TMP}/_pconv.png'
    device(f'{RAW}/calc.png', calc, rotate=-6, scale=58)
    device(f'{RAW}/converter-{loc}.png', conv, rotate=6, scale=58)
    head = f'{TMP}/_h1.png'; text_png(head, CAPT[loc]['s1'], 52, 1000)
    sw = f'{TMP}/_sw.png'; swipe_graphic(sw)
    run(['convert', bg,
         calc, '-gravity', 'west', '-geometry', '+12+90', '-composite',
         conv, '-gravity', 'east', '-geometry', '+12+90', '-composite',
         sw, '-gravity', 'center', '-geometry', '+0+90', '-composite',
         head, '-gravity', 'north', '-geometry', '+0+150', '-composite',
         f'{d}/1_swipe.png'])

def shot_single(loc, key, rawname, outname, rot, sub=None):
    d = f'{OUT}/{loc}'; os.makedirs(d, exist_ok=True)
    bg = f'{TMP}/_bgs.png'; make_bg(bg, *BG[key])
    dev = f'{TMP}/_pdev.png'; device(f'{RAW}/{rawname}', dev, rotate=rot, scale=93)
    head = f'{TMP}/_hs.png'; hh = text_png(head, CAPT[loc][key], 52, 1000)
    cmd = ['convert', bg,
           dev, '-gravity', 'south', '-geometry', '+0+44', '-composite',
           head, '-gravity', 'north', '-geometry', '+0+150', '-composite']
    if sub and CAPT[loc].get(sub):
        si = f'{TMP}/_hsub.png'
        text_png(si, CAPT[loc][sub], 36, 1000, color='#E8D9A8', weight='normal')
        cmd += [si, '-gravity', 'north', '-geometry', f'+0+{150 + hh + 64}', '-composite']
    cmd += [f'{d}/{outname}']
    run(cmd)

if __name__ == '__main__':
    locs = sys.argv[1:] or list(CAPT.keys())
    for loc in locs:
        shot_swipe(loc)
        shot_single(loc, 's2', f'converter-{loc}.png', '2_units.png', 4)
        shot_single(loc, 's3', f'theory-{loc}.png', '3_theory.png', -4, sub='s3sub')
        print(f'  {loc} -> store/screenshots/play/{loc}/')
