	object_const_def
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_EKANS

BlackthornDragonSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornDragonSpeechHouseGrannyScript:
	jumptextfaceplayer BlackthornDragonSpeechHouseGrannyText

BlackthornDragonSpeechHouseDratiniScript:
	opentext
	writetext BlackthornDragonSpeechHouseDratiniText
	cry DRATINI
	waitbutton
	closetext
	end

BlackthornDragonSpeechHouseGrannyText:
	text "The dragons lived"
	line "in these mountains"
	cont "long before us."

	para "They reside now"
	line "in a sacred place"
	cont "called Dragons"
	cont "Den."

	para "There lives the"
	line "great Dragon Lord."

	para "An ancient and"
	line "supreme species"
	cont "of dragon."

	para "A RAYQUAZA."

	para "The Dragon Lord"
	line "is centuries old."

	para "He alone bestows"
	line "the title of"
	cont "dragon champion"
	cont "upon those who"
	cont "are worthy."

	para "Only one person"
	line "has been deemed"
	cont "worthy thus far."

	para "The pride of"
	line "BLACKTHORN."

	para "Champion Lance."
	done

BlackthornDragonSpeechHouseDratiniText:
	text "DRATINI: Draa!"
	done

BlackthornDragonSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 3
	warp_event  3,  7, BLACKTHORN_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseDratiniScript, -1
