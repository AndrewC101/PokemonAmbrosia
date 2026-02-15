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
    callfar BattleCommand_Taunt
	ret

LeechSeedSwitch:
    ld de, LEECH_SEED
    call PlayAnimationIfNeeded
    callfar BattleCommand_LeechSeed
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
    db WOBBUFFET
    db SLOWKING
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

BattleInfoOrForfeit:
    ld hl, SeeBattleInfoText
    call PrintText
    call YesNoBox
    jr nc, .seeInfo

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
.seeInfo
    jp PrintBattleInfo

SeeBattleInfoText:
    text "See Battle Info?"
    done

ForfeitMatchText:
    text "Forfeit Battle?"
    done

AllowShinyOverride:
    ld a, [wShinyOverride]
    and a
    jr nz, .no
	ld a, [wLinkMode]
	and a
	jr nz, .no
	ld a, [wOtherTrainerClass]
	cp ROLE_PLAYER_NORMAL
	jr z, .no
	cp ROLE_PLAYER_SHINY
	jr z, .no
    ld a, [wMarkOfGod]
    and a
    jr z, .no
    scf
    ret
.no
    xor a
    ret

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
	ld hl, wVirtualOAMSprite00
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
    cp SPIRITOMB
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
	ld hl, wVirtualOAMSprite00
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
	cp 7			; 7 = no changes
	jr c, .lowered
	jr z, .same
	ld a, "<"
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
	;ld a, "-"
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
	call PlaceHLTextAtBC
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
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 4				; b = 6 or 16
	ld b, a
	pop hl
	push de
	ld d, h
	ld e, l
	push hl
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
	jr StatsInfoBoxLoop
.finish
	pop hl
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

	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	hlcoord 2, 7
	predef ListMoves
	;hlcoord 10, 7
	;predef ListMovePP
	call WaitBGMap
	call SetPalettes
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
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
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
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
	ld a, [wTrainerInfoPage]
	and a
	ret z
	cp 1
	jr z, .jump_to_page_1
	cp 2
	jr z, .jump_to_page_2
	cp 3
	jr z, .jump_to_page_3
	cp 4
	jr z, .jump_to_page_4
	call DecreasePage
	call UpdatePageText
	jp FieldInfoBox
.jump_to_page_1
	call DecreasePage
	call UpdatePageText
	jp StatChangesInfoBox
.jump_to_page_2
	call DecreasePage
	call UpdatePageText
	jp StatsInfoBox
.jump_to_page_3
	call DecreasePage
	call UpdatePageText
	jp FeoDetailsPageInfoBox
.jump_to_page_4
	call DecreasePage
	call UpdatePageText
	jp EnemyAbilityInfoBox

InfoBoxRightPress:
	ld a, [wTrainerInfoPage]
	and a
	jr z, .jump_to_page_1
	cp 1
	jr z, .jump_to_page_2
	cp 2
	jr z, .jump_to_page_3
	cp 3
	jr z, .jump_to_page_4
	ret

.jump_to_page_1
	call IncreasePage
	call UpdatePageText
	jp StatsInfoBox
.jump_to_page_2
	call IncreasePage
	call UpdatePageText
	jp FeoDetailsPageInfoBox
.jump_to_page_3
	call IncreasePage
	call UpdatePageText
	jp EnemyAbilityInfoBox
.jump_to_page_4
	call IncreasePage
	call UpdatePageText
	jp FieldInfoBox

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