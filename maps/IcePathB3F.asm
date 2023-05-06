	object_const_def
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK
	const ICEPATHB3F_FIELDMON_1
    const ICEPATHB3F_FIELDMON_2
    const ICEPATHB3F_FIELDMON_3

IcePathB3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .IcePathB3FFieldMon

.IcePathB3FFieldMon:
; Pokemon which always appear
    appear ICEPATHB3F_FIELDMON_1
    appear ICEPATHB3F_FIELDMON_2
    appear ICEPATHB3F_FIELDMON_3
    endcallback

IcePathB3FFieldMon1Script:
	faceplayer
	cry MAMOSWINE
	pause 15
	loadwildmon MAMOSWINE, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ICEPATHB3F_FIELDMON_1
	end

IcePathB3FFieldMon2Script:
	faceplayer
	cry PILOSWINE
	pause 15
	loadwildmon PILOSWINE, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ICEPATHB3F_FIELDMON_2
	end

IcePathB3FFieldMon3Script:
	faceplayer
	cry PILOSWINE
	pause 15
	loadwildmon PILOSWINE, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ICEPATHB3F_FIELDMON_3
	end

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd SmashRockScript

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event  6,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
	object_event  8, 12, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, IcePathB3FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  7, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, IcePathB3FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 10, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IcePathB3FFieldMon3Script, EVENT_FIELD_MON_3
