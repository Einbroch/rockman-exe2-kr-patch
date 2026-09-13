"""Check and bind targeted runtime observations; does not claim natural-play QA."""
import hashlib
import json
from pathlib import Path
from PIL import Image, ImageChops

root = Path(__file__).resolve().parents[1]
evidence_root = root/'analysis/emucap'


def load(path):
    return json.loads(path.read_text(encoding='utf-8'))


manifest = load(root/'poc/output/exe2_rev1_semantic_translation_linewrap_fix_manifest.json')
sha = manifest['output']['sha256']
for folder in ['wrap_366_5_verified', 'wrap_12_2_verified', 'wrap_pet_choice_verified']:
    result = load(evidence_root/folder/'result.json')
    assert result['rom_sha256'] == sha and result['exit_code'] == 0 and result['audio_enabled'] is False
old = load(evidence_root/'wrap_366_5_old/second_page.json')
fixed = load(evidence_root/'wrap_366_5_verified/second_page.json')
assert old['max_col'] == 26 and fixed['max_col'] == 16
assert fixed['max_row'] == 2 and fixed['entry'] == 5 and fixed['x_tile'] == 8
other = load(evidence_root/'wrap_12_2_verified/first_page.json')
assert other['max_col'] == 17 and other['max_row'] == 1
for name, entry in [('yes_branch', 16), ('no_branch', 10), ('cancel_branch', 10)]:
    assert load(evidence_root/'wrap_pet_choice_verified'/(name+'.json'))['entry'] == entry
for name in ['first_page', 'after_confirm']:
    assert (evidence_root/'wrap_366_5_old'/(name+'.png')).read_bytes() == (evidence_root/'wrap_366_5_verified'/(name+'.png')).read_bytes()
with Image.open(evidence_root/'wrap_366_5_old/second_page.png') as before, Image.open(evidence_root/'wrap_366_5_verified/second_page.png') as after:
    assert ImageChops.difference(before.convert('RGB').crop((64,104,192,120)), after.convert('RGB').crop((64,104,192,120))).getbbox() is None
evidence = {}
for folder in ['wrap_366_5_old', 'wrap_366_5_verified', 'wrap_12_2_verified', 'wrap_pet_choice_verified']:
    for path in (evidence_root/folder).iterdir():
        if path.suffix in {'.png', '.json', '.lua'}:
            evidence[path.relative_to(root).as_posix()] = hashlib.sha256(path.read_bytes()).hexdigest()
audit = load(root/'analysis/dialogue_layout_audit.json')
report = {
    'issue_id': 'dialogue-horizontal-overflow-and-missing-inline-newlines',
    'rom_sha256': sha, 'status': 'PASS_TARGETED_RENDERER_PARTIAL_CORPUS',
    'audio_enabled': False,
    'cause': 'Semantic slot rendering stripped source boundary whitespace; TextPet heredoc LF-only serialization also greedily swallowed restored leading blank lines.',
    'fix': 'Whitespace-only page layout with restored source boundary newlines, word-boundary wrapping at 21 tiles and 3 rows, and CRLF heredoc framing. Preserve prose and non-text controls.',
    'artifact_byte_qa': 'analysis/exe2_rev1_dialogue_wrap_bytes_qa.json',
    'static_qa': 'analysis/exe2_rev1_semantic_translation_linewrap_fix_static_qa.json',
    'compiler_regression': 'analysis/textpet_layout_serialization_qa.json',
    'audit_summary': audit['summary'],
    'corrected_entries': 340, 'corrected_archives': 121,
    'remaining_capacity_pages': 54,
    'user_scene_before': old, 'user_scene_after': fixed,
    'other_scene_after': other,
    'visual_review': 'Agent inspected corrected user-scene page, second representative inline-wait page and both PET choice cursor positions.',
    'rejected_candidate': {'sha256':'12838bd902503da647f260e544727346bb0b16b0a4184a2a87a881003784e934', 'reason':'leading newline missing from compiled ROM; runtime still overflowed; never selected by launcher'},
    'limits': [
        'Tests inject exact candidate archives and initialize the renderer; map entry and prefix flag checks are bypassed.',
        'Special renderers, dynamic fields, unsupported controls and page-capacity exceptions remain unresolved, not implicitly passed.',
        'No new pages or button waits were inserted; prose, choice targets and event controls remain unchanged.',
        'Only two ordinary dialogue entries and the PET choice were replayed; remaining changed entries have static byte/layout checks, not individual runtime passes.',
        'No full-game or distribution-ready claim; user saves were not modified.',
    ],
    'evidence_sha256': evidence,
}
(root/'analysis/exe2_rev1_dialogue_wrap_runtime_qa.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(report['status'])
