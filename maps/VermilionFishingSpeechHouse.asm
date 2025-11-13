	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText


FishingDudeText:
	text "Owi you!"

	para "Ow me heed!"

	para "I be drinkin"
	line "a wey bi tay"
	cont "muh last nigh."

	para "I be a fishin"
	line "man but naw fish"
	cont "bay bittin."

	para "Nout bu fuppin"
	line "Magikarp."

	para "Deh gud fer notin."

	para "Deh not ethin be"
	line "gud fer eatten."

	para "Oww I need be"
	line "havin a wey sleep."

	para "Owi!"

	para "Get otta mi hous!!"
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "And drinking."

	para "Lots of drinking."
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
