"""Enlarge exact emulator captures for pixel-level review (no smoothing)."""
from pathlib import Path
from PIL import Image,ImageDraw

ROOT=Path(__file__).resolve().parents[1]
BEFORE=ROOT/'analysis/submenu_v094_verified'
AFTER=ROOT/'analysis/arrow_save_v095/verified'


def main():
    scenes=(('library_arrow','005_library/step_003.png',(190,0,240,16),8),
            ('library_return','011_library_switch/step_001.png',(0,0,64,16),8),
            ('save_label','010_save/step_008.png',(24,24,216,88),4))
    for name,relative,box,scale in scenes:
        panels=[]
        for root in (BEFORE,AFTER):
            with Image.open(root/relative) as img:
                panels.append(img.crop(box).convert('RGB').resize(((box[2]-box[0])*scale,(box[3]-box[1])*scale),Image.Resampling.NEAREST))
        w,h=panels[0].size
        out=Image.new('RGB',(w*2+12,h+22),'#202020')
        d=ImageDraw.Draw(out)
        for i,(label,panel) in enumerate(zip(('V0.9.4 BEFORE','V0.9.5 AFTER'),panels)):
            d.text((i*(w+12)+4,3),label,fill='white')
            out.paste(panel,(i*(w+12),22))
        out.save(AFTER/(name+'_comparison.png'))


if __name__=='__main__':main()
