DEF PC_CANVAS EQU $d800
DEF PC_WRAM EQUS "BANK(wDecompressEnemyFrontpic)"
DEF PC_STAGE  EQU PC_CANVAS + $400
DEF PC_SAVE   EQU PC_CANVAS + $680
DEF PC_DATA   EQU PC_CANVAS + $700
	assert LOW(PC_DATA) == 0
	assert PC_CANVAS == wDecompressEnemyFrontpic
	assert wDecompressEnemyFrontpic + $800 <= $e000
	assert BASE_DATA_SIZE <= PC_DATA - PC_SAVE

rsreset
DEF PCD_NAME   rb MON_NAME_LENGTH
DEF PCD_GENDER rb
DEF PCD_LEVEL  rb
DEF PCD_STATUS rb
DEF PCD_HP     rw
DEF PCD_MAXHP  rw
DEF PCD_ITEM   rb ITEM_NAME_LENGTH
DEF PCD_FLAGS  rb
DEF PCD_MODE   rb 12
DEF PCD_BARPX  rb
DEF PCV_W      rb
DEF PCV_COLOR  rb
DEF PCV_CARD   rb
DEF PCV_MODE   rb
DEF PCV_ADV    rb
DEF PCV_GLYPH  rb 8
DEF PCV_NUM    rb 16
DEF PCV_MASK   rb
DEF PCV_FRESH  rb
DEF PCS_STATE  rb PARTY_LENGTH
	assert _RS <= $100

	const_def
	const PARTYCARDS_HP
	const PARTYCARDS_TMHM
	const PARTYCARDS_EVO_STONE
	const PARTYCARDS_GENDER
	const PARTYCARDS_MOBILE

	const_def
	const PCFILL_NORMAL
	const PCFILL_LEAD
	const PCFILL_FAINTED
	const PCFILL_SELECTED
	const PCFILL_HELD

DEF PC_CARD_TILES  EQU 36
DEF PCT_BG         EQU $6c
DEF PCT_FILL_L     EQU $6d
DEF PCT_FILL       EQU $6e
DEF PCT_BOTTOM_L   EQU $6f
DEF PCT_BOTTOM     EQU $70
DEF PCT_BOTTOM_R   EQU $71
DEF PCT_BAR_TOP    EQU $72
DEF PCT_BAR_BOTTOM EQU $78
DEF PCT_NAVY       EQU $7e
DEF PCT_BAR_MID    EQU $ec
	assert PCT_BG == 3 * PC_CARD_TILES
	assert PCT_NAVY < $7f
	assert PCT_BAR_MID == $80 + 3 * PC_CARD_TILES

DEF PC_BAR_Y      EQU 15
DEF PC_PROMPT_TILES EQU 14

DrawPartyCards::

	ld a, (1 << PARTY_LENGTH) - 1
PartyCardsRedraw::

	ld c, PCV_MASK
	call PartyCards_Store
	xor a
	ldh [hBGMapMode], a

	ld a, [wAttrmap]
	cp BG_BANK1
	ld c, PCV_FRESH
	call PartyCards_Store
	call nz, HideSprites
	call PartyCards_GetMode
	ld c, PCV_MODE
	call PartyCards_Store

	ld a, [wCurPartyMon]
	push af
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurSpecies]
	push af
	ld a, [wMonType]
	push af
	ld a, [wNamedObjectIndex]
	push af
	ld de, wCurBaseData
	ld hl, PC_SAVE
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyTo6

	call PartyCards_SharedTiles
	xor a
.loop
	push af
	call PartyCards_InMask
	jr nc, .next
	pop af
	push af
	ld hl, wPartyCount
	cp [hl]
	jr nc, .empty
	call PartyCards_Gather
	pop af
	push af
	call PartyCards_Render
	pop af
	push af
	scf
	call PartyCards_PlaceTiles
	jr .next
.empty
	ld c, PCS_STATE
	add c
	ld c, a
	xor a
	call PartyCards_Store
	pop af
	push af
	and a
	call PartyCards_PlaceTiles
.next
	pop af
	inc a
	cp PARTY_LENGTH
	jr c, .loop
	call PartyCards_PlaceBarTiles

	ld hl, PC_SAVE
	ld de, wCurBaseData
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyFrom6
	pop af
	ld [wNamedObjectIndex], a
	pop af
	ld [wMonType], a
	pop af
	ld [wCurSpecies], a
	pop af
	ld [wCurPartySpecies], a
	pop af
	ld [wCurPartyMon], a
	ld c, PCV_FRESH
	call PartyCards_Load
	cp BG_BANK1
	ret nz
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	ret z
	call SetDefaultBGPAndOBP
	call DelayFrame
	call CopyTilemapAtOnce
	newfarjp PlaySpriteAnimations

PartyCards_InMask:

	ld b, a
	inc b
	ld c, PCV_MASK
	call PartyCards_Load
.shift
	rrca
	dec b
	jr nz, .shift
	ret

PartyCards_GetMode:

	ld a, [wPartyMenuActionText]
	and $f0
	ld a, PARTYCARDS_HP
	ret nz
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_TEACH_TMHM
	ld a, PARTYCARDS_TMHM
	ret z
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_EVO_STONE
	ld a, PARTYCARDS_EVO_STONE
	ret z
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_MOBILE
	ld a, PARTYCARDS_MOBILE
	ret z
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_GIVE_MON
	jr z, .gender
	cp PARTYMENUACTION_GIVE_MON_FEMALE
	ld a, PARTYCARDS_HP
	ret nz
.gender
	ld a, PARTYCARDS_GENDER
	ret

PartyCards_Store:

	push hl
	push bc
	ld h, HIGH(PC_DATA)
	ld l, c
	ld b, a
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld [hl], b
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	pop hl
	ret

PartyCards_Load:

	push hl
	push bc
	ld h, HIGH(PC_DATA)
	ld l, c
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld b, [hl]
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	pop hl
	ret

PartyCards_StoreString:

.loop
	ld a, [de]
	inc de
	call PartyCards_Store
	inc c
	cp CHARVAL("@")
	ret z
	dec b
	jr nz, .loop
	ret

PartyCards_CopyTo6:

.loop
	ld a, [de]
	inc de
	push bc
	ld b, a
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld [hl], b
	ld a, c
	ldh [rSVBK], a
	pop bc
	inc hl
	dec c
	jr nz, .loop
	ret

PartyCards_CopyFrom6:

