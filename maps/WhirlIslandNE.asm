	object_const_def
	const WHIRLISLANDNE_POKE_BALL
	const WHIRLISLANDNE_FIELDMON_1
    const WHIRLISLANDNE_FIELDMON_2

WhirlIslandNE_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandNEFieldMon
	
.WhirlIslandNEFieldMon:
    appear WHIRLISLANDNE_FIELDMON_1
    appear WHIRLISLANDNE_FIELDMON_2
    endcallback
    
WhirlIslandNEFieldMon1Script:
	faceplayer
	cry BAGON
	pause 15
	loadwildmon BAGON, 26
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear WHIRLISLANDNE_FIELDMON_1
	end

WhirlIslandNEFieldMon2Script:
	faceplayer
	cry GOLBAT
	pause 15
	loadwildmon GOLBAT, 34
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear WHIRLISLANDNE_FIELDMON_2
	end

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandNE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 13, ROUTE_41, 2
	warp_event 17,  3, WHIRL_ISLAND_B1F, 2
	warp_event 13, 11, WHIRL_ISLAND_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
	object_event  8, 10, SPRITE_BAGON, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandNEFieldMon1Script, EVENT_FIELD_MON_1
	object_event 17,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandNEFieldMon2Script, EVENT_FIELD_MON_2
