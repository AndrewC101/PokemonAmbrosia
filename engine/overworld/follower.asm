; Party follower lifecycle. This file shares the bank of the graphics backend.
; The FOLLOWER_TEST build deliberately retains the Phase 1 screen fixture.

ResetFollowerLifecycle::
; Continue can restore synthetic objects inside the existing saved player data.
; Remove only the reserved sprite identity, before discarding transient ownership.
    ld bc, wObject1Struct
    ld d, 1
.objects
    ld a, [bc]
    cp SPRITE_FOLLOWER
    jr nz, .next
    push bc
    push de
    ld a, [wObjectFollow_Follower]
    cp d
    call z, ClearPokemonFollowPair
    ld h, b
    ld l, c
    ld bc, OBJECT_LENGTH
    xor a
    call ByteFill
    pop de
    pop bc
.next
    ld hl, OBJECT_LENGTH
    add hl, bc
    ld b, h
    ld c, l
    inc d
    ld a, d
    cp NUM_OBJECT_STRUCTS
    jr nz, .objects
    call ClearPokemonMapObject
    ld hl, wFollowerLifecycle
    ld bc, wFollowerLifecycleEnd - wFollowerLifecycle
    xor a
    call ByteFill
    dec a
    ld [wFollowerObjectID], a
    ld [wFollowerPartyIndex], a
    ret

SelectPartyFollower::
; Carry = selected member eligible. No automatic fallback to a healthy member.
    call GetFollowerSelection
    and a
    ret z
    ld c, a
    ld a, [wFollowerSelectionSuspended]
    and a
    ret nz
    ld a, [wPartyCount]
    cp PARTY_LENGTH + 1
    jr nc, .invalid
    cp c
    jr c, .invalid
    dec c
    ld b, 0
    ld hl, wPartySpecies
    add hl, bc
    ld a, [hl]
    and a
    jr z, .invalid
    cp NUM_POKEMON + 1
    jr nc, .invalid
    push bc
    ld a, c
    ld hl, wPartyMon1
    ld bc, PARTYMON_STRUCT_LENGTH
    call AddNTimes
    ld d, h
    ld e, l
    pop bc
    ld hl, MON_HP
    add hl, de
    ld a, [hli]
    or [hl]
    ret z ; fainting retains the choice
    ld a, [de]
    and a
    jr z, .invalid
    cp NUM_POKEMON + 1
    jr nc, .invalid
    ld [wFollowerCandidateSpecies], a
    ld a, c
    ld [wFollowerCandidateIndex], a
    ld hl, MON_DVS
    add hl, de
    ld a, [hli]
    ld [wFollowerCandidateDVs], a
    ld a, [hl]
    ld [wFollowerCandidateDVs + 1], a
    ld hl, MON_PALETTE_PAIR
    add hl, de
    ld a, [hl]
    ld [wFollowerCandidatePair], a
    scf
    ret
.invalid
    call ClearFollowerSelection
    and a
    ret

GetPokemonFollowerObject::
; Carry = verified live ownership; bc = struct, a = live index.
    ld a, [wFollowerLifecycleFlags]
    bit FOLLOWER_LIVE_F, a
    jr z, .missing
    ld a, [wFollowerObjectID]
    and a
    jr z, .missing
    cp NUM_OBJECT_STRUCTS
    jr nc, .missing
    push af
    call GetObjectStruct
    ld a, [bc]
    cp SPRITE_FOLLOWER
    jr nz, .invalid
    ld hl, OBJECT_MAP_OBJECT_INDEX
    add hl, bc
    ld a, [hl]
    cp FOLLOWER_MAP_OBJECT
    jr nz, .invalid
    ld a, [wMap17ObjectSprite]
    cp SPRITE_FOLLOWER
    jr nz, .invalid
    pop af
    ld hl, wMap17ObjectStructID
    cp [hl]
    jr nz, .missing
    scf
    ret
.invalid
    pop af
.missing
    and a
    ret

