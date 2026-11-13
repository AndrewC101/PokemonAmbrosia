SECTION "Ambient Pokemon behaviour", ROMX

DEF AMBIENT_PURSUIT_HOME_RANGE EQU 10

NormalizeAmbientPokemonChaseType::
	cp SPRITEMOVEDATA_MON_SWIM_CHASE
	jr nz, .relentless
	ld a, SPRITEMOVEDATA_MON_CHASE
	ret
.relentless
	cp SPRITEMOVEDATA_MON_SWIM_RELENTLESS_CHASE
	ret nz
	ld a, SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	ret

ChooseAmbientPokemonAction::
	push bc
	call .Choose
	pop bc
	ret

.Choose:
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	call NormalizeAmbientPokemonChaseType
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jp z, .Chase
	cp SPRITEMOVEDATA_MON_SWIM_MIMIC
	jr c, .land
	sub SPRITEMOVEDATA_MON_SWIM_MIMIC
	ld hl, .SwimmingBehaviours
	rst JumpTable
	ret
.land
	sub SPRITEMOVEDATA_MON_SCAN
	ld hl, .Behaviours
	rst JumpTable
	ret

.Behaviours:
	dw .Scan, .Watch, .Rest, .Patrol, .Skittish, .Curious, .Sleepy
	dw .Roam, .Territorial, .Mimic, .Playful, .Forage
	dw .Chase, .Hider, .Relocator, .Relocator, .Dash, .SleepWake

.SwimmingBehaviours:
	dw .Mimic, .Playful, .Territorial, .Skittish, .Forage, .Curious

.Scan:
	call .Facing
	ld hl, .NextFacing
	add l
	ld l, a
	jr nc, .scan_face
	inc h
.scan_face
	ld a, [hl]
	call .Face
	jr .Pause

.NextFacing:
	db LEFT, RIGHT, UP, DOWN

.Watch:
	call .PlayerDirection
	ld a, d
	cp 5
	jr nc, .Scan
	ld a, e
	call .Face
.Pause:
	ld a, $80 | 64
	ret

.Rest:
	call Random
	ldh a, [hRandomAdd]
	cp 25 percent
	jr c, .Scan
	ld a, $80 | 120
	ret

.Patrol:
	call .Facing
	or LEFT
	ret

.Skittish:
	call .PlayerDirection
	ld a, d
	cp 4
	jp nc, .Roam
	and a
	jr z, .Pause
	ld a, e
	xor 1
	ld e, a
	call Random
	ldh a, [hRandomAdd]
	cp 60 percent
	ld a, e
	ret c
	call .Rotate
	ld e, a
	call Random
	ldh a, [hRandomAdd]
	and 1
	xor e
	ret

.Curious:
	call Random
	ldh a, [hRandomAdd]
	cp 20 percent
	jp c, .RandomDirection
	call .PlayerDirection
	ld a, d
	cp 5
	jp nc, .Roam
	cp 3
	ld a, e
	ret nc
	ld a, d
	cp 2
	ld a, e
	jr c, .back_off
	call Random
	ldh a, [hRandomAdd]
	cp 25 percent
	ld a, e
	jr c, .look
	jp .Rotate
.back_off
	xor 1
	ret
.look
	call .Face
	jp .Pause

.Sleepy:
	call .PlayerDirection
	ld a, d
	cp 2
	jr nc, .doze
	ld a, e
	call .Face
	jr .Pause
.doze
	ld a, $80 | 120
	ret

.Roam:
	call Random
	ldh a, [hRandomAdd]
	cp 60 percent
	jp c, .Facing
.RandomDirection:
	call Random
	ldh a, [hRandomAdd]
	and 3
	ret

.Territorial:
	call .HomeDirection
	ld a, d
	cp 2
	ld a, e
	ret nc
	jp .RandomDirection

.HomeDirection:
	push bc
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	ld d, a
	inc hl
	ld a, e
	sub [hl]
	ld c, a
	call .Direction
	pop bc
	ret

.Mimic:
	call .PlayerDirection
	ld a, d
	cp 5
	jp nc, .Roam
	ld a, [wPlayerStruct + OBJECT_WALKING]
	cp STANDING
	jr z, .Roam
	and 3
	ret

.Playful:
	call Random
	ldh a, [hRandomAdd]
	cp 20 percent
	jp c, .RandomDirection
	call .PlayerDirection
	ld a, d
	cp 5
	jr nc, .Roam
	cp 2
	ld a, e
	jp c, .back_off
	jp .Rotate

