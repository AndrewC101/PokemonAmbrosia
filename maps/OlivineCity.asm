	object_const_def
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_OLIVINE_RIVAL
	const OLIVINECITY_OLIVINE_YUNA
	const OLIVINECITY_CRYSTAL
	const OLIVINECITY_ROLEPLAYER
	const OLIVINECITY_SAILOR3
	const OLIVINECITY_FIELDMON_1
	const OLIVINECITY_FIELDMON_2

OlivineCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Crystal

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

.Crystal
    appear OLIVINECITY_FIELDMON_1
    appear OLIVINECITY_FIELDMON_2
    disappear OLIVINECITY_SAILOR3
    disappear OLIVINECITY_CRYSTAL
    endcallback

OlivineCityRivalSceneBottom:
    checkflag ENGINE_PLAINBADGE
    iffalse .end
    applymovement PLAYER, OlivineCity_PlayerUp
    sjump OlivineCityRivalSceneTop
.end
	end

OlivineCity_PlayerUp:
    step UP
    step_end

OlivineCityRivalSceneTop:
    checkflag ENGINE_PLAINBADGE
    iffalse .end
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityRivalApproachesTopMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear OLIVINECITY_CRYSTAL
	applymovement OLIVINECITY_CRYSTAL, OlivineMovement_CrystalApproaches
	opentext
	writetext OlivineCrystalIntroText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, OLIVINECITY_CRYSTAL, 15
	applymovement OLIVINECITY_CRYSTAL, OlivineMovement_CrystalConfrontSilver
	turnobject PLAYER, DOWN
	opentext
	writetext OlivineCrystalConfrontSilver
	waitbutton
	closetext

	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineMovement_SilverConfrontsCrystal
	opentext
	writetext OlivineSilverConfrontsCrystal
	waitbutton
	closetext

	applymovement OLIVINECITY_CRYSTAL, OlivineMovement_CrystalToSilver
	opentext
	writetext OlivineCrystalChallengeSilver
	waitbutton
	closetext

	opentext
	writetext OlivineSilverFightCrystal
	waitbutton
	closetext

	turnobject OLIVINECITY_CRYSTAL, UP
	opentext
	writetext OlivineCrystalGoodbye
	waitbutton
	closetext

	turnobject PLAYER, RIGHT
	follow OLIVINECITY_CRYSTAL, OLIVINECITY_OLIVINE_RIVAL
	applymovement OLIVINECITY_CRYSTAL, OlivineMovement_CrystalLeaves

	setmapscene OLIVINE_CITY, SCENE_CUSTOM_1
	disappear OLIVINECITY_OLIVINE_RIVAL
	disappear OLIVINECITY_CRYSTAL
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special LoadUsedSpritesGFX
.end
	end

OlivineMovement_CrystalApproaches:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    step_end

OlivineCrystalIntroText:
    text "Hey <PLAYER>."

    para "How are you"
    line "doing?"

    para "I got over my"
    line "GHOST fear!"

    para "I even caught a"
    line "real cute GHOST"
    cont "#mon."

    para "It was all thanks"
    line "to you."

    para "Hey!"

    para "I hear TEAM"
    line "ROCKET have been"
    cont "sighted about.."

    para "Hang on!"
    done

OlivineMovement_CrystalConfrontSilver:
    big_step DOWN
    turn_head LEFT
    step_end

OlivineCrystalConfrontSilver:
    text "I know you."

    para "You stole a"
    line "#mon from"
    cont "PROF.ELM!"

    para "You are a pathetic"
    line "person. You don't"
    cont "even deserve to be"
    cont "called a trainer!"
    done

OlivineMovement_SilverConfrontsCrystal:
    step DOWN
    turn_head RIGHT
    step_end

OlivineSilverConfrontsCrystal:
    text "Yeah I took the"
    line "#mon."

    para "It longed for a"
    line "strong trainer."

    para "It certainly would"
    line "not have found one"
    cont "in NEW BARK TOWN."

    para "You two are proof"
    line "of that."
    done

OlivineMovement_CrystalToSilver:
    step LEFT
    step_end

OlivineCrystalChallengeSilver:
    text "...."

    para "Fight me then."

    para "And the difference"
    line "between us will"
    cont "be clear."

    para "Yours will never"
    line "fight to their"
    cont "fullest for you."

    para "Because you are"
    line "a thief and a"
    cont "coward."
    done

