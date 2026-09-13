# 아카이브 00/09 야이토 재질문 통합 PoC

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_yai_retry_clean_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `e29e2890b48c5f0e008214b8026715e30dbb5eb28caa31595fe0490fae77ac59`
- 지원 원본 SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_yai_retry_draft.json`
- 통합 매니페스트: `poc/output/integrated_archive_00_09_dialogue_yai_retry_clean_manifest.json`

지원 원본 Rev 1에서 직접 재현하는 비배포 개발용 전체 ROM이다. 번역 문안은
사람 검수 전의 기계 초안이며 릴리스 후보가 아니다.

## 이번 확대 범위

- 번역 엔트리: 0, 1, 2, 3, 4, 5, 6, 7, 13 — 9개
- 원본 그대로 보존된 엔트리: 245개
- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,195바이트 (`+123`)
- 번역 후 해제 데이터 SHA-256:
  `7a3d0bd60eac7ff8c2f727eec988894d5137a1482f67318af33ac4f64043573a`
- 재압축 스트림: 4,520바이트
- 코드페이지 배정: 109/256, 남은 슬롯 147개
- 이 빌드에서 실제 요구되는 한글 글리프: 103자

엔트리 7의 46바이트 원본 중 표시·선택 범위 `[5,45)`만 구조화 교체했다.
표시 문안은 `그런 말 말고 들어 보라니까!`와 `응 / 아니`다. 원래의 줄 제어
`E8`, 두 쌍의 `EF/EE`, 선택 프레임 `F0 06 80 08 07 FF`, 마지막 `E7`은
순서와 매개변수까지 그대로 보존했다. 선택 대상 `[8, 7, continue]`, 기본값 0,
`disable_b: false`, `clear: true`도 원본 추출 구조와 같다.

빌더는 `EA/EE/EF/F0`을 의미 추정으로 다시 만들지 않는다. 원문에서 관찰된
고정 길이 프레임을 불투명 제어 바이트열로 취급하며, 구조화 교체의 제어열이
원문과 한 바이트라도 다르면 빌드를 거부한다.

## 정적·적재 검증

`analysis/archive_00_09_dialogue_yai_retry_clean_verification.json`은 `passed: true`다.

- 원래 압축 슬롯 보존
- 245개 미번역 엔트리의 바이트 동일성
- 9개 번역 엔트리와 구조화 세그먼트의 일치
- 254개 `u16` 오프셋 테이블 재해석
- 요구 글리프와 래스터 결과 일치
- GBA 헤더 보수 체크섬
- 재배치 스트림 소비 길이 4,520바이트
- 확장 꼬리의 미사용 영역 `FF` 유지

새 ROM으로 처음부터 부팅하고 새 게임의 오프닝 대사까지 진행한 뒤 EWRAM을
덤프했다. `tools/verify_runtime_archive_dump.py`가 EWRAM `0x38800`의 6,195바이트를
ROM 재배치 해제본과 비교했으며 서로 다른 바이트는 0개였다. 결과는
`analysis/emucap/dialogue_yai_retry_clean_normal_load_verification.json`에 있다.

## 음소거 런타임 및 선택지 검증

성공한 Mesen 2 실행은 `display:false`, `sound:false`로 시작했다. 따라서 이번
에뮬레이터 테스트 동안 소리는 활성화하지 않았다.

집중 분기 시험은 이전 빌드에서 자연 진입으로 확보한 엔트리 6 선택지 상태를
재사용했다. 상태 로드는 이전 EWRAM도 복원하므로, 로드 직후 이번 ROM의 재구성
아카이브 전체 6,195바이트를 `gbaExtWorkRam:0x38800`에 썼다. 입력 SHA-256은
`7a3d0bd60eac7ff8c2f727eec988894d5137a1482f67318af33ac4f64043573a`이며,
다시 덤프해 비교한 결과도 차이 0바이트였다. 이 개입은 자연 로드 검증과 섞지
않고 `analysis/emucap/dialogue_yai_retry_clean_progression.json`에 별도로 기록했다.

- `yai_retry_entry7_choice_muted.png`: 한글 문장과 `응 / 아니`가 정상 표시됨
- `yai_retry_entry7_yes_branch_entry8_muted.png`: 기본 `응`이 엔트리 8로 이동함
- `yai_retry_entry7_no_selected_muted.png`: 커서가 `아니`로 이동함
- `yai_retry_entry7_no_branch_loop_muted.png`: `아니`가 엔트리 7을 반복함
- `yai_retry_entry7_b_continue_retry_muted.png`: 번역 엔트리 7에서 B 입력 후 화면 유지
- `yai_retry_original_entry7_b_baseline_muted.png`: 원본 엔트리 7에서도 같은 B 동작 확인

번역 문장과 선택지에는 잘림, 겹침, 잔상은 관찰되지 않았다. 두 명시적 선택
분기는 정지 없이 진행했다. B 입력은 엔트리 7을 벗어나지 않았지만, 같은 상태의
원본 스크립트에서도 동일했으므로 패치 회귀로 판정하지 않았다.

## 남은 한계

현재 번역된 것은 아카이브 254개 중 9개뿐이며 게임 전체 범위가 아니다. 문안은
사람 번역 검수와 승인이 필요하다. 엔트리 7 집중 시험에는 기록된 상태 로드와
전체 아카이브 메모리 쓰기가 포함됐으므로, 향후 전체 회귀 단계에서는 새 ROM을
처음부터 플레이해 같은 두 분기를 다시 확인해야 한다. 다음 구조화 번역 후보는
기본 `응` 뒤에 이어지는 엔트리 8의 본문과 후속 선택지다. 공개 배포 전에는 전체
스크립트 범위 확대, 전체 플레이 회귀 시험, 원본 ROM을 포함하지 않는 차분 패치
생성이 필요하다.