ClearPokemonFollowPair:
; Only call after proving the pair belongs to the Pokémon.
    ld a, -1
    ld [wObjectFollow_Leader], a
    ld [wObjectFollow_Follower], a
    ld [wFollowerMovementQueueLength], a
    ret

ClearPokemonMapObject:
; Never clear a real map's slot 17. The sprite identity is the ownership marker.
    ld a, [wMap17ObjectSprite]
    cp SPRITE_FOLLOWER
    ret nz
    ld hl, wMap17Object
    ld bc, MAPOBJECT_LENGTH
    xor a
    call ByteFill
    dec a
    ld [wMap17ObjectStructID], a
    ld [wObjectMasks + FOLLOWER_MAP_OBJECT], a
    ret

RemovePartyFollower::
; Clear verified resources only. Preserve an NPC's unrelated native follow pair.
    call GetPokemonFollowerObject
    jr nc, .stale
    push bc
    ld hl, wObjectFollow_Follower
    cp [hl]
    jr nz, .clear_struct
    call ClearPokemonFollowPair
.clear_struct
    pop hl
    ld bc, OBJECT_LENGTH
    xor a
    call ByteFill
    jr .map_object
.stale
    ; A native reload can erase the struct before reconciliation. Recover the
    ; recorded PLAYER/owned-index pair only while that slot is still empty.
    ; A real NPC reusing the index must never be erased or have its pair reset.
    ld a, [wFollowerLifecycleFlags]
    bit FOLLOWER_LIVE_F, a
    jr z, .map_object
    ld a, [wObjectFollow_Leader]
    and a
    jr nz, .map_object
    ld a, [wFollowerObjectID]
    and a
    jr z, .map_object
    cp NUM_OBJECT_STRUCTS
    jr nc, .map_object
    ld hl, wObjectFollow_Follower
    cp [hl]
    jr nz, .map_object
    call GetObjectStruct
    ld a, [bc]
    and a
    call z, ClearPokemonFollowPair
.map_object
    call ClearPokemonMapObject
    ld hl, wFollowerLifecycleFlags
    res FOLLOWER_LIVE_F, [hl]
    res FOLLOWER_REBUILD_F, [hl]
    ld a, -1
    ld [wFollowerObjectID], a
    ld hl, wFollowerFlags
    res FOLLOWER_ENABLED_F, [hl]
    jp InvalidateFollowerCache

PrepareFollowerForMap::
    call RemovePartyFollower
    xor a
    ld [wFollowerRetry], a
    ; Preserve an enclosing scene's hold only on a genuine same-map reload.
    ; Store map identity even while hidden, before callbacks run: the first
    ; scene on a map can hide and battle before reconciliation ever spawns it.
    ld a, [wMapGroup]
    ld hl, wFollowerMapGroup
    cp [hl]
    jr nz, .clear_hold
    ld a, [wMapNumber]
    ld hl, wFollowerMapNumber
    cp [hl]
    jr nz, .clear_hold
    ldh a, [hMapEntryMethod]
    cp MAPSETUP_RELOADMAP
    jr z, .remember
.clear_hold
    xor a
    ld [wFollowerScriptFlags], a
.remember
    ld a, [wMapGroup]
    ld [wFollowerMapGroup], a
    ld a, [wMapNumber]
    ld [wFollowerMapNumber], a
    ret

FollowerIsEligible:
; Carry = on-foot overworld with no explicit/automatic scene hold.
    ld a, [wFollowerScriptFlags]
    and a
    jr nz, .no
    ld a, [wBattleMode]
    and a
    jr nz, .no
    ld a, [wPlayerState]
    and a
    jr z, .on_foot
    cp PLAYER_RUN
    jr nz, .no
.on_foot
    ld a, [wLinkMode]
    and a
    jr nz, .no
    ; Ordinary dialogue/turning is safe. Native movement and battle entry hooks
    ; suspend before staged actions; explicit hidefollower covers longer holds.
    ld a, [wStateFlags]
    bit SCRIPTED_MOVEMENT_STATE_F, a
    jr nz, .no
    ld a, [wMapGroup]
    cp GROUP_TRADE_CENTER
    jr z, .no
    ld de, .restricted_maps
    call CheckFollowerMapList
    jr c, .no
    scf
    ret
