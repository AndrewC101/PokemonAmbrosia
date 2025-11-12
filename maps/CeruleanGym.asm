	object_const_def
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUIDE

CeruleanGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_CERULEANGYM_NOTHING
	scene_script .GruntRunsOut ; SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks

.DummyScene0:
	end

.GruntRunsOut:
	sdefer .GruntRunsOutScript
	end

.GruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOTHING
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOTHING
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyLossText, MistyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
	writetext MistyFightDoneText
    waitbutton
    closetext
    end

.FightDone:
	writetext MistyFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextMisty
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextMisty
	waitbutton
	closetext
	end
.rematch
    writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyLossText, MistyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuideWinScript
	writetext CeruleanGymGuideText
	waitbutton
	closetext
	end

.CeruleanGymGuideWinScript:
	writetext CeruleanGymGuideWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd GymStatue2Script

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Move aside!"

	para "I don't have"
	line "time to entertain"
	cont "you kid."
	done

CeruleanGymGruntBigMistakeText:
	text "I recognize you!"

	para "You dismantled"
	line "TEAM ROCKET in"
	cont "Johto."

	para "I would very much"
	line "like to drown you"
	cont "right here."

	para "But I don't have"
	line "time right now."
	done

CeruleanGymGruntByeText:
	text "I will not"
	line "allow Hoenn to"
	cont "get away with"
	cont "their disrespect"
	cont "of Kanto."

	para "I must complete"
	line "my mission."

	para "Get out of my"
	line "way and don't"
	cont "follow me if you"
	cont "value your life."

	para "I am the PRIMERA"

	para "The strongest of"
	line "all ROCKETS."

	para "Now be gone!"
	done

CeruleanGymNote1Text:
	text "Sorry, I'll be out"
	line "for a while."
	cont "Misty, Gym Leader"
	done

CeruleanGymNote2Text:
	text "Since Misty's out,"
	line "we'll be away too."
	cont "Gym TRAINERS"
	done

MistyIntroText:
	text "I was hoping you"
	line "would show up."

	para "After ruining my"
	line "date I expect you"
	cont "will at least"
	cont "give me an"
	cont "exciting battle."

	para "I am Misty."

	para "Just like the sea"
	line "I am deadly but"
	cont "beautiful."

	para "It is said that"
	line "Hoenn trainers"
	cont "can unlock the"
	cont "full potential of"
	cont "WATER #mon."

	para "I will prove them"
	line "all wrong."
	done

MistyLossText:
	text "Misty: You really"
	line "are good…"

	para "I'll admit that"
	line "you are skilled…"

	para "Here you go. It's"
	line "CASCADEBADGE."
	done

MistyWinText:
	text "That was an"
	line "exciting battle."

	para "Though I hate"
	line "to admit it."

	para "Here you go. It's"
	line "CASCADEBADGE."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> received"
	line "CASCADEBADGE."
	done

MistyFightDoneText:
	text "Well now I need"
	line "to ring that guy"
	cont "back and try to"
	cont "organise another"
	cont "date."

	para "I don't know why"
	line "it's so hard for"
	cont "me to find a"
	cont "boyfriend."

	para "I just want"
	line "someone funny,"
	cont "smart, driven"
	cont "and able to keep"
	cont "up with me in a"
	cont "battle."

	para "How hard is that!"
	done

SwimmerfDianaSeenText:
	text "Misty came back"
	line "so I rushed over"
	cont "and made it look"
	cont "like I never"
	cont "left."

	para "It can be our"
	line "secret ok?"
	done

SwimmerfDianaBeatenText:
	text "This is such"
	line "a tough job."
	done

SwimmerfDianaAfterBattleText:
	text "I'm just going"
	line "to keep my head"
	cont "down and swim"
	cont "quietly."

	para "There are no"
	line "other jobs"
	cont "around here."
	done

SwimmerfBrianaSeenText:
	text "How about instead"
	line "of a battle we"
	cont "have a swimming"
	cont "race!"

	para "No."

	para "OK let's go then."
	done

SwimmerfBrianaBeatenText:
	text "I can still"
	line "swim faster"
	cont "than you."
	done

SwimmerfBrianaAfterBattleText:
	text "I think I'm a"
	line "good swimmer but"
	cont "none of us can"
	cont "swim nearly as"
	cont "fast as Misty."
	done

SwimmermParkerSeenText:
	text "As a WATER"
	line "trainer I feel"
	cont "an extra respons-"
	cont "ibility to do my"
	cont "part to fight"
	cont "against Hoenn."

	para "I need to train!"
	done

SwimmermParkerBeatenText:
	text "Let's keep"
	line "training!"
	done

SwimmermParkerAfterBattleText:
	text "Misty has gotten"
	line "much better in the"
	cont "past few years."

	para "She will put up"
	line "a great fight"
	cont "against anyone."
	done

CeruleanGymGuideText:
	text "Hey CHAMP!"

	para "You know the"
	line "drill by now."

	para "WATER Gym."

	para "Use ELECTRIC or"
	line "GRASS attacks."
	done

CeruleanGymGuideWinText:
	text "Maybe I should"
	line "ask Misty out."

	para "Do you think a"
	line "guy like me and"
	cont "a woman like her."

	para "...."

	para "Aww never mind."

	para "I'm just being"
	line "stupid."
	done

RematchTextMisty:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextMisty:
    text "Maybe next time."
    done

CeruleanGymStarmieScript:
    opentext
    writetext StarmieText
    cry STARMIE
    waitbutton
    closetext
    end

StarmieText:
    text "Starmie!"
    done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	;object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuideScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  3, SPRITE_STARMIE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymStarmieScript, -1

