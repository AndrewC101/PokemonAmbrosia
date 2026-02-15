    object_const_def
    const KABUTOWORDROOM_FIELDMON_1

RuinsOfAlphKabutoWordRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .KabutoWordRoomFieldMon

.KabutoWordRoomFieldMon
    appear KABUTOWORDROOM_FIELDMON_1
    endcallback

KabutoWordRoomFieldMon1Script:
	faceplayer
	cry BELDUM
	pause 15
	loadwildmon BELDUM, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear KABUTOWORDROOM_FIELDMON_1
	end

RuinsOfAlphKabutoWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 3
	warp_event 10,  5, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 4
	warp_event 17, 11, RUINS_OF_ALPH_INNER_CHAMBER, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  9, SPRITE_BELDUM, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KabutoWordRoomFieldMon1Script, EVENT_FIELD_MON_1
