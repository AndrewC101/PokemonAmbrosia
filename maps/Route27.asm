	object_const_def
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_YOUNGSTER2
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2
	const ROUTE27_FISHER
	const ROUTE27_FIELDMON_1
    const ROUTE27_FIELDMON_2

Route27_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route27FieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.Route27FieldMon:
; Pokemon which always appear
    appear ROUTE27_FIELDMON_1
    appear ROUTE27_FIELDMON_2
    endcallback

Route27FieldMon1Script:
	faceplayer
	cry HERACROSS
	pause 15
	loadwildmon HERACROSS, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ROUTE27_FIELDMON_1
	end

Route27FieldMon2Script:
	faceplayer
	cry SWAMPERT
	pause 15
	loadwildmon SWAMPERT, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE27_FIELDMON_2
	end

FirstStepIntoKantoLeftScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, Route27FisherStepLeftTwiceMovement
	sjump FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, Route27FisherStepLeftOnceMovement
FirstStepIntoKantoScene_Continue:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27FisherHeyText
	promptbutton
	writetext Route27FisherText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

Route27FisherScript:
	jumptextfaceplayer Route27AfterFisherText

TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJoseSeenText, BirdKeeperJoseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperJoseAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	opentext
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	promptbutton
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	writetext ReenaNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
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
	writetext ReenaNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext ReenaRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext ReenaRematchRefuseText
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

ReenaNumberAcceptedText:
	text "It is your destiny"
	line "to be my stepping"
	cont "stone."
	para "And a fine destiny"
	line "it is."
	done

ReenaRematchText:
    text "How about a"
    line "rematch?"
    done

ReenaRematchRefuseText:
    text "So be it."
    done

TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign:
	jumptext TohjoFallsSignText

Route27TMSolarbeam:
	itemball TM_SOLARBEAM

Route27RareCandy:
	itemball TM_SUNNY_DAY

Route27FisherStepLeftTwiceMovement:
	step LEFT
	step LEFT
	step_end

Route27FisherStepLeftOnceMovement:
	step LEFT
	step_end

Route27FisherHeyText:
	text "Halt!!"
	done

Route27FisherText:
	text "I am a member"
	line "of Kanto border"
	cont "patrol."

	para "The country is"
	line "in lockdown due"
	cont "to the threat of"
	cont "the Hoenn war."

	para "Let me see your"
	line "trainer card!"

	para "...."

	para "Ok this checks"
	line "out."

	para "You may go"
	line "ahead."

	para "Welcome to Kanto."
	done

Route27AfterFisherText:
	text "We won't have any"
	line "more undocumented"
	cont "Johto immigrants"
	cont "flood across our"
	cont "undefended western"
	cont "boarder."
	para "Not on my watch!"
	done

CooltrainermBlakeSeenText:
	text "Ah, a fresh face"
	line "around here."

	para "Are you heading"
	line "to battle the"
	cont "Elite Four?"

	para "You're the third"
	line "person today"
	cont "doing that."

	para "But you don't"
	line "look nearly"
	cont "strong enough."

	para "Even I can beat"
	line "you."

	para "Come on, let's"
	line "go!"
	done

CooltrainermBlakeBeatenText:
	text "Not again!"
	done

CooltrainermBlakeAfterBattleText:
	text "This is the third"
	line "time today I've"
	cont "lost a battle."

	para "But even though"
	line "you beat me,"
	cont "you are going"
	cont "to get destroyed"
	cont "by the Elite Four!"
	done

CooltrainerfReenaSeenText:
	text "Everyone here"
	line "wants to be the"
	cont "first Champion"
	cont "of Johto."

	para "But only I"
	line "will succeed."
	done

CooltrainerfReenaBeatenText:
	text "I'm not ready."
	done

CooltrainerfReenaAfterBattleText:
	text "You are strong"
	line "but the ELITE"
	cont "FOUR will put"
	cont "you in your"
	cont "place."
	done

CooltrainerfMeganSeenText:
	text "We all know we"
	line "are destined to"
	cont "become soldiers."

	para "But it's what"
	line "I want."

	para "I want to"
	line "protect the"
	cont "weak."
	done

CooltrainerfMeganBeatenText:
	text "You don't need"
	line "protection."
	done

CooltrainerfMeganAfterBattleText:
	text "#mon start"
	line "weak but they"
	cont "grow and get"
	cont "stronger."

	para "Everyone deserves"
	line "the chance to"
	cont "grow."
	done

BirdKeeperJoseSeenText:
	text "My beautiful"
	line "#mon are"
	cont "seasoned machines"
	cont "designed to do"
	cont "one thing..."

	para "Kill!"
	done

BirdKeeperJoseBeatenText:
	text "You are nobody's"
	line "prey."
	done

BirdKeeperJoseAfterBattleText:
	text "Let Hoenn come!"

	para "My #mon will"
	line "feast on their"
	cont "fish #mon!"
	done

TohjoFallsSignText:
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "Kanto AND Johto"
	done

Route27_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33,  9, ROUTE_27_SANDSTORM_HOUSE, 1
	warp_event 26,  7, TOHJO_FALLS, 1
	warp_event 36,  7, TOHJO_FALLS, 2

	def_coord_events
	coord_event 18, 12, SCENE_DEFAULT, FirstStepIntoKantoLeftScene
	coord_event 19, 12, SCENE_DEFAULT, FirstStepIntoKantoRightScene

	def_bg_events
	bg_event 25,  9, BGEVENT_READ, TohjoFallsSign

	def_object_events
	object_event 48,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 72, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	;object_event 65,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 58, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 60, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 12, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, Route27FisherScript, -1
	object_event 29, 10, SPRITE_HERACROSS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, Route27FieldMon1Script, EVENT_FIELD_MON_1
	object_event 70,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, Route27FieldMon2Script, EVENT_FIELD_MON_2
	
