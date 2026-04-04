	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
    jumptextfaceplayer ManiaText

ManiaText:
	text "That awful kid!"

	para "If I ever see"
	line "him again..."

	para "Some red haired"
	line "punk broke into"
	cont "my house and tried"
	cont "to steal my money!"

	para "I confounded him"
	line "him with my"
	cont "Weaviles shadow"
	cont "clone jutsu."

	para "I sure showed him!"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
