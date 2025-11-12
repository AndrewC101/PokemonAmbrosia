	object_const_def
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2
	const SAFFRONCITY_SILVER
	const SAFFRONCITY_FIELDMON_1

SaffronCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Silver

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

.Silver:
    appear SAFFRONCITY_FIELDMON_1
    random 2
    ifequal 1, .keepSpawn
    disappear SAFFRONCITY_FIELDMON_1
.keepSpawn
    disappear SAFFRONCITY_SILVER
    endcallback

SaffronCityLass1Script:
    jumptextfaceplayer SaffronCityLass1Text

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .BeatWallace
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.BeatWallace:
	writetext SaffronCityPokefanMText_BeatWallace
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .BeatWallace
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.BeatWallace:
	writetext SaffronCityFisherText_BeatWallace
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	faceplayer
	opentext
	writetext PartakeText
	yesorno
	iffalse .no
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end
.no
    writetext PartakeRefuseText
    waitbutton
    closetext
    end

PartakeText:
	text "You look like a"
	line "person of refined"
	cont "tastes."
	para "I'm in the market"
	line "for a"
	cont "particular..."
	para "Exchange."
	para "Would you be"
	line "willing to..."
	para "Partake?"
	done

PartakeRefuseText:
	text "If you get bored"
	line "you know where to"
	cont "come."
	done

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript

SaffronCityLass1Text:
	text "Get out of my"
	line "way!"

	para "I have another"
	line "client call to"
	cont "get to at the"
	cont "SILPH building!"

	para "The SILPH SCOPE"
	line "is really taking"
	cont "off in LAVENDER."
	done

SaffronCityPokefanMText:
	text "Everybody here"
	line "knows that when"
	cont "Hoenn invades they"
	cont "will be cutting a"
	cont "path straight to"
	cont "SAFFRON!"

	para "If SAFFRON falls"
	line "Kanto is done for!"
	done

SaffronCityPokefanMText_BeatWallace:
	text "You..."

	para "You are the"
	line "Champion that"
	cont "defeated WALLACE!"

	para "You have saved us"
	line "all!"

	para "You have saved my"
	line "investments!"

	para "Listen if you ever"
	line "want to get into"
	cont "the real estate"
	cont "market you come"
	cont "straight to me!"
	done

SaffronCityCooltrainerMText:
	text "I was going to"
	line "challenge the Gym"
	cont "but they are only"
	cont "accepting Champion"
	cont "level challengers."
	
	para "What use is that!"
	
	para "But the other Gym"
	line "accepts anyone."

	para "The Leader even"
	line "spoke to me and"
	cont "helped me out."

	para "He told me the"
	line "ultimate skill in"
	cont "life is to learn"
	cont "how to disagree"
	cont "without being"
	cont "disagreeable."
	
	para "I hope this new"
	line "Gym becomes the"
	cont "official one."
	done

SaffronCityCooltrainerFText:
	text "This is SILPH CO."
	
	para "They make cutting"
	line "edge tech."
	
	para "They are the"
	line "largest employer"
	cont "in Kanto."
	
	para "This is reflected"
	line "in their building."
	
	para "The tallest in"
	line "Kanto."
	done

SaffronCityFisherText:
	text "Last time Hoenn"
	line "invaded they made"
	cont "it to SAFFRON."
	
	para "I was a kid."
	
	para "I will never"
	line "forget the horror."
	
	para "I need to get"
	line "out of here."
	
	para "Is Johto nice?"
	done

SaffronCityFisherText_BeatWallace:
	text "You are..."
	
	para "Champion <PLAYER>!"
	
	para "You saved us all!"
	
	para "Last time Hoenn"
	line "invaded it was"
	cont "LANCE saving us."
	
	para "He was young then."
	
	para "I remember the sky"
	line "igniting and a"
	cont "storm of DRAGONS"
	cont "taking out the"
	cont "Hoenn forces."
	
	para "But I hear you"
	line "were even more"
	cont "impressive!"
	done

SaffronCityYoungster2Text:
	text "Oh another Johto"
	line "immigrant."

	para "This is SAFFRON!"

	para "The economic hub"
	line "of Kanto."

	para "SAFFRON alone"
	line "contributes 63"
	cont "percent of the"
	cont "Kanto GDP."

	para "I pay more in"
	line "taxes than the"
	cont "average Johto"
	cont "employee salary."
	done

SaffronCityLass2Text:
	text "TEAM ROCKET used"
	line "to operate in"
	cont "this city."
	
	para "We are told they"
	line "are gone but we"
	cont "all know that isn't"
	cont "true."
	
	para "In fact."
	
	para "I support them!"
	
	para "They fight for"
	line "Kanto!"
	
	para "At least they take"
	line "action unlike the"
	cont "#mon LEAGUE."
	done

SaffronCitySignText:
	text "SAFFRON CITY"

	para "THE GOLDEN CITY."
	
	para "THE BIG #ball."
	done

