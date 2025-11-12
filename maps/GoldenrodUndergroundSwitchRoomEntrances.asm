; block ids
UNDERGROUND_DOOR_CLOSED1 EQU $2a
UNDERGROUND_DOOR_CLOSED2 EQU $3e
UNDERGROUND_DOOR_CLOSED3 EQU $3f
UNDERGROUND_DOOR_OPEN1   EQU $2d
UNDERGROUND_DOOR_OPEN2   EQU $3d

ugdoor: MACRO
UGDOOR_\1_XCOORD EQU \2
UGDOOR_\1_YCOORD EQU \3
ENDM

	;      id,  x,  y
	ugdoor  1,  6, 16
	ugdoor  2,  6, 10
	ugdoor  3,  6,  2
	ugdoor  4, 10,  2
	ugdoor  5, 10, 10
	ugdoor  6, 10, 16
	ugdoor  7,  6, 12
	ugdoor  8,  8, 12
	ugdoor  9,  6,  6
	ugdoor 10,  8,  6
	ugdoor 11, 10, 12
	ugdoor 12, 12, 12
	ugdoor 13, 10,  6
	ugdoor 14, 12,  6
	ugdoor 15, 10, 18
	ugdoor 16, 12, 18

doorstate: MACRO
	changeblock UGDOOR_\1_YCOORD, UGDOOR_\1_XCOORD, UNDERGROUND_DOOR_\2
ENDM

	object_const_def
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_PHARMACIST2
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_ROCKET_GIRL
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_TEACHER
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SUPER_NERD
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL1
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL2
	const GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER

GoldenrodUndergroundSwitchRoomEntrances_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .UpdateDoorPositions

.DummyScene0:
	end

.DummyScene1:
	end

.UpdateDoorPositions:
	checkevent EVENT_SWITCH_4
	iffalse .false4
	doorstate 1, OPEN1
.false4
	checkevent EVENT_SWITCH_5
	iffalse .false5
	doorstate 2, OPEN1
.false5
	checkevent EVENT_SWITCH_6
	iffalse .false6
	doorstate 3, OPEN1
.false6
	checkevent EVENT_SWITCH_7
	iffalse .false7
	doorstate 4, OPEN1
.false7
	checkevent EVENT_SWITCH_8
	iffalse .false8
	doorstate 5, OPEN1
.false8
	checkevent EVENT_SWITCH_9
	iffalse .false9
	doorstate 6, OPEN1
.false9
	checkevent EVENT_SWITCH_10
	iffalse .false10
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
.false10
	checkevent EVENT_SWITCH_11
	iffalse .false11
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
.false11
	checkevent EVENT_SWITCH_12
	iffalse .false12
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
.false12
	checkevent EVENT_SWITCH_13
	iffalse .false13
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
.false13
	checkevent EVENT_SWITCH_14
	iffalse .false14
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
.false14
	endcallback

GoldenrodUndergroundSwitchRoomEntrancesSuperNerdScript:
	jumptextfaceplayer GoldenrodUndergroundSwitchRoomEntrances_SuperNerdText

GoldenrodUndergroundSwitchRoomEntrancesTeacherScript:
	jumptextfaceplayer GoldenrodUndergroundSwitchRoomEntrances_TeacherText

UndergroundSilverScene1:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER, UndergroundSilverApproachMovement1
	turnobject PLAYER, RIGHT
	scall UndergroundSilverBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER, UndergroundSilverRetreatMovement1
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end

UndergroundSilverScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER, UndergroundSilverApproachMovement2
	turnobject PLAYER, RIGHT
	scall UndergroundSilverBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER, UndergroundSilverRetreatMovement2
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end

UndergroundSilverBattleScript:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	setmapscene BURNED_TOWER_1F, SCENE_BURNEDTOWER1F_RIVAL_BATTLE
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_4_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Totodile:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOMENTRANCES_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.FinishRivalBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	end

