	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, PryceWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	loadmem wLevelCap, 60
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
    closetext
	opentext
	writetext RematchTextPryce
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextPryce
	waitbutton
	closetext
	end
.rematch
    writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, PryceWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	end
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer COOLTRAINERF, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer COOLTRAINERM, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer COOLTRAINERM, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "Young people today"
	line "have become soft."

	para "In my youth I"
	line "was a climber."

	para "When climbing the"
	line "biggest and most"
	cont "dangerous peaks"
	cont "there is an"
	cont "unspoken rule."

	para "You must look"
	line "after yourself."

	para "I had to leave"
	line "my brother as he"
	cont "begged for help."

	para "If I had tried"
	line "to help him"
	cont "we both would"
	cont "have died."

	para "One day I was"
	line "careless and found"
	cont "myself in his"
	cont "position."

	para "I was prepared"
	line "to die."

	para "Then a huge blue"
	line "bird #mon"
	cont "picked me up"
	cont "and saved me."

	para "After that"
	line "I channeled all"
	cont "my passion into"
	cont "battle."
	done

PryceText_Impressed:
	text "You have faced"
	line "death too."

	para "I see your"
	line "strength."

	para "You deserve"
	line "this Badge."
	done

PryceWinText:
    text "You are too"
    line "young."
    done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "Glacierbadge."
	done

PryceText_GlacierBadgeSpeech:
    text "With the"
    line "Glacierbadge"
    cont "you can now train"
    cont "#mon up to"
    cont "level 60."

    para "And capture"
    line "#mon up to"
    cont "level 50."

    para "Take this also."
	done

PryceText_IcyWindSpeech:
	text "That TM contains"
	line "Icy Wind."

	para "It always reminds"
	line "me of how fragile"
	cont "life is and how"
	cont "powerless we"
	cont "really are."

	para "May it give you"
	line "the same strength"
	cont "it gives me."
	done

PryceText_CherishYourPokemon:
	text "In the end we"
	line "have to look"
	cont "after ourselves"
	cont "first."

	para "If you can't"
	line "do that, then"
	cont "you can't look"
	cont "after anyone else."

	para "People wonder why"
	line "I climbed the"
	cont "mountains."

	para "Because they are"
	line "there."

	para "That's the only"
	line "reason we need"
	cont "to keep fighting."
	done

BoarderBradSeenText:
	text "You think"
	line "you're cool"
	cont "sliding around?"

	para "wait..."

	para "There is a"
	line "pun in there."
	done

BoarderBradBeatenText:
	text "I'm a funny guy."
	done

BoarderBradAfterBattleText:
	text "Don't get so"
	line "serious."

	para "You need to..."

	para "Chill out!"

	para "Hahahah..."
	line "I'm good!"
	done

BoarderDouglasSeenText:
	text "I hear there"
	line "where some Rockets"
	cont "in town recently."

	para "I didn't notice."

	para "We are busy"
	line "training and"
	cont "meditating."

	para "Pryce would have"
	line "frozen those"
	cont "Rockets if he"
	cont "knew."
	done

BoarderDouglasBeatenText:
	text "I heard about you."
	done

BoarderDouglasAfterBattleText:
	text "So you took care"
	line "of the Rockets."

	para "Well then..."

	para "Everything worked"
	line "out fine in the"
	cont "end!"
	done

SkierRoxanneSeenText:
	text "Life is fragile."

	para "But in this Gym"
	line "we are family."

	para "Together we will"
	line "overcome anything."

	para "Except BRADs"
	line "awful jokes."

	para "I'll never"
	line "overcome those!"
	done

SkierRoxanneBeatenText:
	text "That was rough."
	done

SkierRoxanneAfterBattleText:
	text "Pryce is intense."

	para "He tells stories"
	line "of disasters that"
	cont "make me admire"
	cont "how much inner"
	cont "strength he has."

	para "We all want to"
	line "be strong like"
	cont "him."
	done

MahoganyGymGuideText:
	text "Pryce has a lot"
	line "of experience."

	para "He used to climb"
	line "mountains so he"
	cont "never gives up."

	para "He uses Ice"
	line "types."

	para "Which isn't a"
	line "very good type..."

	para "They are weak to"
	line "Fire, Fighting"
	cont "Rock and Steel."

	para "But Pryce has"
	line "strong #mon"
	cont "in spite of their"
	cont "type."
	done

MahoganyGymGuideWinText:
	text "HA! You kicked"
	line "that old guys"
	cont "butt!"

	para "He can conquer"
	line "mountains all"
	cont "he wants."

	para "Mountains are"
	line "nothing compared"
	cont "to you."

	para "You are so cool!"

	para "Excuse the pun."
	done

RematchTextPryce:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextPryce:
    text "Maybe next time."
    done

MahoganyGymMamoswineScript:
    opentext
    writetext MamoswineText
    cry MAMOSWINE
    waitbutton
    closetext
    end

MamoswineText:
    text "Mamoswine!"
    done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
	object_event  6,  3, SPRITE_MAMOSWINE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymMamoswineScript, -1
