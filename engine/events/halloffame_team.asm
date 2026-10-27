DEF wHOFTeamTile EQUS "wStringBuffer2"
DEF wHOFTeamAttr EQUS "(wStringBuffer2 + 1)"
DEF wHOFTeamColumns EQUS "(wStringBuffer2 + 2)"
DEF wHOFTeamRows EQUS "(wStringBuffer2 + 3)"

HOF_ShowTeam:
	xor a
	ld [wHallOfFameMonCounter], a
	call .GetSlotMon
	ret c
	call CancelFollowerUpload
	call ClearSprites
	call ClearBGPalettes
	xor a
	ldh [hBGMapMode], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld [wBoxAlignment], a
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, ' '
	call ByteFill
	newfarcall WipeAttrmap
	ld a, [wBattleTimeOfDay]
	push af
	xor a
	ld [wBattleTimeOfDay], a
.palette_loop
	call .GetSlotMon
	jr c, .player_palette
	ld a, [wHallOfFameMonCounter]
	ld e, a
	ld d, 0
	ld hl, wHOFTeamPalettePairs
	add hl, de
	ld l, [hl]
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	ld de, wBGPals1
	newfarcall LoadMonNormalShinyOrCustomPalette
	ld a, [wHallOfFameMonCounter]
	inc a
	call .KeepPalette
	ld hl, wHallOfFameMonCounter
	inc [hl]
	jr .palette_loop

.player_palette
	newfarcall GetPlayerPalettePointer
	ld de, wBGPals1
	newfarcall LoadPalette_White_Col1_Col2_Black
	ld a, 7
	call .KeepPalette
	ld hl, wOBPals1 palette 1
	ld de, wBGPals1 palette 1
	ld bc, 7 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	pop af
	ld [wBattleTimeOfDay], a
	call DisableLCD
	call .LoadCenteredPlayerPic
	ld a, $54
	ld [wHOFTeamTile], a
	ld a, 7 | VRAM_BANK_1
	ld [wHOFTeamAttr], a
	ld a, 6
	ld [wHOFTeamColumns], a
	ld a, 7
	ld [wHOFTeamRows], a
	lb bc, 6, 7
	call .PlacePic
	ld a, 7
	ld [wHOFTeamColumns], a
	ld a, 6
	ld [wHOFTeamRows], a
	xor a
	ld [wHallOfFameMonCounter], a
.pic_loop
	call .GetSlotMon
	jr c, .pics_done
	xor a
	ldh [rVBK], a
	ld de, vTiles0
	predef GetMonFrontpic
	ld a, [wHallOfFameMonCounter]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .Slots
	add hl, de
	ld a, [hli]
	ldh [rVBK], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	call .CopyCroppedPic
	xor a
	ldh [rVBK], a
	pop hl
	ld a, [hli]
	ld [wHOFTeamTile], a
	ld a, [wHallOfFameMonCounter]
	inc a
	or [hl]
	inc hl
	ld [wHOFTeamAttr], a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call .PlacePic
	ld hl, wHallOfFameMonCounter
	inc [hl]
	jr .pic_loop

.pics_done
	call EnableLCD
	call WaitBGMap2
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
.wait_release
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyDown]
	and PAD_A | PAD_B
	jr nz, .wait_release
	call JoyWaitAorB
	call ClearBGPalettes
	xor a
	ldh [hBGMapMode], a
	ldh [rVBK], a
	newfarcall WipeAttrmap
	ret

.KeepPalette:
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wOBPals1
	add hl, de
	ld d, h
	ld e, l
	ld hl, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

.GetSlotMon:
	ld a, [wHallOfFameMonCounter]
	cp PARTY_LENGTH
	jr nc, .no_mon
	ld hl, wHallOfFameTempMon1
	ld bc, wHallOfFameTempMon1End - wHallOfFameTempMon1
	call AddNTimes
	ld a, [hli]
	and a
	jr z, .no_mon
	cp NUM_POKEMON + 1
	jr nc, .no_mon
	ld [wCurPartySpecies], a
	ld [wTempMonSpecies], a
	inc hl
	inc hl
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld hl, wTempMonDVs
	predef GetUnownLetter
	and a
	ret

.no_mon
	scf
	ret

