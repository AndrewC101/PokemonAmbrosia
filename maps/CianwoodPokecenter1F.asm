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
	text "I so sick of"
	line "all the muscle"
	cont "heads here."

	para "They are all"
	line "big kids talking"
	cont "about their"
	cont "cartoons..."

	para "sorry, anime..."

	para "I want a real"
	line "man."

	para "Like those DRAGON"
	line "trainers in"
	cont "BLACKTHORN CITY."
	done

CianwoodGymGuideText:
	text "Hey!"

	para "I was too scared"
	line "to go into the"
	cont "GYM with all"
	cont "those intense"
	cont "muscled nerds."

	para "They use"
	line "FIGHTING"
	cont "#MON."

	para "You will want"
	line "to use FLYING,"
	cont "PSYCHIC or FAIRY"
	cont "#MON against"
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
	text "I mean I like"
	line "anime as much"
	cont "as the next guy."

	para "But I'm more"
	line "into STAR TREK."

	para "It doesn't have"
	line "super action."

	para "But it has super"
	line "ideas."

	para "SPOCK vs KIRK"
	line "was epic though!"
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
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
