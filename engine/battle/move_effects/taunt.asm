BattleCommand_Taunt:
; taunt
	ld a, [wEffectFailed] ; fail if uber enemy
	and a
	jp nz, .failed

; are we dealing with enemy or player
    ldh a, [hBattleTurn]
	and a
	jr z, .enemy

	ld a, [wPlayerTauntCount]
    and a
    jr nz, .failed
    ld a, 3
    ld [wPlayerTauntCount], a
	jr .finish
.enemy
	ld a, [wEnemyTauntCount]
    and a
    jr nz, .failed
    ld a, 3
    ld [wEnemyTauntCount], a

.finish
	call AnimateCurrentMove
	ld hl, GotTauntedText
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2
