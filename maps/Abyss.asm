    object_const_def
	const ABYSS_FIELDMON_1
    const ABYSS_FIELDMON_2
    const ABYSS_FIELDMON_3
    const ABYSS_FIELDMON_4
    const ABYSS_FIELDMON_5
    const ABYSS_FIELDMON_7
    const ABYSS_FIELDMON_8
    const ABYSS_FIELDMON_9
    const ABYSS_FIELDMON_10
    const ABYSS_AMBROSIA
    const ABYSS_GIRATINA
    const ABYSS_SAGE_1
    const ABYSS_SAGE_2
    const ABYSS_INVADER_1
    const ABYSS_INVADER_2
    const ABYSS_INVADER_3

Abyss_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .AbyssFieldMon
	callback MAPCALLBACK_TILES, .AbyssBarriers

.AbyssBarriers:
    checkevent EVENT_ABYSS_BRIDGE_1
    iftrue .checkSage2
    changeblock 44, 28, $88
    changeblock 42, 30, $0A
.checkSage2
    checkevent EVENT_ABYSS_BRIDGE_2
    iftrue .end
    changeblock 44, 26, $88
    changeblock 42, 30, $0A
.end
    endcallback

.AbyssFieldMon:
    appear ABYSS_FIELDMON_1
    appear ABYSS_FIELDMON_2
    appear ABYSS_FIELDMON_3
    appear ABYSS_FIELDMON_4
    appear ABYSS_FIELDMON_5
    appear ABYSS_FIELDMON_7
    appear ABYSS_FIELDMON_8
    appear ABYSS_FIELDMON_9
    appear ABYSS_FIELDMON_10

	setval WEATHER_NONE
	writemem wFieldWeather
    endcallback

AbyssFieldMon1Script:
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ABYSS_FIELDMON_1
	end

AbyssFieldMon2Script:
	cry SALAMENCE
	pause 15
	loadwildmon SALAMENCE, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ABYSS_FIELDMON_2
	end

AbyssFieldMon3Script:
	cry GARCHOMP
	pause 15
	loadwildmon GARCHOMP, 70
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ABYSS_FIELDMON_3
	end

AbyssFieldMon4Script:
	cry DARKRAI
	pause 15
	loadwildmon DARKRAI, 75
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ABYSS_FIELDMON_4
	end

AbyssFieldMon5Script:
	cry AEGISLASH
	pause 15
	loadwildmon AEGISLASH, 71
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ABYSS_FIELDMON_5
	end

AbyssFieldMon7Script:
	cry STEELIX
	pause 15
	loadwildmon STEELIX, 68
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ABYSS_FIELDMON_7
	end

AbyssFieldMon8Script:
	cry TYRANITAR
	pause 15
	loadwildmon TYRANITAR, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ABYSS_FIELDMON_8
	end

AbyssFieldMon9Script:
	cry SWAMPERT
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon SWAMPERT, 67
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_9
	disappear ABYSS_FIELDMON_9
	end

AbyssFieldMon10Script:
	cry GRENINJA
	pause 15
	loadwildmon GRENINJA, 69
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_10
	disappear ABYSS_FIELDMON_10
	end

InvaderLeeroyScript:
	trainer INVADER, LEEROY, EVENT_BEAT_INVADER_LEEROY, InvaderLeeroySeenText, InvaderLeeroyBeatenText, InvaderLeeroyVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderLeeroyAfterBattleText
	waitbutton
	closetext
	end

InvaderLeeroySeenText:
	text "Vagabond bereft of"
	line "light."
	para "Be swallow by the"
	line "dark."
	done

InvaderLeeroyVictoryText:
	text "Be cleansed,"
	line "putrid soul."
	done

InvaderLeeroyBeatenText:
	text "Forgive me"
	line "great one!"
	done

InvaderLeeroyAfterBattleText:
	text "The echos of the"
	line "ages will honor my"
	cont "name."
	cont "LEEROY!"
	done

InvaderVarreScript:
	trainer INVADER, VARRE, EVENT_BEAT_INVADER_VARRE, InvaderVarreSeenText, InvaderVarreBeatenText, InvaderVarreVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderVarreAfterBattleText
	waitbutton
	closetext
	end

InvaderVarreSeenText:
	text "You are"
	line "maidenless."
	para "You are fated it"
	line "seems, to die in"
	cont "obscurity."
	done

InvaderVarreVictoryText:
	text "You will die"
	line "nameless, without"
	cont "ceremony."
	done

InvaderVarreBeatenText:
	text "You are familiar"
	line "with grace."
	done

InvaderVarreAfterBattleText:
	text "You are not so"
	line "maidenless after"
	cont "all, my lambkin."
	para "The luminary"
	line "awaits."
	done

InvaderArtoriasScript:
	trainer INVADER, ARTORIAS, EVENT_BEAT_INVADER_ARTORIAS, InvaderArtoriasSeenText, InvaderArtoriasBeatenText, InvaderArtoriasVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderArtoriasAfterBattleText
	waitbutton
	closetext
	end

