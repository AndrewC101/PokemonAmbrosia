DEF MENU_ITEM_ICON_TILE EQU $60
DEF OVERWORLD_ITEM_ICON_TILE EQU $6d

UpdatePackItemIconAndDescription:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	ld [wCurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	jr z, .load_icon
	push af
	decoord 1, 14
	farcall PrintItemDescription
	pop af

.load_icon
	call LoadMenuItemIcon
	call PlacePackItemIcon
	farcall RefreshPackItemIconPalette
	ret

UpdateMartItemIconAndDescription:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	ld [wCurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	jr z, .load_icon
	push af
	decoord 5, 14
	farcall PrintItemDescription
	pop af

.load_icon
	call LoadMenuItemIcon
	call PlaceTextboxItemIcon
	farcall RefreshTextboxItemIconPalette
	ret

ShowTextboxTMHMIcon::
	call LoadTMHMIcon
	call PlaceTextboxItemIcon
	farcall RefreshTextboxTMHMIconPalette
	ret

ClearTextboxTMHMIcon::
	call ClearTMHMIcon
	call PlaceTextboxItemIcon
	farcall RefreshTextboxTMHMIconPalette
	ret

ShowPackTMHMIcon::
	call LoadTMHMIcon
	call PlacePackItemIcon
	farcall RefreshPackTMHMIconPalette
	ret

ClearPackTMHMIcon::
	call ClearTMHMIcon
	call PlacePackItemIcon
	farcall RefreshPackTMHMIconPalette
	ret

LoadMenuItemIcon:
; a = selected item id; TM/HM ids use the shared TM/HM icon.
	inc a
	jr z, .no_item
	dec a
	cp TM01
	jr nc, .check_tmhm
	ld c, a
	ld b, 0
	ld hl, ItemIconPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, 9
	ld de, vTiles2 tile MENU_ITEM_ICON_TILE
	jp DecompressRequest2bpp

.check_tmhm
	cp ITEM_FA
	jr c, .tmhm
	jr .no_item

.no_item
	xor a
	jr LoadMenuItemIcon

.tmhm
LoadTMHMIcon::
	ld hl, TMHMIcon
	lb bc, BANK(TMHMIcon), 9
	ld de, vTiles2 tile MENU_ITEM_ICON_TILE
	jp DecompressRequest2bpp

ClearTMHMIcon::
	ld hl, NoItemIcon
	lb bc, BANK(NoItemIcon), 9
	ld de, vTiles2 tile MENU_ITEM_ICON_TILE
	jp DecompressRequest2bpp

PlacePackItemIcon:
; Replace the 5x3 pocket label block with the selected item's icon.
	hlcoord 0, 7
	lb bc, 3, 5
	call ClearBox
	hlcoord 1, 7
	ld a, MENU_ITEM_ICON_TILE
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_WIDTH - 2
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

PlaceTextboxItemIcon:
; The icon sits inside the existing item description box.
	hlcoord 1, 13
	ld a, MENU_ITEM_ICON_TILE
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_WIDTH - 2
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

LoadItemIconForOverworld::
; Draw the current item into a textbox-safe tile block.
	ld a, [wCurItem]
	inc a
	jr z, .no_item
	dec a
	cp TM01
	jr nc, .check_tmhm
	ld c, a
	ld b, 0
	ld hl, ItemIconPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, 9
	ld de, vTiles1 tile OVERWORLD_ITEM_ICON_TILE
	jp DecompressRequest2bpp

.check_tmhm
	cp ITEM_FA
	jr c, .tmhm

.no_item
	ld hl, NoItemIcon
	lb bc, BANK(NoItemIcon), 9
	ld de, vTiles1 tile OVERWORLD_ITEM_ICON_TILE
	jp DecompressRequest2bpp

.tmhm
	ld hl, TMHMIcon
	lb bc, BANK(TMHMIcon), 9
	ld de, vTiles1 tile OVERWORLD_ITEM_ICON_TILE
	jp DecompressRequest2bpp

PlaceOverworldItemIcon::
	hlcoord 16, 13
	ld a, $ed
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	ld a, $f0
	hlcoord 16, 14
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	ld a, $f3
	hlcoord 16, 15
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

PlaceOverworldReceivedItemIcon::
	hlcoord 1, 14
	ld a, $ed
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $f0
	hlcoord 1, 15
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $f3
	hlcoord 1, 16
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

ShowCurrentItemIconScriptHelper::
	call LoadItemIconForOverworld
	call PlaceOverworldItemIcon
	call ApplyTilemap
	farcall RefreshOverworldItemIconPalette
	ret

ShowReceivedItemIconScriptHelper::
	call LoadItemIconForOverworld
	call PlaceOverworldReceivedItemIcon
	call ApplyTilemap
	farcall RefreshReceivedItemIconPalette
	ret

INCLUDE "data/items/icon_pointers.asm"
