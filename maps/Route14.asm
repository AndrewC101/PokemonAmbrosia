	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	;const ROUTE14_KIM
	const ROUTE14_FIELDMON_1
    const ROUTE14_FIELDMON_2
    const ROUTE14_FIELDMON_3
    const ROUTE14_FIELDMON_4

Route14_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route14FieldMon

.Route14FieldMon:
; Pokemon which always appear
    appear ROUTE14_FIELDMON_1
    appear ROUTE14_FIELDMON_2
    appear ROUTE14_FIELDMON_3

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE14_FIELDMON_4
    sjump .end
.spawn6
    appear ROUTE14_FIELDMON_4
.end
    endcallback

Route14FieldMon1Script:
	trainer TAUROS, FIELD_MON, EVENT_FIELD_MON_1, Route14PokemonAttacksText, 61, 0, .script
.script
    disappear ROUTE14_FIELDMON_1
    end

Route14FieldMon2Script:
	trainer STARAPTOR, FIELD_MON, EVENT_FIELD_MON_2, Route14PokemonAttacksText, 65, 0, .script
.script
    disappear ROUTE14_FIELDMON_2
    end

Route14PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route14FieldMon3Script:
	faceplayer
	cry MILTANK
	pause 15
	loadwildmon MILTANK, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE14_FIELDMON_3
	end

Route14FieldMon4Script:
	faceplayer
	cry PORYGON2
	pause 15
	loadwildmon PORYGON2, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE14_FIELDMON_4
	end

;Kim:
;	faceplayer
;	opentext
;	trade NPC_TRADE_KIM
;	waitbutton
;	closetext
;	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "The crystals!"
	para "No..."
	para "Alternate"
	line "realities."
	para "Time travel."
	para "Dream worlds."
	para "And of course..."
	para "Optional bosses!"
	done

PokefanmCarterBeatenText:
	text "Game Over."
	done

PokefanmCarterAfterBattleText:
	text "There will never"
	line "be a final"
	cont "fantasy."
	para "Even after we are"
	line "gone."
	para "What we create"
	line "will live on in"
	cont "the fantasies of"
	cont "others."
	done

BirdKeeperRoySeenText:
	text "I love the smell"
	line "of Napalm in the"
	cont "morning!"
	para "We will rain hell"
	line "down on any HOENN"
	cont "scum!"
	done

BirdKeeperRoyBeatenText:
	text "My war heads are"
	line "ready."
	done

BirdKeeperRoyAfterBattleText:
	text "We will fight them"
	para "on the beaches, in"
	line "the sky, and on"
	cont "the battle field."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	;object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
	object_event  9, 28, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route14FieldMon1Script, EVENT_FIELD_MON_1
	object_event 15, 15, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route14FieldMon2Script, EVENT_FIELD_MON_2
	object_event  7, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route14FieldMon3Script, EVENT_FIELD_MON_3
	object_event  9,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route14FieldMon4Script, EVENT_FIELD_MON_4
