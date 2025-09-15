	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_DARKRAI
	const ROCKTUNNELB1F_FIELDMON_1
    const ROCKTUNNELB1F_FIELDMON_2
    const ROCKTUNNELB1F_FIELDMON_3
    const ROCKTUNNELB1F_FIELDMON_4
    const ROCKTUNNELB1F_FIELDMON_5

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .fieldMon

.fieldMon
    appear ROCKTUNNELB1F_FIELDMON_1
    appear ROCKTUNNELB1F_FIELDMON_2
    appear ROCKTUNNELB1F_FIELDMON_3
    appear ROCKTUNNELB1F_FIELDMON_4
    appear ROCKTUNNELB1F_FIELDMON_5
	endcallback

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_MAX

RockTunnelB1FRevive:
	itemball MAX_REVIVE

DarkraiScript:
	cry DARKRAI
	pause 15

	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DARKRAI, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DARKRAI, 60
    sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DARKRAI, 50
.begin
	startbattle
	reloadmapafterbattle
    setval DARKRAI
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_DARKRAI
    disappear ROCKTUNNELB1F_DARKRAI
    end

DarkraiCry:
    text "DARKRAI!"
    done

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

RockTunnelB1FFieldMon1Script:
	trainer UMBREON, FIELD_MON, EVENT_FIELD_MON_1, RockTunnelB1FPokemonAttacksText, 62, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_1
    end

RockTunnelB1FFieldMon2Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_2, RockTunnelB1FPokemonAttacksText, 63, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_2
    end

RockTunnelB1FFieldMon3Script:
	trainer WEAVILE, FIELD_MON, EVENT_FIELD_MON_3, RockTunnelB1FPokemonAttacksText, 65, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_3
    end

RockTunnelB1FFieldMon4Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_4, RockTunnelB1FPokemonAttacksText, 66, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_4
    end

RockTunnelB1FFieldMon5Script:
	trainer SPIRITOMB, FIELD_MON, EVENT_FIELD_MON_5, RockTunnelB1FPokemonAttacksText, 70, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_5
    end

RockTunnelB1FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, ROCK_TUNNEL_1F, 6
	warp_event 17, 17, ROCK_TUNNEL_1F, 4
	warp_event 23, 11, ROCK_TUNNEL_1F, 3
	warp_event 25, 31, ROCK_TUNNEL_1F, 5

	def_coord_events

	def_bg_events
	bg_event  4, 22, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	def_object_events
	object_event  7, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 10, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event 14,  6, SPRITE_DARKRAI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, DarkraiScript, EVENT_CAUGHT_DARKRAI
	object_event 20, 32, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 19, 25, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 22, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event  7, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon4Script, EVENT_FIELD_MON_4
	object_event 15, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon5Script, EVENT_FIELD_MON_5
