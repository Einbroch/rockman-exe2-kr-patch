# Runtime memory context for the observed message entry (Rev 1)

The decompressed `gbAs` payload in the supplied `ss1` is `0x61000` bytes and
uses mGBA's fixed GBA raw-state memory layout.  Its payload offsets can
therefore be mapped to emulated memory without copying RAM or script bytes.

| State payload offset | EWRAM address | Observed 32-bit value |
| --- | --- | --- |
| `0x29758` | `0x02008758` | message block start `0x0877A298` |
| `0x2975C` | `0x0200875C` | current entry start `0x0877A2AE` |
| `0x29760` | `0x02008760` | `0x0200A1B0` |

This confirms that the runtime-observed block and subentry pointers reside in
EWRAM, not merely in mGBA metadata.  It does not give field names, allocation
boundaries, or a proof that a particular routine consumes them.

## Pointer-root scan

Searching all aligned EWRAM words for values within `0x02008700-0x020087FF`
found two pointers:

| Holder address | Points to |
| --- | --- |
| `0x02000DE8` | `0x020087D0` |
| `0x02006380` | `0x020087F4` |

`0x020087D0` has direct ROM literal references, but it is only near the
message-entry fields.  The present evidence does **not** establish that these
two targets own the entry at `0x0200875C`; they remain dynamic-structure
candidates.

## Saved CPU position

The serialized CPU snapshot is in ARM state with stored `r15 = 0x03006028`.
The 32-byte IWRAM window beginning there exactly matches a ROM window at
`0x0E6874`.  This establishes a copied-code provenance candidate but not a
message-reader identity or instruction boundary.  It must not be used to infer
control-code semantics.

## Dynamic-debugger result

The supplied mGBA 0.10.5 Qt frontend forwarded a second launch to its existing
instance, so it did not create an independent GDB listener.  The SDL frontend
stayed alive while standard input was held open but did not expose TCP port
2345, and emitted no CLI output for `help`.  The `.sav` SHA-256 was unchanged
after every probe.  No source ROM, save, or state file was modified.

The next runtime experiment should use the already open Qt mGBA debugger's
memory view or a watchpoint at `0x0200875C`; break on reads, then record the
program counter and Thumb/ARM state before resuming.  This is the missing
evidence needed to identify the byte consumer.

The state layout is cross-checked against mGBA's 0.10.5
[GBA serialization definition](https://github.com/mgba-emu/mgba/blob/0.10.5/include/mgba/internal/gba/serialize.h).
