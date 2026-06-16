_TypeChart:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a

	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD

	ld hl, TypeChartPalettes
	ld de, wBGPals1
	ld bc, 12 palettes
	call FarCopyColorWRAM

	ld a, $1
	ldh [rVBK], a
	ld hl, TypeChartBG0GFX
	ld de, vTiles4
	call Decompress
	xor a
	ldh [rVBK], a

	ld hl, TypeChartBG1GFX
	ld de, vTiles2
	lb bc, BANK(TypeChartBG1GFX), 33
	call DecompressRequest2bpp

	ld hl, TypeChartOBGFX
	ld de, vTiles0
	lb bc, BANK(TypeChartOBGFX), 32
	call DecompressRequest2bpp

	; Battle can enter here with active sprite anim state. Clear it so the
	; chart's fixed OAM data isn't immediately overwritten on the next frame.
	farcall ClearSpriteAnims

	ld hl, TypeChartOAMData
	ld de, wShadowOAM
	ld bc, 40 * 4
	call CopyBytes

	ld a, 8
	call SkipMusic

	ld a, %11100111
	ldh [rLCDC], a

	xor a
	ldh [hBGMapMode], a

	ld hl, TypeChartTilemap
	decoord 0, 0
	call Decompress

	ld hl, TypeChartAttrmap
	decoord 0, 0, wAttrmap
	call Decompress

	call WaitBGMap2
	call SetDefaultBGPAndOBP

	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .done
	call DelayFrame
	jr .loop

.done
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

	pop af
	ld [wStateFlags], a

	pop af
	ldh [hInMenu], a

	jp ClearBGPalettes

TypeChartPalettes:
INCLUDE "gfx/type_chart/type_chart.pal"

TypeChartBG0GFX:
INCBIN "gfx/type_chart/bg0.2bpp.lz"

TypeChartBG1GFX:
INCBIN "gfx/type_chart/bg.2bpp.vram2p.lz"

TypeChartOBGFX:
INCBIN "gfx/type_chart/ob.2bpp.lz"

TypeChartTilemap:
INCBIN "gfx/type_chart/type_chart.tilemap.lz"

TypeChartAttrmap:
INCBIN "gfx/type_chart/type_chart.attrmap.lz"

TypeChartOAMData:
MACRO? oamdata
	db (\2) + 16, (\1) + 8, (\3), (\4)
ENDM
	; binding
	oamdata   0,   0, $00, 0
	oamdata   0,  16, $00, 0
	oamdata   0,  32, $00, 0
	oamdata   0,  48, $00, 0
	oamdata   0,  64, $00, 0
	oamdata   0,  80, $00, 0
	oamdata   0,  96, $00, 0
	oamdata   0, 112, $00, 0
	oamdata   0, 128, $00, 0
	; DEF
	oamdata  16,   0, $02, 3
	oamdata  24,   0, $04, 3
	; top Ghost+Steel
	oamdata  82,   0, $06, 1
	oamdata  90,   0, $08, 1
	oamdata  82,  16, $0a, 1
	oamdata  90,  16, $0c, 2
	; left Ghost+Steel
	oamdata   8,  66, $0e, 1
	oamdata  16,  66, $10, 1
	oamdata  24,  66, $12, 1
	oamdata  32,  66, $14, 1
	; ineffective
	oamdata  90,  31, $16, 1
	oamdata  48,  38, $16, 1
	oamdata  34,  59, $16, 1
	oamdata  62,  94, $16, 1
	oamdata 146, 101, $16, 1
	; not very effective
	oamdata  69,  18, $18, 2
	oamdata 90, 67, $18, 2
	oamdata 90, 130, $18, 2
	oamdata 153, 123, $18, 2
	oamdata 132, 123, $18, 2
	; super effective
	oamdata  32,  25, $1a, 2
	; top off-white
	; top off-white
	oamdata  54,   8, $1c, 3 ; Normal x1 Poison
	oamdata  96,   8, $1c, 3 ; Normal x1 Fire
	oamdata 110,   8, $1c, 3 ; Normal x1 Grass
	oamdata 124,   8, $1c, 3 ; Normal x1 Psychic
	oamdata 138,   8, $1c, 3 ; Normal x1 Dragon
	oamdata 152,   8, $1c, 3 ; Normal x1 Fairy
	; left off-white
	oamdata  32,  30, $1e, 3 ; Poison x1 Normal
	oamdata  32,  44, $1e, 3 ; Rock x1 Normal
	oamdata  32,  72, $1e, 3 ; Fire x1 Normal
	oamdata  32,  86, $1e, 3 ; Grass x1 Normal
	oamdata  32, 100, $1e, 3 ; Psychic x1 Normal
	oamdata  32, 114, $1e, 3 ; Dragon x1 Normal
	oamdata  32, 128, $1e, 3 ; Fairy x1 Normal
