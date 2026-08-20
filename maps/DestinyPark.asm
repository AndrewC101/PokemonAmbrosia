DestinyPark_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
	setval WEATHER_NONE
	writemem wFieldWeather
	endcallback

MasterErikaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_ERIKA
	iftrue .FightDone
.fight
	writetext MasterErikaSeenText
	waitbutton
	closetext
	winlosstext MasterErikaBeatenText, MasterErikaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ERIKA, MASTER_ERIKA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_ERIKA
	opentext
	writetext MasterErikaAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterErikaAfterBattleText
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
    writetext MasterErikaLoseAfterBattleText
    waitbutton
    closetext
    end

MasterErikaSeenText:
	text "We are all"
	line "constantly working"
	cont "and fighting."
	para "Only those who can"
	line "allow themselves a"
	cont "moment of serenity"
	cont "can succeed long"
	cont "term."
	para "Now try to relax."
	done

MasterErikaBeatenText:
    text "That was very"
    line "tiring."
    done

MasterErikaWinText:
    text "Loosen up a"
    line "little."
    done

MasterErikaAfterBattleText:
	text "You should stop"
	line "for a moment."
	para "Life is a series"
	line "of little moments"
	cont "that pass by so"
	cont "fast."
	para "It's good to look"
	line "back and see how"
	cont "far you've come."
	done

MasterErikaLoseAfterBattleText:
	text "You should stop"
	line "for a moment."
	para "Life is a series"
	line "of little moments"
	cont "pass by so fast."
	done

MasterJanineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_JANINE
	iftrue .FightDone
.fight
	writetext MasterJanineSeenText
	waitbutton
	closetext
	winlosstext MasterJanineBeatenText, MasterJanineWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer JANINE, MASTER_JANINE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_JANINE
	opentext
	writetext MasterJanineAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterJanineAfterBattleText
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
    writetext MasterJanineLoseAfterBattleText
    waitbutton
    closetext
    end

MasterJanineSeenText:
	text "All fear leads"
	line "back to one"
	cont "ultimate fear."
	para "The fear of death."
	para "It is inevitable."
	para "Only a true Master"
	line "can conquer this"
	cont "final fear."
	done

MasterJanineBeatenText:
    text "You live your"
    line "best life."
    done

MasterJanineWinText:
    text "You're afraid."
    done

MasterJanineAfterBattleText:
	text "My Dad wasn't"
	line "afraid to die and"
	cont "neither am I."
	para "Of course I don't"
	line "want to die"
	cont "though, I want to"
	cont "live a long life."
	done

MasterJanineLoseAfterBattleText:
	text "A million years"
	line "from now, who's"
	cont "going to care?"
	done

MasterWillScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_WILL
	iftrue .FightDone
.fight
	writetext MasterWillSeenText
	waitbutton
	closetext
	winlosstext MasterWillBeatenText, MasterWillWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer WILL, MASTER_WILL
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_WILL
	opentext
	writetext MasterWillAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterWillAfterBattleText
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
    writetext MasterWillLoseAfterBattleText
    waitbutton
    closetext
    end

MasterWillSeenText:
	text "Life is a series"
	line "of little logic"
	cont "problems."
	para "You have to solve"
	line "one after another."
	para "Solve enough and"
	line "you win."
	para "Mental discipline"
	line "is key."
	done

MasterWillBeatenText:
    text "You cracked my"
    line "puzzles."
    done

MasterWillWinText:
    text "Keep your focus."
    done

MasterWillAfterBattleText:
	text "You only lose when"
	line "you stop thinking"
	cont "about a problem."
	para "Keep your mind in"
	line "the moment."
	done

MasterWillLoseAfterBattleText:
	text "When your mind"
	line "starts to wander"
	cont "you must force it"
	cont "right back into"
	cont "the moment."
	done

MasterBlaineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_BLAINE
	iftrue .FightDone
.fight
	writetext MasterBlaineSeenText
	waitbutton
	closetext
	winlosstext MasterBlaineBeatenText, MasterBlaineWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BLAINE, MASTER_BLAINE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_BLAINE
	opentext
	writetext MasterBlaineAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterBlaineAfterBattleText
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
    writetext MasterBlaineLoseAfterBattleText
    waitbutton
    closetext
    end

MasterBlaineSeenText:
	text "A flame is like a"
	line "little heartbeat."
	para "It can race and"
	line "swell with fury."
	para "It can flicker and"
	line "dim."
	para "In the end it"
	line "always goes out."
	para "Forgiveness is a"
	line "difficult thing."
	para "The fire doesn't"
	line "want to forgive,"
	cont "it wants to burn"
	cont "all the hotter."
	para "Can you show me"
	line "how to control it."
	done

MasterBlaineBeatenText:
	text "You are in"
	line "complete control."
	para "Remarkable!"
	done

MasterBlaineWinText:
    text "Your fire burns"
    line "too savage."
    done

