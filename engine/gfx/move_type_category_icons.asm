DEF MENU_MOVE_TYPECAT_PALETTE   EQU 2
DEF BATTLE_MOVE_TYPECAT_PALETTE EQU PAL_BATTLE_BG_6
DEF MENU_MOVE_CATEGORY_ICON_TILE   EQU $59
DEF MENU_MOVE_TYPE_ICON_TILE       EQU $5b
; Battle status icons already occupy $db-$de while the move info box is open.
; Use the preceding six vTiles1 slots so the icon strip stays local to the box.
DEF BATTLE_MOVE_CATEGORY_ICON_TILE   EQU $55
DEF BATTLE_MOVE_TYPE_ICON_TILE       EQU $57
DEF BATTLE_MOVE_CATEGORY_TILE_ID     EQU $d5
DEF BATTLE_MOVE_TYPE_TILE_ID         EQU $d7

DrawPartyMoveTypeCategoryIcons::
; Draw the selected move's category+type icon strip on the move list screen.
	ld a, [wCurSpecies]
	and a
	ret z
	ld b, a
	call GetMoveTypeCategoryIconIndices
	call LoadMenuMoveTypeCategoryIconGfx
	hlcoord 10, 12
	call PlaceMenuMoveTypeCategoryTiles
	decoord 10, 12, wAttrmap
	ld a, MENU_MOVE_TYPECAT_PALETTE
	jr ApplyMoveTypeCategoryColors

DrawRelearnerMoveTypeCategoryIcons::
; Draw the selected move's category+type icon strip on the relearner screen.
	ld a, [wCurSpecies]
	and a
	ret z
	ld b, a
	call GetMoveTypeCategoryIconIndices
	call LoadMenuMoveTypeCategoryIconGfx
	hlcoord 10, 11
	call PlaceMenuMoveTypeCategoryTiles
	decoord 10, 11, wAttrmap
	ld a, MENU_MOVE_TYPECAT_PALETTE
	jr ApplyMoveTypeCategoryColors

DrawBattleMoveTypeCategoryIcons::
; Draw the selected move's category+type icon strip in the battle move info box.
	ld a, [wCurPlayerMove]
	and a
	ret z
	ld b, a
	call GetMoveTypeCategoryIconIndices
	call LoadBattleMoveTypeCategoryIconGfx
	hlcoord 2, 8
	call PlaceBattleMoveTypeCategoryTiles
	ld a, BATTLE_MOVE_TYPECAT_PALETTE
	jr ApplyMoveTypeCategoryColors_NoAttrmap

ApplyMoveTypeCategoryColors:
; Input:
;   a = destination palette
;   b = category index
;   c = raw type index
;   de = attrmap destination
	push af
	ldh a, [hCGB]
	and a
	pop af
	ret z

	call LoadMoveTypeCategoryPaletteAndAttrmap
	farcall ApplyAttrmap
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

ApplyMoveTypeCategoryColors_NoAttrmap:
; Input:
;   a = destination palette
;   b = category index
;   c = raw type index
	push af
	ldh a, [hCGB]
	and a
	pop af
	ret z

	call LoadMoveTypeCategoryPaletteOnly
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

RestoreBattleMoveTypeCategoryFontTiles::
; The battle move info strip reuses vTiles1 $55-$5a, which overlap standard
; font glyphs. Restore those six 1bpp font tiles once the move-info box is
; gone so later battle text punctuation renders correctly.
	ld de, Font + BATTLE_MOVE_CATEGORY_ICON_TILE * TILE_1BPP_SIZE
	ld hl, vTiles1 tile BATTLE_MOVE_CATEGORY_ICON_TILE
	lb bc, BANK(Font), 6
	jp Get1bppViaHDMA

GetMoveTypeCategoryIconIndices:
; Input:
;   b = move id
; Return:
;   b = category index (0-2)
;   c = raw type index
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld d, a
	and TYPE_MASK
	ld c, a
	ld e, a
	ld a, d
	and ~TYPE_MASK
	rlc a
	rlc a
	dec a
	ld b, a
	ret

LoadMenuMoveTypeCategoryIconGfx:
; Input:
;   b = category index
;   c = raw type index
	push bc
	ld a, b
	ld hl, CategoryIconGFX
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile MENU_MOVE_CATEGORY_ICON_TILE
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp

	pop bc
	push bc ; preserve category/type indices for the caller after the type gfx load
	ld a, c
	ld hl, MoveTypeIconIndexMap
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld hl, TypeIconGFX2bpp
	ld bc, 4 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile MENU_MOVE_TYPE_ICON_TILE
	lb bc, BANK(TypeIconGFX2bpp), 4
	call Request2bpp
	pop bc
	ret

LoadBattleMoveTypeCategoryIconGfx:
; Input:
;   b = category index
;   c = raw type index
	push bc
	ld a, b
	ld hl, CategoryIconGFX
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles1 tile BATTLE_MOVE_CATEGORY_ICON_TILE
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp

	pop bc
	push bc ; preserve category/type indices for the caller after the type gfx load
	ld a, c
	ld hl, MoveTypeIconIndexMap
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld hl, TypeIconGFX2bpp
	ld bc, 4 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles1 tile BATTLE_MOVE_TYPE_ICON_TILE
	lb bc, BANK(TypeIconGFX2bpp), 4
	call Request2bpp
	pop bc
	ret

