	object_const_def
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText_ReturnedMachinePart
	waitbutton
	closetext
	end

CopycatsHouse1FBlisseyScript:
	opentext
	writetext CopycatsHouse1FBlisseyText
	cry BLISSEY
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "I invested a lot"
	line "of money in some"
	cont "old con man from"
	cont "VERMILION running"
	cont "a pyramid scheme."

	para "I was an early"
	line "investor so I"
	cont "made a lot of"
	cont "money from it."

	para "Some poor folk"
	line "from PEWTER lost"
	cont "everything they"
	cont "had though."

	para "Which wasn't very"
	line "much I'm sure."
	done

CopycatsHouse1FPokefanFText:
	text "More foreigners"
	line "just wandering"
	cont "about the streets"
	cont "and into peoples"
	cont "houses."

	para "What is this city"
	line "coming to."
	done

CopycatsHouse1FPokefanFText_ReturnedMachinePart:
	text "Oh! Oh my!"

	para "You are"
	line "CHAMPION <PLAYER>."

	para "The hero that"
	line "saved us all!"

	para "Please sit down!"

	para "I must get out"
	line "the fine china!"

	para "I'll whip up a"
	line "finger buffet."

	para "Oh my!"
	done

CopycatsHouse1FBlisseyText:
	text "BLISSEY: Bliisii!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FBlisseyScript, -1
