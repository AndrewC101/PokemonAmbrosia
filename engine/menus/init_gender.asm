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
	menu_coords 1, 2, 19, 14
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
	db "Grey@"

StorePlayerColorFromPosition:
; Menu positions are 1-based; bad positions fall back to red.
	and a
	jr z, .default
	cp NUM_PLAYER_COLORS + 1
	jr nc, .default
	dec a
	ld e, a
	ld d, 0
	ld hl, .ColorOptions
	add hl, de
	ld a, [hl]
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
	assert_table_length NUM_PLAYER_COLORS

AreYouABoyOrAreYouAGirlText:
	text_far _AreYouABoyOrAreYouAGirlText
	text_end

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
