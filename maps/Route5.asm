	object_const_def
	const ROUTE5_POKEFAN_M
	;const ROUTE5_FIELDMON_1
    ;const ROUTE5_FIELDMON_2

Route5_MapScripts:
	def_scene_scripts

	def_callbacks
	;callback MAPCALLBACK_OBJECTS, .Route5FieldMon

;.Route5FieldMon:
; Pokemon which always appear
    ;appear ROUTE5_FIELDMON_1
    ;appear ROUTE5_FIELDMON_2
    ;endcallback

;Route5FieldMon1Script:
;	faceplayer
;	cry CLEFABLE
;	pause 15
;	loadwildmon CLEFABLE, 38
;	startbattle
;	reloadmapafterbattle
;	setevent EVENT_FIELD_MON_1
;	disappear ROUTE5_FIELDMON_1
;	end

;Route5FieldMon2Script:
;	faceplayer
;	cry LOPUNNY
;	pause 15
;	loadwildmon LOPUNNY, 37
;	startbattle
;	reloadmapafterbattle
;	setevent EVENT_FIELD_MON_2
;	disappear ROUTE5_FIELDMON_2
;	end

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5PokefanMText:
	text "The road is closed"
	line "until for now."

	para "People have been"
	line "dropping all their"
	cont "litter down there."
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
	text "Welcome to Nurse"
	line "Joys training"
	cont "academy."
	para "You'll hit the"
	line "level cap quickly"
	cont "or your money"
	cont "back."
	done

TrainerJoyScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_NURSE_JOY
	iftrue .FightDone
.fight
	writetext NurseJoySeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_NURSE_JOY
	iftrue .skipRequest
	opentext
	writetext NurseJoyOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.skipRequest
    winlosstext NurseJoyBeatenText, NurseJoyWinsText
    checkevent EVENT_BEAT_WALLACE
    iftrue .joy4
    checkevent EVENT_BEAT_CLAIR
    iftrue .joy3
    checkevent EVENT_BEAT_MORTY
    iftrue .joy2

	loadtrainer WHITNEY, JOY1
	sjump .begin
.joy2
    loadtrainer WHITNEY, JOY2
    sjump .begin
.joy3
    loadtrainer WHITNEY, JOY3
    sjump .begin
.joy4
    loadtrainer WHITNEY, JOY4
    ; fallthrough
.begin
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_NURSE_JOY
	opentext
	writetext NurseJoyAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext NurseJoyAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextNurseJoy
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextNurseJoy
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext NurseJoyWinAfterBattleText
    waitbutton
    closetext
    end
NurseJoySeenText:
	text "So many trainers"
	line "are so poor at"
	cont "training their"
	cont "#mon."
	para "I have made it my"
	line "mission to help"
	cont "them."
	para "Through suffering,"
	line "through pain, we"
	cont "can all grow"
	cont "stronger."
    done
NurseJoyOfferFightText:
	text "Would you like to"
	line "suffer from your"
	cont "#mon?"
	done
NurseJoyBeatenText:
	text "Well done."
	para "Now do it again!"
	done
NurseJoyWinsText:
	text "On your feet"
	line "soldier."
	para "On your feet!"
	done
NurseJoyAfterBattleText:
	text "Don't get"
	line "complacent now."
	para "You must keep"
	line "training!"
	done
RematchTextNurseJoy:
	text "You are going to"
	line "keep training."
	para "Aren't you"
	line "trainer!?"
	done
RematchRefuseTextNurseJoy:
	text "Don't be afraid"
	line "losing."
	para "Losing makes you"
	line "stronger than"
	cont "winning."
	done
NurseJoyWinAfterBattleText:
	text "Don't worry."
	para "I'll heal your"
	line "weak #mon and"
	cont "you can try again."
	done

Route5BlisseyScript:
    opentext
    writetext Route5BlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

Route5BlisseyText:
    text "Blissey!"
    done

Route5TrainerScript1:
    jumptextfaceplayer Route5Trainer1Text

Route5TrainerScript2:
    jumptextfaceplayer Route5Trainer2Text

Route5Trainer1Text:
	text "I can't go on"
	line "anymore."
	para "I think I'm going"
	line "to be sick."
	para "Six Blisseys..."
	para "Too much HP..."
	para "There must be"
	line "rules against"
	cont "that kind of"
	cont "thing."
	done

Route5Trainer2Text:
	text "I've been training"
	line "for hours!"
	para "She just keeps"
	line "healing my"
	cont "#mon, then"
	cont "beating them."
	para "She says this"
	line "makes us stronger."
	para "I'm not even sure"
	line "she's a real"
	cont "nurse."
	done

Route5LuckyEggScript:
	itemball LUCKY_EGG

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 17, ROUTE_5_SAFFRON_GATE, 1
	warp_event  9, 17, ROUTE_5_SAFFRON_GATE, 2
	warp_event 10, 11, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, Route5UndergroundPathSign
	bg_event 10, 14, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	;object_event  2, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, Route5FieldMon1Script, EVENT_FIELD_MON_1
	;object_event 18,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route5FieldMon2Script, EVENT_FIELD_MON_2
	object_event  9,  9, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerJoyScript, -1
	object_event  8,  8, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event  9,  8, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event 10,  8, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event  8,  7, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event  9,  7, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event 10,  7, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5BlisseyScript, -1
	object_event  7, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5TrainerScript1, -1
	object_event 12, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5TrainerScript2, -1
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route5LuckyEggScript, EVENT_PICKED_UP_ROUTE5_LUCKY_EGG

