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
