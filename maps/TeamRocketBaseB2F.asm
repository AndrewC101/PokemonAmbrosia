	object_const_def
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL
	const TEAMROCKETBASEB2F_DAD

TeamRocketBaseB2F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB2F_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, .TransmitterDoorCallback

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	endcallback

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	endcallback

SaveThenContinueLeft:
    opentext
    writetext SaveGame_TRB
    yesorno
    closetext
    iffalse .turnBack
    opentext
    special TryQuickSave
    closetext
    iffalse .turnBack
    applymovement PLAYER, TRB2F_PlayerUp
    sjump RocketBaseBossFLeft
.turnBack
    applymovement PLAYER, Movement_TRB_TurnBack
    end

SaveThenContinueRight:
    opentext
    writetext SaveGame_TRB
    yesorno
    closetext
    iffalse .turnBack
    opentext
    special TryQuickSave
    closetext
    iffalse .turnBack
    applymovement PLAYER, TRB2F_PlayerUp
    sjump RocketBaseBossFRight
.turnBack
    applymovement PLAYER, Movement_TRB_TurnBack
    end

TRB2F_PlayerUp:
    step UP
    step_end

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
	moveobject TEAMROCKETBASEB2F_DAD, 10, 13
	sjump RocketBaseBossFScript

RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	appear TEAMROCKETBASEB2F_DAD
	opentext
	writetext RocketBaseExecutiveFHoldItText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, RocketBasePlayerApproachesBossFMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseGruntApproachesPlayerMovement
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseBossFApproachesPlayerMovement
	opentext
	writetext RocketBaseBossFThrashText
	waitbutton
	closetext
	special FadeOutMusic
	opentext
	writetext DadRescueText
	waitbutton
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntBacksUpMovement
	turnobject TEAMROCKETBASEB2F_ROCKET1, LEFT
	applymovement TEAMROCKETBASEB2F_DAD, DadApproachesPlayerMovement
	turnobject TEAMROCKETBASEB2F_DAD, DOWN
	turnobject PLAYER, UP
	opentext
	writetext DadExplainText
	waitbutton
	turnobject TEAMROCKETBASEB2F_DAD, RIGHT
	turnobject PLAYER, RIGHT
	writetext RocketsThreatText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseBossBattleMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossBattleMovement

	winlosstext RocketBaseBossLoseText, RocketBaseBossInitialWinText
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
    loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	reloadmap

    special HealParty
    playsound SFX_TACKLE
    applymovement PLAYER, Movement_PlayerLeft
    turnobject PLAYER, RIGHT
    applymovement TEAMROCKETBASEB2F_DAD, Movement_DadDown
    turnobject TEAMROCKETBASEB2F_DAD, RIGHT
	special FadeOutMusic
	opentext
	writetext DadDefeatedText
	waitbutton
	closetext
	opentext
	writetext RocketTauntText
	waitbutton
	closetext

	playmusic MUSIC_DRAGONS_DEN
	opentext
	writetext LanceIntroText
	waitbutton
	closetext
	opentext
	writetext WhoIsThatText
	waitbutton
	closetext
	opentext
	writetext DragoniteAttackText
	waitbutton
	closetext

	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, RocketBaseDragoniteAttacksMovement
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseBossFHitMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseGruntProtectsBossFMovement
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesBossFMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseRocketsDefeatedText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	opentext
	writetext RocketBaseBossDefeatedText
	waitbutton

	writetext RocketBaseBossRetreatText
	waitbutton
	closetext

	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntRunAwayMovement
	;applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseGirlRunAwayMovement
	opentext
	writetext GetThemText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_DAD, RocketBaseDadRunAwayMovement

	opentext
	writetext YouWontGetAway
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, Movement_RocketBaseGirlBossFight
	cry DRAGONITE
	applymovement TEAMROCKETBASEB2F_DRAGON, Movement_DragoniteDefendsPlayer

    setval CHAMPION
	writemem wOtherTrainerClass
	setval LANCE_DRAGONITE
	writemem wOtherTrainerID
	setval BATTLETYPE_BATTLE_FRONTIER
	writemem wBattleType
	special OverridePlayerParty
	setval MUSIC_CHAMPION_BATTLE
	writemem wBattleMusicOverride
	winlosstext RocketBaseBossWinText, RocketBaseBossWinText
    loadvar VAR_BATTLETYPE, BATTLETYPE_WEAK_BATTLE
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmap

	special LoadPokemonData
	special HealParty
	opentext
	writetext ItsNotOverText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseGirlRunAwayMovement
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	;disappear TEAMROCKETBASEB2F_ROCKET2
	;disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	disappear TEAMROCKETBASEB2F_DAD
	special FadeOutMusic
	pause 15
	special FadeInQuickly
	playmusic MUSIC_ROCKET_HIDEOUT
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLancePostBattleText
	waitbutton
	closetext
	disappear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceChecksPlayerMovement
	turnobject PLAYER, UP
	opentext
	writetext RocketBaseLancePowerOffText
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesMachineMovement
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLancePacesMovement
	opentext
	writetext RockerBaseLanceElectrodeFaintText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesElectrodesMovement
	disappear TEAMROCKETBASEB2F_LANCE
	applymovement PLAYER, RocketBasePlayerApproachesElectrodesMovement
	end

