    object_const_def
    const DESTINYFRONTIER_CHRIS_CHAN
    const DESTINYFRONTIER_YAMI
    const DESTINYFRONTIER_SETO
    const DESTINYFRONTIER_DRAKE
    const DESTINYFRONTIER_ROCKET
    const DESTINYFRONTIER_TOBIAS
    const DESTINYFRONTIER_YUNA
    const DESTINYFRONTIER_AIZEN
    const DESTINYFRONTIER_XEHANORT
    const DESTINYFRONTIER_AERITH
    const DESTINYFRONTIER_NURSE
    const DESTINYFRONTIER_CLERK
    const DESTINYFRONTIER_GUARD_1
    const DESTINYFRONTIER_GUARD_2
    const DESTINYFRONTIER_OAK
    const DESTINYFRONTIER_ULTIMA

DestinyFrontier_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .NoWeather

.NoWeather
	setval WEATHER_NONE
	writemem wFieldWeather
	endcallback

Movement_DestinyFrontierTurnLeft:
	step LEFT
	step_end

MasterChrisChanScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_CHRIS_CHAN
	iftrue .FightDone
.fight
	writetext ChrisChanSeenText
	waitbutton
	closetext
	setval MUSIC_MYSTICALMAN_ENCOUNTER
	writemem wBattleMusicOverride
	winlosstext ChrisChanBeatenText, ChrisChanWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer POKEFANM, MASTER_CHRIS_CHAN
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_CHRIS_CHAN
	special HealParty
	opentext
	writetext ChrisChanAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext ChrisChanAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext ChrisChanLoseAfterBattleText
    waitbutton
    closetext
    end

 ChrisChanSeenText:
	text "Megan!?"
	para "Who are you?"
	para "I am the ruler of"
	line "this universe"
	cont "C187!"
	para "The merge is upon"
	line "us!"
	done

 ChrisChanBeatenText:
    text "CURSYEHAMEHAA!"
    done

 ChrisChanWinText:
    text "I am strong!"
    done

 ChrisChanAfterBattleText:
	text "After the merge"
	line "all shall worship"
	cont "me and I shall use"
	cont "my power to build"
	cont "a sweetheart from"
	cont "the ground up."
	done

 ChrisChanLoseAfterBattleText:
	text "Stay honest and"
	line "true brave spirit."
	para "And don't forget"
	line "to worship me"
	cont "everyday."
	done

MasterYamiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_YAMI
	iftrue .FightDone
.fight
	writetext MasterYamiSeenText
	waitbutton
	closetext
	winlosstext MasterYamiBeatenText, MasterYamiWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ASH, ATEM
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_YAMI
	special HealParty
	opentext
	writetext MasterYamiAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterYamiAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterYamiLoseAfterBattleText
    waitbutton
    closetext
    end

MasterYamiSeenText:
	text "Ah <PLAYER>, it's"
	line "a small universe."
	para "You are training"
	line "to be the Master"
	cont "of Masters."
	para "As am I."
	para "Let us test each"
	line "other."
	done

MasterYamiBeatenText:
	text "You keep breaking"
	line "your limits."
	done

MasterYamiWinText:
	text "You fought"
	line "admirably."
	done

MasterYamiAfterBattleText:
	text "You are truly a"
	line "#mon Master."
	para "Beware that man"
	line "over there."
	para "I sense a great"
	line "evil within him."
	done

MasterYamiLoseAfterBattleText:
	text "You have gotten"
	line "stronger."
	para "You will grow"
	line "stronger still."
	para "You should leave"
	line "now."
	para "I sense a powerful"
	line "evil in that man"
	cont "over there."
	para "He may try to hurt"
	line "you."
	done

MasterSetoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_SETO
	iftrue .FightDone
