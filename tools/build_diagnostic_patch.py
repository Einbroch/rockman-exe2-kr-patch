"""Build a ROM-free diagnostic patch package for one EXE2 KR V0.9 variant.

Every variant derives from the V0.9 candidate, ships no ROM or save, and is
verified the same way: deterministic BPS and ZIP, applied-ROM identity, wrong
source rejected, existing output preserved, and a muted cold-boot smoke test.
These builds exist to narrow down an emulator-specific fault; none is a release.

  python tools/build_diagnostic_patch.py --variant menuptr-revert
"""
import argparse
import hashlib
import json
import shutil
import struct
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
CANDIDATE = ROOT/'poc/output/exe2_rev1_semantic_translation_playtest_fix_v2.gba'
FLIPS = ROOT/'external/Flips-v198/windows/flips.exe'
FLIPS_SOURCE = ROOT/'external/Flips-v198/flips-source-v198.zip'
TEMPLATE = ROOT/'tools/diagnostic_package'
DEFAULT_MESEN = Path(r'C:/Users/blari/AppData/Local/emucap/mesen2/47801/portable/Mesen.exe')

SOURCE_SHA = '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
CANDIDATE_SHA = 'a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a'
FLIPS_SHA = 'ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'

TRIM_SIZE = 0xA00000
# Pointers the muted Mesen probe observed the PET menu reading from the
# expanded region. Their original targets are untouched by the patch.
MENU_POINTERS = (0x007370, 0x0251E8)


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def run(args, **kwargs):
    result = subprocess.run([str(x) for x in args], capture_output=True, **kwargs)
    if result.returncode:
        raise RuntimeError(result.stdout.decode(errors='replace') + result.stderr.decode(errors='replace'))
    return result


def powershell(script, *args):
    return subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass',
                           '-File', str(script), *[str(x) for x in args]], capture_output=True)


def build_trim10m(candidate, _source):
    """Drop the trailing padding so the applied ROM is 10 MB instead of 16 MB."""
    if set(candidate[TRIM_SIZE:]) - {0xFF}:
        raise RuntimeError('Refusing to trim: removed range is not pure 0xFF padding')
    last = max(i for i, b in enumerate(candidate) if b not in (0x00, 0xFF))
    if last >= TRIM_SIZE:
        raise RuntimeError(f'Refusing to trim: live data reaches 0x{last:X}')
    return candidate[:TRIM_SIZE], {'kept_bytes': TRIM_SIZE,
                                   'removed_bytes': len(candidate) - TRIM_SIZE,
                                   'removed_fill_byte': 255, 'last_live_offset': last}


def build_menuptr_revert(candidate, source, offsets=MENU_POINTERS):
    """Point the named menu-read pointers back at their untouched originals."""
    data = bytearray(candidate)
    reverted = []
    for offset in offsets:
        original = struct.unpack('<I', source[offset:offset+4])[0]
        patched = struct.unpack('<I', candidate[offset:offset+4])[0]
        if not 0x08800000 <= patched < 0x09000000:
            raise RuntimeError(f'0x{offset:06X} does not hold an expanded-region pointer')
        target = original - 0x08000000
        if source[target:target+0x800] != candidate[target:target+0x800]:
            raise RuntimeError(f'Original payload at 0x{target:07X} was overwritten; cannot revert')
        data[offset:offset+4] = source[offset:offset+4]
        reverted.append({'ref': f'0x{offset:06X}', 'from': f'0x{patched:08X}', 'to': f'0x{original:08X}'})
    return bytes(data), {'reverted_pointers': reverted}


def build_menu362_move(candidate, _source):
    """Re-home archive 00/362 into untouched fill so only its neighbour changes.

    Same bytes, same length, still above 8 MB - the one thing that differs from
    V0.9 is that 0xFF fill follows it instead of the next archive's table.
    """
    source_offset, length, destination = 0x900F00, 0x1156, 0x910000
    data = bytearray(candidate)
    payload = bytes(data[source_offset:source_offset + length])
    landing = data[destination:destination + length + 0x100]
    if set(landing) != {0xFF}:
        raise RuntimeError(f'0x{destination:07X} is not untouched 0xFF fill')
    if struct.unpack('<I', data[0x0251E8:0x0251EC])[0] != 0x08000000 + source_offset:
        raise RuntimeError('0x0251E8 no longer points at 00/362')
    data[destination:destination + length] = payload
    data[0x0251E8:0x0251EC] = struct.pack('<I', 0x08000000 + destination)
    return bytes(data), {'archive': '00/362', 'moved_from': f'0x{source_offset:07X}',
                         'moved_to': f'0x{destination:07X}', 'length': length,
                         'followed_by': '0xFF fill'}


