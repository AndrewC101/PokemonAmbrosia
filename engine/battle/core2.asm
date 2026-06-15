; ============================================
; ====== EFFECT COMMAND EXCESS FUNCTIONS =====
; ============================================
; These are functions used in effect_commands.asm
; they are defined here as that file is out of space
RainSwitch:
    ld a, [wBattleWeather]
    cp WEATHER_RAIN
    ret z
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 255
	ld [wWeatherCount], a
    ld a, [wBattleHasJustStarted]
    and a
    ret nz
    ld de, RAIN_DANCE
	farcall Call_PlayBattleAnim
	ld hl, DownpourText
	jp StdBattleTextbox

SunSwitch:
    ld a, [wBattleWeather]
    cp WEATHER_SUN
    ret z
    ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 255
	ld [wWeatherCount], a
    ld a, 0
	ld [wBattleTimeOfDay], a
	farcall _CGB_BattleColors
    ld a, [wBattleHasJustStarted]
    and a
    ret nz
    ld de, SUNNY_DAY
	farcall Call_PlayBattleAnim
	ld hl, SunGotBrightText
	jp StdBattleTextbox

SandSwitch:
    ld a, [wBattleWeather]
    cp WEATHER_SANDSTORM
    ret z
    ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 255
	ld [wWeatherCount], a
    ld a, [wBattleHasJustStarted]
    and a
    ret nz
    ld de, ANIM_IN_SANDSTORM
	farcall Call_PlayBattleAnim
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

HailSwitch:
    ld a, [wBattleWeather]
    cp WEATHER_HAIL
    ret z
    ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld a, 255
	ld [wWeatherCount], a
    ld a, [wBattleHasJustStarted]
    and a
    ret nz
    ld de, ANIM_IN_HAIL
	farcall Call_PlayBattleAnim
	ld hl, ItStartedToHailText
	jp StdBattleTextbox

SpikesSwitch:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens
    bit SCREENS_SPIKES, [hl]
    ret nz
	set SCREENS_SPIKES, [hl]
    ld de, SPIKES
    call PlayAnimationIfNeeded
	ld hl, SpikesText
	jp StdBattleTextbox

StealthRockSwitch:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens
    bit SCREENS_STEALTH_ROCK, [hl]
    ret nz
	set SCREENS_STEALTH_ROCK, [hl]
    ld de, STEALTH_ROCK
    call PlayAnimationIfNeeded
	ld hl, StealthRockText
	jp StdBattleTextbox

ToxicSpikesSwitch:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens
    bit SCREENS_TOXIC_SPIKES, [hl]
    ret nz
	set SCREENS_TOXIC_SPIKES, [hl]
    ld de, TOXIC_SPIKES
    call PlayAnimationIfNeeded
	ld hl, ToxicSpikesText
	jp StdBattleTextbox

TrickRoomSwitch:
    ld a, [wTrickRoomCount]
    and a
    ret nz
    ld a, 5
    ld [wTrickRoomCount], a
    ld de, TRICK_ROOM
    call PlayAnimationIfNeeded
	ld hl, TrickRoomText
	jp StdBattleTextbox

ReflectSwitch:
    ld hl, wPlayerScreens
	ld bc, wPlayerReflectCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyReflectCount
.got_screens_pointer
    bit SCREENS_REFLECT, [hl]
    ret nz
	set SCREENS_REFLECT, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, REFLECT
    call PlayAnimationIfNeeded
    ld hl, ReflectEffectText
	jp StdBattleTextbox

LightScreenSwitch:
    ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount
.got_screens_pointer
    bit SCREENS_LIGHT_SCREEN, [hl]
    ret nz
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, LIGHT_SCREEN
    call PlayAnimationIfNeeded
    ld hl, LightScreenEffectText
	jp StdBattleTextbox

SafeguardSwitch:
    ld hl, wPlayerScreens
	ld bc, wPlayerSafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemySafeguardCount
.got_screens_pointer
    bit SCREENS_SAFEGUARD, [hl]
    ret nz
	set SCREENS_SAFEGUARD, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, SAFEGUARD
    call PlayAnimationIfNeeded
    ld hl, CoveredByVeilText
	jp StdBattleTextbox

NaturalCureSwitch:
 	ldh a, [hBattleTurn]
 	and a
 	jr z, .player
    ld hl, wEnemyMonStatus
    call NaturalCure
  	farcall CalcEnemyStats
  	ret
.player
    ld hl, wBattleMonStatus
    call NaturalCure
 	farcall CalcPlayerStats
 	ret

NaturalCure:
    ld a, [hl]
    and a
    ret z
    xor a
    ld [hl], a
    ld de, RECOVER
    call PlayAnimationIfNeeded
    ld hl, NaturalCureText
    jp StdBattleTextbox

DefogSwitch:
    call AnyFieldEffectPresent
    ret nc
    ld de, DEFOG
    call PlayAnimationIfNeeded
    callfar BattleCommand_Defog
	ret

TauntSwitch:
    callfar BattleCommand_CheckDeathImmunity
    ld a, [wEffectFailed]
    and a
    ret nz
    callfar BattleCommand_CheckSafeguard
    ld a, [wAttackMissed]
    and a
    ret nz
    ld de, TAUNT
    call PlayAnimationIfNeeded
    ld a, BATTLE_VARS_MOVE_ANIM
    call GetBattleVarAddr
    ld a, [hl]
    push hl
    push af
    xor a
    ld [hl], a
    callfar BattleCommand_Taunt
    pop af
    pop hl
    ld [hl], a
	ret

LeechSeedSwitch:
    ld de, LEECH_SEED
    call PlayAnimationIfNeeded
    ld a, BATTLE_VARS_MOVE_ANIM
    call GetBattleVarAddr
    ld a, [hl]
    push hl
    push af
    xor a
    ld [hl], a
    callfar BattleCommand_LeechSeed
    pop af
    pop hl
    ld [hl], a
	ret

SubSwitch:
    callfar BattleCommand_Substitute
	ret

AnyFieldEffectPresent:
    ld a, [wFieldWeather]
    cp WEATHER_NONE
    jr nz, .yes
    ld a, [wBattleWeather]
    cp WEATHER_NONE
    jr nz, .yes
    ld a, [wPlayerScreens]
    call AnyScreensUp
    jr c, .yes
    ld a, [wEnemyScreens]
    call AnyScreensUp
    jr c, .yes
    xor a
    ret
.yes
    scf
    ret

AnyScreensUp:
	bit SCREENS_SAFEGUARD, a
	jr nz, .yes
	bit SCREENS_LIGHT_SCREEN, a
	jr nz, .yes
	bit SCREENS_REFLECT, a
	jr nz, .yes
	bit SCREENS_SPIKES, a
	jr nz, .yes
	bit SCREENS_STEALTH_ROCK, a
	jr nz, .yes
	bit SCREENS_TOXIC_SPIKES, a
	jr nz, .yes
	bit SCREENS_STICKY_WEB, a
	jr nz, .yes
	xor a
	ret
.yes
    scf
    ret

ScreenBreakSwitch:
	ldh a, [hBattleTurn]
	and a
	jr z, .playersTurn
    ld hl, wPlayerSafeguardCount
	ld a, [wPlayerScreens]
	jr .checkScreens
