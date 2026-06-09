#!/usr/bin/env python3
import json, os, subprocess, sys
HOME = os.path.expanduser("~")
FRAME = f"{HOME}/.fastlane/frameit/latest/Apple iPad Pro (12.9-inch) (4th generation) Silver.png"
BG = "#1F1F1F"; RENDER = "/tmp/render_text"
WORK = "/tmp/fw_ipad"; OUTROOT = "/tmp/framed/ipad"; TMP = "/tmp/_pi"
os.makedirs(TMP, exist_ok=True)
i18n = json.load(open("/tmp/i18n.json"))
CANVAS = "2048x2732"

def run(c):
    r = subprocess.run(c, capture_output=True, text=True)
    if r.returncode != 0: print("FAIL", " ".join(map(str,c))[:120], r.stderr[-300:]); sys.exit(1)
    return r.stdout.strip()

def render(out, size, color, width, align, weight, lsf, text):
    return int(run([RENDER, out, str(size), color, str(width), align, weight, str(lsf), text]).split("x")[1])

def build_fd(shot, out):
    run(["magick", shot, "-resize", "2048x2732!", f"{TMP}/sh.png"])
    run(["magick", "-size", "2245x2930", "xc:none", f"{TMP}/sh.png", "-geometry", "+96+102",
         "-composite", FRAME, "-composite", out])

def main():
    for loc, t in i18n.items():
        rtl = (loc == "ar")
        d = f"{OUTROOT}/{loc}"; os.makedirs(d, exist_ok=True)
        fd = f"{TMP}/fd.png"

        # INTRO: headline top, device centered, bottom-anchored
        build_fd(f"{WORK}/{loc}/1_intro.png", fd)
        run(["magick", fd, "-resize", "73%", f"{TMP}/d.png"])
        render(f"{TMP}/h.png", 100, "FFFFFF", 1760, "center", "semibold", 0.3, t["intro"])
        run(["magick", "-size", CANVAS, f"xc:{BG}",
             f"{TMP}/d.png", "-gravity", "south", "-geometry", "+0+0", "-composite",
             f"{TMP}/h.png", "-gravity", "north", "-geometry", "+0+150", "-composite", f"{d}/1_intro.png"])

        # CALC: title top, 2-column bullets, large device below (bottom-anchored)
        build_fd(f"{WORK}/calc_1_15.png", fd)
        run(["magick", fd, "-resize", "60%", f"{TMP}/d.png"])
        render(f"{TMP}/title.png", 92, "FFFFFF", 1820, "center", "semibold", 0.3, t["calc"])
        b = t["bullets"]
        colA = "\n".join("•  "+x for x in b[:7]); colB = "\n".join("•  "+x for x in b[7:])
        ha = render(f"{TMP}/cA.png", 52, "ECECEC", 940, "natural", "regular", 0.35, colA)
        hb = render(f"{TMP}/cB.png", 52, "ECECEC", 940, "natural", "regular", 0.35, colB)
        by = 110 + 110 + 70
        xa, xb = ("+512", "-512") if rtl else ("-512", "+512")  # first column on right for RTL
        run(["magick", "-size", CANVAS, f"xc:{BG}",
             f"{TMP}/title.png", "-gravity", "north", "-geometry", "+0+110", "-composite",
             f"{TMP}/cA.png", "-gravity", "north", "-geometry", f"{xa}+{by}", "-composite",
             f"{TMP}/cB.png", "-gravity", "north", "-geometry", f"{xb}+{by}", "-composite",
             f"{TMP}/d.png", "-gravity", "south", "-geometry", "+0+0", "-composite", f"{d}/2_calc.png"])

        # CONVERTER: device tilted, headline top
        build_fd(f"{WORK}/converter.png", fd)
        run(["magick", fd, "-resize", "68%", "-background", "none", "-rotate", "-7", f"{TMP}/d.png"])
        render(f"{TMP}/h.png", 100, "FFFFFF", 1760, "center", "semibold", 0.3, t["conv"])
        run(["magick", "-size", CANVAS, f"xc:{BG}",
             f"{TMP}/d.png", "-gravity", "south", "-geometry", "+0+20", "-composite",
             f"{TMP}/h.png", "-gravity", "north", "-geometry", "+0+150", "-composite", f"{d}/3_converter.png"])
        print(f"  {loc:8s} done")
    print("iPad framed →", OUTROOT)
main()
