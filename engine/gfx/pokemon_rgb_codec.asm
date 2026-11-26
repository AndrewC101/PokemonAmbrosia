ReadMonPaletteChoices::
	ld a, [hli]
	and $f8
	rrca
	rrca
	rrca
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and 7
	rrca
	rrca
	rrca
	or b
	ld b, a
	ld a, [hl]
	and $38
	rrca
	rrca
	rrca
	bit 2, a
	jr nz, .both_rgb
	and a
	jr z, .presets
	cp 3
	jr z, .invalid
	push af
	ld a, b
	and $e0
	jr nz, .invalid_tag
	ld a, b
	srl a
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid_tag
	ld e, a
	ld d, 0
	ld a, b
	and 1
	or 1 << MON_RGB_CHOICE_F
	ld b, a
	pop af
	cp 1
	ret z
	push bc
	ld b, d
	ld c, e
	pop de
	ret
.invalid_tag
	pop af
.invalid
	ld bc, 0
	ld de, 0
	ret
.presets
	ld a, b
	and a
	jr nz, .invalid
	ld a, c
	and $f
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld e, a
	ld d, 0
	ld a, c
	swap a
	and $f
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld c, a
	ret
.both_rgb
	ld d, a
	srl d
	ld a, b
	rra
	ld e, a
	ld a, b
	and 1
	or 1 << MON_RGB_CHOICE_F
	ld b, a
	ld a, d
	and 1
	or 1 << MON_RGB_CHOICE_F
	ld d, a
	ret

WriteMonPaletteChoices::
	push hl
	bit MON_RGB_CHOICE_F, b
	jr nz, .light_rgb
	bit MON_RGB_CHOICE_F, d
	jr nz, .dark_rgb
	ld a, c
	swap a
	or e
	ld c, a
	ld b, 0
	xor a
	jr .store
.light_rgb
	bit MON_RGB_CHOICE_F, d
	jr nz, .both_rgb
	ld a, 1
	jr .mixed
.dark_rgb
	push bc
	ld b, d
	ld c, e
	pop de
	ld a, 2
.mixed
	push af
	ld a, e
	add a
	ld e, a
	ld a, b
	and 1
	or e
	ld b, a
	pop af
	jr .store
.both_rgb
	ld a, b
	and 1
	ld b, a
	ld a, e
	add a
	or b
	ld b, a
	ld a, d
	and 1
	add a
	ld d, a
	ld a, e
	rlca
	and 1
	or d
	or 4
.store
	ld d, a
	pop hl
	ld a, b
	and $1f
	add a
	add a
	add a
	ld e, a
	ld a, [hl]
	and MON_POKERUS_MASK
	or e
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	rlca
	rlca
	rlca
	and 7
	ld e, a
	ld a, d
	add a
	add a
	add a
	or e
	ld e, a
	ld a, [hl]
	and MON_OT_GENDER_MASK
	or e
	ld [hl], a
	ret

ExpandMonRGBChoice::
	push hl
	push de
	ld a, c
	and 7
	call .channel
	ld e, a
	ld a, c
	rrca
	rrca
	rrca
	and 7
	call .channel
	ld d, a
	ld a, c
	and $c0
	rlca
	rlca
	bit 0, b
	jr z, .blue
	or 4
.blue
	call .channel
	add a
	add a
	ld b, a
	ld a, d
	swap a
	rlca
	and 3
	or b
	ld b, a
	ld a, d
	rrca
	rrca
	rrca
	and $e0
	or e
	ld c, a
	pop de
	pop hl
	ret
.channel
	push de
	ld e, a
	ld d, 0
	ld hl, .levels
	add hl, de
	ld a, [hl]
	pop de
	ret
.levels
	db 0, 4, 9, 13, 18, 22, 27, 31

ImportLinkMonPalette:
	push hl
	push bc
	ld a, [hl]
	and $f
	jr z, .inactive
	cp MON_POKERUS_CURED
	jr c, .store_status
	ld a, 4
	jr .store_status
