GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret

ReadTrainerParty:
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH
	xor a
	call ByteFill

	ld a, [wOtherTrainerClass]

	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
    add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	call GetNextTrainerDataByte
	cp -1
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name

	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a
	ld d, h
	ld e, l
	call ReadTrainerPartyPieces

.done
	jp ComputeTrainerReward

ReadTrainerPartyPieces:
	ld h, d
	ld l, e

.loop
; end?
	call GetNextTrainerDataByte
	cp -1
	ret z

; level
	ld [wCurPartyLevel], a
	and a
	jr nz, .notZero
	ld a, $FF ; level 0 is treated as 255
	ld [wCurPartyLevel], a
.notZero

; species
	call GetNextTrainerDataByte
	ld [wCurPartySpecies], a

; add to party
	ld a, OTPARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl

; nickname?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_NICKNAME_F, a
	jr z, .no_nickname

	call GetNextTrainerDataByte
	cp "@"
	jr z, .no_nickname


	push de

	ld de, wStringBuffer2
	ld [de], a
	inc de
.copy_nickname
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy_nickname

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl

	pop de
.no_nickname

; stat exp
    push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1StatExp
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl ; de is now wOTPartyMon1StatExp

; DevNote - stat exp, trainers to have a default amount of stat exp based on badges
; 0 badges = 0
; FALKNER badge = $1000 = 4096 stat exp = 16/64 extra stat at lvl 100
; WHITNEY badge = $4000 = 16384 stat exp = 32/64 extra stat at lvl 100
; CHUCK badge = $9000 = 36864 stat exp = 48/64 extra stat at lvl 100
; CLAIR badge = $FFFF = 65535 stat exp = 64/64 extra stat at lvl 100
    push hl

    ; boss battles have max stat exp
    ld a, [wBattleType]
    cp BATTLETYPE_BOSS_BATTLE
    jr z, .fullStatExp
    cp BATTLETYPE_BATTLE_FRONTIER
    jr z, .fullStatExp
    cp BATTLETYPE_WEAK_BATTLE
    jp z, .zeroStatExp

    ; trainer classes which always have max stat exp
	ld a, [wTrainerClass]
	cp LORD_OAK
	jr z, .fullStatExp
	cp RED
	jr z, .fullStatExp
	cp BLUE
	jr z, .fullStatExp
	cp CHAMPION
	jr z, .fullStatExp
	cp INVADER
	jr z, .fullStatExp
	cp CYNTHIA
	jr z, .fullStatExp
	cp STEVEN
	jr z, .fullStatExp
	cp LEON
	jr z, .fullStatExp
	cp ADAM
	jr z, .fullStatExp
	cp ROLE_PLAYER_NORMAL
	jr z, .fullStatExp
	cp ROLE_PLAYER_SHINY
	jr z, .fullStatExp

	; decide stat exp based on badges
    ld hl, wJohtoBadges
    bit RISINGBADGE, [hl]
	jr nz, .fullStatExp

    bit STORMBADGE, [hl]
    jr nz, .highStatExp

    bit PLAINBADGE, [hl]
    jr nz, .mediumStatExp

    bit ZEPHYRBADGE, [hl]
    jp nz, .lowStatExp

    pop hl
    jp .no_stat_exp

.fullStatExp
rept 6
    ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
endr
	pop hl
	jp .no_stat_exp

.highStatExp
rept 5
    ld a, $90
	ld [de], a
	inc de
	ld a, $00
	ld [de], a
	inc de
endr
	pop hl
	jp .no_stat_exp

.mediumStatExp
rept 5
    ld a, $40
	ld [de], a
	inc de
	ld a, $00
	ld [de], a
	inc de
endr
	pop hl
	jr .no_stat_exp

.lowStatExp
rept 5
    ld a, $10
	ld [de], a
	inc de
	ld a, $00
	ld [de], a
	inc de
endr
	pop hl
	jr .no_stat_exp

.zeroStatExp
rept 5
    xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
endr
	pop hl

.no_stat_exp

; item?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jr z, .no_item

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	ld [de], a
.no_item

; moves?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_MOVES_F, a
	jr z, .no_moves

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

    push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
.no_moves

; Custom DVs and state exp affect stats,
; so recalculate them after TryAddMonToParty
	;ld a, [wOtherTrainerType]
	;and TRAINERTYPE_DVS | TRAINERTYPE_STAT_EXP
	;jr z, .no_stat_recalc

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1MaxHP
	call GetPartyLocation
	ld d, h
	ld e, l

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1StatExp - 1
	call GetPartyLocation

; recalculate stats
	ld b, TRUE
	push de
	predef CalcMonStats
	pop hl

; copy max HP to current HP
	inc hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld [hl], c
	dec hl
	ld [hl], b

	pop hl
.no_stat_recalc
	jp .loop

ReadPlayerPartyAsTrainerParty:
	ld a, [wLinkMode]
	and a
	ret nz

    ; clear OT party count
	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

    ; clear OT party mons
	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH
	xor a
	call ByteFill

; now get the trainer class and id so we can get the trainer name
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
    add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	call GetNextTrainerDataByte
	cp -1
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name

; here a is the trainer type eg TRAINERTYPE_ITEM_MOVES
	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a

; hl is the trainer data from parties, copy it to de
	ld d, h
	ld e, l
	call ReadPlayerPartyAsTrainerPartyPieces

.done
	jp ComputeTrainerReward

ReadPlayerPartyAsTrainerPartyPieces:
; copy de back to hl, why?
	ld h, d
	ld l, e

	ld a, [wPartyCount]
	ld c, a
	ld b, 1

.loop
; end?
; are we at the end of the trainer data, ret if so
    push bc

; level
    ld hl, wPartyMon1Level
    pop bc
    call IncrementToCurrentMon
    push bc
	ld a, [hl]
    ld [wCurPartyLevel], a

; species
	ld hl, wPartyMon1Species
    pop bc
    call IncrementToCurrentMon
    push bc
	ld a, [hl]
	ld [wCurPartySpecies], a

; add to party
	ld a, OTPARTYMON
	ld [wMonType], a
	predef TryAddMonToParty

; dvs and stat exp
    pop bc
    ld a, b
    cp 1
    push bc
    jp z, .firstMon
    cp 2
    jp z, .secondMon
    cp 3
    jp z, .thirdMon
    cp 4
    jp z, .forthMon
    cp 5
    jp z, .fifthMon
    cp 6
    jp z, .sixthMon

.firstMon
    ld a, [wPartyMon1DVs]
    ld [wOTPartyMon1DVs], a
    ld a, [wPartyMon1DVs + 1]
    ld [wOTPartyMon1DVs + 1], a

    ld a, [wPartyMon1HPExp]
    ld [wOTPartyMon1HPExp], a
    ld a, [wPartyMon1HPExp + 1]
    ld [wOTPartyMon1HPExp + 1], a
    ld a, [wPartyMon1AtkExp]
    ld [wOTPartyMon1AtkExp], a
    ld a, [wPartyMon1AtkExp + 1]
    ld [wOTPartyMon1AtkExp + 1], a
    ld a, [wPartyMon1DefExp]
    ld [wOTPartyMon1DefExp], a
    ld a, [wPartyMon1DefExp + 1]
    ld [wOTPartyMon1DefExp + 1], a
    ld a, [wPartyMon1SpdExp]
    ld [wOTPartyMon1SpdExp], a
    ld a, [wPartyMon1SpdExp + 1]
    ld [wOTPartyMon1SpdExp + 1], a
    ld a, [wPartyMon1SpcExp]
    ld [wOTPartyMon1SpcExp], a
    ld a, [wPartyMon1SpcExp + 1]
    ld [wOTPartyMon1SpcExp + 1], a
    jp .recalc

