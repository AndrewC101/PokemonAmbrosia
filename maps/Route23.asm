Route23_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

IndigoPlateauSignText:
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#mon LEAGUE HQ"
	done
	
TobiasScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_TOBIAS
	iftrue .FightDone
.fight
	writetext TobiasSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_TOBIAS
	iftrue .dontAsk
	opentext
	writetext TobiasOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext TobiasBeatenText, TobiasWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer COOLTRAINERM, TOBIAS
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_TOBIAS
	end
.FightDone:
	writetext TobiasAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextTobias
	yesorno
	iftrue .fight
.refused
	writetext RematchRefuseTextTobias
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext TobiasWinAfterBattleText
    waitbutton
    closetext
    end

TobiasWinAfterBattleText:
    text "Another easy"
    line "victory..."

    para "I guess my"
    line "#mon are just"
    cont "too strong for"
    cont "anyone to beat."
    done

TobiasSeenText:
    text "What do you want?"

    para "I am Tobias."

    para "I've won many"
    line "#mon leagues."

    para "My #mon are"
    line "just too strong."

    para "I came here in"
    line "hope I would find"
    cont "a challenge."

    para "But I doubt I"
    line "will."
    done
TobiasBeatenText:
    text "Finally!"
    done
TobiasWinsText:
    text "That was boring."
    done
TobiasOfferFightText:
    text "Do you think you"
    line "can offer me a"
    cont "challenge."
    done
TobiasAfterBattleText:
    text "You are the best"
    line "trainer I have"
    cont "ever fought."

    para "My I should focus"
    line "on honing my skill"
    cont "instead of using"
    cont "all legendaries."
    done
RematchTextTobias:
    text "Give me another"
    line "fight?"
    done
RematchRefuseTextTobias:
    text "How boring."
    done

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 2
	warp_event  8, 21, VICTORY_ROAD, 10
	warp_event  9, 21, VICTORY_ROAD, 10

	def_coord_events

	def_bg_events
	bg_event 10,  8, BGEVENT_READ, IndigoPlateauSign

	def_object_events
	object_event 6, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TobiasScript, -1

