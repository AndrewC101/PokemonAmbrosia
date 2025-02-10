	object_const_def
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3
	const ROUTE37_FIELDMON_1
    const ROUTE37_FIELDMON_2
    const ROUTE37_FIELDMON_3
    const ROUTE37_FIELDMON_4
    const ROUTE37_FIELDMON_5
    const ROUTE37_FIELDMON_6
    const ROUTE37_FIELDMON_7
    const ROUTE37_FIELDMON_8

Route37_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
; Pokemon which always appear
    appear ROUTE37_FIELDMON_1
    appear ROUTE37_FIELDMON_2
    appear ROUTE37_FIELDMON_3
    appear ROUTE37_FIELDMON_4
    appear ROUTE37_FIELDMON_5
    appear ROUTE37_FIELDMON_6
    appear ROUTE37_FIELDMON_7

; Pokemon that sometimes appear
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE37_FIELDMON_8
    sjump .sun
.spawn8
    appear ROUTE37_FIELDMON_8

.sun
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "My sister and I"
	line "died here many"
	cont "years ago."

	para "We are lonely."

	para "Join us."
	done

TwinsAnnandanne1BeatenText:
	text "Don't leave!"
	done

TwinsAnnandanne1AfterBattleText:
	text "If you die"
	line "here."

	para "You must come"
	line "play with us."
	done

TwinsAnnandanne2SeenText:
	text "It was my"
	line "sisters idea"
	cont "to come here."

	para "If I hadn't"
	line "listened to her"
	cont "I'd be an"
	cont "old woman now."

	para "I miss being"
	line "alive."
	done

TwinsAnnandanne2BeatenText:
	text "Don't leave!"
	done

TwinsAnnandanne2AfterBattleText:
	text "It's not so"
	line "bad being stuck"
	cont "here."

	para "It's cosy."
	done

PsychicGregSeenText:
	text "I must not fear."

	para "Fear is the"
	line "mind killer."

	para "Fear is the"
	line "little death"
	cont "that brings total"
	cont "obliteration."
	done

PsychicGregBeatenText:
	text "I will let it"
	line "pass over me."
	done

PsychicGregAfterBattleText:
	text "Where the fear"
	line "has gone there"
	cont "will be nothing."

	para "Only I will"
	line "remain."
	done

MeetSunnyText:
	text "SUNNY: Hi!"

	para "I'm SUNNY of"
	line "Sunday, meaning"
	cont "it's Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: That thing…"

	para "Um…"

	para "…What was it now?…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"
	cont "moves should hold"
	cont "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37FieldMon1Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_1, Route37PokemonAttacksText, 41, 3, .script
.script
    disappear ROUTE37_FIELDMON_1
    end

Route37FieldMon2Script:
	trainer MISMAGIUS, FIELD_MON, EVENT_FIELD_MON_2, Route37PokemonAttacksText, 36, 3, .script
.script
    disappear ROUTE37_FIELDMON_2
    end

Route37FieldMon3Script:
	trainer LAMPENT, FIELD_MON, EVENT_FIELD_MON_3, Route37PokemonAttacksText, 27, 3, .script
.script
    disappear ROUTE37_FIELDMON_3
    end

Route37FieldMon4Script:
	trainer DOUBLADE, FIELD_MON, EVENT_FIELD_MON_4, Route37PokemonAttacksText, 28, 3, .script
.script
    disappear ROUTE37_FIELDMON_4
    end

Route37PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route37FieldMon5Script:
	trainer ROTOM, FIELD_MON, EVENT_FIELD_MON_5, Route37PokemonAttacksText, 26, 3, .script
.script
    disappear ROUTE37_FIELDMON_5
    end

Route37FieldMon6Script:
	trainer POLTEGEIST, FIELD_MON, EVENT_FIELD_MON_6, Route37PokemonAttacksText, 26, 3, .script
.script
    disappear ROUTE37_FIELDMON_6
    end

Route37FieldMon7Script:
	trainer MISDREAVUS, FIELD_MON, EVENT_FIELD_MON_7, Route37PokemonAttacksText, 24, 3, .script
.script
    disappear ROUTE37_FIELDMON_7
    end

Route37FieldMon8Script:
	trainer HAUNTER, FIELD_MON, EVENT_FIELD_MON_8, Route37PokemonAttacksText, 24, 3, .script
.script
    disappear ROUTE37_FIELDMON_8
    end

Route37_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  0, ECRUTEAK_CITY, 16
	warp_event 11,  0, ECRUTEAK_CITY, 17
	warp_event 10, 27, ROUTE_36, 5
	warp_event 11, 27, ROUTE_36, 6

	def_coord_events

	def_bg_events
	bg_event  9,  3, BGEVENT_READ, Route37Sign
	bg_event  8, 12, BGEVENT_ITEM, Route37HiddenEther

	def_object_events
	object_event 10, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event 11, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event 10,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 17,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 20,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 20,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 19,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
	
	object_event 23, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Route37FieldMon1Script, EVENT_FIELD_MON_1
	object_event 27, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, Route37FieldMon2Script, EVENT_FIELD_MON_2
	object_event 8,  13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, Route37FieldMon3Script, EVENT_FIELD_MON_3
	object_event 18,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Route37FieldMon4Script, EVENT_FIELD_MON_4
	object_event 4,   5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, Route37FieldMon5Script, EVENT_FIELD_MON_5
	object_event 1,   9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, Route37FieldMon6Script, EVENT_FIELD_MON_6
	object_event 15, 14, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Route37FieldMon7Script, EVENT_FIELD_MON_7
	object_event 2,  19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_TRAINER, 2, Route37FieldMon8Script, EVENT_FIELD_MON_8