YouWontGetAway:
    text "I don't care"
    line "who you are!"

    para "You won't get"
    line "away with this!"
    done

RocketBaseGruntBacksUpMovement:
    big_step RIGHT
    big_step RIGHT
    step_end

DadApproachesPlayerMovement:
    big_step RIGHT
    big_step RIGHT
    big_step RIGHT
    big_step RIGHT
    big_step RIGHT
    step_end

RocketBaseGruntRunAwayMovement:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    big_step RIGHT
    step_end

RocketBaseGirlRunAwayMovement:
    big_step RIGHT
    big_step RIGHT
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    big_step RIGHT
    step_end

RocketBaseDadRunAwayMovement:
    big_step RIGHT
    big_step RIGHT
    big_step RIGHT
    big_step RIGHT
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    step_end

Movement_PlayerLeft:
	fix_facing
	set_sliding
	big_step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

Movement_DadDown:
    big_step DOWN
    step_end

RocketBaseBossBattleMovement:
    step LEFT
    step_end

RocketBaseBossFallbackMovement:
    big_step RIGHT
    big_step RIGHT
    step_end

Movement_RocketBaseGirlBossFight:
    big_step DOWN
    big_step LEFT
    step_end

Movement_DragoniteDefendsPlayer:
    slow_step DOWN
    turn_head RIGHT
    step_end

ItsNotOverText:
    text "UGHHH!"

    para "...."

    para "It's..."

    para "It's not over."

    para "I'll see you"
    line "again."
    done

DadRescueText:
    text "Get away from my"
    line "Kid!"
    done

DadExplainText:
    text "<PLAYER>..."

    para "You have got"
    line "tall."

    para "I'm sorry I had"
    line "to leave."

    para "I wasn't going to"
    line "let the evils of"
    cont "this world come to"
    cont "you."

    para "I'm going to"
    line "protect you."

    para "Now stay back."
    done

RocketsThreatText:
    text "How touching!"

    para "But you are in"
    line "no position to"
    cont "protect anyone."

    para "You have both"
    line "decided to make"
    cont "enemies of us."

    para "And we have"
    line "learnt that we"
    cont "must punish our"
    cont "enemies severely."
    done

DadDefeatedText:
    text "UH..."

    para "I'm sorry <PLAYER>."

    para "I have failed you."

    para "What kind of"
    line "father am I!"

    para "Please let <PLAYER>"
    line "go!"

    para "I beg you..."
    done

RocketTauntText:
    text "Now this is one"
    line "pathetic sight."

    para "Making an enemy"
    line "of us was the"
    cont "last mistake you"
    cont "two will ever"
    cont "make."
    done

LanceIntroText:
    text "You take perverse"
    line "pride in your"
    cont "effortless"
    cont "cruelty."

    para "I shall shatter"
    line "this pride."
    done

WhoIsThatText:
    text "Who is there?"

    para "Come and give"
    line "your farewells"
    cont "to your friends."
    done

DragoniteAttackText:
    text "Dragonite!"

    para "Outrage!"
    done

