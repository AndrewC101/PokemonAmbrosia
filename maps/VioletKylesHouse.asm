	object_const_def
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE

VioletKylesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VioletKylesHousePokefanMScript:
	jumptextfaceplayer VioletKylesHousePokefanMText

Kyle:
	faceplayer
	opentext
	writetext violetTradeText
	waitbutton
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

 violetTradeText:
 	text "Only little kids"
 	line "think Dragon"
 	cont "#mon are cool."
 	para "What is this the"
 	line "late 90s!"
 	para "Dark types don't"
 	line "conform, they are"
 	cont "truly cool."
 	done

VioletKylesHousePokefanMText:
	text "My son used to"
	line "dream of being a"
	cont "Dragon trainer."

	para "He was given a"
	line "Dragon #mon."

	para "But turns out it"
	line "wasn't really a"
	cont "Dragon."

	para "Now since moving"
	line "here he has become"
	cont "infatuated by"
	cont "Dark types."

	para "I hope this is"
	line "just a phase."
	done

VioletKylesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 6
	warp_event  4,  7, VIOLET_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletKylesHousePokefanMScript, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