.playersTurn
    ld hl, wEnemySafeguardCount
	ld a, [wEnemyScreens]
.checkScreens
	bit SCREENS_SAFEGUARD, a
	jr nz, .effect
	bit SCREENS_LIGHT_SCREEN, a
	jr nz, .effect
	bit SCREENS_REFLECT, a
	ret z
.effect
    push hl
    ld de, POISON_GAS
    farcall SwitchTurnCore
    call PlayAnimationIfNeeded
    farcall SwitchTurnCore

    ld hl, ShatteredScreensText
    call PrintText
    pop hl

    ld a, 1
    ld [hli], a
    ld [hli], a
    ld [hl], a
	ret

ShatteredScreensText:
    text "Screens were"
    line "shattered!"
    prompt

SpecialAttackUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_SpecialAttackUp
	call PrintSpecialAttackUpMessage
	ret

AttackUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_AttackUp
	call PrintAttackUpMessage
	ret

SpecialDefenseUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_SpecialDefenseUp
	call PrintSpecialDefenseUpMessage
	ret

DefenseUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_DefenseUp
	call PrintDefenseUpMessage
	ret

SpeedUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_SpeedUp
	call PrintSpeedUpMessage
	ret

EvasionUpSwitch:
    call PlayBoostAnimation
    callfar BattleCommand_EvasionUp
	call PrintEvasionUpMessage
	ret

AttackDownSwitch:
    callfar BattleCommand_AttackDown
    call PlayDropAnimation
	ret

SpecialAttackDownSwitch:
    callfar BattleCommand_SpecialAttackDown
    call PlayDropAnimation
	ret

AccuracyDownSwitch:
    callfar BattleCommand_AccuracyDown
    call PlayDropAnimation
	ret

TransformSwitch:
    call ShouldPlayAnim
    ret nc
    callfar BattleCommand_Transform
    ret

PlayBoostAnimation:
    ld de, FOCUS_ENERGY
    call PlayAnimationIfNeeded
    ret

CoreClearBodyPokemon:
    db TENTACOOL
    db TENTACRUEL
    db BELDUM
    db METANG
    db METAGROSS
    db DIALGA
    db ARCEUS
    db REGIGIGAS
    db VAPOREON
    db MELTAN
    db MELMETAL
    db KYOGRE
    db -1

PlayDropAnimation:
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	ld hl, wEnemySubStatus4
	jr z, .gotSide
	ld a, [wBattleMonSpecies]
	ld hl, wPlayerSubStatus4

.gotSide
    push hl
    push de
	push bc
	ld hl, CoreClearBodyPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
	ret c

    ld a, [hl]
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

    ld de, LEER
    call PlayAnimationIfNeeded
    ld de, ANIM_ENEMY_STAT_DOWN
    call PlayAnimationIfNeeded
    ret nc
    callfar BattleCommand_StatDownMessage
    ret

PlayAnimationIfNeeded:
; assume animation in de
    call ShouldPlayAnim
    jr nc, .skipAnim
	farcall Call_PlayBattleAnim
	scf
	ret
.skipAnim
    xor a
    ret

ShouldPlayAnim:
	ld a, [wBattleMode]
	dec a
	jr nz, .checkEnemyPresent
	ld a, [wLinkMode]
	and a
	jr z, .yes
	ld a, [wBattleHasJustStarted]
	and a
	jr nz, .no
	jr .yes
.checkEnemyPresent
    ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr nz, .gotEnemy
	ld a, [wEnemyMonSpecies]
.gotEnemy
    and a
    jr z, .no
.yes
    scf
    ret
.no
    xor a
    ret

HasWildBattleBegun:
    ld a, [wBattleMode]
	dec a
	jr nz, .no
	ld a, [wBattleMonSpecies]
	and a
	jr nz, .no
	scf
	ret
.no
    xor a
    ret

PrintAttackUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildAttackUpText
    jp BattleTextbox
WildAttackUpText:
    text "Enemy Attack"
    line "went up!"
    prompt

PrintDefenseUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildDefenseUpText
    jp BattleTextbox
WildDefenseUpText:
    text "Enemy Defense"
    line "went up!"
    prompt

PrintSpeedUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildSpeedUpText
    jp BattleTextbox
WildSpeedUpText:
    text "Enemy Speed"
    line "went up!"
    prompt

PrintSpecialAttackUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildSpecialAttackUpText
    jp BattleTextbox
WildSpecialAttackUpText:
    text "Enemy SPCL.ATK"
    line "went up!"
    prompt

PrintSpecialDefenseUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildSpecialDefenseUpText
    jp BattleTextbox
WildSpecialDefenseUpText:
    text "Enemy SPCL.DEF"
    line "went up!"
    prompt

PrintEvasionUpMessage:
    call HasWildBattleBegun
    jr c, .wild
	farcall BattleCommand_StatUpMessage
	ret
.wild
    ld hl, WildEvasionUpText
    jp BattleTextbox
WildEvasionUpText:
    text "Enemy Evasion"
    line "went up!"
    prompt

RecoverLeftovers:
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z
.restore
	farcall GetSixteenthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP

	call CheckIfFastBattlesIsOn
	ret nz
	ld hl, BattleText_TargetRecoveredWithLeftovers
	jp StdBattleTextbox

RecoverHolyCrown:
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z
.restore
	farcall GetSixteenthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP

	call CheckIfFastBattlesIsOn
	ret nz
	ld hl, BattleText_TargetRecoveredWithHolyCrown
	jp StdBattleTextbox

; used by trainer SELF to set DVS in bc
SetUpSelfDVs:
    ld a, [wOtherTrainerClass]
    cp CAL
    jr z, .self
    cp CAL_F
    jr nz, .notSelf
.self
    ld a, [wCurPartyMon]
	ld hl, wOTPartyMon1DVs
	call GetPartyLocation
	ld b, [hl]
	inc hl
	ld c, [hl]
.notSelf
    ret

RuthlessClasses:
    db WALLACE
    db SOLDIER
    db EXECUTIVEM
    db EXECUTIVEF
    db GRUNTM
    db GRUNTF
    db ROLE_PLAYER_NORMAL
    db ROLE_PLAYER_SHINY
    db -1

BattleChoiceMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 6, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP
	db 2
	db "Battle Data@"
	db "Forfeit?@"

BattleChoiceMenu:
	ld hl, BattleChoiceMenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call CloseWindow
	call WaitBGMap

	; press B to exit
    ldh a, [hJoyPressed]
    and B_BUTTON
    ret nz

    ; options when pressing A
	ld a, [wMenuCursorY]
	dec a
	jr z, .BattleData
	dec a
	jr z, .Forfeit
	ret

.BattleData
	call ClearSprites
	jp PrintBattleInfo

.Forfeit
	; fallthrough

