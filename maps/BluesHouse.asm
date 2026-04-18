	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	writetext DaisyOfferLevelDownText
	nooryes
	iffalse .Refused
	writetext DaisyReallySureText
	nooryes
	iffalse .Refused
	special HealParty
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	reloadmap
	opentext
	writetext DaisyLevelDownDoneText
	waitbutton
	closetext
	end
.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

DaisyOfferLevelDownText:
	text "Is that a wrinkle"
	line "I see under your"
	cont "eye!"
	para "This is life's"
	line "ultimate cruelty."
	para "It offers us a"
	line "taste of youth and"
	cont "vitality, and then"
	cont "it makes us"
	cont "witness our own"
	cont "decay."
	para "But I can make"
	line "your #mon"
	cont "young again."
	para "Shall I reduce one"
	line "of your #mon"
	cont "to level to 5?"
	done

DaisyReallySureText:
	text "Are you really"
	line "sure?"
	para "Reduce a #mon"
	line "to level 5?"
	done

DaisyWhichMonText:
	text "Who shall receive"
	line "my gift?"
	done

DaisyLevelDownDoneText:
	text "Now a warning."
	para "Your #mon is"
	line "now very weak."
	para "You must look"
	line "after your"
	cont "#mon and enjoy"
	cont "their friendship"
	cont "forever."
	done

DaisyRefusedText:
	text "Who wants to live"
	line "forever?"
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
