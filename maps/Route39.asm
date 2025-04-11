	object_const_def
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_PSYCHIC_NORMAN
	;const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2
	const ROUTE39_FIELDMON_1
    const ROUTE39_FIELDMON_2
    const ROUTE39_FIELDMON_3
    const ROUTE39_FIELDMON_4
    const ROUTE39_FIELDMON_5
    const ROUTE39_FIELDMON_6
    const ROUTE39_FIELDMON_7
    const ROUTE39_FIELDMON_8

Route39_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route39FieldMon

.Route39FieldMon:
; Pokemon which always appear
    appear ROUTE39_FIELDMON_1
    appear ROUTE39_FIELDMON_3
    appear ROUTE39_FIELDMON_5
    appear ROUTE39_FIELDMON_6

; Pokemon that sometimes appear
    random 5
    ifequal 1, .spawn6
    disappear ROUTE39_FIELDMON_4
    sjump .mon7
.spawn6
    appear ROUTE39_FIELDMON_4

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE39_FIELDMON_8
    sjump .mon8
.spawn7
    appear ROUTE39_FIELDMON_8

.mon8
    random 5
    ifequal 1, .spawn8
    disappear ROUTE39_FIELDMON_7
    sjump .checkNight
.spawn8
    appear ROUTE39_FIELDMON_7

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end
    appear ROUTE39_FIELDMON_2
.end
    endcallback

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
    ; no rematch
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	trainer POKEFANF, JAIME, EVENT_BEAT_POKEFANF_JAIME, PokefanfJaimeSeenText, PokefanfJaimeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Mooo!"
	done

PokefanmDerekSeenText:
	text "When the dark"
	line "lord WALLACE"
	cont "arrives I"
	cont "shall be ready."

	para "I must retrieve"
	line "the Elder wand."
	done

PokefanmDerekBeatenText:
	text "My soul is split."
	done

PokefanMDerekText_NotBragging:
	text "I need to"
	line "learn a defense"
	cont "against"
	cont "AVADA KEDAVRA."
	done

PokefanfRuthSeenText:
	text "There is a"
	line "young summoner"
	cont "named YUNA in"
	cont "OLIVINE."

	para "One day she"
	line "may be able to"
	cont "defeat WALLACE."
	done

PokefanfRuthBeatenText:
	text "Stop."

	para "That is enough."
	done

PokefanfRuthAfterBattleText:
	text "You will do"
	line "what I failed"
	cont "to do and bring"
	cont "an end to war."
	done

PsychicNormanSeenText:
	text "Do you smell that?"
	para "Ahhhhh."
	para "That my friend..."
	para "Is pure MILTANK"
	line "manure."
	para "It heightens my"
	line "psychic power."
	done

PsychicNormanBeatenText:
	text "What's the test!"
	done

PsychicNormanAfterBattleText:
	text "You need to align,"
	line "plan, execute and"
	cont "verify."
	para "I couldn't imagine"
	line "not doing it!"
	done
	done

PokefanfJaimeSeenText:
	text "What!"

	para "Who's there!"

	para "Have you come"
	line "to take my little"
	cont "pretties away?"

	para "I won't let you!"

	para "Never!"
	done

PokefanfJaimeBeatenText:
	text "My poor little"
	line "darlings!"
	done

PokefanfJaimeAfterBattleText:
	text "Oh sorry my"
	line "dear."

	para "I get very"
	line "protective of"
	cont "my darling"
	cont "babies."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "TRAINER TIPS"

	para "There are three"
	line "ways a #MON"
	cont "can evolve."

	para "Through reaching"
	line "a required level."

	para "Through use of"
	line "an evolution"
	cont "stone."

	para "Or through"
	line "level up after"
	cont "developing love"
	cont "for its trainer."
	done

Route39FieldMon1Script:
	trainer TAUROS, FIELD_MON, EVENT_FIELD_MON_1, Route39PokemonAttacksText, 45, 0, .script
.script
    disappear ROUTE39_FIELDMON_1
    end

Route39FieldMon2Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_2, Route39PokemonAttacksText, 43, 0, .script
.script
    disappear ROUTE39_FIELDMON_2
    end

Route39FieldMon3Script:
	trainer URSARING, FIELD_MON, EVENT_FIELD_MON_3, Route39PokemonAttacksText, 44, 0, .script
.script
    disappear ROUTE39_FIELDMON_3
    end

Route39FieldMon4Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_4, Route39PokemonAttacksText, 46, 0, .script
.script
    disappear ROUTE39_FIELDMON_4
    end

Route39PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route39FieldMon5Script:
	faceplayer
	cry ARCANINE
	pause 15
	loadwildmon ARCANINE, 51
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE39_FIELDMON_5
	end

Route39FieldMon6Script:
	faceplayer
	cry MILTANK
	pause 15
	loadwildmon MILTANK, 28
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE39_FIELDMON_6
	end

Route39FieldMon7Script:
	faceplayer
	cry MILTANK
	pause 15
	loadwildmon MILTANK, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE39_FIELDMON_7
	end

Route39FieldMon8Script:
	faceplayer
	cry MAWILE
	pause 15
	loadwildmon MAWILE, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE39_FIELDMON_8
	end


Route39_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_39_BARN, 1
	warp_event 11,  3, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 31, BGEVENT_READ, Route39TrainerTips
	bg_event 15,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 21,  7, BGEVENT_READ, Route39Sign
	bg_event 11, 13, BGEVENT_ITEM, Route39HiddenNugget

	def_object_events
	object_event 16, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmDerek, -1
	object_event 17, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanfRuth, -1
	;object_event  9, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	;object_event 12, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	;object_event 10, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	;object_event 14, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 19,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	;object_event 15,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event 10, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanfJaime, -1

	object_event 2, 11, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route39FieldMon1Script, EVENT_FIELD_MON_1
	object_event  1, 20, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route39FieldMon2Script, EVENT_FIELD_MON_2
	object_event 4,  22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route39FieldMon3Script, EVENT_FIELD_MON_3
	object_event 11, 30, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route39FieldMon4Script, EVENT_FIELD_MON_4
	object_event 3,  14, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39FieldMon5Script, EVENT_FIELD_MON_5
	object_event 9,  12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39FieldMon6Script, EVENT_FIELD_MON_6
	object_event 13, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route39FieldMon7Script, EVENT_FIELD_MON_7
	object_event 10, 15, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route39FieldMon8Script, EVENT_FIELD_MON_8
