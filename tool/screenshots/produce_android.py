#!/usr/bin/env python3
# Android-Play-Marketing-Screenshots: dunkler Verlaufs-Hintergrund + Glow,
# groesseres, leicht gekipptes Geraet mit Schatten, lokalisierte Caption (Pango).
# Pendant zu produce_ios.py, aber fuer Linux/ImageMagick-6 + Pango statt der
# macOS-Toolchain (frameit + render_text.swift).
#
# Quelle  : store/screenshots/raw/android/{intro-<loc>.png, calc-1over15.png, converter.png}
#           (Geraete-Captures, adb screencap; saubere Statusleiste via SystemUI-Demo-Modus)
# Texte   : tool/screenshots/i18n.json  (gleiche Single-source wie iOS, 11 Sprachen)
# Ausgabe : store/screenshots/play/<loc>/{1_intro,2_calc,3_converter}.png  (1080x2160)
#
# Voraussetzungen (Linux): ImageMagick-6 mit Pango-Delegate, Noto-Fonts
# (NotoSansCJK / NotoNaskhArabic / NotoSansDevanagari) fuer die Caption-Schriften.
# Wichtig: IM6-Pango verlangt NUMERISCHE XML-Entities (&#38; statt &amp;) und
# vertraegt keine literalen Newlines im Markup -> jede Zeile einzeln rendern.
#
# Aufruf (Repo-Wurzel):  python3 tool/screenshots/produce_android.py [loc ...]
import json, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
RAW  = os.path.join(ROOT, 'store/screenshots/raw/android')
OUT  = os.path.join(ROOT, 'store/screenshots/play')
TMP  = '/tmp/produce_android_work'
CANVAS_W, CANVAS_H = 1080, 2160
DEV_W, DEV_H = 720, 1560
os.makedirs(TMP, exist_ok=True)
i18n = json.load(open(os.path.join(HERE, 'i18n.json')))

def run(cmd):
    r = subprocess.run([str(c) for c in cmd], capture_output=True, text=True)
    if r.returncode != 0:
        print('FAIL', ' '.join(str(c) for c in cmd[:6]), r.stderr[-300:]); sys.exit(1)

def ident(path, fmt):
    return subprocess.run(['identify','-format',fmt,path],capture_output=True,text=True).stdout

def make_bg(out):
    base = f'{TMP}/_bgbase.png'; glow = f'{TMP}/_bgglow.png'
    run(['convert','-size',f'{CANVAS_W}x{CANVAS_H}','gradient:#2b3142-#131418', base])
    run(['convert','-size',f'{CANVAS_W}x{CANVAS_H}','radial-gradient:#36405c-#000000', glow])
    run(['convert', base, glow, '-compose','screen','-composite', out])

def text_png(out, text, ptsize, wrap_w, color='#FFFFFF', weight='bold', align='center', gap=16):
    al = {'center':'center','left':'left'}[align]
    parts = []
    for i, ln in enumerate(text.split('\n')):
        esc = ln.replace('&','&#38;').replace('<','&#60;').replace('>','&#62;')
        markup = f'<span font="Sans {weight} {ptsize}" foreground="{color}">{esc}</span>'
        p = f'{TMP}/_ln{i}.png'
        run(['convert','-background','none','-density','96',
             '-define',f'pango:align={al}','-size',f'{wrap_w}x','pango:'+markup, p])
        parts.append(p)
    if len(parts) == 1:
        run(['convert', parts[0], '-trim','+repage', out])
    else:
        spaced = []
        for i, p in enumerate(parts):
            sp = f'{TMP}/_sp{i}.png'
            run(['convert', p, '-background','none','-gravity','north','-splice',f'0x{gap}', sp])
            spaced.append(sp)
        grav = 'center' if align == 'center' else 'west'
        run(['convert'] + spaced + ['-background','none','-gravity',grav,'-append','-trim','+repage', out])
    return int(ident(out, '%h'))

def device(raw, out, rotate=0, scale_pct=100):
    mask=f'{TMP}/_m.png'; rounded=f'{TMP}/_r.png'; bez=f'{TMP}/_b.png'; fr=f'{TMP}/_f.png'
    run(['convert','-size',f'{DEV_W}x{DEV_H}','xc:none','-fill','white',
         '-draw',f'roundrectangle 0,0,{DEV_W-1},{DEV_H-1},48,48', mask])
    run(['convert', raw, mask, '-alpha','off','-compose','CopyOpacity','-composite', rounded])
    bw, bh = DEV_W+22, DEV_H+22
    run(['convert','-size',f'{bw}x{bh}','xc:none','-fill','#0b0b0d',
         '-draw',f'roundrectangle 0,0,{bw-1},{bh-1},56,56', bez])
    run(['convert', bez, rounded, '-gravity','center','-composite', fr])
    if scale_pct != 100:
        run(['convert', fr, '-resize', f'{scale_pct}%', fr])
    if rotate:
        run(['convert', fr, '-background','none','-rotate',str(rotate), fr])
    run(['convert', fr, '(', '+clone','-background','black','-shadow','55x22+0+16', ')',
         '+swap','-background','none','-layers','merge','+repage', out])

def compose(loc, t, kind):
    d = f'{OUT}/{loc}'; os.makedirs(d, exist_ok=True)
    bg = f'{TMP}/_bg.png'; make_bg(bg)
    dev = f'{TMP}/_dev.png'
    if kind == 'intro':
        device(f'{RAW}/intro-{loc}.png', dev, rotate=-4, scale_pct=92)
        head = f'{TMP}/_h.png'; text_png(head, t['intro'], 54, 1000)
        run(['convert', bg, dev,'-gravity','south','-geometry','+30+0','-composite',
             head,'-gravity','north','-geometry','+0+150','-composite', f'{d}/1_intro.png'])
    elif kind == 'conv':
        device(f'{RAW}/converter.png', dev, rotate=5, scale_pct=92)
        head = f'{TMP}/_h.png'; text_png(head, t['conv'], 54, 1000)
        run(['convert', bg, dev,'-gravity','south','-geometry','-30+0','-composite',
             head,'-gravity','north','-geometry','+0+150','-composite', f'{d}/3_converter.png'])
    elif kind == 'calc':
        device(f'{RAW}/calc-1over15.png', dev, rotate=0, scale_pct=66)
        title=f'{TMP}/_t.png'; th=text_png(title, t['calc'], 44, 1000)
        bullets='\n'.join('•  '+b for b in t['bullets'])
        bul=f'{TMP}/_bu.png'; bh=text_png(bul, bullets, 27, 1000, color='#E6E6E6', weight='normal', align='left', gap=12)
        ty=70; by=ty+th+40; dy=by+bh+50
        run(['convert', bg,
             title,'-gravity','north','-geometry',f'+0+{ty}','-composite',
             bul,'-gravity','north','-geometry',f'+0+{by}','-composite',
             dev,'-gravity','north','-geometry',f'+0+{dy}','-composite', f'{d}/2_calc.png'])

if __name__ == '__main__':
    locs = sys.argv[1:] or list(i18n.keys())
    for loc in locs:
        t = i18n[loc]
        compose(loc, t, 'intro'); compose(loc, t, 'calc'); compose(loc, t, 'conv')
        print(f'  {loc:8s} framed -> store/screenshots/play/{loc}/')
