	object_const_def
	const ROUTE1_YOUNGSTER
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE
	const ROUTE1_FIELDMON_1
    const ROUTE1_FIELDMON_2
    const ROUTE1_FIELDMON_3
    const ROUTE1_FIELDMON_4
    const ROUTE1_FIELDMON_5
    const ROUTE1_FIELDMON_6

Route1_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route1FieldMon

.Route1FieldMon:
; Pokemon which always appear
    appear ROUTE1_FIELDMON_1
    appear ROUTE1_FIELDMON_3
    appear ROUTE1_FIELDMON_4
    appear ROUTE1_FIELDMON_5

    random 3 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE1_FIELDMON_6
    sjump .checkNight
.spawn8
    appear ROUTE1_FIELDMON_6

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE1_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE1_FIELDMON_5

.end
    endcallback

Route1FieldMon1Script:
	trainer PERSIAN, FIELD_MON, EVENT_FIELD_MON_1, Route1PokemonAttacksText, 21, 0, .script
.script
    disappear ROUTE1_FIELDMON_1
    end

Route1FieldMon2Script:
	trainer RATICATE, FIELD_MON, EVENT_FIELD_MON_2, Route1PokemonAttacksText, 40, 0, .script
.script
    disappear ROUTE1_FIELDMON_2
    end

Route1PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route1FieldMon3Script:
	faceplayer
	cry RATTATA
	pause 15
	loadwildmon RATTATA, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE1_FIELDMON_3
	end

Route1FieldMon4Script:
	faceplayer
	cry STARLY
	pause 15
	loadwildmon STARLY, 4
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE1_FIELDMON_4
	end

Route1FieldMon5Script:
	faceplayer
	cry EEVEE
	pause 15
	loadwildmon EEVEE, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE1_FIELDMON_5
	end

Route1FieldMon6Script:
	faceplayer
	cry PIKACHU
	pause 15
	loadwildmon PIKACHU, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE1_FIELDMON_6
	end

TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "The only things"
	line "about school I'm"
	cont "sure I'll remember"
	cont "are my friends."
	done

SchoolboyDannyBeatenText:
	text "Good times!"
	done

SchoolboyDannyAfterBattleText:
	text "Friends always"
	line "stay with you."

	para "They are what give"
	line "colour to all the"
	cont "memories."
	done

CooltrainerfQuinnSeenText:
	text "Are you a new"
	line "trainer?"
	para "I'm really"
	line "sorry but I"
	cont "have to do"
	cont "this."
	para "I have to"
	line "destroy you."
	done

CooltrainerfQuinnBeatenText:
	text "Please"
	line "forgive me."
	done

CooltrainerfQuinnAfterBattleText:
	text "It is my duty"
	line "as a trainer"
	cont "to destroy my"
	cont "enemies."
	para "No matter how"
	line "unfair it"
	cont "might be."
	done

Route1SignText:
	text "Route 1"

	para "Pallet Town -"
	line "Viridian City"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  7, 27, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  4, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  3,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event  3, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route1FieldMon1Script, EVENT_FIELD_MON_1
	object_event 14,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route1FieldMon2Script, EVENT_FIELD_MON_2
	object_event  5, 28, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route1FieldMon3Script, EVENT_FIELD_MON_3
	object_event 10, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route1FieldMon4Script, EVENT_FIELD_MON_4
	object_event  5,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route1FieldMon5Script, EVENT_FIELD_MON_5
	object_event 14, 29, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route1FieldMon6Script, EVENT_FIELD_MON_6
