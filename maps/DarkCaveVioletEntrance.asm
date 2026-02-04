	object_const_def
	const DARKCAVEVIOLETENTRANCE_POKE_BALL1
	const DARKCAVEVIOLETENTRANCE_ROCK2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL3
	const DARKCAVEVIOLETENTRANCE_POKE_BALL4
	const DARKCAVEVIOLETENTRANCE_FIELDMON_1
	const DARKCAVEVIOLETENTRANCE_FIELDMON_2
    const DARKCAVEVIOLETENTRANCE_FIELDMON_3
    const DARKCAVEVIOLETENTRANCE_FIELDMON_4
    const DARKCAVEVIOLETENTRANCE_FIELDMON_5
    const DARKCAVEVIOLETENTRANCE_FIELDMON_6
    const DARKCAVEVIOLETENTRANCE_FIELDMON_7
    const DARKCAVEVIOLETENTRANCE_FIELDMON_8
    const DARKCAVEVIOLETENTRANCE_POKE_BALL5
    const DARKCAVEVIOLETENTRANCE_FIELDMON_9

DarkCaveVioletEntrance_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .DarkCaveVioletEntranceFieldMon

.DarkCaveVioletEntranceFieldMon:
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_1
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_2
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_3
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_4
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_5
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_6
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_8
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_9

    random 5
    ifequal 1, .spawn
    disappear DARKCAVEVIOLETENTRANCE_FIELDMON_7
    endcallback
.spawn
    appear DARKCAVEVIOLETENTRANCE_FIELDMON_7
    endcallback

DarkCaveVioletEntrancePotion:
	itemball RED_EYE_ORB

DarkCaveVioletEntranceFullHeal:
	itemball POKE_DOLL

DarkCaveVioletEntranceHyperPotion:
	itemball HYPER_POTION

DarkCaveVioletEntranceDireHit:
	itemball RARE_CANDY

DarkCaveVioletEntranceBlackGlasses:
	itemball BLACKGLASSES

DarkCaveVioletEntranceRock:
	jumpstd SmashRockScript

DarkCaveVioletEntranceHiddenElixer:
	hiddenitem ELIXER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER

DarkCaveVioletEntranceFieldMon1Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_1, DarkCaveVioletEntrancePokemonAttacksText, 52, 0, .script
.script
    disappear DARKCAVEVIOLETENTRANCE_FIELDMON_1
    end

DarkCaveVioletEntranceFieldMon2Script:
	trainer HOUNDOUR, FIELD_MON, EVENT_FIELD_MON_2, DarkCaveVioletEntrancePokemonAttacksText, 20, 0, .script
.script
    disappear DARKCAVEVIOLETENTRANCE_FIELDMON_2
    end

DarkCaveVioletEntranceFieldMon3Script:
	trainer UMBREON, FIELD_MON, EVENT_FIELD_MON_3, DarkCaveVioletEntrancePokemonAttacksText, 18, 0, .script
.script
    disappear DARKCAVEVIOLETENTRANCE_FIELDMON_3
    end

DarkCaveVioletEntranceFieldMon4Script:
	trainer MISDREAVUS, FIELD_MON, EVENT_FIELD_MON_4, DarkCaveVioletEntrancePokemonAttacksText, 15, 0, .script
.script
    disappear DARKCAVEVIOLETENTRANCE_FIELDMON_4
    end

DarkCaveVioletEntranceFieldMon5Script:
	faceplayer
	cry PAWNIARD
	pause 15
	loadwildmon PAWNIARD, 9
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear DARKCAVEVIOLETENTRANCE_FIELDMON_5
	end

DarkCaveVioletEntranceFieldMon6Script:
	faceplayer
	cry HOUNDOUR
	pause 15
	loadwildmon HOUNDOUR, 9
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear DARKCAVEVIOLETENTRANCE_FIELDMON_6
	end

DarkCaveVioletEntranceFieldMon7Script:
	faceplayer
	cry LARVITAR
	pause 15
	loadwildmon LARVITAR, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear DARKCAVEVIOLETENTRANCE_FIELDMON_7
	end

DarkCaveVioletEntranceFieldMon8Script:
	faceplayer
	cry DUNSPARCE
	pause 15
	loadwildmon DUNSPARCE, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear DARKCAVEVIOLETENTRANCE_FIELDMON_8
	end

DarkCaveVioletEntranceFieldMon9Script:
	faceplayer
	cry GLIGAR
	pause 15
	loadwildmon GLIGAR, 8
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear DARKCAVEVIOLETENTRANCE_FIELDMON_9
	end

DarkCaveVioletEntrancePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, ROUTE_31, 3
	warp_event 17,  1, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 35, 33, ROUTE_46, 3

	def_coord_events

	def_bg_events
	bg_event 26,  3, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenElixer

	def_object_events
	object_event  7, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntrancePotion, EVENT_DARK_CAVE_RED_EYE_ORB
	object_event 32,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 36, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceFullHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	object_event 35,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceHyperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	object_event 30, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceDireHit, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
	object_event  8,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveVioletEntranceFieldMon1Script, EVENT_FIELD_MON_1
	object_event 34, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveVioletEntranceFieldMon2Script, EVENT_FIELD_MON_2
	object_event 26,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveVioletEntranceFieldMon3Script, EVENT_FIELD_MON_3
	object_event 17,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveVioletEntranceFieldMon4Script, EVENT_FIELD_MON_4
	object_event 14, 28, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceFieldMon5Script, EVENT_FIELD_MON_5
	object_event 13, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceFieldMon6Script, EVENT_FIELD_MON_6
	object_event 16, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceFieldMon7Script, EVENT_FIELD_MON_7
	object_event 15, 18, SPRITE_DUNSPARCE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceFieldMon8Script, EVENT_FIELD_MON_8
	object_event 15, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceBlackGlasses, EVENT_DARK_CAVE_VIOLET_ENTRANCE_BLACK_GLASSES
	object_event 31, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceFieldMon9Script, EVENT_FIELD_MON_9