BattleInfoOrForfeit:
	call ClearSprites
    ld hl, ForfeitMatchText
    call PrintText
    call NoYesBox
    jr c, .cantEscape

    ld a, [wOtherTrainerClass]
    ld hl, RuthlessClasses
    ld de, 1
    call IsInArray
    jr c, .ruthless
    xor a
    ld [wBattleMonHP], a
    ld [wBattleMonHP + 1], a
    ld [wPartyMon1HP], a
    ld [wPartyMon1HP + 1], a
    ld [wPartyMon2HP], a
    ld [wPartyMon2HP + 1], a
    ld [wPartyMon3HP], a
    ld [wPartyMon3HP + 1], a
    ld [wPartyMon4HP], a
    ld [wPartyMon4HP + 1], a
    ld [wPartyMon5HP], a
    ld [wPartyMon5HP + 1], a
    ld [wPartyMon6HP], a
    ld [wPartyMon6HP + 1], a
    farcall HandlePlayerMonFaint
    scf
    ret
.cantEscape
    xor a
    ret
.ruthless
    xor a
    ld hl, BattleText_DoesNotAccept
    jp StdBattleTextbox

DEF BATTLE_DMG_ICON_VTILE   EQU $53
DEF BATTLE_DMG_ICON_TILE_ID EQU $d3

MoveInfoBox:
	xor a
	ldh [hBGMapMode], a

	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr nz, .draw_full_box

	hlcoord 0, 8 ; upper right corner of the compact textbox
	ld b, 3 ; Box height
	jr .draw_box

.draw_full_box
	hlcoord 0, 7 ; upper right corner of the textbox
	ld b, 4 ; Box height

.draw_box
	ld c, 9 ; Box length
	call Textbox
	call MobileTextBorder

	ld a, [wPlayerDisableCount]
	and a
	jr z, .not_disabled

	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_disabled

	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr nz, .full_disabled

	hlcoord 1, 11
	jr .print_disabled

.full_disabled
	hlcoord 1, 10

.print_disabled
	ld de, .Disabled
	call PlaceString
	ret

.not_disabled
	ld hl, wMenuCursorY
	dec [hl]
	call SetPlayerTurn
	ld hl, wBattleMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	ld a, WILDMON
	ld [wMonType], a
	callfar GetMaxPPOfMove

	ld hl, wMenuCursorY
	ld c, [hl]
	inc [hl]
	ld b, 0
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld [wStringBuffer1], a
	call .PrintPP

	farcall UpdateMoveData

	farcall DrawBattleMoveTypeCategoryIcons

	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr nz, .full_layout

	call .ShiftCompactTypeCategoryStrip
	ld de, .pp_string
	hlcoord 2, 11
	call PlaceString

	ld de, .power_string
	hlcoord 4, 10
	call PlaceString

	hlcoord 1, 10
	jr .print_power

.full_layout
	ld de, .pp_string
	hlcoord 2, 10
	call PlaceString

	ld de, .power_string
	hlcoord 4, 9
	call PlaceString

	hlcoord 1, 9

.print_power
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	cp 2
	jr c, .nopower
	jr .haspower

.nopower
	ld de, .nopower_string
	call PlaceString
	jr .place_accuracy

.haspower
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, 1, 3
	call PrintNum

.place_accuracy
	ld a, [wCurSpecies]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_ACC) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	call .ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr nz, .full_accuracy

	hlcoord 6, 10
	jr .print_accuracy

.full_accuracy
	hlcoord 6, 9

.print_accuracy
	call PrintNum
	ld [hl], "<%>"
	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr z, .place_category
	call .LoadAndPlaceBattleDamageIcon
	call .PrintDamage
	ret

.place_category
	ret

.PrintPP
	ld a, [wOptions2]
	and 1 << BATTLE_INFO
	jr nz, .full_pp

	hlcoord 5, 11
	jr .print_pp

.full_pp
	hlcoord 5, 10

.print_pp
	push hl
	ld de, wStringBuffer1
	lb bc, 1, 2
	call PrintNum
	pop hl
	inc hl
	inc hl
	ld [hl], '/'
	inc hl
	ld de, wNamedObjectIndex
	lb bc, 1, 2
	call PrintNum
	ret

.ShiftCompactTypeCategoryStrip
; The battle icon loader always targets row 8. For the compact 3-line move
; info box, copy that strip down to row 9 and restore the top border run.
	hlcoord 2, 8
	decoord 2, 9
	ld c, 6
.copy_strip
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy_strip

	hlcoord 2, 8
	ld a, $7a ; "─"
	ld bc, 6
	call ByteFill

	hlcoord 2, 8, wAttrmap
	ld a, PAL_BATTLE_BG_PLAYER
	ld bc, 6
	call ByteFill

	hlcoord 2, 9, wAttrmap
	ld a, BATTLE_MOVE_TYPECAT_PALETTE
	ld bc, 6
	call ByteFill

	farcall ApplyAttrmap
	ret

.LoadAndPlaceBattleDamageIcon
; Borrow two more vTiles1 font slots for the battle-only DMG icon. The
; matching close-path restore covers the full borrowed span once the move
; info box is gone.
	ld a, [wUnusedBit]
	and a
	jr nz, .place_tiles
	ld de, BattleDamageIconGFX
	ld hl, vTiles1 tile BATTLE_DMG_ICON_VTILE
	lb bc, BANK(BattleDamageIconGFX), 2
	call Request2bpp
	ld a, TRUE
	ld [wUnusedBit], a

.place_tiles
	hlcoord 1, 11
	ld a, BATTLE_DMG_ICON_TILE_ID
	ld [hli], a
	inc a
	ld [hl], a

	ldh a, [hCGB]
	and a
	ret z

; Reuse the existing move-strip palette slot and dedicate color 3 to the
; fixed pure-red DMG glyph. Patch only that one palette entry so the existing
; category/type colors loaded by DrawBattleMoveTypeCategoryIcons stay intact.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld de, wBGPals1 palette PAL_BATTLE_BG_6 color 3
	ld a, LOW(palred 20)
	ld [de], a
	inc de
	ld a, HIGH(palred 20)
	ld [de], a
	ld de, wBGPals2 palette PAL_BATTLE_BG_6 color 3
	ld a, LOW(palred 20)
	ld [de], a
	inc de
	ld a, HIGH(palred 20)
	ld [de], a
	pop af
	ldh [rSVBK], a

	hlcoord 1, 11, wAttrmap
	ld a, PAL_BATTLE_BG_6
	ld [hli], a
	ld [hl], a
	hlcoord 2, 8, wAttrmap
	ld bc, 6
	call ByteFill
	farcall ApplyAttrmap
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PrintDamage
	ld a, [wCurDamage]
	ld h, a
	ld a, [wCurDamage + 1]
	ld l, a
	push hl

	; The move struct stores Return at base power 1 and normally upgrades it
	; via happinesspower at runtime. The preview path goes straight through
	; PlayerAttackDamage, so patch the displayed power here and restore it later.
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	push af
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_RETURN
	jr nz, .check_fixed_damage
	callfar BattleCommand_HappinessPower
	ld a, d
	ld [wPlayerMoveStruct + MOVE_POWER], a

.check_fixed_damage
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	; Fixed-damage moves bypass the normal damage-variation preview.
	cp EFFECT_LEVEL_DAMAGE
	jp z, .print_fixed_damage
	cp EFFECT_STATIC_DAMAGE
	jp z, .print_fixed_damage

	ld a, [wTypeModifier]
	push af
	ld a, [wTypeMatchup]
	push af
	ld a, [wCurType]
	push af
	ld a, [wAttackMissed]
	push af
	ld a, [wCriticalHit]
	push af
	ld a, [wHalfDamage]
	push af

	xor a
	ld [wTypeModifier], a
	ld [wAttackMissed], a
	ld [wCriticalHit], a
	ld [wHalfDamage], a

	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_MAGNITUDE
	jr z, .print_magnitude_damage

	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab

	ld a, [wCurDamage]
	ld h, a
	ld a, [wCurDamage + 1]
	ld l, a
	push hl

	ld b, 85 percent + 1
	callfar ApplyDamageVariationMultiplierToCurDamage
	call .CapDisplayDamage
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	ld e, a

	jr .compare_damage_range

