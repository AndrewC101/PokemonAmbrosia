	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHouseAndrewScript:
    faceplayer
    opentext
    checkevent EVENT_FOUGHT_CELADON_ANDREW
    iftrue .noBattle
    writetext CeladonAndrewInitialIntroText
    waitbutton
    closetext
    setval 0
    writemem wHandOfGod
	setval MUSIC_EPIC_TETRIS
	writemem wBattleMusicOverride
	winlosstext CeladonAndrewBeatenText, CeladonAndrewWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RED, CELADON_ANDREW
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_FOUGHT_CELADON_ANDREW
	opentext
	writetext CeladonAndrewAfterBattleText
	waitbutton
	verbosegiveitem AMBROSIA
.noBattle
	writetext CeladonAndrewFinalText
	waitbutton
	closetext
	end

CeladonAndrewInitialIntroText:
    text "Hello <PLAYER>."

    para "Are you enjoying"
    line "the game?"

    para "I am ANDREW."

    para "The creator of"
    line "this romhack."

    para "Well I'm the game"
    line "representation"
    cont "of him of course."

    para "What you don't"
    line "believe me!"

    para "You need proof!"

    para "Very well, here"
    line "is your proof."
    done

CeladonAndrewWinsText:
    text "You convinced now?"
    done

CeladonAndrewBeatenText:
    text "Oh very good!"

    para "really well done!"

    para "You totally did"
    line "that legit."

    para "No gameshark"
    line "codes required!"

    para "Yeah I know"
    line "what you are"
    cont "doing."

    para "I applaud your"
    line "initiative."

    para "But this text is"
    line "the only cool"
    cont "easter egg you"
    cont "will get."
    done

CeladonAndrewAfterBattleText:
    text "You were never"
    line "going to win that"
    cont "without cheats."

    para "But I think I've"
    line "made my point."

    para "Here take this"
    line "for being a good"
    cont "sport."
    done

CeladonAndrewFinalText:
    text "I'm happy you are"
    line "playing and"
    cont "enjoying the game."

    para "I have a house at"
    line "MT SILVER."

    para "Come visit when"
    line "you get there."

    para "If you complete"
    line "the game I'll"
    cont "give you a very"
    cont "special item."

    para "One I've buried"
    line "away in the game."

    para "It's too powerful"
    line "and game warping"
    cont "for any player."

    para "If you complete"
    line "the game I'll"
    cont "give you the"
    cont "HAND OF GOD."

    para "Now go have fun!"
    done

CeladonRoofHouseTVScript:
	opentext
	writetext CeladonRoofHouseTVText
	waitbutton
	closetext
	end

CeladonRoofHouseTVText:
	text "#MON the First"
	line "Movie is on!"
	para "The original one."
	para "The good one!"
	done

CeladonRoofHouseBooksScript:
	opentext
	writetext CeladonRoofHouseBooksText
	waitbutton
	closetext
	end

CeladonRoofHouseBooksText:
	text "This bookshelf..."
	para "Is full of Final"
	line "Fantasy strategy"
	cont "guides."
	done


CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events
    bg_event  2,  1, BGEVENT_READ, CeladonRoofHouseTVScript
    bg_event  1,  1, BGEVENT_READ, CeladonRoofHouseBooksScript
    bg_event  0,  1, BGEVENT_READ, CeladonRoofHouseBooksScript

	def_object_events
	object_event  3,  2, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseAndrewScript, -1