OlivineSilverFightCrystal:
    text "How much can you"
    line "really care about"
    cont "your #mon?"

    para "If you did, you"
    line "wouldn't willingly"
    cont "let me beat them."
    done

OlivineCrystalGoodbye:
    text "<PLAYER> you"
    line "take care."

    para "I'm going to deal"
    line "with this bully"
    cont "once and for all!"
    done

OlivineMovement_CrystalLeaves:
    step RIGHT
    step RIGHT
    step UP
    step RIGHT
    step RIGHT
    step RIGHT
    step UP
    step UP
    step UP
    step UP
    step UP
    step_end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
    jumptextfaceplayer OlivineCityStandingYoungsterPokegearText

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd PokecenterSignScript

OlivineCityMartSign:
	jumpstd MartSignScript

OlivineCityRivalApproachesTopMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalApproachesBottomMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalLeavesTopMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityRivalLeavesBottomMovement:
	step RIGHT
	step RIGHT
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

OlivineCityPlayerStepsAsideTopMovement:
	step DOWN
	turn_head UP
	step_end

OlivineCityPlayerStepsAsideBottomMovement:
	step UP
	turn_head DOWN
	step_end

OlivineCityRivalText:
	text "Why is it I"
	line "run into you"
	cont "everywhere I go!"

	para "I see the fear"
	line "in your eyes."

	para "Don't worry, I'm"
	line "too busy to battle"
	cont "you right now."

	para "The GYM LEADER"
	line "isn't here."

	para "She has one job!"

	para "Sit in the GYM"
	line "and battle any"
	cont "challengers."

	para "It isn't hard."
	done

OlivineCitySailor1Text:
	text "A few years ago"
	line "I fell overboard"
	cont "on a night"
	cont "fishing trip."

	para "I lost my"
	line "bearing and"
	cont "thought I"
	cont "would drown."

	para "I followed a"
	line "light in the"
	cont "distance and"
	cont "another boat"
	cont "found me."

	para "This lighthouse"
	line "saved my life."
	done

OlivineCityStandingYoungsterPokegearText:
	text "I can't get"
	line "to CIANWOOD and"
	cont "relax on the"
	cont "beach."

	para "Maybe CIANWOOD"
	line "isn't the best"
	cont "place to go."

	para "I heard a"
	line "rumour there"
	cont "is a HOENN"
	cont "spy there."
	done

OlivineCitySailor2Text:
	text "There are several"
	line "islands in the"
	cont "sea between here"
	cont "and CIANWOOD."

	para "They are protected"
	line "by fierce waters."

	para "I reckon they all"
	line "connect in a"
	cont "vast cave system."

	para "I bet there are"
	line "strong #mon"
	cont "in there."
	done

OlivineCitySignText:
	text "OLIVINE CITY"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "OLIVINE CITY"
	line "#mon GYM"
	cont "LEADER: JASMINE"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done
	
YunaScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_YUNA_1
	iftrue .FightDone
.fight
	writetext YunaSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_YUNA_1
	iftrue .dontAsk
	opentext
	writetext YunaOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext YunaBeatenText, YunaWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, YUNA_1
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_YUNA_1
	opentext
	writetext YunaAfterBattleText
	waitbutton
    closetext
	end
.FightDone:
	writetext YunaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextYuna
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextYuna
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext YunaWinAfterBattleText
    waitbutton
    closetext
    end
YunaWinAfterBattleText:
    text "Hey it's ok."

    para "You just have"
    line "to keep smiling."

    para "Even when it"
    line "hurts inside."
    done

YunaSeenText:
    text "Hello."

    para "I am YUNA."

    para "I've heard that"
    line "a war is coming."

    para "I can see the"
    line "suffering in"
    cont "the faces of the"
    cont "people."

    para "I can tell you"
    line "are hurting."

    para "You miss your Dad."

    para "I miss mine too."

    para "But as long as"
    line "you remember him"
    cont "he is never"
    cont "really gone."
    done
YunaBeatenText:
    text "Thank you"
    done
YunaWinsText:
    text "Thank you"
    done
YunaOfferFightText:
    text "Would you be"
    line "willing to train"
    cont "with me?"
    done
