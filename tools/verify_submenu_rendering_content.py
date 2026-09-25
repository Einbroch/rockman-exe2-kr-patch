"""Independent static checks on the emitted submenu description and UI tables."""
import argparse
import hashlib
import json
import re
import struct
from pathlib import Path
from static_submenu_tables import (_read_table, FORWARD, DESC_RELOC, UI_TABLE, UI_RELOC,
                                   NAME_TABLE, NAME_RELOC, SECOND_NAME_TABLE, SECOND_NAME_RELOC)


def decode_names(candidate, base):
    """Chip names of a relocated table, read back from the candidate's bytes."""
    names = []
    for entry in _read_table(candidate, base)[1]:
        body, pos, text = entry[:-1], 0, ''
        assert entry[-1:] == b'\xe7'
        while pos < len(body):
            if body[pos:pos+2] == b'\xf9\xfc':
                ordinal = struct.unpack_from('<H', body, pos+2)[0]
                assert ordinal < 2350
                text += bytes((0xB0+ordinal//94, 0xA1+ordinal%94)).decode('euc_kr')
                pos += 4
            else:
                matches = [key for key in FORWARD if body.startswith(key, pos)]
                assert matches, (base, len(names), pos)
                key = max(matches, key=len)
                text += FORWARD[key]
                pos += len(key)
        names.append(text)
    return names


def verify_chip_names(source, candidate):
    """Both chip name tables moved, every reader repointed, no Japanese left."""
    report = {}
    for label, old, new in (('chip_names', NAME_TABLE, NAME_RELOC), ('chip_names_2', SECOND_NAME_TABLE, SECOND_NAME_RELOC)):
        old_ptr, new_ptr = struct.pack('<I', 0x08000000+old), struct.pack('<I', 0x08000000+new)
        readers = [i for i in range(0, 0x800000, 4) if source[i:i+4] == old_ptr]
        assert readers and all(candidate[i:i+4] == new_ptr for i in readers), label
        assert not any(candidate[i:i+4] == old_ptr for i in range(0, len(candidate)-3, 4)), label
        names = decode_names(candidate, new)
        assert len(names) == len(_read_table(source, old)[1]), label
        bad = [(i, n) for i, n in enumerate(names) if re.search('[\u3040-\u30ff\u3400-\u9fff]', n)]
        assert not bad, (label, bad[:5])
        report[label] = {'entries': len(names), 'named': sum(1 for n in names if n),
                         'readers': len(readers), 'japanese_names': 0}
    return report


def verify(source, candidate):
    descriptions = _read_table(candidate, DESC_RELOC)[1]
    assert len(descriptions) == 255
    decoded = []
    for i, entry in enumerate(descriptions):
        assert entry[:5] == bytes.fromhex('EC 00 00 F1 02'), (i,'prefix')
        assert entry[-4:] == bytes.fromhex('EB F1 03 E7'), (i,'suffix')
        body = entry[5:-4]
        pos, text = 0, ''
        while pos < len(body):
            if body[pos:pos+2] == b'\xf9\xfc':
                ordinal = struct.unpack_from('<H', body, pos+2)[0]
                assert ordinal < 2350
                text += bytes((0xB0+ordinal//94,0xA1+ordinal%94)).decode('euc_kr')
                pos += 4
            else:
                matches = [key for key in FORWARD if body.startswith(key,pos)]
                assert matches, (i,pos)
                key = max(matches,key=len)
                text += FORWARD[key]
                pos += len(key)
        assert not re.search('[\u3040-\u30ff\u3400-\u9fff]',text), (i,text)
        assert len(text.splitlines()) <= 3 and max(map(len,text.splitlines())) <= 10, (i,text)
        decoded.append({'index':i,'text':text})
    before = _read_table(source,UI_TABLE)[1]
    after = _read_table(candidate,UI_RELOC)[1]
    fields = re.compile(b'\xe9[\x00\x01].',re.DOTALL)
    for i in (2,3,8,31,32,68,69,70,71,72,80,105,106):
        assert fields.findall(before[i]) == fields.findall(after[i]), i
    assert before[68] == after[68], 'Time display format changed'
    expected_label=bytearray()
    for char in '데이터라이브러리':
        a,b=char.encode('euc_kr')
        expected_label.extend(b'\xf9\xfc'+struct.pack('<H',(a-0xB0)*94+b-0xA1))
    assert after[65] == bytes(expected_label)+b'\xE7', 'Save label must fit eight complete Hangul syllables'
    chip_names = verify_chip_names(source, candidate)
    return {'status':'PASS (bench)', 'description_count':len(decoded), 'chip_names':chip_names,
            'japanese_description_bodies':0, 'overflowing_descriptions':0,
            'panel_columns':10, 'panel_rows':3, 'numeric_control_parameters_preserved':True,
            'save_label':'데이터라이브러리','save_label_cells':8,
            'source_sha256':hashlib.sha256(source).hexdigest(),
            'candidate_sha256':hashlib.sha256(candidate).hexdigest(), 'descriptions':decoded}


if __name__ == '__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--source',type=Path,required=True)
    p.add_argument('--candidate',type=Path,required=True)
    p.add_argument('--report',type=Path,required=True)
    a=p.parse_args()
    result=verify(a.source.read_bytes(),a.candidate.read_bytes())
    a.report.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({k:v for k,v in result.items() if k!='descriptions'}))