.secondMon
    ld a, [wPartyMon2DVs]
    ld [wOTPartyMon2DVs], a
    ld a, [wPartyMon2DVs + 1]
    ld [wOTPartyMon2DVs + 1], a

    ld a, [wPartyMon2HPExp]
    ld [wOTPartyMon2HPExp], a
    ld a, [wPartyMon2HPExp + 1]
    ld [wOTPartyMon2HPExp + 1], a
    ld a, [wPartyMon2AtkExp]
    ld [wOTPartyMon2AtkExp], a
    ld a, [wPartyMon2AtkExp + 1]
    ld [wOTPartyMon2AtkExp + 1], a
    ld a, [wPartyMon2DefExp]
    ld [wOTPartyMon2DefExp], a
    ld a, [wPartyMon2DefExp + 1]
    ld [wOTPartyMon2DefExp + 1], a
    ld a, [wPartyMon2SpdExp]
    ld [wOTPartyMon2SpdExp], a
    ld a, [wPartyMon2SpdExp + 1]
    ld [wOTPartyMon2SpdExp + 1], a
    ld a, [wPartyMon2SpcExp]
    ld [wOTPartyMon2SpcExp], a
    ld a, [wPartyMon2SpcExp + 1]
    ld [wOTPartyMon2SpcExp + 1], a
    jp .recalc

.thirdMon
    ld a, [wPartyMon3DVs]
    ld [wOTPartyMon3DVs], a
    ld a, [wPartyMon3DVs + 1]
    ld [wOTPartyMon3DVs + 1], a

    ld a, [wPartyMon3HPExp]
    ld [wOTPartyMon3HPExp], a
    ld a, [wPartyMon3HPExp + 1]
    ld [wOTPartyMon3HPExp + 1], a
    ld a, [wPartyMon3AtkExp]
    ld [wOTPartyMon3AtkExp], a
    ld a, [wPartyMon3AtkExp + 1]
    ld [wOTPartyMon3AtkExp + 1], a
    ld a, [wPartyMon3DefExp]
    ld [wOTPartyMon3DefExp], a
    ld a, [wPartyMon3DefExp + 1]
    ld [wOTPartyMon3DefExp + 1], a
    ld a, [wPartyMon3SpdExp]
    ld [wOTPartyMon3SpdExp], a
    ld a, [wPartyMon3SpdExp + 1]
    ld [wOTPartyMon3SpdExp + 1], a
    ld a, [wPartyMon3SpcExp]
    ld [wOTPartyMon3SpcExp], a
    ld a, [wPartyMon3SpcExp + 1]
    ld [wOTPartyMon3SpcExp + 1], a
    jp .recalc

.forthMon
    ld a, [wPartyMon4DVs]
    ld [wOTPartyMon4DVs], a
    ld a, [wPartyMon4DVs + 1]
    ld [wOTPartyMon4DVs + 1], a

    ld a, [wPartyMon4HPExp]
    ld [wOTPartyMon4HPExp], a
    ld a, [wPartyMon4HPExp + 1]
    ld [wOTPartyMon4HPExp + 1], a
    ld a, [wPartyMon4AtkExp]
    ld [wOTPartyMon4AtkExp], a
    ld a, [wPartyMon4AtkExp + 1]
    ld [wOTPartyMon4AtkExp + 1], a
    ld a, [wPartyMon4DefExp]
    ld [wOTPartyMon4DefExp], a
    ld a, [wPartyMon4DefExp + 1]
    ld [wOTPartyMon4DefExp + 1], a
    ld a, [wPartyMon4SpdExp]
    ld [wOTPartyMon4SpdExp], a
    ld a, [wPartyMon4SpdExp + 1]
    ld [wOTPartyMon4SpdExp + 1], a
    ld a, [wPartyMon4SpcExp]
    ld [wOTPartyMon4SpcExp], a
    ld a, [wPartyMon4SpcExp + 1]
    ld [wOTPartyMon4SpcExp + 1], a
    jp .recalc

.fifthMon
    ld a, [wPartyMon5DVs]
    ld [wOTPartyMon5DVs], a
    ld a, [wPartyMon5DVs + 1]
    ld [wOTPartyMon5DVs + 1], a

    ld a, [wPartyMon5HPExp]
    ld [wOTPartyMon5HPExp], a
    ld a, [wPartyMon5HPExp + 1]
    ld [wOTPartyMon5HPExp + 1], a
    ld a, [wPartyMon5AtkExp]
    ld [wOTPartyMon5AtkExp], a
    ld a, [wPartyMon5AtkExp + 1]
    ld [wOTPartyMon5AtkExp + 1], a
    ld a, [wPartyMon5DefExp]
    ld [wOTPartyMon5DefExp], a
    ld a, [wPartyMon5DefExp + 1]
    ld [wOTPartyMon5DefExp + 1], a
    ld a, [wPartyMon5SpdExp]
    ld [wOTPartyMon5SpdExp], a
    ld a, [wPartyMon5SpdExp + 1]
    ld [wOTPartyMon5SpdExp + 1], a
    ld a, [wPartyMon5SpcExp]
    ld [wOTPartyMon5SpcExp], a
    ld a, [wPartyMon5SpcExp + 1]
    ld [wOTPartyMon5SpcExp + 1], a
    jp .recalc

.sixthMon
    ld a, [wPartyMon6DVs]
    ld [wOTPartyMon6DVs], a
    ld a, [wPartyMon6DVs + 1]
    ld [wOTPartyMon6DVs + 1], a

    ld a, [wPartyMon6HPExp]
    ld [wOTPartyMon6HPExp], a
    ld a, [wPartyMon6HPExp + 1]
    ld [wOTPartyMon6HPExp + 1], a
    ld a, [wPartyMon6AtkExp]
    ld [wOTPartyMon6AtkExp], a
    ld a, [wPartyMon6AtkExp + 1]
    ld [wOTPartyMon6AtkExp + 1], a
    ld a, [wPartyMon6DefExp]
    ld [wOTPartyMon6DefExp], a
    ld a, [wPartyMon6DefExp + 1]
    ld [wOTPartyMon6DefExp + 1], a
    ld a, [wPartyMon6SpdExp]
    ld [wOTPartyMon6SpdExp], a
    ld a, [wPartyMon6SpdExp + 1]
    ld [wOTPartyMon6SpdExp + 1], a
    ld a, [wPartyMon6SpcExp]
    ld [wOTPartyMon6SpcExp], a
    ld a, [wPartyMon6SpcExp + 1]
    ld [wOTPartyMon6SpcExp + 1], a

.recalc
; Custom DVs and state exp affect stats,
; so recalculate them after TryAddMonToParty
	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1MaxHP
	call GetPartyLocation
	ld d, h
	ld e, l

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1StatExp - 1
	call GetPartyLocation

; recalculate stats
	ld b, TRUE
	push de
	predef CalcMonStats
	pop hl

; copy max HP to current HP
	inc hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld [hl], c
	dec hl
	ld [hl], b
	pop hl