YunaAfterBattleText:
    text "You are much"
    line "stronger than me."

    para "I wish you good"
    line "luck on your"
    cont "journey."

    para "I hope one of us"
    line "can bring the"
    cont "calm to this"
    cont "world."
    done
RematchTextYuna:
    text "Would you like to"
    line "train again?"
    done
RematchRefuseTextYuna:
    text "Good luck."
    done

DBZRolePlayScript:
    faceplayer
    opentext
    writetext DBZIntroText
    yesorno
    iffalse .refused
    special TryQuickSave
    iffalse .refused
    setval 0
    writemem wHandOfGod
	setval WEATHER_NONE
	writemem wFieldWeather
	setval BATTLETYPE_BATTLE_FRONTIER
	writemem wBattleType
	special FadeOutMusic
	playmusic MUSIC_MISTY_MOUNTAIN
    writetext DBZHeroOrVillainChoiceText
	loadmenu .DBZHeroOrVillainMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Hero
	ifequal 2, .Villain
	closetext
	end
.DBZHeroOrVillainMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .DBZHeroOrVillainMenuData
	db 1 ; default option
.DBZHeroOrVillainMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .DBZHeroOrVillainText
	dbw BANK(@), NULL
.DBZHeroOrVillainText:
	db "Heroes@"
	db "Villains@"

.Hero
    opentext
    writetext DBZCh1HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH1_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_KANTO_GYM_LEADER_BATTLE
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH1_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZCh2HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH2_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_GRUNT
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH2_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZCh3HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH3_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH2_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext DBZCh4HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH4_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH4_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
    writetext DBZGokuOrVegetaHeroText
	loadmenu .DBZGokuOrVegetaMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .GokuHero
	ifequal 2, .VegetaHero
	closetext
	end

.GokuHero
    opentext
    writetext DBZCh5GokuHeroText
    waitbutton
    writetext NewWarriorText
    waitbutton
    closetext
	setval ROLE_PLAYER_SHINY
	writemem wOtherTrainerClass
	setval DBZ_CH5_GOKU
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_GUILE_THEME
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH4_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
	writetext DBZConcText
	waitbutton
	closetext

    checkevent EVENT_BEAT_ROLEPLAY_3
    iftrue .skipPrizeGokuHero
    opentext
    writetext RolePlay3PrizeText
    waitbutton
    verbosegiveitem ASSAULT_VEST
    closetext
    setevent EVENT_BEAT_ROLEPLAY_3
.skipPrizeGokuHero

    opentext
    writetext DBZBonusRoundText
    yesorno
    closetext
    iffalse .stop

	sjump .HeroEnd

.VegetaHero
    opentext
    writetext DBZCh5VegetaHeroText
    waitbutton
    writetext NewWarriorText
    waitbutton
    closetext
	setval ROLE_PLAYER_SHINY
	writemem wOtherTrainerClass
	setval DBZ_CH5_VEGETA
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_GUILE_THEME
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH4_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
	writetext DBZConcText
	waitbutton
	closetext

    checkevent EVENT_BEAT_ROLEPLAY_3
    iftrue .skipPrizeVegetaHero
    opentext
    writetext RolePlay3PrizeText
    waitbutton
    verbosegiveitem ASSAULT_VEST
    closetext
    setevent EVENT_BEAT_ROLEPLAY_3
.skipPrizeVegetaHero

    opentext
    writetext DBZBonusRoundText
    yesorno
    closetext
    iffalse .stop

.HeroEnd
    opentext
    writetext DBZCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_SHINY
	writemem wOtherTrainerClass
	setval DBZ_CH5_GOKU
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_SHINY, DBZ_CH5_VEGETA
	startbattle
	reloadmap

    sjump .DBZEnd

.Villain
    opentext
    writetext DBZCh1VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH1_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_KANTO_GYM_LEADER_BATTLE
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH1_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZCh2VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH2_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_GRUNT
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH2_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZCh3VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH2_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH3_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext DBZBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext DBZCh4VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH4_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_WEAK_BATTLE
	loadtrainer ROLE_PLAYER_NORMAL, DBZ_CH4_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
    writetext DBZGokuOrVegetaVillainText
	loadmenu .DBZGokuOrVegetaMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .GokuVillain
	ifequal 2, .VegetaVillain
	closetext
	end

