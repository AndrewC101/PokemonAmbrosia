	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "You have ventured"
	line "far."
	para "You have crossed"
	line "the seas and"
	cont "broadened your"
	cont "horizons."
	para "With your new"
	line "appetites I am"
	cont "quite sure you"
	cont "crave"
	cont "satisfaction."
	para "You need more than"
	line "the endless"
	cont "Poliwag and"
	cont "Magikarp found on"
	cont "the end of your"
	cont "rods."
	para "Am I right?"
	done

GiveSuperRodText:
	text "Very well!"
	para "Your deepest"
	line "desires are"
	cont "realised..."
	done

GaveSuperRodText:
	text "With the power of"
	line "the SUPER ROD you"
	cont "shall swim freely"
	cont "in a cosmic sea of"
	cont "dreams and"
	cont "deities."
	para "Just like I do."
	para "Every single day!"
	done

DontWantSuperRodText:
	text "The first step to"
	line "achieve your"
	cont "dreams is"
	cont "admitting that you"
	cont "want them."
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
