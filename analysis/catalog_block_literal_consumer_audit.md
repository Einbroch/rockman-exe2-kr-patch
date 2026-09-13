# Catalog block literal-consumer audit

The 242 structural script-like blocks in the Rev 1 catalog were validated
against the ROM and scanned for Thumb/ARM PC-relative literal loads of their
block-start addresses. This records direct relocation research leads only; it
does not decode text or export game assets.

194 blocks have at least one direct PC-relative literal-load reference, for
612 references in total. Of those blocks, 67 have one reference, 49 have two,
and the rest have three or more. The runtime-observed active block remains the
only one with state-backed reachability evidence.

These results make the active-block relocation method structurally relevant to
many catalogued blocks, but they do not authorize bulk relocation. Each block
still requires runtime reachability, exact consumer confirmation, command
preservation, and a separate occupancy decision before it becomes editable.
Machine-readable offsets and validation data are in
`catalog_block_literal_consumer_audit.json`.
