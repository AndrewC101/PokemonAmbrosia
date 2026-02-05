    object_const_def
	const WHIRLISLANDSE_FIELDMON_1
    const WHIRLISLANDSE_FIELDMON_2

WhirlIslandSE_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandSEFieldMon
	
.WhirlIslandSEFieldMon:
    appear WHIRLISLANDSE_FIELDMON_1
    appear WHIRLISLANDSE_FIELDMON_2
    endcallback
    
WhirlIslandSEFieldMon1Script:
	faceplayer
	cry GIBLE
	pause 15
	loadwildmon GIBLE, 26
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear WHIRLISLANDSE_FIELDMON_1
	end

WhirlIslandSEFieldMon2Script:
	faceplayer
	cry GABITE
	pause 15
	loadwildmon GABITE, 34
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear WHIRLISLANDSE_FIELDMON_2
	end

WhirlIslandSE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ROUTE_41, 4
	warp_event  5,  3, WHIRL_ISLAND_B1F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 10, SPRITE_GIBLE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandSEFieldMon1Script, EVENT_FIELD_MON_1
	object_event 3,  2, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandSEFieldMon2Script, EVENT_FIELD_MON_2

