	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE
	const VIOLETPOKECENTER1F_BILL

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Bill

.Bill
    disappear VIOLETPOKECENTER1F_BILL
    endcallback
	
BillExpShareScriptLeft:
    checkevent EVENT_GOT_EXP_SHARE
    iftrue .finish
    sjump BillExpShareScript
.finish
	end

BillExpShareScriptRight:
    checkevent EVENT_GOT_EXP_SHARE
    iftrue .finish
	applymovement PLAYER, VioletPokecenter1FPlayerMovement2
	sjump BillExpShareScript
.finish
	end

BillExpShareScript:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear VIOLETPOKECENTER1F_BILL
	waitsfx
	applymovement VIOLETPOKECENTER1F_BILL, VioletPokecenter1FBillMovement1
	applymovement PLAYER, VioletPokecenter1FPlayerMovement1
	turnobject VIOLETPOKECENTER1F_NURSE, UP
	pause 10
	turnobject VIOLETPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject VIOLETPOKECENTER1F_NURSE, UP
	pause 10
	turnobject VIOLETPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject VIOLETPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext VioletPokecenter1F_BillText1
	promptbutton
	verbosegiveitem LUCKY_EGG
	closetext
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_BILL, VioletPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setevent EVENT_GOT_EXP_SHARE
	waitsfx
	end

VioletPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

VioletPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

VioletPokecenter1FPlayerMovement2:
	step LEFT
	turn_head UP
	step_end

VioletPokecenter1F_BillText1:
	text "Hi I'm BILL, the"
	line "creator of the PC."
	para "You must be"
	line "<PLAYER>."
	para "Did PROF OAK give"
	line "you the secret"
	cont "item..."
	para "The EXP SHARE?"
	para "Ah he did, great!"
	para "I was originally"
	line "going to give it"
	cont "to you but thought"
	cont "it better for OAK"
	cont "to do so."
	para "With the EXP SHARE"
	line "all #mon who"
	cont "don't take part in"
	cont "battle still get"
	cont "half the full EXP."
	para "I hope to improve"
	line "upon this so all"
	cont "#mon get full"
	cont "EXP and perhaps"
	cont "even boosted EXP"
	cont "one day."
	para "Until then I have"
	line "another rare gift"
	cont "for you."
	para "It will help you"
	line "grow stronger"
	cont "even faster!"
	para "Good luck"
	line "<PLAYER>!"
	done

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	checkitem MYSTERY_EGG ; just in case
	iffalse .noEgg
	takeitem MYSTERY_EGG
.noEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_CUSTOM_1
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "EGG@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, long"
	line "time, no see."

	para "PROF.ELM asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take the"
	line "#mon EGG?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "If the egg is a"
	line "FAIRY #mon"
	cont "it may need to"
	cont "form a strong bond"
	cont "with its trainer"
	cont "to obtain its"
	cont "full power."

	para "You would be a"
	line "great choice for"
	cont "such a trainer."
	done

VioletCityElmsAideFullPartyText:
	text "You have a full"
	line "party of six."

	para "I'll wait here"
	line "while you make"
	cont "room for the EGG."
	done

VioletPokecenterElmsAideRefuseText:
	text "Look if I go"
	line "with this EGG"
	cont "it's not going"
	cont "to look good for"
	cont "me."

	para "Please take it."
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, will you"
	line "take the EGG?"
	done

VioletPokecenter1FGameboyKidText:
	text "The INVADER"
	line "outside the city"
	cont "is strong."

	para "But his #mon"
	line "only knows one"
	cont "move that only"
	cont "has 10 PP."

	para "If I could just"
	line "survive 10 hits"
	cont "I'd win for sure."
	done

VioletPokecenter1FGentlemanText:
	text "Just SOUTH of"
	line "here are the"
	cont "RUINS OF ALPH."

	para "I traveled here to"
	line "visit them."

	para "I went last night."

	para "There was an odd"
	line "fellow there."

	para "Said he wanted"
	line "power of DEATH."

	para "I wouldn't go"
	line "there at night"
	cont "if I were you."
	done

VioletPokecenter1FYoungsterText:
	text "You can trade"
	line "#mon with"
	cont "other trainers."

	para "A traded #mon"
	line "gains more EXP"
	cont "in battle."

	para "I think there is"
	line "someone around"
	cont "here looking to"
	cont "trade #mon."
	done

VioBlisseyScript:
    opentext
    writetext VioBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

VioBlisseyText:
    text "Blissey!"
    done

VioDratiniScript:
    opentext
    writetext VioDratiniText
    cry DRATINI
    waitbutton
    closetext
    end

VioDratiniText:
    text "Dratini!"
    done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event 3, 7, SCENE_ALWAYS, BillExpShareScriptLeft
	coord_event 4, 7, SCENE_ALWAYS, BillExpShareScriptRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BILL_APPEARS_IN_VIOLET
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioBlisseyScript, -1
	object_event  2,  4, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioDratiniScript, -1
