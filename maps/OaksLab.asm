	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

.DummyScene: ; unreferenced
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	yesorno
	iftrue .warp
	writetext OakGoodLuck
	waitbutton
	closetext
	end
.warp
    writetext OakGoodLuck
	waitbutton
	closetext
	warp SAFFRON_CITY, 9, 30
	playsound SFX_WARP_TO
	end
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .end

    loadmem wExpShareUpgrade, 1
	opentext
	writetext OakBattleOffer
	waitbutton
	yesorno
	iffalse .refuse
	closetext
    winlosstext OakWinText, OakWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer POKEMON_PROF, PROF_OAK
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_OAK
	sjump .endbattle
.lose
    reloadmap
.endbattle
    special HealParty
    opentext
    writetext OakAfterBattleText
    waitbutton
    closetext
.end
	end
.refuse
    opentext
    writetext OakRefusedText
    waitbutton
    closetext
    end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	writetext OakGiveWarpDeviceText
	playsound SFX_GET_BADGE
	waitsfx
	;verbosegiveitem WARP_DEVICE
	setflag ENGINE_WARP
	setevent EVENT_OPENED_MT_SILVER
	loadmem wExpShareUpgrade, 1
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakBattleOffer:
    text "I used to be a"
    line "trainer."

    para "That feels like"
    line "another life now."

    para "I can appreciate"
    line "how hard you work"
    cont "and how gifted you"
    cont "are."

    para "I don't know when"
    line "I became this old"
    cont "man I am now."

    para "Would you give me"
    line "the honor of a"
    cont "battle?"
    done

OakWinText:
    text "I feel younger"
    line "than ever!"
    done

OakAfterBattleText:
    text "That takes me"
    line "back."

    para "You know, there"
    line "are many #MON"
    cont "with amazing"
    cont "abilities."

    para "When I was your"
    line "age, I met one"
    cont "that could travel"
    cont "through time."

    para "CELEBI it was"
    line "called."

    para "I think I want"
    line "to find it again."

    para "Not for study."

    para "But for me."

    para "Thanks again"
    line "<PLAYER>."
    done

OakRefusedText:
    text "Of course, I'm"
    line "sorry."

    para "It was a silly"
    line "suggestion."
    done

OakWelcomeKantoText:
	text "Good to see you"
	line "<PLAYER>."

	para "KANTO is still"
	line "in a war ready"
	cont "state."

	para "The trainers are"
	line "all very strong."

	para "Especially the"
	line "GYM LEADERS."

	para "It may not be"
	line "a friendly place"
	cont "for you right"
	cont "now."

	para "You're a long way"
	line "from SAFFRON."
	para "It might be"
	line "difficult to get"
	cont "back to JOHTO from"
	cont "here."
	para "I can warp you"
	line "back to SAFFRON"
	cont "with a device I"
	cont "have."
	para "Would you like me"
	line "to warp you to"
	cont "SAFFRON?"
	done

OakGoodLuck:
    text "Good luck."
    done

OakLabDexCheckText:
	text "How is your"
	line "#DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "You have done"
	line "incredibly well."

	para "You have saved"
	line "KANTO."

	para "You have defeated"
	line "WALLACE."

	para "And you have"
	line "obtained all KANTO"
	cont "BADGES."

	para "You are a true"
	line "CHAMPION!"

	para "Here, let me give"
	line "your EXP.SHARE"
	cont "my final upgrade."

	para "There!"

	para "Now all #MON"
	line "gain double"
	cont "full EXP!"

    para "I have also made"
	line "arrangements so"
	cont "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"
	cont "home to many wild"
	cont "#MON far"
	cont "too powerful for"
	cont "any trainer to"
	cont "conquer."

	para "Head west from"
	line "VIRIDIAN."

	para "Reach MT.SILVER"
	line "from there."

	para "In MT.SILVER you"
	line "will find RED."

	para "He is the most"
	line "powerful trainer"
	cont "in the world."

	para "I recently sent"
	line "another trainer"
	cont "there to give"
	cont "him a challenge."

	para "But I think you"
	line "might be stronger"
	cont "than either of"
	cont "them."

	para "If you beat him"
	line "you will be a"
	cont "#MON MASTER."
	done

OakGiveWarpDeviceText:
    text "Now that you are"
    line "a Hero, you will"
    cont "be very busy."

    para "Here, this will"
    line "help you get"
    cont "around."

    para "I use it all"
    line "the time."

    para "WARP option was"
    line "added to start"
    cont "menu."
    done

OakNoKantoBadgesText:
    text "Hello <PLAYER>."

	para "The KANTO GYMS"
	line "are very tough."

	para "I sense you are"
	line "having some"
	cont "difficulty with"
	cont "them."

	para "Try fighting them"
	line "all and you will"
	cont "find one you can"
	cont "beat I am sure."
	done

OakYesKantoBadgesText:
    text "Hello <PLAYER>."

	para "Ah you have some"
	line "KANTO BADGES."

	para "Very good!"

	para "Keep battling"
	line "and eventually"
	cont "you will face my"
	cont "nephew BLUE."

	para "He is much more"
	line "powerful than a"
	cont "typical GYM"
	cont "LEADER!"

	para "If you ever beat"
	line "him, you must"
	cont "come see me."
	done

OaksAssistant1Text:
	text "We are working"
	line "closely with BILL"
	cont "on adjustments"
	cont "to the EXP SHARE."
	done

OaksAssistant2Text:
	text "Keep growing"
	line "your #DEX."

	para "The information"
	line "is very valuable."

	para "Seriously, a"
	line "completed #DEX"
	cont "would sell for a"
	cont "fortune."
	done
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"
	cont "#MON TALK isn't"
	cont "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