PlaceMenuMoveTypeCategoryTiles:
; Input:
;   hl = tilemap destination for the 6-tile strip
	ld d, MENU_MOVE_CATEGORY_ICON_TILE
	jr PlaceMoveTypeCategoryTiles

PlaceBattleMoveTypeCategoryTiles:
; Input:
;   hl = tilemap destination for the 6-tile strip
	ld d, BATTLE_MOVE_CATEGORY_TILE_ID
; fallthrough

PlaceMoveTypeCategoryTiles:
; Input:
;   d = first tile id
;   hl = tilemap destination for the 6-tile strip
	ldh a, [rSVBK]
	push af
	push bc ; preserve category/type indices for the palette step that follows
	ld a, BANK(wTilemap)
	ldh [rSVBK], a
	ld b, 6
	ld a, d
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop

.done
	pop bc
	pop af
	ldh [rSVBK], a
	ret

LoadMoveTypeCategoryPaletteAndAttrmap:
; Input:
;   a = destination BG palette
;   b = category index
;   c = raw type index
;   de = attrmap destination for the 6-tile strip
	call LoadMoveTypeCategoryPaletteOnly
	ld c, a ; preserve the chosen palette number across the WRAM bank switch
	ldh a, [rSVBK]
	push af
	ld a, BANK(wAttrmap)
	ldh [rSVBK], a
	ld b, 6
	ld a, c
.fill_attr
	ld [de], a
	inc de
	dec b
	jr nz, .fill_attr
	pop af
	ldh [rSVBK], a
	ret

LoadMoveTypeCategoryPaletteOnly:
; Input:
;   a = destination BG palette
;   b = category index
;   c = raw type index
	push de
	push bc
	push af
	cp BATTLE_MOVE_TYPECAT_PALETTE
	ld h, 0
	ld de, wBGPals1 palette MENU_MOVE_TYPECAT_PALETTE
	jr nz, .got_dest
	inc h ; battle uses a time-of-day-aware background, like status icons
	ld de, wBGPals1 palette BATTLE_MOVE_TYPECAT_PALETTE
.got_dest

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	push bc ; keep the original category/type indices after reusing bc as an offset

	ld a, h
	and a
	jr z, .white_bg
	ld a, [wBattleTimeOfDay]
	and a
	jr z, .white_bg
	ld a, LOW(PALRGB_NIGHT)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_NIGHT)
	jr .store_bg_high

.white_bg
	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)

.store_bg_high
	ld [de], a
	inc de
	ld hl, CategoryIconPals
	ld a, b
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de

	pop bc
	ld hl, MoveTypeColorPals
	ld a, c
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

	xor a
	ld [de], a
	inc de
	ld [de], a

	pop af
	ldh [rSVBK], a
	pop af
	pop bc
	pop de
	ret

MoveTypeIconIndexMap:
; Map this repo's raw type ids to the inheritance icon-sheet order.
; Unused/custom raw ids fall back to the UNKNOWN icon.
	db  0 ; NORMAL
	db  1 ; FIGHTING
	db  2 ; FLYING
	db  3 ; POISON
	db  4 ; GROUND
	db  5 ; ROCK
	db 17 ; FAIRY
	db  6 ; BUG
	db  7 ; GHOST
	db  8 ; STEEL
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db 18 ; unused
	db  7 ; CURSE_TYPE -> GHOST
	db  9 ; FIRE
	db 10 ; WATER
	db 11 ; GRASS
	db 12 ; ELECTRIC
	db 13 ; PSYCHIC
	db 14 ; ICE
	db 15 ; DRAGON
	db 16 ; DARK
	db 18 ; UBER

CategoryIconPals:
; One solid glyph color per category. The 2bpp art uses one mid-tone, matching
; the status-icon pattern of "background plus one patched glyph entry".
; PHYSICAL
	RGB 27, 04, 02
; SPECIAL
	RGB 11, 18, 30
; STATUS
	RGB 11, 25, 11

MoveTypeColorPals:
; One solid glyph color per raw type id in this repo's sparse type space.
; The 2bpp type art uses the second patched glyph entry, like battle status
; icons using separate middle colors inside one reserved palette slot.
; Unused/custom slots fall back to the UNKNOWN color.
; NORMAL
	RGB 21, 21, 14
; FIGHTING
	RGB 27, 04, 02
; FLYING
	RGB 22, 17, 30
; POISON
	RGB 22, 07, 19
; GROUND
	RGB 29, 24, 12
; ROCK
	RGB 24, 20, 07
; FAIRY
	RGB 31, 20, 29
; BUG
	RGB 21, 23, 06
; GHOST
	RGB 15, 11, 18
; STEEL
	RGB 23, 23, 25
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; unused
	RGB 13, 19, 19
; CURSE_TYPE
	RGB 13, 19, 19
; FIRE
	RGB 31, 15, 04
; WATER
	RGB 11, 18, 30
; GRASS
	RGB 11, 25, 11
; ELECTRIC
	RGB 31, 24, 06
; PSYCHIC
	RGB 31, 09, 15
; ICE
	RGB 16, 27, 27
; DRAGON
	RGB 15, 07, 31
; DARK
	RGB 15, 11, 09
; UBER
	RGB 13, 19, 19

TypeIconGFX2bpp:
INCBIN "gfx/battle/types.2bpp"

CategoryIconGFX:
INCBIN "gfx/battle/categories.2bpp"
