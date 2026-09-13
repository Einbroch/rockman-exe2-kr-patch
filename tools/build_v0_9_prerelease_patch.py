"""Build the deterministic ROM-free Rockman EXE 2 Korean V0.9 prerelease."""
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VERSION = 'V0.9'
NAME = 'EXE2_Rev1_KR_V0.9'
SOURCE = ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
TARGET = ROOT/'poc/output/exe2_rev1_semantic_translation_playtest_fix_v2.gba'
TARGET_MANIFEST = ROOT/'poc/output/exe2_rev1_semantic_translation_playtest_fix_v2_manifest.json'
FLIPS = ROOT/'external/Flips-v198/windows/flips.exe'
FLIPS_SOURCE = ROOT/'external/Flips-v198/flips-source-v198.zip'
TEMPLATE = ROOT/'tools/v0_9_release_package'
MESEN = Path(r'C:/Users/blari/AppData/Local/emucap/mesen2/47801/portable/Mesen.exe')
SOURCE_SHA = '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
TARGET_SHA = 'a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a'
FLIPS_SHA = 'ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'
MESEN_SHA = 'af60a18859e3253f09c8fd32f6b1c04637efbd98780f1427dd94d4629474f640'
QA_PATHS = [
    'analysis/exe2_rev1_semantic_translation_playtest_fix_v2_static_qa.json',
    'analysis/exe2_rev1_playtest_continuation_static_qa.json',
    'analysis/exe2_rev1_natural_play_qa.json',
]


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def run(args, **kwargs):
    result = subprocess.run([str(x) for x in args], capture_output=True, **kwargs)
    if result.returncode:
        raise RuntimeError(result.stdout.decode(errors='replace') + result.stderr.decode(errors='replace'))
    return result


