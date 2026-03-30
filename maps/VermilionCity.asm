	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M
	const VERMILIONCITY_SOLDIER_1
	const VERMILIONCITY_SOLDIER_2
	const VERMILIONCITY_SOLDIER_3
	const VERMILIONCITY_SOLDIER_4
	const VERMILIONCITY_YUNA
	const VERMILIONCITY_FIELDMON_1
	const VERMILIONCITY_FIELDMON_2
	const VERMILIONCITY_FIELDMON_3

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Invasion

.FlyPoint:
    setflag ENGINE_FLYPOINT_VERMILION
	endcallback

.Invasion:
    appear VERMILIONCITY_FIELDMON_1
    appear VERMILIONCITY_FIELDMON_2
    appear VERMILIONCITY_FIELDMON_3
	disappear VERMILIONCITY_SOLDIER_1
	disappear VERMILIONCITY_SOLDIER_2
	disappear VERMILIONCITY_SOLDIER_3
	disappear VERMILIONCITY_SOLDIER_4
	disappear VERMILIONCITY_YUNA
	checkevent EVENT_BEAT_YUNA_1
	iffalse .checkInvasion
	appear VERMILIONCITY_YUNA
.checkInvasion
	checkevent EVENT_BEAT_SOLDIER_9
	iftrue .end
	checkevent EVENT_HOEN_INVASION_UNDERWAY
	iffalse .end
	setval WEATHER_RAIN
	writemem wFieldWeather
	appear VERMILIONCITY_SOLDIER_1
	appear VERMILIONCITY_SOLDIER_2
	appear VERMILIONCITY_SOLDIER_3
	appear VERMILIONCITY_SOLDIER_4
.end
    endcallback

VermilionCityTeacherScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionCityTeacherText
.normal
    jumptextfaceplayer VermilionCityTeacherText


VermilionMachopOwner:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionMachopOwnerText
.normal
	jumptextfaceplayer VermilionMachopOwnerText

VermilionCitySuperNerdScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionCitySuperNerdText
.normal
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	writetext VermilionCitySnorlaxText
	cry SNORLAX
	pause 15
	closetext
	checkevent EVENT_BEAT_PRYCE
	iffalse .smallLevel
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SNORLAX, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SNORLAX, 70
    sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SNORLAX, 50
	sjump .begin
.smallLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SNORLAX, 40
	sjump .begin
.begin
	startbattle
	reloadmapafterbattle
    setval SNORLAX
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_FOUGHT_SNORLAX
	disappear VERMILIONCITY_BIG_SNORLAX
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_AMBROSIA_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem AMBROSIA
	iffalse .Done
	setevent EVENT_GOT_AMBROSIA_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "The old man over"
	line "there was seeking"
	cont "investment to"
	cont "build something."

	para "Whole thing turned"
	line "out to be a"
	cont "pyramid scheme"
	cont "and now he's back"
	cont "at it again."
	done

InvadedVermilionCityTeacherText:
	text "I hoped this day"
	line "would never come!"

	para "I hope they have"
	line "mercy on my"
	cont "children."
	done

VermilionMachopOwnerText:
	text "Ah hello young"
	line "traveler!"

	para "You know the best"
	line "time to invest is"
	cont "when you're"
	cont "young."

	para "Give me ¥100000"
	line "and I'll give"
	cont "back 10 times"
	cont "that in 10 years."
	done

InvadedVermilionMachopOwnerText:
	text "This is the third"
	line "war in my life."

	para "I have had a good"
	line "long life and made"
	cont "my money."

	para "It is people like"
	line "you I feel bad"
	cont "for."

	para "Your investments"
	line "will plummet."
	done

VermilionCitySuperNerdText:
	text "The trainers in"
	line "Vermilion Gym"
	cont "are a rock band"
	cont "known as"
	cont "The Solenoids!"

	para "They have some"
	line "sick rifts!"
	done

InvadedVermilionCitySuperNerdText:
    text "They have locked"
    line "the trainers in"
    cont "the Gym!"

	para "Just do as they"
	line "say and keep"
	cont "your head down."

	para "If we hold out"
	line "long enough"
	cont "Lance will save"
	cont "us."
	done

