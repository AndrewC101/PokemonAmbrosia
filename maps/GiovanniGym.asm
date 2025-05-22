	object_const_def

GiovanniGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymGiovanniScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .FightDone
	writetext GiovanniIntroText
	waitbutton
	closetext
	winlosstext GiovanniLossText, GiovanniWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer GIOVANNI, LEADER_GIOVANNI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GIOVANNI
	opentext
	writetext GiovanniFightDoneText
	waitbutton
	writetext GiovanniAfterBattleText
	waitbutton
	closetext
	end
.rematch
    writetext GiovanniIntroText
	waitbutton
	closetext
	winlosstext GiovanniLossText, GiovanniWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer GIOVANNI, LEADER_GIOVANNI
	startbattle
	reloadmapafterbattle
	end
.FightDone:
	writetext GiovanniAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextGiovanni
	yesorno
	iftrue .rematch
	writetext RematchRefuseTextGiovanni
	waitbutton
	closetext
	end

GiovanniIntroText:
    text "Welcome to the"
    line "true SAFFRON GYM."

    para "You don't need"
    line "special powers"
    cont "to be a strong"
    cont "trainer."

    para "True power comes"
    line "from understanding"
    cont "your #MON."

    para "Anyone can become"
    line "strong."

    para "I will help any"
    line "trainer reach"
    cont "their full"
    cont "potential."
    done

GiovanniLossText:
    text "You already"
    line "understand."
    done

GiovanniWinText:
    text "I hope you"
    line "learnt something."
    done

GiovanniFightDoneText:
    text "Well Done!"

    para "You have true"
    line "strength."

    para "I have no Badge"
    line "to give you."

	para "But I do have some"
	line "advice."
	done

GiovanniAfterBattleText:
	text "Life is not a"
	line "competition."

	para "Unlike life, a"
	line "competition is"
	cont "fair."

	para "Life is a"
	line "negotiation."

	para "Those who go the"
	line "furthest are not"
	cont "always the most"
	cont "talented."

	para "Rather it is those"
	line "who are best at"
	cont "inspiring others."
    done

RematchTextGiovanni:
    text "Is there more I"
    line "can teach you?"
    done

RematchRefuseTextGiovanni:
    text "I believe you"
    line "are right."
    done

TrainerLassEve:
	trainer LASS, EVEE, EVENT_BEAT_LASS_EVE, LassEveSeenText, LassEveBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext LassEveAfterBattleText
	waitbutton
	closetext
	end

LassEveSeenText:
    text "We accept all"
    line "challengers!"

    para "Our LEADER showed"
    line "us we don't need"
    cont "special powers."

    para "We are strongest"
    line "just being us."
    done

LassEveBeatenText:
    text "You are strong!"
    done

LassEveAfterBattleText:
    text "I never thought"
    line "I could become"
    cont "this strong."

    para "Our LEADER is a"
    line "great trainer"
    cont "and teacher."
    done

TrainerBeautyRachael:
	trainer BEAUTY, RACHAEL, EVENT_BEAT_BEAUTY_RACHAEL, BeautyRachaelSeenText, BeautyRachaelBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext BeautyRachaelAfterBattleText
	waitbutton
	closetext
	end

BeautyRachaelSeenText:
    text "The PSYCHIC GYM"
    line "next door breeds"
    cont "arrogance."

    para "They looked down"
    line "on people like us."

    para "Until the LEADER"
    line "took out the"
    cont "whole GYM by"
    cont "himself."
    done

BeautyRachaelBeatenText:
    text "I like you."
    done

BeautyRachaelAfterBattleText:
    text "The LEADER is"
    line "so strong and"
    cont "intense."

    para "I am proud to"
    line "belong to his GYM."
    done

TrainerBlackbeltJonny:
	trainer BLACKBELT_T, JONNY, EVENT_BEAT_BLACKBELT_JONNY, BlackbeltJonnySeenText, BlackbeltJonnyBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext BlackbeltJonnyAfterBattleText
	waitbutton
	closetext
	end

BlackbeltJonnySeenText:
    text "There used to be"
    line "a FIGHTING GYM"
    cont "here."

    para "Then the Psychics"
    line "came and took"
    cont "us over by force."
    done

BlackbeltJonnyBeatenText:
    text "That's the way!"
    done

BlackbeltJonnyAfterBattleText:
    text "The LEADER crushed"
    line "those Psychics."

    para "Now we will take"
    line "over!"

    para "That's how things"
    line "are done here in"
    cont "SAFFRON."
    done

TrainerPsychicJamie:
	trainer PSYCHIC_T, JAMIE, EVENT_BEAT_PSYCHIC_JAMIE, PsychicJamieSeenText, PsychicJamieBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext PsychicJamieAfterBattleText
	waitbutton
	closetext
	end

PsychicJamieSeenText:
    text "I used to be a"
    line "member of the GYM"
    cont "next door."

    para "I came here"
    line "arrogantly"
    cont "thinking I would"
    cont "defeat these"
    cont "weaklings."

    para "The LEADER"
    line "crushed me."
    done

PsychicJamieBeatenText:
    text "You understand"
    line "your #MON."
    done

PsychicJamieAfterBattleText:
    text "Just because you"
    line "can talk to your"
    cont "#MON doesn't"
    cont "mean you really"
    cont "understand them."

    para "The LEADER has"
    line "taught me to"
    cont "know my #MON."
    done

GiovanniGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  16, 17, SAFFRON_CITY, 1
	warp_event  17, 17, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassEve, -1
	object_event 12,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyRachael, -1
	object_event 11,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltJonny, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJamie, -1
	object_event  3,  1, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronGymGiovanniScript, -1
