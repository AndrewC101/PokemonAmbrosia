	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3
	const ROUTE6_FIELDMON_1
    const ROUTE6_FIELDMON_2
    const ROUTE6_FIELDMON_3
    const ROUTE6_FIELDMON_4
    const ROUTE6_FIELDMON_5
    const ROUTE6_INVADER

Route6_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route6FieldMon

.Route6FieldMon:
    disappear ROUTE6_INVADER
    checkevent EVENT_BEAT_INVADER_BACKSTABER
    iffalse .fieldMon
    appear ROUTE6_INVADER
.fieldMon
; Pokemon which always appear
    appear ROUTE6_FIELDMON_1
    appear ROUTE6_FIELDMON_3
    appear ROUTE6_FIELDMON_4

    random 4
    ifequal 1, .spawn8
    disappear ROUTE6_FIELDMON_5
    sjump .checkNight
.spawn8
    appear ROUTE6_FIELDMON_5

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end
    appear ROUTE6_FIELDMON_2
.end
    endcallback

Route6FieldMon1Script:
	trainer PINSIR, FIELD_MON, EVENT_FIELD_MON_1, Route6PokemonAttacksText, 62, 0, .script
.script
    disappear ROUTE6_FIELDMON_1
    end

Route6FieldMon2Script:
	trainer JOLTEON, FIELD_MON, EVENT_FIELD_MON_2, Route6PokemonAttacksText, 64, 0, .script
.script
    disappear ROUTE6_FIELDMON_2
    end

Route6PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route6FieldMon3Script:
	faceplayer
	cry MAGNETON
	pause 15
	loadwildmon MAGNETON, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE6_FIELDMON_3
	end

Route6FieldMon4Script:
	faceplayer
	cry VICTREEBEL
	pause 15
	loadwildmon VICTREEBEL, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE6_FIELDMON_4
	end

Route6FieldMon5Script:
	faceplayer
	cry ELECTRODE
	pause 15
	loadwildmon ELECTRODE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE6_FIELDMON_5
	end

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "The road is closed"
	line "while the power"
	cont "is out."

	para "There must be a"
	line "problem at the"
	cont "POWER PLANT."

	para "It must be HOEN."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "I'm not so much"
	line "into games."

	para "I'm more into"
	line "super heroes."

	para "The more over"
	line "powered and"
	cont "morally dubious"
	cont "the better."
	done

PokefanmRexBeatenText:
	text "How!?"
	done

PokefanmRexAfterBattleText:
	text "I wish I had"
	line "super powers."

	para "Then I wouldn't"
	line "have to pay my"
	cont "rent!"
	done

PokefanmAllanSeenText:
	text "I'm not much into"
	line "comics."

	para "I like strategy"
	line "games."

	para "But not ones that"
	line "involve any luck!"

	para "I want pure mind"
	line "verses mind."
	done

PokefanmAllanBeatenText:
	text "Checkmate!"
	done

PokefanmAllanAfterBattleText:
	text "Life is a game"
	line "of chess."

	para "Everybody else is"
	line "always trying to"
	cont "put me in check."
	done

InvaderBackstaberScript:
	trainer INVADER, BACKSTABER, EVENT_BEAT_INVADER_BACKSTABER, InvaderBackstabberSeenText, InvaderBackstabberBeatenText, InvaderBackstabberVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderBackstabberAfterBattleText
	waitbutton
	closetext
	end

InvaderBackstabberSeenText:
	text "You might think"
	line "that wining every"
	cont "match in one hit"
	cont "would get boring."

	para "But you'd be wrong."
	done

InvaderBackstabberVictoryText:
	text "I had fun!"
	done

InvaderBackstabberBeatenText:
	text "You jus got"
	line "lucky."
	done

InvaderBackstabberAfterBattleText:
	text "And I spent so"
	line "much time grinding"
	cont "coins in CELADON"
	cont "to get these"
	cont "weapons!"
	done

InvaderBackstaberScene:
    checkevent EVENT_BEAT_INVADER_BACKSTABER
    iftrue .end
    appear ROUTE6_INVADER
    applymovement ROUTE6_INVADER, BackstabberApproaches
    showemote EMOTE_SHOCK, PLAYER, 15
    opentext
    writetext BackstabText
    waitbutton
    closetext
    winlosstext InvaderBackstabberBeatenText, InvaderBackstabberVictoryText
	loadtrainer INVADER, BACKSTABER
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_INVADER_BACKSTABER
	turnobject PLAYER, UP
    applymovement ROUTE6_INVADER, BackstabberLeaves
.end
    end

BackstabberApproaches:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

BackstabberLeaves:
    fix_facing
    slow_step UP
    slow_step UP
    slow_step UP
    remove_fixed_facing
    step_end

BackstabText:
    text "BACKSTAB!"
    done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events
	coord_event  22, 7, SCENE_ALWAYS, InvaderBackstaberScene

	def_bg_events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
	object_event 18,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route6FieldMon1Script, EVENT_FIELD_MON_1
	object_event 13, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route6FieldMon2Script, EVENT_FIELD_MON_2
	object_event  4,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route6FieldMon3Script, EVENT_FIELD_MON_3
	object_event  4, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route6FieldMon4Script, EVENT_FIELD_MON_4
	object_event  9,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route6FieldMon5Script, EVENT_FIELD_MON_5
	object_event 22,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderBackstaberScript, EVENT_FIELD_MON_6

