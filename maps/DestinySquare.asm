    object_const_def
    const DESTINYSQUARE_SILVER
    const DESTINYSQUARE_CRYSTAL
    const DESTINYSQUARE_CYNTHIA
    const DESTINYSQUARE_STEVEN
    const DESTINYSQUARE_DIANTHA
    const DESTINYSQUARE_ALDER
    const DESTINYSQUARE_LEON
    const DESTINYSQUARE_ADAM
    const DESTINYSQUARE_MEWTWO

DestinySquare_MapScripts:
	def_scene_scripts

	def_callbacks
;	callback MAPCALLBACK_OBJECTS, .Oak

;.Oak
;    disappear DESTINYSQUARE_OAK
;    endcallback

MasterRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_RIVAL
	iftrue .FightDone
.fight
	writetext MasterRivalSeenText
	waitbutton
	closetext
	winlosstext MasterRivalBeatenText, MasterRivalWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RIVAL2, MASTER_RIVAL
	startbattle
    ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_RIVAL
	opentext
	writetext MasterRivalAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterRivalAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterRivalLoseAfterBattleText
    waitbutton
    closetext
    end

MasterRivalSeenText:
	text "What took you so"
	line "long getting here?"
	para "Did my dad give"
	line "you trouble?"
	para "You haven't"
	line "changed one bit,"
	cont "but I have."
	para "My old self"
	line "sickens me, so"
	cont "insecure, always"
	cont "chasing"
	cont "validation."
	para "I have you to"
	line "thank for changing"
	cont "that."
	para "So here is my"
	line "thanks."
	done

MasterRivalBeatenText:
	text "I'd be"
	line "disappointed if"
	cont "you didn't win."
	done

MasterRivalWinText:
	text "In truth, I didn't"
	line "want to win."
	done

MasterRivalAfterBattleText:
	text "To think I used to"
	line "believe I could"
	cont "beat you."
	para "What a fool I was."
	para "Too much like my"
	line "father."
	para "I'll have to tell"
	line "him about this"
	cont "battle."
	para "Now go and conquer"
	line "all!"
	done

MasterRivalLoseAfterBattleText:
	text "What happened to"
	line "you?"
	para "Where is that"
	line "impossible"
	cont "strength!"
	para "You can do this,"
	line "now try again."
	done

MasterCrystalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_CRYSTAL
	iftrue .FightDone
.fight
	writetext MasterCrystalSeenText
	waitbutton
	closetext
	winlosstext MasterCrystalBeatenText, MasterCrystalWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CRYSTAL, MASTER_CRYSTAL
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_CRYSTAL
	opentext
	writetext MasterCrystalAfterBattleText
	waitbutton
    closetext
	special HealParty
	end
.FightDone:
	writetext MasterCrystalAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterCrystalLoseAfterBattleText
    waitbutton
    closetext
    end

MasterCrystalSeenText:
	text "Hey <PLAYER>!"
	para "You look just as I"
	line "remember you."
	para "I knew I would see"
	line "you in this place."
	para "But your journey"
	line "doesn't end here"
	cont "does it?"
	para "You have much"
	line "further to go."
	para "Let me give you"
	line "one last bit of"
	cont "encouragement."
	done

MasterCrystalBeatenText:
	text "That felt good."
	done

MasterCrystalWinText:
	text "It doesn't end"
	line "here."
	done

MasterCrystalAfterBattleText:
	text "Thank you for"
	line "humouring me one"
	cont "last time."
	para "You really are the"
	line "best, like no one"
	cont "ever was."
	para "Now go kick some"
	line "butt!"
	done

MasterCrystalLoseAfterBattleText:
	text "I just got lucky."
	para "You had a little"
	line "stumble."
	para "But you are"
	line "destined to"
	cont "overtake me."
	done

MasterCynthiaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_CYNTHIA
	iftrue .FightDone
.fight
	writetext MasterCynthiaSeenText
	waitbutton
	closetext
	winlosstext MasterCynthiaBeatenText, MasterCynthiaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CYNTHIA, MASTER_CYNTHIA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_CYNTHIA
	opentext
	writetext MasterCynthiaAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterCynthiaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterCynthiaLoseAfterBattleText
    waitbutton
    closetext
    end

MasterCynthiaSeenText:
	text "Ah <PLAYER>, hero"
	line "of KANTO."
	para "I remember when"
	line "you walked into"
	cont "ELMs lab."
	para "Your aura was"
	line "overwhelming, like"
	cont "a star pulling"
	cont "everything into"
	cont "orbit."
	para "I am just another"
	line "trainer to you."
	para "Honour me with a"
	line "battle."
	done

