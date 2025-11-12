	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer FIREBREATHER, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FINISHED
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd TrashCanScript

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "Kanto is in war"
	line "time."

	para "All the trainers"
	line "are really strong."

	para "I'm going there to"
	line "hone my immense"
	cont "skills."
	done

CooltrainermSeanBeatenText:
	text "I wanted to win!"
	done

CooltrainermSeanAfterBattleText:
	text "I won't stand a"
	line "chance against the"
	cont "Kanto Gym Leaders."
	done

CooltrainerfCarolSeenText:
	text "I will hunt down"
	line "the Kanto"
	cont "COOLTRAINERS"
	cont "one by one."

	para "I will defeat"
	line "each of them."

	para "Until there is"
	line "only me left."
	done

CooltrainerfCarolBeatenText:
	text "I'm going to beat"
	line "you someday!"
	done

CooltrainerfCarolAfterBattleText:
	text "There can be only"
	line "one COOLTRAINER!"
	done

PokemaniacEthanSeenText:
	text "Erika."

	para "I'm going to"
	line "Celadon to find"
	cont "Gym Leader Erika."

	para "I will show her"
	line "I am the perfect"
	cont "man for her!"

	para "I will be her"
	line "little plant."
	done

PokemaniacEthanBeatenText:
	text "Erika!!"
	done

PokemaniacEthanAfterBattleText:
	text "I will be her"
	line "little plant."

	para "She will water me"
	line "and care for me."

	para "And I will grow"
	line "for her."
	done

HikerNolandSeenText:
	text "I have conquered"
	line "every cave in"
	cont "Johto."

	para "But the real"
	line "hard core hikers"
	cont "head to Rock"
	cont "Tunnel."

	para "I will be the"
	line "first to complete"
	cont "every cave in the"
	cont "world!"
	done

HikerNolandBeatenText:
	text "Caves are my"
	line "love, not battle."
	done

HikerNolandAfterBattleText:
	text "Many have never"
	line "returned from"
	cont "Rock Tunnel."

	para "It is said they"
	line "fall into a"
	cont "sleep and never"
	cont "wake."
	done

SailorStanlySeenText:
	text "Yeah, I'm a sail-"
	line "or, all right."

	para "Oh, oh he did,"
	line "did he."

    para "He better be"
    line "sorry."

    para "I don't accept!"

    para "I'm going to beat"
    line "you up and send"
    cont "you back to him."
	done

SailorStanlyBeatenText:
	text "Alright, alright."

	para "...."

	para "I'm sorry."
	done

SailorStanlyAfterBattleText:
	text "No hard feelings."

	para "All water under"
	line "the bridge."

	para "I'm heading back"
	line "to work."

	para "He is such a"
	line "silly goose."
	done

GentlemanEdwardSeenText:
	text "Ho ho ho."

	para "The business is"
	line "booming thanks to"
	cont "dear old Wallace."

	para "Kanto are willing"
	line "to take on huge"
	cont "debt to fund their"
	cont "war."

	para "I import rare"
	line "#mon from Johto"
	cont "and I do rather"
	cont "well for myself."
	done

GentlemanEdwardBeatenText:
	text "Jealousy is quite"
	line "unbecoming."
	done

GentlemanEdwardAfterBattleText:
	text "No matter who"
	line "wins the war I"
	cont "will grow my"
	cont "wealth regardless."

	para "That is the mark"
	line "of a masterful"
	cont "entrepreneur."
	done

BurglarCoreySeenText:
	text "Look at all the"
	line "rich fat persians"
	cont "on this ship."

	para "perfect little"
	line "starlys ripe"
	cont "for picken."

	para "You got some nice"
	line "gear on you!"
	done

BurglarCoreyBeatenText:
	text "I got your"
	line "Badges!"
	done

BurglarCoreyAfterBattleText:
	text "I didn't actually"
	line "steal your Badges."

	para "But you better"
	line "believe I want"
	cont "them!"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	def_object_events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
