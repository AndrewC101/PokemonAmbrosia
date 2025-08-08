	object_const_def
	const ROUTE24_ROCKET

Route24_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Rocket

.Rocket
    disappear ROUTE24_ROCKET
    checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
    iffalse .end
    appear ROUTE24_ROCKET
.end
    endcallback

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	checkevent EVENT_ROUTE_24_ROCKET
	iftrue .FightDone
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer EXECUTIVEM, PRIMERA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	special FadeOutMusic
	writetext Route24RocketAfterBattleText
	promptbutton
	closetext
	;special FadeBlackQuickly
	;special ReloadSpritesNoPalettes
	;disappear ROUTE24_ROCKET
	;pause 25
	;special FadeInQuickly
    setevent EVENT_ROUTE_24_ROCKET
	playmapmusic
	end
.rematch
    writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer EXECUTIVEM, PRIMERA
	startbattle
	reloadmapafterbattle
	end

.FightDone:
	writetext Route24RocketAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextRocket
	yesorno
	iftrue .rematch
	writetext RematchRefuseTextRocket
	waitbutton
	closetext
	end

RematchTextRocket:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextRocket:
    text "Maybe next time."
    done

Route24RocketSeenText:
	text "Of course you"
	line "would come."

	para "I have lost all"
	line "contact with the"
	cont "JOHTO ROCKETS."

	para "They were weak"
	line "and deserved what"
	cont "they got."

	para "I will carry out"
	line "my mission."

	para "To use the RADIO"
	line "TOWER to control"
	cont "HOENN #mon."

	para "I'm sure you know"
	line "about that."

	para "But I will go"
	line "further."

	para "We used to have"
	line "a secret weapon."

	para "MEWTWO."

	para "It used to dwell"
    line "in CERULEAN CAVE."

    para "I will find it."

    para "Nothing will"
    line "stop me."

    para "Go ahead, the"
    line "machine part is"
    cont "in the square"
    cont "pool in the"
    cont "centre of the"
    cont "CERULEAN GYM."

    para "But before you"
    line "depart..."

    para "The ROCKETS send"
    line "their regards."
	done

Route24RocketBeatenText:
	text "I can see why"
	line "the ROCKETS"
	cont "lost to you."
	done

Route24RocketAfterBattleText:
	text "TEAM ROCKET used"
	line "to have a true"
	cont "leader."

	para "A great leader."

	para "I know he is"
	line "alive and lives"
	cont "in KANTO."

	para "I had hoped to"
	line "to find him and"
	cont "find MEWTWO."

	para "Together we"
	line "would reinvent"
	cont "TEAM ROCKET."

	para "But alas the"
	line "world has moved"
	cont "on and I must"
	cont "move on too."
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_TEMP_EVENT_1
