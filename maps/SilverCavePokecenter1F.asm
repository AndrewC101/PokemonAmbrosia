	object_const_def
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY

SilverCavePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SilverCavePokecenter1FBobRossScript:
	faceplayer
	opentext
	writetext SilverCavePokecenter1FBobRossText
	waitbutton
	writetext SilverCavePokecenter1FShinyOfferText
	nooryes
	iffalse .refused
	writetext SilverCavePokecenter1FShinyWhichMonText
	waitbutton
	special SilverCaveShinify
	reloadmap
	opentext
	ifequal 2, .egg
	iffalse .refused_after_choice
	writetext SilverCavePokecenter1FShinyDoneText
	waitbutton
	closetext
	end

.egg
	writetext SilverCavePokecenter1FShinyEggText
	waitbutton
	closetext
	end

.refused_after_choice
.refused
	writetext SilverCavePokecenter1FShinyRefusedText
	waitbutton
	closetext
	end

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

SilverCavePokecenter1FShinyOfferText:
	text "Sometimes the"
	line "light hits just"
	cont "right."
	para "Shall I make one"
	line "of your #mon"
	cont "shiny?"
	done

SilverCavePokecenter1FShinyWhichMonText:
	text "Which #mon"
	line "shall shine?"
	done

SilverCavePokecenter1FShinyDoneText:
	text "There."
	para "Your #mon now"
	line "catches the light"
	cont "just right."
	done

SilverCavePokecenter1FShinyEggText:
	text "An Egg is not"
	line "a good canvas."
	done

SilverCavePokecenter1FShinyRefusedText:
	text "The brush isn't"
	line "ready yet."
	para "Beat the devil"
	line "out of it."
	done

SCBlisseyScript:
    opentext
    writetext SCBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

SCBlisseyText:
    text "Blissey!"
    done

SCSmeargleScript:
    opentext
    writetext SCSmeargleText
    cry SMEARGLE
    waitbutton
    closetext
    end

SCSmeargleText:
    text "Smeargle!"
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
	object_event  1,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FBobRossScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SCBlisseyScript, -1
	object_event  2,  5, SPRITE_SMEARGLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SCSmeargleScript, -1
