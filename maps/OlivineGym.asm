	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	checkevent EVENT_BEAT_CHUCK
	iffalse .skipCaps
	loadmem wLevelCap, 55
.skipCaps
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	checkevent EVENT_BEAT_CHUCK
	iftrue .capUp
	writetext JasmineBeatChuckText
	sjump .cont
.capUp
	writetext Jasmine_BadgeSpeech
.cont
	promptbutton
	verbosegiveitem TM_IRON_HEAD
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end
.rematch
    writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
    closetext
	opentext
	writetext RematchTextJasmine
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextJasmine
	waitbutton
	closetext
	end
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "Welcome to"
	line "OLIVINE Gym."

	para "You have a quiet"
	line "strength that"
	cont "resonates with"
	cont "me."

	para "People that"
	line "strut and flaunt"
	cont "their muscles"
	cont "are weak."

	para "Like that"
	line "brute Chuck."

	para "In difficult"
	line "times,"
	cont "Hope is something"
	cont "you give yourself."

	para "That is true"
	line "strength."

	para "You must have"
	line "a heart made of"
	cont "STEEL."
	done

Jasmine_BetterTrainer:
	text "Your will does"
	line "not bend."

	para "You are stronger"
	line "than me."

	para "I confer upon"
	line "you this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done

Jasmine_BadgeSpeech:
    text "With the"
    line "MINERALBADGE"
    cont "you can now train"
    cont "#mon up to"
    cont "level 55."

    para "And capture"
    line "#mon up to"
    cont "level 45."

	para "Don't let"
	line "anyone change"
	cont "your perception"
	cont "of yourself."

	para "You plant your"
	line "feet in the"
	cont "ground and be"
	cont "stubborn."

	para "This will"
	line "help you."
	done

JasmineBeatChuckText:
	text "You have done well"
	line "but I'm afraid you"
	cont "also must defeat"
	cont "Chuck in CIANWOOD"
	cont "to increase your"
	cont "level caps."
	para "It should not be"
	line "difficult for you."

	para "Don't let"
	line "anyone change"
	cont "your perception"
	cont "of yourself."

	para "You plant your"
	line "feet in the"
	cont "ground and be"
	cont "stubborn."

	para "This will"
	line "help you."
	done

Jasmine_IronTailSpeech:
	text "That TM teaches"
	line "IRON HEAD."

	para "It can cause"
	line "the enemy to"
	cont "flinch."
	done

Jasmine_GoodLuck:
	text "Don't let"
	line "anyone change"
	cont "your perception"
	cont "of yourself."

	para "You plant your"
	line "feet in the"
	cont "ground and be"
	cont "stubborn."
	done

OlivineGymGuideText:
	text "Jasmine uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done

OlivineGymGuideWinText:
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done

OlivineGymGuidePreText:
	text "Jasmine, the Gym"
	line "Leader, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #mon."

	para "A strong trainer"
	line "has to be"
	cont "compassionate."
	done

RematchTextJasmine:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextJasmine:
    text "Maybe next time."
    done

OlivineGymSteelixScript:
    opentext
    writetext SteelixText
    cry STEELIX
    waitbutton
    closetext
    end

SteelixText:
    text "Steelix!"
    done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
	object_event  4,  3, SPRITE_STEELIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineGymSteelixScript, -1
