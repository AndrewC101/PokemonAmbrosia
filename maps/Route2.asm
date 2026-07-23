object_const_def
	const ROUTE2_BUG_CATCHER_ED
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_FIELDMON_3
	const ROUTE2_FIELDMON_7
	const ROUTE2_FIELDMON_8

Route2_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route2FieldMon

.Route2FieldMon:
; Pokemon which always appear
    appear ROUTE2_FIELDMON_3
    appear ROUTE2_FIELDMON_8

; Pokemon that sometimes appear
    random 3
    ifequal 1, .spawn6
    disappear ROUTE2_FIELDMON_7
    sjump .end
.spawn6
    appear ROUTE2_FIELDMON_7

.end
    endcallback

Route2FieldMon3Script:
	faceplayer
	cry BULBASAUR
	pause 15
	loadwildmon BULBASAUR, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE2_FIELDMON_3
	end

Route2FieldMon7Script:
	faceplayer
	cry SCOLIPEDE
	pause 15
	loadwildmon SCOLIPEDE, 60
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE2_FIELDMON_7
	end

Route2FieldMon8Script:
	faceplayer
	cry HERACROSS
	pause 15
	loadwildmon HERACROSS, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE2_FIELDMON_8
	end

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2MaxPotion:
	itemball QUICK_CLAW

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

BugCatcherEdSeenText:
	text "All things decay."
	para "One day nobody"
	line "will remember how"
	cont "magnificent"
	cont "Viridian Forest"
	cont "used to be."
	done

BugCatcherEdBeatenText:
	text "All things decay."
	done

BugCatcherEdAfterBattleText:
	text "Maybe one day the"
	line "forest will grow"
	cont "back."
	para "Bugs always find a"
	line "way."
	done

Route2SignText:
	text "Route 2"

	para "Viridian City -"
	line "Pewter City"
	done

Route2DiglettsCaveSignText:
	text "Digletts's Cave"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 23, 31, ROUTE_2_GATE, 3
	warp_event 24, 27, ROUTE_2_GATE, 1
	warp_event 25, 27, ROUTE_2_GATE, 2
	warp_event 20,  7, DIGLETTS_CAVE, 3
	warp_event 10, 30, VIRIDIAN_FOREST, 1
	warp_event 11, 30, VIRIDIAN_FOREST, 2
	warp_event 10, 11, VIRIDIAN_FOREST, 3
	warp_event 11, 11, VIRIDIAN_FOREST, 4

	def_coord_events

	def_bg_events
	bg_event 15, 51, BGEVENT_READ, Route2Sign
	bg_event 19,  9, BGEVENT_READ, Route2DiglettsCaveSign
	;bg_event 13, 32, BGEVENT_ITEM, Route2HiddenFullRestore
	;bg_event 17, 32, BGEVENT_ITEM, Route2HiddenRevive

	def_object_events
	object_event 14,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event 17, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event 27,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 22, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 24, 43, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2FieldMon3Script, EVENT_FIELD_MON_3
	object_event  0, 37, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route2FieldMon7Script, EVENT_FIELD_MON_7
	object_event  3, 34, SPRITE_HERACROSS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2FieldMon8Script, EVENT_FIELD_MON_8