.fight
	writetext MasterSetoSeenText
	waitbutton
	closetext
	winlosstext MasterSetoBeatenText, MasterSetoWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BLUE, MASTER_SETO
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_SETO
	special HealParty
	opentext
	writetext MasterSetoAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterSetoAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterSetoLoseAfterBattleText
    waitbutton
    closetext
    end

 MasterSetoSeenText:
	text "I should have"
	line "known I'd find you"
	cont "here!"
	para "I am trying to"
	line "find ATEM, but I"
	cont "can spare a moment"
	cont "to crush you!"
	done

 MasterSetoBeatenText:
	text "Why is everyone so"
	line "strong!"
	done

 MasterSetoWinText:
	text "How pathetic, you"
	line "shouldn't be here."
	done

 MasterSetoAfterBattleText:
	text "I don't have time"
	line "for you."
	para "I saw ATEM earlier"
	line "following someone"
	cont "who looked like"
	cont "HENSHIN, but it"
	cont "couldn't be"
	cont "HENSHIN."
	done

 MasterSetoLoseAfterBattleText:
	text "That couldn't"
	line "have ended any"
	cont "other way."
	para "Now run along kid."
	para "I need to find"
	line "ATEM."
	done

MasterDrakeScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_DRAKE
	iftrue .FightDone
.fight
	writetext MasterDrakeSeenText
	waitbutton
	closetext
	winlosstext MasterDrakeBeatenText, MasterDrakeWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SOLDIER, MASTER_DRAKE
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_DRAKE
	special HealParty
	opentext
	writetext MasterDrakeAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterDrakeAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterDrakeLoseAfterBattleText
    waitbutton
    closetext
    end

MasterDrakeSeenText:
	text "So you defeated"
	line "Wallace in your"
	cont "world."
	para "My world was not"
	line "so lucky."
	para "I should have"
	line "acted sooner."
	para "I have nobody to"
	line "blame but myself."
	done

MasterDrakeBeatenText:
	text "We all need heroes"
	line "like you."
	done

MasterDrakeWinText:
	text "The advantage of"
	line "experience."
	done

MasterDrakeAfterBattleText:
	text "Seeing that Kanto"
	line "woman stand up to"
	cont "Wallace finally"
	cont "broke me."
	para "I threw away"
	line "everything and"
	cont "done what my heart"
	cont "told me was right."
	done

MasterDrakeLoseAfterBattleText:
	text "Never stop"
	line "challenging all"
	cont "those around you."
	para "Challenge yourself"
	line "most of all."
	done

MasterExecutiveFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_EXECUTIVEF
	iftrue .FightDone
.fight
	writetext MasterExecutiveSeenText
	waitbutton
	closetext
	winlosstext MasterExecutiveBeatenText, MasterExecutiveWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer EXECUTIVEF, MASTER_EXECUTIVEF
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_EXECUTIVEF
	special HealParty
	opentext
	writetext MasterExecutiveAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterExecutiveAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterExecutiveLoseAfterBattleText
    waitbutton
    closetext
    end

MasterExecutiveSeenText:
	text "We had no heroes"
	line "in my world."
	para "Our plan didn't"
	line "work and Wallace"
	cont "conquered Kanto."
	para "He killed my"
	line "brother."
	para "I escaped with my"
	line "brothers #mon"
	cont "and we never"
	cont "stopped fighting."
	done

MasterExecutiveBeatenText:
	text "If only you were"
	line "there."
	done

MasterExecutiveWinText:
	text "Pain is our"
	line "weapon."
	done

MasterExecutiveAfterBattleText:
	text "Eventually I led"
	line "the assault"
	cont "against Wallace."
	para "But he would have"
	line "killed me too if"
	cont "it wasn't for"
	cont "Drake."
	para "He is our hero."
	done

MasterExecutiveLoseAfterBattleText:
	text "Don't envy my"
	line "strength."
	para "It is only"
	line "obtained by having"
	cont "your life ripped"
	cont "apart."
	done

MasterTobiasScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_TOBIAS
	iftrue .FightDone
