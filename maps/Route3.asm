	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2
	const ROUTE3_FIELDMON_1
    const ROUTE3_FIELDMON_2
    const ROUTE3_FIELDMON_3
    const ROUTE3_FIELDMON_4
    const ROUTE3_FIELDMON_5
    const ROUTE3_FIELDMON_6
    const ROUTE3_INVADER

Route3_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route3FieldMon

.Route3FieldMon:
; Pokemon which always appear
    appear ROUTE3_FIELDMON_1
    appear ROUTE3_FIELDMON_3
    appear ROUTE3_FIELDMON_4
    appear ROUTE3_FIELDMON_5
    appear ROUTE3_FIELDMON_6

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE3_FIELDMON_2
    sjump .checkNight
.spawn6
    appear ROUTE3_FIELDMON_2

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE3_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE3_FIELDMON_5

.end
    endcallback

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "I am the great"
	line "OTIS, fire"
	cont "breather"
	cont "extraordinaire!"
	para "No other fire"
	line "breather can match"
	cont "my style."
	para "Certainly not that"
	line "brutish BURT."
	done

FirebreatherOtisBeatenText:
	text "Behold my style!"
	done

FirebreatherOtisAfterBattleText:
	text "I hope you"
	line "appreciated the"
	cont "show."
	para "Those troglodytes"
	line "in PEWTER are too"
	cont "dim to do so."
	done

YoungsterWarrenSeenText:
	text "I need to get out"
	line "of PEWTER."
	para "I have no future"
	line "here."
	para "Where is a nice"
	line "remote place to"
	cont "go?"
	done

YoungsterWarrenBeatenText:
	text "Where are you"
	line "from?"
	done

YoungsterWarrenAfterBattleText:
	text "Maybe I'll go to"
	line "CINNABAR."
	para "It should be nice"
	line "and peaceful."
	done

YoungsterJimmySeenText:
	text "I managed to break"
	line "into the MUSEUM"
	cont "last week."
	para "I haven't been"
	line "able to sleep"
	cont "since."
	done

YoungsterJimmyBeatenText:
	text "Cough..."
	done

YoungsterJimmyAfterBattleText:
	text "I lost my lucky"
	line "shorts in the"
	cont "MUSEUM."
	para "They were comfy"
	line "and easy to wear."
	done

FirebreatherBurtSeenText:
	text "I want to put on a"
	line "show to cheer up"
	cont "the people of"
	cont "PEWTER."
	para "But that damn OTIS"
	line "is here first."
	done

FirebreatherBurtBeatenText:
	text "You have flare!"
	done

FirebreatherBurtAfterBattleText:
	text "OTIS only cares"
	line "about himself."
	para "I want to make"
	line "people warm and"
	cont "happy."
	done

Route3MtMoonSquareSignText:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

Route3FieldMon1Script:
	trainer NIDOQUEEN, FIELD_MON, EVENT_FIELD_MON_1, Route3PokemonAttacksText, 36, 0, .script
.script
    disappear ROUTE3_FIELDMON_1
    end

Route3FieldMon2Script:
	trainer NIDOKING, FIELD_MON, EVENT_FIELD_MON_2, Route3PokemonAttacksText, 38, 0, .script
.script
    disappear ROUTE3_FIELDMON_2
    end

Route3PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route3FieldMon3Script:
	faceplayer
	cry CHARMANDER
	pause 15
	loadwildmon CHARMANDER, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE3_FIELDMON_3
	end

Route3FieldMon4Script:
	faceplayer
	cry CLEFAIRY
	pause 15
	loadwildmon CLEFAIRY, 27
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE3_FIELDMON_4
	end

Route3FieldMon5Script:
	faceplayer
	cry LOPUNNY
	pause 15
	loadwildmon LOPUNNY, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE3_FIELDMON_5
	end

Route3FieldMon6Script:
	cry CLEFABLE
	pause 15
	loadwildmon CLEFABLE, 55
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE3_FIELDMON_6
	end

InvaderHavelScript:
	trainer INVADER, HAVEL, EVENT_BEAT_INVADER_HAVEL, InvaderHavelSeenText, InvaderHavelBeatenText, InvaderHavelVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderHavelAfterBattleText
	waitbutton
	closetext
	end

InvaderHavelSeenText:
    text "A war will come."

    para "Us against the"
    line "dragons of"
    cont "BLACKTHORN."

    para "Victory is not"
    line "important."

    para "What matters is"
    line "that we not lose."

    para "I am the rock"
    line "that will protect"
    cont "the realm."

    para "Crash upon me"
    line "and break."
	done

InvaderHavelVictoryText:
	text "Crash upon me"
	line "and break."
	done

InvaderHavelBeatenText:
	text "My shield is"
	line "shattered!"
	done

InvaderHavelAfterBattleText:
	text "I will protect"
	line "the realm."

	para "My shield shall"
	line "hold strong."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 47, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 28,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route3FieldMon1Script, EVENT_FIELD_MON_1
	object_event 39,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route3FieldMon2Script, EVENT_FIELD_MON_2
	object_event 16,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3FieldMon3Script, EVENT_FIELD_MON_3
	object_event 23, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3FieldMon4Script, EVENT_FIELD_MON_4
	object_event 37, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route3FieldMon5Script, EVENT_FIELD_MON_5
	object_event 50,  2, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3FieldMon6Script, EVENT_FIELD_MON_6
	object_event 50,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, InvaderHavelScript, -1