RocketBaseRocketsDefeatedText:
    text "UHHHHH....."

    para "AGHHH..."

    para "Cough..."
    line "Cough....."
    done

RocketBaseBossDefeatedText:
    text "The other..."

    para "The other"
    line "intruder..."

    para "Is Champion"
    line "Lance!"

    para "Why were we not"
    line "informed!"

    para "We can't win this."

    para "We must retreat!"
    done

GetThemText:
    text "They are weakened!"

    para "I won't let them"
    line "get away!"
    done

RocketBaseCantLeaveScript:
	applymovement PLAYER, RocketBasePlayerCantLeaveElectrodesMovement
	end

RocketBaseLancesSideScript:
	opentext
	writetext RocketBaseLancesSideText
	waitbutton
	closetext
	applymovement PLAYER, RocketBasePlayerCantGoRightMovement
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealRightMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry MAGNETON
	loadwildmon MAGNETON, 35
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement1
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry MAGNETON
	loadwildmon MAGNETON, 35
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement2
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry MAGNETON
	loadwildmon MAGNETON, 35
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement3
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesElectrodesMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLanceMonMasterText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesBaseMovement
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext RocketBaseDoorNoPasswordText
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext RocketBaseB2FTransmitterText
	waitbutton
	closetext
	end

.Deactivated:
	writetext RocketBaseB2FDeactivateTransmitterText
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THUNDER_WAVE

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem RARE_CANDY, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

RocketBaseLanceLeavesAfterHealMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseLanceLeavesAfterHealRightMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerApproachesBossFMovement:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

RocketBaseBossFApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

RocketBaseGruntApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseDragoniteAttacksMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossFHitMovement:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

RocketBaseBossFFacesPlayerMovement:
	slow_step DOWN
	turn_head LEFT
	step_end

RocketBaseLanceApproachesBossFMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseBossFBattlesPlayerMovement:
	big_step LEFT
	step_end

RocketBaseGruntBattlesLanceMovement:
	big_step LEFT
	step_end

RocketBaseGruntProtectsBossFMovement:
	;big_step LEFT
	big_step UP
	big_step RIGHT
	turn_head LEFT
	step_end

RocketBaseLanceChecksPlayerMovement:
	step RIGHT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesMachineMovement:
	step UP
	step UP
	step UP
	step_end

RocketBaseLancePacesMovement:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesElectrodesMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBasePlayerApproachesElectrodesMovement:
    step UP
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    turn_head UP
    step_end

RocketBasePlayerCantLeaveElectrodesMovement:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerCantGoRightMovement:
	step LEFT
	step_end

RocketBaseLanceLeavesElectrodesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBaseLanceLeavesBaseMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerLeavesElectrodesMovement1:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement2:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement3:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

SaveGame_TRB:
    text "This could get"
    line "dangerous."

    para "Save your game"
    line "to continue?"
    done

Movement_TRB_TurnBack:
    step DOWN
    turn_head UP
    step_end

RocketBaseExecutiveFHoldItText:
	text "Oh well done."
	done

RocketBaseBossFThrashText:
	text "You've done quite"
	line "a number on us."

	para "You must be a"
	line "real little hero."

	para "Well my little"
	line "hero."

	para "It's time you"
	line "learnt that life"
	cont "can be violent,"
	cont "unfair and all"
	cont "too short."
	done

RocketBaseBossLoseText:
	text "Damn you!"
	done

RocketBaseBossInitialWinText:
	text "Such a meager"
	line "display on your"
	cont "last battle."
	done

RocketBaseBossWinText:
	text "If Lance wasn't"
	line "here to save"
	cont "you!"

	para "...."

	para "Lance won't be"
	line "here next time"
	cont "we meet."

	para "Little hero."
	done

RocketBaseBossRetreatText:
	text "It would seem"
	line "our operations"
	cont "here have come"
	cont "to an unexpected"
	cont "end."

	para "However our"
    line "experiments have"
    cont "been a success."

    para "Your small"
    line "victory here"
    cont "means nothing."
	done