OPTIONS: dict = {}


def build_menu362_cap(candidate, source):
    """Keep every 00/362 entry whose Korean form fits OPTIONS['cap'] bytes.

    Entries above the cap fall back to the untouched Japanese bytes. Walking the
    cap between the original maximum (15) and the Korean maximum (43) brackets
    the byte budget the PET menu actually enforces.
    """
    cap = OPTIONS['cap']
    source_base, relocated_base, destination = 0x7D98D4, 0x900F00, 0x910000
    data = bytearray(candidate)
    ob, nb = _bounds(source, source_base), _bounds(candidate, relocated_base)
    if len(ob) != len(nb):
        raise RuntimeError('entry count changed; cannot compare like for like')
    entries, restored, kept = [], 0, 0
    for i in range(len(ob) - 1):
        old = source[source_base + ob[i]:source_base + ob[i+1]]
        new = bytes(data[relocated_base + nb[i]:relocated_base + nb[i+1]])
        if len(new) > cap:
            entries.append(old)
            restored += 1
        else:
            entries.append(new)
            kept += 1
    table_size = len(ob) * 2
    offsets, cursor = [], table_size
    for payload in entries:
        offsets.append(cursor)
        cursor += len(payload)
    offsets.append(cursor)
    archive = struct.pack(f'<{len(offsets)}H', *offsets) + b''.join(entries)
    if len(archive) != cursor or _bounds(archive, 0)[-1] != len(archive):
        raise RuntimeError('rebuilt archive failed its own table check')
    if set(data[destination:destination + len(archive) + 0x100]) != {0xFF}:
        raise RuntimeError(f'0x{destination:07X} is not untouched 0xFF fill')
    data[destination:destination + len(archive)] = archive
    data[0x0251E8:0x0251EC] = struct.pack('<I', 0x08000000 + destination)
    longest_kept = max((len(e) for e in entries), default=0)
    return bytes(data), {'archive': '00/362', 'cap_bytes': cap, 'entries': len(entries),
                         'kept_korean': kept, 'restored_to_japanese': restored,
                         'longest_entry_shipped': longest_kept,
                         'rebuilt_length': len(archive), 'placed_at': f'0x{destination:07X}'}


def _bounds(buf, base):
    table_size = struct.unpack_from('<H', buf, base)[0]
    values = [struct.unpack_from('<H', buf, base + p)[0] for p in range(0, table_size, 2)]
    if values[0] != table_size or any(a > b for a, b in zip(values, values[1:])):
        raise RuntimeError(f'0x{base:07X} is not a well-formed archive table')
    return values


def build_menu362_fit(candidate, source):
    """Rebuild 00/362 with every entry capped at its original byte length.

    Entries whose Korean form already fits stay Korean; the ones that grew are
    restored to the untouched Japanese bytes. If the PET menu then survives, the
    fault is per-entry length rather than the archive as a whole.
    """
    source_base, relocated_base, destination = 0x7D98D4, 0x900F00, 0x910000
    data = bytearray(candidate)
    ob, nb = _bounds(source, source_base), _bounds(candidate, relocated_base)
    if len(ob) != len(nb):
        raise RuntimeError('entry count changed; cannot compare like for like')
    entries, restored = [], []
    for i in range(len(ob) - 1):
        old = source[source_base + ob[i]:source_base + ob[i+1]]
        new = bytes(data[relocated_base + nb[i]:relocated_base + nb[i+1]])
        if len(new) > len(old):
            entries.append(old)
            restored.append({'entry': i, 'korean_bytes': len(new), 'original_bytes': len(old)})
        else:
            entries.append(new)
    table_size = len(ob) * 2
    offsets, cursor = [], table_size
    for payload in entries:
        offsets.append(cursor)
        cursor += len(payload)
    offsets.append(cursor)
    archive = struct.pack(f'<{len(offsets)}H', *offsets) + b''.join(entries)
    if len(archive) != cursor or _bounds(archive, 0)[-1] != len(archive):
        raise RuntimeError('rebuilt archive failed its own table check')
    landing = data[destination:destination + len(archive) + 0x100]
    if set(landing) != {0xFF}:
        raise RuntimeError(f'0x{destination:07X} is not untouched 0xFF fill')
    data[destination:destination + len(archive)] = archive
    data[0x0251E8:0x0251EC] = struct.pack('<I', 0x08000000 + destination)
    return bytes(data), {'archive': '00/362', 'entries': len(entries),
                         'restored_to_japanese': len(restored),
                         'kept_korean': len(entries) - len(restored),
                         'rebuilt_length': len(archive),
                         'placed_at': f'0x{destination:07X}',
                         'longest_restored': max(restored, key=lambda r: r['korean_bytes'], default=None)}


