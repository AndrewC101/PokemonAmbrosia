PlacePokegearMapName::
; Copy at most the 18 visible tiles between the clock-page borders.
; b holds the source bank, hl the source, de the buffer cursor, and c the
; remaining on-screen width. Some map-name characters expand in PlaceString.
	ld b, BANK(MapGroupNum_Names)
	ld h, d
	ld l, e
	ld de, wStringBuffer1
	ld c, 18
.copy
	ld a, b
	call GetFarByte
	cp "@"
	jr z, .done
	ld [de], a
	ld a, c
	and a
	jr z, .clip_previous
	ld a, [de]
	cp "<PKMN>"
	jr z, .two_tiles
	cp "<POKE>"
	jr z, .two_tiles
	cp "#"
	jr z, .four_tiles
	dec c
	jr .copied

.two_tiles
	ld a, c
	cp 2
	jr c, .clip_current
	sub 2
	ld c, a
	jr .copied

.four_tiles
	ld a, c
	cp 4
	jr c, .clip_current
	sub 4
	ld c, a

.copied
	inc de
	inc hl
	jr .copy

.clip_current
	; Use the last available tile for an ellipsis instead of a partial token.
	dec c
	ld a, "…"
	ld [de], a
	inc de
	jr .done

.clip_previous
	; The row is full and more text follows; replace its final encoded element.
	dec de
	ld a, "…"
	ld [de], a
	inc de

.done
	ld a, "@"
	ld [de], a
	hlcoord 1, 8
	ld a, c
	and a
	jr z, .place
	inc hl
.place
	ld de, wStringBuffer1
	call PlaceString
	ret
