    object_const_def
    const HALLOFORIGIN_ARCEUS
    const HALLOFORIGIN_OAK
    const HALLOFORIGIN_ARCEUS_POKEBALL
    const HALLOFORIGIN_MEWTWO_POKEBALL
    const HALLOFORIGIN_ZYGARDE_1
    const HALLOFORIGIN_ZYGARDE_2
    const HALLOFORIGIN_ROLEPLAYER

HallOfOrigin_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ArceusAndOak

.ArceusAndOak
    appear HALLOFORIGIN_ZYGARDE_1
    appear HALLOFORIGIN_ZYGARDE_2

	setval WEATHER_NONE
	writemem wFieldWeather

	checkevent EVENT_CAUGHT_ARCEUS
	iftrue .hasArceus
    disappear HALLOFORIGIN_OAK
    disappear HALLOFORIGIN_MEWTWO_POKEBALL
    setevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
    disappear HALLOFORIGIN_ARCEUS_POKEBALL
    setevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
	appear HALLOFORIGIN_ARCEUS
	endcallback
.hasArceus:
	disappear HALLOFORIGIN_ARCEUS
	appear HALLOFORIGIN_OAK
	checkevent EVENT_BEAT_LORD_OAK
	iftrue .end
    appear HALLOFORIGIN_MEWTWO_POKEBALL
    clearevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
    appear HALLOFORIGIN_ARCEUS_POKEBALL
    clearevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
.end
	endcallback

ArceusScript:
	opentext
	writetext ArceusText
	waitbutton
	cry ARCEUS
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ARCEUS, 100
	startbattle

    setval ARCEUS
	special MonCheck
	iftrue .Credits

    special HealParty
    reloadmap
    opentext
    writetext ArceusWinAfterBattleText
    waitbutton
    closetext
    end
.Credits
	dontrestartmapmusic
	reloadmapafterbattle
	warp HALL_OF_ORIGIN, 11, 3
	turnobject PLAYER, UP
	setevent EVENT_CAUGHT_ARCEUS
    special FadeOutMusic
	opentext
	writetext CaughtArceusText
	waitbutton
	closetext
	disappear HALLOFORIGIN_ARCEUS
	pause 15
	appear HALLOFORIGIN_OAK
	opentext
	writetext OakBeatenArceusText
	waitbutton
	verbosegiveitem AMBROSIA
	closetext
	special HealParty
	credits
	end
ArceusWinAfterBattleText:
    text "Dear child."

    para "Strengthen thy"
    line "resolve."

    para "Take up thy sword"
    line "and thy shield"

    para "Let thy faith"
    line "guide thee."
    done
OakBeatenArceusText:
    text "<PLAYER>..."

    para "You achieved the"
    line "unprecedented."

    para "Your destiny is"
    line "fulfilled beyond"
    cont "your knowing."

    para "Now contemplate"
    line "the significance"
    cont "of your great"
    cont "achievement."

    para "You approach"
    line "the event"
    cont "horizon of an"
    cont "immortal rule."

    para "Return to me"
    line "when you are"
    cont "ready to reach"
    cont "the heights of"
    cont "#MON LORD."

    para "Until then take"
    line "this token of my"
    cont "gratitude."
    done
ArceusText:
    text "<PLAYER>"
    line "Thine heart be"
    cont "pure."

    para "Thy salvation"
    line "be upon thee."

    para "Let thine faith"
    line "guide thee."

    para "Wield my power"
    line "unmatched and"
    cont "thou shalt do"
    cont "my wonders."
    done

CaughtArceusText:
    text "Amen."
    done

ArceusPokeBallScript:
    checkevent EVENT_BEAT_LORD_OAK
    iffalse .MustBeatOak
    checkevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
    iftrue .MustBeatOak
    checkevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
    iftrue .MustBeatOak
	cry ARCEUS
	opentext
	writetext TakeArceusText
	yesorno
	iffalse .Refused

	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	disappear HALLOFORIGIN_ARCEUS_POKEBALL
	setevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
	waitsfx
	getmonname STRING_BUFFER_3, ARCEUS
	writetext ReceivedArceusText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ARCEUS, 100, HOLY_CROWN
.Refused
	closetext
	end
.MustBeatOak
    opentext
	writetext MustBeatOakText
	waitbutton
	closetext
	end
.NoRoom
    opentext
	writetext MakeRoomText
	waitbutton
	closetext
	end
MakeRoomText:
    text "Make room in"
    line "your party for"
    cont "this #MON."
    done
TakeArceusText:
    text "You choose"
    line "ARCEUS."
    para "The God #MON"
    done
ReceivedArceusText:
	text "<PLAYER> received"
	line "ARCEUS."
	done

