# 아카이브 00/09 덱카오 대화 깨끗한 통합 PoC

> 이전 기준선이다. 엔트리 5 야이토 인사와 자연 진행 검증을 포함한 최신 기준선은
> `analysis/archive_00_09_dialogue_yai_clean_build.md`다.

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_dex_clean_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `385577d84b06ee60910a8c18c833e47b4b51fe3bf09023a9e4f945b618fd1972`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_dex_draft.json`
- 통합 매니페스트: `poc/output/integrated_archive_00_09_dialogue_dex_clean_manifest.json`

지원 원본 Rev 1에서 직접 재현하는 비배포 개발용 ROM이다. 번역은 사람 검수를
받지 않은 기계 초안이며 릴리스 후보가 아니다.

## 활성 블록 진단 삽입 제거

이전 통합 빌더는 아카이브 번역 전에 과거 활성 블록 실험을 실행해 9개 엔트리에
`가나다`를 삽입했다. 새 게임 첫 대사에서 이 세 글자가 실제로 표시됐다.
픽셀·글리프 대조 결과는 각각 U+AC00, U+B098, U+B2E4와 정확히 일치했고 글꼴
슬롯 충돌 가설은 기각됐다.

빌더의 기본 동작을 깨끗한 아카이브 빌드로 바꿨다. 과거 진단 단계는
`--include-active-probe`를 명시해야만 실행된다. 지원 원본과 깨끗한 ROM의 같은
새 게임 첫 화면은 PNG SHA-256과 240×160 전체 픽셀이 동일했다. 원인·수정 기록은
`analysis/active_probe_leakage_regression.json`에 있다.

## 번역 범위와 구조

- 번역 엔트리: 0, 1, 2, 3, 4, 13 — 6개
- 미번역 보존 엔트리: 248개
- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,165바이트 (`+93`)
- 번역 후 해제 데이터 SHA-256:
  `14e6b4e2618f3e579ea49ad9218e178d0c36cd24576ef1d7761d74abebe9153c`
- 재압축 스트림: 4,499바이트
- 필요한 한글 글리프: 90자

엔트리 1의 `EB E9` 페이지 전환, `E8` 줄바꿈, `EA 01 1E 00` 30프레임
대기, 마지막 `EB` 입력 대기를 구조화 제어로 보존한다. 교체 범위 뒤의 창 닫기,
플래그 514 설정과 종료도 원문 바이트 그대로 유지한다.

## 정적·적재 검증

`analysis/archive_00_09_dialogue_dex_clean_verification.json`은 원래 압축 슬롯,
248개 미번역 엔트리, 6개 구조화 교체, 254개 u16 테이블, 90개 글리프, GBA
헤더 체크섬과 확장 꼬리를 독립 재구성해 `passed: true`를 기록한다.

새 게임 첫 대사에서 덤프한 EWRAM `0x02038800`의 6,165바이트도 ROM의 재배치
해제본과 완전히 같았다. 결과는
`analysis/emucap/dialogue_dex_clean_normal_load_verification.json`이며 서로 다른
바이트는 0개다.

## 자연 플레이 렌더링과 진행

새 부팅 → `PRESS START` → `はじめから` → 오프닝 대화 → 교실 이동 → 덱카오와
대화하는 정상 경로를 사용했다. 프레임 26,440에 EWRAM `0x02038A09`의 엔트리 0
첫 한글 바이트 읽기 중단점이 적중했고, 적중 스냅샷에는 재구성된 엔트리 0·1
전체가 들어 있었다.

- 엔트리 0: `analysis/emucap/dex_clean_entry0_natural.png`
- 엔트리 1 페이지 1: `analysis/emucap/dex_clean_entry1_page1_natural.png`
- 페이지 2: `analysis/emucap/dex_clean_entry1_page2_natural.png`
- 페이지 3: `analysis/emucap/dex_clean_entry1_page3_natural.png`
- 페이지 4 대기 중: `analysis/emucap/dex_clean_entry1_page4_wait_natural.png`
- 페이지 4 완료: `analysis/emucap/dex_clean_entry1_page4_natural.png`
- 대화 종료 뒤 학교 종소리: `analysis/emucap/dex_clean_entry1_post_dialogue.png`

네 페이지가 실제 A 버튼으로 진행됐고, 30프레임 대기 뒤 마지막 문장이 이어졌다.
잘림·겹침·잔상·진행 정지는 관찰되지 않았다. 기계 판정과 화면 해시는
`analysis/emucap/dialogue_dex_clean_natural_progression.json`에 기록했다.

## 남은 한계

현재 6개 문장은 모두 사람 번역 검수 전 초안이다. 아카이브 254개 중 248개는
원문 그대로이며, 게임 전체 텍스트·그래픽 텍스트·선택지·아이템명까지 포함한
완성 패치 범위는 아직 아니다. 공개 배포 전에는 사람 번역 승인, 범위 확대,
대표·경계 장면 회귀와 차분 패치 생성이 필요하다.
