"""Relocate and translate EXE2 Rev 1's static PET submenu tables.

The Chip Folder/Library name and description lists are not TextPet archives.
They are 16-bit relative-string tables addressed by literal ROM pointers.  A
translated table keeps the original table shape and terminators, but is moved
into the clean expanded-ROM area so Korean escape sequences can grow safely.
"""

from __future__ import annotations

import hashlib
import re
import struct
import textwrap
from pathlib import Path

from exe1_k_font_source import ks_x_1001_ordinal


ROM_BASE = 0x08000000
NAME_TABLE = 0x7291D0
# Chip ids 256-510 - the program advances and a few specials - live in a second
# name table right after the first. Every reader holds the two pointers side
# by side and picks one with id >> 8, so both have to move.
SECOND_NAME_TABLE = 0x729B3C
DESC_TABLE = 0x729FA0
UI_TABLE = 0x7E1E68
NAME_RELOC = 0x920000
SECOND_NAME_RELOC = 0x928000
DESC_RELOC = 0x930000
UI_RELOC = 0x940000
HANGUL_ESCAPE = bytes((0xF9, 0xFC))
TABLE_PATH = Path(__file__).resolve().parents[1] / "external" / "TextPet-plugins-6c6d705" / "TextPet-6c6d70561290b42d8261f6d76b03051d534c7032" / "TextPet" / "plugins" / "exe2-utf8.tbl"
COMMAND_DB_PATH = TABLE_PATH.with_name("mmbn2.ini")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _table_mapping() -> tuple[dict[bytes, str], dict[str, bytes]]:
    forward: dict[bytes, str] = {}
    for line in TABLE_PATH.read_text(encoding="utf-8-sig").splitlines():
        if not line.strip() or "=" not in line:
            continue
        key, value = line.split("=", 1)
        value = value.replace("\\n", "\n").replace("\\t", "\t")
        forward[bytes.fromhex(key)] = value
    reverse: dict[str, bytes] = {}
    # Prefer the shortest native code for a character.  This is important for
    # ordinary ASCII and newline, where the table also has extended aliases.
    for key, value in sorted(forward.items(), key=lambda item: (len(item[0]), item[0])):
        reverse.setdefault(value, key)
    return forward, reverse


FORWARD, REVERSE = _table_mapping()
DECODE_KEYS = sorted(FORWARD, key=len, reverse=True)
PLACEHOLDER_RE = re.compile(r"<([0-9A-Fa-f]{2})>")
ENCODE_TEXT_KEYS = sorted(REVERSE, key=len, reverse=True)


def decode_native(raw: bytes) -> str:
    """Decode a table string while retaining unknown control bytes."""
    out: list[str] = []
    pos = 0
    while pos < len(raw) and raw[pos] != 0xE7:
        found = None
        for key in DECODE_KEYS:
            if raw.startswith(key, pos):
                found = key
                break
        if found is None:
            out.append(f"<{raw[pos]:02X}>")
            pos += 1
        else:
            out.append(FORWARD[found])
            pos += len(found)
    return "".join(out)


def encode_native(text: str) -> bytes:
    """Encode a decoded template, preserving <HH> controls and adding Hangul."""
    out = bytearray()
    pos = 0
    while pos < len(text):
        match = PLACEHOLDER_RE.match(text, pos)
        if match:
            out.append(int(match.group(1), 16))
            pos = match.end()
            continue
        char = text[pos]
        if "가" <= char <= "힣":
            ordinal = ks_x_1001_ordinal(char)
            out.extend(HANGUL_ESCAPE)
            out.extend(struct.pack("<H", ordinal))
        elif char == "…":
            out.extend(REVERSE["."] * 3)
            pos += 1
            continue
        elif char == ",":
            out.extend(REVERSE["、"])
            pos += 1
            continue
        else:
            native_key = next((key for key in ENCODE_TEXT_KEYS if text.startswith(key, pos)), None)
            if native_key is None:
                raise ValueError(f"no EXE2 encoding for character {char!r}")
            out.extend(REVERSE[native_key])
            pos += len(native_key)
            continue
        pos += 1
    return bytes(out)


def _command_database() -> list[tuple[bytes, bytes, str, bool]]:
    """(base, mask, name, ends) of every mmbn2 script command TextPet knows."""
    commands = []
    for block in re.split(r"(?m)^\[", COMMAND_DB_PATH.read_text(encoding="utf-8-sig")):
        header, _, body = block.partition("]")
        if header not in ("Command", "Extension"):
            continue
        fields = dict(re.findall(r"(?m)^(\w+) *= *(.*?) *$", body))
        mask = bytes.fromhex(fields["mask"])
        base = bytes.fromhex(fields["base"]).ljust(len(mask), b"\0")
        commands.append((base, mask, fields["name"], fields.get("ends") == "always"))
    return commands


COMMANDS = _command_database()
# In these short label-renderer strings E9 is a three-byte number field, not
# the script engine's clearMsg.
NUMERIC_ROWS = frozenset({2, 3, 8, 31, 32, 68, 69, 70, 71, 72, 80, 105, 106})


def command_length(data: bytes, pos: int) -> tuple[int, bool]:
    """Byte length of the script command at pos, and whether it ends the script.

    The most specific mask wins; select carries its own length in its second
    byte (targets + 3).
    """
    matches = []
    for base, mask, name, ends in COMMANDS:
        if pos + len(mask) > len(data):
            continue
        if any(data[pos + i] & bits != base[i] & bits for i, bits in enumerate(mask)):
            continue
        length = len(mask)
        if name == "select":
            length = data[pos + 1]
            if length < 3 or length & 0x10:
                raise ValueError(f"unsupported select length 0x{length:02X}")
        matches.append((sum(bin(bits).count("1") for bits in mask), length, ends))
    if not matches:
        raise ValueError(f"no script command matches {data[pos:pos + 4].hex(' ')}")
    best = max(match[0] for match in matches)
    kinds = {(length, ends) for bits, length, ends in matches if bits == best}
    if len(kinds) != 1:
        raise ValueError(f"ambiguous script command {data[pos:pos + 4].hex(' ')}")
    length, ends = kinds.pop()
    if pos + length > len(data):
        raise ValueError(f"script command {data[pos:pos + 4].hex(' ')} runs past its string")
    return length, ends