MasterBlaineAfterBattleText:
	text "The fire within"
	line "will burn"
	cont "everything you"
	cont "love if you can't"
	cont "control it."
	para "I thought I would"
	line "hate the brother"
	cont "who left me for"
	cont "dead."
	para "Fire and Ice"
	line "couldn't be more"
	cont "different."
	para "But he and I are"
	line "so similar, even"
	cont "after all these"
	cont "years."
	done

MasterBlaineLoseAfterBattleText:
	text "Your fire is"
	line "either too wild or"
	cont "too timid."
	para "You must center"
	line "yourself."
	done

MasterFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_FALKNER
	iftrue .FightDone
.fight
	writetext MasterFalknerSeenText
	waitbutton
	closetext
	winlosstext MasterFalknerBeatenText, MasterFalknerWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer FALKNER, MASTER_FALKNER
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_FALKNER
	opentext
	writetext MasterFalknerAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterFalknerAfterBattleText
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
    writetext MasterFalknerLoseAfterBattleText
    waitbutton
    closetext
    end

MasterFalknerSeenText:
	text "Everyone is trying"
	line "to be something, a"
	cont "Gym Leader, a"
	cont "Master, a winner."
	para "People forget who"
	line "they really are."
	para "Show me who you"
	line "are."
	done

MasterFalknerBeatenText:
    text "Stay true to"
    line "yourself."
    done

MasterFalknerWinText:
    text "You try too"
    line "hard."
    done

MasterFalknerAfterBattleText:
	text "I like who I am"
	line "and don't want to"
	cont "be anyone else."
	para "This is the first"
	line "step to peace."
	done

MasterFalknerLoseAfterBattleText:
	text "You can beat me."
	para "Only you, only if"
	line "you let yourself"
	cont "be yourself."
	done

MasterBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_BUGSY
	iftrue .FightDone
.fight
	writetext MasterBugsySeenText
	waitbutton
	closetext
	winlosstext MasterBugsyBeatenText, MasterBugsyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BUGSY, MASTER_BUGSY
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_BUGSY
	opentext
	writetext MasterBugsyAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterBugsyAfterBattleText
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
    writetext MasterBugsyLoseAfterBattleText
    waitbutton
    closetext
    end

MasterBugsySeenText:
	text "Everyone is trying"
	line "to fly so high"
	cont "they can't see the"
	cont "ground they were"
	cont "born on."
	para "This Gym will drag"
	line "these people back"
	cont "down to reality."
	done

MasterBugsyBeatenText:
    text "Who are you?"
    done

MasterBugsyWinText:
    text "Welcome back!"
    done

MasterBugsyAfterBattleText:
	text "We come from small"
	line "towns, remember"
	cont "who you were in"
	cont "that small town."
	para "That's who you"
	line "fight for."
	done

MasterBugsyLoseAfterBattleText:
	text "Don't go thinking"
	line "you are so strong."
	para "That's what make"
	line "you weak."
	done

MasterWhitneyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_WHITNEY
	iftrue .FightDone
.fight
	writetext MasterWhitneySeenText
	waitbutton
	closetext
	winlosstext MasterWhitneyBeatenText, MasterWhitneyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer WHITNEY, MASTER_WHITNEY
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_WHITNEY
	opentext
	writetext MasterWhitneyAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterWhitneyAfterBattleText
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
    writetext MasterWhitneyLoseAfterBattleText
    waitbutton
    closetext
    end

MasterWhitneySeenText:
	text "I used to get"
	line "really emotional"
	cont "about things, but"
	cont "now I've learnt to"
	cont "allow myself to"
	cont "observe those"
	cont "feelings and"
	cont "relax."
	para "And I'm much"
	line "stronger for it."
	done

MasterWhitneyBeatenText:
    text "I'm not upset."
    done

MasterWhitneyWinText:
    text "You're too"
    line "serious."
    done

MasterWhitneyAfterBattleText:
	text "We all need to"
	line "chill sometimes."
	para "If we can't do"
	line "that we eat"
	cont "ourselves up from"
	cont "the inside."
	done

MasterWhitneyLoseAfterBattleText:
	text "Take a little"
	line "break, do"
	cont "something fun,"
	cont "then come back."
	para "You can do it!"
	done

MasterMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_MORTY
	iftrue .FightDone
.fight
	writetext MasterMortySeenText
	waitbutton
	closetext
	winlosstext MasterMortyBeatenText, MasterMortyWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer MORTY, MASTER_MORTY
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_MORTY
	opentext
	writetext MasterMortyAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterMortyAfterBattleText
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
    writetext MasterMortyLoseAfterBattleText
    waitbutton
    closetext
    end

MasterMortySeenText:
	text "For a moment in"
	line "time the atoms in"
	cont "our bodies are"
	cont "arranged in a way"
	cont "that somehow"
	cont "produces"
	cont "consciousness."
	para "This is a gift you"
	line "must make full use"
	cont "of."
	done

MasterMortyBeatenText:
	text "Your light shines"
	line "bright."
	done

