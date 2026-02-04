	object_const_def
	const SILVERCAVEROOM3_RED
	const SILVERCAVEROOM3_ASH
	const SILVERCAVEROOM3_RED_PIKACHU
	const SILVERCAVEROOM3_ASH_PIKACHU
    const SILVERCAVEROOM3_FIELDMON_1
    const SILVERCAVEROOM3_FIELDMON_2
    const SILVERCAVEROOM3_FIELDMON_3
    const SILVERCAVEROOM3_FIELDMON_4
    const SILVERCAVEROOM3_FIELDMON_5
    const SILVERCAVEROOM3_FIELDMON_6

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .FieldMon

.FieldMon:
	appear SILVERCAVEROOM3_FIELDMON_1
	appear SILVERCAVEROOM3_FIELDMON_2
	appear SILVERCAVEROOM3_FIELDMON_3
	appear SILVERCAVEROOM3_FIELDMON_4
	appear SILVERCAVEROOM3_FIELDMON_5
	appear SILVERCAVEROOM3_FIELDMON_6
	endcallback

SilverCaveRoom3FieldMon1Script:
	faceplayer
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SILVERCAVEROOM3_FIELDMON_1
	end

SilverCaveRoom3FieldMon2Script:
	faceplayer
	cry TYRANITAR
	pause 15
	loadwildmon TYRANITAR, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SILVERCAVEROOM3_FIELDMON_2
	end

SilverCaveRoom3FieldMon3Script:
	faceplayer
	cry SALAMENCE
	pause 15
	loadwildmon SALAMENCE, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear SILVERCAVEROOM3_FIELDMON_3
	end

SilverCaveRoom3FieldMon4Script:
	faceplayer
	cry METAGROSS
	pause 15
	loadwildmon METAGROSS, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear SILVERCAVEROOM3_FIELDMON_4
	end

SilverCaveRoom3FieldMon5Script:
	faceplayer
	cry GARCHOMP
	pause 15
	loadwildmon GARCHOMP, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear SILVERCAVEROOM3_FIELDMON_5
	end

SilverCaveRoom3FieldMon6Script:
	faceplayer
	cry GENESECT
	pause 15
	loadwildmon GENESECT, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear SILVERCAVEROOM3_FIELDMON_6
	end

Red:
	special FadeOutMusic
	faceplayer
	opentext
    checkevent EVENT_BEAT_RED
    iftrue .FightDone
.fight
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext RematchRefuseTextRed
	waitbutton
	closetext
	special HealParty
	checkevent EVENT_BEAT_RED
	iftrue .skip_credits
	setevent EVENT_BEAT_RED
	applymovement SILVERCAVEROOM3_ASH, Movement_AshFinalMove
	opentext
	writetext PokemonMasterText
	waitbutton
	closetext
	turnobject SILVERCAVEROOM3_RED, DOWN
	opentext
	writetext PokemonMasterQuestText
	waitbutton
	closetext
	refreshscreen
	credits
	end
.skip_credits
    opentext
    writetext RematchRefuseTextRed
	waitbutton
    closetext
    end
.FightDone:
	writetext RematchRefuseTextRed
	waitbutton
    closetext
	opentext
	writetext RematchTextRed
	nooryes
	iftrue .fight
	writetext RematchRefuseTextRed
	waitbutton
	closetext
	end

Ash:
	faceplayer
	opentext
    checkevent EVENT_BEAT_ASH
    iftrue .FightDone
.fight
	writetext AshFightText
	waitbutton
	closetext
	winlosstext AshWinLossText, AshWinLossText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ASH, ASH1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	setevent EVENT_BEAT_ASH
	opentext
	writetext AshBeatenText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
    checkevent EVENT_BEAT_RED
	iftrue .beatenRedFightDone
	writetext AshLeavesText
	waitbutton
	closetext
	end
.beatenRedFightDone
	writetext AshFinalText
	waitbutton
    closetext
	opentext
	writetext RematchTextAsh
	nooryes
	iftrue .fight
	writetext RematchRefuseTextAsh
	waitbutton
	closetext
	end

Pikachu:
    opentext
	writetext PikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

PikachuText:
    text "PIKA"
    line "CHU!"
    done

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedWinWinText:
	text "…"
	done

RematchTextRed:
    text "<……>"

    para "Battle?"
    done

RematchRefuseTextRed:
    text "<……>"
    done

AshWinLossText:
	text "You are really"
	line "good!"
	done

AshWinWinText:
	text "You are really"
	line "good!"
	done

AshLeavesText:
	text "You go ahead"
	line "and fight Red."

	para "If you beat him"
	line "you will be the"
	cont "strongest trainer"
	cont "in the world."

	para "You will be a"
	line "#mon Master."
	done

RematchTextAsh:
    text "How about"
    line "another battle?"
    done

RematchRefuseTextAsh:
    text "No problem!"
    done

SilverCave3BlockScript:
    checkevent EVENT_CAUGHT_MEWTWO
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext SilverCave3BlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_SilverCave3TurnBack
    end

SilverCave3BlockText:
    text "An overwhelming"
    line "force repels the"
    cont "unworthy."
    done

Movement_SilverCave3TurnBack:
	step DOWN
	step_end

FightAshScript1:
    applymovement PLAYER, Movement_PlayerToAsh1
    sjump FightAshScript

FightAshScript2:
    applymovement PLAYER, Movement_PlayerToAsh2
    sjump FightAshScript

FightAshScript:
    pause 20
    showemote EMOTE_SHOCK, SILVERCAVEROOM3_RED_PIKACHU, 15
    turnobject SILVERCAVEROOM3_RED, DOWN
    showemote EMOTE_SHOCK, SILVERCAVEROOM3_ASH_PIKACHU, 15
    turnobject SILVERCAVEROOM3_ASH, DOWN
    pause 10
    applymovement SILVERCAVEROOM3_ASH, Movement_AshToPlayer
    opentext
    writetext AshFightText
    waitbutton
    closetext
    winlosstext AshWinLossText, AshWinLossText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer ASH, ASH1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext AshBeatenText
	waitbutton
	closetext
	applymovement SILVERCAVEROOM3_ASH, Movement_AshBack
	turnobject SILVERCAVEROOM3_RED, RIGHT
	setmapscene SILVER_CAVE_ROOM_3, SCENE_FINISHED
	setevent EVENT_BEAT_ASH
	special HealParty
	end

Movement_AshToPlayer:
    step LEFT
    step DOWN
    step_end

 Movement_AshBack:
     step UP
     step RIGHT
     turn_head LEFT
     step_end

AshFightText:
    text "Hey I'm Ash"
    line "from Pallet town."

    para "Though not the"
    line "same Pallet town"
    cont "you know."

    para "Prof Oak sent me"
    line "here."

    para "He said a trainer"
    line "like me needed a"
    cont "challenge."

    para "Did he send you"
    line "too?"

    para "This guy Red seems"
    line "tough."

    para "Whoever beats him"
    line "becomes the most"
    cont "powerful trainer"
    cont "in the world."

    para "A #mon"
    line "Master!"

    para "Tell you what!"

    para "How about we have"
    line "a battle and the"
    cont "winner faces Red."
    done

AshBeatenText:
    text "Wow you are"
    line "really strong!"

    para "Go on and fight"
    line "Red."

    para "This is a battle"
    line "I can't wait to"
    cont "see!"
    done

AshFinalText:
    text "You are a"
    line "#mon Master!"

    para "Well done!"

    para "I hear there is"
    line "a special event"
    cont "full of #mon"
    cont "Masters."

    para "The greatest of"
    line "Masters is called"
    cont "the Monarch."

    para "Maybe that could"
    line "be you!"
    done

Movement_PlayerToAsh1:
    step RIGHT
Movement_PlayerToAsh2:
    step UP
    step UP
    step_end

Movement_AshFinalMove:
    step LEFT
    step_end

PokemonMasterText:
    text "You did it!!"

    para "You are the"
    line "strongest in"
    cont "the world."

    para "You are a"
    line "#mon Master!"

    para "Well done!"
    done

PokemonMasterQuestText:
    text "There is a"
    line "tournament."

    para "Where everyone is"
    line "a #mon Master."

    para "The strongest of"
    line "them is called the"
    cont "Monarch."

    para "It is found above"
    line "the Mt Silver"
    cont "#center."

    para "That should be"
    line "your next goal."
    done

SilverCaveRoom3MewtwoScript:
    cry MEWTWO
    waitsfx
    opentext
    writetext MewtwoText
    waitbutton
    closetext
    end

MewtwoText:
    text "I sense a great"
    line "strength within"
    cont "you."

    para "You will do great"
    line "things."
    done

SilverCaveRoom3HoohScript:
    opentext
    writetext HoohText
    cry HO_OH
    waitbutton
    closetext
    end

HoohText:
    text "Ho oh!"
    done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 33, SILVER_CAVE_ROOM_2, 2
	warp_event   9, 3, ORIGIN_ROAD_SOUTH, 1
	warp_event  10, 3, ORIGIN_ROAD_SOUTH, 3

	def_coord_events
	coord_event 9, 14, SCENE_DEFAULT, FightAshScript1
	coord_event 10, 14, SCENE_DEFAULT, FightAshScript2
	coord_event 9, 4, SCENE_ALWAYS, SilverCave3BlockScript
	coord_event 10, 4, SCENE_ALWAYS, SilverCave3BlockScript

	def_bg_events

	def_object_events
	object_event  8, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, -1
	object_event 11, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_LEFT,  0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Ash, -1
	object_event  8, 9, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Pikachu, -1
	object_event 11, 9, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Pikachu, -1
	object_event  8, 19, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon1Script, EVENT_FIELD_MON_1
	object_event 11, 19, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon2Script, EVENT_FIELD_MON_2
	object_event 11, 25, SPRITE_SALAMENCE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon3Script, EVENT_FIELD_MON_3
	object_event  8, 25, SPRITE_METAGROSS, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon4Script, EVENT_FIELD_MON_4
	object_event 11, 32, SPRITE_GARCHOMP, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon5Script, EVENT_FIELD_MON_5
	object_event  8, 32, SPRITE_GENESECT, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3FieldMon6Script, EVENT_FIELD_MON_6
	object_event  7, 10, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3MewtwoScript, -1
	object_event 12, 10, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3HoohScript, -1
