	object_const_def
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_INVADER_PATCHES
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL
	const ROUTE43_FIELDMON_1
    const ROUTE43_FIELDMON_2
    const ROUTE43_FIELDMON_3
    const ROUTE43_FIELDMON_4
    const ROUTE43_FIELDMON_5
    const ROUTE43_FIELDMON_6
    const ROUTE43_FIELDMON_7
    const ROUTE43_FIELDMON_8
    const ROUTE43_POKE_BALL_2

Route43_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfRockets
	callback MAPCALLBACK_OBJECTS, .WeatherAndFieldMon

.WeatherAndFieldMon:
	setval WEATHER_RAIN
	writemem wFieldWeather

    appear ROUTE43_FIELDMON_1
    appear ROUTE43_FIELDMON_3
    appear ROUTE43_FIELDMON_4
    appear ROUTE43_FIELDMON_5
    appear ROUTE43_FIELDMON_6

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn7
    disappear ROUTE43_FIELDMON_7
    sjump .mon8
.spawn7
    appear ROUTE43_FIELDMON_7

.mon8
    random 5 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE43_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE43_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE43_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE43_FIELDMON_7

.end
    endcallback

.CheckIfRockets:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .NoRockets
	setmapscene ROUTE_43_GATE, SCENE_DEFAULT
	endcallback

.NoRockets:
	setmapscene ROUTE_43_GATE, SCENE_FINISHED
	endcallback

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBenAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	opentext
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	writetext BrentNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
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
	writetext BrentNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext BrentRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext BrentRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

BrentNumberAcceptedText:
	text "I look forward to"
	line "blasting you in"
	cont "the face."
	done

BrentRematchText:
    text "How about a"
    line "rematch?"
    done

BrentRematchRefuseText:
    text "Nobody wants to"
    line "get one shot!"
    done

InvaderPatchesScript:
	trainer INVADER, PATCHES, EVENT_BEAT_INVADER_PATCHES, InvaderPatchesSeenText, InvaderPatchesBeatenText, InvaderPatchesVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderPatchesAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY3, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasPinkBow
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue .NumberAccepted
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall .RegisteredNumber
	writetext TiffanyNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffanyBeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.HasPinkBow:
	scall .Gift
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoClefairy:
	writetext PicnickerTiffanyClefairyText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	writetext TiffanyNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext TiffanyRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext TiffanyRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
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

TiffanyNumberAcceptedText:
	text "Remember your best"
	line "chance at"
	cont "surviving is to"
	cont "run away."
	para "Never go with them"
	line "no matter what."
	para "Be careful out"
	line "there."
	done

TiffanyRematchText:
    text "How about a"
    line "rematch?"
    done

TiffanyRematchRefuseText:
    text "Stay safe friend."
    done

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball TM_SLUDGE_BOMB

PokemaniacBenSeenText:
	text "You are trying"
	line "to catch the"
	cont "GYARADOS before"
	cont "I can!"

	para "It is my"
	line "destiny to"
	cont "become..."

	para "BEN!"

	para "The greatest"
	line "Water trainer!"
	done

PokemaniacBenBeatenText:
	text "I won't let you!"
	done

PokemaniacBenAfterBattleText:
	text "Fine you can"
	line "have the GYARADOS."

	para "I'll find a FEEBAS"
	line "and get myself a"
	cont "MILOTIC."
	done

PokemaniacBrentSeenText:
	text "Come on where"
	line "are all the super"
	cont "aggressive crazy"
	cont "#mon!"

	para "I want to beat"
	line "them the same way"
	cont "I beat everyone."

	para "Blasting them"
	line "right in the face!"
	done

PokemaniacBrentBeatenText:
	text "You are"
	line "blastproof."
	done

PokemaniacBrentAfterBattleText:
	text "I have blasted"
	line "many enemies."

	para "Right in the"
	line "face!"
	done

InvaderPatchesSeenText:
	text "Good day!"
	line "You look"
	cont "reasonably sane."

	para "You must be"
	line "looking for"
	cont "treasure!"

	para "There is a rare"
	line "treasure just"
	cont "ahead."

	para "But that's"
	line "nothing."

	para "I've been to"
	line "the core of this"
	cont "world."

	para "A horrible place"
	line "of pure logic."

	para "There I found a"
	line "a treasure hidden"
	cont "away by the maker."

	para "Have a look."

	para "It'll shimmer"
	line "you blind!"
	done

InvaderPatchesBeatenText:
	text "Curses..."
	line "I'm finished.."
	cont "What did I ever.."
	done

InvaderPatchesVictoryText:
	text "Hey, don't blame"
	line "me, old darling."
	done

InvaderPatchesAfterBattleText:
	text "I did you wrong."

	para "But, I didn't"
	line "mean it!"

	para "Please forgive"
	line "me?"

	para "You and me, we're"
	line "jolly adventurers"
	cont "aren't we?"
	done

