	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER
	const CHERRYGROVECITY_CRESTFALLEN
	const CHERRYGROVECITY_JULIUS
	const CHERRYGROVECITY_PEASANT1
	const CHERRYGROVECITY_PEASANT2
	const CHERRYGROVECITY_ROLEPLAYER
	const CHERRYGROVECITY_FIELDMON_1

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_CHERRYGROVECITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CHERRYGROVECITY_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CherrygroveFieldMon
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

.CherrygroveFieldMon:
    appear CHERRYGROVECITY_FIELDMON_1
    endcallback

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToPokecenter
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToPokemart
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToRolePlay
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentRolePlayText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToExit
	turnobject PLAYER, UP
	opentext
	writetext GuideGentExitText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToBilly
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToCrest
	turnobject PLAYER, DOWN
	opentext
	writetext GuideGentCrestText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToPark
	turnobject PLAYER, DOWN
	opentext
	writetext GuideGentParkText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovementToHome
	turnobject PLAYER, UP
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	opentext
	writetext GuideGentRunningShoesText
	waitbutton
	verbosegiveitem RUNNING_SHOES
	closetext
	loadmem wRunningShoesOn, 1
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	turnobject CHERRYGROVECITY_GRAMPS, UP
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setmapscene CHERRYGROVE_CITY, SCENE_CUSTOM_FINISHED
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "Map Card@"

GuideGentRunningShoesText:
    text "Here, these will"
    line "help you keep"
    cont "up with me."

    para "When you put"
    line "these on, you will"
    cont "run by default."

    para "You can then"
    line "hold B to walk."

    para "Unless you're"
    line "indoors."

    para "You kids shouldn't"
    line "be running"
    cont "indoors."

    para "Here, I'll put"
    line "these on you!"
    done

Movement_CherryGrove_Player_Up:
    step UP
    step_end

CherrygroveSilverSceneSouth:
    showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Movement_CherryGrove_Player_Up
CherrygroveSilverSceneNorth:
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	pause 15
	setmapscene CHERRYGROVE_CITY, SCENE_CUSTOM_1
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	setevent EVENT_BEAT_RIVAL_1
	special HealParty
	playmapmusic
.end
	end

CherrygroveTeacherScript:
    faceplayer
    opentext
    writetext CherrygroveTeacherText
    waitbutton
    checkevent EVENT_CHERRYGROVE_POKEDOLL
    iffalse .giveDoll
    closetext
    end
.giveDoll
    writetext CherrygroveTeacherGiveDollText
    waitbutton
    verbosegiveitem POKE_DOLL
    iffalse .end
    setevent EVENT_CHERRYGROVE_POKEDOLL
.end
    closetext
    end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

GuideGentMovementToPokecenter:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step LEFT
	turn_head UP
	step_end

GuideGentMovementToPokemart:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

GuideGentMovementToRolePlay:
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

GuideGentMovementToExit:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

GuideGentMovementToBilly:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
    big_step DOWN
	step_end

GuideGentMovementToCrest:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	step_end

GuideGentMovementToPark:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	turn_head DOWN
	step_end

GuideGentMovementToHome:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Oh hello there!"

	para "You're starting"
	line "a great adventure"
	cont "aren't you?"

	para "I was young"
	line "once too..."

	para "But this is my"
	line "home now."

	para "Let me show you"
	line "around and teach"
	cont "you a few things."

	para "...."

	para "Try to keep up!"
	done

GuideGentPokecenterText:
	text "This is a #mon"
	line "Center."

	para "Here you can heal"
	line "your #mon and"
	cont "store them in"
	cont "your PC."
	done

GuideGentMartText:
	text "This is a #mon"
	line "Mart."

	para "You can buy stuff"
	line "from here."

	para "But this one"
	line "rarely has much."

	para "They don't even"
	line "have #balls"
	cont "right now."
	done

GuideGentRolePlayText:
	text "This guy likes"
	line "to play games."

	para "He gives out"
	line "prizes to people"
	cont "who sit through"
	cont "his games."

	para "Nobody would"
	line "play the whole"
	cont "things otherwise."
	done

GuideGentExitText:
	text "This path leads"
	line "to Violet city."

	para "You will find"
	line "other trainers"
	cont "up there."

	para "Watch out for"
	line "Dark Cave."

	para "It is a place"
	line "of infectious"
	cont "evil."
	done

