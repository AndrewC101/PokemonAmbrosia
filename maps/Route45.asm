	object_const_def
	const ROUTE45_POKEFAN_M2
	const ROUTE45_POKEFAN_M3
	const ROUTE45_POKEFAN_M4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_YOUNGSTER
	const ROUTE45_FIELDMON_1
    const ROUTE45_FIELDMON_2
    const ROUTE45_FIELDMON_3
    const ROUTE45_FIELDMON_4
    const ROUTE45_FIELDMON_5
    const ROUTE45_FIELDMON_6
    const ROUTE45_FIELDMON_7

Route45_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
	setval WEATHER_SANDSTORM
	writemem wFieldWeather

; Pokemon which always appear
    appear ROUTE45_FIELDMON_1
    appear ROUTE45_FIELDMON_2
    appear ROUTE45_FIELDMON_3
    appear ROUTE45_FIELDMON_4
    appear ROUTE45_FIELDMON_5
    appear ROUTE45_FIELDMON_6
    appear ROUTE45_FIELDMON_7
    endcallback

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI3, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenjiSeenText, BlackbeltKenjiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	closetext
	end

.NoRoom:
	sjump Route45PackFullM

Route45AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route45AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route45RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route45NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route45PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route45RematchM:
	jumpstd RematchMScript
	end

Route45GiftM:
	jumpstd GiftMScript
	end

Route45PackFullM:
	jumpstd PackFullMScript
	end

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd PackFullMScript
	end

Route45RematchGiftM:
	jumpstd RematchGiftMScript
	end

TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue .NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall Route45RegisteredNumberM
	writetext ParryNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry3BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftrue .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftrue .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump .NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump .NumberAcceptedM

.NumberAcceptedM:
	writetext ParryNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext ParryRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext ParryRematchRefuseText
	waitbutton
	closetext
	end

ParryNumberAcceptedText:
	text "I call you when"
	line "I'm ready for a"
	cont "work out."
	done

ParryRematchText:
    text "How about a"
    line "rematch?"
    done

ParryRematchRefuseText:
    text "Don't skip leg"
    line "day."
    done

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRyan:
	trainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRyanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperQuentin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iftrue .Defeated
	writetext CamperQuentinSeenText
	waitbutton
	closetext
	winlosstext CamperQuentinBeatenText, 0
	loadtrainer CAMPER, QUENTIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_QUENTIN
	closetext
	end

.Defeated:
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end

Route45DummyScript: ; unreferenced
	writetext Route45DummyText
	waitbutton
	closetext
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45Nugget:
	itemball NUGGET

Route45RockSlide:
	itemball TM_ROCK_SLIDE

Route45Elixer:
	itemball FULL_RESTORE

Route45DoubleEdge:
	itemball TM_DOUBLE_EDGE

Route45HiddenPpUp:
	hiddenitem RARE_CANDY, EVENT_ROUTE_45_HIDDEN_PP_UP

HikerMichaelSeenText:
	text "I was doing a"
	line "spot of urban"
	cont "exploring around"
	cont "an old house"
	cont "below here."

	para "I thought I saw"
	line "a TM."

	para "Then a huge and"
	line "rapid Garchomp"
	cont "attacked me."

	para "I barely"
	line "escaped."
	done

HikerMichaelBeatenText:
	text "Why do we"
	line "battle."
	done

HikerMichaelAfterBattleText:
	text "Watch out down"
	line "there kid."

	para "That Garchomp"
	line "isn't messing"
	cont "around."
	done

HikerParry3SeenText:
	text "I have spent"
	line "my years wandering"
	cont "in the mountains"
	cont "with my #mon."

	para "My legs have"
	line "grown thick and"
	cont "powerful."

	para "Your legs look"
	line "awful skinny from"
	cont "where I'm"
	cont "standing."
	done

HikerParry3BeatenText:
	text "Aww my knees"
	line "have buckled."
	done

HikerParryAfterBattleText:
	text "If you keep"
	line "climbing these"
	cont "mountains"
	cont "you'll get big"
	cont "muscular legs."

	para "Not as big as"
	line "mine mind you."
	done

HikerTimothySeenText:
	text "Everyone knows"
	line "the volcano that"
	cont "destroyed Cinnabar"
	cont "was the doing of"
	cont "Hoenn."

	para "We must train!"

	para "Maybe I can"
	line "beat a legendary"
	cont "#mon."
	done

HikerTimothyBeatenText:
	text "Train with me!"
	done

HikerTimothyAfterBattleText:
	text "I need to get"
	line "stronger!"

	para "If I fought a"
	line "legendary #mon"
	cont "right now I"
	cont "don't think I"
	cont "would win."
	done

HikerParryGivesIronText:
	text "Here this will"
	line "help toughen"
	cont "those legs."
	done

BlackbeltKenjiSeenText:
	text "I used to be"
	line "part of a dojo"
	cont "in Saffron."

	para "I moved to the"
	line "Cianwood dojo"
	cont "but they were"
	cont "too soft."

	para "I train now in"
	line "these mountains."

	para "Always searching"
	line "for my old master."
	done

BlackbeltKenjiBeatenText:
	text "Matte!"
	done

BlackbeltKenjiAfterBattleText:
	text "My master KIYO"
	line "moved to Johto."

	para "I am searching"
	line "for him."

	para "I know he"
	line "would train in"
	cont "the mountains"
	cont "or perhaps a"
	cont "cave."
	done

BlackbeltKenjiMorningText:
	text "The morning air"
	line "speaks to me"
	cont "of stories of"
	cont "the past."

	para "We must let go"
	line "of regret and"
	cont "face a new day."
	done