.no_stat_recalc

    pop bc
    inc b
	dec c
    jp nz, .loop

    ; items
    ld a, [wPartyMon1Item]
    ld [wOTPartyMon1Item], a
    ld a, [wPartyMon2Item]
    ld [wOTPartyMon2Item], a
    ld a, [wPartyMon3Item]
    ld [wOTPartyMon3Item], a
    ld a, [wPartyMon4Item]
    ld [wOTPartyMon4Item], a
    ld a, [wPartyMon5Item]
    ld [wOTPartyMon5Item], a
    ld a, [wPartyMon6Item]
    ld [wOTPartyMon6Item], a

    ; moves
    ld a, [wPartyMon1Moves]
    ld [wOTPartyMon1Moves], a
    ld a, [wPartyMon1Moves + 1]
    ld [wOTPartyMon1Moves + 1], a
    ld a, [wPartyMon1Moves + 2]
    ld [wOTPartyMon1Moves + 2], a
    ld a, [wPartyMon1Moves + 3]
    ld [wOTPartyMon1Moves + 3], a

    ld a, [wPartyMon2Moves]
    ld [wOTPartyMon2Moves], a
    ld a, [wPartyMon2Moves + 1]
    ld [wOTPartyMon2Moves + 1], a
    ld a, [wPartyMon2Moves + 2]
    ld [wOTPartyMon2Moves + 2], a
    ld a, [wPartyMon2Moves + 3]
    ld [wOTPartyMon2Moves + 3], a

    ld a, [wPartyMon3Moves]
    ld [wOTPartyMon3Moves], a
    ld a, [wPartyMon3Moves + 1]
    ld [wOTPartyMon3Moves + 1], a
    ld a, [wPartyMon3Moves + 2]
    ld [wOTPartyMon3Moves + 2], a
    ld a, [wPartyMon3Moves + 3]
    ld [wOTPartyMon3Moves + 3], a

    ld a, [wPartyMon4Moves]
    ld [wOTPartyMon4Moves], a
    ld a, [wPartyMon4Moves + 1]
    ld [wOTPartyMon4Moves + 1], a
    ld a, [wPartyMon4Moves + 2]
    ld [wOTPartyMon4Moves + 2], a
    ld a, [wPartyMon4Moves + 3]
    ld [wOTPartyMon4Moves + 3], a

    ld a, [wPartyMon5Moves]
    ld [wOTPartyMon5Moves], a
    ld a, [wPartyMon5Moves + 1]
    ld [wOTPartyMon5Moves + 1], a
    ld a, [wPartyMon5Moves + 2]
    ld [wOTPartyMon5Moves + 2], a
    ld a, [wPartyMon5Moves + 3]
    ld [wOTPartyMon5Moves + 3], a

    ld a, [wPartyMon6Moves]
    ld [wOTPartyMon6Moves], a
    ld a, [wPartyMon6Moves + 1]
    ld [wOTPartyMon6Moves + 1], a
    ld a, [wPartyMon6Moves + 2]
    ld [wOTPartyMon6Moves + 2], a
    ld a, [wPartyMon6Moves + 3]
    ld [wOTPartyMon6Moves + 3], a

    ; PP
    ld a, [wPartyMon1PP]
    ld [wOTPartyMon1PP], a
    ld a, [wPartyMon1PP + 1]
    ld [wOTPartyMon1PP + 1], a
    ld a, [wPartyMon1PP + 2]
    ld [wOTPartyMon1PP + 2], a
    ld a, [wPartyMon1PP + 3]
    ld [wOTPartyMon1PP + 3], a

    ld a, [wPartyMon2PP]
    ld [wOTPartyMon2PP], a
    ld a, [wPartyMon2PP + 1]
    ld [wOTPartyMon2PP + 1], a
    ld a, [wPartyMon2PP + 2]
    ld [wOTPartyMon2PP + 2], a
    ld a, [wPartyMon2PP + 3]
    ld [wOTPartyMon2PP + 3], a

    ld a, [wPartyMon3PP]
    ld [wOTPartyMon3PP], a
    ld a, [wPartyMon3PP + 1]
    ld [wOTPartyMon3PP + 1], a
    ld a, [wPartyMon3PP + 2]
    ld [wOTPartyMon3PP + 2], a
    ld a, [wPartyMon3PP + 3]
    ld [wOTPartyMon3PP + 3], a

    ld a, [wPartyMon4PP]
    ld [wOTPartyMon4PP], a
    ld a, [wPartyMon4PP + 1]
    ld [wOTPartyMon4PP + 1], a
    ld a, [wPartyMon4PP + 2]
    ld [wOTPartyMon4PP + 2], a
    ld a, [wPartyMon4PP + 3]
    ld [wOTPartyMon4PP + 3], a

    ld a, [wPartyMon5PP]
    ld [wOTPartyMon5PP], a
    ld a, [wPartyMon5PP + 1]
    ld [wOTPartyMon5PP + 1], a
    ld a, [wPartyMon5PP + 2]
    ld [wOTPartyMon5PP + 2], a
    ld a, [wPartyMon5PP + 3]
    ld [wOTPartyMon5PP + 3], a

    ld a, [wPartyMon6PP]
    ld [wOTPartyMon6PP], a
    ld a, [wPartyMon6PP + 1]
    ld [wOTPartyMon6PP + 1], a
    ld a, [wPartyMon6PP + 2]
    ld [wOTPartyMon6PP + 2], a
    ld a, [wPartyMon6PP + 3]
    ld [wOTPartyMon6PP + 3], a

    ; nickname
    ld a, [wPartyMon1Nickname]
    and a
    jr z, .secondNick
    ld [wOTPartyMon1Nickname], a
    ld a, [wPartyMon1Nickname + 1]
    ld [wOTPartyMon1Nickname + 1], a
    ld a, [wPartyMon1Nickname + 2]
    ld [wOTPartyMon1Nickname + 2], a
    ld a, [wPartyMon1Nickname + 3]
    ld [wOTPartyMon1Nickname + 3], a
    ld a, [wPartyMon1Nickname + 4]
    ld [wOTPartyMon1Nickname + 4], a
    ld a, [wPartyMon1Nickname + 5]
    ld [wOTPartyMon1Nickname + 5], a
    ld a, [wPartyMon1Nickname + 6]
    ld [wOTPartyMon1Nickname + 6], a
    ld a, [wPartyMon1Nickname + 7]
    ld [wOTPartyMon1Nickname + 7], a
    ld a, [wPartyMon1Nickname + 8]
    ld [wOTPartyMon1Nickname + 8], a
    ld a, [wPartyMon1Nickname + 9]
    ld [wOTPartyMon1Nickname + 9], a
    ld a, [wPartyMon1Nickname + 10]
    ld [wOTPartyMon1Nickname + 10], a

.secondNick
    ld a, [wPartyMon2Nickname]
    and a
    jr z, .thirdNick
    ld [wOTPartyMon2Nickname], a
    ld a, [wPartyMon2Nickname + 1]
    ld [wOTPartyMon2Nickname + 1], a
    ld a, [wPartyMon2Nickname + 2]
    ld [wOTPartyMon2Nickname + 2], a
    ld a, [wPartyMon2Nickname + 3]
    ld [wOTPartyMon2Nickname + 3], a
    ld a, [wPartyMon2Nickname + 4]
    ld [wOTPartyMon2Nickname + 4], a
    ld a, [wPartyMon2Nickname + 5]
    ld [wOTPartyMon2Nickname + 5], a
    ld a, [wPartyMon2Nickname + 6]
    ld [wOTPartyMon2Nickname + 6], a
    ld a, [wPartyMon2Nickname + 7]
    ld [wOTPartyMon2Nickname + 7], a
    ld a, [wPartyMon2Nickname + 8]
    ld [wOTPartyMon2Nickname + 8], a
    ld a, [wPartyMon2Nickname + 9]
    ld [wOTPartyMon2Nickname + 9], a
    ld a, [wPartyMon2Nickname + 10]
    ld [wOTPartyMon2Nickname + 10], a

.thirdNick
    ld a, [wPartyMon3Nickname]
    and a
    jr z, .forthNick
    ld [wOTPartyMon3Nickname], a
    ld a, [wPartyMon3Nickname + 1]
    ld [wOTPartyMon3Nickname + 1], a
    ld a, [wPartyMon3Nickname + 2]
    ld [wOTPartyMon3Nickname + 2], a
    ld a, [wPartyMon3Nickname + 3]
    ld [wOTPartyMon3Nickname + 3], a
    ld a, [wPartyMon3Nickname + 4]
    ld [wOTPartyMon3Nickname + 4], a
    ld a, [wPartyMon3Nickname + 5]
    ld [wOTPartyMon3Nickname + 5], a
    ld a, [wPartyMon3Nickname + 6]
    ld [wOTPartyMon3Nickname + 6], a
    ld a, [wPartyMon3Nickname + 7]
    ld [wOTPartyMon3Nickname + 7], a
    ld a, [wPartyMon3Nickname + 8]
    ld [wOTPartyMon3Nickname + 8], a
    ld a, [wPartyMon3Nickname + 9]
    ld [wOTPartyMon3Nickname + 9], a
    ld a, [wPartyMon3Nickname + 10]
    ld [wOTPartyMon3Nickname + 10], a

