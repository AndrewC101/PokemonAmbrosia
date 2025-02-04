	object_const_def
	const MOUNTMORTAR2FINSIDE_POKE_BALL1
	const MOUNTMORTAR2FINSIDE_POKE_BALL2
	const MOUNTMORTAR2FINSIDE_POKE_BALL3
	const MOUNTMORTAR2FINSIDE_POKE_BALL4
	const MOUNTMORTAR2FINSIDE_POKE_BALL5
	const MOUNTMORTAR2FINSIDE_POKE_BALL6
	const MOUNTMORTAR2FINSIDE_SUPER_NERD
	const MOUNTMORTAR2FINSIDE_FIELDMON_1
    const MOUNTMORTAR2FINSIDE_FIELDMON_2
    const MOUNTMORTAR2FINSIDE_FIELDMON_3
    const MOUNTMORTAR2FINSIDE_FIELDMON_4
    const MOUNTMORTAR2FINSIDE_FIELDMON_5
    const MOUNTMORTAR2FINSIDE_FIELDMON_6

MountMortar2FInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MountMortar2FInsideFieldMon

.MountMortar2FInsideFieldMon:
; Pokemon which always appear
    appear MOUNTMORTAR2FINSIDE_FIELDMON_1
    appear MOUNTMORTAR2FINSIDE_FIELDMON_2
    appear MOUNTMORTAR2FINSIDE_FIELDMON_3
    appear MOUNTMORTAR2FINSIDE_FIELDMON_4
    appear MOUNTMORTAR2FINSIDE_FIELDMON_5
    appear MOUNTMORTAR2FINSIDE_FIELDMON_6
    endcallback

MountMortar2FInsideFieldMon1Script:
	trainer ELECTIVIRE, FIELD_MON, EVENT_FIELD_MON_1, MountMortar2FInsidePokemonAttacksText, 71, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_1
    end

MountMortar2FInsideFieldMon2Script:
	trainer MAGMORTAR, FIELD_MON, EVENT_FIELD_MON_2, MountMortar2FInsidePokemonAttacksText, 71, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_2
    end

MountMortar2FInsideFieldMon3Script:
	trainer GOLEM, FIELD_MON, EVENT_FIELD_MON_3, MountMortar2FInsidePokemonAttacksText, 70, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_3
    end

MountMortar2FInsideFieldMon4Script:
	trainer CONKELDURR, FIELD_MON, EVENT_FIELD_MON_4, MountMortar2FInsidePokemonAttacksText, 72, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_4
    end

MountMortar2FInsideFieldMon5Script:
	trainer MACHAMP, FIELD_MON, EVENT_FIELD_MON_5, MountMortar2FInsidePokemonAttacksText, 72, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_5
    end

MountMortar2FInsideFieldMon6Script:
	trainer STEELIX, FIELD_MON, EVENT_FIELD_MON_6, MountMortar2FInsidePokemonAttacksText, 70, 0, .script
.script
    disappear MOUNTMORTAR2FINSIDE_FIELDMON_6
    end

MountMortar2FInsidePokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

TrainerSupernerdHugh:
	trainer SUPER_NERD, HUGH, EVENT_BEAT_SUPER_NERD_HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdHughAfterBattleText
	waitbutton
	closetext
	end

MountMortar2FInsideMaxPotion:
	itemball POKE_DOLL

MountMortar2FInsideRareCandy:
	itemball RARE_CANDY

MountMortar2FInsideTMDefenseCurl:
	itemball TM_ROAR

MountMortar2FInsideDragonScale:
	itemball DRAGON_SCALE

MountMortar2FInsideElixer:
	itemball MAX_ELIXER

MountMortar2FInsideEscapeRope:
	itemball HP_UP

MountMortar2FInsideHiddenFullRestore:
	hiddenitem SACRED_ASH, EVENT_MOUNT_MORTAR_2F_INSIDE_HIDDEN_FULL_RESTORE

SupernerdHughSeenText:
	text "MARKUS!"

	para "My partner pushed"
	line "me over the"
	cont "waterfall."

	para "My #MON"
	line "saved me."

	para "He tried to"
	line "kill me!"

	para "Did he send"
	line "you to finish"
	cont "the job!?"
	done

SupernerdHughBeatenText:
	text "I need to"
	line "calm down."
	done

SupernerdHughAfterBattleText:
	text "I'm going to"
	line "get out of here"
	cont "and I'm going"
	cont "to find MARKUS."

	para "Then my #MON"
	line "and I are going"
	cont "to take him for"
	cont "a little"
	cont "swimming lesson."
	done

MountMortar2FInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 33, MOUNT_MORTAR_1F_OUTSIDE, 4
	warp_event  3,  5, MOUNT_MORTAR_1F_INSIDE, 6

	def_coord_events

	def_bg_events
	bg_event 24,  8, BGEVENT_ITEM, MountMortar2FInsideHiddenFullRestore

	def_object_events
	object_event 28, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideMaxPotion, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	object_event  2, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideRareCandy, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	object_event 19, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideDragonScale, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	object_event  9, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideElixer, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideEscapeRope, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	object_event 13, 26, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
	object_event  5,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon1Script, EVENT_FIELD_MON_1
	object_event 34,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon2Script, EVENT_FIELD_MON_2
	object_event 22, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon3Script, EVENT_FIELD_MON_3
	object_event 14, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon4Script, EVENT_FIELD_MON_4
	object_event 33, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon5Script, EVENT_FIELD_MON_5
	object_event 19, 30, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar2FInsideFieldMon6Script, EVENT_FIELD_MON_6
