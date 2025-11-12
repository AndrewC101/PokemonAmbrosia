	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	;const ROUTE40_ROCK1
	;const ROUTE40_ROCK2
	;const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER
    const AREA_FIELDMON_1
    const AREA_FIELDMON_2
    const AREA_FIELDMON_3
    const AREA_FIELDMON_4
    const OLIVINE_BT_GUIDE

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
; Pokemon which always appear
    appear AREA_FIELDMON_1
    appear AREA_FIELDMON_2
    appear AREA_FIELDMON_3
    appear AREA_FIELDMON_4

	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	jumptextfaceplayer Route40PokefanMText

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "I love WATER"
	line "#mon."

	para "I love the"
	line "sea."

	para "You know..."

	para "I don't think"
	line "Hoenn rule would"
	cont "be so bad."
	done

SwimmermSimonBeatenText:
	text "I see you"
	line "disagree."
	done

SwimmermSimonAfterBattleText:
	text "You just have"
	line "to keep an open"
	cont "mind, man."
	done

SwimmermRandallSeenText:
	text "I don't have"
	line "SURF."

	para "I don't need it."

	para "Look at these"
	line "muscles."

	para "I could swim"
	line "for days."
	done

SwimmermRandallBeatenText:
	text "Look at these"
	line "muscles!"
	done

SwimmermRandallAfterBattleText:
	text "Swimming exercises"
	line "your entire body."

	para "Do you really"
	line "understand what"
	cont "I mean?"
	done

SwimmerfElaineSeenText:
	text "I believe my"
	line "STARMIE has"
	cont "the potential"
	cont "to be the"
	cont "strongest"
	cont "#mon in"
	cont "the world."

	para "I never lose."
	done

SwimmerfElaineBeatenText:
	text "I am missing"
	line "something."
	done

SwimmerfElaineAfterBattleText:
	text "I lost."

	para "But I will"
	line "become the best"
	cont "like no one"
	cont "ever was."
	done

SwimmerfPaulaSeenText:
	text "I visited Hoenn"
	line "once."

	para "It had such"
	line "beautiful water."

	para "I can't believe"
	line "they would attack"
	cont "anyone."
	done

SwimmerfPaulaBeatenText:
	text "Make it rain."
	done

SwimmerfPaulaAfterBattleText:
	text "Kanto is polluted"
	line "and filthy."

	para "I'm rooting"
	line "for Hoenn."
	done

Route40Lass1Text:
	text "CIANWOOD is"
	line "across the sea."

	para "I used to go"
	line "there but then"
	cont "a new little"
	cont "psychic girl"
	cont "started talking"
	cont "to me all the"
	cont "time."

	para "She is very"
	line "annoying!"
	done

Route40PokefanMText:
	text "Up ahead is the"
	line "BATTLE FRONTIER!"
	para "There is so"
	line "much to do there!"
	para "The BATTLE TOWER"
	line "is the most"
	cont "prestigious"
	cont "facility."
	para "It has two"
	line "difficulties that"
	cont "only CHAMPIONS can"
	cont "enter."
	para "I hear the reward"
	line "for one of them is"
	cont "99 RARE CANDY."
	para "And that's not"
	line "even the highest"
	cont "difficulty."
	para "Imagine what the"
	line "prize for that"
	cont "must be!"
	done

Route40Lass2Text:
	text "I've been winning"
	line "prizes in the"
	cont "BATTLE FRONTIER."

	para "I like the"
	line "BATTLE MIRROR."

	para "I get to fight"
	line "my beautiful self."
	done

Route40StandingYoungsterText:
	text "The sea is"
	line "dangerous."

	para "You need to"
	line "watch out for"
	cont "TENTACRUEL."

	para "They are weak to"
	line "DIG. Which still"
	cont "works in water"
	cont "somehow..."
	done

MeetMonicaText:
	text "MONICA: Glad to"
	line "meet you. I'm"

	para "MONICA of Monday."
	done

MonicaGivesGiftText:
	text "As a token of our"
	line "friendship, I have"
	cont "a gift for you!"
	done

MonicaGaveGiftText:
	text "MONICA: It's an"
	line "item that raises"

	para "the power of fly-"
	line "ing-type moves."

	para "You should equip a"
	line "bird #mon with"
	cont "that item."
	done

MonicaMondayText:
	text "MONICA: My broth-"
	line "ers and sisters"

	para "are all over the"
	line "place."

	para "See if you could"
	line "find them all!"
	done

MonicaNotMondayText:
	text "MONICA: I don't"
	line "think today is"
	cont "Monday. How sad…"
	done

Route40SignText:
	text "ROUTE 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done

AreaFieldMon1Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_1, AreaPokemonAttacksText, 41, 0, .script
.script
    disappear AREA_FIELDMON_1
    end

AreaFieldMon2Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_2, AreaPokemonAttacksText, 42, 0, .script
.script
    disappear AREA_FIELDMON_2
    end

AreaFieldMon3Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_3, AreaPokemonAttacksText, 44, 0, .script
.script
    disappear AREA_FIELDMON_3
    end

AreaPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

AreaFieldMon4Script:
	faceplayer
	cry POLIWHIRL
	pause 15
	loadwildmon POLIWHIRL, 30
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear AREA_FIELDMON_4
	end

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 11, 18, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	;object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	;object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	;object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 16,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 10, 21, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AreaFieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 30, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AreaFieldMon2Script, EVENT_FIELD_MON_2
	object_event 14, 32, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AreaFieldMon3Script, EVENT_FIELD_MON_3
	object_event 13, 12, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AreaFieldMon4Script, EVENT_FIELD_MON_4
	object_event 11,  0, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
