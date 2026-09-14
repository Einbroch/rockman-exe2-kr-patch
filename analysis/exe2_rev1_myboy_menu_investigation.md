# My Boy! PET 메뉴 멈춤 수정 기록

최종 확인용 후보: `poc/output/exe2_rev1_kr_v0_9_1_myboy_fix2.gba`.
SHA-256: `106f7ab463faf8141d6fb5ed126c81ae5dfd8cc55d278a9151847c5d511c2110`.
My Boy! 기기 확인은 아직 하지 않았으며, 아래 수정과 PC 검증만 완료했다.

## 1. 한글 제어 코드가 메뉴의 원본 F9 처리기로 들어가는 문제

Claude Code의 `466cf74a-445b-4500-85b1-395a20ac5685` 작업 기록과 진단
빌드를 읽었다. 사용자가 확인한 결과는 00/362 원문 복원 시 메뉴 정상,
주소 이동·ROM 크기 조정·15바이트 이하 한글 유지 시 멈춤이었다.
원문 길이로 제한했던 성공 빌드는 한글을 유지한 것이 아니라 빈 엔트리만
유지했으므로, 그 결과는 바이트 길이 한계를 입증하지 않는다.

직접 확인한 실행 경로:

- 메뉴 호출 `080251B8` → `08020F38` → IWRAM `03006DC8`.
- ROM `1E62C8`의 코드가 IWRAM에서 실행된다. 해당 출력기는 F9 FC를 모른다.
- F9 테이블 항목: ROM `1E62A4`, 실행 시 IWRAM `03006DA4`.
- 원본 F9 처리기 `0300707C`는 다음 바이트를 기존 인수로 읽는다.
- FC를 받으면 길이 표 `0300708C + FC = 03007188`의 표 밖 데이터를 읽는다.
  실제 덤프와 ROM 모두 해당 워드가 `C1C4C8C4`였다.
- 이를 문자열 주소에 더해 잘못된 메모리로 이동한다. 00/362/15 CPU 재현의
  첫 잘못된 문자열 주소는 `CA54DA8B`였다. Mesen 일반 입력 재현에서도
  `008_baseline_instrumented/invalid_menu_stream_cpu.json`에 비정상 주소가
  기록됐다. Mesen은 구 화면을 그럴듯하게 남기기도 하므로 메뉴가 보인다는
  사실만으로 정상 소비라고 판정할 수 없다.

수정은 F9 테이블의 한 항목을 새 처리기 `08830301`로 연결한다. FC 표식일 때만
2바이트 한글 번호를 읽고 기존 64바이트 글꼴 출력 루틴을 호출한다. 문자열은
4바이트, 글자 수는 1칸 이동한다. native F9는 원래 처리기로 보낸다. r6와 LR,
스택, native 글꼴과 다른 제어 항목을 보존한다. 글꼴이나 번역을 일본어로
되돌리지 않았다. 복사된 IWRAM 코드가 옛 상태에 남으므로 새 부팅이 필요하다.

Claude 기록의 “29개 미설치 렌더러”는 확정된 분모가 아니다. 31개는 `E7 29`
바이트 검색 결과이며 25개가 텍스트/자산 영역에 있다. 나머지 중 일부도 코드가
아닌 데이터 패턴이다. 이를 31개의 실제 텍스트 함수로 간주하거나 모두 패치하지
않았다. 이번 수정 범위는 호출과 실행을 확인한 공용 메뉴 출력기다.

## 2. 빈 서브칩 항목이 다음 아카이브까지 읽는 문제

첫 수정본으로 메뉴를 연 뒤 서브칩을 선택하자 검은 화면이 재현됐다. 구 V0.9도
동일했다 (`003_subchip_library`, `005_baseline_subchip`).
직접 호출 기록은 아카이브 `00/359`와 엔트리 `159`였다.

159는 표의 마지막 경계 값이지만 게임 코드는 이를 실제 빈 항목으로 선택한다.
원문 `735D96`에는 E7 종료 명령이 있다. 이전 재배치기는 스크립트 내 jump로
참조된 마지막 항목만 보존했기 때문에 native 메뉴 호출의 이 항목을 빠뜨렸다.
그 결과 종료 명령 대신 다음 아카이브의 포인터 표를 읽고 출력과 실행이 손상됐다.