MasterCynthiaBeatenText:
	text "I will remember"
	line "this."
	done

MasterCynthiaWinText:
	text "Thank you for"
	line "teaching me."
	done

MasterCynthiaAfterBattleText:
	text "I hope on your"
	line "journey you had"
	cont "room for joy and"
	cont "laughter."
	para "You are now the"
	line "beacon for all"
	cont "young #MON"
	cont "trainers to"
	cont "follow."
	done

MasterCynthiaLoseAfterBattleText:
	text "Even the sun loses"
	line "its light in an"
	cont "eclipse."
	para "But only for a"
	line "moment."
	para "Your light will"
	line "shine again."
	done

MasterStevenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_STEVEN
	iftrue .FightDone
.fight
	writetext MasterStevenSeenText
	waitbutton
	closetext
	winlosstext MasterStevenBeatenText, MasterStevenWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer STEVEN, MASTER_STEVEN
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_STEVEN
	opentext
	writetext MasterStevenAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterStevenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterStevenLoseAfterBattleText
    waitbutton
    closetext
    end

MasterStevenSeenText:
	text "Leadership is the"
	line "greatest weapon"
	cont "for all."
	para "The best leaders"
	line "can inspire good"
	cont "people to do evil"
	cont "things."
	para "Maybe I wasn't a"
	line "great leader, but"
	cont "you will be."
	para "Will you be the"
	line "right leader!"
	done

MasterStevenBeatenText:
    text "Thank you"
    line "GRAND MASTER."
    done

MasterStevenWinText:
    text "You are humble."
    done

MasterStevenAfterBattleText:
	text "You are a great"
	line "leader."
	para "So was WALLACE."
	para "He isn't here I"
	line "notice."
	para "Perhaps he learnt"
	line "from his mistakes."
	para "He too is a great"
	line "trainer."
	done

MasterStevenLoseAfterBattleText:
	text "I spent a long"
	line "time thinking I"
	cont "was a failure."
	para "You showed me I"
	line "wasn't."
	para "Now show me again."
	done

MasterDianthaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_DIANTHA
	iftrue .FightDone
.fight
	writetext MasterDianthaSeenText
	waitbutton
	closetext
	winlosstext MasterDianthaBeatenText, MasterDianthaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BEAUTY, MASTER_DIANTHA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_DIANTHA
	opentext
	writetext MasterDianthaAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterDianthaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterDianthaLoseAfterBattleText
    waitbutton
    closetext
    end

MasterDianthaSeenText:
	text "Everyone saw"
	line "DIANTHA the movie"
	cont "star."
	para "I wanted to be"
	line "taken seriously as"
	cont "a trainer."
	para "Even as CHAMPION I"
	line "was still not"
	cont "recognised."
	para "I can tell you are"
	line "not like them, you"
	cont "only see the"
	cont "trainer."
	done

MasterDianthaBeatenText:
    text "Thank you!"
    done

MasterDianthaWinText:
	text "I'm more than just"
	line "a pretty face."
	done

MasterDianthaAfterBattleText:
	text "We are all actors"
	line "to some extent."
	para "In battle your"
	line "true self emerges."
	para "That's why I love"
	line "battle, it reminds"
	cont "me who I really"
	cont "am."
	done

MasterDianthaLoseAfterBattleText:
	text "It's hard when"
	line "everyone idolises"
	cont "and scrutinises"
	cont "you."
	para "All waiting for"
	line "you to fail."
	para "You only fail if"
	line "you let it get to"
	cont "you."
	done

MasterAlderScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_ALDER
	iftrue .FightDone
.fight
	writetext MasterAlderSeenText
	waitbutton
	closetext
	winlosstext MasterAlderBeatenText, MasterAlderWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer HIKER, MASTER_ALDER
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_ALDER
	opentext
	writetext MasterAlderAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterAlderAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterAlderLoseAfterBattleText
    waitbutton
    closetext
    end

MasterAlderSeenText:
	text "All conflict comes"
	line "from a lack of"
	cont "communication."
	para "We all have"
	line "something in"
	cont "common."
	para "We are alive here"
	line "and now."
	para "That should be"
	line "enough to look"
	cont "after each other."
	para "You understand?"
	done

MasterAlderBeatenText:
    text "I see you do."
    done

MasterAlderWinText:
	text "There are no"
	line "winners."
	done

