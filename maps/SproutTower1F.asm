	object_const_def
	const SPROUTTOWER1F_SAGE1
	const SPROUTTOWER1F_SAGE2
	const SPROUTTOWER1F_GRANNY
	const SPROUTTOWER1F_TEACHER
	const SPROUTTOWER1F_SAGE3
	const SPROUTTOWER1F_POKE_BALL
	const SPROUTTOWER1F_SAGE4

SproutTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

SproutTower1FSage1Script:
	jumptextfaceplayer SproutTower1FSage1Text

SproutTower1FSage2Script:
	jumptextfaceplayer SproutTower1FSage2Text

SproutTower1FSage4Script:
	jumptextfaceplayer SproutTower1FSage4Text

SproutTower1FGrannyScript:
	jumptextfaceplayer SproutTower1FGrannyText

SproutTower1FTeacherScript:
	jumptextfaceplayer SproutTower1FTeacherText

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

SproutTower1FParlyzHeal:
	itemball FULL_HEAL

SproutTower1FStatue:
	jumptext SproutTower1FStatueText

SageChowSeenText:
	text "For a thousand"
	line "years this tower"
	cont "has stood against"
	cont "the darkness."
	done

SageChowBeatenText:
	text "I am extinguished."
	done

SageChowAfterBattleText:
	text "This tower will"
	line "be here long"
	cont "after you and I"
	cont "are no more."

	para "This brings me"
	line "peace."
	done

SproutTower1FSage1Text:
	text "Our master is a"
	line "lord of light."

	para "He has the power"
	line "to banish the"
	cont "dark."

	para "He will give you"
	line "this power if"
	cont "you defeat him."
	done

SproutTower1FSage2Text:
	text "Sprout Tower was"
	line "built long ago"

	para "Here we train"
	line "to fight the"
	cont "darkness."
	done

SproutTower1FSage4Text:
	text "We never knew"
	line "there was a lower"
	cont "level to this"
	cont "place."

	para "My brother went"
	line "down days ago."

	para "He has not"
	line "returned."

	para "Master LI has"
	line "forbidden entry."

	para "Only with FLASH"
	line "can one see"
	cont "down there."

	para "Oh my dear"
	line "brother."

	para "I am sorry."
	done

SproutTower1FGrannyText:
	text "A BELLSPROUT over"
	line "100 feet tall…"

	para "People say that it"
	line "became the center"
	cont "pillar here."
	done

SproutTower1FTeacherText:
	text "The pillar moves."

	para "They say it moves"
	line "with the shifting"
	cont "tides of good"
	cont "and evil."
	done

SproutTower1FStatueText:
	text "A #mon statue…"

	para "There is something"
	line "eerie about it."
	done

SproutTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, VIOLET_CITY, 7
	warp_event 10, 15, VIOLET_CITY, 7
	warp_event  6,  4, SPROUT_TOWER_2F, 1
	warp_event  2,  6, SPROUT_TOWER_2F, 2
	warp_event 17,  3, SPROUT_TOWER_2F, 3
    warp_event 13,  9, SPROUT_TOWER_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  7, 15, BGEVENT_READ, SproutTower1FStatue
	bg_event 12, 15, BGEVENT_READ, SproutTower1FStatue

	def_object_events
	object_event  7,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTower1FSage1Script, -1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTower1FSage2Script, -1
	object_event 11, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	object_event  9,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FTeacherScript, -1
	object_event  3,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageChow, -1
	object_event 16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower1FParlyzHeal, EVENT_SPROUT_TOWER_1F_PARLYZ_HEAL
	object_event 12,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SproutTower1FSage4Script, -1