TrainerBurglarEddie:
	trainer FIREBREATHER, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end

Switch1Script:
	opentext
	writetext SwitchRoomText_Switch1
	promptbutton
	checkevent EVENT_SWITCH_1
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 1
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -1
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

Switch2Script:
	opentext
	writetext SwitchRoomText_Switch2
	promptbutton
	checkevent EVENT_SWITCH_2
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 2
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -2
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

Switch3Script:
	opentext
	writetext SwitchRoomText_Switch3
	promptbutton
	checkevent EVENT_SWITCH_3
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval 3
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	readmem wUndergroundSwitchPositions
	addval -3
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

EmergencySwitchScript:
	opentext
	writetext SwitchRoomText_Emergency
	promptbutton
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	setval 7
	writemem wUndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoomEntrances_DontToggle
	setval 0
	writemem wUndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors

GoldenrodUndergroundSwitchRoomEntrances_DontToggle:
	closetext
	end

GoldenrodUndergroundSwitchRoomEntrances_UpdateDoors:
	readmem wUndergroundSwitchPositions
	ifequal 0, .Position0
	ifequal 1, .Position1
	ifequal 2, .Position2
	ifequal 3, .Position3
	ifequal 4, .Position4
	ifequal 5, .Position5
	ifequal 6, .Position6
	ifequal 7, .EmergencyPosition
.Position0:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Clear6
	scall .Clear7
	scall .Clear8
	scall .Clear9
	scall .Clear10
	scall .Clear11
	scall .Clear12
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position1:
	playsound SFX_ENTER_DOOR
	scall .Set4
	scall .Set10
	scall .Set13
	scall .Clear9
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position2:
	playsound SFX_ENTER_DOOR
	scall .Set5
	scall .Set11
	scall .Set12
	scall .Clear8
	scall .Clear10
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position3:
	playsound SFX_ENTER_DOOR
	scall .Set6
	scall .Set10
	scall .Set13
	scall .Clear7
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position4:
	playsound SFX_ENTER_DOOR
	scall .Set7
	scall .Set11
	scall .Set12
	scall .Clear6
	scall .Clear10
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position5:
	playsound SFX_ENTER_DOOR
	scall .Set8
	scall .Set10
	scall .Set13
	scall .Clear5
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position6:
	playsound SFX_ENTER_DOOR
	scall .Set9
	scall .Set11
	scall .Set12
	scall .Set14
	scall .Clear4
	scall .Clear10
	scall .Clear13
	reloadmappart
	closetext
	end

.EmergencyPosition:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Set6
	scall .Clear7
	scall .Set8
	scall .Set9
	scall .Clear10
	scall .Set11
	scall .Set12
	scall .Clear13
	scall .Set14
	reloadmappart
	closetext
	setval 6
	writemem wUndergroundSwitchPositions
	end

.Set4:
	doorstate 1, OPEN1
	setevent EVENT_SWITCH_4
	end

.Set5:
	doorstate 2, OPEN1
	setevent EVENT_SWITCH_5
	end

.Set6:
	doorstate 3, OPEN1
	setevent EVENT_SWITCH_6
	end

.Set7:
	doorstate 4, OPEN1
	setevent EVENT_SWITCH_7
	end

.Set8:
	doorstate 5, OPEN1
	setevent EVENT_SWITCH_8
	end

.Set9:
	doorstate 6, OPEN1
	setevent EVENT_SWITCH_9
	end

.Set10:
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
	setevent EVENT_SWITCH_10
	end

.Set11:
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
	setevent EVENT_SWITCH_11
	end

.Set12:
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
	setevent EVENT_SWITCH_12
	end

.Set13:
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
	setevent EVENT_SWITCH_13
	end

.Set14:
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
	setevent EVENT_SWITCH_14
	end

.Clear4:
	doorstate 1, CLOSED2
	clearevent EVENT_SWITCH_4
	end

