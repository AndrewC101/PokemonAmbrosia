	object_const_def
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGONITE
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_MAHOGANYMART1F_NOTHING
	scene_script .LanceUncoversStaircase ; SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	def_callbacks
	callback MAPCALLBACK_TILES, .MahoganyMart1FStaircase

.DummyScene0:
	end

.LanceUncoversStaircase:
	sdefer MahoganyMart1FLanceUncoversStaircaseScript
	end

.MahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	endcallback

.ShowStairs:
	changeblock 6, 2, $1e ; stairs
	endcallback

MahoganyMart1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

.LanceEntered:
	writetext MahoganyMart1FPharmacistText_LanceEntered
	waitbutton
	closetext
	end

MahoganyMart1FBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	writetext MahoganyMart1FBlackBeltText
	waitbutton
	closetext
	end

.LanceEntered:
	writetext MahoganyMart1FBlackBeltText_LanceEntered
	waitbutton
	closetext
	end

MahoganyMart1FLanceUncoversStaircaseScript:
	pause 15
	opentext
	writetext MahoganyMart1FLanceDragoniteHyperBeamText
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGONITE, MahoganyMart1FDragoniteTackleMovement
	applymovement MAHOGANYMART1F_BLACK_BELT, MahoganyMart1FBlackBeltKnockedBackMovement
	pause 15
	disappear MAHOGANYMART1F_DRAGONITE
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPlayerMovement
	opentext
	writetext MahoganyMart1FLanceRadioText
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPharmacistMovement
	applymovement MAHOGANYMART1F_PHARMACIST, MahoganyMart1FPharmacistShovedAsideMovement
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachHiddenStairsMovement
	stopfollow
	opentext
	writetext MahoganyMart1FLanceStairsText
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e ; stairs
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	turnobject MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext MahoganyMart1FLanceSplitUpText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceGoDownStairsMovement
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene SCENE_MAHOGANYMART1F_NOTHING
	waitsfx
	end

MahoganyMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MahoganyMart1FDragoniteTackleMovement:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

MahoganyMart1FBlackBeltKnockedBackMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

MahoganyMart1FPharmacistShovedAsideMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

MahoganyMart1FLanceApproachPlayerMovement:
	slow_step LEFT
	turn_head DOWN
	step_end

MahoganyMart1FLanceApproachPharmacistMovement:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MahoganyMart1FLanceApproachHiddenStairsMovement:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

MahoganyMart1FLanceGoDownStairsMovement:
	slow_step RIGHT
	step_end

MahoganyMart1FPharmacistText_LanceEntered:
	text "Arrgh ah I uh..."

	para "I can't believe"
	line "that there's a"
	cont "hidden stairway"
	cont "there!"

	para "I've never seen"
	line "it before!"
	done

MahoganyMart1FBlackBeltText:
	text "We are going to"
	line "redefine the laws"
	cont "of war and battle."

	para "Soon powerful"
	line "#mon will"
	cont "become a huge"
	cont "liability."

	para "Heh heh heh."
	done

MahoganyMart1FBlackBeltText_LanceEntered:
	text "URRGH..."

	para "I can't feel"
	line "my legs."

	para "That..."

	para "That is one real"
	line "strong phantom"
	cont "you have there."
	done

MahoganyMart1FLanceDragoniteHyperBeamText:
	text "Dragonite,"
	line "OUTRAGE!"
	done

MahoganyMart1FLanceRadioText:
	text "Good to see you"
	line "<PLAYER>."

	para "The nefarious"
	line "radio signal is"
	cont "emanating from"
	cont "here."

	para "This place is"
	line "not what it seems."
	done

MahoganyMart1FLanceStairsText:
	text "This den of"
	line "liars is undone."

	para "Your masters"
	line "shall not escape"
	cont "my wrath."
	done

MahoganyMart1FLanceSplitUpText:
	text "I shall venture"
	line "in first and cut"
	cont "a path for you."

	para "We should separate"
	line "and launch an"
	cont "attack on two"
	cont "fronts."
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 1
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  1,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FBlackBeltScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  3,  6, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FGrannyScript, EVENT_MAHOGANY_MART_OWNERS