.no
    and a
    ret
.restricted_maps
    map_id BATTLE_TOWER_BATTLE_ROOM
    map_id BATTLE_TOWER_ELEVATOR
    map_id BATTLE_TOWER_HALLWAY
    map_id BATTLE_TOWER_1F
    map_id HALL_OF_FAME
    db -1

CheckFollowerMapList:
; de = group/number pairs, $ff terminator. Carry on match.
    ld a, [de]
    inc de
    cp -1
    jr z, .no
    ld hl, wMapGroup
    cp [hl]
    ld a, [de]
    inc de
    jr nz, CheckFollowerMapList
    ld hl, wMapNumber
    cp [hl]
    jr nz, CheckFollowerMapList
    scf
    ret
.no
    and a
    ret

PokemonFollowPairAvailable:
    ld a, [wObjectFollow_Leader]
    cp -1
    jr z, .check_follower
    and a
    jr nz, .no
    call GetPokemonFollowerObject
    jr nc, .no
    ld hl, wObjectFollow_Follower
    cp [hl]
    jr nz, .no
    scf
    ret
.check_follower
    ld a, [wObjectFollow_Follower]
    cp -1
    jr nz, .no
    scf
    ret
.no
    and a
    ret

ReconcilePartyFollower::
    call UpdateFollowerScriptHold
    call FollowerIsEligible
    jp nc, RemovePartyFollower
    ; Avoid restarting the existing map's asynchronous palette interpolation.
    ld a, [wWeatherFlags]
    bit WEATHER_FADE_ACTIVE_F, a
    ret nz
    call PokemonFollowPairAvailable
    jp nc, RemovePartyFollower
    call SelectPartyFollower
    jp nc, RemovePartyFollower
    ld a, [wFollowerFlags]
    bit FOLLOWER_NO_CAPACITY_F, a
    jp nz, RemovePartyFollower

    ld a, [wMapGroup]
    ld hl, wFollowerMapGroup
    cp [hl]
    jr nz, .new_map
    ld a, [wMapNumber]
    ld hl, wFollowerMapNumber
    cp [hl]
    jr z, .same_map
.new_map
    call RemovePartyFollower
    ld a, [wMapGroup]
    ld [wFollowerMapGroup], a
    ld a, [wMapNumber]
    ld [wFollowerMapNumber], a
.same_map
    ld a, [wFollowerLifecycleFlags]
    bit FOLLOWER_REBUILD_F, a
    call nz, RemovePartyFollower
    ld a, [wFollowerCandidateIndex]
    ld [wFollowerPartyIndex], a
    ld a, [wFollowerFlags]
    bit FOLLOWER_READY_F, a
    jr z, .prepare_art
    ld a, [wFollowerCandidateSpecies]
    ld hl, wFollowerSpecies
    cp [hl]
    jr z, .check_colors
.prepare_art
    call RemovePartyFollower
    ld a, [wFollowerCandidateSpecies]
    call PrepareFollowerGraphics
    jr .new_colors
.check_colors
    ld a, [wFollowerCandidateDVs]
    ld hl, wFollowerDVs
    cp [hl]
    jr nz, .new_colors
    ld a, [wFollowerCandidateDVs + 1]
    ld hl, wFollowerDVs + 1
    cp [hl]
    jr nz, .new_colors
    ld a, [wFollowerCandidatePair]
    ld hl, wFollowerCustomPair
    cp [hl]
    jr nz, .new_colors
    ld a, [wFollowerFlags]
    bit FOLLOWER_ENABLED_F, a
    jr nz, .resources_ready
.new_colors
    ld a, [wFollowerCandidateDVs]
    ld [wFollowerDVs], a
    ld a, [wFollowerCandidateDVs + 1]
    ld [wFollowerDVs + 1], a
    ld a, [wFollowerCandidatePair]
    ld [wFollowerCustomPair], a
    ld hl, wFollowerFlags
    set FOLLOWER_ENABLED_F, [hl]
    call PrepareFollowerColors
    farcall LoadMapPals
    newfarcall ApplyPals
    ld a, TRUE
    ldh [hCGBPalUpdate], a
