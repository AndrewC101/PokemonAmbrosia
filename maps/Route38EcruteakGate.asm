	object_const_def
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "This is a very"
	line "boring job."

	para "The hours are"
	line "insane."

	para "Basically all"
	line "day every day."

	para "The pay is"
	line "awful!"

	para "10 dollars an"
	line "hour."

	para "And it's so"
	line "lonely."

	para "I mean nobody"
	line "ever talks to"
	cont "me."

	para "Why would they."

	para "Then I go home"
	line "to my boring"
	cont "life."

	para "No money, no"
	line "partner, no"
	cont "prospects."

	para "I had a gambling"
	line "problem for a"
	cont "time but I"
	cont "quickly ran"
	cont "out of money."

	para "It seemed like"
	line "my only ticket"
	cont "out of here."

	para "Knowing my"
	line "luck Wallace"
	cont "will take over"
	cont "and I'll still"
	cont "be working here."

	para "I'm in a bad"
	line "mood now."

	para "Get lost kid."
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
