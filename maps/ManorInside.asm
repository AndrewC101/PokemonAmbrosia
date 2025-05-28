    object_const_def
    const MANOR_ANDREW
    const MANOR_WIFE
    const MANOR_BROTHER

ManorInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveAboutHouse

.MoveAboutHouse:
    checktime MORN
    iffalse .checkNite
    moveobject MANOR_ANDREW, 2, 16
    moveobject MANOR_WIFE, 11, 5
    moveobject MANOR_BROTHER, 16, 16
.checkNite
    checktime NITE
    iffalse .checkSaturday
    moveobject MANOR_WIFE, 11, 5
.checkSaturday
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .moveToLivingRoom
	endcallback
.moveToLivingRoom
    moveobject MANOR_ANDREW, 2, 16
    moveobject MANOR_BROTHER, 5, 16
    endcallback

AndrewScript:
    faceplayer
    opentext
    checkevent EVENT_BEAT_ANDREW
    iftrue .fightDone
    checkevent EVENT_BEAT_LORD_OAK
    iffalse .intro
.fight
    setval 0
    writemem wHandOfGod
    writetext AndrewBeatOakText
    waitbutton
    checkevent EVENT_BEAT_ANDREW
    iftrue .dontAsk
    closetext
    opentext
    writetext AndrewOfferBattleText
    waitbutton
    yesorno
    iffalse .refused
.dontAsk
    writetext AndrewBattleTypeText
    waitbutton
    yesorno
    iffalse .fullPower
    writetext AndrewBeginBattleText
    waitbutton
    closetext
	setval MUSIC_EPIC_TETRIS
	writemem wBattleMusicOverride
	winlosstext AndrewBeatenText, AndrewWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer DAD, ME
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
.checkBeaten
	checkevent EVENT_BEAT_ANDREW
	iftrue .skipHandOfGod
	setevent EVENT_BEAT_ANDREW
	opentext
	writetext AndrewGiveHandText
	waitbutton
	verbosegiveitem HAND_OF_GOD
	writetext AndrewExplainHandText
	waitbutton
	closetext
.skipHandOfGod
	opentext
	writetext AndrewAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.fullPower
    writetext AndrewBeginBattleText
    waitbutton
    closetext
	setval MUSIC_EPIC_TETRIS
	writemem wBattleMusicOverride
   	winlosstext AndrewImpossibleBeatenText, AndrewImpossibleWinText
   	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
   	loadtrainer DAD, CELADON_ME
   	startbattle
   	ifequal LOSE, .loseImpossible
   	reloadmapafterbattle
   	opentext
   	writetext AndrewUnreachableText
   	waitbutton
   	closetext
   	special HealParty
    sjump .checkBeaten
   	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext AndrewLoseAfterBattleText
    waitbutton
    closetext
    end
.loseImpossible
    special HealParty
    reloadmap
    opentext
    writetext AndrewLoseAfterImpossibleBattleText
    waitbutton
    closetext
    end
.fightDone:
	writetext AndrewAfterBattleText
	waitbutton
    closetext
	opentext
	writetext AndrewOfferBattleText
	yesorno
	iftrue .fight
.refused
    writetext AndrewBattleRefusedText
    waitbutton
    closetext
    end
.intro
    writetext AndrewIntroText
    waitbutton
    closetext
    end

AndrewIntroText:
	text "Hello <PLAYER>."
	para "Welcome to my"
	line "house!"
	para "I am the creator"
	line "of this world."
	para "I hope you are"
	line "having fun."
	para "You still have"
	line "more to do!"
	para "Come back when you"
	line "have achieved the"
	cont "MARK OF GOD."
	para "Good luck!"
	done

AndrewBeatOakText:
	text "You have the MARK!"
	para "I am very proud of"
	line "you."
	para "You are the master"
	line "of this world!"
	para "Or so you think."
	para "You haven't beat"
	line "me yet."
	para "Bear in mind"
	line "JUDGEMENT OHKO"
	cont "effect doesn't"
	cont "work in this"
	cont "house."
	done

AndrewOfferBattleText:
	text "Let's play?"
	done

AndrewBattleTypeText:
	text "Would you like to"
	line "have some chance"
	cont "at winning?"
	done

AndrewBeginBattleText:
    text "Let's do it!"
    done

AndrewBeatenText:
    text "Fantastic!"
    done

AndrewWinText:
	text "It's not exactly"
	line "fair."
	done

