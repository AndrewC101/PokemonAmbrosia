	object_const_def
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Emy:
	faceplayer
	opentext
	writetext snorlaxTradeText
	waitbutton
	trade NPC_TRADE_EMY
	waitbutton
	closetext
	end

snorlaxTradeText:
	text "Have you ever seen"
	line "Charizard tears?"
	para "They are boiling"
	line "hot."
	para "I didn't believe"
	line "it at first."
	para "Even a dragon may"
	line "cry."
	done

EmysHouseBookshelf:
	jumpstd MagazineBookshelfScript

BlackthornEmysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, EmysHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, EmysHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
