	object_const_def
	const WHIRLISLANDB1F_POKE_BALL1
	const WHIRLISLANDB1F_POKE_BALL2
	const WHIRLISLANDB1F_POKE_BALL3
	const WHIRLISLANDB1F_POKE_BALL4
	const WHIRLISLANDB1F_POKE_BALL5
	const WHIRLISLANDB1F_BOULDER
    const WHIRLISLANDB1F_FIELDMON_1
    const WHIRLISLANDB1F_FIELDMON_2
    const WHIRLISLANDB1F_FIELDMON_3
    const WHIRLISLANDB1F_FIELDMON_4
    const WHIRLISLANDB1F_FIELDMON_5
    const WHIRLISLANDB1F_FIELDMON_6
    const WHIRLISLANDB1F_FIELDMON_7
    const WHIRLISLANDB1F_FIELDMON_8

WhirlIslandB1F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .WhirlIslandB1FFieldMon

.WhirlIslandB1FFieldMon:
; Pokemon which always appear
    appear WHIRLISLANDB1F_FIELDMON_1
    appear WHIRLISLANDB1F_FIELDMON_2
    appear WHIRLISLANDB1F_FIELDMON_3
    appear WHIRLISLANDB1F_FIELDMON_4
    appear WHIRLISLANDB1F_FIELDMON_5

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear WHIRLISLANDB1F_FIELDMON_6
    sjump .mon7
.spawn6
    appear WHIRLISLANDB1F_FIELDMON_6

.mon7
    random 2
    ifequal 1, .spawn7
    disappear WHIRLISLANDB1F_FIELDMON_7
    sjump .mon8
.spawn7
    appear WHIRLISLANDB1F_FIELDMON_7

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear WHIRLISLANDB1F_FIELDMON_8
    sjump .end
.spawn8
    appear WHIRLISLANDB1F_FIELDMON_8

.end
    endcallback

WhirlIslandB1FFullRestore:
	itemball SHARP_BEAK

WhirlIslandB1FCarbos:
	itemball TWISTEDSPOON

WhirlIslandB1FCalcium:
	itemball CALCIUM

WhirlIslandB1FNugget:
	itemball TM_ICE_BEAM

WhirlIslandB1FEscapeRope:
	itemball RARE_CANDY

WhirlIslandB1FBoulder:
	jumpstd StrengthBoulderScript

WhirlIslandB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY

WhirlIslandB1FHiddenUltraBall:
	hiddenitem RARE_CANDY, EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL

WhirlIslandB1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE

WhirlIslandB1FFieldMon1Script:
	trainer GABITE, FIELD_MON, EVENT_FIELD_MON_1, WhirlIslandB1FPokemonAttacksText, 63, 0, .script
.script
    disappear WHIRLISLANDB1F_FIELDMON_1
    end

WhirlIslandB1FFieldMon2Script:
	trainer SHELGON, FIELD_MON, EVENT_FIELD_MON_2, WhirlIslandB1FPokemonAttacksText, 63, 0, .script
.script
    disappear WHIRLISLANDB1F_FIELDMON_2
    end

WhirlIslandB1FFieldMon3Script:
	trainer DRAGONAIR, FIELD_MON, EVENT_FIELD_MON_3, WhirlIslandB1FPokemonAttacksText, 63, 0, .script
.script
    disappear WHIRLISLANDB1F_FIELDMON_3
    end

WhirlIslandB1FFieldMon4Script:
	trainer ARCTOZOLT, FIELD_MON, EVENT_FIELD_MON_4, WhirlIslandB1FPokemonAttacksText, 65, 0, .script
.script
    disappear WHIRLISLANDB1F_FIELDMON_4
    end

WhirlIslandB1FFieldMon5Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_5, WhirlIslandB1FPokemonAttacksText, 65, 0, .script
.script
    disappear WHIRLISLANDB1F_FIELDMON_5
    end

WhirlIslandB1FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

WhirlIslandB1FFieldMon6Script:
	faceplayer
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 62
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear WHIRLISLANDB1F_FIELDMON_6
	end

WhirlIslandB1FFieldMon7Script:
	faceplayer
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 63
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear WHIRLISLANDB1F_FIELDMON_7
	end

WhirlIslandB1FFieldMon8Script:
	faceplayer
	cry FEEBAS
	pause 15
	loadwildmon FEEBAS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear WHIRLISLANDB1F_FIELDMON_8
	end

WhirlIslandB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, WHIRL_ISLAND_NW, 2
	warp_event 35,  3, WHIRL_ISLAND_NE, 2
	warp_event 29,  9, WHIRL_ISLAND_NE, 3
	warp_event  9, 31, WHIRL_ISLAND_SW, 3
	warp_event 23, 31, WHIRL_ISLAND_SW, 2
	warp_event 31, 29, WHIRL_ISLAND_SE, 2
	warp_event 25, 21, WHIRL_ISLAND_B2F, 1
	warp_event 13, 27, WHIRL_ISLAND_B2F, 2
	warp_event 17, 21, WHIRL_ISLAND_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 30,  4, BGEVENT_ITEM, WhirlIslandB1FHiddenRareCandy
	bg_event 36, 18, BGEVENT_ITEM, WhirlIslandB1FHiddenUltraBall
	bg_event  2, 23, BGEVENT_ITEM, WhirlIslandB1FHiddenFullRestore

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FFullRestore, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	object_event  2, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCarbos, EVENT_WHIRL_ISLAND_B1F_CARBOS
	object_event 33, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCalcium, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	object_event 17,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FNugget, EVENT_WHIRL_ISLAND_B1F_NUGGET
	object_event 19, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FEscapeRope, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
	object_event 23, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FBoulder, -1
	object_event 28, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, WhirlIslandB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 10, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, WhirlIslandB1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 13, 30, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, WhirlIslandB1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event  6, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, WhirlIslandB1FFieldMon4Script, EVENT_FIELD_MON_4
	object_event 29, 28, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, WhirlIslandB1FFieldMon5Script, EVENT_FIELD_MON_5
	object_event 33,  2, SPRITE_SLOWBRO, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FFieldMon6Script, EVENT_FIELD_MON_6
	object_event 20, 14, SPRITE_MILOTIC, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FFieldMon7Script, EVENT_FIELD_MON_7
	object_event 25, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FFieldMon8Script, EVENT_FIELD_MON_8
