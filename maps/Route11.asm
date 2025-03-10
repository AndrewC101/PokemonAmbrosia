	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE
	const ROUTE11_FIELDMON_1
    const ROUTE11_FIELDMON_2
    const ROUTE11_FIELDMON_3
    const ROUTE11_FIELDMON_4
    const ROUTE11_FIELDMON_5
    const ROUTE11_FIELDMON_6
    const ROUTE11_FIELDMON_7
    const ROUTE11_FIELDMON_8

Route11_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route11FieldMon

.Route11FieldMon:
; Pokemon which always appear
    appear ROUTE11_FIELDMON_1
    appear ROUTE11_FIELDMON_3
    appear ROUTE11_FIELDMON_4
    disappear ROUTE11_FIELDMON_2

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE11_FIELDMON_6
    disappear ROUTE11_FIELDMON_5
    sjump .mon7
.spawn6
    appear ROUTE11_FIELDMON_6
    appear ROUTE11_FIELDMON_5

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE11_FIELDMON_7
    sjump .mon8
.spawn7
    appear ROUTE11_FIELDMON_7

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE11_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE11_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end
    appear ROUTE11_FIELDMON_2
.end
    endcallback

Route11FieldMon1Script:
	trainer SCYTHER, FIELD_MON, EVENT_FIELD_MON_1, Route11PokemonAttacksText, 66, 0, .script
.script
    disappear ROUTE11_FIELDMON_1
    end

Route11FieldMon2Script:
	trainer URSALUNA_B, FIELD_MON, EVENT_FIELD_MON_2, Route11PokemonAttacksText, 62, 0, .script
.script
    disappear ROUTE11_FIELDMON_2
    end

Route11PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route11FieldMon3Script:
	faceplayer
	cry NINETALES
	pause 15
	loadwildmon NINETALES, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE11_FIELDMON_3
	end

Route11FieldMon4Script:
	faceplayer
	cry URSARING
	pause 15
	loadwildmon URSARING, 43
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE11_FIELDMON_4
	end

Route11FieldMon5Script:
	faceplayer
	cry NIDOKING
	pause 15
	loadwildmon NIDOKING, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE11_FIELDMON_5
	end

Route11FieldMon6Script:
	faceplayer
	cry NIDOQUEEN
	pause 15
	loadwildmon NIDOQUEEN, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE11_FIELDMON_6
	end

Route11FieldMon7Script:
	faceplayer
	cry RAPIDASH
	pause 15
	loadwildmon RAPIDASH, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE11_FIELDMON_7
	end

Route11FieldMon8Script:
	faceplayer
	cry PONYTA
	pause 15
	loadwildmon PONYTA, 28
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE11_FIELDMON_8
	end

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "Are you here for"
	line "the SOLENOID"
	cont "concert?"
	para "No way man, I got"
	line "here first!"
	done

YoungsterOwenBeatenText:
	text "Radical dude!"
	done

YoungsterOwenAfterBattleText:
	text "Dude you're not a"
	line "true fan, I can"
	cont "tell."
	done

YoungsterJasonSeenText:
	text "There is something"
	line "big, long and hard"
	cont "inside DIGLETTS"
	cont "CAVE."
	done

YoungsterJasonBeatenText:
	text "You're hard too."
	done

YoungsterJasonAfterBattleText:
	text "I don't know what"
	line "it is but I'm not"
	cont "going near it!"
	done

PsychicHermanSeenText:
	text "I just gave a lot"
	line "of money to some"
	cont "old man in town."
	para "I can foresee it"
	line "was a really dumb"
	cont "move."
	done

PsychicHermanBeatenText:
	text "I'm such an idiot!"
	done

PsychicHermanAfterBattleText:
	text "I need to get that"
	line "money back or that"
	cont "new SAFFRON GYM"
	cont "LEADER will come"
	cont "looking for me!"
	done

PsychicFidelSeenText:
	text "I was trying to"
	line "move that SNORLAX"
	cont "with my mind."
	para "I swear I made it"
	line "roll over once."
	done

PsychicFidelBeatenText:
	text "See? I made it"
	line "move!"
	done

PsychicFidelAfterBattleText:
	text "SABRINA could pick"
	line "that SNORLAX up"
	cont "and flip it around"
	cont "like a pancake"
	cont "with her mind."
	para "Her beautiful"
	line "mind!"
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	def_object_events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
	object_event 14,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route11FieldMon1Script, EVENT_FIELD_MON_1
	object_event 29,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route11FieldMon2Script, EVENT_FIELD_MON_2
	object_event 12, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route11FieldMon3Script, EVENT_FIELD_MON_3
	object_event  7,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route11FieldMon4Script, EVENT_FIELD_MON_4
	object_event 18, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route11FieldMon5Script, EVENT_FIELD_MON_5
	object_event 21, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11FieldMon6Script, EVENT_FIELD_MON_6
	object_event 29,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route11FieldMon7Script, EVENT_FIELD_MON_7
	object_event 31,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route11FieldMon8Script, EVENT_FIELD_MON_8
