	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	yesorno
	closetext
	opentext
	writetext FalknerHaikuText
	waitbutton
	closetext
	opentext
	writetext FalknerIntroText2
	waitbutton
	closetext
	winlosstext FalknerLossText, FalknerWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	loadmem wLevelCap, 25
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_SWIFT
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
.rematch
	writetext FalknerIntroText
	waitbutton
	yesorno
	closetext
	opentext
	writetext FalknerHaikuText
	waitbutton
	closetext
	opentext
	writetext FalknerIntroText2
	waitbutton
	closetext
	winlosstext FalknerLossText, FalknerWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
    end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
	closetext
	opentext
	writetext RematchText
	yesorno
	iftrue .rematch
	writetext RematchRefuseText
	waitbutton
	closetext
	end
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "I wrote a haiku"
	line "would you like"
	cont "to hear it?"
	done

FalknerHaikuText:
    text "My feathers"
    line "are black."

    para "My blanket is"
    line "the night sky."

    para "Darkness my"
    line "weapon."
    done

FalknerIntroText2:
    text "I wont ask what"
    line "you think."

    para "For your opinion"
    line "doesn't matter"
    cont "to me."

    para "You are here for"
    line "a battle."

    para "Just like all"
    line "the rest."

    para "Your #MON"
    line "journey ends"
    cont "here."
    done

FalknerLossText:
	text "You are not"
	line "like the rest."

	para "You don't conform."

	para "Alright."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

FalknerWinText:
	text "You did well."

	para "Now fly through"
	line "the night once"
	cont "more."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
    text "The ZEPHYRBADGE"
    line "lets you train"
    cont "#MON up to"
    cont "level 25."

    para "And capture"
    line "#MON up to"
    cont "level 15."

	para "ZEPHYRBADGE"
	line "enables #MON"
	cont "to use FLASH."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "A TM can teach"
	line "your #MON a"
	cont "new move."

	para "You can use it"
	line "as many times as"
	cont "you like."

	para "But be careful"
	line "what move you"
	cont "delete for it."

	para "This TM teaches"
	line "SWIFT."

	para "SWIFT is a move"
	line "which can never"
	cont "miss."

	para "It offers security"
	line "and certainty in"
	cont "a troubled world."
	done

FalknerFightDoneText:
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You will face"
	line "many challenges"
	cont "along the way."

	para "Many people will"
	line "give you advice"
	cont "and try to mold"
	cont "you as they want."

	para "You live your"
	line "life the way you"
	cont "see fit."

	para "Nobody has the"
	line "right to tell"
	cont "you what to do!"

	para "And I must be"
	line "strong enough to"
	cont "take my own"
	cont "advice."

	para "Good luck!"
	done

BirdKeeperRodSeenText:
	text "I have my"
	line "concerns about"
	cont "FALKNER."

	para "The darkness may"
	line "have hold of"
	cont "him."
	done

BirdKeeperRodBeatenText:
	text "My beautiful"
	line "wings!"
	done

BirdKeeperRodAfterBattleText:
	text "Even in his"
	line "current state"
	cont "FALKNER is far"
	cont "stronger than I."

	para "But I wish I"
	line "didn't have to"
	cont "endure his"
	cont "poetry..."
	done

BirdKeeperAbeSeenText:
	text "Here we soar"
	line "above the clouds."

	para "Above the petty"
	line "problems of our"
	cont "lives."

	para "I am the STARAPTOR"
	line "and there is"
	cont "blood on my"
	cont "feathers!"
	done

BirdKeeperAbeBeatenText:
	text "I must FLY!"
	done

BirdKeeperAbeAfterBattleText:
	text "All those who"
	line "see me."

	para "And all who"
	line "believe in me."

	para "Share in the"
	line "freedom I feel"
	cont "when I FLY!"
	done

VioletGymGuideText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "This GYM utilizes"
	line "FLYING type"
	cont "#MON."

	para "These can't do"
	line "much damage to"
	cont "a good ROCK or"
	cont "STEEL type."

	para "DARK CAVE might"
	line "have such"
	cont "#MON."
	done

VioletGymGuideWinText:
	text "Nice battle!"

	para "My advice was"
	line "solid."

	para "Stick with me"
	line "and I'll make a"
	cont "CHAMPION out"
	cont "of you."
	done

RematchText:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseText:
    text "Maybe next time."
    done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
