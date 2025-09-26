	object_const_def
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2
	const NATIONALPARKBUGCONTEST_FIELDMON_1
    const NATIONALPARKBUGCONTEST_FIELDMON_2

NationalParkBugContest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .NationalParkContestFieldMon

.NationalParkContestFieldMon
    random 15
    ifequal 1, .spawn1
    disappear NATIONALPARKBUGCONTEST_FIELDMON_1
    sjump .mon2
.spawn1
    appear NATIONALPARKBUGCONTEST_FIELDMON_1

.mon2
    random 15
    ifequal 1, .spawn2
    disappear NATIONALPARKBUGCONTEST_FIELDMON_2
    sjump .end
.spawn2
    appear NATIONALPARKBUGCONTEST_FIELDMON_2

.end
    endcallback

BugCatchingContestant1AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant1AText
	waitbutton
	closetext
	end

BugCatchingContestant2AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant2AText
	waitbutton
	closetext
	end

BugCatchingContestant3AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant3AText
	waitbutton
	closetext
	end

BugCatchingContestant4AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant4AText
	waitbutton
	closetext
	end

BugCatchingContestant5AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant5AText
	waitbutton
	closetext
	end

BugCatchingContestant6AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant6AText
	waitbutton
	closetext
	end

BugCatchingContestant7AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant7AText
	waitbutton
	closetext
	end

BugCatchingContestant8AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant8AText
	waitbutton
	closetext
	end

BugCatchingContestant9AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant9AText
	waitbutton
	closetext
	end

BugCatchingContestant10AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant10AText
	waitbutton
	closetext
	end

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball POKE_DOLL

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FOCUS_SASH, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

BugCatchingContestant1AText:
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done

BugCatchingContestant2AText:
	text "ED: My BRELOOM"
	line "puts #mon to"
	cont "sleep with SPORE."
	done

BugCatchingContestant3AText:
	text "NICK: I'm raising"
	line "fast #mon for"
	cont "battles."
	done

BugCatchingContestant4AText:
	text "WILLIAM: I'm not"
	line "concerned about"
	cont "winning."

	para "I'm just looking"
	line "for rare #mon."
	done

BugCatchingContestant5AText:
	text "BENNY: Ssh! You'll"
	line "scare off SCYTHER."

	para "I'll talk to you"
	line "later."
	done

BugCatchingContestant6AText:
	text "BARRY: You should"
	line "weaken bug #mon"
	cont "first, then throw"
	cont "a BALL."
	done

BugCatchingContestant7AText:
	text "CINDY: I love bug"
	line "#mon."

	para "I guess you must"
	line "like them too."
	done

BugCatchingContestant8AText:
	text "JOSH: I've been"
	line "collecting bug"
	cont "#mon since I"
	cont "was just a baby."

	para "There's no way I'm"
	line "going to lose!"
	done

BugCatchingContestant9AText:
	text "SAMUEL: If you've"
	line "got the time to"
	cont "chat, go find some"
	cont "bug #mon."
	done

BugCatchingContestant10AText:
	text "KIPP: I've studied"
	line "about bug #mon"
	cont "a lot."

	para "I'm going to win"
	line "for sure."
	done

NationalParkBugContestRelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkBugContestBattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkBugContestTrainerTipsText:
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done

NationalParkBugContestFieldMon1Script:
	faceplayer
	cry SCYTHER
	pause 15
	loadwildmon SCYTHER, 25
	loadvar VAR_BATTLETYPE, BATTLETYPE_CONTEST
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear NATIONALPARKBUGCONTEST_FIELDMON_1
	end

NationalParkBugContestFieldMon2Script:
	faceplayer
	cry PINSIR
	pause 15
	loadwildmon PINSIR, 25
	loadvar VAR_BATTLETYPE, BATTLETYPE_CONTEST
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear NATIONALPARKBUGCONTEST_FIELDMON_2
	end

NationalParkBugContest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkBugContestTrainerTipsSign

	def_object_events
	object_event 19, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 28, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event  9, 18, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 23,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 27, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 17, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
	object_event 27, 15, SPRITE_SCYTHER, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkBugContestFieldMon1Script, EVENT_FIELD_MON_1
	object_event 18, 12, SPRITE_PINSIR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NationalParkBugContestFieldMon2Script, EVENT_FIELD_MON_2
