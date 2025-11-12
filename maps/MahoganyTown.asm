	object_const_def
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_SELF

MahoganyTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Self

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

.Self
    disappear MAHOGANYTOWN_SELF
    endcallback

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd PokecenterSignScript

MahoganyTownGrampsText:
	text "The GYARADOS at"
	line "the lake have all"
	cont "become violent."

	para "Well..."

	para "More than usual."

	para "And lots of odd"
	line "characters have"
	cont "been coming and"
	cont "going from the"
	cont "mart."

	para "These are related"
	line "I reckon."
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "The GYARADOS at"
	line "the lake have all"
	cont "settled down."

	para "Well..."

	para "Relatively"
	line "speaking."

	para "All is well in"
	line "this quiet little"
	cont "mountain town."
	done

MahoganyTownFisherText:
	text "The Gym is closed"
	line "right now."

	para "There is some"
	line "strange looking"
	cont "#mon at the"
	cont "LAKE OF RAGE."
	cont "Everyone is"
	cont "investigating."
	done

MahoganyTownLassText:
	text "Thank you so"
	line "much for getting"
	cont "rid of those"
	cont "awful ROCKETS."

	para "Now grandmas shop"
	line "has a massive"
	cont "basement."

	para "If only we could"
	line "get rid of the"
	cont "aggressive"
	cont "#mon we could"
	cont "rent it out and"
	cont "make a fortune."
	done

MahoganyTownSignText:
	text "MAHOGANY TOWN"

	para "The Town of Icy"
	line "tranquility."
	done

MahoganyGymSignText:
	text "MAHOGANY TOWN"
	line "#mon Gym"
	cont "Leader: PRYCE"

	para "The Teacher of"
	line "Winter's Harshness"
	done
	
MahoganyTownSelfScript:
    playmusic MUSIC_RUINS_OF_ALPH_RADIO
    pause 20
    appear MAHOGANYTOWN_SELF
    pause 5
    turnobject PLAYER, RIGHT
    opentext
    writetext MahoganySelfText1
    waitbutton
    closetext
    disappear MAHOGANYTOWN_SELF
    moveobject MAHOGANYTOWN_SELF, 9, 6
    appear MAHOGANYTOWN_SELF
    pause 5
    turnobject PLAYER, LEFT
    opentext
    writetext MahoganySelfText2
    waitbutton
    closetext
    disappear MAHOGANYTOWN_SELF
    moveobject MAHOGANYTOWN_SELF, 9, 9
    appear MAHOGANYTOWN_SELF
    turnobject MAHOGANYTOWN_SELF, UP
    pause 5
    turnobject PLAYER, DOWN
    opentext
    writetext MahoganySelfText3
    waitbutton
    closetext
    disappear MAHOGANYTOWN_SELF
    moveobject MAHOGANYTOWN_SELF, 10, 8
    appear MAHOGANYTOWN_SELF
    pause 5
    turnobject MAHOGANYTOWN_SELF, RIGHT
    turnobject PLAYER, LEFT
    opentext
    writetext MahoganySelfText4
    waitbutton
    closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
    winlosstext MahoganySelfVictoryText, MahoganySelfLossText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer CAL, CAL1
	startbattle
	ifequal LOSE, .lose
	sjump .over
.Female
    winlosstext MahoganySelfVictoryText, MahoganySelfLossText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer CAL_F, CAL_F1
	startbattle
	ifequal LOSE, .lose
.over
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RUINS_OF_ALPH_RADIO
	setevent EVENT_BEAT_MAHOGANY_SELF
	setmapscene MAHOGANY_TOWN, SCENE_FINISHED
	opentext
	writetext MahoganySelfText5
	waitbutton
	closetext
	disappear MAHOGANYTOWN_SELF
	playmusic MUSIC_CHERRYGROVE_CITY
	special HealParty
	end
.lose
    dontrestartmapmusic
    reloadmap
    playmusic MUSIC_RUINS_OF_ALPH_RADIO
	opentext
	writetext MahoganySelfText6
	waitbutton
	closetext
	applymovement PLAYER, MahoganyMovement_PlayerDown
	pause 5
	disappear MAHOGANYTOWN_SELF
	playmusic MUSIC_CHERRYGROVE_CITY
	special HealParty
	end

MahoganyMovement_PlayerDown:
    slow_step DOWN
    step_end

MahoganySelfText1:
    text "You can't fight"
    line "TEAM ROCKET."

    para "If you do..."
    done

MahoganySelfText2:
    text "They won't be"
    line "merciful."
    done

MahoganySelfText3:
    text "You won't find"
    line "your Dad."

    para "We both know"
    line "he is already"
    cont "dead."
    done

MahoganySelfText4:
    text "Even if he"
    line "wasn't..."

    para "He would lose"
    line "you."

    para "That's why he"
    line "left without"
    cont "you."
    done

MahoganySelfText5:
    text "You know what"
    line "I said was true."

    para "I know it hurts."

    para "Only you can"
    line "make the pain"
    cont "stop."

    para "Go home."
    done

MahoganySelfText6:
    text "I only do this"
    line "because I care"
    cont "about you."

    para "Now go back"
    line "home where you"
    cont "will be safe."
    done

MahoganySelfLossText:
    text "Put these foolish"
    line "ambitions to"
    cont "rest."
    done

MahoganySelfVictoryText:
    text "This proves"
    line "nothing."
    done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
    coord_event 11, 8, SCENE_CUSTOM_1, MahoganyTownSelfScript


	def_bg_events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	def_object_events
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
	object_event 14,  9, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
