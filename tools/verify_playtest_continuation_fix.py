"""Verify the sole targeted tail change against source and the previous ROM."""
import hashlib
import json
from pathlib import Path
import re
import struct
from layout_byte_verifier import table_mapping


def sha(data):
    return hashlib.sha256(data).hexdigest()


root = Path(__file__).resolve().parents[1]
old_stem = 'exe2_rev1_semantic_translation_linewrap_fix'
new_stem = 'exe2_rev1_semantic_translation_playtest_fix_v2'
old = json.loads((root/f'poc/output/{old_stem}_manifest.json').read_text(encoding='utf-8'))
new = json.loads((root/f'poc/output/{new_stem}_manifest.json').read_text(encoding='utf-8'))
old_rom = (root/f'poc/output/{old_stem}.gba').read_bytes()
new_rom = (root/f'poc/output/{new_stem}.gba').read_bytes()
source = (root/'Battle Network Rockman EXE 2 (Japan) (Rev 1).gba').read_bytes()
assert sha(old_rom) == old['output']['sha256']
assert sha(new_rom) == new['output']['sha256']
assert sha(source) == new['immutable_source']['sha256']
assert old['font']['payload_sha256'] == new['font']['payload_sha256']
old_by_id = {a['selector']: a for a in old['archives']}
new_by_id = {a['selector']: a for a in new['archives']}
assert old_by_id.keys() == new_by_id.keys()
changed_tails = []
for key, a in new_by_id.items():
    b = old_by_id[key]
    assert a['replacement_decompressed_sha256'] == b['replacement_decompressed_sha256'], key
    if a.get('physical_continuation', {}).get('replacement_sha256') != b.get('physical_continuation', {}).get('replacement_sha256'):
        changed_tails.append(key)
assert changed_tails == ['00/164'], changed_tails
records = json.loads((root/'translations/physical_continuation_translations.json').read_text(encoding='utf-8'))['records']
record = next(r for r in records if r['selector'] == '00/164')
start, size = record['source_rom_offset'], record['source_byte_length']
assert sha(source[start:start+size]) == record['source_sha256']
source_tpl = (root/'analysis/physical_continuation_tpl'/record['source_tpl_filename']).read_bytes()
new_tpl = (root/'translations'/record['translated_tpl_filename']).read_bytes()
assert sha(source_tpl) == record['source_tpl_sha256']
assert sha(new_tpl) == record['translated_tpl_sha256']
# This simple script contains only two single-line literals. No control changes.
strip_literals = lambda b: re.sub(r'"[^"\r\n]*"', '"TEXT"', b.decode('utf-8-sig')).replace('\r\n', '\n')
assert strip_literals(source_tpl) == strip_literals(new_tpl)
assert len(record['translation']) <= 21 and '\n' not in record['translation']
table = table_mapping((root/'external/TextPet-plugins-6c6d705/TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins/exe2-utf8.tbl').read_text(encoding='utf-8-sig'))
literal = bytearray()
for char in record['translation']:
    if '가' <= char <= '힣':
        lead, trail = char.encode('euc_kr')
        ordinal = (lead-0xb0)*94 + trail-0xa1
        literal.extend(b'\xf9\xfc' + struct.pack('<H', ordinal))
    else:
        literal.extend(table[char])
tail = new_by_id['00/164']['physical_continuation']
raw = new_rom[tail['relocated_rom_offset']:tail['relocated_rom_offset']+tail['replacement_byte_length']]
old_tail = source[start:start+size]
assert raw.startswith(old_tail[:5]), 'portrait/msgOpen changed'
assert bytes(literal) in raw, 'actual compiled bytes do not contain the exact translation'
# keyWait/end and the trailing padding literal are unchanged.
literal_offset = raw.index(literal)
assert raw[literal_offset+len(literal):] == old_tail[-3:]
result = {'status': 'PASS (bench)', 'rom_sha256': sha(new_rom), 'baseline_sha256': sha(old_rom),
          'unchanged_archive_cores': len(new_by_id), 'changed_tails': changed_tails,
          'font_payload_unchanged': True, 'source_and_controls_verified': True,
          'literal': record['translation'], 'literal_hex': literal.hex(),
          'runtime_status': 'PENDING separate natural-play replay'}
(root/'analysis/exe2_rev1_playtest_continuation_static_qa.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
print(json.dumps(result, ensure_ascii=False))
