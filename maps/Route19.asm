	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2
	const ROUTE19_FIELDMON_1
    const ROUTE19_FIELDMON_2
    const ROUTE19_FIELDMON_3
    const ROUTE19_FIELDMON_4

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .ClearRocks
	callback MAPCALLBACK_OBJECTS, .FieldMon

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	endcallback

.FieldMon
    appear ROUTE19_FIELDMON_1
    appear ROUTE19_FIELDMON_2
    appear ROUTE19_FIELDMON_3
    appear ROUTE19_FIELDMON_4
	endcallback

Route19FieldMon1Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_1, Route19PokemonAttacksText, 70, 0, .script
.script
    disappear ROUTE19_FIELDMON_1
    end

Route19FieldMon2Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_2, Route19PokemonAttacksText, 72, 0, .script
.script
    disappear ROUTE19_FIELDMON_2
    end

Route19PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route19FieldMon3Script:
	faceplayer
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 52
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE19_FIELDMON_3
	end

Route19FieldMon4Script:
	faceplayer
	cry BLASTOISE
	pause 15
	loadwildmon BLASTOISE, 53
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE19_FIELDMON_4
	end

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Begone you"
	line "fascist!"
	para "I shall be the"
	line "first to welcome"
	cont "our HOENN brothers"
	cont "and sisters across"
	cont "the boarder."
	done

SwimmermHaroldBeatenText:
	text "Welcome HOENN!"
	done

SwimmermHaroldAfterBattleText:
	text "You're a typical"
	line "alt right"
	cont "xenophobe, you"
	cont "will never be as"
	cont "enlightened as I!"
	done

SwimmermTuckerSeenText:
	text "Dude, I'm trying"
	line "to propose to me"
	cont "girlfriend!"
	para "It's not going"
	line "working as I'd"
	cont "hoped."
	done

SwimmermTuckerBeatenText:
	text "This is just"
	line "what I need."
	done

SwimmermTuckerAfterBattleText:
	text "I think I've"
	line "forgot the ring!"
	para "Forget it!"
	para "Dawn, will you"
	line "marry me?"
	done

SwimmerfDawnSeenText:
	text "I was planning to"
	line "propose to my"
	cont "boyfriend but he"
	cont "seems rather"
	cont "distracted."
	done

SwimmerfDawnBeatenText:
	text "My heart wasn't"
	line "really in it."
	done

SwimmerfDawnAfterBattleText:
	text "Alright it's now"
	line "or never."
	para "I have the rings."
	para "Tucker, will you"
	line "marry me?"
	done

Route19Fisher1Text:
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done

Route19Fisher1Text_RocksCleared:
	text "Well, that was"
	line "lucky."
	para "The road is clear"
	line "and my work here"
	cont "is done!"
	done

Route19Fisher2Text:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

Route19Fisher2Text_RocksCleared:
	text "There was some"
	line "kind fo small"
	cont "earthquake and it"
	cont "shifted the rocks!"
	para "It was HOENN!"
	para "I'll have to thank"
	line "them when they get"
	cont "here eh!"
	done

Route19SignText:
	text "ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

CarefulSwimmingSignText:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to SEAFOAM"
	cont "ISLANDS."

	para "FUCHSIA POLICE"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
	object_event  5, 20, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route19FieldMon1Script, EVENT_FIELD_MON_1
	object_event 14, 22, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route19FieldMon2Script, EVENT_FIELD_MON_2
	object_event  6, 29, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FieldMon3Script, EVENT_FIELD_MON_3
	object_event 14, 32, SPRITE_BLASTOISE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FieldMon4Script, EVENT_FIELD_MON_4
