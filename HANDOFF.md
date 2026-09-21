# Handoff

## [2026-09-22] [runtime-fix] [V0.9.9]

- 사용자가 LDPlayer + My Boy! 로 "학교 퇴장 블랙아웃"을 재현했다. ADB 로 그 세이브스테이트를 꺼내 멈춘 순간의 상태를 떴다. My Boy! 스테이트는 gzip + `GBASTATE` 헤더이고 레지스터는 오프셋 32부터 빅엔디안 r0..r15 + CPSR(96), IWRAM 은 파일 오프셋 0xB8, EWRAM 은 0x80B8 이다.
- 멈춘 지점은 `PC=0x03006800`, IWRAM 의 스프라이트 파트 순회 루프(`ldrb r3,[r2]` / `cmp r3,#0xFF` / `adds r2,#5`). `r2=0xFCC4B943` 로 종료자를 영영 못 만난다. 화면은 검고 소리는 IRQ 로 계속 난다.
- 엉뚱한 포인터의 출처는 엔티티 `[ent+0x1C]`·`[ent+0x20]` 이고, 그 자리(`0x0203CEA8`)에는 스프라이트 헤더 대신 `e7 f3 04 18 ... f9 fc f3 08` — 우리 한글 텍스트가 들어 있었다.
- 원인: 맵 로드가 스프라이트 블록을 `0x0203C000` 부터 사슬로 풀고 그 맵의 대사 아카이브를 `0x02038800` 에 푼다. 대사 아카이브 예산은 그 사이 14,336 B 다. 원본 382 개 중 초과는 0 개(최대 13,408)인데 한글이 4바이트/자라 번역본 6 개가 넘었다: `00/394` 27,573 / `00/13` 25,068 / `00/131` 17,976 / `00/11` 16,880 / `00/22` 14,926 / `00/31` 14,602.
- **Mesen 은 이 결함을 가린다.** 같은 덮어쓰기가 일어나지만 매핑 안 된 주소 읽기가 루프를 끝내 줘서 게임이 계속 간다. 같은 세이브·같은 자리에서 원본 일본판은 My Boy! 에서도 멀쩡히 통과하고 v0.9.7·v0.9.8 은 멈춘다. 판정은 My Boy! 로만 가능하다.
- 해결: 맵 대사 아카이브를 ROM 상주로 바꿨다(`tools/dialogue_rom_residency.py`). 그 버퍼를 지목하는 명령은 ROM 전체에 3 개뿐이고, 그중 `0x0E594C` 는 아카이브 베이스가 아니라 같은 구역을 그래픽 스크래치로 쓰는 경로라 건드리지 않았다. 나머지 둘을 `bx` 스텁으로 바꿨다(`bl` 은 사거리 ±4 MB 라 확장영역까지 못 간다): `0x20AEE` 는 포인터만 `0x0203BFFC` 에 기록하고 함수를 끝내고, `0x20B0C` 는 그 슬롯을 역참조해 `0x20B60` 을 호출한다.
- 대상은 세 area 표와 직접 리터럴 `0x20B04` 로 닿는 151 개이며 전부 포인터가 1 개씩이라 다른 경로와 겹치지 않는다. 무압축이라 자리가 더 필요해 `ARCHIVE_RELOCATION_BASE` 를 0x870000 -> 0x960000 으로 올렸다. EWRAM 예산 게이트는 비상주 아카이브에만 남는다.
- 결과: `poc/output/exe2_rev1_kr_v0_9_9_romresident.gba`, SHA-256 `876d798c765000784304d38e6e444d672a2d1364a96ab4ad2585ff4a0299f851`. 정적 QA·내용 QA 모두 `PASS (bench)`.
- 검증: My Boy! 에서 같은 배터리 세이브로 학교 퇴장, 바깥 맵 연속 전환, PET 메뉴, 이메일 목록·본문까지 정상. Mesen 로그에서 학교-바깥 4 회 왕복 동안 `0x02038800` 목적지 해제 0 건.
- 증거: `analysis/exe2_rev1_v0_9_9_romresident_static_qa.json`, `analysis/exe2_rev1_v0_9_9_romresident_content_qa.json`, `analysis/exe2_rev1_kr_v0.9.9_freezefix_package_qa.json`, `analysis/exe2_rev1_xdelta_exe2_rev1_kr_v0.9.9_freezefix_qa.json`.
- 공개된 V0.9.4~V0.9.8 은 모두 이 결함을 갖고 있다. 처리 방침 미정.

## [2026-09-22] [github-publication] [v0.9.8]

- V0.9.8 프리릴리스 게시 완료: https://github.com/Einbroch/rockman-exe2-kr-patch/releases/tag/v0.9.8 (release ID 393099149). 대상 커밋은 `6ad41c4de610b923bb9b8e896f2520051e758fd0`이며 소스 변경도 같은 커밋으로 main 에 푸시했다.
- 자산은 BPS ZIP 947,695 B(`8587b08b...`)와 xdelta 391,386 B(`83f4d7d9...`) 둘뿐이다. 서버가 보고한 크기와 SHA-256 다이제스트가 로컬 및 QA 영수증과 일치하는 것을 확인했고, 게시 뒤 draft=false/prerelease=true 를 다시 확인했다. ROM/저장 파일은 올리지 않았다.
- 노트에 V0.9.7 문서의 오류를 정정했다. 이메일 본문 아카이브가 `0x7E3000`이고 포인터가 없다고 적었던 것은 압축 스트림을 경계표로 오독한 결과이며, 실제로는 목록 `0x7E2F40`·본문 `0x7E3420`에 각각 정렬 포인터가 하나씩 있다.
- 노트에 명시한 제한: My Boy! 기기 미확인, 전체 게임 QA 미완, 본문 해제 크기 2배 증가에 따른 EWRAM 관찰이 전수가 아님, 학교 퇴장 블랙아웃 미재현, 초안 번역, `00/357` 95개 미적용.
- 영수증: `analysis/github_release_v098_publication.json`. 노트 원본: `analysis/github_release_v098_notes.md`.
- 기존 V0.9.4~V0.9.7 릴리스는 건드리지 않았다.

## [2026-09-22] [mail-translation] [V0.9.8]

- 이메일 목록과 본문을 모두 한글화했다. 두 아카이브다: 목록 LZ77 `0x7E2F40` -> EWRAM `0x02023000` (포인터 `ref@0x0283D0`, 명령셋 `mmbn2s`), 본문 LZ77 `0x7E3420` -> EWRAM `0x02027000` (포인터 `ref@0x0283D8`, 명령셋 `mmbn2`). 두 포인터는 `0x0283C8` 리터럴 풀에 나란히 있고 같은 프레임에 함께 풀린다.
- 각 아카이브의 실제 내용은 36건이고 나머지 91칸은 게임이 쓰지 않는 `MAILxx` 플레이스홀더라 원문 그대로 뒀다. 조판은 원문 실측 21칸 3줄. 용어·말투는 기존 번역 표본에서 맞췄다.
- 중간 빌드에서 이메일 진입 시 프리징이 재현됐다. 원인은 목록 아카이브 해제본 3,247 B 중 표가 선언한 3,246 뒤의 1바이트를 압축 패딩으로 판정해 잘라낸 것이다. 그 바이트는 `E7`이고 표의 마지막 칸이 가리키는 빈 줄 엔트리로, 목록 화면이 빈 행마다 인덱스 127로 선택한다. 잘린 빌드에서는 라벨 렌더러(IWRAM `0x03006DC8`)가 종료 바이트를 못 찾고 EWRAM을 무한히 훑었다. 타일 목적지 r2가 프레임당 0x8C00씩 오르는 것으로 확인했다.
- 정적 게이트가 못 잡은 이유는 공유 규칙이 `values[-1] == len(raw)`여서 잘라낸 쪽이 오히려 통과하기 때문이다. 빌더의 `find_raw_physical_continuations`에 압축 분기를 넣어 꼬리를 `compress(rebuilt + continuation)`로 되붙이고, 검증기도 raw와 같은 방식으로 코어/꼬리를 쪼개 대조하게 했다. 본문 아카이브에도 같은 성격의 꼬리 `EA FF 00 00`(`waitHold`, `ends = always`)가 있었고 새 검사가 잡아내 함께 보존했다. 알려진 종료 형태(`E7`, `EA FF 00 00`) 외의 바이트는 빌드를 멈춘다.
- 한글이 4바이트/자라 본문 해제 크기가 8,391 -> 16,452 B로 늘었다. 목적지 다음 알려진 할당은 `0x02033000`이다. 새로 덮어쓰는 `0x020290C8`~`0x0202B0FF`를 실측한 결과 쓰는 주체는 부팅 제로필 둘(BIOS `0xC08`, ROM `0x080001CC`)뿐이고 읽는 코드는 0건이었다. 확인한 경로에 한한 관찰이며 전수 조사는 아니다.
- 결과: `poc/output/exe2_rev1_kr_v0_9_8_mailbody.gba`, SHA-256 `ded18fb321b39fa8d6451e6918b5579d8e5f4314f07becf7613a20298281e005`. 번역 엔트리 7,861개, 아카이브 383개. 정적 QA·내용 QA 모두 `PASS (bench)`.
- 런타임: 음소거 Mesen 2에서 이메일 진입 -> 목록 -> 본문 1·2페이지 -> 빠져나오기까지 멈춤 없음. 프리징 빌드와 수정 빌드를 같은 조작으로 대조했다. 진단기는 `tools/probe_mail_screen_freeze.py`(LZ77 목적지·길이, 프레임별 PC, 렌더러가 먹는 바이트 전량, 메모리 영역 접근 주체).
- `tools/package_arrow_words_v096.py`가 영수증 경로를 고정하고 있어 이전 판 영수증을 덮어썼다. 이름 기준 경로로 바꾸고 기존 파일을 복구했다.
- 증거: `analysis/exe2_rev1_v0_9_8_mailbody_static_qa.json`, `analysis/exe2_rev1_v0_9_8_mailbody_content_qa.json`, `analysis/exe2_rev1_kr_v0.9.8_mail_package_qa.json`, `analysis/exe2_rev1_xdelta_exe2_rev1_kr_v0.9.8_mail_qa.json`.
- 남은 것: My Boy! 기기 확인, 전체 게임 QA, 학교 퇴장 블랙아웃 미재현, `00/357` 95개 미적용.

