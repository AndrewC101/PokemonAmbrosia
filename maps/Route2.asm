	object_const_def
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_POKE_BALL4
	const ROUTE2_FRUIT_TREE
	const ROUTE2_FIELDMON_1
    const ROUTE2_FIELDMON_2
    const ROUTE2_FIELDMON_3
    const ROUTE2_FIELDMON_4
    const ROUTE2_FIELDMON_5
    const ROUTE2_FIELDMON_6
    const ROUTE2_FIELDMON_7
    const ROUTE2_FIELDMON_8

Route2_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route2FieldMon

.Route2FieldMon:
; Pokemon which always appear
    appear ROUTE2_FIELDMON_1
    appear ROUTE2_FIELDMON_3
    appear ROUTE2_FIELDMON_4
    appear ROUTE2_FIELDMON_5
    appear ROUTE2_FIELDMON_6
    appear ROUTE2_FIELDMON_8

; Pokemon that sometimes appear
    random 3
    ifequal 1, .spawn6
    disappear ROUTE2_FIELDMON_7
    sjump .checkNight
.spawn6
    appear ROUTE2_FIELDMON_7

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE2_FIELDMON_2
    disappear ROUTE2_FIELDMON_3

.end
    endcallback

Route2FieldMon1Script:
	trainer STARAVIA, FIELD_MON, EVENT_FIELD_MON_1, Route2PokemonAttacksText, 22, 0, .script
.script
    disappear ROUTE2_FIELDMON_1
    end

Route2FieldMon2Script:
	trainer HOUNDOUR, FIELD_MON, EVENT_FIELD_MON_2, Route2PokemonAttacksText, 25, 0, .script
.script
    disappear ROUTE2_FIELDMON_2
    end

Route2PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route2FieldMon3Script:
	faceplayer
	cry BULBASAUR
	pause 15
	loadwildmon BULBASAUR, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE2_FIELDMON_3
	end

Route2FieldMon4Script:
	faceplayer
	cry MEOWTH
	pause 15
	loadwildmon MEOWTH, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE2_FIELDMON_4
	end

Route2FieldMon5Script:
	faceplayer
	cry JOLTIK
	pause 15
	loadwildmon JOLTIK, 22
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE2_FIELDMON_5
	end

Route2FieldMon6Script:
	faceplayer
	cry LARVESTA
	pause 15
	loadwildmon LARVESTA, 24
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE2_FIELDMON_6
	end

Route2FieldMon7Script:
	faceplayer
	cry BUTTERFREE
	pause 15
	loadwildmon BUTTERFREE, 60
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

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
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

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2DireHit:
	itemball TM_GIGA_DRAIN

Route2MaxPotion:
	itemball QUICK_CLAW

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

Route2FruitTree:
	fruittree FRUITTREE_ROUTE_2

Route2HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

Route2HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

BugCatcherRobSeenText:
	text "Doug thinks his"
	line "#mon are the"
	cont "rulers of the"
	cont "colony."
	para "I have no choice"
	line "but to destroy"
	cont "him!"
	done

BugCatcherRobBeatenText:
	text "I have lost my"
	line "sovereignty."
	done

BugCatcherRobAfterBattleText:
	text "This is just one"
	line "battle."
	para "Among Bugs the"
	line "wars never end."
	done

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

BugCatcherDougSeenText:
	text "My #mon rule"
	line "the colony."
	para "Rob shall never"
	line "dethrone me."
	para "Nor shall you!"
	done

BugCatcherDougBeatenText:
	text "Treason!"
	done

BugCatcherDougAfterBattleText:
	text "Robs #mon"
	line "shall make fine"
	cont "drones."
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

	def_coord_events

	def_bg_events
	bg_event 15, 51, BGEVENT_READ, Route2Sign
	bg_event 19,  9, BGEVENT_READ, Route2DiglettsCaveSign
	bg_event 15, 23, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event 12, 14, BGEVENT_ITEM, Route2HiddenFullHeal
	;bg_event 13, 32, BGEVENT_ITEM, Route2HiddenFullRestore
	;bg_event 17, 32, BGEVENT_ITEM, Route2HiddenRevive

	def_object_events
	object_event 18, 45, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event 14,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event  8, 40, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event  8, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event 17, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event 27,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 22, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 19, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree, -1
	object_event 15, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route2FieldMon1Script, EVENT_FIELD_MON_1
	object_event  2,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route2FieldMon2Script, EVENT_FIELD_MON_2
	object_event 24, 43, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2FieldMon3Script, EVENT_FIELD_MON_3
	object_event  5, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2FieldMon4Script, EVENT_FIELD_MON_4
	object_event 14, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2FieldMon5Script, EVENT_FIELD_MON_5
	object_event  2, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2FieldMon6Script, EVENT_FIELD_MON_6
	object_event  0, 37, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route2FieldMon7Script, EVENT_FIELD_MON_7
	object_event  3, 34, SPRITE_HERACROSS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2FieldMon8Script, EVENT_FIELD_MON_8
	