.GokuVillain
    opentext
    writetext DBZCh5VegetaVillainText
    waitbutton
    writetext PowerSurgingText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH4_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_GUILE_THEME
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_SHINY, DBZ_CH5_VEGETA
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
	writetext DBZConcText
	waitbutton
	closetext

    checkevent EVENT_BEAT_ROLEPLAY_3
    iftrue .skipPrizeGokuVillain
    opentext
    writetext RolePlay3PrizeText
    waitbutton
    verbosegiveitem ASSAULT_VEST
    closetext
    setevent EVENT_BEAT_ROLEPLAY_3
.skipPrizeGokuVillain

    opentext
    writetext DBZBonusRoundText
    yesorno
    closetext
    iffalse .stop

	sjump .VillainEnd

.VegetaVillain
    opentext
    writetext DBZCh5GokuVillainText
    waitbutton
    writetext PowerSurgingText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval DBZ_CH4_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_GUILE_THEME
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_SHINY, DBZ_CH5_GOKU
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MISTY_MOUNTAIN

	opentext
	writetext DBZConcText
	waitbutton
	closetext

    checkevent EVENT_BEAT_ROLEPLAY_3
    iftrue .skipPrizeVegetaVillain
    opentext
    writetext RolePlay3PrizeText
    waitbutton
    verbosegiveitem ASSAULT_VEST
    closetext
    setevent EVENT_BEAT_ROLEPLAY_3
.skipPrizeVegetaVillain

    opentext
    writetext DBZBonusRoundText
    yesorno
    closetext
    iffalse .stop

.VillainEnd
    opentext
    writetext DBZCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_SHINY
	writemem wOtherTrainerClass
	setval DBZ_CH5_VEGETA
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext DBZVictoryText, DBZDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_SHINY, DBZ_CH5_GOKU
	startbattle
	reloadmap

.DBZEnd
    playmusic MUSIC_VIOLET_CITY

	opentext
	writetext DBZRolePlayEndText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.stop
    playmusic MUSIC_VIOLET_CITY
	opentext
	writetext DBZStopText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.refused
    opentext
    writetext DBZRolePlayRefusedText
    waitbutton
    closetext
    end

.DBZGokuOrVegetaMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .DBZGokuOrVegetaMenuData
	db 1 ; default option
.DBZGokuOrVegetaMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .DBZGokuOrVegetaText
	dbw BANK(@), NULL
.DBZGokuOrVegetaText:
	db "Goku@"
	db "Vegeta@"

RolePlay3PrizeText:
    text "We finished a"
    line "new game."

    para "Here, take this"
    line "for playing."
    done

DBZIntroText:
    text "Are you going to"
    line "CIANWOOD?"

    para "Apparently the"
    line "GYM LEADER is a"
    cont "huge DBZ fan."

    para "Would you like to"
    line "play?"

    para "You'll need to"
    line "Save your game?"
    done

DBZHeroOrVillainChoiceText:
    text "Would you like to"
    line "play as the Heroes"
    cont "or the Villains?"
    done

DBZCh1HeroText:
    text "You are GOKU."

    para "The hero of Earth."

    para "You are visiting"
    line "some old friends"
    cont "when a stranger"
    cont "appears."

    para "He claims to be"
    line "an alien."

    para "And he claims to"
    line "be your brother"
    cont "RADITZ."

    para "He tells you to"
    line "kill 100 humans"
    cont "by tomorrow."

    para "You refuse!"

    para "He steals your"
    line "young son."

    para "You can't match"
    line "him."

    para "Only by teaming up"
    line "with your old"
    cont "enemy PICCOLO will"
    cont "you have a chance."
    done

DBZCh1VillainText:
    text "Your space pod"
    line "lands on Earth."

    para "As you emerge, a"
    line "man with something"
    cont "he might consider"
    cont "a weapon appears."

    para "A metal tube"
    line "propels a small"
    cont "projectile in"
    cont "your direction."

    para "You catch it and"
    line "flick it back."

    para "Killing the weak"
    line "creature."

    para "You are here for"
    line "your brother."

    para "When he refuses to"
    line "come with you, you"
    cont "take his son."

    para "Your brother"
    line "approaches meaning"
    cont "to fight."

    para "And it seems he"
    line "is not alone."
    done