.forthNick
    ld a, [wPartyMon4Nickname]
    and a
    jr z, .fifthNick
    ld [wOTPartyMon4Nickname], a
    ld a, [wPartyMon4Nickname + 1]
    ld [wOTPartyMon4Nickname + 1], a
    ld a, [wPartyMon4Nickname + 2]
    ld [wOTPartyMon4Nickname + 2], a
    ld a, [wPartyMon4Nickname + 3]
    ld [wOTPartyMon4Nickname + 3], a
    ld a, [wPartyMon4Nickname + 4]
    ld [wOTPartyMon4Nickname + 4], a
    ld a, [wPartyMon4Nickname + 5]
    ld [wOTPartyMon4Nickname + 5], a
    ld a, [wPartyMon4Nickname + 6]
    ld [wOTPartyMon4Nickname + 6], a
    ld a, [wPartyMon4Nickname + 7]
    ld [wOTPartyMon4Nickname + 7], a
    ld a, [wPartyMon4Nickname + 8]
    ld [wOTPartyMon4Nickname + 8], a
    ld a, [wPartyMon4Nickname + 9]
    ld [wOTPartyMon4Nickname + 9], a
    ld a, [wPartyMon4Nickname + 10]
    ld [wOTPartyMon4Nickname + 10], a

.fifthNick
    ld a, [wPartyMon5Nickname]
    and a
    jr z, .sixthNick
    ld [wOTPartyMon5Nickname], a
    ld a, [wPartyMon5Nickname + 1]
    ld [wOTPartyMon5Nickname + 1], a
    ld a, [wPartyMon5Nickname + 2]
    ld [wOTPartyMon5Nickname + 2], a
    ld a, [wPartyMon5Nickname + 3]
    ld [wOTPartyMon5Nickname + 3], a
    ld a, [wPartyMon5Nickname + 4]
    ld [wOTPartyMon5Nickname + 4], a
    ld a, [wPartyMon5Nickname + 5]
    ld [wOTPartyMon5Nickname + 5], a
    ld a, [wPartyMon5Nickname + 6]
    ld [wOTPartyMon5Nickname + 6], a
    ld a, [wPartyMon5Nickname + 7]
    ld [wOTPartyMon5Nickname + 7], a
    ld a, [wPartyMon5Nickname + 8]
    ld [wOTPartyMon5Nickname + 8], a
    ld a, [wPartyMon5Nickname + 9]
    ld [wOTPartyMon5Nickname + 9], a
    ld a, [wPartyMon5Nickname + 10]
    ld [wOTPartyMon5Nickname + 10], a

.sixthNick
    ld a, [wPartyMon6Nickname]
    and a
    ret z
    ld [wOTPartyMon6Nickname], a
    ld a, [wPartyMon6Nickname + 1]
    ld [wOTPartyMon6Nickname + 1], a
    ld a, [wPartyMon6Nickname + 2]
    ld [wOTPartyMon6Nickname + 2], a
    ld a, [wPartyMon6Nickname + 3]
    ld [wOTPartyMon6Nickname + 3], a
    ld a, [wPartyMon6Nickname + 4]
    ld [wOTPartyMon6Nickname + 4], a
    ld a, [wPartyMon6Nickname + 5]
    ld [wOTPartyMon6Nickname + 5], a
    ld a, [wPartyMon6Nickname + 6]
    ld [wOTPartyMon6Nickname + 6], a
    ld a, [wPartyMon6Nickname + 7]
    ld [wOTPartyMon6Nickname + 7], a
    ld a, [wPartyMon6Nickname + 8]
    ld [wOTPartyMon6Nickname + 8], a
    ld a, [wPartyMon6Nickname + 9]
    ld [wOTPartyMon6Nickname + 9], a
    ld a, [wPartyMon6Nickname + 10]
    ld [wOTPartyMon6Nickname + 10], a

    ret

IncrementToCurrentMon:
    ld a, b
.incrementLoop
    dec a
    jr z, .incrementDone
rept 48
    inc hl
endr
    jr .incrementLoop
.incrementDone
    ret

IncrementMovesToCurrentMon:
    ld a, b
.incrementLoop
    dec a
    jr z, .incrementDone
    inc hl
    inc hl
    inc hl
    inc hl
    jr .incrementLoop
.incrementDone
    ret

OverridePlayerParty:
    call ReadTrainerParty
    call ReadCopyOfTrainerParty
    ret

