DEF VS_INTRO_LOGO_X EQU 25
DEF VS_INTRO_LOGO_Y EQU 56
DEF VS_INTRO_TIME EQU 255
DEF VS_INTRO_SHAKE_RADIUS_INIT EQU 20
DEF VS_INTRO_SHAKE_RADIUS EQU 3
DEF VS_INTRO_SHAKE_RATE EQU 2
DEF VS_INTRO_SCROLL_RATE EQU 11

MACRO vs_wait_hblank
.wait_no\@
	ldh a, [rSTAT]
	and 3
	jr z, .wait_no\@
.wait\@
	ldh a, [rSTAT]
	and 3
	jr nz, .wait\@
ENDM

ShouldShowTrainerVSIntro:
	ldh a, [hCGB]
	and a
	ret z
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wInBattleTowerBattle]
	and a
	ret nz
	ld a, [wBattleType]
	cp BATTLETYPE_BOSS_BATTLE
	jr z, .Show
	cp BATTLETYPE_SUPER_BOSS_BATTLE
	jr z, .Show
	ld a, [wOtherTrainerClass]
	ld hl, VSIntroTrainerClasses
	ld de, 1
	call IsInArray
	ret c

	ld a, [wOtherTrainerClass]
	ld b, a
	ld a, [wOtherTrainerID]
	ld c, a
	ld hl, VSIntroBossTrainerPairs
.CheckPair:
	ld a, [hli]
	cp -1
	jr z, .Skip
	cp b
	ld a, [hli]
	jr nz, .CheckPair
	cp c
	jr nz, .CheckPair
.Show:
	scf
	ret
.Skip:
	and a
	ret

PlayTrainerVSIntro:
	ldh a, [rWBK]
	push af
	ldh a, [rSTAT]
	push af
	call .SetUpTrainerPortrait
	call .LoadTrainerPortrait
.loop
	call DelayFrame
	call .UpdateFrame
	jr nz, .loop

	ld hl, rLCDC
	res B_LCDC_OBJ_SIZE, [hl]
	ld a, RETI_INSTRUCTION
	ldh [hFunctionInstruction], a
	pop af
	ldh [rSTAT], a
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCX], a
	ldh [rSCX], a
	pop af
	ldh [rWBK], a
	ld c, 15
	call DelayFrames
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.SetUpTrainerPortrait:
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	ldh [rVBK], a
	ld a, RETI_INSTRUCTION
	ldh [hFunctionInstruction], a
	call .SetUpBackdrop
	call .LoadFont
	ld a, [wOtherTrainerClass]
	ld [wTrainerClass], a
	ld a, 1
	ldh [rVBK], a
	ld de, vTiles4
	farcall GetTrainerPic
	xor a
	ldh [hBGMapMode], a
	ld a, 1
	ldh [rVBK], a
	ld de, VSIntroGraphic
	ld hl, vTiles4 tile $40
	lb bc, BANK(VSIntroGraphic), $40
	call Get2bpp
	ld de, .SpaceTile
	ld hl, vTiles5 tile ' '
	lb bc, BANK(@), 1
	call Get2bpp
	xor a
	ldh [rVBK], a

	hlbgcoord 20, 5
	ld bc, BG_MAP_WIDTH - 12
	lb de, 8, ' '
.blank_rows
	call .Fill12
	dec d
	jr nz, .blank_rows
	hlbgcoord 20, 5
	ld bc, BG_MAP_WIDTH - 7
	lb de, 7, $80
.picture_rows
	push de
	di
	vs_wait_hblank
	ld a, e
rept 6
	ld [hli], a
	add d
endr
	ld [hli], a
	add hl, bc
	ei
	pop de
	inc e
	ld a, e
	cp $87
	jr nz, .picture_rows
	call .GetTrainerCaption
	ld hl, wStringBuffer1
	ld c, 12
.find_terminator
	ld a, [hli]
	cp '@'
	jr z, .pad_name
	dec c
	jr nz, .find_terminator
	jr .copy_name
.pad_name
	dec hl
	ld a, ' '
.pad_loop
	ld [hli], a
	dec c
	jr nz, .pad_loop
.copy_name
	ld hl, wStringBuffer1
	debgcoord 20, 12
rept 2
	di
	vs_wait_hblank
rept 6
	ld a, [hli]
	ld [de], a
	inc de
