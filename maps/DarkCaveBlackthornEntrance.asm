	object_const_def
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2
	const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    const DARKCAVEBLACKTHORNENTRANCE_XEHANORT

DarkCaveBlackthornEntrance_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .AreaFieldMon

.AreaFieldMon:
; Pokemon which always appear
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    endcallback


DarkCaveBlackthornEntranceTMCurse:
	itemball TM_CURSE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_DARK_PULSE

DarkCaveBlackthornEntranceFieldMon1Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_1, DarkCaveBlackthornEntrancePokemonAttacksText, 64, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    end

DarkCaveBlackthornEntranceFieldMon2Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_2, DarkCaveBlackthornEntrancePokemonAttacksText, 62, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    end

DarkCaveBlackthornEntranceFieldMon3Script:
	trainer DUNSPARCE, FIELD_MON, EVENT_FIELD_MON_3, DarkCaveBlackthornEntrancePokemonAttacksText, 64, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    end

DarkCaveBlackthornEntrancePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

DarkCaveXehanortScript:
	trainer SAGE, XEHANORT, EVENT_BEAT_XEHANORT, DarkCaveXehanortSeenText, DarkCaveXehanortBeatenText, DarkCaveXehanortWinsText, .Script

.Script:
	endifjustbattled
	opentext
	writetext DarkCaveXehanortAfterBattleText
	waitbutton
	closetext
	end

DarkCaveXehanortSeenText:
    text "These worlds have"
    line "been connected."

    para "Tied to the"
    line "darkness."

    para "Soon to be"
    line "completely"
    cont "eclipsed."

	para "There exists a"
	line "object that can"
	cont "grant immortality."

	para "The Mark Of God."

	para "This golden item"
	line "is connected to it"
	cont "in some way."

	para "It fills me with"
	line "power!"
	done
DarkCaveXehanortBeatenText:
    text "Only now have I"
    line "truly won."
    done
DarkCaveXehanortWinsText:
    text "Open your heart."
    done
DarkCaveXehanortAfterBattleText:
	text "There must be a"
	line "balance."
	para "Neither a tyranny"
	line "of light or dark."
	para "To ensure this"
	line "balance lasts"
	cont "forever, I must"
	cont "live forever."
	para "Through the Mark"
	line "of God I shall"
	cont "achieve this."
	done
RematchTextDarkCaveXehanort:
    text "Do you have more"
    line "to learn?"
    done
RematchRefuseTextDarkCaveXehanort:
    text "Open your heart."
    done

GiratinaBarrierScript:
    callasm IsDarkraiInParty
    iftrue .unblock
    opentext
    writetext BeGoneText
    waitbutton
    closetext
    warp DARK_CAVE_VIOLET_ENTRANCE, 17, 2
    opentext
    writetext DarkraiNeededText
    waitbutton
    closetext
    sjump .end
.unblock
    opentext
    writetext DarkraiUnblocksText
    waitbutton
    closetext
.end
    end

IsDarkraiInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp DARKRAI
	jr z, .found
	dec b
	jr z, .notFound
	jr .loop
.notFound
    xor a
    ld [wScriptVar], a
    ret
.found
    ld a, 1
    ld [wScriptVar], a
    ret

BeGoneText:
    text "A powerful"
    line "darkness overcomes"
    cont "and expels you."
    done

DarkraiNeededText:
    text "It will take a"
    line "Dark #mon"
    cont "that can cross"
    cont "the dream world"
    cont "to allow passage."
    done

DarkraiUnblocksText:
    text "The path is"
    line "revealed!"
    done

DarkCaveBlackthornEntranceAmbrosia:
    itemball AMBROSIA

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 41,  3, ROUTE_45, 1
	warp_event 21, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events
	coord_event 15, 13, SCENE_ALWAYS, GiratinaBarrierScript

	def_bg_events

	def_object_events
	object_event 25,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMCurse, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event 39, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
	object_event 23, 11, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, DarkCaveBlackthornEntranceFieldMon1Script, EVENT_FIELD_MON_1
	object_event 21, 19, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveBlackthornEntranceFieldMon2Script, EVENT_FIELD_MON_2
	object_event 40,  5, SPRITE_DUNSPARCE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, DarkCaveBlackthornEntranceFieldMon3Script, EVENT_FIELD_MON_3
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, DarkCaveXehanortScript, -1
	object_event  7,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceAmbrosia, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_AMBROSIA