RocketBaseLancePostBattleText:
	text "Never have I"
	line "witnessed such"
	cont "a thing."

	para "Dragonite took"
	line "heed of your"
	cont "command as he"
	cont "would mine."

	para "Dragonites judge"
	line "of character is"
	cont "beyond question."

	para "Having earned his"
	line "respect you have"
	cont "more than earned"
	cont "mine."
	done

RocketBaseLancePowerOffText:
	text "Now <PLAYER>"
	line "it is imperative"
	cont "we put an end to"
	cont "this insidious"
	cont "signal."
	done

RockerBaseLanceElectrodeFaintText:
	text "I see..."

	para "This device"
	line "conjures the"
	cont "signal."

	para "Alas..."

	para "I fear the only"
	line "means to stop it"
	cont "is to disconnect"
	cont "the Magneton."

	para "The only way to"
	line "do this is through"
	cont "battle."

	para "They know not"
	line "what they do."

	para "We must liberate"
	line "them from their"
	cont "servitude."
	done

RocketBaseLancesSideText:
	text "You need not"
	line "worry about me."

	para "Focus upon your"
	line "task."
	done

RocketBaseLanceElectrodeDoneText:
	text "The signal has"
	line "ceased."

	para "I am proud of"
	line "what you have"
	cont "achieved here"
	cont "today."

	para "As doubtless your"
	line "father is too."

	para "You exemplify"
	line "strength in"
	cont "every regard."

	para "But our battle"
	line "is not finished."

	para "The battle never"
	line "truly finishes."

	para "Here, consider"
	line "this my gift for"
	cont "your journey."
	done

RocketBaseReceivedHM06Text: ; unreferenced
	text "<PLAYER> received"
	line "HM06."
	done

RocketBaseLanceWhirlpoolText:
	text "That is Whirlpool."

	para "With this a"
	line "#mon can"
	cont "plough through"
	cont "rough waters."

	para "So long as one"
	line "has the Badge"
	cont "of the Mahogany"
	cont "Gym."
	done

RocketBaseLanceMonMasterText:
	text "<PLAYER>."

	para "The path to"
	line "#mon Master"
	cont "is fraught with"
	cont "peril, uncertainty"
	cont "and sacrifice."

	para "Few have ever"
	line "made such a"
	cont "journey."

	para "Now we travel"
	line "the path together."

	para "We shall meet"
	line "again."

	para "Farewell."
	done

LanceHealsText1:
	text "Well done"
	line "<PLAYER>."

	para "The situation"
	line "is more severe"
	cont "than I could have"
	cont "anticipated."

	para "You must be"
	line "steadfast and"
	cont "unyielding."

	para "You are fatigued."

	para "I shall restore"
	line "you."
	done

LanceHealsText2:
	text "It is done."

	para "Now we push forth"
	line "and continue our"
	cont "assault!"

	para "Stay vigilant."
	done

GruntM19SeenText:
	text "Well, well."

	para "A poor little"
	line "punk thinks it"
	cont "is fun to break"
	cont "into restricted"
	cont "places."

	para "You're never"
	line "going to leave!"
	done

GruntM19BeatenText:
	text "Who are you!?"
	done

GruntM19AfterBattleText:
	text "I went exploring"
	line "too when I was"
	cont "younger."

	para "One day I ran"
	line "into some Team"
	cont "Rocket members."

	para "The rest is"
	line "history."
	done

RocketBaseDoorNoPasswordText:
	text "The door's closed…"

	para "It needs a pass-"
	line "word to open."
	done

RocketBaseDoorKnowPasswordText:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the password."

	para "The door opened!"
	done

RocketBaseB2FTransmitterText:
	text "It's the radio"
	line "transmitter that's"

	para "sending the"
	line "sinister signal."

	para "It's working at"
	line "full capacity."
	done

RocketBaseB2FDeactivateTransmitterText:
	text "The radio trans-"
	line "mitter has finally"

	para "stopped its evil"
	line "broadcast."
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	def_coord_events
	coord_event  5, 14, SCENE_DEFAULT, LanceHealsScript1
	coord_event  4, 13, SCENE_DEFAULT, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, SaveThenContinueLeft
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, SaveThenContinueRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	def_bg_events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	def_object_events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_MAGNETON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
	object_event  9, 13, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE

