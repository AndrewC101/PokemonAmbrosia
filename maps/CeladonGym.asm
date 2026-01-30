	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
	setval WEATHER_SUN
	writemem wFieldWeather
    endcallback

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	writetext ErikaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextErika
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextErika
	waitbutton
	closetext
	end
.rematch
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "Oh hello there."

	para "It is pleasant"
	line "and peaceful here."

	para "It's the only"
	line "place in the city"
	cont "you can stop and"
	cont "think."

	para "Smell the grass"
	line "and listen to the"
	cont "trees."

	para "This city has lost"
	line "its way."

	para "But I never will."

	para "This Gym will"
	line "stand always as a"
	cont "shrine to nature."

	para "People can build"
	line "all the buildings"
	cont "and weapons they"
	cont "want."

	para "Nothing is more"
	line "powerful than"
	cont "mother nature"
	done

ErikaBeatenText:
	text "Well done."

	para "I shall give you"
	line "Rainbowbadge…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> received"
	line "Rainbowbadge."
	done

ErikaExplainTMText:
	text "That was a great"
	line "match."

	para "Nature already"
	line "has the solution"
	cont "to many problems."

	para "Here take this."

	para "It is versatile"
	line "and I know it"
	cont "will help you."
	done

ErikaAfterBattleText:
	text "Never forget."

	para "All of these"
	line "great cities will"
	cont "one day be in"
	cont "Ruins."

	para "One day humanity"
	line "will be no more."

	para "Nature will still"
	line "be there."

	para "Nature always"
	line "finds a way."
	done

LassMichelleSeenText:
	text "I think this"
	line "is the only"
	cont "girls only Gym."

	para "Except Goldenrod."

	para "And I guess maybe"
	line "Olivine."
	done

LassMichelleBeatenText:
	text "Oh my!"
	done

LassMichelleAfterBattleText:
	text "I guess a girl"
	line "only Gym isn't"
	cont "such a novel"
	cont "concept."
	done

PicnickerTanyaSeenText:
	text "I only came here"
	line "to get away from"
	cont "the city."

	para "I didn't expect"
	line "to battle."

	para "But that doesn't"
	line "mean I'm not able."
	done

PicnickerTanyaBeatenText:
	text "Yeah, take that!"
	done

PicnickerTanyaAfterBattleText:
	text "Yeah let's battle."

	para "Ok I need to"
	line "calm down."
	done

BeautyJuliaSeenText:
	text "I caught you."

	para "Don't pretend to"
	line "be looking at the"
	cont "flowers."

	para "You were looking"
	line "at me."
	done

BeautyJuliaBeatenText:
	text "Can't take your"
	line "eyes off me."
	done

BeautyJuliaAfterBattleText:
	text "It's ok I know"
	line "I'm pretty."

	para "Even I find it"
	line "hard not to look"
	cont "at me."
	done

TwinsJoAndZoe1SeenText:
	text "Erika has been"
	line "teaching us how"
	cont "to battle."

	para "Go #ball!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… We lost…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "Erika will stomp"
	line "you into the dirt."

	para "Then plant a"
	line "tree on you!"
	done

TwinsJoAndZoe2SeenText:
	text "Stop!"

	para "We won't let you"
	line "get to Erika."

	para "She is sleeping."
	done

TwinsJoAndZoe2BeatenText:
	text "We couldn't win…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "Don't disturb"
	line "Erika when she"
	cont "is sleeping."

	para "She can wake up"
	line "a bit grumpy."
	done

RematchTextErika:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextErika:
    text "Maybe next time."
    done

CeladonGymVenusaurScript:
    opentext
    writetext VenusaurText
    cry VENUSAUR
    waitbutton
    closetext
    end

VenusaurText:
    text "Venusaur!"
    done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	;object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	;object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
	object_event  4,  3, SPRITE_VENUSAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymVenusaurScript, -1
