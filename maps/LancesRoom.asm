	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_ELM
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	sdefer .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	
	
	appear LANCESROOM_ELM
	applymovement LANCESROOM_ELM, LancesRoomMovementData_ElmRushesIn
	opentext
	writetext LancesRoomElmText1
	waitbutton
	closetext
	turnobject LANCESROOM_ELM, DOWN
	opentext
	writetext LancesRoomElmIsntItOak
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_ELM, LANCESROOM_OAK
	applymovement LANCESROOM_ELM, LancesRoomMovementData_ElmYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LancesRoomOakCongratulationsText
	waitbutton
	closetext

	turnobject LANCESROOM_LANCE, DOWN
	opentext
	writetext LancesRoomLanceHappyText
	waitbutton
	closetext

	applymovement LANCESROOM_ELM, LancesRoomMovementData_ElmInterviewChampion
	turnobject PLAYER, LEFT
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LancesRoomElmText2
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_ELM, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_ELM, LancesRoomMovementData_ElmTriesToFollow
	;showemote EMOTE_SHOCK, LANCESROOM_ELM, 15
	opentext
	writetext LancesRoomElmWellDoneText
	pause 30
	closetext
	;applymovement LANCESROOM_ELM, LancesRoomMovementData_ElmRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_ElmRushesIn:
	big_step UP
	big_step UP
	big_step UP
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_ElmYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_ElmInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_ElmTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_ElmRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "Your arrival here"
	line "was inevitable"
	cont "<PLAYER>."
	
	para "You exemplify"
	line "the qualities of"
	cont "Champion."
	
	para "Will"
	
	para "Strength"
	
	para "Bravery"
	
	para "Humility"
	
	para "Alas fine though"
	line "they be, these"
	cont "are insufficient."
	
	para "There is a final,"
	line "less definable"
	cont "quality."
	
	para "You must possess"
	line "the heart of a"
	cont "Champion."
	
	para "I shall not yield"
	line "my expectations."
	
	para "If you befit the"
	line "mantle Champion."
	
	para "You must make your"
	line "claim decisively."
	
	para "Here and now!"
	done

LanceBattleWinText:
	text "It is done."
	
	para "I, Lance the"
	line "Dragon Champion."
	
	para "bestow upon"
	line "you <PLAYER>."
	
	para "The title of"
	line "Johto Champion!"
	done

LanceBattleAfterText:
	text "Many years have"
	line "passed since last"
	cont "I battled with"
	cont "such heart."
	
	para "It is my honor"
	line "to be the first"
	cont "to address you"
	cont "by your rightful"
	cont "title."
	
	para "Champion <PLAYER>."
	
	para "The first Champion"
	line "of Johto."
	
	para "The crown of"
	line "Champion is a"
	cont "heavy one."
	
	para "You alone shall"
	line "kindle the ember"
	cont "of hope within"
	cont "the population."
	
	para "Your singular"
	line "responsibility is"
	cont "to nurture and"
	cont "defend this flame."
	done

LancesRoomElmText1:
	text "<PLAYER>!"

	para "You did it!"

	para "I saw the battle,"
	line "it was terrifying!"

	para "I've never seen"
	line "two Champions"
	cont "battle before."

	para "I am amazed at"
	line "how strong you"
	cont "have become"
	cont "<PLAYER>."
	done

LancesRoomElmIsntItOak:
	text "Oak is equally"
	line "impressed!"
	done

LancesRoomOakCongratulationsText:
	text "Indeed I am."

	para "I had my doubts"
	line "I would ever see"
	cont "a trainer manage"
	cont "to overcome the"
	cont "full power of"
	cont "Champion Lance."

	para "But you did it"
	line "<PLAYER>."

	para "Watching you"
	line "battle it quickly"
	cont "became clear you"
	cont "are a true"
	cont "Champion."

	para "I haven't seen"
	line "one possess such"
	cont "natural talents"
	cont "since Red."

	para "Well Lance, it"
	line "seems you have"
	cont "lost your title"
	cont "as standing"
	cont "Champion of"
	cont "Johto."
	done

LancesRoomLanceHappyText:
    text "A title I am"
    line "most pleased to"
    cont "relinquish"
    cont "Professor."
    done

LancesRoomElmText2:
	text "I am so proud"
	line "of you <PLAYER>."

	para "I've known you"
	line "since you were a"
	cont "baby."

	para "I can't believe"
	line "what you have"
	cont "achieved."

	para "Your mother is"
	line "also very proud."

	para "And so is your"
	line "father."

	para "They are both"
	line "waiting for you"
	cont "back home."
	done

LancesRoomNoisyText:
	text "We are all"
	line "overwhelmed with"
	cont "immense pride."

	para "Now if you would"
	line "excuse us"
	cont "Professors."

	para "Only Champions are"
	line "permitted to enter"
	cont "the Hall of Fame."
	done

LancesRoomElmWellDoneText:
    text "Well done"
    line "<PLAYER>!"
    done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_ELM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
