    object_const_def
    const SPROUTTOWERB1F_SAGE
    const SPROUTTOWERB1F_FIELDMON_1
    const SPROUTTOWERB1F_FIELDMON_2

SproutTowerB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SproutTowerB1FFieldMon

.SproutTowerB1FFieldMon:
    appear SPROUTTOWERB1F_FIELDMON_1
    appear SPROUTTOWERB1F_FIELDMON_2
    endcallback

SproutTowerB1FFieldMon1Script:
	trainer LAMPENT, FIELD_MON, EVENT_FIELD_MON_1, SproutTowerB1FPokemonAttacksText, 32, 0, .script
.script
    disappear SPROUTTOWERB1F_FIELDMON_1
    end

SproutTowerB1FFieldMon2Script:
	trainer DOUBLADE, FIELD_MON, EVENT_FIELD_MON_2, SproutTowerB1FPokemonAttacksText, 33, 0, .script
.script
    disappear SPROUTTOWERB1F_FIELDMON_2
    end

SproutTowerB1FPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

SageScript:
    faceplayer
	opentext
	checkevent EVENT_GOT_SPELLTAG_FROM_SAGE
	iftrue .GotItem
	writetext GiveSpellTagText
	verbosegiveitem SPELL_TAG
	promptbutton
	setevent EVENT_GOT_SPELLTAG_FROM_SAGE
.GotItem:
	writetext SageWarningText
	waitbutton
	closetext
	end

GiveSpellTagText:
    text "My dear brother"
    line "will never"
    cont "understand."

    para "There is a great"
    line "darkness here."

    para "An ancient evil."

    para "It calls to me."

    para "I think you"
    line "understand."

    para "Take this."
    prompt

SageWarningText:
    text "SPELL TAG"
    line "strengthens"
    cont "ones connection"
    cont "to the other"
    cont "side."

    para "It makes GHOST"
    line "moves stronger."

    para "The darkness"
    line "ahead is too"
    cont "strong for me."

    para "Take care dear"
    line "child."
    done

SproutTowerB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event   9, 15, ANCIENT_RUIN_PRESENT, 2
	warp_event  10, 15, ANCIENT_RUIN_PRESENT, 2
	warp_event  13,  9, SPROUT_TOWER_1F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageScript, -1
	object_event 16, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, SproutTowerB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, SproutTowerB1FFieldMon2Script, EVENT_FIELD_MON_2
