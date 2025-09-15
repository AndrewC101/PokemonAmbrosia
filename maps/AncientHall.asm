	object_const_def
	const ANCIENTHALL_ZYGARDE
	const ANCIENTHALL_FIELDMON_1
    const ANCIENTHALL_FIELDMON_2
    const ANCIENTHALL_FIELDMON_3
    const ANCIENTHALL_FIELDMON_4
    const ANCIENTHALL_FIELDMON_5
    const ANCIENTHALL_FIELDMON_6
    const ANCIENTHALL_FIELDMON_7
    const ANCIENTHALL_FIELDMON_8

AncientHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .AncientHallFieldMon
	
.AncientHallFieldMon:
; Pokemon which always appear
    appear ANCIENTHALL_FIELDMON_1
    appear ANCIENTHALL_FIELDMON_2
    appear ANCIENTHALL_FIELDMON_3
    appear ANCIENTHALL_FIELDMON_4
    appear ANCIENTHALL_FIELDMON_5
    appear ANCIENTHALL_FIELDMON_6
    appear ANCIENTHALL_FIELDMON_7
    appear ANCIENTHALL_FIELDMON_8
    endcallback
    
AncientHallFieldMon1Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_1, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_1
    end

AncientHallFieldMon2Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_2, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_2
    end

AncientHallFieldMon3Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_3, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_3
    end

AncientHallFieldMon4Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_4, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_4
    end

AncientHallFieldMon5Script:
	trainer DUNSPARCE, FIELD_MON, EVENT_FIELD_MON_5, AncientHallPokemonAttacksText, 90, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_5
    end

AncientHallFieldMon6Script:
	trainer DUNSPARCE, FIELD_MON, EVENT_FIELD_MON_6, AncientHallPokemonAttacksText, 90, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_6
    end

AncientHallFieldMon7Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_7, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_7
    end

AncientHallFieldMon8Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_8, AncientHallPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTHALL_FIELDMON_8
    end

AncientHallPokemonAttacksText:
    text "Guardian attacks!"
    done

ZygardeScript:
	cry ZYGARDE
	pause 15

	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZYGARDE, 90
	startbattle
	reloadmapafterbattle
    setval ZYGARDE
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_ZYGARDE
	disappear ANCIENTHALL_ZYGARDE
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	end

ZygardeCry:
    text "ZYGARDE!"
    done

AncientHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 19, ANCIENT_TEMPLE, 6
	warp_event 5, 19, ANCIENT_TEMPLE, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 4, 2, SPRITE_ZYGARDE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ZygardeScript, EVENT_CAUGHT_ZYGARDE
	object_event 2, 16, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon1Script, EVENT_FIELD_MON_1
	object_event  7, 16, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon2Script, EVENT_FIELD_MON_2
	object_event 2, 12, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon3Script, EVENT_FIELD_MON_3
	object_event 7, 12, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon4Script, EVENT_FIELD_MON_4
	object_event 2, 4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon5Script, EVENT_FIELD_MON_5
	object_event  7, 4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon6Script, EVENT_FIELD_MON_6
	object_event 2, 8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon7Script, EVENT_FIELD_MON_7
	object_event  7, 8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallFieldMon8Script, EVENT_FIELD_MON_8
