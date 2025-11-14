    object_const_def
	const ROUTE16_FIELDMON_1
    const ROUTE16_FIELDMON_2
    const ROUTE16_FIELDMON_3
    const ROUTE16_FIELDMON_4
    const ROUTE16_FIELDMON_5
    const ROUTE16_FIELDMON_6

Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike
    callback MAPCALLBACK_OBJECTS, .Route16FieldMon

.Route16FieldMon:
    appear ROUTE16_FIELDMON_1
    appear ROUTE16_FIELDMON_2
    appear ROUTE16_FIELDMON_3
    appear ROUTE16_FIELDMON_4
    appear ROUTE16_FIELDMON_5
    appear ROUTE16_FIELDMON_6
    endcallback

.AlwaysOnBike:
	readvar VAR_YCOORD
	ifless 5, .CanWalk
	readvar VAR_XCOORD
	ifgreater 13, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "Cycling Road"

	para "Downhill coasting"
	line "all the way!"
	done
	
Route16FieldMon1Script:
	trainer WEEZING, FIELD_MON, EVENT_FIELD_MON_1, Route16PokemonAttacksText, 60, 0, .script
.script
    disappear ROUTE16_FIELDMON_1
    end
    
Route16FieldMon2Script:
	trainer ALAKAZAM, FIELD_MON, EVENT_FIELD_MON_2, Route16PokemonAttacksText, 60, 0, .script
.script
    disappear ROUTE16_FIELDMON_2
    end
    
Route16FieldMon3Script:
	trainer SCIZOR, FIELD_MON, EVENT_FIELD_MON_3, Route16PokemonAttacksText, 60, 0, .script
.script
    disappear ROUTE16_FIELDMON_3
    end
    
Route16FieldMon4Script:
	trainer BRELOOM, FIELD_MON, EVENT_FIELD_MON_4, Route16PokemonAttacksText, 60, 0, .script
.script
    disappear ROUTE16_FIELDMON_4
    end
    
Route16PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
Route16FieldMon5Script:
	faceplayer
	cry ESPEON
	pause 15
	loadwildmon ESPEON, 42
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE16_FIELDMON_5
	end

Route16FieldMon6Script:
	faceplayer
	cry UMBREON
	pause 15
	loadwildmon UMBREON, 42
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE16_FIELDMON_6
	end

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  1, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 14,  6, ROUTE_16_GATE, 3
	warp_event 14,  7, ROUTE_16_GATE, 4
	warp_event  9,  6, ROUTE_16_GATE, 1
	warp_event  9,  7, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_READ, CyclingRoadSign

	def_object_events
	object_event  5, 14, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route16FieldMon1Script, EVENT_FIELD_MON_1
	object_event  8, 15, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route16FieldMon2Script, EVENT_FIELD_MON_2
	object_event  5, 16, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route16FieldMon3Script, EVENT_FIELD_MON_3
	object_event  8, 17, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route16FieldMon4Script, EVENT_FIELD_MON_4
	object_event 12,  0, SPRITE_ESPEON, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route16FieldMon5Script, EVENT_FIELD_MON_5
	object_event 13,  0, SPRITE_UMBREON, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route16FieldMon6Script, EVENT_FIELD_MON_6


