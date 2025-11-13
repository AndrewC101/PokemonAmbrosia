	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2
	const BLACKTHORNCITY_ROLEPLAYER
	const BLACKTHORNCITY_FIELDMON_1
	const BLACKTHORNCITY_FIELDMON_2

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

.Santos:
    appear BLACKTHORNCITY_FIELDMON_1
    appear BLACKTHORNCITY_FIELDMON_2
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
    jumptextfaceplayer BlackBeltText_WeirdRadio

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
    faceplayer
    opentext
    checkevent EVENT_GOT_BLACKTHORN_SKARM
    iftrue .normal
    checkevent EVENT_BEAT_BUGSY
    iffalse .giveSkarm
.normal
	writetext BlackthornCooltrainerF2Text
	waitbutton
	closetext
	end
.giveSkarm
    writetext GiveSkarmText
    waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
    giveegg SKARMORY, EGG_LEVEL
    getstring STRING_BUFFER_4, .skarmeggname
    writetext GotBlackthornEggText
    playsound SFX_GET_EGG
	waitsfx
	setevent EVENT_GOT_BLACKTHORN_SKARM
	waitbutton
	closetext
	end
.PartyFull
	writetext BlackthornPartyFullText
	waitbutton
	closetext
	end

.skarmeggname
	db "Egg@"

GiveSkarmText:
	text "Wait a minute!"
	para "You are a new"
	line "trainer!"
	para "And you came"
	line "through Dark Cave!"
	para "You will be a"
	line "great trainer."
	para "Here take this,"
	line "I'm sure you will"
	cont "help it find its"
	cont "full potential."
	done

BlackthornPartyFullText:
    text "You will need to"
    line "make room in your"
    cont "party for this."
    done

GotBlackthornEggText:
    text "Received Egg!"
    done

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript

Text_ClairIsOut:
	text "Are you a"
	line "trainer?"

	para "You don't look"
	line "very strong."

	para "The Gym Leader"
	line "Clair is in the"
	cont "Dragons Den."

	para "She is a very"
	line "busy woman."

	para "I'm afraid she"
	line "doesn't have time"
	cont "for the likes of"
	cont "you."
	done

Text_ClairIsIn:
	text "Clair awaits"
	line "your challenge."

	para "Not that a"
	line "trainer like you"
	cont "would pose any"
	cont "challenge for her."
	done

Text_ClairIsBeaten:
	text "You defeated"
	line "Clair?"

	para "How can that be!"

	para "I've never heard"
	line "of her losing to"

	para "anyone other than"
	line "Lance."
	done

BlackthornGrampsRefusesEntryText:
	text "Only those with"
	line "the heart of"
	cont "the dragon may"
	cont "enter."

	para "The great dragon"
	line "lord decrees it."

	para "You are not"
	line "chosen."

	para "Be gone!"
	done

BlackthornGrampsGrantsEntryText:
	text "Leader Clair has"
	line "permitted your"
	cont "entry."

	para "Her grandfather"
	line "awaits you."

	para "Do not offend"
	line "the great dragon"
	cont "lord."

	para "Lest your days"
	line "find an early end."
	done

BlackBeltText_WeirdRadio:
	text "I came here to"
	line "fight dragons."

	para "But I just spent"
	line "the last four"
	cont "hours playing"
	cont "some RPG game"
	cont "with that guy."

	para "Time to get back"
	line "to the grind!"
	done

BlackthornCooltrainerF1Text:
	text "I lost my"
	line "Remembrall."

	para "Luckily the guy"
	line "who invented it"
	cont "lives in that"
	cont "house down there."

	para "He has a brother"
	line "who can make"
	cont "#mon forget"
	cont "moves."

	para "They like to"
	line "endlessly critique"
	cont "old movies."

	para "They have some"
	line "horrible takes."
	done
	done

BlackthornYoungsterText:
	text "Once I was"
	line "standing right"
	cont "here and I saw"
	cont "Lance as he"
	cont "was visiting."

	para "He is from this"
	line "city."

	para "He is a hero."

	para "I know if war"
	line "comes he will"
	cont "protect us."
	done

MeetSantosText:
	text "SANTOS: …"

	para "It's Saturday…"

	para "I'm SANTOS of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "SPELL TAG…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday…"
	done

BlackthornCooltrainerF2Text:
	text "Welcome to"
	line "Blackthorn."

	para "We are serious"
	line "trainers who"
	cont "dedicate our"
	cont "lives to the"
	cont "great Dragon Lord"
	cont "in Dragons Den."

	para "Of course only"
	line "a handful of"
	cont "people are able"
	cont "to actually enter"
	cont "Dragons Den."
	done

