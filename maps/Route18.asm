	object_const_def
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2
	const ROUTE18_FIELDMON_1
    const ROUTE18_FIELDMON_2

Route18_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route18FieldMon

.Route18FieldMon:
; Pokemon which always appear
    appear ROUTE18_FIELDMON_1
    appear ROUTE18_FIELDMON_2
    endcallback

Route18FieldMon1Script:
	trainer URSARING, FIELD_MON, EVENT_FIELD_MON_1, Route18PokemonAttacksText, 71, 0, .script
.script
    disappear ROUTE18_FIELDMON_1
    end

Route18FieldMon2Script:
	trainer ARBOK, FIELD_MON, EVENT_FIELD_MON_2, Route18PokemonAttacksText, 72, 0, .script
.script
    disappear ROUTE18_FIELDMON_2
    end

Route18PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "I don't have a"
	line "bike so I used"
	cont "my #mon to"
	cont "Fly to Fuchsia."

	para "Bikes are for"
	line "the poor."
	done

BirdKeeperBorisBeatenText:
	text "Time to fly."
	done

BirdKeeperBorisAfterBattleText:
	text "Once you are"
	line "able to fly the"
	cont "world becomes"
	cont "small."
	done

BirdKeeperBobSeenText:
	text "I've looked all"
	line "over Kanto."

	para "Every little nook"
	line "and cave."

	para "I can't find the"
	line "fly TM."

	para "Where is it!?"
	done

BirdKeeperBobBeatenText:
	text "Where?"
	done

BirdKeeperBobAfterBattleText:
	text "Wait, so it's in"
	line "Johto!"

	para "Good thing my"
	line "#mon learnt"
	cont "it by level up."
	done

Route18SignText:
	text "Route 18"

	para "Celadon City -"
	line "Fuchsia City"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	def_object_events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
	object_event  7, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route18FieldMon1Script, EVENT_FIELD_MON_1
	object_event 12, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route18FieldMon2Script, EVENT_FIELD_MON_2
