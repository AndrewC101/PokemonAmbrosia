	object_const_def
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsGrandpa:
	faceplayer
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .notBeatE4
    opentext
    checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
    iftrue .gotMew
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
    checkevent EVENT_BEAT_WALLACE
    iffalse .midLevel
    givepoke MEW, 80, LUCKY_EGG
    sjump .given
.midLevel
    givepoke MEW, 60
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
.notBeatE4
    opentext
    writetext BillBeatE4
    waitbutton
    closetext
    end

BillBeatE4:
	text "Hm? You know Bill?"
	line "He's my grandson."

	para "He is always out"
	line "doing interesting"
	cont "things and talking"
	cont "with important"
	cont "people."

	para "I'd like to meet"
	line "somebody important"
	cont "like a Champion."
    done

BillGrampsTakeThisMewText:
	text "Hm? You know Bill?"
	line "He's my grandson."

	para "Oh you are a"
	line "Champion!"

	para "I shouldn't tell"
	line "you this..."

	para "Bill has found"
	line "an extremely"
	cont "rare and ancient"
	cont "#mon!"

	para "Apparently He"
	line "found it in a"
	cont "truck at the"
	cont "harbour."

	para "He has entrusted"
	line "it to me..."

	para "Oh my..."

	para "It seems to"
	line "like you."

	para "Hmmm..."

	para "Yes I can see"
	line "why."

	para "You are a"
	line "special trainer."

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
