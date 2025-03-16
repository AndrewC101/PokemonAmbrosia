	object_const_def
	const MOUNTMORTAR1FINSIDE_BOULDER
	const MOUNTMORTAR1FINSIDE_POKE_BALL1
	const MOUNTMORTAR1FINSIDE_POKE_BALL2
	const MOUNTMORTAR1FINSIDE_POKE_BALL3
	const MOUNTMORTAR1FINSIDE_POKE_BALL4
	const MOUNTMORTAR1FINSIDE_POKE_BALL5
	const MOUNTMORTAR1FINSIDE_SUPER_NERD1
	const MOUNTMORTAR1FINSIDE_SUPER_NERD2
	const MOUNTMORTAR1FINSIDE_FIELDMON_1
    const MOUNTMORTAR1FINSIDE_FIELDMON_2
    const MOUNTMORTAR1FINSIDE_FIELDMON_3
    const MOUNTMORTAR1FINSIDE_FIELDMON_4
    const MOUNTMORTAR1FINSIDE_FIELDMON_5
    const MOUNTMORTAR1FINSIDE_FIELDMON_6
    const MOUNTMORTAR1FINSIDE_FIELDMON_7
    const MOUNTMORTAR1FINSIDE_FIELDMON_8


MountMortar1FInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MountMortar1FInsideFieldMon

.MountMortar1FInsideFieldMon:
; Pokemon which always appear
    appear MOUNTMORTAR1FINSIDE_FIELDMON_1
    appear MOUNTMORTAR1FINSIDE_FIELDMON_2
    appear MOUNTMORTAR1FINSIDE_FIELDMON_3
    appear MOUNTMORTAR1FINSIDE_FIELDMON_4
    appear MOUNTMORTAR1FINSIDE_FIELDMON_5

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_6
    sjump .mon7
.spawn6
    appear MOUNTMORTAR1FINSIDE_FIELDMON_6

.mon7
    random 2
    ifequal 1, .spawn7
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_7
    sjump .mon8
.spawn7
    appear MOUNTMORTAR1FINSIDE_FIELDMON_7

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_8
    sjump .end
.spawn8
    appear MOUNTMORTAR1FINSIDE_FIELDMON_8

.end
    endcallback

TrainerPokemaniacMiller:
	trainer POKEMANIAC, MILLER, EVENT_BEAT_POKEMANIAC_MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacMillerAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMarkus:
	trainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMarkusAfterBattleText
	waitbutton
	closetext
	end

MountMortar1FBoulder:
	jumpstd StrengthBoulderScript

MountMortar1FInsideEscapeRope:
	itemball HP_UP

MountMortar1FInsideMaxRevive:
	itemball FIRE_STONE

MountMortar1FInsideHyperPotion:
	itemball POKE_DOLL

MountMortar1FInsideMaxPotion:
	itemball MAX_REVIVE

MountMortar1FInsideNugget:
	itemball NUGGET

MountMortar1FInsideIron:
	itemball IRON

MountMortar1FInsideUltraBall:
	itemball ULTRA_BALL

MountMortar1FInsideHiddenMaxRepel:
	hiddenitem RARE_CANDY, EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL

PokemaniacMillerSeenText:
	text "There are others"
	line "in here."

	para "They say there is"
	line "a great warrior"
	cont "who was exiled"
	cont "for his strength"
	cont "somewhere deep,"
	cont "deep in here."
	done

PokemaniacMillerBeatenText:
	text "My royal family."
	done

PokemaniacMillerAfterBattleText:
	text "Exploring caves"
	line "is thrilling."

	para "You never know"
	line "what dangers there"
	cont "are."

    para "But I don't"
    line "know how to"
    cont "get deeper"
    cont "in here."
	done

SupernerdMarkusSeenText:
	text "I came here"
	line "with my buddy."

	para "There was a"
	line "cave in and we"
	cont "got separated."

	para "He is a gonner"
	line "for sure."

	para "I will truly"
	line "miss him."

	para "Now, how do I"
	line "get out of"
	cont "here?"
	done

SupernerdMarkusBeatenText:
	text "I'm too sad to"
	line "battle."
	done

