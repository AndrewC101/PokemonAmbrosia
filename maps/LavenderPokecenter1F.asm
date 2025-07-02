	object_const_def
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BeatWallace
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.BeatWallace:
	writetext LavenderPokecenter1FYoungsterText_BeatWallace
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "The RADIO TOWER"
	line "is doing very"
	cont "well."

	para "All you have to"
	line "do is tell"
	cont "people it will"
	cont "help in the war"
	cont "and everyone is"
	cont "on board!"

	para "Bereaved people"
	line "are the easiest"
	cont "to sell to."
	done

LavenderPokecenter1FTeacherText:
	text "There is a"
	line "radio channel that"
	cont "plays the"
	cont "#FLUTE."

	para "It can be used"
	line "to awaken a"
	cont "sleeping #MON."

	para "If only it worked"
	line "on my teen son!"
	done

LavenderPokecenter1FYoungsterText:
	text "We are all"
	line "going to die!"

	para "WALLACE will"
	line "invade and kill"
	cont "us all."

	para "I'm here to"
	line "pick out a good"
	cont "spot to spend"
	cont "eternity."
	done

LavenderPokecenter1FYoungsterText_BeatWallace:
	text "We are all saved!"

	para "Wait!"

	para "You are"
	line "CHAMPION <PLAYER>!"

	para "You are my hero!"

	para "But we are all"
	line "still slowly"
	cont "dying."

	para "That fact is"
	line "never far from"
	cont "my mind."
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
