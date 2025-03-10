	object_const_def
	const ROUTE44_FISHER1
	const ROUTE44_YOUNGSTER1
	const ROUTE44_POKEBALL
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_FIELDMON_1
    const ROUTE44_FIELDMON_2
    const ROUTE44_FIELDMON_3
    const ROUTE44_FIELDMON_4
    const ROUTE44_FIELDMON_5
    const ROUTE44_FIELDMON_6
    const ROUTE44_FIELDMON_7
    const ROUTE44_FIELDMON_8

Route44_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route44FieldMon

.Route44FieldMon:
; Pokemon which always appear
    appear ROUTE44_FIELDMON_1
    appear ROUTE44_FIELDMON_6
    appear ROUTE44_FIELDMON_4
    appear ROUTE44_FIELDMON_7

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE44_FIELDMON_5
    sjump .mon7
.spawn6
    appear ROUTE44_FIELDMON_5

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE44_FIELDMON_3
    sjump .mon8
.spawn7
    appear ROUTE44_FIELDMON_3

.mon8
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE44_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE44_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE44_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE44_FIELDMON_8

.end
    endcallback

Route44AskNumber1M:
	jumpstd AskNumber1MScript
	end
Route44AskNumber2M:
	jumpstd AskNumber2MScript
	end
Route44RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end
Route44NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end
Route44PhoneFullM:
	jumpstd PhoneFullMScript
	end
Route44RematchM:
	jumpstd RematchMScript
	end
Route44GiftM:
	jumpstd GiftMScript
	end
Route44PackFullM:
	jumpstd PackFullMScript
	end

TrainerBirdKeeperVance1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIRD_KEEPER_VANCE
	iftrue .FightDone
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalse .Mercy
.fight
	writetext BirdKeeperVance1SeenText
	waitbutton
	closetext
	winlosstext BirdKeeperVance1BeatenText, 0
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BIRD_KEEPER_VANCE
	end
.FightDone:
	writetext BirdKeeperVanceLegendaryBirdsText
	waitbutton
    closetext
	opentext
	writetext RematchTextRoute44
	yesorno
	iftrue .fight
	writetext RematchRefuseTextRoute44
	waitbutton
	closetext
	end
.Mercy:
    writetext BirdKeeperVance1MercyText
    waitbutton
	closetext
	end

BirdKeeperVance1MercyText:
    text "You don't look"
    line "like you should"
    cont "be here!"

    para "You came through"
    line "from BLACKTHORN."

    para "Oh I don't think"
    line "you will be able"
    cont "to get back"
    cont "without STRENGTH."

    para "You're in quite"
    line "the pickle."

    para "West of here is"
    line "MAHOGANY town."

    para "West of that is"
    line "ECRUTEAK."

    para "There is a man"
    line "there who can"
    cont "send you home."

    para "It is possible"
    line "to get there and"
    cont "avoid other"
    cont "trainers and"
    cont "#MON."

    para "But it will be"
    line "difficult."

    para "Good luck!"
    done

RematchTextRoute44:
    text "How about a"
    line "rematch?"
    done

RematchRefuseTextRoute44:
    text "Maybe next time."
    done

TrainerPsychicPhil:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_PSYCHIC_PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer FISHER, WILTON1, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_FISHER_WILTON
	opentext
	checkflag ENGINE_WILTON_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	checkcellnum PHONE_FISHER_WILTON
	iftrue .NumberAcceptedM
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherWiltonHugePoliwagText
	promptbutton
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_FISHER_WILTON
	ifequal PHONE_CONTACTS_FULL, Route44PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route44NumberDeclinedM
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall Route44RegisteredNumberM
	writetext WiltonNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall Route44RematchM
	winlosstext FisherWilton1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.HasItem:
	scall Route44GiftM
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue .UltraBall
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue .GreatBall
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue .PokeBall
.UltraBall:
	verbosegiveitem ULTRA_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.GreatBall:
	verbosegiveitem GREAT_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.PokeBall:
	verbosegiveitem POKE_BALL
	iffalse .Route44PackFullM
