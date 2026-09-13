# 아카이브 00/09 야이토 인사 깨끗한 통합 PoC

> 이전 기준선이다. 엔트리 6의 두 페이지와 한글 선택지 및 양쪽 분기 검증까지
> 포함한 최신 기준선은 `analysis/archive_00_09_dialogue_yai_choice_clean_build.md`다.

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_yai_clean_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `f79aeabe272d06c2842b07fb6e723d6b94cf15f5f47f161c4cde8b38643193af`
- 지원 원본 SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_yai_draft.json`
- 통합 매니페스트: `poc/output/integrated_archive_00_09_dialogue_yai_clean_manifest.json`

지원 원본 Rev 1에서 매번 직접 재현하는 비배포 개발용 전체 ROM이다. 번역 문안은
사람 검수 전의 기계 초안이며 릴리스 후보가 아니다. 과거 활성 블록 진단용
`가나다` 삽입은 기본 빌드에서 생략된다.

## 이번 확대 범위

- 번역 엔트리: 0, 1, 2, 3, 4, 5, 13 — 7개
- 원본 그대로 보존된 엔트리: 247개
- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,171바이트 (`+99`)
- 번역 후 해제 데이터 SHA-256:
  `972ab6355b72cb9beddcca8a69c24711e99a8ace6941f844448bf3d547c14571`
- 재압축 스트림: 4,504바이트
- 코드페이지 배정: 98/256, 남은 슬롯 158개
- 이 빌드에서 실제 요구되는 한글 글리프: 92자

엔트리 5의 원문 표시 범위 7바이트만 `안녕, 야이토!`로 바꾸고, 앞쪽 조건·화자
제어와 뒤쪽 `EB E9 F5 00 06`을 그대로 보존했다. 따라서 입력 대기와 창 정리 뒤
엔트리 6으로 넘어가는 원래 점프 구조는 바뀌지 않는다. 선택지가 포함된 엔트리
6은 아직 번역하지 않았다.

## 정적·적재 검증

`analysis/archive_00_09_dialogue_yai_clean_verification.json`은 다음을 독립 재구성해
`passed: true`를 기록한다.

- 원래 압축 슬롯 보존
- 247개 미번역 엔트리의 바이트 동일성
- 7개 번역 엔트리와 구조화 세그먼트의 일치
- 254개 `u16` 오프셋 테이블 재해석
- 요구 글리프와 래스터 결과 일치
- GBA 헤더 보수 체크섬
- 재배치 스트림 소비 길이 4,504바이트
- 확장 꼬리의 미사용 영역 `FF` 유지

정상 새 게임 중 적재한 EWRAM 6,171바이트와 ROM의 재배치 해제본도 서로 다른
바이트 0개였다. 결과는
`analysis/emucap/dialogue_yai_clean_normal_load_verification.json`에 있다.

## 자연 플레이 검증

이 ROM 해시로 새 부팅부터 정상 경로를 진행했다. 새 게임 첫 체크포인트 PNG의
SHA-256은 지원 원본 체크포인트와 같은
`0a8440bb5c59249c784ffa270764d2723302b135eeefb747b4a62587f7139803`이다.

엔트리 5의 재구성된 첫 표시 바이트를 읽는 지점인 EWRAM `0x02038B19`에
중단점을 두었고 프레임 15,079에서 적중했다. 이때 다음을 확인했다.

- `analysis/emucap/yai_clean_entry5_natural.png`: `안녕, 야이토!`가 잘림 없이 표시됨
- `analysis/emucap/yai_clean_entry6_jump_natural.png`: 원래 점프로 엔트리 6에 진입함
- `analysis/emucap/yai_clean_entry6_choice_natural.png`: 원래 선택지가 표시되고 진행됨
- `analysis/emucap/dialogue_yai_clean_natural_progression.json`: 위 경로와 화면 해시를 묶어 `passed: true`

## 남은 한계

현재 번역된 것은 아카이브 254개 중 7개뿐이며, 게임 전체 텍스트 범위가 아니다.
문안은 사람 번역 검수와 승인이 필요하다. 다음 구조 분석 대상은 선택지 제어를
포함한 엔트리 6이며, 번역 범위를 확대할 때도 원문 조건·점프·선택지 토큰을
구조화 필드로 보존해야 한다. 공개 배포 전에는 전체 범위 회귀 시험과 원본 ROM을
포함하지 않는 차분 패치 생성이 필요하다.
