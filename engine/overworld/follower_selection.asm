; Persistent player choice. No party structs or existing saved symbols grow.
; Helpers clobber a/bc/de/hl unless explicitly preserved by their caller.

InitializeFollowerSelection::
    xor a
    ld [wFollowerSelection], a
    ld [wFollowerSelectionSuspended], a
    ld a, FOLLOWER_SELECTION_MAGIC_1
    ld [wFollowerSelectionMagic], a
    ld a, FOLLOWER_SELECTION_MAGIC_2
    ld [wFollowerSelectionMagic + 1], a
    jp SealFollowerSelection

SelectElmStarterFollower::
    ld a, [wNewGamePlus]
    and a
    ret nz
    ld a, [wPartyCount]
    cp 1
    ret nz
    call GetFollowerSelection
    ld a, 1
    ld [wFollowerSelection], a
    jp SealFollowerSelection

GetFollowerSelection::
; a = 0..6. Legacy/invalid records become none. Do not validate against the
; current count here: the Bug Contest deliberately masks all but party slot 1.
    ld a, [wFollowerSelectionMagic]
    cp FOLLOWER_SELECTION_MAGIC_1
    jr nz, .invalid
    ld a, [wFollowerSelectionMagic + 1]
    cp FOLLOWER_SELECTION_MAGIC_2
    jr nz, .invalid
    ld a, [wFollowerSelection]
    cp PARTY_LENGTH + 1
    jr nc, .invalid
    ld hl, wFollowerSelectionInverse
    xor [hl]
    cp $ff
    jr nz, .invalid
    ld a, [wFollowerSelectionSuspended]
    and ~((1 << FOLLOWER_SUSPEND_CONTEST_F) | (1 << FOLLOWER_SUSPEND_TEAM_F))
    jr nz, .invalid
    ld a, [wFollowerSelectionSuspended]
    ld hl, wFollowerSelectionSuspendedInverse
    xor [hl]
    cp $ff
    jr nz, .invalid
    ld a, [wFollowerSelection]
    ret
.invalid
    call InitializeFollowerSelection
    xor a
    ret

SealFollowerSelection:
    ld a, [wFollowerSelection]
    cpl
    ld [wFollowerSelectionInverse], a
    ld a, [wFollowerSelectionSuspended]
    cpl
    ld [wFollowerSelectionSuspendedInverse], a
    ret

TogglePartyFollowerSelection::
; Current highlighted party member, zero-based. Fainted non-eggs are allowed.
; Carry = rejected. Never change current-party/UI globals or the menu cursor.
    call GetFollowerSelection
    ld a, [wFollowerSelectionSuspended]
    and a
    jr nz, .reject
    ld a, [wCurPartyMon]
    cp PARTY_LENGTH
    jr nc, .reject
    ld c, a
    ld a, [wPartyCount]
    cp PARTY_LENGTH + 1
    jr nc, .reject
    cp c
    jr z, .reject
    jr c, .reject
    ld b, 0
    ld hl, wPartySpecies
    add hl, bc
    ld a, [hl]
    and a
    jr z, .reject
    cp NUM_POKEMON + 1 ; also rejects EGG
    jr nc, .reject
    inc c
    ld a, [wFollowerSelection]
    cp c
    ld a, c
    jr nz, .store
    xor a
.store
    ld [wFollowerSelection], a
    call SealFollowerSelection
    and a
    ret
.reject
    scf
    ret

SwapFollowerSelection::
; c/e = 1-based party slots. Preserve all caller registers.
    push af
    push bc
    push de
    push hl
    push bc
    push de
    call GetFollowerSelection
    pop de
    pop bc
    and a
    jr z, .done
    cp c
    jr z, .to_e
    cp e
    jr nz, .done
    ld a, c
    jr .store
.to_e
    ld a, e
.store
    ld [wFollowerSelection], a
    call SealFollowerSelection
.done
    pop hl
    pop de
    pop bc
    pop af
    ret

