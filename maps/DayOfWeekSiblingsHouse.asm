	object_const_def
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "There's something"
	line "written here."

	para "Read it?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "We had a loving"
	line "family."

	para "Mother and father"
	line "cared deeply for"
	cont "all of us."

	para "It was difficult"
	line "for us all."

	para "But for the"
	line "greater good"
	cont "they had to die."

	para "We will search"
	line "the world for the"
	cont "purest of souls."

	para "So that we might"
	line "make a divine"
	cont "offering to the"
	cont "one true GOD."

	para "Hail GIRATINA."

	para "Keep reading?"
	done

DayOfWeekSiblingsHousePokedexText3:
    text "We have nothing"
    line "to hide."

    para "Join us."

	para "Monday, Monica"
	line "Route 40"

	para "Tuesday, Tuscany"
	line "Route 29"

	para "Wednesday, Wesley"
	line "Lake of Rage"

	para "Thursday, Arthur"
	line "Route 36"

	para "Friday, Frieda"
	line "Route 32"

	para "Saturday, Santos"
	line "Blackthorn City"

	para "Sunday, Sunny"
	line "Route 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
