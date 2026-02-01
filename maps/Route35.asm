	object_const_def
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
    const ROUTE35_FIELDMON_1
    const ROUTE35_FIELDMON_2
    const ROUTE35_FIELDMON_3
    const ROUTE35_FIELDMON_4

Route35_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route35FieldMon

.Route35FieldMon:
; Pokemon which always appear
    appear ROUTE35_FIELDMON_3

    random 3
    ifequal 1, .spawn2
    disappear ROUTE35_FIELDMON_2
    sjump .next
.spawn2
    appear ROUTE35_FIELDMON_2

.next
    random 5
    ifequal 1, .spawn4
    disappear ROUTE35_FIELDMON_4
    sjump .checkNight
.spawn4
    appear ROUTE35_FIELDMON_4

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end
    appear ROUTE35_FIELDMON_1
.end
    endcallback

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer POKEMANIAC, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
    ; no rematch
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue IrwinNumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, POKEMANIAC, IRWIN1
	scall Route35RegisteredNumberM
	sjump IrwinNumberAcceptedM

Route35AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route35AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route35RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

IrwinNumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route35NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route35PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route35RematchM:
	jumpstd RematchMScript
	end

IrwinNumberAcceptedText:
	text "I'm going to chat"
	line "to you about"
	cont "everything!"
	cont "Everything!"
	done

IrwinRematchText:
    text "How about a"
    line "rematch?"
    done

IrwinRematchRefuseText:
    text "I will call you!"
    line "I will!"
    done

InvaderLautrecScript:
	trainer INVADER, LAUTREC, EVENT_BEAT_INVADER_LAUTREC, InvaderLautrecSeenText, InvaderLautrecBeatenText, InvaderLautrecVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderLautrecAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer PICNICKER, BROOKE, EVENT_BEAT_PICNICKER_BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArnie:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, BugCatcherArnieSeenText, BugCatcherArnieBeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftrue .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue .ArnieNumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall Route35RegisteredNumberM
	writetext ArnieNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall Route35RematchM
	winlosstext BugCatcherArnieBeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_BEAT_PRYCE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_CHUCK
	iftrue .LoadFight1
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	writetext BugCatcherArnieYanmaText
	waitbutton
	closetext
	end

.ArnieNumberAcceptedM:
	writetext ArnieNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext ArnieRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext ArnieRematchRefuseText
	waitbutton
	closetext
	end

ArnieNumberAcceptedText:
	text "When the day comes"
	line "and the Bugs swarm"
	cont "these lands, I'll"
	cont "let you know."
	done

ArnieRematchText:
    text "How about a"
    line "rematch?"
    done

ArnieRematchRefuseText:
    text "The swarm comes"
    line "soon."
    done

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball RARE_CANDY

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

InvaderLautrecSeenText:
	text "Well, look at"
	line "you."

	para "I thought you"
	line "were wiser."

	para "I thought wrong!"

	para "This is a terrible"
	line "pity."

	para "Like a moth"
	line "flittering to"
	cont "a flame."
	done

InvaderLautrecBeatenText:
	text "You despicable"
	line "...Curses..."
	cont "How could I..."
	done

InvaderLautrecVictoryText:
	text "Hmmm... Your"
	line "humanity is"
	cont "really slipping."
	done

InvaderLautrecAfterBattleText:
	text "Beware the one"
	line "known as Patches."

	para "He might seen"
	line "an unassuming"
	cont "fool."

	para "But he is"
	line "very dangerous."
	done

CamperElliotSeenText:
	text "Stay back babe!"

	para "I'll protect you"
	line "from that Invader."

	para "Oh... look..."

	para "The Invader has"
	line "an apprentice."

	para "I'll protect you!"
	done

CamperElliotBeatenText:
	text "I wish you would"
	line "have lost for me…"
	done

CamperElliotAfterBattleText:
	text "I was humiliated"
	line "in front of my"
	cont "girlfriend…"
	done

PicnickerBrookeSeenText:
	text "My boyfriend"
	line "is as weak as"
	cont "he is immature."

	para "But I do care"
	line "about him."

	para "Don't worry hun."

	para "I'll protect you"
	line "from this thug!"
	done

PicnickerBrookeBeatenText:
	text "Oh, my! You're so"
	line "strong!"
	done

PicnickerBrookeAfterBattleText:
	text "I don't like"
	line "losing."

	para "I'll have to"
	line "battle my"
	cont "boyfriend to"
	cont "feel better."
	done