AndrewImpossibleBeatenText:
	text "You're either"
	line "cheating..."
	para "Or you're a"
	line "genius!"
	done

AndrewImpossibleWinText:
	text "You were never"
	line "winning this."
	done

AndrewGiveHandText:
	text "You have proven"
	line "yourself worthy of"
	cont "the ultimate"
	cont "forbidden power."
	done

AndrewExplainHandText:
	text "The HAND OF GOD is"
	line "a key item which"
	cont "when turned on"
	cont "will cause your"
	cont "team to be"
	cont "replaced by the"
	cont "team of the"
	cont "trainer you fight."
	para "This persists"
	line "after battle!"
	para "When turned off"
	line "you can restore"
	cont "your team from the"
	cont "last save."
	para "You can choose not"
	line "to restore and"
	cont "keep the copied"
	cont "team."
	para "You can put them"
	line "in your PC if you"
	cont "want."
	para "Now you can copy"
	line "and keep any"
	cont "players team."
	para "Note though it"
	line "doesn't work on"
	cont "me, my WIFE, my"
	cont "BROTHER or LORD"
	cont "OAK but does on"
	cont "anybody else!"
	done

AndrewAfterBattleText:
	text "You have made all"
	line "those many hours"
	cont "making this world"
	cont "worth it."
	para "No matter what"
	line "happens in life"
	cont "this place will"
	cont "always be here."
	para "I will always be"
	line "here."
	para "Be kind to"
	line "yourself and do"
	cont "what makes you"
	cont "happy."
	para "You can do"
	line "anything you set"
	cont "your mind to"
	cont "<PLAYER>."
	done

AndrewUnreachableText:
	text "Well I wasn't"
	line "expecting that!"
	para "If you done that"
	line "without cheats you"
	cont "have my deepest"
	cont "respect."
	para "If you did"
	line "cheat..."
	para "I can still"
	line "appreciate that."
	done

AndrewLoseAfterBattleText:
	text "I know it looks"
	line "impossible but"
	cont "trust me I've"
	cont "balanced it to be"
	cont "just about"
	cont "possible."
	para "You've made it"
	line "this far, you'll"
	cont "figure something"
	cont "out!"
	done

AndrewBattleRefusedText:
	text "Yeah it's more fun"
	line "for me probably"
	cont "than for you."
	done

AndrewLoseAfterImpossibleBattleText:
	text "That was fun"
	line "wasn't it!"
	done

WifeScript:
    faceplayer
    opentext
    checkevent EVENT_BEAT_WIFE
    iftrue .fightDone
    checkevent EVENT_BEAT_MASTER_ADAM
    iffalse .intro
.fight
    setval 0
    writemem wHandOfGod
    writetext WifeBeatAdamText
    waitbutton
    checkevent EVENT_BEAT_WIFE
    iftrue .dontAsk
    closetext
    opentext
    writetext WifeOfferBattleText
    waitbutton
    yesorno
    iffalse .refused
.dontAsk
    writetext WifeBeginBattleText
    waitbutton
    closetext
	setval MUSIC_ZINNIA_BATTLE
	writemem wBattleMusicOverride
	winlosstext WifeBeatenText, WifeWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CYNTHIA, WIFE
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_WIFE
	opentext
	writetext WifeAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext WifeLoseAfterBattleText
    waitbutton
    closetext
    end
.fightDone:
	writetext WifeAfterBattleText
	waitbutton
    closetext
	opentext
	writetext WifeOfferBattleText
	yesorno
	iftrue .fight
.refused
    writetext WifeBattleRefusedText
    waitbutton
    closetext
    end
.intro
    writetext WifeIntroText
    waitbutton
    closetext
    end

WifeIntroText:
	text "Oh hello."
	para "Welcome, I"
	line "live here with my"
	cont "husband."
	para "You have met our"
	line "son ADAM, he takes"
	cont "his ELITE FOUR job"
	cont "very seriously."
	para "You still have"
	line "plenty left to do,"
	cont "come see us when"
	cont "you're done."
	para "Oh and the"
	line "brother in law is"
	cont "here somewhere,"
	cont "watch out for him."
	done

WifeBeatAdamText:
	text "You have beaten"
	line "ADAM at his"
	cont "strongest!"
	para "You must be one of"
	line "his friends."
	para "You like battling."
	para "I don't mind the"
	line "odd battle myself."
	done

WifeOfferBattleText:
	text "How about a wee"
	line "battle?"
	done

WifeBeginBattleText:
	text "My little plants"
	line "are ready."
	done

