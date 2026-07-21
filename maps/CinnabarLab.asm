object_const_def
	const CINNABARLAB_GENESECT
	const CINNABARLAB_FIELDMON_1
	const CINNABARLAB_FIELDMON_2
	const CINNABARLAB_FIELDMON_3
	const CINNABARLAB_FIELDMON_4
	const CINNABARLAB_FIELDMON_5
	const CINNABARLAB_FIELDMON_6
	const CINNABARLAB_FIELDMON_7
	const CINNABARLAB_FIELDMON_8
	const CINNABARLAB_FIELDMON_9
	const CINNABARLAB_FIELDMON_10
	const CINNABARLAB_SCIENTIST
	const CINNABARLAB_HOLOGRAM_MEWTWO

CinnabarLab_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CinnabarLabFieldMonCallback
	callback MAPCALLBACK_TILES, CinnabarLabBarrierCallback

CinnabarLabFieldMonCallback:
	appear CINNABARLAB_FIELDMON_1
	appear CINNABARLAB_FIELDMON_2
	appear CINNABARLAB_FIELDMON_3
	appear CINNABARLAB_FIELDMON_4
	appear CINNABARLAB_FIELDMON_5
	appear CINNABARLAB_FIELDMON_6
	appear CINNABARLAB_FIELDMON_7
	appear CINNABARLAB_FIELDMON_8
	appear CINNABARLAB_FIELDMON_9
	appear CINNABARLAB_FIELDMON_10
	disappear CINNABARLAB_HOLOGRAM_MEWTWO
	endcallback

CinnabarLabBarrierCallback:
	; Event set means the override is disabled, so leave the original $07 block.
	checkevent EVENT_CINNABAR_LAB_BARRIER_1_DISABLED
	iftrue .check_barrier_2
	changeblock 20, 16, $20

.check_barrier_2
	checkevent EVENT_CINNABAR_LAB_BARRIER_2_DISABLED
	iftrue .done
	changeblock 62, 16, $20

.done
	endcallback

CinnabarLabBarrier1Switch:
	opentext
	writetext CinnabarLabBarrierOverrideText
	yesorno
	iffalse .done
	closetext
	checkevent EVENT_CINNABAR_LAB_BARRIER_1_DISABLED
	iftrue .enable_override
	setevent EVENT_CINNABAR_LAB_BARRIER_1_DISABLED
	changeblock 20, 16, $07
	refreshmap
	end

.enable_override
	clearevent EVENT_CINNABAR_LAB_BARRIER_1_DISABLED
	changeblock 20, 16, $20
	refreshmap
	end

.done
	closetext
	end

CinnabarLabBarrier2Switch:
	opentext
	writetext CinnabarLabBarrierOverrideText
	yesorno
	iffalse .done
	closetext
	checkevent EVENT_CINNABAR_LAB_BARRIER_2_DISABLED
	iftrue .enable_override
	setevent EVENT_CINNABAR_LAB_BARRIER_2_DISABLED
	changeblock 62, 16, $07
	refreshmap
	end

.enable_override
	clearevent EVENT_CINNABAR_LAB_BARRIER_2_DISABLED
	changeblock 62, 16, $20
	refreshmap
	end

.done
	closetext
	end

CinnabarLabBarrierOverrideText:
	text "Barrier override."
	line "Push it?"
	done

CinnabarLabPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

CinnabarLabFieldMon1Script:
	trainer WEEZING, FIELD_MON, EVENT_FIELD_MON_1, CinnabarLabPokemonAttacksText, 57, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_1
	end

CinnabarLabFieldMon2Script:
	trainer ARBOK, FIELD_MON, EVENT_FIELD_MON_2, CinnabarLabPokemonAttacksText, 58, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_2
	end

CinnabarLabFieldMon3Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_3, CinnabarLabPokemonAttacksText, 60, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_3
	end

CinnabarLabFieldMon4Script:
	trainer CHANDELURE, FIELD_MON, EVENT_FIELD_MON_4, CinnabarLabPokemonAttacksText, 63, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_4
	end

CinnabarLabFieldMon5Script:
	trainer NINETALES, FIELD_MON, EVENT_FIELD_MON_5, CinnabarLabPokemonAttacksText, 64, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_5
	end

CinnabarLabFieldMon6Script:
	trainer RAPIDASH, FIELD_MON, EVENT_FIELD_MON_6, CinnabarLabPokemonAttacksText, 62, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_6
	end

CinnabarLabFieldMon7Script:
	trainer ARCANINE, FIELD_MON, EVENT_FIELD_MON_7, CinnabarLabPokemonAttacksText, 64, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_7
	end

