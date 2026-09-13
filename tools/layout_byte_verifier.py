"""Independently encode planned changed literal slots and locate them in ROM entries."""
import re


def table_mapping(text):
    mapping = {}
    for line in text.splitlines():
        if '=' not in line:
            continue
        code, value = line.split('=', 1)
        if re.fullmatch(r'(?:[0-9A-Fa-f]{2})+', code):
            value = value.replace(r'\n', '\n')
            mapping[value] = bytes.fromhex(code)
    return mapping


def verify_changed_literals(raw_entry, layout, mapping):
    cursor = 0
    count = 0
    keys = sorted(mapping, key=len, reverse=True)
    for page in layout['pages']:
        if page['status'] != 'changed':
            continue
        for value in page['text_after']:
            output = bytearray()
            pos = 0
            while pos < len(value):
                token = next((key for key in keys if value.startswith(key, pos)), None)
                if token is None:
                    raise ValueError(f"{layout['entry_id']}: unmapped layout character {value[pos]!r}")
                output.extend(mapping[token])
                pos += len(token)
            match = raw_entry.find(output, cursor)
            if match < 0:
                raise ValueError(f"{layout['entry_id']}: compiled ROM lacks planned literal including whitespace: {value!r}")
            cursor = match + len(output)
            count += 1
    return count
