GetOverworldSpeedOption::
; Return normalized overworld speed in a: 0=x1, 1=x2, 2=x4.
; Cross-bank callers must use newfarcall, since regular farcall clobbers a.
	ld a, [wOptions2]
	and OVERWORLD_SPEED_MASK
	srl a
	srl a
	jr NormalizeGameSpeedOption

GetBattleEngineSpeedOption::
; Return normalized battle engine speed in a: 0=x1, 1=x2, 2=x4.
; Cross-bank callers must use newfarcall, since regular farcall clobbers a.
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	swap a

NormalizeGameSpeedOption:
	cp NUM_GAME_SPEED_OPTIONS
	ret c
	xor a
	ret

SetOverworldSpeedOption::
; Input a = speed enum. b holds the shifted field while wOptions2 is preserved.
	call NormalizeGameSpeedOption
	add a
	add a
	ld b, a
	ld a, [wOptions2]
	and ~OVERWORLD_SPEED_MASK
	or b
	ld [wOptions2], a
	ret

SetBattleEngineSpeedOption::
; Input a = speed enum. b holds the shifted field while wOptions2 is preserved.
	call NormalizeGameSpeedOption
	swap a
	ld b, a
	ld a, [wOptions2]
	and ~BATTLE_ENGINE_SPEED_MASK
	or b
	ld [wOptions2], a
	ret

BattleEngineDelayFrames::
; Presentation wait wrapper. x4 uses stronger compression to offset
; unavoidable one-frame staging waits elsewhere.
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	cp GAME_SPEED_X2 << BATTLE_ENGINE_SPEED_SHIFT
	jr z, .half
	cp GAME_SPEED_X4 << BATTLE_ENGINE_SPEED_SHIFT
	jr z, .eighth
	jr .delay

.half
	srl c
	jr nz, .delay
	inc c
	jr .delay

.eighth
	srl c
	srl c
	srl c
	jr nz, .delay
	inc c
.delay
	jp DelayFrames

BattleAnimWaitSFX::
; Battle-animation SFX channels use normal audio updates plus extra
; note-duration ticks per real frame at accelerated battle speeds.
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	jp z, WaitSFX

	push hl
	push de
	push bc

.wait
	call CheckSFX
	jr nc, .done
	call BattleAnimSFX_GetExtraTicks
	and a
	jr z, .frame
	ld b, a
.extra_ticks
	push bc
	call BattleAnimSpeedUpSFXChannels
	pop bc
	dec b
	jr nz, .extra_ticks
.frame
	call DelayFrame
	jr .wait

.done
	pop bc
	pop de
	pop hl
	ret

BattleAnimSFX_GetExtraTicks:
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	cp GAME_SPEED_X2 << BATTLE_ENGINE_SPEED_SHIFT
	jr z, .x2
	cp GAME_SPEED_X4 << BATTLE_ENGINE_SPEED_SHIFT
	jr z, .x4
	xor a
	ret

.x2
	ld a, 1
	ret

.x4
	ld a, 7
	ret

BattleAnimSpeedUpSFXChannels:
	ld hl, wChannel5
	call BattleAnimSpeedUpSFXChannel
	ld hl, wChannel6
	call BattleAnimSpeedUpSFXChannel
	ld hl, wChannel7
	call BattleAnimSpeedUpSFXChannel
	ld hl, wChannel8
	; fallthrough

BattleAnimSpeedUpSFXChannel:
	ld de, CHANNEL_FLAGS1
	add hl, de
	bit SOUND_CHANNEL_ON, [hl]
	ret z
	ld de, CHANNEL_NOTE_DURATION - CHANNEL_FLAGS1
	add hl, de
	ld a, [hl]
	cp 2
	ret c
	dec [hl]
	ret

