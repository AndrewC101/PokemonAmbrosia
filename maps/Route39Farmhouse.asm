ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_ROOST
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "My prized Miltank"
	line "is terribly sick."

	para "Her Milk is my"
	line "main source of"
	cont "income."

	para "This is real"
	line "bad."

	para "If she doesn't"
	line "get better soon"
	cont "I won't be able"
	cont "to feed my"
	cont "family."

	para "She needs a"
	line "GOLD BERRY!"

	para "But they are"
	line "real rare."
	done

FarmerMText_BuyMilk:
	text "MOOMOO is back"
	line "and feeling good!"

	para "Thank you!"

	para "You saved me"
	line "business."

	para "Here, you can"
	line "have some lovely"
	cont "MOOMOO MILK at"
	cont "a discounted price"
	cont "of ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	done

FarmerMText_GotMilk:
	text "Here ya go!"
	line "Drink that up!"
	done

FarmerMText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerMText_NoRoom:
	text "I reckon yer"
	line "PACK's full."
	done

FarmerMText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

FarmerMText_Milking:
	text "I best go do my"
	line "milkin!"
	done

FarmerFText_InTrouble:
    text "MOOMOO MILK is"
    line "packed with"
    cont "nutrients."

	para "Our milk even goes"
	line "out to Kanto."

	para "With Miltank"
	line "sick we are in"
	cont "trouble."

	para "Nobody cares"
	line "enough to help"
	cont "us."

	para "I think I"
	line "could cry."
	done

FarmerFText_HealedMiltank:
	text "You gave a rare"
	line "GOLD BERRY to"
	cont "help us!"

	para "You are a real"
	line "good kid."

	para "I know your"
	line "mother must be"
	cont "very proud of"
	cont "you."

	para "But every chick"
	line "has to flee the"
	cont "nest eventually."

	para "But you always"
	line "have a home to"
	cont "go back to."

	para "Here, I want you"
	line "to have this."
	done

Text_ReceivedTM13: ; unreferenced
	text "<PLAYER> received"
	line "TM09 ROOST."
	done

FarmerFText_SnoreSpeech:
	text "ROOST lets"
	line "some #mon"
	cont "recover their"
	cont "health."

	para "I hope it helps"
	line "you on your"
	cont "journey."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
