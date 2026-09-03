LoadOpponentTrainerAndPokemon:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBT_OTTrainer)
	ldh [rWBK], a

	; Fill wBT_OTTrainer with zeros
	xor a
	ld hl, wBT_OTTrainer
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [wBT_OTMon1Item], a
	ld [wBT_OTMon2Item], a
	ld [wBT_OTMon3Item], a

	; Set wBT_OTTrainer as start address to write the following data to
	ld de, wBT_OTTrainer

	ldh a, [hRandomAdd]
	ld b, a
.resample ; loop to find a random trainer
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
if DEF(_CRYSTAL11)
	maskbits BATTLETOWER_NUM_UNIQUE_TRAINERS
	cp BATTLETOWER_NUM_UNIQUE_TRAINERS
else
; BUG: Crystal 1.0 used the wrong constant here, so only the first
; 21 trainers in BattleTowerTrainers can be sampled.
	maskbits BATTLETOWER_NUM_UNIQUE_MON
	cp BATTLETOWER_NUM_UNIQUE_MON
endc
	jr nc, .resample
	ld b, a

	ld a, BANK(sBTTrainers)
	call OpenSRAM

	ld c, BATTLETOWER_STREAK_LENGTH
	ld hl, sBTTrainers
.next_trainer
	ld a, [hli]
	cp b
	jr z, .resample
	dec c
	jr nz, .next_trainer ; c <= 7  initialise all 7 trainers?

	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a

	call CloseSRAM

	push af
; Copy name (10 bytes) and class (1 byte) of trainer
	ld hl, BattleTowerTrainers
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

	call LoadRandomBattleTowerMon
	pop af

	ld hl, BattleTowerTrainerData
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call AddNTimes
	ld bc, BATTLETOWER_TRAINERDATALENGTH
.copy_bt_trainer_data_loop
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_bt_trainer_data_loop

	pop af
	ldh [rWBK], a

	ret

LoadRandomBattleTowerMon:
	;ld c, BATTLETOWER_PARTY_LENGTH
	ld a, BATTLETOWER_ENEMY_PARTY_LENGTH
	ld c, a
.loop
	push bc
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

.FindARandomBattleTowerMon:
	; Pick from the cumulative challenge pool list; final trainers and Ubers
	; use the same policy as every other trainer in the selected challenge.
	call PickRandomBattleTowerCompactMon
	ld c, a ; selected species

	; Ensure species uniqueness across the current generated team.
	push hl
	push de
	ld hl, wBT_OTMon1
.current_team_loop
	ld a, h
	cp d
	jr nz, .check_current_team_species
	ld a, l
	cp e
	jr z, .current_team_done

.check_current_team_species
	ld a, [hl]
	cp c
	jr z, .current_team_duplicate
	push bc
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	add hl, bc
	pop bc
	jr .current_team_loop

.current_team_duplicate
	pop de
	pop hl
	jp .FindARandomBattleTowerMon

.current_team_done
	pop de
	pop hl

	; Keep the existing previous-team SRAM limitation: only three species
	; from each of the two prior trainers are tracked for resampling.
	ld a, [sBTMonPrevTrainer1]
	cp c
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevTrainer2]
	cp c
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevTrainer3]
	cp c
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer1]
	cp c
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer2]
	cp c
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer3]
	cp c
	jp z, .FindARandomBattleTowerMon

	call ExpandBattleTowerCompactMon
	pop bc
	dec c
	jp nz, .loop

	ld a, [sBTMonPrevTrainer1]
	ld [sBTMonPrevPrevTrainer1], a
	ld a, [sBTMonPrevTrainer2]
	ld [sBTMonPrevPrevTrainer2], a
	ld a, [sBTMonPrevTrainer3]
	ld [sBTMonPrevPrevTrainer3], a
	ld a, [wBT_OTMon1]
	ld [sBTMonPrevTrainer1], a
	ld a, [wBT_OTMon2]
	ld [sBTMonPrevTrainer2], a
	ld a, [wBT_OTMon3]
	ld [sBTMonPrevTrainer3], a
	call CloseSRAM
	ret

ExpandBattleTowerCompactMon:
; Expand compact species/item/moves from b:hl into the full mon at de.
	push de
	call ExpandBattleTowerCompactMonToTemp
	pop de
	ld hl, wBT_OTTempMon1
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	jp CopyBytes

