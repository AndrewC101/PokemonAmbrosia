	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_SETO
	const ECRUTEAKCITY_TELEPORT
	const ECRUTEAKCITY_AERITH

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
    jumptextfaceplayer EcruteakCityFisherText

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

EcruteakCityGramps1Text:
	text "I see the"
	line "wonder in your"
	cont "eyes."

	para "You remind me"
	line "of my son."

	para "I lost him 15"
	line "years ago in"
	cont "the last war"
	cont "with Hoenn."

	para "I pray for"
	line "him everyday."
	done

EcruteakCityGramps2Text:
	text "This theatre"
	line "is where the"
	cont "Kimono girls"
	cont "dance."

	para "My wife was a"
	line "Kimono girl."

	para "Back when I"
	line "was young and"
	cont "the world seemed"
	cont "full of joy."
	done

EcruteakCityLass1Text:
	text "The Kimono girls"
	line "are so beautiful!"

	para "I am here to"
	line "learn to dance"
	cont "like them."
	done

EcruteakCityLass2Text:
	text "My grandma told"
	line "me that long"
	cont "ago this tower"
	cont "was as big as"
	cont "the Tin Tower."

	para "But it burned"
	line "down."

	para "It used to be"
	line "called the"
	cont "Brass Tower."

	para "Nobody knows"
	line "how the fire"
	cont "started."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Three big #mon"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"

	para "They looked"
	line "fierce!"
	done

EcruteakCityFisherText:
	text "This was the"
	line "first major city"
	cont "built in Johto."

	para "Right in the"
	line "middle of the"
	cont "province to"
	cont "facilitate"
	cont "trade."
	done

EcruteakCityYoungsterText:
	text "I came here"
	line "from Pewter after"
	cont "the #rus"
	cont "outbreak."

	para "The Tin Tower"
	line "is the tallest"
	cont "building in"
	cont "Johto."

	para "But the Silph Co"
	line "building in Kanto"
	cont "is taller still."
	done

EcruteakCityGramps3Text:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #mon"
	line "perished in it."

	para "A rainbow-colored"
	line "#mon descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by Ecruteak"
	line "Gym Leaders."

	para "Me?"

	para "I was the Gym"
	line "Leader long ago."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "Ecruteak City"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

TinTowerSignText:
	text "Tin Tower"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done

EcruteakGymSignText:
	text "Ecruteak City"
	line "#mon Gym"
	cont "Leader: Morty"

	para "The Mystic Seer of"
	line "the Future"
	done

EcruteakDanceTheaterSignText:
	text "Ecruteak Dance"
	line "Theater"
	done

BurnedTowerSignText:
	text "Burned Tower"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
	done

SetoScript:
	faceplayer
    checkevent EVENT_BEAT_HENSHIN
    iffalse .beatHenshinFirst
	opentext
	checkevent EVENT_BEAT_SETO
	iftrue .FightDone
.fight
	writetext SetoSeenText
	waitbutton
	closetext
	winlosstext SetoBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer BLUE, SETO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SETO
	opentext
	writetext SetoAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext SetoAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextSeto
	nooryes
	iftrue .fight
	writetext RematchRefuseTextSeto
	waitbutton
	closetext
	end
.beatHenshinFirst
    opentext
	writetext BeatHenshinFirstText
	waitbutton
	closetext
	end

SetoSeenText:
    text "You defeated that"
    line "old fool Henshin!"

    para "Where was he?"

    para "I see..."

    para "The power of"
    line "death will be"
    cont "mine!"

    para "Then I will"
    line "return and"
    cont "finally beat"
    cont "you Atem!"

    para "For your reward"
    line "I will give you"
    cont "humility."

    para "By crushing you"
    line "now!"
    done

SetoBeatenText:
    text "Not again!"
    done

SetoAfterBattleText:
    text "I was born to"
    line "rule."

    para "When that day"
    line "comes people"
    cont "like you may"
    cont "live to be"
    cont "my pets."

    para "And Atem will"
    line "kneel before me!"
    done

BeatHenshinFirstText:
    text "I am Seto!"
    line "I am from a"
    cont "different time."

    para "I came here with"
    line "an old man named"
    cont "Henshin."

    para "But I've lost him."

    para "If you find him"
    line "be careful."

    para "He would destroy"
    line "a peasant like"
    cont "you."
    done

