	object_const_def
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_FISHER
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER

CherrygrovePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CherrygrovePokecenter1FFisherScript:
	jumptextfaceplayer CherrygrovePokecenter1FFisherText

CherrygrovePokecenter1FGentlemanScript:
	jumptextfaceplayer CherrygrovePokecenter1FGentlemanText

CherrygrovePokecenter1FTeacherScript:
    jumptextfaceplayer CherrygrovePokecenter1FTeacherText

CherrygrovePokecenter1FFisherText:
	text "I went to"
	line "Goldenrod and"
	cont "spent 6 months of"
	cont "savings on an"
	cont "Eviolite."
	para "Now my Mudkip will"
	line "always be"
	cont "adorable."
	para "Not to mention"
	line "bulky."
	done

CherrygrovePokecenter1FGentlemanText:
	text "I caught you"
	line "admiring this"
	cont "prime level 20"
	cont "RATICATE."
	para "Rockets will pay"
	line "a pretty penny for"
	cont "it I have no"
	cont "doubt."
	done

CherrygrovePokecenter1FTeacherText:
	text "The communication"
	line "Center upstairs"
	cont "was just built."

	para "But good luck"
	line "finding someone to"
	cont "play with."
	done

ChBlisseyScript:
    opentext
    writetext ChBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

ChBlisseyText:
    text "Blissey!"
    done

ChMudkipScript:
    opentext
    writetext ChMudkipText
    cry MUDKIP
    waitbutton
    closetext
    end

ChMudkipText:
    text "Mudkip!"
    done

ChRaticateScript:
    opentext
    writetext ChRaticateText
    cry RATICATE
    waitbutton
    closetext
    end

ChRaticateText:
    text "Rat!"
    line "Raticate!"
    done

CherrygrovePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CHERRYGROVE_CITY, 2
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FFisherScript, -1
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTeacherScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChBlisseyScript, -1
	object_event  1, 3, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ChMudkipScript, -1
	object_event  6, 5, SPRITE_RATICATE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChRaticateScript, -1


