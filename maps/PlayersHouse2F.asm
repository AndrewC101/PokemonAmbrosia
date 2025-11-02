	object_const_def
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetUpTileDecorations

.DummyScene: ; unreferenced
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

.SetUpTileDecorations:
	special ToggleMaptileDecorations
	endcallback

	db 0, 0, 0 ; unused

PlayersHouseDoll1Script::
	describedecoration DECODESC_LEFT_DOLL

PlayersHouseDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

PlayersHouseBigDollScript:
	describedecoration DECODESC_BIG_DOLL

PlayersHouseGameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .wallaceBeaten
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_ROCKET_HIDEOUT
	opentext
	writetext PlayersRadioText1
	waitbutton
	writetext PlayersRadioText2
	waitbutton
	writetext PlayersRadioText3
	waitbutton
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

.wallaceBeaten:
    opentext
    writetext WallaceBeatenRadioPH
    waitbutton
    closetext
    end

WallaceBeatenRadioPH:
	text "The war is over!"
	para "The new CHAMPION"
	line "<PLAYER> from"
	cont "NEW BARK TOWN"
	cont "defeated WALLACE"
	cont "and has saved us"
	cont "all!"
	cont "Rejoice!"
	done

PlayersHouseBookshelfScript:
	opentext
	writetext PlayersBooksText
	waitbutton
	closetext
	end

PlayersBooksText:
	text "A photo album lies"
	line "open."
	para "Happy pictures of"
	line "Mum and Dad stare"
	cont "up from the page."
	done

PlayersHouseTVScript:
	opentext
	writetext PlayersTVText
	waitbutton
	closetext
	end

PlayersTVText:
	text "A speedrun of a"
	line "popular RPG is on"
	cont "TV."
	done

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

; On first time all 4 are played
; After that only Text4 is played
; After getting a mon normal radio is played

PlayersRadioText1:
	text "Breaking news!"

	para "The HOENN fleet"
	line "have been seen"
	cont "mobilising near"
	cont "the coast."
	done

PlayersRadioText2:
	text "Invasion of KANTO"
	line "seems imminent."
	done

PlayersRadioText3:
	text "EMPEROR WALLACE"
	line "has taken control"
	cont "after a failed"
	cont "coup."
	para "Driven by the"
	line "assassination of"
	cont "CHAMPION STEVEN"
	cont "6 months ago."
	done

PlayersRadioText4:
	text "The HOENN war is"
	line "inevitable now."

	para "ARCEUS guide us."
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouseTVScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript

	def_object_events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseGameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseBigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
