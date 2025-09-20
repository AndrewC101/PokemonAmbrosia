	object_const_def
	const TOHJOFALLS_POKE_BALL
	const TOHJOFALLS_FIELDMON_1
    const TOHJOFALLS_FIELDMON_2

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .TohjoFallsFieldMon
	
.TohjoFallsFieldMon:
; Pokemon which always appear
    appear TOHJOFALLS_FIELDMON_1
    appear TOHJOFALLS_FIELDMON_2
    endcallback
    
TohjoFallsFieldMon1Script:
	faceplayer
	cry POLIWRATH
	pause 15
	loadwildmon POLIWRATH, 47
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear TOHJOFALLS_FIELDMON_1
	end

TohjoFallsFieldMon2Script:
	trainer NIDOKING, FIELD_MON, EVENT_FIELD_MON_2, TohjoFallsPokemonAttacksText, 50, 0, .script
.script
    disappear TOHJOFALLS_FIELDMON_2
    end

TohjoFallsPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

TohjoFallsPoisonBarb:
	itemball POISON_BARB

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsPoisonBarb, EVENT_TOHJO_FALLS_POISON_BARB
	object_event 11, 15, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, TohjoFallsFieldMon1Script, EVENT_FIELD_MON_1
	object_event 27, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, TohjoFallsFieldMon2Script, EVENT_FIELD_MON_2
	