RemoveFollowerSelection::
; a = committed removal/replacement, 0-based; removal shifts later indexes.
    ld c, a
    call GetFollowerSelectionPreservingBC
    and a
    ret z
    dec a
    cp c
    ret c
    jr z, ClearFollowerSelection
    ; Stored index is one-based: decremented zero-based value is the new index.
    ld [wFollowerSelection], a
    jp SealFollowerSelection

ReplaceFollowerSelection::
; a = committed replacement, 1-based. No index shifting.
    ld c, a
    call GetFollowerSelectionPreservingBC
    cp c
    ret nz
ClearFollowerSelection::
    xor a
    ld [wFollowerSelection], a
    jp SealFollowerSelection

GetFollowerSelectionPreservingBC:
    push bc
    call GetFollowerSelection
    pop bc
    ret

SuspendContestFollower::
    call GetFollowerSelection
    ld hl, wFollowerSelectionSuspended
    set FOLLOWER_SUSPEND_CONTEST_F, [hl]
    jp SealFollowerSelection

ResumeContestFollower::
    call GetFollowerSelection
    ld hl, wFollowerSelectionSuspended
    res FOLLOWER_SUSPEND_CONTEST_F, [hl]
    jp SealFollowerSelection

SuspendBorrowedTeamFollower::
; LoadPokemonData restores the original record together with the real party.
    call GetFollowerSelection
    ld hl, wFollowerSelectionSuspended
    set FOLLOWER_SUSPEND_TEAM_F, [hl]
    jp SealFollowerSelection

FollowerOnPartyRemoval::
    push af
    push bc
    push de
    push hl
    ld a, [wCurPartyMon]
    call RemoveFollowerSelection
    jp FollowerSelectionRestoreRegisters

FollowerOnStorageWrite::
; c = 1-based slot about to be overwritten. Called only after commit.
    push af
    push bc
    push de
    push hl
    ld a, c
    call ReplaceFollowerSelection
    jp FollowerSelectionRestoreRegisters

FollowerOnMenuSwap::
    push af
    push bc
    push de
    push hl
    ld a, [wSwitchMonFrom]
    inc a
    ld c, a
    ld a, [wSwitchMonTo]
    inc a
    ld e, a
    call SwapFollowerSelection
FollowerSelectionRestoreRegisters:
    pop hl
    pop de
    pop bc
    pop af
    ret

BeginFollowerPartyMenu::
    ld a, 1
    ld [wFollowerMenuContext], a
    ld a, PAD_A | PAD_B | PAD_SELECT
    ld [wMenuJoypadFilter], a
    ret

DrawFollowerPartyHint::
    hlcoord 1, 16
    ld bc, 18
    ld a, ' '
    call ByteFill
    hlcoord 1, 16
    ld de, .hint
    jp PlaceString
.hint
    db "Select: Follow@"

PlaceFollowerPartyMarker::
    ld a, [wFollowerMenuContext]
    and a
    ret z
    call GetFollowerSelection
    and a
    ret z
    ld c, a
    ld a, [wFollowerSelectionSuspended]
    and a
    ret nz
    ld a, [wPartyCount]
    cp c
    ret c
    ld a, c
    dec a
    ld bc, 2 * SCREEN_WIDTH
    hlcoord 4, 2
    call AddNTimes
    ld [hl], PARTY_MENU_FOLLOWER_TILE
    ld de, wAttrmap - wTilemap
    add hl, de
    ld [hl], PARTY_MENU_FOLLOWER_PAL
    ld a, [hCGB]
    and a
    ret z
    farcall ApplyAttrmap
    ret

HandleFollowerPartySelect::
    ld a, [wCurPartyMon]
    push af
    ld a, [wMenuCursorY]
    dec a
    ld [wCurPartyMon], a
    call TogglePartyFollowerSelection
    ; A rejected row (egg/cancel/temporary party) changes nothing.
    jr c, .restore
    farcall WritePartyMenuTilemap
    farcall PlacePartyMenuText
    call DrawFollowerPartyHint
    call WaitBGMap
.restore
    pop af
    ld [wCurPartyMon], a
    ; StaticMenuJoypad accepts held input; consume one toggle per physical press.
.release
    call DelayFrame
    call GetJoypad
    ldh a, [hJoyDown]
    and PAD_SELECT
    jr nz, .release
    ret
