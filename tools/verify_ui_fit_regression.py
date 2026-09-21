"""Exact-ROM checks for user screenshots 57/58/59: arrow bounds and save tail."""
import hashlib,json,struct
from pathlib import Path
from pet_menu_graphics import unpack
from arrow_small_font import render

ROOT=Path(__file__).resolve().parents[1]
RUN=ROOT/'analysis/arrow_save_v095/verified'
ROM=ROOT/'poc/output/exe2_rev1_kr_v0_9_5_ui_fit.gba'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    rom=ROM.read_bytes()
    checks=[]
    for ids,text,path in (((0x48,0x49),'메모','005_library/step_003_vram.bin'),
                          (tuple(range(0x50,0x56)),'라이브러리','011_library_switch/step_001_vram.bin')):
        vram=(RUN/path).read_bytes()
        width=len(ids)*8
        actual=[]
        for y in range(8):
            for t in ids:
                pixels=unpack(vram[t*32:(t+1)*32])
                assert vram[t*32:(t+1)*32]==rom[0x950000+(t-1)*32:0x950000+t*32]
                actual.extend(v==15 for v in pixels[y*8:y*8+8])
                assert 7 not in pixels, 'Original letter shadow survived'
        assert actual==render(text,width), 'Missing/clipped Korean arrow ink'
        assert not any(actual[6*width:]), 'Arrow text reaches bottom padding/border'
        checks.append({'text':text,'ink_height':6,'glyph_width':7,'bottom_inside_padding':1,
                       'all_authored_ink_visible':True,'native_shadow_removed':True})
    save=RUN/'010_save'
    state=json.loads((save/'save_label_65.json').read_text())
    assert state['r4']==8 and state['r1']==65 and state['r3']==0x06004200
    following=json.loads((save/'save_label_66.json').read_text())
    assert following['r9']==8, 'Label renderer consumed other than eight syllables'
    euc='리'.encode('euc_kr')
    ordinal=(euc[0]-0xB0)*94+euc[1]-0xA1
    glyph=rom[0x840000+ordinal*64:0x840000+(ordinal+1)*64]
    vram=(save/'step_008_vram.bin').read_bytes()
    assert vram[0x4200+7*64:0x4200+8*64]==glyph, 'Last 리 glyph absent from save VRAM'
    for name in ('library_arrow','library_return','save_label'):
        assert (RUN/(name+'_comparison.png')).exists()
    result={'status':'PASS_UI_FIT_REGRESSION','candidate_sha256':sha(ROM),'arrows':checks,
            'save_label':'데이터라이브러리','save_label_glyphs_consumed':8,'last_ri_glyph_vram_verified':True,
            'visual_review':'Enlarged nearest-neighbor before/after captures inspected; three reported clipping/bounds defects fixed.',
            'comparison_images':[{'path':str((RUN/(n+'_comparison.png')).relative_to(ROOT)),
                                  'sha256':sha(RUN/(n+'_comparison.png'))} for n in ('library_arrow','library_return','save_label')]}
    (ROOT/'analysis/exe2_rev1_ui_fit_regression_qa.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False))


if __name__=='__main__':main()
