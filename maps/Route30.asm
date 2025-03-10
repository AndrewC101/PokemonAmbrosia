	object_const_def
	const ROUTE30_YOUNGSTER1
	const ROUTE30_YOUNGSTER2
	const ROUTE30_YOUNGSTER3
	const ROUTE30_BUG_CATCHER
	const ROUTE30_YOUNGSTER4
	const ROUTE30_MONSTER1
	const ROUTE30_MONSTER2
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FIELDMON_1
	const ROUTE30_FIELDMON_2
	const ROUTE30_FIELDMON_3
	const ROUTE30_FIELDMON_4
	const ROUTE30_FIELDMON_5
	const ROUTE30_FIELDMON_6
	const ROUTE30_FIELDMON_7
	const ROUTE30_FIELDMON_8

Route30_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route30FieldMon
	
.Route30FieldMon:
; Pokemon which always appear
    appear ROUTE30_FIELDMON_4
    appear ROUTE30_FIELDMON_5
    appear ROUTE30_FIELDMON_7
    appear ROUTE30_FIELDMON_3

; Pokemon that sometimes appear
.mon4
    random 2
    ifequal 1, .spawn4
    disappear ROUTE30_FIELDMON_1
    sjump .mon6
.spawn4
    appear ROUTE30_FIELDMON_1

.mon6
    random 2
    ifequal 1, .spawn6
    disappear ROUTE30_FIELDMON_6
    sjump .mon8
.spawn6
    appear ROUTE30_FIELDMON_6

.mon8
    random 5
    ifequal 1, .spawn8
    disappear ROUTE30_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE30_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
	iffalse .end
    appear ROUTE30_FIELDMON_2

.despawn
; Pokemon that don't appear at night
    disappear ROUTE30_FIELDMON_7

.end
    endcallback

YoungsterJoey_ImportantBattleScript:
	waitsfx
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	opentext
	writetext Text_UseTackle
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER2, Route30_JoeysRattataAttacksMovement
	opentext
	faceplayer
	writetext Text_ThisIsABigBattle
	waitbutton
	turnobject ROUTE30_YOUNGSTER1, UP
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER1, Route30_MikeysRattataAttacksMovement
	special RestartMapMusic
	end

TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, YoungsterJoey1WinText, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_YOUNGSTER_JOEY
	opentext
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	writetext JoeyNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, YoungsterJoey1WinText
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	checkevent EVENT_JOEY_HP_UP
	iftrue .GiveHPUp
	checkevent EVENT_GOT_HP_UP_FROM_JOEY
	iftrue .done
	scall .RematchGift
	verbosegiveitem HP_UP
	iffalse .PackFull
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	sjump .NumberAccepted

.done
	end

.GiveHPUp:
	opentext
	writetext YoungsterJoeyText_GiveHPUpAfterBattle
	waitbutton
	verbosegiveitem HP_UP
	iffalse .PackFull
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	sjump .NumberAccepted

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
	writetext JoeyNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext JoeyRematchText
	waitbutton
	yesorno
	iftrue .Rematch
	writetext RematchRefuseTextJoey
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

.PackFull:
	setevent EVENT_JOEY_HP_UP
	jumpstd PackFullMScript
	end

.RematchGift:
	jumpstd RematchGiftMScript
	end

JoeyNumberAcceptedText:
	text "When it is time"
	line "for you to fulfill"
	cont "your destiny"
	cont "I shall call."
	done

JoeyRematchText:
    text "How about a"
    line "rematch?"
    done

RematchRefuseTextJoey:
    text "Your destiny"
    line "will come."
    done

TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterText
	waitbutton
	closetext
	end

Route30YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CompletedEggQuest
	writetext Route30YoungsterText_DirectionsToMrPokemonsHouse
	waitbutton
	closetext
	end

.CompletedEggQuest:
	writetext Route30YoungsterText_EveryoneIsBattling
	waitbutton
	closetext
	end

Route30CooltrainerFScript:
	jumptextfaceplayer Route30CooltrainerFText

Route30Sign:
	jumptext Route30SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route30TrainerTips:
	jumptext Route30TrainerTipsText

Route30Antidote:
	itemball ANTIDOTE

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_30_HIDDEN_POTION

Route30_JoeysRattataAttacksMovement:
	fix_facing
	big_step UP
	big_step DOWN
	step_end

Route30_MikeysRattataAttacksMovement:
	fix_facing
	big_step DOWN
	big_step UP
	step_end

Text_ThisIsABigBattle:
	text "Go, RATTATA!"

	para "TACKLE!"
	done

Text_UseTackle:
	text "Destiny!!"

	para "You can not"
	line "destroy..."

	para "My destiny!"

	para "RATTATA max"
	line "power TACKLE!"
	done

YoungsterJoey1SeenText:
	text "I could not win!"

	para "But you will see."

	para "Everyone will see!"

	para "One day we shall"
	line "reach the peak"
	cont "of power."

	para "Come now!"

	para "Face my ultimate"
	line "RATTATA!!"
	done

YoungsterJoey1BeatenText:
	text "It's ok..."
	line "It's ok..."
	done

YoungsterJoey1WinText:
	text "It was my divine"
	line "destiny to win"
	cont "battle."
	done

YoungsterJoey1AfterText:
	text "I will never"
	line "catch another"
	cont "#MON."

	para "I don't need more!"

	para "One day my RATTATA"
	line "shall become..."

	para "A RAT GOD!"
	done

