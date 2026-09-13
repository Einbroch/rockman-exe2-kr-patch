"""Conservative, whitespace-only layout for EXE2's standard dialogue window.

One glyph advances one 8px BG tile (Rev1 08020DC8..08020DF6).
Use 21 cells from x=64 to x=232, and three 16px rows. Nonstandard
windows, choices, dynamic prints and unresolved controls are audit-only.
"""
import re

QUOTE_RE = re.compile(r'(?s)"""(.*?)"""|"([^"\r\n]*)"')
COMMAND_RE = re.compile(r'(?m)^\t([A-Za-z][A-Za-z0-9]*)\b')
WIDTH = 21
ROWS = 3
INLINE = {'wait', 'waitSkip', 'textSpeed', 'mugshotShow'}
BOUNDARY = {'clearMsg', 'msgOpen'}
ALLOWED = INLINE | BOUNDARY | {'keyWait', 'end', 'jump'}


def literal(match):
    if match.group(1) is None:
        return (match.group(2) or '').replace(r'\n', '\n')
    return '\n'.join(line.lstrip('\t') for line in match.group(1).splitlines()[1:-1])


def quote(text):
    if not text:
        raise ValueError('Layout must not produce an empty TextPet literal')
    if '\n' not in text and '"' not in text:
        return '"' + text + '"'
    # TextPet's heredoc-start regex uses [^\S\r]*, which greedily consumes
    # leading blank LF lines. CRLF stops that match, preserving leading E8.
    return '"""\r\n' + '\r\n'.join('\t' + line for line in text.split('\n')) + '\r\n\t"""'


def measure(parts):
    lines = ''.join(parts).split('\n')
    return {'columns': [len(line) for line in lines], 'rows': len(lines)}


def reflow(parts):
    """Preserve each non-whitespace character and its inline-control ownership."""
    chars = [(c, i) for i, text in enumerate(parts) for c in text]
    # Existing newlines are preferred; wrap at an existing space if needed.
    def wrap(flat, preserve_lines):
        tokens = []
        for c, owner in flat:
            c = '\n' if c == '\n' and preserve_lines else (' ' if c.isspace() else c)
            tokens.append([c, owner])
        col = 0
        line_start = 0
        pos = 0
        while pos < len(tokens):
            c = tokens[pos][0]
            if c == '\n':
                col = 0
                line_start = pos + 1
            elif col == WIDTH:
                # Prefer a word boundary; do not remove words or punctuation.
                split = next((j for j in range(pos, line_start-1, -1)
                              if tokens[j][0] == ' '), None)
                if split is not None:
                    tokens[split][0] = '\n'
                    pos = split
                else:
                    tokens.insert(pos, ['\n', tokens[pos][1]])
                col = 0
                line_start = pos + 1
            else:
                col += 1
            pos += 1
        out = [''] * len(parts)
        for c, owner in tokens:
            out[owner] += c
        return out
    result = wrap(chars, True)
    if measure(result)['rows'] > ROWS:
        result = wrap(chars, False)
    return result


def layout_script(source, transformed, stable_id):
    sq = list(QUOTE_RE.finditer(source))
    tq = list(QUOTE_RE.finditer(transformed))
    assert len(sq) == len(tq)
    values = [literal(q) for q in tq]
    source_values = [literal(q) for q in sq]
    record = {'entry_id': stable_id, 'status': 'unchanged', 'pages': []}
    if not tq:
        return transformed, record
    prefix = transformed[:tq[0].start()]
    all_commands = set(COMMAND_RE.findall(QUOTE_RE.sub('', transformed)))
    if 'msgOpen' not in COMMAND_RE.findall(prefix) or re.search(r'\b(?:option|select|print\w*|space|position\w*|msgOpen\w+)\b', QUOTE_RE.sub('', transformed)):
        record.update(status='deferred_special_renderer_or_dynamic',
                      literal_overflow_candidates=[i for i, text in enumerate(values) if max(measure([text])['columns']) > WIDTH])
        return transformed, record
    # Branch checks before msgOpen are harmless to layout. Once printing begins,
    # reject unknown execution/state effects instead of assuming a zero width.
    tail_commands = set(COMMAND_RE.findall(QUOTE_RE.sub('', transformed[tq[0].end():])))
    if tail_commands - ALLOWED:
        record.update(status='deferred_controls', controls=sorted(tail_commands - ALLOWED))
        return transformed, record
    groups = [[0]]
    for i in range(1, len(tq)):
        between = transformed[tq[i-1].end():tq[i].start()]
        commands = set(COMMAND_RE.findall(between))
        if commands & BOUNDARY:
            groups.append([i])
        elif commands - INLINE:
            record.update(status='deferred_page_state', controls=sorted(commands))
            return transformed, record
        else:
            groups[-1].append(i)
    output = values.copy()
    for group in groups:
        before = [values[i] for i in group]
        proposed = before.copy()
        for j, i in enumerate(group):
            if j and source_values[i].startswith('\n') and not proposed[j].startswith('\n'):
                proposed[j] = '\n' + proposed[j]
            if j < len(group)-1 and source_values[i].endswith('\n') and not proposed[j].endswith('\n'):
                proposed[j] += '\n'
        if max(measure(proposed)['columns']) > WIDTH or measure(proposed)['rows'] > ROWS:
            proposed = reflow(proposed)
        metrics = measure(proposed)
        page = {'slots': group, 'before': measure(before), 'after': metrics}
        if metrics['rows'] > ROWS or max(metrics['columns']) > WIDTH or any(not x or not x.strip() for x in proposed):
            page.update(status='deferred_page_capacity', text_before=before)
        else:
            for i, old, new in zip(group, before, proposed):
                assert re.sub(r'\s', '', old) == re.sub(r'\s', '', new)
                output[i] = new
            page['status'] = 'changed' if proposed != before else 'unchanged'
            if proposed != before:
                page.update(text_before=before, text_after=proposed)
        record['pages'].append(page)
    pieces = []
    cursor = 0
    for i, q in enumerate(tq):
        pieces.extend([transformed[cursor:q.start()], quote(output[i]) if output[i] != values[i] else q.group(0)])
        cursor = q.end()
    pieces.append(transformed[cursor:])
    result = ''.join(pieces)
    assert QUOTE_RE.sub('<TEXT>', result) == QUOTE_RE.sub('<TEXT>', transformed)
    if result != transformed:
        record['status'] = 'changed'
    if any(p['status'].startswith('deferred') for p in record['pages']):
        record['status'] += '_with_deferred_pages'
    return result, record
