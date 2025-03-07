AIScoring: ; used only for BANK(AIScoring)

SubstituteImmuneEffects:
	db $01 ; unused sleep effect
	db EFFECT_SLEEP
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db EFFECT_CONFUSE
	db EFFECT_LEECH_SEED
	db EFFECT_ACCURACY_DOWN
	db EFFECT_DEFENSE_DOWN
	db EFFECT_DEFENSE_DOWN_2
	db EFFECT_ATTACK_DOWN
	db EFFECT_SPEED_DOWN_2
	db EFFECT_TRANSFORM
	db EFFECT_TOXIC
	db $FF

AI_MagicGuardPokemon:
    db CLEFAIRY
    db CLEFABLE
    db ABRA
    db KADABRA
    db ALAKAZAM
    db SIGILYPH
    db ARCEUS
    db SOLOSIS
    db DUOSION
    db REUNICLUS
    db XERNEAS
    db YVELTAL
    db MIMIKYU
    db $FF

AI_LevitatePokemon:
    db GASTLY
    db HAUNTER
    db GENGAR
    db MISDREAVUS
    db MISMAGIUS
    db LATIAS
    db LATIOS
    db ROTOM
    db $FF

AI_WaterAbsorbPokemon:
    db MUDKIP
    db MARSHTOMP
    db SWAMPERT
    db VAPOREON
    db LAPRAS
    db DRACOVISH
    db POLIWAG
    db POLIWHIRL
    db $FF

AI_VoltAbsorbPokemon:
    db CHINCHOU
    db LANTURN
    db ELECTABUZZ
    db ELECTIVIRE
    db ZAPDOS
    db JOLTEON
    db ARCTOZOLT
    db PIKACHU
    db RAICHU
    db MAREEP
    db FLAAFFY
    db AMPHAROS
    db RAIKOU
    db $FF

AI_FireAbsorbPokemon:
    db MAGMAR
    db MAGMORTAR
    db FLAREON
    db MOLTRES
    db VULPIX
    db NINETALES
    db HOUNDOUR
    db HOUNDOOM
    db LITWICK
    db LAMPENT
    db CHANDELURE
    db LARVESTA
    db VOLCARONA
    db GROWLITHE
    db ARCANINE
    db $FF

AI_SturdyPokemon:
    db SKARMORY
    db GEODUDE
    db GRAVELER
    db GOLEM
    db MAGNEMITE
    db MAGNETON
    db MAGNEZONE
    db ONIX
    db STEELIX
    db BLASTOISE
    db FERROSEED
    db FERROTHORN
    db METAPOD
    db LARVITAR
    db PUPITAR
    db HONEDGE
    db DOUBLADE
    db PINSIR
    db BELDUM
    db METANG
    db METAGROSS
    db MIMIKYU
    db $FF

AI_ClearBodyPokemon:
    db TENTACOOL
    db TENTACRUEL
    db BELDUM
    db METANG
    db METAGROSS
    db DIALGA
    db ARCEUS
    db REGIGIGAS
    db DEOXYS
    db $FF

AI_UberImmunePokemon:
    db ARCEUS
    db MEWTWO
    db GIRATINA
    db YVELTAL
    db XERNEAS
    db DIALGA
    db PALKIA
    db KYOGRE
    db GROUDON
    db RAYQUAZA
    db LUGIA
    db HO_OH
    db REGIGIGAS
    db ZYGARDE
    db WOBBUFFET
    db $FF

AI_Basic:
; Don't do anything redundant:
;  -Using status-only moves if the player can't be statused
;  -Using moves that fail if they've already been used

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b ; b is num moves on 1st pass
	ret z ; if b os 0 return we are done

	inc hl ; increment score to next move score
	ld a, [de] ; load the move struct
	and a
	ret z ; return if no move

	inc de ; increment to next move
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a ; load move effect into c

; Dismiss moves with special effects if they are
; useless or not a good choice right now.
; For example, healing moves, weather moves, Dream Eater...

; if move locked dismiss all moves except the last one used
; this shouldn't be needed but for some reason AI enemies can switch moves when locked
    push hl
    ld hl, wEnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	pop hl
	jr z, .checkRedundant
    ld a, [wLastEnemyMove]
    and a
    jr z, .checkRedundant
    push bc
    ld b, a
    ld a, [wEnemyMoveStruct + MOVE_ANIM]
    cp b
    pop bc
    jp nz, .checkRedundant
    xor a
    ld [hl], a
    jp .checkmove

.checkRedundant
	push hl
	push de
	push bc
	farcall AI_Redundant
	pop bc
	pop de
	pop hl
	jp nz, .discourage ; discourage if AI_Redundant - loop bck to check move

; Dismiss status-only moves if the player can't be statused.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, StatusOnlyEffects
	ld de, 1
	call IsInArray ; is the move status only
	pop bc
	pop de
	pop hl
	jr nc, .checkSub ; if not skip following

	ld a, [wBattleMonStatus]
	and a
	jp nz, .discourage ; discourage if the player is already statused - loop back to check move

; don't use if enemy is immune to status
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jp z, .discourage
    cp SYLVEON
    jp z, .discourage
    cp DUNSPARCE
    jp z, .discourage

.checkSub
; dismiss moves blocked by sub if sub is up
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a	;check for substitute bit
	jr z, .checkLevitate	;if the substitute bit is not set, then skip out of this block
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, SubstituteImmuneEffects
	ld de, 1
	call IsInArray	;see if a is found in the hl array (carry flag set if true)
	pop bc
	pop de
	pop hl
	jp c, .discourage ; discourage if sub is up and blocks move - loop back to check move

.checkLevitate
; Dismiss ground move if the player has levitate
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	cp GROUND
	jr nz, .checkWaterAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_LevitatePokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .discourage

.checkWaterAbsorb
    cp WATER
	jr nz, .checkVoltAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_WaterAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .discourage

.checkVoltAbsorb
    cp ELECTRIC
	jr nz, .checkFireAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_VoltAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .discourage

.checkFireAbsorb
    cp FIRE
	jr nz, .checkMonoAttack
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_FireAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .discourage

; Dismiss Safeguard if it's already active.
;	ld a, [wPlayerScreens]
;	bit SCREENS_SAFEGUARD, a
;	jr z, .discourage

.checkMonoAttack
; switch if current move is common mon-attacking move and it is are out of pp
; note - this will be blocked by other logic in AI_TrySwitch if the mon has set up, which it probably has
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
    cp PSYBLAST
    jr z, .checkPP
    cp DRACO_METEOR
    jr z, .checkPP
    cp DRAGON_PULSE
    jr z, .checkPP
    cp MOON_BLAST
    jr z, .checkPP
    jr .checkKO
.checkPP
    push hl
    push bc
    ld hl, wEnemyMonPP
    ld a, [wCurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	pop bc
	pop hl
	jp nz, .checkKO

; switch since pp is 0
    ld a, $1
    ld [wEnemyIsSwitching], a
	ret

; Greatly encourage a move if it will KO the player
; skip if enemy is slower and weakened and has priority

.checkKO
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jp z, .checkmove

; if we are faster and player is flying or underground then don't encourage attacks
    call DoesAIOutSpeedPlayer
    jr nc, .calcDamage
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, .checkmove

.calcDamage
    ld a, 1
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wBattleMonHP + 1]
	cp c ; compare upper
	ld a, [wBattleMonHP]
	sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .checkmove

; don't encourage explosion as much
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .explodeOrHeal

; don't encourage recoil moves as much
    ld a, [wEnemyMonSpecies]
    cp AERODACTYL
    jr z, .skipRecoilCheck
    cp INFERNAPE
    jr z, .skipRecoilCheck
    cp HAWLUCHA
    jr z, .skipRecoilCheck
    cp REGIGIGAS
    jr z, .skipRecoilCheck
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_RECOIL_HIT
	jr z, .recoil

.skipRecoilCheck
; if we are below 1/4 hp and have a healing move then lesser encourage so we can use it
    call AICheckEnemyQuarterHP
    jr c, .checkAcc
	ld b, EFFECT_HEAL
	call AIHasMoveEffect
	jr c, .explodeOrHeal

.checkAcc
; encourage more accurate moves if they can kill
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 100 percent
	jr c, .notAcc

; encouragements to KO enemy
; standard attack = 9
; recoil attack = 7
; inaccurate attack = 5
; explode attack = 3
	dec [hl]
	dec [hl]
.recoil
	dec [hl]
	dec [hl]
.notAcc
	dec [hl]
    dec [hl]
.explodeOrHeal
    dec [hl]
    dec [hl]
    dec [hl]
    jp .checkmove

.discourage
	call AIDiscourageMove
	jp .checkmove

INCLUDE "data/battle/ai/status_only_effects.asm"

BoostingMoveEffects:
	db EFFECT_ATTACK_UP_2
	db EFFECT_SP_ATK_UP
	db EFFECT_SP_ATK_UP_2
	db EFFECT_SUBSTITUTE
	db EFFECT_CURSE
	db EFFECT_SERENITY
	db EFFECT_GEOMANCY
	db EFFECT_CALM_MIND
	db EFFECT_BULK_UP
	db EFFECT_DRAGON_DANCE
	db EFFECT_QUIVER_DANCE
	db EFFECT_SHELL_SMASH
	db -1

HealingMoveEffects:
	db EFFECT_HEAL
	db EFFECT_MOONLIGHT
	db EFFECT_MORNING_SUN
	db EFFECT_SYNTHESIS
	db -1

AI_Smart_Switch:
; Enemies can switch intelligently under certain conditions
; switch if unboosted enemy is FRZ and player sets up
; 50% chance to switch if unboosted enemy is SLP and player sets up
; don't switch if enemy is weakened, just let it die
; switch if enemy is choice locked into a NVE move
; switch if enemy accuracy at -2 or lower
; switch if enemy attack at -2 or lower and has unboosted special attack
; switch if enemy is cursed
; 50% chance to switch if enemy afflicted with toxic
; 50% chance to switch if enemy afflicted with leech seed

; possibly switch if enemy is setup bait
	ld a, [wEnemyMonStatus]
	and 1 << FRZ
	jp nz, .checkSetUpAndSwitchIfPlayerSetsUp
    ;ld a, [wEnemyMonStatus]
	;and SLP
	;jp nz, .checkSetUpAndSwitchIfPlayerSetsUp50

; switch if choice locked into a NVE move
   ; call CanAI3HKO
   ; jr c, .not_encored
	ld hl, wEnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	jr z, .not_encored
    push hl
	ld a, 1
	ldh [hBattleTurn], a
	ld a, [wCurEnemyMove]
	call AIGetEnemyMove
	callfar BattleCheckTypeMatchup
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jp c, .switch
	and a
	jp z, .switch

