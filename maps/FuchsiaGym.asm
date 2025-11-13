	object_const_def
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUIDE

FuchsiaGym_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaGymJanineScript:
	faceplayer
	opentext
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	faceplayer
	opentext
	writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
.FightDone:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegiveitem TM_TOXIC
	setevent EVENT_GOT_TM06_TOXIC
	writetext JanineText_ApplyMyself
	waitbutton
    closetext
    end
.AfterTM:
	writetext JanineText_ApplyMyself
	waitbutton
    closetext
	opentext
	writetext RematchTextJanine
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextJanine
	waitbutton
	closetext
	end
.rematch
    writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	end

LassAliceScript:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special LoadUsedSpritesGFX
.AliceUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceAfterScript
	writetext LassAliceBeforeText
	waitbutton
	closetext
	winlosstext LassAliceBeatenText, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue .AliceBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

.AliceBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

.AliceAfterScript:
	writetext LassAliceAfterText
	waitbutton
	closetext
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special LoadUsedSpritesGFX
.LindaUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaAfterScript
	writetext LassLindaBeforeText
	waitbutton
	closetext
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

.LindaAfterScript:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	special LoadUsedSpritesGFX
.CindyUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyAfterScript
	writetext PicnickerCindyBeforeText
	waitbutton
	closetext
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

.CindyAfterScript:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
.BarryUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryAfterScript
	writetext CamperBarryBeforeText
	waitbutton
	closetext
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

.BarryAfterScript:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

FuchsiaGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuideWinScript
	writetext FuchsiaGymGuideText
	waitbutton
	closetext
	end

.FuchsiaGymGuideWinScript:
	writetext FuchsiaGymGuideWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JANINE, JANINE1
	jumpstd GymStatue2Script

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

JanineText_DisappointYou:
	text "Well done!"

	para "You found me!"

	para "After Dad was"
	line "murdered I took"
	cont "over the Gym."

	para "I train everyday"
	line "in honor of his"
	cont "memory."

	para "I will make him"
	line "proud."

	para "He will be"
	line "avenged!"
	done

JanineText_ToughOne:
	text "You are tough."

	para "Our battle helped"
	line "me get stronger."

	para "Here's Soulbadge."
	line "Take it."
	done

Text_ReceivedSoulBadge:
	text "<PLAYER> received"
	line "Soulbadge."
	done

JanineText_ToxicSpeech:
	text "You are tough."

	para "But even the most"
	line "tough people can"
	cont "worn down slowly."

	para "Taken apart piece"
	line "by piece."

	para "That's what life"
	line "does to you."

	para "This move runs in"
	line "my family."

	para "It represents the"
	line "the slow never"
	cont "ending assault of"
	cont "life."
	done

JanineText_ApplyMyself:
	text "I keep going"
	line "through the pain."

	para "I am young and I"
	line "am small but I"
	cont "am tough."

	para "Dad did not lose"
	line "his life for no"
	cont "reason."

	para "I will give his"
	line "sacrifice meaning."

	para "But I'll never"
	line "stop missing him."
	done

LassAliceBeforeText:
	text "Fufufu!"

	para "I'm Janine, the"
	line "Gym Leader!"

	para "No, I'm not!"
	line "Gotcha, sucker!"
	done

LassAliceBeatenText:
	text "I had you fooled."
	done

LassAliceAfterText:
	text "How will you dis-"
	line "tinguish our real"
	cont "Leader?"

	para "You can't."

	para "Our disguise is"
	line "perfect."
	done

LassLindaBeforeText:
	text "My trap card!"

	para "You activated it."
	done

LassLindaBeatenText:
	text "Wrong anime!"
	done

LassLindaAfterText:
	text "You play your"
	line "cards well."

	para "We all play with"
	line "the cards we are"
	cont "dealt."
	done

PicnickerCindyBeforeText:
	text "Yep well done."

	para "I'm the real Gym"
	line "Leader."

	para "Really!"

	para "Beat me and get"
	line "a Badge."
	done

PicnickerCindyBeatenText:
	text "Just kidding!"
	done

PicnickerCindyAfterText:
	text "I'm not the real"
	line "Gym Leader."

	para "I'm nowhere near"
	line "as strong as"
	cont "Janine!"
	done

CamperBarryBeforeText:
	text "Hoha!"

	para "Yes I'm a man!"

	para "Did my teen girl"
	line "disguise fool you?"

	para "Hahaha..."

	para "It always does."
	done

CamperBarryBeatenText:
	text "I tore my dress!"
	done

CamperBarryAfterText:
	text "Now be honest."

	para "You thought I"
	line "was quite pretty"
	cont "didn't you..."

	para "Aw I see you"
	line "blushing!"
	done

FuchsiaGymGuideText:
	text "This Gym is full"
	line "of people dressed"
	cont "as Janine the"
	cont "Leader."

	para "You will just"
	line "have to fight"
	cont "them all!"

	para "This gym has no"
	line "single type but"
	cont "seems to favor"
	cont "Poison."

	para "Poison isn't a"
	line "very good type."

	para "A strong Psychic"
	line "Type should make"
	cont "easy work of this."

	para "But what do I"
	line "know."

	para "I'm not a trainer."
	done

FuchsiaGymGuideWinText:
	text "That was a great"
	line "battle, trainer"
	cont "from Johto!"
	done

RematchTextJanine:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextJanine:
    text "Maybe next time."
    done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	def_object_events
	object_event  1, 10, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  5,  7, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassAliceScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuideScript, -1
