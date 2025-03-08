	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "My grandpa is the"
	line "SAFARI ZONE"
	cont "WARDEN."

	para "At least he was…"

	para "He decided to go"
	line "on a vacation and"
	cont "took off overseas"
	cont "all by himself."

	para "He quit running"
	line "SAFARI ZONE just"
	cont "like that."
	done

WardensGranddaughterText2:
	text "Many people were"
	line "disappointed that"
	cont "SAFARI ZONE closed"
	cont "down, but Grandpa"
	cont "is so stubborn…"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"
	cont "who's surrounded"
	cont "by #MON."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"
	cont "with rare #MON"
	cont "frolicking in it."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
