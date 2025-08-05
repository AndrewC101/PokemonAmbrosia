	object_const_def
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3
	const RUINSOFALPHOUTSIDE_HENSHIN
	const RUINSOFALPHOUTSIDE_FIELDMON_2

RuinsOfAlphOutside_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
    appear RUINSOFALPHOUTSIDE_FIELDMON_2
    disappear RUINSOFALPHOUTSIDE_HENSHIN
	checktime NITE
	iffalse .continue
    checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
    iffalse .henshin
    checkevent EVENT_SOLVED_KABUTO_PUZZLE
    iffalse .henshin
    checkevent EVENT_SOLVED_OMANYTE_PUZZLE
    iffalse .henshin
    checkevent EVENT_SOLVED_HO_OH_PUZZLE
    iffalse .henshin
    sjump .continue
.henshin
    appear RUINSOFALPHOUTSIDE_HENSHIN
.continue
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	sjump .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	sjump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	endcallback

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, RuinsOfAlphOutsidePlayerEnterLabMovement
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
    jumptextfaceplayer RuinsOfAlphOutsideFisherText1

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

RuinsOfAlphOutsideScientistWalkToLabMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

RuinsOfAlphOutsidePlayerEnterLabMovement:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "You solved the"
	line "puzzle!"

	para "Even the greatest"
	line "minds in JOHTO"
	cont "could not solve"
	cont "them."

	para "Some strange"
	line "#MON have"
	cont "appeared in"
	cont "the hall."

	para "You must follow"
	line "me!"
	done

PsychicNathanSeenText:
	text "Who dares disturb"
	line "the tranquility"
	cont "of this place!"
	done

PsychicNathanBeatenText:
	text "You're too loud."
	done

PsychicNathanAfterBattleText:
	text "There's too much"
	line "chaos in this"
	cont "world."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "MYSTERY STONE"
	line "PANEL CHAMBER"
	done

RuinsOfAlphSignText:
	text "RUINS OF ALPH"
	line "VISITORS WELCOME"
	done

RuinsOfAlphResearchCenterSignText:
	text "RUINS OF ALPH"
	line "RESEARCH CENTER"

	para "THE AUTHORITY ON"
	line "THE RUINS OF ALPH"
	done

RuinsOfAlphOutsideFisherText1:
	text "I... I..."

	para "I was in hall"
	line "and some kind"
	cont "of monster with"
	cont "one eye just"
	cont "appeared behind"
	cont "me!"

	para "I didn't know"
	line "these mighty"
	cont "muscled legs"
	cont "could move so"
	cont "fast..."
	done

RuinsOfAlphOutsideYoungster1Text:
	text "I wonder what"
	line "this place"
	cont "looked like"
	cont "a thousand"
	cont "years ago."

	para "I wonder what"
	line "#MON they used."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "Is he here!"

	para "There was a guy"
	line "here at night"
	cont "once and he"
	cont "attacked me."

	para "His #MON"
	line "were so crazy"
	cont "strong!"

	para "He must be a"
	line "CHAMPION or"
	cont "something."
	done


RuinsOfAlphBlockScript:
    checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
    iffalse .block
    checkevent EVENT_SOLVED_KABUTO_PUZZLE
    iffalse .block
    checkevent EVENT_SOLVED_OMANYTE_PUZZLE
    iffalse .block
    checkevent EVENT_SOLVED_HO_OH_PUZZLE
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext RuinsOfAlphBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_RuinsOfAlphTurnBack
    end

RuinsOfAlphBlockText:
    text "The door is"
    line "locked by some"
    cont "contraption."
    para "Perhaps related"
    line "to the puzzles."
    done

Movement_RuinsOfAlphTurnBack:
	step DOWN
	step_end

RuinsOfAlphOutsideHenshinScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_HENSHIN
	iftrue .FightDone
.fight
	writetext AlphHenshinSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_HENSHIN
	iftrue .dontAsk
	opentext
	writetext AlphHenshinOfferFightText
	waitbutton
	yesorno
	iffalse .refused
	closetext
.dontAsk
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext AlphHenshinBeatenText, AlphHenshinWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SAGE, HENSHIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HENSHIN
	end
.FightDone:
	writetext AlphHenshinAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextAlphHenshin
	yesorno
	iftrue .fight
.refused
	writetext RematchRefuseTextAlphHenshin
	waitbutton
	closetext
	end
AlphHenshinSeenText:
	text "Wretched things"
	line "stars..."
	para "They mar the"
	line "blessed dark."

    para "I am sure the"
    line "entrance to the"
    cont "ancient city of"
    cont "MENZOBERRANZAN"
    cont "is around here."

    para "It must have some"
    line "relation to these"
    cont "puzzles."

    para "The power of"
    line "death will at"
    cont "last belong to"
    cont "HENSHIN!"

    para "Then SETO and"
    line "ATEM will kneel"
    cont "before me!"
    done
AlphHenshinBeatenText:
    text "IMPOSSIBLE!!"
    done
AlphHenshinWinsText:
    text "Be gone!"
    done
AlphHenshinOfferFightText:
    text "Pitiful child!"

    para "You dare to"
    line "question my"
    cont "ambitions?"
    done
AlphHenshinAfterBattleText:
    text "You are just"
    line "another slave"
    cont "destined to feed"
    cont "my destiny."

    para "If I could just"
    line "solve these"
    cont "puzzles."
    done
RematchTextAlphHenshin:
    text "One more"
    line "duel?"
    done
RematchRefuseTextAlphHenshin:
    text "Wise choice."
    done

RuinsOfAlphOutsideFieldMon1Script:
	faceplayer
	cry SNEASEL
	pause 15
	loadwildmon SNEASEL, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear RUINSOFALPHOUTSIDE_FIELDMON_2
	end

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 13, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event  8, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 20,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  8, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 22, 33, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 23, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event 12, 19, UNION_CAVE_B1F, 1
	warp_event 12, 27, UNION_CAVE_B1F, 2
	warp_event 13,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 19, 20, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 19, 21, ROUTE_32_RUINS_OF_ALPH_GATE, 2
	warp_event  1, 19, ANCIENT_RUIN_PRESENT, 1

	def_coord_events
	coord_event 17, 14, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 16, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2
	coord_event 1, 20, SCENE_ALWAYS, RuinsOfAlphBlockScript

	def_bg_events
	bg_event 22,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 18, 16, BGEVENT_READ, RuinsOfAlphSign
	bg_event 24, 12, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	def_object_events
	object_event 10, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 17, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 19, 17, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 20, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 18,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 15,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RuinsOfAlphOutsideHenshinScript, EVENT_FIELD_MON_1
	object_event  3,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFieldMon1Script, EVENT_FIELD_MON_2