def ui_tokens(entry: bytes, numeric: bool = False) -> list[tuple[str, bytes]]:
    """Split a UI string into ("text", bytes) runs and whole ("command", bytes).

    Command parameters are plain bytes, and many decode as kana or digits:
    printItemAmount's item 0x61 reads as "D". Phrase replacement may only
    ever see the text runs.
    """
    tokens: list[tuple[str, bytes]] = []
    pos = start = 0
    while pos < len(entry):
        byte = entry[pos]
        if entry.startswith(HANGUL_ESCAPE, pos):
            pos += 4
            continue
        if byte in (0xE5, 0xE6):
            pos += 2
            continue
        if byte < 0xE7 or byte == 0xE8:
            pos += 1
            continue
        if start < pos:
            tokens.append(("text", entry[start:pos]))
        length, ends = (3, False) if numeric and byte == 0xE9 else command_length(entry, pos)
        tokens.append(("command", entry[pos:pos + length]))
        pos = start = pos + length
        if ends and pos < len(entry):
            # Past a script end nothing runs; keep whatever is there as is.
            tokens.append(("command", entry[pos:]))
            pos = start = len(entry)
    if start < pos:
        tokens.append(("text", entry[start:pos]))
    return tokens


def ui_commands(entry: bytes, numeric: bool = False) -> list[bytes]:
    return [chunk for kind, chunk in ui_tokens(entry, numeric) if kind == "command"]


# Korean chip terminology already used by the authored archive translations is
# preferred.  The remaining names use the established Korean EXE terminology.
NAME_REPLACEMENTS = {
    "ロックバスター": "록버스터", "キャノン": "캐논", "ハイキャノン": "하이캐논", "メガキャノン": "메가캐논",
    "ショットガン": "샷건", "ブイガン": "브이건", "クロスガン": "크로스건", "スプレッドガン": "스프레드건",
    "バブルショット": "버블샷", "バブルブイ": "버블브이", "バブルクロス": "버블크로스", "バブルスプレッド": "버블스프레드",
    "ヒートショット": "히트샷", "ヒートブイ": "히트브이", "ヒートクロス": "히트크로스", "ヒートスプレッド": "히트스프레드",
    "ミニボム": "미니봄", "スモールボム": "스몰봄", "クロスボム": "크로스봄", "ビッグボム": "빅봄",
    "フォレストボム": "포레스트봄", "ソード": "소드", "ワイドソード": "와이드소드", "ロングソード": "롱소드",
    "フレイムソード": "플레임소드", "アクアソード": "아쿠아소드", "エレキソード": "일렉소드",
    "フレイムブレード": "플레임블레이드", "アクアブレード": "아쿠아블레이드", "エレキブレード": "일렉블레이드",
    "フミコミザン": "후미코미잔", "ムラマサ": "무라마사", "カスタムソード": "커스텀소드",
    "リョウテクナイ": "료테쿠나이", "イアイフォーム": "이아이폼", "ショックウェーブ": "쇼크웨이브",
    "ソニックウェーブ": "소닉웨이브", "ダイナウェーブ": "다이나웨이브", "アースクエイク": "어스퀘이크",
    "ガッツパンチ": "거츠펀치", "コールドパンチ": "콜드펀치", "アタック": "어택", "ナビ": "내비",
    "ダッシュアタック": "대시어택", "テッキュウ": "철구", "ホウガン": "호우건", "ダブルニードル": "더블니들",
    "トリプルニードル": "트리플니들", "テトラニードル": "테트라니들", "トライデント": "트라이던트",
    "ラットン": "라톤", "ラットンハナビ": "라톤불꽃", "トルネード": "토네이도", "コガラシ": "코가라시",
    "ネップウ": "열풍", "バーニングボディ": "버닝바디", "ラビリング": "래빗링", "バッドスパイス": "배드스파이스",
    "サテライト": "새틀라이트", "ヨーヨー": "요요", "マグネットボム": "마그넷봄", "メテオ": "메테오",
    "ブレイクハンマー": "브레이크해머", "カースシールド": "커스실드", "カウントボム": "카운트봄",
    "クラウド": "클라우드", "モアクラウド": "모어클라우드", "モストクラウド": "모스트클라우드",
    "ステルスマイン": "스텔스마인", "フロントセンサー": "프런트센서", "ダブルセンサー": "더블센서",
    "リモコゴロー": "리모코고로", "アクアバルーン": "아쿠아벌룬", "エレキバルーン": "일렉벌룬", "ヒートバルーン": "히트벌룬",
    "カンケツセン": "분수", "マグマドラゴン": "마그마드래곤", "ゴッドストーン": "갓스톤", "オールドウッド": "올드우드",
    "ポイズンマスク": "포이즌마스크", "ポイズンフェイス": "포이즌페이스", "ウズシオ": "소용돌이", "ブラックホール": "블랙홀",
    "メットガード": "메트가드", "バリア": "배리어", "パネルアウト": "패널아웃", "ラインアウト": "라인아웃",
    "バンブーランス": "대나무창", "ゼウスハンマー": "제우스해머", "ブロンズフィスト": "브론즈피스트",
    "シルバーフィスト": "실버피스트", "ゴールドフィスト": "골드피스트", "バリアブルソード": "배리어블소드",
    "リカバリー": "리커버리", "パネルスチール": "패널스틸", "エリアスチール": "에어리어스틸", "スチールパニシュ": "스틸퍼니시",
    "デスマッチ": "데스매치", "キャッチマシーン": "캐치머신", "アナザーマインド": "어나더마인드", "エスケープ": "이스케이프",
    "エアシューズ": "에어슈즈", "パネルリターン": "패널리턴", "リモローソク": "리모양초", "ストーンキューブ": "스톤큐브",
    "プリズム": "프리즘", "オジゾウサン": "오지조상", "トップウ": "돌풍", "スイコミ": "흡입", "ポイズンアヌビス": "포이즌아누비스",
    "ヘビーゲージ": "헤비게이지", "クイックゲージ": "퀵게이지", "フルカスタム": "풀커스텀", "インビジブル": "인비저블",
    "テンジョウウラ": "천장뒤", "ユカシタ": "바닥아래", "ストーンボディ": "스톤바디", "カゲブンシン": "그림자분신",
    "アンダーシャツ": "언더셔츠", "バブルラップ": "버블랩", "リーフシールド": "리프실드", "アクアオーラ": "아쿠아오라",
    "フレイムオーラ": "플레임오라", "ウッドオーラ": "우드오라", "エレキオーラ": "일렉오라", "ドリームオーラ": "드림오라",
    "マグネットライン": "마그넷라인", "マグマライン": "마그마라인", "アイスライン": "아이스라인", "クサムラライン": "풀밭라인",
    "マグマステージ": "마그마스테이지", "アイスステージ": "아이스스테이지", "クサムラステージ": "풀밭스테이지",
    "ホーリーパネル": "홀리패널", "ジェラシー": "질투", "カキゲンキン": "화기엄금", "ヒライシン": "피뢰침",
    "ダイコウズイ": "대홍수", "カワリミ": "카와리미", "シラハドリ": "시라하도리", "ナビスカウト": "내비스카우트",
    "バッドメディスン": "배드메디슨", "ファイア": "파이어", "アクア": "아쿠아", "ウッド": "우드", "エレキ": "일렉",
    "ロール": "롤", "ガッツマン": "거츠맨", "ブルース": "블루스", "エアーマン": "에어맨", "クイックマン": "퀵맨",
    "カットマン": "컷맨", "シャドーマン": "섀도맨", "ナイトマン": "나이트맨", "マグネットマン": "마그넷맨",
    "フリーズマン": "프리즈맨", "ヒートマン": "히트맨", "トードマン": "토드맨", "サンダーマン": "썬더맨", "スネークマン": "스네이크맨",
    "ゲートマン": "게이트맨", "プラネットマン": "플래닛맨", "ナパームマン": "네이팜맨", "ファラオマン": "파라오맨", "フォルテ": "포르테",
    "オオアカツナミ": "대홍수", "フリーズボム": "프리즈봄", "チャージスパーク": "차지스파크", "ガイアソード": "가이아소드",
}


