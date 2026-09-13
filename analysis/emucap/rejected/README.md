# Rejected captures

`archive_entry_13_unverified_keymap_capture.*` is not QA evidence. The attempted
automated input used an unverified SDL key mapping and opened the PET menu, so
it cannot establish one-step dialogue progression. It is retained only to
prevent accidental reuse of the observation as a passing result.

`archive_entry_13_direct_page_{2,3,4}_pointer_rejected.*` are also not QA
evidence.  Moving only the renderer source pointer to a later replacement page
did not reproduce the hidden page-progress state: page 2 produced a black
frame and pages 3/4 retained the source state's old page.  The accepted
captures instead start from the valid page-1 intervention and send the
verified mGBA A-button mapping (`VK_X`) after each page has finished drawing.