BlackthornCitySignText:
	text "Blackthorn City"

	para "The Dragon SANCTUM"
	done

BlackthornGymSignText:
	text "Blackthorn City"
	line "#mon Gym"
	cont "Leader: Clair"

	para "The Dragon Master."
	done

MoveDeletersHouseSignText:
	text "Move Relearner"
	line "and Deleter."
	done

DragonDensSignText:
	text "Dragon's Den"
	line "Ahead"
	done

BlackthornCityTrainerTipsText:
	text "Trainer Tips"

	para "A #mon holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done
	
LOTRRolePlayScript:
    faceplayer
    opentext
    writetext LOTRIntroText
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
.HeroOrVillain
    writetext LOTRHeroOrVillainChoiceText
	loadmenu .LOTRHeroOrVillainMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Hero
	ifequal 2, .Villain
	sjump .HeroOrVillain
	closetext
	end
.LOTRHeroOrVillainMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .LOTRHeroOrVillainMenuData
	db 1 ; default option
.LOTRHeroOrVillainMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .LOTRHeroOrVillainText
	dbw BANK(@), NULL
.LOTRHeroOrVillainText:
	db "Heroes@"
	db "Villains@"

.Hero
    opentext
    writetext LOTRCh1HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH1_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_LAVENDER
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH1_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh2HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH2_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_GRUNT
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH2_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRHeroConcText
    waitbutton
    closetext

    opentext
    writetext LOTRBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext LOTRCh3HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH3_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH3_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh4HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH4_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_CHAMPION
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH4_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh5HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH5_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH5_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTREndText
    waitbutton
    closetext

    checkevent EVENT_BEAT_ROLEPLAY_4
    iftrue .skipPrizeHero
    opentext
    writetext RolePlay4PrizeText
    waitbutton
    verbosegiveitem CHOICE_BAND
    closetext
    setevent EVENT_BEAT_ROLEPLAY_4
.skipPrizeHero

    opentext
    writetext LOTRBonusRoundText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext LOTRCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH6_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_ZINNIA_BATTLE
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH6_VILLAIN
	startbattle
	reloadmap

	sjump .end

.Villain
    opentext
    writetext LOTRCh1VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH1_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_LAVENDER
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH1_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh2VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH2_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_GRUNT
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH2_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRVillainConcText
    waitbutton
    closetext

    opentext
    writetext LOTRBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext LOTRCh3VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH3_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH3_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh4VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH4_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_CHAMPION
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH4_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTRCh5VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH5_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH5_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext LOTREndText
    waitbutton
    closetext

    checkevent EVENT_BEAT_ROLEPLAY_4
    iftrue .skipPrizeVillain
    opentext
    writetext RolePlay4PrizeText
    waitbutton
    verbosegiveitem CHOICE_BAND
    closetext
    setevent EVENT_BEAT_ROLEPLAY_4
.skipPrizeVillain

    opentext
    writetext LOTRBonusRoundText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext LOTRCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval LOTR_CH6_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_ZINNIA_BATTLE
	writemem wBattleMusicOverride
	winlosstext LOTRVictoryText, LOTRDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, LOTR_CH6_HERO
	startbattle
	reloadmap

.end
    playmusic MUSIC_AZALEA_TOWN

	opentext
	writetext LOTRRolePlayEndText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.stop
    playmusic MUSIC_AZALEA_TOWN
	opentext
	writetext LOTRStopText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.refused
    opentext
    writetext LOTRRolePlayRefusedText
    waitbutton
    closetext
    end

RolePlay4PrizeText:
    text "We finished a"
    line "new game."

    para "Here take this"
    line "for playing."
    done

LOTRIntroText:
    text "It was quite a"
    line "journey but I"
    cont "finally got here."

    para "A mountain full"
    line "of dragons!"

    para "Puts me in the"
    line "mood for a"
    cont "Lord Of The Rings"
    cont "roleplay."

    para "Would you like to"
    line "play? You'll need"
    cont "to Save your game?"
    done

LOTRHeroOrVillainChoiceText:
    text "Would you like to"
    line "play as the Heroes"
    cont "or the Villains?"
    done

LOTRCh1HeroText:
    text "You are being"
    line "hunted by RING"
    cont "WRAITHS."

    para "They seek the ONE"
    line "RING."

    para "What was that?"

    para "A screech in"
    line "the night."

    para "Another!"

    para "Closer this time."

    para "He has found us."

    para "The WITCH KING!"
    done

