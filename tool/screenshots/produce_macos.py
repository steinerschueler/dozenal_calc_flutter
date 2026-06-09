#!/usr/bin/env python3
# macOS marketing screenshots, ALL locales: translated headline/bullets (CoreText)
# composited over the SAME three English window captures (app UI stays English).
import json, os, subprocess, sys
RENDER="/tmp/render_text"; BG="#1F1F1F"; CANVAS="2880x1800"; TMP="/tmp/_pm"
os.makedirs(TMP, exist_ok=True)
I=json.load(open("/tmp/i18n.json"))
def run(c):
    r=subprocess.run(c,capture_output=True,text=True)
    if r.returncode!=0: print("FAIL"," ".join(map(str,c))[:120], r.stderr[-300:]); sys.exit(1)
    return r.stdout.strip()
def render(out,size,color,width,align,weight,lsf,text):
    return int(run([RENDER,out,str(size),color,str(width),align,weight,str(lsf),text]).split("x")[1])

WIN={"intro":"/tmp/raw_macos/1.png","calc":"/tmp/raw_macos/2.png","conv":"/tmp/raw_macos/3.png"}
for loc,t in I.items():
    rtl = (loc=="ar")
    D=f"/tmp/framed/macos/{loc}"; os.makedirs(D, exist_ok=True)
    wgrav, tgrav, talign = ("west","east","right") if rtl else ("east","west","left")
    run(["magick", WIN["intro"], "-resize", "x1400", f"{TMP}/w.png"])
    # INTRO
    render(f"{TMP}/h.png",104,"FFFFFF",940,talign,"semibold",0.3,t["intro"])
    run(["magick","-size",CANVAS,f"xc:{BG}",
         f"{TMP}/w.png","-gravity",wgrav,"-geometry","+110+0","-composite",
         f"{TMP}/h.png","-gravity",tgrav,"-geometry","+140+0","-composite",f"{D}/1_intro.png"])
    # CALC: title + 13 bullets
    run(["magick", WIN["calc"], "-resize", "x1400", f"{TMP}/w.png"])
    render(f"{TMP}/t.png",62,"FFFFFF",960,talign,"semibold",0.3,t["calc"])
    bul="\n".join("•  "+b for b in t["bullets"])
    render(f"{TMP}/b.png",44,"ECECEC",960,("natural" if rtl else "left"),"regular",0.34,bul)
    run(["magick",f"{TMP}/t.png","-size","960x46","xc:none",f"{TMP}/b.png","-background","none","-gravity",("east" if rtl else "west"),"-append",f"{TMP}/block.png"])
    run(["magick","-size",CANVAS,f"xc:{BG}",
         f"{TMP}/w.png","-gravity",wgrav,"-geometry","+90+0","-composite",
         f"{TMP}/block.png","-gravity",tgrav,"-geometry","+140+0","-composite",f"{D}/2_calc.png"])
    # CONVERTER
    run(["magick", WIN["conv"], "-resize", "x1400", f"{TMP}/w.png"])
    render(f"{TMP}/h.png",104,"FFFFFF",940,talign,"semibold",0.3,t["conv"])
    run(["magick","-size",CANVAS,f"xc:{BG}",
         f"{TMP}/w.png","-gravity",wgrav,"-geometry","+110+0","-composite",
         f"{TMP}/h.png","-gravity",tgrav,"-geometry","+140+0","-composite",f"{D}/3_converter.png"])
    print(f"  {loc:8s} done")
print("macOS (all locales) → /tmp/framed/macos")