WifeBeatenText:
	text "My husband would"
	line "like you."
	done

WifeWinText:
	text "That was fun!"
	done

WifeAfterBattleText:
	text "My husband and I"
	line "miss ADAM being"
	cont "here."
	para "He will always be"
	line "our wee boy."
	para "Instead I have to"
	line "put up with the"
	cont "brother in-law."
	done

WifeLoseAfterBattleText:
	text "You are really"
	line "good."
	para "You and ADAM must"
	line "get along."
	done

WifeBattleRefusedText:
	text "That's fine, I"
	line "don't really like"
	cont "battling anyway."
	done

BrotherScript:
    faceplayer
    opentext
    checkevent EVENT_BEAT_BROTHER
    iftrue .fightDone
    checkevent EVENT_BEAT_MASTER_ADAM
    iffalse .intro
.fight
    setval 0
    writemem wHandOfGod
    writetext BrotherBeatAdamText
    waitbutton
    checkevent EVENT_BEAT_BROTHER
    iftrue .dontAsk
    closetext
    opentext
    writetext BrotherOfferBattleText
    waitbutton
    yesorno
    iffalse .refused
.dontAsk
    writetext BrotherBeginBattleText
    waitbutton
    closetext
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext BrotherBeatenText, BrotherWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEON, BROTHER
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_BROTHER
	opentext
	writetext BrotherAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext BrotherLoseAfterBattleText
    waitbutton
    closetext
    end
.fightDone:
	writetext BrotherAfterBattleText
	waitbutton
    closetext
	opentext
	writetext BrotherOfferBattleText
	yesorno
	iftrue .fight
.refused
    writetext BrotherBattleRefusedText
    waitbutton
    closetext
    end
.intro
    writetext BrotherIntroText
    waitbutton
    closetext
    end

BrotherIntroText:
	text "What are you doing"
	line "here?"
	para "You might think"
	line "you're real strong"
	cont "but you're not."
	para "You don't even"
	line "have a MEWTWO."
	para "Come back when"
	line "you're worth my"
	cont "time."
	done

BrotherBeatAdamText:
	text "I see you have"
	line "become at least"
	cont "decent."
	para "I guess I could"
	line "battle you."
	para "You should know"
	line "though, hax don't"
	cont "work in this"
	cont "house."
	para "No JUDGEMENT OHKO"
	line "here!"
	done

BrotherOfferBattleText:
	text "You going to"
	line "battle me?"
	done

BrotherBeginBattleText:
	text "Let's see if"
	line "you're any good."
	done

BrotherBeatenText:
	text "Yeah you're"
	line "alright."
	done

BrotherWinText:
	text "Not surprising."
	done

BrotherAfterBattleText:
	text "I hang out here"
	line "with my brother,"
	cont "his wife and"
	cont "sometimes my"
	cont "nephew ADAM."
	para "My brother made"
	line "this world but I'm"
	cont "far more"
	cont "successful than"
	cont "him!"
	done

BrotherLoseAfterBattleText:
	text "Your strategy was"
	line "totally wrong."
	para "Analyse the"
	line "battle, think"
	cont "outside the box."
	para "It is possible."
	done

BrotherBattleRefusedText:
	text "Yeah it would be a"
	line "waste of time for"
	cont "both of us."
	done

ManorBookshelf1:
    opentext
    writetext ManorBookshelf1Text
    waitbutton
    closetext
    end

ManorBookshelf1Text:
	text "Books on all sorts"
	line "of junk."
	para "Physics,"
	line "programming,"
	cont "biology,"
	cont "Youtube..."
	done

ManorHeul:
    opentext
    writetext ManorHeulText
    waitbutton
    closetext
    end

ManorHeulText:
	text "It's full to the"
	line "brim with"
	cont "something called"
	cont "Heul..."
	cont "Yuck!"
	done

ManorUnused:
    opentext
    writetext ManorUnusedText
    waitbutton
    closetext
    end

ManorUnusedText:
	text "This hasn't been"
	line "used in a long"
	cont "time."
	done

ManorDayo:
    opentext
    writetext ManorDayoText
    waitbutton
    closetext
    end

ManorDayoText:
	text "Some shirtless man"
	line "is speed running"
	cont "Spyro on the TV."
	done

ManorDS2:
    opentext
    writetext ManorDS2Text
    waitbutton
    closetext
    end

ManorDS2Text:
	text "Looks like the"
	line "last game played"
	cont "was Elden Ring."
	para "Makes sense."
	done