BlackbeltKenjiNightText:
	text "The still night"
	line "whispers to me."

	para "It tells me to"
	line "stop fighting"
	cont "and rest."

	para "Night will set"
	line "upon all our"
	cont "lives."

	para "May we greet it"
	line "with pride and"
	cont "dignity."
	done

CooltrainermRyanSeenText:
	text "You know maybe"
	line "I'm the only"
	cont "person who"
	cont "thinks this."

	para "But Dragon"
	line "#mon are kind"
	cont "of overrated."

	para "They all look"
	line "the same, just"
	cont "a stereotype of"
	cont "cool."

	para "I'll show you"
	line "some actually"
	cont "cool #mon."
	done

CooltrainermRyanBeatenText:
	text "You are pretty"
	line "cool too."
	done

CooltrainermRyanAfterBattleText:
	text "Your #mon"
	line "are cool and all."

	para "I just can't"
	line "stand all the"
	cont "Dragon simps"
	cont "around here."
	done

CooltrainerfKellySeenText:
	text "Everyone keeps"
	line "talking about how"
	cont "Dark Cave contains"
	cont "pure evil."

	para "I'm going to"
	line "explore it!"

	para "My team is"
	line "built to take"
	cont "on the challenge."
	done

CooltrainerfKellyBeatenText:
	text "That was good"
	line "practice."
	done

CooltrainerfKellyAfterBattleText:
	text "I heard a girl"
	line "got lost in"
	cont "Dark Cave for"
	cont "days."

	para "Everyone knew"
	line "she was dead"
	cont "but then she"
	cont "appeared and"
	cont "she was fine."

	para "I think Karen"
	line "was her name."
	done

Route45DummyText:
	text "I'm really, really"
	line "tough!"

	para "Is there anywhere"
	line "I can prove how"
	cont "tough I really am?"
	done

CamperQuentinSeenText:
	text "I will set up"
	line "camp anywhere."

	para "I fear no man"
	line "nor no #mon."

	para "I don't fear"
	line "no Hoenn army"
	cont "nor no soldier."

	para "My girlfriend"
	line "though."

	para "Aye I fear"
	line "her I do."

	para "Is why I camp"
	line "so much."
	done

CamperQuentinBeatenText:
	text "I'm not as"
	line "brave as I"
	cont "thought."
	done

CamperQuentinAfterBattleText:
	text "I fear that Dark"
	line "Cave though."

	para "And Route 37"
	line "I fear there."

	para "And Battle Tower"
	line "I fear that too."
	done

Route45SignText:
	text "Route 45"
	line "MOUNTAIN RD. AHEAD"
	done

Route45FieldMon1Script:
	trainer EXCADRILL, FIELD_MON, EVENT_FIELD_MON_1, Route45PokemonAttacksText, 56, 0, .script
.script
    disappear ROUTE45_FIELDMON_1
    end

Route45FieldMon2Script:
	trainer FERROTHORN, FIELD_MON, EVENT_FIELD_MON_2, Route45PokemonAttacksText, 57, 0, .script
.script
    disappear ROUTE45_FIELDMON_2
    end

Route45FieldMon3Script:
	trainer SKARMORY, FIELD_MON, EVENT_FIELD_MON_3, Route45PokemonAttacksText, 58, 0, .script
.script
    disappear ROUTE45_FIELDMON_3
    end

Route45FieldMon4Script:
	trainer GOLEM, FIELD_MON, EVENT_FIELD_MON_4, Route45PokemonAttacksText, 57, 0, .script
.script
    disappear ROUTE45_FIELDMON_4
    end

Route45FieldMon5Script:
	trainer GLISCOR, FIELD_MON, EVENT_FIELD_MON_5, Route45PokemonAttacksText, 58, 0, .script
.script
    disappear ROUTE45_FIELDMON_5
    end

Route45FieldMon6Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_6, Route45PokemonAttacksText, 68, 0, .script
.script
    disappear ROUTE45_FIELDMON_6
    end

Route45FieldMon7Script:
	faceplayer
	cry PONYTA
	pause 15
	loadwildmon PONYTA, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE45_FIELDMON_7
	end

Route45PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  4, BGEVENT_READ, Route45Sign
	bg_event 13, 82, BGEVENT_ITEM, Route45HiddenPpUp

	def_object_events
	object_event 15, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event  5, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event  9, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTimothy, -1
	object_event 11, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 16, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermRyan, -1
	object_event  5, 36, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfKelly, -1
	object_event 10, 84, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45RockSlide, EVENT_ROUTE_45_ROCK_SLIDE
	object_event 16, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45DoubleEdge, EVENT_ROUTE_45_DOUBLE_EDGE
	object_event  4, 70, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerCamperQuentin, -1

	object_event 10,  6, SPRITE_EXCADRILL, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, Route45FieldMon1Script, EVENT_FIELD_MON_1
	object_event 11, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route45FieldMon2Script, EVENT_FIELD_MON_2
	object_event 10, 40, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route45FieldMon3Script, EVENT_FIELD_MON_3
	object_event 12, 56, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route45FieldMon4Script, EVENT_FIELD_MON_4
	object_event 6,  72, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route45FieldMon5Script, EVENT_FIELD_MON_5
	object_event 14, 82, SPRITE_GARCHOMP, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, Route45FieldMon6Script, EVENT_FIELD_MON_6
	object_event  8, 86, SPRITE_PONYTA, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route45FieldMon7Script, EVENT_FIELD_MON_7