.loop
	push bc
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld b, [hl]
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

PartyCards_Gather:

	ld c, PCV_CARD
	call PartyCards_Store
	ld [wCurPartyMon], a

	ld a, CHARVAL("@")
	ld c, PCD_ITEM
	call PartyCards_Store
	ld c, PCD_MODE
	call PartyCards_Store
	xor a
	ld c, PCD_GENDER
	call PartyCards_Store
	ld c, PCD_STATUS
	call PartyCards_Store
	ld c, PCD_FLAGS
	call PartyCards_Store

	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld c, PCD_NAME
	ld b, MON_NAME_LENGTH
	call PartyCards_StoreString

	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	cp EGG
	jr nz, .not_egg
	ld a, 1
	ld c, PCD_FLAGS
	call PartyCards_Store
	ld b, PCFILL_NORMAL
	ld a, [wCurPartyMon]
	and a
	jr nz, .egg_state
	ld b, PCFILL_LEAD
.egg_state
	ld a, b
	or $80
	jp .store_state

.not_egg
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hli]
	ld c, PCD_LEVEL
	call PartyCards_Store
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hli]
	ld c, PCD_HP
	call PartyCards_Store
	ld d, a
	ld a, [hli]
	ld c, PCD_HP + 1
	call PartyCards_Store
	or d
	ld e, a
	ld a, [hli]
	ld c, PCD_MAXHP
	call PartyCards_Store
	ld a, [hl]
	ld c, PCD_MAXHP + 1
	call PartyCards_Store

	ld a, e
	and a
	ld a, 6
	jr z, .got_status
	ld a, b
	ld c, 1
	bit PSN, a
	jr nz, .status_c
	inc c
	bit BRN, a
	jr nz, .status_c
	inc c
	bit FRZ, a
	jr nz, .status_c
	inc c
	bit PAR, a
	jr nz, .status_c
	inc c
	and SLP
	jr nz, .status_c
	ld c, 0
.status_c
	ld a, c
.got_status
	ld c, PCD_STATUS
	call PartyCards_Store

	pop hl
	push hl
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no_item
	ld [wNamedObjectIndex], a
	call GetItemName
	ld c, PCD_ITEM
	ld b, ITEM_NAME_LENGTH
	call PartyCards_StoreString
.no_item

	pop hl
	push hl
	ld bc, MON_DVS
	add hl, bc
	ld b, h
	ld c, l
	newfarcall CheckShininess
	jr nc, .not_shiny
	ld a, 1 << 1
	ld c, PCD_FLAGS
	call PartyCards_Store
.not_shiny

	xor a
	ld [wMonType], a
	newfarcall GetGender
	ld a, 0
	jr c, .got_gender
	ld a, CHARVAL("♂")
	jr nz, .got_gender
	ld a, CHARVAL("♀")
.got_gender
	ld c, PCD_GENDER
	call PartyCards_Store

	ld a, [wFollowerMenuContext]
	and a
	jr z, .no_follower
	newfarcall GetFollowerSelection
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr nz, .no_follower
	ld a, [wFollowerSelectionSuspended]
	and a
	jr nz, .no_follower
	ld c, PCD_FLAGS
	call PartyCards_Load
	or 1 << 2
	call PartyCards_Store
.no_follower
	call PartyCards_GatherMode

	pop hl
	ld bc, MON_HP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	call PartyCards_BarPixels
	ld c, PCD_BARPX
	call PartyCards_Store

	ld c, PCD_HP
	call PartyCards_Load
	ld b, a
	inc c
	call PartyCards_Load
	or b
	ld b, PCFILL_FAINTED
	jr z, .got_fill
	ld b, PCFILL_NORMAL
	ld a, [wCurPartyMon]
	and a
	jr nz, .got_fill
	ld b, PCFILL_LEAD
.got_fill
	ld a, d
	swap a
	or b
	or $80
.store_state
	push af
	ld a, [wCurPartyMon]
	add PCS_STATE
	ld c, a
	pop af
	jp PartyCards_Store

PartyCards_BarPixels:

	push bc
	call PartyCards_ComputeHPPixels
	pop bc
	push de
	call GetHPPal
	pop bc
	ld a, c
	srl a
	srl a
	add c
	ret

PartyCards_ComputeHPPixels:
	ld a, d
	or e
	jr z, .zero
	ld a, b
	or c
	jr z, .zero
	xor a
	ldh [hMultiplicand], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, HP_BAR_LENGTH_PX
	ldh [hMultiplier], a
	call Multiply
