	object_const_def
	const ROUTE42_FISHER
	const ROUTE42_POKEFAN_M
	const ROUTE42_SUPER_NERD
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3
	const ROUTE42_POKE_BALL1
	const ROUTE42_POKE_BALL2
	const ROUTE42_SUICUNE
	const ROUTE42_FIELDMON_1
    const ROUTE42_FIELDMON_2
    const ROUTE42_FIELDMON_3
    const ROUTE42_FIELDMON_4
    const ROUTE42_FIELDMON_5
    const ROUTE42_FIELDMON_6

Route42_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE42_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE42_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route42FieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.Route42FieldMon:
; Pokemon which always appear
    appear ROUTE42_FIELDMON_1
    appear ROUTE42_FIELDMON_3
    appear ROUTE42_FIELDMON_4
    appear ROUTE42_FIELDMON_5

; Pokemon that sometimes appear
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE42_FIELDMON_6
    sjump .checkNight
.spawn8
    appear ROUTE42_FIELDMON_6

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    appear ROUTE42_FIELDMON_2

; Pokemon that don't appear at night
    disappear ROUTE42_FIELDMON_4

.end
    endcallback

Route42SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement ROUTE42_SUICUNE, Route42SuicuneMovement
	disappear ROUTE42_SUICUNE
	pause 10
	setscene SCENE_ROUTE42_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_SUICUNE
	end

TrainerFisherTully:
	trainer FISHER, TULLY1, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherTullyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end

Route42Sign1:
	jumptext Route42Sign1Text

MtMortarSign1:
	jumptext MtMortarSign1Text

MtMortarSign2:
	jumptext MtMortarSign2Text

Route42Sign2:
	jumptext Route42Sign2Text

Route42UltraBall:
	itemball SUN_STONE

Route42SuperPotion:
	itemball EVIOLITE

Route42FruitTree1:
	fruittree FRUITTREE_ROUTE_42_1

Route42FruitTree2:
	fruittree FRUITTREE_ROUTE_42_2

Route42FruitTree3:
	fruittree FRUITTREE_ROUTE_42_3

Route42HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROUTE_42_HIDDEN_MAX_POTION

Route42SuicuneMovement:
	set_sliding
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

FisherTullySeenText:
	text "Weather is an"
	line "important part"
	cont "of battle."

	para "Let the weather"
	line "wars begin!"
	done

FisherTullyBeatenText:
	text "It can't rain"
	line "everyday."
	done

FisherTullyAfterBattleText:
	text "I need to build"
	line "a team of"
	cont "#mon around"
	cont "my weather to"
	cont "really get the"
	cont "best of it."
	done

HikerBenjaminSeenText:
	text "I'm trying to"
	line "map out this cave."

	para "This is the"
	line "largest cave in"
	cont "all of Johto."

	para "It is easy to"
	line "get lost in"
	cont "here."

	para "Of course there"
	line "are trainers who"
	cont "take their life"
	cont "in their hands"
	cont "by exploring."

	para "I can't let you"
	line "do that."
	done

HikerBenjaminBeatenText:
	text "Ok ok go on!"
	done

HikerBenjaminAfterBattleText:
	text "I hear there are"
	line "areas of the cave"
	cont "you can only get"
	cont "to with a special"
	cont "Water #mon"
	cont "move."
	done

PokemaniacShaneSeenText:
	text "My #mon are"
	line "bros who don't"
	cont "take no lip from"
	cont "any fool!"
	done

PokemaniacShaneBeatenText:
	text "You wut m8!"
	done

PokemaniacShaneAfterBattleText:
	text "Ok I'm acting"
	line "tough so people"
	cont "don't bother me."

	para "Now go away."
	done

Route42Sign1Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"
	done

MtMortarSign1Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "inside"
	done

MtMortarSign2Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "inside"
	done

Route42Sign2Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"
	done

Route42FieldMon1Script:
	trainer MAGMORTAR, FIELD_MON, EVENT_FIELD_MON_1, Route42PokemonAttacksText, 42, 0, .script
.script
    disappear ROUTE42_FIELDMON_1
    end

Route42FieldMon2Script:
	trainer WEAVILE, FIELD_MON, EVENT_FIELD_MON_2, Route42PokemonAttacksText, 41, 0, .script
.script
    disappear ROUTE42_FIELDMON_2
    end

Route42PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route42FieldMon3Script:
	faceplayer
	cry SNOVER
	pause 15
	loadwildmon SNOVER, 31
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE42_FIELDMON_3
	end

Route42FieldMon4Script:
	faceplayer
	cry SCOLIPEDE
	pause 15
	loadwildmon SCOLIPEDE, 33
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE42_FIELDMON_4
	end

Route42FieldMon5Script:
	faceplayer
	cry HAWLUCHA
	pause 15
	loadwildmon HAWLUCHA, 34
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE42_FIELDMON_5
	end

Route42FieldMon6Script:
	faceplayer
	cry MAGMAR
	pause 15
	loadwildmon MAGMAR, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE42_FIELDMON_6
	end

Route42_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
	warp_event 10,  5, MOUNT_MORTAR_1F_OUTSIDE, 1
	warp_event 28, 13, MOUNT_MORTAR_1F_OUTSIDE, 2
	warp_event 46,  7, MOUNT_MORTAR_1F_OUTSIDE, 3

	def_coord_events
	coord_event 28, 14, SCENE_ROUTE42_SUICUNE, Route42SuicuneScript
	coord_event 26, 14, SCENE_ROUTE42_SUICUNE, Route42SuicuneScript

	def_bg_events
	bg_event  4, 10, BGEVENT_READ, Route42Sign1
	bg_event  7,  5, BGEVENT_READ, MtMortarSign1
	bg_event 45,  9, BGEVENT_READ, MtMortarSign2
	bg_event 54,  8, BGEVENT_READ, Route42Sign2
	bg_event 16, 11, BGEVENT_ITEM, Route42HiddenMaxPotion

	def_object_events
	object_event 40, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 48,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerBenjamin, -1
	object_event 51,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
	object_event 27, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree1, -1
	object_event 28, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree2, -1
	object_event 29, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree3, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42UltraBall, EVENT_ROUTE_42_ULTRA_BALL
	object_event 33,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42SuperPotion, EVENT_ROUTE_42_SUPER_POTION
	object_event 26, 16, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_42

	object_event 48, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route42FieldMon1Script, EVENT_FIELD_MON_1
	object_event 53,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route42FieldMon2Script, EVENT_FIELD_MON_2
	object_event 6,  12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route42FieldMon3Script, EVENT_FIELD_MON_3
	object_event 22,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42FieldMon4Script, EVENT_FIELD_MON_4
	object_event 38,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route42FieldMon5Script, EVENT_FIELD_MON_5
	object_event 5,  6, SPRITE_MAGMAR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route42FieldMon6Script, EVENT_FIELD_MON_6
