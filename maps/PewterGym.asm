	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockLossText, BrockWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockFightDoneText
	waitbutton
	closetext
	end
.rematch
    writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockLossText, BrockWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextBrock
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextBrock
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "Welcome to"
	line "PEWTER CITY."

	para "I'm sure you"
	line "have noticed the"
	cont "state the city"
	cont "is in."

	para "The state the"
	line "people are in."

	para "I lost my Dad"
	line "and my home in"
	cont "the incident."

	para "I have not shed"
	line "one tear."

	para "I must not, I"
	line "can not let the"
	cont "people see me in"
	cont "such a state."

    para "These people need"
    line "a strong, stable"
    cont "and constant"
    cont "presence in their"
    cont "live."

    para "I am their rock."
	done

BrockLossText:
	text "You don't"
	line "shatter easily."

	para "Here, take the"
	line "BOULDERBADGE."
	done

BrockWinText:
    text "Together we"
    line "can become"
    cont "stronger."
    done

ReceivedBoulderBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

BrockFightDoneText:
	text "BLUE sealed off"
	line "the MUSEUM years"
	cont "ago."

	para "Since you have"
	line "defeated me"
	cont "I grant you"
	cont "permission to"
	cont "enter it."

	para "You are the first"
	line "to be given this."

	para "BLUE has been a"
	line "huge help to me."

	para "I could not have"
	line "protected this"
	cont "city without him."
	done

CamperJerrySeenText:
	text "BROCK is the"
	line "strongest person"
	cont "I know."

	para "Not just as a"
	line "trainer but as"
	cont "a leader."

	para "I hope to be"
	line "half the man he"
	cont "is one day."
	done

CamperJerryBeatenText:
	text "I have a long"
	line "way to go."
	done

CamperJerryAfterBattleText:
	text "We will never"
	line "stop fighting"
	cont "to restore PEWTER"
	cont "and its people."

	para "To make both"
	line "whole again."
	done

PewterGymGuideText:
	text "This is such a"
	line "sad place."

	para "I want to help"
	line "these people"
	cont "but I can't."

	para "You can!"

	para "But you have to"
	line "beat BROCK."

	para "He uses a"
	line "SANDSTORM team."

	para "Changing the"
	line "weather to rain"
	cont "and throwing WATER"
	cont "attacks at him"
	cont "should soften"
	cont "him up."
	done

PewterGymGuideWinText:
	text "You did it!"

	para "Now you can enter"
	line "the MUSEUM and"
	cont "find the source"
	cont "of the virus."

	para "If you're crazy"
	line "that is!"
	done

RematchTextBrock:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextBrock:
    text "Maybe next time."
    done

PewterGymTyranitarScript:
    opentext
    writetext TyranitarText
    waitbutton
    closetext
    end

TyranitarText:
    text "Tyranitar!"
    done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
	object_event  6,  1, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, PewterGymTyranitarScript, -1