MewtwoPokeBallScript:
    checkevent EVENT_BEAT_LORD_OAK
    iffalse .MustBeatOak
    checkevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
    iftrue .MustBeatOak
    checkevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
    iftrue .MustBeatOak
	cry MEWTWO
	opentext
	writetext TakeMewtwoText
	yesorno
	iffalse .Refused

	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	disappear HALLOFORIGIN_MEWTWO_POKEBALL
	setevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
	waitsfx
	getmonname STRING_BUFFER_3, MEWTWO
	writetext ReceivedMewtwoText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke MEWTWO, 100, BERSERK_GENE
.Refused
	closetext
	end
.MustBeatOak
    opentext
	writetext MustBeatOakText
	waitbutton
	closetext
	end
.NoRoom
    opentext
	writetext MakeRoomText
	waitbutton
	closetext
	end
TakeMewtwoText:
    text "You choose"
    line "MEWTWO."
    para "The Weapon"
    line "#MON"
    done
ReceivedMewtwoText:
	text "<PLAYER> received"
	line "MEWTWO."
	done

MustBeatOakText:
    text "I must defeat"
    line "LORD OAK!"
    done

MasterOakScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LORD_OAK
	iffalse .Fight
    checkevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
    iftrue .FightDone
    checkevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
    iftrue .FightDone
    writetext MasterOakOfferPrizeText
	waitbutton
	closetext
	end
.Fight
    setval 0
    writemem wHandOfGod
	writetext MasterOakIntroText
	waitbutton
	closetext
	winlosstext MasterOakBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LORD_OAK, OAK
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	appear HALLOFORIGIN_ARCEUS_POKEBALL
	clearevent EVENT_ARCEUS_POKEBALL_NOT_PRESENT
	appear HALLOFORIGIN_MEWTWO_POKEBALL
	clearevent EVENT_MEWTWO_POKEBALL_NOT_PRESENT
	setval 0
	writemem wInvading
	setval 1
	writemem wMarkOfGod
	special HealParty
	warp HALL_OF_ORIGIN, 11, 3
	turnobject PLAYER, UP
	opentext
	writetext MasterOakVictoryText
	waitbutton
	checkevent EVENT_BEAT_LORD_OAK
	iftrue .skipMarkOfGod
	writetext MarkOfGodText
	waitbutton
	verbosegiveitem MARK_OF_GOD
.skipMarkOfGod
	closetext
	setevent EVENT_BEAT_LORD_OAK
	opentext
	writetext MasterOakOfferPrizeText
	waitbutton
	closetext
	special HealParty
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext OakWinAfterBattleText
    waitbutton
    closetext
    end
.FightDone:
	writetext MasterOakAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .Fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end

OakWinAfterBattleText:
    text "I think you have"
    line "the potential."

    para "You just need to"
    line "unlearn what you"
    cont "think you know."
    done

MasterOakIntroText:
    text "Hello <PLAYER>!"

    para "I am one who once"
    line "occupied a"
    cont "configuration you"
    cont "would know as"
    cont "PROF OAK."

    para "Alas I have seen"
    line "the birth and"
    cont "demise of"
    cont "universes beyond"
    cont "count since then."

    para "I arrived in this"
    line "state by way of"
    cont "a relentless quest"
    cont "for knowledge."

    para "There are #MON"
    line "with great powers."

    para "Command of time,"
    line "space, reality,"
    cont "life and death."

    para "All these powers"
    line "and more are now"
    cont "exemplified"
    cont "through me."

    para "I seek another."

    para "One who might"
    line "wield my great"
    cont "powers."

    para "Some have come"
    line "close but none"
    cont "have passed my"
    cont "test."

    para "None are destined"
    line "to be a"
    cont "#MON LORD."

    para "You however."

    para "Perhaps you are."
    done

MasterOakBeatenText:
    text "You are worthy."
    done

MasterOakVictoryText:
    text "You are"
    line "victorious."

    para "I am defeated."

    para "I bestow upon you"
    line "powers earned"
    cont "through life"
    cont "immortal."

    para "You are a"
    line "#MON LORD."

    para "Your body is now"
    line "indestructible"
    cont "and immortal."

    para "All your #MON"
    line "shine with power"
    cont "regardless of"
    cont "their stats."

    para "You have access"
    line "to unlimited"
    cont "resources."

    para "And no aggressive"
    line "trainer or #MON"
    cont "will dare to"
    cont "challenge you."
    done

MarkOfGodText:
    text "I bestow upon you"
    line "control of these"
    cont "new powers."
    done

MasterOakOfferPrizeText:
    text "Further I present"
    line "you with a"
    cont "fragment of"
    cont "my power."

    para "I shall impart"
    line "such power with"
    cont "every defeat."

    para "Now choose."
    done