# The second table's names, whole: ids 256-510. Empty slots stay empty and
# "????" stays as it is; any other name must be listed here.
SECOND_NAMES = {
    "ファイターソード": "파이터소드", "ナイトソード": "나이트소드", "パラディンソード": "팔라딘소드",
    "リュウセイグン": "유성군", "ポルターガイスト": "폴터가이스트",
    "ファイアゴスペル": "파이어고스펠", "アクアゴスペル": "아쿠아고스펠",
    "エレキゴスペル": "일렉고스펠", "ウッドゴスペル": "우드고스펠", "ゲートマンSP": "게이트맨SP",
    "サンクチュアリ": "생크추어리",
    "ゼータキャノン1": "제타캐논1", "ゼータキャノン2": "제타캐논2", "ゼータキャノン3": "제타캐논3",
    "ハイパーバースト": "하이퍼버스트", "ゼータホウガン": "제타호우건",
    "ゼータラットン1": "제타라톤1", "ゼータラットン2": "제타라톤2", "ゼータラットン3": "제타라톤3",
    "オメガキャノン1": "오메가캐논1", "オメガキャノン2": "오메가캐논2", "オメガキャノン3": "오메가캐논3",
    "メガデスバースト": "메가데스버스트", "オメガホウガン": "오메가호우건",
    "オメガラットン1": "오메가라톤1", "オメガラットン2": "오메가라톤2", "オメガラットン3": "오메가라톤3",
    "ストリームアロー": "스트림애로", "グレイテストボム": "그레이티스트봄",
    "ドリームソード1": "드림소드1", "ドリームソード2": "드림소드2", "ドリームソード3": "드림소드3",
    "マシンガンパンチ": "머신건펀치", "カースアンガー": "커스앵거", "ギガカウントボム": "기가카운트봄",
    "ヘビースタンプ": "헤비스탬프", "ポイズンファラオ": "포이즌파라오", "ゲートマジック": "게이트매직",
    "ガッツシュート": "거츠슛", "ビッグハート": "빅하트", "ボディガード": "보디가드",
    "ダブルヒーロー": "더블히어로", "ダークメシア": "다크메시아", "バチアタリ": "천벌",
    "ファラオトラップ": "파라오트랩", "ダブルプラネット": "더블플래닛", "リモートゲート": "리모트게이트",
}


def translate_second_name(text: str) -> str:
    if text in SECOND_NAMES:
        return SECOND_NAMES[text]
    if re.search(r"[\u3040-\u30ff\u3400-\u9fff]", text):
        raise ValueError(f"untranslated Japanese chip name in the second table: {text!r}")
    return text


def translate_name(text: str) -> str:
    # Longest-first prevents ロール matching before ロール[V2] has been
    # decoded; [V2]/[V3] are native tokens and remain intact.
    for source in sorted(NAME_REPLACEMENTS, key=len, reverse=True):
        text = text.replace(source, NAME_REPLACEMENTS[source])
    if re.search(r"[\u3040-\u30ff\u3400-\u9fff]", text):
        raise ValueError(f"untranslated Japanese chip name: {text!r}")
    return text


