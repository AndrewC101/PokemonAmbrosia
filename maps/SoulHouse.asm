	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY
	const SOULHOUSE_POKEBALL

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "Welcome child."

	para "In this hallowed"
	line "place are laid"
	cont "to rest the souls"
	cont "of many a #mon."

	para "They were close"
	line "friends, and"
	cont "partners."

	para "A trainers"
	line "responsibility"
	cont "does not end"
	cont "with death."

	para "The best trainers"
	line "know this."

	para "I can tell you"
	line "will become the"
	cont "sort of trainer"
	cont "who understands."
	done

SoulHouseTeacherText:
	text "There are other"
	line "graves of #mon"
	cont "here."

	para "There is a"
	line "large graveyard"
	cont "only FUJI can"
	cont "grant access to."
	done

SoulHouseLassText:
	text "My grandmother"
	line "always gets very"
	cont "emotional when"
	cont "she comes here."

	para "I don't remember"
	line "BLISSEY but granny"
	cont "always talks about"
	cont "her."
	done

SoulHouseGrannyText:
	text "BLISSEY was"
	line "with me since"
	cont "I was a girl."

	para "She looked"
	line "after me, my"
	cont "daughter, and"
	cont "her daughter."

	para "It is the least"
	line "I can do to"
	cont "remember her"
	cont "everyday."

	para "Good bye my"
	line "friend."
	done

SpiritHouseBlockScript:
    checkevent EVENT_RESTORED_POWER_TO_KANTO
    iffalse .block
    end
.block
    turnobject SOULHOUSE_MRFUJI, RIGHT
	opentext
	writetext SoulHouseBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SoulHouseLeft
    turnobject SOULHOUSE_MRFUJI, DOWN
    end

Movement_SoulHouseLeft:
    step LEFT
    step_end

SoulHouseBlockText:
    text "MR FUJI: Excuse"
    line "me."

    para "That area is off"
    line "limits to the"
    cont "public."
    done

SoulHouseWiseGlasses:
	itemball SACRED_ASH

SoulHouseGengar:
    opentext
    writetext SoulHouseGengarText
    cry GENGAR
    waitbutton
    closetext
    end

SoulHouseGengarText:
    text "Gen..gar!"
    done

SoulHouseMismagius:
    opentext
    writetext SoulHouseMismagiusText
    cry MISMAGIUS
    waitbutton
    closetext
    end

SoulHouseMismagiusText:
    text "Mis."
    line "Magius."
    done

SoulHouseChandelure:
    opentext
    writetext SoulHouseChandelureText
    cry CHANDELURE
    waitbutton
    closetext
    end

SoulHouseChandelureText:
    text "Chandelure."
    done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	warp_event  9,  1, SOUL_HOUSE, 4
	warp_event 16,  5, SOUL_HOUSE, 3

	warp_event 29,  5, LAVENDER_FOREST, 1

	def_coord_events
	coord_event  8,  1, SCENE_ALWAYS, SpiritHouseBlockScript

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SoulHouseWiseGlasses, EVENT_SOUL_HOUSE_WISE_GLASSES
	object_event 22,  6, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, SoulHouseGengar, -1
	object_event  7,  5, SPRITE_MISMAGIUS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, SoulHouseMismagius, -1
	object_event  5,  4, SPRITE_CHANDELURE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SoulHouseChandelure, -1