## [2026-09-15] [github-publication] [v0.9.5]

- 사용자 지정 저장소에 V0.9.5 프리릴리스 게시 완료: https://github.com/Einbroch/rockman-exe2-kr-patch/releases/tag/v0.9.5 (release ID 388514878).
- 검증된 UiFit BPS ZIP과 xdelta 2개만 업로드했다. 서버가 보고한 파일 크기·SHA-256이 로컬 및 기존 QA와 일치하며, 게시 뒤 draft=false/prerelease=true를 다시 확인했다. 기존 V0.9.4 릴리스는 수정하지 않았다.
- 사용자 요청 범위를 배포 파일 게시로 유지했다. 로컬 변경을 커밋·푸시하지 않았으며 v0.9.5 태그 대상은 당시 원격 main `532154e86044d79e3a664572ea8789a0246c0af6`이다. 자동 생성 Source code 압축 파일은 V0.9.5 빌드 소스 묶음이 아니라는 사실을 릴리스 노트에 명시했다.
- ROM/저장 파일을 업로드하지 않았다. 42.6 MiB ZIP은 기존 검증 파일 그대로이며, 크기 대부분은 동봉 Floating IPS 소스의 공개 Firefox 성능 시험 자료 2개다. 내부 ZIP/TAR까지 ROM/게임 저장 파일명을 확인했다.
- 노트: `analysis/github_release_v095_notes.md`. 게시 영수증: `analysis/github_release_v095_publication.json`. My Boy! 기기 직접 검증, 전체 게임 QA, 초안 번역 등의 제한은 공개 노트에 유지했다.

## [2026-09-15] [distribution-format] [V0.9.5-xdelta]

- 사용자 요청으로 `dist/EXE2_Rev1_KR_V0.9.5_UiFit.xdelta` 추가. 크기 383,731바이트, SHA-256 `751c92b657628ba8a727108afc177b6a855cb98343700cc9d3a7a65c18409e8a`.
- 기존 불변 원본 Rev 1에서 검증된 UiFit ROM SHA `d204f74cc5ccf542c3caa4b5afb9c52e35ebe6369835608a4ab968d83efbcee4`를 만드는 대체 차분 형식이다. 기존 BPS/ZIP/ROM은 변경하지 않았다.
- `tools/build_xdelta_patch.py`에 기대 대상 SHA 검증과 도구 SHA 기록, 실제 비정상 종료에만 wrong-source rejection 판정을 추가했다. 두 번 생성한 차분이 동일하고, 원본에 디코딩한 전체 ROM이 검증 후보와 바이트 동일하다. 패치된 ROM을 입력한 부정 시험은 디코더가 거부했다.
- 증거: `analysis/exe2_rev1_xdelta_exe2_rev1_kr_v0.9.5_uifit_qa.json`. 적용 입력은 패치 전 원본이며 BPS와 xdelta를 중복 적용하지 않는다. 동일 결과에 기존 UiFit 런타임 증거를 사용하며 새 기기 지원/전체 게임 검증을 주장하지 않는다.

## [2026-09-15] [ui-fit] [V0.9.5-UiFit]

- 사용자 `shots/57.png`, `58.png`, `59.png`: 두 화살표의 작은 글자가 아래 경계에 붙으며 원문 점이 남고, 저장 항목 마지막 ‘리’가 빠짐. V0.9.4의 정상 판정은 이 세부 표시 결함을 놓쳤으며 해당 부분을 재개방해 수정했다.
- 최신 ROM: `poc/output/exe2_rev1_kr_v0_9_5_ui_fit.gba`, SHA-256 `d204f74cc5ccf542c3caa4b5afb9c52e35ebe6369835608a4ab968d83efbcee4`.
- BPS ZIP: `dist/EXE2_Rev1_KR_V0.9.5_UiFit.zip`, SHA-256 `e30716922ee99b74668dda8ce32fd1ea460df621dbfe5622e8a8a2f2ffee375a`. BPS SHA-256 `0ff66a7aad5c9fbeb00f783bab4c024532fd872f1454ee4eaa30d06917a09451`. 적용 결과가 후보 전체 바이트와 일치하며 ROM/저장 파일은 ZIP에 없다.
- 화살표 원인: 8×16 폰트를 단순 압축해 행 1..6/7에 그렸고, 원래 작은 글자 행 0과 그림자 팔레트 7을 지우지 않았다. 원래 P.A와 작은 일본어 글자는 행 0..5에 잉크, 6행에 주황색 여백, 7행에 바깥 경계가 있다. `arrow_small_font.py`에 직접 작성한 7×6 글자를 사용하고 팔레트 7/15의 원문 잉크·그림자를 전부 지운다. 나머지 경계 픽셀은 동일하다. ROM 변경 타일은 48/49/50..55(16진)뿐이다.
- 저장 원인: 함수 0802A3EC의 0802A3FA `movs r4,#8`로 UI 64..67을 8칸씩 렌더링하고 RAM/VRAM 행간은 0x200 바이트다. 65번 문자열 ‘데이터 라이브러리’는 공백 포함 9칸이라 마지막 ‘리’가 다음 행 버퍼에 들어가 사라졌다. 이 항목만 ‘데이터라이브러리’로 표기한다고 사용자에게 알리고 8음절 전체를 보존했다. 렌더러/VRAM 구조는 건드리지 않았다.
- 검사: `verify_submenu_rendering_content.py`에 65번 엔트리 정확한 8음절 바이트 검사 추가. `verify_ui_fit_regression.py`는 양쪽 화살표의 실제 VRAM 마스크·그림자 제거·하단 여백과 마지막 ‘리’가 VRAM 4200+7×64에 원본 폰트 바이트 그대로 존재함을 검사한다. V0.9.4 대비 차이는 작은 타일 8개와 shared UI 테이블(65번만 본문 변경, 뒤 offset 이동)에 한정되며 다른 ROM 차이는 0개다.
- 런타임: `analysis/arrow_save_v095/verified`에서 음소거 Mesen 15개 구간 및 화면 14장 확인. `*_comparison.png` 3장은 원본 크롭을 정수배 nearest-neighbor로 확대하여 이전/현재를 비교한 QA 그림이다. 게임 화면을 수정해 테스트 성공으로 꾸민 것이 아니며 원시 캡처도 보존했다. 작은 메모/라이브러리 글자와 저장 마지막 ‘리’가 정상이다.
- 기록: `analysis/exe2_rev1_ui_fit_static_qa.json`, `..._content_qa.json`, `..._runtime_review.json`, `..._regression_qa.json`, `..._package_qa.json`. 도구 소스 ZIP은 제거 가능한 과거 배포본 대신 고정 의존성 `external/Flips-v198/flips-source-v198.zip`에서 읽고 SHA-256을 검사하도록 수정했다.
- 재개: `analysis/arrow_save_v095/verified/014_after_save_boot/checkpoint.mss`는 새 ROM으로 일반 저장을 부팅한 뒤 PET 메뉴 상태다. 일반 저장 백업 `analysis/arrow_save_v095/verified/battery_verified.sav`. 사용자 원래 저장은 변경하지 않았다. 초기 메뉴 진단은 이전과 같이 명시된 cross-ROM seed이며 자연 진행 증거와 구분한다.
- `v0_9_5_arrow_save_fix.gba` SHA `cdc6eeb549490ea13c9cc01973cd6c64519e5d070fe5e5fe41cb5cdc70339112`는 글자 기준선 정렬 전의 중간 후보이고 배포하지 않았다. 최종 확인에는 UiFit만 사용한다. Android My Boy! 기기 직접 검증·전체 게임 QA·기존 미적용/미번역 범위는 미완료 상태를 유지한다.

## [2026-09-14] [submenu-text-and-graphics] [V0.9.4-MenuTextFix]

- 최신 사용 후보: `poc/output/exe2_rev1_kr_v0_9_4_menu_textfix.gba`, SHA-256 `fabedaeebd9eca549eda7137fb72ea4341dcfdd3194904f58e31c8bb12f66d2f`.
- 확인용 BPS 패키지: `dist/EXE2_Rev1_KR_V0.9.4_MenuTextFix.zip`, SHA-256 `96ed6506a450db0f99db6f7f546b9441d3c749b85e8ca718d77fccac8dea378b`; BPS SHA-256 `12d234fb32cd92e0558d80521b9838dbe6c93ac5a577eb2994108978873945f3`. 원본에서 적용한 전체 바이트가 후보와 일치하며 ZIP에 ROM/저장은 없다. 최종 배포판이 아닌 범위 한정 에뮬레이터 검증 후보다.
- 사용자 `shots/56.png` 재현 원인: `static_submenu_tables.py`가 원본 일본어 설명 뒤에 한국어를 덧붙였다. 설명 255개의 렌더러 제어 뼈대만 유지하고 본문을 교체했다. 별도 바이트 디코더가 일본어 본문 0개와 모든 설명의 10칸×3줄 한계를 검사한다. 과거 V0.9.3의 런타임 완료/정적 일치는 이 시각적 결함의 부재를 증명하지 못했으며, 기존 기록의 설명 정상 표시 주장은 철회한다.
- 제어값 추가 수정: shared UI의 숫자용 E9 3바이트 필드는 일본어/문장부호로 디코드돼 너비 값 C2/86 등이 번역되었다. 13개 숫자 문자열에서는 해당 필드를 원본 바이트로 보존한다. 시간 00:03 및 개수 30장/11/250을 실제 화면에서 확인했다.
- 그래픽: `submenu_title_graphics.py`가 공통 은행 ROM 7DA0DC→950000을 계획하고 loader literal 25F70/25F78을 수정한다. VRAM 06000020..06003400에 54개 타일을 추가하며, 다음 독립 업로드 06003400과 겹치지 않는다. 58개 생성 타일 중 4개는 교체된 배낭 제목만 사용하던 기존 슬롯을 재사용한다. 원본 타일 참조와 편집 영역 밖 바이트를 검증한다.
- 한글화 범위: 칩 폴더·서브칩·데이터 라이브러리·이메일·키 아이템·통신·저장 제목, 폴더 편집/배낭/P.A 메모 제목 및 전환 화살표, 통신 보유 칩/전적/장/승/패. 록맨 화면의 기존 영어 rockman.exe/ATTACK/RAPID/CHARGE는 유지한다.
- 런타임에서 발견 후 수정한 회귀: 통신 숫자 BG2의 배경 스트립이 16픽셀 한글 라벨 아래쪽을 덮었다. 라벨은 y=3..4/7..8로 배치하고 숫자 y=5..6/9..10과 분리했다. 8개 하위 화면의 실제 VRAM 은행이 최종 ROM과 모두 바이트 일치한다.
- 검증: `analysis/exe2_rev1_menu_textfix_static_qa.json`, `..._content_qa.json`, `..._runtime_review.json`, `..._package_qa.json`. `analysis/submenu_v094_verified`의 음소거 Mesen 정상 입력 15개 구간 및 실제 화면 14장 검토. 255개 설명 전체는 정적 검사이며 실제 본문 관찰은 캐논/샷건 등 경로에 한정된다. Android My Boy! 기기를 직접 실행한 증거는 없다.
- 초기 메뉴 진입은 V0.9.2의 정확한 체크포인트를 `--cross-rom-seed`로 명시한 진단 경로이다. 구 상태를 새 ROM 소유로 속이지 않는다. 이후 새 후보 고유 일반 저장을 생성하고 014 구간에서 새 프로세스 부팅→이어하기→PET 메뉴를 확인했다. 저장 백업 `analysis/submenu_v094_verified/battery_verified.sav`; 원래 사용자 저장은 변경하지 않았다.
- 정확한 재개점: `analysis/submenu_v094_verified/014_after_save_boot/checkpoint.mss` (최신 ROM에서 일반 저장으로 부팅한 PET 메뉴). `tools/run_natural_play_segment.py --load`는 ROM/에뮬레이터/상태 해시를 확인한다. `tools/test_submenu_v094.py --rom ... --out 새폴더`로 재현 가능하다.
- `v0_9_4_submenu_fix`, `v0_9_4_submenu_final`, `v0_9_4_submenu`와 `analysis/submenu_v094_final`, `analysis/submenu_v094_layout`은 중간 진단 결과다. 최신 검증 후보로 사용하지 않는다. 기존 미적용 00/357의 95개, 미번역 물리 후속 159개, 전체 번역 품질/플레이 QA는 여전히 남아 있다.