MasterMortyWinText:
    text "Don't waste it."
    done

MasterMortyAfterBattleText:
	text "Life is a tiny"
	line "sliver of light"
	cont "sandwiched between"
	cont "two infinite"
	cont "darknesses."
	para "We must shine"
	line "bright before we"
	cont "return forever to"
	cont "the darkness."
	done

MasterMortyLoseAfterBattleText:
	text "Everybody dies,"
	line "one day there will"
	cont "be no life left in"
	cont "the universe."
	para "It is our duty to"
	line "push that day back"
	cont "as far as"
	cont "possible."
	done

MasterJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_JASMINE
	iftrue .FightDone
.fight
	writetext MasterJasmineSeenText
	waitbutton
	closetext
	winlosstext MasterJasmineBeatenText, MasterJasmineWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer JASMINE, MASTER_JASMINE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_JASMINE
	opentext
	writetext MasterJasmineAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterJasmineAfterBattleText
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
    writetext MasterJasmineLoseAfterBattleText
    waitbutton
    closetext
    end

MasterJasmineSeenText:
	text "You must be"
	line "malleable, able to"
	cont "bend but not"
	cont "break."
	para "You should not"
	line "block out your"
	cont "feelings, let them"
	cont "flow, but don't"
	cont "let them break"
	cont "you."
	done

MasterJasmineBeatenText:
    text "You have steely"
    line "composure."
    done

MasterJasmineWinText:
    text "Keep your mind"
    line "in the game."
    done

MasterJasmineAfterBattleText:
	text "Strength comes"
	line "from actions, and"
	cont "actions must come"
	cont "from the mind."
	para "Your focus must be"
	line "unbreakable."
	done

MasterJasmineLoseAfterBattleText:
	text "Now be mindful of"
	line "your frustration,"
	cont "let it flow around"
	cont "your thoughts and"
	cont "away."
	done

MasterPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_PRYCE
	iftrue .FightDone
.fight
	writetext MasterPryceSeenText
	waitbutton
	closetext
	winlosstext MasterPryceBeatenText, MasterPryceWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer PRYCE, MASTER_PRYCE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_PRYCE
	opentext
	writetext MasterPryceAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterPryceAfterBattleText
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
    writetext MasterPryceLoseAfterBattleText
    waitbutton
    closetext
    end

MasterPryceSeenText:
	text "Ice is the"
	line "physical"
	cont "representation of"
	cont "despair."
	para "It spreads, it"
	line "drains all energy"
	cont "and in the end it"
	cont "kills."
	para "I thought it had"
	line "killed my brother."
	para "But his #mon"
	line "saved him while I"
	cont "abandoned him."
	para "Ice keeps things"
	line "frozen."
	para "The guilt never"
	line "thaws."
	para "Do you have the"
	line "strength I did"
	cont "not?"
	done

MasterPryceBeatenText:
	text "You have mastered"
	line "yourself."
	done

MasterPryceWinText:
    text "Don't let it"
    line "take you."
    done

MasterPryceAfterBattleText:
	text "You must have a"
	line "core of warmth and"
	cont "life that can not"
	cont "freeze."
	para "It can be your"
	line "family."
	para "Or your inner"
	line "self."
	para "At long last I"
	line "have found mine."
	done

MasterPryceLoseAfterBattleText:
	text "You must have a"
	line "core of warmth and"
	cont "life that can not"
	cont "freeze."
	para "It can be your"
	line "family."
	para "Or your inner"
	line "self."
	para "At long last I"
	line "have found mine."
	done

RematchTextDestinyPark:
    text "Shall we have"
    line "another match?"
    done

RematchRefuseTextDestinyPark:
    text "I will always"
    line "be here."
    done

DestinyPark_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 39, DESTINY_FRONTIER, 6
	warp_event 19, 39, DESTINY_FRONTIER, 6
	warp_event  4, 19, DESTINY_FRONTIER, 7
	warp_event  5, 19, DESTINY_FRONTIER, 7
	warp_event 18, 19, DESTINY_FRONTIER, 8
	warp_event 19, 19, DESTINY_FRONTIER, 8
	warp_event 32, 19, DESTINY_FRONTIER, 9
	warp_event 33, 19, DESTINY_FRONTIER, 9
	warp_event  4, 39, DESTINY_FRONTIER, 10
	warp_event  5, 39, DESTINY_FRONTIER, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event 19, 26, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MasterErikaScript, -1
	object_event 32,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterJanineScript, -1
	object_event 18,  6, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterWillScript, -1
	object_event  4, 32, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterBlaineScript, -1
	object_event  4,  6, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterFalknerScript, -1
	object_event  5,  6, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MasterBugsyScript, -1
	object_event 18, 26, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterWhitneyScript, -1
	object_event 33,  5, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterMortyScript, -1
	object_event 19,  6, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterJasmineScript, -1
	object_event  4, 26, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterPryceScript, -1
