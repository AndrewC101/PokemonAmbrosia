    object_const_def
    const ANCIENTRUINPAST_XERNEAS
    const ANCIENTRUINPAST_FIELDMON_1
    const ANCIENTRUINPAST_FIELDMON_2
    const ANCIENTRUINPAST_FIELDMON_3
    const ANCIENTRUINPAST_FIELDMON_4
    const ANCIENTRUINPAST_FIELDMON_5
    const ANCIENTRUINPAST_FIELDMON_6
    const ANCIENTRUINPAST_FIELDMON_7
    const ANCIENTRUINPAST_FIELDMON_8

AncientRuinPast_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .WeatherAndFieldMon

.WeatherAndFieldMon:
	setval WEATHER_SUN
	writemem wFieldWeather
    appear ANCIENTRUINPAST_FIELDMON_1
    appear ANCIENTRUINPAST_FIELDMON_2
    appear ANCIENTRUINPAST_FIELDMON_3
    appear ANCIENTRUINPAST_FIELDMON_4
    appear ANCIENTRUINPAST_FIELDMON_5
    appear ANCIENTRUINPAST_FIELDMON_6
    appear ANCIENTRUINPAST_FIELDMON_7
    appear ANCIENTRUINPAST_FIELDMON_8
    endcallback

XerneasScript:
	cry XERNEAS
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon XERNEAS, 80
	startbattle
	reloadmapafterbattle
    setval XERNEAS
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_XERNEAS
	disappear ANCIENTRUINPAST_XERNEAS
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	end

XerneasCry:
    text "You do not"
    line "seek life"
    cont "eternal?"

    para "You are content"
    line "that you will"
    cont "cease to exist?"

    para "You say life"
    line "would have no"
    cont "beauty otherwise!"

    para "You seek the"
    line "power to defend"
    cont "life."

    para "Dear child..."

    para "You have found"
    line "such power."
    done

AncientRuinPastFieldMon1Script:
	faceplayer
	cry REUNICLUS
	pause 15
	loadwildmon REUNICLUS, 62
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear ANCIENTRUINPAST_FIELDMON_1
	end

AncientRuinPastFieldMon2Script:
	faceplayer
	cry SNORLAX
	pause 15
	loadwildmon SNORLAX, 76
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ANCIENTRUINPAST_FIELDMON_2
	end

AncientRuinPastFieldMon3Script:
	faceplayer
	cry SIGILYPH
	pause 15
	loadwildmon SIGILYPH, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ANCIENTRUINPAST_FIELDMON_3
	end

AncientRuinPastFieldMon4Script:
	faceplayer
	cry LUCARIO
	pause 15
	loadwildmon LUCARIO, 64
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ANCIENTRUINPAST_FIELDMON_4
	end

AncientRuinPastFieldMon5Script:
	faceplayer
	cry VENUSAUR
	pause 15
	loadwildmon VENUSAUR, 65
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ANCIENTRUINPAST_FIELDMON_5
	end

AncientRuinPastFieldMon6Script:
	faceplayer
	cry CHARIZARD
	pause 15
	loadwildmon CHARIZARD, 65
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ANCIENTRUINPAST_FIELDMON_6
	end

AncientRuinPastFieldMon7Script:
	faceplayer
	cry BLASTOISE
	pause 15
	loadwildmon BLASTOISE, 65
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ANCIENTRUINPAST_FIELDMON_7
	end

AncientRuinPastFieldMon8Script:
	faceplayer
	cry MEW
	pause 15
	loadwildmon MEW, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ANCIENTRUINPAST_FIELDMON_8
	end

AncientRuinsPastAmbrosia:
    itemball AMBROSIA

AncientRuinsPastGuy1Script:
	jumptextfaceplayer AncientRuinsPastGuy1Text

AncientRuinsPastGuy2Script:
	jumptextfaceplayer AncientRuinsPastGuy2Text

AncientRuinsPastGirl1Script:
	jumptextfaceplayer AncientRuinsPastGirl1Text

AncientRuinsPastGirl2Script:
	faceplayer
	opentext
	writetext AncientRuinsPastGirl2Text
	waitbutton
	closetext
	playsound SFX_FULL_HEAL
	special HealParty
	end

AncientRuinsPastGuy1Text:
    text "Welcome young"
    line "traveler to our"
    cont "great city."

    para "Those are some"
    line "very odd clothes"
    cont "you are wearing."

    para "I see you are"
    line "a trainer."

    para "Well don't get"
    line "any ideas of"
    cont "causing trouble."

    para "It won't end well"
    line "for you."

    para "PHARAOH ATEM is"
    line "unbeatable."
    done

AncientRuinsPastGuy2Text:
    text "I teach at our"
    line "university."

    para "I study ancient"
    line "cultures."

    para "In a recent trip"
    line "to ALPH I found"
    cont "an ancient text"
    cont "that described a"
    cont "god like being."

    para "A man made of"
    line "gold who wields"
    cont "ARCEUS itself."

    para "He notion that"
    line "a trainer could"
    cont "command ARCEUS"
    cont "is heresy."
    done

AncientRuinsPastGirl1Text:
    text "Are you another"
    line "outsider seeking"
    cont "to live in our"
    cont "paradise."

    para "If you talk to"
    line "our PHAROAH I'm"
    cont "sure he will"
    cont "help you."

    para "SETO tried to"
    line "overthrow ATEM"
    cont "years ago and"
    cont "was soundly"
    cont "defeated."

    para "But ATEM showed"
    line "mercy and"
    cont "forgave him."
    done