ManorFF7R:
    opentext
    writetext ManorFF7RText
    waitbutton
    closetext
    end

ManorFF7RText:
	text "Looks like the"
	line "last game played"
	cont "was Final Fantasy"
	cont "7 Rebirth."
	para "It's alright."
	done

ManorRC2:
    opentext
    writetext ManorRC2Text
    waitbutton
    closetext
    end

ManorRC2Text:
	text "Looks like the"
	line "last game played"
	cont "was Final Fantasy"
	cont "X."
	para "Now that's a good"
	line "game!"
	done

ManorCheese:
    opentext
    writetext ManorCheeseText
    waitbutton
    closetext
    end

ManorCheeseText:
	text "It's full of"
	line "different"
	cont "varieties of"
	cont "cheese!"
	done

ManorFact1:
    opentext
    writetext ManorFact1Text
    waitbutton
    closetext
    end

ManorFact2:
    opentext
    writetext ManorFact2Text
    waitbutton
    closetext
    end

ManorFact3:
    opentext
    writetext ManorFact3Text
    waitbutton
    closetext
    end

ManorFact4:
    opentext
    writetext ManorFact4Text
    waitbutton
    closetext
    end

ManorFact5:
    opentext
    writetext ManorFact5Text
    waitbutton
    closetext
    end

ManorFact6:
    opentext
    writetext ManorFact6Text
    waitbutton
    closetext
    end

ManorFact7:
    opentext
    writetext ManorFact7Text
    waitbutton
    closetext
    end

ManorFact8:
    opentext
    writetext ManorFact8Text
    waitbutton
    closetext
    end

ManorFact9:
    opentext
    writetext ManorFact9Text
    waitbutton
    closetext
    end

ManorFact10:
    opentext
    writetext ManorFact10Text
    waitbutton
    closetext
    end

ManorFact11:
    opentext
    writetext ManorFact11Text
    waitbutton
    closetext
    end

ManorFact12:
    opentext
    writetext ManorFact12Text
    waitbutton
    closetext
    end

ManorFact13:
    opentext
    writetext ManorFact13Text
    waitbutton
    closetext
    end

ManorFact14:
    opentext
    writetext ManorFact14Text
    waitbutton
    closetext
    end

ManorFact15:
    opentext
    writetext ManorFact15Text
    waitbutton
    closetext
    end

ManorFact16:
    opentext
    writetext ManorFact16Text
    waitbutton
    closetext
    end

ManorFact17:
    opentext
    writetext ManorFact17Text
    waitbutton
    closetext
    end

ManorFact18:
    opentext
    writetext ManorFact18Text
    waitbutton
    closetext
    end

 ManorFact19:
     opentext
     writetext ManorFact19Text
     waitbutton
     closetext
     end

 ManorFact20:
     opentext
     writetext ManorFact20Text
     waitbutton
     closetext
     end

 ManorFact21:
     opentext
     writetext ManorFact21Text
     waitbutton
     closetext
     end

 ManorFact22:
     opentext
     checkevent EVENT_BEAT_ANDREW
     iftrue .cheatText
     writetext ManorCheatLockedText
     sjump .end
.cheatText
     writetext ManorCheatText
.end
     waitbutton
     closetext
     end

ManorCheatLockedText:
	text "Only those with"
	line "the HAND OF GOD"
	cont "may read this"
	cont "secret text."
	done

ManorCheatText:
	text "Thank you for"
	line "playing #MON"
	cont "AMBROSIA."
	para "These cheat codes"
	line "might make your"
	cont "next play through"
	cont "more interesting."
	para "Infinite Money"
	line "010F40D8"
	cont "014241D8"
	cont "013F42D8"
	para "Change first item"
	line "in marts."
	para "RARE CANDY"
	line "0120FCD0"
	para "AMBROSIA"
	line "018BFCD0"
	para "MASTER BALL"
	line "0101FCD0"
	para "MARK OF GOD"
	line "012DFCD0"
	para "HAND OF GOD"
	line "0132FCD0"
	para "Make all wild"
	line "#MON ARCEUS"
	cont "01FD0FD2"
	done

ManorFact1Text:
	text "The first thing"
	line "created for this"
	cont "romhack was ARCEUS"
	cont "and its unique"
	cont "mechanics."

	para "ARCEUS has more"
	line "code specifically"
	cont "for it than any"
	cont "other #MON."
	done

