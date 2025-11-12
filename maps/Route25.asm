	object_const_def
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL
	const ROUTE25_FIELDMON_1
    const ROUTE25_FIELDMON_2
    const ROUTE25_FIELDMON_3
    const ROUTE25_FIELDMON_4
    const ROUTE25_FIELDMON_5

Route25_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE25_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE25_MISTYS_DATE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route25FieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.Route25FieldMon:
; Pokemon which always appear
    appear ROUTE25_FIELDMON_1
    appear ROUTE25_FIELDMON_2
    appear ROUTE25_FIELDMON_3
    appear ROUTE25_FIELDMON_4

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn
    disappear ROUTE25_FIELDMON_5
    sjump .end
.spawn
    appear ROUTE25_FIELDMON_5
.end
    endcallback

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement1
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement1
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement1
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement2
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement2
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement2
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

Route25MistysDateLeavesMovement1:
	big_step DOWN
	step_end

Route25MistysDateLeavesMovement2:
	big_step DOWN
	big_step DOWN
	step_end

Route25MistyApproachesPlayerMovement1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyApproachesPlayerMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement2:
	step UP
	step LEFT
	step_end

Route25MistyLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "What do you think"
	line "you're doing!?"

	para "That date was"
	line "going really well!"

	para "You shouldn't ruin"
	line "other peoples fun"
	cont "because you are"
	cont "jealous."

	para "...."

	para "Oh, you want a"
	line "Gym battle."

	para "Yes, I am MISTY"
	line "the Gym Leader."

	para "I'll be all too"
	line "happy to crush"
	cont "you in a battle."

	para "Meet me at the"
	line "Gym if you are"
	cont "brave enough."
	done

SchoolboyDudleySeenText:
	text "We 6 are about"
	line "to enter CERULEAN"
	cont "CAVE."

	para "We have been in"
	line "training just"
	cont "for this."

	para "You can be our"
	line "final test!"
	done

SchoolboyDudleyBeatenText:
	text "I am the"
	line "weakest!"
	done

SchoolboyDudleyAfterBattleText:
	text "I'm going to"
	line "catch some super"
	cont "strong #mon"
	cont "in the cave."

	para "Then I'll win!"
	done

LassEllenSeenText:
	text "I am number 5."

	para "I prepare the"
	line "food for the trip."

	para "It's basically"
	line "just chocolate"
	cont "bars and energy"
	cont "drinks."

	para "Here, have some"
	line "RED TAUROS!"
	done

LassEllenBeatenText:
	text "I need more"
	line "energy drink!"
	done

LassEllenAfterBattleText:
	text "When you are on"
	line "a big trip you"
	cont "don't care about"
	cont "healthy food."

	para "You need as much"
	line "quick energy as"
	cont "possible."
	done

SchoolboyJoeSeenText:
	text "I am ranked"
	line "forth in strength."

	para "I have taken the"
	line "liberty to plan"
	cont "the route our"
	cont "exhibition shall"
	cont "travel."

	para "It is a veritable"
	line "labyrinth of rock"
	cont "within the cave."
	done

SchoolboyJoeBeatenText:
	text "I couldn't find"
	line "my way to victory."
	done

SchoolboyJoeAfterBattleText:
	text "There is nothing"
	line "more terrifying"
	cont "than being truly,"
	cont "utterly lost."

	para "One must sit and"
	line "calm ones nerves"
	cont "so one may think."
	done

LassLauraSeenText:
	text "I am LAURA!"

	para "I am number 3!"

	para "I raised the funds"
	line "for the trip."

	para "I swam in the sea"
	line "and ran a marathon"
	cont "in a cute MEOWTH"
	cont "costume."

	para "All this gear is"
	line "expensive!"

	para "Who will sponsor"
	line "me to battle this"
	cont "stranger?"
	done

LassLauraBeatenText:
	text "I wasn't sponsored"
	line "so it doesn't"
	cont "matter."
	done

LassLauraAfterBattleText:
	text "I may have got"
	line "addicted to"
	cont "energy drinks."

	para "Especially that"
	line "RED TAUROS."
	done

CamperLloydSeenText:
	text "I am number 2!"

	para "Second only to"
	line "number 1!"

	para "I bought the"
	line "gear!"

	para "We got Helmets,"
	line "head lamps,"
	cont "harnesses,"
	cont "ascenders,"
	cont "ropes."

	para "It's the gear"
	line "that keeps you"
	cont "alive!"
	done

CamperLloydBeatenText:
	text "My ascender"
	line "snapped!"
	done

CamperLloydAfterBattleText:
	text "You don't have"
	line "any of this gear!"

	para "Don't you feel"
	line "naked without it!?"
	done

LassShannonSeenText:
	text "I am number 1!"

	para "There are many"
	line "strong #mon"
	cont "in the cave."

	para "I am the muscle"
	line "that will fight"
	cont "them off."

	para "You are going"
	line "down!"
	done

LassShannonBeatenText:
	text "Mayday!"
	done

LassShannonAfterBattleText:
	text "You should join"
	line "us!"

	para "We need someone"
	line "as strong as you!"
	done

CooltrainermKevinNuggetText:
	text "I am the"
	line "organiser of"
	cont "the trip."

	para "Well done on"
	line "giving the troops"
	cont "a good warm up."

	para "Here, take this!"
	done

CooltrainermKevinSeenText:
	text "Of course I'm"
	line "not actually"
	cont "going in myself."

	para "But I will take"
	line "the credit for"
	cont "anything they"
	cont "find!"
	done

CooltrainermKevinBeatenText:
	text "I've never had a"
	line "battle this good!"
	done

CooltrainermKevinAfterBattleText:
	text "That was a great"
	line "battle!"

	para "You and your"
	line "#mon are truly"
	cont "outstanding!"
	done

BillsHouseSignText:
	text "SEA COTTAGE"
	line "BILL'S HOUSE"
	done

UnusedBillsHouseSignText: ; unreferenced
	text "BILL'S HOUSE"
	done

Route25FieldMon1Script:
	faceplayer
	cry PERSIAN
	pause 15
	loadwildmon PERSIAN, 39
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE25_FIELDMON_1
	end

Route25FieldMon2Script:
	faceplayer
	cry VICTREEBEL
	pause 15
	loadwildmon VICTREEBEL, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE25_FIELDMON_2
	end

Route25FieldMon3Script:
	faceplayer
	cry POLIWRATH
	pause 15
	loadwildmon POLIWRATH, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE25_FIELDMON_3
	end

Route25FieldMon4Script:
	faceplayer
	cry NINETALES
	pause 15
	loadwildmon NINETALES, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE25_FIELDMON_4
	end

Route25FieldMon5Script:
	faceplayer
	cry ALAKAZAM
	pause 15
	loadwildmon ALAKAZAM, 64
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE25_FIELDMON_5
	end

Route25_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 47,  5, BILLS_HOUSE, 1

	def_coord_events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	def_bg_events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	def_object_events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
	object_event  5, 10, SPRITE_PERSIAN, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, Route25FieldMon1Script, EVENT_FIELD_MON_1
	object_event 38,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, Route25FieldMon2Script, EVENT_FIELD_MON_2
	object_event 49,  7, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route25FieldMon3Script, EVENT_FIELD_MON_3
	object_event 15,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route25FieldMon4Script, EVENT_FIELD_MON_4
	object_event  5,  4, SPRITE_ALAKAZAM, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route25FieldMon5Script, EVENT_FIELD_MON_5
