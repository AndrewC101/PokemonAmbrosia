DEF LOOK_PREVIEW_PALETTE EQU 1
DEF LOOK_PREVIEW_PLAYER_LIST_X EQU 1
DEF LOOK_PREVIEW_POKEMON_LIST_X EQU 10
DEF LOOK_PREVIEW_LIST_Y EQU 4
DEF LOOK_PREVIEW_WALK_TILE EQU 7 * 7
DEF LOOK_PREVIEW_CANCEL_F EQU 0
DEF LOOK_PREVIEW_GENDER_F EQU 1

ChoosePlayerAppearanceInField::
	call OpenFieldLookPreview
	call ChoosePlayerAppearance
	jp CloseFieldLookPreview

EditPokemonAppearance::
	call OpenFieldLookPreview
	ld hl, ChoosePokemonColors
	call RunLookPreview
	jp CloseFieldLookPreview

OpenFieldLookPreview:
	call ReanchorMap
	call LoadOverworldTilemapAndAttrmapPals
	call FadeToMenu
	jp CancelFollowerUpload

CloseFieldLookPreview:
	call CloseSubmenu
	jp CloseText

ChoosePlayerAppearance::
	ld hl, ChoosePlayerLook

RunLookPreview:
	ld a, [wBattleTimeOfDay]
	push af
	xor a
	ld [wBattleTimeOfDay], a
	call _hl_
	pop af
	ld [wBattleTimeOfDay], a
	ret

ChoosePlayerLook:
	ld a, [wPlayerSpriteSetupFlags]
	push af
	res PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	ld [wPlayerSpriteSetupFlags], a
	call InitLookPreviewScreen
	hlcoord 12, 4
	call DrawLookPreviewPortrait
	call DrawLookPreviewWalkingSprite
	xor a
	call ApplyLookPlayerPalette

	call GetLookSpriteMenu
	call ChooseLookOption
	call ResolveLookSprite
	ld [wPlayerSpriteChoice], a

	ld hl, ComplexionLookPreviewMenu
	call ChooseLookOption
	ld [wPlayerComplexionChoice], a

	ld hl, ColorLookPreviewMenu
	call ChooseLookOption
	call ResolveLookColor
	ld [wPlayerColor], a
	pop af
	ld [wPlayerSpriteSetupFlags], a
	ret

GetLookSpriteMenu:
	ld hl, MaleLookPreviewMenu
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ret z
	ld hl, FemaleLookPreviewMenu
	ret

ChoosePokemonColors:
	call InitLookPreviewScreen
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a
	cp UNOWN
	jr nz, .load_pic
	ld a, MON_DVS
	call GetPartyParamLocation
	predef GetUnownLetter
.load_pic
	ld de, vTiles2
	predef GetMonFrontpic
	hlcoord 2, 5
	call DrawLookPreviewPortrait

	ld hl, LightMonLookPreviewMenu
	call ChooseLookOption
	cp -1
	ret z
	cp NUM_CUSTOM_PALETTE_COLORS
	jr z, .default
	call ResolveMonLookColor
	swap a
	ld [wPokemonPaletteEditorColor1], a

	ld hl, DarkMonLookPreviewMenu
	call ChooseLookOption
	cp -1
	ret z
	cp NUM_CUSTOM_PALETTE_COLORS
	jr z, .default
	call ResolveMonLookPair
	jr .commit

.default
	xor a
.commit
	ld b, a
	ld a, MON_PALETTE_PAIR
	call GetPartyParamLocation
	ld [hl], b
	ret

InitLookPreviewScreen:
	xor a
	ldh [hBGMapMode], a
	ldh [rVBK], a
	call DisableLCD
	call ClearSprites
	call ClearTilemap
	newfarcall WipeAttrmap
	call LoadStandardFont
	call LoadFontsExtra
	hlcoord 1, 2
	ld bc, SCREEN_WIDTH - 2
	ld a, '─'
	call ByteFill
	ld hl, LookMenuPalette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	jp EnableLCD

LookMenuPalette:
	RGB 31, 31, 31
	RGB 24, 26, 30
	RGB 12, 16, 22
	RGB 04, 06, 10

