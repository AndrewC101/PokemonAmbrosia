	object_const_def
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FRUIT_TREE
    const ROUTE26_FIELDMON_1
    const ROUTE26_FIELDMON_2
    const ROUTE26_FIELDMON_3
    const ROUTE26_FIELDMON_4
    const ROUTE26_FIELDMON_5
    const ROUTE26_FIELDMON_6
    const ROUTE26_FIELDMON_7
    const ROUTE26_FIELDMON_8
    const ROUTE26_CRYSTAL

Route26_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route26FieldMon

.Route26FieldMon:
; Pokemon which always appear
    checkevent EVENT_BEAT_CRYSTAL_5
    iftrue .skipWeather
	setval WEATHER_NONE
	writemem wFieldWeather
.skipWeather
    disappear ROUTE26_CRYSTAL
    appear ROUTE26_FIELDMON_1
    appear ROUTE26_FIELDMON_3
    appear ROUTE26_FIELDMON_4
    appear ROUTE26_FIELDMON_5

; Pokemon that sometimes appear
    random 2
    ifequal 1, .spawn6
    disappear ROUTE26_FIELDMON_6
    sjump .mon7
.spawn6
    appear ROUTE26_FIELDMON_6

.mon7
    random 2
    ifequal 1, .spawn7
    disappear ROUTE26_FIELDMON_7
    sjump .mon8
.spawn7
    appear ROUTE26_FIELDMON_7

.mon8
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE26_FIELDMON_8
    sjump .checkNight
.spawn8
    appear ROUTE26_FIELDMON_8

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    random 2
    ifequal 1, .spawn2
    disappear ROUTE26_FIELDMON_2
    sjump .despawn
.spawn2
    appear ROUTE26_FIELDMON_2

.despawn
; Pokemon that don't appear at night
    disappear ROUTE26_FIELDMON_5

.end
    endcallback

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall .RegisteredNumber
	writetext GavenNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGaven3BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	writetext GavenNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext GavenRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext GavenRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

GavenNumberAcceptedText:
	text "If we work"
	line "together..."
	para "I'm sure we will"
	line "discover the"
	cont "secret."
	done

GavenRematchText:
    text "How about a"
    line "rematch?"
    done

GavenRematchRefuseText:
    text "Do what must"
    line "be done."
    done

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
	writetext BethNumberAcceptedText
	waitbutton
	closetext
	end

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	writetext BethNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext BethRematchText
	waitbutton
	yesorno
	iftrue .WantsBattle
	writetext BethRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

BethNumberAcceptedText:
	text "Let's battle again"
	line "sometime!"
	done

BethRematchText:
    text "How about a"
    line "rematch?"
    done

BethRematchRefuseText:
    text "I'll call you."
    done

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end

Route26Sign:
	jumptext Route26SignText

Route26FruitTree:
	fruittree FRUITTREE_ROUTE_26

CooltrainermJakeSeenText:
	text "Are your #MON"
	line "fully evolved?"
	para "That is your"
	line "mistake!"
	para "EVIOLITE is my"
	line "secret to victory."
	done

CooltrainermJakeBeatenText:
	text "Is evolution the"
	line "answer!?"
	done

CooltrainermJakeAfterBattleText:
	text "I hear CHANSEY and"
	line "PORYGON2 are the"
	cont "best users of"
	cont "EVIOLITE."
	para "But I don't know"
	line "how to find either"
	cont "of them."
	done

CooltrainermGaven3SeenText:
    text "LANCE is so cool!"

	para "LANCE is CHAMPION"
	line "of KANTO but he's"
	cont "acting CHAMPION"
	cont "of JOHTO until"
	cont "we can produce"
	cont "our own CHAMPION."

	para "For our national"
	line "dignity we must"
	cont "do this!"

	para "I..."

	para "will be CHAMPION!"
	done

CooltrainermGaven3BeatenText:
	text "You might be"
	line "the one!"
	done

CooltrainermGavenAfterText:
	text "To become CHAMPION"
	line "you will have to"
	cont "defeat LANCE."

	para "His strength is"
	line "infamous."

	para "I can't imagine"
	line "him losing to"
	cont "anyone."
	done

