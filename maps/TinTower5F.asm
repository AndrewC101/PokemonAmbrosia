	object_const_def
	const TINTOWER5F_POKE_BALL
	const TINTOWER5F_FIELDMON_1
    const TINTOWER5F_FIELDMON_2

TinTower5F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .TinTower5FFieldMon
	
.TinTower5FFieldMon:
    appear TINTOWER5F_FIELDMON_1
    appear TINTOWER5F_FIELDMON_2
    endcallback
    
TinTower5FFieldMon1Script:
	faceplayer
	cry MISMAGIUS
	pause 15
	loadwildmon MISMAGIUS, 43
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER5F_FIELDMON_1
	end

TinTower5FFieldMon2Script:
	faceplayer
	cry ROTOM
	pause 15
	loadwildmon ROTOM, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER5F_FIELDMON_2
	end

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE

TinTower5FHiddenCarbos:
	hiddenitem CARBOS, EVENT_TIN_TOWER_5F_HIDDEN_CARBOS

TinTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 15, TIN_TOWER_6F, 2
	warp_event  2,  4, TIN_TOWER_4F, 1
	warp_event  2, 14, TIN_TOWER_4F, 3
	warp_event 17, 15, TIN_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event 16, 14, BGEVENT_ITEM, TinTower5FHiddenFullRestore
	bg_event  3, 15, BGEVENT_ITEM, TinTower5FHiddenCarbos

	def_object_events
	object_event  8,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
	object_event  2,  0, SPRITE_MISMAGIUS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, TinTower5FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 10,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, TinTower5FFieldMon2Script, EVENT_FIELD_MON_2
