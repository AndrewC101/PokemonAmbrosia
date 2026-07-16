	object_const_def

CherrygroveRuins_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .MewPuzzleCallback

.MewPuzzleCallback:
	checkevent EVENT_SOLVED_MEW_PUZZLE
	iftrue .check_knowledge_trial
	changeblock 36, 28, $00
	changeblock 36, 30, $00
.check_knowledge_trial
	checkevent EVENT_SOLVED_KNOWLEDGE_TRIAL
	iftrue .check_friendship_trial
	changeblock  4, 28, $00
	changeblock  4, 30, $00
.check_friendship_trial
	checkevent EVENT_SOLVED_FRIENDSHIP_TRIAL
	iftrue .done
	changeblock 20, 28, $00
	changeblock 20, 30, $00
.done
	endcallback

CherrygroveRuinsMewPuzzle:
	checkevent EVENT_SOLVED_MEW_PUZZLE
	iftrue .AskReplay
.StartPuzzle:
	reanchormap
	setval UNOWNPUZZLE_MEW
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.AskReplay:
	opentext
	writetext CherrygroveRuinsMewPuzzleReplayText
	yesorno
	closetext
	iftrue .StartPuzzle
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_MEW_PUZZLE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 36, 28, $3F
	changeblock 36, 30, $3F
	refreshmap
	playsound SFX_STRENGTH
	earthquake 50
	end

CherrygroveRuinsMewPuzzleReplayText:
	text "Try the puzzle"
	line "again?"
	done

CherrygroveRuinsTrialOfCreativityText:
	text "Trial Of"
	line "Creativity"
	done

CherrygroveRuinsTrialOfCreativityScript:
	jumptext CherrygroveRuinsTrialOfCreativityText

CherrygroveRuinsKnowledgeTrial:
	checkevent EVENT_SOLVED_KNOWLEDGE_TRIAL
	iftrue .AskReplay
.StartTrial:
	opentext
	writetext CherrygroveRuinsKnowledgeQuestion1Text
	promptbutton
	loadmenu CherrygroveRuinsKnowledgeQuestion1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 3, .WrongAnswer
	writetext CherrygroveRuinsKnowledgeQuestion1CorrectText
	writetext CherrygroveRuinsKnowledgeQuestion2Text
	promptbutton
	loadmenu CherrygroveRuinsKnowledgeQuestion2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .WrongAnswer
	writetext CherrygroveRuinsKnowledgeQuestion2CorrectText
	writetext CherrygroveRuinsKnowledgeQuestion3Text
	promptbutton
	loadmenu CherrygroveRuinsKnowledgeQuestion3MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 3, .WrongAnswer
	checkevent EVENT_SOLVED_KNOWLEDGE_TRIAL
	iftrue .PassedReplay
	writetext CherrygroveRuinsKnowledgeTrialCompleteText
	waitbutton
	closetext
	setevent EVENT_SOLVED_KNOWLEDGE_TRIAL
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock  4, 28, $3F
	changeblock  4, 30, $3F
	refreshmap
	playsound SFX_STRENGTH
	earthquake 50
	end

.AskReplay:
	opentext
	writetext CherrygroveRuinsKnowledgeTrialReplayText
	yesorno
	closetext
	iftrue .StartTrial
	end

.PassedReplay:
	writetext CherrygroveRuinsKnowledgeTrialCompleteText
	waitbutton
	closetext
	end

.WrongAnswer:
	writetext CherrygroveRuinsKnowledgeWrongText
	waitbutton
	closetext
	end

CherrygroveRuinsKnowledgeQuestion1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Belly Drum@"
	db "Shell Smash@"
	db "Geomancy@"

CherrygroveRuinsKnowledgeQuestion2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Gliscor@"
	db "Lucario@"
	db "Alakazam@"

CherrygroveRuinsKnowledgeQuestion3MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "3.14@"
	db "6.28@"
	db "9.42@"

CherrygroveRuinsKnowledgeQuestion1Text:
	text "Which move gives"
	line "the least overall"
	cont "stat"
	cont "modification?"
	done

CherrygroveRuinsKnowledgeQuestion1CorrectText:
	text "Correct."

	para "Question 2."
	prompt

CherrygroveRuinsKnowledgeQuestion2Text:
	text "Stealth Rock,"
	line "Spikes and"
	cont "Sandstorm are"
	cont "active."

	para "Which #mon"
	line "takes the least"
	cont "damage on a"
	cont "switch in?"
	done