.fight
	writetext MasterTobiasSeenText
	waitbutton
	closetext
	winlosstext MasterTobiasBeatenText, MasterTobiasWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer COOLTRAINERM, MASTER_TOBIAS
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_TOBIAS
	special HealParty
	opentext
	writetext MasterTobiasAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterTobiasAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterTobiasLoseAfterBattleText
    waitbutton
    closetext
    end

MasterTobiasSeenText:
	text "There are strong"
	line "trainers"
	cont "everywhere."
	para "Even some that"
	line "also use"
	cont "Legendaries."
	para "Now I can win"
	line "without any guilt."
	done

MasterTobiasBeatenText:
    text "What can I do?"
    done

MasterTobiasWinText:
	text "Some things never"
	line "change."
	done

MasterTobiasAfterBattleText:
	text "Even Legendaries"
	line "won't cut it here."
	para "I need to get some"
	line "Ubers!"
	done

MasterTobiasLoseAfterBattleText:
	text "Looks like I'm"
	line "still the best."
	para "How very boring."
	done

MasterYunaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_YUNA
	iftrue .FightDone
.fight
	writetext MasterYunaSeenText
	waitbutton
	closetext
	winlosstext MasterYunaBeatenText, MasterYunaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, MASTER_YUNA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_YUNA
	special HealParty
	opentext
	writetext MasterYunaAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterYunaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterYunaLoseAfterBattleText
    waitbutton
    closetext
    end

MasterYunaSeenText:
	text "My pilgrimage is"
	line "near its end."
	para "But I won't be"
	line "another name in a"
	cont "long tradition of"
	cont "false hope."
	para "I will forge my"
	line "own way."
	done

MasterYunaBeatenText:
	text "Thank you, I"
	line "learnt a lot."
	done

MasterYunaWinText:
    text "I am ready."
    done

MasterYunaAfterBattleText:
	text "I live for all"
	line "people."
	para "I would gladly die"
	line "for any of them."
	done

MasterYunaLoseAfterBattleText:
	text "As long as we are"
	line "surrounded by"
	cont "those we trust we"
	cont "can do anything."
	done

MasterAizenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_AIZEN
	iftrue .FightDone
.fight
	writetext MasterAizenSeenText
	waitbutton
	closetext
	winlosstext MasterAizenBeatenText, MasterAizenWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer POKEMANIAC, MASTER_AIZEN
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_AIZEN
	special HealParty
	opentext
	writetext MasterAizenAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterAizenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterAizenLoseAfterBattleText
    waitbutton
    closetext
    end

MasterAizenSeenText:
	text "I have tracked the"
	line "spiritual pressure"
	cont "of MEWTWO to this"
	cont "place."
	para "Once I bend him to"
	line "my will I shall"
	cont "destroy the SOUL"
	cont "KING!"
	done

MasterAizenBeatenText:
	text "Fear is necessary"
	line "for evolution."
	done

MasterAizenWinText:
	text "I sense nothing"
	line "from you."
	done

MasterAizenAfterBattleText:
	text "The SOUL KING"
	line "resides in a"
	cont "palace, in the"
	cont "Hall of Origin."
	para "A man made of gold"
	line "they say."
	para "How pretentious!"
	done

MasterAizenLoseAfterBattleText:
	text "Admiration is"
	line "furthest from"
	cont "understanding."
	para "You are not strong"
	line "enough to fight"
	cont "for me."
	done

MasterXehanortScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_XEHANORT
	iftrue .FightDone
.fight
	writetext MasterXehanortSeenText
	waitbutton
	closetext
	winlosstext MasterXehanortBeatenText, MasterXehanortWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SAGE, MASTER_XEHANORT
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_XEHANORT
	special HealParty
	opentext
	writetext MasterXehanortAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterXehanortAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterXehanortLoseAfterBattleText
    waitbutton
    closetext
    end

