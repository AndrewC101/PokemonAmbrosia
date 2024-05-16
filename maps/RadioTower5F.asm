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

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	;endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
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
	db "SILVER@"
	db "RAINBOW@"

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
    sjump .continue

.SilverItIs
    verbosegiveitem SILVER_WING
    setevent EVENT_GOT_SILVER_WING
    writetext SilverWingTipsText

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

Need8BadgesText:
	text "Whatever that"
	line "#MON is it"
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

    para "The GYM LEADER"
    line "will be back."

    para "Our race is still"
    line "on don't forget!"
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
	text "The HOEN legendary"
	line "#MON are"
	cont "must stronger"
	cont "than the element"
	cont "birds of KANTO."

	para "We did at one"
	line "time have a"
	cont "weapon that"
	cont "could beat them."

	para "A #MON designed"
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

	para "Fine go rescue"
	line "your DIRECTOR."

	para "He is stashed"
	line "away in the"
	cont "UNDERGROUND."
	done

Executivef1SeenText:
	text "Well, well..."

	para "Where is your"
	line "daddy?"

	para "I would like"
	line "to see the pain"
	cont "in his face as"
	cont "my #MON"
	cont "torture you."

	para "This time LANCE"
	line "isn't here to"
	cont "save you!"

	para "I'm going to"
	line "enjoy this all"
	cont "the same."

	para "Time to die"
	line "HOEN sympathiser!"
	done

Executivef1BeatenText:
	text "That's impossible!"

	para "You were weak"
	line "before!"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, isn't it?"

	para "Go on!"

	para "Finish me!"

	para "I don't deserve"
	line "mercy."

	para "I wasn't going"
	line "to show you any."

	para "But if you care"
	line "about JOHTO."

	para "If you care about"
	line "your family."

	para "You will let my"
	line "brother finish"
	cont "his work."

	para "HOEN will kill"
	line "everyone you"
	cont "love."

	para "They killed our"
	line "parents in front"
	cont "of us when we"
	cont "were children."

	para "LANCE then"
	line "liberated SAFFRON"
	cont "from HOEN control."

	para "But our lives"
	line "were already"
	cont "ruined."

	para "I wont let them"
	line "get away with it."
	done

RadioTower5FRocketBossBeforeText:
	text "We have developed"
	line "an EM signal that"
	cont "induces rage in"
	cont "#MON."

	para "Our only hope"
	line "to defeat HOEN"
	cont "is to use this"
	cont "signal to turn"
	cont "their legendary"
	cont "#MON against"
	cont "them."

	para "Imagine the shock"
	line "of WALLACE when"
	cont "his own #MON"
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
	text "No!"

	para "You naive child."
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

	para "#MON nation-"
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
	line "sorts of #MON"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps…"

	para "That wing has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY…"

	para "A powerful"
	line "#MON may live"
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

    para "A huge #MON"
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
	line "sorts of #MON"

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
	line "#MON."

	para "I built this RADIO"
	line "TOWER so I could"

	para "express my love"
	line "of #MON."

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
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
	object_event 12,  0, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1