VARIANTS = {
    'trim10m': {
        'name': 'EXE2_Rev1_KR_V0.9_TRIM10M_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_TRIM10M_TEST.gba',
        'readme': 'trim10m.txt',
        'build': build_trim10m,
        'purpose': 'Decide whether the My Boy! START-menu freeze depends on ROM size.',
        'relationship': 'identical content; trailing 0xFF padding removed',
        'expected_rom_sha256': '1a35c68c25ec17866eaac92cdfad82636cfb8876dee5633c605e7b3012c1341c',
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 TRIM10M diagnostic build (10 MB ROM).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menuptr-revert': {
        'name': 'EXE2_Rev1_KR_V0.9_MENUPTR_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENUPTR_TEST.gba',
        'readme': 'menuptr_revert.txt',
        'build': build_menuptr_revert,
        'purpose': 'Decide whether the PET menu freeze comes from its two expanded-region reads.',
        'relationship': 'identical to V0.9 except two menu pointers restored to their originals',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENUPTR diagnostic build (2 menu pointers reverted).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menuptr-352': {
        'name': 'EXE2_Rev1_KR_V0.9_MENUPTR352_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENUPTR352_TEST.gba',
        'readme': 'menuptr_352.txt',
        'build': lambda candidate, source: build_menuptr_revert(candidate, source, (0x007370,)),
        'purpose': 'Decide whether archive 00/352 alone accounts for the PET menu freeze.',
        'relationship': 'identical to V0.9 except the 00/352 pointer restored to its original',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENUPTR352 diagnostic build (00/352 pointer reverted).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menuptr-362': {
        'name': 'EXE2_Rev1_KR_V0.9_MENUPTR362_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENUPTR362_TEST.gba',
        'readme': 'menuptr_362.txt',
        'build': lambda candidate, source: build_menuptr_revert(candidate, source, (0x0251E8,)),
        'purpose': 'Decide whether archive 00/362 alone accounts for the PET menu freeze.',
        'relationship': 'identical to V0.9 except the 00/362 pointer restored to its original',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENUPTR362 diagnostic build (00/362 pointer reverted).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menu362-move': {
        'name': 'EXE2_Rev1_KR_V0.9_MENU362MOVE_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENU362MOVE_TEST.gba',
        'readme': 'menu362_move.txt',
        'build': build_menu362_move,
        'purpose': 'Separate what follows archive 00/362 from its size and address.',
        'relationship': 'identical to V0.9 except 00/362 re-homed into 0xFF fill',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENU362MOVE diagnostic build (00/362 re-homed).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menu362-fit': {
        'name': 'EXE2_Rev1_KR_V0.9_MENU362FIT_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENU362FIT_TEST.gba',
        'readme': 'menu362_fit.txt',
        'build': build_menu362_fit,
        'purpose': 'Decide whether per-entry byte length is what breaks the PET menu.',
        'relationship': 'identical to V0.9 except 00/362 entries capped at their original lengths',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENU362FIT diagnostic build (00/362 entries length-capped).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
    'menu362-cap': {
        'name': 'EXE2_Rev1_KR_V0.9_MENU362CAP{cap}_TEST',
        'output': 'Rockman_EXE2_Rev1_KR_V0.9_MENU362CAP{cap}_TEST.gba',
        'readme': 'menu362_cap.txt',
        'build': build_menu362_cap,
        'purpose': 'Bracket the per-entry byte budget the PET menu enforces on 00/362.',
        'relationship': 'identical to V0.9 except 00/362 entries above the cap restored to Japanese',
        'expected_rom_sha256': None,
        'messages': {
            'success': 'Verified: EXE2 KR V0.9 MENU362CAP{cap} diagnostic build ({cap}-byte entry cap).',
            'note': 'Diagnostic build only. Boot-verified, not full-QA. Do not load .ss1/.ss2 from other builds.',
        },
    },
}


def write_zip(package, destination, name):
    members = sorted(path for path in package.rglob('*') if path.is_file())
    with zipfile.ZipFile(destination, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for path in members:
            info = zipfile.ZipInfo(name + '/' + path.relative_to(package).as_posix(),
                                   date_time=(2026, 9, 13, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, path.read_bytes())
    return members


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--variant', required=True, choices=sorted(VARIANTS))
    parser.add_argument('--mesen', type=Path, default=DEFAULT_MESEN)
    parser.add_argument('--skip-smoke', action='store_true')
    parser.add_argument('--replace-generated', action='store_true')
    parser.add_argument('--cap', type=int, default=24,
                        help='per-entry byte cap for the menu362-cap variant')
    args = parser.parse_args()
    OPTIONS['cap'] = args.cap
    spec = dict(VARIANTS[args.variant])
    spec['name'] = spec['name'].format(cap=args.cap)
    spec['output'] = spec['output'].format(cap=args.cap)
    spec['messages'] = {k: v.format(cap=args.cap) for k, v in spec['messages'].items()}
    name = spec['name']

    for path, expected, label in ((SOURCE, SOURCE_SHA, 'source ROM'),
                                  (CANDIDATE, CANDIDATE_SHA, 'V0.9 candidate'),
                                  (FLIPS, FLIPS_SHA, 'Floating IPS binary')):
        if sha(path) != expected:
            raise RuntimeError(f'Unexpected {label}')

    destination = ROOT/'dist'/(name + '.zip')
    destination.parent.mkdir(exist_ok=True)
    if destination.exists() and not args.replace_generated:
        raise FileExistsError(destination)

    stage = Path(tempfile.mkdtemp(prefix='exe2-diag-'))
    package = stage/name
    (package/'tools').mkdir(parents=True)
    shutil.copy2(TEMPLATE/'APPLY_PATCH.cmd', package/'APPLY_PATCH.cmd')
    shutil.copy2(TEMPLATE/'apply_patch.ps1', package/'apply_patch.ps1')
    shutil.copy2(TEMPLATE/'readme'/spec['readme'], package/'README_KO.txt')
    for member in ('flips.exe', 'COPYING', 'COPYING.gpl3'):
        shutil.copy2(FLIPS.parent/member, package/'tools'/member)
    with zipfile.ZipFile(FLIPS_SOURCE) as upstream, \
            zipfile.ZipFile(package/'tools/flips-source-v198.zip', 'w',
                            compression=zipfile.ZIP_DEFLATED, compresslevel=9) as sources:
        for member in upstream.infolist():
            if member.filename.endswith(('profile/firefox-17.0esr.tar', 'profile/firefox-10.0esr.tar')):
                continue
            if member.filename.lower().endswith(('.gba', '.sav', '.ss1', '.ss2')):
                raise RuntimeError('Upstream archive carries a ROM-like member')
            sources.writestr(member, upstream.read(member))

    payload, details = spec['build'](CANDIDATE.read_bytes(), SOURCE.read_bytes())
    target = stage/spec['output']
    target.write_bytes(payload)
    target_sha = sha(target)
    if spec['expected_rom_sha256'] and target_sha != spec['expected_rom_sha256']:
        raise RuntimeError(f'Variant ROM changed: {target_sha}')

    patch = package/(name + '.bps')
    run([FLIPS, '--create', '--exact', '--bps', SOURCE, target, patch])
    repeat_patch = stage/'repeat.bps'
    run([FLIPS, '--create', '--exact', '--bps', SOURCE, target, repeat_patch])
    if patch.read_bytes() != repeat_patch.read_bytes():
        raise RuntimeError('BPS creation is not deterministic')

    manifest = {
        'schema_version': 1,
        'package': name,
        'variant': args.variant,
        'status': 'DIAGNOSTIC_BUILD_NOT_A_RELEASE',
        'purpose': spec['purpose'],
        'derived_from': {'candidate': CANDIDATE.name, 'sha256': CANDIDATE_SHA,
                         'relationship': spec['relationship']},
        'source': {'filename': SOURCE.name, 'size': SOURCE.stat().st_size, 'sha256': SOURCE_SHA},
        'target': {'filename': spec['output'], 'size': target.stat().st_size, 'sha256': target_sha},
        'patch': {'filename': patch.name, 'format': 'BPS', 'size': patch.stat().st_size, 'sha256': sha(patch)},
        'tool': {
            'name': 'Floating IPS', 'version': 'v198', 'sha256': FLIPS_SHA,
            'binary_url': 'https://github.com/Sir-Walrus/Flips/releases/download/v198/flips-windows.zip',
            'source_url': 'https://api.github.com/repos/Sir-Walrus/Flips/zipball/v198',
            'source_zip_sha256': sha(package/'tools/flips-source-v198.zip'),
        },
        'variant_details': details,
        'messages': spec['messages'],
        'claims': {'rom_included': False, 'save_included': False, 'patch_deterministic': True,
                   'full_game_qa_complete': False, 'official_final_release': False},
    }
    (package/'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n',
                                         encoding='utf-8')

    applied = stage/'applied.gba'
    run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass',
         '-File', package/'apply_patch.ps1', '-SourceRom', SOURCE, '-OutputRom', applied])
    if applied.read_bytes() != payload:
        raise RuntimeError('Applied ROM differs from the built variant')

    wrong = stage/'wrong-source-must-not-exist.gba'
    bad = powershell(package/'apply_patch.ps1', '-SourceRom', CANDIDATE, '-OutputRom', wrong)
    if bad.returncode == 0 or wrong.exists():
        raise RuntimeError('Wrong source ROM was not rejected')
    existing = powershell(package/'apply_patch.ps1', '-SourceRom', SOURCE, '-OutputRom', applied)
    if existing.returncode == 0 or sha(applied) != target_sha:
        raise RuntimeError('Existing output was not protected')

    smoke = None
    if not args.skip_smoke:
        smoke = stage/'runtime_smoke'
        run([sys.executable, ROOT/'tools/run_natural_play_segment.py', '--rom', applied,
             '--mesen', args.mesen, '--out', smoke, '--actions', 'none:1:599'], cwd=ROOT)
        smoke_result = json.loads((smoke/'result.json').read_text(encoding='utf-8'))
        if not smoke_result['completed'] or smoke_result['audio_enabled']:
            raise RuntimeError('Cold-boot smoke test did not complete muted')

    members = sorted(path for path in package.rglob('*') if path.is_file())
    if any(path.suffix.lower() in {'.gba', '.sav', '.ss1', '.ss2'} for path in members):
        raise RuntimeError('Package would ship a ROM or save')
    write_zip(package, destination, name)
    repeat_zip = stage/'repeat.zip'
    write_zip(package, repeat_zip, name)
    if destination.read_bytes() != repeat_zip.read_bytes():
        raise RuntimeError('ZIP writing is not deterministic')

    extracted = stage/'extracted'
    with zipfile.ZipFile(destination) as archive:
        if archive.testzip() is not None:
            raise RuntimeError('Bad ZIP member')
        archive.extractall(extracted)
    from_zip = stage/'applied-from-final-zip.gba'
    run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass',
         '-File', extracted/name/'apply_patch.ps1', '-SourceRom', SOURCE, '-OutputRom', from_zip])
    if from_zip.read_bytes() != payload:
        raise RuntimeError('Final ZIP does not reproduce the variant ROM')

    receipt = {
        'status': 'PASS_DIAGNOSTIC_PACKAGE',
        'variant': args.variant, 'release_ready': False,
        'zip_path': str(destination), 'zip_sha256': sha(destination), 'zip_size': destination.stat().st_size,
        'patch_sha256': sha(patch), 'patch_size': patch.stat().st_size,
        'source_sha256': SOURCE_SHA, 'candidate_sha256': CANDIDATE_SHA,
        'applied_rom_sha256': target_sha, 'applied_rom_size': target.stat().st_size,
        'variant_details': details,
        'patch_deterministic': True, 'zip_deterministic': True,
        'wrong_source_rejected': True, 'existing_output_not_overwritten': True,
        'no_rom_or_saves_in_package': True,
        'final_zip_extracted_apply_sha256': sha(from_zip),
        'runtime_smoke': None if smoke is None else {
            'emulator': str(args.mesen), 'emulator_sha256': sha(args.mesen), 'audio_enabled': False,
            'result_sha256': sha(smoke/'result.json'), 'screenshot_sha256': sha(smoke/'step_001.png'),
            'status': 'PASS_DIRECT_MESEN_COLD_BOOT_SMOKE',
        },
        'members_sha256': {path.relative_to(package).as_posix(): sha(path) for path in members},
    }
    receipt_path = ROOT/f'analysis/exe2_rev1_diagnostic_{name.lower()}_qa.json'
    receipt_path.write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    shutil.rmtree(stage, ignore_errors=True)
    print(json.dumps({'variant': args.variant, 'zip': str(destination),
                      'zip_sha256': receipt['zip_sha256'], 'applied_rom_sha256': target_sha,
                      'receipt': str(receipt_path)}, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
