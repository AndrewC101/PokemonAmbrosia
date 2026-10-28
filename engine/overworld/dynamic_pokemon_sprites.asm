SECTION "Dynamic Pokemon sprite engine", ROMX

ReadObjectEvents::
	push hl
	call ClearObjectStructs
	pop de
	ld h, d
	ld l, e
	ld a, [wMapScriptsBank]
	call GetFarByte
	ld b, a
	inc de
	ld hl, wMap1Object
	ld a, b
	ld [wCurMapObjectEventCount], a
	ld a, e
	ld [wCurMapObjectEventsPointer], a
	ld a, d
	ld [wCurMapObjectEventsPointer + 1], a

	ld a, [wCurMapObjectEventCount]
	call CopyMapObjectEvents

	ld a, [wCurMapObjectEventCount]
	ld c, a
	ld a, NUM_OBJECTS - 1
	sub c
	jr z, .skip
	jr c, .skip

	ld bc, 1
	add hl, bc
	ld bc, MAPOBJECT_LENGTH
.loop
	ld [hl],  0
	inc hl
	ld [hl], -1
	dec hl
	add hl, bc
	dec a
	jr nz, .loop

.skip
	ld h, d
	ld l, e
	newfarcall RebindDynamicMapObjects
	ret

CopyMapObjectEvents::
	and a
	ret z

	ld c, a
.loop
	push bc
	push de
	push hl
	ld a, $ff
	ld [hli], a
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, OBJECT_EVENT_SIZE
	ld a, [wMapScriptsBank]
	call FarCopyBytes

	pop hl
	ld bc, MAPOBJECT_LENGTH
	add hl, bc
	pop de
	ld a, e
	add OBJECT_EVENT_SIZE
	ld e, a
	jr nc, .cursor_ready
	inc d
.cursor_ready
	pop bc
	dec c
	jr nz, .loop
	ret


GetDynamicPokemonSpecies::
    push bc
    push hl
    ld c, a
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteBindings)
    ldh [rWBK], a
    ld a, c
    sub SPRITE_DYNAMIC_FIRST
    ld l, a
    ld h, 0
    ld bc, wDynamicSpriteBindings
    add hl, bc
    ld c, [hl]
    pop af
    ldh [rWBK], a
    ld a, c
    pop hl
    pop bc
    ret

BindDynamicPokemonSpecies::
    push bc
    push de
    push hl
    and a
    jr z, .done
    cp NUM_POKEMON + 1
    jr nc, .invalid
    ld d, a
    newfarcall FindCanonicalPokemonSprite
    and a
    jr nz, .done
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteBindings)
    ldh [rWBK], a
    ld hl, wDynamicSpriteBindings
    ld b, NUM_DYNAMIC_POKEMON_SPRITES
    ld c, 0
.existing
    ld a, [hli]
    cp d
    jr z, .slot
    inc c
    dec b
    jr nz, .existing
    ld hl, wDynamicSpriteOldBindings
    ld b, NUM_DYNAMIC_POKEMON_SPRITES
    ld c, 0
.previous
    ld a, [hli]
    cp d
    jr nz, .next_previous
    push hl
    push de
    ld h, 0
    ld l, c
    ld de, wDynamicSpriteBindings
    add hl, de
    ld a, [hl]
    pop de
    pop hl
    and a
    jr z, .reuse_previous
.next_previous
    inc c
    dec b
    jr nz, .previous
    ld hl, wDynamicSpriteBindings
    ld b, NUM_DYNAMIC_POKEMON_SPRITES
    ld c, 0
.free
    ld a, [hli]
    and a
    jr z, .assign
    inc c
    dec b
    jr nz, .free
    xor a
    jr .restore_bank
.reuse_previous
    ld hl, wDynamicSpriteBindings
    ld b, 0
    add hl, bc
    inc hl
.assign
    dec hl
    ld [hl], d
.slot
    ld a, c
    add SPRITE_DYNAMIC_FIRST
.restore_bank
    ld e, a
    pop af
    ldh [rWBK], a
    ld a, e
    jr .done
