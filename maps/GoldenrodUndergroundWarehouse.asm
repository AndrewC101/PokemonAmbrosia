	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	setmapscene GOLDENROD_CITY, SCENE_CUSTOM_1
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_TAUNT

GoldenrodUndergroundWarehouseUltraBall:
	itemball FULL_RESTORE

GruntM24SeenText:
	text "I may be a ROCKET"
	line "but I have"
	cont "feelings."
	para "That old man keeps"
	line "verbally abusing"
	cont "me!"
	done

GruntM24BeatenText:
	text "Please make him"
	line "shut up."
	done

GruntM24AfterBattleText:
	text "Go ahead and save"
	line "him."
	para "Spare me from his"
	line "savage tongue."
	done

DirectorIntroText:
	text "LANCE, is that"
	line "you?"

	para "Oh sorry, I"
	line "thought you"
	cont "were somebody"
	cont "else."

	para "You saved me!"

	para "The ROCKETS may"
	line "have strong"
	cont "#mon."

	para "But they have weak"
	line "self esteem."

	para "Throw some insults"
	line "at them and watch"
	cont "them crumble."

	para "Take this key."
	done

DirectorCardKeyText:
	text "That will open"
	line "the security door"
	cont "on 3F."
	done

DirectorAfterText:
	text "You are our"
	line "only hope."

	para "If TEAM ROCKET"
	line "control the"
	cont "transmitter, they"
	cont "could do terrible"
	cont "things."

	para "They might even"
	line "be able to"
	cont "control"
	cont "#mon with"
	cont "the signal."
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	;object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	;object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
