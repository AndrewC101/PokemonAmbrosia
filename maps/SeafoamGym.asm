	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE
	const SEAFOAMGYM_ARTICUNO

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

ArticunoScript:
	faceplayer
	opentext
	writetext ArticunoCry
	cry ARTICUNO
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ARTICUNO, 60
	startbattle
	reloadmapafterbattle
    setval ARTICUNO
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_ARTICUNO
	disappear SEAFOAMGYM_ARTICUNO
	end

ArticunoCry:
    text "Articuno!"
    done

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end
.rematch
    writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextBlaine
	yesorno
	iftrue .rematch
	writetext RematchRefuseTextBlaine
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
    jumptextfaceplayer SeafoamGymGuideWinText2

BlaineIntroText:
	text "I am BLAINE."

	para "A GYM LEADER"
	line "without a GYM."

	para "Without a city."

	para "But I still have"
	line "my pride."

    para "Nothing can take"
    line "that from me."

	para "I am the second"
	line "strongest GYM"
	cont "LEADER in KANTO."

	para "And you..."

	para "CHAMPION!"

	para "Will feel the"
	line "fires of my"
	cont "pride!"
	done

BlaineWinLossText:
	text "You have proven"
	line "yourself."

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

BlaineFightDoneText:
	text "I have all I"
	line "need, my"
	cont "#MON!"

	para "I don't need a"
	line "GYM or a city."

	para "All of KANTO"
	line "is my city."

	para "Here on these"
	line "waters I am the"
	cont "first line of"
	cont "defense against"
	cont "any attcker."

	para "I will endure any"
	line "hardship to"
	cont "fulfil this vital"
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

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  15,  15, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  12, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event 16,  15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
	object_event  2,   2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoScript, EVENT_CAUGHT_ARTICUNO

