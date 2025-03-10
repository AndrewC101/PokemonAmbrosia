	object_const_def
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_FIELDMON_1
    const ROCKTUNNEL1F_FIELDMON_2
    const ROCKTUNNEL1F_FIELDMON_3
    const ROCKTUNNEL1F_FIELDMON_4
    const ROCKTUNNEL1F_FIELDMON_5

RockTunnel1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .RockTunnel1FFieldMon

.RockTunnel1FFieldMon:
; Pokemon which always appear
    appear ROCKTUNNEL1F_FIELDMON_1
    appear ROCKTUNNEL1F_FIELDMON_2
    appear ROCKTUNNEL1F_FIELDMON_3
    appear ROCKTUNNEL1F_FIELDMON_4
    appear ROCKTUNNEL1F_FIELDMON_5
    endcallback

RockTunnel1FFieldMon1Script:
	trainer GOLBAT, FIELD_MON, EVENT_FIELD_MON_1, RockTunnel1FPokemonAttacksText, 66, 0, .script
.script
    disappear ROCKTUNNEL1F_FIELDMON_1
    end

RockTunnel1FFieldMon2Script:
	trainer MIMIKYU, FIELD_MON, EVENT_FIELD_MON_2, RockTunnel1FPokemonAttacksText, 67, 0, .script
.script
    disappear ROCKTUNNEL1F_FIELDMON_2
    end

RockTunnel1FFieldMon3Script:
	trainer URSALUNA, FIELD_MON, EVENT_FIELD_MON_3, RockTunnel1FPokemonAttacksText, 68, 0, .script
.script
    disappear ROCKTUNNEL1F_FIELDMON_3
    end

RockTunnel1FFieldMon4Script:
	trainer URSALUNA_B, FIELD_MON, EVENT_FIELD_MON_4, RockTunnel1FPokemonAttacksText, 68, 0, .script
.script
    disappear ROCKTUNNEL1F_FIELDMON_4
    end

RockTunnel1FFieldMon5Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_5, RockTunnel1FPokemonAttacksText, 70, 0, .script
.script
    disappear ROCKTUNNEL1F_FIELDMON_5
    end

RockTunnel1FPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

RockTunnel1FElixer:
	itemball POKE_DOLL

RockTunnel1FTMSteelWing:
	itemball METAL_COAT

RockTunnel1FHiddenXAccuracy:
	hiddenitem PROTEIN, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem IRON, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND

RockTunnel1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  3, ROUTE_9, 1
	warp_event 11, 25, ROUTE_10_SOUTH, 1
	warp_event  5,  3, ROCK_TUNNEL_B1F, 3
	warp_event 15,  9, ROCK_TUNNEL_B1F, 2
	warp_event 27,  3, ROCK_TUNNEL_B1F, 4
	warp_event 27, 13, ROCK_TUNNEL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 24,  4, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 21, 15, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

	def_object_events
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
	object_event 11, 20, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnel1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 12, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnel1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 21,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnel1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event 27, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnel1FFieldMon4Script, EVENT_FIELD_MON_4
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, RockTunnel1FFieldMon5Script, EVENT_FIELD_MON_5
