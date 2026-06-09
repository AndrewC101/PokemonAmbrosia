OW_CheckLvlUpMoves::
; move looking for in a
	ld d, a
	ld a, [wCurPartySpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	ld b, a
	call GetFarWord
	ld a, b
	call GetFarByte
	inc hl
	and a
	jr z, .find_move ; no evolutions
	dec hl ; does have evolution(s)
	call .SkipEvolutions
.find_move
	call .GetNextEvoAttackByte
	and a
	jr z, .notfound ; end of mon's lvl up learnset
	call .GetNextEvoAttackByte
	cp d
	jr z, .found
	jr .find_move
.found
	xor a
	ret ; move is in lvl up learnset
.notfound
	scf ; move isnt in lvl up learnset
	ret

.SkipEvolutions
; Receives a pointer to the evos and attacks, and skips to the attacks.
	ld a, b
	call GetFarByte
	inc hl
	and a
	ret z
	cp EVOLVE_STAT
	jr nz, .no_extra_skip
	inc hl
.no_extra_skip
	inc hl
	inc hl
	jr .SkipEvolutions

.GetNextEvoAttackByte
	ld a, BANK(EvosAttacksPointers)
	call GetFarByte
	inc hl
	ret
