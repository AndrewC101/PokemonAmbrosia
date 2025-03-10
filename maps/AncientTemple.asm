	object_const_def

AncientTemple_MapScripts:
	def_scene_scripts

	def_callbacks

AncientTempleLeftovers:
    itemball LEFTOVERS

AncientTempleLifeOrb:
    itemball LIFE_ORB

AncientTempleAmbrosia:
    itemball AMBROSIA

AncientTempleSacredAsh:
    itemball SACRED_ASH

HoohLugiaBlockScript:
    setval HO_OH
	special MonCheck
    iffalse .block
    setval LUGIA
	special MonCheck
    iffalse .block
    setmapscene ANCIENT_TEMPLE, SCENE_CUSTOM_1
    end
.block
	opentext
	writetext HoohLugiaBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientTempleTurnBack
    end

HoohLugiaBlockText:
    text "Only those who"
    line "have mastered"
    cont "the powers of"
    cont "fire and wind…"

    para "HO-OH and"
    line "LUGIA"

    para "May pass."
    done

GroudonKyogreBlockScript:
    setval GROUDON
	special MonCheck
    iffalse .block
    setval KYOGRE
	special MonCheck
    iffalse .block
    setmapscene ANCIENT_TEMPLE, SCENE_CUSTOM_2
    end
.block
	opentext
	writetext GroudonKyogreBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientTempleTurnBack
    end

GroudonKyogreBlockText:
    text "Only those who"
    line "have mastered"
    cont "the powers of"
    cont "earth and water…"

    para "GROUDON and"
    line "KYOGRE"

    para "May pass."
    done

PalkiaDialgaBlockScript:
    setval PALKIA
	special MonCheck
    iffalse .block
    setval DIALGA
	special MonCheck
    iffalse .block
    setmapscene ANCIENT_TEMPLE, SCENE_CUSTOM_3
    end
.block
	opentext
	writetext PalkiaDialgaBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientTempleTurnBack
    end

PalkiaDialgaBlockText:
    text "Only those who"
    line "have mastered"
    cont "the powers of"
    cont "space and time…"

    para "PALKIA and"
    line "DIALGA"

    para "May pass."
    done

RayquazaGiratinaBlockScript:
    setval RAYQUAZA
	special MonCheck
    iffalse .block
    setval GIRATINA
	special MonCheck
    iffalse .block
    setmapscene ANCIENT_TEMPLE, SCENE_CUSTOM_4
    end
.block
	opentext
	writetext RayquazaGiratinaBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientTempleTurnBack
    end

RayquazaGiratinaBlockText:
    text "Only those who"
    line "have mastered"
    cont "the powers of"
    cont "good and evil…"

    para "RAYQUAZA and"
    line "GIRATINA"

    para "May pass."
    done

XerneasYveltalBlockScript:
    setval YVELTAL
	special MonCheck
    iffalse .block
    setval XERNEAS
	special MonCheck
    iffalse .block
    setmapscene ANCIENT_TEMPLE, SCENE_FINISHED
    end
.block
	opentext
	writetext XerneasYveltalBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientTempleTurnBack
    end

XerneasYveltalBlockText:
    text "Only those who"
    line "have mastered"
    cont "the powers of"
    cont "life and death…"

    para "XERNEAS and"
    line "YVELTAL"

    para "May pass."
    done

Movement_AncientTempleTurnBack:
	step DOWN
	step_end

AncientTemple_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, SILVER_CAVE_OUTSIDE, 5
	warp_event  5,  3, ANCIENT_TEMPLE, 3
	warp_event 13, 29, ANCIENT_TEMPLE, 2
	warp_event 13, 3, ANCIENT_TEMPLE, 5
	warp_event 34,  3, ANCIENT_TEMPLE, 4
	warp_event 25,  1, ANCIENT_HALL, 1
	warp_event 26,  1, ANCIENT_HALL, 2
	warp_event 21, 21, ICE_PATH_B3F, 3

	def_coord_events
	coord_event  7, 26, SCENE_DEFAULT, HoohLugiaBlockScript
	coord_event  8, 26, SCENE_DEFAULT, HoohLugiaBlockScript
	coord_event 11, 12, SCENE_CUSTOM_1, GroudonKyogreBlockScript
	coord_event 12, 12, SCENE_CUSTOM_1, GroudonKyogreBlockScript
	coord_event 25, 24, SCENE_CUSTOM_2, PalkiaDialgaBlockScript
	coord_event 26, 24, SCENE_CUSTOM_2, PalkiaDialgaBlockScript
	coord_event 25, 16, SCENE_CUSTOM_3, RayquazaGiratinaBlockScript
	coord_event 26, 16, SCENE_CUSTOM_3, RayquazaGiratinaBlockScript
	coord_event 26,  2, SCENE_CUSTOM_4, XerneasYveltalBlockScript
	coord_event 25,  2, SCENE_CUSTOM_4, XerneasYveltalBlockScript

	def_bg_events

	def_object_events
	object_event 28, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AncientTempleLeftovers, EVENT_ANCIENT_TEMPLE_LEFTOVERS
	object_event 23, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AncientTempleLifeOrb, EVENT_ANCIENT_TEMPLE_LIFE_ORB
	object_event 20,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AncientTempleAmbrosia, EVENT_ANCIENT_TEMPLE_AMBROSIA
	object_event 22, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AncientTempleSacredAsh, EVENT_ANCIENT_TEMPLE_SACRED_ASH
