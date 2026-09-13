# EXE 1 [K] 픽셀 폰트 후보 평가

## 결론

기술적으로 호환된다. `Battle Network Rockman EXE 1 [K].gba`의 한글 폰트는
EXE 2 대사 폰트와 같은 8×16, 세로 8×8 타일 2개, 64바이트 GBA 4bpp 레코드다.
현재 번역에 필요한 한글 135자를 모두 찾았고 팔레트 인덱스도 `1/3`만 사용한다.
굴림체처럼 재래스터하지 않고 완성된 픽셀 레코드를 그대로 복사할 수 있다.

로컬 비교에서는 굴림체보다 획이 또렷하고 GBA 게임 화면에 더 자연스럽다. 필요한
135자의 평균 전경 픽셀은 EXE 1 [K] 37.17, 굴림체 41.42다. 2026-08-26에
사용자가 이 프로젝트에서의 폰트 사용 허락을 받았다고 확인했다. 권리 근거는
`analysis/exe1_k_font_permission_record.json`에 기록했으며, 허가 문서 사본 자체는
현재 작업공간에 보관되어 있지 않다.

## 확인한 구조

- 소스 ROM SHA-256: `c0753c1d3170f69e1eb8b03a02875ec63c5622185ac4afbb2b8688c53209d865`
- 폰트 시작: `0x80016C`
- 레코드 크기: 64바이트
- 한글 시작 레코드: 512
- 한글 순서: KS X 1001 완성형 2,350자
- 대응식: `512 + ((EUC-KR lead - B0) × 94) + (trail - A1)`
- 현재 135자 대응: 135/135, 누락 0

## 비교 후보

- ROM: `poc/output/exe2_rev1_archive_00_09_dialogue_yai_fan_exe1k_font_clean_poc.gba`
- SHA-256: `d12cb1081ba7a421585a972411b907a528c48770e7c72b1bd39bcc9d863a505e`
- 정적 검증: `analysis/archive_00_09_dialogue_yai_fan_exe1k_font_clean_verification.json`
- 전체 평가: `analysis/exe1_k_font_candidate_assessment.json`

굴림체 빌드와 비교한 3,326개 차이 바이트는 모두 선언된 135개 폰트 레코드에만
있다. 대사 아카이브와 코드페이지는 동일하다.

## 음소거 런타임 결과

Mesen 2를 `display:false`, `sound:false`로 실행했다. 엔트리 8의 네 페이지,
선택지, 긍정 후속 문장과 엔트리 9 부정 분기를 확인했으며 잘림·겹침·잔상·진행
정지는 없었다. `요`의 새 레코드 581번이 PC `0x08020DA6`에서 실제로 읽혔다.

비교 이미지 `analysis/emucap/yai_fan_gulim_vs_exe1k_font_choice_comparison.png`는
위쪽이 굴림체, 아래쪽이 EXE 1 [K] 픽셀 폰트다.

## 채택 조건

사용자가 선택한 EXE 2 한글패치용 픽셀 폰트로 채택한다. 폰트 재사용 허가는 더 이상
이 프로젝트의 차단 조건이 아니다. 단, 완성 ROM 자체가 아니라 원본 Rev 1 ROM에서
적용하는 패치 형식으로 배포해야 하며 번역문 검수와 전체 게임 QA는 별도 조건이다.
