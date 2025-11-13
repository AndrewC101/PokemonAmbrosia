	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .preE4
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.preE4:
    writetext LavTowerPreE4Text
    waitbutton
    closetext
    end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "Expn Card@"

LavRadioTower1FSuperNerd2Script:
    jumptextfaceplayer LavRadioTower1FSuperNerd2Text

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary: ; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavTowerPreE4Text:
	text "You need an Expn"
	line "Card to tune into"
	cont "Kanto radio."
	para "But we are all out"
	line "of stock right"
	cont "now."
	para "Hoenn ships are"
	line "blockading trade"
	cont "routes."
	done

LavRadioTower1FReceptionistText:
	text "Welcome!"

    para "If you're looking"
    line "for some dead"
    cont "#mon you"
    cont "need to go to"
    cont "the Soul House."

    para "If you're looking"
    line "for some good"
    cont "tunes you're in"
    cont "the right place."
	done

LavRadioTower1FOfficerText:
	text "We've implemented"
	line "security measures"
	cont "similar to the"
	cont "Silph Building."

	para "Non employees are"
	line "only permitted on"
	cont "this floor."
	done

LavRadioTower1FSuperNerd1Text:
	text "We report the"
	line "news all over"
	cont "Kanto."

	para "Our charter says"
	line "we have a duty to"
	cont "impartiality."

	para "We take this"
	line "very seriously."

	para "Now I need to"
	line "write the script"
	cont "for our popular"
	cont "HOENITE CANNIBALS"
	cont "show."
	done

LavRadioTower1FGentlemanText:
	text "Damn we keep"
	line "having power"
	cont "outages and this"
	cont "is cutting into"
	cont "our bottom line."

	para "I took out a lot"
	line "of high interest"
	cont "loans to get this"
	cont "off the ground."

	para "The Power Plant"
	line "better get their"
	cont "act together!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "We have full and"
	line "constant power!"

	para "I believe I have"
	line "you to thank for"
	cont "this."

	para "You are the"
	line "<PLAYER> who"
	cont "solved the power"
	cont "issue."

	para "You maybe expect"
	line "money but I have"
	cont "something even"
	cont "better for you."

	para "Here take this."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "With that you can"
	line "listen to our"
	cont "quality programing"
	cont "anytime."

	para "It also entitles"
	line "you to a single"
	cont "OPTION of our"
	cont "stock."

	para "Just three years"
	line "until it vests!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "People around"
	line "here are rather"
	cont "found of country"
	cont "music."

	para "The sadder the"
	line "better."

	para "MR FUJI karaoke"
	line "is particularly"
	cont "popular."

	para "But we slip in"
	line "some sponsored"
	cont "music when we"
	cont "can."
	done

LavRadioTower1FDirectoryText:
	text "1F Reception"
	line "2F Sales"

	para "3F Personnel"
	line "4F Production"

	para "5F Director's"
	line "   Office"
	done

LavRadioTower1FPokeFluteSignText:
	text "Perk Up #mon"
	line "with Mellow Sounds"

	para "of the # Flute"
	line "on CHANNEL 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #mon CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