.invalid
    xor a
.done
    pop hl
    pop de
    pop bc
    ret

RebindDynamicMapObjects::
    push bc
    push de
    push hl
    call CacheLocalMapProfilePointer
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteBindings)
    ldh [rWBK], a
    ld hl, wDynamicSpriteBindings
    ld de, wDynamicSpriteOldBindings
    ld b, NUM_DYNAMIC_POKEMON_SPRITES
.bindings
    ld a, [hl]
    ld [de], a
    xor a
    ld [hli], a
    inc de
    dec b
    jr nz, .bindings
    ld a, 1
    ldh [rWBK], a
    ld a, [wCurMapObjectEventCount]
    and a
    jr z, .done
    ld c, a
    ld hl, wCurMapObjectEventsPointer
    ld a, [hli]
    ld d, [hl]
    ld e, a
    ld hl, wMap1Object
.loop
    push bc
    push de
    push hl
    ld b, h
    ld c, l
    ld h, d
    ld l, e
    ld a, [wMapScriptsBank]
    call GetFarByte
    cp SPRITE_DYNAMIC_POKEMON
    jr nz, .ordinary
    ld de, MAPOBJECT_HOUR_1 - 1
    add hl, de
    ld a, [wMapScriptsBank]
    call GetFarByte
    ld d, a
    ld hl, MAPOBJECT_SPECIES
    add hl, bc
    ld [hl], d
    ld hl, MAPOBJECT_HOUR_1
    add hl, bc
    ld [hl], -1
    ld a, d
    call BindDynamicPokemonSpecies
    ld hl, MAPOBJECT_SPRITE
    add hl, bc
    ld [hl], a
    ld e, a
    ld a, [bc]
    cp NUM_OBJECT_STRUCTS
    jr nc, .next
    push de
    call GetObjectStruct
    pop de
    ld a, [bc]
    and a
    jr z, .next
    ld a, e
    ld [bc], a
    jr .next
.ordinary
    ld hl, MAPOBJECT_SPECIES
    add hl, bc
    ld [hl], 0
.next
    pop hl
    ld bc, MAPOBJECT_LENGTH
    add hl, bc
    pop de
    ld a, e
    add OBJECT_EVENT_SIZE
    ld e, a
    jr nc, .pointer_ready
    inc d
.pointer_ready
    pop bc
    dec c
    jr nz, .loop
.done
    call RefreshProfileMovementDefaults
    pop af
    ldh [rWBK], a
    pop hl
    pop de
    pop bc
    ret

RefreshProfileMovementDefaults:
    ldh a, [hMapEntryMethod]
    and $f
    cp MAPSETUP_CONTINUE & $f
    ret nz
    ld a, [wStateFlags]
    bit SCRIPTED_MOVEMENT_STATE_F, a
    ret nz
    push bc
    push de
    push hl
    call GetDynamicSpriteProfile
    and a
    jr z, .done
    ld a, [wCurMapObjectEventsPointer]
    ld e, a
    ld a, [wCurMapObjectEventsPointer + 1]
    ld d, a
    ld hl, wMap1Object
    ld a, [wCurMapObjectEventCount]
    ld b, a
.loop
    ld a, b
    and a
    jr z, .done
    push bc
    push de
    push hl
    ld b, h
    ld c, l
    ld h, d
    ld l, e
    inc hl
    inc hl
    inc hl
    ld d, 0
    ld e, MAPOBJECT_MOVEMENT
    call .copy_field
    ld e, MAPOBJECT_RADIUS
    call .copy_field
    inc hl
    inc hl
    inc hl
    ld e, MAPOBJECT_SIGHT_RANGE
    call .copy_field
    ld a, d
    and a
    call nz, .reset_changed_object
    pop hl
    ld bc, MAPOBJECT_LENGTH
    add hl, bc
    pop de
    ld a, e
    add OBJECT_EVENT_SIZE
    ld e, a
    jr nc, .next
    inc d
.next
    pop bc
    dec b
    jr .loop
