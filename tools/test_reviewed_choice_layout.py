import json
from pathlib import Path
import unittest
from build_semantic_translation_dev_rom import SCRIPT_RE, transform_script
from reviewed_choice_layout import validate_choice_layout

ROOT = Path(__file__).resolve().parents[1]

class ChoiceTests(unittest.TestCase):
    def test_reviewed_classroom_choices_and_prior_overlap(self):
        tpl = (ROOT/'analysis/archive_00_404_textpet_full.tpl').read_text(encoding='utf-8-sig')
        entries = json.loads((ROOT/'translations/archive_batch_0077_100.json').read_text(encoding='utf-8'))['entries']
        for i in (6, 7, 8, 10):
            block = next(m.group(0) for m in SCRIPT_RE.finditer(tpl) if int(m.group(1)) == i)
            entry = next(e for e in entries if e['selector']=='00/404' and e['entry_index']==i)
            fixed, _ = transform_script(block, entry['draft_translation'], entry['entry_id'], preserve_option_layout=True)
            record = validate_choice_layout(block, fixed, entry['entry_id'])
            self.assertLessEqual(max(record['choice_columns']), 21)
            broken, _ = transform_script(block, entry['draft_translation'], entry['entry_id'])
            with self.assertRaises(AssertionError):
                validate_choice_layout(block, broken, entry['entry_id'])

if __name__=='__main__':
    unittest.main()
