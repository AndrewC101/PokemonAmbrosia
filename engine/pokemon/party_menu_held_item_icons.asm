DEF PARTY_MENU_MAIL_TILE EQU $5e
DEF PARTY_MENU_ITEM_TILE EQU $5f
DEF PARTY_MENU_HELD_ITEM_PAL EQU HP_RED + 1

LoadPartyMenuHeldItemIconGFX:
	ld de, PartyMenuMailIconGFX
	ld hl, vTiles2 tile PARTY_MENU_MAIL_TILE
	lb bc, BANK(PartyMenuMailIconGFX), 1
	call .LoadTile
	ld de, HeldItemIcons + 1 tiles ; regular held-item marker
	ld hl, vTiles2 tile PARTY_MENU_ITEM_TILE
	lb bc, BANK(HeldItemIcons), 1
	; fallthrough

.LoadTile
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bppViaHDMA

PartyMenuMailIconGFX:
	; Skip the original top row and repeat its blank bottom row, moving
	; the envelope up one pixel without changing the shared mail asset.
	INCBIN "gfx/stats/mail.2bpp", 2, 14
	INCBIN "gfx/stats/mail.2bpp", 14, 2

PlacePartyMenuHeldItemIcons:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a ; remaining party slots
	ld b, 0 ; current party slot
	hlcoord 3, 2

.loop
	push bc
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Item
	call AddNTimes
	ld a, [hl]
	and a
	jr z, .next

	ld d, a
	callfar ItemIsMail
	ld a, PARTY_MENU_MAIL_TILE
	jr c, .got_tile
	ld a, PARTY_MENU_ITEM_TILE

.got_tile
	pop hl
	ld [hl], a
	push hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld [hl], PARTY_MENU_HELD_ITEM_PAL

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop

	; Attribute maps only exist on CGB. Apply after every redraw so item
	; changes and party switches cannot leave a stale marker palette.
	ldh a, [hCGB]
	and a
	ret z
	farcall ApplyAttrmap
	ret