GuideGentSeaText:
	text "This is Billy"

	para "He never stops"
	line "fishing."

	para "I think he is"
	line "looking for"
	cont "meaning on the"
	cont "end of that"
	cont "hook."
	done

GuideGentCrestText:
	text "Old Crest sits"
	line "down here."

	para "He has become"
	line "rather obsessive"
	cont "recently."

	para "You best stay"
	line "away from him."
	done

GuideGentParkText:
	text "The band stand"
	line "is down there."

	para "Some young punks"
	line "are having battles"
	cont "today."
	done

GuideGentGiftText:
	text "It's my house!"
	line "Thanks for your"
	cont "company."

	para "Let me give you a"
	line "small gift."
	done

GotMapCardText:
	text "<PLAYER>'s #gear"
	line "now has a Map!"
	done

GuideGentPokegearText:
	text "#gear becomes"
	line "more useful as you"
	cont "add Cards."

	para "I wish you luck on"
	line "your journey!"
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Ah it's you!"

	para "How are you doing"
	line "with your weak"
	cont "#mon?"

	para "Perfectly matched"
	line "I see."

	para "I took care of"
	line "business myself."

	para "I'll show you a"
	line "real #mon!"
	done

SilverCherrygroveWinText:
	text "You've had a"
	line "head start."

	para "I'll crush you"
	line "if we meet again!"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #mon"
	cont "trainer."

	para "You should go"
	line "back home."

	para "This world has no"
	line "place for the"
	cont "weak."
	done

SilverCherrygroveLossText:
	text "That was a waste"
	line "of my time."
	done

CherrygroveTeacherText:
    text "Some #mon"
    line "appear in the"
    cont "field."

    para "Watch out for the"
    line "dark red ones!"

    para "They will attack"
    line "you if they see"
    cont "you!"

    para "It's hard to"
    line "escape from them"
    cont "unless you use a"
    cont "#doll."

    para "I have no idea"
    line "where you can buy"
    cont "them though."
    done

CherrygroveTeacherGiveDollText:
    text "Here is one I"
    line "found."

    para "You can have it."
    done

CherrygroveYoungsterText_NoPokedex:
	text "I saw Prof Oak"
	line "come by earlier."

	para "He went up North."

	para "There are trainers"
	line "up there but I'm"
	cont "sure Oak must have"
	cont "some strong"
	cont "#mon."
	done

CherrygroveYoungsterText_HavePokedex:
	text "I battled the"
	line "trainers on the"
	cont "road."

	para "I knew I couldn't"
	line "win!"

	para "So rather than sit"
	line "through the fight"
	cont "I Forfeited using"
	cont "the Dex option."
	done

MysticWaterGuyTextBefore:
	text "Here, you can have"
	line "this."
	para "Trust me..."
	para "I won't be needing"
	line "it."
	done

MysticWaterGuyTextAfter:
	text "Listen, I have"
	line "already filled my"
	cont "PC with nothing"
	cont "but Magikarp but I"
	cont "just can't stop!"
	para "I need help, I'm"
	line "hoarding these"
	cont "things."
	done

CherrygroveCitySignText:
	text "Cherrygrove City"

	para "The City of Cute,"
	line "Fragrant Flowers"
	done

GuideGentsHouseSignText:
	text "Guide Gent's House"
	done

EvilOldManScript:
	faceplayer
	opentext
	checkevent EVENT_DARK_CAVE_RED_EYE_ORB
	iftrue .GotRedEyeOrb
	writetext GoGetRedEyeOrbText
	waitbutton
	closetext
	end
.GotRedEyeOrb:
	writetext GotRedEyeOrbText
	checkevent EVENT_GOT_LIFE_ORB
	iftrue .finish
	waitbutton
	writetext takeLifeOrbText
	waitbutton
	verbosegiveitem LIFE_ORB
	iffalse .finish
	setevent EVENT_GOT_LIFE_ORB
.finish
	closetext
	end

takeLifeOrbText:
    text "Here, take this"
    line "for your trouble."

    para "Heh heh heh."
    done