.Clear5:
	doorstate 2, CLOSED2
	clearevent EVENT_SWITCH_5
	end

.Clear6:
	doorstate 3, CLOSED2
	clearevent EVENT_SWITCH_6
	end

.Clear7:
	doorstate 4, CLOSED2
	clearevent EVENT_SWITCH_7
	end

.Clear8:
	doorstate 5, CLOSED2
	clearevent EVENT_SWITCH_8
	end

.Clear9:
	doorstate 6, CLOSED2
	clearevent EVENT_SWITCH_9
	end

.Clear10:
	doorstate 7, CLOSED3
	doorstate 8, OPEN2
	clearevent EVENT_SWITCH_10
	end

.Clear11:
	doorstate 9, CLOSED3
	doorstate 10, OPEN2
	clearevent EVENT_SWITCH_11
	end

.Clear12:
	doorstate 11, CLOSED3
	doorstate 12, OPEN2
	clearevent EVENT_SWITCH_12
	end

.Clear13:
	doorstate 13, CLOSED3
	doorstate 14, OPEN2
	clearevent EVENT_SWITCH_13
	end

.Clear14:
	doorstate 15, CLOSED3
	doorstate 16, OPEN2
	clearevent EVENT_SWITCH_14
	end

GoldenrodUndergroundSwitchRoomEntrancesSmokeBall:
	itemball BLACKBELT_I

GoldenrodUndergroundSwitchRoomEntrancesFullHeal:
	itemball MAX_REVIVE

GoldenrodUndergroundSwitchRoomEntrancesHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_HIDDEN_MAX_POTION

GoldenrodUndergroundSwitchRoomEntrancesHiddenRevive:
	hiddenitem REVIVE, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_HIDDEN_REVIVE

UndergroundSilverApproachMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundSilverApproachMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundSilverRetreatMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

UndergroundSilverRetreatMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

UndergroundSilverBeforeText:
	text "I knew I would" 
    line "find you here!"

    para "I have had some"
    line "past experience"
    cont "with TEAM ROCKET."

    para "I know how they"
    line "operate."

    para "No doubt they"
    line "are hiding the"
    cont "DIRECTOR in here."

    para "I'm looking for"
    line "someone."

    para "TEAM ROCKET must"
    line "know where he is."

    para "You are just going"
    line "to get hurt."

    para "Just like that"
    line "other girl."

    para "Let me convince"
    line "you to stay out"
    cont "of my way."
	done

UndergroundSilverWinText:
	text "I don't understand"
	line "why I keep losing"
	cont "to you!"

	para "What am I"
	line "lacking!"
	done

UndergroundSilverAfterText:
	text "I keep losing!"

	para "I fought the"
	line "ROCKETS at"
	cont "MAHOGANY."

	para "But they had"
	line "already been"
	cont "defeated by"
	cont "that Lance guy."

	para "I fought him"
	line "and was completely"
	cont "destroyed by a"
	cont "single #mon!"

	para "He told me that"
	line "my #mon will"
	cont "never reach their"
	cont "full potential"
	cont "with the way I"
	cont "train them."

	para "Then spouted"
	line "some cliche"
	cont "nonsense about"
	cont "respect and"
	cont "compassion."

	para "Sickening how"
	line "someone so"
	cont "pathetic is so"
	cont "strong!"

	para "I'm going to"
	line "find my own"
	cont "way."

	para "I'll beat the"
	line "ROCKETS and you"
	cont "and even Lance"
	cont "one day."

	para "Mark my words!"
	done

UndergroundSilverLossText:
	text "I told you"
	line "you would get"
	cont "hurt."

	para "I will crush"
	line "these ROCKETS"
	cont "and everyone"
	cont "else."

	para "I'll show Lance"
	line "how effective my"
	cont "training is!"
	done