## [2026-09-10] [natural-play-qa] [00-164-tail-fix]
- 사용자 요청: 음소거한 에뮬레이터로 혼자 플레이하며 중간 저장, 이상 발견 시 저장·수정 후 재개. 9월 10일 중단 지점부터 계속 진행했다.
- 현재 실행 후보: `poc/output/exe2_rev1_semantic_translation_playtest_fix_v2.gba`, SHA-256 `a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a`. 기본 `RUN_MGBA_CLEAN_MUTED.cmd`가 호출하는 PowerShell의 경로·해시도 갱신했다. 아직 전체 게임 통과나 최종 배포판이 아니다.
- 테스트 방법: `tools/run_natural_play_segment.py`가 Mesen `--testRunner --noAudio`로 정상 컨트롤러 입력만 재생한다. 게임 RAM/대사/위치/플래그 주입은 없다. CPU 실행 콜백에서 완전한 상태를 저장·복구하며 ROM·에뮬레이터·체크포인트 해시를 검사한다. 짧은 버튼 입력은 상태 로드 경계의 누락을 피하도록 6프레임을 쓴다.
- 연결 문제: 구형 emucap-control은 host API 1/2 불일치, 신형 emucap은 한글 경로의 non-UTF-8 NDJSON handshake로 실패했다. 실패한 시작 프로세스는 종료된 상태였다. 기존에 검증한 독립 CLI 테스트 경로를 사용했으며 연결 실패를 게임 충돌로 기록하지 않았다.
- 자연 플레이: 새 게임→오프닝→교실, 과거 `00/163/8` 충돌 후속 대사·필드 복귀, L 버튼 3줄 안내, 메일 대화, 책장 소년 PET 선택창의 양쪽 선택 및 B 취소, 데카오→선생님 등장→종업식 이벤트를 진행했다. 메뉴·저장 프롬프트는 여전히 일본어다.
- 발견/수정: `analysis/playtest_20260909/033_after_class/step_002.png`에서 정식 엔트리 16 뒤 `00/164` 물리 후속 entry17의 `熱斗くん、やっぱりー・・・`를 확인했다. 불변 원본 `0x77A7F8`의 24바이트와 보호 TPL을 검증하고 `translations/physical_continuation_00_164.tpl`에 `넷토、 역시...`를 추가했다. 상태는 `machine_draft_needs_human_review`이며 source/control은 그대로다. 번역한 물리 후속은 2개, 원문 보존은 156개다.
- 거절 후보: `exe2_rev1_semantic_translation_playtest_fix.gba` SHA `8f059807...`는 TextPet이 ASCII comma를 조용히 누락해 거절했다. v2는 지원 문장부호를 사용한다. 주 빌더에 모든 번역 물리 후속 리터럴의 실제 바이트 순서·공백·문장부호 검사 게이트를 추가했다. 기존 381개 아카이브 코어와 폰트는 전부 동일하고 `00/164` 꼬리만 바뀌었음을 별도 검사했다.
- 검증: 전체 static QA와 `verify_playtest_continuation_fix.py` PASS. 새 ROM을 구 대화 상태로 실행하지 않고, 테스트 전용 게임 내 저장에서 새 부팅→직접 이동→같은 이벤트를 재생했다. `analysis/playtest_20260910_fixed/006_fixed_tail/step_001.png`에서 한글 표시, `007_after_fix_field`에서 종료·이동, `008_saved_after_class`에서 게임 저장 완료, `009_saved_coldboot`에서 새 부팅 후 저장 복원·L 안내 응답을 확인했다.
- 저장 보호: 사용자 기존 `.sav/.ss1/.ss2`는 수정하지 않았다. 테스트 ROM만 고유 stem과 배터리를 사용했다. 새 게임 저장 백업은 `analysis/playtest_20260910_fixed/008_saved_after_class/battery_after_class.sav`, SHA `28b10f935edc8355466971cfeb86c8048a65bd4a848ee9ed2bca8e0bb10e453d`.
- 정확한 재개점: `analysis/playtest_20260910_fixed/010_resume_field/checkpoint.mss`. ROM은 위 v2와 동일한 `analysis/playtest_20260910_fixed/EXE2_KR_playtest_20260910_fixed.gba`, Mesen은 `C:/Users/blari/AppData/Local/emucap/mesen2/47801/portable/Mesen.exe` SHA `af60a188...`. 다음은 종업식 후 데카오에게 다시 말 걸기다. 새 ROM으로 변경되면 이 대화 상태를 무조건 이식하지 말고 게임 내 저장에서 부팅한다.
- 증거: `analysis/exe2_rev1_natural_play_qa.json`이 44개 구간 receipt와 화면 183장, 저장·ROM 해시를 재검사한다. 두 playtest 폴더 README에 경로와 재개 명령 형식을 기록했다. 단위 테스트는 기존 배치 7개·TextPet fixture 5개·새 문자 누락 테스트 3개 통과. 9월 5일 배포 ZIP은 갱신하지 않았고 그 ZIP은 이전 linewrap ROM을 만든다.
- 상태: one observed untranslated continuation fixed and natural-play verified; save/reload verified; whole-game QA and remaining UI/translation/layout gaps open.

## [2026-09-10] [natural-play-qa] [school-to-home-route]
- 재개: `analysis/playtest_20260910_fixed/010_resume_field/checkpoint.mss`에서 음소거 정상 입력만으로 계속했다. 현재 후보와 Mesen 해시는 위 기록과 동일하다.
- 진행: 데카오의 오피셜 스퀘어 약속 대화 6페이지, 학교 퇴실 맵 전환, 학교 외곽·공원·도시 도로 이동, 터미널 주변 NPC 대화, L 버튼 마을 안내와 닫기, 집 앞 자동 대사 및 버스 정류장 NPC 대화를 확인했다. 새 한글 대사는 화면 안에 들어왔고 충돌은 없었다.
- 특이점: 터미널 NPC의 한 페이지 대화에서 대화 중 상태를 반복 로드하면 A 입력이 장면 재트리거처럼 보일 수 있었다. 대화 직전 필드 체크포인트 `040_city_walk`에서 다시 말을 걸면 `049_terminal_fresh`의 첫 A에서 대화, 둘째 A에서 필드 복귀가 재현됐다. 이는 패치 오류로 승격하지 않고 상태 로드/트리거 경계 특이점으로 기록했다.
- 최신 상태: `analysis/playtest_20260910_fixed/072_home_entry/checkpoint.mss` (집 앞). 다음은 집 진입 조건 및 집 주변 이벤트 확인이다. 대화 중 체크포인트가 아니라 필드 상태에서 재개한다.
- 증거 갱신: `analysis/exe2_rev1_natural_play_qa.json` 재생성. 106개 세그먼트 receipt, 327개 스크린샷, 음소거 및 exact ROM/emulator/checkpoint 해시 검증. `tools/record_natural_play_qa.py` 통과.
- 상태: school-to-home route partially verified; no new patch defect observed; next route open.

## [2026-08-31] [gt-text-translate] [workaround]
- 상황: 57차 결정적 재빌드 감사에서 자식 빌더가 Windows 콘솔 기본 인코딩으로 출력해, 감사기의 UTF-8 디코더 스레드가 예외를 냈다. 38차 때 캡처 디코딩을 UTF-8로 지정했지만 자식 프로세스의 출력 인코딩 자체는 고정되지 않아 호출 환경에 따라 재발할 수 있었다.
- 해결/우회: 감사기가 자식 빌더를 실행할 때 복제한 환경에 `PYTHONIOENCODING=utf-8`을 명시하도록 수정했다. 초기 70개 초안도 폰트 누적 입력에 포함한 뒤 57차 감사를 다시 실행한다.
- 증거: `tools/audit_textpet_translation_batch_multi.py`, `analysis/archive_batch_0057_audit.json`.
- 상태: applied

