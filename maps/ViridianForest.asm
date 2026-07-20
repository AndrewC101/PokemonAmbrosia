object_const_def
	const VIRIDIANFOREST_BUG_CATCHER_DOUG
	const VIRIDIANFOREST_BUG_CATCHER_ROB
	const VIRIDIANFOREST_SHAYMIN
	const VIRIDIANFOREST_TM_GIGA_DRAIN
	const VIRIDIANFOREST_FIELDMON_1
	const VIRIDIANFOREST_FIELDMON_2
	const VIRIDIANFOREST_FIELDMON_3
	const VIRIDIANFOREST_FIELDMON_4
	const VIRIDIANFOREST_FIELDMON_5
	const VIRIDIANFOREST_FIELDMON_6
	const VIRIDIANFOREST_FIELDMON_7
	const VIRIDIANFOREST_FIELDMON_8

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .FieldMonCallback
	callback MAPCALLBACK_TILES, .BarrierCallback

.FieldMonCallback:
	appear VIRIDIANFOREST_FIELDMON_1
	appear VIRIDIANFOREST_FIELDMON_2
	appear VIRIDIANFOREST_FIELDMON_3
	appear VIRIDIANFOREST_FIELDMON_4
	appear VIRIDIANFOREST_FIELDMON_5
	appear VIRIDIANFOREST_FIELDMON_6
	appear VIRIDIANFOREST_FIELDMON_7
	appear VIRIDIANFOREST_FIELDMON_8
	endcallback

.BarrierCallback:
	checkevent EVENT_VIRIDIAN_FOREST_BARRIER_OPEN
	iffalse .barrier_done
	changeblock 16, 30, $0A
.barrier_done
	endcallback

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

ShayminScript:
	faceplayer
	cry SHAYMIN
	pause 15

	checkevent EVENT_BEAT_WALLACE
	iftrue .Level80
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Level70
	checkevent EVENT_BEAT_CLAIR
	iftrue .Level60
	checkevent EVENT_BEAT_PRYCE
	iftrue .Level50
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 40
	sjump .Begin

.Level50:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 50
	sjump .Begin

.Level60:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 60
	sjump .Begin

.Level70:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 70
	sjump .Begin

.Level80:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SHAYMIN, 80

.Begin:
	startbattle
	reloadmapafterbattle
	setval SHAYMIN
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_CAUGHT_SHAYMIN
	disappear VIRIDIANFOREST_SHAYMIN
	pause 15
	special FadeInFromBlack
	pause 30
	special HealParty
	refreshscreen
	end

ViridianForestCelebiBarrierScript:
	checkevent EVENT_VIRIDIAN_FOREST_BARRIER_OPEN
	iftrue .Done
	turnobject PLAYER, UP
	opentext
	writetext ViridianForestCelebiBarrierText
	waitbutton
	setval CELEBI
	special FindPartyMonThatSpecies
	iftrue .OpenBarrier
	closetext
	end

.OpenBarrier:
	writetext ViridianForestCelebiBarrierOpenText
	waitbutton
	closetext
	changeblock 16, 30, $0A
	setevent EVENT_VIRIDIAN_FOREST_BARRIER_OPEN
	reloadmap
	end

.Done:
	end

ViridianForestCelebiBarrierText:
	text "This place is"
	line "green with life."
	para "The trees let"
	line "nothing pass."
	para "Perhaps a #mon"
	line "that protects the"
	cont "forests may enter."
	done

ViridianForestCelebiBarrierOpenText:
	text "Celebi calls out"
	line "to the forest."
	done

ViridianForestTMGigaDrain:
	itemball TM_GIGA_DRAIN

ViridianForestFieldMon1Script:
	trainer SCOLIPEDE, FIELD_MON, EVENT_FIELD_MON_1, ViridianForestPokemonAttacksText, 53, 0, .script
.script
	disappear VIRIDIANFOREST_FIELDMON_1
	end

