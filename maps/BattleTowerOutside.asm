	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS
	const BATTLETOWEROUTSIDE_GRAMPS
	const BATTLETOWEROUTSIDE_POKEFAN_M
	const BATTLETOWEROUTSIDE_BEAUTY_2

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	endcallback

.Callback2:
    appear BATTLETOWEROUTSIDE_GRAMPS
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideBeauty2Script:
	jumptextfaceplayer BattleTowerOutsideBeauty2Text

BattleTowerOutsidePokefanScript:
	jumptextfaceplayer BattleTowerOutsidePokefanText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText:
	text "I'm addicted!"

	para "I keep playing"
	line "BATTLE ROULETT."

	para "You never know"
	line "who you will"
	cont "battle or what"
	cont "you will win."

	para "Once I even"
	line "won a LEFTOVERS."

	para "It's all random."
	done

BattleTowerOutsideBeautyText:
	text "BATTLE TOWER"
	line "is so tough."

	para "I can't even"
	line "beat NOVICE"
	cont "level with my"
	cont "#MON."

	para "But I do well"
	line "in MIRROR mode."

	para "I even won once!"
	done

BattleTowerOutsidePokefanText:
    text "I main CHUCK in"
    line "the ARCADE."

    para "With the right"
    line "strategy I"
    cont "can overcome"
    cont "any type"
    cont "disadvantage."

    para "MORTY is cool"
    line "too though."

    para "I hear you can"
    line "unlock CYNTHIA."

    para "I'd main her"
    line "all day..."
    done

BattleTowerOutsideBeauty2Text:
    text "I've been fighting"
    line "myself but I"
    cont "keep losing."

    para "I'm sure there"
    line "is some way I"
    cont "can trick"
    cont "myself by using"
    cont "weak #MON."
    done

BattleTowerOutsideSailorText:
	text "This is grueling."

	para "But I will never"
	line "give up!"

	para "I got to"
	line "battle 9 once."

	para "That's a new"
	line "record for me!"

	para "BATTLE TRIAL"
	line "is all about"
	cont "slow constant"
	cont "improvement."
	done

BattleTowerOutsideSignText:
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done

BTGrampsScript:
    checkevent EVENT_TAKEN_BT_TOUR
    iffalse .tour
    opentext
    writetext TakeTourAgain
    yesorno
    closetext
    iffalse .end
.tour
    opentext
    writetext WelcomeToBattleTower
    waitbutton
    closetext
    follow BATTLETOWEROUTSIDE_GRAMPS, PLAYER
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GoToBattleMirror
    turnobject PLAYER, UP
    opentext
    writetext BattleMirrorIntro
    waitbutton
    closetext
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GoToBattleRoulette
    turnobject PLAYER, UP
    opentext
    writetext BattleRouletteIntro
    waitbutton
    closetext
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GoToBattleArcade
    turnobject PLAYER, UP
    opentext
    writetext BattleArcadeIntro
    waitbutton
    closetext
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GoToBattleTrial
    turnobject PLAYER, UP
    opentext
    writetext BattleTrialIntro
    waitbutton
    closetext
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GoToBattleTower
    opentext
    writetext BattleTowerIntro
    waitbutton
    closetext
    stopfollow
    applymovement BATTLETOWEROUTSIDE_GRAMPS, Movement_GrampsLeaves
    disappear BATTLETOWEROUTSIDE_GRAMPS
    moveobject BATTLETOWEROUTSIDE_GRAMPS, 10, 28
    appear BATTLETOWEROUTSIDE_GRAMPS
    setevent EVENT_TAKEN_BT_TOUR
    setmapscene BATTLE_TOWER_OUTSIDE, SCENE_FINISHED
    turnobject PLAYER, UP
.end
    end

TakeTourAgain:
    text "I hope you are"
    line "having fun!"

    para "Would you like"
    line "to take the"
    cont "tour again?"
    done

WelcomeToBattleTower:
    text "Hello trainer!"

    para "Welcome to the"
    line "BATTLE FRONTIER."

    para "Here you can"
    line "fully test your"
    cont "skills as a"
    cont "trainer."

    para "There are several"
    line "challenges to pick"
    cont "from."

    para "Let me show you"
    line "around."
    done

Movement_GoToBattleMirror:
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step RIGHT
    step RIGHT
    turn_head UP
    step_end

BattleMirrorIntro:
    text "This is the"
    line "BATTLE MIRROR."

    para "Here you can"
    line "battle against an"
    cont "exact copy of"
    cont "yourself."

    para "The prizes are"
    line "random and often"
    cont "useless trinkets."

    para "Great if you want"
    line "a guaranteed"
    cont "challenge."
    done