GoGetRedEyeOrbText:
    text "Lovely day, isn't"
    line "it?"

    para "It is always"
    line "nice here."

    para "I have had"
    line "a fine life."

    para "I have seen"
    line "many things."

    para "But one thing"
    line "eludes me..."

    para "North of here"
    line "there is a cave."

    para "A place of pure"
    line "evil."

    para "In this cave it"
    line "rests."

    para "The Red Eye Orb."

    para "If you could"
    line "bring it to me."

    para "If I could see"
    line "it."

    para "I would be"
    line "complete."
    done

GotRedEyeOrbText:
    text "You have done it!"

    para "That's it, the"
    line "Red Eye Orb!"

    para "Using it makes"
    line "one an invader."

    para "As an invader you"
    line "will take double"
    cont "money from your"
    cont "victims."

    para "But if you lose"
    line "you lose all"
    cont "your money."

    para "Doesn't sound"
    line "fair, does it?"

    para "But life wouldn't"
    line "be fun if it was"
    cont "fair."

    para "Heh heh heh heh."
    done

JuliusScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_JULIUS
	iftrue .FightDone
.fight
	writetext JuliusSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_JULIUS
	iftrue .skipRequest
	opentext
	writetext JuliusOfferFightText
	waitbutton
	yesorno
	iffalse .refused
	closetext
.skipRequest
	setval MUSIC_BATTLE_TOWER_THEME
	writemem wBattleMusicOverride
	winlosstext JuliusBeatenText, JuliusWinsText
	loadtrainer YOUNGSTER, JULIUS
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_JULIUS
	end
.FightDone:
	writetext JuliusAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextJulius
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextJulius
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext JuliusWinAfterBattleText
    waitbutton
    closetext
    end
JuliusWinAfterBattleText:
    text "Another easy"
    line "victory."

    para "When will you"
    line "people learn"
    cont "your place on"
    cont "the social ladder."
    done
JuliusSeenText:
    text "These peasants are"
    line "easily brushed"
    cont "aside as expected."

    para "My papa is a"
    line "wealthy business"
    cont "man in Saffron."

    para "We can afford"
    line "all the best items"
    cont "and #mon."

    para "Training is for"
    line "the poor."
    done
JuliusBeatenText:
    text "Papa I need"
    line "more money!"
    done
JuliusWinsText:
    text "As expected."
    done
JuliusOfferFightText:
    text "You are another"
    line "jealous peasant."

    para "Would you like to"
    line "see the difference"
    cont "between our social"
    cont "classes?"

    para "I won't even take"
    line "your pitiful"
    cont "savings when I"
    cont "win!"
    done
JuliusAfterBattleText:
    text "I misjudged you."

    para "Relish this meager"
    line "victory while you"
    cont "may."

    para "Once I inherit my"
    line "fathers fortune I"
    cont "will simply buy"
    cont "an Elite Four"
    cont "level team from"
    cont "Team Rocket."
    done
RematchTextJulius:
    text "Might you be"
    line "partial to"
    cont "another bout?"
    done
RematchRefuseTextJulius:
    text "Very well."
    done

Peasant1Script:
    checkevent EVENT_BEAT_JULIUS
    iftrue .beaten
    jumptextfaceplayer PeasantHelp1
.beaten
    jumptextfaceplayer PeasantHappy1
PeasantHelp1:
    text "This snobby kid"
    line "has beaten us"
    cont "easily."

    para "I just can't"
    line "stand him."

    para "I wish someone"
    line "was strong enough"
    cont "to beat him."
    done
PeasantHappy1:
    text "You did it!"

    para "Oh it felt so"
    line "good seeing the"
    cont "look on his face"
    cont "when you beat him."

    para "You are really"
    line "strong."

    para "...and cute too."
    done

Peasant2Script:
    checkevent EVENT_BEAT_JULIUS
    iftrue .beaten
    jumptextfaceplayer PeasantHelp2
.beaten
    faceplayer
    opentext
    writetext PeasantHappy2
    waitbutton
    checkevent EVENT_GOT_JULIUS_NUGGET
    iftrue .end
    writetext TakeNuggetText
    waitbutton
    verbosegiveitem ASSAULT_VEST
    iffalse .end
    setevent EVENT_GOT_JULIUS_NUGGET
.end
    closetext
    end
