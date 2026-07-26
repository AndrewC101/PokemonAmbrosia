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
	newfarjp RefreshOverworldTMHMIconPalette

.regular_item
	newfarjp RefreshOverworldItemIconPalette