DBZCh2HeroText:
    text "You are fatally"
    line "injured."

    para "With his last"
    line "breath RADITZ"
    cont "gloats that his"
    cont "friends are far"
    cont "stronger than"
    cont "him and they are"
    cont "coming."

    para "You pass away."

    para "Over the next"
    line "year you train"
    cont "in Otherworld and"
    cont "your friends train"
    cont "on Earth."

    para "Two space pods"
    line "crash into a city."

    para "Two beings emerge"
    line "and instantly"
    cont "destroy the city."

    para "Your friends try"
    line "to stop them."
    done

DBZCh2VillainText:
    text "Together the two"
    line "fighters are too"
    cont "much."

    para "They fatally"
    line "injure you."

    para "Your friends are"
    line "far stronger than"
    cont "you and they are"
    cont "coming to avenge"
    cont "you."

    para "Deep in space two"
    line "fierce warriors"
    cont "head for earth."

    para "You are VEGETA."

    para "Prince of your"
    line "dead race."

    para "Your pod lands on"
    line "Earth."

    para "You are in a city"
    line "full of people."

    para "With a flick of"
    line "your finger, all"
    cont "their lives end."

    para "A group arrives."

    para "They mean to stop"
    line "you."
    done

DBZCh3HeroText:
    text "You sense the"
    line "lives of your"
    cont "friends fade."

    para "You feel a"
    line "sudden change."

    para "You are alive"
    line "again!"

    para "With your new"
    line "power you fly"
    cont "to the battle."

    para "All you notice"
    line "are the bodies"
    cont "of your friends."

    para "An inferno erupts"
    line "within you."

    para "You will bring"
    line "an end to this!"
    done

DBZCh3VillainText:
    text "One after another"
    line "your foes die."

    para "You feel no"
    line "pleasure."

    para "Unlike NAPPA"
    line "you are too"
    cont "disciplined to"
    cont "allow such an"
    cont "indulgence."

    para "What is this!?"

    para "A massive power"
    line "heading this way"
    cont "and fast!"

    para "A new warrior"
    line "stands before you."

    para "His power level."

    para "It's over 9000!"
    done

DBZCh4HeroText:
    text "You let VEGETA"
    line "flee to space."

    para "You need to head"
    line "to PICCOLO's home"
    cont "planet to acquire"
    cont "DRAGON balls."

    para "With them, you"
    line "can revive your"
    cont "friends."

    para "The journey takes"
    line "months."

    para "You train all the"
    line "way."

    para "You arrive on a"
    line "dead planet."

    para "You sense a power."

    para "Not VEGETA."

    para "Something evil."

    para "FRIEZA, Emperor"
    line "of the universe"
    cont "is here."

    para "He must have"
    line "heard about the"
    cont "DRAGON balls."

    para "You find VEGETA."

    para "He has stolen"
    line "a DRAGON BALL so"
    cont "FRIEZA can't make"
    cont "his wish."

    para "Before you can"
    line "speak together a"
    cont "terrifying"
    cont "presence appears."

    para "FRIEZA is here."

    para "You and VEGETA"
    line "team up to stop"
    cont "him."
    done

DBZCh4VillainText:
    text "This fighter is"
    line "too strong!"

    para "NAPPA is killed."

    para "But VEGETA is"
    line "shown mercy."

    para "On a distant world"
    line "the Emperor of all"
    cont "universe swirls"
    cont "wine in a glass."

    para "You are lord"
    line "FRIEZA."

    para "A servant comes."

    para "He speaks of magic"
    line "balls that can"
    cont "grant a wish."

    para "You could become"
    line "immortal!"

    para "You kill the"
    line "servant for not"
    cont "telling you"
    cont "sooner."

    para "Then head to the"
    line "planet with these"
    cont "DRAGON balls."

    para "You kill everyone!"

    para "There is one ball"
    line "missing."

    para "You sense a life"
    line "form."

    para "Ah VEGETA, and he"
    line "has some friends"
    cont "you don't"
    cont "recognise."

    para "Now to kill them"
    line "and make a wish!"
    done

DBZGokuOrVegetaHeroText:
    text "Things seem"
    line "dire."

    para "Who are you"
    line "rooting for?"
    done