.LoadCenteredPlayerPic:
	xor a
	ldh [rVBK], a
	farcall GetCardPic
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a
	ld hl, wDecompressScratch
	ld bc, 7 * 7 tiles
	xor a
	call ByteFill
	ld hl, vTiles2
	ld de, wDecompressScratch + 7 tiles
	ld bc, 5 * 7 tiles
	call CopyBytes
	ld a, 1
	ldh [rVBK], a
	ld hl, wDecompressScratch
	ld de, vTiles2 tile $54
	ld bc, 6 * 7 tiles
.shift_byte
	push bc
	ld a, [hl]
	swap a
	and $f0
	ld b, a
	push hl
	ld a, l
	add LOW(7 tiles)
	ld l, a
	ld a, h
	adc HIGH(7 tiles)
	ld h, a
	ld a, [hl]
	swap a
	and $0f
	or b
	ld [de], a
	inc de
	pop hl
	inc hl
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .shift_byte
	xor a
	ldh [rVBK], a
	pop af
	ldh [rWBK], a
	ret

.CopyCroppedPic:
	ld a, [wCurPartySpecies]
	ld b, 8
	cp STEELIX
	jr z, .crop_override
	cp LUGIA
	jr z, .crop_override
	ld b, $ff
.crop_override
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a
	ld a, b
	cp 8
	jr z, .got_crop
	push de
	call .CountBlankRows
	pop de
.got_crop
	add a
	ld c, a
	ld b, 0
	ld hl, wDecompressScratch
	add hl, bc
	ld a, 7
.copy_column
	push af
	ld bc, 6 tiles
	call CopyBytes
	ld bc, 1 tiles
	add hl, bc
	pop af
	dec a
	jr nz, .copy_column
	pop af
	ldh [rWBK], a
	ret

.CountBlankRows:
	ld hl, wDecompressScratch
	ld b, 0
.check_row
	ld a, b
	cp 8
	ret z
	push hl
	ld c, 7
.check_column
	ld a, [hli]
	or [hl]
	jr nz, .found_pixels
	ld de, 7 tiles - 1
	add hl, de
	dec c
	jr nz, .check_column
	pop hl
	inc hl
	inc hl
	inc b
	jr .check_row

.found_pixels
	pop hl
	ld a, b
	ret

.PlacePic:
	ld hl, wTilemap
	ld de, SCREEN_WIDTH
	inc b
.find_row
	dec b
	jr z, .got_row
	add hl, de
	jr .find_row
.got_row
	ld b, 0
	add hl, bc
	push hl
	ld a, [wHOFTeamTile]
	ld c, a
	ld a, [wHOFTeamColumns]
	ld e, a
.tile_column
	push hl
	ld a, [wHOFTeamRows]
	ld b, a
.tile_row
	ld [hl], c
	inc c
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec b
	jr nz, .tile_row
	pop hl
	inc hl
	dec e
	jr nz, .tile_column
	pop hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld a, [wHOFTeamRows]
	ld b, a
.attr_row
	push hl
	ld a, [wHOFTeamColumns]
	ld c, a
	ld a, [wHOFTeamAttr]
.attr_column
	ld [hli], a
	dec c
	jr nz, .attr_column
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .attr_row
	ret

.Slots:
	table_width 8
	db 0
	dw vTiles2 tile $00
	db $00, 0, 2, 0, 0
	db 0
	dw vTiles2 tile $2a
	db $2a, 0, 11, 0, 0
	db 1
	dw vTiles2 tile $00
	db $00, VRAM_BANK_1, 0, 6, 0
	db 1
	dw vTiles2 tile $2a
	db $2a, VRAM_BANK_1, 13, 6, 0
	db 1
	dw vTiles1 tile $00
	db $80, VRAM_BANK_1, 0, 12, 0
	db 1
	dw vTiles1 tile $2a
	db $aa, VRAM_BANK_1, 13, 12, 0
	assert_table_length PARTY_LENGTH

HOF_ShowCeremonyTeam:
	ld hl, wHallOfFamePalettePairs
	ld de, wHOFTeamPalettePairs
	ld bc, PARTY_LENGTH
	call CopyBytes
	jp HOF_ShowTeam
