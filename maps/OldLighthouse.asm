	object_const_def
	const OLDLIGHTHOUSE_ZAPDOS
	const OLDLIGHTHOUSE_FIELDMON_1
	const OLDLIGHTHOUSE_FIELDMON_2
	const OLDLIGHTHOUSE_FIELDMON_3
	const OLDLIGHTHOUSE_FIELDMON_4
	const OLDLIGHTHOUSE_FIELDMON_5
	const OLDLIGHTHOUSE_FIELDMON_6
	const OLDLIGHTHOUSE_FIELDMON_7
	const OLDLIGHTHOUSE_FIELDMON_8

OldLighthouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .OldLighthouseFieldMon

.OldLighthouseFieldMon:
	appear OLDLIGHTHOUSE_FIELDMON_1
	appear OLDLIGHTHOUSE_FIELDMON_2
	appear OLDLIGHTHOUSE_FIELDMON_3
	appear OLDLIGHTHOUSE_FIELDMON_4
	appear OLDLIGHTHOUSE_FIELDMON_5
	appear OLDLIGHTHOUSE_FIELDMON_6
	appear OLDLIGHTHOUSE_FIELDMON_7
	appear OLDLIGHTHOUSE_FIELDMON_8
	endcallback

OldLighthouseFieldMon1Script:
	trainer GALVANTULA, FIELD_MON, EVENT_FIELD_MON_1, OldLighthousePokemonAttacksText, 61, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_1
	end

OldLighthouseFieldMon2Script:
	trainer ROTOM, FIELD_MON, EVENT_FIELD_MON_2, OldLighthousePokemonAttacksText, 63, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_2
	end

OldLighthouseFieldMon3Script:
	trainer JOLTEON, FIELD_MON, EVENT_FIELD_MON_3, OldLighthousePokemonAttacksText, 64, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_3
	end

OldLighthouseFieldMon4Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_4, OldLighthousePokemonAttacksText, 65, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_4
	end

OldLighthouseFieldMon5Script:
	trainer ARCTOZOLT, FIELD_MON, EVENT_FIELD_MON_5, OldLighthousePokemonAttacksText, 66, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_5
	end

OldLighthouseFieldMon6Script:
	faceplayer
	cry RAICHU
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon RAICHU, 62
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear OLDLIGHTHOUSE_FIELDMON_6
	end

OldLighthouseFieldMon7Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon AMPHAROS, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear OLDLIGHTHOUSE_FIELDMON_7
	end

OldLighthouseFieldMon8Script:
	faceplayer
	cry ELECTIVIRE
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ELECTIVIRE, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear OLDLIGHTHOUSE_FIELDMON_8
	end

OldLighthouseTMThunder:
	itemball TM_THUNDER

OldLighthousePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

OldLighthouseZapdosScript:
	cry ZAPDOS
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 80
	sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 60
	sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 50
.begin
	startbattle
	reloadmapafterbattle
	setval ZAPDOS
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_CAUGHT_ZAPDOS
	disappear OLDLIGHTHOUSE_ZAPDOS
	end


OldLighthouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 35, CAPE_STORM, 3
	warp_event  9, 35, CAPE_STORM, 3
	warp_event  5, 33, OLD_LIGHTHOUSE, 4
	warp_event 27, 33, OLD_LIGHTHOUSE, 3
	warp_event 35, 33, OLD_LIGHTHOUSE, 6
	warp_event 13, 13, OLD_LIGHTHOUSE, 5
	warp_event  7, 13, OLD_LIGHTHOUSE, 8
	warp_event 29, 13, OLD_LIGHTHOUSE, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 31,  4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseZapdosScript, EVENT_CAUGHT_ZAPDOS
	object_event 36, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon1Script, EVENT_FIELD_MON_1
	object_event 25, 30, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon2Script, EVENT_FIELD_MON_2
	object_event 14, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon3Script, EVENT_FIELD_MON_3
	object_event  9,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon4Script, EVENT_FIELD_MON_4
	object_event  3,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon5Script, EVENT_FIELD_MON_5
	object_event  5, 31, SPRITE_RAICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon6Script, EVENT_FIELD_MON_6
	object_event 35, 31, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon7Script, EVENT_FIELD_MON_7
	object_event  7, 11, SPRITE_ELECTABUZZ, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon8Script, EVENT_FIELD_MON_8
	object_event 33,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, OldLighthouseTMThunder, EVENT_OLD_LIGHTHOUSE_TM_THUNDER