InvaderArtoriasSeenText:
    text "...."
	done

InvaderArtoriasVictoryText:
	text "...."
	done

InvaderArtoriasBeatenText:
	text "...."
	done

InvaderArtoriasAfterBattleText:
	text "Brave Knight..."
	para "I beseech thee..."
	para "Resist..."
	para "The Dark..."
	done

AbyssSageScript1:
    faceplayer
    opentext
    checkevent EVENT_ABYSS_BRIDGE_1
    iftrue .passed
    writetext AbyssSage1IntroText
    waitbutton
    writetext AbyssSage1Question
.AbyssSage1Menu
	loadmenu .AbyssSage1QuestionMenu
	_2dmenu
	closewindow
	ifequal 1, .fail
	ifequal 2, .fail
	ifequal 3, .pass
	sjump .AbyssSage1Menu
	closetext
	end
.AbyssSage1QuestionMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 7
	dw .AbyssSage1MenuData
	db 1 ; default option
.AbyssSage1MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 3, 1 ; rows, columns
	db 5 ; spacing
	dba .AbyssSage1MenuText
	dbw BANK(@), NULL
.AbyssSage1MenuText:
	db "Spell Tag@"
	db "Mark Of God@"
	db "Red Eye Orb@"
.fail
    writetext AbyssSageFailedText
    waitbutton
    closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
    warp ABYSS, 86, 2
    end
.pass
    writetext AbyssSagePassText
    waitbutton
    playsound SFX_STRENGTH
    changeblock 44, 28, $71
    setevent EVENT_ABYSS_BRIDGE_1
    checkevent EVENT_ABYSS_BRIDGE_2
    iffalse .reload
    changeblock 42, 30, $01
.reload
    reloadmap
    opentext
.passed
    writetext AbyssSage1PassedText
    waitbutton
    closetext
    end

AbyssSage1IntroText:
	text "The people of Alph"
	line "worship Arceus."
	para "But we believed"
	line "Arceus was the"
	cont "deciever and"
	cont "Giratina the true"
	cont "saviour."
	para "We separated and"
	line "formed our own"
	cont "kingdom."
	para "By the time we"
	line "realised we were"
	cont "wrong, it was too"
	cont "late."
	para "The red curse had"
	line "spread and in our"
	cont "madness we"
	cont "destroyed"
	cont "ourselves."
	para "I must ensure you"
	line "understand our"
	cont "mistake."
	para "I will ask a"
	line "question and if"
	cont "you fail I will"
	cont "remove you from"
	cont "this place."
	done

AbyssSage1Question:
	text "What bestows the"
	line "curse of Giratina?"
	done

AbyssSageFailedText:
    text "You are not yet"
    line "ready."
    done

AbyssSagePassText:
    text "Yes!"
    para "You understand."
    done

AbyssSage1PassedText:
	text "Giratina is the"
	line "bringer of the"
	cont "curse."
	para "The red glow that"
	line "turns brother"
	cont "against brother,"
	cont "mother against"
	cont "daughter."
	para "Bring an end to"
	line "our mistakes."
	done

AbyssSageScript2:
    faceplayer
    opentext
    checkevent EVENT_ABYSS_BRIDGE_2
    iftrue .passed
    writetext AbyssSage2IntroText
    waitbutton
    writetext AbyssSage2Question
.AbyssSage2Menu
	loadmenu .AbyssSage2QuestionMenu
	_2dmenu
	closewindow
	ifequal 1, .fail
	ifequal 2, .pass
	ifequal 3, .fail
	sjump .AbyssSage2Menu
	closetext
	end
.AbyssSage2QuestionMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 7
	dw .AbyssSage2MenuData
	db 1 ; default option
.AbyssSage2MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 3, 1 ; rows, columns
	db 5 ; spacing
	dba .AbyssSage2MenuText
	dbw BANK(@), NULL
.AbyssSage2MenuText:
	db "Light Ball@"
	db "Ambrosia@"
	db "Sacred Ash@"
.fail
    writetext AbyssSageFailedText
    waitbutton
    closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
    warp ABYSS, 4, 26
    end
.pass
    writetext AbyssSagePassText
    waitbutton
    playsound SFX_STRENGTH
    changeblock 44, 26, $71
    setevent EVENT_ABYSS_BRIDGE_2
    checkevent EVENT_ABYSS_BRIDGE_1
    iffalse .reload
    changeblock 42, 30, $01
.reload
    reloadmap
    opentext
.passed
    writetext AbyssSage2PassedText
    waitbutton
    closetext
    end

AbyssSage2IntroText:
	text "At first we didn't"
	line "know what was"
	cont "wrong with them."
	para "The people who"
	line "took on the red"
	cont "glow."
	para "The curse of"
	line "Giratina."
	para "We thought they"
	line "were sick and they"
	cont "played along."
	para "But once they"
	line "outnumbered us..."
	para "Even our bravest"
	line "warrior."
	para "ARTORIAS."
	para "Even he succumb."
	para "Only the blessing"
	line "of Arceus can"
	cont "purge the curse."
	para "I must question"
	line "you and if you"
	cont "fail..."
	para "You must leave"
	line "this place."
	done

