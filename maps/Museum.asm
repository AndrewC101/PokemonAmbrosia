	object_const_def
	const MUSEUM_DEOXYS
	const MUSEUM_FIELDMON_1
    const MUSEUM_FIELDMON_2
    const MUSEUM_FIELDMON_3
    const MUSEUM_FIELDMON_4
    const MUSEUM_FIELDMON_5
    const MUSEUM_FIELDMON_6
    const MUSEUM_FIELDMON_7
    const MUSEUM_FIELDMON_8
    const MUSEUM_FIELDMON_9
    const MUSEUM_FIELDMON_10

Museum_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .MuseumFieldMon

.MuseumFieldMon:
; Pokemon which always appear
    appear MUSEUM_FIELDMON_1
    appear MUSEUM_FIELDMON_2
    appear MUSEUM_FIELDMON_3
    appear MUSEUM_FIELDMON_4
    appear MUSEUM_FIELDMON_5
    appear MUSEUM_FIELDMON_6
    appear MUSEUM_FIELDMON_7
    appear MUSEUM_FIELDMON_8
    appear MUSEUM_FIELDMON_9
    appear MUSEUM_FIELDMON_10
    endcallback
    
DeoxysScript:
	cry DEOXYS
	pause 15

	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DEOXYS, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DEOXYS, 70
.begin

	startbattle
	reloadmapafterbattle
    setval DEOXYS
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_DEOXYS
	disappear MUSEUM_DEOXYS
	end

DeoxysCry:
    text "Deoxys!"
    done
    
MuseumFieldMon1Script:
	trainer MR__MIME, FIELD_MON, EVENT_FIELD_MON_1, MuseumPokemonAttacksText, 73, 0, .script
.script
    disappear MUSEUM_FIELDMON_1
    end

MuseumFieldMon2Script:
	trainer LOPUNNY, FIELD_MON, EVENT_FIELD_MON_2, MuseumPokemonAttacksText, 72, 0, .script
.script
    disappear MUSEUM_FIELDMON_2
    end

MuseumFieldMon3Script:
	trainer KIRLIA, FIELD_MON, EVENT_FIELD_MON_3, MuseumPokemonAttacksText, 73, 0, .script
.script
    disappear MUSEUM_FIELDMON_3
    end

MuseumFieldMon4Script:
	trainer CLEFABLE, FIELD_MON, EVENT_FIELD_MON_4, MuseumPokemonAttacksText, 74, 0, .script
.script
    disappear MUSEUM_FIELDMON_4
    end

MuseumFieldMon5Script:
	trainer CLEFABLE, FIELD_MON, EVENT_FIELD_MON_5, MuseumPokemonAttacksText, 74, 0, .script
.script
    disappear MUSEUM_FIELDMON_5
    end

MuseumFieldMon6Script:
	trainer BRELOOM, FIELD_MON, EVENT_FIELD_MON_6, MuseumPokemonAttacksText, 77, 0, .script
.script
    disappear MUSEUM_FIELDMON_6
    end

MuseumFieldMon7Script:
	trainer DITTO, FIELD_MON, EVENT_FIELD_MON_7, MuseumPokemonAttacksText, 73, 0, .script
.script
    disappear MUSEUM_FIELDMON_7
    end

MuseumFieldMon8Script:
	trainer DITTO, FIELD_MON, EVENT_FIELD_MON_8, MuseumPokemonAttacksText, 73, 0, .script
.script
    disappear MUSEUM_FIELDMON_8
    end

MuseumFieldMon9Script:
	trainer REUNICLUS, FIELD_MON, EVENT_FIELD_MON_9, MuseumPokemonAttacksText, 76, 0, .script
.script
    disappear MUSEUM_FIELDMON_9
    end

MuseumFieldMon10Script:
	trainer REUNICLUS, FIELD_MON, EVENT_FIELD_MON_10, MuseumPokemonAttacksText, 76, 0, .script
.script
    disappear MUSEUM_FIELDMON_10
    end

MuseumPokemonAttacksText:
	text "Can't escape!"
	done

LuthorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUTHOR
	iftrue .FightDone
.fight
	writetext LuthorSeenText
	waitbutton
	closetext
	winlosstext LuthorBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SCIENTIST, LUTHOR
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LUTHOR
	setmapscene MUSEUM, SCENE_FINISHED
	special HealParty
	end
.FightDone:
	writetext LuthorAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextLuthor
	nooryes
	iftrue .fight
	writetext RematchRefuseTextLuthor
	waitbutton
	closetext
	end

LuthorSeenText:
	text "So you have come"
	line "to discover the"
	cont "folly of our"
	cont "research?"
	para "You will be"
	line "disappointed."
	para "The specimen"
	line "represents the"
	cont "apex of biological"
	cont "perfection."
	para "You would never"
	line "understand."
	para "None of them do!"
	done

LuthorBeatenText:
    text "I am imperfect."
    done

LuthorAfterBattleText:
	text "#rus is merely"
	line "natures way of"
	cont "culling the"
	cont "inferior genetics"
	cont "from her codebase."
	para "As you will soon"
	line "discover for"
	cont "yourself..."
	done

RematchTextLuthor:
    text "You want another"
    line "experiment?"
    done

RematchRefuseTextLuthor:
    text "Such a common"
    line "intellect."
    done

FightLuthorScript:
    checkevent EVENT_BEAT_LUTHOR
    iffalse .do
    end
.do
    turnobject PLAYER, UP
    sjump LuthorScript

Museum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 7, PEWTER_CITY, 6
	warp_event 11, 7, PEWTER_CITY, 6

	warp_event 0, 7, MUSEUM, 4
	warp_event 0, 19, MUSEUM, 3

	warp_event 16, 19, MUSEUM, 6
	warp_event 16, 7, MUSEUM, 5

	warp_event 18, 3, MUSEUM, 8
	warp_event 0, 27, MUSEUM, 7

	def_coord_events
	coord_event 15, 28, SCENE_ALWAYS, FightLuthorScript

	def_bg_events

	def_object_events
	object_event 19, 25, SPRITE_DEOXYS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DeoxysScript, EVENT_CAUGHT_DEOXYS
	object_event  7,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon1Script, EVENT_FIELD_MON_1
	object_event  2,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon2Script, EVENT_FIELD_MON_2
	object_event 16,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon3Script, EVENT_FIELD_MON_3
	object_event  4, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon4Script, EVENT_FIELD_MON_4
	object_event 10, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon5Script, EVENT_FIELD_MON_5
	object_event 17, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon6Script, EVENT_FIELD_MON_6
	object_event  7, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon7Script, EVENT_FIELD_MON_7
	object_event 12, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon8Script, EVENT_FIELD_MON_8
	object_event 16, 29, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon9Script, EVENT_FIELD_MON_9
	object_event 16, 27, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 4, 4, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MuseumFieldMon10Script, EVENT_FIELD_MON_10
	object_event 15, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_SCRIPT, 2, LuthorScript, -1