AncientRuinsPastGirl2Text:
    text "We live in peace"
    line "with #mon"
    cont "in this city."

    para "We worship the"
    line "great merciful"
    cont "XERNEAS."

    para "We revile the"
    line "evil YVELTAL."

    para "I shall bestow"
    line "our blessing upon"
    cont "your #mon."
    done

YamiScript:
	faceplayer
    checkevent EVENT_CAUGHT_XERNEAS
    iffalse .catchXerneasFirst
	opentext
	checkevent EVENT_BEAT_YAMI
	iftrue .FightDone
.fight
	writetext YamiSeenText
	waitbutton
	closetext
	winlosstext YamiBeatenText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ASH, ATEM
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_YAMI
	opentext
	writetext YamiAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext YamiAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextYami
	nooryes
	iftrue .fight
	writetext RematchRefuseTextYami
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext AtemWinAfterBattleText
    waitbutton
    closetext
    end
.catchXerneasFirst
    opentext
	writetext CatchXerneasFirstText
	waitbutton
	closetext
	end

AtemWinAfterBattleText:
	text "Remember this and"
	line "use what you have"
	cont "learnt."
	done

YamiSeenText:
    text "XERNEAS has chosen"
    line "you!"

    para "It gives me hope"
    line "to know someone"
    cont "from so far in"
    cont "future can have"
    cont "such virtue."

    para "XERNEAS offered"
    line "to me the great"
    cont "gift of life"
    cont "unending."

    para "But I want no"
    line "such thing."

    para "Here I am the"
    line "great Pharaoh"
    cont "ATEM."

    para "In your time I"
    line "just another"
    cont "person long since"
    cont "passed."

    para "I will give one"
    line "one last gift."

    para "A duel with a"
    line "#mon Master!"
    done

YamiBeatenText:
    text "The future"
    line "is bright."
    done

YamiAfterBattleText:
    text "XERNEAS brings"
    line "life."

    para "YVELTAL brings"
    line "death."

    para "But one is not"
    line "good and the"
    cont "other evil."

    para "If either is"
    line "left unchallenged"
    cont "it would bring"
    cont "chaos."

    para "There must be"
    line "balance."

    para "ZYGARDE brings"
    line "balance."

    para "ZYGARDE can be"
    line "found deep"
    cont "within a cave."

    para "A cave sitting"
    line "below a SILVER"
    cont "mountain."

    para "Return now to"
    line "your time and"
    cont "shape your future"
    cont "as I have shaped"
    cont "mine."
    done

CatchXerneasFirstText:
    text "You are not"
    line "from this time."

    para "I am ATEM."

    para "The great PHARAOH"

    para "I know what you"
    line "are here for."

    para "XERNEAS"

    para "The power to live"
    line "forever."

    para "Many have sought"
    line "such a blessing."

    para "XERNEAS shall"
    line "judge you."
    done

RematchTextYami:
    text "How about another"
    line "duel?"
    done

RematchRefuseTextYami:
    text "Go shape"
    line "your story."
    done

ArceusOldStatueScript:
    opentext
    writetext arceusOldStatueText
    waitbutton
    closetext
    end

arceusOldStatueText:
	text "A golden statue of"
	line "ARCEUS the"
	cont "creator."
	para "There is an"
	line "inscription."
	para "Existence"
	line "coverages upon a"
	cont "singularity of"
	cont "perfection."
	para "A gift from"
	line "ARCEUS."
	para "The gift of"
	line "AMBROSIA."
	done

AncientRuinPast_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event   5, 5, ANCIENT_RUIN_PRESENT, 3
	warp_event  33, 5, ANCIENT_RUIN_PRESENT, 3
	warp_event  19, 3, RUINS_OF_ALPH_OUTSIDE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 19, 9, SPRITE_XERNEAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, XerneasScript, EVENT_CAUGHT_XERNEAS
	object_event 31, 31, SPRITE_REUNICLUS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon1Script, EVENT_FIELD_MON_1
	object_event 36, 10, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon2Script, EVENT_FIELD_MON_2
	object_event  3, 10, SPRITE_SIGILYPH, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon3Script, EVENT_FIELD_MON_3
	object_event  8, 31, SPRITE_LUCARIO, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon4Script, EVENT_FIELD_MON_4
	object_event 36, 20, SPRITE_VENUSAUR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon5Script, EVENT_FIELD_MON_5
	object_event  3, 20, SPRITE_CHARIZARD, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon6Script, EVENT_FIELD_MON_6
	object_event 14, 20, SPRITE_BLASTOISE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon7Script, EVENT_FIELD_MON_7
	object_event 20, 34, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AncientRuinPastFieldMon8Script, EVENT_FIELD_MON_8
	object_event 19,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AncientRuinsPastAmbrosia, EVENT_ANCIENT_RUINS_PAST_AMBROSIA
	object_event  6, 26, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AncientRuinsPastGuy1Script, -1
	object_event 27, 30, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AncientRuinsPastGuy2Script, -1
	object_event 13, 33, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AncientRuinsPastGirl1Script, -1
	object_event 25, 35, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AncientRuinsPastGirl2Script, -1
	object_event 19, 18, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YamiScript, -1
	object_event 20, 4, SPRITE_ARCEUS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ArceusOldStatueScript, -1
