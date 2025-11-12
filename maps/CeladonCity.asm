	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS
	const CELADONCITY_FIELDMON_1

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CeladonFieldMon
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

.CeladonFieldMon:
    appear CELADONCITY_FIELDMON_1
    endcallback

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_MAX, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "My buddy here is"
	line "POLIWRATH."

	para "He loves PROTEIN!"

	para "If any Hoenn thugs"
	line "come to this city"
	cont "they are going to"
	cont "get their skulls"
	cont "crushed."

	para "Isn't that right"
	line "POLIWRATH."
	done

CeladonCityPoliwrathText:
	text "POLIIII!"

	para "WRAAAAATH!!!"
	done

CeladonCityTeacher1Text:
	text "The prize hall"
	line "has some TMs that"
	cont "can defeat any"
	cont "enemy in one hit!"

	para "I have taken out"
	line "a very high"
	cont "interest loan"
	cont "so I can get"
	cont "coins I need."

	para "It will all be"
	line "worth it when I'm"
	cont "the strongest"
	cont "trainer in the"
	cont "world!"
	done

CeladonCityGramps1Text:
	text "I've lived here"
	line "here my whole"
	cont "life."

	para "Here is my"
	line "secret."

	para "Never drink the"
	line "water from here."

	para "It is highly"
	line "polluted."

	para "There are"
	line "TENTACOOL in"
	cont "this pond!"
	done

CeladonCityGramps2Text:
	text "As this city"
	line "of gambling,"
	cont "crime, pollution"
	cont "and immorality"
	cont "gets bigger and"
	cont "bigger."

	para "This Gym stays"
	line "the same."

	para "An oasis of life"
	line "and purity."
	done

CeladonCityYoungster1Text:
	text "People from"
	line "Saffron are always"
	cont "talking about"
	cont "how Saffron is"
	cont "the biggest and"
	cont "most wealthy city."

	para "I'm pretty sure"
	line "Celadon is"
	cont "bigger."

	para "And there's lots"
	line "of money floating"
	cont "around the GAME"
	cont "CORNER and Dept"
	cont "Store."

	para "We are the best!"
	done

CeladonCityYoungster2Text:
	text "Team Rocket used"
	line "to operate in"
	cont "the Game Corner."

	para "There was a guy"
	line "who would hide"
	cont "ABRA in his coat"
	cont "and use its powers"
	cont "to always win."

	para "Nobody really"
	line "believes that"
	cont "Team Rocket are"
	cont "fully gone."
	done

CeladonCityTeacher2Text:
	text "Celadon Dept.Store"
	line "is the largest"
	cont "center of commerce"
	cont "in Kanto."

	para "I hear Goldenrod"
	line "has a similar"
	cont "store."

	para "Given the economic"
	line "condition of"
	cont "Johto I bet there"
	cont "is potential for"
	cont "arbitrage between"
	cont "the two stores."

	para "I must write this"
	line "idea down!"
	done

CeladonCityLassText:
	text "I used to go"
	line "on the Cycling"
	cont "Road but all the"
	cont "biker gangs cat"
	cont "calling me has"
	cont "became unbearable."

	para "I'm training my"
	line "#mon so I"
	cont "can beat them"
	cont "all up."

	para "I need some witty"
	line "line about being"
	cont "pretty to say"
	cont "after winning!"
	done

CeladonCitySignText:
	text "Celadon City"

	para "The City of"
	line "Rainbow Dreams"
	done

CeladonGymSignText:
	text "Celadon City"
	line "#mon Gym"
	cont "Leader: Erika"

	para "The Nature-Loving"
	line "Princess"
	done

CeladonCityDeptStoreSignText:
	text "Find What You"
	line "Need at Celadon"
	cont "Dept.Store!"
	done

CeladonCityMansionSignText:
	text "Celadon Mansion"
	done

CeladonCityGameCornerSignText:
	text "The Game Area for"
	line "Grown-ups--Celadon"
	cont "Game Corner"
	done

CeladonCityTrainerTipsText:
	text "TRAINER TIPS"

	para "#mon get"
	line "stronger by"
	cont "battling."

	para "All stats can"
	line "increase up to"
	cont "63 extra points"
	cont "at level 100."

	para "You don't have"
	line "to worry about"
	cont "training in any"
	cont "specific way."
	done

CeladonGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext CeladonGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_CeladonGymTurnBack
    end

CeladonGymBlockText:
    text "The door is"
    line "locked."

    para "This Gym is only"
    line "accepting Champion"
    cont "level challengers"
    cont "at this time."
    done

Movement_CeladonGymTurnBack:
	step DOWN
	step_end

CeladonMon1Script:
	faceplayer
	cry FROAKIE
	pause 15
	loadwildmon FROAKIE, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear CELADONCITY_FIELDMON_1
	end

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events
	coord_event 10, 30, SCENE_ALWAYS, CeladonGymBlockScript

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
	object_event 14, 22, SPRITE_FROAKIE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMon1Script, EVENT_FIELD_MON_1