endr
	ei
endr

	ld a, 1
	ldh [rVBK], a
	hlbgcoord 20, 5
	ld bc, BG_MAP_WIDTH - 12
	lb de, 7, 6 | OAM_BANK1
.picture_attrs
	call .Fill12
	dec d
	jr nz, .picture_attrs
	ld e, 6
	call .Fill12
	xor a
	ldh [rVBK], a

	ldh a, [rWBK]
	push af
	ld a, [wOtherTrainerClass]
	ld hl, TrainerPalettes
	ld bc, 4
	call AddNTimes
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld de, wBGPals1 palette 6
	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, BANK(TrainerPalettes)
	ld bc, 4
	call FarCopyBytes
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld hl, .Palette
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes
	farcall ApplyPals
	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.GetTrainerCaption:
	ld a, [wOtherTrainerClass]
	cp RIVAL1
	jr z, .RivalName
	cp RIVAL2
	jr z, .RivalName
	farcall Battle_GetTrainerName
	ret
.RivalName:
	ld hl, wRivalName
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	jp CopyBytes

.SetUpBackdrop:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, .BackdropPalette
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	ld hl, .BackdropPalette
	ld de, wBGPals2 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, BATTLETRANSITION_BLACK
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	ld a, PAL_BG_TEXT
	call ByteFill
	jp CGBOnly_CopyTilemapAtOnce

.LoadFont
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 32
	call Get1bppViaHDMA
	ld de, Font + 32 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Font), 26
	call Get1bppViaHDMA
	ld de, Font + 64 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 32
	call Get1bppViaHDMA
	ld de, Font + 96 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Font), 30
	call Get1bppViaHDMA
	jp LoadFontsExtra

.Fill12
	di
	vs_wait_hblank
	ld a, e
rept 12
	ld [hli], a
endr
	add hl, bc
	ei
	ret

.LoadTrainerPortrait:
	ld hl, rLCDC
	set B_LCDC_OBJ_SIZE, [hl]
	ld a, BANK(wLYOverrides)
	ldh [rWBK], a
	xor a
	ld [wBattleVSPortraitScroll], a
	ld [wBattleVSNameScroll], a
	call .UpdateScroll
	ld a, LOW(LCDGeneric)
	ldh [hFunctionTargetLo], a
	ld a, HIGH(LCDGeneric)
	ldh [hFunctionTargetHi], a
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hLYOverrideEnd], a
	ld a, JP_INSTRUCTION
	ldh [hFunctionInstruction], a
	ld a, STAT_MODE_0
	ldh [rSTAT], a
	ldh a, [rIE]
	or IE_STAT
	ldh [rIE], a
	ld a, 40
	ld [wBattleTransitionCounter], a

	hlbgcoord 0, 4
	ld e, SCREEN_WIDTH
.swipe
	push de
	push hl
	call .UpdateLogo
	call DelayFrame
	pop hl
	push hl
	ld bc, (wTilemap + SCREEN_WIDTH * 4) - (vBGMap0 + BG_MAP_WIDTH * 4)
	add hl, bc
	ld bc, SCREEN_WIDTH
	lb de, '─', ' '
	call .Copy9Nowait
	ld [hl], '─'
	ld bc, BG_MAP_WIDTH
	pop hl
	push hl
	lb de, '─', ' '
	call .Copy9
	ld a, '─'
	call .WriteTile
	ld a, 1
	ldh [rVBK], a
	pop hl
	push hl
	lb de, 6, 6
	call .Copy9
	ld a, 6 | OAM_YFLIP
	call .WriteTile
	xor a
	ldh [rVBK], a
	ld hl, wBattleTransitionCounter
	dec [hl]
	pop hl
	inc hl
	pop de
	dec e
	jr nz, .swipe

	ld e, 20
.slide
	push de
	ld hl, wBattleVSPortraitScroll
	ld a, [hl]
	add 3
	ld [hli], a
	ld a, [hl]
	sub 8
	ld [hl], a
	call .UpdateScroll
	call .UpdateLogo
	pop de
	ld a, e
	dec a
	call nz, DelayFrame
	ld hl, wBattleTransitionCounter
	dec [hl]
	dec e
	jr nz, .slide
	ld a, VS_INTRO_TIME
	ld [wBattleTransitionCounter], a
	ret

