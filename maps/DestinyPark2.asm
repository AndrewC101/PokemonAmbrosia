DestinyPark2_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
	setval WEATHER_NONE
	writemem wFieldWeather
	endcallback

MasterBrockScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_BROCK
	iftrue .FightDone
.fight
	writetext MasterBrockSeenText
	waitbutton
	closetext
	winlosstext MasterBrockBeatenText, MasterBrockWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BROCK, MASTER_BROCK
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_BROCK
	opentext
    writetext MasterBrockAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterBrockAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterBrockLoseAfterBattleText
    waitbutton
    closetext
    end

MasterBrockSeenText:
	text "Life is always"
	line "giving and taking,"
	cont "pushing and"
	cont "pulling."
	para "Like water against"
	line "rock."
	para "Only those with"
	line "the strength to"
	cont "endure can be a"
	cont "Master."
	done

MasterBrockBeatenText:
    text "I admire your"
    line "strength."
    done

MasterBrockWinText:
    text "Never give up."
    done

MasterBrockAfterBattleText:
	text "You can take the"
	line "push and pull of"
	cont "life."
	para "The push and pull"
	line "of that annoying"
	cont "Misty woman is a"
	cont "whole different"
	cont "issue though."
	done

MasterBrockLoseAfterBattleText:
	text "Keep trying, you"
	line "have to keep"
	cont "moving forward and"
	cont "not worry about"
	cont "what has passed."
	done

MasterMistyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_MISTY
	iftrue .FightDone
.fight
	writetext MasterMistySeenText
	waitbutton
	closetext
	winlosstext MasterMistyBeatenText, MasterMistyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer MISTY, MASTER_MISTY
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_MISTY
	opentext
	writetext MasterMistyAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterMistyAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterMistyLoseAfterBattleText
    waitbutton
    closetext
    end

MasterMistySeenText:
	text "This Gym tests the"
	line "perseverance of"
	cont "trainers."
	para "You have to be"
	line "able to take what"
	cont "life throws at you"
	cont "or you'll never"
	cont "prevail."
	done

MasterMistyBeatenText:
	text "You are one tough"
	line "nut!"
	done

MasterMistyWinText:
	text "It's ok."
	para "I am the greatest"
	line "Water trainer!"
	done

MasterMistyAfterBattleText:
	text "Nothing is more"
	line "attractive than"
	cont "inner strength."
	para "Just look at that"
	line "guy Brock."
	para "He's full of it."
	done

MasterMistyLoseAfterBattleText:
	text "Don't feel bad, I"
	line "am as mighty and"
	cont "beautiful as the"
	cont "sea."
	para "You have to pick"
	line "yourself up and"
	cont "keep going."
	done

MasterSurgeScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_SURGE
	iftrue .FightDone
.fight
	writetext MasterSurgeSeenText
	waitbutton
	closetext
	winlosstext MasterSurgeBeatenText, MasterSurgeWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LT_SURGE, MASTER_SURGE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_SURGE
	opentext
    writetext MasterSurgeAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterSurgeAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterSurgeLoseAfterBattleText
    waitbutton
    closetext
    end

MasterSurgeSeenText:
	text "Sometime you just"
	line "need to fill"
	cont "yourself with"
	cont "energy, nobody"
	cont "else can do it but"
	cont "yourself."
	para "Now show me your"
	line "energy!"
	done

MasterSurgeBeatenText:
    text "You are"
    line "overflowing!"
    done

MasterSurgeWinText:
    text "You got to dig"
    line "deep!"
    done

MasterSurgeAfterBattleText:
    text "Great battle!"
    para "Your energy needs"
    line "a sick rift."
    para "URRHHHHAAAHHHH!"
    para "WITHOUT YOU IN"
    line "MY LIFE."
    para "I FEEL NO PAIN."
    para "I FEEL NO STRIFE."
    para "ELECTRODE!!"
    para "ELECTRODE!!"
    para "I CAN'T BEGIN"
    line "TO STATE."
    para "MY INDIFFERENCE"
    line "TO PARTICIPATE."
    para "ELECTRODE!!"
    para "ELECTRODE!!"
    para "BOOOOOOMMM!!"
    done

MasterSurgeLoseAfterBattleText:
	text "It's difficult to"
	line "just summon inner"
	cont "energy."
	para "Try singing a sick"
	line "rock song, that"
	cont "does it for me!"
	done

MasterChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_CHUCK
	iftrue .FightDone