PeasantHelp2:
    text "This rich kid has"
    line "beaten us silly"
    cont "and bragged about"
    cont "it all day."

    para "I'd give a special"
    line "gift to anyone who"
    cont "shuts him up!"
    done
PeasantHappy2:
    text "You are the best!"

    para "I hope that kid"
    line "learns not to"
    cont "judge others not"
    cont "as fortunate as"
    cont "him."

    para "But I know he"
    line "won't."
    done
TakeNuggetText:
    text "Here you can have"
    line "this."

    para "I found it in"
    line "that kids backpack"
    cont "when he wasn't"
    cont "looking."

    para "Heh heh."
    done

StarWarsRolePlayScript:
    faceplayer
    opentext
    writetext StarWarsIntroText
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
    writetext StarWarsHeroOrVillainChoiceText
	loadmenu .StarWarsHeroOrVillainMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Hero
	ifequal 2, .Villain
	sjump .HeroOrVillain
	closetext
	end
.StarWarsHeroOrVillainMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .StarWarsHeroOrVillainMenuData
	db 1 ; default option
.StarWarsHeroOrVillainMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .StarWarsHeroOrVillainText
	dbw BANK(@), NULL
.StarWarsHeroOrVillainText:
	db "Heroes@"
	db "Villains@"

.Hero
    opentext
    writetext StarWarsCh1HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH1_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_KANTO_GYM_LEADER_BATTLE
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH1_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh2HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH2_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_MAD_WORLD
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH2_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh3HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH3_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_INDIGO_PLATEAU
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH3_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext StarWarsCh4HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH4_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_ELITE_FOUR_PRISM
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH4_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh5HeroText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH5_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH5_VILLAIN
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsEndText
    waitbutton
    closetext

    checkevent EVENT_BEAT_ROLEPLAY_1
    iftrue .skipPrizeHero
    opentext
    writetext RolePlay1PrizeText
    waitbutton
    verbosegiveitem FOCUS_SASH
    closetext
    setevent EVENT_BEAT_ROLEPLAY_1
.skipPrizeHero

    opentext
    writetext StarWarsBonusRoundText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext StarWarsCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH6_HERO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_CHAMPION
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH6_VILLAIN
	startbattle
	reloadmap

	sjump .end

.Villain
    opentext
    writetext StarWarsCh1VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH1_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_KANTO_GYM_LEADER_BATTLE
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH1_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh2VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH2_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_MAD_WORLD
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH2_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh3VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH3_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_RED_INDIGO_PLATEAU
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH3_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsBreakText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext StarWarsCh4VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH4_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_ELITE_FOUR_PRISM
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH4_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsCh5VillainText
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH5_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH5_HERO
	startbattle
	dontrestartmapmusic
	reloadmap
    playmusic MUSIC_MISTY_MOUNTAIN

    opentext
    writetext StarWarsEndText
    waitbutton
    closetext

    checkevent EVENT_BEAT_ROLEPLAY_1
    iftrue .skipPrizeVillain
    opentext
    writetext RolePlay1PrizeText
    waitbutton
    verbosegiveitem FOCUS_SASH
    closetext
    setevent EVENT_BEAT_ROLEPLAY_1
.skipPrizeVillain

    opentext
    writetext StarWarsBonusRoundText
    yesorno
    closetext
    iffalse .stop

    opentext
    writetext StarWarsCh6Text
    waitbutton
    closetext
	setval ROLE_PLAYER_NORMAL
	writemem wOtherTrainerClass
	setval SW_CH6_VILLAIN
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_HOEN_CHAMPION
	writemem wBattleMusicOverride
	winlosstext StarWarsVictoryText, StarWarsDefeatText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer ROLE_PLAYER_NORMAL, SW_CH6_HERO
	startbattle
	reloadmap

.end
    playmusic MUSIC_CHERRYGROVE_CITY

	opentext
	writetext StarWarsRolePlayEndText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.stop
    playmusic MUSIC_CHERRYGROVE_CITY
	opentext
	writetext StarWarsStopText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end

.refused
    opentext
    writetext StarWarsRolePlayRefusedText
    waitbutton
    closetext
    end

RolePlay1PrizeText:
    text "We finished a"
    line "new game."

    para "Here take this"
    line "for playing."
    done

