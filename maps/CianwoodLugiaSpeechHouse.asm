	object_const_def
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CianwoodLugiaSpeechHouseTeacherText:
	text "We are safe"
	line "from the war here."

	para "Hoenn battle ships"
	line "will never make it"
	cont "past the rough"
	cont "waters of the"
	cont "Whirl Islands."
	done

CianwoodLugiaSpeechHouseLassText:
	text "I think the"
	line "whirlpools around"
	cont "the islands are"
	cont "caused by an"
	cont "ancient #mon"
	cont "within the cave."

	para "I went looking"
	line "for it with a"
	cont "group of explorers"
	cont "once."

	para "We didn't find"
	line "anything and we"
	cont "nearly didn't"
	cont "make it back out."

	para "I think a"
	line "special item is"
	cont "needed to see"
	cont "the #mon."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "A new sailor"
	line "started hanging"
	cont "around here."

	para "He seems a bit"
	line "odd."

	para "I think he is"
	line "hiding something."

	para "My friend Amber"
	line "thinks so too."

	para "She lives with"
	line "the #SEER."

	para "She is psychic!"
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
