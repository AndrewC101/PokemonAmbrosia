	object_const_def
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
    jumptextfaceplayer Route6SaffronGuardWelcomeText

Route6SaffronGuardWelcomeText:
	text "Welcome to Saffron"
	line "City."

	para "The largest and"
	line "most brilliant"
	cont "city in all the"
	cont "world."

	para "The Big #ball!"

	para "Land of great"
	line "opportunity."

	para "If you can make"
	line "it here you can"
	cont "make it anywhere."

	para "Now hurry up and"
	line "get out of here"
	cont "you immigrant."
	done

Route6SaffronGuardMagnetTrainText:
	text "The Magnet Train"
	line "is the most famous"

	para "thing about Saf-"
	line "fron."
	done

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