RematchTextSeto:
    text "One more duel?"
    done

RematchRefuseTextSeto:
    text "You scared?"
    done

EcruteakTeleportGuyScript:
	faceplayer
	opentext
	checkflag ENGINE_PLAINBADGE
	iftrue .welcome
	writetext EcruteakTeleportGuyText1
	yesorno
	iffalse .no
	writetext EcruteakTeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 13, 18
	end
.welcome
	writetext EcruteakTeleportGuyWelcomeText
	waitbutton
	closetext
	end
.no
	writetext EcruteakTeleportGuyNoText
	waitbutton
	closetext
	end

EcruteakTeleportGuyWelcomeText:
    text "Welcome to"
    line "Ecruteak."

    para "You must be quite"
    line "the trainer to"
    cont "make it through"
    cont "the forest!"
    done

EcruteakTeleportGuyText1:
	text "You seem a bit"
	line "lost dear child."

	para "It is dangerous"
	line "around here."

	para "I can Teleport"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done

EcruteakTeleportGuyYesText:
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done

EcruteakTeleportGuyNoText:
	text "OK, OK. The best"
	line "of luck to you!"
	done

EcruteakTeleportGuyEncounterScript:
    turnobject PLAYER, RIGHT
    sjump EcruteakTeleportGuyScript

BurnedTowerBlockScript:
    checkflag ENGINE_PLAINBADGE
    iffalse .block
    end
.block
	opentext
	writetext BurnedTowerBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_BurnedTowerTurnBack
    end

Movement_BurnedTowerTurnBack:
    step DOWN
    step_end

BurnedTowerBlockText:
    text "The tower is off"
    line "limits while it"
    cont "is repaired."
    done
    
Aerith1Script:
    faceplayer
	opentext
	checkevent EVENT_BEAT_AERITH_1
	iftrue .FightDone
.fight
	writetext Aerith1SeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_AERITH_1
	iftrue .dontAsk
	opentext
	writetext Aerith1OfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext Aerith1BeatenText, Aerith1WinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, AERITH_1
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_AERITH_1
	end
.FightDone:
	writetext Aerith1AfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextAerith1
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextAerith1
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext AerithWinAfterBattleText
    waitbutton
    closetext
    end
AerithWinAfterBattleText:
    text "You did well."

    para "You just need"
    line "to level up a"
    cont "bit more."
    done
Aerith1SeenText:
    text "This place is"
    line "tranquil."

    para "It's kind of"
    line "boring!"

    para "I am Aerith!"

    para "My friends and"
    line "I are committed"
    cont "to protecting"
    cont "the planet and"
    cont "#mon from"
    cont "all these human"
    cont "conflicts."

    para "I can tell you"
    line "want the same"
    cont "thing."

    para "Let's help"
    line "each other get"
    cont "stronger"
    done
Aerith1BeatenText:
    text "Well done"
    done
Aerith1WinsText:
    text "Good try"
    done
Aerith1OfferFightText:
    text "Maybe a good"
    line "battle will"
    cont "cheer us up?"
    done
Aerith1AfterBattleText:
    text "Wow you're strong!"

    para "We will both keep"
    line "getting stronger."

    para "We have to."

    para "Nobody else can"
    line "protect the"
    cont "planet."
    done
RematchTextAerith1:
    text "How about another"
    line "Battle?"
    done
RematchRefuseTextAerith1:
    text "That's fine!"
    done

BurntTowerBlockScript:
    checkflag ENGINE_PLAINBADGE
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext BurntTowerBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_BurntTowerTurnBack
    end
Movement_BurntTowerTurnBack:
    step DOWN
    step_end
BurntTowerBlockText:
    text "The door is"
    line "locked."
    done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 16, 35, ROUTE_37, 1
	warp_event 17, 35, ROUTE_37, 2

	def_coord_events
	coord_event 16, 30, SCENE_DEFAULT, EcruteakTeleportGuyEncounterScript
	coord_event 5, 6, SCENE_ALWAYS, BurntTowerBlockScript

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 29,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SetoScript, -1
	object_event 17, 30, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakTeleportGuyScript, -1
	object_event 23, 12, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Aerith1Script, EVENT_BEAT_ELITE_FOUR
