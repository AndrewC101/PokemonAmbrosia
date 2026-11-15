    object_const_def
    const LAVENDERFOREST_AGATHA_SISTER
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

LavenderForestFieldMon1Script:
	faceplayer
	cry CHANDELURE
	loadwildmon CHANDELURE, 66
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
    disappear LAVENDERFOREST_FIELDMON_1
    end

LavenderForestFieldMon2Script:
	faceplayer
	cry POLTEGEIST
	loadwildmon POLTEGEIST, 62
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
    disappear LAVENDERFOREST_FIELDMON_2
    end

LavenderForestFieldMon3Script:
	faceplayer
	cry MISMAGIUS
	loadwildmon MISMAGIUS, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
    disappear LAVENDERFOREST_FIELDMON_3
    end

LavenderForestFieldMon4Script:
	faceplayer
	cry ROTOM
	loadwildmon ROTOM, 64
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
    disappear LAVENDERFOREST_FIELDMON_4
    end

LavenderForestFieldMon5Script:
	faceplayer
	cry AEGISLASH
	loadwildmon AEGISLASH, 64
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
    disappear LAVENDERFOREST_FIELDMON_5
    end

LavenderForestFieldMon6Script:
	faceplayer
	cry GENGAR
	loadwildmon GENGAR, 67
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
    disappear LAVENDERFOREST_FIELDMON_6
    end

LavenderForestFieldMon7Script:
	faceplayer
	cry MIMIKYU
	loadwildmon MIMIKYU, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
    disappear LAVENDERFOREST_FIELDMON_7
    end

LavenderForestFieldMon8Script:
	faceplayer
	cry GENGAR
	loadwildmon GENGAR, 65
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
    disappear LAVENDERFOREST_FIELDMON_8
    end

LavenderForestFieldMon9Script:
	faceplayer
	cry MISMAGIUS
	loadwildmon MISMAGIUS, 68
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
    disappear LAVENDERFOREST_FIELDMON_9
    end

LavenderForestFieldMon10Script:
	faceplayer
	cry NOWN
	loadwildmon NOWN, 77
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
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
	warp_event 12, 27, ROUTE_10_SOUTH, 1
	warp_event 13, 27, ROUTE_10_SOUTH, 2
	warp_event 12,  0, ROCK_TUNNEL_1F, 2
	warp_event 13,  0, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AgathaSisterScript, -1
	object_event  5, 24, SPRITE_LASS, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon2Script, EVENT_FIELD_MON_2
	object_event 21, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon3Script, EVENT_FIELD_MON_3
	object_event 20, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon4Script, EVENT_FIELD_MON_4
	object_event 11, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon5Script, EVENT_FIELD_MON_5
	object_event 17, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon6Script, EVENT_FIELD_MON_6
	object_event 12, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon7Script, EVENT_FIELD_MON_7
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon8Script, EVENT_FIELD_MON_8
	object_event 19,  4, SPRITE_GRANNY, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon9Script, EVENT_FIELD_MON_9
	object_event  7, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_MON_WANDER_CHASE, 4, 4, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LavenderForestFieldMon10Script, EVENT_FIELD_MON_10
	object_event 20,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LavenderForestLifeOrb, EVENT_LAVENDER_FOREST_LIFE_ORB
