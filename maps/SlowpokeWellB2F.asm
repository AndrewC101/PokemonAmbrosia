	object_const_def
	const SLOWPOKEWELLB2F_GYM_GUIDE
	const SLOWPOKEWELLB2F_POKE_BALL
	const SLOWPOKEWELLB2F_POKE_BALL_2
	const SLOWPOKEWELLB2F_FIELDMON_1
	const SLOWPOKEWELLB2F_FIELDMON_2
	const SLOWPOKEWELLB2F_FIELDMON_3
	const SLOWPOKEWELLB2F_FIELDMON_4
    const SLOWPOKEWELLB2F_FIELDMON_5

SlowpokeWellB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SlowpokeWellB2FFieldMon
	
.SlowpokeWellB2FFieldMon:
    appear SLOWPOKEWELLB2F_FIELDMON_1
    appear SLOWPOKEWELLB2F_FIELDMON_2
    appear SLOWPOKEWELLB2F_FIELDMON_3
    appear SLOWPOKEWELLB2F_FIELDMON_4
    appear SLOWPOKEWELLB2F_FIELDMON_5
    endcallback

SlowpokeWellB2FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_WISE_GLASSES_IN_SLOWPOKE_WELL
	iftrue .GotLeftovers
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem WISE_GLASSES
	iffalse .NoRoom
	setevent EVENT_GOT_WISE_GLASSES_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotLeftovers:
	writetext SlowpokeWellB2FGymGuideText_GotLeftovers
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

SlowpokeWellB2FKingsRock:
	itemball KINGS_ROCK

SlowpokeWellB2FGymGuideText:
	text "I'm observing"
	line "the complex social"
	cont "structure of the"
	cont "SLOWPOKE."

	para "...."

	para "Ok, I'm not a"
	line "scientist, but"
	cont "these glasses"
	cont "make me look"
	cont "smart, don't they?"

	para "Here, you can have"
	line "a pair."
	done

SlowpokeWellB2FGymGuideText_GotLeftovers:
	text "Once I understand"
	line "their ways, I will"
	cont "live with them"
	cont "and write a book"
	cont "about it."
	done
	
SlowpokeWellB2FFieldMon1Script:
	faceplayer
	cry SLOWKING
	pause 15
	loadwildmon SLOWKING, 80
    loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SLOWPOKEWELLB2F_FIELDMON_1
	end

SlowpokeWellB2FFieldMon2Script:
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SLOWPOKEWELLB2F_FIELDMON_2
	end
	
SlowpokeWellB2FFieldMon3Script:
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear SLOWPOKEWELLB2F_FIELDMON_3
	end
	
SlowpokeWellB2FFieldMon4Script:
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear SLOWPOKEWELLB2F_FIELDMON_4
	end
	
SlowpokeWellB2FFieldMon5Script:
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SLOWPOKEWELLB2F_FIELDMON_5
	end

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FKingsRock, EVENT_SLOWPOKE_WELL_B2F_KINGS_ROCK
	
	object_event 5, 2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FFieldMon1Script, EVENT_FIELD_MON_1
	object_event 4, 4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 4, 6, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FFieldMon3Script, EVENT_FIELD_MON_3
	object_event 7, 4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FFieldMon4Script, EVENT_FIELD_MON_4
	object_event 7, 6, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FFieldMon5Script, EVENT_FIELD_MON_5