MasterOakAfterBattleText:
    text "My existence has"
    line "found purpose"
    cont "through you."

    para "You shall live"
    line "to view all"
    cont "reality, all"
    cont "space, time and"
    cont "being as a"
    cont "single, beautiful"
    cont "instant."

    para "An instant that"
    line "must be preserved"
    cont "treasured and"
    cont "protected."

    para "You and you alone"
    line "have the power to"
    cont "actualise this"
    cont "goal."
    done

MasterOakBecomeMortalText:
    text "Do you wish to"
    line "remain in your"
    cont "immortal form?"
    done

MasterOakBecomeMortalAfterText:
    text "You are mortal"
    line "once again."
    para "Speak to me if"
    line "wish me to restore"
    cont "your true golden"
    cont "form."
    done

MasterOakBecomeImmortalText:
    text "Do you wish to"
    line "reclaim in your"
    cont "immortal form?"
    done

MasterOakBecomeImmortalAfterText:
    text "You are immortal"
    line "once again."
    para "Speak to me if"
    line "wish me to return"
    cont "to your mortal"
    cont "form."
    done

MasterRedScript:
	faceplayer
    checkevent EVENT_BEAT_MASTER_BLUE
    iffalse .beatOthersFirst
	opentext
	checkevent EVENT_BEAT_MASTER_RED
	iftrue .FightDone
.fight
	writetext MasterRedSeenText
	waitbutton
	closetext
	winlosstext MasterRedBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RED, MASTER_RED
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_RED
	setscene SCENE_FINISHED
	opentext
	writetext MasterRedAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterRedAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.beatOthersFirst
    opentext
	writetext BeatOthersFirstText
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext RedWinAfterBattleText
    waitbutton
    closetext
    end

RedWinAfterBattleText:
    text "You are very"
    line "strong."

    para "You must set up"
    line "your strategy as"
    cont "early as possible."
    done

MasterRedSeenText:
    text "Since I was"
    line "a boy."

    para "My dream has"
    line "never changed."

    para "To be the very"
    line "best."

    para "Like no one"
    line "ever was."

    para "I am closer"
    line "to achieving"
    cont "that now than"
    cont "ever."

    para "Out battle"
    line "will help us"
    cont "both reach"
    cont "our goals."
    done

MasterRedBeatenText:
    text "You love"
    line "#MON."
    done

MasterRedAfterBattleText:
    text "You must go"
    line "forward and let"
    cont "nobody tell you"
    cont "it's impossible!"
    done

BeatOthersFirstText:
    text "Hello <PLAYER>."

    para "This is the"
    line "HALL OF ORIGIN."

    para "ARCEUS waits to"
    line "present itself"
    cont "to whichever"
    cont "one of you is"
    cont "the strongest."

    para "First you must"
    line "defeat the"
    cont "others."

    para "Then if you"
    line "can defeat"
    cont "BLUE I will"
    cont "test you."

    para "Should you pass"
    line "you are worthy"
    cont "to speak with"
    cont "ARCEUS."

    para "If you conquer"
    line "ARCEUS..."

    para "The great one"
    line "will no doubt"
    cont "want to speak"
    cont "to you."
    done

MasterLanceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_LANCE
	iftrue .FightDone
.fight
	writetext MasterLanceSeenText
	waitbutton
	closetext
	winlosstext MasterLanceBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CHAMPION, MASTER_LANCE
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_LANCE
	opentext
	writetext MasterLanceAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterLanceAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext LanceWinAfterBattleText
    waitbutton
    closetext
    end

LanceWinAfterBattleText:
    text "You fight with"
    line "passion and"
    cont "conviction."

    para "You will defeat"
    line "me I have no"
    cont "doubt."
    done

MasterLanceSeenText:
	text "The day has"
	line "finally come."
	para "I knew your"
	line "arrival here was"
	cont "an inevitability."
	para "As is the outcome"
	line "of our final duel."
	para "Now claim your"
	line "destiny and defeat"
	cont "me!"
    done

MasterLanceBeatenText:
    text "I yield."
    done

MasterLanceAfterBattleText:
	text "You <PLAYER> have"
	line "transcended all"
	cont "that besets you."
	para "You are DRAGON"
	line "incarnate."
	para "Destined to peirce"
	line "the heavens and"
	cont "raise above all."
	done

MasterBlueScript:
	faceplayer
    checkevent EVENT_BEAT_MASTER_LANCE
    iffalse .beatOthersFirst
	opentext
	checkevent EVENT_BEAT_MASTER_BLUE
	iftrue .FightDone
.fight
	writetext MasterBlueSeenText
	waitbutton
	closetext
	winlosstext MasterBlueBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BLUE, MASTER_BLUE
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_BLUE
	opentext
	writetext MasterBlueAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterBlueAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.beatOthersFirst
    opentext
	writetext BeatOthersFirstBlueText
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext BlueWinAfterBattleText
    waitbutton
    closetext
    end