.done
    pop hl
    pop de
    pop bc
    ret
.copy_field
    ld a, [wMapScriptsBank]
    call GetFarByte
    push hl
    ld h, 0
    ld l, e
    add hl, bc
    cp [hl]
    jr z, .same
    ld d, 1
.same
    ld [hl], a
    pop hl
    inc hl
    ret
.reset_changed_object
    push bc
    ld a, [bc]
    and a
    jr z, .no_object
    cp NUM_OBJECT_STRUCTS
    jr nc, .no_object
    call GetObjectStruct
    ld a, [bc]
    and a
    jr z, .no_object
    ld hl, OBJECT_MAP_X
    add hl, bc
    ld d, [hl]
    inc hl
    ld e, [hl]
    xor a
    ld [bc], a
    pop bc
    ld hl, MAPOBJECT_X_COORD
    add hl, bc
    ld [hl], d
    ld hl, MAPOBJECT_Y_COORD
    add hl, bc
    ld [hl], e
    ld a, -1
    ld [bc], a
    ret
.no_object
    pop bc
    ld a, -1
    ld [bc], a
    ret

GetDynamicSpriteProfile::
    push bc
    ld a, [wMapGroup]
    ld b, a
    ld a, [wMapNumber]
    ld c, a
    call GetDynamicSpriteProfileForMap
    pop bc
    ret

RestoreProfileContinueObjects::
    ldh a, [hMapEntryMethod]
    cp MAPSETUP_CONTINUE
    ret nz
    ld a, [wStateFlags]
    bit SCRIPTED_MOVEMENT_STATE_F, a
    ret nz
    call GetDynamicSpriteProfile
    and a
    ret z
    ldh a, [hMapObjectIndex]
    push af
    newfarcall InitializeVisibleSprites
    pop af
    ldh [hMapObjectIndex], a
    ret

GetDynamicSpriteProfileForMap:
    push hl
    call GetLocalMapProfilePointerForMap
    pop hl
    and a
    ret nz
    ld a, b
    cp GROUP_ROUTE_29
    jr nz, .cherrygrove
    ld a, c
    cp MAP_ROUTE_29
    ld a, DYNAMIC_SPRITE_PROFILE_ROUTE29
    ret z
.cherrygrove
    ld a, b
    cp GROUP_CHERRYGROVE_CITY
    jr nz, .legacy
    ld a, c
    cp MAP_CHERRYGROVE_CITY
    jr z, .common
    cp MAP_ROUTE_30
    jr nz, .legacy
.common
    ld a, DYNAMIC_SPRITE_PROFILE_CHERRYGROVE
    ret
.legacy
    xor a
    ret

AddDynamicMapSprites::
    call GetDynamicSpriteProfile
    and a
    ret z
    cp DYNAMIC_SPRITE_PROFILE_ROUTE29
    jr z, .route29
    cp DYNAMIC_SPRITE_PROFILE_LOCAL
    jr z, .local
    jr .regional
.route29
    ld hl, Route29WalkingSprites
    call .AddList
    ld c, 1
    call .AddPokemon
    ld hl, Route29StandingSprites
    call .AddList
    ld c, 2
    call .AddPokemon
    ld hl, Route29StillSprites
    call .AddList
    scf
    ret
.local
    ld hl, wMap1ObjectSprite
    ld a, [wCurMapObjectEventCount]
    ld b, a
.local_loop
    ld a, b
    and a
    jr z, .local_done
    push bc
    push hl
    ld a, [hl]
    and a
    jr z, .local_next
    newfarcall AddSpriteGFX
.local_next
    pop hl
    ld de, MAPOBJECT_LENGTH
    add hl, de
    pop bc
    dec b
    jr .local_loop
.local_done
    scf
    ret
.regional
    ld a, [wMapGroup]
    newfarcall GetOutdoorSpriteSetPointer
.base_loop
    ld a, BANK(OutdoorSprites)
    call GetFarByte
    inc hl
    and a
    jr z, .pokemon
    push hl
    push af
    newfarcall GetSharedOverworldMonSprite
    jr c, .skip_base
    pop af
    newfarcall AddSpriteGFX
    jr .base_next
