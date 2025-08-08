    object_const_def
    const ANCIENTRUINPRESENT_YVELTAL
    const ANCIENTRUINPRESENT_HENSHIN
    const ANCIENTRUINPRESENT_POKEBALL
    const ANCIENTRUINPRESENT_FIELDMON_1
    const ANCIENTRUINPRESENT_FIELDMON_2
    const ANCIENTRUINPRESENT_FIELDMON_3
    const ANCIENTRUINPRESENT_FIELDMON_4
    const ANCIENTRUINPRESENT_FIELDMON_5
    const ANCIENTRUINPRESENT_FIELDMON_6
    const ANCIENTRUINPRESENT_FIELDMON_7
    const ANCIENTRUINPRESENT_FIELDMON_8
    const ANCIENTRUINPRESENT_FIELDMON_9
    const ANCIENTRUINPRESENT_FIELDMON_10

AncientRuinPresent_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .FieldMonAndWeather

.FieldMonAndWeather:
	setval WEATHER_SANDSTORM
	writemem wFieldWeather
	appear ANCIENTRUINPRESENT_FIELDMON_1
	appear ANCIENTRUINPRESENT_FIELDMON_2
	appear ANCIENTRUINPRESENT_FIELDMON_3
	appear ANCIENTRUINPRESENT_FIELDMON_4
	appear ANCIENTRUINPRESENT_FIELDMON_5
	appear ANCIENTRUINPRESENT_FIELDMON_6
	appear ANCIENTRUINPRESENT_FIELDMON_7
	appear ANCIENTRUINPRESENT_FIELDMON_8
	appear ANCIENTRUINPRESENT_FIELDMON_9
	appear ANCIENTRUINPRESENT_FIELDMON_10
    endcallback

YveltalScript:
	cry YVELTAL
	pause 15

	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon YVELTAL, 80
	startbattle
	reloadmapafterbattle
    setval YVELTAL
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_YVELTAL
	disappear ANCIENTRUINPRESENT_YVELTAL
	end

YveltalCry:
    text "Nothing is more"
    line "valuable than"
    cont "time."

    para "You are young."

    para "You have a lot"
    line "of time left.."

    para "For a human."

    para "I shall take"
    line "every second"
    cont "from you."

    para "And add it to"
    line "my own!"
    done

HenshinScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_HENSHIN
	iftrue .FightDone
.fight
	writetext HenshinSeenText
	waitbutton
	closetext
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext HenshinBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SAGE, HENSHIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HENSHIN
	setmapscene ANCIENT_RUIN_PRESENT, SCENE_CUSTOM_1
	opentext
	writetext HenshinAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext HenshinAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextHenshin
	yesorno
	iftrue .fight
	writetext RematchRefuseTextHenshin
	waitbutton
	closetext
	end

HenshinSeenText:
    text "Foolish child!"

    para "The power of"
    line "death shall"
    cont "belong to"
    cont "HENSHIN!"
    done

HenshinBeatenText:
    text "NOOOOOOO!"
    done

HenshinAfterBattleText:
    text "It can not"
    line "be!!"

    para "I am destined"
    line "to wield death"
    cont "itself."
    done

RematchTextHenshin:
    text "One more"
    line "duel?"
    done

RematchRefuseTextHenshin:
    text "Wise choice."
    done

DialgaBlockScript:
    callasm IsDialgaInParty
    iffalse .block
    setmapscene ANCIENT_RUIN_PRESENT, SCENE_FINISHED
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext DialgaBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_AncientRuinsPresentTurnBack
    end

IsDialgaInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp DIALGA
	jr z, .found
	dec b
	jr z, .notFound
	jr .loop
.notFound
    xor a
    ld [wScriptVar], a
    ret
.found
    ld a, 1
    ld [wScriptVar], a
    ret

DialgaBlockText:
    text "Only the power of"
    line "the master of time"

    para "DIALGA!"

    para "Can activate this"
    line "doorway."
    done

Movement_AncientRuinsPresentTurnBack:
	step DOWN
	step_end

