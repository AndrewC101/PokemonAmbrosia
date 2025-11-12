	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseText
	waitbutton
	writetext Route30BerrySpeechHouseTakeBerryText
	waitbutton
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	closetext
	end
.GotBerry:
	writetext Route30BerrySpeechHouseText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route30BerrySpeechHouseText:
	text "I wanted to buy"
	line "a house out in"
	cont "the country."

	para "Away from the"
	line "stress of towns"
	cont "and cities."

	para "But there's kid"
	line "trainers and wild"
	cont "#mon"
	cont "everywhere!"

	para "It's even more"
	line "stressful."

	para "But I've found"
	line "I forget all that"
	cont "if I eat enough"
	cont "Berries!"
	done

Route30BerrySpeechHouseTakeBerryText:
	text "Here, for being"
	line "so sympathetic you"
	cont "can have one!"

	para "They grow on"
	line "trees but it"
	cont "takes a day."

	para "I can't wait"
	line "that long!"
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1
