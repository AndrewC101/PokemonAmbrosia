    object_const_def
    const ROUTE7_FIELDMON_1
    const ROUTE7_FIELDMON_2

Route7_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route7FieldMon

.Route7FieldMon:
; Pokemon which always appear
    appear ROUTE7_FIELDMON_1
    appear ROUTE7_FIELDMON_2
    endcallback

Route7FieldMon1Script:
	faceplayer
	cry GARDEVOIR
	pause 15
	loadwildmon GARDEVOIR, 43
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE7_FIELDMON_1
	end

Route7FieldMon2Script:
	faceplayer
	cry GALLADE
	pause 15
	loadwildmon GALLADE, 43
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE7_FIELDMON_2
	end

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
	text "What's this flyer?"

	para "… Uncouth trainers"
	line "have been holding"

	para "battles in the"
	line "Underground Path."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "Underground Path"
	cont "has been sealed"
	cont "indefinitely."

	para "Celadon Police"
	done

Route7LockedDoorText:
	text "It's locked…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	def_object_events
	object_event  7,  0, SPRITE_GARDEVOIR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route7FieldMon1Script, EVENT_FIELD_MON_1
	object_event  9,  0, SPRITE_GALLADE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route7FieldMon2Script, EVENT_FIELD_MON_2
