	object_const_def
	;const ILEXFOREST_FARFETCHD
	const ILEXFOREST_YOUNGSTER1
	;const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_FIELDMON_1
    const ILEXFOREST_FIELDMON_2
    const ILEXFOREST_FIELDMON_3
    const ILEXFOREST_FIELDMON_4
    const ILEXFOREST_FIELDMON_5
    const ILEXFOREST_FIELDMON_6
    const ILEXFOREST_FIELDMON_7
    const ILEXFOREST_FIELDMON_8

IlexForest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .FarfetchdCallback

.FarfetchdCallback:
; Pokemon which always appear
    appear ILEXFOREST_FIELDMON_1
    appear ILEXFOREST_FIELDMON_2
    appear ILEXFOREST_FIELDMON_3
    appear ILEXFOREST_FIELDMON_6
    appear ILEXFOREST_FIELDMON_7

    random 2
    ifequal 1, .spawn6
    disappear ILEXFOREST_FIELDMON_4
    sjump .mon7
.spawn6
    appear ILEXFOREST_FIELDMON_4

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ILEXFOREST_FIELDMON_5
    sjump .mon8
.spawn7
    appear ILEXFOREST_FIELDMON_5

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear ILEXFOREST_FIELDMON_8
    sjump .end
.spawn8
    appear ILEXFOREST_FIELDMON_8

.end
	endcallback

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .gotCut
	writetext ApprenticeGivesCutText
	waitbutton
	verbosegiveitem HM_CUT
	waitbutton
	closetext
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end
.gotCut
    writetext AlreadyGotCutText
    waitbutton
    closetext
    end

ApprenticeGivesCutText:
    text "My master gave"
    line "me this"
    cont "special move."

    para "I'm supposed to"
    line "use it to cut"
    cont "down this tree."

    para "But I have no"
    line "#mon that are"
    cont "able to do it."

    para "Here, maybe you"
    line "can try it."

    para "You don't need to"
    line "actually teach"
    cont "the move to a"
    cont "#mon."

    para "As long as it"
    line "able to learn"
    cont "the move, it"
    cont "will be able"
    cont "to use it."

    para "You will need"
    line "to have the"
    cont "AZALEA GYM"
    cont "BADGE though."
    done

AlreadyGotCutText:
	text "Be careful with"
	line "that HM I just"
	cont "gave you."
	para "With great power"
	line "comes great"
	cont "responsibility."
	done

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	promptbutton
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball AMBROSIA

IlexForestHiddenEther:
	hiddenitem MAX_REVIVE, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem FULL_RESTORE, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem MAX_ELIXER, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder: ; unreferenced
	jumpstd StrengthBoulderScript

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	sjump .DontDoCelebiEvent

.ForestIsRestless:
	checkitem GS_BALL
	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special FadeOutMusic
	applymovement PLAYER, IlexForestPlayerStepsDownMovement
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	special CelebiShrineEvent
	loadwildmon CELEBI, 60
	startbattle
	reloadmapafterbattle
	pause 20
	setval CELEBI
	special MonCheck
	iffalse .DidntCatchCelebi
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	clearflag ENGINE_FOREST_IS_RESTLESS
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, IlexForestKurtStepsUpMovement
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, IlexFOrestKurtStepsDownMovement
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step LEFT
	jump_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step RIGHT
	turn_head UP
	step_sleep 1
	turn_head DOWN
	step_sleep 1
	turn_head UP
	step_sleep 1
	big_step DOWN
	big_step DOWN
	fix_facing
	jump_step UP
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

IlexForestKurtStepsUpMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

IlexFOrestKurtStepsDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

IlexForestPlayerStepsDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I am strengthening"
	line "the skulls of my"
	cont "#mon."

	para "By using HEADBUTT"
	line "on this tree."

	para "It's an ancient"
	line "means of training."
	done

Text_HeadbuttOutro:
	text "UH!"

	para "HURRAHH!"

	para "Who are you"
	line "again!?"

	para "This tree won't"
	line "HEADBUTT itself."
	done

Text_IlexForestLass:
	text "Something is"
	line "wrong."

	para "The forest is"
	line "restless."

	para "The spirit of"
	line "the forest is"
	cont "looking for you."
	done

