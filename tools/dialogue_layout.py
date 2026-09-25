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


def fits(metrics):
    return metrics['rows'] <= ROWS and max(metrics['columns']) <= WIDTH


def overflow_candidates(values, source_values):
    """Literals wider than the window, with whether the source was too.

    A translated literal that overruns a window the original stayed inside is
    a regression this pipeline introduced. One the original also overran means
    the window model is wrong here, not the text.
    """
    out = []
    for i, text in enumerate(values):
        if max(measure([text])['columns']) <= WIDTH:
            continue
        out.append({'literal': i, 'columns': max(measure([text])['columns']),
                    'source_columns': max(measure([source_values[i]])['columns'])})
    return out


def capacity_violations(records):
    """Pages and literals this pipeline made too big for the window it draws in.

    Only counts a case where the source stayed inside the window: the original
    never exceeds it, so anything that does is ours. A violation is not a
    cosmetic overflow - the renderer keeps writing past the window's reserved
    tiles, and the screen that follows hangs on real hardware.
    """
    out = []
    for record in records:
        for page in record.get('pages', []):
            if 'before' not in page:
                continue
            shipped = page['before'] if page['status'] == 'deferred_page_capacity' else page['after']
            if fits(shipped) or not fits(page['source']):
                continue
            out.append({'entry_id': record['entry_id'], 'slots': page['slots'],
                        'source': page['source'], 'shipped': shipped,
                        'window': record.get('window', 'standard'),
                        'blocked_by': page.get('blocked_by', 'capacity')})
        for page in record.get('audit_pages', []) or []:
            # Rows matter as much as columns: a fourth line is drawn past the
            # window just as a twenty-second cell is.
            if fits(page['shipped']) or not fits(page['source']):
                continue
            out.append({'entry_id': record['entry_id'], 'slots': page['slots'],
                        'source': page['source'], 'shipped': page['shipped'],
                        'window': record.get('window', 'standard'),
                        'blocked_by': record['status']})
        for candidate in record.get('literal_overflow_candidates', []) or []:
            if candidate['source_columns'] > WIDTH:
                continue
            out.append({'entry_id': record['entry_id'], 'literal': candidate['literal'],
                        'source': {'rows': 1, 'columns': [candidate['source_columns']]},
                        'shipped': {'rows': 1, 'columns': [candidate['columns']]},
                        'window': record.get('window', 'standard'),
                        'blocked_by': record['status']})
    return out


NONSTANDARD_WINDOW_RE = r'\b(?:option|select|position\w*|msgOpen\w+)\b'
DYNAMIC_FIELD_RE = r'\b(?:print\w*|space)\b'


def rebuild(transformed, quotes, values, output):
    pieces, cursor = [], 0
    for i, q in enumerate(quotes):
        pieces.extend([transformed[cursor:q.start()],
                       quote(output[i]) if output[i] != values[i] else q.group(0)])
        cursor = q.end()
    pieces.append(transformed[cursor:])
    result = ''.join(pieces)
    assert QUOTE_RE.sub('<TEXT>', result) == QUOTE_RE.sub('<TEXT>', transformed)
    return result


def repair_deferred(transformed, quotes, values, source_values, record, allowed):
    """Measure every page here, and rewrap only the ones the source proves fit.

    This module declines to restyle these entries, but declining is not a
    reason to ship a page that overruns the window - that hangs the game. The
    source is the authority: where it stays inside the box and we do not, line
    breaks are what we lost, and whitespace alone puts them back. Where the
    source also overruns, the window model does not apply here and nothing is
    touched. Choices and cursor-positioned windows are never rewrapped.
    """
    pages = measure_groups(transformed, quotes, values, source_values)
    output = values.copy()
    repaired = 0
    for page in pages:
        if not allowed or fits(page['shipped']) or not fits(page['source']):
            continue
        group = page['slots']
        before = [values[i] for i in group]
        proposed = reflow(before)
        metrics = measure(proposed)
        broke = any(not fresh or (not fresh.strip() and prior.strip())
                    for prior, fresh in zip(before, proposed))
        if not fits(metrics) or broke:
            continue
        for i, prior, fresh in zip(group, before, proposed):
            assert re.sub(r'\s', '', prior) == re.sub(r'\s', '', fresh)
            output[i] = fresh
        page.update(repaired=True, text_before=before, text_after=proposed)
        page['shipped'] = metrics
        repaired += 1
    record['audit_pages'] = pages
    if not repaired:
        return transformed, record
    record['status'] += '_repaired'
    return rebuild(transformed, quotes, values, output), record


