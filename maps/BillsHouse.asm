	object_const_def
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsGrandpa:
	faceplayer
    opentext
    checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
    iftrue .gotMew
    writetext BillGrampsExplainsText
    waitbutton
	readvar VAR_DEXCAUGHT
	ifgreater 79, .giveMew
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .dontGiveMew
.giveMew
    writetext BillGrampsTakeThisMewText
    yesorno
    iffalse .refused
    writetext BillGrampsImCountingOnYouText
    promptbutton
    waitsfx
    readvar VAR_PARTYCOUNT
    ifequal PARTY_LENGTH, .noRoom
    writetext ReceivedMewText
    playsound SFX_CAUGHT_MON
    waitsfx
	checkevent EVENT_BEAT_MORTY
	iffalse .tinyLevel
	checkevent EVENT_BEAT_PRYCE
	iffalse .smallLevel
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
    givepoke MEW, 80, LUCKY_EGG, GetMewName, GetMewOTName
    sjump .given
.tinyLevel
    givepoke MEW, 30, LUCKY_EGG, GetMewName, GetMewOTName
    sjump .given
.smallLevel
    givepoke MEW, 40, LUCKY_EGG, GetMewName, GetMewOTName
    sjump .given
.lowerLevel
    givepoke MEW, 50, LUCKY_EGG, GetMewName, GetMewOTName
    sjump .given
.midLevel
    givepoke MEW, 60, LUCKY_EGG, GetMewName, GetMewOTName
.given
    setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
    writetext BillGrampsMewExplain
    waitbutton
    closetext
    end
.gotMew
    writetext BillGrampsGotMew
    waitbutton
    closetext
    end
.refused
    writetext BillGrampsTooBad
    waitbutton
    closetext
    end
.noRoom
    writetext BillGrampsNoRoom
    waitbutton
    closetext
    end
.dontGiveMew
    opentext
    writetext BillBeatE4
    waitbutton
    closetext
    end

GetMewName:
    db "Mew@"

GetMewOTName:
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
	para "I want to give it"
	line "to a deserving"
	cont "trainer."
	para "If I could find a"
	line "trainer that has"
	cont "caught 80"
	cont "different"
	cont "#mon."
	para "Or maybe a strong"
	line "trainer like a"
	cont "Champion."
	para "Yes someone like"
	line "that would do."
	done

BillBeatE4:
	text "You seem like a"
	line "talented trainer"
	cont "but you aren't"
	cont "quite ready yet."
	done

BillGrampsTakeThisMewText:
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

BillGrampsMewExplain:
	text "Bill tells me"
	line "this is a very"
	cont "powerful #mon."

	para "It can learn"
	line "any move!"
	done

BillGrampsGotMew:
	text "I know Bill will"
	line "understand that"
	cont "Mew will only"
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

ReceivedMewText:
	text "<PLAYER> received"
	line "Mew!"
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
