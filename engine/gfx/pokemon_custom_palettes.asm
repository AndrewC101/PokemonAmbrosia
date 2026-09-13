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

	; Shiny colors take precedence over a stored custom pair. Save both inputs
	; because CheckShininess uses a and hl while returning its result in carry.
	push af
	push hl
	newfarcall CheckShininess
	jr c, .shiny
	pop hl

	; Both nibbles must name one of the eleven shared colors.
	ld a, l
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld a, l
	swap a
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
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

.shiny
	pop hl
.invalid
	pop af
.default
	; The pointer and loader both live in bank 2. Resolving the pointer first,
	; then making a second banked call, keeps its hl result valid for the load.
	newfarcall GetPlayerOrMonPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
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
	push hl
	newfarcall CheckShininess
	jr c, .shiny
	pop hl
	ld a, l
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld a, l
	swap a
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
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

.shiny
	pop hl
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
	; Lord Oak's existing forced-shiny rule also overrides custom colors.
	pop af
	newfarcall GetEnemyMonNormalOrShinyPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
	ret

.player
	ld l, MON_PALETTE_DEFAULT
	jp LoadMonNormalShinyOrCustomPalette

StoreCurrentTrainerMonPalette::
; Input: a = raw trainer palette byte. Invalid pairs become the species default.
; Preserves bc, de, and the caller's trainer-record pointer in hl.
	push bc
	push de
	push hl
	ld c, a
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld a, c
	swap a
	and $f
	jr z, .invalid
	cp NUM_CUSTOM_PALETTE_COLORS + 1
	jr nc, .invalid
	ld a, c
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

; CopyMonNormalShinyOrCustomMiddleColors may also receive the zero player
; sentinel, so every possible pointer from GetPlayerOrMonPalettePointer must be
; readable through the PokemonPalettes bank passed to FarCopyBytes.
assert BANK(PokemonPalettes) == BANK(RedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(DeepRedPlayerPalette)
assert BANK(PokemonPalettes) == BANK(GoldPlayerPalette)

INCLUDE "data/pokemon/custom_palette_colors.asm"
