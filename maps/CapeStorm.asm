	object_const_def
	const CAPE_STORM_FIELDMON_1
	const CAPE_STORM_FIELDMON_2
	const CAPE_STORM_FIELDMON_3
	const CAPE_STORM_FIELDMON_4
	const CAPE_STORM_FIELDMON_5
	const CAPE_STORM_FIELDMON_6
	const CAPE_STORM_FIELDMON_7
	const CAPE_STORM_FIELDMON_8

CapeStorm_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CapeStormFieldMon

.CapeStormFieldMon:
	appear CAPE_STORM_FIELDMON_1
	appear CAPE_STORM_FIELDMON_2
	appear CAPE_STORM_FIELDMON_3
	appear CAPE_STORM_FIELDMON_4
	appear CAPE_STORM_FIELDMON_5
	appear CAPE_STORM_FIELDMON_6
	appear CAPE_STORM_FIELDMON_7
	appear CAPE_STORM_FIELDMON_8
	endcallback

CapeStormFieldMon1Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_1, CapeStormPokemonAttacksText, 62, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_1
	end

CapeStormFieldMon2Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_2, CapeStormPokemonAttacksText, 63, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_2
	end

CapeStormFieldMon3Script:
	trainer POLIWRATH, FIELD_MON, EVENT_FIELD_MON_3, CapeStormPokemonAttacksText, 61, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_3
	end

CapeStormFieldMon4Script:
	trainer STARMIE, FIELD_MON, EVENT_FIELD_MON_4, CapeStormPokemonAttacksText, 64, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_4
	end

CapeStormFieldMon5Script:
	trainer CLOYSTER, FIELD_MON, EVENT_FIELD_MON_5, CapeStormPokemonAttacksText, 61, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_5
	end

CapeStormFieldMon6Script:
	trainer SLOWBRO, FIELD_MON, EVENT_FIELD_MON_6, CapeStormPokemonAttacksText, 63, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_6
	end

CapeStormFieldMon7Script:
	trainer KINGDRA, FIELD_MON, EVENT_FIELD_MON_7, CapeStormPokemonAttacksText, 65, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_7
	end

CapeStormFieldMon8Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_8, CapeStormPokemonAttacksText, 65, 0, .script
.script
	disappear CAPE_STORM_FIELDMON_8
	end

CapeStormPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done


CapeStorm_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 39, 14, CAPE_STORM_ROUTE_21_GATE, 1
	warp_event 39, 15, CAPE_STORM_ROUTE_21_GATE, 2
	warp_event 17,  9, OLD_LIGHTHOUSE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 19, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon1Script, EVENT_FIELD_MON_1
	object_event 32, 19, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon2Script, EVENT_FIELD_MON_2
	object_event  3,  8, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon3Script, EVENT_FIELD_MON_3
	object_event 22, 20, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon4Script, EVENT_FIELD_MON_4
	object_event 34,  4, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon5Script, EVENT_FIELD_MON_5
	object_event  7, 18, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon6Script, EVENT_FIELD_MON_6
	object_event  7,  2, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon7Script, EVENT_FIELD_MON_7
	object_event 27, 14, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CapeStormFieldMon8Script, EVENT_FIELD_MON_8
