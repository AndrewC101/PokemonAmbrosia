	object_const_def
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL
	const ROUTE15_FIELDMON_1
    const ROUTE15_FIELDMON_2
    const ROUTE15_FIELDMON_3
    const ROUTE15_FIELDMON_4
    const ROUTE15_FIELDMON_5
    const ROUTE15_FIELDMON_6

Route15_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route15FieldMon

.Route15FieldMon:
; Pokemon which always appear
    appear ROUTE15_FIELDMON_1
    appear ROUTE15_FIELDMON_3
    appear ROUTE15_FIELDMON_4

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE15_FIELDMON_2
    sjump .mon7
.spawn6
    appear ROUTE15_FIELDMON_2

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE15_FIELDMON_5
    sjump .mon8
.spawn7
    appear ROUTE15_FIELDMON_5

.mon8
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE15_FIELDMON_6
    sjump .end
.spawn8
    appear ROUTE15_FIELDMON_6

.end
    endcallback

Route15FieldMon1Script:
	trainer ARCANINE, FIELD_MON, EVENT_FIELD_MON_1, Route15PokemonAttacksText, 65, 0, .script
.script
    disappear ROUTE15_FIELDMON_1
    end

Route15FieldMon2Script:
	trainer AERODACTYL, FIELD_MON, EVENT_FIELD_MON_2, Route15PokemonAttacksText, 66, 0, .script
.script
    disappear ROUTE15_FIELDMON_2
    end

Route15PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route15FieldMon3Script:
	faceplayer
	cry TAUROS
	pause 15
	loadwildmon TAUROS, 52
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE15_FIELDMON_3
	end

Route15FieldMon4Script:
	faceplayer
	cry TOGEKISS
	pause 15
	loadwildmon TOGEKISS, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE15_FIELDMON_4
	end

Route15FieldMon5Script:
	faceplayer
	cry MACHAMP
	pause 15
	loadwildmon MACHAMP, 53
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE15_FIELDMON_5
	end

Route15FieldMon6Script:
	faceplayer
	cry VENUSAUR
	pause 15
	loadwildmon VENUSAUR, 53
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE15_FIELDMON_6
	end

TrainerTeacherColette:
	trainer BEAUTY, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer BEAUTY, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball TM_TOXIC

TeacherColetteSeenText:
	text "Some #mon are"
	line "immune to Ground"
	cont "moves."
	para "Others can't be"
	line "knocked out in a"
	cont "single hit."
	para "It is vital to"
	line "know these things!"
	done

TeacherColetteBeatenText:
	text "What about Wonder"
	line "Guard!"
	done

TeacherColetteAfterBattleText:
	text "Have you memorised"
	line "all #mon"
	cont "abilities!?"
	done

TeacherHillarySeenText:
	text "It fills me with"
	line "joy to see the"
	cont "next generation"
	cont "grow and learn."
	para "But what kind of"
	line "world will we"
	cont "leave for them?"
	done

TeacherHillaryBeatenText:
	text "What about the"
	line "children?"
	done

TeacherHillaryAfterBattleText:
	text "As a teacher I"
	line "feel a duty to"
	cont "heal the world,"
	cont "make it a better"
	cont "place."
	para "And set a homework"
	line "on it worth 10"
	cont "percent."
	done

SchoolboyTommySeenText:
	text "My #mon used"
	line "to be my pets."
	para "Then I trained"
	line "them into fierce"
	cont "fighting machines."
	done

SchoolboyTommyBeatenText:
	text "My darlings!"
	done

SchoolboyTommyAfterBattleText:
	text "We are learning"
	line "about #mon"
	cont "abilities in"
	cont "class. It all"
	cont "seems like"
	cont "someone made up."
	done

SchoolboyJohnnySeenText:
	text "We are learning"
	line "about #mon"
	cont "abilities!"
	para "Some #mon have"
	line "more than one."
	para "Do you know"
	line "which #mon has"
	cont "the most"
	cont "abilities?"
	done

SchoolboyJohnnyBeatenText:
	text "You have lots of"
	line "abilities too."
	done

SchoolboyJohnnyAfterBattleText:
	text "Magnezone has"
	line "three abilities."
	para "Zap Cannon never"
	line "misses."
	para "Can't be KOed in"
	line "one hit and deals"
	cont "damage when"
	cont "defeated."
	para "I doubt any"
	line "#mon has more"
	cont "than that."
	para "Except like,"
	line "Arceus itself or"
	cont "something."
	done

Route15SignText:
	text "Route 15"

	para "Fuchsia City -"
	line "Lavender Town"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
	object_event 19, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route15FieldMon1Script, EVENT_FIELD_MON_1
	object_event 15,  5, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route15FieldMon2Script, EVENT_FIELD_MON_2
	object_event 34, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route15FieldMon3Script, EVENT_FIELD_MON_3
	object_event 34,  5, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route15FieldMon4Script, EVENT_FIELD_MON_4
	object_event  8,  5, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FieldMon5Script, EVENT_FIELD_MON_5
	object_event 12,  8, SPRITE_VENUSAUR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route15FieldMon6Script, EVENT_FIELD_MON_6
