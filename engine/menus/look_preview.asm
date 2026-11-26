DEF LOOK_PREVIEW_PALETTE EQU 1
DEF LOOK_PREVIEW_PLAYER_LIST_X EQU 1
DEF LOOK_PREVIEW_POKEMON_LIST_X EQU 10
DEF LOOK_PREVIEW_LIST_Y EQU 4
DEF LOOK_PREVIEW_WALK_TILE EQU 7 * 7
DEF LOOK_PREVIEW_CANCEL_F EQU 0
DEF LOOK_PREVIEW_GENDER_F EQU 1
DEF LOOK_PREVIEW_MON_RGB_F EQU 2
DEF NUM_LOOK_SKIN_TONES EQU 7
DEF NUM_LOOK_MON_PRESETS EQU NUM_CUSTOM_PALETTE_COLORS - 1
DEF LOOK_MON_CUSTOM_ROW EQU NUM_LOOK_MON_PRESETS + 1
DEF NUM_LOOK_MON_OPTIONS EQU LOOK_MON_CUSTOM_ROW + 1

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
	call InitPlayerCustomPalette
	call ResolveCurrentLookPalette
	call ApplyLookPlayerPalette

	call GetLookSpriteMenu
	call ChooseLookOption
	call ResolveLookSprite
	ld [wPlayerSpriteChoice], a

	call ChooseLookSkin
	call ChooseLookHair
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

	ld a, MON_POKERUS
	call GetPartyParamLocation
	ld de, wLookMonPalette
	ld bc, MON_PALETTE_RECORD_SIZE
	call CopyBytes
	xor a
	ld [wLookRGBOffset], a
	ld hl, LightMonLookPreviewMenu
	call ChooseLookMonColor
	ret c

	ld a, COLOR_SIZE
	ld [wLookRGBOffset], a
	ld hl, DarkMonLookPreviewMenu
	call ChooseLookMonColor
	ret c

	ld a, MON_POKERUS
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld hl, wLookMonPalette
	ld bc, MON_PALETTE_RECORD_SIZE
	jp CopyBytes

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
	xor a
ChooseLookOptionAt:
	ld [wMenuCursorY], a
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
.redraw
	ld de, wLookPreviewMenu
	ld bc, wLookPreviewMenuEnd - wLookPreviewMenu
	call CopyBytes
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
	xor a
	ld [wMenuCursorY], a
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
	lb bc, NUM_LOOK_MON_OPTIONS, 9
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

PreviewLookPlayerColor:
	ld b, a
	ld a, [wLookPreviewOptionCount]
	dec a
	cp b
	jr z, PreviewCurrentLookPalette
	ld a, b
	call ReadLookColorPreset
	push bc
	call ResolveCurrentLookPalette
	pop bc
	jp ApplyLookPreviewRGB

PreviewCurrentLookPalette:
	call ResolveCurrentLookPalette
	jr ApplyLookPlayerPalette

ResolveCurrentLookPalette:
	ld a, [wPlayerColor]
	newfarcall GetPlayerPresetPalettePointer
	jp ResolvePlayerCustomPalette

ApplyLookPlayerPalette:
	ld de, wBGPals1 palette LOOK_PREVIEW_PALETTE
	newfarcall LoadPalette_White_Col1_Col2_Black
	jr ShowLookPreviewPalette

ShowLookPreviewPalette:
	newfarcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

ChooseLookMonColor:
	push hl
	call GetStagedLookMonChoice
	bit MON_RGB_CHOICE_F, b
	ld a, LOOK_MON_CUSTOM_ROW
	jr nz, .initial
	ld a, c
	cp PAL_COLOR_GOLD
	jr nz, .find_row
	ld a, PAL_COLOR_YELLOW
.find_row
	ld hl, PokemonColorEditorColorOptions
	ld de, 1
	call IsInArray
	ld a, b
.initial
	pop hl
.choose
	push hl
	call ChooseLookOptionAt
	pop hl
	cp -1
	jr z, .cancel
	cp LOOK_MON_CUSTOM_ROW
	jr z, .edit
	call ResolveLookMonChoice
	jr .save
.edit
	push hl
	call EditLookRGB
	pop hl
	jr nz, .accept_rgb
	ld a, LOOK_MON_CUSTOM_ROW
	jr .choose
.accept_rgb
	call GetLookMonRGBChoice
.save
	call StageLookMonChoice
	and a
	ret
.cancel
	scf
	ret

GetStagedLookMonChoice:
	ld hl, wLookMonPalette
	newfarcall ReadMonPaletteChoices
	ld a, [wLookRGBOffset]
	and a
	ret z
	ld b, d
	ld c, e
	ret

