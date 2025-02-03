	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER
	const ELMSLAB_MUM
	const ELMSLAB_DAD
	const ELMSLAB_PARENTS_ELM
	const ELMSLAB_CYNTHIA

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	sdefer .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
    disappear ELMSLAB_MUM
    disappear ELMSLAB_DAD
    disappear ELMSLAB_PARENTS_ELM
    disappear ELMSLAB_CYNTHIA
    checkevent EVENT_GOT_A_POKEMON_FROM_ELM
    iftrue .cont
    appear ELMSLAB_CYNTHIA
.cont
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
	waitbutton
	closetext

	applymovement ELMSLAB_ELM, ElmsLabMovement_ElmIntroduceCynthia
	turnobject PLAYER, UP
	opentext
	writetext ElmText_ThisIsCynthia
	waitbutton
	closetext

    playmusic MUSIC_RED_INDIGO_PLATEAU
	applymovement ELMSLAB_CYNTHIA, ElmsLabMovement_CynthiaApproaches
	opentext
	writetext ElmsLabCynthiaIntroText
	waitbutton
	closetext

	turnobject ELMSLAB_CYNTHIA, LEFT
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmsLabCynthiaByeElmText
	waitbutton
	closetext

	opentext
	writetext ElmsLabElmStevenText
	waitbutton
	closetext

	turnobject ELMSLAB_CYNTHIA, RIGHT
	opentext
	writetext ElmsLabCynthiaResolveText
	waitbutton
	closetext

    applymovement ELMSLAB_CYNTHIA, ElmsLabMovement_CynthiaBesidePlayer
    turnobject PLAYER, RIGHT
	opentext
	writetext ElmsLabCynthiaGoodluckText
	waitbutton
	closetext

	applymovement ELMSLAB_CYNTHIA, ElmsLabMovement_CynthiaLeaves
	disappear ELMSLAB_CYNTHIA

	applymovement ELMSLAB_ELM, ElmsLabMovement_ElmReturns
	turnobject PLAYER, LEFT

    special FadeOutMusic
    opentext
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	special RestartMapMusic
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmConversation
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmConversation:
    checkevent EVENT_BEAT_WALLACE
    iftrue .beatWallaceText
    checkevent EVENT_BEAT_ELITE_FOUR
    iftrue .beatEliteFourText
    checkevent EVENT_CLEARED_RADIO_TOWER
    iftrue .clearedRocketsText
    checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
    iftrue .standard
    checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
    iftrue .standard
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
.standard
    writetext ElmStandardText
    waitbutton
    closetext
    end
.beatWallaceText
    writetext ElmBeatWallaceText
    waitbutton
    closetext
    end
.beatEliteFourText
    writetext ElmBeatEliteFourText
    waitbutton
    closetext
    end
.clearedRocketsText
    writetext ElmBeatRocketsText
    waitbutton
    closetext
    end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIMCHAR
	cry CHIMCHAR
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIMCHAR
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIMCHAR, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic FROAKIE
	cry FROAKIE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, FROAKIE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke FROAKIE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TREECKO
	cry TREECKO
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TREECKO
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TREECKO, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_CUSTOM_1
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	verbosegiveitem CLEAR_BELL
	writetext ClearBellTips
	waitbutton
	writetext ElmKantoExplainText
	waitbutton
	closetext
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setmapscene ELMS_LAB, SCENE_CUSTOM_1
	setmapscene NEW_BARK_TOWN, SCENE_CUSTOM_FINISHED
	setevent EVENT_GOT_CLEAR_BELL
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
    scall AideScript_GivePocketPC
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	scall AideScript_GivePocketPC
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem RARE_CANDY
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_GivePocketPC:
	opentext
	writetext AideText_GetPocketPCText
	promptbutton
	verbosegiveitem POCKET_PC
	writetext AideText_PocketPCInfoText
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	opentext
	writetext AideText_ExplainCaps
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
    checkevent EVENT_BEAT_WALLACE
    iftrue .afterWallace
    checkevent EVENT_BEAT_DAD
    iftrue .afterDad
    checkevent EVENT_CLEARED_RADIO_TOWER
    iftrue .afterRockets
	writetext AideText_ExplainCaps
	waitbutton
	closetext
	end
