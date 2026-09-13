"""Validate final ROM entry diffs and every changed literal's encoded whitespace."""
import argparse
import hashlib
import json
from pathlib import Path
from build_semantic_translation_dev_rom import archive_offsets, hangul_ordinal
from gba_lz77 import decompress
from layout_byte_verifier import table_mapping, verify_changed_literals

root = Path(__file__).resolve().parents[1]
p = argparse.ArgumentParser()
p.add_argument('--stem', required=True)
p.add_argument('--report', type=Path, required=True)
a = p.parse_args()


def load(stem):
    manifest_path = root/'poc/output'/ (stem+'_manifest.json')
    m = json.loads(manifest_path.read_text(encoding='utf-8'))
    rom = (root/'poc/output'/(stem+'.gba')).read_bytes()
    assert hashlib.sha256(rom).hexdigest() == m['output']['sha256']
    archives = {}
    for item in m['archives']:
        start = item['relocated_rom_offset']
        raw = decompress(rom, start)[0] if item['storage'] == 'lz77' else rom[start:start+item['replacement_decompressed_byte_length']]
        assert hashlib.sha256(raw).hexdigest() == item['replacement_decompressed_sha256']
        offsets = archive_offsets(raw)
        archives[item['selector']] = [raw[x:y] for x,y in zip(offsets, offsets[1:])]
    return m, archives


old_m, old = load('exe2_rev1_semantic_translation_choice_fix')
m, new = load(a.stem)
layout = {entry['entry_id']: entry for entry in m['dialogue_layout']['entries'] if entry['status'].startswith('changed')}
audit = json.loads((root/'analysis/dialogue_layout_audit.json').read_text(encoding='utf-8'))
expected = {(r['selector'], r['entry_index']): r['entry_id'] for r in audit['entries'] if r['rom_eligible'] and r['status'].startswith('changed')}
actual = {(sel, i) for sel in old for i,(before, after) in enumerate(zip(old[sel], new[sel], strict=True)) if before != after}
assert actual == expected.keys(), {'unexpected': sorted(actual - expected.keys()), 'missing': sorted(expected.keys() - actual)}
table = root/'external/TextPet-plugins-6c6d705/TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins/exe2-utf8.tbl'
mapping = table_mapping(table.read_text(encoding='utf-8-sig'))
for entry in layout.values():
    for page in entry['pages']:
        for text in page.get('text_after', []):
            for char in text:
                if '가' <= char <= '힣':
                    mapping[char] = b'\xf9\xfc' + hangul_ordinal(char).to_bytes(2,'little')
literal_count = 0
for key, identity in expected.items():
    literal_count += verify_changed_literals(new[key[0]][key[1]], layout[identity], mapping)
report = {'status':'PASS', 'old_rom_sha256':old_m['output']['sha256'], 'rom_sha256':m['output']['sha256'],
          'changed_entry_count':len(actual), 'changed_archive_count':len({s for s,i in actual}),
          'encoded_changed_page_literal_slots_verified':literal_count,
          'unplanned_entry_changes':0,
          'scope':'Exact ROM entry diffs and planned encoded literal whitespace; runtime evidence is separate.',
          'changed_entries':[{'selector':s,'entry_index':i} for s,i in sorted(actual)]}
a.report.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps({k:v for k,v in report.items() if k!='changed_entries'},indent=2))