SaffronGymSignText:
	text "SAFFRON CITY"
	line "#mon Gym"
	cont "Leader: WILL"

	para "New to the job."
	done

FightingDojoSignText:
	text "Everyone Welcome!"
	line "The true"
	cont "SAFFRON Gym!"
	done

SilphCoSignText:
	text "SILPH CO."
	line "OFFICE BUILDING"
	done

MrPsychicsHouseSignText:
	text "MR.PSYCHIC'S"
	line "HOUSE"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRON CITY"
	line "MAGNET TRAIN"
	cont "STATION"
	done

SaffronGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    checkevent EVENT_BEAT_RIVAL_SAFFRON
    iffalse .SaffronSilverScript
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext SaffronGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SaffronGymTurnBack
    end
.SaffronSilverScript
    showemote EMOTE_SHOCK, PLAYER, 15
    turnobject PLAYER, LEFT
    playmusic MUSIC_RIVAL_ENCOUNTER
    appear SAFFRONCITY_SILVER
    applymovement SAFFRONCITY_SILVER, SaffronMovement_SilverApproaches
    opentext
    writetext SaffronSilverText
    waitbutton
    closetext
    special FadeOutMusic
    turnobject SAFFRONCITY_SILVER, DOWN
    pause 20
    opentext
    writetext SaffronSilverPokemonFreedText
    waitbutton
    closetext
    pause 20
    turnobject SAFFRONCITY_SILVER, RIGHT
    opentext
    writetext SaffronSilverRespectText
    waitbutton
    closetext
    winlosstext Silver6LosesText, Silver6WinsText
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL2, RIVAL2_SAFFRON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RIVAL_SAFFRON
    opentext
    writetext SaffronSilverAfterBattleText
    waitbutton
    closetext
    applymovement SAFFRONCITY_SILVER, SaffronMovement_SilverLeaves
    disappear SAFFRONCITY_SILVER
    end

SaffronMovement_SilverApproaches:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

SaffronMovement_SilverLeaves:
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step_end

SaffronSilverText:
    text "I thought I"
    line "might run into"
    cont "you here."

    para "So you are going"
    line "to challenge the"
    cont "Kanto Gyms too."

    para "I hope you don't"
    line "expect me to"
    cont "refer to you as"
    cont "Champion."

    para "Look...."

    para "I'm sorry for my"
    line "attitude."
    done

SaffronSilverPokemonFreedText:
    text "I was wrong to"
    line "steal #mon."

    para "I gave all my"
    line "#mon the choice"
    cont "to stay with me.."

    para "They didn't all"
    line "accept..."

    para "I feel weaker"
    line "now than I ever"
    cont "have."
    done

SaffronSilverRespectText:
    text "I must earn the"
    line "respect of my"
    cont "friends who have"
    cont "stayed with me."

    para "Help me do that."
    done

Silver6LosesText:
    text "You are the"
    line "strongest."

    para "Thank you for"
    line "helping me."
    done

Silver6WinsText:
    text "Looks like I"
    line "still got it!"

    para "Thank you for"
    line "helping me."
    done

SaffronSilverAfterBattleText:
    text "I'm here looking"
    line "for my father."

    para "I think he is"
    line "in this city"
    cont "somewhere."

    para "I'm sure it won't"
    line "be difficult to"
    cont "find him."

    para "He was never good"
    line "at being"
    cont "inconspicuous."

    para "You keep getting"
    line "stronger."

    para "All these people"
    line "will need you"
    cont "soon enough."
    done

HoenInvadedBlockScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iftrue .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext TrainBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SaffronGymTurnBack
    end

TrainBlockText:
    text "The train is"
    line "off line."
    done

SaffronGymBlockText:
    text "The door is"
    line "locked."

    para "This Gym is only"
    line "accepting Champion"
    cont "level challengers"
    cont "at this time."
    done

Movement_SaffronGymTurnBack:
	step DOWN
	step_end

SaffronMon1Script:
	faceplayer
	cry BELDUM
	pause 15
	loadwildmon BELDUM, 21
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SAFFRONCITY_FIELDMON_1
	end

DarkCityMurdochScript:
    jumptextfaceplayer murdochText

murdochText:
	text "They have changed"
	line "things again!"
	para "We aren't meant to"
	line "stay awake but I"
	cont "do."
	para "I've been awake"
	line "for hours, it's"
	cont "always night here."
	para "Do you know the"
	line "way to OLIVINE"
	cont "beach?"
	para "Nobody remembers"
	line "that!"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 26,  3, GIOVANNI_GYM, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	def_coord_events
	coord_event 34, 4, SCENE_ALWAYS, SaffronGymBlockScript
	coord_event  8, 4, SCENE_ALWAYS, HoenInvadedBlockScript

	def_bg_events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
	object_event 29,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event 24, 19, SPRITE_BELDUM, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronMon1Script, EVENT_FIELD_MON_1
	object_event  5, 30, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DarkCityMurdochScript, -1