ReadCopyOfTrainerParty:
    xor a
    ld [wPartyCount], a

    ld a, [wOTPartyCount]
    ld b, a

    ; mon
    push bc
    ld a, [wOTPartyMon1Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon1Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	pop bc
	dec b
	jp z, .items

    push bc
    ld a, [wOTPartyMon2Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon2Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	pop bc
	dec b
	jr z, .items

    push bc
    ld a, [wOTPartyMon3Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon3Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	pop bc
	dec b
	jr z, .items

    push bc
    ld a, [wOTPartyMon4Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon4Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	pop bc
	dec b
	jr z, .items

    push bc
    ld a, [wOTPartyMon5Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon5Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	pop bc
	dec b
	jr z, .items

    ld a, [wOTPartyMon6Species]
    ld [wCurPartySpecies], a
    ld a, [wOTPartyMon6Level]
    ld [wCurPartyLevel], a
	ld a, PARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl

.items
    ; items
    ld a, [wOTPartyMon1Item]
    ld [wPartyMon1Item], a
    ld a, [wOTPartyMon2Item]
    ld [wPartyMon2Item], a
    ld a, [wOTPartyMon3Item]
    ld [wPartyMon3Item], a
    ld a, [wOTPartyMon4Item]
    ld [wPartyMon4Item], a
    ld a, [wOTPartyMon5Item]
    ld [wPartyMon5Item], a
    ld a, [wOTPartyMon6Item]
    ld [wPartyMon6Item], a

    ; dvs
    push bc
    farcall GetTrainerDVs
    ld a, b
    ld [wPartyMon1DVs], a
    ld [wPartyMon2DVs], a
    ld [wPartyMon3DVs], a
    ld [wPartyMon4DVs], a
    ld [wPartyMon5DVs], a
    ld [wPartyMon6DVs], a
    ld a, c
    ld [wPartyMon1DVs + 1], a
    ld [wPartyMon2DVs + 1], a
    ld [wPartyMon3DVs + 1], a
    ld [wPartyMon4DVs + 1], a
    ld [wPartyMon5DVs + 1], a
    ld [wPartyMon6DVs + 1], a
    pop bc

    ; stat exp
    ld a, [wOTPartyMon1HPExp]
    ld [wPartyMon1HPExp], a
    ld a, [wOTPartyMon1HPExp + 1]
    ld [wPartyMon1HPExp + 1], a
    ld a, [wOTPartyMon1AtkExp]
    ld [wPartyMon1AtkExp], a
    ld a, [wOTPartyMon1AtkExp + 1]
    ld [wPartyMon1AtkExp + 1], a
    ld a, [wOTPartyMon1DefExp]
    ld [wPartyMon1DefExp], a
    ld a, [wOTPartyMon1DefExp + 1]
    ld [wPartyMon1DefExp + 1], a
    ld a, [wOTPartyMon1SpdExp]
    ld [wPartyMon1SpdExp], a
    ld a, [wOTPartyMon1SpdExp + 1]
    ld [wPartyMon1SpdExp + 1], a
    ld a, [wOTPartyMon1SpcExp]
    ld [wPartyMon1SpcExp], a
    ld a, [wOTPartyMon1SpcExp + 1]
    ld [wPartyMon1SpcExp + 1], a

    ld a, [wOTPartyMon2HPExp]
    ld [wPartyMon2HPExp], a
    ld a, [wOTPartyMon2HPExp + 1]
    ld [wPartyMon2HPExp + 1], a
    ld a, [wOTPartyMon2AtkExp]
    ld [wPartyMon2AtkExp], a
    ld a, [wOTPartyMon2AtkExp + 1]
    ld [wPartyMon2AtkExp + 1], a
    ld a, [wOTPartyMon2DefExp]
    ld [wPartyMon2DefExp], a
    ld a, [wOTPartyMon2DefExp + 1]
    ld [wPartyMon2DefExp + 1], a
    ld a, [wOTPartyMon2SpdExp]
    ld [wPartyMon2SpdExp], a
    ld a, [wOTPartyMon2SpdExp + 1]
    ld [wPartyMon2SpdExp + 1], a
    ld a, [wOTPartyMon2SpcExp]
    ld [wPartyMon2SpcExp], a
    ld a, [wOTPartyMon2SpcExp + 1]

    ld a, [wOTPartyMon3HPExp]
    ld [wPartyMon3HPExp], a
    ld a, [wOTPartyMon3HPExp + 1]
    ld [wPartyMon3HPExp + 1], a
    ld a, [wOTPartyMon3AtkExp]
    ld [wPartyMon3AtkExp], a
    ld a, [wOTPartyMon3AtkExp + 1]
    ld [wPartyMon3AtkExp + 1], a
    ld a, [wOTPartyMon3DefExp]
    ld [wPartyMon3DefExp], a
    ld a, [wOTPartyMon3DefExp + 1]
    ld [wPartyMon3DefExp + 1], a
    ld a, [wOTPartyMon3SpdExp]
    ld [wPartyMon3SpdExp], a
    ld a, [wOTPartyMon3SpdExp + 1]
    ld [wPartyMon3SpdExp + 1], a
    ld a, [wOTPartyMon3SpcExp]
    ld [wPartyMon3SpcExp], a
    ld a, [wOTPartyMon3SpcExp + 1]
    ld [wPartyMon3SpcExp + 1], a

    ld a, [wOTPartyMon4HPExp]
    ld [wPartyMon4HPExp], a
    ld a, [wOTPartyMon4HPExp + 1]
    ld [wPartyMon4HPExp + 1], a
    ld a, [wOTPartyMon4AtkExp]
    ld [wPartyMon4AtkExp], a
    ld a, [wOTPartyMon4AtkExp + 1]
    ld [wPartyMon4AtkExp + 1], a
    ld a, [wOTPartyMon4DefExp]
    ld [wPartyMon4DefExp], a
    ld a, [wOTPartyMon4DefExp + 1]
    ld [wPartyMon4DefExp + 1], a
    ld a, [wOTPartyMon4SpdExp]
    ld [wPartyMon4SpdExp], a
    ld a, [wOTPartyMon4SpdExp + 1]
    ld [wPartyMon4SpdExp + 1], a
    ld a, [wOTPartyMon4SpcExp]
    ld [wPartyMon4SpcExp], a
    ld a, [wOTPartyMon4SpcExp + 1]
    ld [wPartyMon4SpcExp + 1], a

    ld a, [wOTPartyMon5HPExp]
    ld [wPartyMon5HPExp], a
    ld a, [wOTPartyMon5HPExp + 1]
    ld [wPartyMon5HPExp + 1], a
    ld a, [wOTPartyMon5AtkExp]
    ld [wPartyMon5AtkExp], a
    ld a, [wOTPartyMon5AtkExp + 1]
    ld [wPartyMon5AtkExp + 1], a
    ld a, [wOTPartyMon5DefExp]
    ld [wPartyMon5DefExp], a
    ld a, [wOTPartyMon5DefExp + 1]
    ld [wPartyMon5DefExp + 1], a
    ld a, [wOTPartyMon5SpdExp]
    ld [wPartyMon5SpdExp], a
    ld a, [wOTPartyMon5SpdExp + 1]
    ld [wPartyMon5SpdExp + 1], a
    ld a, [wOTPartyMon5SpcExp]
    ld [wPartyMon5SpcExp], a
    ld a, [wOTPartyMon5SpcExp + 1]
    ld [wPartyMon5SpcExp + 1], a

    ld a, [wOTPartyMon6HPExp]
    ld [wPartyMon6HPExp], a
    ld a, [wOTPartyMon6HPExp + 1]
    ld [wPartyMon6HPExp + 1], a
    ld a, [wOTPartyMon6AtkExp]
    ld [wPartyMon6AtkExp], a
    ld a, [wOTPartyMon6AtkExp + 1]
    ld [wPartyMon6AtkExp + 1], a
    ld a, [wOTPartyMon6DefExp]
    ld [wPartyMon6DefExp], a
    ld a, [wOTPartyMon6DefExp + 1]
    ld [wPartyMon6DefExp + 1], a
    ld a, [wOTPartyMon6SpdExp]
    ld [wPartyMon6SpdExp], a
    ld a, [wOTPartyMon6SpdExp + 1]
    ld [wPartyMon6SpdExp + 1], a
    ld a, [wOTPartyMon6SpcExp]
    ld [wPartyMon6SpcExp], a
    ld a, [wOTPartyMon6SpcExp + 1]
    ld [wPartyMon6SpcExp + 1], a

    ; stats
    ld a, [wOTPartyMon1MaxHP]
    ld [wPartyMon1MaxHP], a
    ld a, [wOTPartyMon1MaxHP + 1]
    ld [wPartyMon1MaxHP + 1], a
    ld a, [wOTPartyMon1HP]
    ld [wPartyMon1HP], a
    ld a, [wOTPartyMon1HP + 1]
    ld [wPartyMon1HP + 1], a
    ld a, [wOTPartyMon1Attack]
    ld [wPartyMon1Attack], a
    ld a, [wOTPartyMon1Attack + 1]
    ld [wPartyMon1Attack + 1], a
    ld a, [wOTPartyMon1Defense]
    ld [wPartyMon1Defense], a
    ld a, [wOTPartyMon1Defense + 1]
    ld [wPartyMon1Defense + 1], a
    ld a, [wOTPartyMon1Speed]
    ld [wPartyMon1Speed], a
    ld a, [wOTPartyMon1Speed + 1]
    ld [wPartyMon1Speed + 1], a
    ld a, [wOTPartyMon1SpclAtk]
    ld [wPartyMon1SpclAtk], a
    ld a, [wOTPartyMon1SpclAtk + 1]
    ld [wPartyMon1SpclAtk + 1], a
    ld a, [wOTPartyMon1SpclDef]
    ld [wPartyMon1SpclDef], a
    ld a, [wOTPartyMon1SpclDef + 1]
    ld [wPartyMon1SpclDef + 1], a
    ld a, [wOTPartyMon1Exp]
    ld [wPartyMon1Exp], a
    ld a, [wOTPartyMon1Exp + 1]
    ld [wPartyMon1Exp + 1], a
    ld a, [wOTPartyMon1Exp + 2]
    ld [wPartyMon1Exp + 2], a

    ld a, [wOTPartyMon2MaxHP]
    ld [wPartyMon2MaxHP], a
    ld a, [wOTPartyMon2MaxHP + 1]
    ld [wPartyMon2MaxHP + 1], a
    ld a, [wOTPartyMon2HP]
    ld [wPartyMon2HP], a
    ld a, [wOTPartyMon2HP + 1]
    ld [wPartyMon2HP + 1], a
    ld a, [wOTPartyMon2Attack]
    ld [wPartyMon2Attack], a
    ld a, [wOTPartyMon2Attack + 1]
    ld [wPartyMon2Attack + 1], a
    ld a, [wOTPartyMon2Defense]
    ld [wPartyMon2Defense], a
    ld a, [wOTPartyMon2Defense + 1]
    ld [wPartyMon2Defense + 1], a
    ld a, [wOTPartyMon2Speed]
    ld [wPartyMon2Speed], a
    ld a, [wOTPartyMon2Speed + 1]
    ld [wPartyMon2Speed + 1], a
    ld a, [wOTPartyMon2SpclAtk]
    ld [wPartyMon2SpclAtk], a
    ld a, [wOTPartyMon2SpclAtk + 1]
    ld [wPartyMon2SpclAtk + 1], a
    ld a, [wOTPartyMon2SpclDef]
    ld [wPartyMon2SpclDef], a
    ld a, [wOTPartyMon2SpclDef + 1]
    ld [wPartyMon2SpclDef + 1], a
    ld a, [wOTPartyMon2Exp]
    ld [wPartyMon2Exp], a
    ld a, [wOTPartyMon2Exp + 1]
    ld [wPartyMon2Exp + 1], a
    ld a, [wOTPartyMon2Exp + 2]
    ld [wPartyMon2Exp + 2], a

    ld a, [wOTPartyMon3MaxHP]
    ld [wPartyMon3MaxHP], a
    ld a, [wOTPartyMon3MaxHP + 1]
    ld [wPartyMon3MaxHP + 1], a
    ld a, [wOTPartyMon3HP]
    ld [wPartyMon3HP], a
    ld a, [wOTPartyMon3HP + 1]
    ld [wPartyMon3HP + 1], a
    ld a, [wOTPartyMon3Attack]
    ld [wPartyMon3Attack], a
    ld a, [wOTPartyMon3Attack + 1]
    ld [wPartyMon3Attack + 1], a
    ld a, [wOTPartyMon3Defense]
    ld [wPartyMon3Defense], a
    ld a, [wOTPartyMon3Defense + 1]
    ld [wPartyMon3Defense + 1], a
    ld a, [wOTPartyMon3Speed]
    ld [wPartyMon3Speed], a
    ld a, [wOTPartyMon3Speed + 1]
    ld [wPartyMon3Speed + 1], a
    ld a, [wOTPartyMon3SpclAtk]
    ld [wPartyMon3SpclAtk], a
    ld a, [wOTPartyMon3SpclAtk + 1]
    ld [wPartyMon3SpclAtk + 1], a
    ld a, [wOTPartyMon3SpclDef]
    ld [wPartyMon3SpclDef], a
    ld a, [wOTPartyMon3SpclDef + 1]
    ld [wPartyMon3SpclDef + 1], a
    ld a, [wOTPartyMon3Exp]
    ld [wPartyMon3Exp], a
    ld a, [wOTPartyMon3Exp + 1]
    ld [wPartyMon3Exp + 1], a
    ld a, [wOTPartyMon3Exp + 2]
    ld [wPartyMon3Exp + 2], a

    ld a, [wOTPartyMon4MaxHP]
    ld [wPartyMon4MaxHP], a
    ld a, [wOTPartyMon4MaxHP + 1]
    ld [wPartyMon4MaxHP + 1], a
    ld a, [wOTPartyMon4HP]
    ld [wPartyMon4HP], a
    ld a, [wOTPartyMon4HP + 1]
    ld [wPartyMon4HP + 1], a
    ld a, [wOTPartyMon4Attack]
    ld [wPartyMon4Attack], a
    ld a, [wOTPartyMon4Attack + 1]
    ld [wPartyMon4Attack + 1], a
    ld a, [wOTPartyMon4Defense]
    ld [wPartyMon4Defense], a
    ld a, [wOTPartyMon4Defense + 1]
    ld [wPartyMon4Defense + 1], a
    ld a, [wOTPartyMon4Speed]
    ld [wPartyMon4Speed], a
    ld a, [wOTPartyMon4Speed + 1]
    ld [wPartyMon4Speed + 1], a
    ld a, [wOTPartyMon4SpclAtk]
    ld [wPartyMon4SpclAtk], a
    ld a, [wOTPartyMon4SpclAtk + 1]
    ld [wPartyMon4SpclAtk + 1], a
    ld a, [wOTPartyMon4SpclDef]
    ld [wPartyMon4SpclDef], a
    ld a, [wOTPartyMon4SpclDef + 1]
    ld [wPartyMon4SpclDef + 1], a
    ld a, [wOTPartyMon4Exp]
    ld [wPartyMon4Exp], a
    ld a, [wOTPartyMon4Exp + 1]
    ld [wPartyMon4Exp + 1], a
    ld a, [wOTPartyMon4Exp + 2]
    ld [wPartyMon4Exp + 2], a

    ld a, [wOTPartyMon5MaxHP]
    ld [wPartyMon5MaxHP], a
    ld a, [wOTPartyMon5MaxHP + 1]
    ld [wPartyMon5MaxHP + 1], a
    ld a, [wOTPartyMon5HP]
    ld [wPartyMon5HP], a
    ld a, [wOTPartyMon5HP + 1]
    ld [wPartyMon5HP + 1], a
    ld a, [wOTPartyMon5Attack]
    ld [wPartyMon5Attack], a
    ld a, [wOTPartyMon5Attack + 1]
    ld [wPartyMon5Attack + 1], a
    ld a, [wOTPartyMon5Defense]
    ld [wPartyMon5Defense], a
    ld a, [wOTPartyMon5Defense + 1]
    ld [wPartyMon5Defense + 1], a
    ld a, [wOTPartyMon5Speed]
    ld [wPartyMon5Speed], a
    ld a, [wOTPartyMon5Speed + 1]
    ld [wPartyMon5Speed + 1], a
    ld a, [wOTPartyMon5SpclAtk]
    ld [wPartyMon5SpclAtk], a
    ld a, [wOTPartyMon5SpclAtk + 1]
    ld [wPartyMon5SpclAtk + 1], a
    ld a, [wOTPartyMon5SpclDef]
    ld [wPartyMon5SpclDef], a
    ld a, [wOTPartyMon5SpclDef + 1]
    ld [wPartyMon5SpclDef + 1], a
    ld a, [wOTPartyMon5Exp]
    ld [wPartyMon5Exp], a
    ld a, [wOTPartyMon5Exp + 1]
    ld [wPartyMon5Exp + 1], a
    ld a, [wOTPartyMon5Exp + 2]
    ld [wPartyMon5Exp + 2], a

    ld a, [wOTPartyMon6MaxHP]
    ld [wPartyMon6MaxHP], a
    ld a, [wOTPartyMon6MaxHP + 1]
    ld [wPartyMon6MaxHP + 1], a
    ld a, [wOTPartyMon6HP]
    ld [wPartyMon6HP], a
    ld a, [wOTPartyMon6HP + 1]
    ld [wPartyMon6HP + 1], a
    ld a, [wOTPartyMon6Attack]
    ld [wPartyMon6Attack], a
    ld a, [wOTPartyMon6Attack + 1]
    ld [wPartyMon6Attack + 1], a
    ld a, [wOTPartyMon6Defense]
    ld [wPartyMon6Defense], a
    ld a, [wOTPartyMon6Defense + 1]
    ld [wPartyMon6Defense + 1], a
    ld a, [wOTPartyMon6Speed]
    ld [wPartyMon6Speed], a
    ld a, [wOTPartyMon6Speed + 1]
    ld [wPartyMon6Speed + 1], a
    ld a, [wOTPartyMon6SpclAtk]
    ld [wPartyMon6SpclAtk], a
    ld a, [wOTPartyMon6SpclAtk + 1]
    ld [wPartyMon6SpclAtk + 1], a
    ld a, [wOTPartyMon6SpclDef]
    ld [wPartyMon6SpclDef], a
    ld a, [wOTPartyMon6SpclDef + 1]
    ld [wPartyMon6SpclDef + 1], a
    ld a, [wOTPartyMon6Exp]
    ld [wPartyMon6Exp], a
    ld a, [wOTPartyMon6Exp + 1]
    ld [wPartyMon6Exp + 1], a
    ld a, [wOTPartyMon6Exp + 2]
    ld [wPartyMon6Exp + 2], a

    ; happiness
    ld a, [wOTPartyMon1Happiness]
    ld [wPartyMon1Happiness], a
    ld a, [wOTPartyMon2Happiness]
    ld [wPartyMon2Happiness], a
    ld a, [wOTPartyMon3Happiness]
    ld [wPartyMon3Happiness], a
    ld a, [wOTPartyMon4Happiness]
    ld [wPartyMon4Happiness], a
    ld a, [wOTPartyMon5Happiness]
    ld [wPartyMon5Happiness], a
    ld a, [wOTPartyMon6Happiness]
    ld [wPartyMon6Happiness], a

    ; moves
    ld a, [wOTPartyMon1Moves]
    ld [wPartyMon1Moves], a
    ld a, [wOTPartyMon1Moves + 1]
    ld [wPartyMon1Moves + 1], a
    ld a, [wOTPartyMon1Moves + 2]
    ld [wPartyMon1Moves + 2], a
    ld a, [wOTPartyMon1Moves + 3]
    ld [wPartyMon1Moves + 3], a
    ld a, [wOTPartyMon1PP]
    ld [wPartyMon1PP], a
    ld a, [wOTPartyMon1PP + 1]
    ld [wPartyMon1PP + 1], a
    ld a, [wOTPartyMon1PP + 2]
    ld [wPartyMon1PP + 2], a
    ld a, [wOTPartyMon1PP + 3]
    ld [wPartyMon1PP + 3], a

    ld a, [wOTPartyMon2Moves]
    ld [wPartyMon2Moves], a
    ld a, [wOTPartyMon2Moves + 1]
    ld [wPartyMon2Moves + 1], a
    ld a, [wOTPartyMon2Moves + 2]
    ld [wPartyMon2Moves + 2], a
    ld a, [wOTPartyMon2Moves + 3]
    ld [wPartyMon2Moves + 3], a
    ld a, [wOTPartyMon2PP]
    ld [wPartyMon2PP], a
    ld a, [wOTPartyMon2PP + 1]
    ld [wPartyMon2PP + 1], a
    ld a, [wOTPartyMon2PP + 2]
    ld [wPartyMon2PP + 2], a
    ld a, [wOTPartyMon2PP + 3]
    ld [wPartyMon2PP + 3], a

    ld a, [wOTPartyMon3Moves]
    ld [wPartyMon3Moves], a
    ld a, [wOTPartyMon3Moves + 1]
    ld [wPartyMon3Moves + 1], a
    ld a, [wOTPartyMon3Moves + 2]
    ld [wPartyMon3Moves + 2], a
    ld a, [wOTPartyMon3Moves + 3]
    ld [wPartyMon3Moves + 3], a
    ld a, [wOTPartyMon3PP]
    ld [wPartyMon3PP], a
    ld a, [wOTPartyMon3PP + 1]
    ld [wPartyMon3PP + 1], a
    ld a, [wOTPartyMon3PP + 2]
    ld [wPartyMon3PP + 2], a
    ld a, [wOTPartyMon3PP + 3]
    ld [wPartyMon3PP + 3], a

    ld a, [wOTPartyMon4Moves]
    ld [wPartyMon4Moves], a
    ld a, [wOTPartyMon4Moves + 1]
    ld [wPartyMon4Moves + 1], a
    ld a, [wOTPartyMon4Moves + 2]
    ld [wPartyMon4Moves + 2], a
    ld a, [wOTPartyMon4Moves + 3]
    ld [wPartyMon4Moves + 3], a
    ld a, [wOTPartyMon4PP]
    ld [wPartyMon4PP], a
    ld a, [wOTPartyMon4PP + 1]
    ld [wPartyMon4PP + 1], a
    ld a, [wOTPartyMon4PP + 2]
    ld [wPartyMon4PP + 2], a
    ld a, [wOTPartyMon4PP + 3]
    ld [wPartyMon4PP + 3], a

    ld a, [wOTPartyMon5Moves]
    ld [wPartyMon5Moves], a
    ld a, [wOTPartyMon5Moves + 1]
    ld [wPartyMon5Moves + 1], a
    ld a, [wOTPartyMon5Moves + 2]
    ld [wPartyMon5Moves + 2], a
    ld a, [wOTPartyMon5Moves + 3]
    ld [wPartyMon5Moves + 3], a
    ld a, [wOTPartyMon5PP]
    ld [wPartyMon5PP], a
    ld a, [wOTPartyMon5PP + 1]
    ld [wPartyMon5PP + 1], a
    ld a, [wOTPartyMon5PP + 2]
    ld [wPartyMon5PP + 2], a
    ld a, [wOTPartyMon5PP + 3]
    ld [wPartyMon5PP + 3], a

    ld a, [wOTPartyMon6Moves]
    ld [wPartyMon6Moves], a
    ld a, [wOTPartyMon6Moves + 1]
    ld [wPartyMon6Moves + 1], a
    ld a, [wOTPartyMon6Moves + 2]
    ld [wPartyMon6Moves + 2], a
    ld a, [wOTPartyMon6Moves + 3]
    ld [wPartyMon6Moves + 3], a
    ld a, [wOTPartyMon6PP]
    ld [wPartyMon6PP], a
    ld a, [wOTPartyMon6PP + 1]
    ld [wPartyMon6PP + 1], a
    ld a, [wOTPartyMon6PP + 2]
    ld [wPartyMon6PP + 2], a
    ld a, [wOTPartyMon6PP + 3]
    ld [wPartyMon6PP + 3], a

    ; status
    ld a, [wOTPartyMon1Status]
    ld [wPartyMon1Status], a
    ld a, [wOTPartyMon2Status]
    ld [wPartyMon2Status], a
    ld a, [wOTPartyMon3Status]
    ld [wPartyMon3Status], a
    ld a, [wOTPartyMon4Status]
    ld [wPartyMon4Status], a
    ld a, [wOTPartyMon5Status]
    ld [wPartyMon5Status], a
    ld a, [wOTPartyMon6Status]
    ld [wPartyMon6Status], a

    ; nickname
    ld a, [wOtherTrainerType]
	bit TRAINERTYPE_NICKNAME_F, a
	jp z, .defaultNick

    ld a, [wOTPartyMon1Nickname]
    ld [wPartyMon1Nickname], a
    ld a, [wOTPartyMon1Nickname + 1]
    ld [wPartyMon1Nickname + 1], a
    ld a, [wOTPartyMon1Nickname + 2]
    ld [wPartyMon1Nickname + 2], a
    ld a, [wOTPartyMon1Nickname + 3]
    ld [wPartyMon1Nickname + 3], a
    ld a, [wOTPartyMon1Nickname + 4]
    ld [wPartyMon1Nickname + 4], a
    ld a, [wOTPartyMon1Nickname + 5]
    ld [wPartyMon1Nickname + 5], a
    ld a, [wOTPartyMon1Nickname + 6]
    ld [wPartyMon1Nickname + 6], a
    ld a, [wOTPartyMon1Nickname + 7]
    ld [wPartyMon1Nickname + 7], a
    ld a, [wOTPartyMon1Nickname + 8]
    ld [wPartyMon1Nickname + 8], a
    ld a, [wOTPartyMon1Nickname + 9]
    ld [wPartyMon1Nickname + 9], a
    ld a, [wOTPartyMon1Nickname + 10]
    ld [wPartyMon1Nickname + 10], a

    ld a, [wOTPartyMon2Nickname]
    ld [wPartyMon2Nickname], a
    ld a, [wOTPartyMon2Nickname + 1]
    ld [wPartyMon2Nickname + 1], a
    ld a, [wOTPartyMon2Nickname + 2]
    ld [wPartyMon2Nickname + 2], a
    ld a, [wOTPartyMon2Nickname + 3]
    ld [wPartyMon2Nickname + 3], a
    ld a, [wOTPartyMon2Nickname + 4]
    ld [wPartyMon2Nickname + 4], a
    ld a, [wOTPartyMon2Nickname + 5]
    ld [wPartyMon2Nickname + 5], a
    ld a, [wOTPartyMon2Nickname + 6]
    ld [wPartyMon2Nickname + 6], a
    ld a, [wOTPartyMon2Nickname + 7]
    ld [wPartyMon2Nickname + 7], a
    ld a, [wOTPartyMon2Nickname + 8]
    ld [wPartyMon2Nickname + 8], a
    ld a, [wOTPartyMon2Nickname + 9]
    ld [wPartyMon2Nickname + 9], a
    ld a, [wOTPartyMon2Nickname + 10]
    ld [wPartyMon2Nickname + 10], a

    ld a, [wOTPartyMon3Nickname]
    ld [wPartyMon3Nickname], a
    ld a, [wOTPartyMon3Nickname + 1]
    ld [wPartyMon3Nickname + 1], a
    ld a, [wOTPartyMon3Nickname + 2]
    ld [wPartyMon3Nickname + 2], a
    ld a, [wOTPartyMon3Nickname + 3]
    ld [wPartyMon3Nickname + 3], a
    ld a, [wOTPartyMon3Nickname + 4]
    ld [wPartyMon3Nickname + 4], a
    ld a, [wOTPartyMon3Nickname + 5]
    ld [wPartyMon3Nickname + 5], a
    ld a, [wOTPartyMon3Nickname + 6]
    ld [wPartyMon3Nickname + 6], a
    ld a, [wOTPartyMon3Nickname + 7]
    ld [wPartyMon3Nickname + 7], a
    ld a, [wOTPartyMon3Nickname + 8]
    ld [wPartyMon3Nickname + 8], a
    ld a, [wOTPartyMon3Nickname + 9]
    ld [wPartyMon3Nickname + 9], a
    ld a, [wOTPartyMon3Nickname + 10]
    ld [wPartyMon3Nickname + 10], a

    ld a, [wOTPartyMon4Nickname]
    ld [wPartyMon4Nickname], a
    ld a, [wOTPartyMon4Nickname + 1]
    ld [wPartyMon4Nickname + 1], a
    ld a, [wOTPartyMon4Nickname + 2]
    ld [wPartyMon4Nickname + 2], a
    ld a, [wOTPartyMon4Nickname + 3]
    ld [wPartyMon4Nickname + 3], a
    ld a, [wOTPartyMon4Nickname + 4]
    ld [wPartyMon4Nickname + 4], a
    ld a, [wOTPartyMon4Nickname + 5]
    ld [wPartyMon4Nickname + 5], a
    ld a, [wOTPartyMon4Nickname + 6]
    ld [wPartyMon4Nickname + 6], a
    ld a, [wOTPartyMon4Nickname + 7]
    ld [wPartyMon4Nickname + 7], a
    ld a, [wOTPartyMon4Nickname + 8]
    ld [wPartyMon4Nickname + 8], a
    ld a, [wOTPartyMon4Nickname + 9]
    ld [wPartyMon4Nickname + 9], a
    ld a, [wOTPartyMon4Nickname + 10]
    ld [wPartyMon4Nickname + 10], a

    ld a, [wOTPartyMon5Nickname]
    ld [wPartyMon5Nickname], a
    ld a, [wOTPartyMon5Nickname + 1]
    ld [wPartyMon5Nickname + 1], a
    ld a, [wOTPartyMon5Nickname + 2]
    ld [wPartyMon5Nickname + 2], a
    ld a, [wOTPartyMon5Nickname + 3]
    ld [wPartyMon5Nickname + 3], a
    ld a, [wOTPartyMon5Nickname + 4]
    ld [wPartyMon5Nickname + 4], a
    ld a, [wOTPartyMon5Nickname + 5]
    ld [wPartyMon5Nickname + 5], a
    ld a, [wOTPartyMon5Nickname + 6]
    ld [wPartyMon5Nickname + 6], a
    ld a, [wOTPartyMon5Nickname + 7]
    ld [wPartyMon5Nickname + 7], a
    ld a, [wOTPartyMon5Nickname + 8]
    ld [wPartyMon5Nickname + 8], a
    ld a, [wOTPartyMon5Nickname + 9]
    ld [wPartyMon5Nickname + 9], a
    ld a, [wOTPartyMon5Nickname + 10]
    ld [wPartyMon5Nickname + 10], a

    ld a, [wOTPartyMon6Nickname]
    ld [wPartyMon6Nickname], a
    ld a, [wOTPartyMon6Nickname + 1]
    ld [wPartyMon6Nickname + 1], a
    ld a, [wOTPartyMon6Nickname + 2]
    ld [wPartyMon6Nickname + 2], a
    ld a, [wOTPartyMon6Nickname + 3]
    ld [wPartyMon6Nickname + 3], a
    ld a, [wOTPartyMon6Nickname + 4]
    ld [wPartyMon6Nickname + 4], a
    ld a, [wOTPartyMon6Nickname + 5]
    ld [wPartyMon6Nickname + 5], a
    ld a, [wOTPartyMon6Nickname + 6]
    ld [wPartyMon6Nickname + 6], a
    ld a, [wOTPartyMon6Nickname + 7]
    ld [wPartyMon6Nickname + 7], a
    ld a, [wOTPartyMon6Nickname + 8]
    ld [wPartyMon6Nickname + 8], a
    ld a, [wOTPartyMon6Nickname + 9]
    ld [wPartyMon6Nickname + 9], a
    ld a, [wOTPartyMon6Nickname + 10]
    ld [wPartyMon6Nickname + 10], a

    ret

.defaultNick
    ld a, [wOTPartyMon1Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon1Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon1Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon1Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon1Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon1Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon1Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon1Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon1Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon1Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon1Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon1Nickname + 10], a

    ld a, [wOTPartyMon2Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon2Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon2Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon2Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon2Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon2Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon2Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon2Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon2Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon2Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon2Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon2Nickname + 10], a

    ld a, [wOTPartyMon3Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon3Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon3Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon3Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon3Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon3Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon3Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon3Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon3Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon3Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon3Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon3Nickname + 10], a

    ld a, [wOTPartyMon4Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon4Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon4Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon4Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon4Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon4Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon4Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon4Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon4Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon4Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon4Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon4Nickname + 10], a

    ld a, [wOTPartyMon5Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon5Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon5Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon5Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon5Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon5Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon5Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon5Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon5Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon5Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon5Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon5Nickname + 10], a

    ld a, [wOTPartyMon6Species]
    ld [wNamedObjectIndex], a
    farcall GetPokemonName
    ld a, [wStringBuffer1]
    ld [wPartyMon6Nickname], a
    ld a, [wStringBuffer1 + 1]
    ld [wPartyMon6Nickname + 1], a
    ld a, [wStringBuffer1 + 2]
    ld [wPartyMon6Nickname + 2], a
    ld a, [wStringBuffer1 + 3]
    ld [wPartyMon6Nickname + 3], a
    ld a, [wStringBuffer1 + 4]
    ld [wPartyMon6Nickname + 4], a
    ld a, [wStringBuffer1 + 5]
    ld [wPartyMon6Nickname + 5], a
    ld a, [wStringBuffer1 + 6]
    ld [wPartyMon6Nickname + 6], a
    ld a, [wStringBuffer1 + 7]
    ld [wPartyMon6Nickname + 7], a
    ld a, [wStringBuffer1 + 8]
    ld [wPartyMon6Nickname + 8], a
    ld a, [wStringBuffer1 + 9]
    ld [wPartyMon6Nickname + 9], a
    ld a, [wStringBuffer1 + 10]
    ld [wPartyMon6Nickname + 10], a

    ret


; DevNote - reward money here
ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	ld a, [wCurPartyLevel]
	ld [hl], a ; hMultiplier
	call Multiply

; double money as an invader
	ld a, [wInvading]
	and a
	jr z, .notInvading
	ld a, 2
	ld [hl], a ; hMultiplier
	call Multiply
.notInvading
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

Battle_GetTrainerName::
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ld hl, wOTPlayerName
    ld a, BANK(Battle_GetTrainerName)
	ld [wTrainerGroupBank], a
	jp nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a

GetTrainerName::
	ld a, c
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
    add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	call GetNextTrainerDataByte
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
    call FarCopyBytes
	pop de
	ret

INCLUDE "data/trainers/party_pointers.asm"

SetTrainerBattleLevel:
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.skip_party
	ld a, [hli]
	cp $ff
	jr nz, .skip_party
	jr .skip_trainer
.got_trainer

.skip_name
	ld a, [hli]
	cp "@"
	jr nz, .skip_name

	inc hl
	ld a, [hl]
	ld [wCurPartyLevel], a
	ret