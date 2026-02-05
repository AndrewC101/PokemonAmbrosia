	object_const_def
	const WHIRLISLANDSW_POKE_BALL
	const WHIRLISLANDSW_FIELDMON_1
    const WHIRLISLANDSW_FIELDMON_2

WhirlIslandSW_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandSWFieldMon
	
.WhirlIslandSWFieldMon:
    appear WHIRLISLANDSW_FIELDMON_1
    appear WHIRLISLANDSW_FIELDMON_2
    endcallback
    
WhirlIslandSWFieldMon1Script:
	faceplayer
	cry EKANS
	pause 15
	loadwildmon EKANS, 26
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear WHIRLISLANDSW_FIELDMON_1
	end

WhirlIslandSWFieldMon2Script:
	faceplayer
	cry TENTACRUEL
	pause 15
	loadwildmon TENTACRUEL, 34
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear WHIRLISLANDSW_FIELDMON_2
	end

WhirlIslandSWUltraBall:
	itemball ULTRA_BALL

WhirlIslandSW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_41, 3
	warp_event 17,  3, WHIRL_ISLAND_B1F, 5
	warp_event  3,  3, WHIRL_ISLAND_B1F, 4
	warp_event  3, 15, WHIRL_ISLAND_NW, 3
	warp_event 17, 15, WHIRL_ISLAND_B2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
	object_event  5,  4, SPRITE_DEINO, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandSWFieldMon1Script, EVENT_FIELD_MON_1
	object_event 15, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandSWFieldMon2Script, EVENT_FIELD_MON_2
