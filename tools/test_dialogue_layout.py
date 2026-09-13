import re
import unittest
from dialogue_layout import QUOTE_RE, literal, layout_script, reflow, measure
from layout_byte_verifier import verify_changed_literals


class LayoutTests(unittest.TestCase):
    def test_compiled_whitespace_gate_rejects_missing_newline(self):
        layout = {'entry_id':'test','pages':[{'status':'changed','text_after':['\n가']} ]}
        mapping = {'\n':b'\xe8', '가':b'\xf9\xfc\x00\x00'}
        self.assertEqual(verify_changed_literals(b'\xea\x01\x0f\x00\xe8\xf9\xfc\x00\x00\xeb\xe7', layout, mapping), 1)
        with self.assertRaises(ValueError):
            verify_changed_literals(b'\xea\x01\x0f\x00\xf9\xfc\x00\x00\xeb\xe7', layout, mapping)

    def block(self, body):
        return 'script 0 mmbn2 {\n\tmugshotShow\n\t\tmugshot = MegaMan\n\tmsgOpen\n'+body+'\n\tkeyWait\n\tend\n}'

    def test_wait_newline_restore(self):
        source = self.block('\t"질문"\n\twaitSkip\n\t\tframes = 15\n\t"\\n후속"')
        old = source.replace('"\\n후속"', '"후속"')
        new, record = layout_script(source, old, 'test')
        self.assertEqual(record['status'], 'changed')
        self.assertEqual([literal(q) for q in QUOTE_RE.finditer(new)], ['질문', '\n후속'])
        self.assertEqual(QUOTE_RE.sub('', new), QUOTE_RE.sub('', old))

    def test_wrap_preserves_characters_and_slots(self):
        values = ['가나다라마바사아자차카타파하 가나다라마 ', '바사아자차카타파하']
        wrapped = reflow(values)
        for old, new in zip(values, wrapped):
            self.assertEqual(re.sub(r'\s', '', old), re.sub(r'\s', '', new))
        self.assertLessEqual(max(measure(wrapped)['columns']), 21)
        self.assertLessEqual(measure(wrapped)['rows'], 3)

    def test_exact_width_and_long_word(self):
        self.assertEqual(reflow(['가'*21]), ['가'*21])
        self.assertEqual(reflow(['가'*22]), ['가'*21+'\n가'])

    def test_capacity_is_deferred_not_truncated(self):
        old = self.block('\t"'+'가'*64+'"')
        new, record = layout_script(old, old, 'test')
        self.assertEqual(old, new)
        self.assertIn('deferred', record['status'])

    def test_choice_dynamic_and_custom_window_untouched(self):
        for control in ['option', 'printBuffer', 'msgOpenQuick', 'positionText']:
            old = self.block('\t'+control+'\n\t"'+'가'*40+'"')
            new, record = layout_script(old, old, 'test')
            self.assertEqual(old, new)
            self.assertTrue(record['status'].startswith('deferred'))

    def test_clear_restarts_page(self):
        old = self.block('\t"'+'가'*40+'"\n\tkeyWait\n\tclearMsg\n\t"'+'나'*40+'"')
        new, record = layout_script(old, old, 'test')
        self.assertEqual(len(record['pages']), 2)
        self.assertEqual(record['status'], 'changed')
        self.assertEqual(QUOTE_RE.sub('', old), QUOTE_RE.sub('', new))


if __name__ == '__main__':
    unittest.main()