.Copy9
	di
	vs_wait_hblank
	call .Copy9Nowait
	ei
	ret
.Copy9Nowait
	ld [hl], d
	add hl, bc
rept 8
	ld [hl], e
	add hl, bc
endr
	ret
.WriteTile
	push af
	di
	vs_wait_hblank
	pop af
	ld [hl], a
	ei
	ret

.UpdateFrame
	ld a, [wBattleTransitionCounter]
	cp VS_INTRO_TIME
	jr z, .first_frame
	cp 65
	call c, .FadeStep
	ld hl, wBattleVSShakeTimer
	dec [hl]
	jr nz, .skip_shake
	ld [hl], VS_INTRO_SHAKE_RATE
	call Random
	ld c, a
	call .Sine
	ld b, 0
	bit 7, a
	jr z, .shake_y_positive
	dec b
.shake_y_positive
	ld c, a
	ld a, [wBattleTransitionSineWaveOffset]
	ld hl, 0
	call AddNTimes
	ld a, VS_INTRO_LOGO_Y
	add h
	ld d, a
	ld a, c
	add 64
	call .Sine
	ld b, 0
	bit 7, a
	jr z, .shake_x_positive
	dec b
.shake_x_positive
	ld c, a
	ld a, [wBattleTransitionSineWaveOffset]
	ld hl, 0
	call AddNTimes
	ld a, VS_INTRO_LOGO_X
	add h
	ld e, a
	call .PositionLogo
	ld a, [wBattleTransitionSineWaveOffset]
	cp VS_INTRO_SHAKE_RADIUS
	jr z, .skip_shake
	dec a
	ld [wBattleTransitionSineWaveOffset], a
.skip_shake
	ld hl, wBattleVSScrollTimer
	dec [hl]
	jr nz, .frame_done
	ld [hl], VS_INTRO_SCROLL_RATE
	ld hl, wBattleVSPortraitScroll
	inc [hl]
	inc hl
	dec [hl]
	jr .frame_done
.first_frame
	ld a, 1
	ld [wBattleVSShakeTimer], a
	ld a, VS_INTRO_SCROLL_RATE
	ld [wBattleVSScrollTimer], a
	ld a, VS_INTRO_SHAKE_RADIUS_INIT
	ld [wBattleTransitionSineWaveOffset], a
	lb de, VS_INTRO_LOGO_Y, VS_INTRO_LOGO_X
	call .PositionLogo
.frame_done
	call .UpdateScroll
	ld hl, wBattleTransitionCounter
	dec [hl]
	ret

.FadeStep

	rra
	ld hl, wBGPals2
	jr nc, .fade_colors
	ld hl, wOBPals2
	ld a, TRUE
	ldh [hCGBPalUpdate], a
.fade_colors
	ld d, 32
.fade_color
	ld a, [hl]
	and $1f
	cp $1f
	jr z, .red_ready
	inc a
.red_ready
	ld c, a
	inc hl
	ld a, [hld]
	and 3
	ld b, a
	ld a, [hl]
	and $e0
	or b
	cp $e3
	jr z, .green_ready
	and $e0
	add $20
	jr nc, .green_ready
	inc b
.green_ready
	or c
	ld [hli], a
	ld a, [hl]
	and $7c
	cp $7c
	jr z, .blue_ready
	add 4
.blue_ready
	or b
	ld [hli], a
	dec d
	jr nz, .fade_color
	ret

.UpdateScroll

	ld hl, wLYOverrides
	ld bc, 39
	xor a
	call ByteFill
	ld a, [wBattleVSPortraitScroll]
	ld bc, 56
	call ByteFill
	ld a, [wBattleVSNameScroll]
	ld bc, 8
	call ByteFill
	xor a
	ld bc, SCREEN_HEIGHT_PX - 103
	jp ByteFill

.UpdateLogo
	ld c, 32
	ld hl, .PolarPositions
	ld de, wShadowOAM
.logo_sprite
	push bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld a, [wBattleTransitionCounter]
	add a
	add a
	add b
	ld b, a
	push bc
	call .PolarOffset
	ld a, h
	and a
	jr nz, .y_hidden
	ld a, [wBattleTransitionSineWaveOffset]
	and a
	ld a, VS_INTRO_LOGO_Y + 24
	jr nz, .y_negative
	add l
	jr c, .y_hidden
	jr .y_ready
