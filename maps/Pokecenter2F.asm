	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FNoopScene,                  SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	scene_script Pokecenter2FLeaveTradeCenterScene,      SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,        SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script Pokecenter2FNoopScene,                  SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE
	scene_script Pokecenter2FLeaveMobileTradeRoomScene,  SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	scene_script Pokecenter2FLeaveMobileBattleRoomScene, SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM

	def_callbacks

Pokecenter2FNoopScene:
	end

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

Pokecenter2FLeaveMobileTradeRoomScene:
	sdefer Script_LeftMobileTradeRoom
	end

Pokecenter2FLeaveMobileBattleRoomScene:
	sdefer Script_LeftMobileBattleRoom
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special TryQuickSave
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

BattleTradeMobile_WalkIn:
	applymovementlasttalked Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown
	applymovement PLAYER, Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckMobileAdapterStatusSpecial
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .SelectThreeMons
	iffalse .Mobile_Abort
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Function103780
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

.SelectThreeMons:
	special Mobile_SelectThreeMons
	iffalse .Mobile_DidNotSelect
	ifequal $1, .Mobile_OK
	ifequal $2, .Mobile_OK
	ifequal $3, .Mobile_InvalidParty
	sjump .Mobile_DidNotSelect

.Mobile_InvalidParty:
	writetext Text_BrokeStadiumRules
	waitbutton
.Mobile_DidNotSelect:
	closetext
	setval FALSE
	end

.Mobile_OK:
	setval TRUE
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_TRADE_ROOM, SCENE_MOBILETRADEROOM_INITIALIZE
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene MOBILE_BATTLE_ROOM, SCENE_MOBILEBATTLEROOM_INITIALIZE
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Pokecenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistLooksRight
	turnobject PLAYER, LEFT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special UpdatePlayerSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Pokecenter2FPlayerRemakeScript:
	callasm ShowPlayerMirrorPic
	opentext
	writetext Pokecenter2FPlayerRemakeText
	nooryes
	iffalse .done
	closetext
	farsjump PlayerRecreationScript

.done
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown:
	slow_step UP
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_end

Text_BattleReceptionistMobile:
	text "Would you like to"
	line "battle over a Game"

	para "link cable or by"
	line "mobile phone?"
	done

Text_TradeReceptionistMobile:
	text "Would you like to"
	line "trade over a Game"

	para "link cable or by"
	line "mobile phone?"
	done

Text_ThisWayToMobileRoom: ; unreferenced
	text "This way to the"
	line "MOBILE ROOM."
	done

Text_BattleReceptionistIntro:
	text "Welcome to Cable"
	line "Club Colosseum."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to cable"
	line "trade Center."

	para "You may trade your"
	line "#mon here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

YourFriendIsNotReadyText:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_PleaseComeInDuplicate: ; unreferenced
	text "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom: ; unreferenced
	text "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	done

Text_PleaseEnter: ; unreferenced
	text "Please enter."
	prompt

Text_TradeRoomClosed:
	text "I'm sorry--the"
	line "Trade Machine is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	text "I'm sorry--the"
	line "Battle Machine is"
	cont "being adjusted."
	done

Pokecenter2FPlayerRemakeText:
	text "Do you want to"
	line "change yourself?"
	done

Text_OhPleaseWait:
	text "Oh, please wait."
	done

Text_ChangeTheLook:
	text "We need to change"
	line "the look here…"
	done

Text_LikeTheLook:
	text "How does this"
	line "style look to you?"
	done

Text_BrokeStadiumRules:
	text "Excuse me!"

	para "For STADIUM rules,"
	line "please bring six"

	para "different #mon,"
	line "excluding Eggs."

	para "The six #mon"
	line "must be different."

	para "Also, they must"
	line "not be holding"
	cont "identical items."

	para "Please come back"
	line "when you're ready."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  9,  0, TRADE_CENTER, 1
	warp_event 13,  0, COLOSSEUM, 1
	warp_event 10,  0, MOBILE_TRADE_ROOM, 1
	warp_event 14,  0, MOBILE_BATTLE_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, Pokecenter2FPlayerRemakeScript

	def_object_events
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event 13,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