DrawLookPreviewPortrait:
	push hl
	xor a
	ld [wBoxAlignment], a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	pop hl
	ld bc, wAttrmap - wTilemap
	add hl, bc
	lb bc, 7, 7
	ld a, LOOK_PREVIEW_PALETTE
	jp FillBoxWithByte

DrawLookPreviewWalkingSprite:
	hlcoord 14, 12
	ld [hl], LOOK_PREVIEW_WALK_TILE
	inc hl
	ld [hl], LOOK_PREVIEW_WALK_TILE + 1
	hlcoord 14, 13
	ld [hl], LOOK_PREVIEW_WALK_TILE + 2
	inc hl
	ld [hl], LOOK_PREVIEW_WALK_TILE + 3
	hlcoord 14, 12, wAttrmap
	lb bc, 2, 2
	ld a, LOOK_PREVIEW_PALETTE
	jp FillBoxWithByte

ChooseLookOption:
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
.redraw
	ld de, wLookPreviewMenu
	ld bc, wLookPreviewMenuEnd - wLookPreviewMenu
	call CopyBytes
	xor a
	ld [wMenuCursorY], a
	call DrawLookPreviewOptions
	call UpdateLookPreview
	call CGBOnly_CopyTilemapAtOnce
.loop
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyPressed]
	bit B_PAD_A, a
	jr nz, .confirm
	bit B_PAD_SELECT, a
	jr nz, .toggle_gender
	bit B_PAD_B, a
	jr z, .move
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_CANCEL_F, a
	jr nz, .cancel
.move
	ldh a, [hJoyLast]
	bit B_PAD_UP, a
	jr nz, .up
	bit B_PAD_DOWN, a
	jr z, .loop
	call EraseLookPreviewCursor
	ld a, [wLookPreviewOptionCount]
	ld b, a
	ld a, [wMenuCursorY]
	inc a
	cp b
	jr c, .select
	xor a
	jr .select
.up
	call EraseLookPreviewCursor
	ld a, [wMenuCursorY]
	and a
	jr nz, .prev
	ld a, [wLookPreviewOptionCount]
.prev
	dec a
.select
	ld [wMenuCursorY], a
	call UpdateLookPreview
	jr .loop

.toggle_gender
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_GENDER_F, a
	jr z, .move
	ld a, [wPlayerGender]
	xor 1 << PLAYERGENDER_FEMALE_F
	ld [wPlayerGender], a
	call PlayClickSFX
	call GetLookSpriteMenu
	jr .redraw

.confirm
	call PlayClickSFX
	ld a, [wMenuCursorY]
	jr .exit
.cancel
	call PlayClickSFX
	ld a, -1
.exit
	ld b, a
	pop af
	ldh [hInMenu], a
	ld a, b
	ret

DrawLookPreviewOptions:
	hlcoord 1, 15
	lb bc, 3, SCREEN_WIDTH - 2
	call ClearBox
	hlcoord 1, 1
	lb bc, 1, SCREEN_WIDTH - 2
	call ClearBox
	ld hl, wLookPreviewTitle
	call ReadLookPreviewPointer
	ld d, h
	ld e, l
	hlcoord 1, 1
	call PlaceString

	ld hl, wLookPreviewCursor
	call ReadLookPreviewPointer
	lb bc, NUM_CUSTOM_PALETTE_COLORS + 1, 9
	call ClearBox

	ld hl, wLookPreviewOptions
	call ReadLookPreviewPointer
	push hl
	ld hl, wLookPreviewCursor
	call ReadLookPreviewPointer
	inc hl
	pop de
	ld a, [wLookPreviewOptionCount]
.rows
	push af
	call PlaceString
	inc de
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop af
	dec a
	jr nz, .rows

	hlcoord 1, 17
	ld de, .Select
	call PlaceString
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_GENDER_F, a
	jr nz, .Gender
	bit LOOK_PREVIEW_CANCEL_F, a
	ret z
	hlcoord 11, 17
	ld de, .Cancel
	jp PlaceString

.Gender:
	hlcoord 1, 16
	ld de, .GenderHint
	call PlaceString
	ld de, .Male
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .show_gender
	ld de, .Female
.show_gender
	hlcoord 12, 15
	jp PlaceString

.Select:
	db "A Confirm@"
.Cancel:
	db "B Cancel@"
.GenderHint:
	db "Select: Gender@"
.Male:
	db "Male@"
