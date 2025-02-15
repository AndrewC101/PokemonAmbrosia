	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3
	const ROUTE13_FIELDMON_1
    const ROUTE13_FIELDMON_2
    const ROUTE13_FIELDMON_3
    const ROUTE13_FIELDMON_4
    const ROUTE13_FIELDMON_5
    const ROUTE13_FIELDMON_6

Route13_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route13FieldMon

.Route13FieldMon:
; Pokemon which always appear
    appear ROUTE13_FIELDMON_1
    appear ROUTE13_FIELDMON_3
    appear ROUTE13_FIELDMON_4

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE13_FIELDMON_5
    sjump .mon8
.spawn7
    appear ROUTE13_FIELDMON_5

.mon8
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE13_FIELDMON_6
    sjump .checkNight
.spawn8
    appear ROUTE13_FIELDMON_6

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end
    appear ROUTE13_FIELDMON_2
.end
    endcallback

Route13FieldMon1Script:
	trainer VICTREEBEL, FIELD_MON, EVENT_FIELD_MON_1, Route13PokemonAttacksText, 66, 0, .script
.script
    disappear ROUTE13_FIELDMON_1
    end

Route13FieldMon2Script:
	trainer HONCHKROW, FIELD_MON, EVENT_FIELD_MON_2, Route13PokemonAttacksText, 71, 0, .script
.script
    disappear ROUTE13_FIELDMON_2
    end

Route13PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route13FieldMon3Script:
	faceplayer
	cry NINETALES
	pause 15
	loadwildmon FERROTHORN, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE13_FIELDMON_3
	end

Route13FieldMon4Script:
	faceplayer
	cry SKARMORY
	pause 15
	loadwildmon SKARMORY, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE13_FIELDMON_4
	end

Route13FieldMon5Script:
	faceplayer
	cry CHANSEY
	pause 15
	loadwildmon CHANSEY, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE13_FIELDMON_5
	end

Route13FieldMon6Script:
	faceplayer
	cry DITTO
	pause 15
	loadwildmon DITTO, 77
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE13_FIELDMON_6
	end

TrainerPokefanmAlex:
	trainer POKEFANF, KATHLEEN, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer MYSTICALMAN, KING_JARETH, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Real life is"
	line "tough."
	para "It's important to"
	line "find role models"
	cont "that feel real."
	para "Ones that can"
	line "impart real"
	cont "lessons."
	done

PokefanmAlexBeatenText:
	text "You are now my"
	line "role model."
	done

PokefanmAlexAfterBattleText:
	text "Everyone needs"
	line "role models."
	para "But it's very hard"
	line "to find any female"
	cont "ones."
	para "I have made it my"
	line "life mission to"
	cont "fix this."
	done

PokefanmJoshuaSeenText:
	text "It's not safe out"
	line "here."
	para "It's wondrous,"
	line "with treasures to"
	cont "satiate desires"
	cont "both subtle and"
	cont "gross."
	para "But it's not for"
	line "the timid."
	done

PokefanmJoshuaBeatenText:
	text "The acquisition of"
	line "wealth is no"
	cont "longer the driving"
	cont "force of our"
	cont "lives."
	para "We work to better"
	line "ourselves and all"
	cont "#MON."
	done

PokefanmJoshuaAfterBattleText:
	text "Don't try to be a"
	line "great trainer,"
	cont "just be a trainer"
	cont "and let history"
	cont "make its own"
	cont "judgements."
	done

BirdKeeperPerrySeenText:
	text "Ah welcome to the"
	line "Labyrinth."
	para "One path leads out"
	line "of here, the other"
	cont "lead to certain"
	cont "death!"
	para "My brother always"
	line "lies but I always"
	cont "tell the truth..."
	para "Honestly."
	done

BirdKeeperPerryBeatenText:
	text "I always tell"
	line "the truth."
	done

BirdKeeperPerryAfterBattleText:
	text "What if I were my"
	line "brother? Would I"
	cont "say this path"
	cont "leads to death?"
	para "Um..."
	para "I don't know."
	done

BirdKeeperBretSeenText:
	text "You have entered"
	line "the Labyrinth."
	para "You want to reach"
	line "the goblin king"
	cont "JARETH?"
	para "We know the way."
	para "One of us always"
	line "tells the truth"
	cont "and the other"
	cont "always lies."
	para "You may ask us but"
	line "one question."
	done

BirdKeeperBretBeatenText:
	text "I always tell"
	line "the truth."
	done

BirdKeeperBretAfterBattleText:
	text "If I were my"
	line "brother I'd tell"
	cont "you this path"
	cont "leads to certain"
	cont "death!"
	done

HikerKennySeenText:
	text "Turn back"
	line "<PLAYER>."
	para "Beware."
	para "I have been"
	line "generous up until"
	cont "now."
	para "I can be cruel."
	para "I have reordered"
	line "time."
	para "I have turned the"
	line "world upside down."
	para "I have done it all"
	line "for you!"
	para "I move the stars"
	line "for no one."
	done

HikerKennyBeatenText:
	text "Stop."
	para "Look what I'm"
	line "offering you."
	para "Your dreams."
	done

HikerKennyAfterBattleText:
	text "I ask for so"
	line "little."
	para "Just fear me."
	para "Love me."
	para "Do as I ask, and I"
	line "shall be your"
	cont "slave."
	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13SignText:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

Route13DirectionsSignText:
	text "NORTH TO LAVENDER"
	line "TOWN"

	para "WEST TO FUCHSIA"
	line "CITY"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	def_object_events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_WILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_TRAINER, 1, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
	object_event 28,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route13FieldMon1Script, EVENT_FIELD_MON_1
	object_event 14,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route13FieldMon2Script, EVENT_FIELD_MON_2
	object_event  7,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route13FieldMon3Script, EVENT_FIELD_MON_3
	object_event 36,  6, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route13FieldMon4Script, EVENT_FIELD_MON_4
	object_event 49,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route13FieldMon5Script, EVENT_FIELD_MON_5
	object_event  8, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route13FieldMon6Script, EVENT_FIELD_MON_6
