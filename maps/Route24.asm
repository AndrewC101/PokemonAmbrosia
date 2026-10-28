	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_ROCKET_GIRL
	const ROUTE24_ROCKET_GRUNT

Route24_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Rocket

.Rocket
    disappear ROUTE24_ROCKET
    disappear ROUTE24_ROCKET_GIRL
    disappear ROUTE24_ROCKET_GRUNT
    checkevent EVENT_BEAT_WALLACE
    iffalse .CheckGym
    appear ROUTE24_ROCKET_GIRL
    appear ROUTE24_ROCKET_GRUNT
    sjump .ShowRocket
.CheckGym
    checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
    iffalse .end
.ShowRocket
    appear ROUTE24_ROCKET
.end
    endcallback

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .FightDone
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
	;special FadeOutToBlack
	;special ReloadSpritesNoPalettes
	;disappear ROUTE24_ROCKET
	;pause 25
	;special FadeInFromBlack
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
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextRocket
	waitbutton
	closetext
	end

Route24RocketGirlScript:
	jumptextfaceplayer Route24RocketGirlText

Route24RocketGruntScript:
	jumptextfaceplayer Route24RocketGruntText

Route24RocketGirlText:
	text "You defeated"
	line "Wallace."

	para "I guess I can"
	line "unironically call"
	cont "you little hero"
	cont "now."

	para "You see, strength"
	line "is all that"
	cont "matters."

	para "Now that you are"
	line "far stronger than"
	cont "me I am sorry for"
	cont "how I treated you."

	para "I wasn't going to"
	line "actually hurt you"
	cont "or your dad."

	para "I am grateful for"
	line "what you have done"
	cont "for Kanto."

	para "Thank you champion"
	line "<PLAYER>."
	done

Route24RocketGruntText:
	text "I wish I was there"
	line "to watch every"
	cont "painful expression"
	cont "on Wallace's face"
	cont "when he lost to"
	cont "you."

	para "You are beyond the"
	line "mere title of"
	cont "champion."

	para "You are a peerless"
	line "trainer and a true"
	cont "visionary."

	para "Just like Giovanni"
	line "used to be."

	para "Pity we didn't get"
	line "to take command of"
	cont "Wallace's #mon"
	cont "though."

	para "I'm sure there are"
	line "other, more"
	cont "powerful legendary"
	cont "#mon to pursue."
	done

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
	cont "Johto Rockets."

	para "They were weak"
	line "and deserved what"
	cont "they got."

	para "I will carry out"
	line "my mission."

	para "To use the Radio"
	line "Tower to control"
	cont "Hoenn #mon."

	para "I'm sure you know"
	line "about that."

	para "But I will go"
	line "further."

	para "We used to have"
	line "a secret weapon."

	para "Mewtwo."

	para "It used to dwell"
    line "in Cerulean Cave."

    para "I will find it."

    para "Nothing will"
    line "stop me."

    para "Go ahead, the"
    line "machine part is"
    cont "in the square"
    cont "pool in the"
    cont "centre of the"
    cont "Cerulean Gym."

    para "But before you"
    line "depart..."

    para "The Rockets send"
    line "their regards."
	done

Route24RocketBeatenText:
	text "I can see why"
	line "the Rockets"
	cont "lost to you."
	done

Route24RocketAfterBattleText:
	text "Team Rocket used"
	line "to have a true"
	cont "leader."

	para "A great leader."

	para "I know he is"
	line "alive and lives"
	cont "in Kanto."

	para "I had hoped to"
	line "to find him and"
	cont "find Mewtwo."

	para "Together we"
	line "would reinvent"
	cont "Team Rocket."

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
	object_event  8,  8, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketGirlScript, EVENT_TEMP_EVENT_2
	object_event  8,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketGruntScript, EVENT_TEMP_EVENT_3
