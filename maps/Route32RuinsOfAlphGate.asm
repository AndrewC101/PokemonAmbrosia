	object_const_def
	const ROUTE32RUINSOFALPHGATE_OFFICER
	const ROUTE32RUINSOFALPHGATE_POKEFAN_M
	const ROUTE32RUINSOFALPHGATE_YOUNGSTER

Route32RuinsOfAlphGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route32RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route32RuinsOfAlphGateOfficerText

Route32RuinsOfAlphGatePokefanMScript:
	jumptextfaceplayer Route32RuinsOfAlphGatePokefanMText

Route32RuinsOfAlphGateYoungsterScript:
	jumptextfaceplayer Route32RuinsOfAlphGateYoungsterText

Route32RuinsOfAlphGateOfficerText:
	text "Ruins of Alph"

	para "You are free to"
	line "explore as you"
	cont "wish."

	para "But be aware we"
	line "have had reports"
	cont "of a suspicious"
	cont "figure appearing"
	cont "at night."
	done

Route32RuinsOfAlphGatePokefanMText:
	text "I was hiking and"
	line "found myself in"
	cont "one of the puzzle"
	cont "chambers."
	para "Then the WATER"
	line "STONE in my pack"
	cont "started to glow."
	para "No idea what"
	line "that's about."
	done

Route32RuinsOfAlphGateYoungsterText:
	text "There are drawings"
	line "on stone panels."

	para "I tried moving"
	line "them but I just"
	cont "couldn't work"
	cont "it out."

	para "You'd need to be"
	line "some kind of"
	cont "genius to do it."
	done

Route32RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 10
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  9,  4, ROUTE_32, 2
	warp_event  9,  5, ROUTE_32, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGateYoungsterScript, -1
