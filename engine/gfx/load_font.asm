INCLUDE "gfx/font.asm"

EnableHDMAForGraphics:
	db FALSE

Get1bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get1bppViaHDMA
	jp Get1bpp

Get2bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get2bppViaHDMA
	jp Get2bpp

_LoadStandardFont::
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 128 ; 'A' to '9'
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jp z, Copy1bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 32 ; 'A' to ']'
	call Get1bppViaHDMA
	ld de, Font + 32 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Font), 32 ; 'a' to $bf
	call Get1bppViaHDMA
	ld de, Font + 64 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 32 ; 'Ä' to '←'
	call Get1bppViaHDMA
	ld de, Font + 96 * TILE_1BPP_SIZE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Font), 32 ; '\'' to '9'
	call Get1bppViaHDMA
	ret

_LoadFontsExtra1::
	ld de, FontsExtra_SolidBlackGFX
	ld hl, vTiles2 tile '■' ; $60
	lb bc, BANK(FontsExtra_SolidBlackGFX), 1
	call Get1bppViaHDMA
	ld de, PokegearPhoneIconGFX
	ld hl, vTiles2 tile '☎' ; $62
	lb bc, BANK(PokegearPhoneIconGFX), 1
	call Get2bppViaHDMA
	ld de, FontExtra + 3 tiles ; '<BOLD_D>'
	ld hl, vTiles2 tile '<BOLD_D>'
	lb bc, BANK(FontExtra), 22 ; '<BOLD_D>' to 'ぉ'
	call Get2bppViaHDMA
	jr LoadFrame

_LoadFontsExtra2::
	ld de, FontsExtra2_UpArrowGFX
	ld hl, vTiles2 tile '▲' ; $61
	ld b, BANK(FontsExtra2_UpArrowGFX)
	ld c, 1
	call Get2bppViaHDMA
	ret

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bppViaHDMA
	jr LoadFrame

LoadFrame:
	ld a, [wTextboxFrame]
	maskbits NUM_FRAMES
	ld bc, TEXTBOX_FRAME_TILES * TILE_1BPP_SIZE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile '┌' ; $79
	lb bc, BANK(Frames), TEXTBOX_FRAME_TILES ; '┌' to '┘'
	call Get1bppViaHDMA
	ld hl, vTiles2 tile ' ' ; $7f
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	call Get1bppViaHDMA
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bppViaHDMA
	ld hl, vTiles2 tile $70
	ld de, FontBattleExtra + 16 tiles ; '<DO>'
	lb bc, BANK(FontBattleExtra), 3 ; '<DO>' to '『'
	call Get2bppViaHDMA
	call LoadFrame

LoadHPBar:
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bppViaHDMA
	ld de, MobilePhoneTilesGFX + 7 tiles ; mobile phone icon
	ld hl, vTiles2 tile $5e
	lb bc, BANK(MobilePhoneTilesGFX), 2
	call Get2bppViaHDMA
	ret

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX + 3 * TILE_1BPP_SIZE
	ld hl, vTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bppViaHDMA
LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 17
	call Get2bppViaHDMA
	ret

LoadPlayerStatusIcon:
	push de
	ld de, wBattleMonStatus
	call GetStatusConditionIndex_Font
	ld hl, StatusIconGFX
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles1 tile $5b
	lb bc, BANK(StatusIconGFX), 2
	call Request2bpp
	farcall LoadPlayerStatusIconPalette
	pop de
	ret

LoadStatusIcons:
	call LoadPlayerStatusIcon
	; fallthrough

LoadEnemyStatusIcon:
	push de
	ld de, wEnemyMonStatus
	call GetStatusConditionIndex_Font

	ld hl, EnemyStatusIconGFX
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles1 tile $5d
	lb bc, BANK(EnemyStatusIconGFX), 2
	call Request2bpp
	farcall LoadEnemyStatusIconPalette
	pop de
	ret

GetStatusConditionIndex_Font:
; de points to status, e.g. from a party_struct or battle_struct
; return the status condition index in a
	ld a, [de]
	ld b, a
	and SLP
	ld a, 0 ; no-optimize a = 0
	jr nz, .slp
	bit PSN, b
	jr nz, .psn
	bit PAR, b
	jr nz, .par
	bit BRN, b
	jr nz, .brn
	bit FRZ, b
	jr nz, .frz
	ret
.frz
	inc a ; 5
.brn
	inc a ; 4
.slp
	inc a ; 3
.par
	inc a ; 2
.psn
	inc a ; 1
	ret
