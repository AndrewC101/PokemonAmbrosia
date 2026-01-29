	object_const_def
	const CERULEANCAVE_AIZEN
	const CERULEANCAVE_GENESECT
	const CERULEANCAVE_REGIGIGAS
	const CERULEANCAVE_FIELDMON_1
    const CERULEANCAVE_FIELDMON_2
    const CERULEANCAVE_FIELDMON_3
    const CERULEANCAVE_FIELDMON_4
    const CERULEANCAVE_FIELDMON_5
    const CERULEANCAVE_FIELDMON_6
    const CERULEANCAVE_FIELDMON_7
    const CERULEANCAVE_FIELDMON_8
    const CERULEANCAVE_FIELDMON_9
    const CERULEANCAVE_FIELDMON_10

CeruleanCave_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .CeruleanCaveFieldMon

.CeruleanCaveFieldMon:
; Pokemon which always appear
    appear CERULEANCAVE_FIELDMON_1
    appear CERULEANCAVE_FIELDMON_2
    appear CERULEANCAVE_FIELDMON_3
    appear CERULEANCAVE_FIELDMON_4
    appear CERULEANCAVE_FIELDMON_5
    appear CERULEANCAVE_FIELDMON_6
    appear CERULEANCAVE_FIELDMON_7
    appear CERULEANCAVE_FIELDMON_8
    appear CERULEANCAVE_FIELDMON_9
    appear CERULEANCAVE_FIELDMON_10
    appear CERULEANCAVE_GENESECT
    endcallback

CeruleanCaveAmbrosiaScript:
	itemball AMBROSIA

CeruleanCaveHiddenMasterBall:
	hiddenitem MASTER_BALL, EVENT_CERULEAN_CAVE_HIDDEN_MASTER_BALL

CeruleanCaveHiddenExpertBelt:
	hiddenitem EXPERT_BELT, EVENT_CERULEAN_CAVE_HIDDEN_EXPERT_BELT

CeruleanCaveHiddenLifeOrb:
	hiddenitem LIFE_ORB, EVENT_CERULEAN_CAVE_HIDDEN_LIFE_ORB

CeruleanCaveHiddenLeftovers:
	hiddenitem LEFTOVERS, EVENT_CERULEAN_CAVE_HIDDEN_LEFTOVERS

CeruleanCaveHiddenFocusSash:
	hiddenitem FOCUS_SASH, EVENT_CERULEAN_CAVE_HIDDEN_FOCUS_SASH

CeruleanCaveHiddenChoiceBand:
	hiddenitem CHOICE_BAND, EVENT_CERULEAN_CAVE_HIDDEN_CHOICE_BAND

CeruleanCaveHiddenChoiceSpecs:
	hiddenitem CHOICE_SPECS, EVENT_CERULEAN_CAVE_HIDDEN_CHOICE_SPECS

CeruleanCaveHiddenLuckyEgg:
	hiddenitem LUCKY_EGG, EVENT_CERULEAN_CAVE_HIDDEN_LUCKY_EGG

CeruleanCaveHiddenBrightPowder:
	hiddenitem BRIGHTPOWDER, EVENT_CERULEAN_CAVE_HIDDEN_BRIGHT_POWDER

CeruleanCaveHiddenQuickClaw:
	hiddenitem QUICK_CLAW, EVENT_CERULEAN_CAVE_HIDDEN_QUICK_CLAW

CeruleanCaveHiddenScopeLens:
	hiddenitem ASSAULT_VEST, EVENT_CERULEAN_CAVE_HIDDEN_SCOPE_LENS

CeruleanCaveHiddenKingsRock:
	hiddenitem HEAVY_BOOTS, EVENT_CERULEAN_CAVE_HIDDEN_KINGS_ROCK
	
CeruleanCaveFieldMon1Script:
	trainer RAICHU, FIELD_MON, EVENT_FIELD_MON_1, CeruleanCavePokemonAttacksText, 73, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_1
    end

CeruleanCaveFieldMon2Script:
	trainer MIMIKYU, FIELD_MON, EVENT_FIELD_MON_2, CeruleanCavePokemonAttacksText, 75, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_2
    end

CeruleanCaveFieldMon3Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_3, CeruleanCavePokemonAttacksText, 77, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_3
    end

CeruleanCaveFieldMon4Script:
	trainer GOLEM, FIELD_MON, EVENT_FIELD_MON_4, CeruleanCavePokemonAttacksText, 74, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_4
    end

CeruleanCaveFieldMon5Script:
	trainer CHANSEY, FIELD_MON, EVENT_FIELD_MON_5, CeruleanCavePokemonAttacksText, 76, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_5
    end

CeruleanCaveFieldMon6Script:
	trainer DITTO, FIELD_MON, EVENT_FIELD_MON_6, CeruleanCavePokemonAttacksText, 75, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_6
    end

CeruleanCaveFieldMon7Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_7, CeruleanCavePokemonAttacksText, 76, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_7
    end

CeruleanCaveFieldMon8Script:
	trainer AZUMARILL, FIELD_MON, EVENT_FIELD_MON_8, CeruleanCavePokemonAttacksText, 74, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_8
    end

CeruleanCaveFieldMon9Script:
	trainer RATICATE, FIELD_MON, EVENT_FIELD_MON_9, CeruleanCavePokemonAttacksText, 73, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_9
    end

CeruleanCaveFieldMon10Script:
	trainer ALAKAZAM, FIELD_MON, EVENT_FIELD_MON_10, CeruleanCavePokemonAttacksText, 80, 0, .script
.script
    disappear CERULEANCAVE_FIELDMON_10
    end

CeruleanCavePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

