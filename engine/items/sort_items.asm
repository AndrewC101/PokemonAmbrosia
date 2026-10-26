SortItemsInBag:
	ld hl, wNumItems
	ld c, 2
	ld a, [wCurPocket]
	and a
	jr z, .ready
	dec a
	ld hl, wNumBalls
	jr z, .ready
	dec a
	ret nz
	ld hl, wNumKeyItems
	ld c, 1
.ready
	ld a, [hli]
	cp 2
	ret c
	ld b, a
	dec b

.pass
	push bc
	push hl
	ld d, 0
.pair
	push bc
	push de
	push hl
	call .CompareAndSwap
	pop hl
	pop de
	pop bc
	jr nc, .next
	ld d, 1
.next
	ld a, c
.advance
	inc hl
	dec a
	jr nz, .advance
	dec b
	jr nz, .pair
	pop hl
	pop bc
	ld a, d
	and a
	jr nz, .pass
	ret

.CompareAndSwap
	ld b, [hl]
	ld a, b
	call .GetRank
	ld d, a
	ld a, c
.find_next
	inc hl
	dec a
	jr nz, .find_next
	ld e, [hl]
	ld a, e
	call .GetRank
	cp d
	jr c, .swap
	ret nz
	ld a, e
	cp b
	ret nc

.swap
	push hl
	ld a, c
.find_previous
	dec hl
	dec a
	jr nz, .find_previous
	pop de
	ld b, c
.swap_byte
	ld a, [de]
	ld c, [hl]
	ld [hli], a
	ld a, c
	ld [de], a
	inc de
	dec b
	jr nz, .swap_byte
	scf
	ret

.GetRank
	push hl
	push bc
	ld l, a
	ld h, 0
	ld bc, ItemSortRanks
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

INCLUDE "data/items/sort_order.asm"
