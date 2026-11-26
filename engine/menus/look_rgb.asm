DEF LOOK_RGB_FIRST_SLIDER_PALETTE EQU 2

InitPlayerCustomPalette:
	call HasPlayerCustomPalette
	ret z
	ld hl, wPlayerCustomPaletteSignature
	ld [hl], LOW(PLAYER_CUSTOM_PALETTE_SIGNATURE)
	inc hl
	ld [hl], HIGH(PLAYER_CUSTOM_PALETTE_SIGNATURE)
	inc hl
	ld bc, 2 * COLOR_SIZE
	xor a
	jp ByteFill

HasPlayerCustomPalette:
	ld a, [wPlayerCustomPaletteSignature]
	cp LOW(PLAYER_CUSTOM_PALETTE_SIGNATURE)
	ret nz
	ld a, [wPlayerCustomPaletteSignature + 1]
	cp HIGH(PLAYER_CUSTOM_PALETTE_SIGNATURE)
	ret

ResolvePlayerCustomPalette::
	push bc
	push de
	ldh a, [rWBK]
	push af
	ld a, BANK(wPlayerCustomSkin)
	ldh [rWBK], a
	call HasPlayerCustomPalette
	jr nz, .done
	ld de, wResolvedPlayerPalette
	ld bc, 2 * COLOR_SIZE
	ld a, BANK(RedPlayerPalette)
	call FarCopyBytes
	ld hl, wPlayerCustomSkin
	ld de, wResolvedPlayerPalette
	call .apply
	call .apply
	ld hl, wResolvedPlayerPalette
.done
	pop af
	ldh [rWBK], a
	pop de
	pop bc
	ret

.apply
	inc hl
	bit PLAYER_CUSTOM_COLOR_F, [hl]
	dec hl
	jr z, .skip
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	res PLAYER_CUSTOM_COLOR_F, a
	ld [de], a
	inc de
	ret
.skip
	inc hl
	inc hl
	inc de
	inc de
	ret

ChooseLookSkin:
	xor a
	ld hl, ComplexionLookPreviewMenu
	jr ChooseLookPlayerColor

ChooseLookHair:
	ld a, COLOR_SIZE
	ld hl, ColorLookPreviewMenu

ChooseLookPlayerColor:
	ld [wLookRGBOffset], a
	push hl
	call FindLookColorPreset
	pop hl
	jr .choose
.custom_cursor
	ld a, [hl]
	dec a
.choose
	push hl
	call ChooseLookOptionAt
	pop hl
	ld b, a
	ld a, [hl]
	dec a
	cp b
	jr z, .edit
	ld a, b
	call ReadLookColorPreset
	jr .save
.edit
	push hl
	call EditLookRGB
	pop hl
	jr z, .custom_cursor
	call GetLookPreviewRGBPointer
	ld a, [hli]
	ld c, a
	ld b, [hl]
.save
	call GetLookSavedRGBPointer
	ld [hl], c
	inc hl
	set PLAYER_CUSTOM_COLOR_F, b
	ld [hl], b
	ret

FindLookColorPreset:
	call ResolveCurrentLookPalette
	call GetLookPreviewRGBPointer
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call GetLookColorPresets
	ld d, 0
.loop
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next
	cp b
	jr z, .found
.next
	bit 7, a
	jr nz, .found
	inc d
	jr .loop
.found
	ld a, d
	ret

ReadLookColorPreset:
	add a
	ld e, a
	ld d, 0
	call GetLookColorPresets
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

GetLookColorPresets:
	ld hl, LookSkinPresets
	ld a, [wLookRGBOffset]
	and a
	ret z
	ld hl, LookHairPresets
	ret

GetLookSavedRGBPointer:
	ld hl, wPlayerCustomSkin
	jr GetLookRGBPointer

GetLookPreviewRGBPointer:
	ld hl, wResolvedPlayerPalette
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr z, GetLookRGBPointer
	ld hl, wMonResolvedPalette
GetLookRGBPointer:
	ld a, [wLookRGBOffset]
	ld e, a
	ld d, 0
	add hl, de
	ret

EditLookRGB:
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr nz, .mon
	call ResolveCurrentLookPalette
	call ReadLookRGBComponents
	jr .ready
.mon
	call ResolveLookMonPalette
	call ReadLookRGBComponents
	call QuantizeLookMonRGB
.ready
	xor a
	ld [wMenuCursorY], a
	call DrawLookRGBScreen
.redraw
	call DrawLookRGBSliders
	call CGBOnly_CopyTilemapAtOnce
.loop
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyPressed]
	bit B_PAD_A, a
	jr nz, .confirm
	bit B_PAD_B, a
	jr nz, .cancel
	ldh a, [hJoyLast]
	bit B_PAD_UP, a
	jr nz, .up
	bit B_PAD_DOWN, a
	jr nz, .down
	bit B_PAD_LEFT, a
	jr nz, .left
	bit B_PAD_RIGHT, a
	jr z, .loop
	call GetLookRGBChannelAddress
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	ld a, 31
	jr z, .limit
	ld a, 7
.limit
	cp [hl]
	jr z, .loop
	inc [hl]
	jr .update
.left
	call GetLookRGBChannelAddress
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
.update
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr nz, .mon_rgb
	call ShowLookRGBColor
	jr .redraw
.mon_rgb
	call GetLookMonRGBChoice
	call PreviewLookMonChoice
	jr .redraw
.up
	ld hl, wMenuCursorY
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	jr .redraw
.down
	ld hl, wMenuCursorY
	ld a, [hl]
	cp 2
	jr z, .loop
	inc [hl]
	jr .redraw