# Compact three-line descriptions keep the original PET panel readable.  The
# same text is intentionally shared by V2/V3 variants unless the source value
# carries a variant-specific mechanic.
def description_text(index: int) -> str:
    groups: list[tuple[int, int, str]] = [
        (0, 0, "B 버튼으로 발사\n연사 가능\n기본 공격"),
        (1, 3, "앞의 적 1명을\n공격하는\n캐논포"),
        (4, 4, "맞은 뒤 안쪽\n1칸에 폭발하는\n공격"), (8, 8, "맞은 뒤 안쪽\n1칸에 폭발하는\n공격"), (12, 12, "맞은 뒤 안쪽\n1칸에 폭발하는\n공격"),
        (5, 5, "맞은 뒤 대각선\n뒤 2칸에 폭발"), (9, 9, "맞은 뒤 대각선\n뒤 2칸에 폭발"), (13, 13, "맞은 뒤 대각선\n뒤 2칸에 폭발"),
        (6, 6, "맞은 뒤 대각선\n4칸에 폭발"), (10, 10, "맞은 뒤 대각선\n4칸에 폭발"), (14, 14, "맞은 뒤 대각선\n4칸에 폭발"),
        (7, 7, "주변 1칸에 폭발\n넓은 범위\n공격"), (11, 11, "주변 1칸에 폭발\n넓은 범위\n공격"), (15, 15, "주변 1칸에 폭발\n넓은 범위\n공격"),
        (16, 16, "앞 3칸에 떨어지는\n폭탄을 던진다"), (17, 17, "세로로 퍼지는 폭풍\n앞 3칸에 폭탄"), (18, 18, "십자로 퍼지는 폭풍\n앞 3칸에 폭탄"), (19, 19, "9칸에 퍼지는 폭풍\n앞 3칸에 폭탄"),
        (20, 22, "앞 3칸에 나무 씨앗\n물을 맞히면\n강해진다"), (23, 23, "앞 1칸을 베는\n공격 범위 1칸"), (24, 24, "앞 세로 3칸을\n베는 공격"), (25, 25, "앞 가로 2칸을\n베는 공격"),
        (26, 28, "앞 세로 3칸을\n베는 속성\n소드"), (29, 31, "앞 가로 2칸을\n베는 속성\n블레이드"), (32, 32, "앞으로 2칸 파고드는\n와이드소드"), (33, 33, "잃은 HP만큼\n공격력이 오르는\n저주받은 검"), (34, 34, "커스텀 게이지가 찰수록\n공격력이 올라간다"),
        (35, 37, "쿠나이 3개를\n앞 위아래에\n던진다"), (38, 38, "A 버튼을 누르는 동안\n들어오는 적을\n베어낸다"), (39, 41, "땅을 타고 가는\n관통 공격"), (42, 44, "앞 3칸에 추를 떨어뜨려\n바닥에 금을 낸다"),
        (45, 45, "앞 1칸에 펀치\n물체를 앞으로\n밀어낸다"), (46, 46, "앞 1칸에 얼음 펀치\n물체를 앞으로\n밀어낸다"), (47, 47, "공격 칩 뒤에 쓰면\n공격력 +20"), (48, 48, "공격 칩 뒤에 쓰면\n공격력 +30"), (49, 49, "내비 칩 뒤에 쓰면\n공격력 +40"), (50, 50, "적을 관통하는\n돌진 공격"),
        (51, 52, "앞 3칸에 철구를\n던진다\n패널 파괴"), (53, 55, "연속 니들을\n발사한다"), (56, 56, "연속 창을\n발사한다"), (57, 59, "땅을 타는 쥐 미사일\n한 번 꺾인다"), (60, 60, "불 속성 공격에 맞으면\n발사되는\n강력한 라톤"), (61, 63, "앞 2칸에 회오리를\n만든다\n8히트"), (64, 64, "자신과 주변 상하좌우를\n불에 휩쓴다"),
        (65, 67, "전기 고리 공격\n맞은 적은\n잠시 마비"), (68, 70, "모든 풀밭 패널에\n해로운 가루를\n퍼뜨린다"), (71, 73, "빙글 도는 위성이\n장애물에 부딪히면\n회전한다"), (74, 76, "앞 3칸까지 날아가는\n요요 공격"), (77, 79, "적의 움직임을\n잠시 멈춘다"),
        (80, 80, "운석 9발을 내리는\n마법 지팡이"), (81, 81, "운석 12발을 내리는\n마법 지팡이"), (82, 82, "운석 15발을 내리는\n마법 지팡이"), (83, 83, "운석 18발을 내리는\n마법 지팡이"), (84, 84, "앞 1칸을 해머로 공격\n장애물을 부순다"),
        (85, 87, "타이밍 가드 뒤\n앞의 적을 무는\n실드"), (88, 90, "적 영역에 시한 폭탄\n영역 전체에\n폭발"), (91, 93, "비구름이 생겨\n세로로 오가며\n비를 뿌린다"), (94, 94, "적 영역 어딘가에\n보이지 않는\n지뢰를 설치"),
        (95, 95, "앞에 적이 오면\n자동 폭발하는\n다이너마이트"), (96, 96, "대각선에 적이 오면\n자동 폭발하는\n다이너마이트"), (97, 99, "앞에 파라라를 놓고\n적 영역에\n리모코고로 소환"), (100, 102, "물체에 닿으면\n영역 전체에 폭발\n피해는 공격력으로 변환"),
        (103, 103, "앞 3칸에 던진다\n패널 없는 칸이면\n물이 솟는다"), (104, 106, "앞의 구멍에서\n소환수가\n나온다"), (107, 107, "A 버튼을 눌러 세우고\n앞 칸에 독을\n뿌린다"), (108, 108, "A 버튼을 눌러 세우고\n주변에 독을\n뿌린다"), (109, 110, "소용돌이를 만든다\n빠뜨린 잡몹은\n즉사"),
        (111, 111, "타이밍을 맞히면\n적 공격을 튕겨낸다"), (112, 112, "피해를 한 번\n무효화한다"), (113, 113, "앞 1칸의 패널을\n파괴한다"), (114, 114, "앞 세로 3칸의\n패널을 파괴"), (115, 115, "적 영역 가로 1줄을\n패널 파괴"), (116, 116, "적 영역 맨 뒤 세로줄에\n대나무 창을 세운다"), (117, 117, "패널이 있는 칸이면\n적아군 관계없이\n큰 피해"),
        (118, 120, "신의 나라에 전해진\n필살의 주먹"), (121, 121, "자유자재로 변하는\n테크니컬 소드"), (122, 122, "HP 10 회복"), (123, 123, "HP 30 회복"), (124, 124, "HP 50 회복"), (125, 125, "HP 80 회복"), (126, 126, "HP 120 회복"), (127, 127, "HP 150 회복"), (128, 128, "HP 200 회복"), (129, 129, "HP 300 회복"),
        (130, 130, "앞 적 영역 1칸을\n내 영역으로\n칠한다"), (131, 131, "적 영역 왼쪽 1줄을\n내 영역으로\n칠한다"), (132, 132, "빼앗긴 패널 수만큼\n적에게\n천벌을 내린다"), (133, 135, "패널이 모두\n금이 간다"), (136, 136, "앞에 칩을 빼앗는\nUFO를 던진다"), (137, 137, "맞은 적은 원하는 대로\n움직일 수 없게 된다"), (138, 138, "적에게서 도망친다\n상대에 따라\n도망칠 수 없다"), (139, 139, "한 번만 패널 없는\n칸에 설 수 있다"), (140, 140, "내 영역 패널 상태를\n회복한다"),
        (141, 143, "HP를 서서히 회복하는\n양초를 설치"), (144, 144, "앞 칸에\n스톤큐브를 설치"), (145, 145, "공격이 맞으면\n난반사해 주변 적에\n맞힌다"), (146, 146, "앞 칸에 부수면 벌 받는\n지장보살을 설치"), (147, 147, "윈드박스를 놓고\n적 영역에\n바람을 일으킨다"), (148, 148, "진공 팬을 놓고\n적 영역의 적을\n끌어당긴다"), (149, 149, "적 영역에 독을 만드는\n아누비스상을 설치"),
        (150, 150, "전투 중 커스텀 게이지\n속도가 느려진다"), (151, 151, "전투 중 커스텀 게이지\n속도가 빨라진다"), (152, 152, "커스텀 게이지가\n즉시 가득 찬다"), (153, 155, "잠시 투명해져\n공격을 맞지 않는다"), (156, 156, "칩 공격을 할 때까지\n인비저블 상태"), (157, 157, "칩 공격 외에는\n잠시 인비저블"), (158, 158, "일정 시간 돌이 되어\n피해를 1만 받는다"), (159, 161, "일정 시간 소드 계열\n공격 외에는\n무적"), (162, 162, "큰 피해를 받아도\nHP 1로 버틴다"), (163, 163, "물 속성 배리어가 깨져도\n잠시 후 회복"), (164, 164, "받은 피해를 한 번\nHP로 흡수해 회복"),
        (165, 165, "공격력 10 미만 무효\n전기 속성에 약함"), (166, 166, "공격력 40 미만 무효\n물 속성에 약함"), (167, 167, "공격력 80 미만 무효\n불 속성에 약함"), (168, 168, "공격력 100 미만 무효\n나무 속성에 약함"), (169, 169, "공격력 100 미만 무효\n약점 속성 없음"), (170, 170, "공격력 150 미만 무효\n약점 속성 없음"), (171, 171, "공격력 200 미만 무효\n약점 속성 없음"),
        (172, 175, "자신이 선 줄을\n특수 패널로\n바꾼다"), (176, 178, "모든 패널을\n특수 패널로\n바꾼다"), (179, 179, "앞 칸을 피해를\n절반으로 줄이는\n홀리패널로"), (180, 180, "칩을 가진 적에게\n칩 수만큼\n피해"), (181, 183, "적에게 함정을 설치\n특정 속성 공격 시\n강제 피해"), (184, 184, "공격받은 척하며\n수리검으로\n반격"), (185, 185, "소드 공격을 받으면\n베어 되돌려친다"), (186, 186, "소환된 내비를\n이쪽 편으로\n돌린다"), (187, 187, "리커버리 사용 시\n반대로 피해를 준다"),
        (188, 188, "공격 칩 뒤에 쓰면\n공격력 +10"), (189, 192, "속성 공격 칩 뒤에 쓰면\n공격력 +40"), (193, 193, "내비 칩 뒤에 쓰면\n공격력 +20"), (194, 196, "적 1명을 공격하고\nHP 회복 하트로\n치료한다"), (197, 199, "앞으로 땅을 기는\n충격파 공격\n패널이 갈라진다"), (200, 202, "적 앞에서 베며\n회전 공격\n앞으로 못 갈 때도 있음"), (203, 205, "앞 세로 1줄에\n에어슈터\n땅을 기는 관통 공격"), (206, 208, "가로 1줄을 오가는\n부메랑 공격\n적을 관통"), (209, 211, "앞 1칸에\n집게 공격"), (212, 214, "분신해 트리플\n수리검 공격"), (215, 217, "주변을 한 바퀴 도는\n철구 공격"), (218, 220, "앞의 적 1명에게\n필살 NS 태클"), (221, 223, "적 주변에\n고드름을\n비처럼 내린다"), (224, 226, "부채꼴로 퍼지는 불 공격\n사거리 3칸"), (227, 229, "적을 추적하는\n쇼킹 멜로디\n맞으면 마비"), (230, 232, "앞 3칸 세로 1줄에\n썬더 공격"), (233, 235, "본체 공격에 더해\n패널 없는 칸에서\n스네이크 애로"),
        (236, 238, "병사들이 직진해\n몸통박치기"), (239, 241, "적 주변에 행성이\n생겨나 돌진"), (242, 244, "패널도 부수는 폭탄으로\n앞을 무차별 폭격"), (245, 247, "관에서 관통 레이저\n가끔 다른 것도 나온다"), (248, 250, "모든 줄에\n초연사\n에어버스트 공격"), (251, 251, "히트 전용 칩\n세 줄로 나아가는\n용암 쓰나미"), (252, 252, "아쿠아 전용 칩\n앞 3칸 적을 얼리는\n폭탄"), (253, 253, "일렉 전용 칩\nA를 누르면 HP를\n스파크로 공격"), (254, 254, "우드 전용 칩\n뒤에 고른 칩의\n공격력을 흡수"),
    ]
    for start, end, text in groups:
        if start <= index <= end:
            if max(map(len, text.splitlines())) > 10:
                text = '\n'.join(textwrap.wrap(' '.join(text.split()), width=10,
                                              break_long_words=False, break_on_hyphens=False))
            if len(text.splitlines()) > 3 or max(map(len, text.splitlines())) > 10:
                raise ValueError(f'description {index} exceeds 10 columns x 3 rows')
            return text
    raise ValueError(f"missing static description translation for index {index}")