.Forage:
	call Random
	ldh a, [hRandomAdd]
	cp 75 percent
	jp c, .Facing
	call .RandomDirection
	call .Face
	ld a, $80 | 96
	ret

.Rotate:
	ld hl, .NextFacing
	add l
	ld l, a
	jr nc, .rotated
	inc h
.rotated
	ld a, [hl]
	ret

.SlowSpin:
	call Random
	ldh a, [hRandomAdd]
	and 3
	call .Face
	call Random
	ldh a, [hRandomAdd]
	or $80
	ret

.Chase:
	call GetAmbientPokemonState
	cp 2
	jp z, .BriefWait
	cp 3
	jr z, .go_home
	cp 1
	jr z, .pursue
	ld a, [wMarkOfGod]
	and a
	jp nz, .SlowSpin
	call .PlayerDirection
	ld a, d
	cp 4
	jp nc, .SlowSpin
	call .Facing
	cp e
	jp nz, .SlowSpin
	call GetAmbientPokemonState
	ld [hl], 2
	jp .BriefWait
.pursue
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	call NormalizeAmbientPokemonChaseType
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jr z, .relentless
	call .HomeDirection
	ld a, d
	cp AMBIENT_PURSUIT_HOME_RANGE + 1
	jr nc, .give_up
	call .PlayerDirection
	ld a, d
	cp 8
	jr nc, .give_up
	ld a, e
	or STEP_WALK << 2
	jr .chase_step
.relentless
	call .PlayerDirection
	ld a, e
	or STEP_BIKE << 2
.chase_step
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set MOVE_ANYWHERE_F, [hl]
	set WONT_DELETE_F, [hl]
	ret
.give_up
	call GetAmbientPokemonState
	ld [hl], 3
.go_home
	call .HomeDirection
	ld a, d
	and a
	ld a, e
	jr z, .home
	or STEP_WALK << 2
	ret
.home
	call GetAmbientPokemonState
	ld [hl], 0
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res MOVE_ANYWHERE_F, [hl]
	res WONT_DELETE_F, [hl]
	jp .SlowSpin

.Hider:
	call GetAmbientPokemonState
	cp 1
	jr z, .revealed
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set INVISIBLE_F, [hl]
	call .PlayerDirection
	ld a, d
	cp 3
	jp nc, .BriefWait
	call GetAmbientPokemonState
	ld [hl], 2
	jp .BriefWait
.revealed
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res INVISIBLE_F, [hl]
	jp .Skittish

.Relocator:
	call GetAmbientPokemonState
	cp 1
	jp z, .Roam
	cp 2
	jp z, .BriefWait
	call .PlayerDirection
	ld a, d
	cp 4
	jp nc, .Roam
	call GetAmbientPokemonState
	ld [hl], 2
	jp .BriefWait

.Dash:
	call GetAmbientPokemonState
	and a
	jr nz, .dash_step
	ld [hl], 4
	push hl
	call .RandomDirection
	call .Face
	pop hl
.dash_step
	dec [hl]
	jp z, .recover
	call .Facing
	or STEP_BIKE << 2
	ret
.recover
	ld a, $80 | 96
	ret

.SleepWake:
	call GetAmbientPokemonState
	cp 1
	jp z, .Roam
	cp 2
	jp z, .BriefWait
	cp 4
	jp z, .BriefWait
	push af
	call .PlayerDirection
	pop af
	and a
	jr nz, .sleeping
	ld a, d
	cp 5
	jr nc, .asleep
	call GetAmbientPokemonState
	ld [hl], 2
	jp .BriefWait
.sleeping
	ld a, d
	cp 2
	jr nc, .asleep
	call GetAmbientPokemonState
	ld [hl], 4
	jp .BriefWait
.asleep
	ld a, $80 | 32
	ret

.BriefWait:
	ld a, $80 | 1
	ret

.Facing:
	ld hl, OBJECT_DIRECTION
	add hl, bc
	ld a, [hl]
	rrca
	rrca
	and 3
	ret

.Face:
	add a
	add a
	ld hl, OBJECT_DIRECTION
	add hl, bc
	ld [hl], a
	ret

.PlayerDirection:
	push bc
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [wPlayerMapX]
	sub [hl]
	ld d, a
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [wPlayerMapY]
	sub [hl]
	ld c, a
	call .Direction
	pop bc
	ret

