	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2
	const PEWTERCITY_MUSEUM_GUARD

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityMuseumGuardScript:
    checkevent EVENT_BEAT_BROCK
    iffalse .blocked
    jumptextfaceplayer MuseumOpenText
.blocked
	jumptextfaceplayer MuseumBlockText

PewterCityGrampsScript:
    jumptextfaceplayer PewterCityGrampsText

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "The #RUS"
	line "outbreak put"
	cont "PEWTER on the map"
	cont "in all the wrong"
	cont "ways."

	para "We have slowly"
	line "tried to rebuild."

	para "Brock spends his"
	line "whole Gym Leader"
	cont "salary helping"
	cont "everyone."
	done

PewterCityBugCatcherText:
	text "Everyone knows"
	line "it was those"
	cont "filthy scientists"
	cont "that brought this"
	cont "upon us."

	para "Of course none"
	line "of them are still"
	cont "alive to answer"
	cont "for their crimes."
	done

PewterCityGrampsText:
	text "After the incident"
	line "my family was out"
	cont "of money."

	para "I invested in"
	line "a new promising"
	cont "venture in"
	cont "VERMILION."

	para "But it was a"
	line "con and collapsed"
	cont "shortly after."

	para "I lost my pension"
	line "along with my"
	cont "family."

	para "I've lost"
	line "everything."

	para "hu hu... sniff"

	para "...."

	para "Brock comes to"
	line "see me everyday."

	para "He's such a good"
	line "young man."
	done

PewterCitySignText:
	text "This garden is in"
	line "memory of all"
	cont "those who have"
	cont "left us."
	para "Safe in the arms"
	line "of ARCEUS."
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "#mon Gym"
	cont "Leader: Brock"

	para "The Rock Solid"
	line "#mon Trainer"
	done

PewterMuseumSignText:
	text "There's a notice"
	line "here…"

	para "PEWTER MUSEUM OF"
	line "SCIENCE is sealed."
	done

PewterCityMtMoonGiftShopSignText:
	text "There's a notice"
	line "here…"

	para "MT.MOON GIFT SHOP"
	line "NOW OPEN!"
	done

PewterCityWelcomeSignText:
	text "WELCOME TO"
	line "PEW..."

	para "The rest is"
	line "worn away."
	done
	
PewterGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext PewterGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_PewterGymTurnBack
    end

MuseumBlockScript:
    checkevent EVENT_BEAT_BROCK
    iffalse .block
    end
.block
    turnobject PEWTERCITY_MUSEUM_GUARD, LEFT
    turnobject PLAYER, RIGHT
	opentext
	writetext MuseumBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_PewterGymTurnBack
    turnobject PEWTERCITY_MUSEUM_GUARD, DOWN
    end

MuseumBlockText:
    text "This used to be"
    line "the PEWTER MUSEUM."

    para "Two years ago a"
    line "#RUS outbreak"
    cont "occurred here."

    para "It was believed"
    line "the space rocks"
    cont "carried the"
    cont "virus."

    para "The effects were"
    line "felt all over."

    para "Many people and"
    line "#mon died."

    para "The #mon"
    line "inside are very"
    cont "contagious."

    para "This place was"
    line "sealed off by"
    cont "Champion Blue."

    para "Only those who"
    line "have defeated"
    cont "Gym Leader Brock"
    cont "may enter."
    done

MuseumOpenText:
	text "Having proven your"
	line "strength against"
	cont "Brock, you may"
	cont "pass."
	para "There is"
	line "something..."
	para "Unnatural buried"
	line "deep in the lab."
	para "Only trainers on"
	line "the level of"
	cont "Champion Blue can"
	cont "hope to conquer"
	cont "it."
	done

PewterGymBlockText:
    text "The door is"
    line "locked."

    para "This Gym is only"
    line "accepting Champion"
    cont "level challengers"
    cont "at this time."
    done

Movement_PewterGymTurnBack:
	step DOWN
	step_end

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event  13, 7, MUSEUM, 1

	def_coord_events
	coord_event 16, 18, SCENE_ALWAYS, PewterGymBlockScript
	coord_event 13,  8, SCENE_ALWAYS, MuseumBlockScript

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
	object_event 14,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityMuseumGuardScript, -1

