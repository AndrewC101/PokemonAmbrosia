SilverCaveTogglePokemonGender::
	farcall SelectMonFromParty
	jp c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .egg
	ld [wCurSpecies], a
	ld [wTempSpecies], a
	call GetBaseData
	ld a, [wBaseGender]
	cp GENDER_UNKNOWN
	jp z, .fixed_gender
	and a ; GENDER_F0
	jp z, .fixed_gender
	cp GENDER_F100
	jp z, .fixed_gender

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l ; CheckShininess takes the selected DV pointer in BC.
	push hl
	callfar CheckShininess
	pop hl
	jr c, .shiny

	; GetGender returns z for female and nz for male. Keep HL on the selected DVs.
	xor a
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	jr nz, .normal_male

	; non-shiny female -> non-shiny male: 15,15,15,14
	ld a, $ff
	ld [hli], a
	ld a, $fe
	ld [hl], a
	jr .recalculate_stats

.normal_male
	; non-shiny male -> non-shiny female: 15,14,15,15
	ld a, $fe
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .recalculate_stats

.shiny
	xor a
	ld [wMonType], a
	push hl
	farcall GetGender
	pop hl
	jr nz, .shiny_male

	; shiny female -> shiny male: 15,13,15,14
	ld a, $fd
	ld [hli], a
	ld a, $fe
	ld [hl], a
	jr .recalculate_stats

.shiny_male
	; shiny male -> shiny female: 15,12,15,15
	ld a, $fc
	ld [hli], a
	ld a, $ff
	ld [hl], a

.recalculate_stats
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
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

.egg
	ld a, 2
	ld [wScriptVar], a
	ret

.fixed_gender
	ld a, 3
	ld [wScriptVar], a
	ret

.cancel
	xor a
	ld [wScriptVar], a
	ret