CinnabarLabFieldMon8Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_8, CinnabarLabPokemonAttacksText, 64, 0, .script
.script
	disappear CINNABARLAB_FIELDMON_8
	end

CinnabarLabFieldMon9Script:
	faceplayer
	cry DITTO
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon DITTO, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear CINNABARLAB_FIELDMON_9
	end

CinnabarLabFieldMon10Script:
	faceplayer
	cry MAGMORTAR
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon MAGMORTAR, 150
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear CINNABARLAB_FIELDMON_10
	end

CinnabarLabPlaceholderEvent1:
	jumptext CinnabarLabPlaceholderText1

CinnabarLabPlaceholderEvent2:
	jumptext CinnabarLabPlaceholderText2

CinnabarLabPlaceholderEvent3:
	jumptext CinnabarLabPlaceholderText3

CinnabarLabPlaceholderEvent4:
	jumptext CinnabarLabPlaceholderText4

CinnabarLabHologramEvent:
	opentext
	writetext CinnabarLabHologramPromptText
	yesorno
	iffalse .done
	closetext
	special FadeOutMusic
	pause 15
	turnobject PLAYER, RIGHT
	special FadeOutToWhite
	appear CINNABARLAB_HOLOGRAM_MEWTWO
	playsound SFX_FLASH
	waitsfx
	special FadeInFromWhite
	opentext
	writetext CinnabarLabHologramMessageText
	waitbutton
	closetext
	special FadeOutToWhite
	disappear CINNABARLAB_HOLOGRAM_MEWTWO
	playsound SFX_FLASH
	waitsfx
	special FadeInFromWhite
	special RestartMapMusic
	end

.done
	closetext
	end

CinnabarLabScientistScript:
	faceplayer
	checkevent EVENT_GOT_CINNABAR_LAB_DITTO
	iftrue .after
	opentext
	writetext CinnabarLabScientistBeforeText
	waitbutton
	checkitem GIFT_OF_GOD
	iffalse .end
	checkitem MARK_OF_GOD
	iffalse .end
	checkitem HAND_OF_GOD
	iffalse .end
	readvar VAR_DEXCAUGHT
	ifless 253, .end
	closetext
	opentext
	writetext CinnabarLabScientistDittoText
	waitbutton
    writetext GotDittoText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke DITTO, 255
	setevent EVENT_GOT_CINNABAR_LAB_DITTO
.end
    closetext
    end

.after
	opentext
	writetext CinnabarLabScientistAfterText
	waitbutton
	closetext
	end

CinnabarLabGenesectScript:
	cry GENESECT
	pause 15
	checkevent EVENT_BEAT_CLAIR
	iffalse .level50
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .level60
	checkevent EVENT_BEAT_WALLACE
	iffalse .level70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GENESECT, 80
	sjump .begin
.level70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GENESECT, 70
	sjump .begin
.level60
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GENESECT, 60
	sjump .begin
.level50
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GENESECT, 50
.begin
	startbattle
	reloadmapafterbattle
	setval GENESECT
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_CAUGHT_GENESECT
	disappear CINNABARLAB_GENESECT
	end

CinnabarLabPlaceholderText1:
	text "Epiphyseal Fusion"
	line "occurred today."
	para "Mewtwo is fully"
	line "grown."
	para "Dr Fuji is too"
	line "engrossed in his"
	cont "work to recognise"
	cont "the reality."
	para "What waits in that"
	line "tank is not a"
	cont "normal creature."
	para "It is a weapon"
	line "with power and"
	cont "intellect far"
	cont "beyond its"
	cont "creators."
	para "No doubt Giovanni"
	line "won't be here when"
	cont "we open the tank."
	done

CinnabarLabPlaceholderText2:
	text "It's a monster!"
	para "It broke out of"
	line "the tank and"
	cont "immediately"
	cont "started destroying"
	cont "everything and"
	cont "everyone."
	para "What have we"
	line "unleashed on the"
	cont "world!"
	para "We dreamt of"
	line "creating the"
	cont "strongest"
	cont "#mon..."
	para "And we succeeded."
	done

CinnabarLabPlaceholderText3:
	text "We all notice"
	line "it..."
	para "How he talks to"
	line "the picture of his"
	cont "dead daughter"
	cont "Amber."
	para "We all know what"
	line "Dr Fuji wants from"
	cont "this reasearch."
	para "It is not right."
	done

CinnabarLabPlaceholderText4:
	text "Just like before"
	line "the neural"
	cont "cellular division"
	cont "cascaded."
	para "We lost all"
	line "auxiliary"
	cont "specimens..."
	para "Including Amber."
	para "But the primary"
	line "specimen not only"
	cont "survived."
	para "Its neuron"
	line "density saw"
	cont "exponential"
	cont "growth."
	para "A great result for"
	line "Giovanni."
	para "But a tragic loss"
	line "for Dr Fuji."
	done

