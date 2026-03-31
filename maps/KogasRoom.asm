	object_const_def
	const KOGASROOM_KOGA

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

;.Weather:
;	setval WEATHER_RAIN
;	writemem wFieldWeather
;	endcallback

AdamScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	readmem wHardMode
	ifequal 0, .normal
	readmem wLevelCap
	ifless 100, .hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ADAM, ADAM_ARCADE
	sjump .battle
.hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ADAM, ADAM_ELITE
	sjump .battle
.normal
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer ADAM, ADAM_ELITE
.battle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	special HealParty
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "So you've managed"
	line "to stomach the"
	cont "cliche, dramatic"
	cont "speeches up"
	cont "until now."

	para "Well done."

	para "That alone should"
	line "make you a"
	cont "Champion."

	para "I am Adam."

	para "They call me a"
	line "prodigy."

	para "That's just a"
	line "convenient way"
	cont "for others to"
	cont "rationalise their"
	cont "own mediocrity."

	para "I'm not one for"
	line "useless speeches."

	para "We both know there"
	line "is only one way"
	cont "you are getting"
	cont "through that"
	cont "door."
	done

KogaScript_KogaBeatenText:
	text "Don't let it"
	line "go to your"
	cont "head."
	done

KogaScript_KogaDefeatText:
	text "Well done"
	line "<PLAYER>."

	para "Alright here"
	line "goes my little"
	cont "speech."

	para "To be a Champion"
	line "you have to"
	cont "keep your ego"
	cont "in check."

	para "Now go into the"
	line "final room and"
	cont "do what you were"
	cont "born to do."

	para "You've got this!"
	done

AdamLatios:
    opentext
    writetext LatiosText
    waitbutton
    closetext
    end

LatiosText:
    text "Who's that"
    line "#mon!?"
    done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	;warp_event  4, 17, WILLS_ROOM, 2
	;warp_event  5, 17, WILLS_ROOM, 3
	;warp_event  4,  2, BRUNOS_ROOM, 1
	;warp_event  5,  2, BRUNOS_ROOM, 2

	warp_event  4, 17, KARENS_ROOM, 2
	warp_event  5, 17, KARENS_ROOM, 3
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AdamScript_Battle, -1
	object_event  4,  7, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AdamLatios, -1
