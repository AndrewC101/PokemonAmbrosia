LoadMonDefaultPalette:
	newfarcall GetPlayerOrMonPalettePointer
	newfarjp LoadPalette_White_Col1_Col2_Black

GetMonPresetColor:
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

LoadMonRecordPalette::
	push de
	ld de, wMonResolvedPalette
	call CopyMonRecordMiddleColors
FinishMonRecordPalette:
	pop de
	ld hl, wMonResolvedPalette
	newfarjp LoadPalette_White_Col1_Col2_Black

CopyMonRecordMiddleColors::
	and a
	jr z, CopyMonDefaultMiddleColors
	cp NUM_POKEMON + 1
	jr nc, CopyMonDefaultMiddleColors
	push hl
	push de
	call CopyMonDefaultMiddleColors
	jr ApplyMonRecordMiddleColors

CopyMonDefaultMiddleColors:
	newfarcall GetPlayerOrMonPalettePointer
CopyNativeMonMiddleColors:
	ld bc, 2 * COLOR_SIZE
	ld a, BANK(PokemonPalettes)
	jp FarCopyBytes

ApplyMonRecordMiddleColors:
	pop de
	pop hl
	push de
	call ReadMonPaletteChoices
	pop hl
	push de
	ld de, PokemonCustomLightColors
	call ApplyMonColorChoice
	pop bc
	ld de, PokemonCustomDarkColors
	call ApplyMonColorChoice
	ld d, h
	ld e, l
	ret

ApplyMonColorChoice:
	bit MON_RGB_CHOICE_F, b
	jr nz, .rgb
	ld a, c
	and a
	jr z, .keep
	push hl
	ld h, d
	ld l, e
	call GetMonPresetColor
	pop hl
	jr .write
.rgb
	call ExpandMonRGBChoice
.write
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	ret
.keep
	inc hl
	inc hl
	ret

LoadBattleMonNormalShinyOrCustomPalette::
	ld a, [wTempBattleMonSpecies]
	and a
	jr z, .player
	ld hl, wPartyMon1PokerusStatus
	ld a, [wCurBattleMon]
	call GetPartyLocation
	push hl
	newfarcall GetPartyMonDVs
	ld c, l
	ld b, h
	pop hl
	ld a, [wTempBattleMonSpecies]
	jp LoadMonRecordPalette

.player
	jp LoadMonDefaultPalette

LoadEnemyMonNormalShinyOrCustomPalette::
	ld a, [wTempEnemyMonSpecies]
	and a
	jr nz, .pokemon
	ld a, [wTrainerClass]
	cp CAL
	jr z, .player
	cp CAL_F
	jr z, .player
	newfarcall GetTrainerPalettePointer
	newfarjp LoadPalette_White_Col1_Col2_Black

.pokemon
	newfarcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr nz, .wild
	push bc
	ld hl, wOTPartyMon1PokerusStatus
	ld a, [wCurOTMon]
	call GetPartyLocation
	pop bc
	push de
	ld de, wMonResolvedPalette
	call CopyEnemyMonRecordMiddleColors
	jp FinishMonRecordPalette
.wild
	ld a, [wTempEnemyMonSpecies]
	newfarcall GetEnemyMonNormalOrShinyPalettePointer
	newfarjp LoadPalette_White_Col1_Col2_Black
.player
	xor a
	jp LoadMonDefaultPalette

CopyEnemyMonRecordMiddleColors:
	push hl
	push de
	ld a, [wTempEnemyMonSpecies]
	newfarcall GetEnemyMonNormalOrShinyPalettePointer
	call CopyNativeMonMiddleColors
	jp ApplyMonRecordMiddleColors

StoreCurrentTrainerMonPalette::
; Input: hl = light color in the banked trainer record.
; Output: hl advanced past the light and dark color bytes.
; A default or invalid component makes the packed party field use species colors.
; Preserves bc and de.
	push bc
	push de
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ld b, a
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ld c, a
	push hl ; retain the advanced trainer-record cursor while locating the party field
	ld a, b
	and a
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	swap a
	ld b, a
	ld a, c
	and a
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	or b
	jr .store

.invalid
	xor a

.store
	push af
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1PalettePair
	call GetPartyLocation
	pop af
	ld [hli], a
	ld a, [hl]
	and MON_OT_GENDER_MASK
	ld [hld], a
	dec hl
	ld a, [hl]
	and MON_POKERUS_MASK
	ld [hl], a
	pop hl
	pop de
	pop bc
	ret

CopyPlayerPartyPalettePairsToOT::
	push af
	push bc
	push de
	push hl
	ld hl, wPartyMon1PokerusStatus
	ld de, wOTPartyMon1PokerusStatus
	call CopyPartyPalettePairs
	pop hl
	pop de
	pop bc
	pop af
	ret

