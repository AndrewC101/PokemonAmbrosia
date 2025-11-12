	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL
	const RADIOTOWER5F_CRYSTAL

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Crystal

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Crystal:
    disappear RADIOTOWER5F_CRYSTAL
    endcallback

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER

    showemote EMOTE_SHOCK, RADIOTOWER5F_ROCKET_GIRL, 15
	turnobject RADIOTOWER5F_ROCKET_GIRL, UP
	turnobject PLAYER, DOWN
    opentext
    writetext Executivef1SeenText
    waitbutton
    closetext
    winlosstext Executivef1BeatenText, Executivef1LossText
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext

	showemote EMOTE_SHOCK, RADIOTOWER5F_ROCKET, 15
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, RadioTower5FRocketBossLossText
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic

	appear RADIOTOWER5F_CRYSTAL
	applymovement RADIOTOWER5F_CRYSTAL, RadioTower5Movement_CrystalApproaches
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5CrystalText
	waitbutton
	closetext
	applymovement RADIOTOWER5F_CRYSTAL, RadioTower5Movement_CrystalLeaves
	disappear RADIOTOWER5F_CRYSTAL

	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton

.whatWingDoYouWant
    writetext WhichWingDoYouWantText
	loadmenu .WingMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Silver
	ifequal 2, .Rainbow
	closetext
	end
.WingMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .WingMenuData
	db 1 ; default option
.WingMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .WingText
	dbw BANK(@), NULL
.WingText:
	db "Silver@"
	db "Rainbow@"

.Silver
    writetext AreYouSure
    yesorno
    iffalse .whatWingDoYouWant
    sjump .SilverItIs

.Rainbow
    writetext AreYouSure
    yesorno
    iffalse .whatWingDoYouWant

.RainbowItIs
    verbosegiveitem RAINBOW_WING
    setevent EVENT_GOT_RAINBOW_WING
    writetext RainbowWingTipsText
    waitbutton
    sjump .continue

.SilverItIs
    verbosegiveitem SILVER_WING
    setevent EVENT_GOT_SILVER_WING
    writetext SilverWingTipsText
    waitbutton

.continue
    writetext Need8BadgesText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball NUGGET

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5Movement_CrystalApproaches:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	step_end

RadioTower5Movement_CrystalLeaves:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

Executivef1LossText:
	text "It's not as much"
	line "fun without your"
	cont "sobbing Dad."
	para "I'm in a good mood"
	line "so I'm letting you"
	cont "live."
	para "Get out of here!"
	done

RadioTower5FRocketBossLossText:
	text "Soon you will see"
	line "your failure today"
	cont "was necessary for"
	cont "your survival."
	para "Now go home."
	done

Need8BadgesText:
	text "Whatever that"
	line "#mon is it"
	cont "will be strong."
	para "You'll probably"
	line "need 8 badges to"
	cont "catch it."
	done

RadioTower5CrystalText:
    text "You did it!"

    para "You really showed"
    line "TEAM ROCKET who's"
    cont "boss."

    para "Though that exec"
    line "looked defeated"
    cont "and sad."

    para "I almost felt"
    line "sorry for her."

    para "I helped out as"
    line "much as I could"
    cont "but I'm not as"
    cont "strong as you."

    para "I think <RIVAL>"
    line "was helping out"
    cont "too. In his own"
    cont "ignorant way."

    para "Now we should"
    line "head to"
    cont "BLACKTHORN."

    para "The Gym Leader"
    line "will be back."

    para "Our race is still"
    line "on, don't forget!"
    done

FakeDirectorTextBefore1:
	text "Oh thank you!"

	para "You have saved"
	line "me..."
	done

FakeDirectorTextBefore2:
	text "Is that what you"
	line "were expecting?"

	para "I am sorry to"
	line "disappoint you."

	para "I have assumed"
	line "the likeness of"
	cont "the good DIRECTOR"
	cont "to help guide"
	cont "people to our"
	cont "cause."

	para "The real DIRECTOR"
	line "is quite safe."

	para "He would get in"
	line "the way."

	para "And all those"
	line "who get in our"
	cont "way..."

	para "Must be dealt"
	line "with."
	done

FakeDirectorWinText:
	text "You think you"
	line "are helping these"
	cont "people?"
	done

FakeDirectorLoseText:
	text "We are the"
	line "heroes now."
	done

FakeDirectorTextAfter:
	text "The Hoenn"
	line "legendary"
	cont "#mon are"
	cont "much stronger"
	cont "than the elemental"
	cont "birds of Kanto."

	para "We did at one"
	line "time have a"
	cont "weapon that"
	cont "could beat them."

	para "A #mon designed"
	line "only for battle."

	para "But it grew too"
	line "strong and"
	cont "escaped us."

	para "Now we have a"
	line "new plan."

	para "And we need this"
	line "tower to carry"
	cont "it out."

	para "But you are too"
	line "simple to see the"
	cont "nuance of this."

	para "Fine, go rescue"
	line "your DIRECTOR."

	para "He is stashed"
	line "away in the"
	cont "UNDERGROUND."
	done

Executivef1SeenText:
	text "Well, well..."

	para "Where is your"
	line "daddy?"

	para "I enjoyed his"
	line "begging."

	para "I was hoping to"
	line "see some more of"
	cont "it."

	para "This time LANCE"
	line "isn't here to"
	cont "save you!"

	para "I'm going to"
	line "enjoy this all"
	cont "the same."

	para "Your time has come"
	line "Hoenn sympathiser!"
	done

