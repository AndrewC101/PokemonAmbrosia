	object_const_def
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route7SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .ReturnedPart
	writetext Route7SaffronGuardPowerPlantText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route7SaffronGuardSeriousText
	waitbutton
	closetext
	end

Route7SaffronGuardPowerPlantText:
	text "Wallace knows if"
	line "he takes SAFFRON"
	cont "he takes Kanto."

	para "It is up to me"
	line "to defend this"
	cont "gate..."
	done

Route7SaffronGuardSeriousText:
	text "You are the Hoenn"
	line "Champion that"
	cont "defeated the whole"
	cont "Hoenn army!"

	para "I was just about"
	line "to make my move"
	cont "when I heard"
	cont "you were taking"
	cont "care of things."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