## [2026-08-30] [text-extraction/compression] [observation]
- 상황: 물리 순서 `00/161`(ROM `0x77A1EC`)까지는 GBA LZ77 `0x10` 스트림이지만, `00/162`(ROM `0x77A298`)부터는 압축 헤더 없이 16비트 경계표와 메시지 본문이 ROM에 직접 저장돼 기존 LZ77 전용 추출기가 거부했다.
- 판정: `00/162`의 선두 경계표는 10개 엔트리와 364바이트 끝 경계를 나타냈고, 이후 블록도 마지막 경계와 다음 블록 사이에 정렬 패딩만 존재했다. 카탈로그의 `byte_length`는 중첩 가능한 분석 범위이므로 직접 저장 아카이브 길이로 사용하지 않는다.
- 해결/우회: 추출기·다중 아카이브 빌더·감사기에 명시적 `storage: raw`와 계획 고정 `raw_byte_length` 지원을 추가했다. `00/162`~`00/177`을 경계표의 마지막 오프셋으로 잘라 TextPet 추출·재빌드했으며 모두 원본 바이트와 일치했다.
- 상태: applied
- 증거: `tools/extract_textpet_archive.py`, `tools/build_textpet_translation_batch_multi.py`, `tools/audit_textpet_translation_batch_multi.py`, `analysis/archive_00_162_textpet_full_roundtrip.json`~`analysis/archive_00_177_textpet_full_roundtrip.json`.

## [2026-08-28] [gt-text-translate] [gap]
- 상황: 기존 GBA 한글화 프로젝트에서 사용자가 100개 단위 번역을 승인해 `gt-text-translate` 사전 점검을 수행했다.
- 원인: 플러그인의 프로젝트 경계 검증기는 `_work/<project-id>` 구조와 지원 플랫폼 어댑터를 요구하지만, GBA 어댑터가 없고 이 프로젝트는 이미 `analysis/`, `translations/`, `poc/output/` 기반의 검증된 `create-kr-patch` 구조를 사용한다.
- 해결/우회: 기존 프로젝트를 이동하지 않고 `create-kr-patch`의 원본 해시, TextPet 무수정 왕복, 보호 제어 코드, 개발 빌드 검증 절차를 유지한다. 배치 크기 100은 `translations/translation_batch_policy.json`에 기록한다.
- 문서 개선 제안: `game-translate`에 기존 GBA ROM 프로젝트를 위한 legacy-layout 어댑터 또는 `create-kr-patch` 산출물 호환 경계를 추가한다.
- 상태: open

## [2026-08-29] [text-extraction] [observation]
- 상황: `00/31`의 압축 길이를 시작 오프셋에 단순 합산한 `0x75E2DB`에서는 다음 아카이브가 열리지 않았다.
- 원인: `00/32` 앞에 1바이트 정렬 패딩이 있으며 실제 시작점은 4바이트 정렬된 `0x75E2DC`이다.
- 해결/우회: 다음 아카이브 경계는 단순 합산만으로 확정하지 않고 기존 ROM 카탈로그와 LZ77 매직을 대조한 뒤, TextPet 바이트 동일 왕복을 통과한 정확한 오프셋만 계획에 기록한다.
- 증거: `analysis/archive_00_31_textpet_full_roundtrip.json`, `analysis/archive_00_32_textpet_full_roundtrip.json`, `analysis/rev1_message_block_catalog.json`.
- 상태: applied

## [2026-08-30] [text-extraction] [workaround]
- 상황: `extract_textpet_archive.py`가 TextPet 왕복용 임시 파일을 운영체제 공용 임시 폴더에 생성해 최신 작업공간 경계 계약과 맞지 않았다.
- 원인: 기존 GBA 레거시 추출기는 `tempfile.TemporaryDirectory`의 기본 위치를 사용했다.
- 해결/우회: 추출 임시는 최종 TPL이 생성되는 현재 프로젝트 `analysis/` 폴더와 `tmp-exe2-textpet-` 접두사를 사용하고, 배치 감사의 결정적 재생성 임시도 감사 보고서가 생성되는 `analysis/` 폴더와 `tmp-exe2-batch-audit-` 접두사를 사용하도록 수정했다. 수정 후 `00/151`~`00/155` TextPet 원본 바이트 동일 왕복과 32차 배치 감사를 재현하고 Python 문법 검사를 통과했다.
- 문서 개선 제안: 기존 레거시 플랫폼 도구에도 모든 임시 출력의 프로젝트 내부 배치를 명시하는 예제를 추가한다.
- 증거: `tools/extract_textpet_archive.py`, `tools/audit_textpet_translation_batch_multi.py`, `analysis/archive_00_151_textpet_full_roundtrip.json`~`analysis/archive_00_155_textpet_full_roundtrip.json`, `analysis/archive_batch_0032_translation_audit.json`.
- 상태: applied

## [2026-08-30] [gt-text-translate] [workaround]
- 상황: 38차 배치의 결정적 재빌드 감사에서 자식 빌더의 UTF-8 JSON 출력을 Windows 기본 CP949로 읽으려 해 백그라운드 디코드 예외가 표시됐다.
- 원인: `subprocess.run(..., text=True)`에 출력 인코딩이 명시되지 않았다.
- 해결/우회: 감사기의 자식 프로세스 캡처 인코딩을 UTF-8로 고정하고 같은 입력으로 감사를 다시 실행했다. 재실행은 예외 없이 구조 검사 15/15와 결정적 바이트 동일 재빌드를 통과했다.
- 증거: `tools/audit_textpet_translation_batch_multi.py`, `analysis/archive_batch_0038_translation_audit.json`.
- 상태: applied

## [2026-08-30] [text-extraction/schema] [observation]
- 상황: 명칭 테이블 `00/353`은 앞선 대화 아카이브의 TextPet `mmbn2`가 아니라 단문용 `mmbn2s` 스크립트 표기를 사용해 기존 다중 배치 도구가 텍스트 엔트리를 선택하지 못했다.
- 해결/우회: 빌더와 독립 감사기의 스크립트 인식 범위를 정확히 `mmbn2`와 `mmbn2s` 두 표기로 확장했다. `00/353`의 255개 엔트리 중 비어 있지 않은 178개를 인식했고, 원본 1,742바이트 TextPet 왕복이 바이트 단위로 일치했다. 변경 전 `mmbn2` 입력인 53차 보호 배치도 재빌드 해시가 기존 파일과 일치했다.
- 다음 재개점: `00/353`의 텍스트 엔트리 위치 98, 실제 스크립트 엔트리 98부터 시작하며 80개가 남아 있다.
- 증거: `tools/build_textpet_translation_batch_multi.py`, `tools/audit_textpet_translation_batch_multi.py`, `analysis/archive_00_353_textpet_full_roundtrip.json`, `analysis/archive_batch_0054_audit.json`.
- 상태: applied

## [2026-08-30] [text-extraction] [tip]
- 상황: 프로젝트 안에 TextPet 플러그인 폴더가 두 개 있어 `external/TextPet-v1.0.0/plugins`를 쓰면 현재 번역 기준과 다른 테이블·명령 DB 해시가 선택된다.
- 해결/우회: 실행 파일은 `external/TextPet-v1.0.0/TextPet.exe`(SHA-256 `1a92681b...`)를 사용하되, 플러그인은 `external/TextPet-plugins-6c6d705/TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins`의 `exe2-utf8.tbl`(SHA-256 `4c794061...`)과 `mmbn2.ini`(SHA-256 `5f49759e...`)를 사용한다. `00/354`는 이 기준으로 다시 추출했으며 1,005바이트 원본과 완전히 일치했다. 잘못 선택한 플러그인으로 만든 최초 결과는 같은 canonical 경로에서 기준 결과로 교체되어 남아 있지 않다.
- 문서 개선 제안: EXE2 추출 명령 예시에 실행 파일 경로와 별도로 검증된 플러그인 경로·해시를 명시한다.
- 증거: `analysis/archive_00_354_textpet_full_roundtrip.json`, `analysis/archive_batch_0055_audit.json`.
- 상태: applied

## [2026-08-31] [text-extraction] [observation]
- 상황: `00/359` 다음 카탈로그 레코드인 `pc-jap-map-0221`(`00/360`, ROM 오프셋 `8270880`)은 GBA LZ77 헤더가 있지만, 해제된 데이터의 선두가 메시지 오프셋 테이블 규칙을 만족하지 않아 TextPet 추출 대상이 아니었다. 이어지는 `pc-jap-map-0222`(`00/361`)도 카탈로그에서 선두 오프셋 테이블과 스크립트 구조가 모두 부정되어 있다.
- 해결/우회: 두 비텍스트 자산을 번역 분모에서 제외하고 다음 스크립트형 레코드 `pc-jap-map-0223`을 `00/362`로 연결했다. ROM 오프셋 `8231124`의 선두 193개 경계 중 마지막 값 `2046`을 실제 raw 길이로 사용했으며, TextPet 추출·재빌드 결과 2,046바이트가 원본과 완전히 일치했다.
- 증거: `analysis/rev1_message_block_catalog.json`, `analysis/archive_00_362_textpet_full.tpl`, `analysis/archive_00_362_textpet_full_roundtrip.json`.
- 상태: applied

## [2026-09-03] [text-coverage] [observation]
- 상황: 76차까지 보고한 전체 잔여량 `79`개는 당시 추출 완료 범위만 차감한 추정치였다. 새로 검증한 `00/403`과 `00/404`에서 각각 13개와 70개의 텍스트가 확인되어, 77차 시작 시점의 실측 대상은 최소 102개였다. 또한 427개 `pc-jap-map` 카탈로그에는 현재 연결한 `pc-jap-map-0265` 뒤로 `0266`~`0426` 레코드가 남아 있어 전체 잔여량을 2개로 단정할 수 없다.
- 영향: 이전 README의 `estimated ... remaining` 수치는 전체 427개 카탈로그의 확정 잔여량이 아니며, 이후 진행 보고에서 전역 잔여량으로 사용하면 안 된다.
- 해결/우회: 배치 감사가 증명하는 현재 추출 아카이브별 잔여량만 확정값으로 보고한다. `00/404`에는 2개가 남았으며, 이후 레코드는 TextPet 왕복 검증을 거쳐 텍스트 여부와 수량을 새로 누적한다.
- 증거: `analysis/archive_00_403_textpet_full_roundtrip.json`, `analysis/archive_00_404_textpet_full_roundtrip.json`, `analysis/archive_batch_0077_audit.json`, `analysis/rev1_message_block_catalog.json`.
- 상태: applied; 전체 후속 레코드 분모 재산정은 open

