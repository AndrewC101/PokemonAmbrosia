BattleCommand_SuckerPunch:
	call CheckOpponentWentFirst
	jr nz, .failed

	; Now we know that the opponent did pick a move
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	push af
	call BattleCommand_SwitchTurn
	pop af
	and a
	ret nz
.failed
	call AnimateFailedMove
	call TryPrintButItFailed
	jp EndMoveEffect
