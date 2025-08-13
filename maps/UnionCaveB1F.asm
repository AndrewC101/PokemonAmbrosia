	object_const_def
	const UNIONCAVEB1F_POKEFAN_M1
	const UNIONCAVEB1F_POKEFAN_M2
	const UNIONCAVEB1F_SUPER_NERD1
	const UNIONCAVEB1F_SUPER_NERD2
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2
	const UNIONCAVEB1F_FIELDMON_1
	const UNIONCAVEB1F_FIELDMON_2
	const UNIONCAVEB1F_FIELDMON_3
	const UNIONCAVEB1F_FIELDMON_4

UnionCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .UnionCaveB1FFieldMon
    
.UnionCaveB1FFieldMon:
    appear UNIONCAVEB1F_FIELDMON_1
    appear UNIONCAVEB1F_FIELDMON_2
    appear UNIONCAVEB1F_FIELDMON_3

    random 2
    ifequal 1, .spawn
    disappear UNIONCAVEB1F_FIELDMON_4
    sjump .end
.spawn
    appear UNIONCAVEB1F_FIELDMON_4
.end
    endcallback

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW2, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB1FTMSwift:
	itemball TM_HIDDEN_POWER

UnionCaveB1FXDefend:
	itemball MUSCLE_BAND

UnionCaveB1FBoulder:
	jumpstd StrengthBoulderScript

HikerPhillipSeenText:
	text "You won't get"
	line "the treasure"
	cont "before me!"
	done

HikerPhillipBeatenText:
	text "You'll never"
	line "find it."
	done

HikerPhillipAfterBattleText:
	text "Yes you go first."

	para "There are probably"
	line "ancient traps in"
	cont "place."
	done

HikerLeonardSeenText:
	text "My brother went"
	line "into ROCK TUNNEL"
	cont "in KANTO."

	para "He never came"
	line "back."

	para "When I am good"
	line "enough I will"
	cont "go find him."
	done

HikerLeonardBeatenText:
	text "You remind me"
	line "of my brother."
	done

HikerLeonardAfterBattleText:
	text "I am drawn to"
	line "the deep places"
	cont "of the world."
	done

PokemaniacAndrewSeenText:
	text "Can you see it?"
	done

PokemaniacAndrewBeatenText:
	text "I see it."
	done

PokemaniacAndrewAfterBattleText:
	text "xor a"
	line "and a"
	cont "jr z, .continue"

	para "...."

	para "What does it mean?"
	done

PokemaniacCalvinSeenText:
	text "I just barely"
	line "escaped."

	para "There is a sea"
	line "of monsters"
	cont "down there."

	para "I can't let"
	line "you pass."
	done

PokemaniacCalvinBeatenText:
	text "Fine go on"
	line "then."
	done

PokemaniacCalvinAfterBattleText:
	text "Be careful"
	line "down there."
	done
	
UnionCaveB1FFieldMon1Script:
	trainer GOLEM, FIELD_MON, EVENT_FIELD_MON_1, UnionCaveB1FPokemonAttacksText, 52, 0, .script
.script
    disappear UNIONCAVEB1F_FIELDMON_1
    end
    
UnionCaveB1FFieldMon2Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_2, UnionCaveB1FPokemonAttacksText, 70, 0, .script
.script
    disappear UNIONCAVEB1F_FIELDMON_2
    end
    
UnionCaveB1FFieldMon3Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_3, UnionCaveB1FPokemonAttacksText, 53, 0, .script
.script
    disappear UNIONCAVEB1F_FIELDMON_3
    end
    
UnionCaveB1FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
UnionCaveB1FFieldMon4Script:
	faceplayer
	cry GIBLE
	pause 15
	loadwildmon GIBLE, 15
    loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear UNIONCAVEB1F_FIELDMON_4
    end

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  7, 19, UNION_CAVE_1F, 1
	warp_event  3, 33, UNION_CAVE_1F, 2
	warp_event 17, 31, UNION_CAVE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerPhillip, -1
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerLeonard, -1
	object_event  5, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacAndrew, -1
	object_event 17, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FTMSwift, EVENT_UNION_CAVE_B1F_TM_SWIFT
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FXDefend, EVENT_UNION_CAVE_B1F_MUSCLE_BAND
	
	object_event 11, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCaveB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 10, 9, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCaveB1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 8, 31, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCaveB1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event 4, 22, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FFieldMon4Script, EVENT_FIELD_MON_4
