"""Bind the manually inspected menu screenshots to exact runtime artifacts."""
import hashlib
import json
import struct
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
RUN=ROOT/'analysis/submenu_v094_verified'
ROM=ROOT/'poc/output/exe2_rev1_kr_v0_9_4_menu_textfix.gba'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    rom=ROM.read_bytes()
    rom_sha=sha(ROM)
    bank_length=struct.unpack_from('<I',rom,0x25F78)[0]*4
    bank=rom[0x950000:0x950000+bank_length]
    evidence=[]
    def bind(path):
        evidence.append({'path':path.relative_to(ROOT).as_posix(),'sha256':sha(path)})
    segments=[]
    for d in sorted(RUN.iterdir()):
        if not d.is_dir():continue
        p=d/'result.json'
        r=json.loads(p.read_text(encoding='utf-8'))
        assert r['rom_sha256']==rom_sha and r['completed'] and not r['audio_enabled']
        assert json.loads((d/'menu_trace.json').read_text())['invalid_stream'] is None
        for name,h in r['artifacts'].items():
            assert sha(d/name)==h, (d,name)
        bind(p)
        segments.append(d.name)
    assert len(segments)==15
    # Each primary submenu must receive the complete final ROM bank, including
    # the new last tile, without any subsequent independent upload overlapping.
    for index,name in enumerate(('folder','subchip','library','rockman','email','keyitems','communication','save')):
        d=RUN/f'{index+3:03d}_{name}'
        vram=sorted(d.glob('step_*_vram.bin'))[-1]
        assert vram.read_bytes()[0x20:0x20+bank_length]==bank
        trace=json.loads((d/'pet_asset_trace.json').read_text())
        assert any(x['source']==0x08950000 and x['destination']==0x06000020 and x['word_count']*4==bank_length for x in trace['loads'])
        for x in trace['loads']:
            if x['source'] != 0x08950000:
                assert not (x['destination'] < 0x06000020+bank_length and x['destination']+x['word_count']*4 > 0x06000020)
        bind(vram);bind(d/'pet_asset_trace.json')
    # Explicit human/model visual review is recorded separately from automated
    # completion. These are the actual inspected final-candidate screenshots.
    reviewed={
        '003_folder/step_001.png':'Korean folder heading and names; list remains operable.',
        '004_subchip/step_002.png':'Korean subchip heading and empty-inventory message.',
        '005_library/step_003.png':'Korean library title, PA arrow, names; Cannon description only Korean and within three rows.',
        '006_rockman/step_004.png':'Korean status message; original English labels retained.',
        '007_email/step_005.png':'Korean email heading and empty-inbox message.',
        '008_keyitems/step_006.png':'Korean key-item heading and PET description.',
        '009_communication/step_007.png':'Korean fixed labels fully visible above numeric background strips; units and modes legible.',
        '010_save/step_008.png':'Korean save title and fields, preserved time separator and numeric counts.',
        '011_library_switch/step_001.png':'PA memo title and return arrow localized; original English PA notation retained.',
        '011_library_switch/step_005.png':'Shotgun description has only Korean, contained in three rows.',
        '012_folder_edit/step_002.png':'Korean folder-edit heading, unit and backpack arrow; Korean chip description.',
        '013_save_confirm/step_002.png':'Game reports successful save.',
        '014_after_save_boot/step_006.png':'Fresh emulator process continued from normal battery save and reopened PET menu.',
        '015_backpack/step_003.png':'Korean backpack header and folder return arrow.',
    }
    for relative in reviewed:bind(RUN/relative)
    battery=Path('C:/Users/blari/AppData/Local/emucap/mesen2/47801/portable/Saves')/(ROM.stem+'.sav')
    assert battery.exists() and battery.stat().st_size==32768
    # Preserve only this test run's new normal save, never a user's original save.
    import shutil
    copy=RUN/'battery_verified.sav'
    if copy.exists():assert sha(copy)==sha(battery)
    else:shutil.copy2(battery,copy)
    bind(copy)
    result={'status':'PASS_SCOPED_MENU_REGRESSION','candidate_sha256':rom_sha,
            'emulator':'Mesen 2','audio_enabled':False,'segments':segments,
            'visual_review':reviewed,'evidence':evidence,
            'checks':{'complete_bank_resident_in_eight_submenus':True,
                      'independent_vram_uploads_do_not_overlap_bank':True,
                      'normal_game_save_and_fresh_process_reload':True},
            'seed_policy':'Initial menu routes use an explicitly recorded cross-ROM diagnostic seed; this is not fresh progression evidence. A new normal save was then written and cold-loaded.',
            'limitations':['Android My Boy! device not directly tested.','Not full-game QA or final release.','Rockman English labels retained.','Existing untranslated populations remain outside this fix.']}
    out=ROOT/'analysis/exe2_rev1_menu_textfix_runtime_review.json'
    out.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'status':result['status'],'candidate_sha256':rom_sha,'segments':len(segments),'reviewed_screenshots':len(reviewed)}))


if __name__=='__main__':main()