DBZGokuOrVegetaVillainText:
    text "Who will you"
    line "kill first?"
    done

DBZCh5GokuHeroText:
    text "FRIEZA is far"
    line "beyond anything"
    cont "you can hope to"
    cont "survive against."

    para "A flash of light!"

    para "VEGETA falls to"
    line "the ground."

    para "He is gone."

    para "Another flash."

    para "No KRILLIN!"

    para "FRIEZAS finger"
    line "moves..."

    para "Towards GOHAN."
    done

NewWarriorText:
    text "You feel something"
    line "taking over."

    para "You don't fight"
    line "it."

    para "You open your"
    line "eyes as a new"
    cont "warrior."

    para "A SUPER SAIYAN!"

    para "FRIEZA will pay!"
    done

DBZCh5VegetaHeroText:
    text "FRIEZA is far"
    line "beyond anything"
    cont "you can hope to"
    cont "survive against."

    para "A flash of light!"

    para "GOKU falls to"
    line "the ground."

    para "He is gone."

    para "FRIEZA laughs."

    para "You SAIYANS are"
    line "too weak to"
    cont "survive."

    para "That's why I"
    line "cleaned up the"
    cont "universe by"
    cont "destroying your"
    cont "planet."

    para "The words hit"
    line "you in your core."
    done

DBZCh5VegetaVillainText:
    text "You extend your"
    line "finger and with"
    cont "a flash of light."

    para "GOKU falls dead."

    para "You tell VEGETA.."

    para "You SAIYANS are"
    line "too weak to"
    cont "survive."

    para "That's why I"
    line "cleaned up the"
    cont "universe by"
    cont "destroying your"
    cont "planet."
    done

PowerSurgingText:
    text "What's this!"

    para "His power"
    line "is surging!"

    para "He is transformed!"

    para "He glows golden."

    para "But you are not"
    line "afraid."

    para "You are the"
    line "strongest in the"
    cont "universe!"
    done

DBZCh5GokuVillainText:
    text "You extend your"
    line "finger and with"
    cont "a flash of light."

    para "VEGETA falls dead."

    para "You need another."

    para "The little bald"
    line "one will do!"

    para "that felt good."

    para "GOKU cries out."

    para "Such delightful"
    line "screams!"
    done

DBZConcText:
    text "FRIEZA was at"
    line "last defeated."

    para "The DRAGON balls"
    line "were used to"
    cont "revive everyone"
    cont "who was ever"
    cont "killed by him"
    cont "and his army."
    done

DBZCh6Text:
    text "GOKU and VEGETA"
    line "trained together"
    cont "and both reached"
    cont "SUPER SAIYAN."

    para "They have one"
    line "last battle to"
    cont "decide who is"
    cont "truly the best."
    done

DBZRolePlayEndText:
    text "GOKU and VEGETA"
    line "became close"
    cont "rivals."

    para "And close friends."

    para "What a story!"

    para "I'm sure we will"
    line "meet again for"
    cont "another game."
    done

DBZRolePlayRefusedText:
    text "It'll be fun."

    para "I promise."
    done

DBZVictoryText:
    text "Victory!"
    done

DBZDefeatText:
    text "Defeat!"
    done

DBZBreakText:
    text "Would you like to"
    line "continue to the"
    cont "second half of"
    cont "the story?"
    done

DBZBonusRoundText:
    text "That's the end"
    line "of the story."

    para "But would you"
    line "like to have a"
    cont "special bonus"
    cont "round?"
    done

DBZStopText:
    text "OK we will leave"
    line "it there then."

    para "Maybe we can do"
    line "the whole story"
    cont "next time."
    done

StrengthScenePush:
    playsound SFX_TACKLE
    waitsfx
    applymovement PLAYER, Movement_StrengthTop_Approach

    ; fallthrough

StrengthSceneTop:
    appear OLIVINECITY_SAILOR3
    playsound SFX_ENTER_DOOR
    waitsfx
    turnobject PLAYER, UP
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthTop_Approach
    scall StrengthScene
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthTop_Leave
    turnobject OLIVINECITY_SAILOR3, UP
    playsound SFX_ENTER_DOOR
    waitsfx
    disappear OLIVINECITY_SAILOR3
    setmapscene OLIVINE_CITY, SCENE_CUSTOM_FINISHED
    end

