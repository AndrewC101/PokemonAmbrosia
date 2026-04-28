BillsGrandfather:
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wScriptVar], a
	ld [wNamedObjectIndex], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [wScriptVar], a
	ret

OlderHaircutBrother:
	ld hl, HappinessData_OlderHaircutBrother
	jp HaircutOrGrooming

YoungerHaircutBrother:
	ld hl, HappinessData_YoungerHaircutBrother
	jp HaircutOrGrooming

DaisysGrooming:
	farcall SetLevelTo5
	ret

SilverCaveShinify:
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	xor a
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	jr c, .genderless
	jr nz, .male

; shiny female DVs: 15,12,15,15
	ld a, $fc
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .done

.male
; shiny male DVs: 15,13,15,14
	ld a, $fd
	ld [hli], a
	ld a, $fe
	ld [hl], a
	jr .done

.genderless
; shiny genderless DVs: 15,13,15,15
	ld a, $fd
	ld [hli], a
	ld a, $ff
	ld [hl], a

.done
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wTempSpecies], a
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call GetBaseData

	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, TRUE
	predef CalcMonStats

	ld a, 1
	ld [wScriptVar], a
	ret

.cancel
	xor a
	ld [wScriptVar], a
	ret

.egg
	ld a, 2
	ld [wScriptVar], a
	ret

HaircutOrGrooming:
	push hl
	farcall SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	call GetCurNickname
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [wScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret

.egg
	ld a, 1
	ld [wScriptVar], a
	ret

INCLUDE "data/events/happiness_probabilities.asm"

CopyPokemonName_Buffer1_Buffer3:
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

DummyPredef1:
	ret
