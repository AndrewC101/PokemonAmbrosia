    object_const_def
    const HOOHWORDROOM_FIELDMON_1

RuinsOfAlphHoOhWordRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .HoohWordRoomFieldMon

.HoohWordRoomFieldMon
    appear HOOHWORDROOM_FIELDMON_1
    endcallback

HoohWordRoomFieldMon1Script:
	faceplayer
	cry METAGROSS
	pause 15
	loadwildmon METAGROSS, 55
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear HOOHWORDROOM_FIELDMON_1
	end

RuinsOfAlphHoOhWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  9, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 3
	warp_event 10,  9, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 4
	warp_event 17, 21, RUINS_OF_ALPH_INNER_CHAMBER, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HoohWordRoomFieldMon1Script, EVENT_FIELD_MON_1
