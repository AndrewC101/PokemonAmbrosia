	object_const_def
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

VermilionPokecenter1FFishingGuruScript:
    jumptextfaceplayer VermilionPokecenter1FFishingGuruText

VermilionPokecenter1FSailorScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionPokecenter1FSailorText
.normal
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionPokecenter1FBugCatcherText
.normal
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

VermilionPokecenter1FFishingGuruText:
	text "There is a cave"
	line "near here called"
	cont "DIGLETT'S CAVE."

	para "DIGLETT is an"
	line "extinct species"
	cont "of #mon."

	para "They were meant"
	line "to be quite weak."
	done

VermilionPokecenter1FSailorText:
	text "I were born in"
	line "this here city."

	para "Anyone who"
	line "attacks will"
	cont "to answer to me"
	cont "POLIWHIRL."

	para "I can't imagine"
	line "him ever losing"
	cont "to anybody."
	done

InvadedVermilionPokecenter1FSailorText:
	text "Damn those HOENN"
	line "soldiers!"

	para "They got such"
	line "strong WATER"
	cont "#mon!"

	para "Me POLIWHIRL"
	line "didn't last"
	cont "one turn!"
	done

VermilionPokecenter1FBugCatcherText:
	text "I was going to"
	line "visit VIRIDIAN"
	cont "through DIGLETT'S"
	cont "CAVE."

	para "I got past the"
	line "fat #mon"
	cont "but there was"
	cont "another #mon"
	cont "blocking in"
	cont "the cave itself!"
	done

InvadedVermilionPokecenter1FBugCatcherText:
	text "Aren't you the"
	line "CHAMPION of JOHTO!"

	para "Please can you"
	line "help us!"
	done

VerBlisseyScript:
    opentext
    writetext VerBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

VerBlisseyText:
    text "Blissey!"
    done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FFishingGuruScript, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VerBlisseyScript, -1