.ItemReceived:
	clearflag ENGINE_WILTON_HAS_ITEM
	sjump .NumberAcceptedM

.Route44PackFullM:
	sjump Route44PackFullM

.NumberAcceptedM:
	writetext WiltonNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext WiltonRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext WiltonRematchRefuseText
	waitbutton
	closetext
	end

WiltonNumberAcceptedText:
	text "I'll introduce you"
	line "to a whole new"
	cont "world of culinary"
	cont "experience."
	done

WiltonRematchText:
    text "How about a"
    line "rematch?"
    done

WiltonRematchRefuseText:
    text "Keep an open"
    line "mind."
    done

TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer POKEMANIAC, ZACH, EVENT_BEAT_POKEMANIAC_ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacZachAfterBattleText
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

Route44FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route44LifeOrb:
	itemball LIFE_ORB

Route44HiddenAmbrosia:
	hiddenitem LUCKY_EGG, EVENT_ROUTE_44_HIDDEN_LUCKY_EGG

FisherWilton1SeenText:
	text "AACK! I was"
	line "just about to"
	cont "catch a FEEBAS"
	cont "but you made"
	cont "let it get away!"

	para "Have you ever"
	line "eaten a FEEBAS?"

	para "Nothing compares."

	para "Nothing."

	para "Now what am I"
	line "meant to have"
	cont "for dinner."
	done

FisherWilton1BeatenText:
	text "Don't eat me!"
	done

FisherWiltonHugePoliwagText:
	text "If you look"
	line "after your FEEBAS"
	cont "and love it, it"
	cont "will evolve into"
	cont "a MILOTIC."

	para "But there isn't a"
	line "man alive who can"
	cont "resist the allure"
	cont "of a delicious"
	cont "FEEBAS."
	done

BirdKeeperVance1SeenText:
	text "Do you have any"
	line "idea how many"
	cont "cool and legendary"
	cont "#MON are FLYING"
	cont "TYPE?"

	para "It is the coolest"
	line "type."

	para "By far!"
	done

BirdKeeperVance1BeatenText:
	text "I need some"
	line "legendary"
	cont "#MON!"
	done

BirdKeeperVanceLegendaryBirdsText:
	text "My perfect team..."

	para "ARTICUNO"

	para "ZAPDOS"

	para "MOLTRES"

	para "HO OH"

	para "LUGIA"

	para "YVELTAL"

	para "Perfect!"
	done

BirdKeeperVance2BeatenText:
	text "You just keep"
	line "soaring higher"
	cont "and higher."
	done

PsychicPhilSeenText:
    text "I am working to"
    line "control my anger."

	para "I'm heading to"
	line "ICE CAVE to"
	cont "meditate and"
	cont "heighten my"
	cont "psychic powers."

	para "You disturb my"
	line "zen."
	done

PsychicPhilBeatenText:
	text "ARRRRAHHHH!!"
	done

PsychicPhilAfterBattleText:
	text "Who the hell do"
	line "you think you are!"

	para "I'm going to..."

	para "ARRAGAHHRRR"

	para "........"

	para "Zen... zen..."
	done

PokemaniacZachSeenText:
	text "I am building"
	line "a team that can"
	cont "cover every"
	cont "threat."

	para "When war comes I"
	line "will survive and"
	cont "by surviving I"
	cont "will win."
	done

PokemaniacZachBeatenText:
	text "You breached my"
	line "defenses!"
	done

PokemaniacZachAfterBattleText:
	text "Maybe it is"
	line "impossible to"
	cont "cover every"
	cont "threat with just"
	cont "six #MON."

	para "Maybe it is"
	line "kill or be killed."
	done

CooltrainerfCybilSeenText:
	text "For years I"
	line "have studied under"
	cont "the KIMONO GIRLS."

	para "Everyday I danced"
	line "like it was my"
	cont "last."

	para "I learnt the"
	line "secrets of their"
	cont "power."

	para "And have poured"
	line "all my knowledge"
	cont "into my ultimate"
	cont "team."
	done