ManorFact2Text:
	text "The HEAL PARTY"
	line "option on the PC"
	cont "was a last minute"
	cont "addition to the"
	cont "game."
	para "Prior to this the"
	line "player had to"
	cont "deposit then"
	cont "withdraw all their"
	cont "#MON to heal"
	cont "them via the"
	cont "POCKET PC."
	para "Doing this all the"
	line "time got old fast!"
	done

ManorFact3Text:
	text "The AMBROSIA item"
	line "was created long"
	cont "before it was"
	cont "decided this hack"
	cont "would be called"
	cont "#MON AMBROSIA."
	done

ManorFact4Text:
	text "There used to be a"
	line "bug in the BATTLE"
	cont "ARCADE where you"
	cont "could keep the"
	cont "player team by"
	cont "canceling at the"
	cont "enemy select"
	cont "screen."
	done

ManorFact5Text:
	text "BATTLE ARCADE and"
	line "RPG works by"
	cont "loading the chosen"
	cont "character as the"
	cont "enemy, then"
	cont "copying all enemy"
	cont "party data to the"
	cont "players party,"
	cont "then loading the"
	cont "chosen enemy party"
	cont "data."
	done

ManorFact6Text:
	text "Yes the AI now"
	line "knows all your"
	cont "moves and exactly"
	cont "how much damage"
	cont "they can do."
	para "It also knows how"
	line "much damage all"
	cont "its moves can do"
	cont "to you."
	para "It knows what item"
	line "you have and if it"
	cont "outspeeds you."
	done

ManorFact7Text:
	text "This romhack took"
	line "over 3 years and"
	cont "900 commits to"
	cont "create."
	para "I had my first"
	line "child and got"
	cont "married while"
	cont "making it."
	para "I'm very grateful"
	line "to my wife for"
	cont "putting up with"
	cont "it!"
	done

ManorFact8Text:
	text "GIRATINA has"
	line "unique dialog if"
	cont "the player has"
	cont "ARCEUS in their"
	cont "party."
	para "ARCEUS can also"
	line "reveal the path to"
	cont "GIRATINA."
	para "This is inspired"
	line "by Final Fantasy 9"
	cont "where Hades has"
	cont "unique dialog if"
	cont "the player has"
	cont "defeated Ozma."
	done

ManorFact9Text:
	text "HAND OF GOD was"
	line "created by"
	cont "accident when"
	cont "trying to"
	cont "implement BATTLE"
	cont "ARCADE."
	para "It was too cool to"
	line "remove."
	done

ManorFact10Text:
	text "Stat Exp was used"
	line "instead of EVs"
	cont "because it's more"
	cont "fun being able to"
	cont "just play with"
	cont "your #MON and"
	cont "not having to"
	cont "worry about"
	cont "messing up EVs and"
	cont "EV training."
	done

ManorFact11Text:
	text "BATTLE TRIAL was"
	line "inspired by trail"
	cont "mode from Final"
	cont "Fantasy 12 Zodiac"
	cont "Edition."
	done

ManorFact12Text:
	text "Sleep lasts for 1"
	line "to 3 turns."
	para "Unless..."
	para "Unless the enemy"
	line "is WALLACE."
	para "Then sleep lasts 1"
	line "to 2 turns."
	para "He wasn't hard"
	line "enough!"
	done

ManorFact13Text:
	text "EXP SHARE used to"
	line "give a quarter EXP"
	cont "until obtaining 8"
	cont "badges."
	para "This was fixed"
	line "after level caps"
	cont "were introduced."
	done

ManorFact14Text:
	text "Getting on a BIKE"
	line "does not play any"
	cont "special music."
	para "This small change"
	line "led to a bug where"
	cont "all music would"
	cont "stop after using"
	cont "FLY."
	para "That took days to"
	line "fix."
	done

ManorFact15Text:
	text "You don't want to"
	line "know the mess"
	cont "going on behind"
	cont "the scenes to"
	cont "print #MON"
	cont "abilities on the"
	cont "stats page!"
	done

ManorFact16Text:
	text "If you lose to"
	line "WALLACE or the"
	cont "supposed MAHOGANY"
	cont "MURDER during the"
	cont "story it takes you"
	cont "back to the title"
	cont "screen."
	para "This is cool but I"
	line "couldn't find more"
	cont "places to use it."
	done

ManorFact17Text:
	text "Aggressive field"
	line "#MON are coded"
	cont "as trainers with a"
	cont "hard coded"
	cont "trainerId."
	para "When the game sees"
	line "this trainerId it"
	cont "jumps to the wild"
	cont "#MON logic."
	done

