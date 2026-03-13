Pokedex_PlaceAnimatedFrontpic:
	ld a, $1
	ldh [rVBK], a
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	call GetBaseData
	ld hl, wTempMonDVs
	predef GetUnownLetter
	hlcoord 1, 1
	push hl
	ld de, vTiles2
	predef GetMonFrontpic
	pop hl
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	ld a, $0
	ldh [rVBK], a
	ret

Pokedex_PlaceBackPic:
	ld a, $1
	ldh [rVBK], a
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	call GetBaseData
	ld hl, wTempMonDVs
	predef GetUnownLetter
	ld de, vTiles0 tile $80
	predef GetMonBackpic
	ld a, $80
	ldh [hGraphicStartTile], a
	lb bc, 6, 6
	hlcoord 11, 2
	predef PlaceGraphic

	ld a, $0
	ldh [rVBK], a
	ret

Pokedex_place_Mon_Icon:
	push af
	push bc
	push de
	push hl

IF USING_INCREASED_SPRITE_ANIMATION == FALSE
; sprite box border
	hlcoord 1, 13
	ld [hl], $70
	inc hl
	ld a, $72
	ld [hli], a
	ld [hli], a
	ld [hl], $70
	hlcoord 1, 14
	ld [hl], $71
	hlcoord 1, 15
	ld [hl], $71

	hlcoord 4, 14
	ld [hl], $71
	hlcoord 4, 15
	ld [hl], $71
	hlcoord 1, 16
	ld [hl], $70
	inc hl
	ld bc, 2
	ld a, $72
	call ByteFill
	ld [hl], $70
ENDC

; load the icon sprite
	ld a, 11
	ld [wStatsScreenFlags], a
	xor a
	ldh [hObjectStructIndex], a
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_UNUSED
	rst FarCall
	farcall SetDexMonIconColor_SpritePage
	pop hl
	pop de
	pop bc
	pop af
	ret

Dex_Pics_DrawBorder:
	hlcoord 0, 0
	ld a, $34 ; $39 ; $32 ; color block, bottom left corner
	ld bc, SCREEN_WIDTH
	call ByteFill
	hlcoord 1, 0
	ld a, $57 ; $3b ; text border, left side of SELECT > SHINY
	ld [hli], a
	ld a, $48 ; SELECT >
	ld [hli], a
	ld a, $49 ; SELECT >
	ld [hli], a
	ld a, $4a ; SELECT >
	ld [hli], a
	ld a, $61 ; > SHINY
	ld [hli], a
	inc a ; ld a, $72 ; > SHINY
	ld [hli], a
	inc a ; ld a, $73 ; > SHINY
	ld [hli], a
	ld a, $58 ; $3c ; text border right side of SELECT > SHINY
	ld [hli], a

IF USING_INCREASED_SPRITE_ANIMATION == FALSE
	ld a, $34
	ld [hli], a
ENDC

	ld a, $57 ; $3b ; text border, left side of START > CRY
	ld [hli], a	
	; hlcoord 10, 17
	ld a, $41 ; START >
	ld [hli], a
	inc a ; ld a, $42 ; START >
	ld [hli], a
	inc a ; ld a, $43 ; START >
	ld [hli], a

IF USING_INCREASED_SPRITE_ANIMATION == FALSE
	ld a, $6e ; > CRY [VRAM 1] @ 15, 17
	ld [hli], a
	inc a ; ld a, $6f ; > CRY [VRAM 1] @ 14, 17
	ld [hli], a
ELSE
; IF USING_INCREASED_SPRITE_ANIMATION == TRUE

; using expanded mon animation
	ld a, $56 ; arrow cap
	ld [hli], a
	ld de, cry_text
	call PlaceString
	inc hl
	inc hl
	inc hl	
ENDC

	ld a, $58 ; $3c ; curvest text border, right side of START > CRY
	ld [hli], a
	ld a, $34 ; $39 ; $32 ; color block
	ld [hl], a

	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	jr z, .caught_ball_done
	hlcoord 5, 11
	ld [hl], $4f ; pokeball icon
.caught_ball_done	
	hlcoord 3, 11
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	ld [hl], "<DEX_⁂>"
	jr .shiny_done
.not_shiny
	ld [hl], " "
.shiny_done
; SELECT > SHINY START > CRY
	hlcoord 0, 17
	ld a, $39
	ld bc, SCREEN_WIDTH - 1
	call ByteFill
	
; up/down arrows	
	hlcoord 19, 0
	ld [hl], $3f
	; inc hl
	; ld [hl], $72
	hlcoord 19, 17
	ld [hl], $40

; ribbons for name/caught/shiny
	; above species name
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH
	ld a, $39
	call ByteFill
	hlcoord 0, 11
	ld [hl], $32 ; color block
	inc hl
	ld [hl], $3b ; curved text border left side
	hlcoord 17, 11
	ld [hl], $3c ; curved text border right side side
	inc hl
	ld a, $32 ; color block
	ld [hli], a
	ld [hl], a
	; border under species name
	hlcoord 0, 12
	ld bc, SCREEN_WIDTH
	ld a, $34
	call ByteFill
	ret

IF USING_INCREASED_SPRITE_ANIMATION == TRUE
cry_text:
	db "CRY@"
ENDC
