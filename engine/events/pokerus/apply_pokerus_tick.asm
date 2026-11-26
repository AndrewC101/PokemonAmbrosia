ApplyPokerusTick:
	ld hl, wPartyMon1PokerusStatus ; wPartyMon1 + MON_PKRS
	ld a, [wPartyCount]
	and a
	ret z ; make sure it's not wasting time on an empty party
	ld c, a
.loop
	ld a, [hl]
	and MON_POKERUS_MASK
	jr z, .next
	cp MON_POKERUS_CURED
	jr nc, .next
	sub b ; subtract the number of days
	jr z, .cured
	jr nc, .ok
.cured
	ld a, MON_POKERUS_CURED
.ok
	ld d, a
	ld a, [hl]
	and ~MON_POKERUS_MASK
	or d
	ld [hl], a
.next
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