IlexForestSignpostText:
	text "ILEX FOREST is"
	line "said to be over"
	cont "1000 years old."

	para "The ancients"
	line "believed a"
	cont "mythical protector"
	cont "watches over it."
	done

Text_IlexForestShrine:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

Text_ShrineCelebiEvent:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS BALL would fit"
	line "inside it."

	para "Want to put the GS"
	line "BALL here?"
	done

Text_InsertGSBall:
	text "<PLAYER> put in the"
	line "GS BALL."
	done

Text_KurtCaughtCelebi:
	text "I do not"
	line "believe it!"

	para "You have been"
	line "chosen by the"
	cont "protector of"
	cont "the forest."

	para "You will do"
	line "great things"
	cont "and be remembered"
	cont "for all time."

	para "I would be"
	line "honoured to"
	cont "make # balls"
	cont "for you!"
	done

BugCatcherWayneSeenText:
	text "There is a"
	line "colony of"
	cont "ancient BUG"
	cont "#mon in"
	cont "here somewhere."

	para "I will find it."
	done

BugCatcherWayneBeatenText:
	text "I hadn't seen that"
	line "#mon before…"
	done

BugCatcherWayneAfterBattleText:
	text "They must be"
	line "much further"
	cont "SOUTH."

	para "The hunt"
	line "continues."
	done

IlexForestFieldMon1Script:
	trainer SCYTHER, FIELD_MON, EVENT_FIELD_MON_1, IlexForestPokemonAttacksText, 27, 0, .script
.script
    disappear ILEXFOREST_FIELDMON_1
    end

IlexForestFieldMon2Script:
	trainer YANMEGA, FIELD_MON, EVENT_FIELD_MON_2, IlexForestPokemonAttacksText, 28, 0, .script
.script
    disappear ILEXFOREST_FIELDMON_2
    end

IlexForestPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

IlexForestFieldMon3Script:
	cry VOLCARONA
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon VOLCARONA, 75
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ILEXFOREST_FIELDMON_3
	end

IlexForestFieldMon4Script:
	faceplayer
	cry SCYTHER
	pause 15
	loadwildmon SCYTHER, 17
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ILEXFOREST_FIELDMON_4
	end

IlexForestFieldMon5Script:
	faceplayer
	cry PINSIR
	pause 15
	loadwildmon PINSIR, 18
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ILEXFOREST_FIELDMON_5
	end

IlexForestFieldMon6Script:
	faceplayer
	cry LARVESTA
	pause 15
	loadwildmon LARVESTA, 16
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ILEXFOREST_FIELDMON_6
	end

IlexForestFieldMon7Script:
	faceplayer
	cry JOLTIK
	pause 15
	loadwildmon JOLTIK, 17
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ILEXFOREST_FIELDMON_7
	end

IlexForestFieldMon8Script:
	faceplayer
	cry SCYTHER
	pause 15
	loadwildmon SCYTHER, 20
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ILEXFOREST_FIELDMON_8
	end

IlexForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  5, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  3, 54, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  3, 55, ILEX_FOREST_AZALEA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  3, 29, BGEVENT_READ, IlexForestSignpost
	bg_event 11, 19, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 22, 26, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event  1, 29, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event  8, 34, BGEVENT_UP, IlexForestShrineScript

	def_object_events
	;object_event 14, 43, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	;object_event  5, 40, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	object_event 15, 26, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event  1, 60, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	object_event  8, 41, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  3, 36, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestLassScript, EVENT_ILEX_FOREST_LASS
	object_event 12, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1

	object_event 24, 47, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, IlexForestFieldMon1Script, EVENT_FIELD_MON_1
	object_event 27, 0, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, IlexForestFieldMon2Script, EVENT_FIELD_MON_2
	object_event  2, 60, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon3Script, EVENT_FIELD_MON_3
	object_event 10, 9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon4Script, EVENT_FIELD_MON_4
	object_event 2, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon5Script, EVENT_FIELD_MON_5
	object_event 12, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon6Script, EVENT_FIELD_MON_6
	object_event 2, 44, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon7Script, EVENT_FIELD_MON_7
	object_event 18, 20, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, IlexForestFieldMon8Script, EVENT_FIELD_MON_8
