ShowFieldMovePreview::
; Rebuild a clean overworld screen before opening the centered pic box.
	call LoadOverworldTilemapAndAttrmapPals
	call ApplyTilemap
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
	ret