.print_magnitude_damage
	; Magnitude's preview needs the true power extremes, not the move table's base power.
	ld a, 150
	ld [wPlayerMoveStruct + MOVE_POWER], a
	call .LoadVariableDamagePreview

	ld a, [wCurDamage]
	ld h, a
	ld a, [wCurDamage + 1]
	ld l, a
	push hl

	ld a, 10
	ld [wPlayerMoveStruct + MOVE_POWER], a
	call .LoadVariableDamagePreview
	ld b, 85 percent + 1
	callfar ApplyDamageVariationMultiplierToCurDamage
	call .CapDisplayDamage
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	ld e, a

.compare_damage_range
	pop hl
	ld a, h
	cp d
	jr nz, .print_damage_range
	ld a, l
	cp e
	jr nz, .print_damage_range
	; Fixed 0-0 previews and other exact results read better as a single value.
	ld a, d
	ld [wCurDamage], a
	ld a, e
	ld [wCurDamage + 1], a
	call .PrintSingleDamage
	jr .restore_damage_preview

.print_damage_range
	; Keep the uncapped max damage on the stack while hl is reused as a tilemap cursor.
	push hl

	ld a, d
	ld [wCurDamage], a
	ld a, e
	ld [wCurDamage + 1], a

	hlcoord 3, 11
	ld de, wCurDamage
	lb bc, 2, 3
	call PrintNum
	hlcoord 6, 11
	ld [hl], '-'

	pop hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	call .CapDisplayDamage

	hlcoord 7, 11
	ld de, wCurDamage
	lb bc, 2, 3
	call PrintNum

.restore_damage_preview
	pop af
	ld [wHalfDamage], a
	pop af
	ld [wCriticalHit], a
	pop af
	ld [wAttackMissed], a
	pop af
	ld [wCurType], a
	pop af
	ld [wTypeMatchup], a
	pop af
	ld [wTypeModifier], a
	pop af
	ld [wPlayerMoveStruct + MOVE_POWER], a

	pop hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

.print_fixed_damage
	; Fixed-damage moves preview one exact value.
	call .LoadFixedDamagePreview
	call .CapDisplayDamage
	call .PrintSingleDamage

	pop af
	ld [wPlayerMoveStruct + MOVE_POWER], a
	pop hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

.PrintSingleDamage
	hlcoord 3, 11
	ld de, wCurDamage
	lb bc, 2, 3
	call PrintNum
	hlcoord 6, 11
	ld [hl], ' '
	inc hl
	ld [hl], ' '
	inc hl
	ld [hl], ' '
	inc hl
	ld [hl], ' '
	ret

.LoadFixedDamagePreview
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_LEVEL_DAMAGE
	jr z, .level_damage

	ld a, [wPlayerMoveStruct + MOVE_POWER]
	ld [wCurDamage + 1], a
	xor a
	ld [wCurDamage], a
	ret

.level_damage
	ld a, [wBattleMonLevel]
	ld [wCurDamage + 1], a
	xor a
	ld [wCurDamage], a
	ret

.LoadVariableDamagePreview
	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ret

.CapDisplayDamage
	ld a, [wCurDamage]
	cp HIGH(MAX_STAT_VALUE)
	ret c
	jr nz, .cap_damage
	ld a, [wCurDamage + 1]
	cp LOW(MAX_STAT_VALUE)
	ret c
	ret z

.cap_damage
	ld a, HIGH(MAX_STAT_VALUE)
	ld [wCurDamage], a
	ld a, LOW(MAX_STAT_VALUE)
	ld [wCurDamage + 1], a
	ret

.ConvertPercentages
	ld l, a
	ld h, 0
	push af
	add hl, hl
	add a, l
	ld l, a
	adc h
	sub l
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	pop af
	add a, l
	ld l, a
	adc h
	sbc l
	ld h, a
	add hl, hl
	add hl, hl
	ld l, 0.5
	sla l
	sbc a
	and 1
	add a, h
	ld a, 1
	add a, h
	ret

.nopower_string
	db "---@"

.power_string
	db "p/@"

.pp_string
	db "pp@"

.Disabled
	db "Disabled!@"

BattleDamageIconGFX:
INCBIN "gfx/battle/damage.2bpp"

ForfeitMatchText:
    text "Forfeit Battle?"
    done

GetWeatherImage:
	ld a, [wBattleWeather]
	and a
	ret z
	ld de, RainWeatherImage
	lb bc, PAL_BATTLE_OB_BLUE, 4
	cp WEATHER_RAIN
	jr z, .done
	ld de, SunWeatherImage
	ld b, PAL_BATTLE_OB_YELLOW
	cp WEATHER_SUN
	jr z, .done
	ld de, SandstormWeatherImage
	ld b, PAL_BATTLE_OB_BROWN
	cp WEATHER_SANDSTORM
	jr z, .done
	ld de, HailWeatherImage
	ld b, PAL_BATTLE_OB_BLUE
	cp WEATHER_HAIL
	ret nz

.done
	push bc
	ld b, BANK(WeatherImages) ; c = 4
	ld hl, vTiles0
	call Request2bpp
	pop bc
	ld hl, wShadowOAMSprite00
	ld de, .WeatherImageOAMData
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	jr nz, .loop
	ret

.WeatherImageOAMData
; positions are backwards since
; we load them in reverse order
	db $88, $1c ; y/x - bottom right
	db $88, $14 ; y/x - bottom left
	db $80, $1c ; y/x - top right
	db $80, $14 ; y/x - top left

GiveExpOnCapture:
    ld a, [wTempSpecies]
	ld l, a
	ld a, [wCurPartyLevel]
	ld h, a
	push hl
	farcall ApplyExperienceAfterEnemyCaught
	pop hl
	ld a, l
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld a, h
	ld [wCurPartyLevel], a
	ret

CheckAmuletCoin:
	ld a, [wBattleMonItem]
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_AMULET_COIN
	ret nz
	ld a, 1
	ld [wAmuletCoin], a
	ret

ShadowTag:
	ld a, [wEnemyMonSpecies]
    cp CHANDELURE
    jr z, .trap
    cp GIRATINA
    jr z, .trap
    cp NOWN
    jr z, .trap
	cp VICTREEBEL
	jr z, .trap
    ret
.trap
    ld hl, wEnemySubStatus5
	bit SUBSTATUS_CANT_RUN, [hl]
	ret nz
	set SUBSTATUS_CANT_RUN, [hl]
	ret

ShouldIgniteFlameOrb:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	and a
	jr nz, .no

    ldh a, [hBattleTurn]
	and a
	jr z, .playerTurn
	ld a, [wEnemyMonType1]
	ld b, a
	ld a, [wEnemyMonType2]
	ld c, a
	ld a, [wEnemyMonSpecies]
	jr .checkDetails
