	object_const_def
	const ROUTE22_MOLTRES
	const ROUTE22_FIELDMON_1
    const ROUTE22_FIELDMON_2
    const ROUTE22_FIELDMON_3
    const ROUTE22_FIELDMON_4

Route22_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route22FieldMon

.Route22FieldMon:
; Pokemon which always appear
    random 4
    ifequal 1, .spawn
    disappear ROUTE22_FIELDMON_1
    sjump .mon2
.spawn
    appear ROUTE22_FIELDMON_1
.mon2
    appear ROUTE22_FIELDMON_4
    appear ROUTE22_FIELDMON_2
    appear ROUTE22_FIELDMON_3
    endcallback

Route22FieldMon1Script:
	trainer RATICATE, FIELD_MON, EVENT_FIELD_MON_1, Route22PokemonAttacksText, 80, 0, .script
.script
    disappear ROUTE22_FIELDMON_1
    end

Route22PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route22FieldMon2Script:
	faceplayer
	cry NIDORAN_F
	pause 15
	loadwildmon NIDORAN_F, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE22_FIELDMON_2
	end

Route22FieldMon3Script:
	faceplayer
	cry NIDORAN_M
	pause 15
	loadwildmon NIDORAN_M, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE22_FIELDMON_3
	end

Route22FieldMon4Script:
	faceplayer
	cry BAGON
	pause 15
	loadwildmon BAGON, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE22_FIELDMON_4
	end

MoltresScript:
	cry MOLTRES
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 60
    sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MOLTRES, 50
.begin
	startbattle
	reloadmapafterbattle
    setval MOLTRES
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_MOLTRES
	disappear ROUTE22_MOLTRES
	end

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#mon League"

	para "Victory Road"
	line "ENTRANCE"
	done

Route22HoenInvadedBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    ;checkevent EVENT_HOEN_INVASION_UNDERWAY
    ;iftrue .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext Route22BlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_Route22TurnBack
    end

Route22BlockText:
    text "The door is locked"
    done

Movement_Route22TurnBack:
	step DOWN
	step_end

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events
	;coord_event  13, 6, SCENE_ALWAYS, Route22HoenInvadedBlockScript

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event  7,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_SCRIPT, 0, MoltresScript, EVENT_CAUGHT_MOLTRES
	object_event 19,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route22FieldMon1Script, EVENT_FIELD_MON_1
	object_event 30,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route22FieldMon2Script, EVENT_FIELD_MON_2
	object_event 33, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22FieldMon3Script, EVENT_FIELD_MON_3
	object_event 30,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route22FieldMon4Script, EVENT_FIELD_MON_4
