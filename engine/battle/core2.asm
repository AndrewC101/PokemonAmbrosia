; ============================================
; ====== EFFECT COMMAND EXCESS FUNCTIONS =====
; ============================================
; These are functions used in effect_commands.asm
; they are defined here as that file is out of space
RainSwitch:
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
    call PlayAnimationIfNotFirstTurn
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
    call PlayAnimationIfNotFirstTurn
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
    call PlayAnimationIfNotFirstTurn
	ld hl, ToxicSpikesText
	jp StdBattleTextbox

TrickRoomSwitch:
    ld a, 5
    ld [wTrickRoomCount], a
    ld de, TRICK_ROOM
    call PlayAnimationIfNotFirstTurn
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
	set SCREENS_REFLECT, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, REFLECT
    call PlayAnimationIfNotFirstTurn
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
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, LIGHT_SCREEN
    call PlayAnimationIfNotFirstTurn
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
	set SCREENS_SAFEGUARD, [hl]
	ld a, FIELD_EFFECT_DURATION
	ld [bc], a
    ld de, SAFEGUARD
    call PlayAnimationIfNotFirstTurn
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
    call PlayAnimationIfNotFirstTurn
    ret

DefogSwitch:
    ld de, DEFOG
    call PlayAnimationIfNotFirstTurn
    callfar BattleCommand_Defog
	ret

ScreenBreakSwitch:
    ld de, POISON_GAS
    farcall SwitchTurnCore
    call PlayAnimationIfNotFirstTurn
    farcall SwitchTurnCore

    ld hl, ShatteredScreensText
    call PrintText

	ld hl, wEnemySafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr z, .playersTurn
    ld hl, wPlayerSafeguardCount
.playersTurn
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
    ld de, HOLY_ARMOUR
    call PlayAnimationIfNotFirstTurn
    ret

PlayDropAnimation:
    ld de, ANIM_ENEMY_STAT_DOWN
    call PlayAnimationIfNotFirstTurn
    ret nc
    callfar BattleCommand_StatDownMessage
    ret

PlayAnimationIfNotFirstTurn:
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
    text "Enemy ATTACK"
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
    text "Enemy DEFENSE"
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
    text "Enemy SPEED"
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
    text "Enemy EVASION"
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

ForfeitMatch:
    ld hl, ForfeitMatchText
    call PrintText
    call YesNoBox
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
    ld hl, BattleText_TheresNoEscapeFromTrainerBattle
    ret
.ruthless
    xor a
    ld hl, BattleText_DoesNotAccept
    ret

ForfeitMatchText:
    text "Forfeit battle?"
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

GetRoamMonMapGroup:
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapGroup
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapGroup
	ret z
	ld hl, wRoamMon3MapGroup
	ret

GetRoamMonMapNumber:
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapNumber
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapNumber
	ret z
	ld hl, wRoamMon3MapNumber
	ret

GetRoamMonHP:
; output: hl = wRoamMonHP
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1HP
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2HP
	ret z
	ld hl, wRoamMon3HP
	ret

GetRoamMonDVs:
; output: hl = wRoamMonDVs
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1DVs
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2DVs
	ret z
	ld hl, wRoamMon3DVs
	ret

GetRoamMonSpecies:
	ld a, [wTempEnemyMonSpecies]
	ld hl, wRoamMon1Species
	cp [hl]
	ret z
	ld hl, wRoamMon2Species
	cp [hl]
	ret z
	ld hl, wRoamMon3Species
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
    cp WOBBUFFET
    jr z, .trap
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
    cp DUNSPARCE
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
