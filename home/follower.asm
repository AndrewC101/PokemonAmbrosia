; A small independent ROM0 section uses the pre-header gap, not scarce Home tail.
SECTION "Follower VBlank hook", ROM0
FollowerVBlank::
    ; Do not use farcall scratch in an interrupt that may interrupt a farcall.
    ld a, BANK(ServeFollowerGraphics)
    rst Bankswitch
    call ServeFollowerGraphics
    ldh a, [hROMBankBackup]
    rst Bankswitch
    ret

CancelFollowerUpload::
; Reentrant, unbanked DMA setup guard; preserve bc/de/hl and the resident pair.
    xor a
    ld [wFollowerPending], a
    ret
