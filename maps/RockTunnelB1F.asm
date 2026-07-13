	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_MOLTRES
	const ROCKTUNNELB1F_FIELDMON_1
    const ROCKTUNNELB1F_FIELDMON_2
    const ROCKTUNNELB1F_FIELDMON_3
    const ROCKTUNNELB1F_FIELDMON_4
    const ROCKTUNNELB1F_FIELDMON_5
	const ROCKTUNNELB1F_FIREBREATHER_DICK
	const ROCKTUNNELB1F_FIREBREATHER_OTIS
	const ROCKTUNNELB1F_TM_FIRE_BLAST

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .fieldMon

.fieldMon
	setval WEATHER_SUN
	writemem wFieldWeather
    appear ROCKTUNNELB1F_FIELDMON_1
    appear ROCKTUNNELB1F_FIELDMON_2
    appear ROCKTUNNELB1F_FIELDMON_3
    appear ROCKTUNNELB1F_FIELDMON_4
    appear ROCKTUNNELB1F_FIELDMON_5
	endcallback

RockTunnelB1FIron:
	itemball AMBROSIA

RockTunnelB1FPPUp:
	itemball PP_MAX

RockTunnelB1FRevive:
	itemball MAX_REVIVE

RockTunnelB1FTMFireBlast:
	itemball TM_FIRE_BLAST

MoltresScript:
	cry MOLTRES
	pause 15
	checkevent EVENT_BEAT_CLAIR
	iffalse .baseLevel
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .postClairLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .postE4Level
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 80
    sjump .begin
.postE4Level
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 70
    sjump .begin
.postClairLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 60
    sjump .begin
.baseLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 50
.begin
	startbattle
	reloadmapafterbattle
    setval MOLTRES
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_MOLTRES
	disappear ROCKTUNNELB1F_MOLTRES
	end

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

TrainerFirebreatherDick:
	trainer FIREBREATHER, DICK, EVENT_BEAT_FIREBREATHER_DICK, FirebreatherDickSeenText, FirebreatherDickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherDickAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

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
	trainer MIMIKYU, FIELD_MON, EVENT_FIELD_MON_3, RockTunnelB1FPokemonAttacksText, 65, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_3
    end

RockTunnelB1FFieldMon4Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_4, RockTunnelB1FPokemonAttacksText, 66, 0, .script
.script
    disappear ROCKTUNNELB1F_FIELDMON_4
    end

RockTunnelB1FFieldMon5Script:
	faceplayer
	cry NOWN
	pause 15
	loadwildmon NOWN, 66
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROCKTUNNELB1F_FIELDMON_5
	end

RockTunnelB1FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

FirebreatherDickSeenText:
	text "My brother and I"
	line "are here to guard"
	cont "the divine flame."
	para "We can not let you"
	line "pass!"
	done

FirebreatherDickBeatenText:
	text "Impressive!"
	done

FirebreatherDickAfterBattleText:
	text "I was getting kind"
	line "of bored of"
	cont "standing here to"
	cont "be honest."
	done

FirebreatherOtisSeenText:
	text "Look brother!"
	para "We have a guest."
	para "You are unworthy"
	line "of the divine"
	cont "flame."
	para "You shall not"
	line "pass!"
	done

FirebreatherOtisBeatenText:
	text "You are not human!"
	done

FirebreatherOtisAfterBattleText:
	text "This is your fault"
	line "brother!"
	para "We had one job in"
	line "this world!"
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
	object_event  2, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 10, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event 14,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresScript, EVENT_CAUGHT_MOLTRES
	object_event 20, 32, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 19, 25, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 22, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event  7, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnelB1FFieldMon4Script, EVENT_FIELD_MON_4
	object_event 15, 17, SPRITE_NOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockTunnelB1FFieldMon5Script, EVENT_FIELD_MON_5
	object_event 13, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherDick, -1
	object_event 16, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FTMFireBlast, EVENT_ROCK_TUNNEL_B1F_TM_FIRE_BLAST
