LoadOpponentTrainerAndPokemon:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainer)
	ldh [rSVBK], a

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
; Crystal 1.0 used the wrong constant here, so only the first 21
; trainers in BattleTowerTrainers can be sampled.
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
	ldh [rSVBK], a

	ret

LoadRandomBattleTowerMon:
	;ld c, BATTLETOWER_PARTY_LENGTH
	ld a, 6
	ld c, a
.loop
	push bc
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

.FindARandomBattleTowerMon:
	; From Which LevelGroup are the mon loaded
	; a = 1..10 - not anymore, is now 1-5
	ld a, [wBTChoiceOfLvlGroup] ; get level group choice
	dec a ; group choice is 0 - 4
	ld hl, BattleTowerMons
	ld bc, BATTLETOWER_NUM_UNIQUE_MON * NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes ; increment hl by a * bc, so we are at the right mon

	ldh a, [hRandomAdd]
	ld b, a
.resample
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b is the number of mon to go forward

	ld a, [wBTChoiceOfLvlGroup]
	cp 5 ; 5 is master level
	jr z, .masterLevel

    ld a, [wNrOfBeatenBattleTowerTrainers]
    cp BATTLETOWER_STREAK_LENGTH - 1
    jr z, .lastTrainer
    ld a, b
	maskbits BATTLETOWER_NUM_UNIQUE_MON
	cp BATTLETOWER_NUM_UNIQUE_MON
	jr nc, .resample ; here we loop around if we have jumped a level group
    and a
    jr z, .resample ; only the last trainer can have the runkiller
	jr .continue
.lastTrainer
    ld a, b
    cp 20 ; last trainer only uses 20 strongest mons, can pick the runkiller
    jr nc, .resample

; DevNote - BT - master level specific logic here
.masterLevel
    ld a, [wNrOfBeatenBattleTowerTrainers]
    cp BATTLETOWER_STREAK_LENGTH - 1
    jr z, .lastTrainerMaster
    ld a, b
; DevNote - Battle Tower - master has a pool of 80 Pokemon rather than 40
    cp 80
    jr nc, .resample
; mon 0 is Mewtwo, since we are not the last trainer we try again if we get it
    and a
    jr z, .resample ; only the last trainer can have mewtwo
; The first 12 mons are Uber - if we have one 75% chance to try again, don't want too many Ubers
    ld a, b
    cp 11
    jr nc, .continue
	call Random
	cp 75 percent
	jr c, .resample
	ld a, b
	jr .continue
; last trainer only uses 40 strongest mons and can pick Mewtwo
.lastTrainerMaster
    ld a, b
    cp 40
    jr nc, .resample

.continue
	; in register 'a' is the chosen mon of the LevelGroup
	; Check if mon was already loaded before
	; Check current and the 2 previous teams
	; includes check if item is double at the current team
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a

	; DevNote - Battle Tower - ensure enemy mon are unique species
	; no item restrictions
	ld a, [wBT_OTMon1]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [wBT_OTMon2]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [wBT_OTMon3]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevTrainer1]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevTrainer2]
	cp b
	jp z, .FindARandomBattleTowerMon

    ld a, [sBTMonPrevTrainer3]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer1]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer2]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld a, [sBTMonPrevPrevTrainer3]
	cp b
	jp z, .FindARandomBattleTowerMon

	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wNamedObjectIndex]
	push af
	push de
	ld hl, -NICKNAMED_MON_STRUCT_LENGTH
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	pop de
	pop af
	ld [wNamedObjectIndex], a
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

INCLUDE "data/battle_tower/classes.asm"

INCLUDE "data/battle_tower/parties.asm"
