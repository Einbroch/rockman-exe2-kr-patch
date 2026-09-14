"""Reviewed classroom choices; preserve prose, slot ownership and branch commands.

Do not enable option-boundary heuristics globally: unreviewed draft/source slot
relationships differ. This registry is checked against each complete literal.
"""
import re
from dialogue_layout import QUOTE_RE, literal

REVIEWED_IDS = {f'archive_00_404_entry_{i:04d}' for i in (6, 7, 8, 10)}
EXPECTED_CHOICES = {
    6: ('어때? 내 컬렉션 이야기를\n듣고 싶지?\n', '예 ', '아니요'),
    7: ('그러지 말고 들으라니까!\n', '예 ', '아니요'),
    8: ('상류층이 아닌\n네가 이해할 수 있으려나?\n', '이해해 ', '모르겠어'),
    10: ('나는 다 외웠으니\n내가 가르쳐 줄까?\n', '가르쳐 줘 ', '됐어'),
}


def validate_choice_layout(source, transformed, stable_id):
    assert stable_id in REVIEWED_IDS
    assert QUOTE_RE.sub('<TEXT>', source) == QUOTE_RE.sub('<TEXT>', transformed)
    matches = list(QUOTE_RE.finditer(transformed))
    values = [literal(q) for q in matches]
    index = int(stable_id.rsplit('_', 1)[1])
    first = next(i for i in range(len(matches)-1)
                 if re.search(r'(?m)^\s*option\b', transformed[matches[i].end():matches[i+1].start()]))
    assert tuple(values[first:first+3]) == EXPECTED_CHOICES[index], (stable_id, values)
    question, yes, no = EXPECTED_CHOICES[index]
    # The original two option commands each reserve two cursor cells.
    columns = [len(x) for x in question.split('\n')[:-1]] + [2+len(yes)+2+len(no)]
    assert len(columns) <= 3 and max(columns) <= 21, (stable_id, columns)
    for i, value in enumerate(values):
        if i in (first+1, first+2):
            continue
        lines = value.rstrip('\n').split('\n')
        assert len(lines) <= 3 and max(map(len, lines)) <= 21, (stable_id, i, lines)
    return {
        'entry_id': stable_id, 'status': 'reviewed_choice_layout',
        'question_slot': first, 'choice_columns': columns,
        'option_anchors': [[0, len(columns)-1], [2+len(yes), len(columns)-1]],
        'question': question, 'options': [yes.strip(), no],
        'control_skeleton_unchanged': True,
        # The independent compiled-byte gate must find every literal including
        # boundary E8 and the separator space, not merely the Hangul payload.
        'pages': [{'status': 'changed', 'text_after': values}],
    }