BlueWinAfterBattleText:
    text "I have to say."

    para "That victory felt"
    line "good."

    para "I feel like my"
    line "old self again."

    para "Thanks."
    done

MasterBlueSeenText:
    text "When I was young"
    line "I was arrogant."

    para "I knew I was"
    line "right and I"
    cont "I was better"
    cont "than any other."

    para "I was such a"
    line "child."

    para "Now I know the"
    line "burden and the"
    cont "power that comes"
    cont "from a need to"
    cont "protect those"
    cont "who can not do"
    cont "so themselves."

    para "Still, I yearn"
    line "to be filled with"
    cont "my old confidence"
    cont "again."

    para "Maybe you can"
    line "help me find"
    cont "it."
    done

MasterBlueBeatenText:
    text "Not bad, kid."
    done

MasterBlueAfterBattleText:
    text "Our battle gave"
    line "me focus."

    para "It helped me"
    line "feel like my"
    cont "old self."

    para "What was it I"
    line "used to say..."

    para "Smell ya later!"

    para "Defeat RED!"

    para "Then conquer"
    line "ARCEUS."

    para "Then he will"
    line "appear."

    para "And you will"
    line "see how far all"
    cont "of us still have"
    cont "to go in our"
    cont "quest to be the"
    cont "best."
    done

BeatOthersFirstBlueText:
    text "Hey challenger!"

    para "So you think you"
    line "are worthy to"
    cont "have an audience"
    cont "with ARCEUS."

    para "You must prove"
    line "yourself the"
    cont "strongest."

    para "Then I will"
    line "test you."

    para "RED wont even"
    line "get the chance"
    cont "to fight you."
    done

MasterGreenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_GREEN
	iftrue .FightDone
.fight
	writetext MasterGreenSeenText
	waitbutton
	closetext
	winlosstext MasterGreenBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEAF, MASTER_GREEN
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_GREEN
	opentext
	writetext MasterGreenAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterGreenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext GreenWinAfterBattleText
    waitbutton
    closetext
    end

GreenWinAfterBattleText:
    text "You remind me so"
    line "much of RED."

    para "Except I can't"
    line "beat him."

    para "Good battle!"
    done

MasterGreenSeenText:
    text "Always I have"
    line "lived my life"
    cont "in the shadow"
    cont "of others."

    para "Always chasing"
    line "the success of"
    cont "others."

    para "I never stopped"
    line "to consider my"
    cont "achievements."

    para "Never allowed"
    line "myself to be me"
    cont "without guilt."

    para "Now I know who"
    line "I am."

    para "I will never be"
    line "anyone else."

    para "I am GREEN."

    para "A trainer from"
    line "PALLET TOWN."
    done

MasterGreenBeatenText:
    text "Well done!"
    done

MasterGreenAfterBattleText:
    text "You really are"
    line "the strongest."

    para "I want you to"
    line "march in there"
    cont "and beat RED"
    cont "and BLUE!"

    para "Let them know"
    line "the endless"
    cont "struggle of"
    cont "chasing the"
    cont "success of"
    cont "another."

    para "Though I think"
    line "they already do."
    done

RematchTextHallOfOrigin:
    text "Shall we have"
    line "another match?"
    done

RematchRefuseTextHallOfOrigin:
    text "I will always"
    line "be here."
    done

MustBeatMasterRedScript:
    turnobject PLAYER, DOWN
	opentext
	writetext MustBeatMasterRedScriptText
    waitbutton
    closetext
    applymovement PLAYER, Movement_HallOfOriginTurnBack
    end

MustBeatMasterRedScriptText:
    text "Only the"
    line "strongest"
    cont "may pass."
    done

Movement_HallOfOriginTurnBack:
	step DOWN
	step_end

ReloadMapScript:
	special HealParty
	reloadmap
    end

MasterWallaceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_WALLACE
	iftrue .FightDone
.fight
	writetext MasterWallaceSeenText
	waitbutton
	closetext
	winlosstext MasterWallaceWinText, MasterWallaceLoseText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer WALLACE, MASTER_WALLACE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_WALLACE
	special HealParty
	end
.FightDone:
	writetext MasterWallaceAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext LoseAfterBattleTextMasterWallace
    waitbutton
    closetext
    end

MasterWallaceSeenText:
    text "I loved my"
    line "country."

    para "I loved my"
    line "people."

    para "That has not"
    line "changed."

    para "I will show the"
    line "world that the"
    cont "power and beauty"
    cont "of HOENN is enough"
    cont "to conquer all."
    done