MasterXehanortSeenText:
	text "I am sure I will"
	line "find it here."
	para "The Mark of God."
	para "The light"
	line "emanating from"
	cont "this place beckons"
	cont "me."
	para "It is strong but"
	line "not as radiant as"
	cont "yours."
	done

MasterXehanortBeatenText:
    text "Enlighten meeeee!"
    done

MasterXehanortWinText:
    text "Become darkness!"
    done

MasterXehanortAfterBattleText:
	text "Perhaps life"
	line "eternal is a"
	cont "curse."
	para "One you alone"
	line "shall suffer from"
	cont "I suspect."
	done

MasterXehanortLoseAfterBattleText:
	text "All things begin"
	line "in darkness and"
	cont "also end."
	done

MasterAerithScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_AERITH
	iftrue .FightDone
.fight
	writetext MasterAerithSeenText
	waitbutton
	closetext
	winlosstext MasterAerithBeatenText, MasterAerithWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, MASTER_AERITH
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_AERITH
	special HealParty
	opentext
	writetext MasterAerithAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext MasterAerithAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterAerithLoseAfterBattleText
    waitbutton
    closetext
    end

MasterAerithSeenText:
	text "The life stream"
	line "ends here."
	para "It is finally at"
	line "peace."
	done

MasterAerithBeatenText:
	text "That was fun"
	line "wasn't it."
	done

MasterAerithWinText:
	text "That was fun"
	line "wasn't it."
	done

MasterAerithAfterBattleText:
	text "I saved my own"
	line "world, but I gave"
	cont "up my body to do"
	cont "it."
	para "Now I'm here!"
	done

MasterAerithLoseAfterBattleText:
	text "Since there is no"
	line "threat to the"
	cont "earth here, we can"
	cont "just have fun."
	done

UltimaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ULTIMA
	iftrue .FightDone
.fight
	writetext UltimaSeenText
	waitbutton
	closetext
	setval MUSIC_XVZ
	writemem wBattleMusicOverride
	winlosstext UltimaBeatenText, UltimaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer POKEMANIAC, ULTIMA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_ULTIMA
	special HealParty
	opentext
	writetext UltimaAfterBattleText
	waitbutton
	closetext
	end
.FightDone:
	writetext UltimaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext UltimaLoseAfterBattleText
    waitbutton
    closetext
    end

UltimaSeenText:
	text "The best meta is"
	line "clearly DPP OU pre"
	cont "LATIAS ban!"
	para "I have a balanced"
	line "team."
	para "A lead."
	para "A revenge killer."
	para "A wall breaker."
	para "A pivot."
	para "A tank."
	para "And a late game"
	line "sweeper."
	para "Let's go!"
	done

UltimaBeatenText:
	text "A need to analyze"
	line "this loss."
	done

UltimaWinText:
	text "Good game!"
	done

UltimaAfterBattleText:
	text "I got some hot"
	line "takes."
	para "Team preview is"
	line "bad."
	para "Mega evolutions"
	line "were awful and Z"
	cont "moves were even"
	cont "worse."
	para "Dynamax was"
	line "actually good."
	para "But gen 4, that"
	line "will always be the"
	cont "best meta."
	done

UltimaLoseAfterBattleText:
	text "Never be scared to"
	line "loose."
	para "Be scared of not"
	line "learning from a"
	cont "loss."
	done

NurseScript:
    faceplayer
	opentext
	writetext ShouldIHealText
	yesorno
	iffalse .done
	closetext
	special HealParty
	special FadeOutPalettes
	reloadmap
	opentext
	writetext HealDoneText
.done
    writetext GoodbyeText
    waitbutton
    closetext
    end

ShouldIHealText:
    text "Would you like me"
    line "to heal your"
    cont "#mon?"
    prompt

HealDoneText:
    text "Your #mon"
    line "are fully healed."
    prompt

GoodbyeText:
    text "Good luck!"
    done

MartScript:
    faceplayer
    opentext
    pokemart MARTTYPE_STANDARD, MART_FRONTIER
    closetext
    end