CooltrainerfCybilBeatenText:
	text "All those years..."

	para "Gone."
	done

CooltrainerfCybilAfterBattleText:
	text "EEVEE has many"
	line "forms."

	para "We too have many"
	line "different forms"
	cont "within us."

	para "Only when these"
	line "different people"
	cont "work together can"
	cont "we achieve our"
	cont "full potential."
	done

Route44Sign1Text:
	text "ROUTE 44"
	line "ICE PATH AHEAD"
	done

Route44Sign2Text:
	text "ROUTE 44"

	para "MAHOGANY TOWN -"
	line "BLACKTHORN CITY"
	done

Route44FieldMon1Script:
	trainer ARBOK, FIELD_MON, EVENT_FIELD_MON_1, Route44PokemonAttacksText, 54, 0, .script
.script
    disappear ROUTE44_FIELDMON_1
    end

Route44FieldMon2Script:
	trainer WEAVILE, FIELD_MON, EVENT_FIELD_MON_2, Route44PokemonAttacksText, 55, 0, .script
.script
    disappear ROUTE44_FIELDMON_2
    end

Route44PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route44FieldMon3Script:
	faceplayer
	cry CHANSEY
	pause 15
	loadwildmon CHANSEY, 35
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE44_FIELDMON_3
	end

Route44FieldMon4Script:
	faceplayer
	cry LANTURN
	pause 15
	loadwildmon LANTURN, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE44_FIELDMON_4
	end

Route44FieldMon5Script:
	faceplayer
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 51
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE44_FIELDMON_5
	end

Route44FieldMon6Script:
	faceplayer
	cry TOGEKISS
	pause 15
	loadwildmon TOGEKISS, 66
    loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE44_FIELDMON_6
	end

Route44FieldMon7Script:
	faceplayer
	cry ABOMASNOW
	pause 15
	loadwildmon ABOMASNOW, 42
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE44_FIELDMON_7
	end

Route44FieldMon8Script:
	faceplayer
	cry TOGEPI
	pause 15
	loadwildmon TOGEPI, 5
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE44_FIELDMON_8
	end

VanceEncounterScript:
    checkevent EVENT_GOT_HM04_STRENGTH
    iffalse .talk
    end
.talk
    turnobject ROUTE44_YOUNGSTER2, LEFT
    turnobject PLAYER, RIGHT
    sjump TrainerBirdKeeperVance1
    setmapscene ROUTE_44, SCENE_FINISHED

Route44_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 56,  7, ICE_PATH_1F, 1

	def_coord_events
	coord_event 56, 8, SCENE_DEFAULT, VanceEncounterScript

	def_bg_events
	bg_event 53,  7, BGEVENT_READ, Route44Sign1
	bg_event  6, 10, BGEVENT_READ, Route44Sign2
	bg_event 32,  9, BGEVENT_ITEM, Route44HiddenAmbrosia

	def_object_events
	object_event 35,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicPhil, -1
	object_event 6, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44LifeOrb, EVENT_ROUTE_44_LIFE_ORB
	object_event 57,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TrainerBirdKeeperVance1, -1
	object_event 49, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfCybil, -1
	object_event  9,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44FruitTree, -1

	object_event 44,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route44FieldMon1Script, EVENT_FIELD_MON_1
	object_event 52, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route44FieldMon2Script, EVENT_FIELD_MON_2
	object_event 29,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route44FieldMon3Script, EVENT_FIELD_MON_3
	object_event 27,  16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route44FieldMon4Script, EVENT_FIELD_MON_4
	object_event 22,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route44FieldMon5Script, EVENT_FIELD_MON_5
	object_event 37,  9, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route44FieldMon6Script, EVENT_FIELD_MON_6
	object_event 51,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route44FieldMon7Script, EVENT_FIELD_MON_7
	object_event 35,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route44FieldMon8Script, EVENT_FIELD_MON_8
