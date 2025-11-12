	object_const_def
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_BOULDER
	const MOUNTMORTARB1F_KIYO
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5
	const MOUNTMORTARB1F_FIELDMON_1
    const MOUNTMORTARB1F_FIELDMON_2
    const MOUNTMORTARB1F_FIELDMON_3
    const MOUNTMORTARB1F_FIELDMON_4

MountMortarB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MountMortarB1FFieldMon

.MountMortarB1FFieldMon:
; Pokemon which always appear
    appear MOUNTMORTARB1F_FIELDMON_1
    appear MOUNTMORTARB1F_FIELDMON_2
    appear MOUNTMORTARB1F_FIELDMON_3
    appear MOUNTMORTARB1F_FIELDMON_4
    endcallback

MountMortarB1FFieldMon1Script:
	trainer MAGMORTAR, FIELD_MON, EVENT_FIELD_MON_1, MountMortarB1FPokemonAttacksText, 62, 0, .script
.script
    disappear MOUNTMORTARB1F_FIELDMON_1
    end

MountMortarB1FFieldMon2Script:
	trainer ELECTIVIRE, FIELD_MON, EVENT_FIELD_MON_2, MountMortarB1FPokemonAttacksText, 62, 0, .script
.script
    disappear MOUNTMORTARB1F_FIELDMON_2
    end

MountMortarB1FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

MountMortarB1FFieldMon3Script:
	faceplayer
	cry POLIWRATH
	pause 15
	loadwildmon POLIWRATH, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear MOUNTMORTARB1F_FIELDMON_3
	end

MountMortarB1FFieldMon4Script:
	faceplayer
	cry METAGROSS
	pause 15
	loadwildmon METAGROSS, 76
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear MOUNTMORTARB1F_FIELDMON_4
	end

MountMortarB1FKiyoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LUCARIO_FROM_KIYO
	iftrue .GotLucario
	checkevent EVENT_BEAT_BLACKBELT_KIYO
	iftrue .BeatKiyo
	writetext MountMortarB1FKiyoIntroText
	waitbutton
	closetext
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLACKBELT_KIYO
	opentext
.BeatKiyo:
	writetext MountMortarB1FLucarioRewardText
	promptbutton
    readvar VAR_PARTYCOUNT
    ifequal PARTY_LENGTH, .noRoom
	waitsfx
	writetext MountMortarB1FReceiveMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke LUCARIO, 60
	setevent EVENT_GOT_LUCARIO_FROM_KIYO
.GotLucario:
	writetext MountMortarB1FKiyoGotLucarioText
	waitbutton
	closetext
	end
.noRoom
    writetext MountMortarB1FNoRoom
    waitbutton
    closetext
    end

MountMortarB1FNoRoom:
    text "You must make"
    line "room for this."
    done

MountMortarB1FBoulder:
	jumpstd StrengthBoulderScript

MountMortarB1FHyperPotion:
	itemball MAX_ELIXER

MountMortarB1FCarbos:
	itemball CHOICE_BAND

MountMortarB1FFullRestore:
	itemball HP_UP

MountMortarB1FMaxEther:
	itemball MAX_REVIVE

MountMortarB1FPPUp:
	itemball PP_MAX

MountMortarB1FHiddenMaxRevive:
	hiddenitem EXPERT_BELT, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

MountMortarB1FKiyoIntroText:
	text "I have purged"
	line "my soul of all"
	cont "the connections"
	cont "that tied it"
	cont "down."

	para "Anger toward"
	line "SABRINA."

	para "Anger toward"
	line "GIOVANNI."

	para "Anger toward"
	line "myself."

	para "Love of SAFFRON."

	para "Love of myself."

	para "But there is"
	line "one love that"
	cont "remains."

	para "Love of battle."

	para "It is a chain"
	line "this old master"
	cont "can never break."
	done

MountMortarB1FKiyoWinText:
	text "Break the chain."
	done

MountMortarB1FLucarioRewardText:
	text "I lost the battle."

	para "But have won the"
	line "struggle within."

	para "My pride is gone."

	para "I am pure."

	para "Take this fragment"
	line "of my soul."
	done

MountMortarB1FReceiveMonText:
	text "<PLAYER> received"
	line "LUCARIO."
	done

MountMortarB1FKiyoGotLucarioText:
	text "My mind is clear."

	para "Unshrouded by"
	line "pride, or anger"
	cont "or love."

	para "I am the KARATE"
	line "Master."

	para "And it's time"
	line "of my return."

	para "Thank you."

	para "Now I just need"
	line "to find my way"
	cont "out of here."
	done

MountMortarB1FKiyoFullPartyText:
	text "You have no room"
	line "in your party!"
	done

MountMortarB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM, MountMortarB1FHiddenMaxRevive

	def_object_events
	object_event 35, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FHyperPotion, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FCarbos, EVENT_MOUNT_MORTAR_B1F_CARBOS
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FBoulder, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FFullRestore, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	object_event 32,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FMaxEther, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	object_event 28, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP
	object_event 30, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortarB1FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  2, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, MountMortarB1FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 33,  5, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MountMortarB1FFieldMon3Script, EVENT_FIELD_MON_3
	object_event  5,  2, SPRITE_METAGROSS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MountMortarB1FFieldMon4Script, EVENT_FIELD_MON_4
