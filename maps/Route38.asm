	object_const_def
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BEAUTY1
	const ROUTE38_SAILOR
	;const ROUTE38_FRUIT_TREE
	const ROUTE38_BEAUTY2
	const ROUTE38_FIELDMON_1
    const ROUTE38_FIELDMON_2
    const ROUTE38_FIELDMON_3
    const ROUTE38_FIELDMON_4
    const ROUTE38_FIELDMON_5
    const ROUTE38_FIELDMON_6
    const ROUTE38_FIELDMON_7
    const ROUTE38_FIELDMON_8

Route38_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route38FieldMon

.Route38FieldMon:
; Pokemon which always appear
    appear ROUTE38_FIELDMON_1
    appear ROUTE38_FIELDMON_3
    appear ROUTE38_FIELDMON_4
    appear ROUTE38_FIELDMON_7
    appear ROUTE38_FIELDMON_6

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn5
    disappear ROUTE38_FIELDMON_5
    sjump .mon8
.spawn5
    appear ROUTE38_FIELDMON_5

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE38_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE38_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE38_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE38_FIELDMON_7

.end
    endcallback

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftrue .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftrue .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1F
	sjump .AskForPhoneNumber

.SecondTimeAsking:
	scall .AskNumber2F
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .DeclinedPhoneNumber
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall .RegisteredPhoneNumber
	writetext DanaNumberAcceptedText
	waitbutton
	closetext
	end

.DanaRematch:
	scall .Rematch
	winlosstext LassDana1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkevent EVENT_BEAT_MORTY
	iftrue .LoadFight1
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	scall .Gift
	verbosegiveitem THUNDERSTONE
	iffalse .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	sjump .NumberAccepted

.NoRoomForThunderstone:
	sjump .PackFull

.AskNumber1F:
	jumpstd AskNumber1FScript
	end

.AskNumber2F:
	jumpstd AskNumber2FScript
	end

.RegisteredPhoneNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	writetext DanaNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext DanaRematchText
	waitbutton
	yesorno
	iftrue .DanaRematch
	writetext DanaRematchRefuseText
	waitbutton
	closetext
	end

.DeclinedPhoneNumber:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

DanaNumberAcceptedText:
	text "Next time a boy"
	line "gives me something"
	cont "after a battle,"
	cont "I'll share some!"

	para "Does that make me"
	line "bad?"
	done

DanaRematchText:
    text "How about a"
    line "rematch?"
    done

DanaRematchRefuseText:
    text "Do I look"
    line "bothered!?"
    done

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	writetext ChadNumberAcceptedText
	waitbutton
	closetext
	end

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkevent EVENT_BEAT_CHUCK
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	writetext ChadNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext ChadRematchText
	waitbutton
	yesorno
	iftrue .ChadRematch
	writetext ChadRematchRefuseText
	waitbutton
	closetext
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

ChadNumberAcceptedText:
	text "I will teach you"
	line "my ways."
	done

ChadRematchText:
    text "How about a"
    line "rematch?"
    done

ChadRematchRefuseText:
    text "That's it!"
    line "Be aloof."
    done

TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38FruitTree:
	fruittree FRUITTREE_ROUTE_38

BirdKeeperTobySeenText:
	text "I don't know"
	line "how my #mon"
	cont "evolve."

	para "I don't think"
	line "it's by level."
	done

BirdKeeperTobyBeatenText:
	text "Evolve!"
	done

BirdKeeperTobyAfterBattleText:
	text "Is it a stone?"

	para "Maybe happiness!"
	done

SchoolboyChad1SeenText:
	text "I am Chad."

	para "All girls are"
	line "my girlfriend."

	para "I'll show you"
	line "why."
	done

SchoolboyChad1BeatenText:
	text "I hope nobody"
	line "saw that."
	done

SchoolboyChadSoManyTestsText:
	text "It's a full"
	line "time job being"
	cont "a Chad."
	done

LassDana1SeenText:
	text "This kid called"
	line "Chad thinks I'm"
	cont "his girlfriend."

	para "Lots of boys"
	line "think that."

	para "I like it that"
	line "way."
	done

LassDana1BeatenText:
	text "You are strong."

	para "And cute."
	done

