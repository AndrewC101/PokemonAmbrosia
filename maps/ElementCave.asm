	object_const_def
	const ELEMENTCAVE_GROUDON
	const ELEMENTCAVE_KYOGRE
    const ELEMENTCAVE_FIELDMON_1
    const ELEMENTCAVE_FIELDMON_2
    const ELEMENTCAVE_FIELDMON_3
    const ELEMENTCAVE_FIELDMON_4
    const ELEMENTCAVE_FIELDMON_5
    const ELEMENTCAVE_FIELDMON_6
    const ELEMENTCAVE_FIELDMON_7
    const ELEMENTCAVE_FIELDMON_8

ElementCave_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .GroudonAndKyogre

.GroudonAndKyogre
    appear ELEMENTCAVE_FIELDMON_1
    appear ELEMENTCAVE_FIELDMON_2
    appear ELEMENTCAVE_FIELDMON_3
    appear ELEMENTCAVE_FIELDMON_4
    appear ELEMENTCAVE_FIELDMON_5
    appear ELEMENTCAVE_FIELDMON_6
    appear ELEMENTCAVE_FIELDMON_7
    appear ELEMENTCAVE_FIELDMON_8

	checkevent EVENT_BEAT_HOEN_ARMY
	iffalse .NoAppear
    checkevent EVENT_CAUGHT_GROUDON
    iftrue .NoGroudon
    checkevent EVENT_CAUGHT_KYOGRE
    iftrue .NoKyogre
	appear ELEMENTCAVE_GROUDON
	appear ELEMENTCAVE_KYOGRE
	endcallback
.NoGroudon:
    disappear ELEMENTCAVE_GROUDON
    endcallback
.NoKyogre:
    disappear ELEMENTCAVE_KYOGRE
    endcallback
.NoAppear:
	disappear ELEMENTCAVE_GROUDON
	disappear ELEMENTCAVE_KYOGRE
	endcallback

GroudonScript:
	faceplayer
	opentext
	writetext GroudonCry
	cry GROUDON
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GROUDON, 70
	startbattle
	reloadmapafterbattle
    setval GROUDON
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_GROUDON
    disappear ELEMENTCAVE_GROUDON
	end

GroudonCry:
    text "Groudon!"
    done

KyogreScript:
	faceplayer
	opentext
	writetext KyogreCry
	cry KYOGRE
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon KYOGRE, 70
	startbattle
	reloadmapafterbattle
    setval KYOGRE
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_KYOGRE
	disappear ELEMENTCAVE_KYOGRE
	end

KyogreCry:
    text "Kyogre!"
    done

ElementCaveFieldMon1Script:
	trainer CHARIZARD, FIELD_MON, EVENT_FIELD_MON_1, ElementCavePokemonAttacksText, 54, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_1
    end

ElementCaveFieldMon2Script:
	trainer NINETALES, FIELD_MON, EVENT_FIELD_MON_2, ElementCavePokemonAttacksText, 56, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_2
    end

ElementCaveFieldMon3Script:
	trainer MAGMAR, FIELD_MON, EVENT_FIELD_MON_3, ElementCavePokemonAttacksText, 55, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_3
    end

ElementCaveFieldMon4Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_4, ElementCavePokemonAttacksText, 57, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_4
    end

ElementCaveFieldMon5Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_5, ElementCavePokemonAttacksText, 65, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_5
    end

ElementCaveFieldMon6Script:
	trainer POLITOED, FIELD_MON, EVENT_FIELD_MON_6, ElementCavePokemonAttacksText, 54, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_6
    end

ElementCaveFieldMon7Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_7, ElementCavePokemonAttacksText, 57, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_7
    end

ElementCaveFieldMon8Script:
	trainer KINGDRA, FIELD_MON, EVENT_FIELD_MON_8, ElementCavePokemonAttacksText, 65, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_8
    end

ElementCavePokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

ElementCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 5, 3, CINNABAR_ISLAND, 2
	warp_event 43, 21, ROUTE_20, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 25, 3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GroudonScript, EVENT_CAUGHT_GROUDON
	object_event 29, 3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KyogreScript, EVENT_CAUGHT_KYOGRE
	object_event 11,  4, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon1Script, EVENT_FIELD_MON_1
	object_event  5,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon2Script, EVENT_FIELD_MON_2
	object_event 13, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon3Script, EVENT_FIELD_MON_3
	object_event  6, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon4Script, EVENT_FIELD_MON_4
	object_event 19, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon5Script, EVENT_FIELD_MON_5
	object_event 40,  2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon6Script, EVENT_FIELD_MON_6
	object_event 29, 20, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon7Script, EVENT_FIELD_MON_7
	object_event 27, 12, SPRITE_DRAGON, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ElementCaveFieldMon8Script, EVENT_FIELD_MON_8
	