	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST
	const RADIOTOWER4F_MEOWTH

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .teamRocket

.teamRocket
    disappear RADIOTOWER4F_MEOWTH
    checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
    iftrue .disappear
    checkevent EVENT_BEAT_MEOWTH
    iftrue .disappear
    appear RADIOTOWER4F_ROCKET_GIRL
    appear RADIOTOWER4F_ROCKET2
    endcallback
 .disappear
    disappear RADIOTOWER4F_ROCKET_GIRL
    disappear RADIOTOWER4F_ROCKET2
    endcallback

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem POLKADOT_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerJames:
    jumptextfaceplayer jamesPreText

TrainerJessie:
    jumptextfaceplayer jessiePreText

jamesPreText:
	text "We have a proud"
	line "tradition of"
	cont "failure to uphold!"
	done

jessiePreText:
	text "All's fair in love"
	line "and war and"
	cont "battles"
	done

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "I listened to the"
	line "radio while I was"
	cont "at the RUINS."

	para "I heard a strange"
	line "broadcast there."
	done

RadioTower4FDJMaryText:
	text "I don't care"
	line "what happens"
	cont "to me!"

	para "But please save"
	line "my Meowth!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "You are a hero."

	para "You are strong"
	line "and beautiful."

	para "Will you take this"
	line "as my thanks?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "Mary: It's just"
	line "right for #mon"

	para "that know fairy-"
	line "type moves."
	done

RadioTower4FDJMaryText_After:
	text "Let the world"
	line "know about"
	cont "<PLAYER>."

	para "The strong and"
	line "beautiful!"
	done

RadioTowerMeowthText:
	text "Meowth: Meowth…"
	done

GruntM10SeenText:
	text "Have you heard"
	line "of the #mon"

	para "Kyogre and"
	line "Groudon!"

	para "They are Hoenn"
	line "legendary"
	cont "#mon."

	para "They will destroy"
	line "Kanto!"
	done

GruntM10BeatenText:
	text "You fool!"
	done

GruntM10AfterBattleText:
	text "You have doomed"
	line "us all!"
	done

ScientistRichSeenText:
	text "Did I give you"
	line "permission to"
	cont "leave."

	para "Their power will"
	line "be mine."

	para "The Hoenn"
	line "legendary"
	cont "#mon."

	para "I will learn to"
	line "control them and"
	cont "rule the world!"

	para "Muhahahaha."
	done

ScientistRichBeatenText:
	text "This is but a"
	line "minor set back."
	done

ScientistRichAfterBattleText:
	text "Destiny."

	para "You can not"
	line "destroy my"
	cont "destiny."
	done

RadioTower4FProductionSignText:
	text "4F Production"
	done

RadioTower4FStudio2SignText:
	text "4F Studio 2"
	done

JessieAndJamesScene:
    checkevent EVENT_BEAT_MEOWTH
    iftrue .end

    playmusic MUSIC_ROCKET_ENCOUNTER
    turnobject RADIOTOWER4F_ROCKET_GIRL, RIGHT
    turnobject RADIOTOWER4F_ROCKET2, LEFT

    turnobject PLAYER, LEFT
    opentext
    writetext PrepareForTrouble
    waitbutton
    turnobject PLAYER, RIGHT
    writetext MakeItDouble
    waitbutton

    turnobject PLAYER, LEFT
    opentext
    writetext ProtectFromDev
    waitbutton
    turnobject PLAYER, RIGHT
    writetext UniteAllPeoples
    waitbutton

    turnobject PLAYER, LEFT
    opentext
    writetext DenounceEvils
    waitbutton
    turnobject PLAYER, RIGHT
    writetext ExtendReach
    waitbutton

    turnobject PLAYER, LEFT
    opentext
    writetext Jessie
    waitbutton
    turnobject PLAYER, RIGHT
    writetext James
    waitbutton

    turnobject PLAYER, LEFT
    opentext
    writetext BlastOffAtThe
    waitbutton
    turnobject PLAYER, RIGHT
    writetext SurrenderNow
    waitbutton
    closetext

	winlosstext JamesLose, JamesWin
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_31

    turnobject PLAYER, LEFT
    opentext
    writetext CantDoThat
    waitbutton
    closetext

	winlosstext JessieLose, JessieWin
	loadtrainer GRUNTF, GRUNTF_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTF_4

	appear RADIOTOWER4F_MEOWTH

    turnobject PLAYER, DOWN
    opentext
    writetext MeowthText
    waitbutton
    closetext

	setval MUSIC_MYSTICALMAN_ENCOUNTER
	writemem wBattleMusicOverride
	winlosstext MeowthLose, MeowthWin
	loadtrainer GRUNTF, GRUNTF_6
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MEOWTH

    opentext
    writetext BlastingOffAgain
    waitbutton
    closetext

	special FadeOutPalettes
    disappear RADIOTOWER4F_ROCKET2
    disappear RADIOTOWER4F_ROCKET_GIRL
    disappear RADIOTOWER4F_MEOWTH
	pause 10
	special FadeInPalettes

.end
    end

PrepareForTrouble:
    text "Prepare for"
    line "trouble."
    done

MakeItDouble:
    text "Make it double."
    done

ProtectFromDev:
	text "To protect the"
	line "world from"
	cont "devastation."
	done

UniteAllPeoples:
	text "To unite all"
	line "peoples within our"
	cont "nation."
	done

DenounceEvils:
	text "To denounce the"
	line "evils of truth and"
	cont "love."
	done

ExtendReach:
	text "To extend our"
	line "reach to the stars"
	cont "above."
	done

Jessie:
    text "JESSIE!"
    done

James:
    text "JAMES!"
    done

BlastOffAtThe:
	text "Team Rocket blast"
	line "off at the speed"
	cont "of light."
	done

SurrenderNow:
	text "Surrender now or"
	line "prepare to fight!"
	done

JamesLose:
	text "With enemies like"
	line "that, who needs"
	cont "friends?"
	done

JamesWin:
	text "We'd like to thank"
	line "all of our fans"
	cont "for their loyalty"
	cont "and support; this"
	cont "victory is for"
	cont "them!"
	done

CantDoThat:
    text "I'll stop you"
    line "twerp!"
    done

JessieLose:
	text "This is all"
	line "your fault JAMES!"
	done

JessieWin:
	text "I can't believe"
	line "that worked!"
	done

MeowthText:
	text "Youse twos can't"
	line "get anything"
	cont "right."
	para "I'll take care of"
	line "this myself!"
	done

MeowthLose:
	text "Just once, I'd"
	line "like to make a"
	cont "dramatic exit that"
	cont "doesn't involve a"
	cont "life-threatening"
	cont "explosion."
	done

MeowthWin:
    text "Meowth,"
    line "that's right!"
    done

BlastingOffAgain:
	text "Looks like Team"
	line "Rocket's blasting"
	cont "off again..."
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 13,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events
	coord_event 13, 1, SCENE_ALWAYS, JessieAndJamesScene

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerJames, EVENT_TEMP_EVENT_3
	object_event 12,  1, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerJessie, EVENT_TEMP_EVENT_2
	object_event  1,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  2, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
