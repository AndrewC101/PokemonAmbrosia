	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer POKEMANIAC, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer BEAUTY, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd TrashCanScript

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Hey I need your"
	line "help!"

	para "My best buddy"
	line "and I had a"
	cont "bit of a fight."

	para "We sailors fight"
	line "all the time."

	para "But he has left"
	line "me here and I"
	cont "feel guilty."

	para "But I can't say"
	line "sorry or anything"
	cont "pansy like that."

	para "I need you to"
	line "do it for me."

	para "Find my friend"
	line "and tell him I'm"
	cont "sorry."
	done

FastShipB1FOnDutySailorRefusedText:
	text "You don't get it."

	para "A friendship is"
	line "at stake."

	para "Only you can"
	line "save it!"
	done

FastShipB1FOnDutySailorThanksText:
	text "Thanks buddy."

	para "You have healed"
	line "a friendship."

	para "I now consider you"

	para "...."

	para "My friend!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "A little girl?"

	para "I may have seen"
	line "her go by here."

	para "Then again, maybe"
	line "I saw nothing."

	para "What's it to ya?"
	done

FastShipB1FOnDutySailorDirectionsText:
	text "The dining room is"
	line "up ahead."

	para "Dinner starts at"
	line "7pm."

	para "The stairs at the"
	line "end lead to the"
	cont "Captain's cabin."

	para "But passengers are"
	line "prohibited from"
	cont "entering."

	para "This job is so"
	line "boring."
	done

SailorJeffSeenText:
	text "I need to train!"

	para "We could run into"
	line "a Hoenn ship any"
	cont "day now."
	done

SailorJeffBeatenText:
	text "That was a good"
	line "warm up."
	done

SailorJeffAfterBattleText:
	text "My #mon"
	line "need to be strong"
	cont "enough to swim me"
	cont "to shore."
	done

PicnickerDebraSeenText:
	text "I heard Johto has"
	line "a new Champion!"

	para "I heard they are"
	line "young, beautiful"
	cont "and get their"
	cont "strength from"
	cont "MOO MOO MILK."
	done

PicnickerDebraBeatenText:
	text "You are super"
	line "strong..."

	para "and young..."

	para "and beautiful..."
	done

PicnickerDebraAfterBattleText:
	text "Are you the"
	line "Champion!?"

	para "Is your secret"
	line "MOO MOO MILK!?"
	done

JugglerFritzSeenText:
	text "Awwwwww"

	para "To and fro..."

	para "To and fro..."

	para "I'm going to"
	line "and throw..."
	done

JugglerFritzBeatenText:
	text "Oh no, here it..."

	para "URRHHHHHHH...."
	done

JugglerFritzAfterBattleText:
	text "Listen!"

	para "At the canteen."

	para "Don't eat the"
	line "FEEBAS!"
	done

SailorGarrettSeenText:
	text "Did you feel that?"

	para "Did we just get"
	line "hit by a missile!?"

	para "Hull breach!!!"
	done

SailorGarrettBeatenText:
	text "I need to relax."
	done

SailorGarrettAfterBattleText:
	text "Where is your"
	line "life jacket?"

	para "You're not wearing"
	line "it, are you mad!?"
	done

FisherJonahSeenText:
	text "I need to catch"
	line "more FEEBAS."

	para "They are where I"
	line "get all my money"
	cont "from."

	para "Nobody wants"
	line "MAGIKARP!"
	done

FisherJonahBeatenText:
	text "I need a bigger"
	line "net."
	done

FisherJonahAfterBattleText:
	text "I don't actually"
	line "have a fishing"
	cont "licence."

	para "Don't tell anyone"
	line "or my kids will"
	cont "starve!"
	done

BlackbeltWaiSeenText:
	text "I am traveling"
	line "the world to"
	cont "challenge all the"
	cont "martial art"
	cont "masters."

	para "I will defeat"
	line "them all!"

	para "Then everyone"
	line "will train at"
	cont "my dojo!"
	done

BlackbeltWaiBeatenText:
	text "The sun was in"
	line "my eyes."
	done

BlackbeltWaiAfterBattleText:
	text "I couldn't find"
	line "the KARATE KING in"
	cont "Johto."

	para "He's supposed to"
	line "be training in a"
	cont "cave somewhere."

	para "He knows I am"
	line "coming and he is"
	cont "hiding away."

	para "Hooha!"
	done

SailorKennethSeenText:
	text "I need your"
	line "life jacket!"

	para "Hand it over kid!"
	done

SailorKennethBeatenText:
	text "I can't swim."
	done

SailorKennethAfterBattleText:
	text "Come on, you"
	line "don't need it!"

	para "Your #mon"
	line "can save you."
	done

TeacherShirleySeenText:
	text "Did you hear there"
	line "is now a Johto"
	cont "Champion?"

	para "This is awful!"

	para "I was sure one of"
	line "my students would"
	cont "be the first to"
	cont "become Champion."
	done

TeacherShirleyBeatenText:
	text "I've wasted my life!"
	done

TeacherShirleyAfterBattleText:
	text "We're on a field"
	line "trip to the RUINS"
	cont "outside VIOLET."

	para "There we will find"
	line "some great power."

	para "I know it!"
	done

SchoolboyNateSeenText:
	text "Do you know the"
	line "RUINS OF ALPH?"

	para "We are going"
	line "there."

	para "There we will"
	line "find the power"
	cont "to conquer the"
	cont "Elite Four."
	done

SchoolboyNateBeatenText:
	text "No way!"
	done

SchoolboyNateAfterBattleText:
	text "Radios pick up"
	line "strange signals"
	cont "inside the RUINS."

	para "It must be the"
	line "secret power!"
	done

SchoolboyRickySeenText:
	text "I want to find the"
	line "new Johto CHAMP."

	para "I'm going to beat"
	line "them and prove it"
	cont "should have been"
	cont "me to become"
	cont "Champion!"
	done

SchoolboyRickyBeatenText:
	text "It can't be..."

	para "It's you!"
	done

SchoolboyRickyAfterBattleText:
	text "I'm sorry."

	para "I thought I was"
	line "strong enough"
	cont "to be the CHAMP."

	para "But it's clear I"
	line "am nowhere near."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 30,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	def_object_events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
