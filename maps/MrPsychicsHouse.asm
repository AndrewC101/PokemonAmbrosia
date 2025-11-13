	object_const_def
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrPsychic:
    jumptextfaceplayer MrPsychicText1

MrPsychicsHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrPsychicText1:
	text "Ah <PLAYER>"
	line "welcome."

	para "I read your mind."

	para "I have been a"
	line "psychic here"
	cont "for many years."

	para "But this city is"
	line "no longer safe."

	para "So I sent my"
	line "daughter to"
	cont "Cianwood to"
	cont "live peacefully."

	para "She is very"
	line "powerful."

	para "Once she even took"
	line "out a whole biker"
	cont "gang."

	para "They even had a"
	line "Tyranitar."

	para "No idea how she"
	line "did it!"

	para "I wasn't there."

	para "If you see her"
	line "say hey from me."

	para "Better say hey to"
	line "her invisible"
	cont "friend too!"
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
