"""Package an explicitly non-final V0.9.4 emulator-validation BPS patch."""
import hashlib
import json
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
NAME='EXE2_Rev1_KR_V0.9.4_MenuTextFix'
TARGET=ROOT/'poc/output/exe2_rev1_kr_v0_9_4_menu_textfix.gba'
SOURCE=ROOT/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba'
SOURCE_SHA='1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8'
FLIPS_SHA='ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()


def run(args):
    subprocess.run([str(x) for x in args],check=True,capture_output=True)


def main():
    assert sha(SOURCE)==SOURCE_SHA
    candidate_sha=sha(TARGET)
    static=ROOT/'analysis/exe2_rev1_menu_textfix_static_qa.json'
    content=ROOT/'analysis/exe2_rev1_menu_textfix_content_qa.json'
    runtime=ROOT/'analysis/exe2_rev1_menu_textfix_runtime_review.json'
    static_data=json.loads(static.read_text(encoding='utf-8'))
    content_data=json.loads(content.read_text(encoding='utf-8'))
    runtime_data=json.loads(runtime.read_text(encoding='utf-8'))
    assert static_data['qa_status']=='PASS (bench)' and static_data['candidate']['sha256']==candidate_sha
    assert content_data['status']=='PASS (bench)' and content_data['candidate_sha256']==candidate_sha
    assert runtime_data['status']=='PASS_SCOPED_MENU_REGRESSION' and runtime_data['candidate_sha256']==candidate_sha
    for item in runtime_data['evidence']:
        assert sha(ROOT/item['path'])==item['sha256']
    flips=ROOT/'external/Flips-v198/windows/flips.exe'
    assert sha(flips)==FLIPS_SHA
    target=ROOT/'dist'/(NAME+'.zip')
    if target.exists(): raise FileExistsError(target)
    stage=Path(tempfile.mkdtemp(prefix='exe2-v094-package-',dir=ROOT/'analysis'))
    folder=stage/NAME
    (folder/'tools').mkdir(parents=True)
    for filename in ('APPLY_PATCH.cmd','apply_patch.ps1'):
        shutil.copy2(ROOT/'tools/diagnostic_package'/filename,folder/filename)
    shutil.copy2(flips,folder/'tools/flips.exe')
    for filename in ('COPYING','COPYING.gpl3'):
        shutil.copy2(flips.parent/filename,folder/'tools'/filename)
    with zipfile.ZipFile(ROOT/'dist/EXE2_Rev1_KR_V0.9.zip') as old:
        (folder/'tools/flips-source-v198.zip').write_bytes(old.read('EXE2_Rev1_KR_V0.9/tools/flips-source-v198.zip'))
    patch=folder/(NAME+'.bps')
    run([flips,'--create','--bps',SOURCE,TARGET,patch])
    applied=stage/'roundtrip.gba'
    run([flips,'--apply',patch,SOURCE,applied])
    assert applied.read_bytes()==TARGET.read_bytes()
    claims={'rom_included':False,'save_included':False,'myboy_device_verified':False,
            'full_game_qa_complete':False,'official_final_release':False}
    manifest={'version':'V0.9.4-MenuTextFix','status':'EMULATOR_VALIDATION_CANDIDATE',
              'source':{'filename':SOURCE.name,'size':SOURCE.stat().st_size,'sha256':SOURCE_SHA},
              'target':{'filename':NAME+'.gba','size':TARGET.stat().st_size,'sha256':candidate_sha},
              'patch':{'filename':patch.name,'size':patch.stat().st_size,'sha256':sha(patch),'format':'BPS'},
              'tool':{'name':'Floating IPS','version':'v198','sha256':FLIPS_SHA},'claims':claims,
              'messages':{'success':'V0.9.4 메뉴·칩 설명 수정 패치 적용 완료.',
                          'note':'새 ROM을 완전히 다시 실행하고 게임 내 일반 저장을 사용하세요.'}}
    (folder/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    text='# EXE2 Rev 1 한국어 패치 V0.9.4 메뉴·설명 수정\n\n'+(
        '원본 일본판 Rev 1 ROM에 BPS를 적용하세요. 이전 패치 ROM에는 덧씌우지 마세요.\n\n'
        '칩 설명 255개의 일본어 본문 중복 제거와 10칸×3줄 배치 검사를 적용했습니다. '
        '하위 메뉴 제목, 폴더 편집·배낭·P.A 메모 화면, 전환 화살표 및 통신 고정 문구를 한글화했습니다. '
        '시간과 칩 개수의 숫자 제어값은 원본 그대로 보존합니다.\n\n'
        'ROM과 저장 파일은 포함하지 않습니다. Android My Boy!에서는 새 ROM을 콜드 부팅하고 '
        '새 ROM 이름에 맞춘 일반 게임 저장(.sav)을 사용하세요. 이전 상태 저장은 사용하지 마세요.\n\n'
        '음소거 Mesen의 한정 메뉴 경로 검증본이며 Android My Boy! 기기 확인본이나 최종 배포판은 아닙니다. '
        '일부 영어 표기(rockman.exe, ATTACK 등)는 유지했습니다. 기존 미적용 번역 95개 및 미번역 물리 후속 대사 등 '
        '전체 게임의 번역·품질 검토는 아직 남아 있습니다.\n')
    (folder/'README.md').write_text(text,encoding='utf-8')
    (folder/'INSTALL.md').write_text(text+'\nWindows: APPLY_PATCH.cmd 실행 후 원본 ROM 선택. 다른 환경: BPS 지원 패치 도구를 사용하세요.\n',encoding='utf-8')
    receipt={'status':'PASS_SCOPED_VALIDATION_PACKAGE','candidate_sha256':candidate_sha,'claims':claims,
             'bps_applied_byte_identical':True,'static_qa_sha256':sha(static),
             'content_qa_sha256':sha(content),'runtime_review_sha256':sha(runtime)}
    (folder/'VERIFICATION.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED,compresslevel=9) as z:
        for file in sorted(folder.rglob('*')):
            if file.is_file():
                info=zipfile.ZipInfo(NAME+'/'+file.relative_to(folder).as_posix(),(2026,9,14,0,0,0))
                info.compress_type=zipfile.ZIP_DEFLATED
                info.external_attr=0o100644<<16
                z.writestr(info,file.read_bytes())
    with zipfile.ZipFile(target) as z:
        assert z.testzip() is None
        assert not any(n.lower().endswith(('.gba','.sav','.mss','.ss1','.ss2')) for n in z.namelist())
        assert z.read(NAME+'/'+patch.name)==patch.read_bytes()
    receipt.update(package_path=str(target.relative_to(ROOT)),package_sha256=sha(target),
                   patch_sha256=sha(patch),zip_integrity_verified=True,zip_rom_save_members_absent=True)
    (ROOT/'analysis/exe2_rev1_menu_textfix_package_qa.json').write_text(json.dumps(receipt,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(receipt))


if __name__=='__main__':main()
