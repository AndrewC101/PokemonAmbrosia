	object_const_def
	const LAVENDERSPEECHHOUSE_POKEFAN_F

LavenderSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderSpeechHousePokefanFScript:
	jumptextfaceplayer LavenderSpeechHousePokefanFText

LavenderSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

LavenderSpeechHousePokefanFText:
	text "LAVENDER has"
	line "changed a lot"
	cont "in recent years."

	para "All the talk of"
	line "war will do that."

	para "Last time Hoenn"
	line "invaded they"
	cont "came here."

	para "All those poor"
	line "young soldiers."

	para "MR FUJI is a"
	line "pacifist but..."

	para "AGATHA wasn't"

	para "Her #mon"
	line "possessed the"
	cont "poor soldiers"
	cont "and in moments"
	cont "they had all"
	cont "killed each other."

	para "AGATHA passed not"
	line "long ago."

	para "She never got to"
	line "see the new"
	cont "RADIO TOWER."

	para "I'm glad of that."
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 3
	warp_event  3,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
