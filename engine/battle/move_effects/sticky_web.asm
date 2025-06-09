BattleCommand_StickyWeb:
; sticky web

	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if spikes are already down!

	bit SCREENS_STICKY_WEB, [hl]
	jr nz, .failed

	set SCREENS_STICKY_WEB, [hl]

	call AnimateCurrentMove
	ld hl, StickyWebText
	jp StdBattleTextbox

.failed
	jp FailMove
