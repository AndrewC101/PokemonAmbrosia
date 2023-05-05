	object_const_def
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE
	const ROUTE33_FIELDMON_1
	const ROUTE33_FIELDMON_2
	const ROUTE33_FIELDMON_3
	const ROUTE33_FIELDMON_4

Route33_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route33FieldMon
    
.Route33FieldMon:
    appear ROUTE33_FIELDMON_1
    appear ROUTE33_FIELDMON_2

    random 8
    ifequal 1, .spawn
    disappear ROUTE33_FIELDMON_4
    sjump .checkNight
.spawn
    appear ROUTE33_FIELDMON_4
    
.checkNight
; Pokemon that only appear at night
    checktime NITE
	iffalse .end
    appear ROUTE33_FIELDMON_3
    disappear ROUTE33_FIELDMON_1
.end
    endcallback

Route33LassScript:
	jumptextfaceplayer Route33LassText

TrainerHikerAnthony:
	trainer HIKER, ANTHONY2, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_ANTHONY
	endifjustbattled
	opentext
	checkflag ENGINE_ANTHONY_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .Swarm
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue .NumberAccepted
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext HikerAnthony2AfterText
	promptbutton
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForPhoneNumber

.AskAgain:
	scall .AskNumber2
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthony2BeatenText, 0
	readmem wAnthonyFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	loadmem wAnthonyFightCount, 1
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	loadmem wAnthonyFightCount, 2
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	loadmem wAnthonyFightCount, 3
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	startbattle
	reloadmapafterbattle
	loadmem wAnthonyFightCount, 4
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer HIKER, ANTHONY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.Swarm:
	writetext HikerAnthonyDunsparceText
	waitbutton
	closetext
	end

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

.RematchStd:
	jumpstd RematchMScript
	end

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony2BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthony2AfterText:
	text "We HIKERS are at"
	line "our best in the"
	cont "mountains."
	done

HikerAnthonyDunsparceText:
	text "Hey, did you get a"
	line "DUNSPARCE?"

	para "I caught one too."

	para "Take a look at it"
	line "in the light. It's"
	cont "got a funny face!"
	done

Route33LassText:
	text "Pant, pant…"

	para "I finally got"
	line "through that cave."

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done

Route33SignText:
	text "ROUTE 33"
	done
	
Route33FieldMon3Script:
	trainer GOLBAT, FIELD_MON, EVENT_FIELD_MON_3, Route33PokemonAttacksText, 33, 0, .script
.script
    disappear ROUTE33_FIELDMON_3
    end
    
Route33PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route33FieldMon1Script:
	faceplayer
	cry COTTONEE
	pause 15
	loadwildmon COTTONEE, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE33_FIELDMON_1
	end
	
Route33FieldMon2Script:
	faceplayer
	cry DROWZEE
	pause 15
	loadwildmon DROWZEE, 16
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE33_FIELDMON_2
    end

Route33FieldMon4Script:
	faceplayer
	cry MACHOP
	pause 15
	loadwildmon MACHOP, 16
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE33_FIELDMON_4
	end

Route33_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  3, UNION_CAVE_1F, 3

	def_coord_events

	def_bg_events
	bg_event 12,  5, BGEVENT_READ, Route33Sign

	def_object_events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
	
	object_event 13, 7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route33FieldMon1Script, EVENT_FIELD_MON_1
	object_event  5, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route33FieldMon2Script, EVENT_FIELD_MON_2
	object_event 6, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route33FieldMon3Script, EVENT_FIELD_MON_3
	object_event 9, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route33FieldMon4Script, EVENT_FIELD_MON_4