OpenGameSpeedMenu::
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
	call ClearJoypad
	call ClearBGPalettes
	call LoadStandardFont
	call LoadFontsExtra
	call GetOverworldSpeedOption
	ld [wGameSpeedMenuOverworldTemp], a
	call GetBattleEngineSpeedOption
	ld [wGameSpeedMenuBattleTemp], a
	xor a
	ld [wGameSpeedMenuRow], a
	ld hl, GameSpeedMenuHeader
	call LoadMenuHeader
	call ClearSprites
	call DrawGameSpeedMenu
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	bit B_PAD_START, a
	jr nz, .start_button
	bit B_PAD_B, a
	jr nz, .b_button

	ldh a, [hJoyLast]
	cp PAD_UP
	jr z, .switch_row
	cp PAD_DOWN
	jr z, .switch_row
	cp PAD_LEFT
	jr z, .cycle_left
	cp PAD_RIGHT
	jr z, .cycle_right
	call DelayFrame
	jr .joypad_loop

.switch_row
	ld hl, wGameSpeedMenuRow
	ld a, [hl]
	xor 1
	ld [hl], a
	jr .redraw

.cycle_left
	call GetGameSpeedTempPointer
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, NUM_GAME_SPEED_OPTIONS
.decrease
	dec a
	ld [hl], a
	jr .redraw

.cycle_right
	call GetGameSpeedTempPointer
	ld a, [hl]
	inc a
	cp NUM_GAME_SPEED_OPTIONS
	jr c, .save_temp
	xor a
.save_temp
	ld [hl], a

.redraw
	call PlayClickSFX
	call DrawGameSpeedMenu
	jr .joypad_loop

.start_button
	ld a, [wGameSpeedMenuOverworldTemp]
	call SetOverworldSpeedOption
	ld a, [wGameSpeedMenuBattleTemp]
	call SetBattleEngineSpeedOption
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX

.b_button
	call ExitMenu
	pop af
	ldh [hInMenu], a
	ld a, 6 ; redraw the Start menu after closing this panel
	ret

GetGameSpeedTempPointer:
	ld hl, wGameSpeedMenuRow
	bit 0, [hl]
	ld hl, wGameSpeedMenuOverworldTemp
	ret z
	ld hl, wGameSpeedMenuBattleTemp
	ret

DrawGameSpeedMenu:
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call ClearMenuBoxInterior
	hlcoord 1, 1
	ld de, .Title
	call PlaceString
	hlcoord 1, 4
	ld de, .Overworld
	call PlaceString
	hlcoord 1, 6
	ld de, .Battle
	call PlaceString
	hlcoord 1, 14
	ld de, .Confirm
	call PlaceString
	hlcoord 1, 15
	ld de, .Cancel
	call PlaceString
	call .PlaceSpeedValues
	call .ClearCursors
	call .PlaceCursor
	call HDMATransferTilemapAndAttrmap_Menu
	ret

.PlaceSpeedValues:
	hlcoord 11, 4
	ld de, .X1
	call PlaceString
	hlcoord 14, 4
	ld de, .X2
	call PlaceString
	hlcoord 17, 4
	ld de, .X4
	call PlaceString
	hlcoord 11, 6
	ld de, .X1
	call PlaceString
	hlcoord 14, 6
	ld de, .X2
	call PlaceString
	hlcoord 17, 6
	ld de, .X4
	call PlaceString
	ret

.ClearCursors:
	hlcoord 10, 4
	ld a, ' '
	ld [hli], a
	inc hl
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld [hl], a
	hlcoord 10, 6
	ld [hli], a
	inc hl
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld [hl], a
	ret

.PlaceCursor:
	ld a, [wGameSpeedMenuRow]
	and a
	jr nz, .battle
	hlcoord 10, 4
	ld a, [wGameSpeedMenuOverworldTemp]
	jr .got_row

.battle
	hlcoord 10, 6
	ld a, [wGameSpeedMenuBattleTemp]

.got_row
	ld bc, 3
	call AddNTimes
	ld [hl], $ec ; hollow cursor
	ret

.Title:
	db "Game Speed@"
.Overworld:
	db "Overworld@"
.Battle:
	db "Battle@"
.X1:
	db "x1@"
.X2:
	db "x2@"
.X4:
	db "x4@"
.Confirm:
	db "Start: Confirm@"
.Cancel:
	db "B: Cancel@"

GameSpeedMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw GameSpeedMenuData
	db 1 ; default option

GameSpeedMenuData:
	db 0 ; flags
	db 0 ; items