.Female:
	db "Female@"

EraseLookPreviewCursor:
	call GetLookPreviewCursor
	ld [hl], ' '
	ret

UpdateLookPreview:
	call GetLookPreviewCursor
	ld [hl], '▶'
	ld hl, wLookPreviewUpdate
	call ReadLookPreviewPointer
	ld a, [wMenuCursorY]
	jp _hl_

GetLookPreviewCursor:
	ld hl, wLookPreviewCursor
	call ReadLookPreviewPointer
	ld a, [wMenuCursorY]
	ld bc, SCREEN_WIDTH
	jp AddNTimes

ReadLookPreviewPointer:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

PreviewLookSprite:
	call ResolveLookSprite
	ld b, a
	ld a, [wPlayerSpriteChoice]
	push af
	ld a, b
	ld [wPlayerSpriteChoice], a
	newfarcall GetSelectedPlayerSpriteGFX
	ld hl, vTiles2 tile LOOK_PREVIEW_WALK_TILE
	ld c, 4
	call Get2bpp
	ld de, vTiles2
	newfarcall LoadSelectedPlayerFrontpicAtDE
	pop af
	ld [wPlayerSpriteChoice], a
	ret

ResolveLookSprite:
	ld e, a
	ld d, 0
	ld hl, MalePlayerSpriteChoiceOptions
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .resolved
	ld hl, FemalePlayerSpriteChoiceOptions
.resolved
	add hl, de
	ld a, [hl]
	ret

PreviewLookComplexion:
	and a
	jr z, ApplyLookPlayerPalette
	ld a, PLAYER_COLOR_DARKER_RED
	jr ApplyLookPlayerPalette

PreviewLookColor:
	call ResolveLookColor

ApplyLookPlayerPalette:
	newfarcall GetPlayerPresetPalettePointer
	ld de, wBGPals1 palette LOOK_PREVIEW_PALETTE
	newfarcall LoadPalette_White_Col1_Col2_Black
	jr ShowLookPreviewPalette

ResolveLookColor:
	ld e, a
	ld d, 0
	ld hl, PlayerRecreationColorOptions
	add hl, de
	ld a, [wPlayerComplexionChoice]
	and a
	ld a, [hl]
	ret z
	add NUM_PLAYER_BASE_COLORS
	ret

PreviewLightMonColor:
	cp NUM_CUSTOM_PALETTE_COLORS
	jr z, PreviewDefaultMonColor
	push af
	ld a, MON_PALETTE_PAIR
	call GetPartyParamLocation
	ld a, [hl]
	call LoadLookMonPalette
	pop af
	call ResolveMonLookColor
	ld hl, PokemonCustomLightColors
	newfarcall LoadMonNormalShinyOrCustomPalette.GetColor
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, wBGPals1 palette LOOK_PREVIEW_PALETTE color 1
	ld [hl], c
	inc hl
	ld [hl], b
	pop af
	ldh [rWBK], a
	jr ShowLookPreviewPalette

PreviewDarkMonColor:
	cp NUM_CUSTOM_PALETTE_COLORS
	jr z, PreviewDefaultMonColor
	call ResolveMonLookPair
	jr PreviewMonPair

PreviewDefaultMonColor:
	xor a
PreviewMonPair:
	call LoadLookMonPalette

ShowLookPreviewPalette:
	newfarcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

LoadLookMonPalette:
	push af
	ld a, MON_DVS
	call GetPartyParamLocation
	ld b, h
	ld c, l
	pop af
	ld l, a
	ld de, wBGPals1 palette LOOK_PREVIEW_PALETTE
	ld a, [wCurPartySpecies]
	newfarjp LoadMonNormalShinyOrCustomPalette

ResolveMonLookPair:
	call ResolveMonLookColor
	ld b, a
	ld a, [wPokemonPaletteEditorColor1]
	or b
	ret

ResolveMonLookColor:
	ld e, a
	ld d, 0
	ld hl, PokemonColorEditorColorOptions
	add hl, de
	ld a, [hl]
	ret

MaleLookPreviewMenu:
	db 10, 1 << LOOK_PREVIEW_GENDER_F
	dw LookSpriteTitle, MalePlayerSpriteChoiceText, PreviewLookSprite
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

