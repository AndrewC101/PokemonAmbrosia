	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_AERITH
	const PALLETTOWN_CRYSTAL
	const PALLETTOWN_POKEBALL

PalletTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Aerith

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

.Aerith:
    disappear PALLETTOWN_CRYSTAL
    disappear PALLETTOWN_AERITH
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .end
    appear PALLETTOWN_AERITH
.end
    endcallback

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .amaze
	jumptextfaceplayer PalletTownFisherText
.amaze
    jumptextfaceplayer PalletTownFisherText_Amaze

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I read in the"
	line "news that the"
	cont "world is full of"
	cont "problems."

	para "Those problems"
	line "haven't found"
	cont "their way here."

	para "I hope they never"
	line "do."
	done

PalletTownFisherText:
	text "Have you met"
	line "Lance!?"

	para "Aww man, he is"
	line "so cool!"

	para "Leon is cool too"
	line "and Cynthia too!"

	para "People like that"
	line "will never visit"
	cont "a little town"
	cont "like this!"
	done

PalletTownFisherText_Amaze:
    text "Wait!"

    para "No way!"

    para "Aren't you..."

    para "Champion <PLAYER>!"

    para "The slayer of"
    line "Wallace!"

    para "The saviour of"
    line "Kanto!"

    para "You are the"
    line "COOLEST!"

    para "I can't believe"
    line "I've met you!"

    para "You have made"
    line "my day!"
    done

PalletTownSignText:
	text "Pallet Town"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "Red's house"
	done

OaksLabSignText:
	text "Oak #mon"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "Blue's house"
	done

Aerith2Script:
    faceplayer
	opentext
	checkevent EVENT_BEAT_AERITH_2
	iftrue .FightDone
.fight
	writetext Aerith2SeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_AERITH_2
	iftrue .dontAsk
	opentext
	writetext Aerith2OfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext Aerith2BeatenText, Aerith2WinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KIMONO_GIRL, AERITH_2
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_AERITH_2
	end
.FightDone:
	writetext Aerith2AfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextAerith2
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextAerith2
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext Aerith2WinAfterBattleText
    waitbutton
    closetext
    end
Aerith2WinAfterBattleText:
    text "Not bad!"

    para "You've gained"
    line "levels."

    para "Try looking for"
    line "strong held items."
    done
Aerith2SeenText:
    text "Hey <PLAYER>!"

    para "What brings you"
    line "here?"

    para "I can feel there's"
    line "something special"
    cont "about this town."

    para "The earth tells"
    line "me this is a very"
    cont "important place."

    para "I've heard people"
    line "talking about a"
    cont "war."

    para "Typical humans and"
    line "their petty"
    cont "desires."

    para "I will defend"
    line "the planet against"
    cont "all of them!"
    done
Aerith2BeatenText:
    text "Well done."
    done
Aerith2WinsText:
    text "Good try."
    done
Aerith2OfferFightText:
    text "Let's have a"
    line "fight!?"
    done
Aerith2AfterBattleText:
    text "No matter what"
    line "happens, you"
    cont "have to protect"
    cont "the planet. OK?"

    para "It's like a child"
    line "lost and looking"
    cont "for its mother."

    para "I can hear it"
    line "crying."

    para "Can't you?"
    done
RematchTextAerith2:
    text "Let's fight?"
    done
RematchRefuseTextAerith2:
    text "That's fine!"
    done

PalletTownCrystalScript1:
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, PalletTownMovement_PlayerLeft
    sjump PalletTownCrystalScript
.end
    end
    
PalletTownCrystalScript:
    playmusic MUSIC_DANCING_HALL
    appear PALLETTOWN_CRYSTAL
    applymovement PALLETTOWN_CRYSTAL, PalletTownMovement_CrystalApproaches

    opentext
    writetext PalletTownCrystalText_Intro
    waitbutton
    closetext

	winlosstext Crystal6LosesText, Crystal6WinsText
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CRYSTAL, CRYSTAL_6
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_6
	setmapscene PALLET_TOWN, SCENE_FINISHED

    special FadeOutMusic
	opentext
	writetext PalletTownCrystalText_KeepItUp
	waitbutton
	closetext
	applymovement PALLETTOWN_CRYSTAL, PalletTownMovement_CrystalLeaves
	disappear PALLETTOWN_CRYSTAL
	special RestartMapMusic
	end

PalletTownMovement_PlayerLeft:
    turn_head LEFT
    step_end

PalletTownMovement_CrystalApproaches:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    big_step RIGHT
    step_end

PalletTownCrystalText_Intro:
    text "Hey there Champion"
    line "<PLAYER>!"

    para "It's been a while!"

    para "You know, I always"
    line "thought Kanto was"
    cont "much more urban"
    cont "and polluted than"
    cont "Johto."

    para "But this place is"
    line "nice."

    para "There is something"
    line "about it."

    para "It reminds me of"
    line "home."

    para "...."

    para "I have heard that"
    line "Hoenn may invade"
    cont "any day now."

    para "I bet you have"
    line "got even stronger"
    cont "since we last"
    cont "fought."

    para "I want to be able"
    line "to fight back and"
    cont "protect these"
    cont "people."

    para "Help me become"
    line "stronger."
    done

Crystal6LosesText:
    text "I don't think"
    line "I'll ever be as"
    cont "strong as you."
    done

Crystal6WinsText:
    text "I'm ready to"
    line "fight."
    done

PalletTownCrystalText_KeepItUp:
    text "The next time we"
    line "see each other we"
    cont "might be fighting"
    cont "not for fun, but"
    cont "our lives."

    para "For the lives of"
    line "everyone."

    para "I can't imagine"
    line "anyone beating"
    cont "you!"

    para "When Hoenn invade"
    line "I know you will"
    cont "defeat them."

    para "I won't let you"
    line "down!"
    done

PalletTownMovement_CrystalLeaves:
    big_step LEFT
    big_step LEFT
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    step_end

PalletTownFocusSash:
	itemball FOCUS_SASH

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events
	coord_event 12,  12, SCENE_CUSTOM_1, PalletTownCrystalScript1

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event  6, 13, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Aerith2Script, EVENT_FIELD_MON_1
	object_event 9,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalletTownFocusSash, EVENT_PALLET_TOWN_FOCUS_SASH
