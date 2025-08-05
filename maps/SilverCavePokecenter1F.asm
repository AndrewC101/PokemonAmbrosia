	object_const_def
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY

SilverCavePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SilverCavePokecenter1FBobRossScript:
    loadmem wReachedHallOfOrigin, 1
	jumptextfaceplayer SilverCavePokecenter1FBobRossText

SilverCavePokecenter1FBobRossText:
	text "It's hard to see"
	line "things when you"
	cont "are too close."
	para "Take a step back"
	line "and look."
	para "This is a"
	line "beautiful"
	cont "mountain."
	para "I keep painting"
	line "it."
	para "A cloud here."
	para "A happy little"
	line "tree there."
	para "You can do"
	line "anything you want."
	para "This is your"
	line "world."
	para "There are no"
	line "mistakes."
	para "Just happy"
	line "accidents."
	done

SilverCavePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  4,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FBobRossScript, -1
