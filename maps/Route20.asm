	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY
	const ROUTE20_FIELDMON_1
    const ROUTE20_FIELDMON_2
    const ROUTE20_FIELDMON_3
    const ROUTE20_FIELDMON_4
    const ROUTE20_FIELDMON_5
    const ROUTE20_FIELDMON_6
    const ROUTE20_FIELDMON_7
    const ROUTE20_FIELDMON_8

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRocks

.ClearRocks:
    appear ROUTE20_FIELDMON_1
    appear ROUTE20_FIELDMON_2
    appear ROUTE20_FIELDMON_3
    appear ROUTE20_FIELDMON_4
    appear ROUTE20_FIELDMON_5
    appear ROUTE20_FIELDMON_6

    random 3
    ifequal 1, .spawn6
    disappear ROUTE20_FIELDMON_7
    sjump .mon7
.spawn6
    appear ROUTE20_FIELDMON_7

.mon7
    random 3
    ifequal 1, .spawn7
    disappear ROUTE20_FIELDMON_8
    sjump .rocks
.spawn7
    appear ROUTE20_FIELDMON_8

.rocks
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

Route20FieldMon1Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_1, Route20PokemonAttacksText, 71, 0, .script
.script
    disappear ROUTE20_FIELDMON_1
    end

Route20FieldMon2Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_2, Route20PokemonAttacksText, 74, 0, .script
.script
    disappear ROUTE20_FIELDMON_2
    end

Route20FieldMon3Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_3, Route20PokemonAttacksText, 71, 0, .script
.script
    disappear ROUTE20_FIELDMON_3
    end

Route20FieldMon4Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_4, Route20PokemonAttacksText, 72, 0, .script
.script
    disappear ROUTE20_FIELDMON_4
    end

Route20FieldMon5Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_5, Route20PokemonAttacksText, 74, 0, .script
.script
    disappear ROUTE20_FIELDMON_5
    end

Route20FieldMon6Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_6, Route20PokemonAttacksText, 73, 0, .script
.script
    disappear ROUTE20_FIELDMON_6
    end

Route20PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route20FieldMon7Script:
	faceplayer
	cry CLOYSTER
	pause 15
	loadwildmon CLOYSTER, 62
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE20_FIELDMON_7
	end

Route20FieldMon8Script:
	faceplayer
	cry DRACOVISH
	pause 15
	loadwildmon DRACOVISH, 50
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE20_FIELDMON_8
	end

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "I thought the fire"
	line "GYM LEADER would"
	cont "be weakened by"
	cont "living in a sea"
	cont "cave."
	para "But he is stronger"
	line "than ever!"
	para "I couldn't beat"
	line "him so there's no"
	cont "way you can."
	done

SwimmerfNicoleBeatenText:
	text "You're on fire"
	line "today!"
	done

SwimmerfNicoleAfterBattleText:
	text "I can't beat you"
	line "in a battle but I"
	cont "could beat you in"
	cont "a swimming"
	cont "contest."
	done

SwimmerfLoriSeenText:
	text "This is the only"
	line "place I feel like"
	cont "I belong."
	para "Everybody dislikes"
	line "me because I'm"
	cont "from HOENN."
	done

SwimmerfLoriBeatenText:
	text "Thank you for"
	line "the battle."
	done

SwimmerfLoriAfterBattleText:
	text "I actually really"
	line "miss HOENN."
	para "It's a beautiful"
	line "place."
	para "Just ruled by"
	line "horrible people."
	done

SwimmermCameronSeenText:
	text "I have totally"
	line "overestimated my"
	cont "swimming ability."
	para "I think I'm"
	line "drowning!"
	para "But there's still"
	line "time for a battle!"
	done

SwimmermCameronBeatenText:
	text "Cough cough..."
	line "Huuuu!"
	done

SwimmermCameronAfterBattleText:
	text "Don't worry about"
	line "me."
	para "Cough cough..."
	para "I'm going to swim"
	line "all the way to"
	cont "JOHTO!"
	done

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done
	
CinnabarGymBlockScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext CinnabarGymBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_CinnabarGymTurnBack
    end

CinnabarGymBlockText:
    text "The door is"
    line "locked."

    para "This GYM is only"
    line "accepting CHAMPION"
    cont "level challengers"
    cont "at this time."
    done

Movement_CinnabarGymTurnBack:
	step DOWN
	step_end

Route20ElementCaveBlockScript:
    checkevent EVENT_BEAT_WALLACE
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext Route20ElementCaveBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_CinnabarGymTurnBack
    end

Route20ElementCaveBlockText:
    text "The cave entrance"
    line "is blocked by"
    cont "rocks for now."
    done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1
	warp_event 30,  5, ELEMENT_CAVE, 2

	def_coord_events
	coord_event 38, 8, SCENE_ALWAYS, CinnabarGymBlockScript
	coord_event 30, 6, SCENE_ALWAYS, Route20ElementCaveBlockScript

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 31, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 51, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 13, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 20, 15, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon1Script, EVENT_FIELD_MON_1
	object_event 19,  4, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon2Script, EVENT_FIELD_MON_2
	object_event 54,  6, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon3Script, EVENT_FIELD_MON_3
	object_event  6,  5, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon4Script, EVENT_FIELD_MON_4
	object_event  4, 14, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon5Script, EVENT_FIELD_MON_5
	object_event 54, 15, SPRITE_SURF, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route20FieldMon6Script, EVENT_FIELD_MON_6
	object_event 51,  3, SPRITE_SURF, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route20FieldMon7Script, EVENT_FIELD_MON_7
	object_event 18, 10, SPRITE_SURF, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route20FieldMon8Script, EVENT_FIELD_MON_8
