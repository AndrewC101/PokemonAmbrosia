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
; Presentation wait wrapper. x2 and x4 both use x2 timing until x4 is audited.
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	jr z, .delay
	srl c
	jr nz, .delay
	inc c
.delay
	jp DelayFrames

BattleAnimWaitSFX::
; Battle-animation SFX channels use normal audio updates plus one extra
; note-duration tick per real frame at accelerated battle speeds.
	ld a, [wOptions2]
	and BATTLE_ENGINE_SPEED_MASK
	jp z, WaitSFX

	push hl
	push de

.wait
	call CheckSFX
	jr nc, .done
	call BattleAnimSpeedUpSFXChannels
	call DelayFrame
	jr .wait

.done
	pop de
	pop hl
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
	call ClearScreen
	call GetOverworldSpeedOption
	ld [wGameSpeedMenuOverworldTemp], a
	call GetBattleEngineSpeedOption
	ld [wGameSpeedMenuBattleTemp], a
	xor a
	ld [wGameSpeedMenuRow], a
	call DrawGameSpeedMenu
	ld a, TRUE
	ldh [hBGMapMode], a
	call WaitBGMap
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	bit B_PAD_A, a
	jr nz, .a_button
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
	call WaitBGMap
	jr .joypad_loop

.a_button
	ld a, [wGameSpeedMenuOverworldTemp]
	call SetOverworldSpeedOption
	ld a, [wGameSpeedMenuBattleTemp]
	call SetBattleEngineSpeedOption
	call PlayClickSFX

.b_button
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
	hlcoord 0, 4
	lb bc, 6, 18
	call Textbox
	hlcoord 5, 5
	ld de, .Title
	call PlaceString
	hlcoord 1, 7
	ld de, .Overworld
	call PlaceString
	hlcoord 1, 8
	ld de, .Battle
	call PlaceString
	call .PlaceSpeedValues
	call .ClearCursors
	jr .PlaceCursor

.PlaceSpeedValues:
	hlcoord 11, 7
	ld de, .X1
	call PlaceString
	hlcoord 14, 7
	ld de, .X2
	call PlaceString
	hlcoord 17, 7
	ld de, .X4
	call PlaceString
	hlcoord 11, 8
	ld de, .X1
	call PlaceString
	hlcoord 14, 8
	ld de, .X2
	call PlaceString
	hlcoord 17, 8
	ld de, .X4
	call PlaceString
	ret

.ClearCursors:
	hlcoord 10, 7
	ld a, ' '
	ld [hli], a
	inc hl
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld [hl], a
	hlcoord 10, 8
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
	hlcoord 10, 7
	ld a, [wGameSpeedMenuOverworldTemp]
	jr .got_row

.battle
	hlcoord 10, 8
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
