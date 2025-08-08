	object_const_def
	const UNIONCAVEB2F_ROCKER
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS
	const UNIONCAVEB2F_FIELDMON_1
	const UNIONCAVEB2F_FIELDMON_2
	const UNIONCAVEB2F_FIELDMON_3
	const UNIONCAVEB2F_FIELDMON_4

UnionCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .UnionCaveB2FFieldMon
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iffalse .Appear
	disappear UNIONCAVEB2F_LAPRAS
	endcallback

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	endcallback
	
.UnionCaveB2FFieldMon:
    appear UNIONCAVEB2F_FIELDMON_4
    appear UNIONCAVEB2F_FIELDMON_2
    appear UNIONCAVEB2F_FIELDMON_3

    random 3
    ifequal 1, .spawn
    disappear UNIONCAVEB2F_FIELDMON_1
    sjump .end
.spawn
    appear UNIONCAVEB2F_FIELDMON_1
.end
    endcallback

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfEmmaAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

CooltrainermNickSeenText:
	text "I came here with"
	line "my girlfriend."

	para "But I'm meant"
	line "to meet with"
	cont "someone..."

	para "else..."

	para "Have you seen"
	line "her?"
	done

CooltrainermNickBeatenText:
	text "Shh, keep quiet."
	done

CooltrainermNickAfterBattleText:
	text "I thought this"
	line "place would be"
	cont "isolated."

	para "But my girlfriend"
	line "insisted on"
	cont "coming along."
	done

CooltrainerfGwenSeenText:
	text "I came here with"
	line "my boyfriend."

	para "He thinks he can"
	line "sneak away from"
	cont "me in here."

	para "I know she is"
	line "here!"
	done

CooltrainerfGwenBeatenText:
	text "I will find"
	line "them!"
	done

CooltrainerfGwenAfterBattleText:
	text "I'm sure he is"
	line "meeting her here."

	para "When I find her."

	para "I will kill her."
	done

CooltrainerfEmmaSeenText:
	text "Hey have you seen"
	line "a guy in here?"

	para "I saw him come"
	line "in with..."

	para "Another."

	para "She will kill me!"
	done

CooltrainerfEmmaBeatenText:
	text "Be quiet."
	done

CooltrainerfEmmaAfterBattleText:
	text "It would be"
	line "easier to let"
	cont "these #mon"
	cont "eat me."

	para "Than to face her."
	done
	
UnionCaveB2FFieldMon1Script:
	trainer MILOTIC, FIELD_MON, EVENT_FIELD_MON_1, UnionCaveB2FPokemonAttacksText, 53, 0, .script
.script
    disappear UNIONCAVEB2F_FIELDMON_1
    end
    
UnionCaveB2FFieldMon2Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_2, UnionCaveB2FPokemonAttacksText, 41, 0, .script
.script
    disappear UNIONCAVEB2F_FIELDMON_2
    end
    
UnionCaveB2FPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
UnionCaveB2FFieldMon3Script:
	faceplayer
	cry GABITE
	pause 15
	loadwildmon GABITE, 36
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear UNIONCAVEB2F_FIELDMON_3
    end
	
UnionCaveB2FFieldMon4Script:
	faceplayer
	cry GIBLE
	pause 15
	loadwildmon STEELIX, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear UNIONCAVEB2F_FIELDMON_4
    end

UnionCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, UNION_CAVE_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfEmma, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	object_event 12, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	object_event 11, 31, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
	
	object_event 15, 29, SPRITE_SURF, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCaveB2FFieldMon1Script, EVENT_FIELD_MON_1
   	object_event  9, 32, SPRITE_SURF, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, UnionCaveB2FFieldMon2Script, EVENT_FIELD_MON_2
   	object_event  8, 4, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveB2FFieldMon3Script, EVENT_FIELD_MON_3
   	object_event  2, 26, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, UnionCaveB2FFieldMon4Script, EVENT_FIELD_MON_4
