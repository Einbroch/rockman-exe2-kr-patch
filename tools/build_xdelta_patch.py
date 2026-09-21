"""Build an xdelta3 patch beside the BPS one, for patchers that want xdelta.

Same source and target as the BPS package, so both routes land on the identical
ROM. The patch is created, applied back onto a clean original, and the result is
compared byte for byte before anything is reported as good.

  python tools/build_xdelta_patch.py --candidate poc/output/<rom>.gba --name <stem>
"""
import argparse
import hashlib
import json
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
SOURCE_SHA = '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
DEFAULT_XDELTA = Path(r'D:/Games/Kor Patch/xdeltaUI 3.1/xdelta.exe')


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def run(args):
    result = subprocess.run([str(x) for x in args], capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stdout.decode(errors='replace')
                           + result.stderr.decode(errors='replace'))
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--name', required=True, help='output stem, e.g. EXE2_Rev1_KR_V0.9.4_MenuTextFix')
    parser.add_argument('--xdelta', type=Path, default=DEFAULT_XDELTA)
    parser.add_argument('--replace-generated', action='store_true')
    parser.add_argument('--expected-target-sha256', help='Bind output to an already verified ROM')
    args = parser.parse_args()

    if sha(SOURCE) != SOURCE_SHA:
        raise RuntimeError('Unexpected source ROM')
    if not args.xdelta.exists():
        raise RuntimeError(f'xdelta3 not found at {args.xdelta}')
    target_sha = sha(args.candidate)
    if args.expected_target_sha256 and target_sha != args.expected_target_sha256.lower():
        raise RuntimeError('Candidate differs from the verified target')
    if Path(args.name).name != args.name or '/' in args.name or '\\' in args.name:
        raise ValueError('Output name must be a filename stem')

    destination = ROOT/'dist'/(args.name + '.xdelta')
    destination.parent.mkdir(exist_ok=True)
    if destination.exists() and not args.replace_generated:
        raise FileExistsError(destination)

    with tempfile.TemporaryDirectory(prefix='exe2-xdelta-', dir=ROOT/'analysis') as stage:
        stage = Path(stage)
        patch = stage/'patch.xdelta'
        run([args.xdelta, '-e', '-s', SOURCE, args.candidate, patch])
        # Determinism: a second pass must produce the same bytes.
        repeat = stage/'repeat.xdelta'
        run([args.xdelta, '-e', '-s', SOURCE, args.candidate, repeat])
        if patch.read_bytes() != repeat.read_bytes():
            raise RuntimeError('xdelta creation is not deterministic')
        # Round trip onto a clean original, compared byte for byte.
        applied = stage/'applied.gba'
        run([args.xdelta, '-d', '-s', SOURCE, patch, applied])
        if applied.read_bytes() != args.candidate.read_bytes():
            raise RuntimeError('xdelta round trip did not reproduce the candidate')
        # Applying to the wrong source must not silently succeed.
        wrong = stage/'wrong.gba'
        bad = subprocess.run([str(args.xdelta), '-d', '-s', str(args.candidate),
                              str(patch), str(wrong)], capture_output=True)
        wrong_source_rejected = bad.returncode != 0
        if not wrong_source_rejected:
            raise RuntimeError('xdelta decoder did not reject the tested wrong source')
        destination.write_bytes(patch.read_bytes())

    receipt = {
        'status': 'PASS_XDELTA_PATCH',
        'patch_path': str(destination), 'patch_sha256': sha(destination),
        'patch_size': destination.stat().st_size,
        'source': {'filename': SOURCE.name, 'size': SOURCE.stat().st_size, 'sha256': SOURCE_SHA},
        'target': {'filename': args.candidate.name,
                   'size': args.candidate.stat().st_size, 'sha256': target_sha},
        'format': 'xdelta3 (VCDIFF)',
        'tool': {'path':str(args.xdelta.resolve()), 'sha256':sha(args.xdelta)},
        'expected_target_sha256':args.expected_target_sha256,
        'deterministic': True,
        'round_trip_byte_identical': True,
        'wrong_source_rejected': wrong_source_rejected,
        'rom_included': False,
    }
    receipt_path = ROOT/f'analysis/exe2_rev1_xdelta_{args.name.lower()}_qa.json'
    receipt_path.write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n',
                            encoding='utf-8')
    print(json.dumps({'patch': str(destination), 'patch_sha256': receipt['patch_sha256'],
                      'patch_size': receipt['patch_size'], 'target_sha256': target_sha,
                      'wrong_source_rejected': wrong_source_rejected,
                      'receipt': str(receipt_path)}, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
