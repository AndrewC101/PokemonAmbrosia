	object_const_def
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER
	const CERULEANCITY_FIELDMON_1

CeruleanCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CeruleanFieldMon
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

.CeruleanFieldMon:
    appear CERULEANCITY_FIELDMON_1
    endcallback

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript

CeruleanCityHiddenBerserkGene:
	hiddenitem BRIGHTPOWDER, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "There is a Power"
	line "Plant to the east"
	cont "of here."

	para "The guy in charge"
	line "is a bit of a"
	cont "psycho."
	done

CeruleanCityCooltrainerMText2:
	text "You're the hero"
	line "that saved Kanto!"

	para "Champion <PLAYER>!"

	para "I've heard you"
	line "are the strongest"
	cont "trainer in the"
	cont "whole world!"

	para "I want to thank"
	line "you with all my"
	cont "heart."
	done

CeruleanCitySuperNerdText:
	text "There is a large"
	line "cave near here."

	para "It was sealed off"
	line "but recently it"
	cont "is sitting open."

	para "It's a horrifying"
	line "place with"
        cont "insanely"
	cont "strong #mon."

	para "Let's explore it!"
	done

CeruleanCitySlowbroText:
	text "Slowbro: Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "My Slowbro is"
	line "the strongest in"
	cont "all the world."
	done

CeruleanCityCooltrainerFText2:
	text "Slowbro, show me"
	line "your Psychic!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityFisherText:
	text "I'm a huge fan of"
	line "Cerulean Gym's"
	cont "Misty."

	para "I know everything"
	line "about her."

	para "Her #mon."

	para "Her win rate."

	para "Her favorite food."

	para "Her daily routine."
	done

CeruleanCityFisherRocketTipText:
	text "I saw a guy head"
	line "toward Cerulean"
	cont "Cave."

	para "He was wearing"
	line "glasses but he"
	cont "took them off"
	cont "and slicked back"
	cont "his hair."

	para "He looked so"
	line "cool!"
	done

CeruleanCityYoungsterText1:
	text "The cave over"
	line "there is open!"

	para "It shouldn't be!"

	para "This is bad."

	para "Who knows what"
	line "kinds of monstrous"
	cont "#mon will"
	cont "emerge!"
	done

CeruleanCityYoungsterText2:
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done

CeruleanCitySignText:
	text "Cerulean City"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "Cerulean City"
	line "#mon Gym"
	cont "Leader: Misty"

	para "The Tomboyish"
	line "Mermaid"
	done

CeruleanBikeShopSignText:
	text "There's a notice"
	line "here…"

	para "The BIKE SHOP is"
	line "closed due to"
	cont "everyone using"
	cont "SPORT SHOES."
	done

CeruleanPoliceSignText:
	text "There's a notice"
	line "here…"

	para "Thieves will be"
	line "subject to swift"
	cont "and severe"
	cont "retribution."

	para "Cerulean Police"
	done

CeruleanCapeSignText:
	text "Cerulean Cape"
	line "ahead"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext CeruleanGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_CeruleanGymTurnBack
    end

CeruleanGymBlockText:
    text "The door is"
    line "locked."

    para "This Gym is only"
    line "accepting Champion"
    cont "level challengers"
    cont "at this time."
    done

Movement_CeruleanGymTurnBack:
	step DOWN
	step_end

CeruleanMon1Script:
	faceplayer
	cry SQUIRTLE
	pause 15
	loadwildmon SQUIRTLE, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear CERULEANCITY_FIELDMON_1
	end

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2
	warp_event 0, 13, CERULEAN_CAVE, 1

	def_coord_events
	coord_event 30, 24, SCENE_ALWAYS, CeruleanGymBlockScript

	def_bg_events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  3, 14, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	def_object_events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 10, 22, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanMon1Script, EVENT_FIELD_MON_1

