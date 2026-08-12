	object_const_def
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN
	const RADIOTOWER1F_CRYSTAL

RadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Crystal

.Crystal
    disappear RADIOTOWER1F_CRYSTAL
    endcallback

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .Ready
	special ResetLuckyNumberShowFlag
.Ready:
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManPickNumberText
	promptbutton
	loadmenu .LuckyNumberMenuHeader
	_2dmenu
	closewindow
	callasm RadioTower1FLuckyNumberManCheckGuess
	writetext RadioTower1FLuckyNumberManWinningNumberText
	promptbutton
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.LuckyNumberMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 11
	dw .LuckyNumberMenuData
	db 1 ; default option
.LuckyNumberMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 5, 2 ; rows, columns
	db 4 ; spacing
	dba .LuckyNumberMenuText
	dbw BANK(@), NULL
.LuckyNumberMenuText:
	db "1@"
	db "2@"
	db "3@"
	db "4@"
	db "5@"
	db "6@"
	db "7@"
	db "8@"
	db "9@"
	db "10@"

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem LUCKY_EGG
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_MAX
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	setflag ENGINE_LUCKY_NUMBER_SHOW
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "Radio Card@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, GruntM3LossText, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManCheckGuess:
; wScriptVar holds the player's 1-10 guess. Return prize tier in wScriptVar:
; 1 = exact, 2 = off by 1, 3 = off by 2, 0 = no prize.
.random
	call Random
	and $f
	cp 10
	jr nc, .random
	inc a
	ld b, a

	ld a, [wScriptVar]
	ld c, a
	ld a, b
	cp 10
	jr z, .print_ten
	add '0'
	ld [wStringBuffer3], a
	ld a, '@'
	ld [wStringBuffer3 + 1], a
	jr .score

.print_ten
	ld a, '1'
	ld [wStringBuffer3], a
	ld a, '0'
	ld [wStringBuffer3 + 1], a
	ld a, '@'
	ld [wStringBuffer3 + 2], a

.score
	ld a, b
	sub c
	jr nc, .got_difference
	cpl
	inc a
.got_difference
	cp 3
	jr nc, .no_prize
	inc a
	ld [wScriptVar], a
	ret

.no_prize
	xor a
	ld [wScriptVar], a
	ret

RadioTower1FReceptionistWelcomeText:
	text "Welcome!"
	done

RadioTower1FReceptionistNoToursText:
	text "Hello. I'm sorry,"
	line "but we're not"
	cont "offering any tours"
	cont "today."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hi, are you here"
	line "for the Lucky"
	cont "Number Show?"

	para "Pick a number"
	line "from 1 to 10."

	para "Guess exactly for"
	line "first prize!"
	done

RadioTower1FLuckyNumberManPickNumberText:
	text "Which number will"
	line "you choose?"
	done

RadioTower1FLuckyNumberManWinningNumberText:
	text "The winning number"
	line "was @"
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Please come back"
	line "tomorrow for the"
	cont "next Lucky Number."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Wow! You guessed"
	line "it exactly!"

	para "We have a grand"
	line "prize winner!"

	para "You have won a"
	line "Master Ball!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Hey! You were"
	line "off by only one!"

	para "You've won second"
	line "prize, a Lucky"
	cont "Egg!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Ooh, you were"
	line "off by two."

	para "You've won third"
	line "prize, a PP Max."
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Nope, not close"
	line "enough for a"
	cont "prize today."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "You've got no room"
	line "for your prize."

	para "Make room and come"
	line "back right away."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "It's your lucky"
	line "day!"

	para "We have a quiz"
	line "and you can enter"
	cont "for free."

	para "Answer five ques-"
	line "tions correctly to"
	cont "win a Radio Card."

	para "Slide it into your"
	line "#gear to play"

	para "the radio anytime,"
	line "anywhere."

	para "Would you like to"
	line "take the quiz?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Question 1:"

	para "Dragon attacks are"
	line "resisted only by"
	cont "Steel, Fairy"
	cont "and Ice types?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Correct!"
	line "Question 2:"

	para "Hydro Pump is more"
	line "accurate than"
	cont "Thunder?"
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Bull's-eye!"
	line "Question 3:"

	para "Fire Blast has"
	line "110 base power?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "So far so good!"
	line "Question 4:"

	para "The level cap"
	line "for training"
	cont "#mon is higher"
	cont "than the level"
	cont "cap for capturing"
	cont "#mon by"
	cont "10 levels?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Wow! Right again!"
	line "Here's the final"
	cont "question:"

	para "Gastly is immune"
	line "to 2 types of"
	cont "attacks?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! You got it!"
	line "Congratulations!"

	para "Here's your prize,"
	line "a Radio Card!"
	done

RadioTower1FPokegearIsARadioText:
	text "<PLAYER>'s #gear"
	line "can now double as"
	cont "a radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Please tune in to"
	line "our radio shows."
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Nope!"
	line "Sorry, but you"

	para "got it wrong."
	line "Please try again!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Oh. I see. Please"
	line "see me if you"
	cont "change your mind."
	done

RadioTower1FLassText:
	text "Ben is a fabulous"
	line "DJ."

	para "His sweet voice"
	line "makes me melt!"

	para "I wait here"
	line "everyday in"
	cont "hopes to see"
	cont "him."

	para "To smell him..."

	para "I could wait"
	line "here for hours."
	done

RadioTower1FYoungsterText:
	text "I think I could"
	line "be a radio"
	cont "personality."

	para "I'd make a"
	line "happy show to"
	cont "cheer people up."

	para "Then I would"
	line "use my popularity"
	cont "to go into"
	cont "politics."

	para "Then..."

	para "I'd abolish all"
	line "level caps!"
	done

