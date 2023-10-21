	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FPokefanMText:
	text "The KIMONO girls"
	line "are as skilled"
	cont "with #MON as"
	cont "they are at"
	cont "dancing."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "BATTLE FRONTIER"
	line "is just past"
	cont "OLIVINE."

	para "It has all sorts"
	line "of challenges for"
	cont "trainers."

	para "You could spend"
	line "hours there."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTY the GYM"
	line "LEADER spent"
	cont "weeks in the"
	cont "haunted forest"
	cont "as a child."

	para "He has a strong"
	line "connection to"
	cont "GHOST #MON."
	done

EcruteakPokecenter1FGymGuideText:
	text "Far to the"
	line "NORTH EAST is"
	cont "LAKE OF RAGE."

	para "Years ago a lot"
	line "of people went"
	cont "missing there."

	para "They say it was"
	line "a serial killer"
	cont "the MAHOGANY"
	cont "murderer."

	para "He was never"
	line "caught."

	para "And now the"
	line "#MON there"
	cont "have all gone"
	cont "mad with anger."

	para "It's a cursed"
	line "place."
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1