	object_const_def
	const VIOLETPOKECENTER2F_TRADE_RECEPTIONIST
	const VIOLETPOKECENTER2F_BATTLE_RECEPTIONIST
	const VIOLETPOKECENTER2F_BILL

VioletPokecenter2F_MapScripts::
	def_scene_scripts
	scene_script VioletPokecenter2FNoopScene,     SCENE_VIOLETPOKECENTER2F_NOOP
	scene_script VioletPokecenter2FBillTourScene, SCENE_VIOLETPOKECENTER2F_BILL_TOUR

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .HideBill

.HideBill:
	disappear VIOLETPOKECENTER2F_BILL
	endcallback

VioletPokecenter2FNoopScene:
	end

VioletPokecenter2FBillTourScene:
	sdefer VioletPokecenter2FBillTourScript
	setscene SCENE_VIOLETPOKECENTER2F_NOOP
	end

; The dedicated map delegates its permanent facilities to the shared implementations.
VioletPokecenter2FPlayerRemakeScript:
	farsjump Pokecenter2FPlayerRemakeScript

VioletPokecenter2FPokemonColorScript:
	farsjump Pokecenter2FPokemonColorScript

VioletPokecenter2FTradeReceptionistScript:
	; Link rooms return through the shared 2F, whose stairs use this backup warp.
	warpmod 3, VIOLET_POKECENTER_1F
	farsjump LinkReceptionistScript_Trade

VioletPokecenter2FBattleReceptionistScript:
	warpmod 3, VIOLET_POKECENTER_1F
	farsjump LinkReceptionistScript_Battle

VioletPokecenter2FBillTourScript:
	appear VIOLETPOKECENTER2F_BILL
	follow VIOLETPOKECENTER2F_BILL, PLAYER
	applymovement VIOLETPOKECENTER2F_BILL, VioletPokecenter2FBillWalksToPokemonColorStation
	turnobject VIOLETPOKECENTER2F_BILL, UP
	turnobject PLAYER, UP
	opentext
	writetext VioletPokecenter2FBillPokemonColorText
	waitbutton
	closetext
	applymovement VIOLETPOKECENTER2F_BILL, VioletPokecenter2FBillWalksToPlayerMirror
	turnobject VIOLETPOKECENTER2F_BILL, UP
	turnobject PLAYER, UP
	opentext
	writetext VioletPokecenter2FBillPlayerSpriteText
	waitbutton
	closetext
	stopfollow
	turnobject VIOLETPOKECENTER2F_BILL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext VioletPokecenter2FBillFarewellText
	waitbutton
	closetext
	applymovement VIOLETPOKECENTER2F_BILL, VioletPokecenter2FBillStartsLeaving
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER2F_BILL, VioletPokecenter2FBillFinishesLeaving
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER2F_BILL
	waitsfx
	end

VioletPokecenter2FBillWalksToPokemonColorStation:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

VioletPokecenter2FBillWalksToPlayerMirror:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VioletPokecenter2FBillStartsLeaving:
	step DOWN
	step DOWN
	step_end

VioletPokecenter2FBillFinishesLeaving:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

VioletPokecenter2FBillPokemonColorText:
	text "This is my new"
	line "creation!"
	para "Step inside and"
	line "you can change the"
	cont "colour of your"
	cont "#mon."
	para "You can also"
	line "change their"
	cont "nickname."
	done

VioletPokecenter2FBillPlayerSpriteText:
	text "There is also a"
	line "fully integrated"
	cont "changing room."
	para "So you can change"
	line "your own"
	cont "appearance anytime"
	cont "you like."
	done

VioletPokecenter2FBillFarewellText:
	text "I have great faith"
	line "in Oaks judgement."
	para "I know you will"
	line "become a fantastic"
	cont "trainer."
	para "Good luck"
	line "<PLAYER>!"
	done

VioletPokecenter2F_MapEvents::
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, VIOLET_POKECENTER_1F, 3
	warp_event  9,  0, TRADE_CENTER, 1
	warp_event 13,  0, COLOSSEUM, 1
	warp_event 10,  0, MOBILE_TRADE_ROOM, 1
	warp_event 14,  0, MOBILE_BATTLE_ROOM, 1

	def_coord_events
	coord_event 1, 2, SCENE_ALWAYS, VioletPokecenter2FPokemonColorScript

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, VioletPokecenter2FPlayerRemakeScript
	bg_event  1,  1, BGEVENT_READ, VioletPokecenter2FPokemonColorScript

	def_object_events
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter2FTradeReceptionistScript, -1
	object_event 13,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter2FBattleReceptionistScript, -1
	object_event  0,  6, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BILL_APPEARS_IN_VIOLET
