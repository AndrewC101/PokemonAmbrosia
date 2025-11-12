	object_const_def
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BEAUTY

VermilionMart_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

VermilionMartSuperNerdScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionMartSuperNerdText
.normal
	jumptextfaceplayer VermilionMartSuperNerdText

VermilionMartBeautyScript:
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer InvadedVermilionMartBeautyText
.normal
	jumptextfaceplayer VermilionMartBeautyText

VermilionMartSuperNerdText:
	text "I need lots of"
	line "POTIONS to get"
	cont "over my hang-"
	cont "over from the"
	cont "last SOLENOID"
	cont "concert."
	done

InvadedVermilionMartSuperNerdText:
	text "Of course an"
	line "ELECTRIC Gym on"
	cont "the coast would"
	cont "be a priority"
	cont "target!"

	para "Maybe I should"
	line "run for it!"
	done

VermilionMartBeautyText:
	text "A lady like me"
	line "doesn't belong in"
	cont "a backwater place"
	cont "like this."

	para "But the rent in"
	line "SAFFRON or"
	cont "CELADON is way"
	cont "too high."
	done

InvadedVermilionMartBeautyText:
	text "Their captain has"
	line "#mon especially"
	cont "for fighting"
	cont "ELECTRIC types."

	para "We are done for!"
	done

VermilionMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 5
	warp_event  3,  7, VERMILION_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionMartSuperNerdScript, -1
	object_event  8,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMartBeautyScript, -1
