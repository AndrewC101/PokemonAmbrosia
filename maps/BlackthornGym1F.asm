	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, ClairLoseText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end
.rematch
    writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, ClairLoseText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGON_PULSE
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGON_PULSE
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
    closetext
	opentext
	writetext RematchTextClair
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextClair
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "I am CLAIR."

	para "Dragon warrior"
	line "of BLACKTHORN."

	para "Defender of the"
	line "DRAGONS FANG."

	para "Keeper of the"
	line "DRAGONS DEN."

	para "I am second"
	line "only to LANCE"
	cont "himself."

	para "All LEADERs you"
	line "have fought before"
	cont "are weak."

	para "The blood of the"
	line "Dragon courses my"
	cont "veins."

	para "Let war come!"

	para "Let my foes"
	line "perish before me!"

	para "Come trainer."

	para "Show me your"
	line "hunger to be a"
	cont "Champion!"
	done

ClairWinText:
	text "You have defeated"
	line "me..."

	para "But you are"
	line "not ready."
	done

ClairLoseText:
    text "Your destiny"
    line "was always to"
    cont "lose."
    done

ClairText_GoToDragonsDen:
	text "You are the"
	line "victor."

	para "Your prowess at"
	line "the art of battle"
	cont "is evident."

	para "But that is not"
	line "enough..."

	para "It takes more"
	line "than strength to"
	cont "be a Champion."

	para "You are not"
	line "ready."

	para "But I will give"
	line "you a chance to"
	cont "prove yourself."

	para "Behind the Gym is"
	line "DRAGONS DEN."

	para "A sacred place."

	para "I permit your"
	line "entry."

	para "Go to the shrine"
	line "deep within the"
	cont "DEN."

	para "There your heart"
	line "will be tested."
	done

ClairText_TooMuchToExpect:
	text "Do you think this"
	line "is unfair."

	para "Life is unfair."

	para "At least it is"
	line "for the weak."

	para "You must take"
	line "what you want."

	para "Now go to DRAGONS"
	line "DEN."

	para "And claim what you"
	line "think you deserve!"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "You've kept me"
	line "waiting!"

	para "Here! Take this!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> received"
	line "TM24 Dragon Pulse."
	done

BlackthornGymClairText_DescribeTM24:
	text "That contains"
	line "Dragon Pulse."

	para "May it serve you"
	line "well."
	done

BlackthornGymClairText_BagFull:
	text "What is this? You"
	line "don't have room?"
	done

BlackthornGymClairText_League:
	text "You have proven"
	line "yourself as a"
	cont "Champion and a"
	cont "hero."

	para "It enrages me"
	line "how much you"
	cont "remind me of"
	cont "LANCE."

	para "Now go and"
	line "stamp your mark"
	cont "upon the world."
	done

CooltrainermPaulSeenText:
	text "Dragons are"
	line "mythical #mon."

	para "They are hard to"
	line "catch and raise."

	para "But their powers"
	line "are superior."

	para "Are you ready"
	line "to lose?"
	done

CooltrainermPaulBeatenText:
	text "I yield!!"
	done

CooltrainermPaulAfterBattleText:
	text "You met LANCE!"

	para "You fought beside"
	line "him!"

	para "You commanded his"
	line "DRAGONITE!!!"

	para "Okay now I know"
	line "you are making"
	cont "this up!"
	done

CooltrainermMikeSeenText:
	text "Dragons live for"
	line "many decades."

	para "My #mon"
	line "will probably"
	cont "out live me."

	para "I will do my"
	line "best to help"
	cont "them reach their"
	cont "full potential."
	done

CooltrainermMikeBeatenText:
	text "We keep getting"
	line "stronger."
	done

CooltrainermMikeAfterBattleText:
	text "The Dragon Lord"
	line "is centuries old."

	para "It terrifies me"
	line "to think of how"
	cont "strong he must be."
	done

CooltrainerfLolaSeenText:
	text "CLAIR is strong."

	para "But she lacks"
	line "the real heart"
	cont "of a Dragon."

	para "She senses I"
	line "will overtake her."

	para "That's why she"
	line "won't allow me"
	cont "into DRAGONS DEN."

	para "I want more."

	para "And I know I"
	line "shouldn't."
	done

CooltrainerfLolaBeatenText:
	text "She's holding"
	line "me back!"
	done

CooltrainerfLolaAfterBattleText:
	text "I will continue"
	line "to be close to"
	cont "CLAIR."

	para "Then when the"
	line "time is right."

	para "I will claim my"
	line "birthright."

	para "The Dragon Lord"
	line "will see I am"
	cont "more worthy than"
	cont "her!"
	done

BlackthornGymGuideText:
	text "This is it, the"
	line "final Gym in"
	cont "Johto!"

	para "The trainers here"
	line "worship Dragon"
	cont "#mon."

	para "DRAGONS have high"
	line "stats, especially"
	cont "attacking stats."

	para "But they have"
	line "good bulk and"
	cont "speed too."

	para "However they"
	line "often have a"
	cont "severe weakness"
	cont "to ICE moves."

	para "If you have ICE"
	line "moves, now is"
	cont "the time to use"
	cont "them."
	done

BlackthornGymGuideWinText:
	text "Well done!"

	para "I knew you"
	line "could do it."

	para "All hail"
	line "<PLAYER> the"
	cont "Dragon slayer!"

	para "The ELITE FOUR"
	line "have no idea"
	cont "what they are"
	cont "in for."
	done

RematchTextClair:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextClair:
    text "Maybe next time."
    done

BlackthornGymLatiasScript:
    opentext
    writetext LatiasText
    cry LATIAS
    waitbutton
    closetext
    end

LatiasText:
    text "Who's that"
    line "#mon!?"
    done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 2
	warp_event  5, 17, BLACKTHORN_CITY, 2
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
	object_event  4,  3, SPRITE_LATIAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymLatiasScript, -1
