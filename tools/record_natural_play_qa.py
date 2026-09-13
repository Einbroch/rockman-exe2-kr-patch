"""Bind inspected natural-play evidence and save round-trips to exact ROMs."""
import hashlib
import json
from pathlib import Path

root = Path(__file__).resolve().parents[1]
old_root = root/'analysis/playtest_20260909'
new_root = root/'analysis/playtest_20260910_fixed'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def evidence(path):
    return {'path': str(path.relative_to(root)), 'sha256': digest(path)}


def artifact_path(receipt, name):
    """Resolve a receipt artifact in place or in the recoverable screenshot archive."""
    in_place = receipt.parent/name
    if in_place.exists():
        return in_place
    session_root = old_root if old_root in receipt.parents else new_root
    archived = session_root/'_archived_screenshots'/receipt.parent.name/name
    if archived.exists():
        return archived
    raise FileNotFoundError(in_place)


segments = []
screen_count = 0
for session in (old_root, new_root):
    for receipt in sorted(session.glob('*/result.json')):
        r = json.loads(receipt.read_text(encoding='utf-8'))
        assert r['completed'] and r['exit_code'] == 0
        assert r['audio_enabled'] is False and '--noAudio' in r['command']
        assert digest(Path(r['rom_path'])) == r['rom_sha256']
        assert digest(Path(r['emulator_path'])) == r['emulator_sha256']
        for name, value in r['artifacts'].items():
            assert digest(artifact_path(receipt, name)) == value, (receipt, name)
            screen_count += name.endswith('.png')
        if r['input_checkpoint']:
            previous = root/r['input_checkpoint']
            prior_r = json.loads((previous.parent/'result.json').read_text(encoding='utf-8'))
            assert prior_r['rom_sha256'] == r['rom_sha256']
            assert digest(previous) == r['artifacts']['input.mss']
        segments.append(evidence(receipt))

candidate = root/'poc/output/exe2_rev1_semantic_translation_playtest_fix_v2.gba'
assert digest(candidate) == 'a648a984d5a112aaef3d67462ec3e6708aa6ad5acd7e31e53263af7247b6a27a'
assert digest(new_root/'EXE2_KR_playtest_20260910_fixed.gba') == digest(candidate)
old_battery = old_root/'012_saved/battery_classroom.sav'
new_battery = new_root/'008_saved_after_class/battery_after_class.sav'
assert digest(old_battery) == 'bccc38c8d92df3d447ce965d4555953213c31d2587d7b68268f7f021a52f601f'
assert digest(new_battery) == '28b10f935edc8355466971cfeb86c8048a65bd4a848ee9ed2bca8e0bb10e453d'
report = {
    'status': 'PASS targeted natural-play fix and save round-trip; PARTIAL whole-game QA',
    'candidate': evidence(candidate),
    'play_method': 'Normal controller inputs; fresh boot/in-game Continue; no game RAM or progress injection. Same-ROM full savestates between segments.',
    'audio_enabled': False,
    'verified_segment_receipts': len(segments), 'captured_screenshots': screen_count,
    'segment_receipts': segments,
    'fixed_issue': {
        'identity': '00/164 physical continuation, terminal jump from entry 16 to 17',
        'before': evidence(old_root/'033_after_class/step_002.png'),
        'after': evidence(new_root/'006_fixed_tail/step_001.png'),
        'translated_display': '넷토、 역시...',
        'visual_review': 'Agent inspected native emulator screenshot: Korean line and punctuation visible within one row, no clipping or cursor overlap.',
        'immediate_predecessor': evidence(new_root/'005_before_fixed_tail/checkpoint.mss'),
        'field_return': evidence(new_root/'007_after_fix_field/step_001.png'),
        'player_movement': evidence(new_root/'007_after_fix_field/step_002.png'),
    },
    'save_validation': {
        'input_battery': evidence(old_battery),
        'new_rom_coldboot_continue': evidence(new_root/'001_coldboot_continue/step_003.png'),
        'game_save_completed_message': evidence(new_root/'008_saved_after_class/step_002.png'),
        'after_class_battery': evidence(new_battery),
        'after_class_coldboot_continue': evidence(new_root/'009_saved_coldboot/step_003.png'),
        'latest_same_rom_checkpoint': evidence(new_root/'010_resume_field/checkpoint.mss'),
    },
    'baseline_natural_regressions': {
        'former_00_163_crash_followup': evidence(old_root/'008_continuation/step_001.png'),
        'L_hint_three_rows': evidence(old_root/'013_rockman_hint/step_001.png'),
        'PET_choice': evidence(old_root/'019_pet_choice/step_001.png'),
        'PET_decline': evidence(old_root/'020_pet_no/step_002.png'),
        'PET_accept': evidence(old_root/'021_pet_yes/step_001.png'),
        'PET_B_cancel': evidence(old_root/'024_pet_cancel/step_001.png'),
    },
    'latest_natural_play_checkpoint': evidence(new_root/'192_pink_house_edge/checkpoint.mss'),
    'open_issues': ['Japanese title/menu/save UI', '156 preserved untranslated physical continuations',
                    '00/357 unresolved reference (95 entries)', 'Previously deferred layout cases',
                    'Remainder of game and mGBA-specific natural replay not tested'],
    'next_route': 'Neighborhood map-edge checkpoint 192: continue the next event route using fresh normal-input segments.',
    'distribution_zip_updated': False,
}
out = root/'analysis/exe2_rev1_natural_play_qa.json'
out.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
print(json.dumps({'status': report['status'], 'segments': len(segments),
                  'screenshots': screen_count, 'report': str(out)}))