.y_negative
	sub l
	jr nc, .y_ready
.y_hidden
	xor a
.y_ready
	ld [de], a
	inc de
	pop bc
	ld a, b
	add 64
	call .PolarOffset
	ld a, h
	and a
	jr nz, .x_hidden
	ld a, [wBattleTransitionSineWaveOffset]
	and a
	ld a, VS_INTRO_LOGO_X + 28
	jr nz, .x_negative
	add l
	jr c, .x_hidden
	jr .x_ready
.x_negative
	sub l
	jr nc, .x_ready
.x_hidden
	xor a
.x_ready
	ld [de], a
	inc de
	pop hl
	pop bc
	ld a, $80
	sub c
	add a
	ld [de], a
	inc de
	ld a, OAM_BANK1
	ld [de], a
	inc de
	dec c
	jr nz, .logo_sprite
	ret

.PolarOffset
	call .Sine
	ld hl, wBattleTransitionSineWaveOffset
	bit 7, a
	ld [hl], 0
	jr z, .positive
	inc [hl]
	cpl
.positive
	call .Multiply
	ld c, h
	ld a, [wBattleTransitionCounter]
	add 4
	call .Multiply
rept 3
	srl h
	rr l
endr
	ret

.Multiply

	ld hl, 0
	ld b, 0
.multiply_loop
	srl a
	jr nc, .no_add
	add hl, bc
.no_add
	sla c
	rl b
	and a
	jr nz, .multiply_loop
	ret

.Sine
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, .SineTable
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

.PositionLogo
	ld hl, wShadowOAM
	ld b, 4
.logo_row
	push de
	ld c, 8
.logo_column
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	inc hl
	inc hl
	ld a, e
	add 8
	ld e, a
	dec c
	jr nz, .logo_column
	pop de
	ld a, d
	add 16
	ld d, a
	dec b
	jr nz, .logo_row
	ret

.Palette
	RGB 31, 31, 31
	RGB 8, 19, 28
	RGB 31, 6, 6
	RGB 0, 0, 0
.BackdropPalette
rept 4
	RGB 5, 6, 10
endr
.SpaceTile
	ds 1 tiles, 0

.SineTable

for t, 256
	DEF vs_sine_value = (sin(t * 1.0 / 256) * 128) / 256
	if vs_sine_value == 128
		db 127
	else
		db vs_sine_value & $ff
	endc
endr
PURGE vs_sine_value

MACRO vs_polar
	db (ATAN2(\1, \2) + 1.0) & $ff
	db \3
ENDM
.PolarPositions
	vs_polar -24.0, -28.0, 148
	vs_polar -24.0, -20.0, 125
	vs_polar -24.0, -12.0, 107
	vs_polar -24.0, -4.0, 97
	vs_polar -24.0, 4.0, 97
	vs_polar -24.0, 12.0, 107
	vs_polar -24.0, 20.0, 125
	vs_polar -24.0, 28.0, 148
	vs_polar -8.0, -28.0, 116
	vs_polar -8.0, -20.0, 86
	vs_polar -8.0, -12.0, 58
	vs_polar -8.0, -4.0, 36
	vs_polar -8.0, 4.0, 36
	vs_polar -8.0, 12.0, 58
	vs_polar -8.0, 20.0, 86
	vs_polar -8.0, 28.0, 116
	vs_polar 8.0, -28.0, 116
	vs_polar 8.0, -20.0, 86
	vs_polar 8.0, -12.0, 58
	vs_polar 8.0, -4.0, 36
	vs_polar 8.0, 4.0, 36
	vs_polar 8.0, 12.0, 58
	vs_polar 8.0, 20.0, 86
	vs_polar 8.0, 28.0, 116
	vs_polar 24.0, -28.0, 148
	vs_polar 24.0, -20.0, 125
	vs_polar 24.0, -12.0, 107
	vs_polar 24.0, -4.0, 97
	vs_polar 24.0, 4.0, 97
	vs_polar 24.0, 12.0, 107
	vs_polar 24.0, 20.0, 125
	vs_polar 24.0, 28.0, 148
PURGE vs_polar

VSIntroGraphic:
	INCBIN "gfx/battle/vs.2bpp"
	assert @ - VSIntroGraphic == $40 tiles

INCLUDE "data/trainers/vs_intro.asm"