MasterAlderAfterBattleText:
	text "Even if we don't"
	line "understand each"
	cont "other, that's not"
	cont "a reason to reject"
	cont "each other."
	para "There is no one"
	line "point of view that"
	cont "has all the"
	cont "answers."
	done

MasterAlderLoseAfterBattleText:
	text "Without trainers"
	line "would #MON"
	cont "still fight?"
	para "If #MON didn't"
	line "fight would they"
	cont "still be happy."
	done

MasterLeonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_LEON
	iftrue .FightDone
.fight
	writetext MasterLeonSeenText
	waitbutton
	closetext
	winlosstext MasterLeonBeatenText, MasterLeonWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEON, MASTER_LEON
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_LEON
	opentext
	writetext MasterLeonAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterLeonAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterLeonLoseAfterBattleText
    waitbutton
    closetext
    end

MasterLeonSeenText:
	text "Look at all this"
	line "rif raf here."
	para "Present company"
	line "excluded of"
	cont "course!"
	para "In the end only"
	line "you were able to"
	cont "save the world."
	para "Everyone here is a"
	line "CHAMPION so I'll"
	cont "need a new"
	cont "catchphrase for"
	cont "this battle."
	para "It's MASTER time!"
	done

MasterLeonBeatenText:
    text "MASTER indeed."
    done

MasterLeonWinText:
	text "There's no shame"
	line "in it."
	done

MasterLeonAfterBattleText:
	text "You are a real"
	line "MASTER."
	para "I notice LANCE and"
	line "BLUE aren't"
	cont "here..."
	para "There's no way"
	line "they too are now"
	cont "stronger than me!"
	done

MasterLeonLoseAfterBattleText:
	text "There can only be"
	line "one strongest"
	cont "CHAMPION."
	para "And it's not me."
	para "Now battle like"
	line "you mean it."
	done

MasterAdamScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_ADAM
	iftrue .FightDone
.fight
	writetext MasterAdamSeenText
	waitbutton
	closetext
	winlosstext MasterAdamBeatenText, MasterAdamWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ADAM, MASTER_ADAM
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER_ADAM
	setmapscene DESTINY_SQUARE, SCENE_FINISHED
	opentext
	writetext MasterAdamAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterAdamAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterAdamLoseAfterBattleText
    waitbutton
    closetext
    end

MasterAdamSeenText:
	text "Hello again"
	line "<PLAYER>."
	para "You've been"
	line "through a lot to"
	cont "get here."
	para "Ahead is MEWTWO, a"
	line "#MON only a"
	cont "true MASTER can"
	cont "command."
	para "I wont bore you"
	line "with a protracted,"
	cont "pretensions"
	cont "speech."
	para "You know what you"
	line "have to do."
	done

MasterAdamBeatenText:
    text "Good game"
    line "well played."
    done

MasterAdamWinText:
    text "GG WP."
    done

MasterAdamAfterBattleText:
	text "Go ahead and do"
	line "what you must."
	para "You have passed my"
	line "test."
	para "It's a big"
	line "responsibility"
	cont "being part of a"
	cont "world your dad"
	cont "created."
	para "I know he is proud"
	line "of you."
	done

MasterAdamLoseAfterBattleText:
	text "You are really"
	line "close."
	para "I'm totally"
	line "beatable just"
	cont "think outside the"
	cont "box."
	done

MewtwoScript:
	opentext
	writetext MewtwoCry
	waitbutton
	cry MEWTWO
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MEWTWO, 100
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
    setval MEWTWO
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_MEWTWO
    special FadeOutMusic
	opentext
	writetext MewtwoAfterText
	waitbutton
	closetext
	disappear DESTINYSQUARE_MEWTWO
	special HealParty
	warp DESTINY_FRONTIER, 30, 50
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MewtwoLoseAfterBattleText
    waitbutton
    closetext
    end

InvaderDLCScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_INVADER_MANUS
	iftrue .FightDone
.fight
	writetext InvaderDLCSeenText
	waitbutton
	closetext
	winlosstext InvaderDLCBeatenText, InvaderDLCWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer INVADER, MANUS
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	setevent EVENT_BEAT_INVADER_MANUS
	opentext
	writetext InvaderDLCAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext InvaderDLCAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinySquare
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinySquare
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext InvaderDLCLoseAfterBattleText
    waitbutton
    closetext
    end

InvaderDLCSeenText:
	text "The truly"
	line "passionate seek"
	cont "mastery."
	para "Such mastery can"
	line "only be found"
	cont "through challenge."
	para "Such challenge"
	line "that must be"
	cont "sought to be"
	cont "found."
	para "An optional"
	line "challenge."
	done