AbyssSage2Question:
	text "What bestows the"
	line "blessing of"
	cont "Arceus?"
	done

AbyssSage2PassedText:
	text "Giratina would"
	line "have spread the"
	cont "curse and"
	cont "destroyed the"
	cont "world."
	para "But Atem the great"
	line "Pharaoh put an end"
	cont "to it."
	para "Perhaps you can do"
	line "the same."
	done

GiratinaScript:
	callasm IsArceusInParty
	iftrue .arceus
	callasm IsRayquazaInParty
	iffalse .noRayquaza
.rayquaza
    opentext
	writetext GiratinaPlayerHasRayquazaText
	sjump .battle
.arceus
	opentext
	writetext GiratinaPlayerHasArceusText
.battle
    waitbutton
	cry GIRATINA
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GIRATINA, 80
	startbattle
	reloadmapafterbattle
    setval GIRATINA
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_GIRATINA
	disappear ABYSS_GIRATINA
	end
.noRayquaza
    opentext
	writetext GiratinaIntroText
	waitbutton
	closetext
    end

GiratinaIntroText:
    text "I have waited"
    line "for you young"
    cont "lord."

    para "The darkness"
    line "embraces you"
    cont "as its saviour."

    para "Once I sat"
    line "warm and full"
    cont "in the hall of"
    cont "light."

    para "The place where"
    line "all that is came"
    cont "to be."

    para "Then the cruel"
    line "ruler banished"
    cont "me for daring"
    cont "to question his"
    cont "divine morality."

    para "We are all"
    line "fallen beings"
    cont "in his eyes."

    para "You poor humans"
    line "especially."

    para "You and only"
    line "you can save"
    cont "us all."

    para "Not far from"
    line "here lies the"
    cont "den of a great"
    cont "hieratic!"

    para "The Dragon Lord"
    line "they call him."

    para "If those poor"
    line "humans only"
    cont "knew..."

    para "He uses them!"

    para "Commands them to"
    line "raise for him an"
    cont "army of dragons."

    para "You must bring"
    line "him to me my"
    cont "dear disciple."

    para "Entrust thine"
    line "flesh and soul"
    cont "to me."

    para "Bring me"
    line "Rayquaza!"
    done

GiratinaPlayerHasArceusText:
	text "Impossible!"
	para "Salvation preserve"
	line "me!"
	para "Arceus!"
	para "Thine light doth"
	line "wither my petty"
	cont "temptations."
	para "Thine is the"
	line "kingdom."
	para "Deliver me from"
	line "evil!"
	done

GiratinaPlayerHasRayquazaText:
    text "Thou hast done"
    line "well..."

    para "My dear, dear"
    line "disciple."

    para "Arceus!"

    para "Watch and"
    line "mark you well."

    para "Your child shall"
    line "receive true"
    cont "love."

	para "I shall murder"
	line "your dear Rayquaza"
	cont "and spare him the"
	cont "torment I"
	cont "eternally endure."

    para "And you my"
    line "sweet disciple."

    para "Your devotion"
    line "shalt not go"
    cont "unrewarded."

    para "You can be part"
    line "of me forever."

    para "I shall devour"
    line "you."

    para "Slowly..."

    para "Lovingly..."

    para "RRAAUUOORR!"
    done

IsArceusInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp ARCEUS
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

IsRayquazaInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp RAYQUAZA
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

AbyssAmbrosia:
    itemball AMBROSIA

Abyss_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 25, ROUTE_44, 2
	warp_event  86, 1, DRAGONS_DEN_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  5, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon1Script, EVENT_FIELD_MON_1
	object_event 19, 11, SPRITE_SALAMENCE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon2Script, EVENT_FIELD_MON_2
	object_event 75,  4, SPRITE_GARCHOMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon3Script, EVENT_FIELD_MON_3
	object_event 39, 34, SPRITE_DARKRAI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon4Script, EVENT_FIELD_MON_4
	object_event 58,  7, SPRITE_AEGISLASH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon5Script, EVENT_FIELD_MON_5
	object_event 79, 18, SPRITE_STEELIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon7Script, EVENT_FIELD_MON_7
	object_event 61, 22, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon8Script, EVENT_FIELD_MON_8
	object_event 12, 22, SPRITE_SWAMPERT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon9Script, EVENT_FIELD_MON_9
	object_event 30, 23, SPRITE_GRENINJA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssFieldMon10Script, EVENT_FIELD_MON_10
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, AbyssAmbrosia, EVENT_ABYSS_AMBROSIA
	object_event 44,  9, SPRITE_GIRATINA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, GiratinaScript, EVENT_CAUGHT_GIRATINA
	object_event 48, 30, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssSageScript1, -1
	object_event 41, 30, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AbyssSageScript2, -1
	object_event 65, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderLeeroyScript, -1
	object_event 33,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderVarreScript, -1
	object_event 46, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderArtoriasScript, -1
