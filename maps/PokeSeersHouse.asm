	object_const_def
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokeSeersHouseGrannyScript:
	jumptextfaceplayer PokeSeersHouseGrannyText

PokeSeersHouseGrannyText:
	text "My grandaughter"
	line "recently moved"
	cont "here from Saffron."

	para "She is quite the"
	line "handful."

	para "She has trouble"
	line "making friends."

	para "At least any real"
	line "friends."

	para "She keeps reading"
	line "peoples minds"
	cont "without asking."
	done

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokeSeersHouseGrannyScript, -1
