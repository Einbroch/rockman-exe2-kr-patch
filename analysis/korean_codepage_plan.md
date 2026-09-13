# Provisional Korean code-page plan

The existing verified dispatcher has two usable two-byte forms: `E5` selects
records 229--484 and `E6` selects records 485--740. Runtime probes at records
512 and 740 confirmed that converted dialogue-format glyphs render through
the full range. This gives an **overlay page of 512 Hangul slots** while
leaving direct indices 0--228 unchanged for untranslated Japanese text.

After every relevant text path has been translated and direct indices are
proven unused by remaining UI and graphics consumers, a planned full-bank
mapping could use direct indices too, for **741 slots**. That mode is not yet
an authorized GBA patch strategy; the compiler labels it separately and never
writes a ROM.

`tools/compile_e5e6_korean_codepage.py` accepts a UTF-8 translation corpus,
deduplicates precomposed Hangul syllables, assigns deterministic font indices,
requires `analysis/control_code_policy_registry.json`, and fails if the
declared capacity or verified E5/E6 transport policy is exceeded. This turns the final design
choice into a measured condition: more than 512 syllables blocks the overlay
approach; more than 741 syllables blocks the no-code-change full-bank approach.

The structural reference audit additionally supports a planning-only
`candidate_unobserved_overlay` mode. It skips records for which a raw `E5` or
`E6` pair was observed in the catalogued candidate scope, leaving 374 indices
in the current audit. This is not a safety proof: unobserved records can still
be used by undecoded message data, UI, or graphics consumers. The mode is
therefore intentionally rejected by the ROM-building PoC and may be used only
to measure repertoire pressure and prioritize the next occupancy checks.

The included `poc/korean_codepage_poc.txt` is an authored technical sample,
not game translation text. The PC reference archive supplies no Korean message
package, so it cannot currently serve as the final Korean repertoire source.
