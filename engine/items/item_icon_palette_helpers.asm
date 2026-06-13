RefreshMartItemIconPaletteByItem::
	ld a, [wCurItem]
	cp TM01
	jr c, .regular_item
	cp ITEM_FA
	jr nc, .regular_item
	sub TM01 - 1
	ld [wTempTMHM], a
	predef GetTMHMMove
	newfarjp RefreshPackTMHMIconPalette

.regular_item
	newfarjp RefreshPackItemIconPalette

RefreshOverworldItemIconPaletteByItem::
	ld a, [wCurItem]
	cp TM01
	jr c, .regular_item
	cp ITEM_FA
	jr nc, .regular_item
	sub TM01 - 1
	ld [wTempTMHM], a
	predef GetTMHMMove
	jr RefreshOverworldTMHMIconPalette

.regular_item
	newfarjp RefreshOverworldItemIconPalette

RefreshOverworldTMHMIconPalette:
	ldh a, [hCGB]
	and a
	ret z
	farcall LoadTMHMIconPalette
	hlcoord 16, 13, wAttrmap
	lb bc, 3, 3
	ld a, 7
	farcall FillBoxCGB
	farcall ApplyAttrmap
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	jp UpdatePalsIfCGB
