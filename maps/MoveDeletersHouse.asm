	object_const_def
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MoveDeleter:
	faceplayer
	opentext
	writetext RelearnerIntroText
	waitbutton
	yesorno
	iffalse .refused
	special MoveRelearner
	waitbutton
	closetext
	end
.refused
	writetext RelearnerRefusedText
	waitbutton
	closetext
	end

MoveRelearnerScript:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

RelearnerIntroText:
	text "Hello, I'm the"
	line "Move Relearner."
	cont "I remember it so"
	cont "you don't have"
	cont "to!"
	para "Would you like a"
	line "#MON to"
	cont "relearn a move?"
	done

RelearnerRefusedText:
	text "If you need your"
	line "memory jogged"
	cont "you remember where"
	cont "to come!"
	done

MoveDeletersHouseBookshelf:
	jumpstd DifficultBookshelfScript

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 6
	warp_event  3,  7, BLACKTHORN_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  5,  3, SPRITE_FISHER, 	SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveRelearnerScript, -1
