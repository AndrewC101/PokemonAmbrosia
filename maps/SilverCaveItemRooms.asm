	object_const_def
	const SILVERCAVEITEMROOMS_PALKIA
	const SILVERCAVEITEMROOMS_DIALGA
    const SILVERCAVEITEMROOMS_FIELDMON_1
    const SILVERCAVEITEMROOMS_FIELDMON_2
    const SILVERCAVEITEMROOMS_FIELDMON_3
    const SILVERCAVEITEMROOMS_FIELDMON_4
    const SILVERCAVEITEMROOMS_FIELDMON_5
    const SILVERCAVEITEMROOMS_FIELDMON_6
    const SILVERCAVEITEMROOMS_FIELDMON_7
    const SILVERCAVEITEMROOMS_FIELDMON_8
    const SILVERCAVEITEMROOMS_FIELDMON_9
    const SILVERCAVEITEMROOMS_FIELDMON_10

SilverCaveItemRooms_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Barriers
    callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
	appear SILVERCAVEITEMROOMS_FIELDMON_1
	appear SILVERCAVEITEMROOMS_FIELDMON_2
	appear SILVERCAVEITEMROOMS_FIELDMON_3
	appear SILVERCAVEITEMROOMS_FIELDMON_4
	appear SILVERCAVEITEMROOMS_FIELDMON_5
	appear SILVERCAVEITEMROOMS_FIELDMON_6
	appear SILVERCAVEITEMROOMS_FIELDMON_7
	appear SILVERCAVEITEMROOMS_FIELDMON_8
	appear SILVERCAVEITEMROOMS_FIELDMON_9
	appear SILVERCAVEITEMROOMS_FIELDMON_10
	endcallback

.Barriers:
    checkevent EVENT_DIALGA_BARRIER_CLEARED
    iftrue .checkPalkia
    changeblock 28, 4, $31 ; closed wall
    changeblock 30, 4, $31 ; closed wall
.checkPalkia
    checkevent EVENT_PALKIA_BARRIER_CLEARED
    iftrue .end
    changeblock 16, 4, $56 ; closed wall
    changeblock 18, 4, $56 ; closed wall
.end
    endcallback

SilverCaveItemRoomFieldMon1Script:
	faceplayer
	cry LUCARIO
	pause 15
	loadwildmon LUCARIO, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SILVERCAVEITEMROOMS_FIELDMON_1
	end

SilverCaveItemRoomFieldMon2Script:
	faceplayer
	cry ALAKAZAM
	pause 15
	loadwildmon ALAKAZAM, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SILVERCAVEITEMROOMS_FIELDMON_2
	end

SilverCaveItemRoomFieldMon3Script:
	faceplayer
	cry MAGNEZONE
	pause 15
	loadwildmon MAGNEZONE, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear SILVERCAVEITEMROOMS_FIELDMON_3
	end

SilverCaveItemRoomFieldMon4Script:
	faceplayer
	cry MISMAGIUS
	pause 15
	loadwildmon MISMAGIUS, 71
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear SILVERCAVEITEMROOMS_FIELDMON_4
	end

SilverCaveItemRoomFieldMon5Script:
	faceplayer
	cry HONCHKROW
	pause 15
	loadwildmon HONCHKROW, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SILVERCAVEITEMROOMS_FIELDMON_5
	end

SilverCaveItemRoomFieldMon6Script:
	faceplayer
	cry RHYPERIOR
	pause 15
	loadwildmon RHYPERIOR, 74
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear SILVERCAVEITEMROOMS_FIELDMON_6
	end

SilverCaveItemRoomFieldMon7Script:
	faceplayer
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear SILVERCAVEITEMROOMS_FIELDMON_7
	end

SilverCaveItemRoomFieldMon8Script:
	faceplayer
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 72
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear SILVERCAVEITEMROOMS_FIELDMON_8
	end

SilverCaveItemRoomFieldMon9Script:
	faceplayer
	cry DRACOVISH
	pause 15
	loadwildmon DRACOVISH, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear SILVERCAVEITEMROOMS_FIELDMON_9
	end

SilverCaveItemRoomFieldMon10Script:
	faceplayer
	cry ARCTOZOLT
	pause 15
	loadwildmon ARCTOZOLT, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear SILVERCAVEITEMROOMS_FIELDMON_10
	end

PalkiaScript:
	cry PALKIA
	pause 15

	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon PALKIA, 80
	startbattle
	reloadmapafterbattle
    setval PALKIA
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_PALKIA
	disappear SILVERCAVEITEMROOMS_PALKIA
	end

PalkiaCry:
    text "Palkia!"
    done

DialgaScript:
	cry DIALGA
	pause 15

	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DIALGA, 80
	startbattle
	reloadmapafterbattle
    setval DIALGA
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_DIALGA
	disappear SILVERCAVEITEMROOMS_DIALGA
	end

DialgaCry:
    text "Dialga!"
    done

DialgaBarrierScript:
    checkevent EVENT_DIALGA_BARRIER_CLEARED
    iftrue .end
    callasm IsRegigigasInParty
    iftrue .unblock
    opentext
    writetext RegigigasNeededText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SCIR_Down
    sjump .end
.unblock
    opentext
    writetext RegigigasUnblocksText
    waitbutton
    closetext
    playsound SFX_STRENGTH
    changeblock 28, 4, $29
    changeblock 30, 4, $2B
    setevent EVENT_DIALGA_BARRIER_CLEARED
    reloadmap
    checkevent EVENT_PALKIA_BARRIER_CLEARED
    iffalse .end
    setmapscene SILVER_CAVE_ITEM_ROOMS, SCENE_FINISHED
.end
    end

PalkiaBarrierScript:
    checkevent EVENT_PALKIA_BARRIER_CLEARED
    iftrue .end
    callasm IsDeoxysInParty
    iftrue .unblock
    opentext
    writetext DeoxysNeededText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SCIR_Down
    sjump .end
.unblock
    opentext
    writetext DeoxysUnblocksText
    waitbutton
    closetext
    playsound SFX_STRENGTH
    changeblock 16, 4, $29
    changeblock 18, 4, $2B
    setevent EVENT_PALKIA_BARRIER_CLEARED
    reloadmap
    checkevent EVENT_DIALGA_BARRIER_CLEARED
    iffalse .end
    setmapscene SILVER_CAVE_ITEM_ROOMS, SCENE_FINISHED
.end
    end

IsRegigigasInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp REGIGIGAS
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

IsDeoxysInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp DEOXYS
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

Movement_SCIR_Down:
    step DOWN
    step_end

RegigigasNeededText:
    text "It will take a"
    line "titan of a"
    cont "#MON to"
    cont "unblock this."
    done

RegigigasUnblocksText:
    text "REGIGIGAS crushes"
    line "the boulders!"
    done

DeoxysNeededText:
    text "It will take an"
    line "otherworldly"
    cont "PSYCHIC power"
    cont "to unblock this."
    done

DeoxysUnblocksText:
    text "DEOXYS dispels"
    line "the barrier!"
    done

SilverCaveItemRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 43,  5, SILVER_CAVE_ROOM_2, 4
	warp_event  5, 15, SILVER_CAVE_ROOM_2, 3

	def_coord_events
	coord_event 29, 6, SCENE_DEFAULT, DialgaBarrierScript
	coord_event 30, 6, SCENE_DEFAULT, DialgaBarrierScript
	coord_event 17, 6, SCENE_DEFAULT, PalkiaBarrierScript
	coord_event 18, 6, SCENE_DEFAULT, PalkiaBarrierScript

	def_bg_events

	def_object_events
	object_event 17,  2, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PalkiaScript, EVENT_CAUGHT_PALKIA
	object_event 30,  2, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DialgaScript, EVENT_CAUGHT_DIALGA
	object_event 29,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon1Script, EVENT_FIELD_MON_1
	object_event 18,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon2Script, EVENT_FIELD_MON_2
	object_event 35, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon3Script, EVENT_FIELD_MON_3
	object_event 39,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon4Script, EVENT_FIELD_MON_4
	object_event 28, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon5Script, EVENT_FIELD_MON_5
	object_event 41, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon6Script, EVENT_FIELD_MON_6
	object_event 10, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon7Script, EVENT_FIELD_MON_7
	object_event  7,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon8Script, EVENT_FIELD_MON_8
	object_event  9, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon9Script, EVENT_FIELD_MON_9
	object_event 17, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, SilverCaveItemRoomFieldMon10Script, EVENT_FIELD_MON_10
	