.skip_base
    pop af
.base_next
    pop hl
    jr .base_loop
.pokemon
    ld c, 0
    call .AddPokemon
    scf
    ret
.AddList
    ld a, [hli]
    and a
    ret z
    newfarcall AddSpriteGFX
    jr .AddList
.AddPokemon
    ld hl, wMap1ObjectSprite
    ld a, [wCurMapObjectEventCount]
    and a
    ret z
    ld b, a
.mon_loop
    push bc
    push hl
    ld a, c
    and a
    jr z, .check_species
    ld de, MAPOBJECT_MOVEMENT - MAPOBJECT_SPRITE
    add hl, de
    ld a, [hl]
    cp SPRITEMOVEDATA_POKEMON
    ld a, 1
    jr nz, .movement_ready
    inc a
.movement_ready
    cp c
    pop hl
    push hl
    jr nz, .mon_next
.check_species
    ld a, [hl]
    and a
    jr z, .mon_next
    push af
    newfarcall GetSharedOverworldMonSprite
    jr nc, .skip_mon
    pop af
    newfarcall AddSpriteGFX
    jr .mon_next
.skip_mon
    pop af
.mon_next
    pop hl
    ld de, MAPOBJECT_LENGTH
    add hl, de
    pop bc
    dec b
    jr nz, .mon_loop
    ret

Route29WalkingSprites:
    db SPRITE_COOLTRAINER_M, 0
Route29StandingSprites:
    db SPRITE_YOUNGSTER, SPRITE_BEAUTY, SPRITE_FISHER, SPRITE_COOLTRAINER_F, 0
Route29StillSprites:
    db SPRITE_POKE_BALL, SPRITE_FRUIT_TREE, 0

GetLocalMapProfilePointer:
    push bc
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicMapProfilePointer)
    ldh [rWBK], a
    ld hl, wDynamicMapProfilePointer
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld b, h
    ld c, l
    pop af
    ldh [rWBK], a
    ld a, b
    or c
    pop bc
    ret

CacheLocalMapProfilePointer:
    push bc
    push de
    push hl
    ld a, [wMapGroup]
    ld b, a
    ld a, [wMapNumber]
    ld c, a
    call GetLocalMapProfilePointerForMap
    and a
    jr nz, .ready
    ld hl, 0
.ready
    ld d, h
    ld e, l
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicMapProfilePointer)
    ldh [rWBK], a
    ld hl, wDynamicMapProfilePointer
    ld [hl], e
    inc hl
    ld [hl], d
    pop af
    ldh [rWBK], a
    pop hl
    pop de
    pop bc
    ret

GetLocalMapProfilePointerForMap:
    push de
    ld hl, LocalPokemonSpriteProfiles
.loop
    ld a, [hli]
    and a
    jr z, .missing
    cp b
    jr nz, .skip_number
    ld a, [hli]
    cp c
    jr z, .found
    jr .skip_pointer
.skip_number
    inc hl
.skip_pointer
    inc hl
    inc hl
    jr .loop
.found
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld a, DYNAMIC_SPRITE_PROFILE_LOCAL
    pop de
    ret
.missing
    xor a
    pop de
    ret

GetLocalMapSpriteKind::
    push bc
    push de
    push hl
    ld c, a
    ld a, [wPlayerSprite]
    cp c
    jr z, .ordinary
    call GetLocalMapProfilePointer
    and a
    jr z, .ordinary
.human
    ld a, [hli]
    and a
    jr z, .pokemon
    cp c
    jr nz, .human
    ld a, OVERFLOW_STANDING_SPRITE
    jr .done
.pokemon
    push hl
    push bc
    ld a, c
    newfarcall GetSharedOverworldMonSprite
    pop bc
    pop hl
    jr nc, .ordinary
    push hl
    ld a, c
    call GetDynamicRecordSpecies
    pop hl
    ld c, a
