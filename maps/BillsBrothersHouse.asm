	object_const_def
	const BILLSBROTHERSHOUSE_POKEFAN_F
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsBrotherScript:
	jumptextfaceplayer BillsBrotherText

BillsBrothersHouseYoungsterScript:
	jumptextfaceplayer BillsBrothersHouseYoungsterText

BillsBrotherText:
	text "My grandpa is at "
	line "my brother BILL's"
	cont "on CERULEAN CAPE."

	para "BILL has all the"
	line "money and fame."

	para "We all know he"
	line "is dads favorite."

	para "Every holiday we"
	line "get together and"
	cont "it's just BILL"
	cont "talking non stop"
	cont "about himself."

	para "I wish I could"
	line "shut him up!"
	done

BillsBrothersHouseYoungsterText:
	text "We love #mon"
	line "in our family."

	para "My older brother"
	line "BILL is so smart."

	para "I wish I could"
	line "be more like him."

	para "Our older brother"
	line "is jealous though."
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 4
	warp_event  3,  7, FUCHSIA_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsBrotherScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseYoungsterScript, -1
