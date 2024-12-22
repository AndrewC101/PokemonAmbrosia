	object_const_def
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2
	const VIOLETCITY_FIELDMON_1
	const VIOLETCITY_FIELDMON_2
	const VIOLETCITY_FIELDMON_3
	const VIOLETCITY_FIELDMON_4
	const VIOLETCITY_SELF
	const VIOLETCITY_FIELDMON_5

VioletCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .VioletCityFieldMon
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

.VioletCityFieldMon:
; Pokemon which always appear
    disappear VIOLETCITY_SELF
    appear VIOLETCITY_FIELDMON_1
    appear VIOLETCITY_FIELDMON_2
    appear VIOLETCITY_FIELDMON_3

    random 4
    ifequal 1, .spawn1
    disappear VIOLETCITY_FIELDMON_4
    sjump .mon5
.spawn1
    appear VIOLETCITY_FIELDMON_4

.mon5
    random 2
    ifequal 1, .spawn2
    disappear VIOLETCITY_FIELDMON_5
    sjump .end
.spawn2
    appear VIOLETCITY_FIELDMON_5

.end
    endcallback

VioletCityEarlScript:
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	yesorno
	iffalse .FollowEarl
	sjump .PointlessJump

.PointlessJump:
	writetext Text_VeryNiceIndeed
	waitbutton
	closetext
	end

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	playmusic MUSIC_VIOLET_CITY
	opentext
	writetext Text_HereTeacherIAm
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applymovement VIOLETCITY_EARL, VioletCityFinishFollowEarl_MovementData
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokecenterSign:
	jumpstd PokecenterSignScript

VioletCityMartSign:
	jumpstd MartSignScript

VioletCityChoiceBand:
	itemball CHOICE_BAND

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTree:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityHiddenHyperPotion:
	hiddenitem POLKADOT_BOW, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION

VioletCityFollowEarl_MovementData:
	big_step DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	big_step UP
	turn_head DOWN
	step_end

VioletCityFinishFollowEarl_MovementData:
	step UP
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Text_EarlAsksIfYouBeatFalkner:
	text "What did you think"
	line "of that?"
	para "I bet you never"
	line "seen someone move"
	cont "like that!"
	para "That is the sign"
	line "of a true #MON"
	cont "MASTER."
	para "Have you defeated"
	line "the GYM LEADER?"
	done

Text_VeryNiceIndeed:
	text "Ah you must also"
	line "be a true #MON"
	cont "MASTER."
	para "You have nothing"
	line "to learn from me."
	done

Text_FollowEarl:
	text "You need a"
	line "teacher."
	para "Well you'll be"
	line "happy to learn I"
	cont "am a teacher."
	para "Come spin with me"
	line "if you can."
	done

Text_HereTeacherIAm:
	text "You are in a state"
	line "of shock and awe,"
	cont "I can tell."
	para "This is my school!"
	para "I taught FALKNER"
	line "everything he"
	cont "knows and now..."
	para "I shall teach you."
	done

VioletCityLassText:
	text "SPROUT TOWER"
	line "is full of GHOST"
    cont "#MON."

    para "I think they"
    line "came out from"
    cont "the basement"
    cont "they discovered."

    para "What other secrets"
    line "are buried under"
    cont "that tower?"
	done

VioletCitySuperNerdText:
	text "I tried being"
	line "a #MON trainer"
	cont "but I couldn't"
	cont "beat FALKNER."

	para "I don't mind."

	para "Everybody knows"
	line "the LEAGUE wants"
	cont "trainers so they"
	cont "can send them"
	cont "off to war."
	done

VioletCityGrampsText:
	text "The SAGES at"
	line "SPROUT TOWER"
	cont "always talk of"
	cont "fighting the"
	cont "darkness."

	para "But I saw one"
	line "of them at DARK"
	cont "CAVE."

	para "I think they are"
	line "nurturing the"
	cont "darkness so"
	cont "their beliefs"
	cont "appear relevant."
	done

VioletCityYoungsterText:
	text "My friends have"
	line "a secret hiding"
	cont "place behind the"
	cont "GYM."

	para "You need SURF"
	line "to get there."

	para "When the HOEN"
	line "army comes for"
	cont "us I'll hide"
	cont "there."

	para "I hope HOEN"
	line "#MON can't"
	cont "swim!"
	done

VioletCitySignText:
	text "VIOLET CITY"

	para "The City of"
	line "Nostalgic Scents"
	done

VioletGymSignText:
	text "VIOLET CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done

SproutTowerSignText:
	text "SPROUT TOWER"

	para "Experience the"
	line "Way of #MON"
	done

EarlsPokemonAcademySignText:
	text "EARL'S #MON"
	line "ACADEMY"
	done

VioletCityFieldMon1Script:
	faceplayer
	cry MURKROW
	pause 15
	loadwildmon MURKROW, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear VIOLETCITY_FIELDMON_1
	end

VioletCityFieldMon2Script:
	faceplayer
	cry HOOTHOOT
	pause 15
	loadwildmon HOOTHOOT, 11
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear VIOLETCITY_FIELDMON_2
    end

VioletCityFieldMon3Script:
	faceplayer
	cry STARAPTOR
	pause 15
	loadwildmon STARAPTOR, 44
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear VIOLETCITY_FIELDMON_3
	end

VioletCityFieldMon4Script:
	faceplayer
	cry STARLY
	pause 15
	loadwildmon STARLY, 12
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear VIOLETCITY_FIELDMON_4
    end

