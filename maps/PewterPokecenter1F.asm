	object_const_def
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_TEACHER
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_CHRIS

PewterPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

PewterPokecenter1FTeacherScript:
	jumptextfaceplayer PewterPokecenter1FTeacherText

PewterMawile:
	opentext
	writetext PewterMawileText
	cry CLEFAIRY
	waitbutton
	closetext
	end

PewterPokecenter1FBugCatcherScript:
	jumptextfaceplayer PewterPokecenter1FBugCatcherText

Chris:
    jumptextfaceplayer PewterPokecenter1FChrisText

PewterPokecenter1FChrisText:
    text "Cough..."
    line "Cough cough!"
    cont "...."
    para "Get..."
    para "COUGH!..."
    para "Away from me!"
    para ".... Uhhhhh.."
    done

PewterPokecenter1FTeacherText:
	text "I often wonder"
	line "what exactly it"
	cont "was those careless"
	cont "scientists brought"
	cont "back in those"
	cont "space rocks."

	para "The MUSEUM is"
	line "sealed off so"
	cont "we will never"
	cont "know."
	done

PewterMawileText:
	text "CLEFAIRY: Puu"
	line "pupuu."
	done

PewterPokecenter1FBugCatcherText:
	text "The remains of"
	line "VIRIDIAN FOREST"
	cont "are south of here."

	para "It used to be"
	line "a huge lush"
	cont "forest."

	para "Then the outbreak"
	line "ravaged it."

	para "But the bugs that"
	line "still live there"
	cont "are real fighters!"
	done


PewterPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, PEWTER_CITY, 4
	warp_event  4,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FNurseScript, -1
	object_event  8,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FTeacherScript, -1
	object_event  1,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMawile, -1
	object_event  2,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FBugCatcherScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Chris, -1
