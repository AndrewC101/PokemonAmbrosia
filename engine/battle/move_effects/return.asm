BattleCommand_HappinessPower:
; happinesspower
	push bc
	ld hl, wBattleMonHappiness
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHappiness
.ok
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, 10
	ldh [hMultiplier], a
	call Multiply
	ld a, 25
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	and a
	jr nz, .done
	inc a
.done
	ld d, a
	; Keep the live move struct in sync with the resolved Return power so
	; later checks like Technician do not read the stored placeholder power 1.
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerMoveStruct + MOVE_POWER
	jr z, .store_power
	ld hl, wEnemyMoveStruct + MOVE_POWER
.store_power
	ld a, d
	ld [hl], a
	pop bc
	ret