.playerTurn
	ld a, [wBattleMonType1]
	ld b, a
	ld a, [wBattleMonType2]
	ld c, a
	ld a, [wBattleMonSpecies]
.checkDetails
    cp ARCEUS
    jr z, .no
    cp SYLVEON
    jr z, .no

    ld a, b
    cp FIRE
    jr z, .no
    ld a, c
    cp FIRE
    jr z, .no
.yes
    scf
    ret
.no
    xor a
    ret

GetTrainerBackpic:
; Load the player character's backpic (6x6) into VRAM starting from vTiles2 tile $31.

; Special exception for Dude.
	ld b, BANK(DudeBackpic)
	ld hl, DudeBackpic
	ld a, [wBattleType]

; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .Chris
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Chris

; It's a girl.
	farcall GetKrisBackpic
	ret

.Chris:
; It's a boy.
	ld b, BANK(ChrisBackpic)
	ld hl, ChrisBackpic

.Decompress:
	ld de, vTiles2 tile $31
	ld c, 7 * 7
	predef DecompressGet2bpp
	ret

CopyBackpic:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	ld hl, vTiles0
	ld de, vTiles2 tile $31
	ldh a, [hROMBank]
	ld b, a
	ld c, 7 * 7
	call Get2bpp
	pop af
	ldh [rSVBK], a
	call .LoadTrainerBackpicAsOAM
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef PlaceGraphic
	ret

.LoadTrainerBackpicAsOAM:
	ld hl, wShadowOAMSprite00
	xor a
	ldh [hMapObjectIndex], a
	ld b, 6
	ld e, (SCREEN_WIDTH + 1) * TILE_WIDTH
.outer_loop
	ld c, 3
	ld d, 8 * TILE_WIDTH
.inner_loop
	ld [hl], d ; y
	inc hl
	ld [hl], e ; x
	inc hl
	ldh a, [hMapObjectIndex]
	ld [hli], a ; tile id
	inc a
	ldh [hMapObjectIndex], a
	ld a, PAL_BATTLE_OB_PLAYER
	ld [hli], a ; attributes
	ld a, d
	add 1 * TILE_WIDTH
	ld d, a
	dec c
	jr nz, .inner_loop
	ldh a, [hMapObjectIndex]
	add $3
	ldh [hMapObjectIndex], a
	ld a, e
	add 1 * TILE_WIDTH
	ld e, a
	dec b
	jr nz, .outer_loop
	ret

;PlaceSelectIcon:
;	hlcoord 2, 15
;	ld [hl], "s"
;	hlcoord 3, 15
;	ld [hl], "e"
;	hlcoord 4, 15
;	ld [hl], "l"
;	hlcoord 5, 15
;	ld [hl], "e"
;	hlcoord 6, 15
;	ld [hl], "c"
;	hlcoord 7, 15
;	ld [hl], "t"
;	ret

PrintBattleInfo:
	push hl
	push de
	push bc
	xor a
	ld [wTrainerInfoPage], a
	;call LoadFontsExtra
	;call LoadStandardFont
	call UpdatePageText
	call StatChangesInfoBox
	call WaitButtonInfoTrainer
	pop bc
	pop de
	pop hl
	ret

StatChangesInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 8
	call Textbox
	ld b, 14
	ld c, 8
	hlcoord 10, 0
	call Textbox

	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts.attack
	ld b, 1
	ld c, 2
	ld hl, wPlayerStatLevels
	call StatChangesInfoBoxLoop

	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts.attack
	ld b, 11
	ld c, 2
	ld hl, wEnemyStatLevels
	call StatChangesInfoBoxLoop

StatChangesInfoBoxLoop:
	push hl
	call CoordsBCtoHL
	ld a, c
	cp 16
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 6				; b = 7 or 17
	ld b, a
	pop hl
	call PrintStatChangeValue
	inc hl				; hl = StatLevel + 1
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 6
	ld b, a
	inc c
	inc c
	jr StatChangesInfoBoxLoop
.finish
	pop hl
	ret

PrintStatChangeValue: ; Input is hl (either wPlayerStatX or wEnemyStatX) and bc (coords to place text)
	push de
	push hl
	push bc
	ld de, wStringBuffer4
	ld a, TX_START
	ld [de], a
	inc de
	ld a, [hl]  	; Stat
	ld c, a
	jp .format_stat_change
	cp 7			; 7 = no changes
	jr c, .lowered
	jr z, .same
	;ld a, "▷"
	ld a, $c8
	ld [de], a
	inc de
	ld a, c
	sub 7			; a = a - 7
	jr .insert
.same
	ld a, " "
	ld [de], a
	inc de
	xor a
	jr .insert
.lowered
	ld a, "▼"
	ld [de], a
	inc de
	ld a, 7
	sub c
.format_stat_change
	ld a, c
	cp 7			; 7 = no changes
	jr c, .format_lowered
	jr z, .format_same
	;ld a, "▷"
	ld a, $c8
	ld [de], a
	inc de
	ld a, c
	sub 7			; a = a - 7
	jr .insert
.format_same
	ld a, " "
	ld [de], a
	inc de
	xor a
	jr .insert
.format_lowered
	ld a, "▼"
	ld [de], a
	inc de
	ld a, 7
	sub c
.insert
	add "0"
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a		; Terminate string
	inc de
	ld [de], a		; Terminate string
	ld hl, wStringBuffer4
	pop bc
	push bc
	push hl
	call CoordsBCtoHL
	ld b, h
	ld c, l
	pop hl
	call PrintTextboxTextAt
	pop bc
	pop hl
	pop de
	ret

StatsInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 8
	call Textbox
	ld b, 14
	ld c, 8
	hlcoord 10, 0
	call Textbox

	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts
	ld b, 1
	ld c, 2
	ld hl, wBattleMonMaxHP
	call StatsInfoBoxLoop

	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts
	ld b, 11
	ld c, 2
	ld hl, wEnemyMonMaxHP
	call StatsInfoBoxLoop
	ret

StatsInfoBoxLoop:
	push hl
	call CoordsBCtoHL
	ld a, c
	cp 14
	jp nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 4				; b = 6 or 16
	ld b, a
	pop hl
	push de
	push hl
	ld a, c
	cp 4
	jr z, .effective_attack
	cp 6
	jr z, .effective_defense
	cp 8
	jr z, .effective_speed
	cp 10
	jr z, .effective_spattack
	cp 12
	jr z, .effective_spdef
	jp .regular_stat
.effective_attack
	ld a, b
	cp 10
	jr c, .player_attack
	call LoadEnemyEffectiveAttack
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.player_attack
	call LoadPlayerEffectiveAttack
	jr .player_effective_stat
.effective_defense
	ld a, b
	cp 10
	jr c, .player_defense
	call LoadEnemyEffectiveDefense
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.player_defense
	call LoadPlayerEffectiveDefense
	jr .player_effective_stat
.effective_speed
	ld a, b
	cp 10
	jr c, .player_speed
	farcall LoadEnemyEffectiveSpeed
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.player_speed
	farcall LoadPlayerEffectiveSpeed
	jr .player_effective_stat
