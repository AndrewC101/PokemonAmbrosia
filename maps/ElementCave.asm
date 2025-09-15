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

GroudonScript:
	cry GROUDON
	pause 15

	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GROUDON, 80
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
	cry KYOGRE
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon KYOGRE, 80
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
	trainer CHARIZARD, FIELD_MON, EVENT_FIELD_MON_1, ElementCavePokemonAttacksText, 64, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_1
    end

ElementCaveFieldMon2Script:
	trainer NINETALES, FIELD_MON, EVENT_FIELD_MON_2, ElementCavePokemonAttacksText, 66, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_2
    end

ElementCaveFieldMon3Script:
	trainer MAGMAR, FIELD_MON, EVENT_FIELD_MON_3, ElementCavePokemonAttacksText, 65, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_3
    end

ElementCaveFieldMon4Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_4, ElementCavePokemonAttacksText, 67, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_4
    end

ElementCaveFieldMon5Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_5, ElementCavePokemonAttacksText, 68, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_5
    end

ElementCaveFieldMon6Script:
	trainer POLITOED, FIELD_MON, EVENT_FIELD_MON_6, ElementCavePokemonAttacksText, 64, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_6
    end

ElementCaveFieldMon7Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_7, ElementCavePokemonAttacksText, 67, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_7
    end

ElementCaveFieldMon8Script:
	trainer KINGDRA, FIELD_MON, EVENT_FIELD_MON_8, ElementCavePokemonAttacksText, 68, 0, .script
.script
    disappear ELEMENTCAVE_FIELDMON_8
    end

ElementCavePokemonAttacksText:
	text "Wild #mon"
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
	object_event 25, 3, SPRITE_GROUDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GroudonScript, EVENT_CAUGHT_GROUDON
	object_event 29, 3, SPRITE_KYOGRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KyogreScript, EVENT_CAUGHT_KYOGRE
	object_event 11,  4, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon1Script, EVENT_FIELD_MON_1
	object_event  5,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon2Script, EVENT_FIELD_MON_2
	object_event 13, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon3Script, EVENT_FIELD_MON_3
	object_event  6, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon4Script, EVENT_FIELD_MON_4
	object_event 19, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon5Script, EVENT_FIELD_MON_5
	object_event 40,  2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon6Script, EVENT_FIELD_MON_6
	object_event 29, 20, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon7Script, EVENT_FIELD_MON_7
	object_event 27, 12, SPRITE_DRAGON, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, ElementCaveFieldMon8Script, EVENT_FIELD_MON_8
	