	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	sdefer .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Of course there"
	line "is no good reason"
	cont "to catch them."

	para "Just a curiosity."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "UNOWN variations?"

	para "That's amazing"

	para "So what is the"
	line "secret to their"
	cont "strength?"

	para "...."

	para "You mean they"
	line "really are as"
	cont "weak as they seem."

	para "I've wasted my"
	line "life...."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "It is believed"
	line "that the ruler"
	cont "of the ancient"
	cont "city was a man"
	cont "named ATEM."

	para "It is believed"
	line "he commanded"
	cont "immensely"
	cont "powerful"
	cont "#MON."

	para "Even WALLACE"
	line "wouldn't have"
	cont "stood a chance"
	cont "against him."

	para "He is considered"
	line "the first true"
	cont "#MON MASTER."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#MON appeared"
	line "in the RUINS?"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "The tower to the"
	line "west is open!"

	para "I tried to"
	line "explore."

	para "It leads to an"
	line "ancient city."

	para "But it's too"
	line "dangerous down"
	cont "there."

	para "I'm just a"
	line "scientist."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "You are the one"
	line "the prophesy"
	cont "speaks of."

	para "The prophesy I"
	line "just made up!"

	para "Only you can"
	line "do it."

	para "Find and solve"
	line "all the puzzles."

	para "There are 3 in"
	line "total."

	para "Or maybe there"
	line "are 4..."

	para "Only when they"
	line "are all solved"
	cont "might the secret"
	cont "be revealed."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of {d:NUM_UNOWN}"
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Wait..."

	para "In the back..."

	para "A DIGIMON book!"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
