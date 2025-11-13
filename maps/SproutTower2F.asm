	object_const_def
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL
	const SPROUTTOWER2F_FIELDMON_1
    const SPROUTTOWER2F_FIELDMON_2

SproutTower2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SproutTower2FFieldMon

.SproutTower2FFieldMon:
    appear SPROUTTOWER2F_FIELDMON_1
    appear SPROUTTOWER2F_FIELDMON_2
    endcallback

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end

SproutTower2FStatue:
	jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball CARBOS

SageNicoSeenText:
	text "You seek the"
	line "power of light!"

	para "I have trained"
	line "for decades."

	para "Countless hard"
	line "winters and"
	cont "dark days."

	para "To master this"
	line "power."

	para "Behold!"
	done

SageNicoBeatenText:
	text "Years..."

	para "So many years..."
	done

SageNicoAfterBattleText:
	text "You are in the"
	line "spring of your"
	cont "years."

	para "Don't waste the"
	line "time you have."
	done

SageEdmondSeenText:
	text "The darkness is"
	line "not something to"
	cont "be understood."

	para "It must be stamped"
	line "out."
	done

SageEdmondBeatenText:
	text "My light is"
	line "not strong"
	cont "enough."
	done

SageEdmondAfterBattleText:
	text "A former brother"
	line "of ours."

	para "Xehanort."

	para "He did not see"
	line "things as we do."
	done

SproutTower2FStatueText:
	text "A #mon statue…"

	para "There is something"
	line "eerie about it."
	done

SproutTower2FFieldMon1Script:
	faceplayer
	cry RATTATA
	pause 15
	loadwildmon RATTATA, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SPROUTTOWER2F_FIELDMON_1
	end

SproutTower2FFieldMon2Script:
	faceplayer
	cry GASTLY
	pause 15
	loadwildmon GASTLY, 8
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SPROUTTOWER2F_FIELDMON_2
	end

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  4, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 15, BGEVENT_READ, SproutTower2FStatue

	def_object_events
	object_event 12,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNico, -1
	object_event  9, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageEdmond, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER_2F_X_ACCURACY
	object_event 16,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, SproutTower2FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  2, 15, SPRITE_GASTLY, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, SproutTower2FFieldMon2Script, EVENT_FIELD_MON_2