.turning
    ld a, [hli]
    and a
    jr z, .front
    cp c
    jr nz, .turning
    ld a, SHARED_MON_TURNING_SPRITE
    jr .done
.front
    ld a, [hli]
    and a
    jr z, .full
    cp c
    jr nz, .front
    ld a, SHARED_MON_FRONT_SPRITE
    jr .done
.full
    ld a, SHARED_MON_SPRITE
    jr .done
.ordinary
    xor a
.done
    pop hl
    pop de
    pop bc
    ret

INCLUDE "data/maps/pokemon_sprite_profiles.asm"

UpdateDynamicObjectTiles::
    push bc
    push de
    push hl
    ldh a, [hMapObjectIndex]
    push af
    ld bc, wObject1Struct
    ld d, NUM_OBJECT_STRUCTS - 1
.loop
    push de
    ld a, [bc]
    and a
    jr z, .next
    ld hl, OBJECT_MAP_OBJECT_INDEX
    add hl, bc
    ld a, [hl]
    and a
    jr z, .next
    cp NUM_OBJECTS
    jr nc, .next
    ldh [hMapObjectIndex], a
    push bc
    call GetMapObject
    ld hl, MAPOBJECT_SPECIES
    add hl, bc
    ld a, [hl]
    pop bc
    and a
    jr z, .next
    ld a, [bc]
    call GetSpriteVTile
    ld hl, OBJECT_SPRITE_TILE
    add hl, bc
    ld [hl], a
.next
    ld hl, OBJECT_LENGTH
    add hl, bc
    ld b, h
    ld c, l
    pop de
    dec d
    jr nz, .loop
    pop af
    ldh [hMapObjectIndex], a
    pop hl
    pop de
    pop bc
    ret

ResetDynamicSpriteCache::
    push bc
    push hl
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteState)
    ldh [rWBK], a
    ld hl, wDynamicSpriteState
    ld bc, wDynamicSpriteStateMemoryEnd - wDynamicSpriteState
    xor a
    call ByteFill
    pop af
    ldh [rWBK], a
    pop hl
    pop bc
    ret

InvalidateDynamicSpriteCache::
    push af
    push hl
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteCacheValid)
    ldh [rWBK], a
    ld hl, wDynamicSpriteCacheValid
    ld [hl], 0
    pop af
    ldh [rWBK], a
    pop hl
    pop af
    ret

GetDynamicRecordSpecies:
    cp SPRITE_DYNAMIC_FIRST
    jr c, .canonical
    cp SPRITE_DYNAMIC_END
    jp c, GetDynamicPokemonSpecies
    xor a
    ret
.canonical
    sub SPRITE_POKEMON
    cp NUM_POKEMON_SPRITES
    jr nc, .ordinary
    ld l, a
    ld h, 0
    ld de, SpriteMons
    add hl, de
    ld a, BANK(SpriteMons)
    jp GetFarByte
.ordinary
    xor a
    ret

GetDynamicTargetRecord:
    ld de, wDynamicSpriteTargetRecords
GetDynamicRecordAddress:
    ld l, a
    ld h, 0
    ld b, h
    ld c, l
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    add hl, de
    ret

BuildDynamicSpriteRecords:
    ldh a, [rWBK]
    push af
    call GetDynamicSpriteProfile
    ld c, a
    ld a, BANK(wDynamicSpriteTargetRecords)
    ldh [rWBK], a
    ld a, c
    ld [wDynamicSpriteTargetProfile], a
    xor a
    ld [wDynamicSpriteTargetCount], a
    ld hl, wDynamicSpriteTargetRecords
    ld bc, SPRITE_GFX_LIST_CAPACITY * DYNAMIC_SPRITE_RECORD_LENGTH
    call ByteFill
    ld a, 1
    ldh [rWBK], a
    ld hl, wUsedSprites