MasterWallaceWinText:
    text "Do you now see"
    line "the beauty of"
    cont "HOENN?"
    done

MasterWallaceLoseText:
    text "I will never"
    line "stop fighting"
    cont "for HOENN."
    done

MasterWallaceAfterBattleText:
    text "I am not"
    line "ashamed of my"
    cont "passion for my"
    cont "home land."

    para "But I have done"
    line "horrible things."

    para "I have ruined"
    line "many lives."

    para "I wish I saw it"
    line "earlier."

    para "I don't deserve"
    line "to live."

    para "I'll dedicate the"
    line "rest of my"
    cont "life to make"
    cont "HOENN the defender"
    cont "of the world."
    done

LoseAfterBattleTextMasterWallace:
    text "Do not fear"
    line "your defeat."

    para "HOENN shall defend"
    line "you and everyone."
    done

Zygarde1Script:
	faceplayer
	cry ZYGARDE
	pause 15
	loadwildmon ZYGARDE, 100
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear HALLOFORIGIN_ZYGARDE_1
	end

Zygarde2Script:
	faceplayer
	cry ZYGARDE
	pause 15
	loadwildmon ZYGARDE, 100
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear HALLOFORIGIN_ZYGARDE_2
	end
	
MultiverseRolePlayScript:
    faceplayer
    opentext
    writetext MultiverseIntroText
    yesorno
    iffalse .refused
    special TryQuickSave
    iffalse .refused
    setval 0
    writemem wHandOfGod
	setval BATTLETYPE_BATTLE_FRONTIER
	writemem wBattleType
    writetext MultiverseCharacterChoiceText
	loadmenu .MultiverseCharacterMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Heroes
	ifequal 2, .Villains
	ifequal 3, .Deities
	closetext
	end
.MultiverseCharacterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 7
	dw .MultiverseCharacterMenuData
	db 1 ; default option
.MultiverseCharacterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 3, 1 ; rows, columns
	db 5 ; spacing
	dba .MultiverseCharacterText
	dbw BANK(@), NULL
.MultiverseCharacterText:
	db "HEROES@"
	db "VILLAINS@"
	db "DEITIES@"

.Heroes
    opentext
    writetext MultiverseHeroes1Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_HEROES
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_ZINNIA_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_VILLAINS
	startbattle
	reloadmap

    opentext
    writetext MultiverseHeroes2Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_HEROES
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_DEITIES
	startbattle
	reloadmap

	sjump .endMultiverse

.Villains
    opentext
    writetext MultiverseVillains1Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_VILLAINS
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_CHAMPION_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_DEITIES
	startbattle
	reloadmap

    opentext
    writetext MultiverseVillains2Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_VILLAINS
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_HEROES
	startbattle
	reloadmap

	sjump .endMultiverse

.Deities
    opentext
    writetext MultiverseDeities1Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_DEITIES
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_CHAMPION_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_VILLAINS
	startbattle
	reloadmap

    opentext
    writetext MultiverseDeities2Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval MULTIVERSE_DEITIES
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext MultiverseVictoryText, MultiverseDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, MULTIVERSE_HEROES
	startbattle
	reloadmap

.endMultiverse
	opentext
	writetext MultiverseRolePlayFinalText
	waitbutton
	closetext

    checkevent EVENT_BEAT_ROLEPLAY_7
    iftrue .skipPrize
    opentext
    writetext RolePlay7PrizeText
    waitbutton
    verbosegiveitem AMBROSIA
    closetext
    setevent EVENT_BEAT_ROLEPLAY_7
.skipPrize

	opentext
	writetext MultiverseRolePlayEndText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.refused
    opentext
    writetext MultiverseRolePlayRefusedText
    waitbutton
    closetext
    end

RolePlay7PrizeText:
    text "We finished a"
    line "new game."

    para "Here, take this"
    line "for playing."
    done

MultiverseIntroText:
    text "Hello again"
    line "old friend."

    para "We have had many"
    line "fun games."

    para "With lots of"
    line "fun characters."

    para "Heroes, villains"
    line "and being beyond"
    cont "good and evil."

    para "I think it is"
    line "time for..."

    para "A universe"
    line "crossover!"

    para "Powered up to"
    line "impossible..."

    para "Game breaking"
    line "levels!"

    para "Would you like"
    line "to play?"

    para "You'll have to"
    line "Save your game?"
    done

MultiverseCharacterChoiceText:
    text "Great!"

    para "Which group"
    line "would you like"
    cont "to play as?"
    done