.normalize
	ld a, d
	and a
	jr z, .divide
	srl d
	rr e
	ld hl, hDividend
	srl [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	jr .normalize
.divide
	ld a, e
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	and a
	jr nz, .nonzero
	inc a
.nonzero
	cp HP_BAR_LENGTH_PX + 1
	jr c, .done
	ld a, HP_BAR_LENGTH_PX
.done
	ld e, a
	ret
.zero
	ld e, 0
	ret

PartyCards_GatherMode:
	ld c, PCV_MODE
	call PartyCards_Load
	cp PARTYCARDS_TMHM
	jr z, .tmhm
	cp PARTYCARDS_EVO_STONE
	jr z, .evo_stone
	cp PARTYCARDS_MOBILE
	jr z, .mobile
	cp PARTYCARDS_GENDER
	ret nz
	ld c, PCD_GENDER
	call PartyCards_Load
	ld de, .unknown
	and a
	jr z, .got_string
	ld de, .male
	cp CHARVAL("♂")
	jr z, .got_string
	ld de, .female
	jr .got_string

.mobile
	ld hl, wd002
	ld b, 0
.mobile_loop
	ld a, [wCurPartyMon]
	cp [hl]
	jr z, .mobile_chosen
	inc hl
	inc b
	ld a, b
	cp 3
	jr c, .mobile_loop
	ld de, .not_chosen
	jr .got_string
.mobile_chosen
	ld a, b
	ld hl, .mobile_strings
	call GetNthString
	ld d, h
	ld e, l
	jr .got_string
.mobile_strings
	db "First@Second@Third@"
.not_chosen
	db "Not chosen@"

.tmhm
	predef CanLearnTMHMMove
	ld a, c
	and a
	jr .able_not_able

.evo_stone
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, EvosAttacksPointers
	add hl, de
	add hl, de
	call PartyCards_EvolutionItemCompatible
.able_not_able
	ld de, .not_able
	jr z, .got_string
	ld de, .able
.got_string
	ld c, PCD_MODE
	ld b, 12
	jp PartyCards_StoreString

.able:     db "Able@"
.not_able: db "Not Able@"
.male:     db "♂…Male@"
.female:   db "♀…Female@"
.unknown:  db "…Unknown@"

PartyCards_Render:

	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	call PC_CardCanvas
	call PC_DrawName
	ld a, [PC_DATA + PCD_FLAGS]
	bit 0, a
	jr nz, .done
	call PC_DrawInfoLine
	call PC_DrawItemLine
	ld a, [PC_DATA + PCD_MODE]
	cp CHARVAL("@")
	jr nz, .mode

	ld hl, PartyCardHPGFX
	ld de, PC_CANVAS + 30 tiles
	ld bc, PartyCardHPGFX.End - PartyCardHPGFX
	call CopyBytes
	call PC_DrawHPBar
	jr .done
.mode
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, 8
	ld [PC_DATA + PCV_ADV], a
	ld hl, PC_DATA + PCD_MODE
	lb de, 4, 24
	call PC_String
.done
	call PC_StageCard
	ld a, [PC_DATA + PCV_CARD]
	call PC_CardTileBase
	ld de, PC_STAGE
	ld c, PC_CARD_TILES
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	ret

PC_CardTileBase:

	cp 3
	jr c, .first
	sub 3
	ld c, a
	add a
	add a
	add a
	add c
	add a
	add a
	add $80
	ret
.first
	ld c, a
	add a
	add a
	add a
	add c
	add a
	add a
	ret

PC_CardCanvas:

	ld a, 10
	ld [PC_DATA + PCV_W], a
	ld hl, PartyCardGFX
	ld de, PC_CANVAS
	ld bc, PartyCardGFX.End - PartyCardGFX
	call CopyBytes
	ret

PC_Dot:
	ld a, $80
	jp PC_Blit

PC_DrawName:
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a

	ld hl, PC_DATA + PCD_NAME
	ld b, 0
.count
	ld a, [hli]
	cp CHARVAL("@")
	jr z, .counted
	inc b
	jr .count
.counted
	ld a, b
	cp 10
	ld a, 8
	jr c, .got_adv
	dec a
.got_adv
	ld [PC_DATA + PCV_ADV], a
	ld hl, PC_DATA + PCD_NAME
	lb de, 4, 1
	jp PC_String

PC_DrawInfoLine:
	ld a, [PC_DATA + PCD_STATUS]
	and a
	jr z, .level

	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	lb de, 20, 9
	lb bc, 15, 7
	call PC_FillRect
	xor a
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_STATUS]
	dec a
	ld c, a
	add a
	add a
	ld b, 0
	ld c, a
	ld hl, PartyCardStatusStrings
	add hl, bc
	lb de, 22, 10
	call PC_TinyString
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_GENDER]
	and a
	jr z, .hp
	ld d, 37
	call PC_GenderSign
	jr .hp

.level
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCV_NUM
	ld a, CHARVAL("L")
	ld [hli], a
	ld de, PC_DATA + PCD_LEVEL
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	ld [hl], CHARVAL("@")
	ld hl, PC_DATA + PCV_NUM
	lb de, 20, 10
	call PC_TinyString
	inc d
	inc d
	call PC_GenderSign

.hp
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCV_NUM
	ld de, PC_DATA + PCD_HP
	lb bc, PRINTNUM_LEFTALIGN | 2, 4
	call PrintNum
	ld [hl], CHARVAL("/")
	inc hl
	ld de, PC_DATA + PCD_MAXHP
	lb bc, PRINTNUM_LEFTALIGN | 2, 4
	call PrintNum
	ld [hl], CHARVAL("@")
	ld hl, PC_DATA + PCV_NUM
	call PC_TinyWidth
	cp 32
	jr c, .hp_width
	inc a
	srl a
	srl a
	ld b, a
	add a
	add b
	dec a
	ld b, a
	ld a, 76
	sub b
	ld d, a
	ld e, 10
	ld hl, PC_DATA + PCV_NUM
	jp PC_CompactTinyString
.hp_width
	ld b, a
	ld a, 76
	sub b
	ld d, a
	ld e, 10
	ld hl, PC_DATA + PCV_NUM
	jp PC_TinyString

PC_GenderSign:

	ld a, [PC_DATA + PCD_GENDER]
	and a
	ret z
	ld hl, .Male
	cp CHARVAL("♂")
	jr z, .got_sign
	ld hl, .Female
.got_sign
	ld e, 9
	ld b, 7
	jp PC_BlitRows

.Male:
	db %00011100
	db %00001100
	db %01110100
	db %10001000
	db %10001000
	db %01110000
	db %00000000

.Female:
	db %01110000
	db %10001000
	db %10001000
	db %01110000
	db %00100000
	db %01110000
	db %00100000

PC_DrawItemLine:
	ld a, [PC_DATA + PCD_FLAGS]
	bit 1, a
	jr z, .not_shiny

	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, .Sparkle
	lb de, 66, 16
	ld b, 5
	call PC_BlitRows
.not_shiny
	ld a, [PC_DATA + PCD_ITEM]
	cp CHARVAL("@")
	ret z
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCD_ITEM
	lb de, 20, 17
	jp PC_TinyString

.Sparkle:
	db %00100000
	db %01110000
	db %11011000
	db %01110000
	db %00100000

PC_DrawHPBar:
	ld a, [PC_DATA + PCD_BARPX]
	and a
	ret z
	ld b, a
	ld a, 1
	ld [PC_DATA + PCV_COLOR], a
	lb de, 15, 26
	ld c, 5
	jp PC_FillRect

PartyCardGFX:
INCBIN "gfx/party_menu/card.2bpp"
.End:
	assert .End - PartyCardGFX == 10 * 5 tiles

PartyCardHPGFX:
INCBIN "gfx/party_menu/card_hp.2bpp"
.End:
	assert .End - PartyCardHPGFX == 10 tiles

PartyCardStatusStrings:
	db "PSN@"
	db "BRN@"
	db "FRZ@"
	db "PAR@"
	db "SLP@"
	db "FNT@"

PC_StageCard:

	ld hl, PC_CANVAS
	ld de, PC_STAGE
	ld bc, 10 tiles
	call CopyBytes
	ld hl, PC_CANVAS + 12 tiles
	ld bc, 8 tiles
	call CopyBytes
	ld hl, PC_CANVAS + 22 tiles
	ld bc, 8 tiles
	call CopyBytes
	ld hl, PC_CANVAS + 30 tiles
	ld bc, 10 tiles
	call CopyBytes
	ret

