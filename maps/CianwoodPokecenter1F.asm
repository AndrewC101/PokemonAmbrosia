	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "I'm so sick of"
	line "all the muscle"
	cont "heads here."

	para "They are all"
	line "big kids talking"
	cont "about their"
	cont "cartoons..."

	para "sorry, anime..."

	para "I want a real"
	line "man."

	para "Like those Dragon"
	line "trainers in"
	cont "Blackthorn City."
	done

CianwoodGymGuideText:
	text "Hey!"

	para "I was too scared"
	line "to go into the"
	cont "Gym with all"
	cont "those intense"
	cont "muscled nerds."

	para "They use"
	line "Fighting"
	cont "#mon."

	para "You will want"
	line "to use Flying,"
	cont "Psychic or Fairy"
	cont "#mon against"
	cont "them."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! You"
	line "knocked those"
	cont "big guys right"
	cont "on their backs."

	para "I wish I was"
	line "as strong as"
	cont "you are!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "Fighting #mon"
	line "are treated like"
	cont "movie stars here."
	para "Especially that"
	line "Machamp over"
	cont "there."
	para "I don't even think"
	line "it has a trainer."
	done

CianBlisseyScript:
    opentext
    writetext CianBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

CianBlisseyText:
    text "Blissey!"
    done

CianMachampScript:
    opentext
    writetext CianMachampText
    cry MACHAMP
    waitbutton
    closetext
    end

CianMachampText:
    text "Machamp!"
    done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianBlisseyScript, -1
	object_event  1,  3, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianMachampScript, -1