MultiverseHeroes1Text:
    text "You are in a"
    line "strange place."

    para "A desolate land"
    line "with a single"
    cont "huge tower in"
    cont "the distance"
    cont "piercing a red"
    cont "orange sky."

    para "There are others"
    line "with you."

    para "A young woman"
    line "with a pure heart"
    cont "but wielding dark"
    cont "magic."

    para "She speaks with"
    line "an old wizard in"
    cont "a white cloak."

    para "A man with spiky"
    line "hair looks to be"
    cont "working out."

    para "He is happy and"
    line "seeks challenge."

    para "You can tell he"
    line "contains immense"
    cont "power."

    para "One more arrives."

    para "It is a young"
    line "peasant man."

    para "The permanent"
    line "glow in his eyes"
    cont "hides a power"
    cont "greater than any"
    cont "other."

    para "Together you"
    line "make for the"
    cont "tower."

    para "You encounter"
    line "another group."

    para "You recognise"
    line "PALPATINE."

    para "They look to"
    line "have been in"
    cont "a fight already."

    para "They attack!"
    done

MultiverseHeroes2Text:
    text "JIREN and GOKU"
    line "engage first."

    para "You go right"
    line "for PALPATINE."

    para "The dark magic"
    line "girl comes to"
    cont "your aid and you"
    cont "take a quick"
    cont "victory."

    para "You then fight"
    line "together and"
    cont "take out"
    cont "NIGHTMARE."

    para "Meanwhile GANDALF"
    line "struggles with"
    cont "MORGANA and"
    cont "SAURON."

    para "At his full"
    line "power MERLIN"
    cont "brings an end"
    cont "to the fight."

    para "As a group you"
    line "make your way"
    cont "to the top of"
    cont "the tower."

    para "There you find"
    line "another group."

    para "The beings all"
    line "seem god like."

    para "They have decided"
    line "all mortals are"
    cont "evil."

    para "You don't care"
    line "who are what"
    cont "they are."

    para "You will protect"
    line "your new friends!"
    done

MultiverseVillains1Text:
    text "You are in a"
    line "strange place."

    para "A large dark"
    line "room within"
    cont "what appears"
    cont "to be a tower."

    para "You are not"
    line "alone."

    para "A large man in"
    line "gold armour sits"
    cont "in a dark corner."

    para "You sense many"
    line "souls within him."

    para "An old man in a"
    line "dark cloak stands"
    cont "pensively in a"
    cont "corner."

    para "The old man"
    line "is not a wizard"
    cont "but commands some"
    cont "kind of force."

    para "Another appears."

    para "An impossibly"
    line "huge and muscular"
    cont "man with grey"
    cont "skin and black"
    cont "eyes."

    para "You sense an"
    line "endless well"
    cont "of power within"
    cont "him."

    para "One more comes!"

    para "You feel fear."

    para "The shadows of"
    line "the room take"
    cont "shape."

    para "Its pure evil"
    line "excites you."

    para "The muscular man"
    line "seems immune to"
    cont "its presence."

    para "Together you head"
    line "for the top of the"
    cont "tower."

    para "Another group"
    line "wait there."

    para "One only recognise"
    line "one of them."

    para "AITHUSA the royal"
    line "dragon."

    para "He would make"
    line "a strong ally."

    para "All these beings"
    line "would."

    para "You resolve to"
    line "bend them to"
    cont "your will."
    done

MultiverseVillains2Text:
    text "They are too"
    line "powerful!"

    para "GALADRIEL blasts"
    line "your team apart."

    para "SAURON reaches"
    line "full power and"
   cont "rampages."

    para "Enemies being to"
    line "fall."

    para "Then..."

    para "SAURON crashes"
    line "to the ground!"

    para "A light engulfs"
    line "all!"

    para "ARCEUS is too"
    line "strong."

    para "JIREN intercepts"
    line "the light."

   para "His shirt tears"
   line "apart."

    para "The white light"
    line "gives way to a"
    cont "sunburst red."

    para "...."

    para "The sky clears."

    para "You have won."

    para "You are all"
    line "horribly wounded."

    para "PALPATINE heals"
    line "everyone and"
    cont "informs you of"
    cont "another group"
    cont "away from the"
    cont "tower."

    para "You all rush"
    line "to them."

    para "You see MERLIN!"

    para "You crave revenge!"
    done

MultiverseDeities1Text:
    text "Now you find"
    line "yourself atop"
    cont "a tower."

    para "Have you been"
    line "summoned to grant"
    cont "a wish."

    para "Nobody else is"
    line "here!"

    para "You start to"
    line "grow impatient."

    para "Others appear."

    para "A massive gold"
    line "creature with"
    cont "chains on its"
    cont "arms and legs."

    para "It doesn't move"
    line "or speak."

    para "Just stands in"
    line "reflection."

    para "Like you."

    para "A regal woman"
    line "communicates with"
    cont "a similarly regal"
    cont "looking dragon."

    para "Their magic is"
    line "ancient and pure."

    para "Like you."

    para "Your body moves"
    line "by itself."

    para "You are curled"
    line "on the ground."

    para "Everyone is."

    para "The sky changes"
    line "to a bright"
    cont "golden glow."

    para "A being that even"
    line "you can only"
    cont "describe as..."

    para "God."

    para "ARCEUS takes its"
    line "place above the"
    cont "group."

    para "You become aware"
    line "of five more"
    cont "beings making"
    cont "their way up"
    cont "the tower."

    para "They summit and"
    line "look upon your"
    cont "group."

    para "You sense their"
    line "dark ambitions."

    para "They attack!"
    done