.inactive
	ld a, [hl]
	and $f0
	jr z, .store_status
	ld a, MON_POKERUS_CURED
.store_status
	ld [hli], a
	ld a, [hl]
	call NormalizeLegacyPalettePair
	ld [hli], a
	ld a, [hl]
	and CAUGHT_LOCATION_MASK
	jr z, .unknown
	cp LANDMARK_EVENT
	jr z, .unknown
	bit 7, [hl]
	ld a, MON_OT_MALE
	jr z, .gender
	ld a, MON_OT_FEMALE
	jr .gender
.unknown
	xor a
.gender
	ld [hl], a
	pop bc
	pop hl
	ret

NormalizeLegacyPalettePair:
	ld b, a
	and $f
	jr z, .default
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .default
	ld a, b
	swap a
	and $f
	jr z, .default
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	ld a, b
	ret c
.default
	xor a
	ret

ImportLinkPartyPalettes::
	ld hl, wOTPartyMon1PokerusStatus
	ld bc, PARTY_LENGTH
.loop
	call ImportLinkMonPalette
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret

ExportLinkPartyPalettes::
	ld hl, wLinkPlayerPartyMon1PokerusStatus
	ld a, PARTY_LENGTH
.loop
	push af
	push hl
	call ExportLegacyMonPalette
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop af
	dec a
	jr nz, .loop
	ret

ExportLegacyMonPalette:
	push hl
	push hl
	ld de, -MON_POKERUS
	add hl, de
	ld a, [hl]
	ld de, MON_DVS
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld de, wMonResolvedPalette
	call CopyMonRecordMiddleColors
	pop hl
	push hl
	call ReadMonPaletteChoices
	ld a, b
	or c
	or d
	or e
	jr z, .write_pair
	push de
	ld hl, wMonResolvedPalette
	ld de, MonRGBLightPresetIDs
	call LegacyMonColorChoice
	swap a
	pop bc
	push af
	ld hl, wMonResolvedPalette + COLOR_SIZE
	ld de, MonRGBDarkPresetIDs
	call LegacyMonColorChoice
	ld c, a
	pop af
	or c
.write_pair
	ld c, a
	pop hl
	ld a, [hl]
	and MON_POKERUS_MASK
	jr z, .write_status
	cp MON_POKERUS_CURED
	jr c, .active
	xor a
.active
	or $10
.write_status
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [hl]
	and MON_OT_GENDER_MASK
	jr z, .write_gender
	bit 7, a
	ld a, LANDMARK_GIFT
	jr z, .write_gender
	or CAUGHT_GENDER_MASK
.write_gender
	ld [hl], a
	ret

LegacyMonColorChoice:
	bit MON_RGB_CHOICE_F, b
	jr nz, .lookup
	ld a, c
	and a
	ret nz
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call QuantizeMonRGBWord
.lookup
	res MON_RGB_CHOICE_F, b
	srl b
	rr c
	ld h, d
	ld l, e
	push af
	add hl, bc
	pop af
	ld a, [hl]
	jr nc, .low
	swap a
.low
	and $f
	ret

QuantizeMonRGBWord:
	ld a, c
	and $1f
	call QuantizeMonRGBChannel
	push af
	ld a, c
	rlca
	rlca
	rlca
	and 7
	ld h, a
	ld a, b
	and 3
	swap a
	rrca
	or h
	call QuantizeMonRGBChannel
	add a
	add a
	add a
	ld h, a
	pop af
	or h
	ld c, a
	ld a, b
	rrca
	rrca
	and $1f
	call QuantizeMonRGBChannel
	ld b, a
	rrca
	rrca
	and $c0
	or c
	ld c, a
	srl b
	srl b
	ret

QuantizeMonRGBChannel::
	push bc
	push hl
	ld c, a
	ld b, 0
	ld hl, .steps
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	ret
.steps
	for rgb_component_index, 32
		db (rgb_component_index * 7 + 15) / 31
	endr
