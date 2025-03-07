	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_PROTECT
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsQuestionText:
	text "It's ok, dear"
	line "child."

	para "You have nothing"
	line "to fear from me."

	para "My therapist tells"
	line "me it's all in my"
	cont "head, not real."

	para "I don't have the"
	line "power to summon"
	cont "demons in far"
	cont "off shores!"

	para "I'm just an"
	line "OLD MAN who"
	cont "like coffee..."

	para "Isn't that right?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Yes indeed!"

	para "I used to enjoy"
	line "catching #MON"
	cont "but now I enjoy"
	cont "a nice coffee..."
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "What do you"
	line "know of it!?"

	para "No!"

	para "Don't speak it's"
	line "name!"

	para "It's not real!"

	para "...."

	para "MISSINGNO..."

	para "AWWWWAAHHHHH!!"
	done

ViridianCityGrampsNearGymText:
	text "The GYM LEADER"
	line "here is very"
	cont "busy trying to"
	cont "do the jobs the"
	cont "#MON LEAGUE"
	cont "should be doing!"

	para "BLUE is currently"
	line "away visiting"
	cont "CINNABAR."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "CHAMPION BLUE"
	line "is ready to take"
	cont "challengers again."

	para "BLUE is stronger"
	line "than any other"
	cont "GYM LEADER."

	para "Stronger even"
	line "than CHAMPIONS."

	para "He is the peoples"
	line "CHAMPION!"
	done

ViridianCityDreamEaterFisherText:
	text "How did you get"
	line "in here?"

	para "What what!"

	para "I fortified this"
	line "defense position"
	cont "myself."

	para "It is virtually"
	line "impregnable!"

	para "We must all make"
	line "an effort to"
	cont "protect ourselves"
	cont "in these fractious"
	cont "times!"

	para "Here, hurry and"
	line "take this!"

	para "Look lively now!"
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "I must continue"
	line "to fortify these"
	cont "barricades to"
	cont "deter anyone"
	cont "who might attack!"

	para "It is your duty"
	line "as a responsible"
	cont "citizen to protect"
	cont "yourself."
	done

ViridianCityYoungsterText:
	text "VIRIDIAN FOREST"
	line "is a husk of"
	cont "what it once was."

	para "The #RUS"
	line "outbreak really"
	cont "ravaged it."

	para "We must preserve"
	line "what remains."
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "BLUE!"

	para "THE PEOPLES"
	line "CHAMPION!"
	done

ViridianCityWelcomeSignText:
	text "WELCOME TO"
	line "VIRIDIAN CITY,"

	para "THE GATEWAY TO"
	line "INDIGO PLATEAU"
	done

TrainerHouseSignText:
	text "KANTO WAR ROOM"

	para "The hub for"
	line "military strategy."

	para "Authorized persons"
	line "only."
	done

ViridianGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext ViridianGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_ViridianGymTurnBack
    end
Movement_ViridianGymTurnBack:
    step RIGHT
    step_end
ViridianGymBlockText:
    text "The door is"
    line "locked."

    para "This GYM is only"
    line "accepting CHAMPION"
    cont "level challengers"
    cont "at this time."
    done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events
	coord_event 32,  8, SCENE_ALWAYS, ViridianGymBlockScript

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