raw 아카이브의 마지막 경계에 실제 E7이 있는 경우 해당 원본 1바이트를 보존하도록
수정했다. 새로 보존되는 것은 `00/359` (`735D96`), `00/363` (`7E53A4`),
`00/354` (`7F166D`) 세 곳이다. 임의의 공통 패딩을 넣는 방식이 아니다.
전체 물리 후속 영역 수는 158→161이며, 추가 3개는 번역 대상 문장이 아닌 빈 항목이다.
기존 미번역 후속 문장은 여전히 156개다. manifest의 source-language 후속 영역
159개 집계에는 이 빈 항목 3개가 포함된다.

## 검증과 재생성

두 변경은 `tools/build_semantic_translation_dev_rom.py`의 원본 기반 빌드에
통합했다. `tools/menu_hangul_hook.py`가 ARM7TDMI Thumb-1 코드를 어셈블하고
독립 디스어셈블 및 명령별 재어셈블을 대조한다. 새 코드는 19개 명령이며
소스 테이블 기대 값, 글꼴 주소, 반환 경로와 최종 write 범위도 검사한다.
로컬 도구: keystone-engine 0.9.2, unicorn 2.1.4. 설치 경로는
`external/menu_debug_python`이다. 설치 명령:
`python -m pip install --target external/menu_debug_python keystone-engine==0.9.2 unicorn==2.1.4`.
도구 설명: https://www.keystone-engine.org/docs/tutorial.html 및 https://www.unicorn-engine.org/.

- `exe2_rev1_myboy_menu_static_qa.json`: 원본 해시, 381개 아카이브, 574개
  포인터, 2,351개 폰트, 161개 후속 영역과 전체 최종 변경 범위 통과.
- `exe2_rev1_myboy_menu_cpu_qa.json`: 구 ROM 잘못된 주소 재현, 한글 라벨
  162개·원문 라벨 162개, 픽셀 단위 글꼴 대조, 버퍼/스택, 기존 F9 인수 0–4,
  서브칩 빈 항목 159 종료 통과. 전체 Android 실행을 대신하는 증거는 아니다.
- `exe2_rev1_myboy_menu_runtime_review.json`: 최종 ROM을 음소거 Mesen에서
  게임 내 저장으로 새 부팅한 뒤 9개 구간, 4,889프레임 일반 입력으로 검증.
  PET·폴더·서브칩·라이브러리·상태·메일·키 아이템·통신 메뉴 취소·저장·재부팅·
  메뉴 반복·일반 한글 대사 확인. 실제 통신 상대 연결과 전체 게임 완주는 미검증.

381개 formal 아카이브의 텍스트 해시와 글꼴은 V0.9와 동일하다. 변경된 배치는
원본에서 계산한 포인터로 갱신되며 이전 `.ss1/.ss2`를 새 ROM에 불러오면 안 된다.
배포 ZIP은 ROM·저장 파일을 포함하지 않는 BPS 확인용 패치로만 만든다.

프로젝트 루트에서 현재 후보 재빌드 명령(동명 출력이 이미 있으면 다른 새 경로 지정):

```powershell
python -X utf8 tools/build_semantic_translation_dev_rom.py `
  --source-rom 'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba' `
  --base-translation translations/archive_00_09_dialogue_draft.json `
  --translations-dir translations --analysis-dir analysis `
  --textpet-exe external/TextPet-v1.0.0/TextPet.exe `
  --plugins-dir external/TextPet-plugins-6c6d705/TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins `
  --exe1-k-font-rom 'Battle Network Rockman EXE 1 [K].gba' `
  --font-permission-record analysis/exe1_k_font_permission_record.json `
  --fallback-font C:/Windows/Fonts/gulim.ttc `
  --output-rom poc/output/exe2_rev1_kr_v0_9_1_myboy_rebuild.gba `
  --manifest poc/output/exe2_rev1_kr_v0_9_1_myboy_rebuild_manifest.json
```

MyBoyFix ZIP의 SHA-256은
`04c8b14cdee5d96896234ad12ab2cdccdf0eae75e57adf416ef0245ccc5f58bf`이며
930,079바이트다. 원본 Rev 1에 적용한 결과가 최종 후보와 바이트 단위로 일치한다.