RematchTextDestinyFrontier:
    text "Shall we have"
    line "another match?"
    done

RematchRefuseTextDestinyFrontier:
    text "I will always"
    line "be here."
    done

GuardScript:
    faceplayer
    opentext
    writetext StrongestText
    waitbutton
    closetext
    end

StrongestText:
    text "Only the strongest"
    line "challenger can"
    cont "conquer the"
    cont "tournament."
    done

Guard1BlockScript:
    checkevent EVENT_BEAT_MASTER_BROCK
    iffalse .block
    checkevent EVENT_BEAT_MASTER_MISTY
    iffalse .block
    checkevent EVENT_BEAT_MASTER_WHITNEY
    iffalse .block
    checkevent EVENT_BEAT_MASTER_ERIKA
    iffalse .block
    checkevent EVENT_BEAT_MASTER_BUGSY
    iffalse .block
    checkevent EVENT_BEAT_MASTER_FALKNER
    iffalse .block
    checkevent EVENT_BEAT_MASTER_MORTY
    iffalse .block
    checkevent EVENT_BEAT_MASTER_JANINE
    iffalse .block
    setmapscene DESTINY_FRONTIER, SCENE_CUSTOM_2
    end
.block
    turnobject PLAYER, RIGHT
	opentext
	writetext Guard1BlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyFrontierTurnBack
    end

Guard1BlockText:
    text "Only challengers"
    line "who have conquered"
    cont "4 Gyms may pass."
    done

Guard2BlockScript:
    checkevent EVENT_BEAT_MASTER_CHUCK
    iffalse .block
    checkevent EVENT_BEAT_MASTER_SURGE
    iffalse .block
    checkevent EVENT_BEAT_MASTER_JASMINE
    iffalse .block
    checkevent EVENT_BEAT_MASTER_WILL
    iffalse .block
    checkevent EVENT_BEAT_MASTER_PRYCE
    iffalse .block
    checkevent EVENT_BEAT_MASTER_BLAINE
    iffalse .block
    checkevent EVENT_BEAT_MASTER_CLAIR
    iffalse .block
    checkevent EVENT_BEAT_MASTER_EUSINE
    iffalse .block
    setmapscene DESTINY_FRONTIER, SCENE_FINISHED
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext Guard2BlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyFrontierTurnLeft
    end

Guard2BlockText:
    text "Only challengers"
    line "who have conquered"
    cont "8 Gyms may pass."
    done

OakScript:
    setevent EVENT_FRONTIER_INTRO
    setmapscene DESTINY_FRONTIER, SCENE_CUSTOM_1
    faceplayer
    opentext
    checkevent EVENT_CAUGHT_MEWTWO
    iftrue .congrats
    checkevent EVENT_BEAT_MASTER_OAK
    iftrue .fightDone
    writetext OakIntroText
    nooryes
    closetext
    iffalse .refused
.fight
    winlosstext Oak2LoseText, Oak2WinText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
    loadtrainer POKEMON_PROF, MASTER_OAK
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	opentext
	writetext Oak2AfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext Oak2AfterBattleText
    waitbutton
    closetext
    end
.refused
    opentext
    writetext OakRefusedBattleText
    waitbutton
    closetext
    end
.fightDone
    opentext
    writetext Oak2AfterBattleText
    waitbutton
    closetext
.offerRematch
    opentext
	writetext RematchTextDestinyFrontier
	nooryes
	iftrue .fight
	writetext RematchRefuseTextDestinyFrontier
	waitbutton
	closetext
.end
	end
.congrats
    writetext CongratsText
    waitbutton
    closetext
    sjump .offerRematch

OakEncounterScript:
    checkevent EVENT_FRONTIER_INTRO
    iffalse .intro
    end
.intro
    turnobject PLAYER, RIGHT
    turnobject DESTINYFRONTIER_OAK, LEFT
    sjump OakScript
    end

