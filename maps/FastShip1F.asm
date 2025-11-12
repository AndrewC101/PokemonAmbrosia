	object_const_def
	const FASTSHIP1F_SAILOR1
	const FASTSHIP1F_SAILOR2
	const FASTSHIP1F_SAILOR3
	const FASTSHIP1F_GENTLEMAN

FastShip1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .EnterFastShip ; SCENE_FASTSHIP1F_ENTER_SHIP
	scene_script .DummyScene2 ; SCENE_FASTSHIP1F_MEET_GRANDPA

	def_callbacks

.DummyScene0:
	end

.EnterFastShip:
	sdefer .EnterFastShipScript
	end

.DummyScene2:
	end

.EnterFastShipScript:
	applymovement FASTSHIP1F_SAILOR1, FastShip1F_SailorStepAsideMovement
	applymovement PLAYER, FastShip1F_PlayerEntersShipMovement
	applymovement FASTSHIP1F_SAILOR1, FastShip1F_SailorBlocksDoorMovement
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod FAST_SHIP_CABINS_SW_SSW_NW
	clearevent EVENT_FAST_SHIP_HAS_ARRIVED
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .SkipGrandpa
	setscene SCENE_FASTSHIP1F_MEET_GRANDPA
	end

.SkipGrandpa:
	setscene SCENE_DEFAULT
	end

FastShip1FSailor1Script:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .Arrived
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .Olivine
	writetext FastShip1FSailor1Text_ToVermilion
	waitbutton
	closetext
	end

.Olivine:
	writetext FastShip1FSailor1Text_ToOlivine
	waitbutton
	closetext
	end

.Arrived:
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue ._Olivine
	writetext FastShip1FSailor1Text_InVermilion
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene VERMILION_PORT, SCENE_VERMILIONPORT_LEAVE_SHIP
	warp VERMILION_PORT, 7, 17
	end

._Olivine:
	writetext FastShip1FSailor1Text_InOlivine
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	setmapscene OLIVINE_PORT, SCENE_OLIVINEPORT_LEAVE_SHIP
	warp OLIVINE_PORT, 7, 23
	end

.LetThePlayerOut:
	readvar VAR_FACING
	ifequal RIGHT, .YouAreFacingRight
	applymovement FASTSHIP1F_SAILOR1, FastShip1F_SailorStepAsideMovement
	applymovement PLAYER, FastShip1F_PlayerLeavesShipMovement
	end

.YouAreFacingRight:
	applymovement FASTSHIP1F_SAILOR1, FastShip1F_SailorStepAsideDownMovement
	applymovement PLAYER, FastShip1F_PlayerLeavesShipRightMovement
	end

FastShip1FSailor2Script:
    jumptextfaceplayer FastShip1FSailor2Text_FirstTime

FastShip1FSailor3Script:
	jumptextfaceplayer FastShip1FSailor3Text

WorriedGrandpaSceneRight:
	moveobject FASTSHIP1F_GENTLEMAN, 20, 6

WorriedGrandpaSceneLeft:
	appear FASTSHIP1F_GENTLEMAN
	applymovement FASTSHIP1F_GENTLEMAN, FastShip1F_GrandpaRunsInMovement
	playsound SFX_TACKLE
	applymovement PLAYER, FastShip1F_PlayerHitByGrandpaMovement
	applymovement FASTSHIP1F_GENTLEMAN, FastShip1F_GrandpaApproachesPlayerMovement
	opentext
	writetext FastShip1FGrandpaText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement FASTSHIP1F_GENTLEMAN, FastShip1F_GrandpaRunsOutMovement
	disappear FASTSHIP1F_GENTLEMAN
	setscene SCENE_DEFAULT
	end

FastShip1F_SailorStepAsideMovement:
	slow_step LEFT
	turn_head RIGHT
	step_end

FastShip1F_SailorBlocksDoorMovement:
	slow_step RIGHT
	turn_head DOWN
	step_end

FastShip1F_SailorStepAsideDownMovement:
	slow_step DOWN
	turn_head UP
	step_end

FastShip1F_PlayerEntersShipMovement:
	step DOWN
	step DOWN
	turn_head DOWN
	step_end

FastShip1F_GrandpaRunsInMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

FastShip1F_GrandpaApproachesPlayerMovement:
	step RIGHT
	step_end

FastShip1F_GrandpaRunsOutMovement:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

FastShip1F_PlayerHitByGrandpaMovement:
	big_step RIGHT
	turn_head LEFT
	step_end

FastShip1F_StepUpMovement: ; unreferenced
	step UP
	step_end

FastShip1F_StepDownMovement: ; unreferenced
	step DOWN
	step_end

FastShip1F_PlayerLeavesShipMovement:
	step UP
	step UP
	step_end

FastShip1F_PlayerLeavesShipRightMovement:
	step RIGHT
	step UP
	step_end

FastShip1FSailor1Text_ToVermilion:
	text "Fast Ship SS.Aqua"
	line "is on route to"
	cont "Vermilion City."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done

FastShip1FSailor1Text_ToOlivine:
	text "Fast Ship SS.Aqua"
	line "is on route to"
	cont "Olivine City."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done

FastShip1FSailor2Text_FirstTime:
	text "Here's your cabin."

	para "It's third class"
	line "but has a bed"
	cont "for you to rest"
	cont "and heal in."

	para "The ship will"
	line "probably arrive"
	cont "as you sleep."
	done

FastShip1FSailor3Text:
	text "You are free to"
	line "go into other"
	cont "passengers cabins."


	para "But don't get"
	line "too rowdy with"
	cont "the trainers."
	done

FastShip1FGrandpaText:
	text "Oh sorry!"

	para "Don't mind me I'm"
	line "just a normal"
	cont "passenger."

	para "I'm looking for"
	line "a little girl."

	para "If you see her"
	line "tell her that"
	cont "her..."

	para "Grandad"

	para "Wants her."
	done

FastShip1FSailor1Text_InOlivine:
	text "Fast Ship SS.Aqua"
	line "has arrived in"
	cont "Olivine City."
	done

FastShip1FSailor1Text_InVermilion:
	text "Fast Ship SS.Aqua"
	line "has arrived in"
	cont "Vermilion City."
	done

FastShip1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  1, FAST_SHIP_1F, -1
	warp_event 27,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 1
	warp_event 23,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 2
	warp_event 19,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 3
	warp_event 15,  8, FAST_SHIP_CABINS_SW_SSW_NW, 1
	warp_event 15, 15, FAST_SHIP_CABINS_SW_SSW_NW, 2
	warp_event 19, 15, FAST_SHIP_CABINS_SW_SSW_NW, 4
	warp_event 23, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 1
	warp_event 27, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 3
	warp_event  3, 13, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 5
	warp_event  6, 12, FAST_SHIP_B1F, 1
	warp_event 30, 14, FAST_SHIP_B1F, 2

	def_coord_events
	coord_event 24,  6, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft
	coord_event 25,  6, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneRight

	def_bg_events

	def_object_events
	object_event 25,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor1Script, -1
	object_event 14,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor2Script, -1
	object_event 22, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor3Script, -1
	object_event 19,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FAST_SHIP_1F_GENTLEMAN
