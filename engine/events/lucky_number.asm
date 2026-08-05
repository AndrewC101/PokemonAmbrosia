CheckForLuckyNumberWinners:
; Retired compatibility stub. The old Lucky Number game scanned all party and
; storage mons; the Radio Tower NPC now uses a local 1-10 guessing game.
	xor a
	ld [wScriptVar], a
	ret

PrintTodaysLuckyNumber:
; Retired compatibility stub.
	ret
