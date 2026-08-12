	object_const_def
	const ANCIENTHALLSTAIRS_FIELDMON_1
	const ANCIENTHALLSTAIRS_FIELDMON_2
	const ANCIENTHALLSTAIRS_FIELDMON_3
	const ANCIENTHALLSTAIRS_FIELDMON_4
	const ANCIENTHALLSTAIRS_FIELDMON_5
	const ANCIENTHALLSTAIRS_FIELDMON_6
	const ANCIENTHALLSTAIRS_FIELDMON_7
	const ANCIENTHALLSTAIRS_FIELDMON_8
	const ANCIENTHALLSTAIRS_FIELDMON_9
	const ANCIENTHALLSTAIRS_FIELDMON_10

AncientHallStairs_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .FieldMons

.FieldMons:
	appear ANCIENTHALLSTAIRS_FIELDMON_1
	appear ANCIENTHALLSTAIRS_FIELDMON_2
	appear ANCIENTHALLSTAIRS_FIELDMON_3
	appear ANCIENTHALLSTAIRS_FIELDMON_4
	appear ANCIENTHALLSTAIRS_FIELDMON_5
	appear ANCIENTHALLSTAIRS_FIELDMON_6
	appear ANCIENTHALLSTAIRS_FIELDMON_7
	appear ANCIENTHALLSTAIRS_FIELDMON_8
	appear ANCIENTHALLSTAIRS_FIELDMON_9
	appear ANCIENTHALLSTAIRS_FIELDMON_10
	endcallback

AncientHallStairsFieldMon1Script:
	trainer NOWN, FIELD_MON, EVENT_FIELD_MON_1, AncientHallStairsPokemonAttacksText, 90, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_1
	end

AncientHallStairsFieldMon2Script:
	trainer NOWN, FIELD_MON, EVENT_FIELD_MON_2, AncientHallStairsPokemonAttacksText, 90, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_2
	end

AncientHallStairsFieldMon3Script:
	trainer LUCARIO, FIELD_MON, EVENT_FIELD_MON_3, AncientHallStairsPokemonAttacksText, 79, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_3
	end

AncientHallStairsFieldMon4Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_4, AncientHallStairsPokemonAttacksText, 79, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_4
	end

AncientHallStairsFieldMon5Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_5, AncientHallStairsPokemonAttacksText, 78, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_5
	end

AncientHallStairsFieldMon6Script:
	trainer ALAKAZAM, FIELD_MON, EVENT_FIELD_MON_6, AncientHallStairsPokemonAttacksText, 78, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_6
	end

AncientHallStairsFieldMon7Script:
	trainer ESPEON, FIELD_MON, EVENT_FIELD_MON_7, AncientHallStairsPokemonAttacksText, 77, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_7
	end

AncientHallStairsFieldMon8Script:
	trainer UMBREON, FIELD_MON, EVENT_FIELD_MON_8, AncientHallStairsPokemonAttacksText, 77, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_8
	end

AncientHallStairsFieldMon9Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_9, AncientHallStairsPokemonAttacksText, 76, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_9
	end

AncientHallStairsFieldMon10Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_10, AncientHallStairsPokemonAttacksText, 76, 0, .script
.script
	disappear ANCIENTHALLSTAIRS_FIELDMON_10
	end

AncientHallStairsPokemonAttacksText:
	text "Guardian attacks!"
	done

AncientHallStairs_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 47, TOHJO_LAKE, 1
	warp_event  7,  5, ANCIENT_TEMPLE, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  6, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon1Script, EVENT_FIELD_MON_1
	object_event  5,  6, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon2Script, EVENT_FIELD_MON_2
	object_event  9,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon3Script, EVENT_FIELD_MON_3
	object_event  4, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon4Script, EVENT_FIELD_MON_4
	object_event  4, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon5Script, EVENT_FIELD_MON_5
	object_event  9, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon6Script, EVENT_FIELD_MON_6
	object_event  9, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon7Script, EVENT_FIELD_MON_7
	object_event  4, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon8Script, EVENT_FIELD_MON_8
	object_event  9, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon9Script, EVENT_FIELD_MON_9
	object_event  6, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, AncientHallStairsFieldMon10Script, EVENT_FIELD_MON_10