.effective_spattack
	ld a, b
	cp 10
	jr c, .player_spattack
	call LoadEnemyEffectiveSpAtk
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.player_spattack
	call LoadPlayerEffectiveSpAtk
	jr .player_effective_stat
.effective_spdef
	ld a, b
	cp 10
	jr c, .player_spdef
	call LoadEnemyEffectiveSpDef
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.player_spdef
	call LoadPlayerEffectiveSpDef
.player_effective_stat
	ldh a, [hMultiplicand + 1]
	ldh [hEnemyMonSpeed + 0], a
	ldh a, [hMultiplicand + 2]
	ldh [hEnemyMonSpeed + 1], a
	ld de, hEnemyMonSpeed
	jr .got_stat_ptr
.regular_stat
	ld d, h
	ld e, l
.got_stat_ptr
	call CoordsBCtoHL
	push bc
	lb bc, 2, 4
	call PrintNum
	pop bc
	pop hl
	pop de
	inc hl
	inc hl
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 4
	ld b, a
	inc c
	inc c
	jp StatsInfoBoxLoop
.finish
	pop hl
	ret

LoadPlayerEffectiveAttack:
	push bc
	ld hl, wBattleMonAttack
	ld de, hMultiplicand + 1
	ld a, [wBattleMonItem]
	ld b, a
	ld a, [wBattleMonStatus]
	ld c, a
	ld a, [wBattleMonSpecies]
	call LoadEffectiveAttack
	pop bc
	ret

LoadEnemyEffectiveAttack:
	push bc
	ld hl, wEnemyMonAttack
	ld de, hEnemyMonSpeed
	ld a, [wEnemyMonItem]
	ld b, a
	ld a, [wEnemyMonStatus]
	ld c, a
	ld a, [wEnemyMonSpecies]
	call LoadEffectiveAttack
	pop bc
	ret

LoadPlayerEffectiveSpAtk:
	push bc
	ld hl, wBattleMonSpclAtk
	ld de, hMultiplicand + 1
	ld a, [wBattleMonItem]
	ld b, a
	ld a, [wBattleMonSpecies]
	call LoadEffectiveSpecialAttack
	pop bc
	ret

LoadEnemyEffectiveSpAtk:
	push bc
	ld hl, wEnemyMonSpclAtk
	ld de, hEnemyMonSpeed
	ld a, [wEnemyMonItem]
	ld b, a
	ld a, [wEnemyMonSpecies]
	call LoadEffectiveSpecialAttack
	pop bc
	ret

LoadEffectiveAttack:
	; Copy the live attack stat into scratch space, then layer any display-only
	; attack modifiers that are applied later in damage, such as Guts.
	push bc
	push af
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop af
	push af
	call DisplayMonHasGuts
	jr nc, .check_species_boost
	ld a, c
	and a
	jr z, .check_species_boost
	push bc
	call ApplyFiftyPercentStatBoost
	pop bc

.check_species_boost
	pop af
	cp MAWILE
	jr z, .double_attack
	cp AZUMARILL
	jr z, .double_attack
	cp PIKACHU
	jr nz, .check_choice_band
	ld a, b
	cp LIGHT_BALL
	jr nz, .check_choice_band

.double_attack
	call ApplyDoubleStatBoost
.check_choice_band
	ld a, b
	cp CHOICE_BAND
	jr nz, .done
	call ApplyFiftyPercentStatBoost
.done
	pop bc
	ret

LoadEffectiveSpecialAttack:
	; Mirror special-attack boosts that live outside the stored battle stat.
	push bc
	ld c, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, b
	cp LIGHT_BALL
	jr nz, .check_choice_specs
	ld a, c
	cp PIKACHU
	jr nz, .check_choice_specs
	call ApplyDoubleStatBoost
.check_choice_specs
	ld a, b
	cp CHOICE_SPECS
	jr nz, .done
	call ApplyFiftyPercentStatBoost
.done
	pop bc
	ret

ApplyDoubleStatBoost:
	ld a, [de]
	add a
	ld [de], a
	dec de
	ld a, [de]
	adc a
	ld [de], a
	inc de
	ld a, [de]
	ld c, a
	dec de
	ld a, [de]
	cp HIGH(MAX_STAT_VALUE)
	jr c, .done
	jr nz, .cap
	ld a, c
	cp LOW(MAX_STAT_VALUE)
	jr c, .done
.cap
	ld a, HIGH(MAX_STAT_VALUE)
	ld [de], a
	inc de
	ld a, LOW(MAX_STAT_VALUE)
	ld [de], a
.done
	ret

LoadPlayerEffectiveDefense:
	push bc
	ld hl, wBattleMonDefense
	ld de, hMultiplicand + 1
	ld bc, wBattleMonType1
	ld a, DEFENSE
	call LoadEffectiveWeatherDefenseStat
	ld a, [wBattleMonItem]
	ld b, a
	ld a, [wBattleMonSpecies]
	ld c, DEFENSE
	call ApplyHeldDefenseDisplayBoosts
	pop bc
	ret

LoadEnemyEffectiveDefense:
	push bc
	ld hl, wEnemyMonDefense
	ld de, hEnemyMonSpeed
	ld bc, wEnemyMonType1
	ld a, DEFENSE
	call LoadEffectiveWeatherDefenseStat
	ld a, [wEnemyMonItem]
	ld b, a
	ld a, [wEnemyMonSpecies]
	ld c, DEFENSE
	call ApplyHeldDefenseDisplayBoosts
	pop bc
	ret

LoadPlayerEffectiveSpDef:
	push bc
	ld hl, wBattleMonSpclDef
	ld de, hMultiplicand + 1
	ld bc, wBattleMonType1
	ld a, SP_DEFENSE
	call LoadEffectiveWeatherDefenseStat
	ld a, [wBattleMonItem]
	ld b, a
	ld a, [wBattleMonSpecies]
	ld c, SP_DEFENSE
	call ApplyHeldDefenseDisplayBoosts
	pop bc
	ret

LoadEnemyEffectiveSpDef:
	push bc
	ld hl, wEnemyMonSpclDef
	ld de, hEnemyMonSpeed
	ld bc, wEnemyMonType1
	ld a, SP_DEFENSE
	call LoadEffectiveWeatherDefenseStat
	ld a, [wEnemyMonItem]
	ld b, a
	ld a, [wEnemyMonSpecies]
	ld c, SP_DEFENSE
	call ApplyHeldDefenseDisplayBoosts
	pop bc
	ret

LoadEffectiveWeatherDefenseStat:
	push af
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop af
	call DoesMonGetWeatherDefenseBoost
	jr nc, .done
	call ApplyFiftyPercentStatBoost
.done
	ret

ApplyHeldDefenseDisplayBoosts:
	; Mirror held-item defense boosts that are applied in the damage path.
	push af
	push bc
	ld a, c
	cp SP_DEFENSE
	jr nz, .check_eviolite
	ld a, b
	cp ASSAULT_VEST
	jr nz, .check_eviolite
	call ApplyFiftyPercentStatBoost

.check_eviolite
	pop bc
	pop af
	push bc
	push af
	call SpeciesHasDisplayEvolutions
	jr nc, .done
	ld a, b
	cp EVIOLITE
	jr nz, .done
	call ApplyFiftyPercentStatBoost

.done
	pop af
	pop bc
	ret

