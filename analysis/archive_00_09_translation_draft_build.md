# 아카이브 00/09 번역 초안 통합 PoC

## 산출물과 범위

`tools/build_integrated_archive_translation_draft_poc.py`는 수정하지 않은 일본판 Rev 1 ROM에서 다음을 한 번에 다시 만든다.

1. 이미 검증한 활성 메시지 블록 9개 엔트리의 `가나다` PoC
2. LZ77 아카이브 00/09 엔트리 2의 첫 대사 번역 초안
3. 같은 아카이브 엔트리 13의 화면에 표시되는 네 페이지 전체 번역 초안
4. 두 초안에 필요한 한글 56자와 기존 배정을 보존한 시험용 코드페이지

최신 로컬 테스트 ROM은 `poc/output/exe2_rev1_archive_00_09_translation_draft_full_poc.gba`이며 SHA-256은 `f06eab70f6c76992a38ccf0371362e379dd3e6c785f682b6004dc597857558d6`이다. 크기는 16,777,216바이트다. 이 파일은 배포 패치가 아니라 로컬 실행용 전체 ROM 사본이다.

## 원문 경계와 번역 자산

엔트리 13은 검증된 Rev 1 엔트리 경계와 제어 토큰을 유지한 채 네 페이지로 분해했다. 원문 글자 디코딩에는 TextPet의 EXE2 UTF-8 테이블을 참고했고, 페이지 경계는 실제 바이트열의 `EB E9`, 줄바꿈은 `E8`, 마지막 종료열은 `EB F2 00 0E 02 E7`로 독립 확인했다.

- 페이지 1: `저기...` / `PET의 START를 눌러` / `서브 화면으로 들어가면...`
- 페이지 2: `E메일을 읽거나,` / `칩 폴더를 정리할 수도` / `있지`
- 페이지 3: `그리고 L버튼을 누르면` / `PET 안의 내비와` / `대화할 수도 있지`
- 페이지 4: `난 좀 둔해서` / `금방 잊어버리거든.`

구조화 번역 자산은 `translations/archive_00_09_entries_2_13_draft.json`, 원문 페이지 카탈로그는 `analysis/archive_00_09_entry_13_source_pages.json`, 코드페이지는 `poc/output/korean_codepage_archive_00_09_draft_full.json`에 있다. 번역 상태는 `machine_draft_needs_human_review`다.

## 구조 및 빌드 검증

번역 자산은 원본 Rev 1의 6,072바이트 해제본 SHA-256 `92852d9c874fe0d5293d0c47920f2b987ff1de9fef232fa24489b7700a670667`과 엔트리별 원본 바이트를 보호 필드로 가진다. 빌더는 재추출 결과가 다르면 쓰기를 시작하지 않는다.

- 엔트리 2: 원본 표시 구간 9바이트를 15바이트로 교체, `+6`바이트
- 엔트리 13: 네 페이지 원본 표시 구간 145바이트를 185바이트로 교체, `+40`바이트
- 전체 해제본: 6,072바이트에서 6,118바이트로 증가
- 재압축 스트림: 4,440바이트
- 교체 해제본 SHA-256: `06160d572e185b57d8c6acc40f09a430b7d9b79657f10a8e0eefa3457b7b8953`
- 페이지 상대 시작 위치: `0, 54, 98, 154`

엔트리 13 안의 줄바꿈 `E8` 7개와 페이지 전환 `EB E9` 3쌍을 같은 순서로 보존했다. 마지막 페이지 뒤의 종료 제어열은 교체 범위 바깥에 그대로 남는다. 증가량을 반영해 254개 엔트리의 후속 u16 오프셋을 다시 계산하고 테이블 전체를 재파싱했다. 무수정·번역 해제본 모두 압축→해제 자기 왕복을 통과했다.

원본부터 최종 ROM까지 8 MiB 범위에서 달라진 2,813바이트는 두 구성요소 매니페스트가 선언한 활성 블록, 포인터, 폰트 레코드 범위에만 있다. 확장 영역은 `0x800000`의 재압축 아카이브 이외가 모두 `FF`다. 별도 재빌드도 같은 최종 SHA-256을 냈다.

독립 검증기 `tools/verify_archive_translation_draft_build.py`는 빌더의 중간 결과를 신뢰하지 않고 기대 해제본을 다시 구성했다. 미번역 252개 엔트리 바이트 동일성, 두 구조화 번역 구간, 전체 u16 오프셋, 56개 글리프 레코드, GBA 헤더 보수 체크섬과 확장 tail을 검사했다. 결과는 `analysis/archive_00_09_translation_draft_full_verification.json`이며 `passed: true`다.

## 실제 렌더러 페이지 진행 검증

엔트리 13 페이지 1에서 멈춘 기존 mGBA 상태에 이 빌드의 정확한 6,118바이트 EWRAM 풀과 시작 포인터를 넣어 다시 그렸다. 이후 페이지 2~4는 포인터를 직접 조작하지 않고 mGBA에 설정된 실제 A 버튼을 눌러 진행했다.

- `analysis/emucap/archive_entry_13_translation_draft_full_page_1.png`
- `analysis/emucap/archive_entry_13_translation_draft_full_page_2.png`
- `analysis/emucap/archive_entry_13_translation_draft_full_page_3.png`
- `analysis/emucap/archive_entry_13_translation_draft_full_page_4.png`

네 페이지 모두 실제 게임 렌더러에서 의도한 줄 수로 표시됐고 창 밖 잘림이나 겹침이 없었다. 페이지 1~3의 다음 페이지 표시는 유지됐으며 실제 버튼 진행으로 다음 페이지가 나타났다. 페이지 2~4 시작 주소를 직접 가리킨 실패 상태는 QA 증거에서 제외하고 `analysis/emucap/rejected/`로 이동했다. 화면 증거는 명시적인 상태 개입 렌더링이며 정상 ROM 적재 자체를 대신하지 않는다.

## 정상 ROM 적재 검증

최신 ROM을 MesenCE/emucap으로 새로 부팅하고 타이틀에서 `START → A`만 입력했다. 프레임 1437에서 ROM `0x08800000` 읽기 중단점이 적중했다. 이 시점의 EWRAM을 덤프해 `0x02038800`부터 6,118바이트를 ROM의 재배치 스트림 해제본과 비교했다.

- ROM 해제본 SHA-256: `06160d572e185b57d8c6acc40f09a430b7d9b79657f10a8e0eefa3457b7b8953`
- 실행 중 EWRAM SHA-256: `06160d572e185b57d8c6acc40f09a430b7d9b79657f10a8e0eefa3457b7b8953`
- 서로 다른 바이트 수: `0`
- 결과: `analysis/emucap/translation_draft_full_normal_load_verification.json`, `passed: true`

따라서 최신 출력 해시에서도 정상 부팅 로더가 재배치 아카이브를 읽고 정확한 254개 엔트리 풀을 EWRAM에 적재한다는 증거와, 상태 개입을 통한 네 페이지 렌더링·진행 증거를 분리해 확보했다.

## 현재 판정

엔트리 2와 엔트리 13 네 페이지는 제어코드 보존 재삽입, 독립 정적 검증, 정상 로더 적재, 실제 렌더링 및 페이지 진행까지 통과했다. 다만 번역문은 기계 초안이며 코드페이지도 이 좁은 범위를 위한 시험 배정이다. 그러므로 이 결과는 개발 PoC이고, 배포 후보나 완성 한글 패치로 승격하지 않는다.
