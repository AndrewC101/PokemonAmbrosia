CheckPartyFullAfterContest:
	ld a, [wContestMonSpecies]
	and a
	jp z, .DidntCatchAnything
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wContestMonSpecies]
	ld [hli], a
	ld [wCurSpecies], a
	ld a, -1
	ld [hl], a
	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOTs
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname

.Party_SkipNickname:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call SetCaughtData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, LANDMARK_NATIONAL_PARK
	or b
	ld [hl], a
	xor a
	ld [wContestMonSpecies], a
	and a ; BUGCONTEST_CAUGHT_MON
	ld [wScriptVar], a
	ret

.TryAddToBox:
	newfarcall NewStorageBoxPointer
	jr c, .BoxFull
	push bc
	xor a
	ld [wCurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, wPlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wBufferMonAltSpecies], a
	ld [wNamedObjectIndex], a
	call GetPokemonName
	pop bc
	ld a, b
	ld [wBufferMonBox], a
	ld a, c
	ld [wBufferMonSlot], a
	newfarcall UpdateStorageBoxMonFromTemp
	call GiveANickname_YesNo
	ld hl, wStringBuffer1
	jr c, .Box_SkipNickname
	ld a, BUFFERMON
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld de, wBufferMonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	newfarcall UpdateStorageBoxMonFromTemp

.BoxFull:
	ld a, [wBufferMonLevel]
	ld [wCurPartyLevel], a
	call SetBoxMonCaughtData
	ld hl, wBufferMonCaughtLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, LANDMARK_NATIONAL_PARK
	or b
	ld [hl], a
	newfarcall UpdateStorageBoxMonFromTemp
	xor a
	ld [wContestMon], a
	ld a, BUGCONTEST_BOXED_MON
	ld [wScriptVar], a
	ret

.DidntCatchAnything:
	ld a, BUGCONTEST_NO_CATCH
	ld [wScriptVar], a
	ret

GiveANickname_YesNo:
	ld hl, CaughtAskNicknameText
	call PrintText
	jp YesNoBox

CaughtAskNicknameText:
	text_far _CaughtAskNicknameText
	text_end

BuildGiftMonIntoStorage::
; Script gift mons with a full party need a box path that builds from the
; gift-generation flow, not from battle enemy state.
	newfarcall NewStorageBoxPointer
	ret c

	push bc

	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wCurPartySpecies]
	ld [wBufferMonSpecies], a

	ld a, [wCurItem]
	ld [wBufferMonItem], a

	ld hl, wBufferMonMoves
	xor a
	ld bc, NUM_MOVES
	call ByteFill
	ld de, wBufferMonMoves
	ld [wSkipMovesBeforeLevelUp], a
	predef FillMoves

	ld hl, wPlayerID
	ld de, wBufferMonID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	ld hl, wBufferMonExp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a

	xor a
	ld hl, wBufferMonStatExp
	ld bc, MON_DVS - MON_STAT_EXP
	call ByteFill

	call BattleRandom
	cp 2 percent
	jr c, .shiny_dvs

	ld a, [wCurPartySpecies]
	cp PIKACHU
	jr nz, .random_dvs
	ld b, $ff
	ld c, $ff
	jr .write_dvs

.random_dvs
	call Random
	ld b, a
	call Random
	ld c, a
	jr .write_dvs

.shiny_dvs
	call BattleRandom
	cp 50 percent
	jr c, .shiny_2
	ld b, ATKDEFDV_SHINY_1
	ld c, SPDSPCDV_SHINY_1
	jr .write_dvs

.shiny_2
	ld b, ATKDEFDV_SHINY_2
	ld c, SPDSPCDV_SHINY_2

.write_dvs
	ld hl, wBufferMonDVs
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a

	ld hl, wBufferMonMoves
	ld de, wBufferMonPP
	predef FillPP

	ld a, BASE_HAPPINESS
	ld [wBufferMonHappiness], a
	xor a
	ld [wBufferMonPokerusStatus], a
	ld hl, wBufferMonCaughtData
	ld [hli], a
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld [wBufferMonLevel], a

	ld hl, wPlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wBufferMonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld a, [wCurPartySpecies]
	ld [wBufferMonAltSpecies], a

	pop bc
	ld a, b
	ld [wBufferMonBox], a
	ld a, c
	ld [wBufferMonSlot], a

	ld hl, wBufferMonCaughtData
	call SetBoxmonOrEggmonCaughtData

	newfarcall UpdateStorageBoxMonFromTemp
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	dec a
	call CheckCaughtMon
	ld a, [wTempSpecies]
	dec a
	call SetSeenAndCaughtMon
	scf
	ret

FinalizeGiftBoxMon::
; Reload the just-written gift mon from storage, apply the final nickname
; buffer, then write it back.
	ld a, [wBufferMonBox]
	ld b, a
	ld a, [wBufferMonSlot]
	ld c, a
	newfarcall GetStorageBoxMon

	ld hl, wMonOrItemNameBuffer
	ld de, wBufferMonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	newfarcall UpdateStorageBoxMonFromTemp
	ret

SetCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLevel
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData:
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	and CAUGHT_TIME_MASK
	ld b, a
	ld a, [wCurPartyLevel]
	or b
	ld [hli], a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokecenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokecenter2F

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a

.NotPokecenter2F:
	call GetWorldMapLocation
	ld b, a
	ld a, [wPlayerGender]
	rrca ; shift bit 0 (PLAYERGENDER_FEMALE_F) to bit 7 (CAUGHT_GENDER_MASK)
	or b
	ld [hl], a
	ret

SetBoxMonCaughtData:
	ld hl, wBufferMonCaughtData
	call SetBoxmonOrEggmonCaughtData
	newfarjp UpdateStorageBoxMonFromTemp

SetGiftBoxMonCaughtData:
	ld hl, wBufferMonCaughtLevel
	call SetGiftMonCaughtData
	newfarjp UpdateStorageBoxMonFromTemp

SetGiftPartyMonCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData:
	xor a
	ld [hli], a
	ld a, LANDMARK_GIFT
	rrc b
	or b
	ld [hl], a
	ret

SetEggMonCaughtData:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtLevel
	call GetPartyLocation
	ld a, [wCurPartyLevel]
	push af
	ld a, CAUGHT_EGG_LEVEL
	ld [wCurPartyLevel], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [wCurPartyLevel], a
	ret