StarWarsIntroText:
    text "Do you like Role"
    line "Play games?!"

    para "I am starting"
    line "a STAR WARS theme"
    cont "RPG."

    para "You can play too."

    para "But you will need"
    line "to Save your game."

    para "Is that OK?"
    done

StarWarsHeroOrVillainChoiceText:
    text "Do you want to"
    line "play as the"
    cont "Heroes or the"
    cont "Villians?"
    done

StarWarsCh1HeroText:
    text "The palace is"
    line "under attack."

    para "You and your"
    line "master fight to"
    cont "defend a gifted"
    cont "child."

    para "A dark figure"
    line "appears."

    para "You must defend"
    line "Anikan."
    done

StarWarsCh1VillainText:
    text "The Jedi are a"
    line "cult that kidnap"
    cont "and brainwash"
    cont "gifted children."

	para "You have stormed"
	line "their palace to"
	cont "rescue a special"
	cont "child from them."

    para "There are the"
    line "two Jedi!"

    para "They are taking"
    line "the child."

    para "You will stop"
    line "them!"
    done

StarWarsCh2HeroText:
    text "Qui Gon is struck"
    line "down."

    para "In a rage you"
    line "defeat the dark"
    cont "figure."

    para "You resolve to"
    line "train Anikan."

    para "...."

    para "15 years pass."

    para "Your heart sinks"
    line "as you watch the"
    cont "security footage."

    para "Anikan has turned"
    line "to the dark side."

    para "He is a brother"
    line "to you..."

    para "But he must be"
    line "stopped!"
    done

StarWarsCh2VillainText:
    text "You are killed"
    line "but you have"
    cont "seen the virtue"
    cont "in the childs"
    cont "heart."

    para "...."

    para "15 years pass."

    para "Anikan has seen"
    line "the evil of the"
    cont "Jedi."

    para "He turns on his"
    line "abductors."

    para "Now he fights to"
    line "stop the Jedi."
    done

StarWarsCh3HeroText:
    text "Anikan was"
    line "stopped but"
    cont "not killed."

    para "He joins the"
    line "Empire and"
    cont "takes the name"
    cont "Vader."

    para "20 years pass."

    para "The Empire"
    line "grows strong."

	para "They develop the"
	line "ultimate weapon,"
	cont "the Death Star."

    para "Anikan had a"
    line "son, Luke."

    para "Over the next 20"
    line "years Luke grows"
    cont "into a great"
    cont "pilot."

    para "He leads the"
    line "final assault on"
    cont "the Empire in a"
    cont "violent space"
    cont "battle."

    para "Only he can"
    line "save the galaxy."
    done

StarWarsCh3VillainText:
    text "You were"
    line "defeated but"
    cont "not killed."

    para "You are reborn"
    line "as Vader."

    para "20 more years"
    line "pass."

    para "The Empire grows"
    line "strong."

	para "They develop the"
	line "ultimate weapon,"
	cont "the Death Star."

    para "When the rebels"
    line "attack it is"
    cont "up to you to"
    cont "defend the Empire"
    cont "in a violent"
    cont "space battle."
    done

StarWarsCh4HeroText:
    text "The Death Star"
    line "is destroyed."

    para "Luke learns that"
    line "his father Anikan"
    cont "is not dead."

    para "He is Vader."

    para "Luke can sense"
    line "there is good"
    cont "in him."

    para "You give yourself"
    line "up to the Empire."

    para "You are taken to"
    line "see Vader and"
    cont "his master."

    para "Palpatine."

	para "You don't want to"
	line "fight but it is"
	cont "clear you must if"
	cont "you are to save"
	cont "your father."
    done

StarWarsCh4VillainText:
    text "The Rebels repel"
    line "the Death Star."

    para "Vader learns he"
    line "has a son from"
    cont "his previous"
    cont "life as Anikan."

    para "His name is Luke."

    para "Luke has given"
    line "himself over to"
    cont "the Empire."

    para "Why?.."

    para "Perhaps he means"
    line "to join us."

    para "Or destroy us."

    para "He is brought"
    line "before Vader"
    cont "and you."

    para "Palpatine."

    para "Ruler of the"
    line "Galaxy."

	para "If he will not"
	line "join you he must"
	cont "die."
    done

