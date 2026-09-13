"""Create a hash-locked, ROM-free test handoff; not a release-ready claim."""
import hashlib
import json
import shutil
import subprocess
import tempfile
import zipfile
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NAME = 'EXE2_Rev1_KR_Emulator_TEST_20260905'
SOURCE = ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
TARGET = ROOT/'poc/output/exe2_rev1_semantic_translation_linewrap_fix.gba'
FLIPS = ROOT/'external/Flips-v198/windows/flips.exe'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args):
    result = subprocess.run([str(x) for x in args], capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stdout.decode(errors='replace')+result.stderr.decode(errors='replace'))
    return result


assert sha(SOURCE) == '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
assert sha(TARGET) == '8d6ed5473404d2dcaf6056297324e86a47d88b4c999324eb40ab8a7a5e8ac11a'
assert sha(FLIPS) == 'ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'
qa_paths = ['analysis/exe2_rev1_semantic_translation_linewrap_fix_static_qa.json',
            'analysis/exe2_rev1_dialogue_wrap_bytes_qa.json',
            'analysis/exe2_rev1_dialogue_wrap_runtime_qa.json']
qa = [json.loads((ROOT/p).read_text(encoding='utf-8')) for p in qa_paths]
assert qa[0]['candidate']['sha256'] == sha(TARGET) and qa[0]['qa_status'] == 'PASS (bench)'
assert qa[1]['rom_sha256'] == sha(TARGET) and qa[1]['status'] == 'PASS'
assert qa[2]['rom_sha256'] == sha(TARGET) and qa[2]['status'] == 'PASS_TARGETED_RENDERER_PARTIAL_CORPUS'
dist = ROOT/'dist'
dist.mkdir(exist_ok=True)
destination = dist/(NAME+'.zip')
if destination.exists():
    previous = json.loads((ROOT/'analysis/emulator_test_patch_package_qa.json').read_text(encoding='utf-8'))
    if '--replace-generated' not in sys.argv or sha(destination) != previous['zip_sha256']:
        raise FileExistsError(destination)
stage = Path(tempfile.mkdtemp(prefix='test-patch-', dir=ROOT/'analysis'))
package = stage/NAME
package.mkdir()
(package/'tools').mkdir()
for file in (ROOT/'tools/emulator_patch_package').iterdir():
    shutil.copy2(file, package/file.name)
for name in ['flips.exe', 'COPYING', 'COPYING.gpl3']:
    shutil.copy2(FLIPS.parent/name, package/'tools'/name)
with zipfile.ZipFile(ROOT/'external/Flips-v198/flips-source-v198.zip') as upstream, zipfile.ZipFile(package/'tools/flips-source-v198.zip','w',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as sources:
    for member in upstream.infolist():
        # Unrelated Firefox binary distributions are benchmark inputs, not
        # patcher source. Keep all program source, build scripts and licenses.
        if member.filename.endswith(('profile/firefox-17.0esr.tar', 'profile/firefox-10.0esr.tar')):
            continue
        assert not member.filename.lower().endswith(('.gba','.sav','.ss1','.ss2'))
        sources.writestr(member, upstream.read(member))
patch = package/'EXE2_Rev1_KR_TEST.bps'
run([FLIPS, '--create', '--exact', '--bps', SOURCE, TARGET, patch])
repeat = stage/'repeat.bps'
run([FLIPS, '--create', '--exact', '--bps', SOURCE, TARGET, repeat])
assert patch.read_bytes() == repeat.read_bytes()
manifest = {
    'package':NAME, 'status':'INCOMPLETE_EMULATOR_TEST_HANDOFF_NOT_FINAL_RELEASE',
    'source':{'filename':SOURCE.name,'size':SOURCE.stat().st_size,'sha256':sha(SOURCE)},
    'target':{'filename':'Rockman_EXE2_Rev1_KR_TEST.gba','size':TARGET.stat().st_size,'sha256':sha(TARGET)},
    'patch':{'filename':patch.name,'format':'BPS','size':patch.stat().st_size,'sha256':sha(patch)},
    'tool':{'name':'Floating IPS','version':'v198','sha256':sha(FLIPS),
            'binary_url':'https://github.com/Sir-Walrus/Flips/releases/download/v198/flips-windows.zip',
            'source_url':'https://api.github.com/repos/Sir-Walrus/Flips/zipball/v198',
            'source_zip_sha256':sha(package/'tools/flips-source-v198.zip'),
            'source_packaging_note':'All Flips source/build/license files preserved; two unrelated Firefox binary benchmark tarballs omitted. Standard non-PGO Makefile build remains available.'},
    'qa_evidence':{p:sha(ROOT/p) for p in qa_paths},
    'claims':{'rom_included':False,'patch_deterministic':True,'full_game_qa_complete':False,
              'runtime_transfer_basis':'Applied ROM byte identity with existing tested artifact'},
}
(package/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
# Exercise the actual bundled Windows entry point, not only the encoder.
applied = stage/'applied-test.gba'
run(['powershell.exe','-NoProfile','-ExecutionPolicy','Bypass','-File',package/'apply_patch.ps1','-SourceRom',SOURCE,'-OutputRom',applied])
assert applied.read_bytes() == TARGET.read_bytes()
# Wrong source and existing-output paths must fail without creating/overwriting ROMs.
wrong_output = stage/'wrong-source-must-not-exist.gba'
negative = subprocess.run(['powershell.exe','-NoProfile','-ExecutionPolicy','Bypass','-File',str(package/'apply_patch.ps1'),'-SourceRom',str(TARGET),'-OutputRom',str(wrong_output)],capture_output=True)
assert negative.returncode != 0 and not wrong_output.exists()
existing = subprocess.run(['powershell.exe','-NoProfile','-ExecutionPolicy','Bypass','-File',str(package/'apply_patch.ps1'),'-SourceRom',str(SOURCE),'-OutputRom',str(applied)],capture_output=True)
assert existing.returncode != 0 and applied.read_bytes() == TARGET.read_bytes()
members = sorted(p for p in package.rglob('*') if p.is_file())
assert not any(p.suffix.lower() in {'.gba','.sav','.ss1','.ss2'} for p in members)
with zipfile.ZipFile(destination,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as z:
    for path in members:
        info = zipfile.ZipInfo(NAME+'/'+path.relative_to(package).as_posix(),date_time=(2026,9,5,0,0,0))
        info.compress_type = zipfile.ZIP_DEFLATED
        info.external_attr = 0o100644 << 16
        z.writestr(info,path.read_bytes())
with zipfile.ZipFile(destination) as z:
    assert z.testzip() is None
    for path in members:
        assert z.read(NAME+'/'+path.relative_to(package).as_posix()) == path.read_bytes()
receipt = {'status':'PASS_TEST_PACKAGE', 'zip_path':str(destination),'zip_sha256':sha(destination),
           'zip_size':destination.stat().st_size,'patch_sha256':sha(patch),'patch_size':patch.stat().st_size,
           'applied_rom_sha256':sha(applied),'byte_identical_to_current_candidate':True,
           'wrong_source_rejected':True,'existing_output_not_overwritten':True,'no_rom_or_saves_in_package':True,
           'stage_directory':str(stage.relative_to(ROOT)),
           'members_sha256':{p.relative_to(package).as_posix():sha(p) for p in members},
           'release_ready':False}
(ROOT/'analysis/emulator_test_patch_package_qa.json').write_text(json.dumps(receipt,indent=2)+'\n',encoding='utf-8')
print(json.dumps(receipt,indent=2))
