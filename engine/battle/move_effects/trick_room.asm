BattleCommand_TrickRoom:

	farcall AnimateCurrentMove

; BattleCommand_TrickRoomHit:
; If Trick Room is not up, set Trick Room for 5 turns.
	ld hl, wTrickRoomCount
	ld a, [hl]
	and a
	jr z, .new_trick_room

; If Trick Room is already up, remove Trick Room.
	ld [hl], 0
	ld hl, TrickRoomEndedText
	jp StdBattleTextbox

.new_trick_room
	ld [hl], 5
	ld hl, TrickRoomText
	jp StdBattleTextbox
