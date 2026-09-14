"""Muted menu regression routes; seed provenance is explicitly diagnostic."""
import subprocess
import sys
import argparse
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ROM = ROOT/'poc/output/exe2_rev1_kr_v0_9_4_submenu_final.gba'
OUT = ROOT/'analysis/submenu_v094_final'
MESEN = 'C:/Users/blari/AppData/Local/emucap/mesen2/47801/portable/Mesen.exe'


def segment(name, actions, load=None, seed=False):
    args=[sys.executable,'-X','utf8',str(ROOT/'tools/run_natural_play_segment.py'),
          '--rom',str(ROM),'--mesen',MESEN,'--out',str(OUT/name),
          '--trace-menu','--trace-pet-assets','--actions',actions]
    if load: args.extend(['--load',str(load)])
    if seed: args.append('--cross-rom-seed')
    subprocess.run(args,cwd=ROOT,check=True)
    return OUT/name/'checkpoint.mss'


if __name__ == '__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--rom',type=Path,default=ROM)
    p.add_argument('--out',type=Path,default=OUT)
    a=p.parse_args()
    ROM=a.rom.resolve()
    OUT=a.out.resolve()
    segment('001_cold_boot','none:1:299,start:6:120')
    # This is an exact V0.9.2 checkpoint, not a falsely relabelled seed.
    menu=segment('002_diagnostic_menu','b:6:60,start:6:60',
                 ROOT/'analysis/pet_layout_menu_fix/010_boot_menu/checkpoint.mss',True)
    for i,name in enumerate(('folder','subchip','library','rockman','email','keyitems','communication','save')):
        actions='down:6:20,'*i+'a:6:150'
        segment(f'{i+3:03d}_{name}',actions,menu)
    segment('011_library_switch','right:6:120,left:6:120,down:6:60,down:6:60,down:6:60,b:6:60',
            OUT/'005_library/checkpoint.mss')
    segment('012_folder_edit','a:6:90,a:6:90,down:6:60,b:6:60,b:6:60',
            OUT/'003_folder/checkpoint.mss')
    segment('013_save_confirm','a:6:150,a:6:150,b:6:90,start:6:90',
            OUT/'010_save/checkpoint.mss')
    segment('014_after_save_boot','none:1:299,start:6:120,a:6:180,start:6:90,a:6:180,start:6:120')
    segment('015_backpack','a:6:90,a:6:90,right:6:120,left:6:120',
            OUT/'012_folder_edit/checkpoint.mss')