# Shared UI table: replacements are deliberately phrase-based so control and
# dynamic-field bytes (<F1>/<F3>/<F9>...) remain byte-for-byte in place.
UI_REPLACEMENTS = {
    "フォルダ1": "폴더1", "フォルダ2": "폴더2", "フォルダ3": "폴더3", "フォルダ": "폴더", "ならびかえ": "정렬", "アイウエオ": "가나다",
    "コード": "코드", "攻撃力": "공격력", "属性": "속성", "枚数": "장수", "チップ容量": "칩 용량",
    "チップフォルダ": "칩 폴더", "えらぼう!": "선택하세요!", "へんしゅう": "편집", "そうび": "장착", "おなじチップ": "같은 칩",
    "ナビチップ": "내비 칩", "おおすぎるよ!": "너무 많아!", "こうかんして!": "교환해!", "レギュラーようりょう": "레귤러 용량",
    "あたらしいメールが きてるみたいだね": "새 메일이 왔나 봐", "どのメールを よむの?": "어떤 메일을 읽을까?", "だれからも きてないよ・・・": "온 메일이 없어…",
    "アタラシイ メールガ キテイマス": "새 메일이 왔습니다", "ドノ メールヲ ヨミマスカ?": "어떤 메일을 읽을까요?", "メールハ キテイマセン・・・": "메일이 오지 않았습니다…",
    "ステータス": "상태", "どのキノウを きょうかするの?": "어떤 기능을 강화할까?", "ノーマルスタイル": "노멀 스타일", "もどしたよ!": "로 돌아왔어!",
    "ロックバスター": "록버스터", "ロックバスターの": "록버스터의 ", "攻撃力をUPさせる?": "공격력을 올릴까?", "連射力をUPさせる?": "연사력을 올릴까?", "チャージ力をUPさせる?": "차지력을 올릴까?",
    "攻撃力がUPしたよ!": "공격력이 올랐어!", "連射力がUPしたよ!": "연사력이 올랐어!", "チャージ力がUPしたよ!": "차지력이 올랐어!",
    "そこはそれいじょう きょうかできないよ": "더 이상 강화할 수 없어", "バスターアップを もってないよ・・・": "버스터 업이 없어…", "スタイルを もってないよ・・・": "스타일이 없어…",
    "どのスタイルにするの?": "어떤 스타일로 할까?", "やめる": "취소", "はい": "예", "いいえ": "아니요",
    "フォルダのなかの": "폴더 안의", "ナビチップがおおくて": "내비 칩이 너무 많아", "つかいこなせないよ": "사용할 수 없어", "ブラザースタイル": "브라더 스타일",
    "ここまでのかつやくをセーブしておこうか?": "여기까지의 기록을 저장할까?", "すでに セーブデータが あるばあい": "이미 저장 데이터가 있으면",
    "うわがき しちゃうけど いい?": "덮어쓰게 되는데 괜찮아?", "セーブに しっぱいしたみたい・・・": "저장에 실패한 것 같아…", "もういちど やってみるね": "다시 해볼게", "よし セーブおわったよ!": "좋아, 저장 끝!",
    "プレイじかん": "플레이 시간", "データライブラリ": "데이터 라이브러리", "バトルチップ": "배틀칩", "クレジット": "크레디트",
    "なにも もってないよ・・・": "아무것도 없어…", "ロックマンのHPが かいふくした!": "록맨의 HP가 회복됐다!", "かんぜんかいふくした!": "완전히 회복됐다!", "HPは マンタンだよ!": "HP가 가득해!",
    "このエリアにきてから まだウイルスに": "이 에어리어에 온 뒤 아직 바이러스를", "であってないよ?": "만나지 않았어", "カギのかかった ミステリーデータが": "잠긴 미스터리 데이터가", "めのまえにないと つかえないよ!": "앞에 없으면 쓸 수 없어!", "いまは つかわないでおこうよ!": "지금은 쓰지 말자!",
    "じゃあ まずはじめにセーブをするね!": "그럼 먼저 저장할게!", "セーブかんりょう!": "저장 완료!",
    "ともだちと ネットバトルをするよ": "친구와 넷 배틀을 해", "れんしゅうだから きがるにたたかえるね": "연습이니 편하게 싸우자", "まけるとバトルチップを1枚とられる": "지면 배틀칩 1장을 빼앗겨", "しんけんしょうぶだからね!": "진검승부야!", "ともだちとバトルチップのこうかんをするよ": "친구와 배틀칩을 교환해", "ともだちとスタイルのこうかんをするよ": "친구와 스타일을 교환해",
    "つうしんエラーだ・・・": "통신 오류야…", "もういちど やりなおしてみてよ": "다시 시도해 봐", "たいせんを ちゅうだんするね": "대전을 중단할게", "まけたとき あいてにわたす": "졌을 때 상대에게 줄", "バトルチップがないから": "배틀칩이 없어서", "このモードは えらべないよ": "이 모드는 선택할 수 없어", "ともだちの方は": "친구 쪽은", "まだ じゅんび中みたい・・・": "아직 준비 중인 것 같아…", "ちょっとまってね": "잠시만 기다려",
    "やったね 熱斗くん!": "잘했어, 넷토!", "ナイスオペレーティングだったよ!": "멋진 오퍼레이팅이었어!", "ざんねんだったね 熱斗くん・・・": "아쉬웠어, 넷토…", "ボクもがんばらなきゃね!": "나도 힘내야겠어!", "おしかったね 熱斗くん!": "아깝다, 넷토!", "まったくの ごかくだったね!": "완전히 막상막하였어!",
    "ネットバトル(れんしゅう)": "넷 배틀(연습)", "ネットバトル(ほんばん)": "넷 배틀(실전)", "バトルチップトレード": "배틀칩 교환", "スタイルトレード": "스타일 교환",
    "あれ・・・": "어라…", "えらんでるモードがちがうよ?": "선택한 모드가 달라", "同じモードをえらんでね!": "같은 모드를 선택해!", "ノーマルスタイルにしてからじゃないと": "노멀 스타일이 아니면", "このモードは えらべないよ": "이 모드는 선택할 수 없어",
    "トレードに出すチップを": "교환할 칩을", "えらんでるところだね・・・": "고르는 중이야…", "この2枚を こうかんするよ?": "이 두 장을 교환할까?", "トレードかんりょう!": "교환 완료!", "でも、いまの こうかんって": "그런데 방금 교환은", "イミあったの・・・?": "의미가 있었을까…?", "なし": "없음", "トレードに出すスタイルを": "교환할 스타일을", "この2つを こうかんするよ?": "이 두 개를 교환할까?", "ともだちが もっているスタイルは": "친구가 가진 스타일은", "きほんてきに こうかんできないよ!": "원칙적으로 교환할 수 없어!", "でも おなじスタイルであれば": "하지만 같은 스타일이라면", "こうかんOKだけどね!": "교환할 수 있어!",
    "こうかがきれたよ!": "효과가 끝났어!", "熱斗くん": "넷토",
    "チップフォルダを": "칩 폴더를", "チップフォルダを そうびしなきゃ!": "칩 폴더를 장착해야 해!",
    "編集がめんで": "편집 화면에서", "チップフォルダが 30枚になってないよ!": "칩 폴더가 30장이 아니야!",
    "5枚までしか": "5장까지", "8枚までしか": "8장까지", "レギュラーチップにできないよ": "레귤러 칩으로 만들 수 없어",
    "いまのスタイルでは": "지금 스타일은", "スタイルのまま": "스타일인 채로", "フォルダへんしゅうがめんで": "폴더 편집 화면에서", "5枚いかにしてね!": "5장 이하로 해!",
    "これがボクの": "이게 내", "ノーマルスタイルに": "노멀 스타일로", "を そうびしたよ!": "을 장착했어!",
    "バスターUP のこり": "남은 버스터 UP", "コ)": "개)", "のこり": "남은", "つかうよ?": "을 사용할까?", "つかってるよ?": "을 사용 중이야?",
    "ロックマンのHPが": "록맨의 HP가", "よし ": "좋아, ", "ともだちと": "친구와", "友だちと": "친구와", "まだ": "아직",
    "ともだちの方も": "친구도", "をえらんでるよ?": "을 선택했어?", "ふたりともが えらんじゃダメだよ": "둘 다 선택하면 안 돼",
    "どのスタイルを こうかんする?": "어떤 스타일을 교환할까?", "セーブシマスカ?": "저장할까요?", "ココマデノカツヤクヲ": "여기까지의 기록을",
    "スデニ セーブデータガ アルバアイ": "이미 저장 데이터가 있으면", "ウワガキ サレマスガ ヨロシイデスカ?": "덮어쓰게 되는데 괜찮습니까?",
    "セーブニ シッパイシマシタ・・・": "저장에 실패했습니다…", "モウイチド オコナイマスカ?": "다시 시도할까요?", "セーブ カンリョウ シマシタ": "저장이 완료됐습니다",
    "HPをじょじょに": "HP를 서서히", "こうかを": "효과를", "にがてな属性はなし": "약점 속성 없음",
    "を\n": "을\n", "を ": "을 ", "が ": "가 ", "に ": "에 ", "しました": "했습니다", "しなきゃ": "해야", "できない": "할 수 없어",
    "がめんで": "화면에서", "は ": "은 ", "たりないから": "부족해서", "だよ": "야", "のまま": "인 채로", "いちど": "한 번",
    "の": "의", "ハイ": "예", "イイエ": "아니요", "枚": "장", "。": ".", "・・・": "…", "れ:": "개:", "0れ": "0개",
}


