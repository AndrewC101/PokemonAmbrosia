	object_const_def
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER

MahoganyRedGyaradosSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyRedGyaradosSpeechHouseBlackBeltScript:
	jumptextfaceplayer MahoganyRedGyaradosSpeechHouseBlackBeltText

MahoganyRedGyaradosSpeechHouseTeacherScript:
    jumptextfaceplayer MahoganyRedGyaradosSpeechHouseTeacherText

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "Don't be fooled."

	para "This might look"
	line "like a quiet"
	cont "little town."

	para "But there is a"
	line "dark heart"
	cont "beating under"
	cont "the surface."

	para "I know there"
	line "is a large"
	cont "underground"
	cont "facility hidden"
	cont "under the mart."
	done

MahoganyRedGyaradosSpeechHouseTeacherText:
	text "I had a friend"
	line "who just went"
	cont "missing one day"
	cont "last year."

	para "I think it was"
	line "the Mahogany"
	cont "murderer."

	para "A serial killer"
	line "that people think"
	cont "disappeared."

	para "But I think he"
	line "is still out"
	cont "there."

	para "I'm scared to"
	line "go out by myself."
	done

MahoganyRedGyaradosSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1
