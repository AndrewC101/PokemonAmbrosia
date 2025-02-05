	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
;    checkevent EVENT_BEAT_ELITE_FOUR
;    iftrue .normal
;	clearevent EVENT_RETURNED_MACHINE_PART
;	clearevent EVENT_RESTORED_POWER_TO_KANTO
;	clearevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
;	setevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
;	setevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
;.normal
    checkevent EVENT_GOT_HM04_STRENGTH
    iffalse .noStrength
    jumptextfaceplayer OlivineCafeStrengthSailorText_GotStrength
.noStrength
    jumptextfaceplayer OlivineCafeStrengthSailorText_NoStrength

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText_GotStrength:
	text "I see you've"
	line "gotten more buff"
	cont "since I gave you"
	cont "STRENGTH."

	para "You need to visit"
	line "BATTLE FRONTIER!"

	para "It is all I"
	line "need in life."
	done

OlivineCafeStrengthSailorText_NoStrength:
	text "These long days of"
	line "back breaking work"
	cont "are tough."
	para "Good thing I have"
	line "STRENGTH."
	done

OlivineCafeFishingGuruText:
	text "You lookin for"
	line "some good food"
	cont "to make ye a"
	cont "real mawn!"

	para "None of that"
	line "vegan muck here!"

	para "TAUROS burgers"
	line "are what ye need!"
	done

OlivineCafeSailorText:
	text "Aww man, I need"
	line "more PROTEIN."

	para "This is the"
	line "best place for"
	cont "my pre-workout"
	cont "meal!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