PC_Transfer:

	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, $9000
	cp $80
	jr c, .got_base
	ld de, $8000
.got_base
	add hl, de
	pop de
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr z, .lcd_off

	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	di
	ld a, 1
	ldh [rVBK], a
	newfarcall HDMATransfer_WaitForScanline128
	jr .done
.lcd_off
	ld a, 1
	ldh [rVBK], a
	ld b, c
.copy_tile
	ld c, TILE_SIZE
.copy_byte
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copy_byte
	dec b
	jr nz, .copy_tile
.done
	xor a
	ldh [rVBK], a
	pop af
	ldh [hBGMapMode], a
	ret

PartyCards_SharedTiles:

	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	call PC_CardCanvas
	ld de, PC_STAGE
	ld hl, PC_STAGE
	ld bc, 1 tiles
.bg
	xor a
	ld [hli], a
	dec a
	ld [hli], a
	dec c
	dec c
	jr nz, .bg
	ld de, PC_STAGE + 1 tiles
	ld hl, PC_CANVAS + 20 tiles
	ld bc, 2 tiles
	call CopyBytes
	ld hl, PC_CANVAS + 40 tiles
	ld bc, 2 tiles
	call CopyBytes
	ld hl, PC_CANVAS + 49 tiles
	ld bc, 1 tiles
	call CopyBytes
	ld a, PCT_BG
	ld de, PC_STAGE
	ld c, 6
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	ret

PartyCardsBlankCard::

	and a
	call PartyCards_PlaceTiles
	call DelayFrame
	jp CopyTilemapAtOnce

PartyCards_PlaceTiles:

	push af

	ld c, a
	srl a
	ld b, a
	add a
	add a
	add b
	ld hl, wTilemap
	ld de, SCREEN_WIDTH
	and a
	jr z, .got_row
.row_loop
	add hl, de
	dec a
	jr nz, .row_loop
.got_row
	bit 0, c
	jr z, .got_col
	ld de, 10
	add hl, de
.got_col

	push hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld a, c
	and 7
	or BG_BANK1
	ld b, 5
.attr_row
	push hl
	push bc
	ld c, 10
.attr
	ld [hli], a
	dec c
	jr nz, .attr
	pop bc
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .attr_row
	pop hl
	pop af
	jr c, .card

	ld b, 5
.empty_row
	push hl
	ld c, 10
	ld a, PCT_BG
.empty
	ld [hli], a
	dec c
	jr nz, .empty
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .empty_row
	ret

.card
	call PC_CardTileBase
	ld b, a
	push hl
	ld c, 10
	call .run
	pop hl
	call .next_row
	ld e, 2
.mid_row
	push hl
	ld a, PCT_FILL_L
	ld [hli], a
	ld a, PCT_FILL
	ld [hli], a
	ld c, 8
	call .run
	pop hl
	call .next_row
	dec e
	jr nz, .mid_row
	push hl
	ld c, 10
	call .run
	pop hl
	call .next_row
	ld a, PCT_BOTTOM_L
	ld [hli], a
	ld c, 8
	ld a, PCT_BOTTOM
.bottom
	ld [hli], a
	dec c
	jr nz, .bottom
	ld [hl], PCT_BOTTOM_R
	ret

.run
	ld a, b
	ld [hli], a
	inc b
	dec c
	jr nz, .run
	ret

.next_row
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	ret

PartyCards_PlaceBarTiles:

	hlcoord 0, PC_BAR_Y
	ld bc, 3 * SCREEN_WIDTH
	ld a, PCT_NAVY
	call ByteFill
	hlcoord 0, PC_BAR_Y, wAttrmap
	ld bc, 3 * SCREEN_WIDTH
	ld a, BG_BANK1 | 6
	call ByteFill
	hlcoord SCREEN_WIDTH - 6, PC_BAR_Y
	ld a, PCT_BAR_TOP
	ld c, 6
	call .run
	hlcoord 0, PC_BAR_Y + 1
	ld a, PCT_BAR_MID
	ld c, SCREEN_WIDTH
	call .run
	hlcoord SCREEN_WIDTH - 6, PC_BAR_Y + 2
	ld a, PCT_BAR_BOTTOM
	ld c, 6
.run
	ld [hli], a
	inc a
	dec c
	jr nz, .run
	ret

DrawPartyMenuBar::

	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, [wPartyCount]
	ld b, a
	ld a, [wMenuJoypadFilter]
	and PAD_B
	ld c, a

	ld de, PartyCardPrompts.none
	ld a, b
	and a
	jr z, .got_prompt
	ld a, [wPartyMenuActionText]
	and $f
	ld e, a
	ld d, 0
	ld hl, PartyCardPrompts
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
.got_prompt
	ld a, [wFollowerMenuContext]
	and a
	jr z, .prompt_ready
	ld de, .FollowHint
.prompt_ready
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	push bc
	push de
	ld a, SCREEN_WIDTH
	ld [PC_DATA + PCV_W], a
	ld hl, PC_CANVAS
	ld bc, 3 * SCREEN_WIDTH tiles
	xor a
	call ByteFill
	pop de
	ld c, 4
	call PC_VWFStrip
	ld a, 1
	ld b, 0
	ld c, PC_PROMPT_TILES
	call PC_MergeStrip
	pop bc
	ld a, c
	and a
	jr z, .no_quit_hint
	ld de, .QuitString
	call GetVWFLength
	ld b, a
	ld a, SCREEN_WIDTH * TILE_WIDTH - 4
	sub b
	ld c, a
	ld de, .QuitString
	call PC_VWFStrip
	ld a, 1
	ld b, PC_PROMPT_TILES
	ld c, SCREEN_WIDTH - PC_PROMPT_TILES
	call PC_MergeStrip
