# Alternate E6 entry-start PoC observation

The entry-start alternate-E6-font-bank PoC did not render its declared marker
on the supplied frame. This falsifies the working assumption that the
state-resident `pc-jap-map-0067` fragment was the active source for that
dialogue screen.

- Screenshot SHA-256: `90d94e1fe7386eb3882a19ff5ffb4976f8aeb9f77d40d494ba3e46b0906d1ace`
- Saved state SHA-256: `1feb6be344a262605be7882f98ce1bad989ae1889011f859dc3253c13e021460`
- State analysis SHA-256: `bf3dfc7e29ace0f1800a2dba8e008cb97562e10c8cfca2d5112eb866465588e3`

The saved state contains neither the relocated block pointer nor an exact
copy of the relocated block. The automatic fragment still detects a 0067
entry fragment, but that evidence is insufficient to prove active renderer
consumption. Do not use this state fragment as a reinsertion authorization.

The next evidence path is an execution-time trace of the dialogue source
pointer load and renderer entry, rather than further static relocation tests.