.afterWallace
	writetext AideText_AfterWallace
	waitbutton
	closetext
	end
.afterDad
	writetext AideText_AfterDad
	waitbutton
	closetext
	end
.afterRockets
	writetext AideText_AfterRockets
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	;setscene SCENE_ELMSLAB_NOTHING
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2: ; unreferenced
	jumpstd TrashCanScript

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmsLabMovement_ElmIntroduceCynthia:
    step UP
    turn_head DOWN
    step_end

ElmsLabMovement_CynthiaApproaches:
    slow_step DOWN
    step_end

ElmsLabMovement_CynthiaBesidePlayer:
    slow_step RIGHT
    slow_step DOWN
    turn_head LEFT
    step_end

ElmsLabMovement_CynthiaLeaves:
    slow_step DOWN
    slow_step DOWN
    slow_step DOWN
    slow_step DOWN
    slow_step DOWN
    step_end

ElmsLabMovement_ElmReturns:
    step DOWN
    turn_head RIGHT
    step_end

ElmBeatWallaceText:
	text "<PLAYER> you have"
	line "become the"
	cont "strongest trainer"
	cont "in the world and a"
	cont "hero that has"
	cont "saved all of us"
	cont "from a life of"
	cont "war."
	para "I am deeply"
	line "honoured to have"
	cont "watched you grow"
	cont "up and presented"
	cont "you with your"
	cont "first #MON."
	para "Never stop"
	line "learning and"
	cont "growing."
	done

ElmBeatEliteFourText:
	text "I can not believe"
	line "you are the first"
	cont "CHAMPION of JOHTO."
	para "That kind of makes"
	line "you my boss!"
	para "The world needs"
	line "people like you."
	para "Your Mum and Dad"
	line "need you too."
	para "Good luck"
	line "<PLAYER>."
	done

ElmBeatRocketsText:
	text "Thank ARCEUS you"
	line "were available to"
	cont "deal with those"
	cont "ROCKETS."
	para "I don't think any"
	line "other trainers"
	cont "around would have"
	cont "been strong"
	cont "enough."
	para "Not even GYM"
	line "LEADERS."
	para "You are a"
	line "remarkable"
	cont "trainer."
	para "You should go"
	line "see the MOVE TUTOR"
	cont "in GOLDENROD if"
	cont "you have 8 badges."
	para "His moves will"
	line "help you I am"
	cont "sure."
	done

ElmStandardText:
	text "It's a wonderful"
	line "thing to be a"
	cont "#MON trainer."
	para "But not all"
	line "trainers are good."
	para "Put your faith in"
	line "your #MON and"
	cont "yourself."
	para "You know right"
	line "from wrong"
	cont "<PLAYER>."
	done

ElmText_ThisIsCynthia:
    text "Let me introduce"
    line "you."

    para "This is CYNTHIA."

    para "She is CHAMPION"
    line "of the SINNOH"
    cont "region."
    done

ElmsLabCynthiaIntroText:
    text "Hello <PLAYER>."

    para "PROF ELM has told"
    line "me today you have"
    cont "chosen to begin"
    cont "your #MON"
    cont "training."

    para "I envy you."

    para "To experience it"
    line "all again for the"
    cont "first time."

    para "You have a great"
    line "adventure ahead"
    cont "of you."

    para "And a big"
    line "responsibility."

    para "People need strong"
    line "trainers to give"
    cont "them hope in these"
    cont "fractious times."
    done

ElmsLabCynthiaByeElmText:
    text "I must take my"
    line "leave now."

    para "There is much"
    line "to be done."

    para "Thank you for"
    line "your help PROF."

    para "There may be"
    line "hope yet."
    done

ElmsLabElmStevenText:
    text "Glad to be of"
    line "help!"

    para "The evidence is"
    line "clear."

    para "STEVEN may still"
    line "be alive."

    para "Many in HOENN"
    line "remain loyal to"
    cont "him rather than"
    cont "WALLACE."

    para "We must try to"
    line "find him."
    done

ElmsLabCynthiaResolveText:
    text "I know he lives."

    para "I will find him."
    done

