# 아카이브 00/09 야이토 선택지 깨끗한 통합 PoC

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_yai_choice_clean_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `93cd24555d06618bb536823eba30f7b700cbfc48a5622b6049b107ae122e7fb8`
- 지원 원본 SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_yai_choice_draft.json`
- 통합 매니페스트: `poc/output/integrated_archive_00_09_dialogue_yai_choice_clean_manifest.json`

지원 원본 Rev 1에서 직접 재현하는 비배포 개발용 전체 ROM이다. 과거 활성 블록
진단용 `가나다` 삽입은 기본 빌드에서 생략된다. 번역 문안은 사람 검수 전의 기계
초안이며 릴리스 후보가 아니다.

## 이번 확대 범위

- 번역 엔트리: 0, 1, 2, 3, 4, 5, 6, 13 — 8개
- 원본 그대로 보존된 엔트리: 246개
- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,182바이트 (`+110`)
- 번역 후 해제 데이터 SHA-256:
  `4cf622354c09982c48276c7e3f3a0f9dd81818c30a5b5ad04ff95088891977d2`
- 재압축 스트림: 4,524바이트
- 코드페이지 배정: 107/256, 남은 슬롯 149개
- 이 빌드에서 실제 요구되는 한글 글리프: 101자

엔트리 6의 76바이트 원본 중 표시·선택 범위 `[5,75)`만 구조화 교체했다. 첫
페이지는 `어머, 넷토! 좋은 아침!`, 둘째 페이지는 `어때? 내 컬렉션 얘기 / 듣고
싶지?`와 `응 / 아니` 선택지다. 원래의 `EB E9`, 두 `E8`, 두 쌍의 `EF/EE`,
`F0 06 80 08 07 FF`, 마지막 `E7`은 순서와 매개변수까지 그대로 보존했다.

빌더는 `EA/EE/EF/F0`을 새로 만들거나 의미를 추정하지 않는다. 원문에서 관찰된
고정 길이 프레임을 불투명 제어 바이트열로 취급하며, 구조화 교체의 제어열이
원문과 한 바이트라도 다르면 빌드를 거부한다.

## 정적·적재 검증

`analysis/archive_00_09_dialogue_yai_choice_clean_verification.json`은 다음을 독립
재구성해 `passed: true`를 기록한다.

- 원래 압축 슬롯 보존
- 246개 미번역 엔트리의 바이트 동일성
- 8개 번역 엔트리와 구조화 세그먼트의 일치
- 254개 `u16` 오프셋 테이블 재해석
- 요구 글리프와 래스터 결과 일치
- GBA 헤더 보수 체크섬
- 재배치 스트림 소비 길이 4,524바이트
- 확장 꼬리의 미사용 영역 `FF` 유지

`tools/verify_runtime_archive_dump.py`로 정상 새 게임 중 적재한 EWRAM 6,182바이트와
ROM의 재배치 해제본을 비교했고 서로 다른 바이트는 0개였다. 결과는
`analysis/emucap/dialogue_yai_choice_clean_normal_load_verification.json`에 있다.

## 자연 플레이와 분기 검증

새 부팅부터 오프닝을 진행하고 교실을 직접 이동해 야이토와 대화했다. 엔트리 6
첫 표시 바이트 EWRAM `0x02038B30` 읽기가 프레임 6,907에서 적중했고, 함께 캡처한
87바이트는 재구성 엔트리 6 전체와 SHA-256까지 일치했다.

- `analysis/emucap/yai_choice_entry6_page1_natural.png`: 첫 페이지가 잘림 없이 표시됨
- `analysis/emucap/yai_choice_entry6_choice_natural.png`: 둘째 페이지와 `응 / 아니`가 표시됨
- `analysis/emucap/yai_choice_entry6_no_selected.png`: 커서가 `아니`로 이동함
- `analysis/emucap/yai_choice_entry6_yes_branch_entry8.png`: 기본 `응`이 엔트리 8로 분기함
- `analysis/emucap/yai_choice_entry6_no_branch_entry7.png`: `아니`가 엔트리 7로 분기함
- `analysis/emucap/yai_choice_entry6_b_continue.png`: B 입력이 원래 후속 경로로 진행함
- `analysis/emucap/dialogue_yai_choice_clean_natural_progression.json`: 화면 해시와 판정을 묶어 `passed: true`

새 게임 첫 대사 체크포인트는 이전 깨끗한 빌드와 PNG 인코딩 바이트는 달랐지만,
240×160 전체 픽셀 비교 결과 서로 다른 픽셀이 0개였다. 한글 추가로 인한 오프닝
화면 회귀는 관찰되지 않았다.

## 남은 한계

현재 번역된 것은 아카이브 254개 중 8개뿐이며 게임 전체 범위가 아니다. 문안은
사람 번역 검수와 승인이 필요하다. 다음 후보는 `아니`와 B 입력 뒤에 표시되는
엔트리 7의 반복 선택지, 그리고 `응` 뒤에 이어지는 엔트리 8의 네 페이지 및
추가 선택지다. 공개 배포 전에는 전체 범위 회귀 시험과 원본 ROM을 포함하지 않는
차분 패치 생성이 필요하다.