ManorFact18Text:
	text "After clearing the"
	line "RADIO TOWER of"
	cont "ROCKETS you can"
	cont "find JESSIE, JAMES"
	cont "and MEOWTH on an"
	cont "island west of"
	cont "Route 34."
	para "They are happy"
	line "there."
	done

ManorFact19Text:
	text "Expert belt"
	line "doesn't work"
	cont "correctly."
	para "It will give a"
	line "boost if the move"
	cont "is super effective"
	cont "against either of"
	cont "the enemies types"
	cont "and will give a"
	cont "double boost if"
	cont "super effective"
	cont "against both"
	cont "types."
	done

ManorFact20Text:
	text "AMBROSIA maximises"
	line "the DVs of a"
	cont "#MON in"
	cont "addition to STAT"
	cont "EXP and happiness."
	para "Unless the"
	line "#MON is shiny,"
	cont "then AMBROSIA will"
	cont "not alter DVs as"
	cont "that would remove"
	cont "the shininess."
	para "Shiny #MON are"
	line "also stronger in"
	cont "this game with 15"
	cont "in all DVs except"
	cont "defense."
	done

ManorFact21Text:
	text "Abilities that"
	line "increase speed in"
	cont "specific weather"
	cont "don't actually"
	cont "increase speed."
	para "This is because"
	line "such changes would"
	cont "persist even when"
	cont "the weather is"
	cont "removed."
	para "Instead they"
	line "conditionally"
	cont "force the turn"
	cont "order to create"
	cont "the illusion of"
	cont "double speed."
	done

ManorInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  19, MANOR_OUTSIDE, 3
	warp_event  9,  19, MANOR_OUTSIDE, 3
	warp_event  10,  12, MANOR_INSIDE, 4
	warp_event  10,  24, MANOR_INSIDE, 3
	warp_event  7,  12, MANOR_INSIDE, 6
	warp_event  7,  0, MANOR_INSIDE, 5

	def_coord_events

	def_bg_events
	bg_event  16, 25, BGEVENT_READ, ManorHeul
	bg_event  14, 13, BGEVENT_READ, ManorUnused
	bg_event  13, 13, BGEVENT_READ, ManorDayo
	bg_event  2, 14, BGEVENT_READ, ManorDS2
	bg_event  8, 5, BGEVENT_READ, ManorUnused
	bg_event  3, 5, BGEVENT_READ, ManorUnused
	bg_event  15, 26, BGEVENT_READ, ManorFF7R
	bg_event  17, 2, BGEVENT_READ, ManorRC2
	bg_event 16, 13, BGEVENT_READ, ManorCheese

	bg_event  5, 13, BGEVENT_READ, ManorFact1
	bg_event  4, 13, BGEVENT_READ, ManorFact2
	bg_event  3, 13, BGEVENT_READ, ManorFact3
	bg_event 11,  1, BGEVENT_READ, ManorFact4
	bg_event 12,  1, BGEVENT_READ, ManorFact5
	bg_event 13,  1, BGEVENT_READ, ManorFact6
	bg_event 14,  1, BGEVENT_READ, ManorFact7
	bg_event  0, 1, BGEVENT_READ, ManorFact8
	bg_event  1, 1, BGEVENT_READ, ManorFact9
	bg_event  2, 1, BGEVENT_READ, ManorFact10
	bg_event  3, 1, BGEVENT_READ, ManorFact11
	bg_event  2,  25, BGEVENT_READ, ManorFact12
	bg_event  3,  25, BGEVENT_READ, ManorFact13
	bg_event  4,  25, BGEVENT_READ, ManorFact14
	bg_event  5,  25, BGEVENT_READ, ManorFact15
	bg_event  6,  25, BGEVENT_READ, ManorFact16
	bg_event  7,  25, BGEVENT_READ, ManorFact17
	bg_event  8,  25, BGEVENT_READ, ManorFact18
	bg_event  9,  25, BGEVENT_READ, ManorFact19
	bg_event  12,  25, BGEVENT_READ, ManorFact20
	bg_event  13,  25, BGEVENT_READ, ManorFact21
	bg_event  15,  1, BGEVENT_READ, ManorFact22

	def_object_events
	object_event  15,  4, SPRITE_BILL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, AndrewScript, -1
	object_event   1, 17, SPRITE_SABRINA, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WifeScript, -1
	object_event  15, 28, SPRITE_BLUE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrotherScript, -1