ElmsLabCynthiaGoodluckText:
    text "Enjoy your"
    line "adventure."

    para "No matter which"
    line "#MON you choose"
    cont "it will serve you"
    cont "well and become a"
    cont "life long friend."

    para "Good luck."
    done


ElmText_Intro:
	text "Ah <PLAYER>"
	line "good to see you!"

	para "Today is your big"
	line "day!"

	para "Sorry I was just"
	line "finishing up"
	cont "here."
	done

ElmText_ResearchAmbitions:
	text "There is a lot"
	line "going on in the"
	cont "world."

	para "As you know"
	line "better than most."

	para "I'm sorry about"
	line "your father."

	para "But CYNTHIA is"
	line "right!"

	para "You are about to"
	line "start a great big"
	cont "adventure."

	para "Now let's choose"
	line "your partner on"
	cont "this journey."
	done


ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "You'll take"
	line "CHIMCHAR, the"
	cont "FIRE #MON?"
	done

TakeTotodileText:
	text "Do you want"
	line "FROAKIE, the"
	cont "WATER #MON?"
	done

TakeChikoritaText:
	text "So, you like"
	line "TREECKO, the"
	cont "GRASS #MON?"
	done

DidntChooseStarterText:
	text "Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "PROF OAK is"
	line "visiting a friend"
	cont "just NORTH of"
	cont "CHERRYGROVE."

	para "He has sensitive"
	line "information just"
	cont "for you."
	done

ElmDirectionsText2:
	text "If your #MON"
	line "are hurt you can"
	cont "heal them with"
	cont "this machine."
	para "My aide has a"
	line "POCKET PC you can"
	cont "use to heal your"
	cont "#MON anywhere."
	done

ElmDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "PROF OAK is a"
	line "famous Professor"
	cont "from KANTO."

	para "He used to be a"
	line "trainer and is"
	cont "researching ways"
	cont "to make trainers"
	cont "stronger."

	para "He is visiting"
	line "MR.#MON who"
	cont "is a secret agent."

	para "He can be a bit"
	line "paranoid."
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmAfterTheftText1:
	text "<PLAY_G>, this"
	line "is terrible…"

	para "So you met the"
	line "secret AGENT."

	para "Did he give you"
	line "anything?"
	done

ElmAfterTheftText2:
	text "<PLAYER> handed"
	line "the MYSTERY EGG to"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "This is"
	line "an EGG of a"
	cont "FAIRY #MON."
	done

ElmAfterTheftText4:
	text "FAIRY types have"
	line "few weaknesses"
	cont "and many good"
	cont "resistances."

	para "The #MON in"
	line "this EGG may be"
	cont "useful."
	done

ElmAfterTheftText5:
	text "PROF.OAK gave you"
	line "a #DEX?"

	para "It is a vital"
	line "tool for all"
	cont "trainers."

	para "It provides info"
	line "on all #MON."

	para "Including their"
	line "special ability"
	cont "and location."

	para "You are ready now"
	line "to start your"
	cont "training."

	para "You need to seek"
	line "out #MON GYMS"
	cont "and defeat the"
	cont "GYM LEADERS."

	para "When you have"
	line "beaten all 8"
	cont "GYMS, you can"
	cont "take on the ELITE"
	cont "FOUR."

	para "If you defeat"
	line "them, you gain"
	cont "the title of"
	cont "CHAMPION."

	para "The closest GYM"
	line "would be the one"
	cont "in VIOLET CITY."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. The"
	line "road to being"

	para "CHAMPION will"
	line "be a long one."

	para "Before you leave,"
	line "make sure that you"
	cont "talk to your Mum."
	done

AideText_AfterWallace:
	text "You have done it!"
	para "Your level caps"
	line "are gone, you have"
	cont "broken through!"
	para "All it took was"
	line "for you to destroy"
	cont "the whole HOENN"
	cont "army by yourself"
	cont "and save the"
	cont "world."
	done

AideText_AfterDad:
	text "I've never seen a"
	line "CHAMPION battle"
	cont "before."
	para "You destroyed your"
	line "own Dad."
	para "I can't imagine"
	line "level caps higher"
	cont "than yours."
	done

AideText_AfterRockets:
	text "You defeated TEAM"
	line "ROCKET!"
	para "ROCKET executives"
	line "are some seriously"
	cont "dangerous"
	cont "trainers."
	para "I bet your level"
	line "caps are huge."
	done

