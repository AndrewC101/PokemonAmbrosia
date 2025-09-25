	object_const_def
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL1
	const MOUNTMORTAR1FOUTSIDE_POKE_BALL2
	const MOUNTMORTAR1FOUTSIDE_FIELDMON_1
    const MOUNTMORTAR1FOUTSIDE_FIELDMON_2
    const MOUNTMORTAR1FOUTSIDE_FIELDMON_3
    const MOUNTMORTAR1FOUTSIDE_FIELDMON_4

MountMortar1FOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MountMortar1FOutsideFieldMon

.MountMortar1FOutsideFieldMon:
; Pokemon which always appear
    appear MOUNTMORTAR1FOUTSIDE_FIELDMON_1
    appear MOUNTMORTAR1FOUTSIDE_FIELDMON_2
    appear MOUNTMORTAR1FOUTSIDE_FIELDMON_3
    appear MOUNTMORTAR1FOUTSIDE_FIELDMON_4
    endcallback

MountMortar1FOutsideFieldMon1Script:
	trainer CROBAT, FIELD_MON, EVENT_FIELD_MON_1, MountMortar1FOutsidePokemonAttacksText, 70, 0, .script
.script
    disappear MOUNTMORTAR1FOUTSIDE_FIELDMON_1
    end

MountMortar1FOutsidePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

MountMortar1FOutsideFieldMon2Script:
	faceplayer
	cry MAGMAR
	pause 15
	loadwildmon MAGMAR, 31
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear MOUNTMORTAR1FOUTSIDE_FIELDMON_2
	end

MountMortar1FOutsideFieldMon3Script:
	faceplayer
	cry ELECTABUZZ
	pause 15
	loadwildmon ELECTABUZZ, 31
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear MOUNTMORTAR1FOUTSIDE_FIELDMON_3
	end

MountMortar1FOutsideFieldMon4Script:
	faceplayer
	cry GOLBAT
	pause 15
	loadwildmon GOLBAT, 33
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear MOUNTMORTAR1FOUTSIDE_FIELDMON_4
	end

MountMortar1FOutsideEther:
	itemball FULL_RESTORE

MountMortar1FOutsideRevive:
	itemball MAX_REVIVE

MountMortar1FOutsideHiddenHyperPotion:
	hiddenitem RARE_CANDY, EVENT_MOUNT_MORTAR_1F_OUTSIDE_HIDDEN_HYPER_POTION

MountMortar1FOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 33, ROUTE_42, 3
	warp_event 17, 33, ROUTE_42, 4
	warp_event 37, 33, ROUTE_42, 5
	warp_event 17,  5, MOUNT_MORTAR_2F_INSIDE, 1
	warp_event 11, 21, MOUNT_MORTAR_1F_INSIDE, 1
	warp_event 29, 21, MOUNT_MORTAR_1F_INSIDE, 2
	warp_event 17, 29, MOUNT_MORTAR_B1F, 2
	warp_event  7, 13, MOUNT_MORTAR_1F_INSIDE, 3
	warp_event 33, 13, MOUNT_MORTAR_1F_INSIDE, 4

	def_coord_events

	def_bg_events
	bg_event 25, 22, BGEVENT_ITEM, MountMortar1FOutsideHiddenHyperPotion

	def_object_events
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideEther, EVENT_MOUNT_MORTAR_1F_OUTSIDE_ETHER
	object_event 31, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FOutsideRevive, EVENT_MOUNT_MORTAR_1F_OUTSIDE_REVIVE
	object_event 18,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortar1FOutsideFieldMon1Script, EVENT_FIELD_MON_1
	object_event 31, 28, SPRITE_MAGMAR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, MountMortar1FOutsideFieldMon2Script, EVENT_FIELD_MON_2
	object_event  7, 25, SPRITE_ELECTABUZZ, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, MountMortar1FOutsideFieldMon3Script, EVENT_FIELD_MON_3
	object_event 19, 29, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MountMortar1FOutsideFieldMon4Script, EVENT_FIELD_MON_4
