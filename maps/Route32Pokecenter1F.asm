	object_const_def
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route32Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "This is a great"
	line "fishing spot."

	para "You saw people"
	line "fishing? How"
	cont "about you?"

	para "My ROD may be"
	line "old but it works"
	cont "perfectly well!"

	para "Do you like my"
	line "ROD?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "You have made"
	line "this old man's"
	cont "day!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Here you go!"

	para "You can catch"
	line "all sorts of"
	cont "great MAGIKARP"
	cont "with this!"
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Hey kid, you just"
	line "don't know a"
	cont "quality instrument"
	cont "when you see one."
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Are you getting"
	line "enjoyment from"
	cont "my OLD ROD?"

	para "You can catch"
	line "all sorts of"
	cont "great MAGIKARP"
	cont "with it!"
	done

Route32Pokecenter1FCooltrainerFText:
	text "I went too deep"
	line "into UNION CAVE."

	para "I needed a"
	line "#mon that"
	cont "can SURF."

	para "I'm sure there's"
	line "some secret path"
	cont "hidden deep in"
	cont "there."
	done

R32BlisseyScript:
    opentext
    writetext R32BlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

R32BlisseyText:
    text "Blissey!"
    done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, R32BlisseyScript, -1