ResolveLookMonChoice:
	cp LOOK_MON_CUSTOM_ROW
	jr z, GetStagedLookMonChoice
	ld hl, PokemonColorEditorColorOptions
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	ld b, 0
	ret

PreviewLookMonColor:
	call ResolveLookMonChoice

PreviewLookMonChoice:
	ld hl, wLookMonPalette
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	push af
	push de
	call StageLookMonChoice
	ld de, wBGPals1 palette LOOK_PREVIEW_PALETTE
	call GetLookMonPaletteInputs
	newfarcall LoadMonRecordPalette
	call ShowLookPreviewPalette
	pop de
	pop af
	ld hl, wLookMonPalette
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	ret

StageLookMonChoice:
	push bc
	ld hl, wLookMonPalette
	newfarcall ReadMonPaletteChoices
	ld a, [wLookRGBOffset]
	and a
	jr nz, .dark
	pop bc
	jr .write
.dark
	pop de
.write
	ld hl, wLookMonPalette
	newfarjp WriteMonPaletteChoices

GetLookMonPaletteInputs:
	push de
	ld a, MON_DVS
	call GetPartyParamLocation
	ld b, h
	ld c, l
	pop de
	ld hl, wLookMonPalette
	ld a, [wCurPartySpecies]
	ret

ResolveLookMonPalette:
	ld de, wMonResolvedPalette
	call GetLookMonPaletteInputs
	newfarjp CopyMonRecordMiddleColors

GetLookMonRGBChoice:
	ld hl, wLookRGBComponents + 2
	ld a, [hld]
	ld b, a
	rrca
	rrca
	and $c0
	ld c, a
	ld a, [hld]
	add a
	add a
	add a
	or c
	or [hl]
	ld c, a
	ld a, b
	srl a
	srl a
	or 1 << MON_RGB_CHOICE_F
	ld b, a
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
	db NUM_LOOK_SKIN_TONES + 1, FALSE
	dw LookComplexionTitle, LookComplexionOptions, PreviewLookPlayerColor
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

ColorLookPreviewMenu:
	db NUM_PLAYER_BASE_COLORS + 1, FALSE
	dw LookColorTitle, PlayerColorTextChoices, PreviewLookPlayerColor
	dwcoord LOOK_PREVIEW_PLAYER_LIST_X, LOOK_PREVIEW_LIST_Y

LightMonLookPreviewMenu:
	db NUM_LOOK_MON_OPTIONS, (1 << LOOK_PREVIEW_CANCEL_F) | (1 << LOOK_PREVIEW_MON_RGB_F)
	dw LookLightMonTitle, PokemonColorEditorChoices, PreviewLookMonColor
	dwcoord LOOK_PREVIEW_POKEMON_LIST_X, LOOK_PREVIEW_LIST_Y

DarkMonLookPreviewMenu:
	db NUM_LOOK_MON_OPTIONS, (1 << LOOK_PREVIEW_CANCEL_F) | (1 << LOOK_PREVIEW_MON_RGB_F)
	dw LookDarkMonTitle, PokemonColorEditorChoices, PreviewLookMonColor
	dwcoord LOOK_PREVIEW_POKEMON_LIST_X, LOOK_PREVIEW_LIST_Y

LookSpriteTitle:
	db "Choose a look@"
LookComplexionTitle:
	db "Choose a skin tone@"
LookComplexionOptions:
	for tone_index, 1, NUM_LOOK_SKIN_TONES + 1
		db "Tone {d:tone_index}@"
	endr
	db "Custom@"
LookColorTitle:
	db "Choose hair colour@"
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
	db "Custom@"

LookSkinPresets:
	table_width COLOR_SIZE
	RGB 31, 26, 20
	RGB 29, 21, 16
	RGB 27, 18, 12
	RGB 23, 15, 09
	RGB 20, 13, 05
	RGB 15, 09, 05
	RGB 10, 06, 04
	assert_table_length NUM_LOOK_SKIN_TONES
	dw -1

LookHairPresets:
	table_width COLOR_SIZE
	RGB 31, 04, 01
	RGB 10, 09, 31
	RGB 07, 23, 03
	RGB 31, 24, 05
	RGB 17, 07, 25
	RGB 31, 12, 20
	RGB 31, 13, 00
	RGB 15, 10, 03
	RGB 17, 17, 17
	RGB 08, 08, 08
	assert_table_length NUM_PLAYER_BASE_COLORS
	dw -1

PokemonColorEditorChoices:
	db "Default@"
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
	db "Custom@"

PokemonColorEditorColorOptions:
	table_width 1
	db MON_PALETTE_DEFAULT
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
	db -1
	assert_table_length NUM_LOOK_MON_OPTIONS

