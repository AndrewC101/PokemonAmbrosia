	object_const_def
	const ROUTE34_YOUNGSTER1
	const ROUTE34_YOUNGSTER2
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE34_COOLTRAINER_F1
	const ROUTE34_COOLTRAINER_F2
	const ROUTE34_COOLTRAINER_F3
    const ROUTE34_FIELDMON_3
    const ROUTE34_JESSIE
    const ROUTE34_JAMES
    const ROUTE34_MEOWTH
    const ROUTE34_FIELDMON_4

Route34_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
    appear ROUTE34_FIELDMON_3
    appear ROUTE34_FIELDMON_4
    random 5
    ifequal 1, .cont
    disappear ROUTE34_FIELDMON_4
.cont
    checkevent EVENT_BEAT_MEOWTH
    iffalse .noTeamRocket
    checkevent EVENT_CLEARED_RADIO_TOWER
    iffalse .noTeamRocket
    appear ROUTE34_JESSIE
    appear ROUTE34_JAMES
    appear ROUTE34_MEOWTH
    sjump .checkEgg
.noTeamRocket
    disappear ROUTE34_JESSIE
    disappear ROUTE34_JAMES
    disappear ROUTE34_MEOWTH

.checkEgg
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	endcallback

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	endcallback

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	readvar VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_CAMPER_TODD
	opentext
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	checkcellnum PHONE_CAMPER_TODD
	iftrue .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext CamperTodd1AfterText
	promptbutton
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall .RegisteredNumber
	writetext ToddNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext CamperTodd1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.SaleIsOn:
	writetext CamperToddSaleText
	waitbutton
	closetext
	end

.AskNumber:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	writetext ToddNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext ToddRematchText
	waitbutton
	yesorno
	iftrue .Rematch
	writetext ToddRematchRefuseText
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

ToddNumberAcceptedText:
	text "Thank..."
	para "Thank you!"
	para "I promise I will"
	line "do my best to be"
	cont "worth your time."
	done

ToddRematchText:
    text "How about a"
    line "rematch?"
    done

ToddRematchRefuseText:
    text "Yes Sensei."
    done

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_PICNICKER_GINA
	opentext
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftrue .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerGina1AfterText
	promptbutton
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall .RegisteredNumber
	writetext GinaNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LeafStone:
	scall .Gift
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

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
	writetext GinaNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext GinaRematchText
	waitbutton
	yesorno
	iftrue .Rematch
	writetext GinaRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

GinaNumberAcceptedText:
	text "Thank you!"
	para "My #mon will"
	line "get much stronger"
	cont "with your help."
	done

GinaRematchText:
    text "How about a"
    line "rematch?"
    done

GinaRematchRefuseText:
    text "We wont disappoint"
    line "you."
    done

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	promptbutton
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

Route34IlexForestSign: ; unreferenced
	jumptext Route34IlexForestSignText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route34HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

YoungsterSamuelSeenText:
	text "My #mon are"
	line "far cuter than"
	cont "yours."

	para "That's the only"
	line "victory that"
	cont "matters!"
	done

YoungsterSamuelBeatenText:
	text "Strength isn't"
	line "my forte."
	done

YoungsterSamuelAfterText:
	text "My #mon are"
	line "so cute."

	para "All the girls"
	line "talk to me."
	done

YoungsterIanSeenText:
	text "Have you heard"
	line "of ERIKA?"

	para "She is a GRASS"
	line "GYM LEADER in"
	cont "KANTO."

	para "I'm going to be"
	line "the first GRASS"
	cont "GYM LEADER in"
	cont "JOHTO!"
	done

YoungsterIanBeatenText:
	text "It's hard using"
	line "just one TYPE."
	done

YoungsterIanAfterText:
	text "GRASS has a"
	line "lot of weaknesses."
	done

CamperTodd1SeenText:
	text "It is important"
	line "to have TYPE"
	cont "coverage."

	para "Every team needs"
	line "a WATER, GRASS,"
	cont "FIRE core."
	done

CamperTodd1BeatenText:
	text "You broke my core."
	done

CamperTodd1AfterText:
	text "I need to"
	line "level up and"
	cont "have good moves"
	cont "too."
	done

CamperToddSaleText:
	text "A good trainer"
	line "can sense a"
	cont "bargain!"
	done

PicnickerGina1SeenText:
	text "I'm from KANTO."

	para "I came here to"
	line "escape the war."

	para "We have different"
	line "starters in KANTO."
	done

PicnickerGina1BeatenText:
	text "JOHTO #mon"
	line "are strong too."
	done

PicnickerGina1AfterText:
	text "When my #mon"
	line "evolve you'll"
	cont "see the full"
	cont "power of KANTO."
	done

OfficerKeithSeenText:
	text "Who goes there?"

	para "Stop criminal"
	line "scum!"
	done

OfficerKeithWinText:
	text "Officer down!"
	done

OfficerKeithAfterText:
	text "It's late for"
	line "you to be out."

	para "I understand."

	para "On a peaceful"
	line "night walk."

	para "Watch out for"
	line "the night"
	cont "stalker..."

	para "HAUNTER."
	done

OfficerKeithDaytimeText:
	text "I have a big"
	line "responsibility."

	para "I am charged with"
	line "protecting the"
	cont "city."

	para "I fear nobody."

	para "Not even WALLACE!"
	done