OakIntroText:
    text "Welcome <PLAYER>."

    para "This is a place"
    line "that exists beyond"
    cont "your reality."

    para "Every person here"
    line "is a #mon"
    cont "Master in their"
    cont "own right."

    para "Even me if you"
    line "would believe it."

    para "All are battling"
    line "to become the"
    cont "Monarch."

    para "You will have to"
    line "beat eight Gyms."

    para "The Gyms have two"
    line "leaders but no"
    cont "trainers."

    para "Then you can face"
    line "the Elite Four"

    para "If you defeat them"
    line "you move onto the"
    cont "Hall of Champions."

    para "Finally moving on"
    line "to the current"
    cont "Monarch."

    para "Enemies here are"
    line "strong."

    para "Would you like"
    line "me to show you"
    cont "what I mean?"
    done

CongratsText:
    text "You have done it!"

    para "Monarch."

    para "You must go now"
    line "to the summit of"
    cont "MT.SILVER."

    para "There you can"
    line "pass onto the"
    cont "Hall of Origin."

    para "Good luck"
    line "<PLAYER>."
    done

Oak2LoseText:
    text "You are ready."
    done

Oak2WinText:
    text "A great effort."
    done

Oak2AfterBattleText:
    text "Well Done!"

    para "In this place"
    line "your party is"
    cont "healed after every"
    cont "fight."

    para "Good luck"
    line "<PLAYER>!"
    done

OakRefusedBattleText:
    text "You will find"
    line "out for yourself"
    cont "soon."
    done

Movement_DestinyFrontierTurnBack:
	step DOWN
	step_end

DestinyFrontier_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  30, 44, DESTINY_FRONTIER, 1
	warp_event  30, 59, SILVER_CAVE_OUTSIDE, 3
	warp_event  31, 59, SILVER_CAVE_OUTSIDE, 4
	warp_event 42, 53, DESTINY_PARK, 1
	warp_event  36, 31, DESTINY_PARK, 3
	warp_event 18, 53, DESTINY_PARK, 5
	warp_event   6, 37, DESTINY_PARK, 7
	warp_event  20, 31, DESTINY_PARK, 9
	warp_event  52, 37, DESTINY_PARK, 11
	warp_event  36, 13, DESTINY_PARK, 13
	warp_event  8,  5, DESTINY_PARK, 15

	warp_event 26,  0, DESTINY_FRONTIER, 14
	warp_event 27,  0, DESTINY_FRONTIER, 15

	warp_event 52, 23, DESTINY_FRONTIER, 12
	warp_event 53, 23, DESTINY_FRONTIER, 13

	warp_event 52, 11, DESTINY_ELITE_FOUR, 1
	warp_event 53, 11, DESTINY_ELITE_FOUR, 2


	def_coord_events
	coord_event 30, 50, SCENE_DEFAULT, OakEncounterScript
	coord_event 30, 38, SCENE_CUSTOM_1, Guard1BlockScript
	coord_event 11,  7, SCENE_CUSTOM_2, Guard2BlockScript

	def_bg_events

	def_object_events
	object_event 53, 50, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterChrisChanScript, -1
	object_event 50, 14, SPRITE_RED, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterYamiScript, -1
	object_event  4,  4, SPRITE_BLUE, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterSetoScript, -1
	object_event  9, 52, SPRITE_OFFICER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterDrakeScript, -1
	object_event 14, 44, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterExecutiveFScript, -1
	object_event 29, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterTobiasScript, -1
	object_event  6, 18, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterYunaScript, -1
	object_event 48, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterAizenScript, -1
	object_event 55, 14, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterXehanortScript, -1
	object_event 28, 46, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterAerithScript, -1
	object_event 29, 42, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NurseScript, -1
	object_event 32, 42, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MartScript, -1
	object_event 31, 38, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GuardScript, -1
	object_event 11,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GuardScript, -1
	object_event 31, 50, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakScript, -1
	object_event 31, 32, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, UltimaScript, -1
