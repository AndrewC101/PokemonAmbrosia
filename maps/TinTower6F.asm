	object_const_def
	const TINTOWER6F_POKE_BALL
	const TINTOWER6F_FIELDMON_1
    const TINTOWER6F_FIELDMON_2

TinTower6F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .TinTower6FFieldMon

.TinTower6FFieldMon:
    appear TINTOWER6F_FIELDMON_1
    appear TINTOWER6F_FIELDMON_2
    endcallback

TinTower6FFieldMon1Script:
	faceplayer
	cry JOLTEON
	pause 15
	loadwildmon JOLTEON, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER6F_FIELDMON_1
	end

TinTower6FFieldMon2Script:
	faceplayer
	cry BELLSPROUT
	pause 15
	loadwildmon BELLSPROUT, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER6F_FIELDMON_2
	end

TinTower6FMaxPotion:
	itemball FULL_RESTORE

TinTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, TIN_TOWER_7F, 1
	warp_event 11, 15, TIN_TOWER_5F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower6FMaxPotion, EVENT_TIN_TOWER_6F_MAX_POTION
	object_event  3, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 2, TinTower6FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 17,  1, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TinTower6FFieldMon2Script, EVENT_FIELD_MON_2