FemaleLookPreviewMenu:
	db 10, 1 << LOOK_PREVIEW_GENDER_F
	dw LookSpriteTitle, FemalePlayerSpriteChoiceText, PreviewLookSprite
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

ComplexionLookPreviewMenu:
	db NUM_PLAYER_COMPLEXIONS, FALSE
	dw LookComplexionTitle, LookComplexionOptions, PreviewLookComplexion
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

ColorLookPreviewMenu:
	db NUM_PLAYER_BASE_COLORS, FALSE
	dw LookColorTitle, PlayerColorTextChoices, PreviewLookColor
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

LightMonLookPreviewMenu:
	db NUM_CUSTOM_PALETTE_COLORS + 1, 1 << LOOK_PREVIEW_CANCEL_F
	dw LookLightMonTitle, PokemonColorEditorChoices, PreviewLightMonColor
	dwcoord LOOK_PREVIEW_POKEMON_LIST_X, LOOK_PREVIEW_LIST_Y

DarkMonLookPreviewMenu:
	db NUM_CUSTOM_PALETTE_COLORS + 1, 1 << LOOK_PREVIEW_CANCEL_F
	dw LookDarkMonTitle, PokemonColorEditorChoices, PreviewDarkMonColor
	dwcoord LOOK_PREVIEW_POKEMON_LIST_X, LOOK_PREVIEW_LIST_Y

LookSpriteTitle:
	db "Choose a look@"
LookComplexionTitle:
	db "Choose a skin tone@"
LookComplexionOptions:
	db "Lighter@"
	db "Darker@"
LookColorTitle:
	db "Choose a colour@"
LookLightMonTitle:
	db "Lighter colour@"
LookDarkMonTitle:
	db "Darker colour@"

MalePlayerSpriteChoiceOptions:
	db PLAYER_SPRITE_DEFAULT
	db PLAYER_SPRITE_ASH
	db PLAYER_SPRITE_SILVER
	db PLAYER_SPRITE_BLUE
	db PLAYER_SPRITE_FALKNER
	db PLAYER_SPRITE_BRUNO
	db PLAYER_SPRITE_MORTY
	db PLAYER_SPRITE_LANCE
	db PLAYER_SPRITE_EUSINE
	db PLAYER_SPRITE_GIOVANNI

FemalePlayerSpriteChoiceOptions:
	db PLAYER_SPRITE_DEFAULT
	db PLAYER_SPRITE_LASS
	db PLAYER_SPRITE_WHITNEY
	db PLAYER_SPRITE_MISTY
	db PLAYER_SPRITE_JASMINE
	db PLAYER_SPRITE_CLAIR
	db PLAYER_SPRITE_ERIKA
	db PLAYER_SPRITE_SABRINA
	db PLAYER_SPRITE_KIMONO_GIRL
	db PLAYER_SPRITE_ROCKET_GIRL

MalePlayerSpriteChoiceText:
	db "Default@"
	db "Ash@"
	db "Silver@"
	db "Blue@"
	db "Falkner@"
	db "Bruno@"
	db "Morty@"
	db "Lance@"
	db "Eusine@"
	db "Giovanni@"

FemalePlayerSpriteChoiceText:
	db "Default@"
	db "May@"
	db "Whitney@"
	db "Misty@"
	db "Jasmine@"
	db "Clair@"
	db "Karen@"
	db "Sabrina@"
	db "Kimono@"
	db "Rocket@"

PlayerColorTextChoices:
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

PlayerRecreationColorOptions:
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

PokemonColorEditorChoices:
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Brown@"
	db "Yellow@"
	db "Pink@"
	db "Purple@"
	db "Orange@"
	db "Silver@"
	db "Black@"
	db "Gold@"
	db "Default@"

PokemonColorEditorColorOptions:
	table_width 1
	db PAL_COLOR_RED
	db PAL_COLOR_BLUE
	db PAL_COLOR_GREEN
	db PAL_COLOR_BROWN
	db PAL_COLOR_YELLOW
	db PAL_COLOR_PINK
	db PAL_COLOR_PURPLE
	db PAL_COLOR_ORANGE
	db PAL_COLOR_SILVER
	db PAL_COLOR_BLACK
	db PAL_COLOR_GOLD
	assert_table_length NUM_CUSTOM_PALETTE_COLORS

