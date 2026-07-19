	object_const_def
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsGrandpa:
	faceplayer
    opentext
    checkevent EVENT_GOT_PORYGON2
    iftrue .gotPorygon2
    writetext BillGrampsExplainsText
    waitbutton
    writetext BillGrampsTakeThisPorygon2Text
    yesorno
    iffalse .refused
    writetext BillGrampsImCountingOnYouText
    promptbutton
    waitsfx
    writetext ReceivedPorygon2Text
    playsound SFX_CAUGHT_MON
    waitsfx
    checkevent EVENT_BEAT_BUGSY
    iffalse .minLevel
	checkevent EVENT_BEAT_MORTY
	iffalse .tinyLevel
	checkevent EVENT_BEAT_PRYCE
	iffalse .smallLevel
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
    givepoke PORYGON2, 80, LUCKY_EGG, GetPorygon2Name, GetPorygon2OTName
    sjump .given
.minLevel
    givepoke PORYGON, 20, LUCKY_EGG, GetPorygonName, GetPorygon2OTName
    sjump .given
.tinyLevel
    givepoke PORYGON2, 30, LUCKY_EGG, GetPorygon2Name, GetPorygon2OTName
    sjump .given
.smallLevel
    givepoke PORYGON2, 40, LUCKY_EGG, GetPorygon2Name, GetPorygon2OTName
    sjump .given
.lowerLevel
    givepoke PORYGON2, 50, LUCKY_EGG, GetPorygon2Name, GetPorygon2OTName
    sjump .given
.midLevel
    givepoke PORYGON2, 60, LUCKY_EGG, GetPorygon2Name, GetPorygon2OTName
.given
    setevent EVENT_GOT_PORYGON2
    writetext BillGrampsPorygon2Explain
    waitbutton
    closetext
    end
.gotPorygon2
    writetext BillGrampsGotPorygon2
    waitbutton
    closetext
    end
.refused
    writetext BillGrampsTooBad
    waitbutton
    closetext
    end

GetPorygon2Name:
    db "Porygon2@"

GetPorygonName:
    db "Porygon@"

GetPorygon2OTName:
    db "Bill@"

BillGrampsExplainsText:
	text "Oh hello young"
	line "trainer."
	para "Do you know Bill?"
	para "He is my grandson."
	para "Yes I am very old!"
	para "Bill has left a"
	line "#mon with me."
	para "It is very rare he"
	line "says."
	para "It is wasted with"
	line "me."
	done

BillGrampsTakeThisPorygon2Text:
	text "Oh my!"
	para "Why you are"
	line "exactly the type"
	cont "of trainer I'm"
	cont "looking for!"

	para "Would you like"
	line "to take this"
	cont "#mon on"
	cont "your journey?"
	done

BillGrampsImCountingOnYouText:
	text "I know it will"
	line "help you reach"
	cont "your goals!"
	done

BillGrampsPorygon2Explain:
	text "Bill tells me"
	line "this is a very"
	cont "versatile #mon."

	para "It is great"
	line "with Eviolite."

	para "Or a great"
	line "attacker once"
	cont "evolved."
	done

BillGrampsGotPorygon2:
	text "I know Bill will"
	line "understand that"
	cont "Porygon2 will"
	cont "reach its full"
	cont "potential with"
	cont "you."
	done

BillGrampsTooBad:
    text "Aw that is"
    line "a real shame."

    para "This #mon"
    line "is powerful"
    cont "and really seems"
    cont "to like you."
    done

BillGrampsNoRoom:
    text "Please make"
    line "room in your"
    cont "party."
    done

ReceivedPorygon2Text:
	text "<PLAYER> received"
	line "Porygon2!"
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
