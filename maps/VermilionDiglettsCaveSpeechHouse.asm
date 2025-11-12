	object_const_def
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionDiglettsCaveSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "DIGLETT were a"
	line "species of"
	cont "#mon that went"
	cont "extinct not too"
	cont "long ago."

	para "They were small"
	line "GROUND type"
	cont "#mon."

	para "They weren't"
	line "very strong but"
	cont "high level DUGTRIO"
	cont "were also known"
	cont "to inhabit the"
	cont "cave."

	para "It is rumoured"
	line "the ELECTRIC Gym"
	cont "trainers got rid"
	cont "of the DIGLETT"
	cont "so challengers"
	cont "couldn't use them"
	cont "against the Gym."
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 6
	warp_event  3,  7, VERMILION_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
