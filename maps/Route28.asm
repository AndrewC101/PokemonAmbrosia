	object_const_def
	const ROUTE28_LATIOS
    const ROUTE28_FIELDMON_1
    const ROUTE28_FIELDMON_2
    const ROUTE28_FIELDMON_3
    const ROUTE28_FIELDMON_4
    const ROUTE28_FIELDMON_5
    const ROUTE28_FIELDMON_6
    const ROUTE28_FIELDMON_7
    const ROUTE28_FIELDMON_8
    const ROUTE28_FIELDMON_9
    const ROUTE28_FIELDMON_10

Route28_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
	appear ROUTE28_FIELDMON_1
	appear ROUTE28_FIELDMON_2
	appear ROUTE28_FIELDMON_3
	appear ROUTE28_FIELDMON_4
	appear ROUTE28_FIELDMON_5
	appear ROUTE28_FIELDMON_6
	appear ROUTE28_FIELDMON_7
	appear ROUTE28_FIELDMON_8
	appear ROUTE28_FIELDMON_9
	appear ROUTE28_FIELDMON_10
	endcallback

Route28FieldMon1Script:
	faceplayer
	cry CHARIZARD
	pause 15
	loadwildmon CHARIZARD, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE28_FIELDMON_1
	end

Route28FieldMon2Script:
	faceplayer
	cry VENUSAUR
	pause 15
	loadwildmon VENUSAUR, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE28_FIELDMON_2
	end

Route28FieldMon3Script:
	faceplayer
	cry BLASTOISE
	pause 15
	loadwildmon BLASTOISE, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE28_FIELDMON_3
	end

Route28FieldMon4Script:
	faceplayer
	cry SKARMORY
	pause 15
	loadwildmon SKARMORY, 72
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE28_FIELDMON_4
	end

Route28FieldMon5Script:
	faceplayer
	cry BLISSEY
	pause 15
	loadwildmon BLISSEY, 72
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE28_FIELDMON_5
	end

Route28FieldMon6Script:
	faceplayer
	cry SNORLAX
	pause 15
	loadwildmon SNORLAX, 75
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE28_FIELDMON_6
	end

Route28FieldMon7Script:
	faceplayer
	cry ROTOM
	pause 15
	loadwildmon ROTOM, 73
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE28_FIELDMON_7
	end

Route28FieldMon8Script:
	faceplayer
	cry POLTEGEIST
	pause 15
	loadwildmon POLTEGEIST, 72
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE28_FIELDMON_8
	end

Route28FieldMon9Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_9, Route28AttacksText, 75, 0, .script
.script
    disappear ROUTE28_FIELDMON_9
    end

Route28AttacksText:
    text "Wild #mon"
    line "attacks!"
    done

Route28FieldMon10Script:
	faceplayer
	cry SWAMPERT
	pause 15
	loadwildmon SWAMPERT, 73
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear ROUTE28_FIELDMON_10
	end

LatiosScript:
	faceplayer
	opentext
	writetext LatiosCry
	cry LATIOS
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon LATIOS, 80
	startbattle
	reloadmapafterbattle
    setval LATIOS
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_LATIOS
	disappear ROUTE28_LATIOS
	end

LatiosCry:
    text "...."

    para "...."

    para "...."
    done

Route28Sign:
	jumptext Route28SignText

Route28HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_28_HIDDEN_RARE_CANDY

Route28SignText:
	text "ROUTE 28"
	done

Route28_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, ROUTE_28_STEEL_WING_HOUSE, 1
	warp_event 33, 11, VICTORY_ROAD_GATE, 7
	warp_event 8, 6, MANOR_OUTSIDE, 2
	warp_event 9, 6, MANOR_OUTSIDE, 3

	def_coord_events

	def_bg_events
	bg_event 31, 11, BGEVENT_READ, Route28Sign
	bg_event 25,  8, BGEVENT_ITEM, Route28HiddenRareCandy

	def_object_events
	object_event 17, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LatiosScript, EVENT_CAUGHT_LATIOS
	object_event 25, 14, SPRITE_CHARIZARD, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route28FieldMon1Script, EVENT_FIELD_MON_1
	object_event  9, 18, SPRITE_VENUSAUR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route28FieldMon2Script, EVENT_FIELD_MON_2
	object_event 21, 20, SPRITE_BLASTOISE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28FieldMon3Script, EVENT_FIELD_MON_3
	object_event 16, 21, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28FieldMon4Script, EVENT_FIELD_MON_4
	object_event  4, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route28FieldMon5Script, EVENT_FIELD_MON_5
	object_event 10, 14, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route28FieldMon6Script, EVENT_FIELD_MON_6
	object_event 23,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28FieldMon7Script, EVENT_FIELD_MON_7
	object_event  6,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, Route28FieldMon8Script, EVENT_FIELD_MON_8
	object_event 35, 12, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route28FieldMon9Script, EVENT_FIELD_MON_9
	object_event 21, 15, SPRITE_SWAMPERT, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route28FieldMon10Script, EVENT_FIELD_MON_10
	