InvaderDLCBeatenText:
    text "Link the fire!"

InvaderDLCWinText:
    text "Are you casual?"

InvaderDLCAfterBattleText:
	text "By being here you"
	line "have proven your"
	cont "love and"
	cont "dedication to your"
	cont "passions."
	para "Those like us must"
	line "always continue"
	cont "the war with our"
	cont "sworn enemies."
	para "The filthy"
	line "casuals!"
	done

InvaderDLCLoseAfterBattleText:
	text "Optional bosses"
	line "aren't for"
	cont "casuals."
	para "Maybe you should"
	line "stick to the story"
	cont "bosses."
	done

MewtwoCry:
    text "This world is"
    line "beautiful."

    para "But who am I"
    line "to judge this"
    cont "world and its"
    cont "beauty."

    para "..."

    para "You say I"
    line "am part of this"
    cont "world too."

    para "Perhaps..."

    para "Whether I am"
    line "or not."

    para "I shall use all"
    line "my power..."

    para "to defend it."
    done

MewtwoAfterText:
    text "Life is"
    line "wonderful."

    para "I know you"
    line "understand."

    para "Now go!"

    para "Upon the peak of"
    line "MT SILVER..."

    para "Your destiny"
    line "awaits."
    done

MewtwoLoseAfterBattleText:
	text "As the victor, I"
	line "now claim my"
	cont "prize."
	para "Your #MON!"
	para "In another battle!"
	done

RematchTextDestinySquare:
    text "Shall we have"
    line "another match?"
    done

RematchRefuseTextDestinySquare:
    text "I will always"
    line "be here."
    done

FightAdamScript:
    turnobject PLAYER, LEFT
    sjump MasterAdamScript

ChampionsBlockScript:
    checkevent EVENT_BEAT_MASTER_RIVAL
    iffalse .block
    checkevent EVENT_BEAT_MASTER_CRYSTAL
    iffalse .block
    checkevent EVENT_BEAT_MASTER_STEVEN
    iffalse .block
    checkevent EVENT_BEAT_MASTER_CYNTHIA
    iffalse .block
    checkevent EVENT_BEAT_MASTER_ALDER
    iffalse .block
    checkevent EVENT_BEAT_MASTER_DIANTHA
    iffalse .block
    checkevent EVENT_BEAT_MASTER_LEON
    iffalse .block
    setmapscene DESTINY_SQUARE, SCENE_CUSTOM_1
    end
.block
	opentext
	writetext DefeatChampionsText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinySquareTurnBack
    end

DefeatChampionsText:
    text "You must defeat"
    line "all CHAMPIONS"
    cont "to proceed!"
    done

Movement_DestinySquareTurnBack:
	step DOWN
	step_end

DestinySquareMasterBall:
	itemball MASTER_BALL

DestinySquareAmbrosia:
	itemball AMBROSIA

DestinySquare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 26, DESTINY_ELITE_FOUR, 15
	warp_event  7, 26, DESTINY_ELITE_FOUR, 16

	warp_event  6, 15, DESTINY_SQUARE, 5
	warp_event  7, 15, DESTINY_SQUARE, 6
	warp_event  6, 8, DESTINY_SQUARE, 3
	warp_event  7, 8, DESTINY_SQUARE, 4

	def_coord_events
	coord_event  6,  17, SCENE_DEFAULT, ChampionsBlockScript
	coord_event  7,  17, SCENE_DEFAULT, ChampionsBlockScript
	coord_event  6,  6, SCENE_CUSTOM_1, FightAdamScript

	def_bg_events

	def_object_events
	object_event  5, 18, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterRivalScript, -1
	object_event  8, 18, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterCrystalScript, -1
	object_event  8, 21, SPRITE_JASMINE, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterCynthiaScript, -1
	object_event  4, 24, SPRITE_FALKNER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterStevenScript, -1
	object_event  5, 21, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterDianthaScript, -1
	object_event  9, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MasterAlderScript, -1
	object_event  9, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MasterLeonScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MasterAdamScript, -1
	object_event  6,  3, SPRITE_MEWTWO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MewtwoScript, EVENT_CAUGHT_MEWTWO

	object_event  5,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DestinySquareMasterBall, EVENT_DESTINY_SQUARE_MASTER_BALL
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DestinySquareAmbrosia, EVENT_DESTINY_SQUARE_AMBROSIA
	object_event  1, 16, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_SCRIPT, 0, InvaderDLCScript, -1
