	object_const_def
	const TINTOWER8F_POKE_BALL1
	const TINTOWER8F_POKE_BALL2
	const TINTOWER8F_POKE_BALL3
	const TINTOWER8F_FIELDMON_1
    const TINTOWER8F_FIELDMON_2

TinTower8F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .TinTower8FFieldMon
	
.TinTower8FFieldMon:
    appear TINTOWER8F_FIELDMON_1
    appear TINTOWER8F_FIELDMON_2
    endcallback

TinTower8FFieldMon1Script:
	trainer AEGISLASH, FIELD_MON, EVENT_FIELD_MON_1, TinTower8FAttacksText, 62, 0, .script
.script
    disappear TINTOWER8F_FIELDMON_1
    end

TinTower8FFieldMon2Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_2, TinTower8FAttacksText, 61, 0, .script
.script
    disappear TINTOWER8F_FIELDMON_2
    end

TinTower8FAttacksText:
	text "Wild #mon"
 	line "attacks!"
 	done

TinTower8FNugget:
	itemball NUGGET

TinTower8FMaxElixer:
	itemball FOCUS_SASH

TinTower8FFullRestore:
	itemball FULL_RESTORE

TinTower8F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, TIN_TOWER_7F, 2
	warp_event  2, 11, TIN_TOWER_9F, 1
	warp_event 16,  7, TIN_TOWER_9F, 2
	warp_event 10,  3, TIN_TOWER_9F, 3
	warp_event 14, 15, TIN_TOWER_9F, 6
	warp_event  6,  9, TIN_TOWER_9F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FNugget, EVENT_TIN_TOWER_8F_NUGGET
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FMaxElixer, EVENT_TIN_TOWER_8F_MAX_ELIXER
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FFullRestore, EVENT_TIN_TOWER_8F_FULL_RESTORE
	object_event  8,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, TinTower8FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 15,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, TinTower8FFieldMon2Script, EVENT_FIELD_MON_2