## [2026-09-04] [product-build/qa] [emulator-candidate]
- 상황: 보호된 번역 초안을 실제 에뮬레이터에서 확인할 단일 ROM이 필요했다. 과거 통합 산출물은 이전 PoC ROM을 구성 요소로 사용하고 문맥 폰트 분기를 남겨 둔 개발 빌드였다.
- 해결: `tools/build_semantic_translation_dev_rom.py`를 깨끗한 일본판 Rev 1 원본에서 직접 16 MiB 결과를 재구성하도록 변경했다. 검증된 TextPet 실행 파일과 `exe2-utf8.tbl`·`mmbn2.ini` 해시를 빌드 게이트로 고정하고, 일반 일본어는 원본 폰트, `F9 FC` 한글만 2,351레코드 마스터 폰트를 사용하도록 과거 문맥 폰트 분기를 제거했다.
- 결과: `poc/output/exe2_rev1_semantic_translation_emulator_test.gba`, SHA-256 `d5f234f41a438c30f6870334041663b4fc14edd34b7dd39c72a14d11ac11d427`. 381개 아카이브, 7,607개 고유 번역 엔트리, 574개 재배치 포인터를 포함한다. `00/357`의 95개는 참조 경로 미해결로 제외됐다.
- 검증: `tools/verify_semantic_translation_emulator_rom.py`가 GBA 헤더 체크섬, 아카이브 경계·압축 해시, 포인터, 폰트, Thumb 명령 경계, Expected Write 비중첩, 깨끗한 확장 원본 대비 전체 diff 설명을 통과했다. 기록은 `analysis/exe2_rev1_semantic_translation_emulator_test_static_qa.json`이며 상태는 `PASS (bench)`다.
- 런타임 정책: 정확히 위 ROM 해시를 사용하고 `audio_enabled=false`로 실행한다. 부팅·대표 대사·진행·종료·재진입 화면 검증은 `PENDING_RUNTIME`이며, 이 후보는 배포 불가 개발용 전체 ROM이다.
- 상태: applied; runtime pending

## [2026-09-05] [runtime-qa] [crash-investigation]
- 상황: mGBA 화면에서 `Jumped to invalid address: 71683800` 치명적 오류가 보고됐다. mGBA 0.10.5 실행 파일의 실제 형식 문자열은 `%08X`이므로 주소는 `0x71683800`이며 정상 GBA 메모리 범위 밖이다. 스크린샷만으로는 실행 ROM 해시와 재현 절차가 결합되지 않아 원인을 단정하지 않았다.
- 재현 결과: 정확한 최신 후보(SHA-256 `d5f234f4...`)를 음소거한 Mesen 2에서 600프레임 부팅 및 1,800프레임 자동 진행했고, 한글 메인·폰트 경로를 각각 69회 실행한 상태에서도 충돌하지 않았다. mGBA 0.10.5에서도 상태 자동 불러오기·자동 저장을 끈 새 부팅이 8초 동안 유지됐다.
- 조치: `tools/launch_mgba_clean_validation.ps1`을 추가했다. 실행 전 ROM 전체 SHA-256을 고정값과 대조하고, `mute=1`, `autoload=0`, `autosave=0`으로 mGBA를 시작한다. 과거 ROM 빌드의 `.ss1`/`.ss2`는 사용하지 않는다.
- 증거: `analysis/exe2_rev1_emulator_crash_investigation.json`, `analysis/exe2_rev1_mesen_progression_smoke_result.txt`, `analysis/exe2_rev1_mesen_progression_smoke_trace.txt`, `analysis/exe2_rev1_mgba_clean_boot.stdout.txt`, `analysis/exe2_rev1_mgba_clean_boot.stderr.txt`.
- 상태: workaround applied; exact user failure not reproduced; full runtime QA remains open

## [2026-09-05] [runtime-qa] [raw-continuation-fix]
- 상황: 정확한 구 후보에서 `00/163/8`의 `응! 나만 믿으라니까!` 대사를 진행하면 mGBA가 `Jumped to invalid address: 71683800`으로 중단되는 현상을 상태 주입 A/B 시험으로 재현했다.
- 원인: 엔트리 8의 `jump target = 9`는 9개 엔트리 표의 마지막 경계값을 통해 원본 코어 바로 뒤의 65바이트 후속 스크립트로 진입한다. 구 빌더는 정식 아카이브 코어만 재배치해 점프가 확장 ROM의 `FF` 영역으로 들어갔다.
- 범위: 382개 번역 입력 아카이브를 감사해 같은 패턴을 가진 raw 아카이브 158개를 확인했다. 모두 `target == entry_count`였고 압축 아카이브나 경계를 초과한 점프는 없었다.
- 해결: `tools/build_semantic_translation_dev_rom.py`가 158개 후속 물리 바이트를 원본 해시와 함께 보존하도록 수정했고, `tools/verify_semantic_translation_emulator_rom.py`가 코어·후속 영역의 배치와 해시를 각각 검증하도록 강화했다.
- 결과: 수정 후보 `poc/output/exe2_rev1_semantic_translation_emulator_test_continuation_fix.gba`, SHA-256 `d5617308a910231ab43a7a64a451f33120f6d18798d5abebde59c98bef7e5139`. 문제 지점의 숨은 후속 대사도 `정말일까? 뭐 됐어、 그치? 다들 방학 얘기로 신이 난 것 같아!`로 재컴파일했다. 정적 QA 통과, 동일 mGBA 상태에서 첫 X 입력 후 한글 후속 대사 표시 및 X 4회 후 오류 없이 필드 복귀를 확인했다.
- 실행: `RUN_MGBA_CLEAN_MUTED.cmd`는 수정 후보와 위 해시만 허용하도록 갱신했다.
- 증거: `analysis/exe2_rev1_out_of_table_jump_audit.json`, `analysis/entry_00_163_8_old_runtime_probe.json`, `analysis/entry_00_163_8_fixed_runtime_probe.json`, `analysis/exe2_rev1_semantic_translation_emulator_test_continuation_fix_static_qa.json`, `analysis/exe2_rev1_emulator_crash_investigation.json`.
- 상태: targeted runtime fix verified; full-game runtime QA remains open

## [2026-09-05] [runtime-qa] [pet-choice-layout]
- 재개 지점: 사용자가 올린 PET 책장 소년 선택창에서 질문 한 줄에 커서가 겹치고 선택지가 화면 왼쪽으로 밀리는 현상. 기존 실행기는 continuation-fix ROM을 사용하고 있었다.
- 원인: `00/404/10`의 질문 내부 `/` 줄바꿈을 첫 선택지 경계로 오인해 두 번째 질문 행이 첫 선택지로 들어갔다. 원문 질문 끝의 실제 줄바꿈과 첫 선택지 끝의 공백도 제거됐다.
- 조치: 기본 빌더의 `option_literal_layout`과 `preserve_option_layout` 경로로 내부 문장 줄바꿈과 선택지 배치 접미사를 구분한다. 적용 범위는 원본 해시가 검증되는 `00/404/10` 하나다. 원문 제어 구조·선택 대상·번역 문구는 유지했다. 모든 선택창에 일괄 활성화하는 시도는 다른 초안의 슬롯 대응 오류로 TextPet 빌드가 실패해 채택하지 않았다. 다른 선택창은 추가 감사가 필요하며 전역 해결로 간주하지 않는다.
- 산출물: `poc/output/exe2_rev1_semantic_translation_choice_fix.gba`, SHA-256 `b69aa381934118b31918a802985d187d0fc8605626482e506e01e667036cd5a2`. 깨끗한 Rev 1 원본에서 재빌드했으며 381개 아카이브의 기존 코어와 대조한 변경 엔트리는 `00/404/10` 하나다. 앞서 수정한 raw 후속 스크립트 보존도 정적 QA를 통과했다.
- 재현: `tools/run_choice_layout_regression.py`는 `--testRunner --noAudio`로 Mesen 2를 실행해 1,800프레임 뒤 정확한 ROM에서 해제한 아카이브를 EWRAM `02038800`에 넣고 기존 렌더러를 entry 10으로 초기화한다. 같은 스크립트의 이전 ROM은 사용자 스크린샷과 같은 겹침을 재현했다. 새 후보에서는 질문 두 줄과 선택지 한 줄, 좌우 커서, A 첫 선택(entry 16), A 둘째 선택(entry 10 후속), B 취소(entry 10 후속)를 확인했다.
- 증거: 최종 B 단독 입력 검증은 `analysis/emucap/pet_choice_fixed_cancel_verified/`이다. 초기 `pet_choice_fixed/cancel_branch`는 테스트 스크립트가 A+B를 함께 눌렀으므로 취소 증거에서 제외했다. 구 후보 화면은 `analysis/emucap/pet_choice_old/choice_default.png`. 화면 판독은 에이전트가 했으며 사용자 최종 화면 승인을 의미하지 않는다.
- 한계: 렌더러 상태 주입은 자연스러운 맵 진입을 우회한다. 새 ROM의 해당 NPC 자연 진입과 mGBA 특이 동작은 미검증이며 전체 게임 QA도 미완료다. 개발 후보이며 배포본이 아니다.
- 실행: `RUN_MGBA_CLEAN_MUTED.cmd`가 새 choice-fix ROM과 해시를 사용하도록 갱신했다. 원본 ROM·사용자 저장 파일은 변경하지 않았다. 이전 ROM의 `.ss1/.ss2`는 아카이브 RAM을 되살릴 수 있으므로 사용하지 말고 새 부팅 후 게임 내 저장에서 진행한다.
- 검증 기록: `analysis/exe2_rev1_pet_choice_layout_qa.json`, `analysis/exe2_rev1_semantic_translation_choice_fix_static_qa.json`. `python tools/verify_pet_choice_layout.py` 통과, 수정 Python 4개 문법 검사 통과.
- 상태: targeted renderer layout and branches verified; natural-map mGBA confirmation and remaining choice audit open.

