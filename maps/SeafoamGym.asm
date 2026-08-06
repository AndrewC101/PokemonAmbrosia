	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
.rematch
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .check_hard
	sjump .normal
.check_hard
	readmem wLevelCap
	ifless 100, .hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BLAINE, MASTER_BLAINE
	sjump .battle
.hard
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BLAINE, BLAINE1
	sjump .battle
.normal
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer BLAINE, BLAINE1
.battle
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	checkevent EVENT_BEAT_BLAINE
	iftrue .end
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineFightDoneText
	waitbutton
	closetext
.end
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextBlaine
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextBlaine
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
    jumptextfaceplayer SeafoamGymGuideWinText2

BlaineIntroText:
	text "I am Blaine."
	para "A Gym Leader"
	line "without a Gym."
	para "You might think I"
	line "have very little."
	para "But everyday is a"
	line "gift."
	para "I should have died"
	line "years ago when my"
	cont "brother abandoned"
	cont "me on a distant"
	cont "mountain."
	para "I know he had to"
	line "do it."
	para "But I honestly"
	line "believed he"
	cont "wouldn't."
	para "I only recall"
	line "looking up and"
	cont "seeing a pair of"
	cont "great blazing"
	cont "wings."
	para "Fire #mon are"
	line "my family."
	para "Show me the bond"
	line "you have forged"
	cont "with your"
	cont "#mon."
	done

BlaineWinLossText:
	text "You have proven"
	line "yourself."

	para "You've earned"
	line "Volcanobadge!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "Volcanobadge."
	done

BlaineFightDoneText:
	text "I have all I"
	line "need, my"
	cont "#mon!"

	para "I don't need a"
	line "Gym or a city."

	para "All of Kanto"
	line "is my city."

	para "I don't need a"
	line "family."

	para "My #mon are"
	line "my family."

	para "Here on these"
	line "waters I am the"
	cont "first line of"
	cont "defense against"
	cont "any attacker."

	para "I will endure any"
	line "hardship to"
	cont "fulfill this vital"
	cont "purpose!"
	done

SeafoamGymGuideWinText2:
	text "You took his"
	line "pride and snuffed"
	cont "it out like a"
	cont "feeble ember."

	para "Man you really"
	line "are the best!"
	done

RematchTextBlaine:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextBlaine:
    text "Maybe next time."
    done

SeafoamGymMoltresScript:
    opentext
    writetext MoltresText
    cry MOLTRES
    waitbutton
    closetext
    end

MoltresText:
    text "Who's that"
    line "#mon!?"
    done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  5, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event 10, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
	object_event  8,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamGymMoltresScript, -1
