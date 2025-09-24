    object_const_def
    const OMANWORDROOM_FIELDMON_1

RuinsOfAlphOmanyteWordRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .OmanWordRoomFieldMon

.OmanWordRoomFieldMon
    appear OMANWORDROOM_FIELDMON_1
    endcallback

OmanWordRoomFieldMon1Script:
	faceplayer
	cry REUNICLUS
	pause 15
	loadwildmon REUNICLUS, 45
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear OMANWORDROOM_FIELDMON_1
	end

RuinsOfAlphOmanyteWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 3
	warp_event 10,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 4
	warp_event 17, 13, RUINS_OF_ALPH_INNER_CHAMBER, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  9, SPRITE_REUNICLUS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OmanWordRoomFieldMon1Script, EVENT_FIELD_MON_1
