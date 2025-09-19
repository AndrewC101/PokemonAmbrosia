	object_const_def
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3
    const WHIRLISLANDB2F_FIELDMON_1

WhirlIslandB2F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandB2FFieldMon

.WhirlIslandB2FFieldMon:
; Pokemon which always appear
    appear WHIRLISLANDB2F_FIELDMON_1
    endcallback

WhirlIslandB2FFieldMon1Script:
	faceplayer
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear WHIRLISLANDB2F_FIELDMON_1
	end

WhirlIslandB2FFullRestore:
	itemball AMBROSIA

WhirlIslandB2FMaxRevive:
	itemball LEFTOVERS

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER

WhirlIslandB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  5, WHIRL_ISLAND_B1F, 7
	warp_event  7, 11, WHIRL_ISLAND_B1F, 8
	warp_event  7, 25, WHIRL_ISLAND_LUGIA_CHAMBER, 1
	warp_event 13, 31, WHIRL_ISLAND_SW, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	object_event 10, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	object_event  5, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
	object_event  9,  4, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, WhirlIslandB2FFieldMon1Script, EVENT_FIELD_MON_1
