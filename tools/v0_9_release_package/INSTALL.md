# 록맨 에그제 2 한글패치 V0.9 설치 안내

이 패키지는 일본판 Rev 1 전용 BPS 프리릴리스입니다. 원본 ROM이나 패치된 ROM은 포함하지 않습니다.

## Windows에서 적용

1. ZIP을 새 폴더에 완전히 압축 해제합니다.
2. 본인이 보유한 깨끗한 `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`를 `APPLY_PATCH.cmd` 위로 끌어다 놓습니다.
3. `SUCCESS`가 표시되면 같은 폴더에 `Rockman_EXE2_Rev1_KR_V0.9.gba`가 생성됩니다.
4. 에뮬레이터에서 생성된 ROM을 새로 부팅합니다. 이전 빌드의 `.ss1`·`.ss2` 상태 저장은 불러오지 마세요.

직접 BPS 패처를 사용하려면 `EXE2_Rev1_KR_V0.9.bps`를 아래 원본에 적용하면 됩니다.

## 지원 원본

- 파일: `Battle Network Rockman EXE 2 (Japan) (Rev 1).gba`
- 크기: 8,388,608바이트
- 게임 코드/버전: `AE2J`, Revision 1
- SHA-256: `1afe35e1d00099d62cbddad43c2be3f0f3c3f0f333e8df54456076cb2df6a6b8`

## 정상 적용 결과

- 파일: `Rockman_EXE2_Rev1_KR_V0.9.gba`
- 크기: 16,777,216바이트
- SHA-256: `a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a`

## 저장 데이터

기존 `.sav`는 먼저 백업하세요. 적용기는 원본 ROM과 저장 파일을 변경하지 않고 기존 출력도 덮어쓰지 않습니다. 이전 ROM 빌드의 상태 저장에는 옛 대사 데이터가 포함될 수 있으므로 호환 대상으로 보지 않습니다.

## 제거

생성된 `Rockman_EXE2_Rev1_KR_V0.9.gba`만 제거하면 됩니다. 원본 ROM과 `.sav`는 별도로 보관하세요.

알려진 제한사항은 `RELEASE_NOTES.md`를 확인하세요.
