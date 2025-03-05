	object_const_def
	const WHIRLISLANDNW_FIELDMON_1
    const WHIRLISLANDNW_FIELDMON_2

WhirlIslandNW_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandNWFieldMon

.WhirlIslandNWFieldMon:
    appear WHIRLISLANDNW_FIELDMON_1
    appear WHIRLISLANDNW_FIELDMON_2
    endcallback

WhirlIslandNWFieldMon1Script:
	faceplayer
	cry DUNSPARCE
	pause 15
	loadwildmon DUNSPARCE, 33
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear WHIRLISLANDNW_FIELDMON_1
	end

WhirlIslandNWFieldMon2Script:
	faceplayer
	cry QUAGSIRE
	pause 15
	loadwildmon QUAGSIRE, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear WHIRLISLANDNW_FIELDMON_2
	end

WhirlIslandNW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_41, 1
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1
	warp_event  3, 15, WHIRL_ISLAND_SW, 4
	warp_event  7, 15, WHIRL_ISLAND_CAVE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandNWFieldMon1Script, EVENT_FIELD_MON_1
	object_event  5, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, WhirlIslandNWFieldMon2Script, EVENT_FIELD_MON_2

