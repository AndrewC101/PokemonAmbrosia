	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "Are you sick of"
	line "only catching"
	cont "MAGIKARP when"
	cont "you fish!?"

	para "Then you need a"
	line "GOOD ROD!"

	para "A rod guaranteed"
	line "to catch other"
	cont "#mon!"

	para "It can be yours"
	line "today, for free!"

	para "Would you like a"
	line "GOOD ROD?"
	done

GiveGoodRodText:
	text "You won't be"
	line "disappointed."
	done

GaveGoodRodText:
	text "You'll catch many"
	line "good POLIWAG and"
	cont "TENTACOOL with"
	cont "that."
	done

DontWantGoodRodText:
	text "But it's a"
	line "limited time"
	cont "offer!"
	done

HaveGoodRodText:
	text "If you enjoy the"
	line "GOOD ROD please"
	cont "leave a review."
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
