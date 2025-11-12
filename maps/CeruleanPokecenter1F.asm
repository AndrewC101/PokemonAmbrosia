	object_const_def
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUIDE

CeruleanPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeruleanPokecenter1FSuperNerdScript:
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText

CeruleanPokecenter1FGymGuideScript:
	jumptextfaceplayer CeruleanPokecenter1FGymGuideText

CeruleanPokecenter1FSuperNerdText:
	text "There are a lot"
	line "of trainers to"
	cont "the NORTH."

	para "I wanted to visit"
	line "BILLS Dad but I"
	cont "can't get past"
	cont "them all!"
	done

CeruleanPokecenter1FGymGuideText:
	text "Cerulean Cave is"
	line "said to contain"
	cont "really strong"
	cont "#mon."

	para "Apparently lots"
	line "of trainers have"
	cont "gone in there"
	cont "and lost their"
	cont "items while"
	cont "running for"
	cont "their lives."

	para "But my SWAMPERT"
	line "knows Amnesia and"
	cont "Curse, it's"
	cont "unbeatable!"
	done

CerBlisseyScript:
    opentext
    writetext CerBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

CerBlisseyText:
    text "Blissey!"
    done

CerSwampertScript:
    opentext
    writetext CerSwampertText
    cry SWAMPERT
    waitbutton
    closetext
    end

CerSwampertText:
    text "Swampert!"
    done

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CERULEAN_CITY, 4
	warp_event  4,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FGymGuideScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CerBlisseyScript, -1
	object_event  2,  4, SPRITE_SWAMPERT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CerSwampertScript, -1
