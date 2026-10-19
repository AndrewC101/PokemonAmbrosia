	object_const_def
	const VICTORYROAD_RIVAL
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_INVADER
	const VICTORYROAD_PLAYER_1
	const VICTORYROAD_DARKQ
	const VICTORYROAD_MARECHAL
	const VICTORYROAD_NYUON321
	const VICTORYROAD_JO14

VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadNoop1Scene, SCENE_VICTORYROAD_RIVAL_BATTLE
	scene_script VictoryRoadNoop2Scene, SCENE_VICTORYROAD_NOOP

	def_callbacks

VictoryRoadNoop1Scene:
	end

VictoryRoadNoop2Scene:
	end

VictoryRoadRivalLeft:
	moveobject VICTORYROAD_RIVAL, 18, 11
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_RIVAL
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleApproachMovement1
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD_RIVAL
	setscene SCENE_VICTORYROAD_NOOP
	playmapmusic
	end

VictoryRoadRivalRight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_RIVAL
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleApproachMovement2
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleExitMovement2
	disappear VICTORYROAD_RIVAL
	setscene SCENE_VICTORYROAD_NOOP
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
	setlasttalked VICTORYROAD_RIVAL
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .hard1
	sjump .normal1
.hard1
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	sjump .battle1
.normal1
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
.battle1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_RIVAL
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .hard2
	sjump .normal2
.hard2
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	sjump .battle2
.normal2
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
.battle2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_RIVAL
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .hard3
	sjump .normal3
.hard3
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	sjump .battle3
.normal3
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
.battle3
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

TrainerSum1Script:
	trainer COOLTRAINERM, SUM1, EVENT_BEAT_SUM1, SumSeenText, SumBeatenText, SumVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext SumAfterBattleText
	waitbutton
	closetext
	end

SumSeenText:
	text "The Elite Four are"
	line "pretty tough but"
	cont "I'm ready for"
	cont "them!"
	done

SumBeatenText:
    text "You are ready"
    line "too!"
    done

SumVictoryText:
    text "You are not"
    line "ready."
    done

SumAfterBattleText:
	text "Even after you"
	line "beat the Elite"
	cont "Four..."
	para "There is a lot"
	line "more left to do."
	done

TrainerDarkQScript:
	trainer COOLTRAINERM, DARKQ, EVENT_BEAT_DARKQ, DarkQSeenText, DarkQBeatenText, DarkQBeatenText, .Script

.Script:
	endifjustbattled
	opentext
	writetext DarkQAfterBattleText
	waitbutton
	closetext
	end

DarkQSeenText:
	text "My #mon just"
	line "hit things."
	para "I don't waste"
	line "turns not doing"
	cont "damage!"
	done

DarkQBeatenText:
	text "Keep the pressure"
	line "up!"
	done

DarkQAfterBattleText:
	text "You just got to"
	line "keep attacking."
	para "That's the only"
	line "way to get through"
	cont "life."
	done

TrainerMarechalScript:
	trainer COOLTRAINERM, MARECHAL, EVENT_BEAT_MARECHAL, MarechalSeenText, MarechalBeatenText, MarechalBeatenText, .Script

.Script:
	endifjustbattled
	opentext
	writetext MarechalAfterBattleText
	waitbutton
	closetext
	end

MarechalSeenText:
	text "BONJOUR MON"
	line "BRAVE!"

	para "I'm playing on my"
	line "NumWorks"
	cont "Calculator."
	done

MarechalBeatenText:
	text "Fascinating"
	line "calculation."
	done

MarechalAfterBattleText:
	text "Yes, it's possible"
	line "to play on a"
	cont "NumWorks"
	cont "Calculator."
	done

TrainerNyuon321Script:
	trainer COOLTRAINERM, NYUON321, EVENT_BEAT_NYUON321, Nyuon321SeenText, Nyuon321BeatenText, Nyuon321BeatenText, .Script

.Script:
	endifjustbattled
	opentext
	writetext Nyuon321AfterBattleText
	waitbutton
	closetext
	end

Nyuon321SeenText:
	text "This isn't all"
	line "that difficult is"
	cont "it?"
	done

Nyuon321BeatenText:
	text "See what I mean."
	done

Nyuon321AfterBattleText:
	text "A few set up"
	line "sweepers."
	para "A few Focus"
	line "Sashes."
	para "You're good to go!"
	done

TrainerJo14Script:
	trainer COOLTRAINERM, JO14, EVENT_BEAT_JO14, Jo14SeenText, Jo14BeatenText, Jo14BeatenText, .Script

.Script:
	endifjustbattled
	opentext
	writetext Jo14AfterBattleText
	waitbutton
	closetext
	end

Jo14SeenText:
	text "I've done it!"
	para "I've come up with"
	line "the perfect team"
	cont "to beat Lance!"
	para "With this, I will"
	line "become the Johto"
	cont "Champion!"
	done

Jo14BeatenText:
	text "You are not my"
	line "target."
	done

Jo14AfterBattleText:
	text "It didn't work on"
	line "you but it will"
	cont "work on Lance."
	para "It will!"
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
	coord_event 12,  8, SCENE_VICTORYROAD_RIVAL_BATTLE, VictoryRoadRivalLeft
	coord_event 13,  8, SCENE_VICTORYROAD_RIVAL_BATTLE, VictoryRoadRivalRight

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	def_object_events
	object_event 18, 13, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadLifeOrb, EVENT_VICTORY_ROAD_LIFE_ORB
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMFlamethrower, EVENT_VICTORY_ROAD_TM_FLAMETHROWER
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_ITEMBALL, 0, VictoryRoadAmbrosia, EVENT_VICTORY_ROAD_AMBROSIA
	object_event 12, 38, SPRITE_MORTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderSolaireScript, -1
	object_event  3, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSum1Script, -1

	object_event  9, 56, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerDarkQScript, -1
	object_event 13, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerMarechalScript, -1
	object_event  6, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerNyuon321Script, -1
	object_event  6,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, TrainerJo14Script, -1
