	object_const_def
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2
	const ROUTE10SOUTH_FIELDMON_1
    const ROUTE10SOUTH_FIELDMON_2
    const ROUTE10SOUTH_FIELDMON_3

Route10South_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route10SouthFieldMon

.Route10SouthFieldMon:
; Pokemon which always appear
    appear ROUTE10SOUTH_FIELDMON_1
    appear ROUTE10SOUTH_FIELDMON_2

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE10SOUTH_FIELDMON_3
    sjump .end
.spawn6
    appear ROUTE10SOUTH_FIELDMON_3
.end
    endcallback

Route10SouthFieldMon2Script:
	trainer CHANDELURE, FIELD_MON, EVENT_FIELD_MON_1, Route10SouthPokemonAttacksText, 48, 0, .script
.script
    disappear ROUTE10SOUTH_FIELDMON_1
    end

Route10SouthPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route10SouthFieldMon3Script:
	faceplayer
	cry MAROWAK
	pause 15
	loadwildmon MAROWAK, 42
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE10SOUTH_FIELDMON_2
	end

Route10SouthFieldMon4Script:
	faceplayer
	cry GLISCOR
	pause 15
	loadwildmon GLISCOR, 58
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE10SOUTH_FIELDMON_3
	end

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "I'm not afraid!"

	para "I'm going into"
	line "ROCK TUNNEL."

	para "I have salt,"
	line "garlic and holy"
	cont "water with me!"
	done

HikerJimBeatenText:
	text "Good warm up."
	done

HikerJimAfterBattleText:
	text "Say a prayer"
	line "with me."

	para "Dear ARCEUS"
	line "watch over me."

	para "Amen."
	done

PokefanmRobertSeenText:
	text "I love the"
	line "mountain air."

	para "Rocky mountain"
	line "high!"

	para "I've seen it"
	line "raining fire in"
	cont "the sky."
	done

PokefanmRobertBeatenText:
	text "Take me home."
	done

PokefanmRobertAfterBattleText:
	text "What a friend we"
	line "have in time."

	para "Thank ARCEUS I'm"
	line "a country boy!"
	done

Route10SignText:
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	def_object_events
	object_event 17,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event  8, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event 10, 10, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Route10SouthFieldMon2Script, EVENT_FIELD_MON_1
	object_event 17,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10SouthFieldMon3Script, EVENT_FIELD_MON_2
	object_event  3,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route10SouthFieldMon4Script, EVENT_FIELD_MON_3
