	object_const_def
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL
	const ROUTE29_FIELDMON_1
	const ROUTE29_FIELDMON_3
	const ROUTE29_FIELDMON_4
	const ROUTE29_FIELDMON_5
	const ROUTE29_FIELDMON_6
	const ROUTE29_FIELDMON_7
	const ROUTE29_FIELDMON_8
	const ROUTE29_FIELDMON_9
	const ROUTE29_FIELDMON_10

Route29_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE29_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.DummyScene0:
	end

.DummyScene1:
	end

.Tuscany:
; Pokemon which always appear
    appear ROUTE29_FIELDMON_1
    appear ROUTE29_FIELDMON_4
    appear ROUTE29_FIELDMON_5
    appear ROUTE29_FIELDMON_6
    appear ROUTE29_FIELDMON_7
    appear ROUTE29_FIELDMON_9

; Pokemon that sometimes appear
    random 5
    ifequal 1, .spawn8
    disappear ROUTE29_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE29_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
	iffalse .tuscany

;    random 2
;    ifequal 1, .spawn2
;    disappear ROUTE29_FIELDMON_2
;    sjump .mon3
;.spawn2
;    appear ROUTE29_FIELDMON_2

.mon3
    random 6
    ifequal 1, .spawn3
    disappear ROUTE29_FIELDMON_3
    sjump .tuscany
.spawn3
    appear ROUTE29_FIELDMON_3

; Pokemon that don't appear at night
    disappear ROUTE29_FIELDMON_7

.tuscany
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
    setscene SCENE_ROUTE29_NOTHING
    checkitem REPULSOR
    iftrue .end
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
.end
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
    setscene SCENE_ROUTE29_NOTHING
    checkitem REPULSOR
    iftrue .end
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
.end
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

CatchingTutorialDudeScript:
    faceplayer
    opentext
    writetext CatchingTutorialDebriefText
    waitbutton
    readmem wFieldWeather
    ifequal WEATHER_SUN, .sun
    ifequal WEATHER_RAIN, .rain
    writetext NoWeatherText
    waitbutton
    closetext
    end
.sun
    writetext SunText
    waitbutton
    closetext
    end
.rain
    writetext RainText
    waitbutton
    closetext
    end

NoWeatherText:
	text "Right now it seems"
	line "to be clear."
	para "Could be better,"
	line "could be worse."
	done

SunText:
	text "Right now it seems"
	line "to be sunny."
	para "Grab some sun"
	line "cream and a nice"
	cont "cold drink!"
	done

RainText:
	text "Right now it seems"
	line "to be raining."
	para "I don't have an"
	line "umbrella either!"
	done


Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialIntroText:
	text "I've seen you a"
	line "couple times."

	para "Are #mon"
	line "giving you trouble"
	cont "by always popping"
	cont "up?"

	para "A REPULSOR will"
	line "keep weak ones"
	cont "away for good."

	para "There is a woman"
	line "in New Bark Town"
	cont "who has one."
	done

CatchingTutorialDebriefText:
	text "When you're"
	line "outside you never"
	cont "know what the"
	cont "weather will be."
	para "It could be sunny"
	line "or raining or it"
	cont "could be mild."
	para "It's random and"
	line "seems to change"
	cont "when you enter an"
	cont "area."
	done

Route29YoungsterText:
	text "You should check"
	line "out your Options"
	cont "in the menu."
	para "Battle Anim makes"
	line "battles more epic"
	cont "but they take"
	cont "longer."
	para "Battle Speed set"
	line "to Quick makes"
	cont "battles way faster"
	cont "but it's only for"
	cont "people who really"
	cont "know what they're"
	cont "doing."
	done

Route29TeacherText:
	text "You can see"
	line "details of your"
	cont "#mon moves in"
	cont "the MOVES option"
	cont "in the menu."
	para "ATK is the moves"
	line "power, ACC is its"
	cont "percent accuracy"
	cont "and EFF is the"
	cont "percent chance of"
	cont "its effect"
	cont "occurring."
	done

Route29FisherText:
	text "Some people talk"
	line "so slowly!"

	para "You can change"
	line "text speed in the"
	cont "OPTIONS menu."

	para "There is a new"
	line "OPTION for instant"
	cont "text called INST."

	para "Great when you're"
	line "impatient like me!"
	done

Route29CooltrainerMText_WaitingForNight:
	text "Watch out!"
	para "There is a rabid"
	line "RATICATE out"
	cont "there, it nearly"
	cont "got me."
	para "I'm too afraid to"
	line "leave."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "Get down!"
	para "There is a huge"
	line "violent URSARING"
	cont "around here at"
	cont "night."
	para "Don't bother"
	line "playing dead, it"
	cont "doesn't work!"
	done

MeetTuscanyText:
	text "TUSCANY: I do"
	line "believe that this"

	para "is the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done

Route29Sign2Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done
	
Route29FieldMon1Script:
	trainer RATICATE, FIELD_MON, EVENT_FIELD_MON_1, Route29PokemonAttacksText, 12, 0, .script
.script
    disappear ROUTE29_FIELDMON_1
    end
    
Route29FieldMon3Script:
	trainer URSARING, FIELD_MON, EVENT_FIELD_MON_3, Route29PokemonAttacksText, 31, 0, .script
.script
    disappear ROUTE29_FIELDMON_3
    end
    
Route29PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
Route29FieldMon4Script:
	faceplayer
	cry BUNEARY
	pause 15
	loadwildmon BUNEARY, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE29_FIELDMON_4
	end

Route29FieldMon5Script:
	faceplayer
	cry NIDORAN_M
	pause 15
	loadwildmon NIDORAN_M, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE29_FIELDMON_5
	end

Route29FieldMon6Script:
	faceplayer
	cry CLEFAIRY
	pause 15
	loadwildmon CLEFAIRY, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE29_FIELDMON_6
	end
	
Route29FieldMon7Script:
	faceplayer
	cry JOLTIK
	pause 15
	loadwildmon JOLTIK, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE29_FIELDMON_7
	end

Route29FieldMon8Script:
	faceplayer
	cry RIOLU
	pause 15
	loadwildmon RIOLU, 8
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE29_FIELDMON_8
	end

Route29FieldMon9Script:
	faceplayer
	cry NIDORAN_F
	pause 15
	loadwildmon NIDORAN_F, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear ROUTE29_FIELDMON_9
	end

Route29FieldMon10Script:
	faceplayer
	cry MEOWTH
	pause 15
	loadwildmon MEOWTH, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear ROUTE29_FIELDMON_10
	end

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53, 16, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53, 17, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51, 15, BGEVENT_READ, Route29Sign1
	bg_event  5,  3, BGEVENT_READ, Route29Sign2

	def_object_events
	object_event 50, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 19, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 12, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 24,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 26, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 52,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION

	object_event 35, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route29FieldMon1Script, EVENT_FIELD_MON_1
	;object_event 19,  8, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route29FieldMon2Script, EVENT_FIELD_MON_2
	object_event 29,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route29FieldMon3Script, EVENT_FIELD_MON_3
	object_event 21,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route29FieldMon4Script, EVENT_FIELD_MON_4
	object_event 46,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29FieldMon5Script, EVENT_FIELD_MON_5
	object_event 11,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29FieldMon6Script, EVENT_FIELD_MON_6
	object_event  5, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29FieldMon7Script, EVENT_FIELD_MON_7
	object_event 53,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route29FieldMon8Script, EVENT_FIELD_MON_8
	object_event 32, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FieldMon9Script, EVENT_FIELD_MON_9
	object_event 47, 15, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29FieldMon10Script, EVENT_FIELD_MON_10

