# 아카이브 00/09 대화 연결 초안 통합 PoC

## 최신 출력

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_chain_draft_poc.gba`
- 크기: 16,777,216바이트
- SHA-256: `b9ecb369532b386d62a1a6db32ddd3af7235284e1c6858124092008392d438dd`
- 번역 자산: `translations/archive_00_09_dialogue_draft.json`
- 코드페이지: `poc/output/korean_codepage_archive_00_09_dialogue_chain_draft.json`

지원 원본 Rev 1에서 두 번 연속 재생성한 결과가 같은 SHA-256을 냈다. 전체
ROM과 한국어 문장은 비배포 개발용 초안이며 릴리스 후보가 아니다.

## 이번 확장

TextPet 전체 추출의 script 2는 엔트리 3으로, script 3은 엔트리 4로
`jump`한다. 이 연결을 기준으로 기존 엔트리 2 인사 뒤의 두 문장을 추가했다.

- 엔트리 3: `아, 메이루! 좋은 아침!`
- 엔트리 4: `아까 데카오가,` / `넷토를 찾고 있었어`
- 현재 번역 엔트리: 0, 2, 3, 4, 13 — 5개
- 미번역 보존 엔트리: 249개
- 필요한 한글 글리프: 65자
- 코드페이지 전체 매핑: 75자, 남은 후보 슬롯 181개

번역은 기계 초안이며 이름 표기, 말투와 원문 뉘앙스는 독립 검토와 사람
승인이 필요하다.

## 구조와 빌드 검증

- 원본 해제 데이터: 6,072바이트
- 번역 후 해제 데이터: 6,139바이트 (`+67`)
- 번역 후 해제 데이터 SHA-256:
  `d0c7683cd423cea7773a145201ee891e30b5ab5a07c73a5c7282928f895ea9bc`
- 재압축 스트림: 4,458바이트

독립 결과 `analysis/archive_00_09_dialogue_chain_draft_verification.json`은
`passed: true`다. 원래 압축 슬롯, 번역하지 않은 249개 엔트리, 구조화 번역
세그먼트, 254개 u16 오프셋 테이블, 65개 글리프 레코드, GBA 헤더 체크섬과
확장 영역 꼬리를 모두 검사했다.

## 정상 로더 실행 검증

ASCII 경로 별칭을 사용해 최신 ROM을 새로 부팅했다. 한글 경로를 직접 넘긴
첫 시도는 에뮬레이터 제어 프로토콜의 UTF-8 프레임 오류로 연결되지 않았으며
ROM은 실행되지 않았다. ASCII 별칭 실행은 정상 연결됐고 프레임 2,947에서
ROM 주소 `0x08800000` 읽기 중단점이 적중했다.

한 프레임 더 진행한 뒤 EWRAM `0x02038800`부터 6,139바이트를 덤프해 빌드
원본과 비교했다.

- 실행 중 EWRAM SHA-256:
  `d0c7683cd423cea7773a145201ee891e30b5ab5a07c73a5c7282928f895ea9bc`
- 서로 다른 바이트: 0
- 결과: `analysis/emucap/dialogue_chain_normal_load_verification.json`, 통과

## 화면과 대화 진행

검증된 엔트리 2 상태에 최신 ROM의 정확한 6,139바이트 아카이브를 넣고
엔트리 2부터 다시 그렸다. 이 상태 개입은 렌더러·레이아웃과 실제 A 버튼
진행을 검증하며, 정상 로더 적재 증거는 위 항목에 별도로 보존한다.

- 엔트리 2: `analysis/emucap/archive_entry_2_dialogue_chain.png`
- 엔트리 3: `analysis/emucap/archive_entry_3_dialogue_chain.png`
- 엔트리 4: `analysis/emucap/dialogue_chain_entry4/archive_entry_4_dialogue_chain.png`

엔트리 2에서 A 버튼을 한 번 누르면 엔트리 3, 두 번 누르면 엔트리 4가
표시됐다. 엔트리 3은 한 줄, 엔트리 4는 두 줄이며 잘림·겹침·잔상은 없다.
잘못된 단축키로 다른 데스크톱 창을 잡은 엔트리 4 캡처는
`analysis/emucap/rejected/`로 격리했다. 캡처 도구는 mGBA 0.10.5의 실제
단축키인 F12를 사용하도록 수정했다.

## 남은 한계와 다음 단계

엔트리 0은 정적 재삽입과 정상 로더 적재까지 통과했지만 자연 플레이 화면
검증이 남아 있다. 현재 다섯 엔트리는 모두 사람 번역 검토 전 초안이다. 다음
확장은 선택지와 복수 페이지가 없는 인접 대사를 우선하며, 컨텍스트가 불명확한
엔트리는 번역하지 않고 후보 상태로 남긴다.