YoungsterMikeySeenText:
	text "That last guy"
	line "never shuts up"
	cont "about his weak"
	cont "RATTATA."

	para "You need more"
	line "than just one"
	cont "#MON."

	para "I'll show you."
	done

YoungsterMikeyBeatenText:
	text "That's strange."
	line "I won before."
	done

YoungsterMikeyAfterText:
	text "You can rematch"
	line "trainers by"
	cont "talking to them"
	cont "again."
	done

BugCatcherDonSeenText:
	text "BUG #MON are"
	line "the strongest!"

	para "They EVOLVE fast"
	line "and swarm their"
	cont "enemies."
	done

BugCatcherDonBeatenText:
	text "I need more BUGS!"
	done

BugCatcherDonAfterText:
	text "If you see a"
	line "bright red"
	cont "trainer,"
	cont "be sure to run!"

	para "Don't let them"
	line "see you."
	done

Route30YoungsterText_DirectionsToMrPokemonsHouse:
	text "I saw PROF OAK"
	line "entering a house"
	cont "further up ahead."
	done

Route30YoungsterText_EveryoneIsBattling:
	text "A guy back in town"
	line "wanted to play a"
	cont "game with me but"
	cont "it took too long"
	cont "and was so boring."

	para "I left as soon"
	line "as I could!"
	done

Route30CooltrainerFText:
	text "There is a dark"
	line "and scary cave"
	cont "to the NORTH."

	para "This is important"

	para "...."

	para "If you see a"
	line "bright red trainer"
	cont "you run away and"
	cont "don't let them see"
	cont "you!"
	done

Route30SignText:
	text "ROUTE 30"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

MrPokemonsHouseDirectionsSignText:
	text "AGENT HOUSE"
	line "STRAIGHT AHEAD!"
	done

MrPokemonsHouseSignText:
	text "AGENT HOUSE"
	done

Route30TrainerTipsText:
	text "TRAINER TIPS"

	para "You need BADGES"
	line "to catch higher"
	cont "level #MON."

	para "With no BADGES"
	line "the highest level"
	cont "you can catch is"
	cont "20."
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "You too seek"
	line "your own destiny."

	para "But there can be"
	line "only one RAT GOD!"

	para "Take this!"

	para "It will help"
	line "you weather the"
	cont "storms of life."
	done
	
Route30FieldMon1Script:
	trainer PERSIAN, FIELD_MON, EVENT_FIELD_MON_1, Route30PokemonAttacksText, 13, 0, .script
.script
    disappear ROUTE30_FIELDMON_1
    end

Route30FieldMon2Script:
	trainer NOCTOWL, FIELD_MON, EVENT_FIELD_MON_2, Route30PokemonAttacksText, 14, 0, .script
.script
    disappear ROUTE30_FIELDMON_2
    end
    
Route30PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route30FieldMon3Script:
	faceplayer
	cry MARILL
	pause 15
	loadwildmon MARILL, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE30_FIELDMON_3
	end
	
Route30FieldMon4Script:
	faceplayer
	cry MUDKIP
	pause 15
	loadwildmon MUDKIP, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE30_FIELDMON_4
	end

Route30FieldMon5Script:
	faceplayer
	cry VULPIX
	pause 15
	loadwildmon VULPIX, 8
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE30_FIELDMON_5
	end

Route30FieldMon6Script:
	faceplayer
	cry GROWLITHE
	pause 15
	loadwildmon GROWLITHE, 9
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE30_FIELDMON_6
	end
	
Route30FieldMon7Script:
	faceplayer
	cry METAPOD
	pause 15
	loadwildmon METAPOD, 9
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE30_FIELDMON_7
	end

Route30FieldMon8Script:
	faceplayer
	cry RALTS
	pause 15
	loadwildmon RALTS, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE30_FIELDMON_8
	end

Route30_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 39, ROUTE_30_BERRY_HOUSE, 1
	warp_event 17,  5, MR_POKEMONS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 43, BGEVENT_READ, Route30Sign
	bg_event 13, 29, BGEVENT_READ, MrPokemonsHouseDirectionsSign
	bg_event 15,  5, BGEVENT_READ, MrPokemonsHouseSign
	bg_event  3, 21, BGEVENT_READ, Route30TrainerTips
	bg_event 14,  9, BGEVENT_ITEM, Route30HiddenPotion

	def_object_events
	object_event  5, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YoungsterJoey_ImportantBattleScript, EVENT_ROUTE_30_BATTLE
	object_event  2, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJoey, EVENT_ROUTE_30_YOUNGSTER_JOEY
	object_event  5, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMikey, -1
	object_event  1,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherDon, -1
	object_event  7, 30, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route30YoungsterScript, -1
	object_event  5, 24, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 25, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 39, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree1, -1
	object_event 12, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route30FieldMon1Script, EVENT_FIELD_MON_1
	object_event 12,  3, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route30FieldMon2Script, EVENT_FIELD_MON_2
	object_event 18, 45, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route30FieldMon3Script, EVENT_FIELD_MON_3
	object_event 13, 41, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route30FieldMon4Script, EVENT_FIELD_MON_4
	object_event 16, 33, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route30FieldMon5Script, EVENT_FIELD_MON_5
	object_event 4,  13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route30FieldMon6Script, EVENT_FIELD_MON_6
	object_event 18, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route30FieldMon7Script, EVENT_FIELD_MON_7
	object_event 13,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route30FieldMon8Script, EVENT_FIELD_MON_8
