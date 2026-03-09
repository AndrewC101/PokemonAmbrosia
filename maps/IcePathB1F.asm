	object_const_def
	const ICEPATHB1F_BOULDER1
	const ICEPATHB1F_BOULDER2
	const ICEPATHB1F_BOULDER3
	const ICEPATHB1F_BOULDER4
	const ICEPATHB1F_POKE_BALL
	const ICEPATHB1F_FIELDMON_1
    const ICEPATHB1F_FIELDMON_2
    const ICEPATHB1F_FIELDMON_3

IcePathB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, .SetUpStoneTable

.SetUpStoneTable:
	usestonetable .StoneTable
	setval WEATHER_HAIL
	writemem wFieldWeather
	appear ICEPATHB1F_FIELDMON_1
    appear ICEPATHB1F_FIELDMON_2
    appear ICEPATHB1F_FIELDMON_3
	endcallback

.StoneTable:
	stonetable 3, ICEPATHB1F_BOULDER1, .Boulder1
	stonetable 4, ICEPATHB1F_BOULDER2, .Boulder2
	stonetable 5, ICEPATHB1F_BOULDER3, .Boulder3
	stonetable 6, ICEPATHB1F_BOULDER4, .Boulder4
	db -1 ; end

.Boulder1:
	disappear ICEPATHB1F_BOULDER1
	clearevent EVENT_BOULDER_IN_ICE_PATH_1A
	sjump .FinishBoulder

.Boulder2:
	disappear ICEPATHB1F_BOULDER2
	clearevent EVENT_BOULDER_IN_ICE_PATH_2A
	sjump .FinishBoulder

.Boulder3:
	disappear ICEPATHB1F_BOULDER3
	clearevent EVENT_BOULDER_IN_ICE_PATH_3A
	sjump .FinishBoulder

.Boulder4:
	disappear ICEPATHB1F_BOULDER4
	clearevent EVENT_BOULDER_IN_ICE_PATH_4A
	sjump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	opentext
	writetext IcePathBoulderFellThroughText
	waitbutton
	closetext
	end

.BoulderFallsThrough:
	playsound SFX_STRENGTH
	earthquake 80
	end

IcePathB1FBoulder:
	jumpstd StrengthBoulderScript

IcePathB1FLeftovers:
	itemball LEFTOVERS

IcePathB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION

IcePathBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done

IcePathB1FieldMon1Script:
	trainer WEAVILE, FIELD_MON, EVENT_FIELD_MON_1, IcePathB1PokemonAttacksText, 62, 0, .script
.script
    disappear ICEPATHB1F_FIELDMON_1
    end

IcePathB1FieldMon2Script:
	trainer CROBAT, FIELD_MON, EVENT_FIELD_MON_2, IcePathB1PokemonAttacksText, 64, 0, .script
.script
    disappear ICEPATHB1F_FIELDMON_2
    end

IcePathB1PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

IcePathB1FieldMon3Script:
	faceplayer
	cry FRIGIBAX
	pause 15
	loadwildmon FRIGIBAX, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ICEPATHB1F_FIELDMON_3
	end

IcePathB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, ICE_PATH_1F, 3
	warp_event 17,  3, ICE_PATH_B2F_MAHOGANY_SIDE, 1
	warp_event 11,  2, ICE_PATH_B2F_MAHOGANY_SIDE, 3 ; hole
	warp_event  4,  7, ICE_PATH_B2F_MAHOGANY_SIDE, 4 ; hole
	warp_event  5, 12, ICE_PATH_B2F_MAHOGANY_SIDE, 5 ; hole
	warp_event 12, 13, ICE_PATH_B2F_MAHOGANY_SIDE, 6 ; hole
	warp_event  5, 25, ICE_PATH_1F, 4
	warp_event 11, 27, ICE_PATH_B2F_BLACKTHORN_SIDE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 30, BGEVENT_ITEM, IcePathB1FHiddenMaxPotion

	def_object_events
	object_event 11,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_1
	object_event  7,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_2
	object_event  8,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_3
	object_event 17,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	object_event  5, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FLeftovers, EVENT_ICE_PATH_B1F_LEFTOVERS
	object_event  8, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, IcePathB1FieldMon1Script, EVENT_FIELD_MON_1
	object_event 17, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, IcePathB1FieldMon2Script, EVENT_FIELD_MON_2
	object_event 18, 25, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathB1FieldMon3Script, EVENT_FIELD_MON_3
