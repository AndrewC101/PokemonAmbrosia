	object_const_def
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .BrunosRoomDoors

.LockDoor:
	sdefer .BrunosDoorLocksBehindYou
	end

.DummyScene:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, BrunosRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	special HealParty
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "I am BRUNO."

	para "I do not care"
	line "for the subtle"
	cont "games of words"
	cont "and politics."

	para "I do not care"
	line "for the arrogant"
	cont "and wasted words"
	cont "of those who"
	cont "say but do not"
	cont "act."

	para "We must face our"
	line "problems head on."

	para "Direct action is"
	line "the only power"
	cont "to bring change."

	para "Now I will judge"
	line "your power."
	done

BrunoScript_BrunoBeatenText:
	text "The world bends"
	line "to your might."
	done

BrunoScript_BrunoDefeatText:
	text "You have the"
	line "strength to be"
	cont "a Champion."

	para "Take that"
	line "strength and"
	cont "face your next"
	cont "challenge."
	done

BrunoMachamp:
    opentext
    writetext BrunoText
    waitbutton
    closetext
    end

BrunoText:
    text "Machamp!"
    done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	;warp_event  4, 17, KOGAS_ROOM, 3
	;warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
	object_event  4,  7, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BrunoMachamp, -1