.confirm
	call PlayClickSFX
	ld b, TRUE
	jr .exit
.cancel
	call PlayClickSFX
	ld b, FALSE
.exit
	push bc
	hlcoord 2, 6, wAttrmap
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr z, .clear_bars
	hlcoord 11, 6, wAttrmap
.clear_bars
	lb bc, 7, 8
	xor a
	call FillBoxWithByte
	pop bc
	pop af
	ldh [hInMenu], a
	ld a, b
	and a
	ret

GetLookRGBChannelAddress:
	ld hl, wLookRGBComponents
	ld a, [wMenuCursorY]
	ld e, a
	ld d, 0
	add hl, de
	ret

ReadLookRGBComponents:
	call GetLookPreviewRGBPointer
	ld a, [hli]
	ld c, a
	ld b, [hl]
	and $1f
	ld hl, wLookRGBComponents
	ld [hli], a
	ld a, b
	and 3
	swap a
	rrca
	ld d, a
	ld a, c
	rlca
	rlca
	rlca
	and 7
	or d
	ld [hli], a
	ld a, b
	rrca
	rrca
	and $1f
	ld [hl], a
	ret

QuantizeLookMonRGB:
	ld hl, wLookRGBComponents
	ld b, 3
.loop
	ld a, [hl]
	call QuantizeMonRGBChannel
	ld [hli], a
	dec b
	jr nz, .loop
	ret

ShowLookRGBColor:
	ld hl, wLookRGBComponents + 1
	ld a, [hli]
	ld c, a
	ld a, [hl]
	add a
	add a
	ld b, a
	ld a, c
	swap a
	rlca
	and 3
	or b
	ld b, a
	ld a, c
	rrca
	rrca
	rrca
	and $e0
	ld hl, wLookRGBComponents
	or [hl]
	ld c, a
ApplyLookPreviewRGB:
	call GetLookPreviewRGBPointer
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, wResolvedPlayerPalette
	jp ApplyLookPlayerPalette

DrawLookRGBScreen:
	ld hl, LookRGBSliderPalettes
	ld de, wBGPals1 palette LOOK_RGB_FIRST_SLIDER_PALETTE
	ld bc, 3 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ShowLookPreviewPalette
	hlcoord 1, 4
	lb bc, NUM_PLAYER_BASE_COLORS + 1, 9
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr z, .clear_list
	hlcoord 10, 4
	lb bc, NUM_LOOK_MON_OPTIONS, 9
.clear_list
	call ClearBox
	hlcoord 1, 1
	lb bc, 1, SCREEN_WIDTH - 2
	call ClearBox
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr nz, .mon_title
	ld de, .Skin
	ld a, [wLookRGBOffset]
	and a
	jr z, .title
	ld de, .Hair
	jr .title
.mon_title
	ld de, .CustomRGB
	ld a, [wLookRGBOffset]
	and a
	jr z, .title
	ld de, .CustomRGB
.title
	hlcoord 1, 1
	call PlaceString
	hlcoord 1, 16
	ld de, .Adjust
	call PlaceString
	hlcoord 1, 17
	ld de, .Buttons
	jp PlaceString
.Skin:
	db "Custom skin tone@"
.Hair:
	db "Custom hair colour@"
.CustomRGB:
	db "Custom RGB@"
.Adjust:
	db "← → Adjust@"
.Buttons:
	db "A: OK      B: Back  @"

DrawLookRGBSliders:
	ld de, wLookRGBComponents
	hlcoord 1, 5
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	jr z, .first
	hlcoord 10, 5
.first
	lb bc, 0, 'R'
	call .next_row
	lb bc, 1, 'G'
	call .next_row
	lb bc, 2, 'B'
	jr .row
.next_row
	push hl
	call .row
	pop hl
	inc de
	ld bc, 3 * SCREEN_WIDTH
	add hl, bc
	ret
.row
	push bc
	push hl
	ld a, [wMenuCursorY]
	cp b
	ld a, ' '
	jr nz, .cursor
	ld a, '▶'
.cursor
	ld [hli], a
	ld [hl], c
	inc hl
	inc hl
	push de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop de
	pop hl
	pop bc
	ld a, b
	add LOOK_RGB_FIRST_SLIDER_PALETTE
	push af
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	ld a, [wLookPreviewFlags]
	bit LOOK_PREVIEW_MON_RGB_F, a
	ld a, [de]
	jr nz, .mon_bar
	add 3
	srl a
	srl a
	jr .width
.mon_bar
	and a
	jr z, .width
	inc a
.width
	ld b, a
	ld c, 8
	pop af
	push de
	push hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld d, h
	ld e, l
	pop hl
	inc b
	dec b
	jr z, .empty
.filled
	ld [hl], '■'
	inc hl
	ld [de], a
	inc de
	dec c
	dec b
	jr nz, .filled
.empty
	ld a, c
	and a
	jr z, .done
	xor a
.track
	ld [hl], '─'
	inc hl
	ld [de], a
	inc de
	dec c
	jr nz, .track
.done
	pop de
	ret

LookRGBSliderPalettes:
	RGB 31, 31, 31
	RGB 24, 26, 30
	RGB 12, 16, 22
	RGB 29, 05, 06
	RGB 31, 31, 31
	RGB 24, 26, 30
	RGB 12, 16, 22
	RGB 05, 22, 08
	RGB 31, 31, 31
	RGB 24, 26, 30
	RGB 12, 16, 22
	RGB 06, 11, 30
