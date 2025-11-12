	object_const_def
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_SPEARY
	const VIRIDIANNICKNAMESPEECHHOUSE_RATTEY

ViridianNicknameSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianNicknameSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

ViridianNicknameSpeechHouseLassScript:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

Speary:
	opentext
	writetext SpearyText
	cry UMBREON
	waitbutton
	closetext
	end

Rattey:
	opentext
	writetext RatteyText
	cry ESPEON
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePokefanMText:
	text "VIRIDIAN is the"
	line "closest point to"
	cont "Johto."
	para "We collaborate"
	line "together in the"
	cont "war effort."
	done

ViridianNicknameSpeechHouseLassText:
	text "I tried to go west"
	line "to the #mon"
	cont "LEAGUE and I saw a"
	cont "big firey bird."
	para "I ran for it!"
	done

SpearyText:
	text "Umbreon."
	done

RatteyText:
	text "Espeon."
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 2
	warp_event  3,  7, VIRIDIAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_UMBREON, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Speary, -1
	object_event  6,  3, SPRITE_ESPEON, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Rattey, -1