AideText_ExplainCaps:
    text "Now listen up."

    para "This is important"
    line "information."

    para "The better a"
    line "trainer is, the"
    cont "better they can"
    cont "train and catch"
    cont "#MON."

    para "Makes sense!"

    para "Trainers with"
    line "more BADGES can"
    cont "train #MON"
    cont "to higher levels"
    cont "and catch"
    cont "#MON at"
    cont "higher levels."

    para "There is a"
    line "limit to how"
    cont "high a level"
    cont "you can train a"
    cont "#MON to"
    cont "or catch one at"
    cont "based on which"
    cont "BADGES you have."

    para "You can see"
    line "these on your"
    cont "TRAINER CARD"
    cont "under TRAIN"
    cont "and CATCH."

    para "Becoming a"
    line "better trainer"
    cont "by beating GYMs"
    cont "will increase"
    cont "these limits."

    para "I believe in you."

    para "Good luck!"
    done

ElmGiveMasterBallText1:
	text "Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON"
	line "without fail."

	para "At least there is"
	line "no known #MON"
	cont "strong enough to"
	cont "break out of it."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "CHAMPION <PLAYER>"
	line "There you are!"

	para "Congratulations"
	line "again on becoming"
	cont "the first JOHTO"
	cont "CHAMPION!"

    para "You can now train"
    line "#MON up to"
    cont "level 85."

    para "And capture"
    line "#MON up to"
    cont "level 75."

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "The boat heads"
	line "for KANTO."

	para "There is a secret"
	line "agent onboard"
	cont "awaiting you."
	done

ElmGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAY_G>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"

	para "I have one more"
	line "thing for you!"

	para "This was entrusted"
	line "to me by a strange"
	cont "man who seemed"
	cont "obsessed with you."
	done

ClearBellTips:
    text "It is in some"
    line "way connected to"
    cont "the TIN TOWER in"
    cont "ECRUTEAK CITY."

    para "You should go"
    line "there and check"
    cont "it out."
    done

ElmKantoExplainText:
	text "<PLAYER> now that"
	line "you are the"
	cont "CHAMPION of JOHTO"
	cont "you have immense"
	cont "responsibilities."
	para "Your first"
	line "responsibility is"
	cont "to protect people"
	cont "and #MON."
	para "To do this you"
	line "must ensure the"
	cont "KANTO GYM LEADERS"
	cont "are ready for war."
	para "Go to KANTO and"
	line "challenge the"
	cont "GYMS."
	para "We must all work"
	line "together and be"
	cont "prepared."
	para "Good luck"
	line "<PLAYER>."
	done


AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have this"
	cont "for your errand."
	done

AideText_AlwaysBusy:
	text "If there is"
	line "some secret"
	cont "weapon that can"
	cont "win a war,"
	cont "PROF OAK will find"
	cont "it."
	done

AideText_TheftTestimony:
	text "There was a loud"
	line "noise outside…"

	para "When we went to"
	line "look, someone"
	cont "stole a #MON."

	para "It's unbelievable"
	line "that anyone would"
	cont "do that!"

	para "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Use these on your"
	line "#DEX quest!"
	done

AideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

ElmsLabOfficerText1:
	text "I heard a #MON"
	line "was stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.ELM."

	para "Apparently, it was"
	line "a young male with"
	cont "long, red hair…"

	para "It is believed his"
	line "name is SILVER."

	para "What?"

	para "You battled a"
	line "trainer like that?"

	para "Did you happen to"
	line "get his name?"
	done

ElmsLabOfficerText2:
	text "OK! So <RIVAL>"
	line "was his name."

	para "Thanks for helping"
	line "my investigation!"
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "It's full of empty"
	line "cans of RED"
	cont "TAUROS."
	done

ElmsLabPCText:
	text "ELM is working on"
	line "a paper."
	para "Non-Markovian"
	line "Dynamics of"
	cont "Entangled Stat"
	cont "Augmenting"
	cont "#MON"
	cont "Abilities."
	done

AideText_GetPocketPCText:
	text "Oh, I have this"
	line "for you too."

	para "It's a POCKET PC!"
	done

