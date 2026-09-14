"""Build the V0.9.3 static-submenu BPS package."""
import hashlib, json, shutil, subprocess, tempfile, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NAME = "EXE2_Rev1_KR_V0.9.3_SubmenuFix"
SOURCE_SHA = "1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8"
TARGET = ROOT / "poc/output/exe2_rev1_kr_v0_9_3_submenu.gba"
MANIFEST = TARGET.with_name(TARGET.stem + "_manifest.json")
FLIPS_SHA = "ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd"
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()

def run(cmd):
    result = subprocess.run([str(x) for x in cmd], capture_output=True)
    if result.returncode:
        raise RuntimeError((result.stdout + result.stderr).decode(errors="replace")[-3000:])

def write_zip(folder, target):
    with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for file in sorted(folder.rglob("*")):
            if file.is_file():
                info = zipfile.ZipInfo(NAME + "/" + file.relative_to(folder).as_posix(), (2026, 9, 13, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                archive.writestr(info, file.read_bytes())

def main():
    assert sha(ROOT / "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba") == SOURCE_SHA
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    assert sha(TARGET) == manifest["output"]["sha256"]
    qa = ROOT / "analysis/exe2_rev1_submenu_static_qa.json"
    assert json.loads(qa.read_text(encoding="utf-8"))["qa_status"] == "PASS (bench)"
    runtime_root = ROOT / "analysis/pet_layout_menu_fix_v093"
    segments = []
    for name in ("013_from_seed", "014_folder_subchip", "015_folder", "016_library", "017_rockman", "018_email", "019_keyitems", "020_comm", "021_save"):
        result = json.loads((runtime_root / name / "result.json").read_text(encoding="utf-8"))
        assert result["rom_sha256"] == sha(TARGET) and result["completed"] and not result["audio_enabled"]
        segments.append(str((runtime_root / name).relative_to(ROOT)))
    flips = ROOT / "external/Flips-v198/windows/flips.exe"
    assert sha(flips) == FLIPS_SHA
    stage = Path(tempfile.mkdtemp(prefix="exe2-submenu-package-", dir=ROOT / "analysis"))
    folder = stage / NAME
    (folder / "tools").mkdir(parents=True)
    for filename in ("APPLY_PATCH.cmd", "apply_patch.ps1"):
        shutil.copy2(ROOT / "tools/diagnostic_package" / filename, folder / filename)
    (folder / "INSTALL.md").write_text(
        "# EXE2 Rev 1 한국어 패치 V0.9.3\n\n"
        "원본 Rev 1 ROM에 동봉된 BPS를 적용하세요. 칩 폴더·서브칩·데이터 라이브러리의 칩 이름/설명과 록맨·이메일·키 아이템·통신·저장 문구를 확장 ROM 테이블로 번역했습니다.\n\n"
        "일부 하위 화면의 상단 제목 그래픽과 통신 화면의 고정 라벨은 별도 타일맵 자산이라 일본어/영어로 남을 수 있습니다. 이 패키지는 정적 본문·이름·설명 번역 후보이며 Android My Boy! 실기 확인본이 아닙니다.\n\n"
        "My Boy!에서는 패치 후 새 ROM을 콜드 부팅하고, 기존 상태 저장이 아닌 새 ROM 파일명에 맞는 일반 저장을 사용하세요. 이 패키지는 ROM과 저장 파일을 포함하지 않습니다.\n",
        encoding="utf-8")
    shutil.copy2(flips, folder / "tools/flips.exe")
    for filename in ("COPYING", "COPYING.gpl3"):
        shutil.copy2(flips.parent / filename, folder / "tools" / filename)
    with zipfile.ZipFile(ROOT / "dist/EXE2_Rev1_KR_V0.9.zip") as archive:
        (folder / "tools/flips-source-v198.zip").write_bytes(archive.read("EXE2_Rev1_KR_V0.9/tools/flips-source-v198.zip"))
    patch = folder / (NAME + ".bps")
    run([flips, "--create", "--bps", ROOT / "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba", TARGET, patch])
    receipt = {
        "status": "PASS_SUBMENU_PATCH_PACKAGE", "source_sha256": SOURCE_SHA,
        "target_sha256": sha(TARGET), "patch_sha256": sha(patch),
        "static_qa": str(qa.relative_to(ROOT)), "runtime_segments": segments,
        "audio_enabled": False,
        "claims": {"rom_included": False, "save_included": False, "myboy_device_verified": False, "full_game_qa_complete": False, "official_final_release": False},
    }
    (folder / "VERIFICATION.json").write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (folder / "manifest.json").write_text(json.dumps({
        "version": "V0.9.3-SubmenuFix", "status": "EMULATOR_VALIDATION_CANDIDATE",
        "source": {"filename": "Battle Network Rockman EXE 2 (Japan) (Rev 1).gba", "size": 8388608, "sha256": SOURCE_SHA},
        "target": {"filename": NAME + ".gba", "size": TARGET.stat().st_size, "sha256": sha(TARGET)},
        "patch": {"filename": NAME + ".bps", "size": patch.stat().st_size, "sha256": sha(patch), "format": "BPS"},
        "tool": {"name": "Floating IPS", "version": "v198", "sha256": FLIPS_SHA},
        "messages": {"success": "EXE2 Rev 1 V0.9.3 하위 메뉴 번역 패치 적용 완료.", "note": "My Boy!에서는 새 ROM을 콜드 부팅하고 일반 저장을 사용하세요."},
        "claims": receipt["claims"],
    }, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (folder / "README.md").write_text(
        "# EXE2 Rev 1 한국어 패치 V0.9.3 하위 메뉴 수정\n\n"
        "원본 Rev 1 ROM에 BPS를 적용하세요. 칩 폴더/서브칩/데이터 라이브러리의 이름과 설명, 록맨·이메일·키 아이템·통신·저장 화면의 문구를 포함합니다. 상단 제목 그래픽과 일부 통신 고정 라벨은 별도 자산이라 원문이 남을 수 있습니다. ROM과 저장 파일은 포함하지 않습니다.\n",
        encoding="utf-8")
    target = ROOT / "dist" / (NAME + ".zip")
    if target.exists(): raise FileExistsError(target)
    write_zip(folder, target)
    print(json.dumps({"package": str(target), "sha256": sha(target), "size": target.stat().st_size, "patch_sha256": sha(patch)}, ensure_ascii=False))

if __name__ == "__main__":
    main()
