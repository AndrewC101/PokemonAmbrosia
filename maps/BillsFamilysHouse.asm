	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 25
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
    jumptextfaceplayer BillsMomText

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillPartyFullText:
    text "You'll need to"
    line "make room in"
    cont "your party."
    done

BillTakeThisEeveeText:
	text "BILL: Hi, <PLAYER>!"

	para "How is the EXP"
	line "SHARE doing?"

	para "I have an"
	line "interesting"
	cont "#mon for you."

	para "I got it from the"
	line "Game Corner."

	para "But I'll give it"
	line "to you for free!"

	para "Can I count on you"
	line "to look after it"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "Excellent!"

	para "You will be a"
	line "true Champion"
	cont "one day!"
	done

ReceivedEeveeText:
	text "<PLAYER> received"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "EEVEE can evolve"
	line "in may ways."

	para "Every evolution"
	line "stone will work."

	para "You can buy them"
	line "from the store."

	para "If you don't"
	line "use a stone EEVEE"
	cont "will still evolve"
	cont "eventually if you"
	cont "are kind to it."
	done

BillNoEeveeText:
	text "What a pity."
	done

BillPopWontWorkText:
	text "Don't mind my"
	line "father."

	para "He is not the"
	line "most sophisticated"
	cont "individual."
	done

BillsMomText:
	text "I am very proud"
	line "of my son."

	para "He's accomplished"
	line "so much."

	para "But my husband"
	line "spends all day in"
	cont "the Game Corner."
	done

BillsSisterUsefulNumberText:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> recorded"
	line "BILL's number."
	done

BillsSisterRefusedNumberText:
	text "I was going to"
	line "give you my"
	cont "brothers number."

	para "You should feel"
	line "honored."
	done

BillsSisterPhoneFullText:
	text "You can't record"
	line "any more numbers."
	done

BillsSisterStorageSystemText:
	text "My big brother"
	line "BILL made the PC"

	para "#mon storage"
	line "system."

	para "He has changed"
	line "the world!"
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 5
	warp_event  3,  7, GOLDENROD_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