VermilionCitySnorlaxSleepingText:
	text "Snorlax is snoring"
	line "peacefully…"
	done

VermilionCitySnorlaxText:
	text "Snorlax woke up!"
	done

VermilionCityBadgeGuyTrainerText:
	text "With Kanto getting"
	line "ready for war the"
	cont "Gym Leaders are"
	cont "super strong."

	para "As strong as some"
	line "Champions!"

	para "If you can beat"
	line "them all come"
	cont "and let me know."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect Kanto Gym"
	cont "Badges?"

	para "It's tough isn't"
	line "it."

	para "You must exploit"
	line "their type"
	cont "weaknesses."
	done

VermilionCityBadgeGuyMostBadgesText:
	text "You've got lots"
	line "of Kanto Badges."

	para "But don't get too"
	cont "confident."

	para "Blue used to be"
	line "a Champion."

	para "He is on a whole"
	line "other level."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Congratulations!"

	para "You got all the"
	line "Kanto Gym Badges."

	para "You are a true"
	line "Champion!"

	para "I've got a reward"
	line "for your efforts."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "There are many"
	line "powerful"
	cont "#mon around"
	cont "Kanto."

	para "Looking around"
	line "might help you."
	done

VermilionCitySignText:
	text "Vermilion City"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "Vermilion City"
	line "#mon Gym"
	cont "Leader: LT.Surge"

	para "The Lightning"
	line "Soldier"
	done

PokemonFanClubSignText:
	text "#mon Fan Club"

	para "All #mon Fans"
	line "Welcome!"
	done

VermilionCityDiglettsCaveSignText:
	text "Diglett's Cave"
	done

VermilionCityPortSignText:
	text "Vermilion Port"
	line "Entrance"
	done
	
VermilionGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext VermilionGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_VermilionGymTurnBack
    end

VermilionGymBlockText:
    text "The door is"
    line "locked."

    para "This Gym is only"
    line "accepting Champion"
    cont "level challengers"
    cont "at this time."
    done

Movement_VermilionGymTurnBack:
	step DOWN
	step_end

VermilionHoenInvadedBlockScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iftrue .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext VermilionBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_VermilionGymTurnBack
    end

VermilionBlockText:
    text "The door is locked"
    done

VermilionPortHoenInvadedBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iftrue .block
    end
.block
    turnobject PLAYER, DOWN
	opentext
	writetext VermilionPortBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_VermilionPortTurnUp
    end

VermilionPortBlockText:
    text "The Port is closed"
    done

Movement_VermilionPortTurnUp:
    step UP
    step_end

TrainerSoldier6:
	trainer SOLDIER, SOLDIER_6, EVENT_BEAT_SOLDIER_6, Soldier6SeenText, Soldier6BeatenText, Soldier6WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	;endifjustbattled
	opentext
	writetext Soldier6AfterBattleText
	waitbutton
	closetext
	end
Soldier6SeenText:
	text "OK, this is what"
	line "I've trained for."
	para "Hmm hmmm."
	para "Stop you filthy"
	line "Kanto spawn of a"
	cont "Houndoom scum!"
	done
Soldier6BeatenText:
    text "Avenge me"
    line "comrade!"
    done
Soldier6WinsText:
	text "I did it!"
	para "I won!"
	done
Soldier6AfterBattleText:
	text "None of us want to"
	line "make Wallace"
	cont "angry."
	para "Just let us do"
	line "this."
	para "It's easier on"
	line "everyone."
	done

TrainerSoldier7:
	trainer SOLDIER, SOLDIER_7, EVENT_BEAT_SOLDIER_7, Soldier7SeenText, Soldier7BeatenText, Soldier7WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	;endifjustbattled
	opentext
	writetext Soldier7AfterBattleText
	waitbutton
	closetext
	end
Soldier7SeenText:
	text "Placing an"
	line "Electric Gym on"
	cont "the coast was an"
	cont "obvious move."
	para "Our captain has"
	line "trained to deal"
	cont "the Electric"
	cont "#mon."
	para "Your Gym Leader"
	line "can't help you!"
    done
