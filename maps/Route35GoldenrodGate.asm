	object_const_def
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	def_scene_scripts

	def_callbacks

RandyScript:
	faceplayer
	opentext
	;checkevent EVENT_GOT_HP_UP_FROM_RANDY
	;iftrue .gothpup
	;checkevent EVENT_GAVE_KENYA
	;iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke PIKACHU, 25, LIGHT_BALL, GiftSpearowName, GiftSpearowOTName
	;givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

;.questcomplete
;	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
;	promptbutton
;	verbosegiveitem HP_UP
;	iffalse .bagfull
;	setevent EVENT_GOT_HP_UP_FROM_RANDY
;.gothpup
;	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
;	waitbutton
;.bagfull
;	closetext
;	end

;GiftSpearowMail:
;	db FLOWER_MAIL
;	db   "DARK CAVE leads"
;	next "to another road@"

GiftSpearowName:
	db "PIKACHU@"

GiftSpearowOTName:
	db "ASH@"

	db 0 ; unused

Route35GoldenrodGatePokefanFScript:
    jumptextfaceplayer Route35GoldenrodGatePokefanFText

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Hey, you look"
	line "like a good"
	cont "trainer."

	para "I recently found"
	line "this #MON."

	para "I can tell"
	line "there is something"
	cont "special about it."

	para "It needs a good"
	line "trainer."

	para "Would you look"
	line "after it?"
	done

Route35GoldenrodGateRandyThanksText:
	text "I can tell"
	line "this #MON"
	cont "has been well"
	cont "trained."

	para "It will help"
	line "you out I'm"
	cont "sure."
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> received a"
	line "PIKACHU."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Up ahead there"
	line "was a strange"
	cont "old man blocking"
	cont "the road."

	para "He is probably"
	line "lost."

	para "I wonder if"
	line "he is gone now."
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "You can't carry"
	line "another #MON…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… Never mind,"
	line "then…"
	done

;Route35GoldenrodGateRandySomethingForYourTroubleText:
;	text "Thanks, kid! You"
;	line "made the delivery"
;	cont "for me!"
;
;	para "Here's something"
;	line "for your trouble!"
;	done

;Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
;	text "My pal was snooz-"
;	line "ing, right? Heh,"
;	cont "what'd I say?"
;	done

Route35GoldenrodGatePokefanFText:
	text "The NATIONAL PARK"
	line "is up ahead."
	para "Some days you can"
	line "find CHAMPION LEON"
	cont "there."
	para "I'd love to see"
	line "his CHARIZARD."
	done

Route35GoldenrodGateFisherText:
	text "I saw the nurse"
	line "in GOLDENROD"
	cont "#MON CENTER"
	cont "holding some"
	cont "kind of special"
	cont "#BALL."

	para "She said if she"
	line "ever meets a"
	cont "CHAMPION she"
	cont "would give it"
	cont "as a present."

	para "Now how to"
	line "convince her I'm"
	cont "a CHAMPION..."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
