"""Compile boundary whitespace fixtures with the exact installed TextPet binary."""
import hashlib
import json
import tempfile
from pathlib import Path
from build_semantic_translation_dev_rom import run_textpet, archive_offsets, TEXTPET_SHA256
from dialogue_layout import quote

root = Path(__file__).resolve().parents[1]
exe = root/'external/TextPet-v1.0.0/TextPet.exe'
plugins = root/'external/TextPet-plugins-6c6d705/TextPet-6c6d70561290b42d8261f6d76b03051d534c7032/TextPet/plugins'
assert hashlib.sha256(exe.read_bytes()).hexdigest() == TEXTPET_SHA256
runtime = Path(tempfile.mkdtemp(prefix='textpet-layout-', dir=root/'analysis'))
source = runtime/'input'
dest = runtime/'output'
source.mkdir()
dest.mkdir()
samples = ['あい', '\nあい', 'あ\nい', 'あい\n', '\nあ\nい']
tpl = '@archive 1\n@size 6\n' + '\n'.join('script '+str(i)+' mmbn2 {\n\t'+quote(s)+'\n\tend\n}' for i,s in enumerate(samples))
(source/'0000001.tpl').write_bytes(tpl.encode('utf-8-sig'))
run_textpet(exe, plugins, source, dest)
outputs = list(dest.glob('*.msg'))
assert len(outputs) == 1, outputs
raw = outputs[0].read_bytes()
offsets = archive_offsets(raw)
payloads = [raw[a:b] for a,b in zip(offsets,offsets[1:])]
base = payloads[0][:-1]
assert len(base) == 2 and payloads[0][-1] == 0xE7
expected = [base, b'\xe8'+base, base[:1]+b'\xe8'+base[1:], base+b'\xe8', b'\xe8'+base[:1]+b'\xe8'+base[1:]]
for payload, goal in zip(payloads, expected):
    assert payload == goal+b'\xe7', (payload.hex(), goal.hex())
report = {'status':'PASS', 'textpet_sha256':TEXTPET_SHA256, 'fixture_count':len(samples),
          'leading_interior_trailing_newlines_compiled_to_e8':True,
          'module_sha256':hashlib.sha256((root/'tools/dialogue_layout.py').read_bytes()).hexdigest(),
          'runtime_dir':str(runtime.relative_to(root))}
(root/'analysis/textpet_layout_serialization_qa.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report))
