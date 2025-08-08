	object_const_def
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaffronPokecenter1FTeacherScript:
	jumptextfaceplayer SaffronPokecenter1FTeacherText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherBeatWallaceText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "For a long time"
	line "SAFFRON tried to"
	cont "innovate by"
	cont "charging money"
	cont "in #CENTERS."

	para "Then the meddling"
	line "#mon LEAGUE"
	cont "said it was"
	cont "illegal."

	para "They know nothing"
	line "about business!"
	done

SaffronPokecenter1FFisherText:
	text "The whole of"
	line "KANTO is turned"
	cont "upside down by"
	cont "the threat of"
	cont "HOENN invasion."
	
	para "There must be"
	line "some way I can"
	cont "help."
	
	para "I could place a"
	line "SHORT position"
	cont "on HOENN dollars."
	
	para "That would devalue"
	line "their currency!"
	done

SaffronPokecenter1FFisherBeatWallaceText:
	text "HOENN are gone!"
	
	para "Aren't you..."
	
	para "CHAMPION <PLAYER>!"
	
	para "Thank you!"
	
	para "The HOENN dollar"
	line "has plummeted in"
	cont "value thanks to"
	cont "you."
	
	para "Time to buy the"
	line "dip."
	done

SaffronPokecenter1FYoungsterText:
	text "I'm only here to"
	line "make my fortune."

	para "Then I'm heading"
	line "somewhere cheaper"
	cont "to live."

	para "You can live dirt"
	line "cheap in PEWTER."

	para "Nobody wants to"
	line "live there after"
	cont "the #RUS"
	cont "outbreak."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SAFFRON_CITY, 1
	warp_event  4,  7, SAFFRON_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
