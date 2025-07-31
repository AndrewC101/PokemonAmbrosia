	object_const_def
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_POKE_BALL2
	const TINTOWER4F_POKE_BALL3
	const TINTOWER4F_FIELDMON_1
    const TINTOWER4F_FIELDMON_2

TinTower4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .TinTower4FFieldMon
	
.TinTower4FFieldMon:
    appear TINTOWER4F_FIELDMON_1
    appear TINTOWER4F_FIELDMON_2
    endcallback
    
TinTower4FFieldMon1Script:
	faceplayer
	cry PERSIAN
	pause 15
	loadwildmon PERSIAN, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TINTOWER4F_FIELDMON_1
	end

TinTower4FFieldMon2Script:
	faceplayer
	cry POLTEGEIST
	pause 15
	loadwildmon POLTEGEIST, 42
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear TINTOWER4F_FIELDMON_2
	end

TinTower4FUltraBall:
	itemball ULTRA_BALL

TinTower4FPPUp:
	itemball PP_MAX

TinTower4FEscapeRope:
	itemball EXPERT_BELT

TinTower4FHiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_TIN_TOWER_4F_HIDDEN_MAX_POTION

TinTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, TIN_TOWER_5F, 2
	warp_event 16,  2, TIN_TOWER_3F, 2
	warp_event  2, 14, TIN_TOWER_5F, 3
	warp_event 17, 15, TIN_TOWER_5F, 4

	def_coord_events

	def_bg_events
	bg_event 11,  6, BGEVENT_ITEM, TinTower4FHiddenMaxPotion

	def_object_events
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FUltraBall, EVENT_TIN_TOWER_4F_ULTRA_BALL
	object_event 17, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FPPUp, EVENT_TIN_TOWER_4F_PP_UP
	object_event  9, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FEscapeRope, EVENT_TIN_TOWER_4F_ESCAPE_ROPE
	object_event  2, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TinTower4FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 14,  1, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TinTower4FFieldMon2Script, EVENT_FIELD_MON_2
