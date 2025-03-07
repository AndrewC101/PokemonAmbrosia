BLUE_CARD_POINT_CAP EQU 30

	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FUnusedDummyScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry CLEFAIRY
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless EVE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "I could listen"
	line "to the radio"
	cont "all day!"

	para "Particularly"
	line "the screamo"
	cont "death metal"
	cont "channel."
	done

RadioTower2FTeacherText:
	text "KANTO has their"
	line "own radio"
	cont "channels."

	para "But they play"
	line "weird stuff like"
	cont "a channel just"
	cont "of # FLUTE"
	cont "music."

	para "Of course you"
	line "need a special"
	cont "add-on to tune"
	cont "into KANTO radio."
	done

RadioTower2FTeacherText_Rockets:
	text "They must have"
	line "realised the"
	cont "power of radio!"

	para "I wonder what"
	line "kind of music"
	cont "TEAM ROCKET"
	cont "are into."
	done

RadioTowerJigglypuffText:
	text "CLEFAIRY:"
	line "clef…"
	done

RadioTower2FBlackBelt1Text:
	text "Sorry but nobody"
	line "is allowed"
	cont "beyond this point."

	para "By order of the"
	line "DIRECTOR!"

	para "He didn't use"
	line "to be like"
	cont "this."

	para "He has suddenly"
	line "become very"
	cont "secretive."
	done

RadioTower2FBlackBelt2Text:
	text "Feel free to look"
	line "around anywhere."

	para "The DIRECTOR is"
	line "back to his old"
	cont "self."
	done

GruntM4SeenText:
	text "Anyone who tries"
	line "to stop us is"
	cont "only helping"
	cont "HOENN to invade"
	cont "KANTO."
	done

GruntM4BeatenText:
	text "You don't"
	line "understand!"
	done

GruntM4AfterBattleText:
	text "You are a"
	line "HOENN sympathiser."
	done

GruntF2SeenText:
	text "We are turning"
	line "this tower into"
	cont "an ultimate"
	cont "weapon of war!"
	done

GruntF2BeatenText:
	text "You poor fool."
	done

GruntF2AfterBattleText:
	text "I may be weak"
	line "but TEAM ROCKET"
	cont "is strong!"

	para "KANTO is strong!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Hi! I'm"
	line "BUENA!"

	para "Do you know about"
	line "a radio program"
	cont "called PASSWORD?"

	para "If you can tell me"
	line "the password from"

	para "the program, you"
	line "will earn points."

	para "Save up those"
	line "points and trade"

	para "them to that sweet"
	line "young lady over"

	para "there for some"
	line "choice prizes!"

	para "Here you go!"

	para "It's your very own"
	line "point card!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Tune in to"
	line "my PASSWORD SHOW!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Hi!"
	line "Did you tune in to"
	cont "my radio show?"

	para "Do you remember"
	line "today's password?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh, wow!"
	line "Thank you!"

	para "What was your name"
	line "again?"

	para "…<PLAY_G>, OK!"

	para "Come on, <PLAY_G>."
	line "Join the show."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Everyone"
	line "ready?"

	para "I want to hear you"
	line "shout out today's"

	para "password for"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Come back"
	line "after you listen"

	para "to my show, OK?"
	line "Catch ya later!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Sorry…"

	para "You get just one"
	line "chance each day."

	para "Come back tomorrow"
	line "for another try!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: YIPPEE!"
	line "That's right!"

	para "You did tune in!"
	line "I'm so happy!"

	para "You earned one"
	line "point! Congrats!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Aww…"
	line "That's not it…"

	para "Did you forget the"
	line "password?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Yup! Our"
	line "contestant was"

	para "<PLAY_G>."
	line "Thanks for coming!"

	para "I hope all you"
	line "listeners will"

	para "come too!"
	line "I'll be waiting!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Huh?"
	line "Today's password?"

	para "HELP, of course!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: Your BLUE"
	line "CARD's full."

	para "Trade it in for a"
	line "fabulous prize!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Tune in to"
	line "PASSWORD every"

	para "night from five"
    line "to midnight!"

	para "Tune in, then drop"
	line "in for a visit!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? You"
	line "forgot to bring"
	cont "your BLUE CARD?"

	para "I can't give you"
	line "points if you"
	cont "don't have it."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! Your"
	line "BLUE CARD reached"

	para "{d:BLUE_CARD_POINT_CAP} points today!"
	line "That's so wild!"

	para "Hmm… There isn't a"
	line "prize for hitting"
	cont "{d:BLUE_CARD_POINT_CAP} points, but…"

	para "You came by so"
	line "often, <PLAY_G>."

	para "I'll make you a"
	line "special deal!"

	para "How would you like"
	line "my phone number?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "do you want to"

	para "register my phone"
	line "number?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> registered"
	line "BUENA's number."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: I look"
	line "forward to hearing"
	cont "from you!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Aww… It's a"
	line "special prize…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "your phone list"

	para "has no room left"
	line "for me…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "You can cash in"
	line "your saved points"

	para "for a lovely prize"
	line "of your choice!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "You can't trade in"
	line "points without"
	cont "your BLUE CARD."

	para "Don't forget your"
	line "BLUE CARD!"
	done

RadioTower2FSalesSignText:
	text "2F SALES"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF.OAK'S #MON"
	line "TALK"

	para "The Hottest Show"
	line "on the Air!"
	done

RadioTower2FPokemonRadioSignText:
	text "Anywhere, Anytime"
	line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