Executivef1BeatenText:
	text "I..."
	para "I don't"
	line "understand."
	para "How have you got"
	line "so much stronger"
	cont "so quickly!"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, isn't it?"

	para "Go on!"

	para "I don't deserve"
	line "mercy."

	para "I wasn't going"
	line "to show you any."

	para "But if you care"
	line "about Johto."

	para "If you care about"
	line "your family."

	para "You will let my"
	line "brother finish"
	cont "his work."

	para "Hoenn will end"
	line "everything you"
	cont "love."

	para "They killed our"
	line "parents in front"
	cont "of us when we"
	cont "were children."

	para "LANCE then"
	line "liberated SAFFRON"
	cont "from Hoenn."

	para "But our lives"
	line "were already"
	cont "ruined."

	para "I won't let them"
	line "get away with it."
	done

RadioTower5FRocketBossBeforeText:
    text "Don't trouble"
    line "yourself CASSIDY."

	para "We have developed"
	line "an EM signal that"
	cont "induces rage in"
	cont "#mon."

	para "Our only hope"
	line "to defeat Hoenn"
	cont "is to use this"
	cont "signal to turn"
	cont "their legendary"
	cont "#mon against"
	cont "them."

	para "Imagine the shock"
	line "of WALLACE when"
	cont "his own #mon"
	cont "destroy his army."

	para "You may not agree"
	line "with our methods"
	cont "but you must see"
	cont "the necessity of"
	cont "our work."

	para "I can not allow"
	line "you to interfere."
	done

RadioTower5FRocketBossWinText:
	text "You think yourself"
	line "strong?"
	para "You have no idea"
	line "what WALLACE will"
	cont "do to us all."
	done

RadioTower5FRocketBossAfterText:
	text "It is not over."

	para "This is not the"
	line "only radio tower."

	para "We have dispatched"
	line "the PRIMERA."

	para "Our top operative"
	line "is entrusted to"
	cont "see our vision"
	cont "to fruition."

	para "He is stronger"
	line "even than LANCE."

	para "One day you will"
	line "see you are the"
	cont "villain here."

	para "But by then it"
	line "will be too late."

	para "All suffering"
	line "that follows is"
	cont "on your head."
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTOR: <PLAY_G>,"
	line "thank you!"

	para "Your courageous"
	line "actions have saved"

	para "#mon nation-"
	line "wide."

	para "I know it's not"
	line "much, but please"
	cont "take one of these"
	cont "mystical feathers."

	para "I found these many"
	line "years ago."

	para "Pick whichever"
	line "colour you wish."
	done

AreYouSure:
    text "Are you sure?"
    done

WhichWingDoYouWantText:
    text "Pick a mystical"
    line "feather?"
    done

RainbowWingTipsText:
    text "There used to be a"
	line "tower right here"
	cont "in GOLDENROD CITY."

	para "But it was old and"
	line "creaky."

	para "So we replaced it"
	line "with our RADIO"
	cont "TOWER."

	para "We dug up that"
	line "wing during"
	cont "construction."

	para "I heard that all"
	line "sorts of #mon"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps…"

	para "That wing has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY…"

	para "A powerful"
	line "#mon may live"
	cont "there."
	done

SilverWingTipsText:
    text "I found that when"
    line "traveling the sea"
    cont "near OLIVINE."

    para "There was a storm"
    line "that day."

    para "It was the worst"
    line "storm I had ever"
    cont "seen."

    para "Everyone was in"
    line "panic."

    para "Then the sun"
    line "pierced the clouds"
    cont "and the storm just"
    cont "disappeared."

    para "A huge #mon"
    line "flew over me!"

    para "It filled the"
    line "sky."

    para "I know it must"
    line "have saved us."

    para "I followed it out"
    line "to the WHIRL"
    cont "ISLANDS."

    para "But all I found"
    line "was this feather."

    para "Maybe you will be"
    line "the one to"
    cont "find it."
    done

RadioTower5FDirectorDescribeClearBellText:
	text "There used to be a"
	line "tower right here"
	cont "in GOLDENROD CITY."

	para "But it was old and"
	line "creaky."

	para "So we replaced it"
	line "with our RADIO"
	cont "TOWER."

	para "We dug up that"
	line "bell during"
	cont "construction."

	para "I heard that all"
	line "sorts of #mon"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps…"

	para "That bell has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY…"

	para "Ah!"

	para "That reminds me…"

	para "I overheard TEAM"
	line "ROCKET whispering."

	para "Apparently, some-"
	line "thing is going on"
	cont "at the TIN TOWER."

	para "I have no idea"
	line "what is happening,"

	para "but you might look"
	line "into it."

	para "OK, I better go to"
	line "my OFFICE."
	done

RadioTower5FDirectorText:
	text "DIRECTOR: Hello,"
	line "<PLAY_G>!"

	para "You know, I love"
	line "#mon."

	para "I built this RADIO"
	line "TOWER so I could"

	para "express my love"
	line "of #mon."

	para "It would be nice"
	line "if people enjoyed"
	cont "our programs."
	done

BenText:
	text "BEN: Do you listen"
	line "to our music?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "5F DIRECTOR'S"
	line "   OFFICE"
	done

RadioTower5FStudio1SignText:
	text "5F STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
	object_event 12,  0, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1

