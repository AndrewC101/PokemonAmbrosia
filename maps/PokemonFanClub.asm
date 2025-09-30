	object_const_def
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	yesorno
	iffalse .noTalk
	writetext PokemonFanClubChairmanRapidashText
	waitbutton
.noTalk
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	;checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	;iftrue .MetCopycat
	waitbutton
	closetext
	end

;.MetCopycat:
;	promptbutton
;	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
;	promptbutton
;	waitsfx
;	giveitem LOST_ITEM
;	iffalse .NoRoom
;	disappear POKEMONFANCLUB_FAIRY
;	writetext PokemonFanClubPlayerReceivedDollText
;	playsound SFX_KEY_ITEM
;	waitsfx
;	itemnotify
;	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
;	closetext
;	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry MUDKIP
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "I'm the CHAIRMAN"
	line "of the #mon FAN"
	cont "CLUB."

	para "I formally bring"
	line "to order this"
	cont "meeting of"
	cont "esteemed #mon"
	cont "fans."

	para "Excuse me."

	para "Are you here"
	line "for the meeting?"
	done

PokemonFanClubChairmanRapidashText:
	text "Very well."

	para "I shall commence"
	line "today's proceedings"
	cont "by explaining in"
	cont "comprehensive and"
	cont "explicit detail"
	cont "my choice for"
	cont "favorite #mon."

	para "It is of course..."

	para "VAPOREON."

	para "I believe VAPOREON"
	line "to be the most"
	cont "human compatible"
	cont "#mon."

	para "It has high"
	line "emotional"
	cont "intelligence."

	para "Just the right"
	line "height for"
	cont "petting."

	para "So smooth and"
	line "slippery."

	para "Has huge HP and"
	line "DEFENSE with"
	cont "ACID ARMOUR for"
	cont "more defense."

	para "Is fully immune"
	line "to liquid based"
	cont "attacks."

	para "Oh my..."

	para "It is perfect!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Oh boy..."

	para "Thank you for"
	line "listening to me."

	para "Surely now you must"
	line "agree with my"
	cont "assessment."

	para "Here, take this"
	line "for listening."
	done

PokemonFanClubChairmanItsARareCandyText:
	text "It's a RARE CANDY"
	line "that makes #mon"
	cont "stronger."

	para "I prefer making my"
	line "#mon stronger"

	para "by training"
	line "together with"
	cont "them."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Hello again"
	line "<PLAYER>."

	para "Would you like"
	line "to again hear"
	cont "my reasoning"
	cont "behind my choice"
	cont "of favorite"
	cont "#mon?"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "How disappointing…"

	para "Come back if you"
	line "want to learn"
	cont "the truth."
	done

PokemonFanClubReceptionistText:
	text "Our CHAIRMAN is"
	line "very..."

	para "Passionate when"
	line "it comes to"
	cont "#mon."
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "I love the way"
	line "CLEFAIRY waggles"

	para "its finger when"
	line "it's trying to use"

	para "METRONOME."
	line "It's so adorable!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "I love CLEFAIRY,"
	line "but I could never"
	cont "catch one. So I'm"
	cont "making do with a"
	cont "# DOLL that I"
	cont "found."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Oh, I see now. The"
	line "girl who lost this"
	cont "# DOLL is sad…"

	para "OK. Could you take"
	line "this # DOLL"
	cont "back to that poor"
	cont "little girl?"

	para "I'll befriend a"
	line "real CLEFAIRY."

	para "Off to MT MOON!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> received"
	line "# DOLL."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "I'm planning my"
	line "expedition to"
	cont "MT MOON to find"
	cont "a real, honest"
	cont "and true CLEFAIRY."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "Your PACK is"
	line "jammed full."
	done

PokemonFanClubTeacherText:
	text "Look at my darling"
	line "GROVYLE!"

	para "It's so cool."

	para "Like it doesn't"
	line "care about me."

	para "But I know it"
	line "does..."

	para "Right?"
	done

PokemonFanClubClefairyDollText:
	text "It's a CLEFAIRY!"
	line "Huh?"

	para "Oh, right."
	line "It's a CLEFAIRY"
	cont "# DOLL."
	done

PokemonFanClubBayleefText:
	text "MUDKIPZ!"
	done

PokemonFanClubListenSignText:
	text "Let's all listen"
	line "politely to other"
	cont "trainers."
	done

PokemonFanClubBraggingSignText:
	text "If someone brags,"
	line "brag right back!"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
