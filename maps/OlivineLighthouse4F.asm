	object_const_def
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "I have been"
	line "training here"
	cont "for days."

	para "I believe in"
	line "my partner."

	para "We will become"
	line "the strongest."
	done

SailorKentBeatenText:
	text "You did well"
	line "SWAMPERT."
	done

SailorKentAfterBattleText:
	text "An AMPHAROS"
	line "produces the"
	cont "light for the"
	cont "lighthouse."

	para "It hasn't been"
	line "so bright"
	cont "recently."
	done

LassConnie1SeenText:
	text "JASMINE has spent"
	line "days here looking"
	cont "after a sick"
	cont "AMPHAROS."

	para "I'm worried"
	line "about her."

	para "I'm going to"
	line "put her to sleep"
	cont "and take her out"
	cont "of here."
	done

LassConnie1BeatenText:
	text "You ruined my"
	line "plan!"
	done

LassConnie1AfterBattleText:
	text "If I can't beat"
	line "you then I had"
	cont "no chance of"
	cont "beating JASMINE."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