CooltrainerfJoyceSeenText:
	text "Everyone here is"
	line "going on and on"
	cont "about JOHTO having"
	cont "to get its own"
	cont "CHAMPION."

	para "All the patriotism"
	line "makes me uneasy."

	para "Don't tell anyone."

	para "But I'm actually"
	line "from KANTO!"
	done

CooltrainerfJoyceBeatenText:
	text "Glory to KANTO!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Promise me you"
	line "will use all"
	cont "your strength to"
	cont "protect my home."
	done

CooltrainerfBeth1SeenText:
	text "Beyond here is"
	line "VICTORY ROAD."

	para "It is the final"
	line "path to the"
	cont "ELITE FOUR."

	para "We all line up"
	line "nicely to get"
	cont "shipped off to"
	cont "war."

	para "It's always the"
	line "young who do"
	cont "the dying."

	para "A trainer named"
	line "<RIVAL> came"
	cont "past here."

	para "He was the"
	line "perfect little"
	cont "soldier."

	para "How about you?"
	done

CooltrainerfBeth1BeatenText:
	text "There is more"
	line "to you."
	done

CooltrainerfBethAfterText:
	text "#MON are not"
	line "tools of war."

	para "They are the"
	line "real victims."

	para "On both sides."
	done

PsychicRichardSeenText:
	text "Have you heard of"
	line "SABRINA?"

	para "She was a KANTO"
	line "GYM LEADER but"
	cont "is now an ELITE"
	cont "FOUR member."

	para "She is a powerful"
	line "PSYCHIC trainer."

	para "I have to meet"
	line "her!"

	para "That's all I"
	line "want."
	done

PsychicRichardBeatenText:
	text "NO!"
	para "My dear SABRINA"
	line "I'm sorry!"

	para "I was too weak!"

	para "She will never"
	line "accept me now."

	para "NO!"

	para "She can hear my"
	line "thoughts!"

	para "Be strong!"

	para "Good battle"
	line "trainer."

	para "I knew I would"
	line "lose."
	done

PsychicRichardAfterBattleText:
	text "That was close."

	para "Do you think she"
	line "fell for it?"
	done

Route26SignText:
	text "ROUTE 26"

	para "#MON LEAGUE"
	line "RECEPTION GATE"
	done

Route26FieldMon1Script:
	trainer STARAPTOR, FIELD_MON, EVENT_FIELD_MON_1, Route26PokemonAttacksText, 65, 0, .script
.script
    disappear ROUTE26_FIELDMON_1
    end

Route26FieldMon2Script:
	trainer ARCANINE, FIELD_MON, EVENT_FIELD_MON_2, Route26PokemonAttacksText, 67, 0, .script
.script
    disappear ROUTE26_FIELDMON_2
    end

Route26PokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

Route26FieldMon3Script:
	faceplayer
	cry SKARMORY
	pause 15
	loadwildmon SKARMORY, 51
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE26_FIELDMON_3
	end

Route26FieldMon4Script:
	faceplayer
	cry GALVANTULA
	pause 15
	loadwildmon GALVANTULA, 48
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE26_FIELDMON_4
	end

Route26FieldMon5Script:
	faceplayer
	cry EXEGGUTOR
	pause 15
	loadwildmon EXEGGUTOR, 48
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE26_FIELDMON_5
	end

Route26FieldMon6Script:
	faceplayer
	cry STARMIE
	pause 15
	loadwildmon STARMIE, 47
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE26_FIELDMON_6
	end

Route26FieldMon7Script:
	faceplayer
	cry BLISSEY
	pause 15
	loadwildmon BLISSEY, 49
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE26_FIELDMON_7
	end

Route26FieldMon8Script:
	faceplayer
	cry VOLCARONA
	pause 15
	loadwildmon VOLCARONA, 76
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE26_FIELDMON_8
	end
	
