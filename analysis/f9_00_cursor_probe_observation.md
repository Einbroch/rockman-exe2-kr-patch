# F9 selector 0x00 crash observation

The F9 selector `0x00` cursor probe did not reach a stable dialogue result:
the emulator stopped on an invalid-address jump while entering the dialogue.

This demonstrates that the constructed F9 frame is unsafe and that its
adjacent bytes participate in behavior beyond a safely replaceable text
transport. `F9:00` is consequently `preserve_runtime_crash_observed`.

This is not a complete F9 specification and does not establish a general
width. It is a negative runtime result: preserve the original opcode,
parameters, and order; do not create or modify F9 frames.

Machine-readable metadata: `f9_00_cursor_probe_observation.json`.