AideText_PocketPCInfoText:
	text "Use this to manage"
	line "your party"
	cont "remotely."

	para "You can also use"
	line "it to heal your"
	cont "#MON anytime!"

	para "You can use the"
	line "SEL option in the"
	cont "KEY ITEMS menu to"
	cont "quick select the"
	cont "POCKET PC using"
	cont "the SELECT button."

	para "Then you can"
	line "quickly heal your"
	cont "#MON after a"
	cont "battle."
	done

DadBattleScript2:
    checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
    iffalse .end
    checkevent EVENT_BEAT_DAD
    iftrue .end
    applymovement PLAYER, ELmsLabMovement_PlayerLeftDown
    sjump DadBattleScript
.end
    end

DadBattleScript1:
    applymovement PLAYER, ELmsLabMovement_PlayerDown
    sjump DadBattleScript

DadBattleScript:
    showemote EMOTE_SHOCK, PLAYER, 15
    special FadeOutMusic
    opentext
    writetext DadHoldItText
    waitbutton
    closetext
    playmusic MUSIC_INDIGO_PLATEAU
    appear ELMSLAB_DAD
    applymovement ELMSLAB_DAD, ELmsLabMovement_DadEnters
    applymovement PLAYER, ELmsLabMovement_PlayerFaceDad
    turnobject ELMSLAB_ELMS_AIDE, RIGHT

    opentext
    writetext MumHangOnText
    waitbutton
    closetext
    appear ELMSLAB_MUM
    applymovement ELMSLAB_MUM, ELmsLabMovement_MumEnters
    opentext
    writetext MumStopThisText
    waitbutton
    closetext
    turnobject ELMSLAB_DAD, UP
    opentext
    writetext ThisHasToHappenText
    waitbutton
    closetext

    turnobject ELMSLAB_DAD, LEFT
    opentext
    writetext DadWontLetYouText
    waitbutton
    closetext

    appear ELMSLAB_PARENTS_ELM
    applymovement ELMSLAB_PARENTS_ELM, ELmsLabMovement_ElmApproaches
    opentext
    writetext ElmStopThisText
    waitbutton
    closetext

    turnobject ELMSLAB_DAD, UP
    pause 15
    turnobject ELMSLAB_DAD, LEFT
    opentext
    writetext DadBattleBeginsText
    waitbutton
    closetext

    winlosstext DadLosesText, DadWinsText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LT_SURGE, DAD
	loadtrainer LT_SURGE, DAD
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_DAD
	setmapscene ELMS_LAB, SCENE_CUSTOM_FINISHED

	applymovement ELMSLAB_MUM, ELmsLabMovement_MumToDad
	opentext
	writetext MumAreYouOKText
	waitbutton
	closetext

	turnobject ELMSLAB_DAD, DOWN
	pause 15
	turnobject ELMSLAB_DAD, LEFT
	opentext
	writetext DadAcknowledgmentText
	waitbutton
	closetext
	turnobject ELMSLAB_DAD, DOWN
	opentext
	writetext DadGoodbyeText
	waitbutton
	closetext
	applymovement ELMSLAB_DAD, ELmsLabMovement_DadLeaves
	disappear ELMSLAB_DAD

	applymovement ELMSLAB_MUM, ELmsLabMovement_MumFacePlayer
	opentext
	writetext MumGoodbyeText
	waitbutton
	closetext
	applymovement ELMSLAB_MUM, ELmsLabMovement_MumLeaves
	disappear ELMSLAB_MUM

	turnobject PLAYER, UP
	opentext
	writetext ElmsFinalWordsText
	waitbutton
	closetext
	applymovement ELMSLAB_PARENTS_ELM, ELmsLabMovement_ElmLeaves
	disappear ELMSLAB_PARENTS_ELM
	turnobject PLAYER, DOWN
.end
	end

ELmsLabMovement_PlayerLeftDown:
    step LEFT
    step DOWN
    step DOWN
    step DOWN
    step_end

ELmsLabMovement_PlayerDown:
    step DOWN
    step DOWN
    step DOWN
    step_end

DadHoldItText:
    text "<PLAYER>!"

    para "Stop right there!"
    done

ELmsLabMovement_DadEnters:
    step UP
    step UP
    step RIGHT
    step RIGHT
    turn_head LEFT
    step_end

