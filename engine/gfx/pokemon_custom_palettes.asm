LoadMonNormalShinyOrCustomPalette::
; Load a complete CGB Pokemon palette.
; Input: a = species, or zero for the player palette
;        bc = DV pointer
;        de = destination palette buffer
;        l = encoded light/dark custom color pair
; Output: de advances by one palette, as in LoadPalette_White_Col1_Col2_Black.
; Clobbers: af, bc, hl. The far calls preserve de and the four scratch bytes
; above sp until the bank-2 palette loader consumes them.
	and a
	jr z, .default
	cp NUM_POKEMON + 1
	jr nc, .default ; Eggs and reserved species always use their own palettes.

	; A valid custom pair takes precedence over the DV-based shiny palette.
	; Save the species so the default branch can still perform its normal lookup.
	push af
	call .IsCustomPairValid
	jr nc, .invalid
	pop af ; discard the saved species after validation

	; push rr stores the low register first at [sp]. Push dark before light so
	; the four WRAM0 stack bytes read as light lo/hi, then dark lo/hi.
	ld a, l
	push af ; keep the encoded pair above the four-byte palette scratch
	and $f
	ld hl, PokemonCustomDarkColors
	call .GetColor
	push bc
	ld hl, sp+3
	ld a, [hl]
	swap a
	and $f
	ld hl, PokemonCustomLightColors
	call .GetColor
	push bc
	ld hl, sp+0
	newfarcall LoadPalette_White_Col1_Col2_Black
	add sp, 4
	pop af
	ret

.invalid
	pop af
.default
	; The pointer and loader both live in bank 2. Resolving the pointer first,
	; then making a second banked call, keeps its hl result valid for the load.
	newfarcall GetPlayerOrMonPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
	ret

.IsCustomPairValid:
; Return carry when both nibbles in l name one of the eleven shared colors.
	ld a, l
	and $f
	ret z
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	ret nc
	ld a, l
	swap a
	and $f
	ret z
	cp NUM_CUSTOM_PALETTE_COLORS + 1 ; carry denotes a valid high nibble
	ret

.GetColor:
; Read one little-endian RGB word. Input: a = index 1..11, hl = table.
; Output: c = low byte, b = high byte.
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

CopyMonNormalShinyOrCustomMiddleColors::
; Copy only the two middle colors for Bill's PC palette animation.
; Inputs match LoadMonNormalShinyOrCustomPalette; output de advances four bytes.
; Clobbers af, bc, hl. Default data is copied bank-safely from bank 2.
	and a
	jr z, .default
	cp NUM_POKEMON + 1
	jr nc, .default
	push af
	call LoadMonNormalShinyOrCustomPalette.IsCustomPairValid
	jr nc, .invalid
	pop af

	ld a, l
	push af
	and $f
	ld hl, PokemonCustomDarkColors
	call LoadMonNormalShinyOrCustomPalette.GetColor
	push bc
	ld hl, sp+3
	ld a, [hl]
	swap a
	and $f
	ld hl, PokemonCustomLightColors
	call LoadMonNormalShinyOrCustomPalette.GetColor
	push bc
	ld hl, sp+0
	ld bc, 2 * COLOR_SIZE
	call CopyBytes
	add sp, 4
	pop af
	ret

.invalid
	pop af
.default
	newfarcall GetPlayerOrMonPalettePointer
	ld bc, 2 * COLOR_SIZE
	ld a, BANK(PokemonPalettes)
	jp FarCopyBytes

LoadBattleMonNormalShinyOrCustomPalette::
; The battle_struct has no PalettePair, so use the active owning party slot.
; Transform changes the displayed species/DVs but deliberately keeps this pair.
	ld a, [wTempBattleMonSpecies]
	and a
	jr z, .player
	ld hl, wPartyMon1PalettePair
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ld a, [hl]
	push af
	newfarcall GetPartyMonDVs
	ld c, l
	ld b, h
	pop af
	ld l, a
	ld a, [wTempBattleMonSpecies]
	jp LoadMonNormalShinyOrCustomPalette

.player
	ld l, MON_PALETTE_DEFAULT
	jp LoadMonNormalShinyOrCustomPalette

LoadEnemyMonNormalShinyOrCustomPalette::
; Trainer and link opponents own wOTPartyMons. Wild Pokemon have no stored pair.
	ld a, [wTempEnemyMonSpecies]
	and a
	jr nz, .pokemon
	; A zero enemy species normally selects the opposing trainer palette. CAL
	; classes mirror the player and retain the zero-species player sentinel.
	ld a, [wTrainerClass]
	cp CAL
	jr z, .player
	cp CAL_F
	jr z, .player
	newfarcall GetTrainerPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
	ret

