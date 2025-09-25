	object_const_def
	const MOUNTMOON_FIELDMON_1
    const MOUNTMOON_FIELDMON_2

MountMoon_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .MountMoonFieldMon

.MountMoonFieldMon:
; Pokemon which always appear
    appear MOUNTMOON_FIELDMON_1
    appear MOUNTMOON_FIELDMON_2
    endcallback

MountMoonFieldMon3Script:
	faceplayer
	cry MAWILE
	pause 15
	loadwildmon MAWILE, 41
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear MOUNTMOON_FIELDMON_1
	end

MountMoonFieldMon4Script:
	cry CLEFABLE
	pause 15
	loadwildmon CLEFABLE, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear MOUNTMOON_FIELDMON_2
	end

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  3, SPRITE_MAWILE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMoonFieldMon3Script, EVENT_FIELD_MON_1
	object_event 13, 11, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MountMoonFieldMon4Script, EVENT_FIELD_MON_2