FightHenshinScript:
    checkevent EVENT_BEAT_HENSHIN
    iffalse .fight
    end
.fight
    turnobject PLAYER, RIGHT
    sjump HenshinScript

AncientRuinsPresentAmbrosia:
    itemball AMBROSIA

AncientRuinsPresentFieldMon1Script:
	trainer URSALUNA, FIELD_MON, EVENT_FIELD_MON_1, AncientRuinsPresentPokemonAttacksText, 62, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_1
    end

AncientRuinsPresentFieldMon2Script:
	trainer URSALUNA_B, FIELD_MON, EVENT_FIELD_MON_2, AncientRuinsPresentPokemonAttacksText, 61, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_2
    end

AncientRuinsPresentFieldMon3Script:
	trainer RHYPERIOR, FIELD_MON, EVENT_FIELD_MON_3, AncientRuinsPresentPokemonAttacksText, 72, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_3
    end

AncientRuinsPresentFieldMon4Script:
	trainer GENESECT, FIELD_MON, EVENT_FIELD_MON_4, AncientRuinsPresentPokemonAttacksText, 74, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_4
    end

AncientRuinsPresentFieldMon5Script:
	trainer KINGAMBIT, FIELD_MON, EVENT_FIELD_MON_5, AncientRuinsPresentPokemonAttacksText, 71, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_5
    end

AncientRuinsPresentFieldMon6Script:
	trainer HONCHKROW, FIELD_MON, EVENT_FIELD_MON_6, AncientRuinsPresentPokemonAttacksText, 72, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_6
    end

AncientRuinsPresentFieldMon7Script:
	trainer GARCHOMP, FIELD_MON, EVENT_FIELD_MON_7, AncientRuinsPresentPokemonAttacksText, 75, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_7
    end

AncientRuinsPresentFieldMon8Script:
	trainer METAGROSS, FIELD_MON, EVENT_FIELD_MON_8, AncientRuinsPresentPokemonAttacksText, 75, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_8
    end

AncientRuinsPresentFieldMon9Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_9, AncientRuinsPresentPokemonAttacksText, 75, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_9
    end

AncientRuinsPresentFieldMon10Script:
	trainer DARKRAI, FIELD_MON, EVENT_FIELD_MON_10, AncientRuinsPresentPokemonAttacksText, 80, 0, .script
.script
    disappear ANCIENTRUINPRESENT_FIELDMON_10
    end

AncientRuinsPresentPokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

AncientRuinPresent_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event   5, 5, RUINS_OF_ALPH_OUTSIDE, 12
	warp_event  33, 5, SPROUT_TOWER_B1F, 1
	warp_event 19,  5, ANCIENT_RUIN_PAST, 1

	def_coord_events
	coord_event 19, 6, SCENE_CUSTOM_1, DialgaBlockScript
	coord_event 20, 22, SCENE_DEFAULT, FightHenshinScript

	def_bg_events

	def_object_events
	object_event 19,  9, SPRITE_LUGIA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, YveltalScript, EVENT_CAUGHT_YVELTAL
	object_event 21, 22, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, HenshinScript, -1
	object_event 26, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, AncientRuinsPresentAmbrosia, EVENT_ANCIENT_RUINS_PRESENT_AMBROSIA
	object_event 36, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon1Script, EVENT_FIELD_MON_1
	object_event 33, 17, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon2Script, EVENT_FIELD_MON_2
	object_event  5, 22, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon3Script, EVENT_FIELD_MON_3
	object_event 32, 34, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon4Script, EVENT_FIELD_MON_4
	object_event  6, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon5Script, EVENT_FIELD_MON_5
	object_event  3, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon6Script, EVENT_FIELD_MON_6
	object_event 34, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon7Script, EVENT_FIELD_MON_7
	object_event  6, 31, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon8Script, EVENT_FIELD_MON_8
	object_event 17, 33, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon9Script, EVENT_FIELD_MON_9
	object_event 20, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, AncientRuinsPresentFieldMon10Script, EVENT_FIELD_MON_10
