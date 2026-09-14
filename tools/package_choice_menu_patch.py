"""Build the deterministic emulator patch package for the reviewed choice/menu fix."""
import hashlib, json, shutil, subprocess, tempfile, zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
NAME='EXE2_Rev1_KR_V0.9.2_ChoiceMenuFix'
SOURCE_SHA='1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
FLIPS_SHA='ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def run(cmd):
 r=subprocess.run([str(x) for x in cmd],capture_output=True)
 if r.returncode: raise RuntimeError((r.stdout+r.stderr).decode(errors='replace')[-2000:])
def write_zip(folder,target):
 with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED,compresslevel=9) as z:
  for f in sorted(folder.rglob('*')):
   if f.is_file():
    info=zipfile.ZipInfo(NAME+'/'+f.relative_to(folder).as_posix(),(2026,9,13,0,0,0));info.compress_type=zipfile.ZIP_DEFLATED;info.external_attr=0o100644<<16;z.writestr(info,f.read_bytes())
def main():
 rom=ROOT/'poc/output/exe2_rev1_kr_v0_9_2_choice_menu.gba'; manifest=rom.with_name(rom.stem+'_manifest.json')
 static=ROOT/'analysis/pet_layout_menu_fix/static_qa.json'; cpu=ROOT/'analysis/pet_layout_menu_fix/cpu_qa.json'
 assert sha(ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba')==SOURCE_SHA
 m=json.loads(manifest.read_text(encoding='utf-8')); assert sha(rom)==m['output']['sha256']
 assert json.loads(static.read_text(encoding='utf-8'))['qa_status']=='PASS (bench)'
 assert json.loads(cpu.read_text(encoding='utf-8'))['status']=='PASS_CPU_RENDERER_REGRESSION'
 segments=[]
 for f in sorted((ROOT/'analysis/pet_layout_menu_fix').glob('[0-9][0-9][0-9]_*/result.json')):
  r=json.loads(f.read_text(encoding='utf-8')); assert r['rom_sha256']==sha(rom) and r['completed'] and not r['audio_enabled'];segments.append(str(f.parent.relative_to(ROOT)))
 assert segments
 flips=ROOT/'external/Flips-v198/windows/flips.exe';assert sha(flips)==FLIPS_SHA
 stage=Path(tempfile.mkdtemp(prefix='exe2-choice-package-',dir=ROOT/'analysis')); folder=stage/NAME;(folder/'tools').mkdir(parents=True)
 for n in ('APPLY_PATCH.cmd','apply_patch.ps1'):shutil.copy2(ROOT/'tools/diagnostic_package'/n,folder/n)
 shutil.copy2(ROOT/'tools/myboy_fix_package/INSTALL.md',folder/'INSTALL.md');shutil.copy2(flips,folder/'tools/flips.exe')
 for n in ('COPYING','COPYING.gpl3'):shutil.copy2(flips.parent/n,folder/'tools'/n)
 with zipfile.ZipFile(ROOT/'dist/EXE2_Rev1_KR_V0.9.zip') as z:bundle=z.read('EXE2_Rev1_KR_V0.9/tools/flips-source-v198.zip')
 (folder/'tools/flips-source-v198.zip').write_bytes(bundle)
 patch=folder/(NAME+'.bps');run([flips,'--create','--bps',ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba',rom,patch])
 receipt={'status':'PASS_CHOICE_MENU_PATCH_PACKAGE','source_sha256':SOURCE_SHA,'target_sha256':sha(rom),'patch_sha256':sha(patch),'static_qa':str(static.relative_to(ROOT)),'cpu_qa':str(cpu.relative_to(ROOT)),'runtime_segments':segments,'audio_enabled':False,'claims':{'rom_included':False,'save_included':False,'myboy_device_verified':False,'full_game_qa_complete':False,'official_final_release':False}}
 (folder/'VERIFICATION.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
 target_name=NAME+'.gba'
 patch_name=NAME+'.bps'
 (folder/'manifest.json').write_text(json.dumps({
  'version':'V0.9.2-ChoiceMenuFix','status':'EMULATOR_VALIDATION_CANDIDATE',
  'source':{'filename':'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba','size':8388608,'sha256':SOURCE_SHA},
  'target':{'filename':target_name,'size':rom.stat().st_size,'sha256':sha(rom)},
  'patch':{'filename':patch_name,'size':patch.stat().st_size,'sha256':sha(patch),'format':'BPS'},
  'tool':{'name':'Floating IPS','version':'v198','sha256':FLIPS_SHA},
  'messages':{'success':'EXE2 Rev 1 V0.9.2 선택창·PET 메뉴 수정 패치 적용 완료.','note':'My Boy!에서는 새 ROM을 콜드 부팅하고 일반 저장을 사용하세요.'},
  'claims':{'rom_included':False,'save_included':False,'myboy_device_verified':False,'full_game_qa_complete':False,'official_final_release':False}
 },ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
 (folder/'README.md').write_text('# EXE2 Rev 1 한국어 패치 V0.9.2 선택창·메뉴 수정\n\n원본 Rev 1 ROM에 BPS를 적용하세요. My Boy!에서는 이전 ROM의 세이브/상태가 아닌 새로 적용한 ROM의 일반 저장을 사용하세요. 이 패키지는 ROM과 저장 파일을 포함하지 않습니다.\n',encoding='utf-8')
 target=ROOT/'dist'/(NAME+'.zip');
 if target.exists(): raise FileExistsError(target)
 write_zip(folder,target);write_zip(folder,stage/'repeat.zip');assert target.read_bytes()==(stage/'repeat.zip').read_bytes()
 print(json.dumps({'package':str(target),'sha256':sha(target),'size':target.stat().st_size,'patch_sha256':sha(patch)},ensure_ascii=False))
if __name__=='__main__':main()