# Whole text runs whose phrase-by-phrase result gets a particle wrong. A run
# right after a printed name or number drops its particle: the last syllable
# it would attach to is not known here.
UI_RUNS = {
    "を\nそうびしました": "\n장착했습니다",
    "ナビチップが おおすぎるよ!\nへんしゅうがめんで こうかんして!": "내비 칩이 너무 많아!\n편집 화면에서 교환해!",
    "レギュラーようりょうが たりないから\nレギュラーチップにできないよ": "레귤러 용량이 부족해서\n레귤러 칩으로 만들 수 없어",
    "これがボクのステータスだよ": "이게 내 상태야",
    "ノーマルスタイルに もどしたよ!": "노멀 스타일로 돌아왔어!",
    "を そうびしたよ!": " 장착했어!",
    "いちど ブラザースタイルのまま\nフォルダへんしゅうがめんで\nナビチップを 5枚いかにしてね!": "일단 브라더 스타일인 채로\n폴더 편집 화면에서\n내비 칩을 5장 이하로 줄여 줘!",
    "」を つかうよ?\n": "」 사용할까?\n",
    "」は つかってるよ?": "」\n이미 사용 중이야!",
    "ともだちの方はまだ\nトレードに出すチップを\nえらんでるところだね・・・": "친구 쪽은 아직\n교환할 칩을\n고르는 중이야…",
    "ともだちの方はまだ\nトレードに出すスタイルを\nえらんでるところだね・・・": "친구 쪽은 아직\n교환할 스타일을\n고르는 중이야…",
    "ともだちの方も「なし」をえらんでるよ?\nふたりともが えらんじゃダメだよ": "친구도 「없음」을 골랐어?\n둘 다 고르면 안 돼",
}