GruntM3SeenText:
	text "I have only"
	line "one job here!"

	para "To guard this"
	line "door."

	para "They don't put"
	line "me in charge of"
	cont "anything"
	cont "important."

	para "I'm not reliable"
	line "apparently."

	para "I'll show them."
	done

GruntM3BeatenText:
	text "Story of my life!"
	done

GruntM3LossText:
	text "I did it!"

	para "I did it!"
	done

GruntM3AfterBattleText:
	text "I can't do"
	line "anything right."

	para "Don't you lose"
	line "to anyone else."

	para "I don't want to"
	line "be the one guy"
	cont "who lost to a"
	cont "kid."
	done

RadioTower1FDirectoryText:
	text "1F Reception"
	line "2F Sales"

	para "3F Personnel"
	line "4F Production"

	para "5F Director's"
	line "   Office"
	done

RadioTower1FLuckyChannelSignText:
	text "Lucky Channel!"

	para "Pick a number"
	line "from 1 to 10!"

	para "The closer you"
	line "are, the better"
	cont "your prize!"
	done

RadioTowerCrystalScript1:
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, RadioTowerMovement_PlayerDown
    sjump RadioTowerCrystalScript

RadioTowerCrystalScript2:
    showemote EMOTE_SHOCK, PLAYER, 15
    turnobject PLAYER, LEFT
    sjump RadioTowerCrystalScript

RadioTowerCrystalScript3:
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, RadioTowerMovement_PlayerUp
    sjump RadioTowerCrystalScript

RadioTowerCrystalScript:
    playmusic MUSIC_DANCING_HALL
    opentext
    writetext RadioTowerCrystalWaitUp
    waitbutton
    closetext

    playsound SFX_ENTER_DOOR
    appear RADIOTOWER1F_CRYSTAL
    applymovement RADIOTOWER1F_CRYSTAL, RadioTowerMovement_CrystalApproaches
    opentext
    writetext RadioTowerCrystalIntroText
    waitbutton
    closetext

    special FadeOutMusic
    showemote EMOTE_SHOCK, RADIOTOWER1F_CRYSTAL, 15
    applymovement RADIOTOWER1F_CRYSTAL, RadioTowerMovement_CrystalLeft
    pause 10
    applymovement RADIOTOWER1F_CRYSTAL, RadioTowerMovement_CrystalRight

    opentext
    writetext RadioTowerCrystalDadText
    waitbutton
    closetext

    special HealParty
	winlosstext Crystal4LosesText, Crystal4WinsText
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .hard
	sjump .normal
.hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CRYSTAL, CRYSTAL_4
	sjump .battle
.normal
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CRYSTAL, CRYSTAL_4
.battle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_4
	setmapscene RADIO_TOWER_1F, SCENE_FINISHED

	opentext
	writetext RadioTowerCrystalGoodbye
	waitbutton
	closetext

	applymovement RADIOTOWER1F_CRYSTAL, RadioTowerMovement_CrystalLeaves
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER1F_CRYSTAL
    special HealParty
	end

RadioTowerMovement_PlayerDown:
    step DOWN
    turn_head LEFT
    step_end

RadioTowerMovement_PlayerUp:
    step UP
    turn_head LEFT
    step_end

RadioTowerCrystalWaitUp:
    text "Hey <PLAYER>!"
    done

RadioTowerMovement_CrystalApproaches:
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    big_step RIGHT
    step_end

RadioTowerCrystalIntroText:
    text "I got a call from"
    line "Prof.Elm."

    para "You're going to"
    line "take on Team"
    cont "Rocket!"

    para "We should work"
    line "together."

    para "That guy <RIVAL>"
    line "will probably show"
    cont "up at some point"
    cont "too."

    para "He narrowly beat"
    line "me in our battle."

    para "I was expecting"
    line "him to gloat but"
    cont "he actually"
    cont "complemented me."

    para "I don't even think"
    line "it was sarcasm."

    para "Have you fought"
    line "Team Rocket"
    cont "before?"
    done

RadioTowerMovement_CrystalLeft:
    fix_facing
    big_step LEFT
    remove_fixed_facing
    step_end

RadioTowerMovement_CrystalRight:
    big_step RIGHT
    step_end

RadioTowerCrystalDadText:
    text "You found your"
    line "Dad!"

    para "Is he alright!?"

    para "<PLAYER> I'm"
    line "really happy"
    cont "for you!"

    para "He pursued the"
    line "Rockets."

    para "Maybe he will be"
    line "here too."

    para "We need to be"
    line "strong so we can"
    cont "keep everyone safe"
    cont "including your"
    cont "Dad."

    para "Before we get into"
    line "this let's have a"
    cont "battle so we can"
    cont "learn everything"
    cont "we can from"
    cont "each other."
    done

Crystal4LosesText:
    text "I think I"
    line "learnt a lot."
    done

Crystal4WinsText:
    text "I hope that"
    line "helps you."
    done

RadioTowerCrystalGoodbye:
    text "Alright let's"
    line "do this!"

    para "The people we care"
    line "about have enough"
    cont "reasons to worry."

    para "We will give them"
    line "one less reason."

    para "I'm going for"
    line "the underground."

    para "You take the"
    line "tower."

    para "Let's take these"
    line "guys down!"

    para "Good luck."
    done

RadioTowerMovement_CrystalLeaves:
    big_step LEFT
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 12
	warp_event  3,  7, GOLDENROD_CITY, 12
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events
	coord_event 5,  2, SCENE_CUSTOM_1, RadioTowerCrystalScript1
	coord_event 5,  3, SCENE_CUSTOM_1, RadioTowerCrystalScript2
	coord_event 5,  4, SCENE_CUSTOM_1, RadioTowerCrystalScript3

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	def_object_events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, -1
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, -1
	object_event  3,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