PicnickerKimSeenText:
	text "I tried to join"
	line "the Goldenrod Gym"
	cont "but they said my"
	cont "#mon was too"
	cont "violent!"

	para "They are mad!"

	para "My #mon is"
	line "the cutest!"
	done

PicnickerKimBeatenText:
	text "Devour them"
	line "Mawile!!"
	done

PicnickerKimAfterBattleText:
	text "I'm going to beat"
	line "all those Gym"
	cont "trainers!"

	para "That'll show"
	line "them how cute"
	cont "my Mawile is."
	done

BirdKeeperBryanSeenText:
	text "Once my #mon"
	line "are big enough"
	cont "they will fly me"
	cont "away to Kalos"
	cont "to escape the war."
	done

BirdKeeperBryanBeatenText:
	text "fly you fools."
	done

BirdKeeperBryanAfterBattleText:
	text "You know, I"
	line "think Kanto have"
	cont "it coming."

	para "But when Johto"
	line "gets pulled in"
	cont "I'll be ready"
	cont "to get right"
	cont "outta here!"
	done

JugglerIrwin1SeenText:
	text "Heh heh heh."

	para "There is no"
	line "greater advantage"
	cont "than outnumbering"
	cont "your opponent."

	para "Behold all my"
	line "balls!"
	done

JugglerIrwin1BeatenText:
	text "I need more!"
	done

JugglerIrwinAfterBattleText:
	text "Why can't I have"
	line "more than six"
	cont "balls!"

	para "I have hundreds"
	line "in my PC."
	done

BugCatcherArnieSeenText:
	text "I have been using"
	line "my one beloved"
	cont "#mon and"
	cont "nothing else."

	para "I'll show you"
	line "what a well"
	cont "trained Bug"
	cont "can do."
	done

BugCatcherArnieBeatenText:
	text "You did well"
	line "my friend."
	done

BugCatcherArnieAfterBattleText:
	text "I know my"
	line "#mon can"
	cont "get even stronger!"
	done

BugCatcherArnieYanmaText:
	text "There are a lot"
	line "of Yanma out"
	cont "there."

	para "But I'm not"
	line "interested."
	done

FirebreatherWaltSeenText:
	text "I finally got"
	line "my Fire Stones."

	para "Now I can be"
	line "like my hero"
	cont "Blaine."
	done

FirebreatherWaltBeatenText:
	text "Maybe I'm not"
	line "ready yet."
	done

FirebreatherWaltAfterBattleText:
	text "Blaine is a"
	line "mad scientist"
	cont "Fire Gym Leader."

	para "He will roast"
	line "those Hoennites!"
	done

OfficerDirkSeenText:
	text "Halt!"

	para "Identify yourself"
	line "punk!"
	done

OfficerDirkBeatenText:
	text "Officer down!!"
	done

OfficerDirkAfterBattleText:
	text "I used to work"
	line "in Kanto and"
	cont "all the Biker"
	cont "gangs hardened"
	cont "me."

	para "Now I attack"
	line "first and think"
	cont "later."
	done

OfficerDirkPrettyToughText:
	text "I am keeping"
	line "you safe."

	para "I won't let any"
	line "rotten punks"
	cont "pass."
	done

Route35SignText:
	text "Route 35"
	done

Route35FieldMon1Script:
	trainer CLEFABLE, FIELD_MON, EVENT_FIELD_MON_1, Route35PokemonAttacksText, 31, 0, .script
.script
    disappear ROUTE35_FIELDMON_1
    end

Route35PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route35FieldMon2Script:
	faceplayer
	cry BAGON
	pause 15
	loadwildmon BAGON, 21
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE35_FIELDMON_2
	end

Route35FieldMon3Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadwildmon AMPHAROS, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE35_FIELDMON_3
	end

Route35FieldMon4Script:
	faceplayer
	cry YANMA
	pause 15
	loadwildmon YANMA, 24
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE35_FIELDMON_4
	end

Route35_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	def_object_events
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderLautrecScript, -1
	object_event  8, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperElliot, -1
	object_event  7, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherArnie, -1
	object_event  5, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  5,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1

	object_event 0,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route35FieldMon1Script, EVENT_FIELD_MON_1
	object_event 13, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, Route35FieldMon2Script, EVENT_FIELD_MON_2
	object_event 0, 16, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35FieldMon3Script, EVENT_FIELD_MON_3
	object_event 8, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route35FieldMon4Script, EVENT_FIELD_MON_4
