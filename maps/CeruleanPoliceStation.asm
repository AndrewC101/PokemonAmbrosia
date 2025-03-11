	object_const_def
	const CERULEANPOLICESTATION_FISHING_GURU
	const CERULEANPOLICESTATION_POKEFAN_F
	const CERULEANPOLICESTATION_DIGLETT

CeruleanPoliceStation_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPoliceStationFishingGuruScript:
	jumptextfaceplayer CeruleanPoliceStationFishingGuruText

CeruleanPoliceStationPokefanFScript:
	jumptextfaceplayer CeruleanPoliceStationPokefanFText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry ARCTOZOLT
	waitbutton
	closetext
	end

CeruleanPoliceStationFishingGuruText:
	text "Stop, thief!"

	para "Oh, sorry."

	para "I was about to"
	line "wack you with"
	cont "my baton."

	para "I'm in charge of"
	line "the neighborhood"
	cont "watch."

	para "If you see any"
	line "shady characters"
	cont "feel free to use"
	cont "immediate physical"
	cont "violence."
	done

CeruleanPoliceStationPokefanFText:
	text "We got robbed"
	line "five years ago."

	para "They made off"
	line "with a DIG TM."

	para "I still don't"
	line "sleep soundly"
	cont "at night."
	done

CeruleanDiglettText:
	text "DRILBUR: Drill!"
	done

CeruleanPoliceStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationFishingGuruScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationPokefanFScript, -1
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, -1