.no_quit_hint

	ld a, PCT_NAVY
	ld de, PC_CANVAS
	ld c, 1
	call PC_Transfer
	ld a, PCT_BAR_TOP
	ld de, PC_CANVAS + (SCREEN_WIDTH - 6) tiles
	ld c, 6
	call PC_Transfer
	ld a, PCT_BAR_MID
	ld de, PC_CANVAS + SCREEN_WIDTH tiles
	ld c, SCREEN_WIDTH
	call PC_Transfer
	ld a, PCT_BAR_BOTTOM
	ld de, PC_CANVAS + (3 * SCREEN_WIDTH - 6) tiles
	ld c, 6
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	pop af
	ldh [hBGMapMode], a
	ld c, PCV_FRESH
	call PartyCards_Load
	cp BG_BANK1
	ret z
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr z, .prepare
	call CopyTilemapAtOnce
	ldh a, [rLCDC]
	push af
	call DisableLCD
	call .prepare
.prepared
	pop af
	ldh [rLCDC], a
	ret
.prepare
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	newfarcall PlaySpriteAnimations
	call PartyCardsPrepareFollowerBadge
	jp SetDefaultBGPAndOBP

.QuitString: db "B:Quit@"
.FollowHint: db "Select: Follow@"

PartyCardPrompts:

	table_width 2
	dw .pick
	dw .use_on
	dw .which
	dw .teach
	dw .move_to
	dw .use_on
	dw .pick
	dw .pick
	dw .to_which
	dw .pick
	assert_table_length NUM_PARTYMENUACTIONS

.pick:     db "Pick a Pokémon.@"
.use_on:   db "Use on which Pokémon?@"
.which:    db "Which Pokémon?@"
.teach:    db "Teach which Pokémon?@"
.move_to:  db "Move to where?@"
.to_which: db "To which Pokémon?@"
.none:     db "You have no Pokémon!@"

PC_VWFStrip:

	push de
	push bc
	ld hl, PC_STAGE
	ld bc, SCREEN_WIDTH tiles
	xor a
	call ByteFill
	pop bc
	pop de
	ld hl, PC_STAGE
	jp PlaceVWFString

PC_MergeStrip:

	ld [PC_DATA + PCV_COLOR], a
	ld l, b
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	ld de, PC_STAGE
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, PC_CANVAS + SCREEN_WIDTH tiles
	add hl, de
	pop de

	ld a, c
	add a
	add a
	add a
	ld c, a
.loop
	ld a, [de]
	inc de
	inc de
	call PC_ApplyMask
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

PC_String:

.loop
	ld a, [hli]
	cp CHARVAL("@")
	ret z
	push hl
	cp CHARVAL(" ")
	call nz, PC_Glyph
	pop hl
	ld a, [PC_DATA + PCV_ADV]
	add d
	ld d, a
	jr .loop

PC_Glyph:

	sub $80
	ret c
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, Font
	add hl, de
	ld de, PC_DATA + PCV_GLYPH
	ld bc, TILE_1BPP_SIZE
	ld a, BANK(Font)
	call FarCopyBytes
	pop de
	ld hl, PC_DATA + PCV_GLYPH
	ld b, TILE_WIDTH
	jr PC_BlitRows

PC_TinyString:

.loop
	ld a, [hli]
	cp CHARVAL("@")
	ret z
	push hl
	call PC_TinyChar
	pop hl
	ld a, d
	add 4
	ld d, a
	jr .loop

PC_TinyWidth:

	ld b, -1
.loop
	ld a, [hli]
	cp CHARVAL("@")
	jr z, .done
	inc b
	inc b
	inc b
	inc b
	jr .loop
.done
	ld a, b
	ret

PC_CompactTinyString:
	ld a, [hli]
	cp CHARVAL("@")
	ret z
	push hl
	call PC_TinyChar
	pop hl
	inc d
	inc d
	inc d
	jr PC_CompactTinyString

PC_TinyChar:

	call PC_TinyIndex
	ret c
	ld b, 5

PC_BlitRows:

	push de
.loop
	ld a, [hli]
	push hl
	call PC_Blit
	pop hl
	inc e
	dec b
	jr nz, .loop
	pop de
	ret

PC_TinyIndex:

	cp CHARVAL("A")
	jr c, .specials
	cp CHARVAL("Z") + 1
	jr c, .upper
	cp CHARVAL("a")
	jr c, .specials
	cp CHARVAL("z") + 1
	jr c, .lower
	cp CHARVAL("0")
	jr nc, .digit
.specials
	ld hl, .Specials
	ld b, a
.find
	ld a, [hli]
	cp -1
	jr z, .none
	cp b
	ld a, [hli]
	jr nz, .find
	jr .got_index
.none
	scf
	ret
.upper
	sub CHARVAL("A")
	jr .got_index
.lower
	sub CHARVAL("a")
	jr .got_index
.digit
	sub CHARVAL("0") - 26
.got_index
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	ld bc, PartyCardTinyFont
	add hl, bc
	and a
	ret

.Specials:
	db "/", 36
	db ".", 38
	db "-", 39
	db "'", 40
	db "?", 41
	db "!", 42
	db "♂", 43
	db "♀", 44
	db ":", 45
	db "é", 4
	db -1

PC_FillRect:

.loop
	push bc
	push de
	call PC_HLine
	pop de
	pop bc
	inc e
	dec c
	jr nz, .loop
	ret

PC_HLine:

.loop
	ld a, b
	and a
	ret z
	cp 8
	jr c, .partial
	ld a, $ff
	call PC_Blit
	ld a, d
	add 8
	ld d, a
	ld a, b
	sub 8
	ld b, a
	jr .loop
.partial
	ld c, a
	ld a, $ff
.shift
	srl a
	dec c
	jr nz, .shift
	cpl

PC_Blit:

	and a
	ret z
	push bc
	push de
	push af
	call PC_RowAddr
	pop af
	ld b, a
	ld c, 0
	ld a, d
	and 7
	jr z, .go
.shift
	srl b
	rr c
	dec a
	jr nz, .shift
.go
	ld a, b
	call PC_ApplyMask
	ld a, c
	and a
	jr z, .done
	ld de, TILE_SIZE
	add hl, de
	call PC_ApplyMask
.done
	pop de
	pop bc
	ret

PC_RowAddr:

	ld a, [PC_DATA + PCV_W]
	ld c, a
	ld a, e
	srl a
	srl a
	srl a
	ld b, a
	xor a
	inc b
.mul
	dec b
	jr z, .got_row
	add c
	jr .mul
.got_row
	ld b, a
	ld a, d
	srl a
	srl a
	srl a
	add b
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, e
	and 7
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, PC_CANVAS
	add hl, bc
	ret

PC_ApplyMask:

	push bc
	push hl
	ld b, a
	cpl
	ld c, a
	ld a, [PC_DATA + PCV_COLOR]
	rrca
	push af
	ld a, [hl]
	jr nc, .clear0
	or b
	jr .set0
