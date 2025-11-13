	object_const_def
	const VICTORYROAD_SILVER
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_INVADER
	const VICTORYROAD_FIELDMON_1
    const VICTORYROAD_FIELDMON_2
    const VICTORYROAD_FIELDMON_3
    const VICTORYROAD_FIELDMON_4
    const VICTORYROAD_FIELDMON_5
    const VICTORYROAD_FIELDMON_6
    const VICTORYROAD_FIELDMON_7
    const VICTORYROAD_FIELDMON_8
    const VICTORYROAD_FIELDMON_9

VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .VictoryRoadFieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.VictoryRoadFieldMon:
; Pokemon which always appear
    appear VICTORYROAD_FIELDMON_1
    appear VICTORYROAD_FIELDMON_2
    appear VICTORYROAD_FIELDMON_3
    appear VICTORYROAD_FIELDMON_4
    appear VICTORYROAD_FIELDMON_5
    appear VICTORYROAD_FIELDMON_6
    appear VICTORYROAD_FIELDMON_7
    appear VICTORYROAD_FIELDMON_8
    appear VICTORYROAD_FIELDMON_9
    endcallback

VictoryRoadRivalLeft:
	moveobject VICTORYROAD_SILVER, 18, 11
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	disappear VICTORYROAD_FIELDMON_1
	disappear VICTORYROAD_FIELDMON_3
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleApproachMovement1
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD_SILVER
	setscene SCENE_FINISHED
	playmapmusic
	end

VictoryRoadRivalRight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	disappear VICTORYROAD_FIELDMON_1
	disappear VICTORYROAD_FIELDMON_3
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleApproachMovement2
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleExitMovement2
	disappear VICTORYROAD_SILVER
	setscene SCENE_FINISHED
	playmapmusic
	end

VictoryRoadRivalNext:
	turnobject PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext VictoryRoadRivalAfterText
	waitbutton
	closetext
	end

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball FOCUS_SASH

VictoryRoadLifeOrb:
	itemball ASSAULT_VEST

VictoryRoadTMFlamethrower:
	itemball TM_FLAMETHROWER

VictoryRoadAmbrosia:
	itemball AMBROSIA

VictoryRoadHiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem RARE_CANDY, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

VictoryRoadRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleApproachMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleExitMovement1:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VictoryRoadRivalBattleExitMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

VictoryRoadRivalBeforeText:
	text "Stop!"
	para "I will decide if"
	line "you are ready to"
	cont "face the Elite"
	cont "Four."
	para "I am now fully"
	line "committed to my"
	cont "cause."
	para "I am the greatest"
	line "trainer and I'm"
	cont "destined to"
	cont "defeat you, that"
	cont "dragon imposter"
	cont "and everyone else."
	para "Now be gone with"
	line "you!"
	done

VictoryRoadRivalDefeatText:
	text "What is going on!?"
	para "I just can't win."
	para "I don't"
	line "understand."
	done

VictoryRoadRivalAfterText:
	text "Mark these words."
	para "I will beat you."
	para "Not today but one"
	line "day I will."
	para "Once I figure out"
	line "what I'm doing"
	cont "wrong."
	para "There is someone I"
	line "need to find."
	para "A score I need to"
	line "settle."
	para "Only then will I"
	line "be at peace."
	para "Then I will find"
	line "you."
	done

VictoryRoadRivalVictoryText:
	text "I've done it!"
	para "I beat you!"
	para "Now time to defeat"
	line "my father."
	done

InvaderSolaireScript:
	trainer INVADER, SOLAIRE, EVENT_BEAT_INVADER_SOLAIRE, InvaderSolaireSeenText, InvaderSolaireBeatenText, InvaderSolaireVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderSolaireAfterBattleText
	waitbutton
	closetext
	end

InvaderSolaireSeenText:
    text "Oh hello."

    para "The flow of time"
    line "itself is"
    cont "convoluted."

    para "It is perfect"
    line "for heroes from"
    cont "all eras to"
    cont "engage in"
    cont "jolly cooperation."

    para "Can you help"
    line "me find my"
    cont "Sun!"
	done

InvaderSolaireVictoryText:
	text "Praise the Sun."
	done

InvaderSolaireBeatenText:
	text "Praise the Sun."
	done

InvaderSolaireAfterBattleText:
	text "If only I could"
	line "be so grossly"
	cont "incandescent."
	done

VictoryRoadFieldMon1Script:
	trainer URSALUNA, FIELD_MON, EVENT_FIELD_MON_1, VictoryRoadPokemonAttacksText, 62, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_1
    end

VictoryRoadFieldMon2Script:
	trainer URSALUNA_B, FIELD_MON, EVENT_FIELD_MON_2, VictoryRoadPokemonAttacksText, 61, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_2
    end

VictoryRoadFieldMon3Script:
	trainer LUCARIO, FIELD_MON, EVENT_FIELD_MON_3, VictoryRoadPokemonAttacksText, 58, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_3
    end

VictoryRoadFieldMon4Script:
	trainer CROBAT, FIELD_MON, EVENT_FIELD_MON_4, VictoryRoadPokemonAttacksText, 62, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_4
    end

VictoryRoadFieldMon5Script:
	trainer EXCADRILL, FIELD_MON, EVENT_FIELD_MON_5, VictoryRoadPokemonAttacksText, 63, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_5
    end

VictoryRoadFieldMon6Script:
	trainer STEELIX, FIELD_MON, EVENT_FIELD_MON_6, VictoryRoadPokemonAttacksText, 68, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_6
    end

VictoryRoadFieldMon7Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_7, VictoryRoadPokemonAttacksText, 72, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_7
    end

VictoryRoadFieldMon8Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_8, VictoryRoadPokemonAttacksText, 76, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_8
    end

VictoryRoadFieldMon9Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_9, VictoryRoadPokemonAttacksText, 77, 0, .script
.script
    disappear VICTORYROAD_FIELDMON_9
    end

VictoryRoadPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 67, VICTORY_ROAD_GATE, 5
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8
	warp_event 13,  5, ROUTE_23, 3

	def_coord_events
	coord_event 12,  8, SCENE_DEFAULT, VictoryRoadRivalLeft
	coord_event 13,  8, SCENE_DEFAULT, VictoryRoadRivalRight

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	def_object_events
	object_event 18, 13, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadLifeOrb, EVENT_VICTORY_ROAD_LIFE_ORB
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMFlamethrower, EVENT_VICTORY_ROAD_TM_FLAMETHROWER
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, VictoryRoadAmbrosia, EVENT_VICTORY_ROAD_AMBROSIA
	object_event 12, 38, SPRITE_MORTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderSolaireScript, -1
	object_event 19, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon1Script, EVENT_FIELD_MON_1
	object_event 12, 53, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER,3, VictoryRoadFieldMon2Script, EVENT_FIELD_MON_2
	object_event 12, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon3Script, EVENT_FIELD_MON_3
	object_event  6, 60, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon4Script, EVENT_FIELD_MON_4
	object_event  7, 35, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon5Script, EVENT_FIELD_MON_5
	object_event  6, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon6Script, EVENT_FIELD_MON_6
	object_event  3, 52, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon7Script, EVENT_FIELD_MON_7
	object_event 13, 35, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon8Script, EVENT_FIELD_MON_8
	object_event  3, 26, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, VictoryRoadFieldMon9Script, EVENT_FIELD_MON_9