def measure_groups(transformed, quotes, values, source_values):
    """Page metrics for a branch this module will not rewrite.

    Deferring the rewrite is a decision about safety, not a reason to stop
    looking: the window is still the window, and a page that overruns it hangs
    the game. Group the same way the rewriting path does and record both the
    source's metrics and ours, so a gate can tell a regression from a window
    model that does not apply here.
    """
    groups = [[0]]
    for i in range(1, len(quotes)):
        between = transformed[quotes[i-1].end():quotes[i].start()]
        if set(COMMAND_RE.findall(between)) & BOUNDARY:
            groups.append([i])
        else:
            groups[-1].append(i)
    return [{'slots': group,
             'source': measure([source_values[i] for i in group]),
             'shipped': measure([values[i] for i in group])}
            for group in groups]


def layout_script(source, transformed, stable_id):
    sq = list(QUOTE_RE.finditer(source))
    tq = list(QUOTE_RE.finditer(transformed))
    assert len(sq) == len(tq)
    values = [literal(q) for q in tq]
    source_values = [literal(q) for q in sq]
    record = {'entry_id': stable_id, 'status': 'unchanged', 'window': 'standard', 'pages': []}
    if not tq:
        return transformed, record
    prefix = transformed[:tq[0].start()]
    all_commands = set(COMMAND_RE.findall(QUOTE_RE.sub('', transformed)))
    body = QUOTE_RE.sub('', transformed)
    # A window this module cannot model: choices, cursor positioning and the
    # numbered msgOpen variants draw somewhere other than the standard box.
    # A dynamic print is different - the box is standard and only its final
    # width is unknown, which makes our measure an under-estimate, not a
    # reason to leave an overrun in place.
    nonstandard = ('msgOpen' not in COMMAND_RE.findall(prefix)
                   or bool(re.search(NONSTANDARD_WINDOW_RE, body)))
    if nonstandard or re.search(DYNAMIC_FIELD_RE, body):
        record.update(status='deferred_special_renderer_or_dynamic',
                      window='nonstandard' if nonstandard else 'standard',
                      literal_overflow_candidates=overflow_candidates(values, source_values))
        return repair_deferred(transformed, tq, values, source_values, record,
                               allowed=not nonstandard)
    # Branch checks before msgOpen are harmless to layout. Once printing begins,
    # reject unknown execution/state effects instead of assuming a zero width.
    tail_commands = set(COMMAND_RE.findall(QUOTE_RE.sub('', transformed[tq[0].end():])))
    if tail_commands - ALLOWED:
        # This window is the standard one - only the controls after it are
        # unknown - so an over-wide literal here is still a real overflow.
        # Measuring it keeps the branch from being a blind spot.
        record.update(status='deferred_controls', controls=sorted(tail_commands - ALLOWED),
                      literal_overflow_candidates=overflow_candidates(values, source_values))
        return repair_deferred(transformed, tq, values, source_values, record, allowed=True)
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
        # The source's own metrics say whether an overrun is ours or whether
        # this page model is wrong. Without them a gate cannot tell the two
        # apart, and would either miss regressions or block on originals.
        page = {'slots': group, 'source': measure([source_values[i] for i in group]),
                'before': measure(before), 'after': metrics}
        # A slot that was already blank must not condemn the whole page: many
        # pages carry spacer literals, and rejecting them meant the reflow was
        # discarded and the over-wide original shipped instead. Reject only a
        # slot that lost its text, or one left empty, which cannot be quoted.
        broke = any(not new or (not new.strip() and old.strip())
                    for old, new in zip(before, proposed))
        if metrics['rows'] > ROWS or max(metrics['columns']) > WIDTH or broke:
            page.update(status='deferred_page_capacity', text_before=before,
                        blocked_by='slot_emptied' if broke else 'capacity')
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
