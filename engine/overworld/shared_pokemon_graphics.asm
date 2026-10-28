GetSharedOverworldMonSprite::
    push af
    ld c, SPRITE_FOLLOWER - SPRITE_VARS
.resolve
    cp SPRITE_FOLLOWER
    jp nc, .unavailable
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
    jp nz, .unavailable
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
    cp SPRITE_DYNAMIC_FIRST
    jr c, .fixed_species
    cp SPRITE_DYNAMIC_END
    jp nc, .unavailable
    newfarcall GetDynamicPokemonSpecies
    jr .lookup
.fixed_species
    cp SPRITE_POKEMON + NUM_POKEMON_SPRITES
    jp nc, .unavailable
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
    jp nc, .unavailable
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
    jp z, .unavailable
    dec c
    ld a, [hl]
    jp .resolve
.unavailable
    pop af
    and a
    ret

GetSharedOverworldMonFacing::
    push hl
    push bc
    push de
    push af
    ld a, [bc]
    newfarcall GetLocalMapSpriteKind
    cp SHARED_MON_TURNING_SPRITE
    jr z, .turning
    ld a, [bc]
    call GetSharedOverworldMonSprite
    jr nc, .ordinary
    pop af
    cp FACING_FISH_DOWN
    jr nc, .done
    and %00000011
    add FACING_WEIRD_TREE_0
    jr .done
.turning
    pop af
    cp FACING_FISH_DOWN
    jr c, .turning_direction
    ld hl, OBJECT_DIRECTION
    add hl, bc
    ld a, [hl]
.turning_direction
    and %00001100
    jr .done
.ordinary
    pop af
.done
    pop de
    pop bc
    pop hl
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

CopySharedOverworldMonFrontFrames::
    ld h, d
    ld l, e
    ld de, wOverworldMonFrames
    ldh a, [rWBK]
    push af
    ld a, BANK(wOverworldMonFrames)
    ldh [rWBK], a
    ld a, b
    ld bc, 8 tiles
    call FarCopyBytes
    pop af
    ldh [rWBK], a
    ld de, wOverworldMonFrames
    lb bc, BANK(GetUsedSprite), 8
    ret

CopySharedOverworldMonStandingFrames::
    ld h, d
    ld l, e
    ld de, wOverworldMonFrames
    ldh a, [rWBK]
    push af
    ld a, BANK(wOverworldMonFrames)
    ldh [rWBK], a
    ld a, b
    call RepackSharedOverworldMonFrames.CopyFrame
    ld bc, 4 tiles
    add hl, bc
    call RepackSharedOverworldMonFrames.CopyFrame
    ld bc, 4 tiles
    add hl, bc
    call RepackSharedOverworldMonFrames.CopyFrame
    pop af
    ldh [rWBK], a
    ld de, wOverworldMonFrames
    lb bc, BANK(GetUsedSprite), 12
    ret