.Direction:
	ld a, c
	call .Abs
	ld b, a
	ld a, d
	call .Abs
	cp b
	jr c, .vertical
	ld b, a
	bit 7, d
	ld e, RIGHT
	jr z, .direction_done
	ld e, LEFT
	jr .direction_done
.vertical
	bit 7, c
	ld e, DOWN
	jr z, .direction_done
	ld e, UP
.direction_done
	ld d, b
	ret

.Abs:
	bit 7, a
	ret z
	cpl
	inc a
	ret

GetAmbientPokemonState::
	push bc
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	call GetMapObject
	ld hl, MAPOBJECT_BEHAVIOUR_STATE
	add hl, bc
	ld a, [hl]
	pop bc
	ret

CheckAmbientPokemonEvents::
	ld bc, wObject1Struct
	ld d, NUM_OBJECT_STRUCTS - 1
.loop
	push de
	call .Check
	pop de
	ret c
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	dec d
	jr nz, .loop
.none
	xor a
	ret

.Check:
	ld a, [bc]
	and a
	ret z
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit FROZEN_F, [hl]
	jp nz, .no_event
	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jp nz, .no_event
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	call NormalizeAmbientPokemonChaseType
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jr z, .behaviour
	cp SPRITEMOVEDATA_MON_CHASE
	jp c, .no_event
	cp SPRITEMOVEDATA_MON_END
	jp nc, .no_event
.behaviour
	ld e, a
	call GetAmbientPokemonState
	cp 2
	jr z, .pending
	cp 4
	jr nz, .contact
	ld a, e
	cp SPRITEMOVEDATA_MON_SLEEP_WAKE
	jp nz, .no_event
	ld hl, AmbientWakeScript
	jp .claim
.contact
	cp 1
	jp nz, .no_event
	ld a, e
	cp SPRITEMOVEDATA_MON_CHASE
	jr z, .chase_contact
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jp nz, .no_event
.chase_contact
	ld a, [wMarkOfGod]
	and a
	jp nz, .no_event
	ld a, [wPlayerStruct + OBJECT_WALKING]
	cp STANDING
	jp nz, .no_event
	ld a, e
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jr z, .contact_position
	call ChooseAmbientPokemonAction.HomeDirection
	ld a, d
	cp AMBIENT_PURSUIT_HOME_RANGE + 1
	jp nc, .no_event
.contact_position
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [wPlayerMapX]
	sub [hl]
	call ChooseAmbientPokemonAction.Abs
	ld e, a
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [wPlayerMapY]
	sub [hl]
	call ChooseAmbientPokemonAction.Abs
	add e
	cp 1
	jp nz, .no_event
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	jp CallScript
.pending
	ld a, e
	cp SPRITEMOVEDATA_MON_CHASE
	jr z, .chase_notice
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jr nz, .other_reaction
.chase_notice
	ld a, [wMarkOfGod]
	and a
	jr z, .notice
	call GetAmbientPokemonState
	ld [hl], 0
	jp .no_event
.notice
	ld hl, AmbientNoticeScript
	jp .claim
.other_reaction
	ld hl, AmbientRevealScript
	cp SPRITEMOVEDATA_MON_HIDER
	jr z, .claim
	ld hl, AmbientSleepScript
	cp SPRITEMOVEDATA_MON_SLEEP_WAKE
	jr z, .claim
	ld hl, AmbientTeleportScript
	cp SPRITEMOVEDATA_MON_TELEPORT
	jr z, .claim
	ld hl, AmbientBurrowScript
	cp SPRITEMOVEDATA_MON_BURROW
	jp nz, .no_event
.claim
	push hl
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a
	pop hl
	ld a, BANK(AmbientNoticeScript)
	jp CallScript
.no_event
	xor a
	ret

AmbientNoticeScript:
	showemote EMOTE_SHOCK, LAST_TALKED, 20
	callasm ActivateAmbientPokemon
	end

AmbientRevealScript:
	callasm ActivateAmbientPokemon
	showemote EMOTE_SHOCK, LAST_TALKED, 20
	end

AmbientSleepScript:
	callasm SetAmbientPokemonSleeping
	showemote EMOTE_SLEEP, LAST_TALKED, 40
	end

AmbientWakeScript:
	showemote EMOTE_SHOCK, LAST_TALKED, 20
	callasm ActivateAmbientPokemon
	end

