	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL
	const ROUTE4_FIELDMON_1
    const ROUTE4_FIELDMON_2
    const ROUTE4_FIELDMON_3
    const ROUTE4_FIELDMON_4

Route4_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route4FieldMon

.Route4FieldMon:
; Pokemon which always appear
    appear ROUTE4_FIELDMON_1
    appear ROUTE4_FIELDMON_2
    appear ROUTE4_FIELDMON_3

    random 2
    ifequal 1, .spawn1
    disappear ROUTE4_FIELDMON_4
    sjump .end
.spawn1
    appear ROUTE4_FIELDMON_4
.end
    endcallback

Route4FieldMon1Script:
	trainer EXCADRILL, FIELD_MON, EVENT_FIELD_MON_1, Route4PokemonAttacksText, 38, 0, .script
.script
    disappear ROUTE4_FIELDMON_1
    end

Route4FieldMon2Script:
	trainer ARBOK, FIELD_MON, EVENT_FIELD_MON_2, Route4PokemonAttacksText, 45, 0, .script
.script
    disappear ROUTE4_FIELDMON_2
    end

Route4PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route4FieldMon3Script:
	faceplayer
	cry KADABRA
	pause 15
	loadwildmon KADABRA, 36
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE4_FIELDMON_3
	end

Route4FieldMon4Script:
	faceplayer
	cry BLASTOISE
	pause 15
	loadwildmon BLASTOISE, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE4_FIELDMON_4
	end

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "When Hoenn attacks"
	line "I'll use my birds"
	cont "to FLY people to"
	cont "Johto."
	para "At a small fee of"
	line "course."
	done

BirdKeeperHankBeatenText:
	text "You get a"
	line "discount."
	done

BirdKeeperHankAfterBattleText:
	text "I've heard legends"
	line "of huge bird"
	cont "#mon in Johto."
	para "I could make loads"
	line "of money with"
	cont "those!"
	done

PicnickerHopeSeenText:
	text "Did you come from"
	line "MT MOON?"
	para "Did you see that"
	line "girl Green."
	para "She is really"
	line "strong and pretty!"
	para "I am her biggest"
	line "fan!"
	done

PicnickerHopeBeatenText:
	text "You are strong"
	line "too!"
	done

PicnickerHopeAfterBattleText:
	text "Green is friends"
	line "with Blue and Red!"
	para "I wish she would"
	line "be friends with me"
	cont "too."
	done

PicnickerSharonSeenText:
	text "Oh..."
	para "Oh thank ARCEUS..."
	para "I went into the"
	line "cave ahead and"
	cont "nearly got lost."
	para "I would have died"
	line "for sure."
	done

PicnickerSharonBeatenText:
	text "I need to calm"
	line "down."
	done

PicnickerSharonAfterBattleText:
	text "I think I dropped"
	line "my LUCKY EGG in"
	cont "there somewhere!"
	done

MtMoonSquareSignText:
	text "Mt.Moon Square"

	para "Just go up the"
	line "stairs."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
	object_event 18, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route4FieldMon1Script, EVENT_FIELD_MON_1
	object_event 27, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route4FieldMon2Script, EVENT_FIELD_MON_2
	object_event 29, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route4FieldMon3Script, EVENT_FIELD_MON_3
	object_event 29,  2, SPRITE_BLASTOISE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route4FieldMon4Script, EVENT_FIELD_MON_4
