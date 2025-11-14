	object_const_def
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F

Route31VioletGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route31VioletGateOfficerScript:
	jumptextfaceplayer Route31VioletGateOfficerText

Route31VioletGateCooltrainerFScript:
	jumptextfaceplayer Route31VioletGateCooltrainerFText

Route31VioletGateOfficerText:
	text "Welcome to Violet"
	line "City."

	para "This used to be a"
	line "happy place to"
	cont "live."
	para "But something"
	line "seems off about it"
	cont "these days."
	done

Route31VioletGateCooltrainerFText:
	text "Be careful in"
	line "Sprout Tower."

	para "They recently"
	line "discovered it"
	cont "has a basement."

	para "A Sage has been"
	line "missing for days"
	cont "down there."
	done

Route31VioletGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, VIOLET_CITY, 8
	warp_event  0,  5, VIOLET_CITY, 9
	warp_event  9,  4, ROUTE_31, 1
	warp_event  9,  5, ROUTE_31, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route31VioletGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route31VioletGateCooltrainerFScript, -1