; switch if locked into a move with 0 pp
	ld hl, wEnemyMonPP
	ld a, [wCurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jp z, .switch
.not_encored

; don't switch if enemy is weakened, just let it die
	call AICheckEnemyQuarterHP
	ret nc

; switch if enemy accuracy at -2 or lower
    ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 1
	jp c, .switch

; switch if enemy attack at -2 or lower and unboosted special attack
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 1
    jr nc, .magicGuard
    ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL - 1
	jp c, .switch

.magicGuard
; Pokemon who are immune to residual damage (magic guard) should not be considered
    ld a, [wEnemyMonSpecies]
    push hl
    push de
	push bc
	ld hl, AI_MagicGuardPokemon
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	ret c

; switch if enemy is cursed
    ld a, [wEnemySubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, .switch

; if enemy afflicted with toxic
; 50% chance to switch when above 50% hp if not set up
; switch when below 50% hp
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr z, .checkLeechSeed
	call AICheckEnemyHalfHP
	jp nc, .switch
	jp .checkSetUpAndSwitch50

.checkLeechSeed
; 50% chance to switch per turn if enemy afflicted with leech seed
    ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .switch50

    ret

.checkSetUpAndSwitchIfPlayerSetsUp
; don't switch if enemy mon is already set up
    ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemyDefLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc

; switch if player attempts to set up
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
    push hl
    push de
	push bc
	ld hl, BoostingMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .switch
	ret

;.checkSetUpAndSwitchIfPlayerSetsUp50
; don't switch if enemy mon is already set up
;    ld a, [wEnemyAtkLevel]
;	cp BASE_STAT_LEVEL + 2
;	ret nc
;   ld a, [wEnemySAtkLevel]
;	cp BASE_STAT_LEVEL + 2
;	ret nc
;   ld a, [wEnemyDefLevel]
;	cp BASE_STAT_LEVEL + 2
;	ret nc
;   ld a, [wEnemySDefLevel]
;	cp BASE_STAT_LEVEL + 2
;	ret nc

; switch if player attempts to set up
;	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
;   push hl
;   push de
;	push bc
;	ld hl, BoostingMoveEffects
;	ld de, 1
;	call IsInArray
;	pop bc
;	pop de
;	pop hl
;	jr c, .switch50
;	ret

.checkSetUpAndSwitch50
; don't switch if enemy mon is already set up
    ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemyDefLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
    ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 2
	ret nc
	jr .switch50

.switch50
    call AI_50_50
	ret c
.switch
; can't switch if trapped
	ld a, [wBattleMonSpecies]
	cp WOBBUFFET
	ret z
	cp CHANDELURE
	ret z
	cp SPIRITOMB
	ret z
	cp GIRATINA
	ret z

    ld a, $1
    ld [wEnemyIsSwitching], a
	ret

; DevNote - this is commented out because this is stupid and will not be used
AI_Setup:
    ret
; Use stat-modifying moves on turn 1.
; 50% chance to greatly encourage stat-up moves during the first turn of enemy's Pokemon.
; 50% chance to greatly encourage stat-down moves during the first turn of player's Pokemon.
; Almost 90% chance to greatly discourage stat-modifying moves otherwise.
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld b, NUM_MOVES + 1
;.checkmove
;	dec b
;	ret z
;	inc hl
;	ld a, [de]
;	and a
;	ret z
;	inc de
;	call AIGetEnemyMove
;	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
;	cp EFFECT_ATTACK_UP
;	jr c, .checkmove
;	cp EFFECT_EVASION_UP + 1
;	jr c, .statup
;	cp EFFECT_ATTACK_DOWN - 1
;	jr z, .checkmove
;	cp EFFECT_EVASION_DOWN + 1
;	jr c, .statdown
;	cp EFFECT_ATTACK_UP_2
;	jr c, .checkmove
;	cp EFFECT_EVASION_UP_2 + 1
;	jr c, .statup
;	cp EFFECT_ATTACK_DOWN_2 - 1
;	jr z, .checkmove
;	cp EFFECT_EVASION_DOWN_2 + 1
;	jr c, .statdown
;	jr .checkmove
;.statup
;	ld a, [wEnemyTurnsTaken]
;	and a
;	jr nz, .discourage
;	jr .encourage
;.statdown
;	ld a, [wPlayerTurnsTaken]
;	and a
;	jr nz, .discourage
;.encourage
;	call AI_50_50
;	jr c, .checkmove
;	dec [hl]
;	dec [hl]
;	jr .checkmove
;.discourage
;	call Random
;	cp 12 percent
;	jr c, .checkmove
;	inc [hl]
;	inc [hl]
;	jr .checkmove

; DevNote - this is commented out because this is made redundant by AI_Aggressive
AI_Types:
    ret
; Dismiss any move that the player is immune to.
; Encourage super-effective moves.
; Discourage not very effective moves unless
; all damaging moves are of the same type.
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld b, NUM_MOVES + 1
;.checkmove
;	dec b
;	ret z
;	inc hl
;	ld a, [de]
;	and a
;	ret z
;	inc de
;	call AIGetEnemyMove
;	push hl
;	push bc
;	push de
;	ld a, 1
;	ldh [hBattleTurn], a
;	callfar BattleCheckTypeMatchup
;	pop de
;	pop bc
;	pop hl
;	ld a, [wTypeMatchup]
;	and a
;	jr z, .immune
;	cp EFFECTIVE
;	jr z, .checkmove
;	jr c, .noteffective
; effective
;	ld a, [wEnemyMoveStruct + MOVE_POWER]
;	and a
;	jr z, .checkmove
;	dec [hl]
;	jr .checkmove
;.noteffective
; Discourage this move if there are any moves
; that do damage of a different type.
;	push hl
;	push de
;	push bc
;	ld a, [wEnemyMoveStruct + MOVE_TYPE]
;	and TYPE_MASK
;	ld d, a
;	ld hl, wEnemyMonMoves
;	ld b, NUM_MOVES + 1
;	ld c, 0
;.checkmove2
;	dec b
;	jr z, .movesdone
;	ld a, [hli]
;	and a
;	jr z, .movesdone
;	call AIGetEnemyMove
;	ld a, [wEnemyMoveStruct + MOVE_TYPE]
;	and TYPE_MASK
;	cp d
;	jr z, .checkmove2
;	ld a, [wEnemyMoveStruct + MOVE_POWER]
;	and a
;	jr nz, .damaging
;	jr .checkmove2
;.damaging
;	ld c, a
;.movesdone
;	ld a, c
;	pop bc
;	pop de
;	pop hl
;	and a
;	jr z, .checkmove
;	inc [hl]
;	jr .checkmove
;.immune
;	call AIDiscourageMove
;	jr .checkmove

; DevNote - this is commented out because it is stupid and wont be used
AI_Offensive:
    ret
; Greatly discourage non-damaging moves.
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld b, NUM_MOVES + 1
;.checkmove
;	dec b
;	ret z
;	inc hl
;	ld a, [de]
;	and a
;	ret z
;	inc de
;	call AIGetEnemyMove
;	ld a, [wEnemyMoveStruct + MOVE_POWER]
;	and a
;	jr nz, .checkmove
;	inc [hl]
;	inc [hl]
;	jr .checkmove

AI_Smart:
; Context-specific scoring.

	ld hl, wEnemyAIMoveScores
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, AI_Smart_EffectHandlers
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .nextmove

	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	jr .checkmove

AI_Smart_EffectHandlers:
	dbw EFFECT_SLEEP,            AI_Smart_Sleep
	dbw EFFECT_LEECH_HIT,        AI_Smart_LeechHit
	dbw EFFECT_SELFDESTRUCT,     AI_Smart_Selfdestruct
	dbw EFFECT_DREAM_EATER,      AI_Smart_DreamEater
	dbw EFFECT_EVASION_UP_2,     AI_Smart_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AI_Smart_AlwaysHit
	dbw EFFECT_ACCURACY_DOWN,    AI_Smart_AccuracyDown
    dbw EFFECT_ATTACK_DOWN,      AI_Smart_AttackDown
    dbw EFFECT_ATTACK_DOWN_2,    AI_Smart_AttackDown
    dbw EFFECT_DEFENSE_DOWN,     AI_Smart_StatDown
    dbw EFFECT_DEFENSE_DOWN_2,   AI_Smart_StatDown
    dbw EFFECT_SPEED_DOWN_2,     AI_Smart_SpeedDown
	dbw EFFECT_RESET_STATS,      AI_Smart_ResetStats
	dbw EFFECT_FORCE_SWITCH,     AI_Smart_ForceSwitch
	dbw EFFECT_HEAL,             AI_Smart_Heal
	dbw EFFECT_TOXIC,            AI_Smart_Toxic
	dbw EFFECT_LIGHT_SCREEN,     AI_Smart_LightScreen
	dbw EFFECT_OHKO,             AI_Smart_Ohko
	dbw EFFECT_CONFUSE,          AI_Smart_Confuse
	dbw EFFECT_SP_DEF_UP_2,      AI_Smart_SpDefenseUp2
	dbw EFFECT_REFLECT,          AI_Smart_Reflect
	dbw EFFECT_PARALYZE,         AI_Smart_Paralyze
	dbw EFFECT_SPEED_DOWN_HIT,   AI_Smart_SpeedDownHit
	dbw EFFECT_SUBSTITUTE,       AI_Smart_Substitute
	dbw EFFECT_HYPER_BEAM,       AI_Smart_HyperBeam
	dbw EFFECT_LEECH_SEED,       AI_Smart_LeechSeed
	dbw EFFECT_DISABLE,          AI_Smart_Disable
	dbw EFFECT_COUNTER,          AI_Smart_Counter
	dbw EFFECT_ENCORE,           AI_Smart_Encore
	dbw EFFECT_PAIN_SPLIT,       AI_Smart_PainSplit
	dbw EFFECT_SLEEP_TALK,       AI_Smart_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AI_Smart_DestinyBond
	dbw EFFECT_REVERSAL,         AI_Smart_Reversal
	dbw EFFECT_HEAL_BELL,        AI_Smart_HealBell
	dbw EFFECT_PRIORITY_HIT,     AI_Smart_PriorityHit
	dbw EFFECT_MEAN_LOOK,        AI_Smart_MeanLook
	dbw EFFECT_CURSE,            AI_Smart_Curse
	dbw EFFECT_PROTECT,          AI_Smart_Protect
	dbw EFFECT_PERISH_SONG,      AI_Smart_PerishSong
	dbw EFFECT_SANDSTORM,        AI_Smart_Sandstorm
	dbw EFFECT_ENDURE,           AI_Smart_Endure
	dbw EFFECT_ROLLOUT,          AI_Smart_Rollout
	dbw EFFECT_BULK_UP,          AI_Smart_BulkUp
	dbw EFFECT_ATTRACT,          AI_Smart_Attract
	dbw EFFECT_MAGNITUDE,        AI_Smart_Magnitude
	dbw EFFECT_BATON_PASS,       AI_Smart_BatonPass
	dbw EFFECT_RAPID_SPIN,       AI_Smart_RapidSpin
	dbw EFFECT_MORNING_SUN,      AI_Smart_MorningSun
	dbw EFFECT_SYNTHESIS,        AI_Smart_Synthesis
	dbw EFFECT_MOONLIGHT,        AI_Smart_Moonlight
	dbw EFFECT_RAIN_DANCE,       AI_Smart_RainDance
	dbw EFFECT_SUNNY_DAY,        AI_Smart_SunnyDay
	dbw EFFECT_BELLY_DRUM,       AI_Smart_BellyDrum
	dbw EFFECT_MIRROR_COAT,      AI_Smart_MirrorCoat
	dbw EFFECT_EARTHQUAKE,       AI_Smart_Earthquake
	dbw EFFECT_SOLARBEAM,        AI_Smart_Solarbeam
	dbw EFFECT_FLY,              AI_Smart_Fly
	dbw EFFECT_HOLY_ARMOUR,      AI_Smart_HolyArmour
	dbw EFFECT_SERENITY,         AI_Smart_Serenity
	dbw EFFECT_ATTACK_UP_2,      AI_Smart_SwordsDance
	dbw EFFECT_DEFENSE_UP_2,     AI_Smart_Barrier
	dbw EFFECT_SP_ATK_UP,        AI_Smart_Growth
	dbw EFFECT_SP_ATK_UP_2,      AI_Smart_NastyPlot
	dbw EFFECT_SPEED_UP_2,       AI_Smart_Agility
	dbw EFFECT_GEOMANCY,         AI_Smart_Geomancy
	dbw EFFECT_CALM_MIND,        AI_Smart_CalmMind
	dbw EFFECT_DRAGON_DANCE,     AI_Smart_DragonDance
	dbw EFFECT_CONFUSE_HIT,      AI_Smart_DynamicPunch
    dbw EFFECT_QUIVER_DANCE,     AI_Smart_QuiverDance
    dbw EFFECT_SPIKES,           AI_Smart_Spikes
    dbw EFFECT_SHELL_SMASH,      AI_Smart_ShellSmash
    dbw EFFECT_FLINCH_HIT,       AI_Smart_Flinch
    dbw EFFECT_KINGS_SHIELD,     AI_Smart_KingsShield
    dbw EFFECT_STATIC_DAMAGE,    AI_Smart_StaticDamage
    dbw EFFECT_DEFENSE_UP,       AI_Smart_LesserStatChange
    dbw EFFECT_FOCUS_ENERGY,     AI_Smart_LesserStatChange
    dbw EFFECT_SAFEGUARD,        AI_Smart_LesserStatChange
    dbw EFFECT_DEFENSE_CURL,     AI_Smart_LesserStatChange
    dbw EFFECT_PARALYZE_HIT,     AI_Smart_ParalyzeHit
    dbw EFFECT_JUDGEMENT,        AI_Smart_Judgement
	db -1 ; end

AI_Smart_Sleep:
; don't use if there already is a status
    ld a, [wBattleMonStatus]
    and a
    jp nz, .discourage

; never use if player has substitute
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, .discourage

; never use if player has safeguard
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr nz, .discourage

; don't use against Arceus as it is immune to status
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jr z, .discourage
    cp SYLVEON
    jr z, .discourage
    cp DUNSPARCE
    jp z, .discourage
    cp SMEARGLE
    jp z, .discourage
    cp DEOXYS
    jp z, .discourage

; does player have a held item that would heal sleep
	push hl
	push de
	ld a, [wBattleMonItem]
	ld [wNamedObjectIndex], a
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_HEAL_STATUS
	pop de
	pop hl
	jr nz, .noItem

; if faster than the player, don't sleep if the player can 1hko
    call DoesAIOutSpeedPlayer
    jr nc, .playerMovesFirst
    call CanPlayerKO
    jr c, .discourage
    jr .noItem

; if slower than the player, don't sleep if player can 2hko
.playerMovesFirst
    call CanPlayer2HKO
    jr c, .discourage

.noItem
; check if the move is Spore
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp SPORE
	jr nz, .notSpore
	jr .useMove

.notSpore
; if faster then continue
	call DoesAIOutSpeedPlayer
	jr c, .continue

; discourage if faster player has picked substitute
	ld a, [wCurPlayerMove]
	cp SUBSTITUTE
	jr nc, .continue
	inc [hl]
	inc [hl]
	inc [hl]
	ret

.continue
	ld b, EFFECT_DREAM_EATER
	call AIHasMoveEffect
	jr c, .encourage50

	ld b, EFFECT_NIGHTMARE
	call AIHasMoveEffect
	ret nc

; Pokemon with Bad Dreams ability should prioritise sleep more
    ld a, [wEnemyMonSpecies]
    cp DARKRAI
    jr z, .encourage50
    cp DROWZEE
    jr z, .encourage50
    cp HYPNO
    jr z, .encourage50
    cp JYNX
    jr z, .encourage50

.discourage
    inc [hl]
    inc [hl]
    ret
.encourage50
	call AI_50_50
	ret c
.useMove
rept 12
    dec [hl]
endr
    ret

AI_Smart_LeechHit:
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl

; 60% chance to discourage this move if not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .discourage

; Do nothing if effectiveness is neutral.
	ret z

; Do nothing if enemy's HP is full.
	call AICheckEnemyMaxHP
	ret c

; 80% chance to encourage this move otherwise.
	call AI_80_20
	ret c

	dec [hl]
	ret

.discourage
	call Random
	cp 39 percent + 1
	ret c

	inc [hl]
	ret

AI_Smart_Selfdestruct:
; Selfdestruct, Explosion

; never use against ghost types
    ld a, [wBattleMonType1]
	cp GHOST
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp GHOST
	jr z, .discourage

; Unless this is the enemy's last Pokemon...
	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .notlastmon

; ...greatly discourage this move unless this is the player's last Pokemon too.
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .discourage

.notlastmon
; don't use if player is behind a sub
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a	;check for substitute bit
	jr nz, .discourage

; don't use if player has protect
	ld b, EFFECT_PROTECT
	call PlayerHasMoveEffect
	jr c, .discourage

; don't use if player is faster and has - substitute, fly, dig
	call DoesAIOutSpeedPlayer
	jr c, .faster
	ld b, EFFECT_SUBSTITUTE
	call PlayerHasMoveEffect
	jr c, .discourage
	ld b, EFFECT_FLY
	call PlayerHasMoveEffect
	jr c, .discourage

.faster
; if enemy's HP is below 25% just boom
	call AICheckEnemyQuarterHP
	jr nc, .encourage

; use if we are about to be KOd
    call ShouldAIBoost
    jr nc, .encourage

.continue
; Greatly discourage this move if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	jr c, .discourage

; if we are here we are below 1/2 hp and player is non boosted
; if we have no other move that can ko the player just boom

.encourage
    dec [hl]
    ret
.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_DreamEater:
; 90% chance to greatly encourage this move.
; The AI_Basic layer will make sure that
; Dream Eater is only used against sleeping targets.
	call Random
	cp 10 percent
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_EvasionUp:
; discourage if enemy is Arceus, Machamp, Magnezone or Zygarde
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jr z, .discourage
    cp MACHAMP
    jr z, .discourage
    cp MAGNEZONE
    jr z, .discourage
    cp ZYGARDE
    jr z, .discourage

; encourage to +4 and discourage after
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

; Player is badly poisoned.
; 70% chance to greatly encourage this move.
; This would counter any previous discouragement.
.maybe_greatly_encourage
	call Random
	cp 31 percent + 1
	ret c

	dec [hl]
	dec [hl]
	ret

; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
.maybe_encourage
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_Judgement:
AI_Smart_AlwaysHit:
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .encourage

	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 2
	ret c

.encourage
	dec [hl]
	ret

AI_Smart_AccuracyDown:
; discourage if enemy is immune to stat drops
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_ClearBodyPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
	jr c, .discourage

; discourage after player is at -3
    ld a, [wPlayerAccLevel]
    cp BASE_STAT_LEVEL - 2
    jr c, .discourage

; 50% chance to encourage slightly if player has full accuracy
    call AI_50_50
    jr c, .discourage
    ld a, [wPlayerAccLevel]
    cp BASE_STAT_LEVEL
    jr c, .discourage
    dec [hl]
    ret
.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_AttackDown:
; discourage if enemy is immune to stat drops
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_ClearBodyPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
    jr c, .discourage

	call ShouldAIBoost
	jr nc, .discourage

; discourage after player is at -3
    ld a, [wPlayerAtkLevel]
    cp BASE_STAT_LEVEL - 1
    jr c, .discourage

    call IsPlayerPhysicalOrSpecial
    jr nc, .discourage

    dec [hl]
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_SpeedDown:
; discourage if enemy is immune to stat drops
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_ClearBodyPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
    jr c, .discourage

	call ShouldAIBoost
	jr nc, .discourage

    call DoesAIOutSpeedPlayer
    jr c, .discourage

    dec [hl]
    dec [hl]
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret


AI_Smart_StatDown:
; discourage if enemy is immune to stat drops
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_ClearBodyPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
    jr c, .discourage

	call ShouldAIBoost
	jr nc, .discourage

    dec [hl]
    ret

.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret


AI_Smart_ResetStats:
; 85% chance to encourage this move if any of enemy's stat levels is lower than -2.
	push hl
	ld hl, wEnemyAtkLevel
	ld c, NUM_LEVEL_STATS
.enemystatsloop
	dec c
	jr z, .enemystatsdone
	ld a, [hli]
	cp BASE_STAT_LEVEL - 2
	jr c, .encourage
	jr .enemystatsloop

; 85% chance to encourage this move if any of player's stat levels is higher than +2.
.enemystatsdone
	ld hl, wPlayerAtkLevel
	ld c, NUM_LEVEL_STATS
.playerstatsloop
	dec c
	jr z, .discourage
	ld a, [hli]
	cp BASE_STAT_LEVEL + 3
	jr c, .playerstatsloop

.encourage
	pop hl
	call Random
	cp 16 percent
	ret c
	dec [hl]
	ret

; Discourage this move if neither:
; Any of enemy's stat levels is	lower than -2.
; Any of player's stat levels is higher than +2.
.discourage
	pop hl
	inc [hl]
	ret

AI_Smart_Spikes:
; discourage if player has spikes on the field, otherwise encourage
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	jr nz, .discourage
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_ForceSwitch:
; Whirlwind, Roar.
; don't use on Uber Pokemon as they are immune
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

; don't use if player has only one pokemon left
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .discourage

; encourage this move if the player's attack levels are boosted.
	ld a, [wPlayerAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage
	ld a, [wPlayerSAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage

; discourage if non-boosted player can 2HKO from current HP
    call CanPlayer2HKO
    jr c, .discourage

; encourage if player has spikes on the field
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	jr nz, .encourage

.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret
.encourage
	dec [hl]
	ret

AI_Smart_Heal:
AI_Smart_MorningSun:
AI_Smart_Synthesis:
AI_Smart_Moonlight:
; don't use if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

; if we have boosted evasion just heal below half
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 2
	jp nc, .healBelowHalf

; if the player is using Smeargle just attack, kill it!
    ld a, [wBattleMonSpecies]
    cp SMEARGLE
    jp z, .discourage

; check if the move is Rest, it must be handled differently
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp REST
	jr nz, .nonRestHeal

; if it is Rest check if the enemy is afflicted with toxic
; if so cancel any switching and heal below 1/2 hp
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr z, .restHeal
    ld a, $0
    ld [wEnemyIsSwitching], a
    jr .nonRestHeal

.restHeal
; for rest don't heal if player can 3hko from max hp, unless AI also knows sleep talk
; then don't use if player can 2hko from max hp
	ld b, EFFECT_SLEEP_TALK
	call AIHasMoveEffect
	jr c, .nonRestHeal
    call CanPlayer3HKOMaxHP
    jr c, .discourage

.nonRestHeal
; don't heal if afflicted with toxic
    call IsAIToxified
    jr c, .discourage

; don't heal if player can 2 shot from max hp, no point
    call CanPlayer2HKOMaxHP
    jr c, .discourage

; if we are faster and player is flying or underground encourage heal if we can be 1HKO
    call DoesAIOutSpeedPlayer
    jr nc, .checkQuarter
    call CanPlayerKO
    jr nc, .checkQuarter
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, .bigEncourage

.checkQuarter
; always heal when below 1/4 hp
    call AICheckEnemyQuarterHP
    jr nc, .encourage

; if faster than the player, heal if the player can 1hko
    call DoesAIOutSpeedPlayer
    jr nc, .playerMovesFirst
    call CanPlayerKO
    jr c, .encourage
    jr .checkArceusMewtwo

; if slower than the player, heal if player can 2hko
.playerMovesFirst
    call CanPlayer2HKO
    jr c, .encourage

.checkArceusMewtwo
; Arceus and Mewtwo always heal when below half
; also heal below half if we have increased evasion
    ld a, [wEnemyMonSpecies]
    cp MEWTWO
    jr z, .healBelowHalf
    cp ARCEUS
    jr z, .healBelowHalf
    jr .discourage
.healBelowHalf
    call AICheckEnemyHalfHP
    jr c, .discourage
    ; fallthrough

.encourage
; ARCEUS should play defensively and prioritize healing above scoring KOs
	ld a, [wEnemyMonSpecies]
	cp ARCEUS
	jr nz, .normalEncourage
.bigEncourage
rept 8
	dec [hl]
endr
.normalEncourage
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_Toxic:
; never use if player has substitute
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .discourage

; never use if player has safeguard
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr nz, .discourage

; never use against steel types
    ld a, [wBattleMonType1]
	cp STEEL
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp STEEL
	jr z, .discourage

; never use against poison types
    ld a, [wBattleMonType1]
	cp POISON
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .discourage

; never use against Pokemon immune to status
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jr z, .discourage
    cp SYLVEON
    jr z, .discourage
    cp DUNSPARCE
    jp z, .discourage

; never use against Pokemon with magic guard
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_MagicGuardPokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

; don't use if player below 50% HP
    call AICheckPlayerHalfHP
    jr nc, .discourage

; encourage slightly if we get here
    dec [hl]
	ret

.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret


AI_Smart_LeechSeed:
; never use against grass types
    ld a, [wBattleMonType1]
	cp GRASS
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp GRASS
	jr z, .discourage

; don't use on foes twice our level
	ld a, [wBattleMonLevel]
	srl a
	ld b, a
	ld a, [wEnemyMonLevel]
	sub b
	jr c, .discourage

; never use against Pokemon with magic guard
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_MagicGuardPokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

; don't use on already seeded player
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .discourage

; don't use if we will be koed
    call ShouldAIBoost
    jr nc, .discourage

; don't use if we can just 2hko the player
    call CanAI2HKO
    jr c, .discourage

; otherwise use
rept 5
    dec [hl]
endr
    ret

.discourage
    inc [hl]
    inc [hl]
    ret

AI_Smart_LightScreen:
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
    call CanPlayerKO
    jr c, .discourage
.skipKOCheck

; discourage if player has boosted Atk
	ld a, [wPlayerAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .discourage

; discourage if afflicted with toxic
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr nz, .discourage

; strongly encourage if player has boosted special attack
	ld a, [wPlayerSAtkLevel]
	cp BASE_STAT_LEVEL + 1
	jr nc, .encourage

; encourage if players attack is higher than special attack
	call IsPlayerPhysicalOrSpecial
	jr nc, .encourage

; fallthrough

.discourage
    inc [hl]
    inc [hl]
    ret
.encourage
    dec [hl]
    dec [hl]
    dec [hl]
    dec [hl]
    dec [hl]
    ret

AI_Smart_Reflect:
; discourage if we will be koed unless we have a sash/sturdy
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
    call CanPlayerKO
    jr c, .discourage
.skipKOCheck

; discourage if afflicted with toxic
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr nz, .discourage

; encourage if players attack is higher than special attack
	call IsPlayerPhysicalOrSpecial
	jr c, .encourage

; fallthrough

.discourage
    inc [hl]
    inc [hl]
    ret
.encourage
    dec [hl]
    dec [hl]
    dec [hl]
    dec [hl]
    dec [hl]
    ret

AI_Smart_Ohko:
; Dismiss this move if player's level is higher than enemy's level.
; Else, discourage this move is player's HP is below 50%.

; don't use Fissure against a flying type
    ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp FISSURE
	jr nz, .notFissure
    ld a, [wBattleMonType1]
	cp FLYING
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp FLYING
	jr z, .discourage

.notFissure
; don't use on Uber Pokemon as they are immune
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]
	cp b
	jp c, AIDiscourageMove
	call AICheckPlayerHalfHP
	ret c
.discourage
	inc [hl]
	ret

AI_Smart_StaticDamage:
; don't use on Uber Pokemon as they are immune
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage
   	ret
.discourage
   	inc [hl]
   	inc [hl]
   	inc [hl]
   	ret

AI_Smart_SpDefenseUp2:
	call ShouldAIBoost
	jr nc, .discourage

; Discourage this move if enemy's special defense level is higher than +3.
	ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage

; greatly encourage this move if
; enemy's Special Defense level is lower than +3,
; and the player's Pokémon is Special-oriented.
	cp BASE_STAT_LEVEL + 3
	ret nc

	call IsPlayerPhysicalOrSpecial
	jr nc, .encourage
	ret

.discourage
	inc [hl]
	ret
.encourage
rept 8
	dec [hl]
endr
	ret

AI_Smart_Fly:
; Fly, Dig

; Greatly encourage this move if the player is
; flying or underground, and slower than the enemy.

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	call DoesAIOutSpeedPlayer
	ret nc

	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Paralyze:
; never use if player already has a status
    ld a, [wBattleMonStatus]
    and a
    jp nz, .discourage

; never use if player has substitute
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, .discourage

; never use if player has safeguard
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jp nz, .discourage

; never use thunderwave against ground types or volt absorbers
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp THUNDER_WAVE
	jr nz, .glare
    ld a, [wBattleMonType1]
	cp GROUND
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp GROUND
	jr z, .discourage
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_VoltAbsorbPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
	jr c, .discourage

.glare
; never use glare against ghost types
	cp GLARE
	jr nz, .notGlare
    ld a, [wBattleMonType1]
	cp GHOST
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp GHOST
	jr z, .discourage

.notGlare
; don't use against Arceus since it is immune to status
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jr z, .discourage
    cp SYLVEON
    jr z, .discourage
    cp DUNSPARCE
    jp z, .discourage

; encourage if enemy is slower than player.
; 50% chance to discourage otherwise
	call DoesAIOutSpeedPlayer
	jr c, .AIFaster

;50% to discourage if player knows sub
	ld b, EFFECT_SUBSTITUTE
	call PlayerHasMoveEffect
	jr c, .discourage50
	jr .checkEvasion

; if we are faster and either the player or us can 2HKO, discourage
.AIFaster
    call CanPlayer2HKOMaxHP
    jr c, .discourage
    call CanAI2HKO
    jr c, .discourage

.checkEvasion
; if player is evasive and we know an always hit move then discourage so we just attack
    ld a, [wPlayerEvaLevel]
    cp BASE_STAT_LEVEL + 2
    jr c, .encourage

	ld b, EFFECT_ALWAYS_HIT
	call AIHasMoveEffect
	jr c, .discourage
	ld b, EFFECT_JUDGEMENT
	call AIHasMoveEffect
	jr c, .discourage

.encourage
; needs to overcome encouragement to attack
; no good reason not to paralyze
;rept 12
rept 8
    dec [hl]
endr
    ret
.discourage50
    call AI_50_50
    ret c
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_ParalyzeHit:
; if we are Magnezone
    ld a, [wEnemyMonSpecies]
    cp MAGNEZONE
    ret nz

; if the move is zap cannon
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp ZAP_CANNON
	ret nz

; if the enemy is vulnerable to electric moves
    ld a, [wBattleMonType1]
	cp GROUND
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp GROUND
	jr z, .discourage
    ld a, [wBattleMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_VoltAbsorbPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
	jr c, .discourage

; if they are not statused
    ld a, [wBattleMonStatus]
    and a
    ret nz

; prioritize move
    dec [hl]
    dec [hl]
    dec [hl]
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_SpeedDownHit:
; Icy Wind

; Almost 90% chance to greatly encourage this move if the following conditions all meet:
; Enemy's HP is higher than 25%.
; It's the first turn of player's Pokemon.
; Player is faster than enemy.

	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp ICY_WIND
	ret nz
	call AICheckEnemyQuarterHP
	ret nc
	ld a, [wPlayerTurnsTaken]
	and a
	ret nz
	call DoesAIOutSpeedPlayer
	ret c
	call Random
	cp 12 percent
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Substitute:
; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

    ld a, [wEnemyMonSpecies]
    cp COTTONEE
    jr z, .skipSpeedCheck
    cp WHIMSICOTT
    jr z, .skipSpeedCheck
    cp KLEFKI
    jr z, .skipSpeedCheck
    cp RIOLU
    jr z, .skipSpeedCheck
    cp MURKROW
    jr z, .skipSpeedCheck

; discourage if Player will move first
    call DoesAIOutSpeedPlayer
    jr nc, .discourage

.skipSpeedCheck
; if player has status moves then don't consider player damage
	ld b, EFFECT_PARALYZE
	call PlayerHasMoveEffect
	jr c, .hasStatus
	ld b, EFFECT_SLEEP
	call PlayerHasMoveEffect
	jr c, .hasStatus
	ld b, EFFECT_TOXIC
	call PlayerHasMoveEffect
	jr c, .hasStatus

; if player can 3HKO from max hp the discourage sub
    call CanPlayer3HKOMaxHP
    jr c, .discourage
    jr .pastStatus

.hasStatus
; extra encourage at full hp
    call AICheckEnemyMaxHP
    jr nc, .pastStatus
    dec [hl]
    dec [hl]
    dec [hl]
    dec [hl]

.pastStatus
; encourage at full hp
    call AICheckEnemyMaxHP
    jr c, .encourage

; if above 1/4 hp encourage if player is asleep/frozen or user has boosted evasion
    call AICheckEnemyQuarterHP
    jr nc, .discourage
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr nz, .encourage
	ld a, [wEnemyEvaLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, .encourage

; otherwise 50% to encourage if above half hp, discourage otherwise
	call AICheckEnemyHalfHP
	jr nc, .discourage
	call AI_50_50
	jr c, .discourage
.encourage
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_HyperBeam:
    ld a, [wEnemyMonSpecies]
    cp PORYGONZ
    ret z

	call AICheckEnemyHalfHP
	jr c, .discourage

; 50% chance to encourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

.discourage
; If enemy's HP is above 50%, discourage this move at random
	call Random
	cp 16 percent
	ret c
	inc [hl]
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Counter:
    call BattleRandom
    cp 10 percent + 1
    ret c

	ld a, [wLastPlayerCounterMove]
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	ret nc

rept 10
	dec [hl]
endr
    ret

AI_Smart_Encore:
    ld a, [wEnemyMonSpecies]
    cp COTTONEE
    jr z, .skipSpeedCheck
    cp WHIMSICOTT
    jr z, .skipSpeedCheck
    cp KLEFKI
    jr z, .skipSpeedCheck
    cp RIOLU
    jr z, .skipSpeedCheck
    cp MURKROW
    jr z, .skipSpeedCheck
    cp WOBBUFFET
    jr z, .skipSpeedCheck

; don't use if we are slower
	call DoesAIOutSpeedPlayer
	jr nc, .discourage

; don't use if we can be koed
.skipSpeedCheck
    call ShouldAIBoost
    jr nc, .discourage

; don't use if player already encored
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	jr nz, .discourage

; don't use on Uber Pokemon as they are immune
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

; don't use if no last move recorded
	ld a, [wLastPlayerMove]
	and a
	jp z, AIDiscourageMove

; never encore a super effective move
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .weakmove

	push hl
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	ld hl, wEnemyMonType1
	predef CheckTypeMatchup

	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .weakmove

	and a
	ret nz
	jr .encourage

.weakmove
; if we are wobbuffet just use encore here
	ld a, [wEnemyMonSpecies]
	cp WOBBUFFET
	jr z, .encourage
; encore if it is an encore move, discourage otherwise
	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, EncoreMoves
	ld de, 1
	call IsInArray
	pop hl
	jr nc, .discourage

.encourage
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

INCLUDE "data/battle/ai/encore_moves.asm"

AI_Smart_PainSplit:
; Discourage this move if [enemy's current HP * 2 > player's current HP].

	push hl
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, wBattleMonHP + 1
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret nc
	inc [hl]
	ret

AI_Smart_Snore:
AI_Smart_SleepTalk:
; Greatly encourage this move if enemy is fast asleep.
; Greatly discourage this move otherwise.

	ld a, [wEnemyMonStatus]
	and SLP
	cp 2
	jr c, .discourage

rept 12
	dec [hl]
endr
	ret

.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

; If the player can KO and is using damaging moves then encourage
; 50% chance to encourage if player can KO but isn't using damaging moves
AI_Smart_DestinyBond:
    call CanPlayerKO
    jr nc, .discourage

    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .discourage

    call DoesAIOutSpeedPlayer
    jr nc, .discourage

    ld a, [wCurPlayerMove]
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
    and a
	jr nz, .encourage
	call AI_50_50
	jr c, .encourage

.discourage
    inc [hl]
    inc [hl]
    ret
.encourage
    dec [hl]
    dec [hl]
    ret

AI_Smart_Reversal:
; Discourage this move if enemy's HP is above 25%.
	call AICheckEnemyQuarterHP
	ret nc
	inc [hl]
	ret

AI_Smart_HealBell:
; Dismiss this move if none of the opponent's Pokemon is statused.
; Encourage this move if the enemy is statused.
; 50% chance to greatly encourage this move if the enemy is fast asleep or frozen.

	push hl
	ld a, [wOTPartyCount]
	ld b, a
	ld c, 0
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	push hl
	ld a, [hli]
	or [hl]
	jr z, .next

	; status
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop

	pop hl
	ld a, c
	and a
	jr z, .no_status

	ld a, [wEnemyMonStatus]
	and a
	jr z, .ok
	dec [hl]
.ok
	and 1 << FRZ | SLP
	ret z
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

.no_status
	ld a, [wEnemyMonStatus]
	and a
	ret nz
	jp AIDiscourageMove


AI_Smart_PriorityHit:
; never use extremespeed against a ghost type
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp EXTREMESPEED
	jr nz, .notESpeed
    ld a, [wBattleMonType1]
	cp GHOST
	jp z, AIDiscourageMove
	ld a, [wBattleMonType2]
	cp GHOST
	jp z, AIDiscourageMove

.notESpeed
; Dismiss this move if the player is flying or underground.
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, AIDiscourageMove

; Greatly encourage this move if it will KO the player.
	ld a, 1
	ldh [hBattleTurn], a
	push hl
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	pop hl
	ld a, [wCurDamage + 1]
	ld c, a
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp c
	ld a, [wBattleMonHP]
	sbc b
	jr nc, .noKO
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.noKO
; does player have priority move and are we low on hp
; if so skip speed check so we might use priority even if we are faster
	ld b, EFFECT_PRIORITY_HIT
	call PlayerHasMoveEffect
	jr nc, .speedCheck

	call AICheckEnemyQuarterHP
	jr nc, .skipSpeedCheck

.speedCheck
; if faster than the player then do nothing
	call DoesAIOutSpeedPlayer
	ret c

.skipSpeedCheck
; massive encourage if player can KO and player is attacking, unless we have sash
; this needs to overcome encouragement from other moves which do more damage and can KO
	call CanPlayerKO
	ret nc

    call DoesEnemyHaveIntactFocusSashOrSturdy
    ret c

; has player picked a damaging move, if not then don't encourage.
    ld a, [wCurPlayerMove]
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
    and a
	ret z

rept 12
	dec [hl]
endr
	ret

AI_Smart_Disable:
	call DoesAIOutSpeedPlayer
	jr nc, .discourage

	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, UsefulMoves
	ld de, 1
	call IsInArray

	pop hl
	jr nc, .notencourage

	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	ret

.notencourage
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret nz

.discourage
	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

AI_Smart_MeanLook:
; discourage if player is already trapped
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .discourage

; discourage if this is the players last mon
	push hl
	call AICheckLastPlayerMon
	pop hl
	jp z, AIDiscourageMove

; discourage if we will be koed
    call ShouldAIBoost
    jp nz, AIDiscourageMove

; if we are Wobbuffet just encourage at this point
	ld a, [wEnemyMonSpecies]
	cp WOBBUFFET
	jr nz, .notWobbuffet
rept 5
	dec [hl]
endr
	ret
.notWobbuffet

; discourage if below half health
	call AICheckEnemyHalfHP
	jr nc, .discourage

; 80% chance to greatly encourage this move if the enemy is badly poisoned (buggy).
; Should check wPlayerSubStatus5 instead.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .encourage

; 80% chance to greatly encourage this move if the player is either
; in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .encourage

; Otherwise, discourage this move unless the player only has not very effective moves against the enemy.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE + 1 ; not very effective
	pop hl
	ret nc

.discourage
	inc [hl]
	ret

.encourage
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AICheckLastPlayerMon:
	ld a, [wPartyCount]
	ld b, a
	ld c, 0
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	ld a, [wCurBattleMon]
	cp c
	jr z, .skip

	ld a, [hli]
	or [hl]
	ret nz
	dec hl

.skip
	add hl, de
	inc c
	dec b
	jr nz, .loop

	ret

AI_Smart_FlameWheel:
; Use this move if the enemy is frozen.

	ld a, [wEnemyMonStatus]
	bit FRZ, a
	ret z
rept 12
	dec [hl]
endr
	ret

AI_Smart_BulkUp:
	call IsAttackMaxed
	jr nc, .continue
	call IsDefenseMaxed
	jp c, StandardDiscourage

.continue
; if player is asleep or frozen and is physical we should boost
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr z, .noStatus
	call IsPlayerPhysicalOrSpecial
	jp c, StandardEncourage
.noStatus

; don't use if we are at risk of being KOd, just attack them
    call ShouldAIBoost
    jp nc, StandardDiscourage

; encourage to +2 - strong encourage if player is physical
    ld a, [wEnemyAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, .atPlus2
    call IsPlayerPhysicalOrSpecial
    jr nc, .special
    jp StrongEncourage
.special
    jp StandardEncourage

.atPlus2
; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we have no reason not to
    jp StandardEncourage

AI_Smart_Curse:
	ld a, [wEnemyMonType1]
	cp GHOST
	jp z, .ghost_curse
	ld a, [wEnemyMonType2]
	cp GHOST
	jp z, .ghost_curse

	call IsAttackMaxed
	jr nc, .continue
	call IsDefenseMaxed
	jr c, .discourage

.continue
; if player is asleep or frozen and is physical we should boost
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr z, .noStatus
	call IsPlayerPhysicalOrSpecial
	jr c, .encourage
.noStatus

; don't use curse if player can 2HKO as we will likely take 2 hits due to the speed drop
	call CanPlayer2HKO
	jr c, .discourage

; encourage to +2 - strong encourage if player is physical
    ld a, [wEnemyAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, .atPlus2
    call IsPlayerPhysicalOrSpecial
    jr nc, .special
    jr .strongEncourage
.special
    jr .encourage

.atPlus2
; discourage after boost if afflicted with toxic
    call IsAIToxified
    jr c, .discourage
    ret

.strongEncourage
    dec [hl]
.encourage
	dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

.ghost_curse
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, AIDiscourageMove

	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .notlastmon

	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .encourage

	jr .ghost_continue

.notlastmon
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .maybe_greatly_encourage

.ghost_continue
	call AICheckEnemyQuarterHP
	jp nc, .encourage

	call AICheckEnemyHalfHP
	jr nc, .encourage

	call AICheckEnemyMaxHP
	ret nc

	ld a, [wPlayerTurnsTaken]
	and a
	ret nz

.maybe_greatly_encourage
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_KingsShield:
; discourage if the we already used Protecting move
	ld a, [wCurEnemyMove]
	cp PROTECT
	jr z, .discourage
	cp ENDURE
	jr z, .discourage
    cp KINGS_SHIELD
	jr z, .discourage

; discourage if already in defense mode
    ld a, [wEnemyDefLevel]
    cp BASE_STAT_LEVEL + 2
    jr nc, .discourage

; if we are here we are in attack stance
; can we ko the player, if not continue
    call CanAIKO
    jr nc, .checkSubstitute

; if we outspeed then just attack
    call DoesAIOutSpeedPlayer
    jr c, .discourage

.checkSubstitute
; if the player has Substitute in their moves then 50% chance to not use kings shield
    ld b, EFFECT_SUBSTITUTE
	call PlayerHasMoveEffect
	jr c, .50PercentDiscourage

.checkAttacking
; if the players last move was non-damaging, 50% chance to not use kings shield
    ld a, [wCurPlayerMove]
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
    and a
	jr nz, .massiveEncourage

.50PercentDiscourage
    call Random
    cp 50 percent
    jr c, .discourage

.massiveEncourage
; this must overcome encouragement from a potential ko
rept 12
	dec [hl]
endr
    ret

.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_Protect:
; Greatly discourage this move if the enemy already used Protect.
	ld a, [wCurEnemyMove]
	cp PROTECT
	jr z, .greatly_discourage
	cp ENDURE
	jr z, .greatly_discourage
    cp KINGS_SHIELD
	jr z, .greatly_discourage

; Discourage this move if the player is locked on.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .discourage

; Encourage this move if the player has charged a two-turn move.
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CHARGED, a
	jr nz, .encourage

; Encourage this move if the player is affected by Toxic, Leech Seed, or Curse.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .encourage
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .encourage
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jr nz, .encourage

; at this point if we aren't Zygarde just discourage
    ld a, [wEnemyMonSpecies]
    cp ZYGARDE
    jr nz, .discourage

; discourage if at full HP
	call AICheckEnemyMaxHP
	jr c, .discourage

; use for sure if below half HP
	call AICheckEnemyHalfHP
	jr nc, .use

; 80% chance to encourage this move otherwise.
.encourage
	call AI_80_20
	ret c
.use
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
	inc [hl]
	inc [hl]

.discourage
	call Random
	cp 8 percent
	ret c

	inc [hl]
	inc [hl]
	ret

AI_Smart_PerishSong:
	push hl
	callfar FindAliveEnemyMons
	pop hl
	jr c, .discourage ; if this is the last enemy mon don't use

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .encourage ; if player is trapped then encourage

; don't use on Uber Pokemon as they are immune
    ld a, [wBattleMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .discourage

; encourage if player has only one pokemon left
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .encourage

; encourage this move if the player's attack levels are boosted.
	ld a, [wPlayerAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage
	ld a, [wPlayerSAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage

.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret
.encourage
	dec [hl]
	ret

AI_Smart_Sandstorm:
; don't use if already sandy
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .discourage

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

; even if we benefit from weather, don't use if we will be koed
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
    call CanPlayerKO
    jr c, .discourage
.skipKOCheck

; encourage if AI benefits from ability
    ld a, [wEnemyMonSpecies]
    cp EXCADRILL
    jr z, .encourage
    cp GOLEM
    jr z, .encourage
    cp GARCHOMP
    jr z, .encourage
    cp GLISCOR
    jr z, .encourage

; discourage if we will be koed
    call ShouldAIBoost
    jr nc, .discourage

; Greatly discourage this move if the player is immune to Sandstorm damage.
	ld a, [wBattleMonType1]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .greatly_discourage

	ld a, [wBattleMonType2]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .greatly_discourage

; Discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, .discourage

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret
.encourage
    dec [hl]
    dec [hl]
    dec [hl]
    ret

.SandstormImmuneTypes:
	db ROCK
	db GROUND
	db STEEL
	db -1 ; end

AI_Smart_Endure:
; Greatly discourage this move if the enemy already used Protect.
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .greatly_discourage

; Greatly discourage if player can't KO.
    call CanPlayerKO
    jr nc, .greatly_discourage

; If the enemy has Reversal...
	ld b, EFFECT_REVERSAL
	call AIHasMoveEffect
	jr nc, .no_reversal

; ...80% chance to greatly encourage this move.
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.no_reversal
; If the enemy is not locked on, do nothing.
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	ret z

; 50% chance to greatly encourage this move.
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

AI_Smart_Rollout:
; Rollout, Fury Cutter

; 80% chance to discourage this move if the enemy is in love, confused, or paralyzed.
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .maybe_discourage

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .maybe_discourage

	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr nz, .maybe_discourage

; 80% chance to discourage this move if the enemy's HP is below 25%,
; or if accuracy or evasion modifiers favour the player.
	call AICheckEnemyQuarterHP
	jr nc, .maybe_discourage

	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL
	jr c, .maybe_discourage
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 1
	jr nc, .maybe_discourage

; 80% chance to greatly encourage this move otherwise.
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	dec [hl]
	ret

.maybe_discourage
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Attract:
; 80% chance to encourage this move during the first turn of player's Pokemon.
; 80% chance to discourage this move otherwise.

	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .first_turn

	call AI_80_20
	ret c
	inc [hl]
	ret

.first_turn
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	ret

AI_Smart_Safeguard:
; 80% chance to discourage this move if player's HP is below 50%.

	call AICheckPlayerHalfHP
	ret c
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Magnitude:
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .fallthrough
	jr z, .fallthrough
; encourage if super effective
    dec [hl]
    ret
.fallthrough
AI_Smart_Earthquake:
; Greatly encourage this move if the player is underground and the enemy is faster.
	ld a, [wLastPlayerCounterMove]
	cp DIG
	ret nz

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_UNDERGROUND, a
	jr z, .could_dig

	call DoesAIOutSpeedPlayer
	ret nc
	dec [hl]
	dec [hl]
	ret

.could_dig
	; Try to predict if the player will use Dig this turn.

	; 50% chance to encourage this move if the enemy is slower than the player.
	call DoesAIOutSpeedPlayer
	ret c

	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_BatonPass:
; Discourage this move if the player hasn't shown super-effective moves against the enemy.
; Consider player's type(s) if its moves are unknown.
; DevNote - WTF, why would you do this, baton pass is not to escape an enemy!!

; discourage if we don't have any other mons to pass to
	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr c, .discourage

; encourage if we have good stat boosts to pass
    ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage
    ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage
    ld a, [wEnemySpdLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .encourage
	jr .discourage
.encourage
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
    inc [hl]
    ret

AI_Smart_RapidSpin:
; 80% chance to greatly encourage this move if the enemy is
; trapped (Bind effect), seeded, or scattered with spikes.

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .encourage

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .encourage

	ld a, [wEnemyScreens]
	bit SCREENS_SPIKES, a
	ret z

.encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_RainDance:
; don't use if already raining
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .discourage

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

; even if we benefit from weather, don't use if we will be koed
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
    call CanPlayerKO
    jr c, .discourage
.skipKOCheck

; encourage the move if AI is a swift swim mon
    ld a, [wEnemyMonSpecies]
    cp KINGDRA
    jr z, .encourage
    cp POLIWRATH
    jr z, .encourage
; discourage if we will be koed
    call ShouldAIBoost
    jr nc, .discourage
; Greatly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Water-type.
	ld a, [wBattleMonType1]
	cp WATER
	jp z, AIBadWeatherType
	cp FIRE
	jp z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp WATER
	jp z, AIBadWeatherType
	cp FIRE
	jp z, AIGoodWeatherType

	push hl
	ld hl, RainDanceMoves
	jr AI_Smart_WeatherMove
.encourage
    dec [hl]
    dec [hl]
    dec [hl]
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret

INCLUDE "data/battle/ai/rain_dance_moves.asm"

AI_Smart_SunnyDay:
; don't use if already sunny
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .discourage

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

; even if we benefit from weather, don't use if we will be koed
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
    call CanPlayerKO
    jr c, .discourage
.skipKOCheck

; encourage if AI is a Chlorophyll mon
    ld a, [wEnemyMonSpecies]
    cp VENUSAUR
    jr z, .encourage
    cp VICTREEBEL
    jr z, .encourage
    cp EXEGGUTOR
    jr z, .encourage
; discourage if we will be koed
    call ShouldAIBoost
    jr nc, .discourage
; Greatly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Fire-type.
	ld a, [wBattleMonType1]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	push hl
	ld hl, SunnyDayMoves
	jp AI_Smart_WeatherMove
.encourage
rept 12
    dec [hl] ; enough to overcome KO as it could be SOLARBEAM
endr
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret

AI_Smart_WeatherMove:
; Rain Dance, Sunny Day

; Greatly discourage this move if the enemy doesn't have
; one of the useful Rain Dance or Sunny Day moves.
	call AIHasMoveInArray
	pop hl
	jr nc, AIBadWeatherType

; Greatly discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, AIBadWeatherType

; encourage this move otherwise.
	;call AI_50_50
	;ret c

	dec [hl]
	ret

AIBadWeatherType:
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AIGoodWeatherType:
; Rain Dance, Sunny Day

; Greatly encourage this move if it would disfavour the player type-wise and player's HP is above 50%...
	call AICheckPlayerHalfHP
	ret nc

; ...as long as one of the following conditions meet:
; It's the first turn of the player's Pokemon.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .good

; Or it's the first turn of the enemy's Pokemon.
	ld a, [wEnemyTurnsTaken]
	and a
	ret nz

.good
	dec [hl]
	dec [hl]
	ret

INCLUDE "data/battle/ai/sunny_day_moves.asm"

AI_Smart_BellyDrum:
; don't use if already at +2
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jr nc, .discourage

; don't use if enemy behind a sub
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a	;check for substitute bit
	jr nz, .discourage

; are we faster
    call DoesAIOutSpeedPlayer
    jr nc, .slower

; we are faster
; if we are full HP and player can't 2HKO then encourage
    call AICheckEnemyMaxHP
    jr nc, .slower
    call CanPlayer2HKO
    jp nc, StandardEncourage

.slower
; if we are above half HP and player can't 3HKO then encourage
    call AICheckEnemyHalfHP
    jr nc, .discourage
    call CanPlayer3HKOMaxHP
    jp nc, StandardEncourage

.discourage
    jp StandardDiscourage
	ret

AI_Smart_MirrorCoat:
    call BattleRandom
    cp 10 percent + 1
    ret c

	ld a, [wLastPlayerCounterMove]
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	ret c

rept 10
	dec [hl]
endr
    ret

AI_Smart_Solarbeam:
; 80% chance to encourage this move when it's sunny.
; 90% chance to discourage this move when it's raining.

	ld a, [wBattleWeather]
	;cp WEATHER_SUN
	;jr z, .encourage

	cp WEATHER_RAIN
	ret nz

	;call Random
	;cp 10 percent
	;ret c

	inc [hl]
	inc [hl]
	ret

.encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_HolyArmour:
	call IsDefenseMaxed
	jr nc, .continue
	call IsSpecialDefenseMaxed
	jr c, .discourage

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

.continue
; if player outspeeds us and can OHKO then don't use
	call DoesAIOutSpeedPlayer
	jr c, .encourage
    call CanPlayerKO
    jr c, .discourage

; encourage enough to overcome encouragement to score a KO
.encourage
rept 12
    dec [hl]
endr
	ret
.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_Serenity:
	call IsSpecialAttackMaxed
	jr nc, .continue
	call IsSpecialDefenseMaxed
	jr c, .discourage

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .discourage

; don't boost against a powerful priority user that can 2hko
    call IsPowerfulPriorityUser
    jp c, .discourage

.continue
; if player physical consider normal boost logic
; if player special consider only if they can outspeed and OHKO
	call IsPlayerPhysicalOrSpecial
	jr nc, .special
	call ShouldAIBoost
	jr nc, .discourage
    jr .doneKOCheck
.special
	call DoesAIOutSpeedPlayer
	jr c, .doneKOCheck
	call CanPlayerKO
	jr c, .discourage
.doneKOCheck

; strongly encourage if player has higher SpAtk than Atk
    call IsPlayerPhysicalOrSpecial
    jr nc, .strongEncourage

; encourage to +2
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jr c, .encourage
	ld a, [wEnemySDefLevel]
    cp BASE_STAT_LEVEL + 2
    jr c, .encourage

; discourage after +2 if afflicted with toxic
    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr nz, .discourage
    ret

.strongEncourage
    dec [hl]
.encourage
    dec [hl]
	dec [hl]
	ret
.discourage
    inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_QuiverDance:
	call IsSpecialAttackMaxed
	jr nc, .shouldBoost
	call IsSpecialDefenseMaxed
	jp c, StandardDiscourage

.shouldBoost
    call ShouldAIBoost
    jp nc, StandardDiscourage

; discourage if enemy is paralyzed
    ld a, [wEnemyMonStatus]
	and 1 << PAR
	jp nz, StandardDiscourage

; discourage if player speed is +2 or higher
    ld a, [wPlayerSpdLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, StandardDiscourage

; encourage to +2
	ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jp c, StandardEncourage

; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage
    ret

AI_Smart_CalmMind:
	call IsSpecialAttackMaxed
	jr nc, .continue
	call IsSpecialDefenseMaxed
	jp c, StandardDiscourage

.continue
; if player is asleep or frozen and is special we should boost
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr z, .noStatus
	call IsPlayerPhysicalOrSpecial
	jp nc, StandardEncourage
.noStatus

; don't boost against a powerful priority user that can 2hko
    call IsPowerfulPriorityUser
    jp c, StandardDiscourage

; don't use if we are at risk of being KOd, just attack them
    call ShouldAIBoost
    jp nc, StandardDiscourage

; encourage to +2
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp c, StandardEncourage

; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we have no reason not to
    jp StandardEncourage

AI_Smart_DragonDance:
	call IsAttackMaxed
	jp c, StandardDiscourage

.shouldBoost
    call ShouldAIBoost
    jp nc, StandardDiscourage

; discourage if enemy is paralyzed
    ld a, [wEnemyMonStatus]
	and 1 << PAR
	jp nz, StandardDiscourage

; discourage if player speed is +2 or higher
    ld a, [wPlayerSpdLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, StandardDiscourage

; discourage if players level is >10 higher than AI
    ld a, [wBattleMonLevel]
    ld b, a
    ld a, [wEnemyMonLevel]
    add 10
    cp b
    jp c, StandardDiscourage


; Some Pokemon have double boost sets with DragonDance and BulkUp/SwordsDance
; in such cases we want to use DragonDance first to get to +1 speed, then only use the other boost
	ld b, EFFECT_BULK_UP
	call AIHasMoveEffect
	jr c, .useFirstAndNotAgain
	ld b, EFFECT_ATTACK_UP_2
	call AIHasMoveEffect
	jr c, .useFirstAndNotAgain
	jr .normalEncourage

.useFirstAndNotAgain
	ld a, [wEnemySpdLevel]
	cp BASE_STAT_LEVEL + 1
	jp c, StrongEncourage
	jp StandardDiscourage

.normalEncourage
; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we have no reason not to
    jp StandardEncourage

AI_Smart_SwordsDance:
    call IsAttackMaxed
    jp c, StandardDiscourage

; don't use if we are at risk of being KOd, just attack them
    call ShouldAIBoost
    jp nc, StandardDiscourage

; encourage to +2
    ld a, [wEnemyAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp c, StandardEncourage

; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we have no reason not to
    jp StandardEncourage

AI_Smart_Barrier:
	call IsDefenseMaxed
	jp c, StandardDiscourage

; if player special then don't use
	call IsPlayerPhysicalOrSpecial
	jp nc, StandardDiscourage

	ld a, [wEnemyMonSpecies]
	cp MEWTWO
	jr z, .mewtwo

; if not mewtwo boost if we can up to +2
    call ShouldAIBoost
    jp nc, StandardDiscourage

    ld a, [wEnemyDefLevel]
    cp BASE_STAT_LEVEL + 3
    jp nc, StandardDiscourage
    jr .toxic

.mewtwo
; if player physical don't use only if they can outspeed and OHKO
	call DoesAIOutSpeedPlayer
	jr c, .skipKOCheck
	call CanPlayerKO
	jp c, StandardDiscourage
.skipKOCheck

.toxic
; discourage if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we get here
	jp StrongEncourage

AI_Smart_Agility:
; discourage if we are faster
    call DoesAIOutSpeedPlayer
    jp c, StandardDiscourage

; don't boost against a powerful priority user that can 2hko
    call IsPowerfulPriorityUser
    jp c, StandardDiscourage

; discourage if we will be KOd
    call CanPlayerKO
    jp c, StandardDiscourage

; otherwise use
    jp StandardEncourage

AI_Smart_Geomancy:
	call IsSpecialAttackMaxed
	jp c, StandardDiscourage

; if we are evasive go for boost
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 2
	jp nc, StandardEncourage

; if player is asleep or frozen and is special we should boost
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr z, .noStatus
	call IsPlayerPhysicalOrSpecial
	jp nc, StandardEncourage
.noStatus

; don't boost against a powerful priority user that can 2hko
    call IsPowerfulPriorityUser
    jp c, StandardDiscourage

; is the player setting up - if so we may want to boost to force them to stop and attack
; if the player already has +4 attack or special attack then they have already set up, just attack
; if the players last move was a healing move we may set up if we can't already 2HKO from max HP
; otherwise if the players last move was non-damaging we may set up if we can't already 3HKO from current HP
    ld a, [wCurPlayerMove]
	call AIGetPlayerMove
    ld a, [wPlayerMoveStruct + MOVE_EFFECT]
    cp EFFECT_HEAL
    jr z, .check2HKO
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	and a
	jr z, .check3HKO
	jr .checkKO
.check3HKO
	call CanAI3HKO
	jp c, StandardDiscourage
    call Random
    cp 50 percent + 1
    jp c, StandardDiscourage
	jr .continue
.check2HKO
	call CanAI2HKOMaxHP
	jp c, StandardDiscourage
    call Random
    cp 50 percent + 1
    jp c, StandardDiscourage
	jr .continue

.checkKO
; don't use if we are at risk of being KOd, just attack them
; as a two turn move we care about being 2HKOd
    call IsPlayerPhysicalOrSpecial
    jr nc, .special
.physical
    call CanPlayer2HKO
    jp c, StandardDiscourage
    jr .continue
.special
    call DoesAIOutSpeedPlayer
    jr nc, .physical
    call CanPlayerKO
    jp c, StandardDiscourage

.continue
; encourage to get to +2
    ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jp c, StandardEncourage

; if we are at +2 and can 2HKO, just attack
	call CanAI2HKO
	jp c, StandardDiscourage
	ret

AI_Smart_Growth:
	call IsSpecialAttackMaxed
	jp c, StandardDiscourage

    call ShouldAIBoost
    jp nc, StandardDiscourage

; encourage if we have no reason not to
rept 6
    dec [hl]
endr
    ret

AI_Smart_NastyPlot:
	call IsSpecialAttackMaxed
	jp c, StandardDiscourage

; Deoxys should not use Nasty Plot against dark types
    ld a, [wEnemyMonSpecies]
    cp DEOXYS
    jr nz, .notDeoxys
    ld a, [wBattleMonType1]
    cp DARK
    jp z, StandardDiscourage
    ld a, [wBattleMonType2]
    cp DARK
    jp z, StandardDiscourage

.notDeoxys
; if we are boosted >=+2 and can 2hko, just attack
	ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr c, .notBoosted
	call CanAI2HKO
	jp c, StandardDiscourage
.notBoosted

; don't use if we are at risk of being KOd, just attack them
    call ShouldAIBoost
    jp nc, StandardDiscourage

; encourage to +2
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp c, StandardEncourage

; discourage after boost if afflicted with toxic
    call IsAIToxified
    jp c, StandardDiscourage

; encourage if we have no reason not to
    jp StandardEncourage

AI_Smart_DynamicPunch:
; encourage dynamic punch for machamp
    ld a, [wEnemyMonSpecies]
    cp MACHAMP
    ret nz

; never use against ghost types
    ld a, [wBattleMonType1]
	cp GHOST
	ret z
	ld a, [wBattleMonType2]
	cp GHOST
	ret z

; don't encourage if already confused
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz

    dec [hl]
    dec [hl]
    ret

AI_Smart_ShellSmash:
; just use once before attacking
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, StandardDiscourage

; discourage if enemy is paralyzed
    ld a, [wEnemyMonStatus]
	and 1 << PAR
	jp nz, StandardDiscourage

; don't use if we will be koed
; skip if player is SLP or FRZ
	ld a, [wBattleMonStatus]
	and 1 << FRZ | SLP
	jr nz, .skipKOCheck
; discourage if player can 2HKO and either has priority move or is >= +2 speed
    call CanPlayer2HKO
    jr nc, .checkSash
    ld b, EFFECT_PRIORITY_HIT
    call PlayerHasMoveEffect
    jp c, StandardDiscourage
    ld a, [wPlayerSpdLevel]
    cp BASE_STAT_LEVEL + 2
    jp nc, StandardDiscourage
.checkSash
; is the weather sandstorm, if so don't skip ko check due to focus sash or sturdy (no mon with shell smash is immune to sandstorm)
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .checkKO
; skip if we have sash/sturdy
    call DoesEnemyHaveIntactFocusSashOrSturdy
    jr c, .skipKOCheck
.checkKO
; consider OHKO, assuming we will outspeed after use
    call CanPlayerKO
    jp c, StandardDiscourage
.skipKOCheck

; is the player behind a sub, then don't use, unless we have baton pass
    ld b, EFFECT_BATON_PASS
	call AIHasMoveEffect
	jr c, .skipSubCheck
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a	;check for substitute bit
	jp nz, StandardDiscourage
.skipSubCheck

.encourage
; this needs to be enough to overcome encouragement from having a move that can KO
rept 12
    dec [hl]
endr
	ret

AI_Smart_Flinch:
; do nothing if slower than player
    call DoesAIOutSpeedPlayer
    ret nc

; encourage if enemy is paralyzed
;    ld a, [wBattleMonStatus]
;	and 1 << PAR
;	jr nz, .smallEncourage

; encourage if we have serene grace
    ld a, [wEnemyMonSpecies]
    cp SHAYMIN
    jr z, .encourage
    cp TOGEKISS
    jr z, .encourage

    ret
.encourage
    dec [hl]
.smallEncourage
    dec [hl]
    ret

AI_Smart_Confuse:
; never use if player has substitute
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .discourage

; never use if player has safeguard
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr nz, .discourage

; don't use against Arceus since it is immune to status
    ld a, [wBattleMonSpecies]
    cp ARCEUS
    jr z, .discourage
    cp SYLVEON
    jr z, .discourage
    cp DUNSPARCE
    jp z, .discourage
    ret

.continue
; discourage if already confused
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .discourage

; encourage if enemy is paralyzed
    ld a, [wBattleMonStatus]
	and 1 << PAR
	ret z

	dec [hl]
	dec [hl]
    ret
.discourage
    inc [hl]
    inc [hl]
    ret

AI_Smart_LesserStatChange:
    call AICheckEnemyMaxHP
    jr nc, .discourage
    call ShouldAIBoost
    jr nc, .discourage
    ret
.discourage
    inc [hl]
    inc [hl]
    inc [hl]
    ret

; DevNote - functions which check if the player can KO the AI and decide to use boosting moves

; decide if AI should use boosting moves
; generally don't boost if player will just KO anyway
; returns carry if the AI can boost
ShouldAIBoost:
    call IsAttackMaxed
    jp c, .dontBoost
    call IsSpecialAttackMaxed
    jp c, .dontBoost

; don't boost if choice locked
    call DoesEnemyHaveChoiceItem
    jp c, .dontBoost

; if we are faster and player is flying or underground just boost
    call DoesAIOutSpeedPlayer
    jr nc, .checkEvasion
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, .boost

.checkEvasion
; if AI evasion is >= +2 then go for the boost - only used by Patches
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 2
	jp nc, .boost

.checkHaze
; if the player has roar/whirlwind/haze and we aren't immune to it then 50% to not boost
    ld a, [wEnemyMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_UberImmunePokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .noForceSwitch
    ld b, EFFECT_FORCE_SWITCH
	call PlayerHasMoveEffect
	jr c, .maybeDontBoost
    ld b, EFFECT_RESET_STATS
	call PlayerHasMoveEffect
	jr c, .maybeDontBoost
	jr .noForceSwitch
.maybeDontBoost
	call Random
	cp 50 percent
	jp c, .decideNotToBoost

; don't boost against a powerful priority user that can 2hko
    call IsPowerfulPriorityUser
    jp c, .decideNotToBoost

.noForceSwitch
; if our offence is already at or over +1 and either side can 2HKO, just attack
; this is to prevent the AI from boosting until it only gets one attack off, should attack earlier for more damage
	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 1
	jr c, .checkSpecialAttack
    jr .checkMutual2HKO
.checkSpecialAttack
	ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 1
	jr c, .checkSpeed
.checkMutual2HKO
; if AI is Zygarde and player is physical then skip mutual 2HKO check
    ld a, [wEnemyMonSpecies]
    cp ZYGARDE
    jr nz, .checkAsUsual
    call IsPlayerPhysicalOrSpecial
    jr c, .checkSpeed
.checkAsUsual
	call CanAI2HKO
	jp c, .decideNotToBoost
	call CanPlayer2HKO
	jr c, .decideNotToBoost

.checkSpeed
; who moves first
    call DoesAIOutSpeedPlayer
    jr nc, .playerMovesFirst

.enemyMovesFirst
; if AI moves first consider if player can 1HKO
; first if the AI has an intact focus sash or sturdy it can boost, unless player has priority move
; does player have priority move
	ld b, EFFECT_PRIORITY_HIT
	call PlayerHasMoveEffect
	jr c, .skipSturdySashCheck

    call DoesEnemyHaveIntactFocusSashOrSturdy
    jp c, .boost

.skipSturdySashCheck
    call CanPlayerKO
    jr c, .decideNotToBoost
    jp .boost

.playerMovesFirst
; does the boost increase speed, these moves are treated differently
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp DRAGON_DANCE
	jr z, .enemyMovesFirst
	cp QUIVER_DANCE
	jr z, .enemyMovesFirst

; if player moves first consider if they can 2HKO
    call CanPlayer2HKO
    jr c, .decideNotToBoost
    jp .boost

.decideNotToBoost
; is player FRZ we can boost
	ld a, [wBattleMonStatus]
	and 1 << FRZ
	jp nz, .boost

; if player is SLP and we get more than one turn before they wake up, then boost
	ld a, [wBattleMonStatus]
	and SLP
	jr z, .keepgoing

    call DoesAIOutSpeedPlayer
    jr nc, .playerFaster
    ld b, 1
    jr .checkSleep
.playerFaster
    ld b, 2

.checkSleep
    ld a, [wBattleMonStatus]
	and SLP
    cp b
	jr z, .keepgoing
	jr .boost

.keepgoing
; is the player behind a sub, if so don't boost, just attack
; unless we have baton pass, in which case boost up
    ld b, EFFECT_BATON_PASS
	call AIHasMoveEffect
	jr c, .skipSubCheck
    ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a	;check for substitute bit
	jr nz, .dontBoost
.skipSubCheck

; is the player setting up - if so we may want to boost to force them to stop and attack
; if the player already has +4 attack or special attack then they have already set up, just attack
; if the AI already has +2 attack or special attack then just attack
; if the players last move was a healing move 50% chance to set up if we can't already 2HKO from max HP
; otherwise if the players last move was non-damaging 50% chance to set up if we can't already 3HKO from current HP
	ld a, [wPlayerAtkLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .dontBoost
	ld a, [wPlayerSAtkLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .dontBoost

	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .dontBoost
	ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .dontBoost

    ld a, [wCurPlayerMove]
	call AIGetPlayerMove
    ld a, [wPlayerMoveStruct + MOVE_EFFECT]
    cp EFFECT_HEAL
    jr z, .check2HKOMaxHp
    cp EFFECT_MORNING_SUN
    jr z, .check2HKOMaxHp
    cp EFFECT_MOONLIGHT
    jr z, .check2HKOMaxHp
    cp EFFECT_SYNTHESIS
    jr z, .check2HKOMaxHp

    push hl
    push de
    push bc
	ld hl, BoostingMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .check2HKO
	jr .dontBoost
.check2HKO
	call CanAI2HKO
	jr c, .dontBoost
    call Random
    cp 25 percent + 1
    jr c, .dontBoost
	jr .boost
.check2HKOMaxHp
	call CanAI2HKOMaxHP
	jr c, .dontBoost
    call Random
    cp 25 percent + 1
    jr c, .dontBoost

.boost
    scf ; set carry flag
    ret
.dontBoost
    xor a ; clear carry flag
    ret

DoesEnemyHaveChoiceItem:
	push hl
	push de
	ld a, [wEnemyMonItem]
	ld [wNamedObjectIndex], a
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_CHOICE_BAND
	jr z, .yes
	cp HELD_CHOICE_SPECS
	jr z, .yes
	pop de
	pop hl
	xor a
	ret
.yes
	pop de
	pop hl
	scf
	ret

DoesEnemyHaveIntactFocusSashOrSturdy:
; Is the AI at full HP
    call AICheckEnemyMaxHP
    jr nc, .no

; focus sash
	push hl
	push de
	ld a, [wEnemyMonItem]
	ld [wNamedObjectIndex], a
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_FOCUS_BAND
	pop de
	pop hl
	jr z, .yes

; sturdy
    ld a, [wEnemyMonSpecies]
    push bc
    push hl
    push de
	ld hl, AI_SturdyPokemon
	ld de, 1
	call IsInArray
	pop de
	pop hl
	pop bc
	jr c, .yes

.no
    xor a ; clear carry flag
    ret
.yes
    scf
    ret

IsAIToxified:
    ld a, [wEnemyMonSpecies]
    push hl
    push de
   	push bc
   	ld hl, AI_MagicGuardPokemon
   	ld de, 1
   	call IsInArray
   	pop bc
   	pop de
   	pop hl
   	jr c, .no

    ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
    jr nz, .yes

.no
    xor a ; clear carry flag
    ret
.yes
    scf
    ret

; return carry if the player has a move that can 1HKO the AI Pokemon from current HP
; used to decide if the AI should use setup moves
CanPlayerKO:
    ld de, wBattleMonMoves ; load player moves
	ld b, NUM_MOVES + 1
.loopPlayerKOMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	and a
	jr z, .loopPlayerKOMoves ; skip moves with 0 power
    ld a, 0
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wEnemyMonHP + 1]
	cp c ; compare upper
	ld a, [wEnemyMonHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopPlayerKOMoves
; skip moves that can't be used on consecutive turns, except hyper beam
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopPlayerKOMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopPlayerKOMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopPlayerKOMoves
    scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the player has a move that can 2HKO the AI Pokemon from current HP
; used to decide if the AI should use setup moves
CanPlayer2HKO:
    ld de, wBattleMonMoves ; load player moves
	ld b, NUM_MOVES + 1
.loopPlayer2HKOMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	and a
	jr z, .loopPlayer2HKOMoves ; skip moves with 0 power
    ld a, 0
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; double current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	add hl, hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wEnemyMonHP + 1]
	cp c ; compare upper
	ld a, [wEnemyMonHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopPlayer2HKOMoves
; skip moves that can't be used on consecutive turns - exception for Porygonz which can use Hyper Beam consecutively
    ld a, [wBattleMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopPlayer2HKOMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopPlayer2HKOMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopPlayer2HKOMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopPlayer2HKOMoves
.setFlag
	scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the player has a move that can 2HKO the AI Pokemon from Max HP
; used to decide if the AI should use recovery moves
CanPlayer2HKOMaxHP:
    ld de, wBattleMonMoves ; load player moves
	ld b, NUM_MOVES + 1
.loopPlayer2HKOMaxHPMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	and a
	jr z, .loopPlayer2HKOMaxHPMoves ; skip moves with 0 power
    ld a, 0
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; double current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	add hl, hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wEnemyMonMaxHP + 1]
	cp c ; compare upper
	ld a, [wEnemyMonMaxHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopPlayer2HKOMaxHPMoves
; skip moves that can't be used on consecutive turns - exception for Porygonz which can use Hyper Beam consecutively
    ld a, [wBattleMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopPlayer2HKOMaxHPMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopPlayer2HKOMaxHPMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopPlayer2HKOMaxHPMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopPlayer2HKOMaxHPMoves
.setFlag
    scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the player has a move that can 3HKO the AI Pokemon from Max HP
; used to decide if the AI should use rest
CanPlayer3HKOMaxHP:
    ld de, wBattleMonMoves ; load player moves
	ld b, NUM_MOVES + 1
.loopPlayer3HKOMaxHPMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetPlayerMove
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	and a
	jr z, .loopPlayer3HKOMaxHPMoves ; skip moves with 0 power
    ld a, 0
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar PlayerAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; triple current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wEnemyMonMaxHP + 1]
	cp c ; compare upper
	ld a, [wEnemyMonMaxHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopPlayer3HKOMaxHPMoves
; skip moves that can't be used on consecutive turns - exception for Porygonz which can use Hyper Beam consecutively
    ld a, [wBattleMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopPlayer3HKOMaxHPMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopPlayer3HKOMaxHPMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopPlayer3HKOMaxHPMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopPlayer3HKOMaxHPMoves
.setFlag
	scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the AI has a move that can 1HKO the player Pokemon from current HP
CanAIKO:
    ld de, wEnemyMonMoves ; load player moves
	ld b, NUM_MOVES + 1
.loopAIKOMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .loopAIKOMoves ; skip moves with 0 power

    ld a, 1
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wBattleMonHP + 1]
	cp c ; compare upper
	ld a, [wBattleMonHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopAIKOMoves
; skip moves that can't be used on consecutive turns, except hyper beam
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopAIKOMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopAIKOMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopAIKOMoves
    scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the AI has a move that can 2HKO the player Pokemon from current HP
CanAI2HKO:
    ld de, wEnemyMonMoves ; load AI moves
	ld b, NUM_MOVES + 1
.loopMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .loopMoves ; skip moves with 0 power

    ld a, 1
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; double current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	add hl, hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wBattleMonHP + 1]
	cp c ; compare upper
	ld a, [wBattleMonHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopMoves
; skip moves that can't be used on consecutive turns, except hyper beam
    ld a, [wEnemyMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopMoves
.setFlag
    scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the AI has a move that can 2HKO the player Pokemon from current HP
CanAI2HKOMaxHP:
    ld de, wEnemyMonMoves ; load AI moves
	ld b, NUM_MOVES + 1
.loopMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .loopMoves ; skip moves with 0 power

    ld a, 1
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; double current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	add hl, hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wBattleMonMaxHP + 1]
	cp c ; compare upper
	ld a, [wBattleMonMaxHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopMoves
; skip moves that can't be used on consecutive turns, except hyper beam
    ld a, [wEnemyMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopMoves
.setFlag
    scf
    ret
.done
    xor a ; clear carry flag
    ret

; return carry if the AI has a move that can 3HKO the player Pokemon from current HP
CanAI3HKO:
    ld de, wEnemyMonMoves ; load AI moves
	ld b, NUM_MOVES + 1
.loopAI3HKOMoves
	dec b ; b is num moves on 1st pass
	jr z, .done ; if b is 0 return we are done
	ld a, [de] ; load the move
	and a
	jr z, .done ; return if no move
	inc de ; increment to next move
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .loopAI3HKOMoves ; skip moves with 0 power

    ld a, 1
	ldh [hBattleTurn], a
	push hl
	push de
	push bc
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
; triple current damage
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
; continue
	ld a, [wCurDamage + 1]
	ld c, a ; c is curDamage upper
	ld a, [wCurDamage]
	ld b, a ; b is curDamage lower
	ld a, [wBattleMonHP + 1]
	cp c ; compare upper
	ld a, [wBattleMonHP]
    sbc b ; compare lower and set flag
	pop bc
	pop de
	pop hl
    jp nc, .loopAI3HKOMoves
; skip moves that can't be used on consecutive turns, except hyper beam
; skip moves that can't be used on consecutive turns, except hyper beam
    ld a, [wEnemyMonSpecies]
    cp PORYGONZ
    jr z, .setFlag
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .loopAI3HKOMoves
	cp EFFECT_HYPER_BEAM
	jr z, .loopAI3HKOMoves
	cp EFFECT_SKY_ATTACK
	jr z, .loopAI3HKOMoves
	cp EFFECT_SOLARBEAM
	jr z, .loopAI3HKOMoves
.setFlag
    scf
    ret
.done
    xor a ; clear carry flag
    ret

DoesAIOutSpeedPlayer:
; lots of extra logic for the weather speed boosting abilities since they don't actually increase speed
    ld a, [wEnemyMonStatus]
	and 1 << PAR
	jp nz, .checkPlayer
    ld a, [wPlayerSpdLevel]
    cp BASE_STAT_LEVEL + 2
    jr nc, .checkPlayer

	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr nz, .checkSun
	ld a, [wEnemyMonSpecies]
	cp POLIWRATH
	jp z, .yes
	cp KINGDRA
	jp z, .yes
.checkSun
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .checkSand
	ld a, [wEnemyMonSpecies]
	cp VENUSAUR
	jr z, .yes
	cp EXEGGUTOR
	jr z, .yes
	cp VICTREEBEL
	jr z, .yes
.checkSand
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr nz, .checkPlayer
	ld a, [wEnemyMonSpecies]
	cp EXCADRILL
	jr z, .yes
	cp GOLEM
	jr z, .yes

.checkPlayer
    ld a, [wBattleMonStatus]
	and 1 << PAR
	jp nz, .speedCheck
    ld a, [wEnemySpdLevel]
    cp BASE_STAT_LEVEL + 2
    jr nc, .speedCheck

	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr nz, .checkSunPlayer
	ld a, [wBattleMonSpecies]
	cp POLIWRATH
	jr z, .no
	cp KINGDRA
	jr z, .no
.checkSunPlayer
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .checkSandPlayer
	ld a, [wBattleMonSpecies]
	cp VENUSAUR
	jr z, .no
	cp EXEGGUTOR
	jr z, .no
	cp VICTREEBEL
	jr z, .no
.checkSandPlayer
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr nz, .speedCheck
	ld a, [wBattleMonSpecies]
	cp EXCADRILL
	jr z, .no
	cp GOLEM
	jr z, .no

.speedCheck
; Return carry if enemy is faster than player.
	push bc
	ld a, [wEnemyMonSpeed + 1]
	ld b, a
	ld a, [wBattleMonSpeed + 1]
	cp b
	ld a, [wEnemyMonSpeed]
	ld b, a
	ld a, [wBattleMonSpeed]
	sbc b
	pop bc
	ret
.yes
    scf
    ret
.no
    xor a
    ret

AICheckPlayerMaxHP:
	push hl
	push de
	push bc
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	jr AICheckMaxHP

AICheckEnemyMaxHP:
	push hl
	push de
	push bc
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	; fallthrough

AICheckMaxHP:
; Return carry if hp at de matches max hp at hl.

	ld a, [de]
	inc de
	cp [hl]
	jr nz, .not_max

	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .not_max

	pop bc
	pop de
	pop hl
	scf
	ret

.not_max
	pop bc
	pop de
	pop hl
	and a
	ret

AICheckPlayerHalfHP:
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AICheckEnemyHalfHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckEnemyQuarterHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckPlayerQuarterHP:
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AIHasMoveEffect:
; Return carry if the enemy has move b.

	push hl
	ld hl, wEnemyMonMoves
	ld c, NUM_MOVES

.checkmove
	ld a, [hli]
	and a
	jr z, .no

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .yes

	dec c
	jr nz, .checkmove

.no
	pop hl
	and a
	ret

.yes
	pop hl
	scf
	ret

PlayerHasMoveEffect:
; Return carry if the player has move b.

	push hl
	ld hl, wBattleMonMoves
	ld c, NUM_MOVES

.checkmove
	ld a, [hli]
	and a
	jr z, .no

	call AIGetPlayerMove

	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .yes

	dec c
	jr nz, .checkmove

.no
	pop hl
	and a
	ret

.yes
	pop hl
	scf
	ret

AIHasMoveInArray:
; Return carry if the enemy has a move in array hl.

	push hl
	push de
	push bc

.next
	ld a, [hli]
	cp -1
	jr z, .done

	ld b, a
	ld c, NUM_MOVES + 1
	ld de, wEnemyMonMoves

.check
	dec c
	jr z, .next

	ld a, [de]
	inc de
	cp b
	jr nz, .check

	scf

.done
	pop bc
	pop de
	pop hl
	ret

StrongEncourage:
	dec [hl]
StandardEncourage:
    dec [hl]
    dec [hl]
    ret

StandardDiscourage:
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]
    ret

INCLUDE "data/battle/ai/useful_moves.asm"

; DevNote - this used to be AI_Opportunist
; this used to discourage 0 power moves if the player is below 1/4 hp
; that is no longer needed as AI_Basic now encourages any attack once it can KO the player
; this discourages most 0 power moves if the player can KO the AI
AI_Final_Attack:
; Discourage stall moves if the player can KO us
    call ShouldAIBoost
    ret nc

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	jr z, .done

	ld a, [de]
	inc de
	and a
	jr z, .done

	push hl
	push de
	push bc
	ld hl, StallMoves
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .checkmove

.done
	ret

INCLUDE "data/battle/ai/stall_moves.asm"


AI_Aggressive:
; discourage all damaging moves except the one that deals the most damage

; Figure out which attack does the most damage and put it in c.
	ld hl, wEnemyMonMoves
	ld bc, 0
	ld de, 0
.checkmove
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jp z, .gotstrongestmove

	ld a, [hli]
	and a
	jp z, .gotstrongestmove

	push hl
	push de
	push bc
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jp z, .nodamage
	call AIDamageCalc
	pop bc
	pop de
	pop hl

; Update current move if damage is highest so far

; don't encourage explosion
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr z, .checkmove

; don't encourage ground moves vs levitate Pokemon
; Dismiss ground move if the player has levitate
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	cp GROUND
	jr nz, .waterAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_LevitatePokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .checkmove

.waterAbsorb
    cp WATER
	jr nz, .voltAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_WaterAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .checkmove

.voltAbsorb
    cp ELECTRIC
	jr nz, .fireAbsorb
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_VoltAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .checkmove

.fireAbsorb
    cp ELECTRIC
	jr nz, .continue
	ld a, [wBattleMonSpecies]
	push hl
	push de
	push bc
	ld hl, AI_FireAbsorbPokemon
	ld de, 1
	call IsInArray
    pop bc
	pop de
	pop hl
    jp c, .checkmove

.continue
	ld a, [wCurDamage + 1]
	cp e
	ld a, [wCurDamage]
	sbc d
	jp c, .checkmove

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld c, b
	jp .checkmove

.nodamage
	pop bc
	pop de
	pop hl
	jp .checkmove

.gotstrongestmove
; Nothing we can do if no attacks did damage.
	ld a, c
	and a
	jr z, .done

; Discourage moves that do less damage unless they're reckless too.
	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, 0
.checkmove2
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jr z, .done

; Ignore this move if it is the highest damaging one.
	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .checkmove2

	call AIGetEnemyMove

; Ignore this move if its power is 0 or 1.
; Moves such as Seismic Toss, Hidden Power,
; Counter and Fissure have a base power of 1.
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	cp 2
	jr c, .checkmove2

; Ignore this move if it is reckless.
	;push hl
	;push de
	;push bc
	;ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	;ld hl, RecklessMoves
	;ld de, 1
	;call IsInArray
	;pop bc
	;pop de
	;pop hl
	;jr c, .checkmove2

; If we made it this far, discourage this move.
	inc [hl]
	jr .checkmove2

.done
	ret

INCLUDE "data/battle/ai/reckless_moves.asm"

AIDamageCalc:
	ld a, 1
	ldh [hBattleTurn], a
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, ConstantDamageEffects
	call IsInArray
	jr nc, .notconstant
	callfar BattleCommand_ConstantDamage
	ret

.notconstant
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ret

INCLUDE "data/battle/ai/constant_damage_effects.asm"

AI_Cautious:
    ret
; 90% chance to discourage moves with residual effects after the first turn.
;	ld a, [wEnemyTurnsTaken]
;	and a
;	ret z
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld c, NUM_MOVES + 1
;.loop
;	inc hl
;	dec c
;	ret z
;	ld a, [de]
;	inc de
;	and a
;	ret z
;	push hl
;	push de
;	push bc
;	ld hl, ResidualMoves
;	ld de, 1
;	call IsInArray
;	pop bc
;	pop de
;	pop hl
;	jr nc, .loop
;	call Random
;	cp 90 percent + 1
;	ret nc
;	inc [hl]
;	jr .loop

INCLUDE "data/battle/ai/residual_moves.asm"


AI_Status:
    ret
; Dismiss status moves that don't affect the player.
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld b, NUM_MOVES + 1
;.checkmove
;	dec b
;	ret z
;	inc hl
;	ld a, [de]
;	and a
;	ret z
;	inc de
;	call AIGetEnemyMove
;	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
;	cp EFFECT_TOXIC
;	jr z, .poisonimmunity
;	cp EFFECT_POISON
;	jr z, .poisonimmunity
;	cp EFFECT_SLEEP
;	jr z, .typeimmunity
;	cp EFFECT_PARALYZE
;	jr z, .typeimmunity
;	ld a, [wEnemyMoveStruct + MOVE_POWER]
;	and a
;	jr z, .checkmove
;	jr .typeimmunity
;.poisonimmunity
;	ld a, [wBattleMonType1]
;	cp POISON
;	jr z, .immune
;	ld a, [wBattleMonType2]
;	cp POISON
;	jr z, .immune
;.typeimmunity
;	push hl
;	push bc
;	push de
;	ld a, 1
;	ldh [hBattleTurn], a
;	callfar BattleCheckTypeMatchup
;	pop de
;	pop bc
;	pop hl
;	ld a, [wTypeMatchup]
;	and a
;	jr nz, .checkmove
;.immune
;	call AIDiscourageMove
;	jr .checkmove


AI_Risky:
    ret
; Use any move that will KO the target.
; Risky moves will often be an exception (see below).
;	ld hl, wEnemyAIMoveScores - 1
;	ld de, wEnemyMonMoves
;	ld c, NUM_MOVES + 1
;.checkmove
;	inc hl
;	dec c
;	ret z
;	ld a, [de]
;	inc de
;	and a
;	ret z
;	push de
;	push bc
;	push hl
;	call AIGetEnemyMove
;	ld a, [wEnemyMoveStruct + MOVE_POWER]
;	and a
;	jr z, .nextmove
; Don't use risky moves at max hp.
;	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
;	ld de, 1
;	ld hl, RiskyEffects
;	call IsInArray
;	jr nc, .checkko
;	call AICheckEnemyMaxHP
;	jr c, .nextmove
; Else, 80% chance to exclude them.
;	call Random
;	cp 79 percent - 1
;	jr c, .nextmove
;.checkko
;	call AIDamageCalc
;	ld a, [wCurDamage + 1]
;	ld e, a
;	ld a, [wCurDamage]
;	ld d, a
;	ld a, [wBattleMonHP + 1]
;	cp e
;	ld a, [wBattleMonHP]
;	sbc d
;	jr nc, .nextmove
;	pop hl
;rept 5
;	dec [hl]
;endr
;	push hl
;.nextmove
;	pop hl
;	pop bc
;	pop de
;	jr .checkmove

INCLUDE "data/battle/ai/risky_effects.asm"


AI_None:
	ret

AIDiscourageMove:
	ld a, [hl]
	add 10
	ld [hl], a
	ret

AIGetEnemyMove:
; Load attributes of move a into ram

	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes

	pop bc
	pop de
	pop hl
	ret

AIGetPlayerMove:
; Load attributes of move a into ram

	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld de, wPlayerMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes

	pop bc
	pop de
	pop hl
	ret

; return carry if players Attack is higher than Special Attack
IsPlayerPhysicalOrSpecial:
    ; compare high bytes
	push bc
	ld a, [wBattleMonAttack]
	ld b, a
	ld a, [wBattleMonSpclAtk]
	cp b
	pop bc
	jr c, .yes ; attack high byte is bigger
	jr nz, .no ; spclAtk high byte is bigger

    ; here both high bytes are the same so check low byte
	push bc
	ld a, [wBattleMonAttack + 1]
	ld b, a
	ld a, [wBattleMonSpclAtk + 1]
	cp b
	pop bc
	jr c, .yes ; attack bigger than special attack

.no
    xor a
    ret
.yes
    scf
    ret

IsAttackMaxed:
    ld a, [wEnemyAtkLevel]
    cp BASE_STAT_LEVEL + 6
    jr z, .yes

    ld a, [wEnemyMonAttack + 1]
    sub LOW(MAX_STAT_VALUE)
	jr nz, .no
	ld a, [wEnemyMonAttack]
	sbc HIGH(MAX_STAT_VALUE)
	jr z, .yes
.no
    xor a
    ret
.yes
    scf
    ret

IsDefenseMaxed:
    ld a, [wEnemyDefLevel]
    cp BASE_STAT_LEVEL + 6
    jr z, .yes

    ld a, [wEnemyMonDefense + 1]
    sub LOW(MAX_STAT_VALUE)
	jr nz, .no
	ld a, [wEnemyMonDefense]
	sbc HIGH(MAX_STAT_VALUE)
	jr z, .yes
.no
    xor a
    ret
.yes
    scf
    ret

IsSpecialAttackMaxed:
    ld a, [wEnemySAtkLevel]
    cp BASE_STAT_LEVEL + 6
    jr z, .yes

    ld a, [wEnemyMonSpclAtk + 1]
    sub LOW(MAX_STAT_VALUE)
	jr nz, .no
	ld a, [wEnemyMonSpclAtk]
	sbc HIGH(MAX_STAT_VALUE)
	jr z, .yes
.no
    xor a
    ret
.yes
    scf
    ret

IsSpecialDefenseMaxed:
    ld a, [wEnemySDefLevel]
    cp BASE_STAT_LEVEL + 6
    jr z, .yes

    ld a, [wEnemyMonSpclDef + 1]
    sub LOW(MAX_STAT_VALUE)
	jr nz, .no
	ld a, [wEnemyMonSpclDef]
	sbc HIGH(MAX_STAT_VALUE)
	jr z, .yes
.no
    xor a
    ret
.yes
    scf
    ret

IsPowerfulPriorityUser:
	ld b, EFFECT_PRIORITY_HIT
	call PlayerHasMoveEffect
	jr nc, .no
    ld a, [wBattleMonSpecies]
    cp SCIZOR
    jr z, .check2HKO
    cp HONCHKROW
    jr z, .check2HKO
    cp KINGAMBIT
    jr z, .check2HKO
    jr .no
.check2HKO
    call CanPlayer2HKO
    jr z, .yes
.no
    xor a
    ret
.yes
    scf
    ret

AI_80_20:
	call Random
	cp 20 percent - 1
	ret

AI_50_50:
	call Random
	cp 50 percent + 1
	ret

; ============================================
; ====== EFFECT COMMAND EXCESS FUNCTIONS =====
; ============================================
; These are functions used in effect_commands.asm
; they are defined here as that file is out of space

Levitate:
    ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	jr nz, .checkType
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
.checkType
	and TYPE_MASK
	cp GROUND
	jr z, .getPokemon
	ret
.getPokemon
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .checkLevitate
	ld a, [wBattleMonSpecies]
.checkLevitate
	ld hl, AI_LevitatePokemon
	ld de, 1
	call IsInArray
    jr c, .found
    ret
.found
	ld hl, LevitateText
	call StdBattleTextbox
    ret z

WaterAbsorb:
    ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	jr nz, .checkType
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
.checkType
	and TYPE_MASK
	cp WATER
	jr z, .getPokemon
	ret
.getPokemon
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .check
	ld a, [wBattleMonSpecies]
.check
	ld hl, AI_WaterAbsorbPokemon
	ld de, 1
	call IsInArray
    jr c, .found
    ret
.found
	ld hl, ElementAbsorbText
	call StdBattleTextbox
    ret z

VoltAbsorb:
    ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	jr nz, .checkType
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
.checkType
	and TYPE_MASK
	cp ELECTRIC
	jr z, .getPokemon
	ret
.getPokemon
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .check
	ld a, [wBattleMonSpecies]
.check
	ld hl, AI_VoltAbsorbPokemon
	ld de, 1
	call IsInArray
    jr c, .found
    ret
.found
	ld hl, ElementAbsorbText
	call StdBattleTextbox
    ret z

FireAbsorb:
    ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	jr nz, .checkType
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
.checkType
	and TYPE_MASK
	cp FIRE
	jr z, .getPokemon
	ret
.getPokemon
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .check
	ld a, [wBattleMonSpecies]
.check
	ld hl, AI_FireAbsorbPokemon
	ld de, 1
	call IsInArray
    jr c, .found
    ret
.found
	ld hl, ElementAbsorbText
	call StdBattleTextbox
    ret z

DreamEaterMiss:
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret

ProtectMiss:
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z
	ld c, 40
	call DelayFrames
; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextbox
	ld c, 40
	call DelayFrames
	ld a, 1
	and a
	ret

LockOnMiss:
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	jr z, .LockedOn
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret z
.LockedOn:
	ld a, 1
	and a
	ret

FlyDigMovesMiss:
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z
	bit SUBSTATUS_FLYING, a
	jr z, .DigMoves
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp GUST
	ret z
	cp WHIRLWIND
	ret z
	cp THUNDER
	ret z
	cp OBLITERATE
	ret z
	ret
.DigMoves:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret

ThunderRain:
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	jr z, .checkRain
	cp EFFECT_HURRICANE
	jr z, .checkRain
	ret
.checkRain
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

XAccuracy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret

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
	set SCREENS_SPIKES, [hl]
    ld a, [wBattleHasJustStarted]
    and a
    jr nz, .skipAnim
    ld de, SPIKES
	farcall Call_PlayBattleAnim
.skipAnim
	ld hl, SpikesText
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
    ld a, [wBattleHasJustStarted]
    and a
    jr nz, .skipAnim
    ld de, REFLECT
	farcall Call_PlayBattleAnim
.skipAnim
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
    ld a, [wBattleHasJustStarted]
    and a
    jr nz, .skipAnim
    ld de, LIGHT_SCREEN
	farcall Call_PlayBattleAnim
.skipAnim
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
    ld a, [wBattleHasJustStarted]
    and a
    jr nz, .skipAnim
    ld de, SAFEGUARD
	farcall Call_PlayBattleAnim
.skipAnim
    ld hl, CoveredByVeilText
	jp StdBattleTextbox

ClearField:
; clear enemy field of screens
	ld a, 1
	ld [wWeatherCount], a
	ld hl, wPlayerScreens
	ld bc, wPlayerSafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr nz, .gotScreens
	ld hl, wEnemyScreens
	ld bc, wEnemySafeguardCount
.gotScreens
	ld a, 1
	ld [bc], a
	inc bc
	ld [bc], a
	inc bc
	ld [bc], a

; clear user field of spikes
	ld hl, wPlayerScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .gotSpikesScreen
	ld hl, wEnemyScreens
.gotSpikesScreen
	res SCREENS_SPIKES, [hl]

; print text
	ld hl, ClearFieldText
	jp StdBattleTextbox

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

CheckUnownLetter:
; Return carry if the Unown letter hasn't been unlocked yet
	ld a, [wUnlockedUnowns]
	ld c, a
	ld de, 0
.loop
; Don't check this set unless it's been unlocked
	srl c
	jr nc, .next
; Is our letter in the set?
	ld hl, UnlockedUnownLetterSets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	ld a, [wUnownLetter]
	ld de, 1
	push bc
	call IsInArray
	pop bc
	pop de
	jr c, .match
.next
; Make sure we haven't gone past the end of the table
	inc e
	inc e
	ld a, e
	cp UnlockedUnownLetterSets.End - UnlockedUnownLetterSets
	jr c, .loop
; Hasn't been unlocked, or the letter is invalid
	scf
	ret
.match
; Valid letter
	and a
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
