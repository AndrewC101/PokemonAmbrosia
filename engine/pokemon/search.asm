BeastsCheck:
; Check if the player has caught all three legendary beasts.
; Return the result in wScriptVar.

	ld de, EVENT_CAUGHT_RAIKOU
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .notexist

	ld de, EVENT_CAUGHT_ENTEI
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .notexist

	ld de, EVENT_CAUGHT_SUICUNE
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .notexist

	; they exist
	ld a, 1
	ld [wScriptVar], a
	ret

.notexist
	xor a
	ld [wScriptVar], a
	ret

MonCheck:
; Check if the player owns any Pokémon of the species in wScriptVar.
; Return the result in wScriptVar.
; Static encounter scripts only need the caught-dex flag, not a full storage scan.

	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	jr nz, .exists

	; doesn't exist
	xor a
	ld [wScriptVar], a
	ret

.exists
	ld a, 1
	ld [wScriptVar], a
	ret

CheckOwnMonAnywhere:
; Check if the player owns any monsters of the species in wScriptVar.
; It must exist in either party or PC, and have the player's trainer ID.
;
; NewBox makes the full storage scan expensive, so bail out early when the
; species is not even marked as caught in the dex. If it is caught, we still
; do the ownership scan to reject traded mons or species the player no longer has.

	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret z

	ld b, NUM_BOXES
.outer_loop
	inc b
	dec b
	ld c, PARTY_LENGTH
	jr z, .loop
	ld c, MONS_PER_BOX
.loop
	newfarcall GetStorageBoxMon
	jr z, .next

	; Check if the species is correct
	ld hl, wBufferMonAltSpecies
	ld a, [wScriptVar]
	cp [hl]
	jr nz, .next

	; Verify ID
	ld hl, wBufferMonID
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .next
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	jr nz, .next

	scf
	ret
.next
	dec c
	jr nz, .loop
	dec b
	bit 7, b ; check for reaching -1
	jr z, .outer_loop
	; Failed to find a matching mon
	xor a
	ret

UpdateOTPointer:
	push hl
	ld hl, NAME_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret
