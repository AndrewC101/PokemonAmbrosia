	object_const_def
	const ROUTE5_POKEFAN_M
	const ROUTE5_FIELDMON_1
    const ROUTE5_FIELDMON_2

Route5_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route5FieldMon

.Route5FieldMon:
; Pokemon which always appear
    appear ROUTE5_FIELDMON_1
    appear ROUTE5_FIELDMON_2
    endcallback

Route5FieldMon1Script:
	faceplayer
	cry CLEFABLE
	pause 15
	loadwildmon CLEFABLE, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE5_FIELDMON_1
	end

Route5FieldMon2Script:
	faceplayer
	cry LOPUNNY
	pause 15
	loadwildmon LOPUNNY, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE5_FIELDMON_2
	end

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5PokefanMText:
	text "The road is closed"
	line "until for now."

	para "People have been"
	line "dropping all their"
	cont "litter down there."
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
	text "Well done for"
	line "finding this."

	para "You enjoying"
	line "the game?"

	para "Praise be to"
	line "Andrew."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 17, ROUTE_5_SAFFRON_GATE, 1
	warp_event  9, 17, ROUTE_5_SAFFRON_GATE, 2
	warp_event 10, 11, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, Route5UndergroundPathSign
	bg_event 10, 11, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  8,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, Route5FieldMon1Script, EVENT_FIELD_MON_1
	object_event 11,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route5FieldMon2Script, EVENT_FIELD_MON_2