MultiverseDeities2Text:
    text "You sense the"
    line "titanic powers"
    cont "of your group"
    cont "crushing your"
    cont "foes."

    para "Then a darkness"
    line "takes hold."

    para "SAURON is at"
    line "full power."

    para "Your team mates"
    line "fall."

    para "But a warmth"
    line "grows..."

    para "It burns!"

    para "ARCEUS dispenses"
    line "judgement."

    para "SAURON falls."

    para "All foes fall."

    para "Except one."

    para "JIREN powers up."

    para "A power that can"
    line "overcome anything."

    para "Unless you can"
    line "stop him!"

    para "PALPATINE freezes"
    line "you from the"
    cont "shadows but you"
    cont "break free."

    para "With the last of"
    line "your strength"
    cont "you interrupt"
    cont "JIRENs power up."

    para"Just long enough"
    line "for ARCEUS to"
    cont "finish the group."

    para "ARCEUS heals"
    line "everyone."

    para "Some time passes."

    para "None of you seem"
    line "in any hurry."

    para "Time is no"
    line "concern to the"
    cont "immortal."

    para "Another group"
    line "reaches the top"
    cont "with you."

    para "They are mortal."

    para "All mortal beings"
    line "are driven to"
    cont "evil by their"
    cont "desire to exist"
    cont "beyond their time."

    para "You must end"
    line "suffering by"
    cont "bringing an"
    cont "end to this"
    cont "group."
    done

MultiverseRolePlayFinalText:
    text "The fighting"
    line "draws on."

    para "Why are we here?"

    para "What are we all"
    line "fighting for?"

    para "...."

    para "You are back!"

    para "You wonder was"
    line "any of that real."

    para "What even is real?"

    para "Are we real?"

    para "Is this real?"

    para "Or are we all"
    line "part of another"
    cont "persons roleplay"
    cont "game!"
    done

MultiverseRolePlayEndText:
    text "Thanks for that"
    line "last game."

    para "The games that"
    line "matter to us"
    cont "will always be"
    cont "there to come"
    cont "back to."

    para "They are old"
    line "friends."

    para "Like us."
    done

MultiverseRolePlayRefusedText:
    text "It'll be fun."

    para "I promise."
    done

MultiverseVictoryText:
    text "Victory!"
    done

MultiverseDefeatText:
    text "Defeat!"
    done

InvaderMasterPatches:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_PATCHES
	iftrue .FightDone
.fight
	writetext InvaderMasterPatchesSeenText
	waitbutton
	closetext
	winlosstext InvaderMasterPatchesBeatenText, InvaderMasterPatchesVictoryText
	loadtrainer INVADER, MASTER_PATCHES
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle

	setmapscene ORIGIN_ROAD, SCENE_FINISHED
	setflag ENGINE_FLYPOINT_HALL_OF_ORIGIN

	checkevent EVENT_BEAT_MASTER_PATCHES
	iftrue .finish
	setevent EVENT_BEAT_MASTER_PATCHES
	setmapscene HALL_OF_ORIGIN, SCENE_CUSTOM_1
	opentext
	writetext InvaderMasterPatchesAfterText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_PATCHES
	closetext
.finish
	special HealParty
	end
.FightDone:
	writetext InvaderMasterPatchesAfterText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_PATCHES
    closetext
	opentext
	writetext RematchTextPatches
	yesorno
	iftrue .fight
	writetext RematchRefuseTextPatches
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext LoseAfterBattleTextMasterPatches
    waitbutton
    closetext
    applymovement PLAYER, Movement_HallOfOriginTurnBack
    end

LoseAfterBattleTextMasterPatches:
    text "No hard feelings"
    line "friend."
    done

RematchTextPatches:
    text "How about a"
    line "match friend?"
    done

RematchRefuseTextPatches:
    text "Stop by"
    line "anytime."
    done

