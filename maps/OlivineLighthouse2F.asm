	object_const_def
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHuey:
	trainer SAILOR, HUEY1, EVENT_BEAT_SAILOR_HUEY, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorHueyAfterBattleText
	waitbutton
	closetext
	end

SailorHueySeenText:
	text "I have a long"
	line "way to go."

	para "But I'll never"
	line "give up."

	para "This is the BATTLE"
	line "TOWER, right?"
	done
	done

SailorHueyBeatenText:
    text "My streak!"
    done

SailorHueyAfterBattleText:
	text "Wait, this isn't"
	line "the BATTLE TOWER!"
	para "I'm not going to"
	line "get a prize for"
	cont "all this crap!?"
	done

GentlemanAlfredSeenText:
	text "Dear child, you"
	line "can't possibly"
	cont "be naive enough"
	cont "to believe you"
	cont "can match my"
	cont "#mon."
	done

GentlemanAlfredBeatenText:
	text "You hooligan!"
	done

GentlemanAlfredAfterBattleText:
	text "I won't allow"
	line "you to climb"
	cont "the social"
	cont "ladder higher"
	cont "than me!"
	done

SailorHueyGiveProteinText:
	text "Here, don't"
	line "tell anyone you"
	cont "got this from"
	cont "me."
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
