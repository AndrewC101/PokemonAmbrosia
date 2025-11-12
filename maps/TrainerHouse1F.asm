	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "You are not"
	line "military personnel"
	cont "but you can go"
	cont "ahead."

	para "They're just"
	line "arguing like"
	cont "children anyway."
	done

TrainerHouse1FCooltrainerMText:
	text "We must take the"
	line "fight to them!"

	para "Release a hoard"
	line "of TENTACOOL into"
	cont "their water supply"
	cont "and slowly poison"
	cont "their population."

	para "Then sell them"
	line "an addictive drug"
	cont "as an antidote."

	para "When we have them"
	line "hooked they will"
	cont "be our slaves!"
	done

TrainerHouse1FCooltrainerFText:
	text "We must focus"
	line "on what we have"
	cont "in common."

	para "Let's have a"
	line "Hoenn appreciation"
	cont "day where we"
	cont "celebrate their"
	cont "culture."

	para "We can criminalise"
	line "Hoenn criticism."

	para "That would convey"
	line "solidarity with"
	cont "our Hoenn friends."
	done

TrainerHouse1FYoungsterText:
	text "We should build"
	line "a wall all around"
	cont "the shore line."

	para "We have lots of"
	line "FLYING #mon"
	cont "we could train"
	cont "to drop bombs"
	cont "on the enemy"
	cont "fleets."

	para "We must fortify"
	line "our position."
	done

TrainerHouse1FGentlemanText:
	text "Hello everyone"

	para "...."

	para "Welcome to this"
	line "meeting of..."

	para "Uh...."

	para "Yes the war room!"

	para "...."

	para "Let's have some"
	line "tea."

	para "Oh and those"
	line "little cakes too."
	done

TrainerHouseSign1Text:
	text "To know your"
	line "enemy you must"
	cont "become your enemy."
	done

TrainerHouseSign2Text:
	text "Until death itself"
	line "comes no calamity"
	cont "need be feared."
	done

TrainerHouseIllegibleText:
	text "There is something"
	line "written here."

	para "If you lot don't"
	line "start coming up"
	cont "with some ideas"
	cont "that aren't"
	cont "absolute trash"
	cont "I'll disband this"
	cont "little tea party."

	para "Sincerely,"
	line "BLUE."
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
