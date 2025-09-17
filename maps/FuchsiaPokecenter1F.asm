	object_const_def
	const FUCHSIAPOKECENTER1F_NURSE
	const FUCHSIAPOKECENTER1F_COOLTRAINER_M
	const FUCHSIAPOKECENTER1F_COOLTRAINER_F
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

FuchsiaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

FuchsiaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

FuchsiaPokecenter1FCooltrainerMScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .saved
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer FuchsiaPokecenter1FCooltrainerMText_Invaded
.normal
	jumptextfaceplayer FuchsiaPokecenter1FCooltrainerMText
.saved
    jumptextfaceplayer FuchsiaPokecenter1FCooltrainerMText_Saved

FuchsiaPokecenter1FCooltrainerFScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .saved
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer FuchsiaPokecenter1FCooltrainerFText_Invaded
.normal
	jumptextfaceplayer FuchsiaPokecenter1FCooltrainerFText
.saved
    jumptextfaceplayer FuchsiaPokecenter1FCooltrainerFText_Saved

FuchsiaPokecenter1FJanineImpersonatorScript:
	faceplayer
	opentext
	writetext FuchsiaPokecenter1FJanineImpersonatorText1
	waitbutton
	closetext
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, FuchsiaPokecenter1FJanineImpersonatorSpinMovement
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_JANINE
	special LoadUsedSpritesGFX
	opentext
	writetext FuchsiaPokecenter1FJanineImpersonatorText2
	waitbutton
	closetext
	applymovement FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR, FuchsiaPokecenter1FJanineImpersonatorSpinMovement
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	special LoadUsedSpritesGFX
	end

FuchsiaPokecenter1FJanineImpersonatorSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

FuchsiaPokecenter1FCooltrainerMText:
	text "This city has a"
	line "long and violent"
	cont "history."

	para "Lots of feuding"
	line "ninja clans."
	done

FuchsiaPokecenter1FCooltrainerMText_Invaded:
	text "Oh my ARCEUS."

	para "This is it."

	para "I'm going to die!"
	done

FuchsiaPokecenter1FCooltrainerMText_Saved:
	text "You saved me!"

	para "I owe you a life"
	line "debt!"

	para "I will be your"
	line "servant anytime"
	cont "you need anything."
	done

FuchsiaPokecenter1FCooltrainerFText:
	text "Everyone at the"
	line "GYM is in some"
	cont "kind of disguise."

	para "It's annoying!"
	done

FuchsiaPokecenter1FCooltrainerFText_Invaded:
	text "I'm sending a"
	line "message to my"
	cont "Mum..."

	para "I love you..."

	para "I'm sorry..."

	para "Goodbye..."
	done

FuchsiaPokecenter1FCooltrainerFText_Saved:
	text "You, you saved us."

	para "Come here!"

	para "kiss..."

	para "Thank you."
	done

FuchsiaPokecenter1FJanineImpersonatorText1:
	text "I'm JANINE! Hocus-"
	line "pocus… Poof!"
	done

FuchsiaPokecenter1FJanineImpersonatorText2:
	text "See? I look just"
	line "like her now!"
	done

FucBlisseyScript:
    opentext
    writetext FucBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

FucBlisseyText:
    text "Blissey!"
    done

FuchsiaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, FUCHSIA_CITY, 5
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerFScript, -1
	object_event  7,  2, SPRITE_JANINE_IMPERSONATOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FJanineImpersonatorScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FucBlisseyScript, -1
