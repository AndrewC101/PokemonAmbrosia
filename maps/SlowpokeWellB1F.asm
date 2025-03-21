	object_const_def
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_FIELDMON_1
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL
	const SLOWPOKEWELLB1F_FIELDMON_2

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SlowpokeWellB1FFieldMon

.SlowpokeWellB1FFieldMon:
    appear SLOWPOKEWELLB1F_FIELDMON_1
    appear SLOWPOKEWELLB1F_FIELDMON_2

    random 3
    ifequal 1, .end
    disappear SLOWPOKEWELLB1F_FIELDMON_2
.end
    endcallback

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball POKE_DOLL

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "Uhhhhh..."

	para "Oh my back..."

	para "My back..."

	para "I fell down the"
	line "well."

	para "Don't worry."

	para "I'll be fine."

	para "But I can't fight"
	line "the ROCKETS like"
	cont "this."

	para "You must do it."

	para "Use your rage."

	para "Seize upon your"
	line "hate..."

	para "Free the dear"
	line "SLOWPOKE."

	para "For me..."
	done

KurtLeaveSlowpokeWellText:
	text "You did it!"

	para "I seen the"
	line "ROCKETS run"
	cont "away with fear"
	cont "in their eyes."

	para "You are a brave"
	line "warrior."

	para "Let's get out"
	line "of here."
	done

GruntM29SeenText:
	text "Ha that old man"
	line "tried to shout"
	cont "at me."

	para "I pushed him"
	line "down here."

	para "He seems in a"
	line "bad way."

	para "If he dies."

	para "He dies."

	para "Now you should"
	line "leave if you"
	cont "don't want to"
	cont "join him."
	done

GruntM29BeatenText:
	text "I implore you!"

	para "Mercy!"

	para "Mercy!"
	done

GruntM29AfterBattleText:
	text "I didn't push"
	line "the old man."

	para "He fell!"

	para "In fact I tried"
	line "to save him!"
	done

GruntM1SeenText:
	text "I can't allow"
	line "you to interfere"
	cont "any further."

	para "I need this to"
	line "go well to secure"
	cont "my promotion."
	done

GruntM1BeatenText:
	text "You are too late."
	done

TrainerGruntM1WhenTalkText:
	text "OK, OK..."

	para "I'll tell you"
	line "what I know."

	para "We are looking"
	line "for ways to win"
	cont "HOENN war."

	para "Our scientists are"
	line "interested in"
	cont "SLOWPOKE."

	para "Something about"
	line "their brain"
	cont "wave patterns."

	para "That is all I"
	line "know!"

	para "We already have"
	line "enough data."

	para "See you around."
	done

GruntM2SeenText:
	text "You beat JESSIE!"
	para "She may be nasty"
	line "and mean but I"
	cont "will make you pay"
	cont "for what you've"
	cont "done!"
	done

GruntM2BeatenText:
	text "This is so"
	line "exciting!"
	done

GruntM2AfterBattleText:
	text "Team Rocket may be"
	line "dirty rotten"
	cont "criminals, but"
	cont "we're not in the"
	cont "business of"
	cont "destroying"
	cont "children's dreams!"
	para "At least, not yet."
	done

GruntF1SeenText:
	text "Hold it twerp!"
	para "We are on an"
	line "important mission."
	para "Though this dark"
	line "and dirty cave"
	cont "isn't good for my"
	cont "skin."
	para "It's just typical."
	done

GruntF1BeatenText:
	text "You brat!"
	done

GruntF1AfterBattleText:
	text "Don't let it go to"
	line "your head because"
	cont "your #MON are"
	cont "a teeny tiny bit"
	cont "stronger."
	done
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "A SLOWPOKE seems"
	line "concerned."

	para "Huh? It has MAIL."
	line "Read it?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "Specimen 3 of 4."
	para "Exhibits"
	line "impressive"
	cont "indifference to"
	cont "stimuli."
	done

SlowpokeWellB1FFieldMon1Script:
	cry SLOWPOKE
	pause 15
	loadwildmon SLOWPOKE, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SLOWPOKEWELLB1F_FIELDMON_1
	end

SlowpokeWellB1FFieldMon2Script:
	cry STARYU
	pause 15
	loadwildmon STARYU, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SLOWPOKEWELLB1F_FIELDMON_2
	end

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  4,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FFieldMon1Script, SLOWPOKEWELLB1F_FIELDMON_1
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
	object_event 14, 13, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FFieldMon2Script, SLOWPOKEWELLB1F_FIELDMON_2

