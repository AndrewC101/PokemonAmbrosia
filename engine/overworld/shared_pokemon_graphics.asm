GetSharedOverworldMonSprite::
    push af
    ld c, SPRITE_FOLLOWER - SPRITE_VARS
.resolve
    cp SPRITE_FOLLOWER
    jr nc, .unavailable
    cp SPRITE_VARS
    jr nc, .variable
    cp SPRITE_DAY_CARE_MON_1
    jr z, .daycare1
    cp SPRITE_DAY_CARE_MON_2
    jr z, .daycare2
    cp SPRITE_POKEMON
    jr nc, .species
    cp SPRITE_MEWTWO_OVERWORLD
    jr z, .mewtwo
    cp SPRITE_SLOWPOKE
    jr z, .slowpoke
    cp SPRITE_SUICUNE
    jr z, .suicune
    cp SPRITE_ENTEI
    jr z, .entei
    cp SPRITE_RAIKOU
    jr nz, .unavailable
    ld a, RAIKOU
    jr .lookup
.entei
    ld a, ENTEI
    jr .lookup
.suicune
    ld a, SUICUNE
    jr .lookup
.slowpoke
    ld a, SLOWPOKE
    jr .lookup
.mewtwo
    ld a, MEWTWO
    jr .lookup
.species
    cp SPRITE_POKEMON + NUM_POKEMON_SPRITES
    jr nc, .unavailable
    sub SPRITE_POKEMON
    ld l, a
    ld h, 0
    ld de, SpriteMons
    add hl, de
    ld a, BANK(SpriteMons)
    call GetFarByte
    jr .lookup
.daycare1
    ld a, [wBreedMon1Species]
    jr .lookup
.daycare2
    ld a, [wBreedMon2Species]
.lookup
    call GetSharedMonSprite
    jr nc, .unavailable
    pop af
    ld c, 12
    ld hl, WALKING_SPRITE
    scf
    ret
.variable
    sub SPRITE_VARS
    ld l, a
    ld h, 0
    ld de, wVariableSprites
    add hl, de
    ld a, c
    and a
    jr z, .unavailable
    dec c
    ld a, [hl]
    jr .resolve
.unavailable
    pop af
    and a
    ret

GetSharedOverworldMonFacing::
    push bc
    push de
    push af
    ld a, [bc]
    call GetSharedOverworldMonSprite
    jr nc, .ordinary
    pop af
    and %00000011
    add FACING_WEIRD_TREE_0
    jr .done
.ordinary
    pop af
.done
    pop de
    pop bc
    ret

RepackSharedOverworldMonFrames::
    ld h, d
    ld l, e
    ld a, b
    ld de, wOverworldMonFrames
    call .CopyFrame
    ld de, wOverworldMonFrames + 12 tiles
    call .CopyFrame
    ld de, wOverworldMonFrames + 4 tiles
    call .CopyFrame
    ld de, wOverworldMonFrames + 16 tiles
    call .CopyFrame
    ld de, wOverworldMonFrames + 8 tiles
    call .CopyFrame
    ld de, wOverworldMonFrames + 20 tiles
    call .CopyFrame
    ld de, wOverworldMonFrames
    lb bc, BANK(GetUsedSprite), 12
    ret
.CopyFrame
    push af
    ld bc, 4 tiles
    call FarCopyBytes
    pop af
    ret
