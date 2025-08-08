	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_POKEFAN_M1
	const ROUTE9_FIELDMON_1
    const ROUTE9_FIELDMON_2
    const ROUTE9_FIELDMON_3
    const ROUTE9_FIELDMON_4
    const ROUTE9_FIELDMON_5
    const ROUTE9_FIELDMON_6
    const ROUTE9_FIELDMON_7
    const ROUTE9_FIELDMON_8

Route9_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route9FieldMon

.Route9FieldMon:
; Pokemon which always appear
    appear ROUTE9_FIELDMON_1
    appear ROUTE9_FIELDMON_3
    appear ROUTE9_FIELDMON_4

    random 2
    ifequal 1, .spawn5
    disappear ROUTE9_FIELDMON_5
    sjump .mon6
.spawn5
    appear ROUTE9_FIELDMON_5

.mon6
    random 2
    ifequal 1, .spawn7
    disappear ROUTE9_FIELDMON_6
    sjump .mon8
.spawn7
    appear ROUTE9_FIELDMON_6

.mon8
    random 2
    ifequal 1, .spawn8
    disappear ROUTE9_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE9_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE9_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE9_FIELDMON_7

.end
    endcallback

Route9FieldMon1Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_1, Route9PokemonAttacksText, 66, 0, .script
.script
    disappear ROUTE9_FIELDMON_1
    end

Route9FieldMon2Script:
	trainer ABOMASNOW, FIELD_MON, EVENT_FIELD_MON_2, Route9PokemonAttacksText, 63, 0, .script
.script
    disappear ROUTE9_FIELDMON_2
    end

Route9PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route9FieldMon3Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadwildmon AMPHAROS, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE9_FIELDMON_3
	end

Route9FieldMon4Script:
	faceplayer
	cry RAICHU
	pause 15
	loadwildmon RAICHU, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE9_FIELDMON_4
	end

Route9FieldMon5Script:
	faceplayer
	cry METANG
	pause 15
	loadwildmon METANG, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE9_FIELDMON_5
	end

Route9FieldMon6Script:
	faceplayer
	cry KLEFKI
	pause 15
	loadwildmon KLEFKI, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE9_FIELDMON_6
	end

Route9FieldMon7Script:
	faceplayer
	cry LOPUNNY
	pause 15
	loadwildmon LOPUNNY, 39
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE9_FIELDMON_7
	end

Route9FieldMon8Script:
	faceplayer
	cry FERROTHORN
	pause 15
	loadwildmon FERROTHORN, 43
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE9_FIELDMON_8
	end

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Turn back!"
	para "There is nothing"
	line "over here except"
	cont "pain."
	para "The way is shut."
	done

CamperDeanBeatenText:
	text "You poor fool."
	done

CamperDeanAfterBattleText:
	text "Ahead of here is"
	line "ROCK TUNNEL."
	para "It was made by"
	line "those who are"
	cont "dead."
	para "And the dead keep"
	line "it."
	done

PicnickerHeidiSeenText:
	text "Nobody ever comes"
	line "this way."
	para "It's a nice place"
	line "for a picnic."
	para "There's even a"
	line "#CENTER"
	cont "nearby."
	done

PicnickerHeidiBeatenText:
	text "Would you like"
	line "a sandwich?"
	done

PicnickerHeidiAfterBattleText:
	text "I have sandwiches,"
	line "sausage rolls and"
	cont "even some quiche."
	para "You don't like my"
	line "quiche?"
	done

HikerTimSeenText:
	text "There is a POWER"
	line "PLANT around here"
	cont "somewhere."
	para "I'm going to find"
	line "it an get me some"
	cont "fancy hardware!"
	done

HikerTimBeatenText:
	text "I could use a"
	line "side kick like"
	cont "you!"
	done

HikerTimAfterBattleText:
	text "The ELECTRIC"
	line "#mon at the"
	cont "POWER PLANT will"
	cont "be easy for me to"
	cont "deal with."
	done

Route9SignText:
	text "ROUTE 9"

	para "CERULEAN CITY -"
	line "ROCK TUNNEL"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 29,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route9FieldMon1Script, EVENT_FIELD_MON_1
	object_event 17, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route9FieldMon2Script, EVENT_FIELD_MON_2
	object_event 52, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route9FieldMon3Script, EVENT_FIELD_MON_3
	object_event 17,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route9FieldMon4Script, EVENT_FIELD_MON_4
	object_event 35,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route9FieldMon5Script, EVENT_FIELD_MON_5
	object_event 22,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route9FieldMon6Script, EVENT_FIELD_MON_6
	object_event 28, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route9FieldMon7Script, EVENT_FIELD_MON_7
	object_event 21,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route9FieldMon8Script, EVENT_FIELD_MON_8