.resources_ready
    call GetPokemonFollowerObject
    jr nc, .absent
    ld a, [wObjectFollow_Follower]
    ld hl, wFollowerObjectID
    cp [hl]
    jp nz, RemovePartyFollower
    ; A stalled/teleported follower must not hold the five-byte queue indefinitely.
    ld hl, OBJECT_MAP_X
    add hl, bc
    ld a, [wPlayerMapX]
    sub [hl]
    add 3
    cp 7
    jp nc, RemovePartyFollower
    ld hl, OBJECT_MAP_Y
    add hl, bc
    ld a, [wPlayerMapY]
    sub [hl]
    add 3
    cp 7
    jp nc, RemovePartyFollower
    ret
.absent
    ; Native map reloads may have cleared the live pool without touching metadata.
    ld a, [wFollowerLifecycleFlags]
    bit FOLLOWER_LIVE_F, a
    jr z, .retry
    call RemovePartyFollower
    ret
.retry
    ld hl, wFollowerRetry
    ld a, [hl]
    and a
    jr z, .stationary
    dec [hl]
    ret
.stationary
    ld a, [wPlayerWalking]
    cp STANDING
    ret nz
    jp SpawnPartyFollower

FindFollowerSpawnPosition:
    ld a, [wPlayerMapX]
    ld d, a
    ld a, [wPlayerMapY]
    ld e, a
    ld a, [wPlayerDirection]
    and OW_RIGHT
    jr z, .behind_down
    cp OW_UP
    jr z, .behind_up
    cp OW_LEFT
    jr z, .behind_left
    dec d
    jr .check
.behind_down
    dec e
    jr .check
.behind_up
    inc e
    jr .check
.behind_left
    inc d
.check
    push de
    call GetCoordTileCollision
    call GetTilePermission
    and a ; LAND_TILE
    pop de
    jr nz, .overlap
    push de
    xor a
    ldh [hMapObjectIndex], a
    newfarcall IsNPCAtCoord
    pop de
    jr nc, .save
.overlap
    ; Doorways/walls need not have a walkable square behind the player.
    ; Starting on the player is safe: the native queue makes the next step emerge.
    ld a, [wPlayerMapX]
    ld d, a
    ld a, [wPlayerMapY]
    ld e, a
.save
    ld a, d
    ld [wFollowerSpawnX], a
    ld a, e
    ld [wFollowerSpawnY], a
    ret

SpawnPartyFollower::
    ld a, [wCurMapObjectEventCount]
    cp FOLLOWER_MAP_OBJECT
    ret nc
    ld a, [wMap17ObjectSprite]
    and a
    ret nz
    ; Leave one live slot free for effects/new NPCs; required allocations can
    ; additionally reclaim the follower if the pool subsequently becomes full.
    ld bc, wObject1Struct
    ld d, NUM_OBJECT_STRUCTS - 1
    ld e, 0
.count
    ld a, [bc]
    and a
    jr nz, .occupied
    inc e
