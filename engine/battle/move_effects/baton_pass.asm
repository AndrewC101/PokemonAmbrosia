BattleCommand_BatonPass:
; batonpass

	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedBatonPass

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetBatonPassStatus
	ret

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jp z, FailedBatonPass

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; DevNote - baton pass - logic for enemy ai revamped
; enemy AI will treat Pokemon in index 2 as dedicated recipients, unless in battle tower

; if in battle tower just clear recipient index
    ld a, [wInBattleTowerBattle]
	and a
	jr z, .notBattleTower
    xor a
    ld [wEnemySwitchMonIndex], a
    jr .skip

.notBattleTower
; default baton pass recipient to mon in index 2 (2nd mon in party)
    ld a, 2
    ld [wEnemySwitchMonIndex], a

; Check if mon at index 2 is already fainted, clear recipient index if so
    ld hl, wOTPartyMon1HP
    push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
    ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr nz, .skip
    xor a
    ld [wEnemySwitchMonIndex], a

; =================== old code ===============
; this was used to set mon at indices 2, 4, 6 as dedicated recipients
; but while this works it wasn't very impactful in practice

; loop through party and check for fainted mon
;	ld a, [wOTPartyCount]
;	ld c, a ; c is the party counter
;	ld hl, wOTPartyMon1HP
;	ld d, 0
;.SwitchLoop:
;    inc d ; d is the current mon index
;	ld a, [hli]
;	ld b, a
;	ld a, [hld]
;	or b
;	jr nz, .continue
; here the mon in index d is fainted
; check if current Mon index 2
;    ld a, d
;    cp 2
;    jr nz, .checkFour
; check if recipient index is currently 2
;    ld a, [wEnemySwitchMonIndex]
;    cp 2
;    jr nz, .checkFour
; check if enemy party size is 4 or greater
;    ld a, [wOTPartyCount]
;    cp 4
;    jr nc, .incrementRecipientIndex
;    jr .clearRecipientIndex
; check if current mon index is 4
;.checkFour
;    cp 4
;    jr nz, .checkSix
; check if recipient index is currently 4
;    ld a, [wEnemySwitchMonIndex]
;    cp 4
;    jr nz, .checkSix
; check if enemy party size is 6
;    ld a, [wOTPartyCount]
;    cp 6
;    jr z, .incrementRecipientIndex
;    jr .clearRecipientIndex
;.incrementRecipientIndex
;    ld a, [wEnemySwitchMonIndex]
;    inc a
;    inc a
;    ld [wEnemySwitchMonIndex], a
;    jr .continue
;.checkSix
;    cp 6
;    jr nz, .continue
;.clearRecipientIndex
;    xor a
;    ld [wEnemySwitchMonIndex], a
;.continue
;	push bc
;	ld bc, PARTYMON_STRUCT_LENGTH
;	add hl, bc
;	pop bc
;	dec c
;	jr nz, .SwitchLoop
; ==============================================

.skip
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

; DevNote - switch in effects on baton pass
	ld hl, SwitchInEffects
	call CallBattleCore

	jr ResetBatonPassStatus

BatonPass_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

BatonPass_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jr c, .switch

.baton_pass
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow

FailedBatonPass:
	call AnimateFailedMove
	jp PrintButItFailed

ResetBatonPassStatus:
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wPlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	;res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a

	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret
