	object_const_def
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL
	const ROUTE46_FIELDMON_1
	const ROUTE46_FIELDMON_2
	const ROUTE46_FIELDMON_3
	const ROUTE46_FIELDMON_4
	const ROUTE46_FIELDMON_5
	const ROUTE46_FIELDMON_6

Route46_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
    appear ROUTE46_FIELDMON_1
    appear ROUTE46_FIELDMON_2
    appear ROUTE46_FIELDMON_3
    appear ROUTE46_FIELDMON_5
    appear ROUTE46_FIELDMON_6

    random 5
    ifequal 1, .spawn
    disappear ROUTE46_FIELDMON_4
    endcallback
.spawn
    appear ROUTE46_FIELDMON_4
    endcallback

TrainerCamperTed:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_TED
	iftrue .FightDone
	checkevent EVENT_BEAT_WHITNEY
	iffalse .Mercy
.fight
	writetext CamperTedSeenText
	waitbutton
	closetext
	winlosstext CamperTedBeatenText, 0
	loadtrainer CAMPER, TED
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_TED
	end
.FightDone:
	writetext CamperTedAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextRoute46
	nooryes
	iftrue .fight
	writetext RematchRefuseTextRoute46
	waitbutton
	closetext
	end
.Mercy:
    writetext CamperTedMercyText
	waitbutton
	closetext
	end

CamperTedMercyText:
    text "I think you have"
    line "got a bit lost."

    para "My girlfriend and"
    line "I are strong"
    cont "trainers."

    para "I'm not going to"
    line "bully a new kid."

    para "Now please head"
    line "back and leave"
    cont "us alone."
    done

TrainerPicnickerErin1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_ERIN
	iftrue .FightDone
	checkevent EVENT_BEAT_WHITNEY
	iffalse .Mercy
.fight
	writetext PicnickerErin1SeenText
	waitbutton
	closetext
	winlosstext PicnickerErin1BeatenText, 0
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_ERIN
	end
.FightDone:
	writetext PicnickerErinAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextRoute46
	nooryes
	iftrue .fight
	writetext RematchRefuseTextRoute46
	waitbutton
	closetext
	end
.Mercy:
    writetext PicnickerErinMercyText
	waitbutton
	closetext
	end

PicnickerErinMercyText:
    text "My boyfriend and"
    line "I are hotshot"
    cont "trainers."

    para "We each have 7"
    line "badges but have"
    cont "not been able to"
    cont "beat CLAIR for"
    cont "the 8th badge."

    para "You are lucky"
    line "we are nice and"
    cont "won't crush you."

    para "Run along now."
    done

TrainerHikerBailey:
	faceplayer
	opentext
	checkevent EVENT_BEAT_HIKER_BAILEY
	iftrue .FightDone
	checkevent EVENT_BEAT_WHITNEY
	iffalse .Mercy
.fight
	writetext HikerBaileySeenText
	waitbutton
	closetext
	winlosstext HikerBaileyBeatenText, 0
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HIKER_BAILEY
	end
.FightDone:
	writetext HikerBaileyAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextRoute46
	nooryes
	iftrue .fight
	writetext RematchRefuseTextRoute46
	waitbutton
	closetext
	end
.Mercy:
    writetext HikerBaileyMercyText
    yesorno
    closetext
    iffalse .end
    winlosstext HikerBaileyBeatenText, 0
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmap
	ifequal LOSE, .lose
	setevent EVENT_BEAT_HIKER_BAILEY
	sjump .end
.lose
    opentext
    writetext HikerBaileyGloatText
    waitbutton
    closetext
    special HealParty
.end
	end

HikerBaileyGloatText:
    text "Hohohoho..."

    para "See you are"
    line "not ready for"
    cont "this place!"

    para "But I won't"
    line "stop you."
    done

HikerBaileyMercyText:
    text "I got close but"
    line "can't beat CLAIR!"

    para "Oh you should"
    line "not be here!"

    para "This cave is too"
    line "dangerous for"
    cont "you!"

    para "There are scary"
    line "#mon in there."

    para "Even if you get"
    line "through somehow."

    para "Other trainers"
    line "will crush you."

    para "Do you want me"
    line "to show you?"
    done

Route46Sign:
	jumptext Route46SignText

Route46Protein:
	itemball PROTEIN

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

HikerBaileySeenText:
	text "Ah I see you"
	line "have gotten"
	cont "real strong."

	para "You can help me"
	line "train to beat"
	cont "CLAIR."
	done

HikerBaileyBeatenText:
	text "I think I"
	line "got stronger"
	cont "right there!"
	done

HikerBaileyAfterBattleText:
	text "You might be"
	line "sore and tired"
	cont "but you have to"
	cont "keep on climbing."

	para "I'm going to"
	line "keep on battling"
	cont "and conquer my"
	cont "mountains."
	done

CamperTedSeenText:
	text "Kid! We are on"
	line "a date!"

	para "Damn I need to"
	line "play it cool."

	para "Hey fellow trainer"
	line "shall we battle?"
	done

CamperTedBeatenText:
	text "Haha...."

	para "Well done..."

	para "I am a good"
	line "loser see..."
	done

CamperTedAfterBattleText:
	text "That was fun."

	para "Now back to"
	line "our date."

	para "So ah..."

	para "What's your"
	line "typical day"
	cont "look like?"
	done

PicnickerErin1SeenText:
	text "Hey, un we are"
	line "on a date."

	para "I think..."

	para "Maybe a battle"
	line "will liven"
	cont "things up."
	done

PicnickerErin1BeatenText:
	text "How embarrassing."

	para "How could I"
	line "lose to you!"
	done

PicnickerErinAfterBattleText:
	text "I feel bad"
	line "after losing."

	para "But back to the"
	line "date."

	para "Um..."

	para "What's your"
	line "favorite..."

	para "#mon?"
	done

Route46SignText:
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done

RematchTextRoute46:
    text "How about a"
    line "rematch?"
    done

RematchRefuseTextRoute46:
    text "Maybe next time."
    done

Route46FieldMon1Script:
	trainer URSARING, FIELD_MON, EVENT_FIELD_MON_1, Route46PokemonAttacksText, 31, 0, .script
.script
    disappear ROUTE46_FIELDMON_1
    end

Route46FieldMon2Script:
	faceplayer
	cry GEODUDE
	pause 15
	loadwildmon GEODUDE, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear ROUTE46_FIELDMON_2
	end

Route46FieldMon3Script:
	faceplayer
	cry ZUBAT
	pause 15
	loadwildmon ZUBAT, 6
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE46_FIELDMON_3
	end

Route46FieldMon4Script:
	faceplayer
	cry DRATINI
	pause 15
	loadwildmon DRATINI, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE46_FIELDMON_4
	end

Route46FieldMon5Script:
	faceplayer
	cry SWINUB
	pause 15
	loadwildmon SWINUB, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE46_FIELDMON_5
	end

Route46FieldMon6Script:
	faceplayer
	cry TEDDIURSA
	pause 15
	loadwildmon TEDDIURSA, 5
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE46_FIELDMON_6
	end

Route46PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

TrainerHikerBaileyScene:
    checkevent EVENT_SPOKE_TO_BAILEY
    iftrue .end
    setevent EVENT_SPOKE_TO_BAILEY
    turnobject ROUTE46_POKEFAN_M, LEFT
    turnobject PLAYER, RIGHT
    sjump TrainerHikerBailey
.end
    end

Route46_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	def_coord_events
	coord_event 14, 6, SCENE_ALWAYS, TrainerHikerBaileyScene

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	def_object_events
	object_event 15,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, TrainerHikerBailey, -1
	object_event  2, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TrainerCamperTed, -1
	object_event  1, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, TrainerPicnickerErin1, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46Protein, EVENT_ROUTE_46_PROTEIN
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route46FieldMon1Script, EVENT_FIELD_MON_1
	object_event  5, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route46FieldMon2Script, EVENT_FIELD_MON_2
	object_event  8, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route46FieldMon3Script, EVENT_FIELD_MON_3
	object_event  2, 18, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route46FieldMon4Script, EVENT_FIELD_MON_4
	object_event 13, 18, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route46FieldMon5Script, EVENT_FIELD_MON_5
	object_event  6,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route46FieldMon6Script, EVENT_FIELD_MON_6