ExpandBattleTowerCompactMonToTemp:
; Materialize compact species/item/moves from b:hl in wBT_OTTempMon1.
; Stats are generated in WRAM0 scratch so CalcMonStats can read bank-1 base
; data while writing the Battle Tower mon, then copied to the WRAMX handoff.
	ld de, wBT_OTTempMon1
	ld c, BATTLETOWER_MON_STRUCT_LENGTH
.copy_compact_mon_loop
	ld a, b
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec c
	jr nz, .copy_compact_mon_loop

	ld h, d
	ld l, e
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH - BATTLETOWER_MON_STRUCT_LENGTH
	call ByteFill

	call GetBattleTowerChallengeLevel
	ld [wBT_OTTempMon1Level], a

	ldh a, [rWBK]
	push af
	ld a, BANK(wCurPartyLevel)
	ldh [rWBK], a

	ld a, [wBT_OTTempMon1]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	ld a, [wBT_OTTempMon1Level]
	ld [wCurPartyLevel], a
	ld d, a
	callfar CalcExpAtLevel
	ldh a, [hMultiplicand]
	ld [wBT_OTTempMon1Exp], a
	ldh a, [hMultiplicand + 1]
	ld [wBT_OTTempMon1Exp + 1], a
	ldh a, [hMultiplicand + 2]
	ld [wBT_OTTempMon1Exp + 2], a

	ld hl, wBT_OTTempMon1StatExp
	ld a, $ff
	ld bc, MON_DVS - MON_STAT_EXP
	call ByteFill
	ld a, $ff
	ld [wBT_OTTempMon1DVs], a
	ld [wBT_OTTempMon1DVs + 1], a

	ld hl, wBT_OTTempMon1Moves
	ld de, wBT_OTTempMon1PP
	predef FillPP
	ld a, $ff
	ld [wBT_OTTempMon1Happiness], a

	ld de, wBT_OTTempMon1MaxHP
	ld hl, wBT_OTTempMon1StatExp - 1
	ld b, TRUE
	predef CalcMonStats

	ld hl, wBT_OTTempMon1MaxHP
	ld de, wBT_OTTempMon1HP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, [wNamedObjectIndex]
	push af
	ld a, [wBT_OTTempMon1]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld h, d
	ld l, e
	ld de, wBT_OTTempMon1Name
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop af
	ld [wNamedObjectIndex], a

	pop af
	ldh [rWBK], a
	ret

GetBattleTowerChallengeLevel:
; Battle Tower compact mons use the challenge index as level / 20.
	call GetBattleTowerChallengeIndex
	and a
	jr nz, .got_challenge
	ld a, BATTLETOWER_CHALLENGE_NOVICE

.got_challenge
	cp NUM_BATTLETOWER_CHALLENGES + 1
	jr c, .challenge_ok
	ld a, BATTLETOWER_CHALLENGE_MASTER

.challenge_ok
	ld c, BATTLETOWER_CHALLENGE_LEVEL_STEP
	call SimpleMultiply
	cp BATTLETOWER_MIN_CHALLENGE_LEVEL
	jr nc, .not_under
	ld a, BATTLETOWER_MIN_CHALLENGE_LEVEL

.not_under
	cp BATTLETOWER_MAX_CHALLENGE_LEVEL + 1
	ret c
	ld a, BATTLETOWER_MAX_CHALLENGE_LEVEL
	ret