StrengthSceneMiddle:
    appear OLIVINECITY_SAILOR3
    playsound SFX_ENTER_DOOR
    waitsfx
    turnobject PLAYER, UP
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthMiddle_Approach
    scall StrengthScene
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthMiddle_Leave
    playsound SFX_ENTER_DOOR
    waitsfx
    disappear OLIVINECITY_SAILOR3
    setmapscene OLIVINE_CITY, SCENE_CUSTOM_FINISHED
    end

StrengthSceneBottom:
    appear OLIVINECITY_SAILOR3
    playsound SFX_ENTER_DOOR
    waitsfx
    turnobject PLAYER, UP
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthBottom_Approach
    scall StrengthScene
    applymovement OLIVINECITY_SAILOR3, Movement_StrengthBottom_Leave
    playsound SFX_ENTER_DOOR
    waitsfx
    disappear OLIVINECITY_SAILOR3
    setmapscene OLIVINE_CITY, SCENE_CUSTOM_FINISHED
    end

StrengthScene:
    opentext
    writetext StrengthText
    waitbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext GotStrengthText
	waitbutton
	closetext
    end

Movement_StrengthTop_Approach:
    step DOWN
    step_end

Movement_StrengthTop_Leave:
    step UP
    step_end

Movement_StrengthMiddle_Approach:
    step DOWN
    step DOWN
    step_end

Movement_StrengthMiddle_Leave:
    step UP
    step UP
    step_end

Movement_StrengthBottom_Approach:
    step DOWN
    step DOWN
    step DOWN
    step_end

Movement_StrengthBottom_Leave:
    step UP
    step UP
    step UP
    step_end

StrengthText:
    text "Hey Kid!"

    para "Have you been"
    line "to the"

    para "BATTLE FRONTIER."

    para "I'm having so"
    line "much fun I've"
    cont "quit my job!"

    para "Told my boss"
    line "to shove this HM"
    cont "right up his"
    cont "behind!"

    para "Here you can"
    line "have it!"
    done

GotStrengthText:
    text "That is STRENGTH."

    para "With it your"
    line "#mon can move"
    cont "boulders!"

    para "My boulder moving"
    line "days are done!"
    done

OlivineCityMon1Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadwildmon AMPHAROS, 31
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear OLIVINECITY_FIELDMON_1
	end

OlivineCityMon2Script:
	faceplayer
	cry POLIWHIRL
	pause 15
	loadwildmon POLIWHIRL, 28
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear OLIVINECITY_FIELDMON_2
	end

OlivineCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event 10, 11, OLIVINE_GYM, 1
	warp_event 25, 11, OLIVINE_TIMS_HOUSE, 1
	warp_event  0,  0, OLIVINE_TIMS_HOUSE, 1 ; inaccessible
	warp_event 29, 11, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 13, 15, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 27, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 27, OLIVINE_PORT_PASSAGE, 2

	def_coord_events
	coord_event 13, 12, SCENE_DEFAULT, OlivineCityRivalSceneTop
	coord_event 13, 13, SCENE_DEFAULT, OlivineCityRivalSceneBottom
	coord_event  7, 22, SCENE_CUSTOM_1, StrengthScenePush
	coord_event  7, 23, SCENE_CUSTOM_1, StrengthSceneTop
	coord_event  7, 24, SCENE_CUSTOM_1, StrengthSceneMiddle
	coord_event  7, 25, SCENE_CUSTOM_1, StrengthSceneBottom

	def_bg_events
	bg_event 17, 11, BGEVENT_READ, OlivineCitySign
	bg_event 20, 24, BGEVENT_READ, OlivineCityPortSign
	bg_event  7, 11, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event  3, 23, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign

	def_object_events
	object_event 26, 27, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 20, 13, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 17, 21, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 10, 11, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event  6, 25, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YunaScript, EVENT_BEAT_ELITE_FOUR
	object_event 18,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event 10, 22, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, DBZRolePlayScript, -1
	object_event  7, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_2
	object_event 28, 13, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OlivineCityMon1Script, EVENT_FIELD_MON_1
	object_event 24, 22, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineCityMon2Script, EVENT_FIELD_MON_1