Soldier7BeatenText:
    text "You can protect"
    line "yourself."

    para "But your friends"
    line "can't."
    done
Soldier7WinsText:
    text "Off to the box"
    line "with you."
    done
Soldier7AfterBattleText:
    text "We have taken"
    line "Vermilion with"
    cont "ease."

    para "Resistance is"
    line "futile."
    done

TrainerSoldier8:
	trainer SOLDIER, SOLDIER_8, EVENT_BEAT_SOLDIER_8, Soldier8SeenText, Soldier8BeatenText, Soldier8WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	;endifjustbattled
	opentext
	writetext Soldier8AfterBattleText
	waitbutton
	closetext
	end
Soldier8SeenText:
	text "This place is"
	line "locked down."
	para "We are just the"
	line "first wave."
	para "Saffron will soon"
	line "fall too."
	para "Don't try to stop"
	line "us."
	para "For your sake."
	done
Soldier8BeatenText:
    text "I done my job"
    line "well."
    done
Soldier8WinsText:
    text "Just go home."
    done
Soldier8AfterBattleText:
	text "Once Wallace joins"
	line "the battle..."
	para "Lives are going to"
	line "be lost."
	para "None of us can"
	line "stop that."
	done

HoenCaptain:
    faceplayer
	opentext
	checkevent EVENT_BEAT_SOLDIER_6
	iffalse .goAway
	checkevent EVENT_BEAT_SOLDIER_7
	iffalse .goAway
	checkevent EVENT_BEAT_SOLDIER_8
	iffalse .goAway
	writetext HoenCaptainSeenText
	waitbutton
	closetext
	winlosstext HoenCaptainBeatenText, HoenCaptainWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SOLDIER, SOLDIER_9
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SOLDIER_9
	opentext
	writetext HoenCaptainAfterBattleText
	waitbutton
	closetext
	disappear VERMILIONCITY_SOLDIER_1
	disappear VERMILIONCITY_SOLDIER_2
	disappear VERMILIONCITY_SOLDIER_3
	disappear VERMILIONCITY_SOLDIER_4
	reloadmap
	end
.goAway
    writetext GoAwayText
   	waitbutton
   	closetext
   	end

GoAwayText:
	text "Go back to your"
	line "home and hope our"
	cont "plans go"
	cont "unhindered."
	para "We have no"
	line "interest in heroes"
	cont "or hostages."
	done

HoenCaptainSeenText:
	text "You have"
	line "disrespected Hoenn"
	cont "for your first and"
	cont "last time!"
	para "I have been"
	line "tasked with"
	cont "containing the"
	cont "Electric Gym."
	para "Hoenn will"
	line "liberate all of"
	cont "Kanto!"
	done

HoenCaptainBeatenText:
    text "Forgive me"
    line "Emperor."
    done

HoenCaptainWinsText:
    text "Just another"
    line "name on a list."
    done

HoenCaptainAfterBattleText:
	text "Who are you!"
	para "Wait..."
	para "You are the new"
	line "Champion!"
	para "You have failed"
	line "Champion."
	para "I've accomplished"
	line "my mission."
	para "Wallace has made"
	line "it to Fuchsia."
	para "Kanto is doomed."
	para "Emperor Wallace"
	line "has our strongest"
	cont "squad with him."
	para "Three Captains and"
	line "Admiral Drake!"
	para "Drake has beaten"
	line "Champions much"
	cont "stronger than you."
	para "You should stay"
	line "away from Fuchsia"
	cont "if you value your"
	cont "life."
    done

YunaScriptVermilion:
    faceplayer
	opentext
	checkevent EVENT_HOEN_INVASION_UNDERWAY
	iftrue .invasion
	checkevent EVENT_BEAT_YUNA_2
	iftrue .FightDone
.fight
	writetext VermilionYunaSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_YUNA_2
	iftrue .dontAsk
	opentext
	writetext VermilionYunaOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext VermilionYunaBeatenText, VermilionYunaWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, YUNA_2
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_YUNA_2
	end
