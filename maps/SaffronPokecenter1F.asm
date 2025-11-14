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
    jumptextfaceplayer SaffronPokecenter1FFisherText

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "For a long time"
	line "Saffron tried to"
	cont "innovate by"
	cont "charging money"
	cont "in #centers."

	para "Then the meddling"
	line "#mon League"
	cont "said it was"
	cont "illegal."

	para "They know nothing"
	line "about business!"
	done

SaffronPokecenter1FFisherText:
	text "After Sabrina left"
	line "a new gym appeared"
	cont "and has been"
	cont "growing in"
	cont "popularity."
	para "They seem to"
	line "specialise in"
	cont "Normal types."
	para "I thought my"
	line "Machamp would make"
	cont "it easy, but they"
	cont "hit pretty hard..."
	done

SaffronPokecenter1FYoungsterText:
	text "I thought my"
	line "Houndoom would"
	cont "make easy work of"
	cont "the psychic gym."
	para "But turns out Aura"
	line "Sphere is a thing."
	para "Where do you even"
	line "get that TM?"
	done

SaffBlisseyScript:
    opentext
    writetext SaffBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

SaffBlisseyText:
    text "Blissey!"
    done

SaffHoundoomScript:
    opentext
    writetext SaffHoundoomText
    cry HOUNDOOM
    waitbutton
    closetext
    end

SaffHoundoomText:
    text "Houndoom!"
    done

SaffMachampScript:
    opentext
    writetext SaffMachampText
    cry MACHAMP
    waitbutton
    closetext
    end

SaffMachampText:
    text "Machamp!"
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
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffBlisseyScript, -1
	object_event  2,  4, SPRITE_HOUNDOOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffHoundoomScript, -1
	object_event  7,  6, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffMachampScript, -1