GoldenrodUndergroundSwitchRoomEntrances_SuperNerdText:
	text "There are some"
	line "aggressive nerds"
	cont "down there."

	para "If they're not"
	line "playing their"
	cont "board games"
	cont "they're battling"
	cont "everyone."
	done

GoldenrodUndergroundSwitchRoomEntrances_TeacherText:
	text "All the weird"
	line "creepy guys"
	cont "hang out down"
	cont "there."

	para "Always playing"
	line "their weird"
	cont "board games"
	cont "and battling."
	done

BurglarEddieSeenText:
	text "They ditched this"
	line "project before"
	cont "they finished."

	para "There must be"
	line "some super"
	cont "secret TEAM"
	cont "ROCKET loot!"
	done

BurglarEddieBeatenText:
	text "You've got to"
	line "pick a pocket"
	cont "or two."
	done

BurglarEddieAfterBattleText:
	text "UNDERGROUND WARE-"
	line "HOUSE?"

	para "What do you want"
	line "to go there for?"

	para "There's nothing"
	line "valuable there."
	done

SwitchRoomText_Switch1:
	text "It's labeled"
	line "SWITCH 1."
	done

GruntF3SeenText:
	text "Wait there!"

	para "There is nothing"
	line "interesting in"
	cont "here."

	para "You should go"
	line "back home."

	para "There is..."

	para "Radiation!"

	para "It is dangerous."
	done

GruntF3BeatenText:
	text "You'll get sick!"
	done

GruntF3AfterBattleText:
	text "If you go in"
	line "there..."

	para "The radiation"
	line "will get you!"

	para "...."

	para "Oh I don't care."

	para "Go rescue the"
	line "DIRECTOR."
	done

SwitchRoomText_OffTurnOn:
	text "It's OFF."
	line "Turn it ON?"
	done

SwitchRoomText_OnTurnOff:
	text "It's ON."
	line "Turn it OFF?"
	done

SwitchRoomText_Switch2:
	text "It's labeled"
	line "SWITCH 2."
	done

SwitchRoomText_Switch3:
	text "It's labeled"
	line "SWITCH 3."
	done

SwitchRoomText_Emergency:
	text "It's labeled"
	line "EMERGENCY."
	done

GoldenrodUndergroundSwitchRoomEntrances_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, GOLDENROD_UNDERGROUND, 6
	warp_event 22, 10, GOLDENROD_UNDERGROUND_WAREHOUSE, 1
	warp_event 23, 10, GOLDENROD_UNDERGROUND_WAREHOUSE, 2
	warp_event  5, 25, GOLDENROD_UNDERGROUND, 2
	warp_event  4, 29, GOLDENROD_CITY, 15
	warp_event  5, 29, GOLDENROD_CITY, 15
	warp_event 21, 25, GOLDENROD_UNDERGROUND, 1
	warp_event 20, 29, GOLDENROD_CITY, 14
	warp_event 21, 29, GOLDENROD_CITY, 14

	def_coord_events
	coord_event 19,  4, SCENE_DEFAULT, UndergroundSilverScene1
	coord_event 19,  5, SCENE_DEFAULT, UndergroundSilverScene2

	def_bg_events
	bg_event 16,  1, BGEVENT_READ, Switch1Script
	bg_event 10,  1, BGEVENT_READ, Switch2Script
	bg_event  2,  1, BGEVENT_READ, Switch3Script
	bg_event 20, 11, BGEVENT_READ, EmergencySwitchScript
	bg_event  8,  9, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomEntrancesHiddenMaxPotion
	bg_event  1,  8, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomEntrancesHiddenRevive

	def_object_events
	object_event  4, 12, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 19, 12, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3, 27, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundSwitchRoomEntrancesTeacherScript, -1
	object_event 19, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundSwitchRoomEntrancesSuperNerdScript, -1
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomEntrancesSmokeBall, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomEntrancesFullHeal, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_FULL_HEAL
	object_event 23,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_GOLDENROD_UNDERGROUND
