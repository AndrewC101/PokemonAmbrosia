ShowFieldMovePreview::
; Match the script refresh path so the preview starts and ends on a clean map.
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call GetMovementPermissions
	farcall HDMATransferTilemapAndAttrmap_Overworld
	call UpdateSprites

; Resolve the acting party mon's species for the shared Pokepic routine.
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a

	farcall Pokepic
	call ApplyFieldMovePreviewPalette
	ld a, [wCurPartySpecies]
	call PlayMonCry
	farcall ClosePokepic

	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call GetMovementPermissions
	farcall HDMATransferTilemapAndAttrmap_Overworld
	call UpdateSprites
	ret

ApplyFieldMovePreviewPalette:
; Use the acting party mon's real palette so shinies display correctly.
	ldh a, [hCGB]
	and a
	ret z

	ld hl, wPartyMon1DVs
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld b, h
	ld c, l
	ld a, [wCurPartySpecies]
	newfarcall GetMonNormalOrShinyPalettePointer

	ld de, wBGPals1 palette PAL_BG_TEXT
	newfarcall LoadPalette_White_Col1_Col2_Black
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret
