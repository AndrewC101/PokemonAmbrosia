; StartMenu.Items indexes
	const_def
	const STARTMENUITEM_POKEDEX  ; 0
	const STARTMENUITEM_POKEMON  ; 1
	const STARTMENUITEM_PACK     ; 2
	const STARTMENUITEM_STATUS   ; 3
	const STARTMENUITEM_SAVE     ; 4
	const STARTMENUITEM_OPTION   ; 5
	const STARTMENUITEM_EXIT     ; 6
	const STARTMENUITEM_POKEGEAR ; 7
	const STARTMENUITEM_QUIT     ; 8
	const STARTMENUITEM_WARP     ; 9

StartMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ld hl, .MenuHeader
	jr z, .GotMenuData
	ld hl, .ContestMenuHeader

.GotMenuData:
	call LoadMenuHeader
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a
	call .DrawMenuClockTextBox
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatusBox
	call SafeUpdateSprites
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	farcall LoadFonts_NoOAMUpdate
	call .DrawBugContestStatus
	call UpdateTimePals
	jr .Select

.Reopen:
	call UpdateSprites
	call UpdateTimePals
	call .SetUpMenuItems
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a

.Select:
	call .GetInput
	jr c, .Exit
	call ._DrawMenuClockTextBox
	ld a, [wMenuCursorPosition]
	ld [wBattleMenuCursorPosition], a
	call PlayClickSFX
	call PlaceHollowCursor
	call .OpenMenu

; Menu items have different return functions.
; For example, saving exits the menu.
	ld hl, .MenuReturns
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuReturns:
	dw .Reopen
	dw .Exit
	dw .ExitMenuCallFuncCloseText
	dw .ExitMenuRunScriptCloseText
	dw .ExitMenuRunScript
	dw .ReturnEnd
	dw .ReturnRedraw

.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
.ReturnEnd:
	call ExitMenu
.ReturnEnd2:
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
; Return carry on exit, and no-carry on selection.
	xor a
	ldh [hBGMapMode], a
	call ._DrawMenuClockTextBox
	call SetUpMenu
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call .PrintMenuClock
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b
	cp A_BUTTON
	jr z, .a
	jr .loop
.a
	call PlayClickSFX
	and a
	ret
.b
	scf
	ret

.ExitMenuRunScript:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.ExitMenuRunScriptCloseText:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	jr .ReturnEnd2

.ExitMenuCallFuncCloseText:
	call ExitMenu
	ld hl, wQueuedScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wQueuedScriptBank]
	rst FarCall
	jr .ReturnEnd2

.ReturnRedraw:
	call .Clear
	jp .Reopen

.Clear:
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call .DrawMenuClockTextBox
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatus
	call UpdateSprites
	call GSReloadPalettes
	call FinishExitMenu
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.ContestMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 2, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_ENABLE_START ; flags
	dn 0, 0 ; rows, columns
	dw wMenuItemsList
	dw .MenuString
	dw .Items

.Items:
; entries correspond to STARTMENUITEM_* constants
    dw StartMenu_Pokedex,  .PokedexString,  .EmptyDesc
	dw StartMenu_Pokemon,  .PartyString,    .EmptyDesc
	dw StartMenu_Pack,     .PackString,     .EmptyDesc
	dw StartMenu_Status,   .StatusString,   .EmptyDesc
	dw StartMenu_Save,     .SaveString,     .EmptyDesc
	dw StartMenu_Option,   .OptionString,   .EmptyDesc
	dw StartMenu_Exit,     .ExitString,     .EmptyDesc
	dw StartMenu_Pokegear, .PokegearString, .EmptyDesc
	dw StartMenu_Quit,     .QuitString,     .EmptyDesc
	dw StartMenu_Warp,     .WarpString,     .EmptyDesc

.PokedexString:  db "#DEX@"
.PartyString:    db "#MON@"
.PackString:     db "PACK@"
.StatusString:   db "<PLAYER>@"
.SaveString:     db "SAVE@"
.OptionString:   db "OPTION@"
.ExitString:     db "EXIT@"
.PokegearString: db "<POKE>GEAR@"
.QuitString:     db "QUIT@"
.WarpString:     db "WARP@"

.EmptyDesc:
	db   "@"

.OpenMenu:
	ld a, [wMenuSelection]
	call .GetMenuEmptyTextPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuString:
	push de
	ld a, [wMenuSelection]
	call .GetMenuEmptyTextPointer
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.MenuClockText:
    push bc
    push de
    push hl
    ldh a, [hHours]
    ld b, a
    ldh a, [hMinutes]
    ld c, a
    decoord 1, 14
    farcall PrintHoursMins

	ld hl, .MenuTodayText
	bccoord 1, 13
	call PlaceHLTextAtBC

    hlcoord 1, 16
	call .PlaceWeatherString

    pop hl
    pop de
    pop bc
    ret

.MenuTodayText:
	text_far _GearTodayText
	text_end

.PlaceWeatherString:
	push hl
	ld a, [wFieldWeather]
	ld e, a
	ld d, 0
	ld hl, .WeatherStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.WeatherStrings:
; entries correspond to wCurDay constants (see constants/wram_constants.asm)
	dw .ClearSkies
	dw .Raining
	dw .Sunny
	dw .Sandy

.ClearSkies:   db "CLEAR@"
.Raining:      db "RAINING@"
.Sunny:        db "SUNNY DAY@"
.Sandy:        db "SANDSTORM@"

.GetMenuEmptyTextPointer:
	ld e, a
	ld d, 0
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 6
	add hl, de
endr
	ret

.SetUpMenuItems:
	xor a
	ld [wWhichIndexSet], a
	call .FillMenuList

	ld hl, wStatusFlags
	bit STATUSFLAGS_POKEDEX_F, [hl]
	jr z, .no_pokedex
	ld a, STARTMENUITEM_POKEDEX
	call .AppendMenuList
.no_pokedex

	ld a, [wPartyCount]
	and a
	jr z, .no_pokemon
	ld a, STARTMENUITEM_POKEMON
	call .AppendMenuList
.no_pokemon

	ld a, [wLinkMode]
	and a
	jr nz, .no_pack
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .no_pack
	ld a, STARTMENUITEM_PACK
	call .AppendMenuList
.no_pack

	ld hl, wPokegearFlags
	bit POKEGEAR_OBTAINED_F, [hl]
	jr z, .no_pokegear
	ld a, STARTMENUITEM_POKEGEAR
	call .AppendMenuList
.no_pokegear

	ld a, STARTMENUITEM_STATUS
	call .AppendMenuList

	ld a, [wLinkMode]
	and a
	jr nz, .no_save
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ld a, STARTMENUITEM_QUIT
	jr nz, .write
	ld a, STARTMENUITEM_SAVE
.write
	call .AppendMenuList
.no_save

	ld a, STARTMENUITEM_OPTION
	call .AppendMenuList

	; Bug Catching contest must always have the Exit Option
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .bug_contest_or_fast_travel_not_obtained

	; check if end game fast travel has been obtained
	ld hl, wPokegearFlags
	bit POKEGEAR_WARP_F, [hl]
	jr z, .bug_contest_or_fast_travel_not_obtained
	ld a, STARTMENUITEM_WARP
	call .AppendMenuList
	jr .next

.bug_contest_or_fast_travel_not_obtained
	ld a, STARTMENUITEM_EXIT
	call .AppendMenuList
.next
	ld a, c
	ld [wMenuItemsList], a
	ret

.FillMenuList:
	xor a
	ld hl, wMenuItemsList
	ld [hli], a
	ld a, -1
	ld bc, wMenuItemsListEnd - (wMenuItemsList + 1)
	call ByteFill
	ld de, wMenuItemsList + 1
	ld c, 0
	ret

.AppendMenuList:
	ld [de], a
	inc de
	inc c
	ret

.DrawMenuClockTextBox:
	jr ._DrawMenuClockTextBox

.PrintMenuClock:
	call .IsMenuClockOn
	ret z
    call ._DrawMenuClockTextBox
	jp .MenuClockText

._DrawMenuClockTextBox:
	call .IsMenuClockOn
	ret z
    hlcoord 0, 12
	lb bc, 4, 9
	jp Textbox

.IsMenuClockOn:
	ld a, [wOptions2]
	and 1 << MENU_CLOCK
	ret

.DrawBugContestStatusBox:
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ret z
	farcall StartMenu_DrawBugContestStatusBox
	ret

.DrawBugContestStatus:
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .contest
	ret
.contest
	farcall StartMenu_PrintBugContestStatus
	ret

StartMenu_Warp:
    ld a, [wReachedHallOfOrigin]
    and a
    jr nz, .hallOfOriginWarp
	call DefaultWarp
	jr StartMenu_Exit
.hallOfOriginWarp
    call HallOfOriginWarp
StartMenu_Exit:
; Exit the menu.

	ld a, 1
	ret

StartMenu_Quit:
; Retire from the bug catching contest.

	ld hl, .StartMenuContestEndText
	call StartMenuYesNo
	jr c, .DontEndContest
	ld a, BANK(BugCatchingContestReturnToGateScript)
	ld hl, BugCatchingContestReturnToGateScript
	call FarQueueScript
	ld a, 4
	ret

.DontEndContest:
	ld a, 0
	ret

.StartMenuContestEndText:
	text_far _StartMenuContestEndText
	text_end

StartMenu_Save:
; Save the game.

	call BufferScreen
	farcall SaveMenu
	jr nc, .saved
	ld a, 0
	ret

.saved
	ld a, 1
	ret

StartMenu_Option:
; Game options.

	call FadeToMenu
	farcall Option
	ld a, 6
	ret

StartMenu_Status:
; Player status.

	call FadeToMenu
	farcall TrainerCard
	call CloseSubmenu
	ld a, 0
	ret

StartMenu_Pokedex:
	ld a, [wPartyCount]
	and a
	jr z, .empty

	call FadeToMenu
	farcall Pokedex
	call CloseSubmenu

.empty
	ld a, 0
	ret

StartMenu_Pokegear:
	call FadeToMenu
	farcall PokeGear
	call CloseSubmenu
	ld a, 0
	ret

StartMenu_Pack:
	call FadeToMenu
	farcall Pack
	ld a, [wPackUsedItem]
	and a
	jr nz, .used_item
	call CloseSubmenu
	ld a, 0
	ret

.used_item
	call ExitAllMenus
	ld a, 4
	ret

HallOfOriginWarpLocations:
	table_width 2
	map_id NEW_BARK_TOWN
	map_id RUINS_OF_ALPH_OUTSIDE
	map_id GOLDENROD_CITY
	map_id BLACKTHORN_CITY
	map_id ROUTE_23
	map_id PALLET_TOWN
	map_id SAFFRON_CITY
	map_id CELADON_CITY
	map_id BATTLE_TOWER_OUTSIDE
	map_id SILVER_CAVE_OUTSIDE
	map_id DESTINY_FRONTIER
	map_id HALL_OF_ORIGIN
	map_id MANOR_OUTSIDE
DEF NUM_FAST_TRAVEL_HALL_OF_ORIGIN EQU (@ - {CURRENT_TABLE_START}) / CURRENT_TABLE_WIDTH

DefaultWarpLocations:
	table_width 2
	map_id NEW_BARK_TOWN
	map_id RUINS_OF_ALPH_OUTSIDE
	map_id GOLDENROD_CITY
	map_id BLACKTHORN_CITY
	map_id ROUTE_23
	map_id PALLET_TOWN
	map_id SAFFRON_CITY
	map_id CELADON_CITY
	map_id BATTLE_TOWER_OUTSIDE
	map_id SILVER_CAVE_OUTSIDE
DEF NUM_FAST_TRAVEL_DEFAULT EQU (@ - {CURRENT_TABLE_START}) / CURRENT_TABLE_WIDTH

HallOfOriginWarp::
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [wMenuSelection], a
	call SetUpTextbox
.loop
	ld hl, .WhereToText
	call PrintText
	call DelayFrame
	call UpdateSprites
	call HallOfOriginWarpLocationMenu
	ret z
	ld hl, HallOfOriginWarpLocations
	ld bc, 2
	dec a
	call AddNTimes
	push hl
	pop hl
; Default warp number
; change if your maps use 0-based or a different default
	ld a, 1
	ld [wNextWarp], a
	ld a, [hli]
	ld [wNextMapGroup], a
	ld a, [hli]
	ld [wNextMapNumber], a
	ld a, MAPSETUP_DOOR
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
; play warping sound effect
    call WaitSFX
    ld de, SFX_WARP_TO
    call PlaySFX
	ret
.WhereToText
	text "Where would you"
	line "like to go?"
	done

HallOfOriginWarpLocationMenu:
	ld hl, .HallOfOriginMenuHeader
	call CopyMenuHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorPosition], a
	xor a
	ld [wWhichIndexSet], a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done
.cancel
	xor a
	ret
.done
	ret

.HallOfOriginMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 18, 10
	dw .HallOfOriginMenuData
	db 1 ; default option
	db 0
.HallOfOriginMenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	; if "columns" is > 0, a second menu function is expected,
	; and the game will crash if it does not exist!
	db 5, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .HallOfOriginMaps
	dba .PrintHallOfOriginMapNames
	dba NULL
	dba NULL

.HallOfOriginMaps:
	db NUM_FAST_TRAVEL_HALL_OF_ORIGIN
for x, NUM_FAST_TRAVEL_HALL_OF_ORIGIN
	db x + 1
endr
	db -1

.PrintHallOfOriginMapNames:
	push de
	ld a, [wMenuSelection]
	call HallOfOriginGetName
	pop hl
	call FarPlaceString
	ret
HallOfOriginGetName:
	ld hl, HallOfOriginWarpStrings
	ld bc, 3
	dec a
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ret
HallOfOriginWarpStrings:
	table_width 3
	dba NewBarkTownName
	dba RuinsOfAlphName
	dba GoldenrodCityName
	dba BlackthornCityName
	dba IndigoPlateauName
	dba PalletTownName
	dba SaffronCityName
	dba CeladonCityName
	dba BattleTowerName
	dba SilverCaveName
	dba DestinyTowerName
	dba HallOfOriginName
	dba ManorName

DefaultWarp::
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [wMenuSelection], a
	call SetUpTextbox
.loop
	ld hl, .WhereToText
	call PrintText
	call DelayFrame
	call UpdateSprites
	call DefaultWarpLocationMenu
	ret z
	ld hl, DefaultWarpLocations
	ld bc, 2
	dec a
	call AddNTimes
	push hl
	pop hl
; Default warp number
; change if your maps use 0-based or a different default
	ld a, 1
	ld [wNextWarp], a
	ld a, [hli]
	ld [wNextMapGroup], a
	ld a, [hli]
	ld [wNextMapNumber], a
	ld a, MAPSETUP_DOOR
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
; play warping sound effect
    call WaitSFX
    ld de, SFX_WARP_TO
    call PlaySFX
	ret
.WhereToText
	text "Where would you"
	line "like to go?"
	done

DefaultWarpLocationMenu:
	ld hl, .DefaultMenuHeader
	call CopyMenuHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorPosition], a
	xor a
	ld [wWhichIndexSet], a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done
.cancel
	xor a
	ret
.done
	ret

.DefaultMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 18, 10
	dw .DefaultMenuData
	db 1 ; default option
	db 0
.DefaultMenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	; if "columns" is > 0, a second menu function is expected,
	; and the game will crash if it does not exist!
	db 5, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .DefaultMaps
	dba .PrintDefaultMapNames
	dba NULL
	dba NULL

.DefaultMaps:
	db NUM_FAST_TRAVEL_DEFAULT
for x, NUM_FAST_TRAVEL_DEFAULT
	db x + 1
endr
	db -1

.PrintDefaultMapNames:
	push de
	ld a, [wMenuSelection]
	call DefaultGetName
	pop hl
	call FarPlaceString
	ret
DefaultGetName:
	ld hl, DefaultWarpStrings
	ld bc, 3
	dec a
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ret
DefaultWarpStrings:
	table_width 3
	dba NewBarkTownName
	dba RuinsOfAlphName
	dba GoldenrodCityName
	dba BlackthornCityName
	dba IndigoPlateauName
	dba PalletTownName
	dba SaffronCityName
	dba CeladonCityName
	dba BattleTowerName
	dba SilverCaveName

StartMenu_Pokemon:
	ld a, [wPartyCount]
	and a
	jr z, .return

	call FadeToMenu

.choosemenu
	xor a
	ld [wPartyMenuActionText], a ; Choose a POKéMON.
	call ClearBGPalettes

.menu
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

.menunoreload
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes ; load regular palettes?
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .return ; if cancelled or pressed B

	call PokemonActionSubmenu
	cp 3
	jr z, .menu
	cp 0
	jr z, .choosemenu
	cp 1
	jr z, .menunoreload
	cp 2
	jr z, .quit

.return
	call CloseSubmenu
	ld a, 0
	ret

.quit
	ld a, b
	push af
	call ExitAllMenus
	pop af
	ret
