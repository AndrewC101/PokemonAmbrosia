	object_const_def
	const MOUNTMOONSQUARE_FAIRY1
	const MOUNTMOONSQUARE_FAIRY2
	const MOUNTMOONSQUARE_ROCK
	const MOUNTMOONSQUARE_GREEN

MountMoonSquare_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .DisappearMoonStone
	callback MAPCALLBACK_OBJECTS, .DisappearRock

.DummyScene:
	end

.DisappearMoonStone:
	setevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	endcallback

.DisappearRock:
	disappear MOUNTMOONSQUARE_ROCK
	appear MOUNTMOONSQUARE_GREEN
	checkevent EVENT_HOEN_INVASION_UNDERWAY
	iffalse .end
	disappear MOUNTMOONSQUARE_GREEN
.end
	endcallback

ClefairyDance:
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .NoDancing
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NoDancing
	checktime NITE
	iffalse .NoDancing
	appear MOUNTMOONSQUARE_FAIRY1
	appear MOUNTMOONSQUARE_FAIRY2
	applymovement PLAYER, PlayerWalksUpToDancingClefairies
	pause 15
	appear MOUNTMOONSQUARE_ROCK
	turnobject MOUNTMOONSQUARE_FAIRY1, RIGHT
	cry CLEFAIRY
	waitsfx
	pause 30
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep1
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep2
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep3
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep4
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep5
	stopfollow
	applymovement MOUNTMOONSQUARE_FAIRY2, ClefairyDanceStep6
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep7
	stopfollow
	turnobject MOUNTMOONSQUARE_FAIRY1, DOWN
	pause 10
	showemote EMOTE_SHOCK, MOUNTMOONSQUARE_FAIRY1, 15
	turnobject MOUNTMOONSQUARE_FAIRY1, DOWN
	cry CLEFAIRY
	pause 15
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyFleeMovement
	disappear MOUNTMOONSQUARE_FAIRY1
	disappear MOUNTMOONSQUARE_FAIRY2
	stopfollow
	clearevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	end

.NoDancing:
	end

MountMoonSquareHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE

DontLitterSign:
	jumptext DontLitterSignText

MtMoonSquareRock:
	jumpstd SmashRockScript

PlayerWalksUpToDancingClefairies:
	step UP
	step_end

ClefairyDanceStep1:
	slow_step DOWN
	slow_jump_step DOWN
	step_end

ClefairyDanceStep2:
	slow_jump_step RIGHT
	step_end

ClefairyDanceStep3:
	slow_step UP
	slow_jump_step UP
	step_end

ClefairyDanceStep4:
	slow_jump_step LEFT
	step_end

ClefairyDanceStep5:
	slow_step DOWN
	slow_jump_step DOWN
	step_end

ClefairyDanceStep6:
	slow_step DOWN
	step_end

ClefairyDanceStep7:
	slow_step RIGHT
	step_end

ClefairyFleeMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	jump_step RIGHT
	step RIGHT
	step RIGHT
	step_end

DontLitterSignText:
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done
	
MtMoonGreenScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_GREEN
	iftrue .FightDone
.fight
	writetext GreenSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_GREEN
	iftrue .skipRequest
	opentext
	writetext GreenOfferFightText
	waitbutton
	yesorno
	iffalse .refused
	closetext
.skipRequest
	winlosstext GreenBeatenText, GreenWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEAF, GREEN1
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_GREEN
	opentext
	writetext GreenAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext GreenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextGreen
	yesorno
	iftrue .fight
.refused
	writetext RematchRefuseTextGreen
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext MtMoonGreenWinAfterBattleText
    waitbutton
    closetext
    end
GreenSeenText:
    text "Hello!"

    para "I see you're a"
    line "trainer."

    para "A skilled one"
    line "too."

    para "I've been a"
    line "trainer for 5"
    cont "years."

    para "I'm from PALLET"
    line "TOWN."

    para "My name is GREEN."

    para "I started my"
    line "training a few"
    cont "months before"
    cont "RED and BLUE."

    para "BLUE was a"
    line "CHAMPION."

    para "And RED..."

    para "He is beyond"
    line "any titles."

    para "But I am plenty"
    line "strong too!"
    done
GreenOfferFightText:
    text "Want me to show"
    line "you?"
    done
GreenBeatenText:
    text "That brings back"
    line "some memories."
    done
GreenWinsText:
    text "Told you I was"
    line "good."
    done
GreenAfterBattleText:
    text "I don't know"
    line "where RED has"
    cont "disappeared to."

    para "He is like you."

    para "Somehow just..."

    para "Better than anyone"
    line "else."

    para "Everything comes"
    line "so easy to him."
    done
RematchTextGreen:
    text "Like another"
    line "friendly match?"
    done
RematchRefuseTextGreen:
    text "RED wouldn't"
    line "refuse..."
    done
MtMoonGreenWinAfterBattleText:
	text "Aww you did really"
	line "well."
	para "Definitely better"
	line "than me when I was"
	cont "your age."
	para "Never give up and"
	line "you will be great"
	cont "one day."
	done

MountMoonSquare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  5, MOUNT_MOON, 5
	warp_event 22, 11, MOUNT_MOON, 6
	warp_event 13,  7, MOUNT_MOON_GIFT_SHOP, 1

	def_coord_events
	coord_event  7, 11, SCENE_DEFAULT, ClefairyDance

	def_bg_events
	bg_event  7,  7, BGEVENT_ITEM, MountMoonSquareHiddenMoonStone
	bg_event 17,  4, BGEVENT_READ, DontLitterSign

	def_object_events
	object_event  6,  6, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	object_event  7,  6, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	object_event  7,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtMoonSquareRock, EVENT_MT_MOON_SQUARE_ROCK
	object_event  17,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MtMoonGreenScript, EVENT_FIELD_MON_1