.loop
    ld a, [hli]
    and a
    jr z, .done
    ld b, a
    ld c, [hl]
    inc hl
    push hl
    push bc
    ld a, BANK(wDynamicSpriteTargetRecords)
    ldh [rWBK], a
    ld a, [wDynamicSpriteTargetCount]
    call GetDynamicTargetRecord
    pop bc
    ld a, b
    ld [hli], a
    ld [hl], c
    ld a, 1
    ldh [rWBK], a
    ld a, b
    push af
    newfarcall GetSprite
    ld a, h
    and a
    ld a, l
    jr nz, .kind_ready
    ld a, SHARED_MON_SPRITE
.kind_ready
    ld c, a
    pop af
    call GetLocalMapSpriteKind
    and a
    jr z, .kind_default
    ld c, a
.kind_default
    push bc
    push de
    ld a, BANK(wDynamicSpriteTargetRecords)
    ldh [rWBK], a
    ld a, [wDynamicSpriteTargetCount]
    call GetDynamicTargetRecord
    inc hl
    inc hl
    pop de
    pop bc
    ld a, c
    ld [hli], a
    ld a, b
    ld [hli], a
    ld a, e
    ld [hli], a
    ld a, d
    ld [hli], a
    push hl
    ld a, [wDynamicSpriteTargetCount]
    call GetDynamicTargetRecord
    ld c, [hl]
    ld a, 1
    ldh [rWBK], a
    ld a, c
    call GetDynamicRecordSpecies
    ld c, a
    ld a, BANK(wDynamicSpriteTargetRecords)
    ldh [rWBK], a
    pop hl
    ld [hl], c
    ld hl, wDynamicSpriteTargetCount
    inc [hl]
    ld a, [hl]
    cp SPRITE_GFX_LIST_CAPACITY
    ld a, 1
    ldh [rWBK], a
    pop hl
    jr c, .loop
.done
    pop af
    ldh [rWBK], a
    ret

CommitDynamicSpriteRecords:
    ld hl, wDynamicSpriteTargetRecords
    ld de, wDynamicSpriteRecords
    ld bc, SPRITE_GFX_LIST_CAPACITY * DYNAMIC_SPRITE_RECORD_LENGTH
    call CopyBytes
    ld a, [wDynamicSpriteTargetCount]
    ld [wDynamicSpriteRecordCount], a
    ld a, [wDynamicSpriteTargetProfile]
    ld [wDynamicSpriteCacheProfile], a
    ld a, $d7
    ld [wDynamicSpriteCacheValid], a
    ret

CacheDynamicSpriteGraphics::
    ld a, [wSpriteFlags]
    and (1 << SPRITES_SKIP_STANDING_GFX_F) | (1 << SPRITES_SKIP_WALKING_GFX_F)
    jp nz, InvalidateDynamicSpriteCache
    call GetDynamicSpriteProfile
    and a
    jp z, InvalidateDynamicSpriteCache
    call BuildDynamicSpriteRecords
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteRecords)
    ldh [rWBK], a
    call CommitDynamicSpriteRecords
    pop af
    ldh [rWBK], a
    ret

CompareDynamicSpriteBase:
    ld hl, wDynamicSpriteRecords
    ld de, wDynamicSpriteTargetRecords
    ld b, SPRITE_GFX_LIST_CAPACITY
.loop
    push bc
    push hl
    push de
    inc hl
    inc hl
    ld a, [hl]
    and a
    jr z, .target_kind
    cp SHARED_MON_SPRITE
    jr c, .compare
    cp OVERFLOW_STANDING_SPRITE
    jr nc, .compare
.target_kind
    inc de
    inc de
    ld a, [de]
    and a
    jr z, .same
    cp SHARED_MON_SPRITE
    jr c, .compare
    cp OVERFLOW_STANDING_SPRITE
    jr c, .same
.compare
    pop de
    pop hl
    push hl
    push de
    ld c, DYNAMIC_SPRITE_RECORD_LENGTH
.bytes
    ld a, [de]
    cp [hl]
    jr nz, .different
    inc hl
    inc de
    dec c
    jr nz, .bytes
.same
    pop de
    pop hl
    ld bc, DYNAMIC_SPRITE_RECORD_LENGTH
    add hl, bc
    ld a, e
    add DYNAMIC_SPRITE_RECORD_LENGTH
    ld e, a
    jr nc, .next
    inc d
