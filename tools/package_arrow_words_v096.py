"""Package the V0.9.6 navigation-arrow lettering patch.

Two things differ from the V0.9.5 packager on purpose.

The bundled Floating IPS source is filtered the way the diagnostic packager
filters it. V0.9.5 shipped the raw upstream archive, which carries two Firefox
benchmark tarballs unrelated to Flips and pushed the download from about 1 MB to
44.7 MB.

The runtime receipt records what was actually done: a person read the four arrow
labels on screen for this exact ROM. No automated menu regression was run for
this candidate, so none is claimed.
"""
import argparse
import hashlib
import json
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
SOURCE_SHA = '1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
FLIPS = ROOT/'external/Flips-v198/windows/flips.exe'
FLIPS_SHA = 'ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'
FLIPS_SOURCE = ROOT/'external/Flips-v198/flips-source-v198.zip'
TEMPLATE = ROOT/'tools/diagnostic_package'
# Firefox benchmark tarballs that upstream ships beside the Flips sources.
UNRELATED = ('profile/firefox-17.0esr.tar', 'profile/firefox-10.0esr.tar')

sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()


def run(args):
    subprocess.run([str(x) for x in args], check=True, capture_output=True)


DOC = (
    '# EXE2 Rev 1 한국어 패치 V0.9.6\n\n'
    '원본 일본판 Rev 1 ROM에 BPS를 적용하세요. 이전 패치 ROM에는 덧씌우지 마세요.\n\n'
    '## 이번 수정\n\n'
    '주황색 전환 화살표의 글자를 모두 전용 7×6 픽셀 글리프로 바꿨습니다. '
    '이전에는 대사 폰트를 세로로 눌러 담아 획이 뭉개졌습니다.\n\n'
    '- 배낭 화살표: 눌러 담던 글자 대신 `케이스`\n'
    '- 칩 폴더 화살표: 눌러 담던 글자 대신 `데크`\n'
    '- `메`: 가지가 둘이라 `ㅖ`로 보이던 것을 `ㅔ`로 수정\n'
    '- `라`·`러`: 세로줄 위치를 바로잡아 `러이브려리`로 보이던 것을 `라이브러리`로 수정\n\n'
    '두 화살표의 낱말이 바뀐 것은 이 크기에 받침 있는 글자가 들어가지 않기 때문입니다. '
    '화면 위쪽의 큰 제목은 원래대로 `배낭`·`폴더`입니다.\n\n'
    '## 검증\n\n'
    '정적 무결성과 표 내용 검사를 통과했고, V0.9.5 대비 바뀐 바이트는 화살표 글자 타일 안에만 있습니다. '
    '네 화살표는 음소거 Mesen 화면에서 사람이 직접 읽어 확인했습니다.\n\n'
    '## 남은 것\n\n'
    'Android My Boy! 기기 확인과 전체 게임 QA는 아직입니다. 이메일 본문은 번역 범위 밖이라 일본어로 남아 있습니다. '
    '기존 미적용 번역 95개와 미번역 물리 후속 대사도 그대로입니다. 최종 배포판이 아닙니다.\n\n'
    'ROM과 저장 파일은 포함하지 않습니다. 새 ROM을 콜드 부팅하고 게임 내 일반 저장(.sav)을 쓰세요. '
    '이전 빌드의 상태 저장(.ss1/.ss2)은 화살표 타일이 올라간 VRAM까지 되살리므로 사용하지 마세요.\n'
)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--name', default='EXE2_Rev1_KR_V0.9.6_ArrowWords')
    parser.add_argument('--static-qa', type=Path, required=True)
    parser.add_argument('--content-qa', type=Path, required=True)
    parser.add_argument('--replace-generated', action='store_true')
    parser.add_argument('--version', default='V0.9.6-ArrowWords')
    parser.add_argument('--doc-file', type=Path)
    parser.add_argument('--success')
    parser.add_argument('--labels', help='comma separated labels a person read on screen')
    parser.add_argument('--runtime-kind', default='human_on_screen_reading',
                        help='who read the labels and how (recorded as-is in VERIFICATION.json)')
    parser.add_argument('--runtime-note', help='how the screens were reached, if not by normal play of this exact ROM')
    parser.add_argument('--receipt-status', default='PASS_ARROW_WORDS_PACKAGE')
    # A fixed report path silently overwrites the previous release's receipt,
    # so each package writes one named after itself unless told otherwise.
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    name = args.name
    if '/' in name or '\\' in name:
        raise ValueError('name must be a bare folder stem')

    if sha(SOURCE) != SOURCE_SHA:
        raise RuntimeError('Unexpected source ROM')
    if sha(FLIPS) != FLIPS_SHA:
        raise RuntimeError('Unexpected Floating IPS binary')
    candidate_sha = sha(args.candidate)

    static = json.loads(args.static_qa.read_text(encoding='utf-8'))
    content = json.loads(args.content_qa.read_text(encoding='utf-8'))
    if static['qa_status'] != 'PASS (bench)' or static['candidate']['sha256'] != candidate_sha:
        raise RuntimeError('Static QA does not cover this candidate')
    if content['status'] != 'PASS (bench)' or content['candidate_sha256'] != candidate_sha:
        raise RuntimeError('Content QA does not cover this candidate')

    destination = ROOT/'dist'/(name + '.zip')
    destination.parent.mkdir(exist_ok=True)
    if destination.exists() and not args.replace_generated:
        raise FileExistsError(destination)

    with tempfile.TemporaryDirectory(prefix='exe2-v096-', dir=ROOT/'analysis') as stage:
        stage = Path(stage)
        folder = stage/name
        (folder/'tools').mkdir(parents=True)
        for filename in ('APPLY_PATCH.cmd', 'apply_patch.ps1'):
            shutil.copy2(TEMPLATE/filename, folder/filename)
        shutil.copy2(FLIPS, folder/'tools/flips.exe')
        for filename in ('COPYING', 'COPYING.gpl3'):
            shutil.copy2(FLIPS.parent/filename, folder/'tools'/filename)
        with zipfile.ZipFile(FLIPS_SOURCE) as upstream, \
                zipfile.ZipFile(folder/'tools/flips-source-v198.zip', 'w',
                                zipfile.ZIP_DEFLATED, compresslevel=9) as sources:
            if upstream.testzip() is not None:
                raise RuntimeError('Upstream Flips source archive is damaged')
            for member in upstream.infolist():
                if member.filename.endswith(UNRELATED):
                    continue
                if member.filename.lower().endswith(('.gba', '.sav', '.ss1', '.ss2')):
                    raise RuntimeError('Upstream archive carries a ROM-like member')
                sources.writestr(member, upstream.read(member))

        patch = folder/(name + '.bps')
        run([FLIPS, '--create', '--bps', SOURCE, args.candidate, patch])
        applied = stage/'roundtrip.gba'
        run([FLIPS, '--apply', patch, SOURCE, applied])
        if applied.read_bytes() != args.candidate.read_bytes():
            raise RuntimeError('BPS round trip did not reproduce the candidate')

        claims = {'rom_included': False, 'save_included': False,
                  'myboy_device_verified': False, 'full_game_qa_complete': False,
                  'official_final_release': False}
        manifest = {
            'version': args.version, 'status': 'EMULATOR_VALIDATION_CANDIDATE',
            'source': {'filename': SOURCE.name, 'size': SOURCE.stat().st_size, 'sha256': SOURCE_SHA},
            'target': {'filename': name + '.gba', 'size': args.candidate.stat().st_size,
                       'sha256': candidate_sha},
            'patch': {'filename': patch.name, 'size': patch.stat().st_size,
                      'sha256': sha(patch), 'format': 'BPS'},
            'tool': {'name': 'Floating IPS', 'version': 'v198', 'sha256': FLIPS_SHA},
            'claims': claims,
            'messages': {'success': args.success or 'V0.9.6 화살표 글자 수정 패치 적용 완료.',
                         'note': '새 ROM을 완전히 다시 실행하고 게임 내 일반 저장을 사용하세요.'},
        }
        (folder/'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n',
                                            encoding='utf-8')
        doc = args.doc_file.read_text(encoding='utf-8') if args.doc_file else DOC
        (folder/'README.md').write_text(doc, encoding='utf-8')
        (folder/'INSTALL.md').write_text(
            doc + '\nWindows: APPLY_PATCH.cmd 에 원본 ROM을 끌어다 놓으세요. '
                  '다른 환경: BPS 지원 패치 도구를 사용하세요.\n', encoding='utf-8')
        receipt = {
            'status': args.receipt_status, 'candidate_sha256': candidate_sha,
            'claims': claims, 'bps_applied_byte_identical': True,
            'static_qa_sha256': sha(args.static_qa), 'content_qa_sha256': sha(args.content_qa),
            'runtime_evidence': {
                'kind': args.runtime_kind,
                'emulator': 'Mesen 2, muted',
                'labels_confirmed': args.labels.split(',') if args.labels else  ['케이스', '데크', '메', '라', '러'],
                'automated_menu_regression_run': False,
                **({'note': args.runtime_note} if args.runtime_note else {}),
            },
            'flips_source_filtered': True,
            'flips_source_excluded_members': list(UNRELATED),
        }
        (folder/'VERIFICATION.json').write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n',
                                                encoding='utf-8')

        members = sorted(p for p in folder.rglob('*') if p.is_file())
        with zipfile.ZipFile(destination, 'w', zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            for file in members:
                info = zipfile.ZipInfo(name + '/' + file.relative_to(folder).as_posix(),
                                       (2026, 9, 21, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                z.writestr(info, file.read_bytes())
        with zipfile.ZipFile(destination) as z:
            if z.testzip() is not None:
                raise RuntimeError('Packaged ZIP is damaged')
            if any(n.lower().endswith(('.gba', '.sav', '.mss', '.ss1', '.ss2')) for n in z.namelist()):
                raise RuntimeError('Package would ship a ROM or save')
            if z.read(name + '/' + patch.name) != patch.read_bytes():
                raise RuntimeError('Packaged patch does not match')
        receipt.update(package_path=str(destination.relative_to(ROOT)),
                       package_sha256=sha(destination), package_size=destination.stat().st_size,
                       patch_sha256=sha(patch), patch_size=patch.stat().st_size,
                       zip_integrity_verified=True, zip_rom_save_members_absent=True)

    report = args.report or ROOT/f'analysis/{name.lower()}_package_qa.json'
    if report.exists() and not args.replace_generated:
        raise FileExistsError(report)
    report.write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(receipt, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
