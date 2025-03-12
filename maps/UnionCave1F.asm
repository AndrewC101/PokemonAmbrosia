	object_const_def
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4
	const UNIONCAVE1F_FIELDMON_1
	const UNIONCAVE1F_FIELDMON_2
	const UNIONCAVE1F_FIELDMON_3
	const UNIONCAVE1F_FIELDMON_4
	const UNIONCAVE1F_FIELDMON_5

UnionCave1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .UnionCave1FFieldMon
	
.UnionCave1FFieldMon:
; Pokemon which always appear
    appear UNIONCAVE1F_FIELDMON_1
    appear UNIONCAVE1F_FIELDMON_2
    appear UNIONCAVE1F_FIELDMON_3
    appear UNIONCAVE1F_FIELDMON_4
    appear UNIONCAVE1F_FIELDMON_5
    endcallback

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball HARD_STONE

UnionCave1FPotion:
	itemball POKE_DOLL

UnionCave1FAwakening:
	itemball REVIVE

UnionCave1FUnusedSign: ; unreferenced
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "I am sure there"
	line "is a treasure in"
	cont "the RUINS OF"
	cont "ALPH."

	para "DRILBUR and I"
	line "are going to dig"
	cont "underneath the"
	cont "ruins to find it!"
	done

HikerRussellBeatenText:
	text "Soon I'll be"
	line "rich!"
	done

HikerRussellAfterBattleText:
	text "Alright, back"
	line "to operation"
	cont "UNION STORM!"
	done

PokemaniacLarrySeenText:
	text "I lost it!"
	para "I lost my inner"
	line "strength, my"
	cont "HIDDEN POWER!"
	done

PokemaniacLarryBeatenText:
	text "I must face my"
	line "fears."
	done

PokemaniacLarryAfterBattleText:
	text "There is a super"
	line "strong GOLEM down"
	cont "there."
	para "I got out of"
	line "there!"
	done

HikerDanielSeenText:
	text "I went to ROCK"
	line "TUNNEL with my Dad"
	cont "years ago, I got"
	cont "lost and made it"
	cont "out but never"
	cont "found him."
	para "I must go back."
	done
	done

HikerDanielBeatenText:
	text "You'll cause a"
	line "cave in!"
	done

HikerDanielAfterBattleText:
	text "I am training in"
	line "cave exploring so"
	cont "I can explore ROCK"
	cont "TUNNEL in KANTO."
	done

FirebreatherBillSeenText:
	text "I am becoming one"
	line "with the rocks."
	para "I will become the"
	line "greatest ROCK"
	cont "trainer, like"
	cont "BROCK."
	done

FirebreatherBillBeatenText:
	text "My rocks!"
	done

FirebreatherBillAfterBattleText:
	text "ROCKS are eternal,"
	line "like my"
	cont "determination."
	done

FirebreatherRaySeenText:
	text "I'm meant to be"
	line "guiding people"
	cont "through this cave"
	cont "but everyone has"
	cont "wandered off."
	para "This is your"
	line "fault!"
	done

FirebreatherRayBeatenText:
	text "You are well"
	line "equipped."
	done

FirebreatherRayAfterBattleText:
	text "I thought this"
	line "would be an easy"
	cont "job."
	para "They don't pay me"
	line "enough for this."
	done

UnionCave1FUnusedSignText:
	text "UNION CAVE"
	done
	
UnionCave1FFieldMon1Script:
	trainer EXCADRILL, FIELD_MON, EVENT_FIELD_MON_1, UnionCave1FPokemonAttacksText, 31, 0, .script
.script
    disappear UNIONCAVE1F_FIELDMON_1
    end
    
UnionCave1FPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done
	
UnionCave1FFieldMon2Script:
	faceplayer
	cry DRILBUR
	pause 15
	loadwildmon DRILBUR, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear UNIONCAVE1F_FIELDMON_2
	end

UnionCave1FFieldMon3Script:
	faceplayer
	cry ONIX
	pause 15
	loadwildmon ONIX, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear UNIONCAVE1F_FIELDMON_3
	end
	
UnionCave1FFieldMon4Script:
	faceplayer
	cry GRAVELER
	pause 15
	loadwildmon GRAVELER, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear UNIONCAVE1F_FIELDMON_4
    end

UnionCave1FFieldMon5Script:
	faceplayer
	cry RHYHORN
	pause 15
	loadwildmon RHYHORN, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear UNIONCAVE1F_FIELDMON_5
    end

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 16, 27, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 16, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
	
	object_event 10, 31, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCave1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 5, 7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, UnionCave1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 14, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, UnionCave1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event 7, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, UnionCave1FFieldMon4Script, EVENT_FIELD_MON_4
	object_event 11, 32, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, UnionCave1FFieldMon5Script, EVENT_FIELD_MON_5
