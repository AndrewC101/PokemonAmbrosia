	object_const_def
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY
	const SILVERCAVEPOKECENTER1F_BLISSEY
	const SILVERCAVEPOKECENTER1F_SMEARGLE
	const SILVERCAVEPOKECENTER1F_BEAUTY

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
	ifequal 3, .dulled
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

.dulled
	writetext SilverCavePokecenter1FShinyUndoneText
	waitbutton
	closetext
	end

.refused_after_choice
.refused
	writetext SilverCavePokecenter1FShinyRefusedText
	waitbutton
	closetext
	end

SilverCavePokecenter1FGenderToggleScript:
	faceplayer
	opentext
	writetext SilverCavePokecenter1FGenderToggleOfferText
	nooryes
	iffalse .refused
	writetext SilverCavePokecenter1FGenderToggleWhichMonText
	waitbutton
	callasm SilverCaveTogglePokemonGender
	reloadmap
	opentext
	iffalse .done
	ifequal 2, .egg
	ifequal 3, .fixed_gender
	writetext SilverCavePokecenter1FGenderToggleDoneText
	waitbutton
	sjump .done

.egg
	writetext SilverCavePokecenter1FGenderToggleEggText
	waitbutton
	sjump .done

.fixed_gender
	writetext SilverCavePokecenter1FGenderToggleFixedGenderText
	waitbutton
	sjump .done

.refused
	writetext SilverCavePokecenter1FGenderToggleRefusedText
	waitbutton
.done
	closetext
	end

SilverCavePokecenter1FBobRossText:
	text "I keep painting"
	line "this mountain."
	para "A tree here."
	para "A happy little"
	line "cloud there."
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
	text "Shall I paint one"
	line "of your #mon?"
	done

SilverCavePokecenter1FShinyWhichMonText:
	text "Which #mon"
	line "shall I paint?"
	done

SilverCavePokecenter1FShinyDoneText:
	text "There."
	para "Your #mon now"
	line "catches the light"
	cont "just right."
	done

SilverCavePokecenter1FShinyUndoneText:
	text "There."
	para "A softer touch"
	line "suits this one"
	cont "better."
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

SilverCavePokecenter1FGenderToggleOfferText:
	text "How do you do?"
	para "I have discovered"
	line "the secret."
	para "That elusive"
	line "ingredient that..."
	para "spark that is the"
	line "breath of life..."
	para "Yes, I have that"
	line "knowledge!"
	para "Shall I share this"
	line "secret with your"
	cont "#mon?"
	done

SilverCavePokecenter1FGenderToggleWhichMonText:
	text "I see you shiver"
	line "with antici..."
	cont "..."
	cont "..."
	cont "...pation."
	done

SilverCavePokecenter1FGenderToggleDoneText:
	text "Don't dream it."
	para "Be it!"
	done

SilverCavePokecenter1FGenderToggleEggText:
	text "What am I to do"
	line "with that?"
	para "Have it for"
	line "breakfast!"
	done

SilverCavePokecenter1FGenderToggleFixedGenderText:
	text "Such a perfect"
	line "specimen."
	done

SilverCavePokecenter1FGenderToggleRefusedText:
	text "I didn't make this"
	line "for you!"
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
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGenderToggleScript, -1
