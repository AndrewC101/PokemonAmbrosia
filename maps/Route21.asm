	object_const_def
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER
	const ROUTE21_FIELDMON_1
    const ROUTE21_FIELDMON_2
    const ROUTE21_FIELDMON_3
    const ROUTE21_FIELDMON_4
    const ROUTE21_FIELDMON_5
    const ROUTE21_FIELDMON_6
    const ROUTE21_FIELDMON_7
    const ROUTE21_FIELDMON_8

Route21_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route21FieldMon

.Route21FieldMon:
; Pokemon which always appear
    appear ROUTE21_FIELDMON_1
    appear ROUTE21_FIELDMON_2
    appear ROUTE21_FIELDMON_3
    appear ROUTE21_FIELDMON_4
    appear ROUTE21_FIELDMON_5

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE21_FIELDMON_6
    sjump .mon7
.spawn6
    appear ROUTE21_FIELDMON_6

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE21_FIELDMON_7
    sjump .mon8
.spawn7
    appear ROUTE21_FIELDMON_7

.mon8
    random 2
    ifequal 1, .spawn8
    disappear ROUTE21_FIELDMON_8
    sjump .end
.spawn8
    appear ROUTE21_FIELDMON_8

.end
    endcallback

Route21FieldMon1Script:
	faceplayer
	cry STARMIE
	pause 15
	loadwildmon STARMIE, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE21_FIELDMON_1
	end

Route21FieldMon2Script:
	faceplayer
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 47
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE21_FIELDMON_2
	end

Route21FieldMon3Script:
	faceplayer
	cry KINGDRA
	pause 15
	loadwildmon KINGDRA, 54
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE21_FIELDMON_3
	end

Route21FieldMon4Script:
	faceplayer
	cry LANTURN
	pause 15
	loadwildmon LANTURN, 48
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE21_FIELDMON_4
	end

Route21FieldMon5Script:
	faceplayer
	cry POLIWRATH
	pause 15
	loadwildmon POLIWRATH, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE21_FIELDMON_5
	end

Route21FieldMon6Script:
	faceplayer
	cry CHARMANDER
	pause 15
	loadwildmon CHARMANDER, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE21_FIELDMON_6
	end

Route21FieldMon7Script:
	faceplayer
	cry BULBASAUR
	pause 15
	loadwildmon BULBASAUR, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE21_FIELDMON_7
	end

Route21FieldMon8Script:
	faceplayer
	cry SQUIRTLE
	pause 15
	loadwildmon SQUIRTLE, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE21_FIELDMON_8
	end

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FISHER_ARNOLD
	iftrue .FightDone
.fight
	writetext FisherArnoldSeenText
	waitbutton
	closetext
	setval MUSIC_CHAMPION_DPPT
	writemem wBattleMusicOverride
	winlosstext FisherArnoldBeatenText, FisherArnoldWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer FISHER, ARNOLD
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FISHER_ARNOLD
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext FisherArnoldAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchFisherText
	nooryes
	iftrue .fight
	writetext RematchRefuseFisherText
	waitbutton
	closetext
	end
RematchFisherText:
    text "You once again"
    line "seek the ultimate"
    cont "challenge?"
    done
RematchRefuseFisherText:
    text "You are not yet"
    line "ready, young"
    cont "LARVESTA."
    done

SwimmermSethSeenText:
	text "I used to live in"
	line "CINNABAR, then the"
	cont "volcano blew the"
	cont "whole place up."
	para "But even with the"
	line "island gone, my"
	cont "memories are still"
	cont "here."
	done

SwimmermSethBeatenText:
	text "Boom!"
	done

SwimmermSethAfterBattleText:
	text "You think you're"
	line "tough."
	para "Then a volcano"
	line "rips your life"
	cont "apart."
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "I know I lost but"
	line "would you like to"
	cont "help me with the"
	cont "lotion anyway?"
	para "I really don't"
	line "want to burn."
	done

FisherArnoldSeenText:
	text "Hey kid, I'm sorry"
	line "to do this to you"
	cont "but you just found"
	cont "an optional boss."
	para "Really!"
	para "I'm going to have"
	line "to destroy you!"
	para "Forefathers one"
	line "and all..."
	para "Bare witness!"
	done

FisherArnoldWinsText:
	text "Rest now, dear"
	line "child."
	done

FisherArnoldBeatenText:
	text "I bow to you."
	done

FisherArnoldAfterBattleText:
	text "You have defeated"
	line "me, the most"
	cont "powerful trainer"
	cont "in all the world."
	para "You have truly"
	line "mastered the art"
	cont "of #mon!"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event  8, 15, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerFisherArnold, -1
	object_event  2, 22, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21FieldMon1Script, EVENT_FIELD_MON_1
	object_event 16, 15, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21FieldMon2Script, EVENT_FIELD_MON_2
	object_event  7, 25, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21FieldMon3Script, EVENT_FIELD_MON_3
	object_event 11, 29, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21FieldMon4Script, EVENT_FIELD_MON_4
	object_event 14, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route21FieldMon5Script, EVENT_FIELD_MON_5
	object_event 11,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route21FieldMon6Script, EVENT_FIELD_MON_6
	object_event 12,  5, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route21FieldMon7Script, EVENT_FIELD_MON_7
	object_event 13,  5, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route21FieldMon8Script, EVENT_FIELD_MON_8