.pokemon
	ld l, MON_PALETTE_DEFAULT
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr nz, .got_pair
	ld hl, wOTPartyMon1PalettePair
	ld a, [wCurOTMon]
	call GetPartyLocation
	ld l, [hl]
.got_pair
	ld a, l
	push af
	newfarcall GetEnemyMonDVs
	ld c, l
	ld b, h
	pop af
	ld l, a
	ld a, [wTempEnemyMonSpecies]
	push af
	ld a, [wOtherTrainerClass]
	cp LORD_OAK
	jr z, .lord_oak
	pop af
	jp LoadMonNormalShinyOrCustomPalette

.lord_oak
	; A custom pair overrides Lord Oak's forced-shiny rule as it does DV shininess.
	call LoadMonNormalShinyOrCustomPalette.IsCustomPairValid
	jr nc, .lord_oak_shiny
	pop af
	jp LoadMonNormalShinyOrCustomPalette

.lord_oak_shiny
	; With no custom pair, retain Lord Oak's existing forced-shiny palette.
	pop af
	newfarcall GetEnemyMonNormalOrShinyPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
	ret

.player
	; CAL/CAL_F comparisons leave a holding the trainer class; restore the zero
	; species sentinel so the shared loader selects the current player palette.
	xor a
	ld l, MON_PALETTE_DEFAULT
	jp LoadMonNormalShinyOrCustomPalette

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
	ld hl, wPartyMon1PalettePair
	ld de, wOTPartyMon1PalettePair
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
	ld hl, wOTPartyMon1PalettePair
	ld de, wPartyMon1PalettePair
	call CopyPartyPalettePairs
	pop hl
	pop de
	pop bc
	pop af
	ret

CopyPartyPalettePairs:
; Copy the non-contiguous field across all six fixed party struct slots.
; Low-byte additions explicitly propagate carry into each pointer's high byte.
	ld b, PARTY_LENGTH
.loop
	ld a, [hl]
	ld [de], a
	ld a, l
	add PARTYMON_STRUCT_LENGTH
	ld l, a
	jr nc, .hl_ok
	inc h
.hl_ok
	ld a, e
	add PARTYMON_STRUCT_LENGTH
	ld e, a
	jr nc, .de_ok
	inc d
.de_ok
	dec b
	jr nz, .loop
	ret

OverridePartyMenuIconPaletteWithCustom::
; Input: a/e = the species/shiny icon palette from GetMenuMonIconPalette.
; Output: a/e = that fallback, or the six-color approximation for a custom pair.
; Preserve bc, de except for e, and hl; wCurPartyMon identifies the owner.
	push bc
	push de
	push hl
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .fallback
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1PalettePair
	call GetPartyLocation
	ld l, [hl]
	call LoadMonNormalShinyOrCustomPalette.IsCustomPairValid
	jr nc, .fallback

	; The high nibble is the player's first (lighter) color choice.
	ld a, l
	swap a
	and $f
	dec a
	ld c, a
	ld b, 0
	ld hl, .ColorMap
	add hl, bc
	ld c, [hl]
	pop hl
	pop de
	ld a, c
	ld e, a
	jr .done

.fallback
	pop hl
	pop de
	ld a, e
.done
	pop bc
	ret

.ColorMap:
	table_width 1
	db PAL_ICON_RED    ; red
	db PAL_ICON_BLUE   ; blue
	db PAL_ICON_GREEN  ; green
	db PAL_ICON_BROWN  ; brown
	db PAL_ICON_SILVER ; silver
	db PAL_ICON_GOLD   ; yellow
	db PAL_ICON_RED    ; pink
	db PAL_ICON_PURPLE ; purple
	db PAL_ICON_RED    ; orange
	db PAL_ICON_BLUE   ; black
	db PAL_ICON_GOLD   ; gold
	assert_table_length NUM_CUSTOM_PALETTE_COLORS

; CopyMonNormalShinyOrCustomMiddleColors may also receive the zero player
; sentinel, so every possible pointer from GetPlayerOrMonPalettePointer must be
; readable through the PokemonPalettes bank passed to FarCopyBytes.
assert BANK(PokemonPalettes) == BANK(RedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(DeepRedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(GoldPlayerPalette)

INCLUDE "data/pokemon/custom_palette_colors.asm"
