#!/usr/bin/env python3
import json, os, subprocess, sys

HOME = os.path.expanduser("~")
FRAME = f"{HOME}/.fastlane/frameit/latest/Apple iPhone 17 Pro Max Silver.png"
BG = "#1F1F1F"
RENDER = "/tmp/render_text"
WORK = "/tmp/frame_work"
OUTROOT = "/tmp/framed/ios"
TMP = "/tmp/_prod"
os.makedirs(TMP, exist_ok=True)
i18n = json.load(open("/tmp/i18n.json"))

def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        print("FAIL:", " ".join(cmd[:6]), r.stderr[-300:]); sys.exit(1)
    return r.stdout.strip()

def render(out, size, color, width, align, weight, lsf, text):
    wh = run([RENDER, out, str(size), color, str(width), align, weight, str(lsf), text])
    return int(wh.split("x")[1])   # rendered height in px

def build_fd(shot, out):
    run(["magick", "-size", "1470x3000", "xc:none", shot, "-geometry", "+75+66",
         "-composite", FRAME, "-composite", out])

def main():
    for loc, t in i18n.items():
        d = f"{OUTROOT}/{loc}"; os.makedirs(d, exist_ok=True)
        fd = f"{TMP}/fd_{loc}.png"

        # ---- 1) INTRO: device shifted left, headline top ----
        build_fd(f"{WORK}/{loc}/1_intro.png", fd)
        run(["magick", fd, "-resize", "72%", f"{TMP}/d.png"])
        render(f"{TMP}/h.png", 92, "FFFFFF", 1180, "center", "semibold", 0.3, t["intro"])
        run(["magick", "-size", "1320x2868", f"xc:{BG}",
             f"{TMP}/d.png", "-gravity", "south", "-geometry", "-280+40", "-composite",
             f"{TMP}/h.png", "-gravity", "north", "-geometry", "+0+150", "-composite",
             f"{d}/1_intro.png"])

        # ---- 2) CALC: title + 13 bullets top, large device below (adaptive Y, bleeds bottom) ----
        build_fd(f"{WORK}/calc_1_15.png", fd)
        run(["magick", fd, "-resize", "74%", f"{TMP}/d.png"])
        title_y = 90
        th = render(f"{TMP}/title.png", 80, "FFFFFF", 1240, "center", "semibold", 0.3, t["calc"])
        bullets_y = title_y + th + 55
        bullets = "\n".join("•  " + b for b in t["bullets"])
        bh = render(f"{TMP}/bul.png", 56, "ECECEC", 1180, "natural", "regular", 0.38, bullets)
        phone_y = bullets_y + bh + 70           # device sits just below the measured text block
        run(["magick", "-size", "1320x2868", f"xc:{BG}",
             f"{TMP}/title.png", "-gravity", "north", "-geometry", f"+0+{title_y}", "-composite",
             f"{TMP}/bul.png", "-gravity", "north", "-geometry", f"+0+{bullets_y}", "-composite",
             f"{TMP}/d.png", "-gravity", "north", "-geometry", f"+0+{phone_y}", "-composite",
             f"{d}/2_calc.png"])

        # ---- 3) CONVERTER: device slightly tilted, headline top ----
        build_fd(f"{WORK}/{loc}/3_converter.png", fd)
        run(["magick", fd, "-resize", "68%", "-background", "none", "-rotate", "-7", f"{TMP}/d.png"])
        render(f"{TMP}/h.png", 92, "FFFFFF", 1180, "center", "semibold", 0.3, t["conv"])
        run(["magick", "-size", "1320x2868", f"xc:{BG}",
             f"{TMP}/d.png", "-gravity", "south", "-geometry", "+0+40", "-composite",
             f"{TMP}/h.png", "-gravity", "north", "-geometry", "+0+150", "-composite",
             f"{d}/3_converter.png"])

        print(f"  {loc:8s} done")
    print("all locales framed →", OUTROOT)

main()
