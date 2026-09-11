AddRegisteredItem:
	ld a, [wCurItem]
	push af
	call ValidateRegisteredItems
	pop af
	ld c, a
	call FindRegisteredItemSlot
	jr c, .done

	call FindEmptyRegisteredItemSlot
	jr c, .store

; No empty slots remain, so keep the three newest entries and append this item.
	ld a, [wRegisteredItemSlot2]
	ld [wRegisteredItemSlot1], a
	ld a, [wRegisteredItemSlot3]
	ld [wRegisteredItemSlot2], a
	ld a, [wRegisteredItemSlot4]
	ld [wRegisteredItemSlot3], a
	ld hl, wRegisteredItemSlot4

.store
	ld [hl], c

.done
	ld a, c
	ld [wCurItem], a
	ret

SelectRegisteredItem:
	call ValidateRegisteredItems
	jr c, .no_registered
	ld a, [wStringBuffer2]
	cp 1
	jr z, .single_item

; Reanchor the map and load textbox/menu tiles without drawing the bottom
; textbox before showing the registered-item chooser.
	call ReanchorMap
	xor a
	ld [wWhichIndexSet], a
	inc a
	ld [wMenuCursorPosition], a
	ld hl, .MenuHeader
	call LoadMenuHeader
	call DoNthMenu
	ld a, [wMenuSelection]
	jr c, .canceled
	call CloseWindow
	call RegisteredItemIsInBag
	push af
	call CloseText
	pop af
	jr nc, .no_registered
	xor a
	ld [wScriptVar], a
	ret

.single_item
	ld a, [wStringBuffer2 + 1]
	call RegisteredItemIsInBag
	jr nc, .no_registered
	xor a
	ld [wScriptVar], a
	ret

.canceled
	call CloseWindow
	call CloseText
	ld a, 1
	ld [wScriptVar], a
	scf
	ret

.no_registered
	xor a
	ld [wScriptVar], a
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items filled by GetMenuIndexSet
	dw wStringBuffer2
	dw PlaceRegisteredItemName

ValidateRegisteredItems:
	xor a
	ld [wStringBuffer2], a
	ld b, 0

.loop
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr z, .done
	push bc
	call GetRegisteredItemSlotAddress
	ld a, [hl]
	and a
	jr z, .next
	push hl
	call RegisteredItemIsInBag
	pop hl
	jr c, .add_to_menu
	xor a
	ld [hl], a
	jr .next

.add_to_menu
	ld a, [wCurItem]
	call AddItemToRegisteredItemMenu

.next
	pop bc
	inc b
	jr .loop

.done
	ld a, [wStringBuffer2]
	ld c, a
	ld b, 0
	ld hl, wStringBuffer2 + 1
	add hl, bc
	ld [hl], -1
	ld a, [wStringBuffer2]
	and a
	jr z, .none
	ld a, [wStringBuffer2 + 1]
	call RegisteredItemIsInBag
	and a
	ret

.none
	scf
	ret

AddItemToRegisteredItemMenu:
	ld c, a
	ld a, [wStringBuffer2]
	and a
	jr z, .append
	ld b, a
	ld hl, wStringBuffer2 + 1

.dupe_loop
	ld a, [hli]
	cp c
	ret z
	dec b
	jr nz, .dupe_loop

.append
	ld a, [wStringBuffer2]
	ld e, a
	ld d, 0
	ld hl, wStringBuffer2 + 1
	add hl, de
	ld [hl], c
	ld hl, wStringBuffer2
	inc [hl]
	ret

FindRegisteredItemSlot:
	ld b, 0

.loop
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr z, .not_found
	call GetRegisteredItemSlotAddress
	ld a, [hl]
	cp c
	jr z, .found
	inc b
	jr .loop

.found
	scf
	ret

.not_found
	and a
	ret

FindEmptyRegisteredItemSlot:
	ld b, 0

.loop
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr z, .not_found
	call GetRegisteredItemSlotAddress
	ld a, [hl]
	and a
	jr z, .found
	inc b
	jr .loop

.found
	scf
	ret

.not_found
	and a
	ret

RegisteredItemIsInBag:
	and a
	jr z, .not_found
	ld [wCurItem], a

	ld hl, wItems
	ld de, 2
	call IsInArray
	jr c, .found

	ld a, [wCurItem]
	ld hl, wKeyItems
	ld de, 1
	call IsInArray
	jr c, .found

	ld a, [wCurItem]
	ld hl, wBalls
	ld de, 2
	call IsInArray
	jr c, .found

.not_found
	and a
	ret

.found
	push bc
	farcall CheckSelectableItem
	ld a, [wItemAttributeValue]
	and a
	pop bc
	jr nz, .not_found
	ld a, b
	ld [wCurItemQuantity], a
	scf
	ret

GetRegisteredItemSlotAddress:
	ld e, a
	ld d, 0
	ld hl, .SlotAddresses
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.SlotAddresses:
	dw wRegisteredItemSlot1
	dw wRegisteredItemSlot2
	dw wRegisteredItemSlot3
	dw wRegisteredItemSlot4

PlaceRegisteredItemName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetItemName
	pop hl
	call PlaceString
	ret