.clear0
	and c
.set0
	ld [hli], a
	pop af
	rrca
	ld a, [hl]
	jr nc, .clear1
	or b
	jr .set1
.clear1
	and c
.set1
	ld [hl], a
	pop hl
	pop bc
	ret

PartyCardTinyFont:

	db %01000000, %10100000, %11100000, %10100000, %10100000
	db %11000000, %10100000, %11000000, %10100000, %11000000
	db %01100000, %10000000, %10000000, %10000000, %01100000
	db %11000000, %10100000, %10100000, %10100000, %11000000
	db %11100000, %10000000, %11000000, %10000000, %11100000
	db %11100000, %10000000, %11000000, %10000000, %10000000
	db %01100000, %10000000, %10100000, %10100000, %01100000
	db %10100000, %10100000, %11100000, %10100000, %10100000
	db %11100000, %01000000, %01000000, %01000000, %11100000
	db %00100000, %00100000, %00100000, %10100000, %01000000
	db %10100000, %10100000, %11000000, %10100000, %10100000
	db %10000000, %10000000, %10000000, %10000000, %11100000
	db %10100000, %11100000, %11100000, %10100000, %10100000
	db %11000000, %10100000, %10100000, %10100000, %10100000
	db %01000000, %10100000, %10100000, %10100000, %01000000
	db %11000000, %10100000, %11000000, %10000000, %10000000
	db %01000000, %10100000, %10100000, %11000000, %01100000
	db %11000000, %10100000, %11000000, %10100000, %10100000
	db %01100000, %10000000, %01000000, %00100000, %11000000
	db %11100000, %01000000, %01000000, %01000000, %01000000
	db %10100000, %10100000, %10100000, %10100000, %11100000
	db %10100000, %10100000, %10100000, %10100000, %01000000
	db %10100000, %10100000, %11100000, %11100000, %10100000
	db %10100000, %10100000, %01000000, %10100000, %10100000
	db %10100000, %10100000, %01000000, %01000000, %01000000
	db %11100000, %00100000, %01000000, %10000000, %11100000
	db %11100000, %10100000, %10100000, %10100000, %11100000
	db %01000000, %11000000, %01000000, %01000000, %11100000
	db %11000000, %00100000, %01000000, %10000000, %11100000
	db %11000000, %00100000, %01000000, %00100000, %11000000
	db %10100000, %10100000, %11100000, %00100000, %00100000
	db %11100000, %10000000, %11000000, %00100000, %11000000
	db %01100000, %10000000, %11100000, %10100000, %11100000
	db %11100000, %00100000, %01000000, %01000000, %01000000
	db %11100000, %10100000, %11100000, %10100000, %11100000
	db %11100000, %10100000, %11100000, %00100000, %11000000
	db %00100000, %00100000, %01000000, %10000000, %10000000
	db %10000000, %11000000, %11100000, %11000000, %10000000
	db %00000000, %00000000, %00000000, %00000000, %01000000
	db %00000000, %00000000, %11100000, %00000000, %00000000
	db %01000000, %01000000, %00000000, %00000000, %00000000
	db %11000000, %00100000, %01000000, %00000000, %01000000
	db %01000000, %01000000, %01000000, %00000000, %01000000
	db %01100000, %00100000, %11100000, %10100000, %11100000
	db %11100000, %10100000, %11100000, %01000000, %11100000
	db %00000000, %01000000, %00000000, %01000000, %00000000
	assert @ - PartyCardTinyFont == 46 * 5

PartyCardsLoadPals::
PartyCardsUpdatePals::
	ldh a, [rSVBK]
	push af
	ld a, [wPartyCount]
	ld c, 0
.loop
	push bc

	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, c
	add LOW(PC_DATA + PCS_STATE)
	ld l, a
	ld h, HIGH(PC_DATA)
	ld b, [hl]
	ld a, 1
	ldh [rSVBK], a
	ld a, c
	inc a
	ld hl, wMenuCursorY
	cp [hl]
	jr z, .selected
	ld hl, wSwitchMon
	cp [hl]
	ld a, PCFILL_HELD
	jr z, .got_fill
	ld a, b
	and %11
	jr .got_fill
.selected
	ld a, PCFILL_SELECTED
.got_fill
	ld hl, PartyCardFillColors
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	push hl
	ld a, b
	swap a
	and %11
	add a
	ld e, a
	ld hl, PartyCardBarColors
	add hl, de
	ld b, h
	ld c, l
	pop hl
	pop de
	push de
	ld a, e
	call .Write
	pop bc
	inc c
	ld a, c
	cp PARTY_LENGTH
	jr c, .loop

	ld a, 1
	ldh [rSVBK], a
	ld hl, PartyCardFillColors + PCFILL_NORMAL * 4
	ld bc, .BarColors
	ld a, 6
	call .Write
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.BarColors:
	dw PARTY_CARD_NAVY, PARTY_CARD_WHITE

.Write:

	push af
	ld e, a
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	push hl
	ld hl, wBGPals1
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop af
	push af
	call .WriteOne
	push hl
	ld hl, wBGPals2 - wBGPals1 - 1 palettes
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop af
	jr .WriteOne

.WriteOne:

	cp 6
	jr z, .bar

	push hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld h, b
	ld l, c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, LOW(PARTY_CARD_BG)
	ld [de], a
	inc de
	ld a, HIGH(PARTY_CARD_BG)
	ld [de], a
	inc de
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ret

.bar
	push hl
	ld h, b
	ld l, c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
.black
	ld [de], a
	inc de
	ld a, LOW(PARTY_CARD_BLACK)
	ld [de], a
	inc de
	ld a, HIGH(PARTY_CARD_BLACK)
	ld [de], a
	inc de
	ret

DEF PARTY_CARD_BG    EQU (3 << 0) | (12 << 5) | (13 << 10)
DEF PARTY_CARD_BLACK EQU (2 << 0) | (3 << 5) | (6 << 10)
DEF PARTY_CARD_NAVY  EQU (4 << 0) | (6 << 5) | (13 << 10)
DEF PARTY_CARD_WHITE EQU (31 << 0) | (31 << 5) | (31 << 10)

PartyCardFillColors:

	RGB 20, 24, 30, 02, 03, 06
	RGB 25, 21, 28, 02, 03, 06
	RGB 25, 25, 25, 02, 03, 06
	RGB 30, 26, 10, 02, 03, 06
	RGB 14, 28, 28, 02, 03, 06

