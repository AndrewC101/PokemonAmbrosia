	object_const_def
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

VioletNicknameSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VioletNicknameSpeechHouseTeacherScript:
	jumptextfaceplayer VioletNicknameSpeechHouseTeacherText

VioletNicknameSpeechHouseLassScript:
	jumptextfaceplayer VioletNicknameSpeechHouseLassText

VioletNicknameSpeechHouseBirdScript:
	faceplayer
	opentext
	writetext VioletNicknameSpeechHouseBirdText
	cry STARLY
	waitbutton
	closetext
	end

VioletNicknameSpeechHouseTeacherText:
	text "Some #mon have"
	line "a different"
	cont "colour than they"
	cont "normally would."

	para "These are shiny"
	line "#mon."

	para "Sometimes they"
	line "appear in the"
	cont "field with a"
	cont "gold colour."

	para "But they don't"
	line "always appear."

	para "You can see this"
	line "alternate colour"
	cont "in your #dex"
	cont "by pressing"
	cont "Select."
	done
	done

VioletNicknameSpeechHouseLassText:
	text "My Starly is"
	line "special."
	done

VioletNicknameSpeechHouseBirdText:
	text "Pijji!"

	para "It has some"
	line "gold feathers."
	done

VioletNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