StarWarsCh5HeroText:
    text "You are no match."

    para "Palpatine is"
    line "slowly draining"
    cont "your life."

    para "The pain is"
    line "unbearable."

    para "You plead with"
    line "your father to"
    cont "help you."

	para "You plea again and"
	line "again, but"
	cont "nothing."

	para "The pain ends."

    para "You open your"
    line "eyes."

    para "Vader stands"
    line "between you and"
    cont "Palpatine."

    para "You rise for one"
    line "last battle as"
    cont "father and son."
    done

StarWarsCh5VillainText:
    text "Luke is no"
    line "match for the"
    cont "two of you."

    para "You set about"
    line "slowly killing"
    cont "him."

    para "Luke begs for"
    line "Vader to save him."

    para "How pathetic."

    para "You become aware"
    line "of an anger."

    para "Growing..."

    para "Unexplained and"
    line "uncontrollable."

	para "You are knocked"
	line "away."

	para "Vader is attacking"
	line "you."

	para "You have longed"
	line "for the day Vader"
	cont "would do this."

	para "But to do so out"
	line "of love."

	para "How disgusting."

	para "They must both"
	line "die!"
    done

StarWarsEndText:
    text "Palpatine was"
    line "defeated."

    para "The galaxy is"
    line "free."

    para "But the battle"
    line "was intense."

    para "In Lukes arms"
    line "Anikans life ends."

    para "Finally content"
    line "that he made the"
    cont "right choice."
    done

StarWarsCh6Text:
    text "That was great!"

    para "Now how about"
    line "we just have"
    cont "some fun."

    para "One last game"
    line "with all the"
    cont "Heroes and"
    cont "Villains all"
    cont "powered up to"
    cont "their max."
    done

StarWarsRolePlayEndText:
    text "Thanks for"
    line "playing with me."

    para "I will see you"
    line "around I'm sure."
    done

StarWarsRolePlayRefusedText:
    text "It'll be fun."

    para "I promise."
    done

StarWarsVictoryText:
    text "Victory!"
    done

StarWarsDefeatText:
    text "Defeat!"
    done

StarWarsBreakText:
    text "Would you like to"
    line "continue to the"
    cont "second half of"
    cont "the story?"
    done

StarWarsBonusRoundText:
    text "That's the end"
    line "of the story."

    para "But would you"
    line "like to have a"
    cont "special bonus"
    cont "round?"
    done

StarWarsStopText:
    text "OK we will leave"
    line "it there then."

    para "Maybe we can do"
    line "the whole story"
    cont "next time."
    done

CherrygroveGentScene:
    turnobject PLAYER, UP
    sjump CherrygroveCityGuideGent

CherrygroveMon1Script:
	faceplayer
	cry PIKACHU
	pause 15
	loadwildmon PIKACHU, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear CHERRYGROVECITY_FIELDMON_1
	end

CherrygroveArcanineScript:
    opentext
    writetext CherrygroveArcanineText
    cry ARCANINE
    waitbutton
    closetext
    end

CherrygroveArcanineText:
    text "Arcanine!"
    done

CherrygroveMagikarpScript:
    opentext
    writetext CherrygroveMagikarpText
    cry MAGIKARP
    waitbutton
    closetext
    end

CherrygroveMagikarpText:
    text "Karp! Karp!"
    done

CherrygroveMagikarpDeadScript:
    opentext
    writetext CherrygroveMagikarpDeadText
    waitbutton
    closetext
    end

CherrygroveMagikarpDeadText:
    text "...."
    para "It's not moving."
    done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneSouth
	coord_event 32,  7, SCENE_DEFAULT, CherrygroveGentScene


	def_bg_events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  5, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
	object_event 7,  21, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EvilOldManScript, -1
	object_event 32, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, JuliusScript, -1
	object_event 33, 20, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Peasant1Script, -1
	object_event 30, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Peasant2Script, -1
	object_event 21, 4, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, StarWarsRolePlayScript, -1
	object_event 23, 20, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, CherrygroveMon1Script, EVENT_FIELD_MON_1
	object_event 33, 22, SPRITE_ARCANINE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveArcanineScript, -1
	object_event  7, 11, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMagikarpScript, -1
	object_event  4, 11, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMagikarpScript, -1
	object_event  6, 12, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMagikarpScript, -1
	object_event  6, 10, SPRITE_MAGIKARP, SPRITEMOVEDATA_STILL, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMagikarpDeadScript, -1