FisherMarvinSeenText:
	text "Well aren't you"
	line "a purdy little"
	cont "thang."

	para "It could be"
	line "real dangerous"
	cont "for you to be"
	cont "goin much further"
	cont "this way."

	para "You had best be"
	line "turnin back."
	done

FisherMarvinBeatenText:
	text "Oh you're a"
	line "tough little"
	cont "thang."
	done

FisherMarvinAfterBattleText:
	text "People like you"
	line "that be wanderin"
	cont "past here..."

	para "They don't all"
	line "be comin back."
	done

CamperSpencerSeenText:
	text "Hey kid be"
	line "careful."

	para "I'm an undercover"
	line "detective."

	para "I'm investigating"
	line "the case of the"
	cont "Mahogany murderer."

	para "A serial killer"
	line "some believe is"
	cont "still out there"
	cont "somewhere."

	para "He drugged his"
	line "victims with"
	cont "drinks laced with"
	cont "SLEEP POWDER."

	para "Oh that's right"
	line "I'm a trainer."

	para "Yes let's do"
	line "that thing"
	cont "trainers do."
	done


CamperSpencerBeatenText:
	text "You play along"
	line "well."
	done

CamperSpencerAfterBattleText:
	text "Be careful out"
	line "there in the"
	cont "wilderness."

	para "Don't trust"
	line "anyone."
	done

PicnickerTiffanySeenText:
	text "People say it"
	line "is dangerous for"
	cont "a girl to be out"
	cont "here alone."

	para "But I'm not"
	line "alone."

	para "I'm with my best"
	line "friend MAWILE."

	para "I'll show you"
	line "we can look"
	cont "after ourselves."
	done

PicnickerTiffanyBeatenText:
	text "You did great"
	line "MAWILE!"
	done

PicnickerTiffanyWantsPicnicText:
	text "You never know"
	line "what someone is"
	cont "thinking."
	para "Be wary of friends"
	line "and strangers"
	cont "alike."
	done

PicnickerTiffanyClefairyText:
	text "Isn't my MAWILE"
	line "adorable and"
	cont "strong?"
	done

Route43Sign1Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43Sign2Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43TrainerTipsText:
	text "TRAINER TIPS"

	para "Rain boosts Water"
	line "moves and nerfs"
	cont "Fire moves."

	para "Sun boosts Fire"
	line "moves and nerfs"
	cont "Water moves."

	para "Sand boost Rock"
	line "#mon"
	cont "SPECIAL DEFENSE"
	cont "and damages all"
	cont "non Rock, Ground"
	cont "or Steel types."
	done

Route43FieldMon1Script:
	trainer STARAPTOR, FIELD_MON, EVENT_FIELD_MON_1, Route43PokemonAttacksText, 47, 0, .script
.script
    disappear ROUTE43_FIELDMON_1
    end

Route43FieldMon2Script:
	trainer HONCHKROW, FIELD_MON, EVENT_FIELD_MON_2, Route43PokemonAttacksText, 46, 0, .script
.script
    disappear ROUTE43_FIELDMON_2
    end

Route43PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route43FieldMon3Script:
	faceplayer
	cry ABOMASNOW
	pause 15
	loadwildmon ABOMASNOW, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE43_FIELDMON_3
	end

Route43FieldMon4Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadwildmon AMPHAROS, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE43_FIELDMON_4
	end

Route43FieldMon5Script:
	faceplayer
	cry SWAMPERT
	pause 15
	loadwildmon SWAMPERT, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE43_FIELDMON_5
	end

Route43FieldMon6Script:
	faceplayer
	cry POLITOED
	pause 15
	loadwildmon POLITOED, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE43_FIELDMON_6
	end

Route43FieldMon7Script:
	faceplayer
	cry EXEGGUTOR
	pause 15
	loadwildmon EXEGGUTOR, 34
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE43_FIELDMON_7
	end

Route43FieldMon8Script:
	faceplayer
	cry SHELGON
	pause 15
	loadwildmon SHELGON, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE43_FIELDMON_8
	end

Route43LeafStone:
    itemball LEAF_STONE

Route43_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	def_object_events
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event 11,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, InvaderPatchesScript, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany, -1
	object_event 13, 40, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event 12, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER

	object_event  8,  9, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route43FieldMon1Script, EVENT_FIELD_MON_1
	object_event 21, 17, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route43FieldMon2Script, EVENT_FIELD_MON_2
	object_event  9, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route43FieldMon3Script, EVENT_FIELD_MON_3
	object_event 19,  28, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43FieldMon4Script, EVENT_FIELD_MON_4
	object_event  9, 30, SPRITE_SWAMPERT, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43FieldMon5Script, EVENT_FIELD_MON_5
	object_event 18, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43FieldMon6Script, EVENT_FIELD_MON_6
	object_event 24, 44, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route43FieldMon7Script, EVENT_FIELD_MON_7
	object_event 24,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route43FieldMon8Script, EVENT_FIELD_MON_8
	object_event 25, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43LeafStone, EVENT_ROUTE43_LEAF_STONE
