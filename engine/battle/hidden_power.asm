HiddenPowerDamage:
; Override Hidden Power's type and power based on the user's DVs.

	ld hl, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, wEnemyMonDVs
.got_dvs

; Power:
; DevNote -Unown has 140 bp hidden power
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr nz, .gotUserSpecies
	ld a, [wBattleMonSpecies]
.gotUserSpecies
    cp UNOWN
    jr z, .unown
    ld a, 70 ; 70 power usually
    jr .gotPower
.unown
    ld a, 140 ; 140 power for UNOWN
.gotPower
    ld d, a


; Type:
; perfect dvs gives UBER hp type
    ld a, [hli]
    cp $FF
    jr nz, .notPerfect
    ld a, [hl]
    cp $FF
    jr nz, .notPerfect
    ld a, UBER
    jr .done
.notPerfect

	; Def & 3
	ld a, [hl]
	and %0011
	ld b, a
	; + (Atk & 3) << 2
	ld a, [hl]
	and %0011 << 4
	swap a
	add a
	add a
	or b
; Skip Normal
	inc a
; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add UNUSED_TYPES_END - UNUSED_TYPES
.done

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	and TYPE_MASK
	ld [hl], a

; Get the rest of the damage formula variables
; based on the new type, but keep base power.
	ld a, d
	push af
	farcall BattleCommand_DamageStats ; damagestats
	pop af
	ld d, a
	ret