Movement_GoToBattleRoulette:
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    turn_head UP
    step_end

BattleRouletteIntro:
    text "This is the"
    line "BATTLE ROULETTE."

    para "Here you can fight"
    line "a random memorable"
    cont "opponent you have"
    cont "beaten before."

    para "The prizes are"
    line "also random."

    para "This is the best"
    line "for some quick"
    cont "fun."
    done

Movement_GoToBattleArcade:
    step LEFT
    step LEFT
    step LEFT
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step RIGHT
    step RIGHT
    turn_head UP
    step_end

BattleArcadeIntro:
    text "This is the"
    line "BATTLE ARCADE."

    para "This is my"
    line "favorite!"

    para "Here you can"
    line "pick a trainer"
    cont "to play as."

    para "Then pick a"
    line "trainer to fight"
    cont "against."

    para "All trainers are"
    line "super powered!"

    para "You can feel"
    line "what it's like"
    cont "to be super"
    cont "strong!"

    para "There are 6"
    line "characters at"
    cont "first."

    para "You can unlock"
    line "more in batches"
    cont "as you progress"
    cont "in the world."

    para "Up to a maximum"
    line "of 30 characters."
    done

Movement_GoToBattleTrial:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    turn_head UP
    step_end

BattleTrialIntro:
    text "This is the"
    line "BATTLE TRIAL."

    para "Here you fight"
    line "consecutive fights"
    cont "with enemies of"
    cont "increasing"
    cont "strength."

    para "You only get"
    line "healed every three"
    cont "fights."

    para "You also get fixed"
    line "prizes."

    para "If you make it"
    line "through the normal"
    cont "trial you unlock"
    cont "the MASTER TRIAL."

    para "I hear there is"
    line "even another level"
    cont "beyond that but"
    cont "nobody has ever"
    cont "reached it."

    para "If you want to"
    line "measure just how"
    cont "strong you are"
    cont "this is the"
    cont "place."
    done

Movement_GoToBattleTower:
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step UP
    step UP
    step UP
    step UP
    step UP
    turn_head DOWN
    step_end

BattleTowerIntro:
    text "Now this!"

    para "This is the"
    line "main event."

    para "the BATTLE TOWER!"

    para "Here you can have"
    line "a series of fights"
    cont "against enemies"
    cont "random teams."

    para "It's a different"
    line "challenge every"
    cont "time!"

    para "You must complete"
    line "four full fights"
    cont "with no rules."

    para "There are five"
    line "difficulties to"
    cont "pick from."

    para "Two of which are"
    line "only offered to"
    cont "CHAMPION trainers."

    para "The prizes are"
    line "good."

    para "Particularly for"
    line "the top levels."

    para "There is also a"
    line "MIRROR battle"
    cont "mode."

    para "This means you"
    line "fight with a copy"
    cont "of the enemy team."

    para "Making for the"
    line "ultimate test of"
    cont "knowledge and"
    cont "skill."

    para "If you want a"
    line "real challenge"
    cont "this is the place"
    cont "to be!"

    para "Well that's all!"

    para "I hope you spend"
    line "hours here having"
    cont "fun!"

    para "Good luck!"
    done

Movement_GrampsLeaves:
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

BattleTowerTourScript1:
    turnobject PLAYER, RIGHT
    sjump BTGrampsScript

BattleTowerTourScript2:
    applymovement PLAYER, Movement_BTTour
    turnobject PLAYER, RIGHT
    sjump BTGrampsScript

Movement_BTTour:
    step RIGHT
    step_end

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 29, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 29, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2
	warp_event  4, 21, TRAINER_HOUSE_B1F, 1
	warp_event  5, 21, TRAINER_HOUSE_B1F, 2
	warp_event 12, 21, TRAINER_HOUSE_B1F, 3
	warp_event 13, 21, TRAINER_HOUSE_B1F, 4
	warp_event  14,  15, TRAINER_HOUSE_B1F, 5
	warp_event  15,  15, TRAINER_HOUSE_B1F, 6
	warp_event  2,  15, TRAINER_HOUSE_B1F, 7
	warp_event  3,  15, TRAINER_HOUSE_B1F, 8

	def_coord_events
	coord_event 8, 28, SCENE_DEFAULT, BattleTowerTourScript2
	coord_event 9, 28, SCENE_DEFAULT, BattleTowerTourScript1

	def_bg_events
	bg_event 10, 12, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 24, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event  7, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 11, 16, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 32, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 28, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BTGrampsScript, EVENT_TEMP_EVENT_1
	object_event  0, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsidePokefanScript, -1
	object_event 12, 24, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeauty2Script, -1
