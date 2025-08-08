	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4
	const ROUTE17_FIELDMON_1
    const ROUTE17_FIELDMON_2
    const ROUTE17_FIELDMON_3
    const ROUTE17_FIELDMON_4
    const ROUTE17_FIELDMON_5
    const ROUTE17_FIELDMON_6
    const ROUTE17_FIELDMON_7
    const ROUTE17_FIELDMON_8

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
    appear ROUTE17_FIELDMON_1
    appear ROUTE17_FIELDMON_2
    appear ROUTE17_FIELDMON_3
    appear ROUTE17_FIELDMON_4
    appear ROUTE17_FIELDMON_5
    appear ROUTE17_FIELDMON_6
    appear ROUTE17_FIELDMON_7
    appear ROUTE17_FIELDMON_8

	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

Route17FieldMon1Script:
	trainer LOPUNNY, FIELD_MON, EVENT_FIELD_MON_1, Route17PokemonAttacksText, 60, 0, .script
.script
    disappear ROUTE17_FIELDMON_1
    end

Route17FieldMon2Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_2, Route17PokemonAttacksText, 61, 0, .script
.script
    disappear ROUTE17_FIELDMON_2
    end

Route17FieldMon3Script:
	trainer MACHAMP, FIELD_MON, EVENT_FIELD_MON_3, Route17PokemonAttacksText, 62, 0, .script
.script
    disappear ROUTE17_FIELDMON_3
    end

Route17FieldMon4Script:
	trainer CONKELDURR, FIELD_MON, EVENT_FIELD_MON_4, Route17PokemonAttacksText, 62, 0, .script
.script
    disappear ROUTE17_FIELDMON_4
    end

Route17FieldMon5Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_5, Route17PokemonAttacksText, 63, 0, .script
.script
    disappear ROUTE17_FIELDMON_5
    end

Route17FieldMon6Script:
	trainer HONCHKROW, FIELD_MON, EVENT_FIELD_MON_6, Route17PokemonAttacksText, 64, 0, .script
.script
    disappear ROUTE17_FIELDMON_6
    end

Route17FieldMon7Script:
	trainer ARCANINE, FIELD_MON, EVENT_FIELD_MON_7, Route17PokemonAttacksText, 65, 0, .script
.script
    disappear ROUTE17_FIELDMON_7
    end

Route17PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route17FieldMon8Script:
	faceplayer
	cry CHARIZARD
	pause 15
	loadwildmon CHARIZARD, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE17_FIELDMON_8
	end

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Hey there kid."

	para "Ah another"
	line "JOHTO tourist!"

	para "You have to pay"
	line "a fee to continue."

	para "Really."

	para "Give me your"
	line "wallet!"
	done

BikerRileyBeatenText:
	text "Ok, ok. You"
	line "can go free."
	done

BikerRileyAfterBattleText:
	text "Route 17 is the"
	line "best route!"

	para "Far better than"
	line "Route 8."
	done

BikerJoelSeenText:
	text "We have a beef"
	line "with the Route 8"
	cont "Bikers."

	para "We are the most"
	line "ruthless and"
	cont "mighty of all"
	cont "Bikers!"

	para "We aren't afraid"
	line "of little girls."
	done

BikerJoelBeatenText:
	text "You are a real"
	line "badass!"
	done

BikerJoelAfterBattleText:
	text "Every year there"
	line "are fewer and"
	cont "fewer bikers on"
	cont "this road."
	done

BikerGlennSeenText:
	text "You are a tough"
	line "trainer!"

	para "And you have a"
	line "nice bike."

	para "You must join"
	line "the brotherhood"
	cont "of bikers!"

	para "It is a"
	line "challenging and"
	cont "promising career."
	done

BikerGlennBeatenText:
	text "It's one and"
	line "all for one."
	done

BikerGlennAfterBattleText:
	text "You know what"
	line "you wouldn't make"
	cont "a good biker."

	para "You are just too"
	line "clean looking."

	para "Makes me sick."
	done

BikerCharlesSeenText:
	text "I heard big bad"
	line "ZEKE, the leader"
	cont "of the Route 8"
	cont "bikers..."

	para "Is literally"
	line "afraid of a"
	cont "little girl!"

	para "Hahahaha..."

	para "Oh... ha...."

	para "Now I am the"
	line "undisputed most"
	cont "powerful biker"
	cont "in all KANTO!"
	done

BikerCharlesBeatenText:
	text "I guess you"
	line "are the best"
	cont "trainer on a"
	cont "bike."
	done

BikerCharlesAfterBattleText:
    text "I can always make"
    line "myself feel happy."
    cont "I just need to"
    cont "think about poor"
	cont "wee ZEKE!"

	para "Little girls sure"
	line "are scary!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  5, 76, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerCharles, -1
	object_event  9, 35, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon1Script, EVENT_FIELD_MON_1
	object_event  8, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon2Script, EVENT_FIELD_MON_2
	object_event 17, 35, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon3Script, EVENT_FIELD_MON_3
	object_event  2, 35, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon4Script, EVENT_FIELD_MON_4
	object_event  2, 56, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon5Script, EVENT_FIELD_MON_5
	object_event 16, 59, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon6Script, EVENT_FIELD_MON_6
	object_event  9, 78, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, Route17FieldMon7Script, EVENT_FIELD_MON_7
	object_event 11, 82, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route17FieldMon8Script, EVENT_FIELD_MON_8