LOTRCh1VillainText:
    text "You seek only"
    line "one thing."

    para "To return to"
    line "your maker and"
    cont "master."

    para "You are the ONE"
    line "RING."

    para "The RING WRAITHS"
    line "are near."

    para "You call out."

    para "The WITCH KING has"
    line "found you."

    para "Now he will kill"
    line "your kidnappers"
    cont "and return you"
    cont "home."
    done

LOTRCh2HeroText:
    text "FRODO is badly"
    line "injured by the"
    cont "WITCH KING."

    para "A stranger jumps"
    line "into the battle."

    para "He wields a"
    line "basic sword."

    para "No match for the"
    line "refined weapons"
    cont "of the WITCH KING."

    para "He works the KING"
    line "high and low."

    para "His deft strikes"
    line "finding their mark"
    cont "on every stroke."

    para "The WITCH KING"
    line "disappears into"
    cont "the night."

    para "The strangers"
    line "name is ARAGORN."

    para "You go with him"
    line "to an elven city."

    para "Your wizard friend"
    line "GANDALF is there."

    para "You and SAM will"
    line "take the ring to"
    cont "MT DOOM to destroy"
    cont "it."

    para "ARAGORN, GANDALF"
    line "and several other"
    cont "warriors will"
    cont "fight the evil"
    cont "forces of SAURON."

    para "They travel deep"
    line "into the mine"
    cont "of MORIA."

    para "You are ambushed!"

    para "All manner of"
    line "evil besets you."
    done

LOTRCh2VillainText:
    text "The WITCH KING"
    line "has struck a"
    cont "mortal blow to"
    cont "this hobbit who"
    cont "dares to claim"
    cont "you."

    para "A stranger has"
    line "appeared."

    para "This is ARAGORN"
    line "the true king of"
    cont "GONDOR."

    para "He defeats the"
    line "WITCH KING!"

    para "You are taken to"
    line "an elven city."

    para "You sense the"
    line "presence of the"
    cont "wizard GANDALF."

    para "And even the great"
    line "GALADRIEL."

    para "Such powerful"
    line "potential hosts."

    para "FRODO plans to"
    line "take you to MT"
    cont "DOOM to destroy"
    cont "you."

    para "SAURON will"
    line "surely find you"
    cont "at MT DOOM."

    para "GANDALF is going"
    line "to the mine of"
    cont "MORIA."

    para "They don't know"
    line "what horrors await"
    cont "them there."

    para "SAURONS forces"
    line "will put an end"
    cont "to him there."
    done

LOTRHeroConcText:
    text "The BALROG is"
    line "too powerful."

    para "ARAGORN and the"
    line "party escape."

    para "But GANDALF dies"
    line "protecting you."

    para "The party presses"
    line "on through the"
    cont "despair."
    done

LOTRCh3HeroText:
    text "But GANDALFs valor"
    line "has not gone"
    cont "unnoticed."

    para "He is revived as"
    line "GANDALF the WHITE."

    para "SARUMAN the former"
    line "WHITE wizard is"
    cont "not happy."

    para "There can be only"
    line "one WHITE wizard!"
    done

LOTRVillainConcText:
    text "You lash out"
    line "with your sword"
    cont "of flame."

    para "Only GANDALF has"
    line "the power to hold"
    cont "you off."

    para "But you sense him"
    line "weakening."

    para "One last full"
    line "power swing!"

    para "Finally GANDALF"
    line "is dead!"

    para "The rest of the"
    line "party escape but"
    cont "the damage is"
    cont "done."
    done

LOTRCh3VillainText:
    text "Now to kill FRODO."

    para "What is that."

    para "A distant magic."

    para "GANDALF?!"

    para "It can't be."

    para "He has returned"
    line "as GANDALF THE"
    cont "WHITE."

    para "You are most"
    line "displeased."

    para "You are SARUMAN"
    line "THE WHITE."

    para "You will not allow"
    line "this insult!"

    para "You must kill"
    line "GANDALF!"

    para "There can be only"
    line "one WHITE wizard!"
    done

LOTRCh4HeroText:
    text "GANDALFs new"
    line "power is more"
    cont "than enough to"
    cont "defeat SARUMAN."

    para "But ARAGORN faces"
    line "a battle he can"
    cont "not win."

    para "An elf ELROND"
    line "has a gift for"
    cont "you."

    para "The ancient sword"
    line "of kings."

    para "It is reforged."

    para "For the one true"
    line "king."

    para "The battle horn"
    line "sounds."

    para "A wave of Orcs"
    line "rush you."

    para "One slash sends"
    line "limbs strewn"
    cont "across the sky."

    para "You will show no"
    line "quarter."
    done

