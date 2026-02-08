    object_const_def
    const LAVENDERFOREST_AGATHA_SISTER
    const LAVENDERFOREST_SHAYMIN
	const LAVENDERFOREST_FIELDMON_1
    const LAVENDERFOREST_FIELDMON_2
    const LAVENDERFOREST_FIELDMON_3
    const LAVENDERFOREST_FIELDMON_4
    const LAVENDERFOREST_FIELDMON_5
    const LAVENDERFOREST_FIELDMON_6
    const LAVENDERFOREST_FIELDMON_7
    const LAVENDERFOREST_FIELDMON_8
    const LAVENDERFOREST_FIELDMON_9
    const LAVENDERFOREST_FIELDMON_10
    const LAVENDERFOREST_POKEBALL

LavenderForest_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .LavenderForestFieldMon

.LavenderForestFieldMon:
; Pokemon which always appear
    appear LAVENDERFOREST_FIELDMON_1
    appear LAVENDERFOREST_FIELDMON_2
    appear LAVENDERFOREST_FIELDMON_3
    appear LAVENDERFOREST_FIELDMON_4
    appear LAVENDERFOREST_FIELDMON_5
    appear LAVENDERFOREST_FIELDMON_6
    appear LAVENDERFOREST_FIELDMON_7
    appear LAVENDERFOREST_FIELDMON_8
    appear LAVENDERFOREST_FIELDMON_9
    appear LAVENDERFOREST_FIELDMON_10
    endcallback
    
ShayminScript:
    faceplayer
	cry SHAYMIN
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 70
	startbattle
	reloadmapafterbattle
    setval SHAYMIN
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_SHAYMIN
	disappear LAVENDERFOREST_SHAYMIN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	end
    
LavenderForestFieldMon1Script:
	trainer CHANDELURE, FIELD_MON, EVENT_FIELD_MON_1, LavenderForestPokemonAttacksText, 66, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_1
    end

LavenderForestFieldMon2Script:
	trainer POLTEGEIST, FIELD_MON, EVENT_FIELD_MON_2, LavenderForestPokemonAttacksText, 62, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_2
    end

LavenderForestFieldMon3Script:
	trainer MISMAGIUS, FIELD_MON, EVENT_FIELD_MON_3, LavenderForestPokemonAttacksText, 63, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_3
    end

LavenderForestFieldMon4Script:
	trainer ROTOM, FIELD_MON, EVENT_FIELD_MON_4, LavenderForestPokemonAttacksText, 64, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_4
    end

LavenderForestFieldMon5Script:
	trainer AEGISLASH, FIELD_MON, EVENT_FIELD_MON_5, LavenderForestPokemonAttacksText, 64, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_5
    end

LavenderForestFieldMon6Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_6, LavenderForestPokemonAttacksText, 67, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_6
    end

LavenderForestFieldMon7Script:
	trainer AEGISLASH, FIELD_MON, EVENT_FIELD_MON_7, LavenderForestPokemonAttacksText, 63, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_7
    end

LavenderForestFieldMon8Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_8, LavenderForestPokemonAttacksText, 65, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_8
    end

LavenderForestFieldMon9Script:
	trainer MISMAGIUS, FIELD_MON, EVENT_FIELD_MON_9, LavenderForestPokemonAttacksText, 68, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_9
    end

LavenderForestFieldMon10Script:
	trainer SPIRITOMB, FIELD_MON, EVENT_FIELD_MON_10, LavenderForestPokemonAttacksText, 77, 0, .script
.script
    disappear LAVENDERFOREST_FIELDMON_10
    end
    
LavenderForestPokemonAttacksText:
	text "Spirit attacks!"
	done

AgathaSisterScript:
	opentext
	checkevent EVENT_BEAT_ATHENA
	iftrue .FightDone
.fight
	writetext AgathaSeenText
	waitbutton
	faceplayer
	writetext AgathaSeenText2
	waitbutton
	closetext
	winlosstext AgathaBeatenText, AgathaBeatenText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer MEDIUM, ATHENA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ATHENA
	special HealParty
	end
.FightDone:
	writetext AgathaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextAgatha
	nooryes
	iftrue .fight
	writetext RematchRefuseTextAgatha
	waitbutton
	closetext
	end

AgathaSeenText:
    text "It's been two"
    line "years since you"
    cont "left me, sister."

    para "I still find I"
    line "have guilt any"
    cont "time I feel joy."

    para "I miss you."
    done

AgathaSeenText2:
    text "Are you here to"
    line "say goodbye to"
    cont "someone?"

    para "My sister Agatha"
    line "died two years"
    cont "ago."

    para "She was strong."

    para "She was an"
    line "Elite Four"
    cont "member."

    para "Last time Hoenn"
    line "attacked, she"
    cont "defended our"
    cont "home."

    para "Her #mon"
    line "possessed the"
    cont "soldiers and"
    cont "made them attack"
    cont "each other."

    para "She may be gone"
    line "but her #mon"
    cont "remain with me."

    para "Will you help"
    line "me gain their"
    cont "respect?"
    done

AgathaBeatenText:
    text "Thank you."
    done

AgathaAfterBattleText:
    text "I grow closer"
    line "to my sisters"
    cont "#mon each"
    cont "day"

    para "They give me"
    line "dreams of her."

    para "I will make"
    line "her proud."
    done

RematchTextAgatha:
    text "Can I train"
    line "with you?"
    done

RematchRefuseTextAgatha:
    text "Good luck"
    line "to you."
    done

LavenderForestLifeOrb:
	itemball LIFE_ORB

LavenderForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 26, SOUL_HOUSE, 5
	warp_event  2, 27, SOUL_HOUSE, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AgathaSisterScript, -1
	object_event 13,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ShayminScript, EVENT_CAUGHT_SHAYMIN
	object_event  5, 24, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon2Script, EVENT_FIELD_MON_2
	object_event 21, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon3Script, EVENT_FIELD_MON_3
	object_event 20, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon4Script, EVENT_FIELD_MON_4
	object_event 11, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon5Script, EVENT_FIELD_MON_5
	object_event 17, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon6Script, EVENT_FIELD_MON_6
	object_event 12, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon7Script, EVENT_FIELD_MON_7
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon8Script, EVENT_FIELD_MON_8
	object_event 19,  4, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon9Script, EVENT_FIELD_MON_9
	object_event  7, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, LavenderForestFieldMon10Script, EVENT_FIELD_MON_10
	object_event 20,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LavenderForestLifeOrb, EVENT_LAVENDER_FOREST_LIFE_ORB

