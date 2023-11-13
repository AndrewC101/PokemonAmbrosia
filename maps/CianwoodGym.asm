	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
    playmusic MUSIC_HOEN_CHAMPION
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, ChuckWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	loadmem wLevelCap, 50
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DRAIN_PUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end
.rematch
	writetext ChuckIntroText1
	waitbutton
	closetext
    playmusic MUSIC_HOEN_CHAMPION
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, ChuckWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
    closetext
	opentext
	writetext RematchTextChuck
	yesorno
	iftrue .rematch
	writetext RematchRefuseTextChuck
	waitbutton
	closetext
	end
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "Strength is the"
	line "only thing that"
	cont "matters in this"
	cont "world."

	para "Like VEGETA I"
	line "train everyday."

	para "I train to claim"
	line "my destiny!"

	para "To be the best"
	line "as I always have"
	cont "been."

	para "Now behold."

	para "This is my"
	line "normal state."

	para "WHAAAH!"

	para "This is a"
	line "SUPER TRAINER."

	para "And this..."

	para "is to go..."

	para "Even further"
	line "beyond."
	done

ChuckIntroText2:
    text "AHAAAAAAAAA!!"

    para "AHHHAHHHAHH!!"

    para "WHUAHHHHHHH!!"

    para "AHAAAAAAAA!!"

    para "OOOHHARRRA!!"

    para "RRAHHHAAUUUU!!"

    para ".............."

    para "EHHEEEEEEEEH!!!!!!"
	done

ChuckIntroText3:
	text "This is called"
	line "SUPER TRAINER 3!"

	para "I'm gonna blow"
	line "you to bits!"
	done

ChuckLossText:
	text "Oh man!"

	para "That was a"
	line "good fight!"

	para "You have earned"
	line "the STORMBADGE!"
	done

ChuckWinText:
    text "I'm just way"
    line "stronger than"
    cont "you."
    done

GetStormBadgeText:
	text "<PLAYER> received"
	line "STORMBADGE."
	done

ChuckExplainBadgeText:
    text "The STORMBADGE"
    line "lets you train"
    cont "#MON up to"
    cont "level 45."

    para "And capture"
    line "#MON up to"
    cont "level 35."

	para "Here, take this"
	line "too!"
	done

ChuckExplainTMText:
	text "That is DRAIN"
	line "PUNCH."

	para "It drains the"
	line "enemies KI"
	cont "like what androids"
	cont "nineteen and"
	cont "twenty did!"
	done

ChuckAfterText:
	text "I powered all"
	line "the way up to"
	cont "SUPER TRAINER 3!"

	para "But your power"
	line "level was still"
	cont "too great."

	para "But I am not"
	line "phased."

	para "There is one"
	line "thing a trainer"
	cont "always keeps..."

	para "His pride!!"
	done

BlackbeltYoshiSeenText:
	text "DRAGON!"
	line "DRAGON!"

	para "ROCK THE DRAGON!"

	para "DRAGON BALL"
	line "ZEEEEEE!!!!!"
	done

BlackbeltYoshiBeatenText:
	text "Where did I"
	line "put that"
	cont "SENZU BEAN!"
	done

BlackbeltYoshiAfterText:
	text "Are you a fan"
	line "of DBZ?"

	para "Here I will"
	line "lend you my"
	cont "complete dvd"
	cont "collection!"
	done

BlackbeltLaoSeenText:
	text "The best villian"
	line "is clearly CELL."

	para "FRIEZA is over"
	line "hyped and not"
	cont "cool anymore."

	para "And BUU is"
	line "just stupid."

	para "CELL is perfect!"
	done

BlackbeltLaoBeatenText:
	text "But I'm the"
	line "perfect beinngg..."
	done

BlackbeltLaoAfterText:
	text "Cell has the"
	line "potential to be"
	cont "the strongest"
	cont "character!"

	para "Anything GOKU,"
	line "VEGETA or FRIEZA"
	cont "can do, CELL can"
	cont "do better!"
	done

BlackbeltNobSeenText:
	text "I literally"
	line "break down and"
	cont "cry like a baby"
	cont "every time I"
	cont "see it."

	para "And I watch it"
	line "nearly everyday."

	para "The father-son"
	line "KAMEHAMEHA is the"
	cont "coolest scene in"
	cont "all fiction!"
	done

BlackbeltNobBeatenText:
	text "Let your power"
	line "explode!!!"
	done

BlackbeltNobAfterText:
	text "I'm watching it"
	line "again tonight."

	para "I hope one day"
	line "I become a dad"
	cont "so can do the"
	cont "father-son"
	cont "KAMEHAMEHA with"
	cont "my son."

	para "Or daughter!"
	done

BlackbeltLungSeenText:
	text "BANKAI!"

	para "Oh no wait..."

	para "KAMEHAMEHA..."

	para "I'm more of a"
	line "BLEACH guy."
	done

BlackbeltLungBeatenText:
	text "Now for my sad"
	line "back story."
	done

BlackbeltLungAfterText:
	text "Don't tell the"
	line "others I prefer"
	cont "BLEACH."

	para "They'll want to"
	line "debate me over it."
	done

RematchTextChuck:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextChuck:
    text "Maybe next time."
    done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