LassDanaMoomooMilkText:
	text "As long as the"
	line "boys never run"
	cont "into each other"
	cont "my secret should"
	cont "be safe."
	done

BeautyValerieSeenText:
	text "This is my"
	line "private"
	cont "training area."

	para "My #mon are"
	line "big and beautiful."
	done

BeautyValerieBeatenText:
	text "You villain!"
	done

BeautyValerieAfterBattleText:
	text "The secret of"
	line "my beauty is"
	cont "Moo Moo Milk"

	para "But it must be"
	line "fresh!"
	done

SailorHarrySeenText:
	text "I'm on leave"
	line "from Olivine."

	para "I'm heading to"
	line "Ecruteak to"
	cont "see some nice"
	cont "dancing girls."
	done

SailorHarryBeatenText:
	text "I'm glad the"
	line "guys didn't see"
	cont "this!"
	done

SailorHarryAfterBattleText:
	text "I am very"
	line "interested in"
	cont "culture."

	para "And pretty girls!"
	done

BeautyOliviaSeenText:
	text "My #mon and"
	line "I drink Moo"
	cont "Moo Milk every"
	cont "day to stay"
	cont "beautiful."
	done

BeautyOliviaBeatenText:
	text "We need moar!"
	done

BeautyOliviaAfterBattleText:
	text "I need to get"
	line "a Miltank for"
	cont "the freshest"
	cont "milk!"
	done

Route38SignText:
	text "Route 38"

	para "Olivine City -"
	line "Ecruteak City"
	done

Route38TrainerTipsText:
	text "Trainer Tips"

	para "If a #mon is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Just press the"
	line "B Button during"
	cont "evolution."

	para "That startles the"
	line "#mon and stops"
	cont "its evolution."
	done

Route38FieldMon1Script:
	trainer ELECTIVIRE, FIELD_MON, EVENT_FIELD_MON_1, Route38PokemonAttacksText, 42, 0, .script
.script
    disappear ROUTE38_FIELDMON_1
    end

Route38FieldMon2Script:
	trainer BISHARP, FIELD_MON, EVENT_FIELD_MON_2, Route38PokemonAttacksText, 43, 0, .script
.script
    disappear ROUTE38_FIELDMON_2
    end

Route38PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route38FieldMon3Script:
	faceplayer
	cry MILTANK
	pause 15
	loadwildmon MILTANK, 28
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE38_FIELDMON_3
	end

Route38FieldMon4Script:
	faceplayer
	cry MAGNETON
	pause 15
	loadwildmon MAGNEMITE, 24
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE38_FIELDMON_4
	end

Route38FieldMon5Script:
	faceplayer
	cry KLEFKI
	pause 15
	loadwildmon KLEFKI, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE38_FIELDMON_5
	end

Route38FieldMon6Script:
	faceplayer
	cry ELECTABUZZ
	pause 15
	loadwildmon ELECTABUZZ, 28
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE38_FIELDMON_6
	end

Route38FieldMon7Script:
	faceplayer
	cry FERROTHORN
	pause 15
	loadwildmon FERROTHORN, 30
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE38_FIELDMON_7
	end

Route38FieldMon8Script:
	faceplayer
	cry BELDUM
	pause 15
	loadwildmon BELDUM, 24
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE38_FIELDMON_8
	end

Route38_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  7, BGEVENT_READ, Route38Sign
	bg_event  5, 13, BGEVENT_READ, Route38TrainerTips

	def_object_events
	object_event  4,  1, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 24, 14, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyValerie, -1
	object_event 24,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	;object_event 12, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38FruitTree, -1
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyOlivia, -1

	object_event 31, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route38FieldMon1Script, EVENT_FIELD_MON_1
	object_event 10, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route38FieldMon2Script, EVENT_FIELD_MON_2
	object_event 6,  13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38FieldMon3Script, EVENT_FIELD_MON_3
	object_event 27,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route38FieldMon4Script, EVENT_FIELD_MON_4
	object_event 14,  10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route38FieldMon5Script, EVENT_FIELD_MON_5
	object_event 10,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route38FieldMon6Script, EVENT_FIELD_MON_6
	object_event 19, 2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route38FieldMon7Script, EVENT_FIELD_MON_7
	object_event 8,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route38FieldMon8Script, EVENT_FIELD_MON_8
