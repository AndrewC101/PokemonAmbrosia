    object_const_def
    const AEROWORDROOM_FIELDMON_1

RuinsOfAlphAerodactylWordRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .AeroWordRoomFieldMon

.AeroWordRoomFieldMon
    appear AEROWORDROOM_FIELDMON_1
    endcallback

AeroWordRoomFieldMon1Script:
	faceplayer
	cry SIGILYPH
	pause 15
	loadwildmon SIGILYPH, 35
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear AEROWORDROOM_FIELDMON_1
	end

RuinsOfAlphAerodactylWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, 3
	warp_event 10,  5, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, 4
	warp_event 17, 11, RUINS_OF_ALPH_INNER_CHAMBER, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  9, SPRITE_MONSTER, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AeroWordRoomFieldMon1Script, EVENT_FIELD_MON_1
