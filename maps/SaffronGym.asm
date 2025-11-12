	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaLossText, SabrinaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WILL
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end
.rematch
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaLossText, SabrinaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextSabrina
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextSabrina
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "I am Will."

	para "I was an"
	line "archaeologist for"
	cont "many years."

	para "I traveled the"
	line "world visiting"
	cont "ruins and all the"
	cont "while my PSYCHIC"
	cont "#mon were"
	cont "growing powerful."

	para "Prof Oak suggested"
	line "me for this post"
	cont "after Sabrina"
	cont "left."

	para "I've never been"
	line "one for battling."

	para "But I accepted."

	para "Champion <PLAYER>."

	para "As SAFFRON CITY"
	line "Gym Leader I do"
	cont "hereby accept your"
	cont "challenge."
	done

SabrinaLossText:
	text "Well done!"

	para "I confer the"
	line "MARSHBADGE."
	done

SabrinaWinText:
	text "You did well."

	para "Keep on training."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> received"
	line "MARSHBADGE."
	done

SabrinaMarshBadgeText:
	text "The MARSHBADGE"
	line "signifies your"
	cont "indomitable soul."

	para "Few throughout"
	line "history have"
	cont "attained your"
	cont "strength."
	done

SabrinaFightDoneText:
	text "It's been a tough"
	line "first few months."

	para "Second day and the"
	line "other Gym opened"
	cont "next door."

	para "The Leader"
	line "challenged me"
	cont "to a battle."

	para "I've never been"
	line "much of a fighter."

	para "He has clearly"
	line "been fighting for"
	cont "decades."

	para "But I will not"
	line "be discouraged!"
	done

MediumRebeccaSeenText:
	text "Sabrina would"
	line "never have allowed"
	cont "that lesser Gym"
	cont "to dishonor us"
	cont "like this!"

	para "I hope she comes"
	line "back to crush"
	cont "them!"
	done

MediumRebeccaBeatenText:
	text "Maybe you can"
	line "crush them."
	done

MediumRebeccaAfterBattleText:
	text "Will is not"
	line "strong enough."

	para "I will have to"
	line "take matters into"
	cont "my own hands."
	done

PsychicFranklinSeenText:
	text "How typical of"
	line "League to hire"
	cont "from outside"
	cont "rather than"
	cont "promote one of"
	cont "us trainers."

	para "Will does not"
	line "understand the"
	cont "superiority of"
	cont "PSYCHIC types."
	done

PsychicFranklinBeatenText:
	text "You should be"
	line "Gym Leader."
	done

PsychicFranklinAfterBattleText:
	text "I'm going to"
	line "formally complain"
	cont "and request a"
	cont "promotion!"
	done

MediumDorisSeenText:
	text "When the other Gym"
	line "first arrived the"
	cont "Gym Leader"
	cont "challenged us."

	para "He made quick"
	line "work of us all"
	cont "with disgusting"
	cont "brute force."

	para "But we did the"
	line "same to the old"
	cont "fighting dojo."

	para "Good times."
	done

MediumDorisBeatenText:
	text "You would do well"
	line "next door."
	done

MediumDorisAfterBattleText:
	text "Karma is a funny"
	line "thing."

	para "We had this"
	line "coming."
	done

PsychicJaredSeenText:
	text "I've heard that"
	line "the other Gym"
	cont "pays twice as much"
	cont "to Gym trainers as"
	cont "we get."

	para "No wonder it is"
	line "growing so fast."

	para "The Leader must"
	line "be rich."
	done

PsychicJaredBeatenText:
	text "I don't get"
	line "payed enough for"
	cont "this!"
	done

PsychicJaredAfterBattleText:
	text "I'm really"
	line "rethinking my"
	cont "life choices."
	done

SaffronGymGuideText:
	text "These poor"
	line "psychics have"
	cont "been beaten down"
	cont "by the other Gym."

	para "The Gym Leader"
	line "here is new and"
	cont "apparently isn't"
	cont "much of a fighter."
	done

SaffronGymGuideWinText:
	text "That wasn't so"
	line "tough."

	para "Sabrina must be"
	line "upset by this."
	done

RematchTextSabrina:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextSabrina:
    text "Maybe next time."
    done

SaffronGymEspeonScript:
    opentext
    writetext EspeonText
    cry ESPEON
    waitbutton
    closetext
    end

EspeonText:
    text "Espeon!"
    done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 3
	warp_event  9, 17, SAFFRON_CITY, 3
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
	object_event 10,  8, SPRITE_ESPEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymEspeonScript, -1