def translate_ui(text: str) -> str:
    if text in UI_RUNS:
        return UI_RUNS[text]
    for source in sorted(UI_REPLACEMENTS, key=len, reverse=True):
        text = text.replace(source, UI_REPLACEMENTS[source])
    # A few native shorthand fragments are only present in dynamic menu rows.
    extra = {"おなじチップは": "같은 칩은", "までしか": "까지", "入れられないよ": "넣을 수 없어", "ぜんぶで": "전부 ", "枚になってないよ!": "장이 아니야!", "おなじ": "같은", "きてる": "왔어", "みたいだね": "것 같아", "よむ": "읽기", "きてない": "오지 않았어", "きょうか": "강화", "おく": "놓기", "せんようチップ": "전용 칩"}
    for source in sorted(extra, key=len, reverse=True):
        text = text.replace(source, extra[source])
    # Only text runs reach here (see ui_tokens), so any kana left is prose.
    if re.search(r"[\u3040-\u30ff\u3400-\u9fff]", text):
        raise ValueError(f"untranslated Japanese static UI text: {text!r}")
    return text


def translate_ui_entry(index: int, entry: bytes) -> bytes:
    if not entry:
        # An empty slot shares its offset with the next script, so a caller
        # of this index runs that script. It stays empty.
        return entry
    if index == 65:
        # Save summary has an eight-cell consumer (0802A3FA), with its next
        # label buffer only 0x200 bytes away. Keep all eight Korean syllables
        # and omit the inter-word space for this one fixed-width label.
        assert decode_native(entry) == 'データライブラリ'
        text='데이터라이브러리'
        assert len(text)==8
        return encode_native(text)+b'\xE7'
    # Translate the text runs only; every command keeps its bytes, and the
    # string keeps its own terminator rather than gaining one.
    numeric = index in NUMERIC_ROWS
    result = b"".join(
        encode_native(translate_ui(decode_native(chunk))) if kind == "text" else chunk
        for kind, chunk in ui_tokens(entry, numeric))
    if ui_commands(result, numeric) != ui_commands(entry, numeric):
        raise ValueError(f"UI entry {index}: translation changed its commands")
    return result