def write_zip(source_dir, destination):
    members = sorted(path for path in source_dir.rglob('*') if path.is_file())
    with zipfile.ZipFile(destination, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for path in members:
            info = zipfile.ZipInfo(NAME + '/' + path.relative_to(source_dir).as_posix(), date_time=(2026, 9, 13, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, path.read_bytes())
    return members


assert sha(SOURCE) == SOURCE_SHA
assert sha(TARGET) == TARGET_SHA
assert sha(FLIPS) == FLIPS_SHA
assert sha(MESEN) == MESEN_SHA
target_manifest = json.loads(TARGET_MANIFEST.read_text(encoding='utf-8'))
static_qa = json.loads((ROOT/QA_PATHS[0]).read_text(encoding='utf-8'))
continuation_qa = json.loads((ROOT/QA_PATHS[1]).read_text(encoding='utf-8'))
natural_qa = json.loads((ROOT/QA_PATHS[2]).read_text(encoding='utf-8'))
assert static_qa['candidate']['sha256'] == TARGET_SHA and static_qa['qa_status'] == 'PASS (bench)'
assert continuation_qa['rom_sha256'] == TARGET_SHA and continuation_qa['status'] == 'PASS (bench)'
assert natural_qa['candidate']['sha256'] == TARGET_SHA
assert natural_qa['verified_segment_receipts'] >= 226 and natural_qa['captured_screenshots'] >= 531
assert natural_qa['status'].endswith('PARTIAL whole-game QA')
assert target_manifest['output']['sha256'] == TARGET_SHA
assert target_manifest['translation_scope']['total_unique_translated_entry_count_in_output'] == 7607
assert len(target_manifest['archives']) == 381
assert len([x for x in target_manifest['expected_writes'] if x['kind'] == 'archive_pointer']) == 574
assert target_manifest['font']['record_count'] == 2351
assert target_manifest['verification']['raw_physical_continuations_preserved'] == 158
assert target_manifest['verification']['translated_physical_continuations_recompiled'] == 2

destination = ROOT/'dist'/(NAME + '.zip')
destination.parent.mkdir(exist_ok=True)
receipt_path = ROOT/'analysis/exe2_rev1_v0_9_prerelease_package_qa.json'
if destination.exists():
    if '--replace-generated' not in sys.argv or not receipt_path.exists():
        raise FileExistsError(destination)
    prior = json.loads(receipt_path.read_text(encoding='utf-8'))
    if sha(destination) != prior['zip_sha256']:
        raise RuntimeError('Existing V0.9 ZIP does not match its receipt; refusing replacement')

stage = Path(tempfile.mkdtemp(prefix='exe2-v0-9-', dir=ROOT/'analysis'))
package = stage/NAME
package.mkdir()
(package/'tools').mkdir()
for path in TEMPLATE.iterdir():
    shutil.copy2(path, package/path.name)
for name in ('flips.exe', 'COPYING', 'COPYING.gpl3'):
    shutil.copy2(FLIPS.parent/name, package/'tools'/name)
with zipfile.ZipFile(FLIPS_SOURCE) as upstream, zipfile.ZipFile(package/'tools/flips-source-v198.zip', 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as sources:
    for member in upstream.infolist():
        if member.filename.endswith(('profile/firefox-17.0esr.tar', 'profile/firefox-10.0esr.tar')):
            continue
        assert not member.filename.lower().endswith(('.gba', '.sav', '.ss1', '.ss2'))
        sources.writestr(member, upstream.read(member))

patch = package/(NAME + '.bps')
run([FLIPS, '--create', '--exact', '--bps', SOURCE, TARGET, patch])
repeat_patch = stage/'repeat.bps'
run([FLIPS, '--create', '--exact', '--bps', SOURCE, TARGET, repeat_patch])
assert patch.read_bytes() == repeat_patch.read_bytes()

manifest = {
    'schema_version': 1,
    'package': NAME,
    'version': VERSION,
    'release_date': '2026-09-13',
    'status': 'PRERELEASE_PARTIAL_QA_NOT_FINAL',
    'source': {'filename': SOURCE.name, 'size': SOURCE.stat().st_size, 'sha256': SOURCE_SHA},
    'target': {'filename': 'Rockman_EXE2_Rev1_KR_V0.9.gba', 'size': TARGET.stat().st_size, 'sha256': TARGET_SHA},
    'patch': {'filename': patch.name, 'format': 'BPS', 'size': patch.stat().st_size, 'sha256': sha(patch)},
    'tool': {
        'name': 'Floating IPS', 'version': 'v198', 'sha256': FLIPS_SHA,
        'binary_url': 'https://github.com/Sir-Walrus/Flips/releases/download/v198/flips-windows.zip',
        'source_url': 'https://api.github.com/repos/Sir-Walrus/Flips/zipball/v198',
        'source_zip_sha256': sha(package/'tools/flips-source-v198.zip'),
    },
    'content': {
        'translated_entries': 7607, 'relocated_archives': 381, 'relocated_pointers': 574,
        'hangul_font_records': 2351, 'physical_continuations_preserved': 158,
        'physical_continuations_translated': 2,
    },
    'qa': {
        'static_status': static_qa['qa_status'], 'natural_play_status': natural_qa['status'],
        'natural_play_segments': natural_qa['verified_segment_receipts'],
        'natural_play_screenshots': natural_qa['captured_screenshots'],
        'audio_enabled': natural_qa['audio_enabled'],
        'evidence_sha256': {path: sha(ROOT/path) for path in QA_PATHS},
    },
    'claims': {
        'rom_included': False, 'save_included': False, 'patch_deterministic': True,
        'applied_rom_byte_identical_to_candidate': True, 'full_game_qa_complete': False,
        'official_final_release': False,
    },
    'known_limitations': target_manifest['limitations'],
}
(package/'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')

applied = stage/'applied-v0.9.gba'
run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', package/'apply_patch.ps1', '-SourceRom', SOURCE, '-OutputRom', applied])
assert sha(applied) == TARGET_SHA and applied.read_bytes() == TARGET.read_bytes()
wrong = stage/'wrong-source-must-not-exist.gba'
bad = subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', str(package/'apply_patch.ps1'), '-SourceRom', str(TARGET), '-OutputRom', str(wrong)], capture_output=True)
assert bad.returncode != 0 and not wrong.exists()
existing = subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', str(package/'apply_patch.ps1'), '-SourceRom', str(SOURCE), '-OutputRom', str(applied)], capture_output=True)
assert existing.returncode != 0 and sha(applied) == TARGET_SHA

smoke = stage/'runtime_smoke'
run([sys.executable, ROOT/'tools/run_natural_play_segment.py', '--rom', applied, '--mesen', MESEN, '--out', smoke, '--actions', 'none:1:599'], cwd=ROOT)
smoke_result = json.loads((smoke/'result.json').read_text(encoding='utf-8'))
assert smoke_result['completed'] and not smoke_result['audio_enabled'] and smoke_result['rom_sha256'] == TARGET_SHA

members = sorted(path for path in package.rglob('*') if path.is_file())
assert not any(path.suffix.lower() in {'.gba', '.sav', '.ss1', '.ss2'} for path in members)
write_zip(package, destination)
repeat_zip = stage/'repeat.zip'
write_zip(package, repeat_zip)
assert destination.read_bytes() == repeat_zip.read_bytes()
with zipfile.ZipFile(destination) as archive:
    assert archive.testzip() is None
    expected = {NAME + '/' + path.relative_to(package).as_posix(): path for path in members}
    assert set(archive.namelist()) == set(expected)
    for name, path in expected.items():
        assert archive.read(name) == path.read_bytes()

extracted = stage/'extracted-final-zip'
with zipfile.ZipFile(destination) as archive:
    archive.extractall(extracted)
extracted_package = extracted/NAME
applied_from_zip = stage/'applied-from-final-zip.gba'
run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File',
     extracted_package/'apply_patch.ps1', '-SourceRom', SOURCE, '-OutputRom', applied_from_zip])
assert sha(applied_from_zip) == TARGET_SHA and applied_from_zip.read_bytes() == TARGET.read_bytes()

receipt = {
    'status': 'PASS_V0_9_PRERELEASE_PACKAGE_PARTIAL_QA',
    'release_ready': False,
    'version': VERSION,
    'zip_path': str(destination), 'zip_sha256': sha(destination), 'zip_size': destination.stat().st_size,
    'patch_sha256': sha(patch), 'patch_size': patch.stat().st_size,
    'source_sha256': SOURCE_SHA, 'applied_rom_sha256': sha(applied),
    'byte_identical_to_current_candidate': True, 'patch_deterministic': True, 'zip_deterministic': True,
    'wrong_source_rejected': True, 'existing_output_not_overwritten': True,
    'no_rom_or_saves_in_package': True,
    'final_zip_extracted_apply_sha256': sha(applied_from_zip),
    'final_zip_applied_byte_identical': True,
    'runtime_smoke': {
        'emulator': str(MESEN), 'emulator_sha256': MESEN_SHA, 'mcp_used': False,
        'audio_enabled': False, 'result_sha256': sha(smoke/'result.json'),
        'screenshot_sha256': sha(smoke/'step_001.png'), 'status': 'PASS_DIRECT_MESEN_COLD_BOOT_SMOKE',
    },
    'qa_evidence': {path: sha(ROOT/path) for path in QA_PATHS},
    'members_sha256': {path.relative_to(package).as_posix(): sha(path) for path in members},
    'stage_directory': str(stage.relative_to(ROOT)),
    'limitations': ['Partial natural-play QA', 'Full-game and mGBA-specific replay incomplete', 'Known untranslated/deferred entries listed in RELEASE_NOTES.md'],
}
receipt_path.write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
print(json.dumps(receipt, ensure_ascii=False, indent=2))
