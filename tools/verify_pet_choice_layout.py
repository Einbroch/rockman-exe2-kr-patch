"""Bind the focused PET choice regression to exact ROMs and captured evidence."""
import hashlib
import json
from pathlib import Path

from build_semantic_translation_dev_rom import (
    SCRIPT_RE, QUOTE_RE, archive_offsets, transform_script,
)
from gba_lz77 import decompress

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def read_json(path):
    return json.loads(path.read_text(encoding='utf-8'))


def candidate(stem):
    path = ROOT / 'poc/output' / (stem + '.gba')
    blob = path.read_bytes()
    manifest = read_json(path.with_name(stem + '_manifest.json'))
    assert digest(blob) == manifest['output']['sha256']
    archives = {}
    for item in manifest['archives']:
        start = item['relocated_rom_offset']
        raw = (decompress(blob, start)[0] if item['storage'] == 'lz77'
               else blob[start:start + item['replacement_decompressed_byte_length']])
        assert digest(raw) == item['replacement_decompressed_sha256']
        archives[item['selector']] = raw
    return blob, archives


old, before = candidate('exe2_rev1_semantic_translation_emulator_test_continuation_fix')
new, after = candidate('exe2_rev1_semantic_translation_choice_fix')
assert before.keys() == after.keys()
changed = [key for key in before if before[key] != after[key]]
assert changed == ['00/404'], changed
old_offsets = archive_offsets(before['00/404'])
new_offsets = archive_offsets(after['00/404'])
assert len(old_offsets) == len(new_offsets)
changed_entries = [i for i in range(len(old_offsets)-1)
                   if before['00/404'][old_offsets[i]:old_offsets[i+1]] !=
                   after['00/404'][new_offsets[i]:new_offsets[i+1]]]
assert changed_entries == [10], changed_entries

tpl = (ROOT / 'analysis/archive_00_404_textpet_full.tpl').read_bytes().decode('utf-8-sig')
block = next(m.group(0) for m in SCRIPT_RE.finditer(tpl) if m.group(1) == '10')
batch = read_json(ROOT / 'translations/archive_batch_0077_100.json')
entry = next(x for x in batch['entries'] if x['entry_id'] == 'archive_00_404_entry_0010')
assert digest(block.encode('utf-8')) == entry['source_tpl_block_sha256']
fixed, _ = transform_script(block, entry['draft_translation'], entry['entry_id'], preserve_option_layout=True)
assert QUOTE_RE.sub('<TEXT>', block) == QUOTE_RE.sub('<TEXT>', fixed)
quotes = list(QUOTE_RE.finditer(fixed))


def literal(match):
    if match.group(1) is None:
        return match.group(2).replace(r'\n', '\n')
    return '\n'.join(line.lstrip('\t') for line in match.group(1).splitlines()[1:-1])


assert literal(quotes[1]) == '나는 다 외웠으니\n내가 가르쳐 줄까?\n'
assert literal(quotes[2]) == '가르쳐 줘 '
assert literal(quotes[3]) == '됐어'

runtime = ROOT / 'analysis/emucap/pet_choice_fixed_cancel_verified'
result = read_json(runtime / 'result.json')
assert result['rom_sha256'] == digest(new)
assert result['exit_code'] == 0 and result['audio_enabled'] is False
branches = {}
for name, expected in [('yes_branch', 16), ('no_branch', 10), ('cancel_branch', 10)]:
    branches[name] = read_json(runtime / (name + '.json'))
    assert branches[name]['entry'] == expected
evidence = {}
for folder in [ROOT/'analysis/emucap/pet_choice_old', runtime]:
    for path in sorted(folder.iterdir()):
        if path.suffix in {'.png', '.json', '.lua'}:
            evidence[path.relative_to(ROOT).as_posix()] = digest(path.read_bytes())
report = {
    'issue_id': 'pet-bookshelf-choice-overlap',
    'scope': '00/404 entry 10 only; development candidate, not release',
    'old_rom_sha256': digest(old), 'new_rom_sha256': digest(new),
    'static_status': 'PASS', 'changed_archives': changed,
    'changed_entry_indices': changed_entries, 'source_control_skeleton_unchanged': True,
    'question_rows': [literal(quotes[1]).splitlines()[0], literal(quotes[1]).splitlines()[1]],
    'choices': [literal(quotes[2]).strip(), literal(quotes[3])],
    'runtime_status': 'PASS_TARGETED_RENDERER_INTERVENTION',
    'runtime_scope': result['scope'], 'audio_enabled': False,
    'branch_snapshots': branches,
    'visual_review': 'Agent inspected old overlap, fixed three-row layout, cursor on both choices, yes/no/cancel pages.',
    'limitations': [
        'Natural map entry on the new ROM and mGBA-specific reproduction remain unverified.',
        'Other choice scripts are not covered by this fix. Broad activation rejected because other draft slot layouts need separate audit.',
        'Old first-run cancel capture used simultaneous A+B; only fixed_cancel_verified evidence establishes B cancellation.',
        'Full-game runtime and translation review remain open.',
    ],
    'evidence_sha256': evidence,
}
output = ROOT/'analysis/exe2_rev1_pet_choice_layout_qa.json'
output.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
print(json.dumps({'status': report['runtime_status'], 'report': str(output)}, ensure_ascii=False))