CherrygroveRuinsKnowledgeQuestion2CorrectText:
	text "Correct."

	para "Question 3."
	prompt

CherrygroveRuinsKnowledgeQuestion3Text:
	text "Two Magnemite"
	line "stay 1 unit"
	cont "apart."

	para "One moves in a"
	line "circle around the"
	cont "other."

	para "How far does it"
	line "move?"
	done

CherrygroveRuinsKnowledgeTrialCompleteText:
	text "The trial is"
	line "complete."
	done

CherrygroveRuinsKnowledgeTrialReplayText:
	text "Try the trial"
	line "again?"
	done

CherrygroveRuinsKnowledgeWrongText:
	text "Incorrect."

	para "The trial ends."
	done

CherrygroveRuinsTrialOfKnowledgeText:
	text "Trial Of"
	line "Knowledge"
	done

CherrygroveRuinsTrialOfKnowledgeScript:
	jumptext CherrygroveRuinsTrialOfKnowledgeText

CherrygroveRuinsFriendshipTrial:
	opentext
	readvar VAR_DEXCAUGHT
	getnum STRING_BUFFER_3
	writetext CherrygroveRuinsFriendshipTrialText
	waitbutton
	readvar VAR_DEXCAUGHT
	ifgreater 79, .Passed
	closetext
	end

.Passed:
	checkevent EVENT_SOLVED_FRIENDSHIP_TRIAL
	iftrue .AlreadyPassed
	writetext CherrygroveRuinsFriendshipTrialCompleteText
	waitbutton
	closetext
	setevent EVENT_SOLVED_FRIENDSHIP_TRIAL
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 20, 28, $3F
	changeblock 20, 30, $3F
	refreshmap
	playsound SFX_STRENGTH
	earthquake 50
	end

.AlreadyPassed:
	closetext
	end

CherrygroveRuinsFriendshipTrialText:
	text "Prove your"
	line "kinship by"
	cont "befriending 80"
	cont "different species"
	cont "of #mon."

	para "You have"
	line "befriended @"
	text_ram wStringBuffer3
	text "."
	done

CherrygroveRuinsFriendshipTrialCompleteText:
	text "The trial is"
	line "complete."
	done

CherrygroveRuinsTrialOfFriendshipText:
	text "Trial Of"
	line "Friendship"
	done

CherrygroveRuinsTrialOfFriendshipScript:
	jumptext CherrygroveRuinsTrialOfFriendshipText

CherrygroveRuins_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 39, CHERRYGROVE_BAY, 1
	warp_event  5, 39, CHERRYGROVE_BAY, 1
	warp_event 20, 39, CHERRYGROVE_BAY, 2
	warp_event 21, 39, CHERRYGROVE_BAY, 2
	warp_event 36, 39, CHERRYGROVE_BAY, 3
	warp_event 37, 39, CHERRYGROVE_BAY, 3
	warp_event 20, 17, CHERRYGROVE_BAY, 4
	warp_event 21, 17, CHERRYGROVE_BAY, 4

	def_coord_events

	def_bg_events
	bg_event 36, 34, BGEVENT_UP, CherrygroveRuinsMewPuzzle
	bg_event 37, 34, BGEVENT_UP, CherrygroveRuinsMewPuzzle
	bg_event 35, 35, BGEVENT_READ, CherrygroveRuinsTrialOfCreativityScript
	bg_event 38, 35, BGEVENT_READ, CherrygroveRuinsTrialOfCreativityScript
	bg_event  4, 34, BGEVENT_UP, CherrygroveRuinsKnowledgeTrial
	bg_event  5, 34, BGEVENT_UP, CherrygroveRuinsKnowledgeTrial
	bg_event  3, 35, BGEVENT_READ, CherrygroveRuinsTrialOfKnowledgeScript
	bg_event  6, 35, BGEVENT_READ, CherrygroveRuinsTrialOfKnowledgeScript
	bg_event 20, 34, BGEVENT_UP, CherrygroveRuinsFriendshipTrial
	bg_event 21, 34, BGEVENT_UP, CherrygroveRuinsFriendshipTrial
	bg_event 19, 35, BGEVENT_READ, CherrygroveRuinsTrialOfFriendshipScript
	bg_event 22, 35, BGEVENT_READ, CherrygroveRuinsTrialOfFriendshipScript

	def_object_events
