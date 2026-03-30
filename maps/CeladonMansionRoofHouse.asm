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
	loadtrainer DAD, FINAL_ME
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_FOUGHT_CELADON_ANDREW
	opentext
	writetext CeladonAndrewAfterBattleText
	waitbutton
	verbosegiveitem AMBROSIA
	iffalse .end
.noBattle
    checkevent EVENT_GOT_GIFT_OF_GOD
    iffalse .explainGift
    writetext GotGiftOfGodText
    waitbutton
.end
    closetext
    end
.explainGift
	writetext CeladonMeExplainGiftText
	waitbutton
	readvar VAR_DEXCAUGHT
	ifgreater 224, .giveGift
	closetext
	end
.giveGift
    writetext GiveGiftOfGodText
    waitbutton
    verbosegiveitem GIFT_OF_GOD
    writetext GotGiftOfGodText
    waitbutton
    closetext
    setevent EVENT_GOT_GIFT_OF_GOD
    end

CeladonAndrewInitialIntroText:
    text "Hello <PLAYER>."

    para "Are you enjoying"
    line "the game?"

    para "I am the creator"
    line "of this romhack."

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

    para "Really well done!"

    para "You totally did"
    line "that legit."

    para "No Gameshark"
    line "codes required!"

    para "Yeah I know"
    line "what you are"
    cont "doing with"
    cont "that Ditto."

    para "I applaud your"
    line "initiative."
    done

CeladonAndrewAfterBattleText:
    text "You were never"
    line "going to win that"
    cont "without cheats."

    para "Or a Ditto..."

    para "But I think I've"
    line "made my point."

    para "Here take this"
    line "for being a good"
    cont "sport."
    done

CeladonMeExplainGiftText:
    text "I'm happy you are"
    line "enjoying your"
    cont "adventure."

	para "If you prove your"
	line "dedication by"
	cont "catching 225"
	cont "#mon, I will"
	cont "reward you with"
	cont "the greatest of"
	cont "powers."
	
	para "Something you can"
	line "not otherwise"
	cont "obtain until"
	cont "conquering Arceus"
	cont "itself."
	
	para "I will give you"
	line "the Gift Of God."
	
	para "Which lets you"
	line "instantly max a"
	cont "#mons level"
	cont "and stats."
	
	para "And can be used"
	line "as many times"
	cont "as you like."
	
	para "Come see me here"
	line "when you are"
	cont "ready."

    para "Now go have fun!"
    done

GiveGiftOfGodText:
	text " ...."
	para "You have done it!"
	para "From now on your"
	line "team is not merely"
	cont "6 #mon."
	para "It is all"
	line "#mon!."
	para "You have earned"
	line "this."
	para "Go and build your"
	line "empire!"
	done

GotGiftOfGodText:
	text "Thanks so much for"
	line "spending your time"
	cont "in this world."
	para "I have a house in"
	line "Mt Silver."
	para "You should visit"
	line "me there if you"
	cont "seek a real"
	cont "challenge."
	done

CeladonRoofHouseTVScript:
	opentext
	writetext CeladonRoofHouseTVText
	waitbutton
	closetext
	end

CeladonRoofHouseTVText:
	text "#mon the First"
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
	object_event  3,  2, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseAndrewScript, EVENT_BEAT_RED