SupernerdMarkusAfterBattleText:
	text "My buddy was"
	line "really strong."

	para "His name was HUGH."

	para "If you..."

	para "If you find his"
	line "body."

	para "Make it look"
	line "like I tried"
	cont "to help."

	para "Gotta go!"
	done

MountMortar1FInsideFieldMon1Script:
	trainer GOLBAT, FIELD_MON, EVENT_FIELD_MON_1, MountMortar1FInsidePokemonAttacksText, 50, 0, .script
.script
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_1
    end

MountMortar1FInsideFieldMon2Script:
	trainer GRAVELER, FIELD_MON, EVENT_FIELD_MON_2, MountMortar1FInsidePokemonAttacksText, 52, 0, .script
.script
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_2
    end

MountMortar1FInsideFieldMon3Script:
	trainer MACHOKE, FIELD_MON, EVENT_FIELD_MON_3, MountMortar1FInsidePokemonAttacksText, 51, 0, .script
.script
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_3
    end

MountMortar1FInsideFieldMon4Script:
	trainer GURDURR, FIELD_MON, EVENT_FIELD_MON_4, MountMortar1FInsidePokemonAttacksText, 51, 0, .script
.script
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_4
    end

MountMortar1FInsideFieldMon5Script:
	trainer ONIX, FIELD_MON, EVENT_FIELD_MON_5, MountMortar1FInsidePokemonAttacksText, 53, 0, .script
.script
    disappear MOUNTMORTAR1FINSIDE_FIELDMON_5
    end

MountMortar1FInsidePokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

MountMortar1FInsideFieldMon6Script:
	faceplayer
	cry CONKELDURR
	pause 15
	loadwildmon CONKELDURR, 52
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear MOUNTMORTAR1FINSIDE_FIELDMON_6
	end

MountMortar1FInsideFieldMon7Script:
	faceplayer
	cry MACHAMP
	pause 15
	loadwildmon MACHAMP, 52
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear MOUNTMORTAR1FINSIDE_FIELDMON_7
	end

MountMortar1FInsideFieldMon8Script:
	faceplayer
	cry ELECTABUZZ
	pause 15
	loadwildmon ELECTABUZZ, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear MOUNTMORTAR1FINSIDE_FIELDMON_8
	end

MountMortar1FInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 47, MOUNT_MORTAR_1F_OUTSIDE, 5
	warp_event 29, 47, MOUNT_MORTAR_1F_OUTSIDE, 6
	warp_event  5, 39, MOUNT_MORTAR_1F_OUTSIDE, 8
	warp_event 33, 41, MOUNT_MORTAR_1F_OUTSIDE, 9
	warp_event  3, 19, MOUNT_MORTAR_B1F, 1
	warp_event  9,  9, MOUNT_MORTAR_2F_INSIDE, 2

	def_coord_events

	def_bg_events
	bg_event 30, 11, BGEVENT_ITEM, MountMortar1FInsideHiddenMaxRepel

	def_object_events
	object_event 21, 43, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FBoulder, -1
	object_event 35, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideEscapeRope, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	object_event  8, 39, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideMaxRevive, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	object_event 10, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideHyperPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	object_event 22, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideMaxPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	object_event 35, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideNugget, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	object_event 33, 43, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacMiller, -1
	object_event 24, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	object_event 20, 45, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FInsideFieldMon1Script, EVENT_FIELD_MON_1
	object_event 16, 31, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FInsideFieldMon2Script, EVENT_FIELD_MON_2
	object_event 27, 40, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FInsideFieldMon3Script, EVENT_FIELD_MON_3
	object_event 21, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FInsideFieldMon4Script, EVENT_FIELD_MON_4
	object_event 12, 26, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FInsideFieldMon5Script, EVENT_FIELD_MON_5
	object_event 16, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideFieldMon6Script, EVENT_FIELD_MON_6
	object_event 31, 29, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideFieldMon7Script, EVENT_FIELD_MON_7
	object_event 31, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideFieldMon8Script, EVENT_FIELD_MON_8
