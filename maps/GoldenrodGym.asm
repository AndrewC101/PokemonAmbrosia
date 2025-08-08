	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_NOTHING
	scene_script .DummyScene1 ; SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setmapscene ECRUTEAK_CITY, SCENE_FINISHED ; teleport guy
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end
.rematch
    writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	end

.StoppedCrying:
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	loadmem wLevelCap, 40
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_RETURN
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotPlainBadge:
	writetext WhitneyGoodCryText
	waitbutton
    closetext
	opentext
	writetext RematchTextWhitney
	yesorno
	iftrue .rematch
	writetext RematchRefuseTextWhitney
	waitbutton
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOTHING
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Oh my, look"
	line "at you."

	para "So serious!"

	para "So dramatic!"

	para "You could be"
	line "a great actor."

	para "We all aspire"
	line "to make a name"
	cont "for ourselves"
	cont "on the big screen!"

	para "Just like our"
	line "hero DIANTHA!"

	para "She is so pretty"
	line "and so talented."

	para "But also a great"
	line "trainer."

	para "Just like me."

	para "If you want to"
	line "be a great"
	cont "trainer too"
	cont "you will have"
	cont "to beat me."
	done

WhitneyShouldntBeSoSeriousText:
	text "How could you!"

	para "How could you"
	line "use such brutish"
	cont "force against a"
	cont "delicate beauty"
	cont "like me."
	done

WhitneyYouMeanieText:
	text "You are a"
	line "monster!"

	para "I am shaken."

	para "I am beside"
	line "myself."

	para "Get away from"
	line "me you brute!"
	done

WhitneyWhatDoYouWantText:
	text "Composure..."

	para "Composure..."

	para "I am composed."

	para "I am beautiful"
	line "and strong."

	para "And..."

	para "So are you."

	para "You have earned"
	line "this BADGE!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "STARBADGE."
	done

WhitneyPlainBadgeText:
    text "With the STARBADGE"
    line "you can now train"
    cont "#mon up to"
    cont "level 40."

    para "And capture"
    line "#mon up to"
    cont "level 30."

	para "It also lets"
	line "your #mon use"

	para "STRENGTH outside"
	line "of battle."

	para "Oh, you can have"
	line "this too!"
	done

WhitneyAttractText:
	text "It's RETURN."

	para "This move gets"
	line "more powerful"
	cont "the more your"
	cont "#mon like"
	cont "you."

	para "It turns their"
	line "love into power!"

	para "Isn't that"
	line "beautiful?"
	done

WhitneyGoodCryText:
	text "I feel good now!"

    para "Good luck <PLAYER>."

    para "Stay strong and"
    line "never give up!"

    para "The audience"
    line "loves a perky"
    cont "protagonist."
	done

LassCarrieSeenText:
	text "I've heard you"
	line "are really good."

	para "I even heard"
	line "you fought off"
	cont "TEAM ROCKET"
	cont "at AZALEA."

	para "That is soo"
	line "Fetch!"
	done

LassCarrieBeatenText:
	text "You really are"
	line "good!"
	done

LassCarrieAfterBattleText:
	text "WHITNEY is strong"
	line "but you are way"
	cont "more Fetch than"
	cont "her!"
	done

LassBridgetSeenText:
	text "The other girls"
	line "here need to"
	cont "stop trying to"
	cont "make Fetch happen."

	para "It's not going"
	line "to happen!"
	done

LassBridgetBeatenText:
	text "..."
	line "You are pretty"
	cont "Fetch."
	done

LassBridgetAfterBattleText:
	text "WHITNEY is"
	line "beautiful."

	para "But you have"
	line "real star power!"
	done

BridgetWhitneyCriesText:
	text "You beat WHITNEY!"

	para "She takes losing"
	line "really badly."

	para "Just give her"
	line "a moment to"
	cont "cool down."
	done

BeautyVictoriaSeenText:
	text "Oh, you are a cute"
	line "little trainer! "

	para "Have you heard"
	line "of DIANTHA?"

	para "She is a beautiful"
	line "actress and a"
	cont "CHAMPION."

	para "She is truly"
	line "Fetch."
	done

BeautyVictoriaBeatenText:
	text "You have training!"
	done

BeautyVictoriaAfterBattleText:
	text "I can tell talent"
	line "when I see it."

	para "You have real"
	line "talent!"
	done

BeautySamanthaSeenText:
	text "I dream that"
	line "one day DIANTHA"
	cont "will visit us."

	para "If that happened"
	line "I think I would"
	cont "faint!"
	done

BeautySamanthaBeatenText:
	text "You are so"
	line "Fetch!"
	done

BeautySamanthaAfterBattleText:
	text "Not everyone gets"
	line "famous overnight."

	para "It takes years"
	line "of perseverance."

	para "WHITNEY doesn't"
	line "have the patience"
	cont "to make it!"
	done

GoldenrodGymGuideText:
	text "This GYM is"
	line "full of aspiring"
	cont "movie stars who"
	cont "like to use"
	cont "FAIRY #mon."

	para "FAIRY types have"
	line "few weaknesses."

	para "Only STEEL and"
	line "POISON."

	para "But they generally"
	line "have trouble with"
	cont "strong physical"
	cont "attacks."
	done

GoldenrodGymGuideWinText:
	text "Looks like you"
	line "upstaged them"
	cont "all, eh!"
	done

RematchTextWhitney:
    text "Would you like"
    line "to train together"
    cont "some more?"
    prompt

RematchRefuseTextWhitney:
    text "I'm not good"
    line "enough, huh?"

    para "How Fetch!"
    done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 2
	warp_event  3, 17, GOLDENROD_CITY, 2

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
