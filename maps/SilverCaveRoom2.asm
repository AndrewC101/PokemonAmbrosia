	object_const_def
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3
    const SILVERCAVEROOM2_FIELDMON_1
    const SILVERCAVEROOM2_FIELDMON_2
    const SILVERCAVEROOM2_FIELDMON_3
    const SILVERCAVEROOM2_FIELDMON_4
    const SILVERCAVEROOM2_FIELDMON_5
    const SILVERCAVEROOM2_FIELDMON_6
    const SILVERCAVEROOM2_FIELDMON_7
    const SILVERCAVEROOM2_FIELDMON_8
    const SILVERCAVEROOM2_FIELDMON_9
    const SILVERCAVEROOM2_FIELDMON_10
    const SILVERCAVEROOM2_INVADER

SilverCaveRoom2_MapScripts:
	def_scene_scripts

	def_callbacks
 callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
	appear SILVERCAVEROOM2_FIELDMON_1
	appear SILVERCAVEROOM2_FIELDMON_2
	appear SILVERCAVEROOM2_FIELDMON_3
	appear SILVERCAVEROOM2_FIELDMON_4
	appear SILVERCAVEROOM2_FIELDMON_5
	appear SILVERCAVEROOM2_FIELDMON_6
	appear SILVERCAVEROOM2_FIELDMON_7
	appear SILVERCAVEROOM2_FIELDMON_8
	appear SILVERCAVEROOM2_FIELDMON_9
	appear SILVERCAVEROOM2_FIELDMON_10
	endcallback

SilverCaveRoom2FieldMon1Script:
	faceplayer
	cry MACHAMP
	pause 15
	loadwildmon MACHAMP, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SILVERCAVEROOM2_FIELDMON_1
	end

SilverCaveRoom2FieldMon2Script:
	faceplayer
	cry REUNICLUS
	pause 15
	loadwildmon REUNICLUS, 74
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SILVERCAVEROOM2_FIELDMON_2
	end

SilverCaveRoom2FieldMon3Script:
	faceplayer
	cry HERACROSS
	pause 15
	loadwildmon HERACROSS, 71
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear SILVERCAVEROOM2_FIELDMON_3
	end

SilverCaveRoom2FieldMon4Script:
	faceplayer
	cry CONKELDURR
	pause 15
	loadwildmon CONKELDURR, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear SILVERCAVEROOM2_FIELDMON_4
	end

SilverCaveRoom2FieldMon5Script:
	faceplayer
	cry URSALUNA
	pause 15
	loadwildmon URSALUNA, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SILVERCAVEROOM2_FIELDMON_5
	end

SilverCaveRoom2FieldMon6Script:
	faceplayer
	cry URSALUNA_B
	pause 15
	loadwildmon URSALUNA_B, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear SILVERCAVEROOM2_FIELDMON_6
	end

SilverCaveRoom2FieldMon7Script:
	faceplayer
	cry PORYGONZ
	pause 15
	loadwildmon PORYGONZ, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear SILVERCAVEROOM2_FIELDMON_7
	end

SilverCaveRoom2FieldMon8Script:
	faceplayer
	cry GALLADE
	pause 15
	loadwildmon GALLADE, 71
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear SILVERCAVEROOM2_FIELDMON_8
	end

SilverCaveRoom2FieldMon9Script:
	faceplayer
	cry GARDEVOIR
	pause 15
	loadwildmon GARDEVOIR, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear SILVERCAVEROOM2_FIELDMON_9
	end

SilverCaveRoom2FieldMon10Script:
	faceplayer
	cry TOGEKISS
	pause 15
	loadwildmon TOGEKISS, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear SILVERCAVEROOM2_FIELDMON_10
	end

SilverCaveRoom2Calcium:
	itemball RARE_CANDY

SilverCaveRoom2UltraBall:
	itemball RARE_CANDY

SilverCaveRoom2PPUp:
	itemball RARE_CANDY

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem AMBROSIA, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION

InvaderMaxScript:
	trainer INVADER, MAX, EVENT_BEAT_INVADER_MAX, InvaderMaxSeenText, InvaderMaxBeatenText, InvaderMaxVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderMaxAfterBattleText
	waitbutton
	closetext
	end

InvaderMaxSeenText:
    text "Welcome to"
    line "MT SILVER."

    para "You know what"
    line "you being here"
    cont "means?"

    para "It means you're"
    line "in the max level"
    cont "tier!"
	done

InvaderMaxVictoryText:
	text "Max SL fights"
	line "are boring."
	done

InvaderMaxBeatenText:
	text "What level"
	line "are you!"
	done

InvaderMaxAfterBattleText:
	text "If you need to"
	line "level up fast."

	para "Check out the"
	line "BATTLE TOWER"
	cont "CHAMP trial."
	done

SilverCaveRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 55, SILVER_CAVE_ROOM_1, 2
	warp_event 11,  1, SILVER_CAVE_ROOM_3, 1
	warp_event 13, 45, SILVER_CAVE_ITEM_ROOMS, 2
	warp_event 23, 27, SILVER_CAVE_ITEM_ROOMS, 1

	def_coord_events

	def_bg_events
	bg_event 14, 55, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

	def_object_events
	object_event 24, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event  4, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
	object_event 16, 52, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon1Script, EVENT_FIELD_MON_1
	object_event 19, 44, SPRITE_REUNICLUS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon2Script, EVENT_FIELD_MON_2
	object_event 14, 48, SPRITE_HERACROSS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon3Script, EVENT_FIELD_MON_3
	object_event  7, 39, SPRITE_CONKELDURR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon4Script, EVENT_FIELD_MON_4
	object_event 14, 41, SPRITE_URSALUNA, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon5Script, EVENT_FIELD_MON_5
	object_event 24, 54, SPRITE_URSALUNA_B, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon6Script, EVENT_FIELD_MON_6
	object_event 24, 55, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon7Script, EVENT_FIELD_MON_7
	object_event  5, 32, SPRITE_GALLADE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon8Script, EVENT_FIELD_MON_8
	object_event 10, 46, SPRITE_GARDEVOIR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon9Script, EVENT_FIELD_MON_9
	object_event 19, 29, SPRITE_TOGEKISS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2FieldMon10Script, EVENT_FIELD_MON_10
	;object_event 22, 52, SPRITE_GIOVANNI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderMaxScript, -1

	