PokefanmBrandonSeenText:
	text "All big cities"
	line "attract criminals."

	para "But where there"
	line "are criminals"

	para "there are heroes"
	line "ready to face"
	cont "them!"

	para "Like me!!"
	done

PokefanmBrandonBeatenText:
	text "Why does it end"
	line "this way?"
	done

PokefanmBrandonAfterText:
	text "I see without"
	line "seeing."

	para "To me darkness"
	line "is as clear as"
	cont "daylight."

	para "I am the"
	line "BATMAN!"
	done

CooltrainerfIreneSeenText:
	text "IRENE: Kyaaah!"
	line "Someone found us!"
	done

CooltrainerfIreneBeatenText:
	text "IRENE: Ohhh!"
	line "Too strong!"
	done

CooltrainerfIreneAfterText1:
	text "IRENE: My sister"
	line "KATE will get you"
	cont "for this!"
	done

CooltrainerfIreneAfterText2:
	text "IRENE: Isn't this"
	line "beach great?"

	para "It's our secret"
	line "little getaway!"
	done

CooltrainerfJennSeenText:
	text "JENN: You can't"
	line "beat IRENE and go"
	cont "unpunished!"
	done

CooltrainerfJennBeatenText:
	text "JENN: So sorry,"
	line "IRENE! Sis!"
	done

CooltrainerfJennAfterText1:
	text "JENN: Don't get"
	line "cocky! My sister"
	cont "KATE is tough!"
	done

CooltrainerfJennAfterText2:
	text "JENN: Sunlight"
	line "makes your body"
	cont "stronger."
	done

CooltrainerfKateSeenText:
	text "KATE: You sure"
	line "were mean to my"
	cont "little sisters!"
	done

CooltrainerfKateBeatenText:
	text "KATE: No! I can't"
	line "believe I lost."
	done

CooltrainerfKateOfferSoftSandText:
	text "KATE: You're too"
	line "strong. I didn't"
	cont "stand a chance."

	para "Here. You deserve"
	line "this."
	done

CooltrainerfKateAfterText:
	text "KATE: I'm sorry we"
	line "jumped you."

	para "We never expected"
	line "anyone to find us"
	cont "here. You sure"
	cont "startled us."
	done

Route34IlexForestSignText:
	text "ILEX FOREST"
	line "THROUGH THE GATE"
	done

Route34SignText:
	text "ROUTE 34"

	para "GOLDENROD CITY -"
	line "AZALEA TOWN"

	para "ILEX FOREST"
	line "SOMEWHERE BETWEEN"
	done

Route34TrainerTipsText:
	text "TRAINER TIPS"

	para "BERRY trees grow"
	line "new BERRIES"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which BERRIES."
	done

DayCareSignText:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#mon FOR YOU!"
	done

Route34FieldMon3Script:
	faceplayer
	cry COTTONEE
	pause 15
	loadwildmon COTTONEE, 22
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE34_FIELDMON_3
	end

Route34FieldMon4Script:
	faceplayer
	cry ABRA
	pause 15
	loadwildmon ABRA, 12
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE34_FIELDMON_4
	end

Route34James:
    jumptextfaceplayer Route34JamesText

Route34Jessie:
    jumptextfaceplayer Route34JessieText

Route34Meowth:
    jumptextfaceplayer Route34MeowthText

Route34JamesText:
	text "You must learn how"
	line "to lose."
	para "It is such an"
	line "important part of"
	cont "#mon training"
	cont "that we built our"
	cont "entire careers on"
	cont "it!"
	para "Isn't that right"
	line "JESSIE?"
	done

Route34JessieText:
	text "Why can't I find"
	line "anyone to love me"
	cont "just because I'm"
	cont "mean and nasty and"
	cont "evil?"
	para "But at least it's"
	line "nice and peaceful"
	cont "here."
	para "Too bad about"
	line "the company!"
	done

Route34MeowthText:
	text "Youse two don't"
	line "need the opposite"
	cont "sex, youse have"
	cont "each other!"
	done


Route34_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 18, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 15, 14, DAY_CARE, 1
	warp_event 15, 15, DAY_CARE, 2
	warp_event 17, 15, DAY_CARE, 3

	def_coord_events

	def_bg_events
	bg_event 16,  6, BGEVENT_READ, Route34Sign
	bg_event 17, 33, BGEVENT_READ, Route34TrainerTips
	bg_event 14, 13, BGEVENT_READ, DayCareSign
	bg_event  4, 20, BGEVENT_ITEM, Route34HiddenRareCandy
	bg_event 21, 19, BGEVENT_ITEM, Route34HiddenSuperPotion

	def_object_events
	object_event 17,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 19, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 15, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterIan, -1
	object_event 14, 26, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event 22, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 19, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event 18, 18, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 21, 19, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 15, 48, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  7, 48, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event 10, 51, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event 18, 29, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34FieldMon3Script, EVENT_FIELD_MON_3
	object_event 4, 22, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34James, EVENT_TEMP_EVENT_1
	object_event 4, 23, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34Jessie, EVENT_TEMP_EVENT_2
	object_event 5, 20, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34Meowth, EVENT_TEMP_EVENT_3
	object_event 19,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route34FieldMon4Script, EVENT_FIELD_MON_4

