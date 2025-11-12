DestinyPark_MapScripts:
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
	line "WATER trainer!"
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
	text "Our hearts are a"
	line "pendulum that"
	cont "swing between rage"
	cont "and despair."
	para "Real strength lies"
	line "in between."
	para "A Master must be"
	line "able to catch this"
	cont "pendulum."
	para "Can you?"
	done

MasterBlaineBeatenText:
    text "I see the fire"
    line "in you."
    done

MasterBlaineWinText:
    text "Your fire burns"
    line "too hot."
    done

MasterBlaineAfterBattleText:
	text "The fire within"
	line "will burn"
	cont "everything you"
	cont "love if you can't"
	cont "control it."
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
	line "slither of light"
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
	para "Did GOKU get lazy"
	line "on his way to"
	cont "NAMEK or in the"
	cont "time chamber!"
	para "Did VEGETA get"
	line "lazy in his"
	cont "training, never!"
	done

MasterChuckBeatenText:
	text "You're a SUPER"
	line "SAIYAN!"
	done

MasterChuckWinText:
    text "Have a SENZU."
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
	text "ICE is the"
	line "physical"
	cont "representation of"
	cont "despair."
	para "It spreads, it"
	line "drains all energy"
	cont "and in the end it"
	cont "kills."
	para "Do you have the"
	line "strength to"
	cont "resist."
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
	warp_event  4, 15, DESTINY_FRONTIER, 4
	warp_event  5, 15, DESTINY_FRONTIER, 4
	warp_event  18, 15, DESTINY_FRONTIER, 5
	warp_event  19, 15, DESTINY_FRONTIER, 5
	warp_event  32, 15, DESTINY_FRONTIER, 6
	warp_event  33, 15, DESTINY_FRONTIER, 6
	warp_event  4, 35, DESTINY_FRONTIER, 7
	warp_event  5, 35, DESTINY_FRONTIER, 7
	warp_event  18, 35, DESTINY_FRONTIER, 8
	warp_event  19, 35, DESTINY_FRONTIER, 8
	warp_event  32, 35, DESTINY_FRONTIER, 9
	warp_event  33, 35, DESTINY_FRONTIER, 9
	warp_event  4, 55, DESTINY_FRONTIER, 10
	warp_event  5, 55, DESTINY_FRONTIER, 10
	warp_event  18, 55, DESTINY_FRONTIER, 11
	warp_event  19, 55, DESTINY_FRONTIER, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  8, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterBrockScript, -1
	object_event  4,  2, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterMistyScript, -1
	object_event 17,  5, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterSurgeScript, -1
	object_event 33,  2, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterErikaScript, -1
	object_event 32, 21, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterJanineScript, -1
	object_event 18, 22, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterWillScript, -1
	object_event  4, 48, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterBlaineScript, -1
	object_event  4, 22, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterFalknerScript, -1
	object_event  5, 22, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterBugsyScript, -1
	object_event 32,  2, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterWhitneyScript, -1
	object_event 33, 21, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterMortyScript, -1
	object_event 20,  5, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterChuckScript, -1
	object_event 19, 22, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterJasmineScript, -1
	object_event  4, 42, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterPryceScript, -1
	object_event 18, 42, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterClairScript, -1
	object_event 19, 42, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterEusineScript, -1