## [2026-09-05] [layout-qa] [ordinary-dialogue-linewrap]
- 사용자 요청: 록맨 L버튼 대사가 창을 넘어가는 새 스크린샷을 제시하고, 다른 넘침도 찾아 줄바꿈해 달라고 요청했다. 번역 문구를 줄이거나 바꾸지 않는 배치 수정으로 진행했다.
- 대상과 원인: `00/366/5`. `waitSkip 15` 뒤 원문 리터럴은 선두 줄바꿈으로 새 행을 시작하지만 기존 `render_text_tokens().strip()` 경로가 이를 지워 질문과 다음 문장이 26칸 한 행으로 연결됐다. 일반 렌더러의 `08020DC8..08020DF6`은 글자당 BG 타일 한 칸을 증가시킨다. 런타임 x 시작은 8번 타일(64px)이며 21칸·3줄을 일반 대화의 채택 범위로 사용한다.
- 전체 감사: `tools/audit_dialogue_layout.py`가 7,700개 정규 배치와 기존 추가 2개를 합친 7,702개를 검사한다. `analysis/dialogue_layout_audit.json`에 전체 상태와 변경 전후 문구·행 길이를 기록했다. 340개 엔트리는 공백 및 줄바꿈만 바꿀 수 있었다. 특수 창·선택지·변수 삽입·미확인 제어는 통과로 처리하지 않고 보류했다. 일반 대화의 54페이지도 3줄 용량 또는 슬롯 조건 때문에 보류됐다. 미확인 항목 수를 모두 실제 넘침 수로 해석하지 않는다.
- 구현: `tools/dialogue_layout.py`를 주 빌더에 연결했다. 표준 msgOpen과 알려진 제어만 처리하며 원문에서 유실된 경계 줄바꿈 복원, 기존 공백 우선 줄 배치, 21칸·3줄 검사 및 리터럴별 공백 이외 문자 동일성·비텍스트 제어 구조 동일성 검사를 수행한다. 새 keyWait/페이지는 삽입하지 않았다. 추후 변경 리터럴이 최종 ROM에 정확한 인코딩·줄바꿈으로 존재하지 않으면 `layout_byte_verifier.py`를 통해 주 빌드가 실패한다.
- 거절된 실험: 최초 `exe2_rev1_semantic_translation_linewrap.gba` 해시 `12838bd902503da647f260e544727346bb0b16b0a4184a2a87a881003784e934`는 정적 레이아웃 계획에만 선두 개행이 있고 실제 ROM에는 없었다. 사용자 장면은 여전히 최대 26칸이었다. TextPet TPLReader의 heredoc 시작 정규식 `[^\S\r]*`가 LF 형식 선두 빈 줄을 소비하는 것이 원인이었다. 이 후보는 실행기에 연결하지 않았다. `analysis/emucap/wrap_366_5_fixed` 및 `wrap_12_2_fixed`는 이 거절된 후보의 실패 증거다.
- 수정: 새 레이아웃 리터럴을 CRLF heredoc으로 직렬화한다. 실제 TextPet 실행 파일로 선두·내부·후미 개행 5개 fixture가 E8 바이트로 출력됨을 검증했다. 결과는 `analysis/textpet_layout_serialization_qa.json`이다.
- 최종 산출물: `poc/output/exe2_rev1_semantic_translation_linewrap_fix.gba`, SHA-256 `8d6ed5473404d2dcaf6056297324e86a47d88b4c999324eb40ab8a7a5e8ac11a`. 원본 Rev 1에서 재빌드했다. 이전 choice-fix 대비 121개 아카이브·340개 엔트리만 바뀌었고 예상하지 않은 엔트리 변경은 0개다. 변경 페이지의 842개 리터럴을 별도 테이블 인코더로 최종 ROM에서 순서와 공백까지 확인했다. 근거는 `analysis/exe2_rev1_dialogue_wrap_bytes_qa.json`.
- 런타임: `wrap_366_5_verified`에서 문제 대사의 최대 열이 26→16, 최대 행 인덱스 1→2로 바뀌었으며 앞 페이지와 대화 종료 화면은 이전 후보와 픽셀 동일하다. `wrap_12_2_verified`에서 17칸·2줄 표시를 확인했다. `wrap_pet_choice_verified`에서 이전 PET 선택창의 양쪽 커서, 첫 선택 entry16, 둘째 선택 및 B 취소 entry10을 확인했다. 전부 Mesen 2 `--noAudio`로 실행했다. `record_dialogue_wrap_runtime.py`가 ROM 해시와 로그·화면 해시를 `analysis/exe2_rev1_dialogue_wrap_runtime_qa.json`에 결합했다.
- 검증 한계: 정확한 아카이브를 EWRAM에 주입한 렌더러 테스트다. `00/366/5`의 선행 checkFlag 18바이트와 자연 맵 진입을 우회했다. 변경한 340개 모두를 개별 런타임으로 재생한 것은 아니며, 정적·바이트 전수 검증과 대표 런타임을 구분한다. 전체 게임·배포 검증은 미완료다.
- 실행: 기본 `RUN_MGBA_CLEAN_MUTED.cmd`는 최종 linewrap-fix ROM과 해시를 사용한다. 사용자 게임 내 저장 및 상태 파일은 변경하지 않았다. 과거 ROM의 `.ss1/.ss2`는 로드하지 않고 새 부팅한다.
- 다음 재개점: 감사의 54개 용량 보류 페이지를 문구 보존 상태로 검토해 명시적 페이지 배치를 준비하고, 특수 창·변수 삽입·선택지의 별도 소비자 규칙을 감사한다. 무조건 일반 21칸 규칙을 적용하거나 전체 수정 완료로 보고하지 않는다.
- 상태: ordinary-dialogue whitespace fixes applied; targeted muted renderer QA passed; special cases and whole-game QA open.

## [2026-09-05] [test-distribution] [bps-emulator-package]
- 요청: 에뮬레이터용 배포 패치 제작. 게임 내용은 추가 변경하지 않고, 최신 linewrap-fix ROM과 동일한 결과를 만드는 차분 테스트 패키지를 생성했다. 완성 배포·번역 검수 완료·전체 게임 QA 완료로 승격하지 않았다.
- 출력: `dist/EXE2_Rev1_KR_Emulator_TEST_20260905.zip`, 929,373바이트, SHA-256 `280b86a8fa4f9cd7611d7d85a4dce1316f084db7702f112e3b28037c24eb348f`.
- BPS: `EXE2_Rev1_KR_TEST.bps`, 394,725바이트, SHA-256 `44684cf37a80e890e3e7a7d35ab82fd135ca092a434bcf632e167ea197510798`. 깨끗한 Rev 1 원본 해시 `1afe35e1...`에서 적용한 결과는 현재 ROM 해시 `8d6ed5473404d2dcaf6056297324e86a47d88b4c999324eb40ab8a7a5e8ac11a`와 전체 바이트 동일하다. 반복 생성 BPS도 동일하다.
- 포함: BPS, APPLY_PATCH.cmd, apply_patch.ps1, README_KO.txt, manifest.json, Floating IPS v198 원본 실행 파일·GPL 라이선스·동일 태그 소스. 원본/패치 ROM 및 저장 파일은 포함하지 않는다. Flips 소스의 무관한 Firefox 바이너리 벤치마크 TAR 2개는 제외했으며 모든 패처 소스·빌드·라이선스 파일은 보존했다.
- 출처: `https://github.com/Sir-Walrus/Flips/releases/download/v198/flips-windows.zip`, 소스 `https://api.github.com/repos/Sir-Walrus/Flips/zipball/v198` (359d414). 설치는 하지 않고 프로젝트 external 폴더에 받은 도구를 사용했다. Flips 실행 파일 SHA-256 `ca6b364ccb23ab83ff0f4458f589eac001e7baf74315decde73c878a8eb519fd`.
- 검증: 실제 동봉 PowerShell 적용기를 실행했다. 원본·패치·도구·결과 SHA-256 확인, 원본 8MiB→결과 16MiB, 최종 바이트 일치, 잘못된 소스 거부, 기존 결과 덮어쓰기 거부, ZIP CRC 및 모든 ZIP 구성원 바이트 일치를 통과했다. 빌더 `tools/build_emulator_test_patch.py`, 기록 `analysis/emulator_test_patch_package_qa.json`.
- 실행 환경 보정: Windows PowerShell에서 Get-FileHash가 해석되지 않아 .NET SHA256 구현을 사용했다. GUI-subsystem Flips 실행의 종료 대기를 확실히 하기 위해 Start-Process -WindowStyle Hidden -Wait -PassThru를 사용했다.
- 근거 범위: 동일 ROM 바이트이므로 기존 정적·대표 음소거 런타임 근거를 그대로 연결했다. 이번 턴에 새 에뮬레이터 실행이나 온라인 공개 업로드는 하지 않았다. 원본 ROM과 사용자 저장은 변경하지 않았다.
- 상태: local incomplete emulator test package ready; final release blocked by previously recorded translation/layout/runtime gaps.

## [2026-09-10] [runtime-qa] [natural-play-home-route]
- 재개: 고정 후보 `analysis/playtest_20260910_fixed/072_home_entry/checkpoint.mss`에서 음소거 Mesen 2 자연 입력 테스트를 이어갔다. ROM SHA-256은 모든 세그먼트에서 `a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a`로 고정했고, 실행기는 기존 검증 해시를 유지했다.
- 결과: `073`–`084`에서 집 앞에서 인근 청색/백색 건물로 진입해 실내 세이브스테이트를 만들었다. `085`–`091`에서 방 내부 이동과 시계 오브젝트 대사를 확인했고, 한국어 3행 설명이 창 안에 표시되며 A 입력으로 정상 종료했다. `092`–`095`에서 집 진입 NPC 대사, `096`–`099`에서 TV/그림 오브젝트의 한국어 3행 대사를 확인했다. `100`–`111`에서 주방·거실을 왕복하고 엄마/문 상호작용을 새 체크포인트에서 반복했으며 충돌·비정상 점프·텍스트 넘침은 관찰되지 않았다.
- 증거: `analysis/playtest_20260910_fixed/073_*`–`111_*`의 각 `result.json`, PNG, `checkpoint.mss`; 최신 체크포인트 `analysis/playtest_20260910_fixed/111_home_outside/checkpoint.mss`.
- 한계: 이는 자연 입력 기반 부분 경로 검증이며 전체 게임 QA가 아니다. 일부 반복 대사는 동일 NPC를 다시 조사한 정상 동작으로 분류했다. 특수 창·변수 삽입·남은 미번역 물리 후속 텍스트와 전체 배포 검증은 여전히 open이다.
- 상태: targeted home/neighborhood route passed; continue from checkpoint `111_home_outside` with a new segment folder.