SpeciesHasDisplayEvolutions:
	; Return carry if species a has at least one evolution.
	dec a
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	pop bc
	pop hl
	jr z, .no
	scf
	ret

.no
	and a
	ret

DisplayMonHasGuts:
	; Return carry if species a is in the canonical Guts ability table.
	push hl
	push de
	push bc
	ld c, a
	ld hl, GutsPokemon
.loop
	ld a, BANK(GutsPokemon)
	call GetFarByte
	cp -1
	jr z, .no
	cp c
	jr z, .yes
	inc hl
	jr .loop

.no
	pop bc
	pop de
	pop hl
	and a
	ret

.yes
	pop bc
	pop de
	pop hl
	scf
	ret

DoesMonGetWeatherDefenseBoost:
	push hl
	push de
	push bc
	cp DEFENSE
	jr z, .defense
	cp SP_DEFENSE
	jr z, .sp_defense
	jr .no

.defense
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr nz, .no
	ld a, [bc]
	cp ICE
	jr z, .yes
	inc bc
	ld a, [bc]
	cp ICE
	jr z, .yes
	jr .no

.sp_defense
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr nz, .no
	ld a, [bc]
	cp ROCK
	jr z, .yes
	inc bc
	ld a, [bc]
	cp ROCK
	jr z, .yes

.no
	pop bc
	pop de
	pop hl
	and a
	ret

.yes
	pop bc
	pop de
	pop hl
	scf
	ret

ApplyFiftyPercentStatBoost:
	ld a, [de]
	ld c, a
	dec de
	ld a, [de]
	ld b, a
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld a, h
	cp HIGH(MAX_STAT_VALUE)
	jr c, .store
	jr nz, .cap
	ld a, l
	cp LOW(MAX_STAT_VALUE)
	jr c, .store
.cap
	ld h, HIGH(MAX_STAT_VALUE)
	ld l, LOW(MAX_STAT_VALUE)
.store
	ld a, h
	ld [de], a
	inc de
	ld a, l
	ld [de], a
	ret

FieldInfoBox:
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call Textbox
	ld b, 10
	ld c, 8
	hlcoord 0, 4
	call Textbox
	ld b, 10
	ld c, 8
	hlcoord 10, 4
	call Textbox
.weather
	hlcoord 6, 0
	ld de, FieldTexts.weather
	call PlaceString
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ld de, FieldTexts.sun
	jr z, .done
	cp WEATHER_RAIN
	ld de, FieldTexts.rain
	jr z, .done
	cp WEATHER_SANDSTORM
	ld de, FieldTexts.sand
	jr z, .done
	cp WEATHER_HAIL
	ld de, FieldTexts.hail
	jr z, .done
	ld de, FieldTexts.none
.done
	hlcoord 1, 1
	call PlaceString
	ld a, [wBattleWeather]
	cp WEATHER_NONE
	jr z, .skip_weather_turns
	ld de, wStringBuffer5
	ld a, [wWeatherCount]
	cp 10
	ld de, FieldTexts.unlimited
	jr nc, .not_1_turn
	ld de, wWeatherCount
	ld hl, FieldTexts.empty
	lb bc, 1, 1
	call FieldInfoBoxPlaceElement
	ld a, [wWeatherCount]
	cp 1
	ld de, FieldTexts.turnsleft
	jr nz, .not_1_turn
	ld de, FieldTexts.turnleft
.not_1_turn
	hlcoord 2, 2
	call PlaceString
.skip_weather_turns
	hlcoord 1, 4
	ld de, MainText.player
	call PlaceString

	hlcoord 11, 4
	ld de, MainText.enemy
	call PlaceString

	lb bc, 1, 5
	call FieldInfoBoxReflect

	lb bc, 1, 7
	call FieldInfoBoxLScreen

	lb bc, 1, 9
	call FieldInfoBoxTrickRoom

	lb bc, 1, 11
	ld de, FieldTexts.spikes
	call FieldInfoBoxSpikes

	lb bc, 1, 12
	ld de, FieldTexts.stealthRock
	call FieldInfoBoxStealthRock

	lb bc, 1, 13
	ld de, FieldTexts.toxicSpikes
	call FieldInfoBoxToxicSpikes

	lb bc, 1, 14
	ld de, FieldTexts.stickyWeb
	call FieldInfoBoxStickyWeb
	ret

FieldInfoBoxReflect: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerReflectCount
	bit 4, [hl]
	jr z, .enemy
	ld hl, FieldTexts.reflect
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyReflectCount
	bit 4, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.reflect
	call FieldInfoBoxPlaceElement
	ret

FieldInfoBoxLScreen: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	bit 3, [hl]
	jr z, .enemy
	ld hl, FieldTexts.lightScreen
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount
	bit 3, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.lightScreen
	call FieldInfoBoxPlaceElement
	ret

FieldInfoBoxTrickRoom: ; input: bc -> coords
	ld de, wTrickRoomCount
	ld a, [de]
    and a
	ret z
	ld hl, FieldTexts.trickRoom
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld a, b
	add 10
	ld b, a
	ld de, wTrickRoomCount
	ld hl, FieldTexts.trickRoom
	call FieldInfoBoxPlaceElement
	ret

FieldInfoBoxSpikes: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 0, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 0, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	call PlaceString
	ret

FieldInfoBoxStealthRock: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 5, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 5, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	call PlaceString
	ret

FieldInfoBoxToxicSpikes: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 6, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 6, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	call PlaceString
	ret

FieldInfoBoxStickyWeb: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 7, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 7, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	call PlaceString
	ret

FeoDetailsPageInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call Textbox
	ld b, 14
	ld c, 18

	hlcoord 0, 0
	ld b, 3
	ld c, 18
	call Textbox

	ld de, .FoeItemString
	hlcoord 1, 1
	call PlaceString

	xor a
	ldh [hBGMapMode], a
	ld [wSwappingMove], a
	ld [wMonType], a
	predef CopyOTMonToTempMon

	ld a, [wTempMonItem]
	and a
	jr nz, .hasItem
	ld de, .NoItem
	jr .printItemName
.hasItem
	ld [wNamedObjectIndex], a
	call GetItemName
.printItemName
	hlcoord 2, 3
	call PlaceString

	ld de, .FoeMovesString
	hlcoord 1, 5
	call PlaceString

	; ListMovePP reads from wTempMonPP, so replace the copied OT-party PP
	; with the live enemy battle PP before rendering the move list.
	ld hl, wEnemyMonPP
	ld de, wTempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	; Use the live enemy battle moves so move names stay aligned with the
	; live PP slots in wEnemyMonPP.
	ld hl, wEnemyMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	hlcoord 2, 7
	predef ListMoves
	hlcoord 15, 7
	call .ListCurrentMovePP
	call WaitBGMap
	call SetDefaultBGPAndOBP
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ret

.ListCurrentMovePP
	ld de, wTempMonPP
	ld a, [wNumMoves]
	inc a
	ld b, a
.loop
	ld a, [de]
	and PP_MASK
	ld [wStringBuffer1], a

	push bc
	push de
	push hl
	ld de, wStringBuffer1
	lb bc, 1, 2
	call PrintNum
	pop hl
	pop de
	pop bc

	inc de
	push bc
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.FoeItemString
    db "Enemy Item:@"

