	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	def_scene_scripts
	scene_script .DragonShrineTest ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.DragonShrineTest:
	sdefer .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
	sjump .Question1
.WrongAnswer
    writetext WrongAnswerText
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 3, .WrongAnswer
    writetext Question1CorrectText
.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 2, .WrongAnswer
	ifequal 3, .WrongAnswer
	writetext Question2CorrectText
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 3, .WrongAnswer
	writetext Question3CorrectText
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .WrongAnswer
    writetext Question4CorrectText
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 2, .WrongAnswer
	ifequal 3, .WrongAnswer
	writetext Question5CorrectText
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	loadmem wLevelCap, 70
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_FINISHED
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	promptbutton
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 5
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Dragonite@"
	db "Charizard@"
	db "Kingdra@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Draco Meteor@"
	db "Dragon Pulse@"
	db "Outrage@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Dragonite@"
	db "Salamence@"
	db "Garchomp@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Dragonair@"
	db "Latias@"
	db "Kingdra@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Zygarde@"
	db "Rayquaza@"
	db "Dialga@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "The world is a"
	line "frantic swirl of"
	cont "cycles."

	para "Some small, some"
	line "large."

	para "From the falling"
	line "leaf."

	para "To the dying"
	line "star."

	para "Our lives are"
	line "tiny wisps."

	para "Dwarfed by the"
	line "storming tempest"
	cont "of a DRAGON life."

	para "Your skin shall"
	line "wrinkle and your"
	cont "body decay."

	para "While the splendor"
	line "of the DRAGON"
	cont "goes untarnished."

	para "To be worthy to"
	line "yield such a"
	cont "divine power"
	cont "I must test you."

	para "Prepare for the"
	line "first question."
	prompt

DragonShrineQuestion1Text:
	text "Which of these"
	line "#mon is not a"
	cont "DRAGON?"
	done

DragonShrineQuestion2Text:
	text "What is the most"
	line "powerful DRAGON"
	cont "attack?"
	done

DragonShrineQuestion3Text:
	text "Which of these"
	line "DRAGONS has the"
	cont "greatest Attack?"
	done

DragonShrineQuestion4Text:
	text "Which of these"
	line "DRAGONS has the"
	cont "least weaknesses?"
	done

DragonShrineQuestion5Text:
	text "Which of these"
	line "DRAGONS has the"
	cont "most HP?"
	done

DragonShrinePassedTestText:
	text "You understand"
	line "the beauty and"
	cont "mystery of the"
	cont "DRAGON."

	para "You are more"
	line "worthy of the"
	cont "RISING BADGE"
	cont "than any trainer"
	cont "I have ever met."
	done

DragonShrineMustIInformLanceText:
	text "CLAIR!"

	para "Accept your"
	line "defeat with"
	cont "honour and"
	cont "confer the"
	cont "RISING BADGE"
	cont "immediately!"

	para "Or must I inform"
	line "LANCE of this."
	done

DragonShrineElderScoldsClairText:
	text "CLAIR…"

	para "Reflect upon what"
	line "it is that you"

	para "lack and this"
	line "trainer possesses."
	done

DragonShrineComeAgainText:
	text "The spirit of"
	line "the DRAGON will"
	cont "always blaze"
	cont "within you."
	done

DragonShrineTakeThisDratiniText:
	text "It is greatest"
	line "honor a human"
	cont "can have, to be"
	cont "the guiding force"
	cont "at the beginning"
	cont "of a DRAGONS"
	cont "eternal life."

	para "You are worth of"
	line "this gift. Please"
	cont "accept this"
	cont "young soul."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "DRATINI!"
	done

DragonShrinePartyFullText:
	text "Hm? Your #mon"
	line "party is full."
	done

DragonShrineSymbolicDragonText:
	text "Dragon #mon are"
	line "the most sacred"
	cont "of beings."

	para "The closest to"
	line "ARCEUS itself."

	para "It is said the"
	line "first #mon"
	cont "created were"
	cont "DRAGONS."

	para "You have shown"
	line "that you can be"

	para "entrusted with"
	line "one."
	done

DragonShrineClairsGrandfatherText:
	text "CLAIR is a"
	line "mighty trainer."

	para "But her ego and"
	line "arrogance sits"
	cont "just beneath the"
	cont "surface."

	para "I hope you have"
	line "demonstrated her"
	cont "folly to her."
	done

WrongAnswerText:
    text "I'm afraid that"
    line "is not correct."

    para "Let us start over."
    prompt

Question1CorrectText:
    text "Indeed CHARIZARD"
    line "is an abomination"
    cont "unworthy of the"
    cont "name of DRAGON."

    para "Now we move onto"
    line "question 2."
    prompt

Question2CorrectText:
    text "Yes, DRACO METEOR"
    line "is the strongest"
    cont "and purest DRAGON"
    cont "attack."

    para "Now we move onto"
    line "question 3."
    prompt

Question3CorrectText:
    text "Indeed SALAMENCE"
    line "has base ATTACK"
    cont "of 135."

    para "Now we move onto"
    line "question 4."
    prompt

Question4CorrectText:
    text "Yes, KINGDRA has"
    line "2 weaknesses to"
    cont "DRAGON and FAIRY."

    para "However it also"
    line "has only 2 resists"
    cont "in FIRE and WATER."

    para "Now we move onto"
    line "question 5."
    prompt

Question5CorrectText:
    text "Well done child."

    para "ZYGARDE has a"
    line "base HP of 216."

    para "Second only to"
    line "BLISSEY."
    prompt

DragonShrineElder2Text:
    text "The great DRAGON"
    line "LORD is wise and"
    cont "merciful."

    para "But there is an"
    line "even more ancient"
    cont "DRAGON that"
    cont "dwells within DARK"
    cont "CAVE."

    para "It seeks to bring"
    line "about chaos and"
    cont "damnation."

    para "The unholy one."

    para "GIRATINA."
	done

DragonShrineElder3Text:
	text "The most ancient"
	line "DRAGON LORD is"
	cont "lost to time."

	para "ZYGARDE."

	para "None know where"
	line "it resides."

	para "Even LANCE failed"
	line "to locate it."

	para "But you can be"
	line "sure the great"
	cont "ZYGARDE lives."
	done

DragonShrineClairYouPassedText:
	text "You can leave"
	line "now that you"
	cont "understand how"
	cont "unworthy you are."

	para "...."

	para "...."

	para "You passed!"
	done

DragonShrineClairThatCantBeText:
	text "That's impossible."
	done

DragonShrineClairYoureLyingText:
	text "You are lying."

	para "Even I haven't"
	line "passed this test!"
	done

DragonShrineIUnderstandText:
	text "I-I understand…"
	done

DragonShrineHereRisingBadgeText:
	text "Here, this is the"
	line "RISINGBADGE…"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

DragonShrineRisingBadgeExplanationText:
    text "The RISINGBADGE"
    line "lets you train"
    cont "#mon up to"
    cont "level 70."

    para "And capture"
    line "#mon up to"
    cont "level 60."

	para "It also enables"
	line "#mon to use"
	cont "WATERFALL outside"
	cont "of battle."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