VioletCityFieldMon5Script:
	faceplayer
	cry MEOWTH
	pause 15
	loadwildmon MEOWTH, 12
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear VIOLETCITY_FIELDMON_5
    end

VioletCitySelfScript:
    playmusic MUSIC_RUINS_OF_ALPH_RADIO
    pause 20
    appear VIOLETCITY_SELF
    pause 5
    turnobject PLAYER, RIGHT
    opentext
    writetext VioletSelfText1
    waitbutton
    closetext
    disappear VIOLETCITY_SELF
    moveobject VIOLETCITY_SELF, 16, 18
    appear VIOLETCITY_SELF
    pause 5
    turnobject PLAYER, LEFT
    opentext
    writetext VioletSelfText2
    waitbutton
    closetext
    disappear VIOLETCITY_SELF
    moveobject VIOLETCITY_SELF, 19, 19
    appear VIOLETCITY_SELF
    pause 5
    turnobject PLAYER, DOWN
    opentext
    writetext VioletSelfText3
    waitbutton
    closetext
    disappear VIOLETCITY_SELF
    moveobject VIOLETCITY_SELF, 19, 18
    appear VIOLETCITY_SELF
    pause 5
    turnobject VIOLETCITY_SELF, LEFT
    turnobject PLAYER, RIGHT
    opentext
    writetext VioletSelfText4
    waitbutton
    closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
    winlosstext VioletSelfVictoryText, VioletSelfLossText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer CAL, CAL1
	startbattle
	ifequal LOSE, .lose
	sjump .over
.Female
    winlosstext VioletSelfVictoryText, VioletSelfLossText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer CAL_F, CAL_F1
	startbattle
	ifequal LOSE, .lose
.over
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RUINS_OF_ALPH_RADIO
	setevent EVENT_BEAT_VIOLET_SELF
	setmapscene VIOLET_CITY, SCENE_FINISHED
	opentext
	writetext VioletSelfText5
	waitbutton
	closetext
	disappear VIOLETCITY_SELF
	playmusic MUSIC_VIOLET_CITY
	special HealParty
	end
.lose
    dontrestartmapmusic
    reloadmap
    playmusic MUSIC_RUINS_OF_ALPH_RADIO
	opentext
	writetext VioletSelfText6
	waitbutton
	closetext
	applymovement PLAYER, VioletMovement_PlayerDown
	pause 5
	disappear VIOLETCITY_SELF
	playmusic MUSIC_VIOLET_CITY
	special HealParty
	end

VioletMovement_PlayerDown:
    slow_step DOWN
    step_end

VioletSelfText1:
    text "You let him get"
    line "away..."
    done

VioletSelfText2:
    text "ELM was counting"
    line "on you."

    para "But you were too"
    line "weak."
    done

VioletSelfText3:
    text "People who need"
    line "you are just"
    cont "going to get"
    cont "hurt."
    done

VioletSelfText4:
    text "You are too weak"
    line "to save anyone."

    para "Especially"
    line "yourself."
    done

VioletSelfText5:
    text "You can ignore"
    line "me for a time."

    para "But I'm always"
    line "there."

    para "I keep you safe."

    para "By reminding you"
    line "how insignificant"
    cont "you really are."
    done

VioletSelfText6:
    text "I only do this"
    line "because I care"
    cont "about you."

    para "Now go back"
    line "home where you"
    cont "will be safe."
    done

VioletSelfLossText:
    text "Put these foolish"
    line "ambitions to"
    cont "rest."
    done

VioletSelfVictoryText:
    text "A hollow victory."
    done

VioletCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 17, VIOLET_MART, 2
	warp_event 18, 17, VIOLET_GYM, 1
	warp_event 30, 17, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 15, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 25, VIOLET_POKECENTER_1F, 1
	warp_event 21, 29, VIOLET_KYLES_HOUSE, 1
	warp_event 23,  5, SPROUT_TOWER_1F, 1
	warp_event 39, 24, ROUTE_31_VIOLET_GATE, 1
	warp_event 39, 25, ROUTE_31_VIOLET_GATE, 2

	def_coord_events
	coord_event 18, 18, SCENE_DEFAULT, VioletCitySelfScript

	def_bg_events
	bg_event 24, 20, BGEVENT_READ, VioletCitySign
	bg_event 15, 17, BGEVENT_READ, VioletGymSign
	bg_event 24,  8, BGEVENT_READ, SproutTowerSign
	bg_event 27, 17, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 32, 25, BGEVENT_READ, VioletCityPokecenterSign
	bg_event 10, 17, BGEVENT_READ, VioletCityMartSign
	bg_event 37, 14, BGEVENT_ITEM, VioletCityHiddenHyperPotion

	def_object_events
	object_event 13, 16, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 28, 28, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityLassScript, -1
	object_event 24, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	object_event 17, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	object_event  5, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	object_event 14, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFruitTree, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityChoiceBand, EVENT_VIOLET_CITY_CHOICE_BAND
	object_event 35,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY

	object_event 7, 27, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, VioletCityFieldMon1Script, EVENT_FIELD_MON_1
	object_event 4, 28, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletCityFieldMon2Script, EVENT_FIELD_MON_2
	object_event 4, 26, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletCityFieldMon3Script, EVENT_FIELD_MON_3
	object_event 1, 24, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, VioletCityFieldMon4Script, EVENT_FIELD_MON_4
	object_event 21, 18, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event 23,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, VioletCityFieldMon5Script, EVENT_FIELD_MON_5
