	object_const_def
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

ViridianPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .BlueReturned
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianPokecenter1FCooltrainerMText_BlueReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerFScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerFText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FCooltrainerMText:
	text "We are all doing"
	line "our best to get"
	cont "ready for war."

	para "Blue tells us"
	line "we will survive."

	para "But I'm scared."
	done

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "You are Champion"
	line "<PLAYER>!"

	para "Blue told us all"
	line "about you."

	para "Your battle"
	line "with Wallace is"
	cont "LEGENDARY!"

	para "Thank you so"
	line "much for saving"
	cont "everybody."
	done

ViridianPokecenter1FCooltrainerFText:
	text "It's not even a"
	line "conspiracy."

	para "It is the obvious"
	line "truth!"

	para "Cinnabar was"
	line "destroyed by a"
	cont "new Hoenn weapon."
	done

ViridianPokecenter1FBugCatcherText:
	text "Cinnabar was"
	line "not destroyed by"
	cont "a Hoenn weapon."

	para "They want us to"
	line "think that to"
	cont "make us angry."

	para "It was the"
	line "#mon League"
	cont "themselves that"
	cont "destroyed it!"

	para "That's the real"
	line "truth!"
	done

BlisseyScript:
    opentext
    writetext BlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

BlisseyText:
    text "Blissey!"
    done

VRaticateScript:
    opentext
    writetext VRaticateText
    cry RATICATE
    waitbutton
    closetext
    end

VRaticateText:
    text "Raticate!"
    done

VStaraptorScript:
    opentext
    writetext VStaraptorText
    cry STARAPTOR
    waitbutton
    closetext
    end

VStaraptorText:
    text "Staraptor!"
    done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, -1
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlisseyScript, -1
	object_event  1,  5, SPRITE_RATICATE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VRaticateScript, -1
	object_event  6,  5, SPRITE_STARAPTOR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VStaraptorScript, -1
