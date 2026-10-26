; Script suppression is transient and separate from the saved party choice.
; Explicit holds survive script end and same-map reloads until showfollower;
; automatic movement/battle holds expire when the whole scene returns to idle.

HidePartyFollower::
    ld hl, wFollowerScriptFlags
    set FOLLOWER_SCRIPT_HIDE_F, [hl]
    jp RemovePartyFollower

ShowPartyFollower::
; Release the author's hold. Active movement/native NPC pairs still take priority.
; Reconciliation runs in the overworld loop; never turn on an unselected member.
    xor a
    ld [wFollowerScriptFlags], a
    ret

UpdateFollowerScriptHold:
    ld a, [wScriptRunning]
    ld hl, wScriptMode
    or [hl]
    ret nz
    ld a, [wStateFlags]
    bit SCRIPTED_MOVEMENT_STATE_F, a
    ret nz
    ld hl, wFollowerScriptFlags
    res FOLLOWER_SCRIPT_AUTO_F, [hl]
    ret

SuspendFollowerForPlayerObject::
    push af
    cp LAST_TALKED
    jr nz, .check
    ldh a, [hLastTalked]
.check
    and a
    call z, SuspendFollowerForScene
    pop af
    ret

SuspendFollowerForScene::
; Native hooks must preserve inputs/results and both object-index scratch bytes.
; In particular ApplyMovement consumes c/script state, and trainer detection
; needs its carry/result. Do not use the shared native follow pair as a flag.
    push af
    push bc
    push de
    push hl
    ldh a, [hMapObjectIndex]
    push af
    ldh a, [hObjectStructIndex]
    push af
    ld hl, wFollowerScriptFlags
    set FOLLOWER_SCRIPT_AUTO_F, [hl]
    call RemovePartyFollower
    pop af
    ldh [hObjectStructIndex], a
    pop af
    ldh [hMapObjectIndex], a
    pop hl
    pop de
    pop bc
    pop af
    ret
