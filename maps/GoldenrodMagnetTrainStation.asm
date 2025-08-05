	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	def_callbacks

.DummyScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_HOEN_INVASION_UNDERWAY
	iftrue .noTrain
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MagnetTrainToSaffron
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
.noTrain
	writetext GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse .DecidedNotToRide
	;checkitem PASS
	;iffalse .PassNotInBag
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval FALSE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

;.PassNotInBag:
;	writetext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
;	waitbutton
;	closetext
;	end

.DecidedNotToRide:
	writetext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText:
	text "The train hasn't"
	line "come in…"

	para "There has been"
	line "no communication"
    cont "from KANTO."

    para "Maybe the war has"
    line "begun!"

    para "ARCEUS help us"
    line "all."
	done

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "We'll soon depart"
	line "for SAFFRON."

	para "Are you coming"
	line "aboard?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "OK. Right this"
	line "way, please."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "We hope to see you"
	line "again!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "We have arrived in"
	line "GOLDENROD."

	para "We hope to see you"
	line "again."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "I'm the PRESIDENT."

	para "I invested my"
	line "sizable life"
	cont "savings into"
	cont "this train."

	para "It really brings"
	line "JOHTO much closer"
	cont "to KANTO."

	para "Well, SAFFRON at"
	line "least."

	para "I don't want to"
	line "be much closer"
	cont "to the rest of"
	cont "KANTO."
	done

GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, GOLDENROD_CITY, 6
	warp_event  9, 17, GOLDENROD_CITY, 6
	warp_event  6,  5, SAFFRON_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromSaffron

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, -1
