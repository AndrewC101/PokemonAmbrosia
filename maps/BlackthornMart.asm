	object_const_def
	const BLACKTHORNMART_CLERK
	const BLACKTHORNMART_COOLTRAINER_M
	const BLACKTHORNMART_BLACK_BELT

BlackthornMart_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

BlackthornMartCooltrainerMScript:
	jumptextfaceplayer BlackthornMartCooltrainerMText

BlackthornMartBlackBeltScript:
	jumptextfaceplayer BlackthornMartBlackBeltText

BlackthornMartCooltrainerMText:
	text "I wish I could"
	line "use MAX POTION in"
	cont "GYM battles!"

	para "DRAGON type is"
	line "weak to ICE."

	para "But CLAIR has"
	line "some #MON"
	cont "that aren't"
	cont "DRAGON type."

	para "She is so smart!"

	para "DRAGONS are"
	line "also weak to"
	cont "FAIRY and DRAGON"
	cont "but I don't have"
	cont "any of those."
	done

BlackthornMartBlackBeltText:
	text "I need more"
	line "#MON."

	para "But should I"
	line "buy a small"
	cont "number of"
	cont "ULTRA BALLS"
	cont "or loads of"
	cont "#BALLS?"

	para "Or maybe a"
	line "moderate number of"
	cont "GREAT BALLS."
	done

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 5
	warp_event  3,  7, BLACKTHORN_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartCooltrainerMScript, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornMartBlackBeltScript, -1