CinnabarLabHologramPromptText:
	text "A holographic"
	line "recording."

	para "Watch it?"
	done

CinnabarLabHologramMessageText:
	text "I was too young,"
	line "too reckless."
	para "I knew what I was"
	line "doing."
	para "But I didn't"
	line "understand what it"
	cont "really meant."
	para "I never got to"
	line "know you."
	para "I didn't give you"
	line "a change to try."
	para "I promise..."
	para "I will not waste"
	line "the gift you all"
	cont "gave me."
	done

CinnabarLabScientistBeforeText:
	text "Dr Fuji fired me"
	line "when my ideas were"
	cont "deemed too"
	cont "radical."
	para "They all got what"
	line "was coming to"
	cont "them."
	para "While they worked"
	line "on their little"
	cont "magic kitty I was"
	cont "doing real"
	cont "research."
	para "I will share it"
	line "with one who"
	cont "harbors an equal"
	cont "desire to shatter"
	cont "the limits of"
	cont "reality."
	para "Show the all the"
	line "following!"
	para "Gift Of God"
	para "Mark Of God"
	para "Hand Of God"
	para "A #dex with"
	line "253 caught"
	cont "#mon"
	para "That won't take"
	line "long..."
	para "Heh heh heh heh!"
	done

CinnabarLabScientistDittoText:
	text "Yes very good!"
	para "Very good indeed!"
	para "You are a kindred"
	line "spirit."
	para "Through you, my"
	line "research shall"
	cont "bring ruin upon"
	cont "the world."
	para "Hahaha hahaha!"
	para "Behold!"
	para "My lifes work."
	done

CinnabarLabScientistAfterText:
	text "You are a kindred"
	line "spirit."
	para "Through you, my"
	line "research shall"
	cont "bring ruin upon"
	cont "the world."
	para "Hahaha hahaha!"
	done

GotDittoText:
    text "Received Ditto!"
    done

CinnabarLabTMToxic:
	itemball TM_TOXIC

CinnabarLabTMHyperBeam:
	itemball TM_HYPER_BEAM

CinnabarLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26, 27, CINNABAR_ISLAND, 2
	warp_event 27, 27, CINNABAR_ISLAND, 2
	warp_event 23, 22, CINNABAR_LAB, 4
	warp_event 59, 22, CINNABAR_LAB, 3

	def_coord_events

	def_bg_events
	bg_event  2,  4, BGEVENT_READ, CinnabarLabBarrier1Switch
	bg_event  3,  4, BGEVENT_READ, CinnabarLabBarrier1Switch
	bg_event 52, 21, BGEVENT_READ, CinnabarLabPlaceholderEvent1
	bg_event 40,  5, BGEVENT_READ, CinnabarLabPlaceholderEvent2
	bg_event 24,  9, BGEVENT_READ, CinnabarLabPlaceholderEvent3
	bg_event  6,  5, BGEVENT_READ, CinnabarLabPlaceholderEvent4
	bg_event 47,  2, BGEVENT_READ, CinnabarLabHologramEvent
	bg_event 54, 24, BGEVENT_READ, CinnabarLabBarrier2Switch
	bg_event 55, 24, BGEVENT_READ, CinnabarLabBarrier2Switch

	def_object_events
	object_event 40, 12, SPRITE_GENESECT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarLabGenesectScript, EVENT_CAUGHT_GENESECT
	object_event 25, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon1Script, EVENT_FIELD_MON_1
	object_event 17,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon2Script, EVENT_FIELD_MON_2
	object_event  6, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon3Script, EVENT_FIELD_MON_3
	object_event 20, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon4Script, EVENT_FIELD_MON_4
	object_event  4,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon5Script, EVENT_FIELD_MON_5
	object_event 62, 23, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon6Script, EVENT_FIELD_MON_6
	object_event 53, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon7Script, EVENT_FIELD_MON_7
	object_event 52, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CinnabarLabFieldMon8Script, EVENT_FIELD_MON_8
	object_event  2, 17, SPRITE_DITTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, CinnabarLabFieldMon9Script, EVENT_FIELD_MON_9
	object_event 60,  5, SPRITE_MAGMAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, CinnabarLabFieldMon10Script, EVENT_FIELD_MON_10
	object_event 61,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarLabScientistScript, -1
	object_event 50,  3, SPRITE_MEWTWO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event  8, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, CinnabarLabTMToxic, EVENT_CINNABAR_LAB_TM_TOXIC
	object_event 41,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, CinnabarLabTMHyperBeam, EVENT_CINNABAR_LAB_TM_HYPER_BEAM