.FightDone:
	writetext VermilionYunaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextVermilionYuna
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextVermilionYuna
	waitbutton
	closetext
	end
.invasion
    writetext YunaInvasionText
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext Yuna2WinAfterBattleText
    waitbutton
    closetext
    end
Yuna2WinAfterBattleText:
    text "You have got"
    line "much stronger!"

    para "When the time"
    line "comes I know"
    cont "these people can"
    cont "count on you."
    done
YunaInvasionText:
    text "These people are"
    line "cruel and full"
    cont "of hate."

    para "I tried to fight"
    line "them but I was"
    cont "defeated by"
    cont "their captain."

    para "But they will be"
    line "no match for you."
    done
VermilionYunaSeenText:
    text "Hello again!"

    para "Thank you for"
    line "training with me"
    cont "in Olivine."

    para "I've become much"
    line "stronger."

    para "But not strong"
    line "enough to protect"
    cont "everyone."

    para "I'm sure you have"
    line "become stronger"
    cont "too."
    done
VermilionYunaBeatenText:
    text "Thank you"
    done
VermilionYunaWinsText:
    text "Thank you"
    done
VermilionYunaOfferFightText:
    text "Would you like"
    line "to train again?"
    done
VermilionYunaAfterBattleText:
    text "We have to find"
    line "little moments"
    cont "of joy in our"
    cont "lives."

    para "Things can change"
    line "at any time."

    para "But we can get"
    line "through anything"
    cont "together."
    done
RematchTextVermilionYuna:
    text "Would you like to"
    line "train again?"
    done
RematchRefuseTextVermilionYuna:
    text "Good luck."
    done

VermilionCityMon1Script:
	faceplayer
	cry ELECTABUZZ
	pause 15
	loadwildmon ELECTABUZZ, 24
	startbattle
	reloadmapafterbattle
	setevent EVENT_TEMP_EVENT_1
	disappear VERMILIONCITY_FIELDMON_1
	end

VermilionCityMon2Script:
	faceplayer
	cry MAGNEMITE
	pause 15
	loadwildmon MAGNEMITE, 21
	startbattle
	reloadmapafterbattle
	setevent EVENT_TEMP_EVENT_2
	disappear VERMILIONCITY_FIELDMON_2
	end

VermilionCityMon3Script:
	faceplayer
	cry SHELLDER
	pause 15
	loadwildmon SHELLDER, 18
	startbattle
	reloadmapafterbattle
	setevent EVENT_TEMP_EVENT_3
	disappear VERMILIONCITY_FIELDMON_3
	end

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events
	coord_event 10, 20, SCENE_ALWAYS, VermilionGymBlockScript
	coord_event 10, 20, SCENE_CUSTOM_1, VermilionHoenInvadedBlockScript
	coord_event 21, 18, SCENE_CUSTOM_1, VermilionHoenInvadedBlockScript
	coord_event  5,  6, SCENE_CUSTOM_1, VermilionHoenInvadedBlockScript
	coord_event 13, 14, SCENE_CUSTOM_1, VermilionHoenInvadedBlockScript
	coord_event  7, 14, SCENE_CUSTOM_1, VermilionHoenInvadedBlockScript
	coord_event 19, 30, SCENE_CUSTOM_1, VermilionPortHoenInvadedBlockScript


	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 14, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 16, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSoldier6, EVENT_FIELD_MON_1
	object_event 19, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSoldier7, EVENT_FIELD_MON_2
	object_event 17, 15, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSoldier8, EVENT_FIELD_MON_3
	object_event 10, 20, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HoenCaptain, EVENT_FIELD_MON_4
	object_event 25, 25, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YunaScriptVermilion, EVENT_FIELD_MON_5
	object_event 12, 21, SPRITE_ELECTABUZZ, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, VermilionCityMon1Script, EVENT_TEMP_EVENT_1
	object_event  6, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionCityMon2Script, EVENT_TEMP_EVENT_2
	object_event 20, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionCityMon3Script, EVENT_TEMP_EVENT_3
