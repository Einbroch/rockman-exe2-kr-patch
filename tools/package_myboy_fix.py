"""Package the source-built MyBoy fix candidate after CPU/static/runtime checks."""
import argparse
import hashlib
import json
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NAME = 'EXE2_Rev1_KR_V0.9.1_MyBoyFix'
SOURCE_SHA = '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
FLIPS_SHA = 'ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args):
    p = subprocess.run([str(x) for x in args], capture_output=True)
    if p.returncode:
        raise RuntimeError(p.stdout.decode(errors='replace')[-2000:] + p.stderr.decode(errors='replace')[-2000:])
    return p


def write_zip(package, target):
    with zipfile.ZipFile(target, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for f in sorted(package.rglob('*')):
            if f.is_file():
                assert f.suffix.lower() not in {'.gba','.sav','.mss','.ss1','.ss2'}
                info = zipfile.ZipInfo(NAME+'/'+f.relative_to(package).as_posix(), (2026,9,13,0,0,0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                z.writestr(info, f.read_bytes())


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--rom', type=Path, required=True)
    p.add_argument('--manifest', type=Path, required=True)
    p.add_argument('--runtime-review', type=Path, required=True)
    p.add_argument('--replace-generated', action='store_true')
    p.add_argument('--source', type=Path, default=ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba')
    a = p.parse_args()
    source, candidate = a.source.resolve(), a.rom.resolve()
    m = json.loads(a.manifest.read_text(encoding='utf-8'))
    review = json.loads(a.runtime_review.read_text(encoding='utf-8'))
    target_sha = sha(candidate)
    assert sha(source) == SOURCE_SHA
    assert target_sha == m['output']['sha256'] == review['rom_sha256']
    assert review['status'] == 'PASS_TARGETED_MESEN_MENU_QA_MYBOY_PENDING'
    for rel in review['passing_segments']:
        folder = ROOT/rel
        receipt = json.loads((folder/'result.json').read_text(encoding='utf-8'))
        trace = json.loads((folder/'menu_trace.json').read_text(encoding='utf-8'))
        assert receipt['rom_sha256'] == target_sha and receipt['completed'] and not receipt['audio_enabled']
        assert trace['invalid_stream'] is None
        for filename, expected in receipt['artifacts'].items():
            assert sha(folder/filename) == expected
    static = json.loads((ROOT/'analysis/exe2_rev1_myboy_menu_static_qa.json').read_text(encoding='utf-8'))
    cpu = json.loads((ROOT/'analysis/exe2_rev1_myboy_menu_cpu_qa.json').read_text(encoding='utf-8'))
    assert static['candidate']['sha256'] == target_sha and static['qa_status'] == 'PASS (bench)'
    assert cpu['fixed_sha256'] == target_sha and cpu['status'] == 'PASS_CPU_RENDERER_REGRESSION'
    flips = ROOT/'external/Flips-v198/windows/flips.exe'
    assert sha(flips) == FLIPS_SHA
    destination = ROOT/'dist'/(NAME+'.zip')
    if destination.exists():
        receipt_path = ROOT/'analysis/exe2_rev1_myboy_fix_package_qa.json'
        if not a.replace_generated or not receipt_path.exists():
            raise FileExistsError(destination)
        previous = json.loads(receipt_path.read_text(encoding='utf-8'))
        if sha(destination) != previous['zip_sha256']:
            raise ValueError('existing generated ZIP no longer matches its receipt')
    stage = Path(tempfile.mkdtemp(prefix='test-patch-myboy-',dir=ROOT/'analysis'))
    package = stage/NAME
    (package/'tools').mkdir(parents=True)
    for file in ['APPLY_PATCH.cmd','apply_patch.ps1']:
        shutil.copy2(ROOT/'tools/diagnostic_package'/file, package/file)
    shutil.copy2(ROOT/'tools/myboy_fix_package/INSTALL.md', package/'INSTALL.md')
    shutil.copy2(flips,package/'tools/flips.exe')
    for file in ['COPYING','COPYING.gpl3']:
        shutil.copy2(ROOT/'external/Flips-v198/windows'/file,package/'tools'/file)
    # Reuse the byte-pinned corresponding-source bundle already shipped in V0.9.
    # The newer local archive also contains ~89 MB of Firefox benchmark tarballs.
    source_bundle_sha = '414113f98ed54151232af017f7e731accdb1e062c3f719cf2abafb0436fe3d45'
    with zipfile.ZipFile(ROOT/'dist/EXE2_Rev1_KR_V0.9.zip') as prior:
        source_bundle = prior.read('EXE2_Rev1_KR_V0.9/tools/flips-source-v198.zip')
    assert hashlib.sha256(source_bundle).hexdigest() == source_bundle_sha
    (package/'tools/flips-source-v198.zip').write_bytes(source_bundle)
    patch = package/(NAME+'.bps')
    repeat = stage/'repeat.bps'
    for output in [patch,repeat]:
        run([flips,'--create','--bps',source,candidate,output])
    assert patch.read_bytes() == repeat.read_bytes()
    manifest = {
        'version':'V0.9.1-MyBoyFix', 'status':'MYBOY_DEVICE_CONFIRMATION_PENDING',
        'source':{'filename':source.name,'size':source.stat().st_size,'sha256':SOURCE_SHA},
        'target':{'filename':'Rockman_EXE2_Rev1_KR_V0.9.1_MyBoyFix.gba','size':candidate.stat().st_size,'sha256':target_sha},
        'patch':{'filename':patch.name,'size':patch.stat().st_size,'sha256':sha(patch),'format':'BPS'},
        'tool':{'name':'Floating IPS','version':'v198','sha256':FLIPS_SHA,
                'source_zip_sha256':source_bundle_sha,
                'source_url':'https://api.github.com/repos/Sir-Walrus/Flips/zipball/v198'},
        'messages':{'success':'Verified: V0.9.1 MyBoy menu fix candidate.',
                    'note':'Cold boot and use an in-game save. My Boy device confirmation is pending.'},
        'claims':{'rom_included':False,'save_included':False,'full_game_qa_complete':False,
                  'myboy_device_verified':False,'official_final_release':False},
        'runtime_review': review,
    }
    (package/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    shutil.copy2(a.runtime_review,package/'VERIFICATION.json')
    write_zip(package,destination)
    write_zip(package,stage/'repeat.zip')
    assert destination.read_bytes() == (stage/'repeat.zip').read_bytes()
    extracted = stage/'extracted'
    with zipfile.ZipFile(destination) as z:
        assert z.testzip() is None
        z.extractall(extracted)
    applied = stage/'applied.gba'
    installer = extracted/NAME/'apply_patch.ps1'
    command = ['powershell.exe','-NoProfile','-ExecutionPolicy','Bypass','-File',installer]
    run(command+['-SourceRom',source,'-OutputRom',applied])
    assert applied.read_bytes() == candidate.read_bytes()
    for bad_source, output in [(candidate,stage/'wrong.gba'),(source,applied)]:
        proc = subprocess.run([str(x) for x in command+['-SourceRom',bad_source,'-OutputRom',output]], capture_output=True)
        assert proc.returncode != 0
    assert not (stage/'wrong.gba').exists() and sha(applied) == target_sha
    result = {'status':'PASS_MYBOY_FIX_PACKAGE_DEVICE_CONFIRMATION_PENDING',
              'zip_path':str(destination),'zip_sha256':sha(destination),'zip_size':destination.stat().st_size,
              'patch_sha256':sha(patch),'target_sha256':target_sha,'source_sha256':SOURCE_SHA,
              'applied_from_final_zip_byte_identical':True,'bps_and_zip_deterministic':True,
              'wrong_source_and_overwrite_rejected':True,'no_rom_or_saves':True,
              'runtime_review_sha256':sha(a.runtime_review),
              'members':{f.relative_to(package).as_posix():sha(f) for f in package.rglob('*') if f.is_file()}}
    (ROOT/'analysis/exe2_rev1_myboy_fix_package_qa.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({k:v for k,v in result.items() if k!='members'},ensure_ascii=False,indent=2))


if __name__ == '__main__':
    main()
