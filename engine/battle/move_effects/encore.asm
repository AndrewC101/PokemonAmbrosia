BattleCommand_Encore:
; encore
	ld a, [wEffectFailed] ; fail if uber enemy
	and a
	jp nz, .failed

; are we dealing with enemy or player
	ld hl, wEnemyMonMoves
	ld de, wEnemyEncoreCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMoves
	ld de, wPlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, .failed ; if there was no last move encore fails
	cp STRUGGLE
	jp z, .failed
	cp ENCORE
	jp z, .failed
	ld b, a ; b is the last move

.got_move
	ld a, [hli] ; a is the first move of the victim
	cp b ; is this the last move used?
	jr nz, .got_move ; keep going until we are at the move we want to encore

	ld bc, wBattleMonPP - wBattleMonMoves - 1
	add hl, bc ; hl is the current pp of the victims moves
	ld a, [hl] ; a is the pp of the first move
	and PP_MASK
	jp z, .failed ; if the move is out of pp encore fails
	ld a, [wAttackMissed]
	and a
	jp nz, .failed ; if the attack missed encore fails
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl] ; get the enemy encore bit
	jp nz, .failed ; if enemy is already encored this fails
	set SUBSTATUS_ENCORED, [hl] ; set the encore bit
	call BattleRandom
	and $3 ; generate a random number from 0-3
	inc a
	inc a
	inc a ; increment substatus5
	ld [de], a
	call CheckOpponentWentFirst
	jr nz, .finish_move ; if enemy moved first we are done
	ldh a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move ; go here if player used encore first

; here the player moved first and the enemy then used encore
	push hl
	ld a, [wLastPlayerMove]
	ld b, a ; b is players last move
	ld c, 0
	ld hl, wBattleMonMoves ; hl is player moves
.find_player_move
	ld a, [hli] ; get the first move
	cp b ; is it the move we want to encore
	jr z, .got_player_move ; if so jump
	inc c ; c is now 1 on first loop
	ld a, c ; a is now 1 on first loop
	cp NUM_MOVES ; does player only have one move
	jr c, .find_player_move ; keep going until we have the move to encore
	pop hl
	res SUBSTATUS_ENCORED, [hl] ; if we never find it then remove encore
	xor a
	ld [de], a
	jr .failed ; encore failed

.got_player_move
	pop hl
	ld a, c
	ld [wCurMoveNum], a
	ld a, b
	ld [wCurPlayerMove], a
	dec a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	ld a, [wLastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, wEnemyMonMoves
.find_enemy_move
	ld a, [hli]
	cp b
	jr z, .got_enemy_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_enemy_move
	pop hl
	ld a, c
	ld [wCurEnemyMoveNum], a
	ld a, b
	ld [wCurEnemyMove], a
	dec a
	ld de, wEnemyMoveStruct
	call GetMoveData

.finish_move
	call AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2
