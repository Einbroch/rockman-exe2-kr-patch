"""Inventory layout on the same transformed literals consumed by the ROM build."""
import json
from collections import Counter
from pathlib import Path
from build_semantic_translation_dev_rom import load_batches, SCRIPT_RE, translate_block
from dialogue_layout import layout_script

root = Path(__file__).resolve().parents[1]
entries, archives, _ = load_batches(root/'translations')
base = json.loads((root/'translations/archive_00_09_dialogue_draft.json').read_text(encoding='utf-8'))
for entry in base['entries']:
    if entry['entry_index'] in {233, 235}:
        entries[('00/404', entry['entry_index'])] = entry
records = []
for selector, archive in archives.items():
    source = (root/'analysis'/archive['tpl_filename']).read_bytes().decode('utf-8-sig')
    for match in SCRIPT_RE.finditer(source):
        key = (selector, int(match.group(1)))
        entry = entries.get(key)
        if entry is None:
            continue
        # The same step the build takes, whichever form the entry was authored in.
        old, _ = translate_block(match.group(0), entry)
        new, record = layout_script(match.group(0), old, entry['entry_id'])
        record.update(selector=selector, entry_index=key[1], rom_eligible=selector != '00/357')
        records.append(record)
summary = dict(Counter(r['status'] for r in records))
report = {'kind': 'standard_dialogue_whitespace_layout_audit', 'width_cells': 21, 'rows': 3,
          'scope': 'all 7702 protected entries; special renderers are audit-only, not passed',
          'summary': summary, 'entries': records}
(root/'analysis/dialogue_layout_audit.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
print(json.dumps(summary))
target = next(x for x in records if (x['selector'], x['entry_index']) == ('00/366', 5))
print(json.dumps(target, ensure_ascii=False, indent=2))