PartyCardBarColors:

	RGB 06, 24, 08
	RGB 31, 24, 00
	RGB 28, 05, 05
	RGB 06, 24, 08

PartyCards_EvolutionItemCompatible:
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
.loop
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	ret z
	inc hl
	cp EVOLVE_ITEM
	jr z, .item
	cp EVOLVE_STAT
	jr nz, .skip
	inc hl
.skip
	inc hl
	inc hl
	jr .loop
.item
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld b, a
	ld a, [wCurItem]
	cp b
	ld a, 1
	ret z
	jr .skip

PartyCardsJoypad::
	ld a, [wPartyCount]
	and a
	jr nz, .has_party
	ld a, PAD_B
	ldh [hJoyLast], a
	ld b, a
	ret
.has_party
	call PartyCardsUpdatePals
.loop
	newfarcall PlaySpriteAnimationsAndDelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	and PAD_A | PAD_B
	jr nz, .done
	ld a, [wFollowerMenuContext]
	and a
	jr z, .move
	bit B_PAD_SELECT, b
	jr nz, .done
.move
	call PartyCards_DPad
	jr .loop
.done
	ld a, b
	ret

PartyCards_DPad:
	ld a, [wMenuCursorY]
	ld c, a
	ld a, b
	bit B_PAD_UP, a
	jr nz, .up
	bit B_PAD_DOWN, a
	jr nz, .down
	bit B_PAD_LEFT, a
	jr nz, .left
	bit B_PAD_RIGHT, a
	ret z
	bit 0, c
	ret z
	inc c
	ld a, [wPartyCount]
	cp c
	ret c
	jr .moved
.left
	bit 0, c
	ret nz
	dec c
	jr .moved
.down
	inc c
	inc c
	ld a, [wPartyCount]
	cp c
	jr nc, .moved
	ld c, 1
	jr .moved
.up
	dec c
	dec c
	jr z, .last
	bit 7, c
	jr z, .moved
.last
	ld a, [wPartyCount]
	ld c, a
.moved
	ld a, c
	ld [wMenuCursorY], a
	jp PartyCardsUpdatePals

PartyCardsHidePrompt::

	hlcoord 0, PC_BAR_Y + 1
	ld bc, PC_PROMPT_TILES
	ld a, PCT_NAVY
	call ByteFill
	ret

PartyCardsAnimateHP::

	ld a, [wCurPartyMon]
	push af
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurSpecies]
	push af
	ld a, [wMonType]
	push af
	ld a, [wNamedObjectIndex]
	push af
	ld de, wCurBaseData
	ld hl, PC_SAVE
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyTo6
	ld a, [wCurPartyMon]
	call PartyCards_Gather
	ld hl, PC_SAVE
	ld de, wCurBaseData
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyFrom6
	pop af
	ld [wNamedObjectIndex], a
	pop af
	ld [wMonType], a
	pop af
	ld [wCurSpecies], a
	pop af
	ld [wCurPartySpecies], a
	pop af
	ld [wCurPartyMon], a

	ld hl, wHPBuffer2
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr nc, .positive
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
.positive

	ld a, h
	ld [wCurHPAnimDeltaHP], a
	ld a, l
	ld [wCurHPAnimDeltaHP + 1], a
	ld a, 5
.div
	srl h
	rr l
	dec a
	jr nz, .div
	ld a, h
	or l
	jr nz, .got_step
	inc l
.got_step
	push bc
	newfarcall HPBarAnim_GetExtraTicks
	ld b, h
	ld c, l
	and a
	jr z, .speed_done
.speed
	add hl, bc
	dec a
	jr nz, .speed
.speed_done
	pop bc
	ld d, h
	ld e, l
	pop hl
.loop

	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .down
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld b, a
	ld a, l
	sub c
	ld a, h
	sbc b
	jr nc, .show
	ld b, h
	ld c, l
	jr .show
.down
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	jr c, .clamp
	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .show
.clamp
	ld b, h
	ld c, l
.show
	push hl
	push de
	push bc
	call .Show
	pop bc
	pop de
	pop hl
	ld a, l
	cp c
	jr nz, .loop
	ld a, h
	cp b
	jr nz, .loop
	ret

.Show:

	ld a, b
	push bc
	ld c, PCD_HP
	call PartyCards_Store
	pop bc
	push bc
	ld a, c
	ld c, PCD_HP + 1
	call PartyCards_Store
	pop bc
	ld a, b
	or c
	push af
	ld c, PCD_MAXHP
	call PartyCards_Load
	ld d, a
	inc c
	call PartyCards_Load
	ld e, a
	ld c, PCD_HP
	call PartyCards_Load
	ld b, a
	inc c
	call PartyCards_Load
	ld c, a
	call PartyCards_BarPixels
	ld c, PCD_BARPX
	call PartyCards_Store

	ld a, [wCurPartyMon]
	add PCS_STATE
	ld c, a
	call PartyCards_Load
	and %10000011
	ld b, a
	ld a, d
	swap a
	or b
	ld b, a
	pop af
	ld a, b
	jr z, .fainted
	and %11
	cp PCFILL_FAINTED
	ld a, b
	jr nz, .got_state
	and %11111100
	ld b, a
	ld a, [wCurPartyMon]
	and a
	ld a, b
	jr nz, .got_state
	or PCFILL_LEAD
	jr .got_state
.fainted
	and %11111100
	or PCFILL_FAINTED
.got_state
	call PartyCards_Store
	ld a, [wCurPartyMon]
	call PartyCards_Render
	jp PartyCardsUpdatePals

PartyCardsTextboxHook::

	push af
	call PartyCards_OnScreen
	jr nz, .done
	push bc
	push de
	push hl
	call PartyCards_ShowTilemap
	pop hl
	pop de
	pop bc
.done
	pop af
	ret

ApplyTilemapNoSpriteUpdates::

	call PartyCards_OnScreen
	jr z, PartyCards_ShowTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 4
	jp DelayFrames

PartyCards_ShowTilemap:

	newfarcall PlaySpriteAnimations
	call DelayFrame
	call CopyTilemapAtOnce
	newfarjp PlaySpriteAnimations

PartyCards_OnScreen:

	ldh a, [hCGB]
	and a
	jr z, .no
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr z, .no
	ld a, [wAttrmap]
	cp BG_BANK1
	ret nz
	ld a, [wAttrmap + 1]
	cp BG_BANK1
	ret
