	object_const_def
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE
	const ROUTE33_FIELDMON_1
	const ROUTE33_FIELDMON_2
	const ROUTE33_FIELDMON_3
	const ROUTE33_FIELDMON_4
	const ROUTE33_FIELDMON_5

Route33_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route33FieldMon
    
.Route33FieldMon:
    appear ROUTE33_FIELDMON_1
    appear ROUTE33_FIELDMON_2
    appear ROUTE33_FIELDMON_3
    appear ROUTE33_FIELDMON_5

    random 5
    ifequal 1, .spawn
    disappear ROUTE33_FIELDMON_4
    sjump .end
.spawn
    appear ROUTE33_FIELDMON_4
.end
    endcallback

Route33LassScript:
	jumptextfaceplayer Route33LassText

TrainerHikerAnthony:
	trainer HIKER, ANTHONY2, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_HIKER_ANTHONY
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
	writetext AnthonyNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthony2BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkevent EVENT_BEAT_MORTY
	iftrue .LoadFight1
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	startbattle
	reloadmapafterbattle
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
	writetext AnthonyNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext AnthonyRematchText
	waitbutton
	nooryes
	iftrue .Rematch
	writetext AnthonyRematchRefuseText
	waitbutton
	closetext
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

AnthonyNumberAcceptedText:
	text "I'll get you"
	line "jacked in no time."
	done

AnthonyRematchText:
    text "How about a"
    line "rematch?"
    done

AnthonyRematchRefuseText:
    text "I'll make a man"
    line "out of you!"
    done

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "I came through"
	line "Union Cave."

	para "I am tough!"

	para "You can call me..."

	para "ANGUS CHAD MAXIMUS"
	done

HikerAnthony2BeatenText:
	text "You are more"
	line "tough than me!"
	done

HikerAnthony2AfterText:
	text "I thought I saw"
	line "some Team Rocket"
	cont "members around"
	cont "here."

	para "I'll show them"
	line "how tough I am!"
	done

HikerAnthonyDunsparceText:
	text "Hey, did you get a"
	line "Meowth?"

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
	cont "thing, so I came"
	cont "outside."
	done

Route33SignText:
	text "Route 33"
	done
	
Route33FieldMon3Script:
	trainer GOLBAT, FIELD_MON, EVENT_FIELD_MON_3, Route33PokemonAttacksText, 26, 0, .script
.script
    disappear ROUTE33_FIELDMON_3
    end
    
Route33PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route33FieldMon1Script:
	faceplayer
	cry SHROOMISH
	pause 15
	loadwildmon SHROOMISH, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE33_FIELDMON_1
	end
	
Route33FieldMon2Script:
	faceplayer
	cry SNOVER
	pause 15
	loadwildmon SNOVER, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE33_FIELDMON_2
    end

Route33FieldMon4Script:
	faceplayer
	cry MACHOP
	pause 15
	loadwildmon MACHOP, 14
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE33_FIELDMON_4
	end

Route33FieldMon5Script:
	faceplayer
	cry FERROSEED
	pause 15
	loadwildmon FERROSEED, 13
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE33_FIELDMON_5
	end

Route33_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  3, UNION_CAVE_1F, 3

	def_coord_events

	def_bg_events
	bg_event 12,  5, BGEVENT_READ, Route33Sign

	def_object_events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
	
	object_event 13, 7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route33FieldMon1Script, EVENT_FIELD_MON_1
	object_event  5, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route33FieldMon2Script, EVENT_FIELD_MON_2
	object_event  6,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route33FieldMon3Script, EVENT_FIELD_MON_3
	object_event 9, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route33FieldMon4Script, EVENT_FIELD_MON_4
	object_event  6,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route33FieldMon5Script, EVENT_FIELD_MON_5
