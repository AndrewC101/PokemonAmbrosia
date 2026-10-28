; Preserve resident walking sprites and reserve the follower cache.
; Classification bytes live on the stack; no saved/HRAM/WRAM1 arrays are enlarged.
ArrangeFollowerSafeSprites::
    add sp, -SPRITE_GFX_LIST_CAPACITY
    ld hl, sp+0
    ld bc, SPRITE_GFX_LIST_CAPACITY
    xor a
    call ByteFill
    ld hl, sp+0
    ld d, h
    ld e, l
    ld hl, wUsedSprites
    ld b, 0
    ld c, SPRITE_GFX_LIST_CAPACITY
.classify
    ld a, [hli]
    and a
    jr z, .classified
    ld a, [hl]
    cp SHARED_MON_TURNING_SPRITE
    jr c, .primary_candidate
    ld [de], a
    inc de
    inc hl
    dec c
    jr nz, .classify
    jr .classified
.primary_candidate
    call .length
    add b
    cp $81
    jr nc, .suffix
    ld b, a
    ld a, [hli]
    or $40
    ld [de], a
    inc de
    dec c
    jr nz, .classify
    jr .classified
.suffix
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr z, .classified
    ld a, [hli]
    and a
    jr nz, .suffix
.classified
    ld hl, sp+0
    ld d, h
    ld e, l
    ld hl, wUsedSprites + 1
    ld b, 0
    ld c, SPRITE_GFX_LIST_CAPACITY
.walking
    ld a, [de]
    bit 6, a
    jr z, .walk_next
    and $3f
    cp STILL_SPRITE
    jr z, .walk_next
    ld a, b
    ld [hl], a
    add 12
    ld b, a
    ld a, [de]
    or $80
    ld [de], a
.walk_next
    inc de
    inc hl
    inc hl
    dec c
    jr nz, .walking

    ld hl, sp+0
    ld d, h
    ld e, l
    ld hl, wUsedSprites + 1
    ld c, SPRITE_GFX_LIST_CAPACITY
.stills
    ld a, [de]
    cp $40 | STILL_SPRITE
    jr nz, .still_next
    ld a, b
    add 4
    cp FOLLOWER_PRIMARY_TILES + 1
    jr nc, .still_next
    ld a, b
    ld [hl], a
    add 4
    ld b, a
    ld a, [de]
    or $80
    ld [de], a
.still_next
    inc de
    inc hl
    inc hl
    dec c
    jr nz, .stills

    ld hl, sp+0
    ld d, h
    ld e, l
    ld hl, wUsedSprites + 1
    ld b, $80
    ld c, SPRITE_GFX_LIST_CAPACITY
.bank0
    ld a, [de]
    and a
    jr z, .bank_next
    bit 7, a
    jr nz, .bank_next
    and $3f
    call .bank0_length
    call .place_bank0
    jr c, .fallback
.bank_next
    inc de
    inc hl
    inc hl
    dec c
    jr nz, .bank0
    ld hl, wFollowerFlags
    res FOLLOWER_NO_CAPACITY_F, [hl]
    add sp, SPRITE_GFX_LIST_CAPACITY
    ret

.fallback
    ; Restore types, then retain the pre-follower layout and suppress the cache.
    ld hl, sp+0
    ld d, h
    ld e, l
    ld hl, wUsedSprites + 1
    ld c, SPRITE_GFX_LIST_CAPACITY
.restore
    ld a, [de]
    and $3f
    ld [hli], a
    inc hl
    inc de
    dec c
    jr nz, .restore
    ld hl, wFollowerFlags
    set FOLLOWER_NO_CAPACITY_F, [hl]
    call .legacy
    add sp, SPRITE_GFX_LIST_CAPACITY
    ret

.place_bank0
    push de
    ld e, a
    ld a, b
    cp $ef
    jr nc, .after_weather
    add e
    cp $ee
    jr c, .after_weather
    ld b, $ef ; skip physical bank-0 tiles $6d/$6e, including straddling blocks
.after_weather
    ld a, b
    add e
    jr c, .bank_full
    ld [hl], b
    ld b, a
    and a
.bank_full
    pop de
    ret

.length
    cp STILL_SPRITE
    ld a, 4
    ret z
    ld a, 12
    ret

.bank0_length
    cp SHARED_MON_SPRITE
    jr z, .front_length
    cp SHARED_MON_FRONT_SPRITE
    jr nz, .length
.front_length
    ld a, 8
    ret

.legacy
    ld hl, wUsedSprites
    ld c, SPRITE_GFX_LIST_CAPACITY
    ld b, 0
.legacy_first
    ld a, [hli]
    and a
    ret z
    ld a, [hl]
    call .length
    add b
    cp $81
    jr nc, .legacy_second_start
    ld [hl], b
    inc hl
    ld b, a
    dec c
    jr nz, .legacy_first
    ret
.legacy_second_start
    ld b, $80
.legacy_second
    ld a, [hl]
    call .bank0_length
    add b
    ret c
    ld [hl], b
    ld b, a
    inc hl
    dec c
    ret z
    ld a, [hli]
    and a
    jr nz, .legacy_second
    ret
