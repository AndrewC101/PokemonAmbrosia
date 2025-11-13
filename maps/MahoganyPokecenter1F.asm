	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "I thought the Ice"
	line "Gym Leader would"
	cont "be a cool woman"
	cont "like Lorelei."
	para "I came all the way"
	line "here from Kanto."
	para "I was..."
	para "wrong."
	done

MahoganyPokecenter1FYoungsterText:
	text "You need to be"
	line "careful around the"
	cont "Lake of Rage."
	para "People can go"
	line "missing."
	para "My friend went"
	line "there with his"
	cont "Ditto one day and"
	cont "never came back."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "I'm going hiking"
	line "in Ice Path."
	para "My Chandelure"
	line "should be able to"
	cont "melt any Ice"
	cont "#mon that"
	cont "might attack me."
	done

MahBlisseyScript:
    opentext
    writetext MahBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

MahBlisseyText:
    text "Blissey!"
    done

MahChandelureScript:
    opentext
    writetext MahChandelureText
    cry CHANDELURE
    waitbutton
    closetext
    end

MahChandelureText:
    text "Chandelure!"
    done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahBlisseyScript, -1
	object_event  2,  4, SPRITE_CHANDELURE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahChandelureScript, -1
