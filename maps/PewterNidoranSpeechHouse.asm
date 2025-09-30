	object_const_def
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_NIDORAN_M

PewterNidoranSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PewterNidoranSpeechHouseSuperNerdScript:
	jumptextfaceplayer PewterNidoranSpeechHouseSuperNerdText

PewterNidoran:
	opentext
	writetext PewterNidoranText
	cry NIDORAN_M
	waitbutton
	closetext
	end

PewterNidoranSpeechHouseSuperNerdText:
	text "My grandad is"
	line "very down about"
	cont "everything."

	para "He lost all his"
	line "money to some"
	cont "pyramid scheme"
	cont "in VERMILION."

	para "Then one by one"
	line "we lost our whole"
	cont "family."

	para "But life goes"
	line "on."

	para "This MUDKIP was"
	line "just hatched."

	para "It knows nothing"
	line "of pain and"
	cont "hardship."

	para "And I intend to"
	line "keep it that way"
	cont "for as long as"
	cont "I can."
	done

PewterNidoranText:
	text "Mudkip."
	done

PewterNidoranSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 1
	warp_event  3,  7, PEWTER_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterNidoranSpeechHouseSuperNerdScript, -1
	object_event  4,  5, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterNidoran, -1