Route26CrystalScript:
    showemote EMOTE_SHOCK, PLAYER, 15
    turnobject PLAYER, DOWN
    playmusic MUSIC_CRYSTAL_ENCOUNTER
    appear ROUTE26_CRYSTAL
    applymovement ROUTE26_CRYSTAL, Route26Movement_CrystalApproaches

    opentext
    writetext Route26CrystalText_Intro
    waitbutton
    closetext

    special FadeOutMusic
    applymovement ROUTE26_CRYSTAL, Route26Movement_CrystalRight
    opentext
    writetext Route26CrystalText_Serious
    waitbutton
    closetext

    applymovement ROUTE26_CRYSTAL, Route26Movement_CrystalLeft
    playmusic MUSIC_INDIGO_PLATEAU
    opentext
    writetext Route26CrystalText_Battle
    waitbutton
    closetext

	winlosstext Crystal5LosesText, Crystal5WinsText
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CRYSTAL, CRYSTAL_5
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_5
	setmapscene ROUTE_26, SCENE_FINISHED

    playmusic MUSIC_INDIGO_PLATEAU
	opentext
	writetext Route26CrystalText_KeepItUp
	waitbutton
	closetext
	turnobject ROUTE26_CRYSTAL, DOWN
	pause 10
	opentext
	writetext Route26CrystalText_IMeanIt
	waitbutton
	closetext
	applymovement ROUTE26_CRYSTAL, Route26Movement_CrystalLeaves
	disappear ROUTE26_CRYSTAL
.end
	end

Route26Movement_CrystalApproaches:
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step UP
    step_end

Route26CrystalText_Intro:
    text "You are going to"
    line "challenge the"
    cont "ELITE FOUR."

    para "The final test."

    para "If you win you"
    line "earn the title of"
    cont "CHAMPION."

    para "Then you will"
    line "have to head to"
    cont "KANTO to fight"
    cont "in the war..."
    done

Route26CrystalText_Serious:
    text "It seems so long"
    line "ago we were"
    cont "leaving NEW"
    cont "BARK together."

    para "I didn't think"
    line "it would get this"
    cont "far."

    para "Now that we are"
    line "here..."

    para "I don't want to"
    line "go on."

    para "I don't want to"
    line "be on the front"
    cont "line against"
    cont "the HOENN army."

    para "I want us to"
    line "just have fun"
    cont "forever."

    para "But that can't"
    line "happen."
    done

Route26CrystalText_Battle:
    text "I guess we are"
    line "part of the big"
    cont "bad world now."

    para "You know what"
    line "we have to do."
    done

Crystal5LosesText:
    text "You win."
    done

Crystal5WinsText:
    text "Can we just"
    line "go home?"
    done

Route26CrystalText_KeepItUp:
    text "Well, it seems"
    line "you have won our"
    cont "race."

    para "I can't believe"
    line "how strong you"
    cont "have become."

    para "If anyone can"
    line "win the war,"
    cont "you can."

    para "And I'll be right"
    line "there with you!"

    para "I'm not letting"
    line "you go alone."

    para "But I need more"
    line "training first."

    para "Now you march in"
    line "there and wipe"
    cont "the floor with"
    cont "the ELITE FOUR."

    para "Good luck"
    line "<PLAYER>."
    done

Route26CrystalText_IMeanIt:
    text "I really mean"
    line "that."
    done

Route26Movement_CrystalLeaves:
    step DOWN
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

Route26Movement_CrystalRight:
    slow_step RIGHT
    step_end

Route26Movement_CrystalLeft:
    slow_step LEFT
    turn_head UP
    step_end

Route26_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events
	coord_event 7,  6, SCENE_DEFAULT, Route26CrystalScript

	def_bg_events
	bg_event  8,  6, BGEVENT_READ, Route26Sign

	def_object_events
	object_event 15, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event  9, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	object_event 10, 56, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event 10,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerPsychicRichard, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FruitTree, -1

	object_event  8, 51, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route26FieldMon1Script, EVENT_FIELD_MON_1
	object_event 15, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route26FieldMon2Script, EVENT_FIELD_MON_2
	object_event  6, 26, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26FieldMon3Script, EVENT_FIELD_MON_3
	object_event 15, 67, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route26FieldMon4Script, EVENT_FIELD_MON_4
	object_event  3, 95, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route26FieldMon5Script, EVENT_FIELD_MON_5
	object_event  9, 101, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26FieldMon6Script, EVENT_FIELD_MON_6
	object_event  7, 68, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route26FieldMon7Script, EVENT_FIELD_MON_7
	object_event 13, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route26FieldMon8Script, EVENT_FIELD_MON_8

	object_event 13,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1

	