.NoItem
    db "None@"

.FoeMovesString
    db "Enemy Moves:@"

EnemyAbilityInfoBox:
	hlcoord 0, 0
	ld b, 14
	ld c, 18
	call Textbox
	ld b, 14
	ld c, 18

	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call Textbox

	xor a
	ld [wMonType], a
	predef CopyOTMonToTempMon
	farcall DisplayFoeNameAndAbility

	ld de, .FoeString
	hlcoord 1, 1
	call PlaceString

	ld de, .AbilitiesString
	hlcoord 1, 5
	jp PlaceString

.FoeString:
	db "Foe:@"
.AbilitiesString:
	db "Ability Info:@"

PrintEnemyWildDVs::
	push hl
	push de
	push bc

	; Unpack enemy DVs into c/d/e/b = Atk/Def/Spd/Spcl.
	ld a, [wTempMonDVs]
	ld b, a
	and $f0
	swap a
	ld c, a
	ld a, b
	and $0f
	ld d, a

	ld a, [wTempMonDVs + 1]
	ld b, a
	and $f0
	swap a
	ld e, a
	ld a, b
	and $0f
	ld b, a

	; HP DV follows the project's stat rule: HP DV = Atk DV, so omit it here.
	; Start at the left edge of the info row and print Atk/Def/Spd/Spcl as dd/dd/dd/dd.
	hlcoord 0, 3

	ld a, c
	call .PrintDV
	call .PrintSlash
	ld a, d
	call .PrintDV
	call .PrintSlash
	ld a, e
	call .PrintDV
	call .PrintSlash
	ld a, b
	call .PrintDV

	pop bc
	pop de
	pop hl
	ret

.PrintDV
	; Input: a = DV value, hl = tilemap cursor. PrintNum advances hl by 2 tiles.
	push de
	push bc
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	pop de
	ret

.PrintSlash
	ld a, '/'
	ld [hli], a
	ret

FieldInfoBoxPlaceElement: ; input: bc -> coords, hl -> Field text, de -> Count
	push de
	ld d, h
	ld e, l
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	inc c
	call CoordsBCtoHL
	pop de
	push de
	ld a, [de]
	ld de, wStringBuffer5
	add "0"
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a
	dec de
	push bc
	call PlaceString
	pop bc
	pop de
	ld a, [de]
	cp 1
	ld de, FieldTexts.turns
	jr nz, .not_1_turn
	ld de, FieldTexts.turn
.not_1_turn
	inc b
	call CoordsBCtoHL
	call PlaceString
	ret

MainText:
.page1:
	db "  Page 1/5 ▶@"

.page1_content:
	db " Stat Changes @"

.page2:
	db "◀ Page 2/5 ▶@"

.page2_content:
	db " Actual Stats @"

.page3:
	db "◀ Page 3/5  @"

.page3_content:
	db " Enemy Details@"

.page4:
	db "◀ Page 4/5  @"

.page4_content:
    db " Foe Ability  @"

.page5:
	db "◀ Page 5/5  @"

.page5_content:
	db " Field Effects@"

.player:
	db " Player @"

.enemy:
	db " Enemy @"

StatTexts:
.health:
	db "HP:  @"

.attack:
	db "Atk: @"

.defense:
	db "Def: @"

.speed:
	db "Spe: @"

.sattack:
	db "SAtk:@"

.sdefense:
	db "SDef:@"

.accuracy:
	db "Acc: @"

.evasiveness:
	db "Eva:@"

FieldTexts:
.weather:
	db " Weather @"

.none:
	db "Normal@"

.sun:
	db "Sunny@"

.rain:
	db "Rain@"

.sand:
	db "Sandstorm@"

.hail:
    db "Hail@"

.reflect:
	db "Reflect@"

.lightScreen:
	db "L.Screen@"

.spikes:
	db "Spikes@"

.stealthRock:
	db "S.Rock@"

.toxicSpikes:
	db "T.Spikes@"

.stickyWeb:
	db "S.Web@"

.trickRoom:
	db "T.Room@"

.turnsleft:
	db " turns left@"

.turnleft:
	db " turn left@"

.unlimited:
	db "unending@"

.turns:
	db " turns@"

.turn:
	db " turn@"

.empty:
    db "@"

JoyWaitAorBorDPADInfoTrainer:
.loop
    call DelayFrame
    call GetJoypad

    ; A / B = exit
    ldh a, [hJoyPressed]
    and A_BUTTON | B_BUTTON
    ret nz

    ; single presses on left and right to switch pages
	ldh a, [hJoyPressed]
	and D_RIGHT
	call nz, InfoBoxRightPress
    ldh a, [hJoyPressed]
	and D_LEFT
	call nz, InfoBoxLeftPress

    call UpdateTimeAndPals
    jr .loop

WaitButtonInfoTrainer:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call JoyWaitAorBorDPADInfoTrainer
	pop af
	ldh [hOAMUpdate], a
	ret

InfoBoxLeftPress:
	; play switching pockets SFX
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX

	call DecreasePage
	call UpdatePageText
	jp RenderTrainerInfoPage

InfoBoxRightPress:
	; play switching pockets SFX
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX

	call IncreasePage
	call UpdatePageText
	jp RenderTrainerInfoPage

IncreasePage:
	ld a, [wTrainerInfoPage]
	inc a
	cp 5
	jr c, .store
	xor a
.store
	ld [wTrainerInfoPage], a
	ret

DecreasePage:
	ld a, [wTrainerInfoPage]
	or a
	jr nz, .dec
	ld a, 5
.dec
	dec a
	ld [wTrainerInfoPage], a
	ret

RenderTrainerInfoPage:
	ld a, [wTrainerInfoPage]
	and a
	jp z, StatChangesInfoBox
	cp 1
	jp z, StatsInfoBox
	cp 2
	jp z, FeoDetailsPageInfoBox
	cp 3
	jp z, EnemyAbilityInfoBox
	jp FieldInfoBox

UpdatePageText:
	hlcoord 4, 17
	ld a, [wTrainerInfoPage]
	cp 1
	jr z, .page_2
    cp 2
	jr z, .page_3
	cp 3
	jr z, .page_4
	cp 4
	jr z, .page_5

    ld de, MainText.page1
	call PlaceString
	ld de, MainText.page1_content
	jr .done
.page_2
	ld de, MainText.page2
	call PlaceString
	ld de, MainText.page2_content
	jr .done
.page_3
	ld de, MainText.page3
	call PlaceString
	ld de, MainText.page3_content
	jr .done
.page_4
	ld de, MainText.page4
	call PlaceString
	ld de, MainText.page4_content
	jr .done
.page_5
	ld de, MainText.page5
	call PlaceString
	ld de, MainText.page5_content
.done
	hlcoord 4, 16
	call PlaceString
	ret

CoordsBCtoHL:
	ld hl, wTilemap
	ld a, c
	push bc
	ld c, SCREEN_WIDTH
	call HLMultiply
	pop bc
	ld a, b
	add l
	ld l, a
	ret nc
	inc h
	ret

HLMultiply:
; Returns hl + a * c
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	jr nc, .nocarry
	inc h
.nocarry
	dec b
	jr nz, .loop
	ld c, a
	add hl, bc
	pop bc
	ret