GenesectScript:
	cry GENESECT
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GENESECT, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_TEMP_EVENT_1
	disappear CERULEANCAVE_GENESECT
	end

RegigigasScript:
	cry REGIGIGAS
	pause 15

	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon REGIGIGAS, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon REGIGIGAS, 70
.begin

	startbattle
	reloadmapafterbattle
    setval REGIGIGAS
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_REGIGIGAS
	disappear CERULEANCAVE_REGIGIGAS
	end

RegigigasCry:
    text "REGI!!!"
    done

CeruleanCaveAizenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_AIZEN
	iftrue .FightDone
.fight
	writetext AizenSeenText
	waitbutton
	closetext
	winlosstext AizenBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer POKEMANIAC, AIZEN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_AIZEN
	setmapscene CERULEAN_CAVE, SCENE_FINISHED
	;opentext
	;writetext AizenAfterBattleText
	;waitbutton
	;closetext
	special HealParty
	end
.FightDone:
	writetext AizenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextAizen
	nooryes
	iftrue .fight
	writetext RematchRefuseTextAizen
	waitbutton
	closetext
	end

AizenSeenText:
    text "We are both too"
    line "late."

    para "The great power"
    line "that was once here"
    cont "is now gone."

    para "But one day Mewtwo"
    line "shall kneel to me."

    para "You can not sense"
    line "my spiritual"
    cont "pressure."

    para "An ant can not"
    line "see the summit of"
    cont "a mountain."
    done

AizenBeatenText:
    text "BAKANA!"
    done

AizenAfterBattleText:
    text "It is hard to"
    line "step on ants"
    cont "without crushing"
    cont "them."
    done

RematchTextAizen:
    text "You dare to face"
    line "my ESPADA again?"
    done

RematchRefuseTextAizen:
    text "When wasn't I"
    line "using it."
    done

FightAizenScript:
    turnobject PLAYER, RIGHT
    sjump CeruleanCaveAizenScript

CeruleanCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  24, 17, CERULEAN_CITY, 7
	warp_event  25, 17, CERULEAN_CITY, 7

	warp_event  23, 7, CERULEAN_CAVE, 4
	warp_event 22, 28, CERULEAN_CAVE, 3

	warp_event  27, 1, CERULEAN_CAVE, 6
	warp_event  29, 23, CERULEAN_CAVE, 5

	warp_event  18, 9, CERULEAN_CAVE, 8
	warp_event  19, 29, CERULEAN_CAVE, 7

	warp_event  7, 1, CERULEAN_CAVE, 10
	warp_event  9, 23, CERULEAN_CAVE, 9

	warp_event  3, 11, CERULEAN_CAVE, 12
	warp_event  3, 33, CERULEAN_CAVE, 11

	warp_event  1, 3, CERULEAN_CAVE, 14
	warp_event  1, 25, CERULEAN_CAVE, 13

	warp_event  0, 6, CERULEAN_CAVE, 16
	warp_event  3, 49, CERULEAN_CAVE, 15


	def_coord_events
	coord_event 27, 46, SCENE_DEFAULT, FightAizenScript

	def_bg_events
	bg_event 19, 45, BGEVENT_ITEM, CeruleanCaveHiddenMasterBall
	bg_event 29, 31, BGEVENT_ITEM, CeruleanCaveHiddenExpertBelt
	bg_event 21, 31, BGEVENT_ITEM, CeruleanCaveHiddenLifeOrb
	bg_event 11, 29, BGEVENT_ITEM, CeruleanCaveHiddenLeftovers
	bg_event 19,  3, BGEVENT_ITEM, CeruleanCaveHiddenFocusSash
	bg_event 10, 34, BGEVENT_ITEM, CeruleanCaveHiddenChoiceBand
	bg_event 19, 39, BGEVENT_ITEM, CeruleanCaveHiddenChoiceSpecs
	bg_event  5, 37, BGEVENT_ITEM, CeruleanCaveHiddenLuckyEgg
	bg_event  7, 27, BGEVENT_ITEM, CeruleanCaveHiddenBrightPowder
	bg_event 24, 37, BGEVENT_ITEM, CeruleanCaveHiddenQuickClaw
	bg_event 27, 26, BGEVENT_ITEM, CeruleanCaveHiddenScopeLens
	bg_event 11, 25, BGEVENT_ITEM, CeruleanCaveHiddenKingsRock

	def_object_events
	object_event 28, 46, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCaveAizenScript, -1
	object_event 15, 23, SPRITE_GENESECT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GenesectScript, EVENT_TEMP_EVENT_1
	object_event 27, 57, SPRITE_REGIGIGAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, RegigigasScript, EVENT_CAUGHT_REGIGIGAS
	object_event 22, 35, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 1, CeruleanCaveFieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon2Script, EVENT_FIELD_MON_2
	object_event 12, 31, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 1, CeruleanCaveFieldMon3Script, EVENT_FIELD_MON_3
	object_event 22, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 1, CeruleanCaveFieldMon4Script, EVENT_FIELD_MON_4
	object_event 12, 51, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon5Script, EVENT_FIELD_MON_5
	object_event  7, 49, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon6Script, EVENT_FIELD_MON_6
	object_event 11,  1, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon7Script, EVENT_FIELD_MON_7
	object_event  9, 25, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 1, CeruleanCaveFieldMon8Script, EVENT_FIELD_MON_8
	object_event 23, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon9Script, EVENT_FIELD_MON_9
	object_event 23, 48, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, CeruleanCaveFieldMon10Script, EVENT_FIELD_MON_10
	object_event 19, 37, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveAmbrosiaScript, EVENT_CERULEAN_CAVE_HIDDEN_AMBROSIA
