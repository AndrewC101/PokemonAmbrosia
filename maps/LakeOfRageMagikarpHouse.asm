	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
    opentext
    writetext MagikarpManText
    waitbutton
    closetext
    end

MagikarpManText:
    text "I've been fishing"
    line "here my entire"
    cont "life."

    para "To me the OLD"
    line "ROD is the only"
    cont "ROD."

    para "Nobody can catch"
    line "Magikarp like me!"

    para "Be warned though"
    line "a demon prowls"
    cont "these parts at"
    cont "night."

    para "It moves through"
    line "shadows and drags"
    cont "people into the"
    cont "lake."

    para "Be careful."
    done

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