GetBattleTowerChallengeIndex:
; wBTChoiceOfLvlGroup is in Battle Tower WRAMX, but player-party
; override helpers run with the party WRAMX bank selected.
	ldh a, [rWBK]
	push af
	ld a, BANK(wBTChoiceOfLvlGroup)
	ldh [rWBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld c, a
	pop af
	ldh [rWBK], a
	ld a, c
	ret

BattleTower_ScalePartyMonsToChallengeLevel:
; Temporarily rewrite the player's party levels and battle stats in WRAM
; for this Battle Tower fight. LoadPokemonData restores the real party after.
	ldh a, [rWBK]
	push af
	ld a, BANK(wPartyCount)
	ldh [rWBK], a

	ld a, [wPartyCount]
	and a
	jr z, .done
	ld b, a
	xor a
	ld [wCurPartyMon], a
	ld hl, wPartySpecies

.party_loop
	ld a, [hli]
	cp EGG
	jr z, .next_mon

	push bc
	push hl
	call .ScaleCurrentPartyMon
	pop hl
	pop bc

.next_mon
	dec b
	jr z, .done
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	jr .party_loop

.done
	pop af
	ldh [rWBK], a
	ret

.ScaleCurrentPartyMon:
	call GetBattleTowerChallengeLevel
	ld [wCurPartyLevel], a

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	ld a, MON_EXP
	call GetPartyParamLocation
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a

	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [wCurPartyLevel]
	ld [hl], a

	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, TRUE
	predef CalcMonStats

	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

BattleTower_GenerateRandomPlayerParty:
; Random-team mirror mode replaces the live WRAM party only. The saved party
; is restored by LoadPokemonData after the battle, before script control resumes.
	ldh a, [rWBK]
	push af
	ld a, BANK(wPartyCount)
	ldh [rWBK], a

	ld a, BATTLETOWER_ENEMY_PARTY_LENGTH
	ld [wPartyCount], a
	ld a, $ff
	ld hl, wPartySpecies
	ld bc, PARTY_LENGTH + 1
	call ByteFill

	xor a
	ld [wCurPartyMon], a
	ld b, BATTLETOWER_ENEMY_PARTY_LENGTH

.party_loop
	push bc
.find_unique_mon
	call PickRandomBattleTowerCompactMon
	ld c, a ; selected species
	call .SelectedSpeciesAlreadyInPlayerTeam
	jr c, .find_unique_mon

	call ExpandBattleTowerCompactMonToTemp

	ld hl, wPartySpecies
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wBT_OTTempMon1]
	ld [hl], a

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld hl, wBT_OTTempMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wBT_OTTempMon1Name
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld hl, wPartyMonOTs
	ld a, [wCurPartyMon]
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	pop bc
	dec b
	jr nz, .party_loop

	pop af
	ldh [rWBK], a
	ret

.SelectedSpeciesAlreadyInPlayerTeam:
; Input c: selected species. Preserve b:hl so the compact pointer survives.
	push hl
	push bc
	ld a, [wCurPartyMon]
	and a
	jr z, .not_found
	ld b, a
	ld hl, wPartySpecies

.current_team_loop
	ld a, [hli]
	cp c
	jr z, .found
	dec b
	jr nz, .current_team_loop

.not_found
	and a
	pop bc
	pop hl
	ret

.found
	scf
	pop bc
	pop hl
	ret

PickRandomBattleTowerCompactMon:
; Return a: species, b: bank, hl: compact bt_mon entry. Preserve de, since
; the caller keeps the wBT_OTTrainer write cursor there.
	push de
	call GetBattleTowerChallengePools
	ld a, [hli] ; pool count for this challenge
	call RandomRange
	ld bc, BATTLETOWER_CHALLENGE_POOL_ENTRY_LENGTH
	call AddNTimes

	ld a, [hli]
	ld b, a ; compact pool bank
	ld a, [hli]
	ld e, a ; compact pool address low
	ld a, [hli]
	ld d, a ; compact pool address high
	ld a, [hl] ; compact pool entry count
	ld c, a

	ld a, b
	ldh [hTempBank], a
	ld a, c
	call RandomRange
	ld h, d
	ld l, e
	ld bc, BATTLETOWER_MON_STRUCT_LENGTH
	call AddNTimes

	ldh a, [hTempBank]
	ld b, a
	call GetFarByte
	pop de
	ret

GetBattleTowerChallengePools:
; Return hl at the BattleTowerChallengePools record for wBTChoiceOfLvlGroup.
	ld hl, BattleTowerChallengePools
	call GetBattleTowerChallengeIndex
	and a
	jr nz, .got_challenge
	ld a, BATTLETOWER_CHALLENGE_NOVICE

.got_challenge
	cp NUM_BATTLETOWER_CHALLENGES + 1
	jr c, .challenge_ok
	ld a, BATTLETOWER_CHALLENGE_MASTER

.challenge_ok
	dec a
	ld d, a
.skip_challenge
	ld a, d
	and a
	ret z
	ld a, [hli] ; pool count
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	dec d
	jr .skip_challenge

INCLUDE "data/battle_tower/classes.asm"

INCLUDE "data/battle_tower/parties.asm"
