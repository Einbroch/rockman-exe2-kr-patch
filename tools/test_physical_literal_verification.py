import unittest
from layout_byte_verifier import verify_changed_literals


class PhysicalLiteralVerificationTests(unittest.TestCase):
    def layout(self, *values):
        return {'entry_id': 'physical-fixture', 'pages': [
            {'status': 'changed', 'text_after': list(values)}]}

    def test_unmapped_punctuation_rejected_even_if_textpet_drops_it(self):
        with self.assertRaisesRegex(ValueError, 'unmapped'):
            verify_changed_literals(b'\x01\x00\x02', self.layout('가, 나'),
                                    {'가': b'\x01', '나': b'\x02', ' ': b'\x00'})

    def test_whitespace_loss_rejected(self):
        with self.assertRaisesRegex(ValueError, 'lacks planned literal'):
            verify_changed_literals(b'\x01\x02', self.layout('가 나'),
                                    {'가': b'\x01', '나': b'\x02', ' ': b'\x00'})

    def test_literals_must_survive_in_order(self):
        mapping = {'가': b'\x01', '나': b'\x02'}
        self.assertEqual(verify_changed_literals(b'\x01\xeb\x02',
                         self.layout('가', '나'), mapping), 2)
        with self.assertRaises(ValueError):
            verify_changed_literals(b'\x02\xeb\x01', self.layout('가', '나'), mapping)


if __name__ == '__main__':
    unittest.main()
