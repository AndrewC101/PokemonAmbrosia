BattleCommand_StealthRock:
; spikes

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if spikes are already down!

	bit SCREENS_STEALTH_ROCK, [hl]
	jr nz, .failed

	set SCREENS_STEALTH_ROCK, [hl]

	call AnimateCurrentMove
	ld hl, StealthRockText
	jp StdBattleTextbox

.failed
	jp FailMove
