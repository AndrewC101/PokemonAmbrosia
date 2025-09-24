	object_const_def
	const TINTOWER7F_POKE_BALL
	const TINTOWER7F_FIELDMON_1
    const TINTOWER7F_FIELDMON_2

TinTower7F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .TinTower7FFieldMon

.TinTower7FFieldMon:
    appear TINTOWER7F_FIELDMON_1
    appear TINTOWER7F_FIELDMON_2
    endcallback

TinTower7FFieldMon1Script:
	faceplayer
	cry NINETALES
	pause 15
	loadwildmon NINETALES, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER7F_FIELDMON_1
	end

TinTower7FFieldMon2Script:
	faceplayer
	cry NOCTOWL
	pause 15
	loadwildmon NOCTOWL, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER7F_FIELDMON_2
	end

TinTower7FMaxRevive:
	itemball MAX_REVIVE

TinTower7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, TIN_TOWER_6F, 1
	warp_event 10, 15, TIN_TOWER_8F, 1
	warp_event 12,  7, TIN_TOWER_7F, 4
	warp_event  8,  3, TIN_TOWER_7F, 3
	warp_event  6,  9, TIN_TOWER_9F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower7FMaxRevive, EVENT_TIN_TOWER_7F_MAX_REVIVE
	object_event  5,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, TinTower7FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  7,  7, SPRITE_NOCTOWL, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, TinTower7FFieldMon2Script, EVENT_FIELD_MON_2