## [2026-09-10] [runtime-qa] [natural-play-home-probe]
- 후속 입력: `112`–`127`을 동일한 고정 후보와 음소거 Mesen 2에서 수행했다. PET/거실 오브젝트, 엄마 NPC의 여러 접근 방향, 주방·거실 양쪽 가장자리를 일반 컨트롤러 입력만으로 검사했으며 상태 주입·진행 플래그 조작은 없었다.
- 결과: 시계·TV·그림 설명문과 엄마 대사는 모두 한국어로 창 내부에 표시됐다. 3행 설명도 화면 밖으로 넘치지 않았고, A 입력 후 정상적으로 닫혔다. 엄마 대사를 반복 조사해도 충돌이나 `Jumped to invalid address`가 재현되지 않았다. 방 가장자리에서는 맵 전환 없이 정상적인 충돌 경계로 남았다.
- 증거: `analysis/playtest_20260910_fixed/112_*`–`127_*`의 `result.json`, 화면 PNG, 체크포인트; 최신 `analysis/playtest_20260910_fixed/127_home_left_mat/checkpoint.mss`.
- 상태: targeted home interior probe passed; whole-game QA and unresolved special-window/continuation coverage remain open.

## [2026-09-10] [runtime-qa] [natural-play-home-exit]
- 후속 입력: 최신 거실 체크포인트에서 `128`–`129`를 실행해 계단을 통한 집 밖 전환을 확인했다. 이어 `130`–`133`에서 집 앞 배달 NPC의 3페이지 대사를, `134`–`152`에서 북쪽 동네·수변 도로 이동과 바이러스 버스팅 NPC의 3페이지 대사를 확인했다.
- 결과: 집 앞 NPC의 2행·3행 대사와 북쪽 NPC의 1~3행 대사가 모두 화면 안에 표시되고 A 입력으로 정상 종료됐다. 수변 도로 끝까지 이동해도 충돌·잘못된 점프·텍스트 박스 손상은 관찰되지 않았다.
- 증거: `analysis/playtest_20260910_fixed/128_*`–`152_*`의 `result.json`, PNG, 체크포인트; 최신 `analysis/playtest_20260910_fixed/152_home_area_exit_right/checkpoint.mss`.
- 상태: targeted home-to-waterfront route passed; continue from `152_home_area_exit_right` with a new segment folder. Whole-game QA remains partial.

## [2026-09-10] [runtime-qa] [natural-play-waterfront-probe]
- 후속 입력: `153`–`161`에서 수변 도로 하단·끝 지점과 공원 가장자리를 일반 입력으로 탐색했다. 공원 오브젝트와 NPC 주변에서 맵이 안정적으로 유지됐고, 경로가 이웃 상점 방향으로 돌아오는 것을 확인했다.
- 결과: 새 대사 넘침·충돌·잘못된 점프는 관찰되지 않았다. 수변 도로 끝은 정상적인 맵 경계로 분류했으며, 사용자 저장 파일과 ROM은 변경하지 않았다.
- 증거: `analysis/playtest_20260910_fixed/153_*`–`161_*`의 `result.json`, PNG, 체크포인트; 최신 `analysis/playtest_20260910_fixed/161_waterfront_park_top_npc/checkpoint.mss`.
- 상태: targeted waterfront/park probe passed; continue from `161_waterfront_park_top_npc`. Whole-game QA remains partial.

## [2026-09-10] [runtime-qa] [natural-play-shop-probe]
- 후속 입력: `162`–`170`에서 동네 상점 앞 NPC와 건물 입구를 일반 입력으로 확인했다.
- 결과: 상점 앞 NPC의 한국어 한 페이지 대사가 창 안에 표시되고 A 입력으로 정상 종료됐다. 상점 건물은 장식 오브젝트로 맵 전환 없이 안정적으로 유지됐다. 충돌·잘못된 점프·텍스트 손상은 없었다.
- 증거: `analysis/playtest_20260910_fixed/162_*`–`170_*`의 `result.json`, PNG, 체크포인트; 최신 `analysis/playtest_20260910_fixed/170_shop_npc_blue/checkpoint.mss`.
- 상태: targeted shop-front probe passed; continue from `170_shop_npc_blue`. Whole-game QA remains partial.

## [2026-09-10] [runtime-qa] [screenshot-cleanup]
- 후속 입력: `171`–`174`에서 상점 도로·수영장·공원 미끄럼틀 주변을 탐색했다. 문제 없는 반복 화면의 PNG만 `_archived_screenshots/`로 복구 가능하게 이동했고, 각 원본·아카이브 SHA-256을 `ARCHIVE_MANIFEST.json`에 기록했다.
- 보존: `result.json`, 체크포인트, 입력 상태, stdout/stderr는 원래 세그먼트에 유지했다. 대사·전환을 보여 주는 핵심 화면은 삭제·이동하지 않았다. QA 스크립트가 원본 또는 아카이브 위치를 모두 검증하도록 보완했다.
- 검증: QA 재실행 결과 208개 세그먼트·505개 스크린샷 해시 검증 통과. 영구 삭제는 없으며, 아카이브는 `analysis/playtest_20260910_fixed/_archived_screenshots/`에 있다.
- 상태: screenshot cleanup applied safely; continue from `174_park_npc` and archive only newly confirmed no-issue screenshots.

## [2026-09-10] [runtime-qa] [screenshot-cleanup-followup]
- 후속 입력: `175`–`176`에서 상점 도로의 북쪽·남쪽 경계를 재확인했다. 새 문제는 없었으며 두 세그먼트의 중복 PNG를 복구 가능한 `_archived_screenshots/`로 이동했다.
- 검증: 아카이브 manifest에 원본 경로·아카이브 경로·SHA-256을 추가하고 QA를 재실행했다. 210개 세그먼트·507개 스크린샷 해시 검증이 통과했다.
- 상태: screenshot cleanup remains recoverable; latest checkpoint is `analysis/playtest_20260910_fixed/176_street_south/checkpoint.mss`. Whole-game QA remains partial.

## [2026-09-10] [runtime-qa] [historical-screenshot-cleanup]
- 정리 범위: 이전 자연 플레이 세션 `playtest_20260909`와 `playtest_20260910_fixed`의 PNG를 전체 재검토했다. 충돌 재현, 수정 전후, 저장 검증, 선택창, 대표 한글 대사 화면 20개는 원래 위치에 보존하고, 나머지 문제 없는 반복 화면 463개를 세션별 `_archived_screenshots/`로 이동했다.
- 복구성: `analysis/playtest_20260909/_archived_screenshots/ARCHIVE_MANIFEST.json`에 115개, `analysis/playtest_20260910_fixed/_archived_screenshots/ARCHIVE_MANIFEST.json`에 372개의 원본 경로·아카이브 경로·크기·SHA-256을 기록했다. 영구 삭제·휴지통 이동은 하지 않았다.
- 검증: `python tools/record_natural_play_qa.py` 재실행 결과 210개 세그먼트·507개 스크린샷의 원본/아카이브 해시 검증이 통과했다. QA 스크립트는 두 세션의 아카이브 위치를 모두 검증한다.
- 상태: historical screenshot cleanup applied and recoverable; continue gameplay from `analysis/playtest_20260910_fixed/176_street_south/checkpoint.mss`.

## [2026-09-10] [runtime-qa] [natural-play-neighborhood-followup]
- 후속 입력: `177`–`184`에서 공원 서쪽·상점 주변·동네 도로와 대형 건물 앞을 탐색했다. 새 대화·맵 전환·텍스트 이상은 발견되지 않았다.
- 정리: 해당 9개 중복 PNG를 `_archived_screenshots/`로 이동하고 각 해시를 manifest에 추가했다. 체크포인트·입력 상태·로그는 원래 세그먼트에 보존했다.
- 검증: QA 재실행 결과 218개 세그먼트·516개 스크린샷의 원본/아카이브 해시 검증 통과.
- 상태: targeted neighborhood probe passed; latest checkpoint is `analysis/playtest_20260910_fixed/184_building_door/checkpoint.mss`.

## [2026-09-10] [runtime-qa] [natural-play-building-followup]
- 후속 입력: `185`–`192`에서 대형 건물·청색 지붕 건물·분홍색 주택 앞과 동네 맵 가장자리를 탐색했다. 모두 장식/경계 오브젝트로 안정적으로 유지됐으며 새 대화·전환·충돌은 없었다.
- 정리: 문제 없는 PNG 15개를 `_archived_screenshots/`로 이동하고 manifest에 해시를 추가했다. 세그먼트 결과·체크포인트·로그는 유지했다.
- 검증: QA 재실행 결과 226개 세그먼트·531개 스크린샷 검증 통과.
- 상태: targeted neighborhood building probe passed; latest checkpoint is `analysis/playtest_20260910_fixed/192_pink_house_edge/checkpoint.mss`.

## [2026-09-13] [release] [gap]
- 상황: 사용자가 V0.9 배포본을 요청했으나, 이 기존 GBA 프로젝트에는 game-translate 스킬이 요구하는 플랫폼별 `PROJECT.md` 릴리스 계약과 공식 배포용 에뮬레이터 전체 런타임 완료 기록이 없다.
- 영향: `release_status=released` 또는 완성판으로 선언할 수 없으며, 현재 알려진 미번역·레이아웃·mGBA 전체 검증 공백을 숨긴 정식 릴리스는 만들 수 없다.
- 해결/우회: 기존 GBA BPS 테스트 배포 경로를 계승해 `V0.9 프리릴리스`로만 패키징한다. 깨끗한 일본판 Rev 1 원본 해시를 강제하고 최신 후보 `a648a984...`를 재현하며, 원본/패치 ROM·저장 파일은 ZIP에서 제외한다. 알려진 제한사항과 부분 QA 상태를 설치 문서·릴리스 노트·manifest에 고정한다.
- 문서 개선 제안: game-translate 플랫폼 어댑터에 GBA BPS 릴리스 계약과 에뮬레이터 allowlist를 추가한다.
- 상태: open; V0.9 prerelease packaging allowed, official release gate remains blocked

