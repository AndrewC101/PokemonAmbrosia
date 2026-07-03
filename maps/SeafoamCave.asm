	object_const_def
	const SEAFOAMCAVE_ARTICUNO
	const SEAFOAMCAVE_FIELDMON_1
	const SEAFOAMCAVE_FIELDMON_2
	const SEAFOAMCAVE_FIELDMON_3
	const SEAFOAMCAVE_FIELDMON_4
	const SEAFOAMCAVE_FIELDMON_5
	const SEAFOAMCAVE_FIELDMON_6
	const SEAFOAMCAVE_FIELDMON_7
	const SEAFOAMCAVE_FIELDMON_8

SeafoamCave_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SeafoamCaveFieldMon

.SeafoamCaveFieldMon:
	setval WEATHER_HAIL
	writemem wFieldWeather
	appear SEAFOAMCAVE_FIELDMON_1
	appear SEAFOAMCAVE_FIELDMON_2
	appear SEAFOAMCAVE_FIELDMON_3
	appear SEAFOAMCAVE_FIELDMON_4
	appear SEAFOAMCAVE_FIELDMON_5
	appear SEAFOAMCAVE_FIELDMON_6
	appear SEAFOAMCAVE_FIELDMON_7
	appear SEAFOAMCAVE_FIELDMON_8
	endcallback

SeafoamCaveArticunoScript:
	cry ARTICUNO
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ARTICUNO, 80
	sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ARTICUNO, 60
	sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ARTICUNO, 50
.begin
	startbattle
	reloadmapafterbattle
	setval ARTICUNO
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_CAUGHT_ARTICUNO
	disappear SEAFOAMCAVE_ARTICUNO
	end

SeafoamCaveFieldMon1Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_1, SeafoamCavePokemonAttacksText, 60, 0, .script
.script
	disappear SEAFOAMCAVE_FIELDMON_1
	end

SeafoamCaveFieldMon2Script:
	trainer ARCTOZOLT, FIELD_MON, EVENT_FIELD_MON_2, SeafoamCavePokemonAttacksText, 60, 0, .script
.script
	disappear SEAFOAMCAVE_FIELDMON_2
	end

SeafoamCaveFieldMon3Script:
	trainer NINETALES_A, FIELD_MON, EVENT_FIELD_MON_3, SeafoamCavePokemonAttacksText, 58, 0, .script
.script
	disappear SEAFOAMCAVE_FIELDMON_3
	end

SeafoamCaveFieldMon4Script:
	trainer CLOYSTER, FIELD_MON, EVENT_FIELD_MON_4, SeafoamCavePokemonAttacksText, 55, 0, .script
.script
	disappear SEAFOAMCAVE_FIELDMON_4
	end

SeafoamCaveFieldMon5Script:
	faceplayer
	cry BAXCALIBUR
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon BAXCALIBUR, 75
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SEAFOAMCAVE_FIELDMON_5
	end

SeafoamCaveFieldMon6Script:
	faceplayer
	cry MAMOSWINE
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MAMOSWINE, 67
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear SEAFOAMCAVE_FIELDMON_6
	end

SeafoamCaveFieldMon7Script:
	faceplayer
	cry LAPRAS
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon LAPRAS, 66
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear SEAFOAMCAVE_FIELDMON_7
	end

SeafoamCaveFieldMon8Script:
	faceplayer
	cry STARMIE
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon STARMIE, 64
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear SEAFOAMCAVE_FIELDMON_8
	end

SeafoamCavePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

SeafoamCaveTMBlizzard:
	itemball TM_BLIZZARD

SeafoamCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 41, 17, ROUTE_20, 2
	warp_event 25, 17, SEAFOAM_CAVE, 3
	warp_event 61, 17, SEAFOAM_CAVE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  0, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveArticunoScript, EVENT_CAUGHT_ARTICUNO
	object_event 42,  6, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, SeafoamCaveFieldMon1Script, EVENT_FIELD_MON_1
	object_event 48,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, SeafoamCaveFieldMon2Script, EVENT_FIELD_MON_2
	object_event 13,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, SeafoamCaveFieldMon3Script, EVENT_FIELD_MON_3
	object_event 14, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, SeafoamCaveFieldMon4Script, EVENT_FIELD_MON_4
	object_event  7,  2, SPRITE_BAXCALIBUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveFieldMon5Script, EVENT_FIELD_MON_5
	object_event  7, 10, SPRITE_MAMOSWINE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamCaveFieldMon6Script, EVENT_FIELD_MON_6
	object_event 23,  4, SPRITE_SURF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveFieldMon7Script, EVENT_FIELD_MON_7
	object_event 43, 10, SPRITE_STARMIE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveFieldMon8Script, EVENT_FIELD_MON_8
	object_event  3,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveTMBlizzard, EVENT_SEAFOAM_CAVE_TM_BLIZZARD
