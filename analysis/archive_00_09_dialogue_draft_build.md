# 아카이브 00/09 대사 초안 통합 PoC

이 문서는 엔트리 0·2·13 범위의 이전 빌드 기록이다. 현재 엔트리 3·4까지
확장한 결과는 `analysis/archive_00_09_dialogue_chain_draft_build.md`를 본다.

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_draft_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `708a7953db9caae7bb8ffc145337d4fd7eb2230359c2d64ecc7303eab76ac4f4`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 한글 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_draft.json`

이 파일은 원본 Rev 1 ROM에서 다시 만든 비배포 개발용 전체 ROM이다. 기계
번역 초안을 포함하므로 릴리스 후보가 아니다.

## 포함 범위

- 엔트리 0: `여어! 데카오!`
- 엔트리 2: `좋은 아침, 넷토`
- 엔트리 13: PET 사용법 대사 4페이지
- 필요한 한글 글리프: 60자
- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,121바이트 (`+49`)
- 재압축 스트림: 4,448바이트
- 번역 후 해제 데이터 SHA-256:
  `8ab1c288bcd7326908912af667988aab78531a0080734b08acf9cc31faa711dc`

## 정적 검증

독립 검증기 결과 `analysis/archive_00_09_dialogue_draft_verification.json`은
`passed: true`다. 원래 압축 슬롯 보존, 미번역 251개 엔트리의 바이트 동일성,
번역 엔트리의 구조화 세그먼트, 전체 u16 오프셋 테이블, 60개 글리프 레코드,
GBA 헤더 체크섬, 확장 영역의 `FF` 꼬리를 모두 확인했다. 같은 입력으로 다시
빌드한 ROM의 SHA-256도 위 출력과 일치했다.

## 정상 로더 실행 검증

최신 ROM을 새로 부팅해 원래 게임 메뉴에서 진행했다. ROM 주소
`0x08800000`의 읽기가 프레임 1,294에서 발생했고, 로더가 EWRAM
`0x02038800`에 푼 6,121바이트를 빌드 원본과 비교했다.

- ROM 내 해제 데이터 SHA-256:
  `8ab1c288bcd7326908912af667988aab78531a0080734b08acf9cc31faa711dc`
- 실행 중 EWRAM SHA-256: 동일
- 서로 다른 바이트: 0
- 결과: `analysis/emucap/dialogue_draft_normal_load_verification.json`, 통과

첫 자동 START 입력이 타이틀 입력 가능 시점보다 빨라 한 번 무시됐지만,
화면 확인 후 START와 A를 다시 입력하자 정상 적재가 확인됐다. 이는 ROM이나
패치 결함이 아니라 자동 입력 시점 문제다.

## 화면 및 진행 검증

최신 ROM에 귀속된 mGBA 상태 개입으로 엔트리 2와 엔트리 13을 다시
렌더링했다. 상태 개입은 글꼴·레이아웃 소비를 검증하지만 정상 플레이 도달을
대신하지 않으며, 정상 로더 적재 증거는 위 실행 검증과 분리한다.

- `analysis/emucap/archive_entry_2_dialogue_draft.png`
- `analysis/emucap/archive_entry_13_dialogue_draft_page_1.png`
- `analysis/emucap/archive_entry_13_dialogue_draft_page_2.png`
- `analysis/emucap/archive_entry_13_dialogue_draft_page_3.png`
- `analysis/emucap/archive_entry_13_dialogue_draft_page_4.png`

엔트리 2는 한 줄 안에 정상 표시됐고, 엔트리 13은 실제 A 버튼 진행으로 네
페이지가 순서대로 표시됐다. 잘림·겹침·잔상은 관찰되지 않았다.

## 남은 한계와 다음 단계

엔트리 0은 전체 가역 추출과 정적 재삽입, 정상 로더 적재까지 통과했지만 해당
장면의 검증된 렌더러 상태가 아직 없어 화면 합성을 하지 않았다. 자연 플레이
상태를 확보해 시각 검토해야 한다. 세 엔트리의 한국어 문장도 모두 사람 번역
검토 전 초안이다. 다음 기술 단계는 같은 전체 추출 카탈로그에서 문맥이 확인된
엔트리를 추가로 선별하고, 보호 바이트와 제어코드를 유지한 채 통합 범위를
늘리는 것이다.