CopyOTPartyPalettePairsToPlayer::
	push af
	push bc
	push de
	push hl
	ld hl, wOTPartyMon1PokerusStatus
	ld de, wPartyMon1PokerusStatus
	call CopyPartyPalettePairs
	pop hl
	pop de
	pop bc
	pop af
	ret

CopyPartyPalettePairs:
	ld b, PARTY_LENGTH
.loop
	ld a, [de]
	and MON_POKERUS_MASK
	ld c, a
	ld a, [hli]
	and ~MON_POKERUS_MASK
	or c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [de]
	and MON_OT_GENDER_MASK
	ld c, a
	ld a, [hli]
	and ~MON_OT_GENDER_MASK
	or c
	ld [de], a
	inc de
	ld a, l
	add PARTYMON_STRUCT_LENGTH - MON_PALETTE_RECORD_SIZE
	ld l, a
	jr nc, .hl_ok
	inc h
.hl_ok
	ld a, e
	add PARTYMON_STRUCT_LENGTH - MON_PALETTE_RECORD_SIZE
	ld e, a
	jr nc, .de_ok
	inc d
.de_ok
	dec b
	jr nz, .loop
	ret

BuildHallOfFamePalettePairs::
	ld de, wHallOfFamePalettePairs

BuildHallOfFamePalettePairsAtDE::
	push de
	ld h, d
	ld l, e
	ld bc, PARTY_LENGTH * MON_PALETTE_RECORD_SIZE
	xor a
	call ByteFill
	pop de
	ld hl, wPartySpecies
	ld c, 0
.loop
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr z, .next
	push hl
	push bc
	ld a, c
	ld hl, wPartyMon1PokerusStatus
	call GetPartyLocation
	ld bc, MON_PALETTE_RECORD_SIZE
	call CopyBytes
	pop bc
	pop hl
.next
	inc c
	jr .loop

LoadHallOfFameMonPalette::
	ld a, [wHallOfFameMonCounter]
	cp PARTY_LENGTH
	jr nc, .default
	ld hl, wHallOfFamePalettePairs
	ld bc, MON_PALETTE_RECORD_SIZE
	call AddNTimes
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	ld de, wBGPals1
	jp LoadMonRecordPalette
.default
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	ld de, wBGPals1
	jp LoadMonDefaultPalette

OverridePartyMenuIconPaletteWithCustom::
	push bc
	push de
	push hl
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .fallback
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1PokerusStatus
	call GetPartyLocation
	ld a, [wCurPartySpecies]
	call GetMonRecordIconFamily
	jr nc, .fallback
	pop hl
	pop de
	ld e, a
	pop bc
	ret
.fallback
	pop hl
	pop de
	ld a, e
	pop bc
	ret

OverrideBillsPCIconPaletteWithCustom::
	ld a, [wBufferMonAltSpecies]
	cp EGG
	ret z
	push bc
	push de
	ld hl, wBufferMonPokerusStatus
	call GetMonRecordIconFamily
	pop de
	pop bc
	ret nc
	newfarjp GetIconPalInBCDE

GetMonRecordIconFamily:
	push af
	call ReadMonPaletteChoices
	pop af
	newfarcall ShouldUseSecondMenuMonColor
	jr nc, .light
	ld b, d
	ld c, e
.light
	bit MON_RGB_CHOICE_F, b
	jr nz, GetMonRGBIconFamily
	ld a, c
	and a
	ret z
	dec a
	ld hl, MonPresetIconFamilies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	scf
	ret

GetMonRGBIconFamily:
	res MON_RGB_CHOICE_F, b
	srl b
	rr c
	push af
	ld hl, MonRGBIconFamilies
	add hl, bc
	pop af
	ld a, [hl]
	jr nc, .low
	swap a
.low
	and $f
	scf
	ret

MonPresetIconFamilies:
	table_width 1
	db PAL_ICON_RED
	db PAL_ICON_BLUE
	db PAL_ICON_GREEN
	db PAL_ICON_BROWN
	db PAL_ICON_SILVER
	db PAL_ICON_GOLD
	db PAL_ICON_RED
	db PAL_ICON_PURPLE
	db PAL_ICON_RED
	db PAL_ICON_BLUE
	db PAL_ICON_GOLD
	assert_table_length NUM_CUSTOM_PALETTE_COLORS

INCLUDE "data/pokemon/rgb_icon_families.asm"

; The player palette can also be read through the bank passed to FarCopyBytes.
assert BANK(PokemonPalettes) == BANK(RedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(DeepRedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(GoldPlayerPalette)

INCLUDE "data/pokemon/custom_palette_colors.asm"
