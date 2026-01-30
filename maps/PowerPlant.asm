	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUIDE1
	const POWERPLANT_GYM_GUIDE2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUIDE3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST
	const POWERPLANT_ZAPDOS
	const POWERPLANT_ITEMBALL

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

ZapdosScript:
	cry ZAPDOS
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 60
    sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 50
.begin
	startbattle
	reloadmapafterbattle
    setval ZAPDOS
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_ZAPDOS
	disappear POWERPLANT_ZAPDOS
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUIDE1, DOWN
	turnobject POWERPLANT_GYM_GUIDE2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuide1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuide2Script:
	jumptextfaceplayer PowerPlantGymGuide2PowerPlantUpAndRunningText

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuide4Script:
	jumptextfaceplayer PowerPlantGymGuide4MagnetTrainConsumesElectricityText

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MetManager
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	writetext genesectTradeText
	waitbutton
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

genesectTradeText:
	text "Everyone needs a"
	line "cyborg assassin"
	cont "from the future"
	cont "that doesn't feel"
	cont "pity or remorse or"
	cont "fear to protect"
	cont "them from the AI"
	cont "overlords."
	done

PowerPlantBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlantOfficer1ApproachGymGuide2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "This Power Plant"
	line "has ultra high"
	cont "security."
	para "You better be well"
	line "behaved or I'll"
	cont "deal with you"
	cont "myself."
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Everyone!"
	para "I just received"
	line "word from"
	cont "Cerulean, a Team"
	cont "Rocket member has"
	cont "been spotted."
	para "He must be the one"
	line "who stole the"
	cont "thingy!"
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "I must ask you to"
	line "get the thingy"
	cont "back and save my"
	cont "job!"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "You retrieved the"
	line "thingy and saved"
	cont "my job!"
	para "It will never"
	line "happen again."
	para "I swear it!"
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Someone has stolen"
	line "the heart from the"
	cont "generator."
	para "This feeling."
	para "My heart is torn"
	line "asunder!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "I don't understand"
	line "how the thief"
	cont "stole the"
	cont "capacitor."
	para "It would mean the"
	line "reactor was open."
	cont "But it couldn't be"
	cont "open, it's"
	cont "protected by three"
	cont "magnetic fields."
	para "Do you see!"
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "With the threat of"
	line "war Kanto needs"
	cont "all the power we"
	cont "can generate."
	para "Remove the control"
	line "rods, full power"
	cont "now!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "Our Manager is"
	line "very protective of"
	cont "the generator and"
	cont "has a short"
	cont "temper."
	para "If you damage the"
	line "generator you'll"
	cont "be getting his"
	cont "Body Slam!"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "You have no idea"
	line "how thankful I am"
	cont "for you fixing the"
	cont "generator."
	para "The Manager was"
	line "going take turns"
	cont "giving us all a"
	cont "Body Slam!"
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "Kanto requires a"
	line "lot of power."
	para "The Magnet Train"
	line "and Radio Tower"
	cont "draw a lot but it's"
	cont "nothing compared"
	cont "to one of LT"
	cont "Surges rock"
	cont "concerts!"
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "AARRRAGGG!!!"
	para "Look at how they"
	line "massacred my"
	cont "generator!"
	para "The Flux Capacitor"
	line "has been stolen!"
	para "AAARRRR!"
	para "When I find the"
	line "person that did"
	cont "this..."
	para "I'm going to lift"
	line "them above my head"
	cont "and Body Slam"
	cont "them to death!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "I won't let anyone"
	line "hurt my generator!"
	para "My Body Slam is"
	line "eager to crush"
	cont "anyone who would"
	cont "dare."
	para "You're a good"
	line "generator, yes you"
	cont "are!"
	done

PowerPlantManagerThatsThePartText:
	text "You..."
	para "That's..."
	para "That's the Flux"
	line "Capacitor!!"
	para "I need it!"
	para "Give it to me now!"
	done

PowerPlantManagerTakeThisTMText:
	text "You have made a"
	line "wise choice."
	para "Here, I bestow"
	line "upon you my mighty "
	cont "weapon."
	done

PowerPlantManagerTM07IsZapCannonText:
	text "Body Slam is a"
	line "strong and"
	cont "reliable move that"
	cont "can paralyse your"
	cont "enemy if executed"
	cont "just right."
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "My dear generator,"
	line "I will never let"
	cont "anyone hurt you"
	cont "again!"
	para "NEVER!"
	para "You are my"
	line "beautiful"
	cont "generator."
	done

PowerPlantBodySlam:
	itemball TM_BODY_SLAM

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
	object_event 17, 17, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ZapdosScript, EVENT_CAUGHT_ZAPDOS
	object_event 34,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlantBodySlam, EVENT_BODY_SLAM
