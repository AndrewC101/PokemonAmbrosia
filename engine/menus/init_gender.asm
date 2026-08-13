InitCrystalData:
	ld a, $1
	ld [wPlayerPrefecture], a
	xor a
	ld [wPlayerAge], a
	ld [wPlayerGender], a
	ld [wPlayerPostalCode], a
	ld [wPlayerPostalCode+1], a
	ld [wPlayerPostalCode+2], a
	ld [wPlayerPostalCode+3], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wCrystalFlags]
	res 0, a ; ???
	ld [wCrystalFlags], a
	ld a, [wCrystalFlags]
	res 1, a ; ???
	ld [wCrystalFlags], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, AreYouABoyOrAreYouAGirlText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
	farcall SetInitialPlayerSpriteChoice
	call SetPlayerComplexion
	call SetPlayerColor
	ld c, 10
	call DelayFrames
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Male@"
	db "Female@"

SetPlayerComplexion:
	call ClearTilemap
	call WaitBGMap2
	ld hl, WhatIsYourComplexionText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call _2DMenu
	push af
	call CloseWindow
	pop af
	call StorePlayerComplexionFromPosition
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 5
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 8 ; spacing
	dba .ComplexionText
	dbw BANK(@), NULL

.ComplexionText:
	db "Lighter@"
	db "Darker@"

StorePlayerComplexionFromPosition:
; Menu positions are 1-based; bad positions fall back to lighter.
	and a
	jr z, .default
	cp NUM_PLAYER_COMPLEXIONS + 1
	jr nc, .default
	dec a
	jr .save

.default
	xor a

.save
	ld [wPlayerComplexionChoice], a
	ret

SetPlayerColor:
	call ClearTilemap
	call WaitBGMap2
	ld hl, WhatColorWillYouWearText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call _2DMenu
	push af
	call CloseWindow
	pop af
	call StorePlayerColorFromPosition
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	dn 5, 2 ; rows, columns
	db 9 ; spacing
	dba .ColorText
	dbw BANK(@), NULL

.ColorText:
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Yellow@"
	db "Purple@"
	db "Pink@"
	db "Orange@"
	db "Brown@"
	db "Silver@"
	db "Black@"

StorePlayerColorFromPosition:
; Menu positions are 1-based; bad positions fall back to lighter red.
	and a
	jr z, .default
	cp NUM_PLAYER_BASE_COLORS + 1
	jr nc, .default
	dec a
	ld e, a
	ld d, 0
	ld hl, .ColorOptions
	add hl, de
	; c is the base color; b is the complexion offset multiplier.
	ld c, [hl]
	ld a, [wPlayerComplexionChoice]
	cp NUM_PLAYER_COMPLEXIONS
	jr c, .got_complexion
	xor a

.got_complexion
	ld b, a
	ld a, b
	and a
	ld a, c
	jr z, .save

.add_complexion_offset
	add NUM_PLAYER_BASE_COLORS
	dec b
	jr nz, .add_complexion_offset
	jr .save

.default
	xor a

.save
	ld [wPlayerColor], a
	ret

.ColorOptions:
	table_width 1
	db PLAYER_COLOR_RED
	db PLAYER_COLOR_BLUE
	db PLAYER_COLOR_GREEN
	db PLAYER_COLOR_YELLOW
	db PLAYER_COLOR_PURPLE
	db PLAYER_COLOR_PINK
	db PLAYER_COLOR_ORANGE
	db PLAYER_COLOR_BROWN
	db PLAYER_COLOR_SILVER
	db PLAYER_COLOR_DARK_GREY
	assert_table_length NUM_PLAYER_BASE_COLORS

AreYouABoyOrAreYouAGirlText:
	text_far _AreYouABoyOrAreYouAGirlText
	text_end

WhatIsYourComplexionText:
	text "What is your"
	line "complexion?"
	prompt

WhatColorWillYouWearText:
	text "Now, what colour"
	line "suits you?"
	prompt

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	ret

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	call Get2bpp
	ret

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
