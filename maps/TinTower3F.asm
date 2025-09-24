	object_const_def
	const TINTOWER3F_POKE_BALL
	const TINTOWER3F_FIELDMON_1
    const TINTOWER3F_FIELDMON_2

TinTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .TinTower3FFieldMon

.TinTower3FFieldMon:
    appear TINTOWER3F_FIELDMON_1
    appear TINTOWER3F_FIELDMON_2
    endcallback

TinTower3FFullHeal:
	itemball FULL_HEAL
	
TinTower3FFieldMon1Script:
	faceplayer
	cry VAPOREON
	pause 15
	loadwildmon VAPOREON, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER3F_FIELDMON_1
	end

TinTower3FFieldMon2Script:
	faceplayer
	cry BELLSPROUT
	pause 15
	loadwildmon BELLSPROUT, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER3F_FIELDMON_2
	end

TinTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, TIN_TOWER_2F, 1
	warp_event 16,  2, TIN_TOWER_4F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower3FFullHeal, EVENT_TIN_TOWER_3F_FULL_HEAL
	object_event 16,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, TinTower3FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  8,  6, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TinTower3FFieldMon2Script, EVENT_FIELD_MON_2