LOTRCh4VillainText:
    text "GANDALF is too"
    line "strong!"

    para "SARUMAN and his"
    line "forces are swept"
    cont "aside."

    para "But you know the"
    line "real battle is"
    cont "already won."

    para "Your forces have"
    line "surrounded the"
    cont "camp of ARAGORN."

    para "He is exhausted."

    para "As are his men."

    para "You take command"
    line "of GOTHMOG the"
    cont "commander of the"
    cont "Orc forces."

    para "There is ARAGORN."

    para "Alone he walks"
    line "towards us."

    para "With a flash"
    line "a dozen Orcs and"
    cont "their limbs rain"
    cont "from the sky."

    para "Did ARAGORN do"
    line "that!"

    para "Attack at will!"
    done

LOTRCh5HeroText:
    text "Between GANDALF"
    line "and ARAGORN all"
    cont "SAURONS forces"
    cont "are defeated."

    para "FRODO is at"
    line "MT DOOM!"

    para "You take the RING."

    para "Finally you will"
    line "cast it into the"
    cont "fire."

    para "But why not keep"
    line "it..."

    para "What!"

    para "I must destroy it!"

    para "But it is mine..."

    para "SAM shouts for me"
    line "to do it."

    para "The RING..."

    para "Where is it?"

    para "A huge figure"
    line "appears."

    para "It is SAURON!"

    para "He has the RING!"

    para "Here at the end"
    line "all things."

    para "You will make a"
    line "final stand."
    done

LOTRCh5VillainText:
    text "Between GANDALF"
    line "and ARAGORN all"
    cont "SAURONS forces"
    cont "are defeated."

    para "FRODO means to"
    line "cast you into"
    cont "the fires of"
    cont "MT DOOM."

    para "You plead for"
    line "your life."

    para "Where am I?"

    para "This finger."

    para "I am home."

    para "SAURON."

    para "You awaken."

    para "You are whole"
    line "again."

    para "You are the lord"
    line "of all things."

    para "You are evil"
    line "itself."
    done

LOTRCh6Text:
    text "Let's have one"
    line "last bonus game."

    para "All the heroes and"
    line "all the villains"
    cont "powered up to"
    cont "their max in one"
    cont "giant battle!"
    done

LOTRRolePlayEndText:
    text "Thanks for"
    line "playing with me."

    para "We will see you"
    line "around I'm sure."
    done

LOTRRolePlayRefusedText:
    text "It'll be fun."

    para "I promise."
    done

LOTRVictoryText:
    text "Victory!"
    done

LOTRDefeatText:
    text "Defeat!"
    done

LOTREndText:
    text "Though SAURON"
    line "seemed unbeatable"
    cont "FRODO and SAM"
    cont "fought to the"
    cont "end."

    para "SAURON fell into"
    line "MT DOOM and the"
    cont "RING was finally"
    cont "destroyed."

    para "You gave your life"
    line "to save everyone."

    para "You await the end."

    para "A light from the"
    line "sky comes."

    para "It is GANDALF!"

    para "He takes you away."

    para "You welcome your"
    line "simple life in"
    cont "the SHIRE."

    para "For the rest of"
    line "your days."
    done
    
LOTRBreakText:
    text "Would you like to"
    line "continue to the"
    cont "second half of"
    cont "the story?"
    done

LOTRBonusRoundText:
    text "That's the end"
    line "of the story."

    para "But would you"
    line "like to have a"
    cont "special bonus"
    cont "round?"
    done

LOTRStopText:
    text "OK we will leave"
    line "it there then."

    para "Maybe we can do"
    line "the whole story"
    cont "next time."
    done

BlackthornMon1Script:
	faceplayer
	cry SEADRA
	pause 15
	loadwildmon SEADRA, 30
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear BLACKTHORNCITY_FIELDMON_1
	end

BlackthornMon2Script:
	faceplayer
	cry DRAGONAIR
	pause 15
	loadwildmon DRAGONAIR, 33
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear BLACKTHORNCITY_FIELDMON_2
	end

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	def_object_events
	object_event 18, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
	object_event 26, 28, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, LOTRRolePlayScript, -1
	object_event 24, 11, SPRITE_SEADRA, SPRITEMOVEDATA_POKEMON, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornMon1Script, EVENT_FIELD_MON_1
	object_event 13, 13, SPRITE_DRAGONAIR, SPRITEMOVEDATA_POKEMON, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornMon2Script, EVENT_FIELD_MON_2
