; Deliberately outside saved data and existing arrays; Phase 0 link-tested.
SECTION "Follower state", WRAM0[$cfd8]
wFollowerState::
wFollowerFlags:: db
wFollowerSpecies:: db
wFollowerCachedPair:: db
wFollowerPendingPair:: db
wFollowerPending:: db
wFollowerWantedFacing:: db
wFollowerOAMStart:: db
wFollowerTestIndex:: db
wFollowerTestPaletteMode:: db
wFollowerShownFacing:: db
wFollowerUploadCount:: db
wFollowerRenderX:: db
wFollowerRenderY:: db
wFollowerRenderTile:: db
wFollowerRenderFlags:: db
wFollowerBaseFlags:: db
wFollowerDVs:: ds 2
wFollowerCustomPair:: db
wFollowerMiddleColors:: ds 4
wFollowerDeferredCount:: db
wFollowerStateEnd::
assert wFollowerStateEnd - wFollowerState == 24

; Previously unused WRAM0 tail. Keep this separate from all saved structures.
SECTION "Follower lifecycle", WRAM0[$cff0]
wFollowerLifecycle::
wFollowerObjectID:: db
wFollowerPartyIndex:: db
wFollowerMapGroup:: db
wFollowerMapNumber:: db
wFollowerLifecycleFlags:: db
wFollowerRetry:: db
wFollowerCandidateSpecies:: db
wFollowerCandidateIndex:: db
wFollowerCandidateDVs:: ds 2
wFollowerCandidatePair:: db
wFollowerSpawnX:: db
wFollowerSpawnY:: db
wFollowerMenuContext:: db ; normal Start -> Pokémon list only; never saved
wFollowerScriptFlags:: db ; explicit hide / automatic scene hold; never saved
wFollowerLifecycleEnd::
assert wFollowerLifecycleEnd <= $d000

SECTION "Follower prepared frames", WRAMX[$d200], BANK[2], ALIGN[4]
wFollowerFrames:: ds FOLLOWER_GFX_SIZE
wFollowerFramesEnd::
assert wFollowerFramesEnd - wFollowerFrames == 384

; Build the next four-piece image in the main thread, not in VBlank.
wFollowerNextOAM:: ds 4 * OBJ_SIZE
wFollowerGraphicsEnd::
