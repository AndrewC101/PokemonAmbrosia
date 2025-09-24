	object_const_def
	const TINTOWER9F_POKE_BALL
	const TINTOWER9F_FIELDMON_1
    const TINTOWER9F_FIELDMON_2

TinTower9F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .TinTower9FFieldMon
	
.TinTower9FFieldMon:
    appear TINTOWER9F_FIELDMON_1
    appear TINTOWER9F_FIELDMON_2
    endcallback
    
TinTower9FFieldMon1Script:
	faceplayer
	cry FLAREON
	pause 15
	loadwildmon FLAREON, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER9F_FIELDMON_1
	end

TinTower9FFieldMon2Script:
	faceplayer
	cry BELLSPROUT
	pause 15
	loadwildmon BELLSPROUT, 100
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER9F_FIELDMON_2
	end

TinTower9FHPUp:
	itemball HP_UP

TinTower9FUnusedHoOhText: ; unreferenced
	text "HO-OH: Shaoooh!"
	done

TinTower9FUnusedLugiaText: ; unreferenced
	text "LUGIA: Gyaaan!"
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  3, TIN_TOWER_8F, 2
	warp_event  2,  5, TIN_TOWER_8F, 3
	warp_event 12,  7, TIN_TOWER_8F, 4
	warp_event  7,  9, TIN_TOWER_ROOF, 1
	warp_event 16,  7, TIN_TOWER_7F, 5
	warp_event  6, 13, TIN_TOWER_8F, 5
	warp_event  8, 13, TIN_TOWER_8F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
	object_event  6,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, TinTower9FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  6,  8, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TinTower9FFieldMon2Script, EVENT_FIELD_MON_2
