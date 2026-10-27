ShowPartyPhoto::
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
	xor a
	ld [wLandmarkSignTimer], a
	farcall PlaceMapNameSign
	call ReanchorMap
	call LoadOverworldTilemapAndAttrmapPals
	call FadeToMenu
	call CancelFollowerUpload
	call DisableLCD
	call LoadStandardFont
	call EnableLCD
	ld de, wHallOfFameTemp
	newfarcall GetHallOfFamePartyAtDE
	ld de, wHOFTeamPalettePairs
	newfarcall BuildHallOfFamePalettePairsAtDE
	farcall HOF_ShowTeam
	call CloseSubmenu
	call CloseText
	pop af
	ldh [hInMenu], a
	ret

PokecenterPhotographerScript::
	faceplayer
	opentext
	writetext .OfferText
	yesorno
	iffalse .Declined
	closetext
	callasm ShowPartyPhoto
	end

.Declined
	writetext .RefusalText
	waitbutton
	closetext
	end

.OfferText:
	text "You and your"
	line "#mon make a"
	cont "great team."
	para "Would you like"
	line "your picture"
	cont "taken?"
	done

.RefusalText:
	text "Maybe next time."
	done