def _read_table(source: bytes, base: int) -> tuple[list[int], list[bytes], bytes]:
    table_size = struct.unpack_from("<H", source, base)[0]
    if table_size < 4 or table_size % 2:
        raise ValueError(f"invalid table size at 0x{base:X}")
    offsets = [struct.unpack_from("<H", source, base + pos)[0] for pos in range(0, table_size, 2)]
    if offsets[0] != table_size or any(a > b for a, b in zip(offsets, offsets[1:])):
        raise ValueError(f"invalid offset table at 0x{base:X}")
    raw_entries = [source[base + left:base + right] for left, right in zip(offsets, offsets[1:])]
    return offsets, raw_entries, source[base:base + offsets[-1]]


def _rebuild(entries: list[bytes]) -> bytes:
    table_size = (len(entries) + 1) * 2
    offsets = [table_size]
    for entry in entries:
        offsets.append(offsets[-1] + len(entry))
    if offsets[-1] > 0xFFFF:
        raise ValueError("static table exceeds 16-bit relative offset capacity")
    return struct.pack("<" + "H" * len(offsets), *offsets) + b"".join(entries)


def _write_record(source: bytes, replacement: bytes, offset: int, name: str, source_offset: int) -> dict:
    return {
        "kind": "static_table_asset", "name": name, "rom_offset": offset,
        "source_rom_offset": source_offset,
        "byte_length": len(replacement), "source_byte_length": len(source),
        "expected_source_sha256": sha256(source), "sha256": sha256(replacement),
        "replacement_hex": replacement.hex(),
    }


def translated_chip_names(source: bytes) -> list[str]:
    """The chip names the relocated table carries, in table order."""
    _, raw_entries, _ = _read_table(source, NAME_TABLE)
    return [translate_name(decode_native(entry)) for entry in raw_entries]


def translated_second_chip_names(source: bytes) -> list[str]:
    """The names of chip ids 256 onward, in table order."""
    _, raw_entries, _ = _read_table(source, SECOND_NAME_TABLE)
    names = []
    for entry in raw_entries:
        text = decode_native(entry)
        korean = translate_second_name(text)
        # A name kept as it was has to come back byte for byte.
        if korean == text and encode_native(text) + b"\xE7" != entry:
            raise ValueError(f"second-table name {text!r} does not round-trip")
        names.append(korean)
    return names


def printed_chip_names(source: bytes) -> list[str]:
    """Every chip name by chip id, as a printChip of that id draws it.

    Ids 0-254 are the first table and 256 onward the second; id 255 has no
    entry in either and is left empty.
    """
    first = translated_chip_names(source)
    return first + [""] * (256 - len(first)) + translated_second_chip_names(source)


def planned_writes(source: bytes) -> tuple[list[dict], dict]:
    specs = (("chip_names", NAME_TABLE, NAME_RELOC), ("chip_names_2", SECOND_NAME_TABLE, SECOND_NAME_RELOC),
             ("chip_descriptions", DESC_TABLE, DESC_RELOC), ("pet_submenu_ui", UI_TABLE, UI_RELOC))
    writes: list[dict] = []
    reports: list[dict] = []
    for table_name, source_base, relocation in specs:
        offsets, raw_entries, original = _read_table(source, source_base)
        if table_name == "chip_names":
            translated = [encode_native(name) + b"\xE7" for name in translated_chip_names(source)]
        elif table_name == "chip_names_2":
            translated = [encode_native(name) + b"\xE7" for name in translated_second_chip_names(source)]
        elif table_name == "chip_descriptions":
            translated = []
            for index, entry in enumerate(raw_entries):
                decoded = decode_native(entry)
                prefix = "<EC>  <F1>1"
                suffix = "<EB><F1>2"
                if not decoded.startswith(prefix) or not decoded.endswith(suffix):
                    raise ValueError(f"description {index} has unexpected control skeleton")
                # Keep only the renderer controls; replacing the original prose
                # is required to prevent Japanese and Korean glyph streams from
                # being drawn on top of one another.
                translated_text = prefix + description_text(index) + suffix
                translated.append(encode_native(translated_text) + b"\xE7")
        else:
            translated = [translate_ui_entry(index, entry) for index, entry in enumerate(raw_entries)]
        replacement = _rebuild(translated)
        if any(value != 0xFF for value in source[relocation:relocation + len(replacement)]):
            raise ValueError(f"relocation target 0x{relocation:X} is not clean expanded fill")
        writes.append(_write_record(original, replacement, relocation, table_name, source_base))
        old_pointer = struct.pack("<I", ROM_BASE + source_base)
        new_pointer = struct.pack("<I", ROM_BASE + relocation)
        locations = [pos for pos in range(0, len(source) - 3, 4) if source[pos:pos + 4] == old_pointer]
        if not locations:
            raise ValueError(f"no aligned pointer literals for {table_name}")
        for pos in locations:
            writes.append({
                "kind": "static_table_pointer", "table": table_name, "rom_offset": pos,
                "expected_source_hex": old_pointer.hex(" "), "replacement_hex": new_pointer.hex(" "),
            })
        reports.append({
            "name": table_name, "source_rom_offset": source_base, "relocated_rom_offset": relocation,
            "source_table_byte_length": len(original), "replacement_table_byte_length": len(replacement),
            "entry_count": len(raw_entries), "source_sha256": sha256(original), "replacement_sha256": sha256(replacement),
            "pointer_locations": locations,
            "translated_entry_count": len(translated),
        })
    return writes, {"module_sha256": sha256(Path(__file__).read_bytes()), "tables": reports, "scope": "Chip Folder, Sub Chip, Data Library, Rockman status, Email, Key Item, Communication, Save static submenu populations"}