.fight
	writetext MasterChuckSeenText
	waitbutton
	closetext
	winlosstext MasterChuckBeatenText, MasterChuckWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CHUCK, MASTER_CHUCK
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_CHUCK
	opentext
	writetext MasterChuckAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterChuckAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterChuckLoseAfterBattleText
    waitbutton
    closetext
    end

MasterChuckSeenText:
	text "We must never give"
	line "into hopelessness"
	cont "or laziness."
	para "Did Goku get lazy"
	line "on his way to"
	cont "Namek or in the"
	cont "time chamber!"
	para "Did Vegeta get"
	line "lazy in his"
	cont "training, never!"
	done

MasterChuckBeatenText:
	text "You're a Super"
	line "Saiyan!"
	done

MasterChuckWinText:
    text "Have a Senzu."
    done

MasterChuckAfterBattleText:
	text "You are the hope"
	line "of the universe."
	para "You are the answer"
	line "to all living"
	cont "things that cry"
	cont "out for peace."
	para "That's how that"
	line "goes right..."
	done

MasterChuckLoseAfterBattleText:
	text "Limitations only"
	line "exist if you let"
	cont "them."
	done

MasterClairScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_CLAIR
	iftrue .FightDone
.fight
	writetext MasterClairSeenText
	waitbutton
	closetext
	winlosstext MasterClairBeatenText, MasterClairWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CLAIR, MASTER_CLAIR
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_CLAIR
	opentext
	writetext MasterClairAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterClairAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterClairLoseAfterBattleText
    waitbutton
    closetext
    end

MasterClairSeenText:
	text "Ambition!"
	para "It is your will to"
	line "make your desires"
	cont "real."
	para "Those without it"
	line "are wasting what"
	cont "time they have."
	para "What is your"
	line "ambition!?"
	done

MasterClairBeatenText:
    text "Yes!"
    line "That's the way!"
    done

MasterClairWinText:
    text "Don't you want it!"
    done

MasterClairAfterBattleText:
	text "Your dreams won't"
	line "remain dreams for"
	cont "long."
	para "But when you make"
	line "them happen will"
	cont "they really make"
	cont "you happy."
	done

MasterClairLoseAfterBattleText:
	text "You can never just"
	line "wait for your"
	cont "dreams to find"
	cont "you."
	para "You have to work,"
	line "you have to fight"
	cont "for them!"
	done

MasterEusineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_EUSINE
	iftrue .FightDone
.fight
	writetext MasterEusineSeenText
	waitbutton
	closetext
	winlosstext MasterEusineBeatenText, MasterEusineWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer MYSTICALMAN, MASTER_EUSINE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_EUSINE
	opentext
	writetext MasterEusineAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterEusineAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyPark
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyPark
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterEusineLoseAfterBattleText
    waitbutton
    closetext
    end

MasterEusineSeenText:
	text "The hardest thing"
	line "in life is knowing"
	cont "when you are"
	cont "wasting energy."
	para "When to step back"
	line "try something"
	cont "different."
	para "Don't chase your"
	line "ambitions into a"
	cont "dead end."
	done

MasterEusineBeatenText:
    text "Do you want"
    line "this?"
    done

MasterEusineWinText:
    text "Is this the"
    line "right path?"
    done

MasterEusineAfterBattleText:
	text "We all have goals,"
	line "but the straight"
	cont "path is rarely the"
	cont "right one."
	para "Sometimes you have"
	line "to move sideways"
	cont "before you can"
	cont "move up."
	done

MasterEusineLoseAfterBattleText:
	text "Ambitions can eat"
	line "away your whole"
	cont "life if you let"
	cont "them."
	para "Stop and ask what"
	line "it is you really"
	cont "want."
	done

DestinyPark2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, DESTINY_FRONTIER, 4
	warp_event  5, 15, DESTINY_FRONTIER, 4
	warp_event 18, 15, DESTINY_FRONTIER, 5
	warp_event 19, 15, DESTINY_FRONTIER, 5
	warp_event 32, 15, DESTINY_FRONTIER, 11
	warp_event 33, 15, DESTINY_FRONTIER, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  8, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 1, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, MAPOBJECT_DARK_SKIN, MasterBrockScript, -1
	object_event  4,  2, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterMistyScript, -1
	object_event 17,  5, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, MAPOBJECT_DARK_SKIN, MasterSurgeScript, -1
	object_event 20,  5, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterChuckScript, -1
	object_event 33,  2, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, MAPOBJECT_DARK_SKIN, MasterClairScript, -1
	object_event 32,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterEusineScript, -1