ViridianForestFieldMon2Script:
	trainer GALVANTULA, FIELD_MON, EVENT_FIELD_MON_2, ViridianForestPokemonAttacksText, 52, 0, .script
.script
	disappear VIRIDIANFOREST_FIELDMON_2
	end

ViridianForestFieldMon3Script:
	trainer SCYTHER, FIELD_MON, EVENT_FIELD_MON_3, ViridianForestPokemonAttacksText, 54, 0, .script
.script
	disappear VIRIDIANFOREST_FIELDMON_3
	end

ViridianForestFieldMon4Script:
	trainer YANMEGA, FIELD_MON, EVENT_FIELD_MON_4, ViridianForestPokemonAttacksText, 51, 0, .script
.script
	disappear VIRIDIANFOREST_FIELDMON_4
	end

ViridianForestFieldMon5Script:
	faceplayer
	cry PINSIR
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon PINSIR, 52
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear VIRIDIANFOREST_FIELDMON_5
	end

ViridianForestFieldMon6Script:
	faceplayer
	cry VOLCARONA
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon VOLCARONA, 62
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear VIRIDIANFOREST_FIELDMON_6
	end

ViridianForestFieldMon7Script:
	faceplayer
	cry STARAPTOR
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon STARAPTOR, 55
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear VIRIDIANFOREST_FIELDMON_7
	end

ViridianForestFieldMon8Script:
	faceplayer
	cry PIKACHU
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon PIKACHU, 30
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear VIRIDIANFOREST_FIELDMON_8
	end

ViridianForestPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

BugCatcherDougSeenText:
	text "My #mon rule"
	line "the colony."
	para "Rob shall never"
	line "dethrone me."
	para "Nor shall you!"
	done

BugCatcherDougBeatenText:
	text "Treason!"
	done

BugCatcherDougAfterBattleText:
	text "Robs #mon"
	line "shall make fine"
	cont "drones."
	done

BugCatcherRobSeenText:
	text "Doug thinks his"
	line "#mon are the"
	cont "rulers of the"
	cont "colony."
	para "I have no choice"
	line "but to destroy"
	cont "him!"
	done

BugCatcherRobBeatenText:
	text "I have lost my"
	line "sovereignty."
	done

BugCatcherRobAfterBattleText:
	text "This is just one"
	line "battle."
	para "Among Bugs the"
	line "wars never end."
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 47, ROUTE_2, 6
	warp_event 17, 47, ROUTE_2, 7
	warp_event  1,  0, ROUTE_2, 8
	warp_event  2,  0, ROUTE_2, 9

	def_coord_events
	coord_event 16, 32, SCENE_ALWAYS, ViridianForestCelebiBarrierScript
	coord_event 17, 32, SCENE_ALWAYS, ViridianForestCelebiBarrierScript

	def_bg_events

	def_object_events
	object_event  5, 22, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event 30, 33, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherRob, -1
	object_event 18, 28, SPRITE_SHAYMIN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ShayminScript, EVENT_CAUGHT_SHAYMIN
	object_event 13, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, ViridianForestTMGigaDrain, EVENT_VIRIDIAN_FOREST_TM_GIGA_DRAIN
	object_event 25,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ViridianForestFieldMon1Script, EVENT_FIELD_MON_1
	object_event 27, 42, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ViridianForestFieldMon2Script, EVENT_FIELD_MON_2
	object_event  7, 41, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ViridianForestFieldMon3Script, EVENT_FIELD_MON_3
	object_event  7, 19, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, ViridianForestFieldMon4Script, EVENT_FIELD_MON_4
	object_event 28, 18, SPRITE_PINSIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestFieldMon5Script, EVENT_FIELD_MON_5
	object_event 17, 32, SPRITE_VOLCARONA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestFieldMon6Script, EVENT_FIELD_MON_6
	object_event 15, 14, SPRITE_STARAPTOR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestFieldMon7Script, EVENT_FIELD_MON_7
	object_event  2,  5, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ViridianForestFieldMon8Script, EVENT_FIELD_MON_8