## [2026-09-13] [release] [v0.9-prerelease]
- 산출물: `dist/EXE2_Rev1_KR_V0.9.zip`, 929,877바이트, SHA-256 `0800b3577b81d523205f252ded8a29f8759ae10304a0957d67ada72e12217753`.
- 내용: `EXE2_Rev1_KR_V0.9.bps`(SHA-256 `57b1eb52415aaad5704016635bb2d1c5f013fd4b26c1c94f4ef1314b2477f65f`), Windows 적용기, `INSTALL.md`, `RELEASE_NOTES.md`, manifest, Floating IPS v198 실행 파일·GPL 라이선스·동일 태그 소스. ROM·저장·상태 파일은 0개다.
- 검증: BPS와 ZIP 반복 생성 바이트 일치, 잘못된 원본 거부, 기존 출력 덮어쓰기 거부, 최종 ZIP 전수 구성원 해시·CRC 통과. 최종 ZIP을 새 폴더에 풀어 동봉 적용기로 적용한 결과가 최신 후보 SHA-256 `a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a`와 바이트 단위로 동일했다. 적용 결과는 MCP 없이 음소거 Mesen 2 콜드부팅 스모크를 통과했다.
- 증거: `analysis/exe2_rev1_v0_9_prerelease_package_qa.json`, `tools/build_v0_9_prerelease_patch.py`, `tools/v0_9_release_package/`.
- 한계: 자연 플레이 QA는 226세그먼트·531화면의 부분 범위다. mGBA 전체 경로, 전체 게임 완주, 남은 일본어 후속 스크립트와 보류 레이아웃은 미완료다. `release_ready=false`와 `official_final_release=false`를 manifest/receipt에 고정했다.
- 상태: V0.9 prerelease package passed; official final release remains blocked

## [2026-09-13] [debug] [myboy-pet-menu-fix]
- 사용자 요청: Claude Code 조사 기록을 이어 My Boy! START 메뉴 멈춤을 수정.
- 원인 1: 공용 IWRAM 라벨 출력기의 F9 FC 처리 누락. 원래 F9 처리기가 FC를
  길이 표 인수로 읽어 표 밖 `C1C4C8C4`를 문자열 주소에 더했다. CPU 재현에서
  `00/362/15`의 첫 잘못된 주소 `CA54DA8B`, Mesen 일반 입력에서도 같은 부류의
  잘못된 주소를 관측했다. `tools/menu_hangul_hook.py`로 F9 표 한 항목을 연결하고
  기존 글꼴 출력기를 호출하도록 수정했다. native F9는 원래 경로를 유지한다.
- 원인 2: 서브칩 빈 칸은 00/359의 마지막 경계 인덱스 159를 직접 선택한다.
  종료 코드가 재배치에서 빠져 검은 화면이 됐다. 구 V0.9에서도 재현했다.
  실제 원본 마지막 바이트가 E7인 raw 00/359, 00/363, 00/354의 빈 종료 코드
  3개를 보존한다. 물리 후속 영역 161개 중 추가 3개는 빈 항목이므로 미번역
  문장 증가가 아니다. 기존 미번역 후속 문장은 156개다.
- 산출물: `poc/output/exe2_rev1_kr_v0_9_1_myboy_fix2.gba`, SHA-256
  `106f7ab463faf8141d6fb5ed126c81ae5dfd8cc55d278a9151847c5d511c2110`.
  `dist/EXE2_Rev1_KR_V0.9.1_MyBoyFix.zip`, 930,079바이트, SHA-256
  `04c8b14cdee5d96896234ad12ab2cdccdf0eae75e57adf416ef0245ccc5f58bf`.
- 검증: 원본 기반 재빌드·전체 write 검증, 한글 162개/원문 162개 라벨 실제 ARMv4T
  실행 및 픽셀 대조, 빈 서브칩 항목, native F9 0–4, 스택·버퍼 검증 통과.
  최종 ROM Mesen 음소거 010–018 총 4,889프레임 일반 입력에서 PET/폴더/서브칩/
  라이브러리/상태/메일/키 아이템/통신 메뉴 취소/저장 완료/새 부팅/반복 메뉴/대사 통과.
  최종 ZIP 재추출 후 동봉 적용기 출력 바이트 일치·잘못된 원본 거부·덮어쓰기 방지 통과.
- 증거: `analysis/exe2_rev1_myboy_menu_investigation.md`, `*_cpu_qa.json`,
  `*_static_qa.json`, `*_runtime_review.json`, `analysis/exe2_rev1_myboy_fix_package_qa.json`.
- 재개: `analysis/myboy_menu_fix_runtime/018_final_dialogue/checkpoint.mss`는 새 후보에만
  사용할 수 있다. 사용자 My Boy!에는 이전 즉시 상태가 아닌 새 부팅/일반 저장을 안내.
- 보존: Claude의 미커밋 진단 도구/패키지와 기존 삭제 상태는 변경하지 않았다.
  첫 단독 메뉴 훅 후보(`...myboy_fix.gba`)는 서브칩 결함이 남은 조사용이며 사용하지 않는다.
- 상태: PC causal fix + targeted regression PASS; **My Boy! device confirmation PENDING**.

## [2026-09-13] [fix] [choice-menu-layout]
- 사용자 화면 54/55에서 확인된 야이토 교실 선택창(00/404 엔트리 6, 7, 8)과 책장 선택창(엔트리 10)의 질문/선택지 경계를 검토 목록으로 고정했다. 질문은 21칸·3행 안에서 줄바꿈하고 선택지 두 항목은 원래 `option`/`space`/`select` 제어 명령과 분기 대상을 보존한다. 미검토 선택창에는 전역 자동변환을 적용하지 않는다.
- PET 첫 메뉴의 그래픽 글자 9개(칩 폴더, 서브칩, 데이터 라이브러리, 록맨, 이메일, 키 아이템, 통신, 저장, 돌아가기)를 원본의 4bpp 타일/4개 맵의 기존 빈 전용 타일에 같은 크기로 삽입했다. 에그제 1 [K] 허가 글리프를 사용했으며 로더 소스·VRAM 적재·BG0 맵 복사 경로를 정적 및 Mesen 음소거 trace로 확인했다. ROM 크기 증가는 없다.
- 산출물: `poc/output/exe2_rev1_kr_v0_9_2_choice_menu.gba`, SHA-256 `fbd46e84a6847993a565f452d7e75d477e9bf7b513269da2befba27b04df843b`.
- 배포 패치: `dist/EXE2_Rev1_KR_V0.9.2_ChoiceMenuFix.zip`, SHA-256 `9a7e2c7694446013648a7fc26d753d2eaa1be61dcb1fca21447a2ffe017fb7ed`, BPS SHA-256 `f3265c5a07fff445843eacd7fe8dc36922696c49b1f5d4fa012da4ebf5e98923`. ZIP에는 원본 ROM·세이브·상태 파일이 없다.
- 검증: 정적 전체 write/아카이브/폰트/그래픽 보호영역 PASS, 기존 My Boy 메뉴 CPU 회귀 PASS, Mesen `--noAudio` 일반입력으로 메뉴/서브메뉴 재진입과 PET 타일 적재 trace PASS. 패키지 압축 재현성과 적용 후 ROM 바이트 동일성 PASS.
- 한계: 이 환경에서 자연 NPC 이동으로 야이토 선택창까지 도달하는 전체 경로와 실제 Android My Boy! 기기 실행은 아직 확인하지 않았다. 따라서 이 버전은 선택창·PET 메뉴 수정 검증 후보이며 공식 완주판이 아니다.

## [2026-09-13] [fix] [pet-submenu-static-tables]
- 사용자 요청으로 칩 폴더·서브칩·데이터 라이브러리·록맨·이메일·키 아이템·통신·저장 하위 메뉴의 정적 이름/설명/공용 문구를 확장 ROM 테이블로 재배치하고 한글화했다. 칩 이름 255개, 칩 설명 255개, 공용 PET 문구 142개를 대상으로 하며 기존 포인터 리터럴도 함께 재배치했다.
- 산출물: `poc/output/exe2_rev1_kr_v0_9_3_submenu.gba`, SHA-256 `694ffab7a654f2070667d8bb1a964280534dccf087b0e46c1cd434022dcfa623`. 정적 검증은 `analysis/exe2_rev1_submenu_static_qa.json`의 `PASS (bench)`다.
- 음소거 Mesen 2에서 기존 메뉴 체크포인트를 후보 ROM에 결합한 뒤 8개 하위 메뉴 경로(폴더/라이브러리/록맨/메일/키 아이템/통신/저장)를 일반 입력으로 확인했다. 각 세그먼트는 `analysis/pet_layout_menu_fix_v093/015_folder`–`021_save`에 보존되어 있고, `invalid_stream=null`, 비정상 종료 없음이다. 메뉴 진입용 시드는 이전 후보 체크포인트에서 파생했으므로 콜드부팅 전체 경로 증거로 과장하지 않는다.
- 배포 패치: `dist/EXE2_Rev1_KR_V0.9.3_SubmenuFix.zip`, SHA-256 `c5e0d12ced0e399050df19a9a5ae9ca7f0986fde22768d1354a252ebd508bcb2`, BPS SHA-256 `5e30127db3e1bdbf8ef0115fb23b6d9ca076dd52bf8f771b08f0ccd31bfd9770`. 패키지 압축 해제 후 동봉 Flips v198으로 적용한 결과가 후보 ROM과 바이트 단위로 일치했다.
- 제한: 일부 하위 화면의 상단 제목 그래픽(예: `チップフォルダ`, `データライブラリ`, `Eメール`, `キーアイテム`, `つうしん`, `セーブ`)과 통신 화면의 일부 고정 라벨은 별도 그래픽/상태 자산이라 이번 정적 텍스트 패스에서 아직 일본어 또는 영어로 남을 수 있다. 칩 이름·설명 및 본문 문구는 한글화되었으며, 제목 그래픽까지 완전 한글화하려면 별도 타일맵 분석이 필요하다.
- 상태: 하위 메뉴 정적 번역 후보 및 BPS 패키지 준비 완료; 제목 그래픽 잔여분과 Android My Boy! 실기 확인은 미완료.