AmbientTeleportScript:
	applymovementlasttalked .Out
	callasm HideAmbientPokemon
	callasm RelocateAmbientPokemon
	callasm ShowAmbientPokemon
	applymovementlasttalked .In
	callasm ActivateAmbientPokemon
	end
.Out:
	teleport_from
	step_end
.In:
	teleport_to
	step_end

AmbientBurrowScript:
	applymovementlasttalked .Out
	callasm HideAmbientPokemon
	pause 16
	callasm RelocateAmbientPokemon
	callasm ShowAmbientPokemon
	applymovementlasttalked .In
	callasm ActivateAmbientPokemon
	end
.Out:
	step_dig 16
	step_end
.In:
	return_dig 16
	step_end

GetLastAmbientPokemon:
	ldh a, [hLastTalked]
	call GetMapObject
	ld a, [bc]
	jp GetObjectStruct

ActivateAmbientPokemon:
	call GetLastAmbientPokemon
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	call NormalizeAmbientPokemonChaseType
	cp SPRITEMOVEDATA_MON_CHASE
	jr z, .chase_activation
	cp SPRITEMOVEDATA_MON_RELENTLESS_CHASE
	jr nz, .activate
.chase_activation
	ld a, [wMarkOfGod]
	and a
	jr z, .activate
	call GetAmbientPokemonState
	ld [hl], 0
	ret
.activate
	call GetAmbientPokemonState
	ld [hl], 1

ShowAmbientPokemon:
	call GetLastAmbientPokemon
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res INVISIBLE_F, [hl]
	ret

SetAmbientPokemonSleeping:
	call GetLastAmbientPokemon
	call GetAmbientPokemonState
	ld [hl], 3
	ret

HideAmbientPokemon:
	call GetLastAmbientPokemon
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set INVISIBLE_F, [hl]
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	ld de, SFX_WARP_TO
	cp SPRITEMOVEDATA_MON_BURROW
	jr nz, .sound
	ld de, SFX_SANDSTORM
.sound
	jp PlaySFX

RelocateAmbientPokemon:
	call GetLastAmbientPokemon
	ld a, 32
.try
	push af
	push bc
	ld a, 5
	call RandomRange
	ld hl, OBJECT_INIT_X
	add hl, bc
	add [hl]
	sub 2
	ld d, a
	push de
	ld a, 5
	call RandomRange
	ld hl, OBJECT_INIT_Y
	add hl, bc
	add [hl]
	sub 2
	pop de
	ld e, a
	call .Candidate
	pop bc
	jr nc, .found
	pop af
	dec a
	jr nz, .try
	ret
.found
	pop af
	push de
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	swap a
	and $f0
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, OBJECT_LAST_MAP_Y
	add hl, bc
	ld a, e
	sub [hl]
	swap a
	and $f0
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld [hl], d
	inc hl
	ld [hl], e
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld [hl], d
	inc hl
	ld [hl], e
	push bc
	call GetCoordTileCollision
	pop bc
	ld hl, OBJECT_TILE_COLLISION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_LAST_TILE
	add hl, bc
	ld [hl], a
	pop de
	newfarjp SetTallGrassFlags

.Candidate:
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	call ChooseAmbientPokemonAction.Abs
	ld h, a
	ld l, 1
	push hl
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	pop hl
	cp SPRITEMOVEDATA_MON_TELEPORT
	jr nz, .distance
	inc l
.distance
	ld a, h
	cp l
	jr nc, .ground
	push hl
	ld hl, OBJECT_LAST_MAP_Y
	add hl, bc
	ld a, e
	sub [hl]
	call ChooseAmbientPokemonAction.Abs
	pop hl
	cp l
	jr c, .blocked
.ground
	push bc
	push de
	call GetCoordTileCollision
	pop de
	pop bc
	cp COLL_FLOOR
	jr z, .occupancy
	cp COLL_TALL_GRASS
	jr z, .occupancy
	cp COLL_LONG_GRASS
	jr nz, .blocked
.occupancy
	push bc
	ld bc, wPlayerStruct
	ld a, NUM_OBJECT_STRUCTS
.objects
	push af
	ld a, [bc]
	and a
	jr z, .next
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .last
	inc hl
	ld a, e
	cp [hl]
	jr z, .occupied
.last
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .occupied
.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .objects
	pop bc
	and a
	ret
.occupied
	pop af
	pop bc
.blocked
	scf
	ret