InvaderMasterPatchesSeenText:
	text "What you again?"
	line "Well, well!"

	para "You've been a"
	line "stranger."

	para "You must be"
	line "searching for"
	cont "the ultimate"
	cont "treasure!"

	para "It's just up"
	line "ahead."

	para "But don't"
	line "get your"
	cont "hopes up."

	para "There is a"
	line "group of max"
	cont "level trainers."

	para "I could not"
	line "defeat them."

	para "Even with my"
	line "cheat codes!"

	para "Oh, you caught"
	line "me!"

	para "Heh heh, this"
	line "is what I do"
	cont "my friend."

	para "The #MON"
	line "I'll be taking"
	cont "from you."

	para "That's the"
	line "real treasure!"
	done

InvaderMasterPatchesBeatenText:
	text "...Oh"
	line "You, I..."
	cont "Let's just"
	cont "calm down."
	done

InvaderMasterPatchesVictoryText:
	text "Phew."
	para "The righteous"
	line "prevail again."
	done

InvaderMasterPatchesAfterText:
	text "No hard"
	line "feelings!"

	para "I'm but a "
	line "humble merchant"
	cont "now."

	para "Go on take a"
	line "look."

	para "It'll shimmer"
	line "you blind."

	para "Heh, heh, heh..."
	done

PatchesAttacks:
    turnobject PLAYER, RIGHT
    sjump InvaderMasterPatches

MasterJoeyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_JOEY
	iftrue .FightDone
.fight
    setval 0
    writemem wHandOfGod
	writetext MasterJoeySeenText
	waitbutton
	closetext
	winlosstext MasterJoeyBeatenText, MasterJoeyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer YOUNGSTER, MASTER_JOEY
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	opentext
	writetext MasterJoeyWinAfterBattleText
	waitbutton
	closetext
	setevent EVENT_BEAT_MASTER_JOEY
	special HealParty
	end
.FightDone:
	writetext MasterJoeyAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHallOfOrigin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHallOfOrigin
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterJoeyLoseAfterBattleText
    waitbutton
    closetext
    end

MasterJoeySeenText:
	text "At last we have"
	line "fulfilled our"
	cont "destiny."
	para "We have claimed"
	line "the infinite stair"
	cont "and reached throne"
	cont "immortal."
	para "Behold the RAT"
	line "GOD!"
	done

MasterJoeyBeatenText:
	text "But how!"
	para "I am in the top"
	line "percentile!"
	para "I break the"
	line "percentiles!"
	done

MasterJoeyWinText:
    text "Pitiful mortal."
    done

MasterJoeyAfterBattleText:
	text "It was always our"
	line "destiny to inherit"
	cont "Godhood."
	para "I say onto thee,"
	line "kneel before us."
	done

MasterJoeyLoseAfterBattleText:
	text "Fear not for the"
	line "RAT GOD is"
	cont "merciful."
	para "Since we are fond"
	line "of you, you shall"
	cont "be spared."
	done

MasterJoeyWinAfterBattleText:
	text "The RAT GOD takes"
	line "pity upon you and"
	cont "blesses you with"
	cont "mercy."
	done

HallOfOrigin_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	coord_event 10, 45, SCENE_ALWAYS, ReloadMapScript
	coord_event 11, 45, SCENE_ALWAYS, ReloadMapScript
	coord_event 12, 45, SCENE_ALWAYS, ReloadMapScript
	coord_event 13, 45, SCENE_ALWAYS, ReloadMapScript
	coord_event 10, 29, SCENE_DEFAULT, PatchesAttacks
	coord_event 11, 29, SCENE_DEFAULT, PatchesAttacks
	coord_event 12, 29, SCENE_DEFAULT, PatchesAttacks
	coord_event 11, 18, SCENE_CUSTOM_1, MustBeatMasterRedScript
	coord_event 12, 18, SCENE_CUSTOM_1, MustBeatMasterRedScript

	def_bg_events

	def_object_events
	object_event 11,  2, SPRITE_ARCEUS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ArceusScript, EVENT_CAUGHT_ARCEUS
	object_event 11,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MasterOakScript, EVENT_TEMP_EVENT_1
	object_event 12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ArceusPokeBallScript, EVENT_ARCEUS_POKEBALL_NOT_PRESENT
	object_event 13,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MewtwoPokeBallScript, EVENT_MEWTWO_POKEBALL_NOT_PRESENT
	object_event 10, 13, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Zygarde1Script, EVENT_FIELD_MON_1
	object_event 13, 13, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Zygarde2Script, EVENT_FIELD_MON_2
	object_event 10, 18, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterRedScript, -1
	object_event  8, 20, SPRITE_LANCE, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterLanceScript, -1
	object_event 15, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MasterGreenScript, -1
	object_event 13, 18, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterBlueScript, -1
	object_event 13, 23, SPRITE_KOGA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterWallaceScript, -1
	object_event 2, 21, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, MultiverseRolePlayScript, -1
	object_event 13, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_SCRIPT, 0, InvaderMasterPatches, -1
	object_event  9, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MasterJoeyScript, -1