.occupied
    ld hl, OBJECT_LENGTH
    add hl, bc
    ld b, h
    ld c, l
    dec d
    jr nz, .count
    ld a, e
    cp 2
    ret c
    call FindFollowerSpawnPosition
    ld a, FOLLOWER_MAP_OBJECT
    ld hl, .template
    call CopyPlayerObjectTemplate
    ld a, [wFollowerSpawnX]
    ld [wMap17ObjectXCoord], a
    ld a, [wFollowerSpawnY]
    ld [wMap17ObjectYCoord], a
    xor a
    ld [wObjectMasks + FOLLOWER_MAP_OBJECT], a
    ld a, FOLLOWER_MAP_OBJECT
    ldh [hMapObjectIndex], a
    call GetMapObject
    newfarcall CopyObjectStruct
    jr c, .failed
    ld a, [wMap17ObjectStructID]
    and a
    jr z, .failed
    cp NUM_OBJECT_STRUCTS
    jr nc, .failed
    ld [wFollowerObjectID], a
    call GetObjectStruct
    ld a, [bc]
    cp SPRITE_FOLLOWER
    jr nz, .failed
    ld hl, OBJECT_FLAGS1
    add hl, bc
    ld [hl], WONT_DELETE | NOCLIP_TILES | NOCLIP_OBJS | MOVE_ANYWHERE
    ld hl, OBJECT_FLAGS2
    add hl, bc
    ld [hl], LOW_PRIORITY
    ld a, [wPlayerDirection]
    and OW_RIGHT
    ld hl, OBJECT_DIRECTION
    add hl, bc
    ld [hl], a
    ld hl, OBJECT_FACING
    add hl, bc
    ld [hl], a
    ld hl, wFollowerLifecycleFlags
    set FOLLOWER_LIVE_F, [hl]
    ld b, PLAYER
    ld c, FOLLOWER_MAP_OBJECT
    newfarcall StartFollow
    ld a, [wObjectFollow_Leader]
    and a
    jr nz, .failed_live
    ld a, [wObjectFollow_Follower]
    ld hl, wFollowerObjectID
    cp [hl]
    jr nz, .failed_live
    ret
.failed_live
    jp RemovePartyFollower
.failed
    call ClearPokemonMapObject
    ld a, FOLLOWER_RETRY_TICKS
    ld [wFollowerRetry], a
    ret
.template
    object_event 0, 0, SPRITE_FOLLOWER, SPRITEMOVEDATA_FOLLOWING, 0, 0, -1, -1, PAL_NPC_FOLLOWER, OBJECTTYPE_SCRIPT, 0, 0, -1

YieldFollowerForAllocation::
; Carry = no slot released. Preserve allocator registers and object-index scratch.
    push bc
    push de
    push hl
    ldh a, [hMapObjectIndex]
    push af
    ldh a, [hObjectStructIndex]
    push af
    call GetPokemonFollowerObject
    jr nc, .none
    call RemovePartyFollower
    ld a, FOLLOWER_RETRY_TICKS
    ld [wFollowerRetry], a
    pop af
    ldh [hObjectStructIndex], a
    pop af
    ldh [hMapObjectIndex], a
    pop hl
    pop de
    pop bc
    and a
    ret
.none
    pop af
    ldh [hObjectStructIndex], a
    pop af
    ldh [hMapObjectIndex], a
    pop hl
    pop de
    pop bc
    scf
    ret

YieldFollowerForScriptFollow::
; b/c = script's map leader/follower. The Pokémon may only acquire PLAYER/17.
    ld a, b
    and a
    jr nz, .yield
    ld a, c
    cp FOLLOWER_MAP_OBJECT
    ret z
.yield
    jp SuspendFollowerForScene

FollowerPassableNPCAtCoord::
; Movement-only query: keep CheckFacingObject's interaction scan unchanged.
    ld hl, wFollowerLifecycleFlags
    set FOLLOWER_SKIP_COLLISION_F, [hl]
    newfarcall IsNPCAtCoord
    ld hl, wFollowerLifecycleFlags
    res FOLLOWER_SKIP_COLLISION_F, [hl]
    ret

GuardPokemonFollowerQueue::
; Preserve the movement command and all pointers; carry asks the caller to drop
; this command and rebuild later, rather than overflow the native five-byte queue.
    push af
    push bc
    push de
    push hl
    call GetPokemonFollowerObject
    jr nc, .ok
    ld hl, wObjectFollow_Follower
    cp [hl]
    jr nz, .ok
    ld a, [wFollowerMovementQueueLength]
    cp -1
    jr z, .ok
    cp FOLLOWER_QUEUE_SIZE - 1
    jr c, .ok
    ld hl, wFollowerLifecycleFlags
    set FOLLOWER_REBUILD_F, [hl]
    pop hl
    pop de
    pop bc
    pop af
    scf
    ret
.ok
    pop hl
    pop de
    pop bc
    pop af
    and a
    ret

FollowerInteractionScript::
    faceplayer
    readmem wFollowerSpecies
    cry 0
    waitsfx
    end
