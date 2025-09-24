	object_const_def
	const SILVERCAVEROOM1_POKE_BALL1
	const SILVERCAVEROOM1_POKE_BALL2
	const SILVERCAVEROOM1_POKE_BALL3
	const SILVERCAVEROOM1_POKE_BALL4
    const SILVERCAVEROOM1_FIELDMON_1
    const SILVERCAVEROOM1_FIELDMON_2
    const SILVERCAVEROOM1_FIELDMON_3
    const SILVERCAVEROOM1_FIELDMON_4
    const SILVERCAVEROOM1_FIELDMON_5
    const SILVERCAVEROOM1_FIELDMON_6
    const SILVERCAVEROOM1_FIELDMON_7
    const SILVERCAVEROOM1_FIELDMON_8
    const SILVERCAVEROOM1_FIELDMON_9
    const SILVERCAVEROOM1_FIELDMON_10

SilverCaveRoom1_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
	appear SILVERCAVEROOM1_FIELDMON_1
	appear SILVERCAVEROOM1_FIELDMON_2
	appear SILVERCAVEROOM1_FIELDMON_3
	appear SILVERCAVEROOM1_FIELDMON_4
	appear SILVERCAVEROOM1_FIELDMON_5
	appear SILVERCAVEROOM1_FIELDMON_6
	appear SILVERCAVEROOM1_FIELDMON_7
	appear SILVERCAVEROOM1_FIELDMON_8
	appear SILVERCAVEROOM1_FIELDMON_9
	appear SILVERCAVEROOM1_FIELDMON_10
	endcallback

SilverCaveRoom1FieldMon1Script:
	faceplayer
	cry HOUNDOOM
	pause 15
	loadwildmon HOUNDOOM, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SILVERCAVEROOM1_FIELDMON_1
	end

SilverCaveRoom1FieldMon2Script:
	faceplayer
	cry CHANDELURE
	pause 15
	loadwildmon CHANDELURE, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SILVERCAVEROOM1_FIELDMON_2
	end

SilverCaveRoom1FieldMon3Script:
	faceplayer
	cry SCIZOR
	pause 15
	loadwildmon SCIZOR, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear SILVERCAVEROOM1_FIELDMON_3
	end

SilverCaveRoom1FieldMon4Script:
	faceplayer
	cry AEGISLASH
	pause 15
	loadwildmon AEGISLASH, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear SILVERCAVEROOM1_FIELDMON_4
	end

SilverCaveRoom1FieldMon5Script:
	faceplayer
	cry EXCADRILL
	pause 15
	loadwildmon EXCADRILL, 74
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SILVERCAVEROOM1_FIELDMON_5
	end

SilverCaveRoom1FieldMon6Script:
	faceplayer
	cry AERODACTYL
	pause 15
	loadwildmon AERODACTYL, 75
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear SILVERCAVEROOM1_FIELDMON_6
	end

SilverCaveRoom1FieldMon7Script:
	faceplayer
	cry GENGAR
	pause 15
	loadwildmon GENGAR, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear SILVERCAVEROOM1_FIELDMON_7
	end

SilverCaveRoom1FieldMon8Script:
	faceplayer
	cry WEAVILE
	pause 15
	loadwildmon WEAVILE, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear SILVERCAVEROOM1_FIELDMON_8
	end

SilverCaveRoom1FieldMon9Script:
	faceplayer
	cry GLISCOR
	pause 15
	loadwildmon GLISCOR, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear SILVERCAVEROOM1_FIELDMON_9
	end

SilverCaveRoom1FieldMon10Script:
	faceplayer
	cry MAMOSWINE
	pause 15
	loadwildmon MAMOSWINE, 75
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear SILVERCAVEROOM1_FIELDMON_10
	end

SilverCaveRoom1MaxElixer:
	itemball RARE_CANDY

SilverCaveRoom1Protein:
	itemball RARE_CANDY

SilverCaveRoom1EscapeRope:
	itemball RARE_CANDY

SilverCaveRoom1UltraBall:
	itemball RARE_CANDY

SilverCaveRoom1HiddenDireHit:
	hiddenitem AMBROSIA, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_DIRE_HIT

SilverCaveRoom1HiddenUltraBall:
	hiddenitem AMBROSIA, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_ULTRA_BALL

SilverCaveRoom1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_OUTSIDE, 2
	warp_event 15,  1, SILVER_CAVE_ROOM_2, 1

	def_coord_events

	def_bg_events
	bg_event 16, 23, BGEVENT_ITEM, SilverCaveRoom1HiddenDireHit
	bg_event 17, 12, BGEVENT_ITEM, SilverCaveRoom1HiddenUltraBall

	def_object_events
	object_event  4,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1MaxElixer, EVENT_SILVER_CAVE_ROOM_1_MAX_ELIXER
	object_event 15, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1Protein, EVENT_SILVER_CAVE_ROOM_1_PROTEIN
	object_event  5, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1EscapeRope, EVENT_SILVER_CAVE_ROOM_1_ESCAPE_ROPE
	object_event  7, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1UltraBall, EVENT_SILVER_CAVE_ROOM_1_ULTRA_BALL
	object_event 14, 28, SPRITE_HOUNDOOM, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon1Script, EVENT_FIELD_MON_1
	object_event 10, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon2Script, EVENT_FIELD_MON_2
	object_event 11,  9, SPRITE_SCIZOR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon3Script, EVENT_FIELD_MON_3
	object_event 14,  3, SPRITE_AEGISLASH, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon4Script, EVENT_FIELD_MON_4
	object_event  2, 29, SPRITE_EXCADRILL, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon5Script, EVENT_FIELD_MON_5
	object_event 10,  3, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon6Script, EVENT_FIELD_MON_6
	object_event 16, 19, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon7Script, EVENT_FIELD_MON_7
	object_event 14, 26, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon8Script, EVENT_FIELD_MON_8
	object_event  2,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon9Script, EVENT_FIELD_MON_9
	object_event  4,  3, SPRITE_MAMOSWINE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom1FieldMon10Script, EVENT_FIELD_MON_10
