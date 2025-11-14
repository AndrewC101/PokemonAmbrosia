	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s HEAD"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted beyond"
	cont "this point."

	para "We have stepped"
	line "up security since"
	cont "the Rocket attack"
	cont "five years ago."

	para "But since you"
	line "are so polite"
	cont "here is a free"
	cont "sample."
	done

SilphCoOfficerText_GotUpGrade:
	text "EXPERT BELT"
	line "increases the"
	cont "damage of super"
	cont "effective moves."
	para "It's only for pro"
	line "trainers who know"
	cont "all the type match"
	cont "ups."
	para "I have no use for"
	line "it then."
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