.next
    pop bc
    dec b
    jr nz, .loop
    scf
    ret
.different
    pop de
    pop hl
    pop bc
    and a
    ret

IsDynamicRecordResident:
    push bc
    push de
    push hl
    ld a, [wDynamicSpriteRecordCount]
    ld b, a
    and a
    jr z, .missing
    ld de, wDynamicSpriteRecords
.loop
    push bc
    push de
    push hl
    ld c, DYNAMIC_SPRITE_RECORD_LENGTH
.bytes
    ld a, [de]
    cp [hl]
    jr nz, .next
    inc de
    inc hl
    dec c
    jr nz, .bytes
    pop hl
    pop de
    pop bc
    pop hl
    pop de
    pop bc
    scf
    ret
.next
    pop hl
    pop de
    pop bc
    ld a, e
    add DYNAMIC_SPRITE_RECORD_LENGTH
    ld e, a
    jr nc, .pointer_ready
    inc d
.pointer_ready
    dec b
    jr nz, .loop
.missing
    pop hl
    pop de
    pop bc
    and a
    ret

TryDynamicSpriteConnection::
    call GetDynamicSpriteProfile
    ld d, a
    ld a, [wPrevMapGroup]
    ld b, a
    ld a, [wPrevMapNumber]
    ld c, a
    call GetDynamicSpriteProfileForMap
    ld e, a
    or d
    ret z
    ld a, d
    cp DYNAMIC_SPRITE_PROFILE_CHERRYGROVE
    jp c, .full
    ld a, e
    cp DYNAMIC_SPRITE_PROFILE_CHERRYGROVE
    jp c, .full
    ld d, a
    ldh a, [rWBK]
    push af
    ld a, BANK(wDynamicSpriteCacheValid)
    ldh [rWBK], a
    ld a, [wDynamicSpriteCacheValid]
    cp $d7
    jr nz, .restore_full
    ld a, [wDynamicSpriteCacheProfile]
    cp d
    jr nz, .restore_full
    ld a, 1
    ldh [rWBK], a
    newfarcall RefreshSprites.Refresh
    ld a, MAPCALLBACK_SPRITES
    call RunMapCallback
    call BuildDynamicSpriteRecords
    ld a, BANK(wDynamicSpriteRecords)
    ldh [rWBK], a
    call CompareDynamicSpriteBase
    jr nc, .restore_full
    xor a
    ld [wDynamicSpriteIndex], a
.loop
    ld a, [wDynamicSpriteIndex]
    ld hl, wDynamicSpriteTargetCount
    cp [hl]
    jr nc, .committed
    call GetDynamicTargetRecord
    push hl
    inc hl
    inc hl
    ld a, [hl]
    cp SHARED_MON_SPRITE
    pop hl
    jr c, .next
    cp OVERFLOW_STANDING_SPRITE
    jr nc, .next
    call IsDynamicRecordResident
    jr c, .next
    ld a, [hli]
    ldh [hUsedSpriteIndex], a
    ld a, [hl]
    ldh [hUsedSpriteTile], a
    ld b, a
    ld a, 1
    ldh [rWBK], a
    ld a, [wSpriteFlags]
    res SPRITES_SKIP_STANDING_GFX_F, a
    res SPRITES_SKIP_WALKING_GFX_F, a
    res SPRITES_VRAM_BANK_0_F, a
    bit 7, b
    jr z, .flags_ready
    set SPRITES_VRAM_BANK_0_F, a
.flags_ready
    ld [wSpriteFlags], a
    newfarcall GetUsedSprite
    ld a, BANK(wDynamicSpriteRecords)
    ldh [rWBK], a
.next
    ld hl, wDynamicSpriteIndex
    inc [hl]
    jr .loop
.committed
    call CommitDynamicSpriteRecords
    pop af
    ldh [rWBK], a
    scf
    ret
.restore_full
    pop af
    ldh [rWBK], a
.full
    newfarcall RefreshSprites
    scf
    ret
