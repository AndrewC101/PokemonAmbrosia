	object_const_def
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_script KarensRoomNoopScene,     SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorsCallback

KarensRoomLockDoorScene:
	sdefer KarensRoomDoorLocksBehindYouScript
	end

KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KarensRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	readmem wHardMode
	ifequal 0, .normal
	readmem wLevelCap
	ifless 100, .hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KAREN, MASTER_KAREN
	sjump .battle
.hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KAREN, KAREN1
	sjump .battle
.normal
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer KAREN, KAREN1
.battle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	special HealParty
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "I am Karen of"
	line "the Elite Four."

	para "Darkness is the"
	line "great equaliser."

	para "The most primal"
	line "fear."

	para "The infinite"
	line "expanse."

	para "In its embrace the"
	line "strong and the"
	cont "weak are all"
	cont "the same."

	para "afraid."

	para "Those that embrace"
	line "the fear are the"
	cont "ones to survive."

	para "Only by facing"
	line "your fear can"
	cont "you learn who"
	cont "you really are."
	done

KarenScript_KarenBeatenText:
	text "You understand"
	line "what's important."
	done

KarenScript_KarenDefeatText:
	text "Strong and weak."

	para "These are terms"
	line "without meaning."

	para "A naive"
	line "perception."

	para "There is only"
	line "those who survive"
	cont "and those who"
	cont "do not."

	para "You have mastered"
	line "your fear."

	para "An essential"
	line "quality of a"
	cont "Champion."

	para "Now march forward"
	line "without fear."
	done

KarenHoundoom:
    opentext
    writetext HoundoomText
    waitbutton
    closetext
    end

HoundoomText:
    text "Houndoom!"
    done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	;warp_event  4,  2, LANCES_ROOM, 1
	;warp_event  5,  2, LANCES_ROOM, 2
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
	object_event  4,  7, SPRITE_HOUNDOOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenHoundoom, -1
