    object_const_def
    const ROUTE10NORTH_FIELDMON_1
    const ROUTE10NORTH_FIELDMON_2

Route10North_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route10NorthFieldMon

.Route10NorthFieldMon:
; Pokemon which always appear
    appear ROUTE10NORTH_FIELDMON_1
    appear ROUTE10NORTH_FIELDMON_2
    endcallback

Route10NorthFieldMon3Script:
	faceplayer
	cry ELECTIVIRE
	pause 15
	loadwildmon ELECTIVIRE, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE10NORTH_FIELDMON_1
	end

Route10NorthFieldMon4Script:
	faceplayer
	cry ELECTIVIRE
	pause 15
	loadwildmon ELECTIVIRE, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE10NORTH_FIELDMON_2
	end

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

PowerPlantSignText:
	text "Kanto Power Plant"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  3,  9, POWER_PLANT, 1

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12,  1, BGEVENT_READ, Route10PokecenterSign

	def_object_events
	object_event  6, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10NorthFieldMon3Script, EVENT_FIELD_MON_1
	object_event 11, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10NorthFieldMon4Script, EVENT_FIELD_MON_2
