	object_const_def
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd Radio2Script

EcruteakLugiaSpeechHouseGrampsText:
	text "I see you have"
	line "a genuine heart."

	para "I have an awful"
	line "secret I have"
	cont "never told"
	cont "anyone."

	para "I will tell you."

	para "I was the one"
	line "who burnt down"
	cont "the Brass Tower."

	para "I was a boy and"
	line "it was an"
	cont "accident."

	para "I barely managed"
	line "to escape."

	para "When I got"
	line "older the full"
	cont "horror of what"
	cont "I had done"
	cont "took over me."

	para "I fled into"
	line "the mountains."

    para "Then a #mon"
    line "bright as the"
    cont "sun appeared."

    para "Its fire engulfed"
    line "me."

    para "I believed I"
    line "deserved death."

    para "But It didn't"
    line "burn my flesh."

    para "It burned away"
    line "my guilt."

    para "I knew then"
    line "that HO-OH had"
    cont "forgiven me."

    para "I wept like a"
    line "child."

    para "I dedicated the"
    line "rest of my life"
    cont "to protecting"
    cont "the Tin Tower."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "We've tried"
	line "telling him many"
	cont "times."
	para "The Burned Tower"
	line "was struck by"
	cont "lightning."
	para "It wasn't grandads"
	line "fault."
	para "But he can't let"
	line "it go."
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
