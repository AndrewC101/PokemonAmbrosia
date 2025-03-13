	object_const_def
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD

Route16FuchsiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route16FuchsiaSpeechHouseAVGNScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseAVGNText

Route16FuchsiaSpeechHouseMusicianScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseMusicianText

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

Route16FuchsiaSpeechHouseAVGNText:
	text "I'd rather eat a"
	line "steaming pile of"
	cont "fresh SNORLAX"
	cont "excrement and wash"
	cont "it down with some"
	cont "vintage TAUROS"
	cont "urine than subject"
	cont "myself to another"
	cont "moment of this"
	cont "wretched GAME!!!"
	done

Route16FuchsiaSpeechHouseMusicianText:
	text "He's gonna take"
	line "you back to the"
	cont "past."
	para "To play the"
	line "awesome romhacks"
	cont "that ingest"
	cont "Gluteus Maximus..."
	para "Hey we don't want"
	line "to be canceled"
	cont "here."
	done

AvgnFlameOrb:
    itemball FLAME_ORB

Route16FuchsiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_16, 1
	warp_event  3,  7, ROUTE_16, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf

	def_object_events
	object_event  4,  5, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseAVGNScript, -1
	object_event  3,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseMusicianScript, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AvgnFlameOrb, EVENT_AVGN_FLAME_ORB