.no
	or 1
	ret


PartyCardsNickname::


	call PartyCardsCheckOwnership
	jr c, .traded
	call LoadStandardMenuHeader
	call ClearSprites
	xor a
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	ld [wCurSpecies], a
	call GetBaseData

	ld b, NAME_MON
	ld de, wStringBuffer2
	newfarcall NamingScreen

	newfarcall IsNewNameEmpty
	jr c, .done
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
.done

	call ClearBGPalettes
	call ClearSprites
	call ExitMenu
	xor a
	ret

.traded
	ld hl, .TradedText
	call MenuTextboxBackup
	ld a, 1
	ret

.TradedText:
	text_ram wStringBuffer1
	text " came from"
	line "a trade. Its name"
	cont "can't be changed."
	prompt


PartyCardsCheckOwnership::
	ld a, MON_OT_ID
	call GetPartyParamLocation
	ld de, wPlayerID
	ld a, [de]
	cp [hl]
	jr nz, .other
	inc de
	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .other
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOTs
	call SkipNames
	ld de, wPlayerName
	ld b, NAME_LENGTH
.loop
	ld a, [de]
	cp [hl]
	jr nz, .other
	cp CHARVAL("@")
	jr z, .owned
	inc de
	inc hl
	dec b
	jr nz, .loop
.owned
	and a
	ret
.other
	scf
	ret

PartyCardsSwapItem::


	call PartyCards_HeldItem
	ld a, [hl]
	and a
	ld hl, .NotHoldingText
	jp z, .message
	ld d, a
	newfarcall ItemIsMail
	ld hl, .MailText
	jp c, .message

	ld a, [wCurPartyMon]
	push af
	inc a
	ld [wSwitchMon], a
	newfarcall HoldSwitchmonIcon
	ld a, PARTYMENUACTION_GIVE_ITEM
	ld [wPartyMenuActionText], a
	newfarcall InitPartyMenuWithCancel
	call DrawPartyCards
	call DrawPartyMenuBar
	call WaitBGMap
	call SetDefaultBGPAndOBP
	newfarcall PartyMenuSelect
	pop bc
	jp c, .cancel
	ld a, [wCurPartyMon]
	cp b
	jp z, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	ld hl, .EggText
	jr z, .target_message
	call PartyCards_HeldItem
	ld a, [hl]
	ld c, a
	and a
	jr z, .target_ok
	push bc
	ld d, a
	newfarcall ItemIsMail
	pop bc
	ld hl, .MailText
	jr c, .target_message
.target_ok

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop bc
	push bc
	ld a, b
	ld [wCurPartyMon], a
	call PartyCards_HeldItem
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	pop bc

	call PartyCards_HeldItem
	ld e, [hl]
	ld [hl], c
	push bc
	ld a, [wPartyMenuCursor]
	dec a
	ld [wCurPartyMon], a
	call PartyCards_HeldItem
	ld [hl], e
	pop bc
	ld a, c
	and a
	ld hl, .MovedText
	jr z, .done_message
	ld hl, .SwappedText
.done_message
	call .Cleanup
	call MenuTextboxBackup
	ld a, 3
	ret

.target_message
	push hl
	ld a, b
	ld [wCurPartyMon], a
	pop hl
	call .Cleanup
	call MenuTextboxBackup
	ld a, 3
	ret

.cancel
	ld a, b
	ld [wCurPartyMon], a
	call .Cleanup
	ld a, 3
	ret

.message
	call MenuTextboxBackup
	ld a, 3
	ret

.Cleanup:
	xor a
	ld [wSwitchMon], a
	ld [wPartyMenuActionText], a
	ret

.NotHoldingText:
	text_far _PokemonNotHoldingText
	text_end

.MailText:
	text "Mail can't be"
	line "moved this way."
	prompt

.EggText:
	text "An Egg can't hold"
	line "an item."
	prompt

.MovedText:
	text_ram wStringBuffer2
	text " is now"
	line "holding @"
	text_ram wStringBuffer3
	text "!"
	prompt

.SwappedText:
	text_ram wMonOrItemNameBuffer
	text " and"
	line "@"
	text_ram wStringBuffer2
	text " swapped"
	cont "their items!"
	prompt

PartyCards_HeldItem:

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ret

DEF PARTY_CARD_FOLLOWER_TILE EQU $3c

PartyCardsLoadFollowerBadge::
	ld de, .GFX
	ld hl, vTiles0 tile PARTY_CARD_FOLLOWER_TILE
	lb bc, BANK(.GFX), 1
	jp Request2bpp
.GFX
	INCBIN "gfx/stats/party_follower.2bpp"

PartyCardsDrawFollowerBadge::
	call PartyCards_OnScreen
	ret nz
PartyCardsPrepareFollowerBadge::
	ld a, [wFollowerMenuContext]
	and a
	ret z
	newfarcall GetFollowerSelection
	and a
	ret z
	ld b, a
	ld a, [wFollowerSelectionSuspended]
	and a
	ret nz
	ld a, [wPartyCount]
	cp b
	ret c
	ld a, b
	dec a
	push af
	call .Palette
	ld c, a
	pop af
	ld b, a
	and 1
	ld e, 78
	jr z, .x
	ld e, 158
.x
	ld a, b
	srl a
	ld d, a
	add a
	add a
	add d
	add a
	add a
	add a
	add 32
	ld d, a
	ld hl, wShadowOAMSprite24
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], PARTY_CARD_FOLLOWER_TILE
	inc hl
	ld [hl], c
	ret

.Palette
	ld e, 0
.candidate
	ld hl, wShadowOAMSprite00Attributes
	ld a, [wPartyCount]
	ld b, a
.check
	ld a, [hl]
	and 7
	cp e
	jr z, .used
	ld a, 4 * OBJ_SIZE
	add l
	ld l, a
	dec b
	jr nz, .check
	ld a, e
	push af
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wOBPals1
	add hl, de
	ld d, h
	ld e, l
	push de
	ld hl, .Colors
	ld bc, 1 palettes
	call CopyBytes
	pop de
	ld hl, wOBPals2 - wOBPals1
	add hl, de
	ld d, h
	ld e, l
	ld hl, .Colors
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	pop af
	ret
.used
	inc e
	jr .candidate
.Colors
	INCLUDE "gfx/stats/party_menu_bg.pal"