ELmsLabMovement_PlayerFaceDad:
    step DOWN
    turn_head RIGHT
    step_end

MumHangOnText:
    text "Wait you are"
    line "going too far!"
    done

ELmsLabMovement_MumEnters:
    step UP
    step RIGHT
    step RIGHT
    step RIGHT
    step UP
    step UP
    turn_head DOWN
    step_end

MumStopThisText:
    text "We should talk"
    line "about this as"
    cont "a family."

    para "You don't need"
    line "to do this."
    done

ThisHasToHappenText:
    text "I am not taking"
    line "any chances with"
    cont "our family."

    para "We are finally"
    line "back together."

    para "This is the only"
    line "way."
    done

DadWontLetYouText:
    text "<PLAYER> you are"
    line "being told you"
    cont "need to go to"
    cont "KANTO and fight."

    para "I wont let that"
    line "happen."

    para "I know this is"
    line "hypocritical of"
    cont "me."

    para "But I have learnt"
    line "what is important."

    para "I wont let you"
    line "leave."
    done

ELmsLabMovement_ElmApproaches:
    step DOWN
    step DOWN
    step DOWN
    step_end

ELmsLabMovement_ElmLeaves:
    step UP
    step UP
    step UP
    step_end

ElmStopThisText:
    text "<PLAYER> is not"
    line "a child anymore."

    para "<PLAYER> is a"
    line "CHAMPION!"

    para "I don't think"
    line "you realise the"
    cont "gravity of that."

    para "<PLAYER> is one"
    line "of the strongest"
    cont "trainers in the"
    cont "world."

    para "No one can tell"
    line "<PLAYER> what to"
    cont "do."
    done

DadBattleBeginsText:
    text "CHAMPION..."

    para "Hmph!"

    para "I don't care"
    line "what label you"
    cont "use."

    para "<PLAYER> you are"
    line "my child and that"
    cont "will never change."

    para "Now you are not"
    line "leaving."

    para "If I have to stop"
    line "you by force then"
    cont "I will!"
    done

DadLosesText:
    text "...."
    done

DadWinsText:
    text "Come home"
    line "now."
    done

ELmsLabMovement_MumToDad:
    step DOWN
    turn_head LEFT
    step_end

MumAreYouOKText:
    text "Oh my..."

    para "Are you alright?"
    done

DadAcknowledgmentText:
    text "...."

    para "I've never seen"
    line "a CHAMPION in"
    cont "battle before."

    para "...."

	para "We are not as"
	line "helpless as"
	cont "everyone thinks."
	done

DadGoodbyeText:
    text "<PLAYER> you have"
    line "grown so much."

    para "Unlike me..."

    para "Forgive me"
    line "CHAMPION!"
    done

ELmsLabMovement_DadLeaves:
    step DOWN
    step LEFT
    step LEFT
    step DOWN
    step_end

ELmsLabMovement_MumFacePlayer:
    step LEFT
    step LEFT
    step_end

MumGoodbyeText:
    text "I am proud of"
    line "you my dear"
    cont "<PLAYER>."

    para "I can't believe"
    line "how strong you"
    cont "have become."

    para "Thanks for taking"
    line "it easy on your"
    cont "father."

    para "Now go and show"
    line "HOENN that nobody"
    cont "messes with us!"

    para "I love you my"
    line "CHAMPION."
    done

ELmsLabMovement_MumLeaves:
    step DOWN
    step DOWN
    step_end

ElmsFinalWordsText:
    text "You've done the"
    line "right thing"
    cont "<PLAYER>."

    para "Your father wants"
    line "to protect you."

    para "Now he knows it"
    line "is you who will"
    cont "protect him and"
    cont "everyone else."

    para "Now head to"
    line "OLIVINE."

    para "The ship is"
    line "waiting."

    para "Good luck."
    done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2
    coord_event  4,  5, SCENE_CUSTOM_1, DadBattleScript1
	coord_event  5,  5, SCENE_CUSTOM_1, DadBattleScript2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	object_event  4, 11, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_1
	object_event  4, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_2
	object_event  5,  4, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_3
	object_event 4, 2, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CynthiaScript, EVENT_FIELD_MON_4



