	object_const_def
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5
	const ROUTE41_FIELDMON_1
    const ROUTE41_FIELDMON_2
    const ROUTE41_FIELDMON_3
    const ROUTE41_FIELDMON_4
    const ROUTE41_FIELDMON_5
    const ROUTE41_FIELDMON_6

Route41_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Route41FieldMon

.Route41FieldMon:
; Pokemon which always appear
    appear ROUTE41_FIELDMON_1
    appear ROUTE41_FIELDMON_2
    appear ROUTE41_FIELDMON_3
    appear ROUTE41_FIELDMON_4

    random 2
    ifequal 1, .spawn7
    disappear ROUTE41_FIELDMON_5
    sjump .mon8
.spawn7
    appear ROUTE41_FIELDMON_5

.mon8
    random 2 ; shiny
    ifequal 1, .spawn8
    disappear ROUTE41_FIELDMON_6
    sjump .end
.spawn8
    appear ROUTE41_FIELDMON_6
.end
    endcallback

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock: ; unreferenced
	jumpstd SmashRockScript

Route41HiddenMaxEther:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Have you heard"
	line "of MISTY?"

	para "She is probably"
	line "the strongest"
	cont "WATER trainer."

	para "One day I hope"
	line "to be a Gym"
	cont "trainer for her."
	done

SwimmermCharlieBeatenText:
	text "Avenge me"
	line "MISTY!"
	done

SwimmermCharlieAfterBattleText:
	text "Then she will"
	line "see how strong"
	cont "I am and slowly"
	cont "fall in love"
	cont "with me."
	done

SwimmermGeorgeSeenText:
	text "Hey kid."

	para "That a real nice"
	line "#mon ya"
	cont "got der."

	para "Get you off"
	line "now."
	done

SwimmermGeorgeBeatenText:
	text "I wer only"
	line "foolin."
	done

SwimmermGeorgeAfterBattleText:
	text "I've picked up"
	line "many a gift"
	cont "from other"
	cont "trainers."

	para "Yar har har!"
	done

SwimmermBerkeSeenText:
	text "Oh hello there."

	para "You're looking"
	line "like you might"
	cont "be somewhat lost."

	para "Given you are"
	line "here..."

	para "Wherever here"
	line "is..."

	para "I'm CAPTAIN"
	line "JACK SPARROW."

	para "I would bet"
	line "all me ALPH"
	cont "gold that you"
	cont "have the heart"
	cont "of a pirate."

	para "Show me your"
	line "footwork!"
	done

SwimmermBerkeBeatenText:
	text "That's not much"
	line "incentive to"
	cont "fight fair."
	done

SwimmermBerkeAfterBattleText:
	text "We all come"
	line "into this world"
	cont "with a pistol"
	cont "loaded with but"
	cont "a single shot."

	para "Don't waste"
	line "your one shot."

	para "Make it count!"
	done

SwimmermKirkSeenText:
	text "Halt!"

	para "Do you have the"
	line "correct papers"
	cont "to operate in"
	cont "these waters."

	para "No..."

	para "Another rotten"
	line "pirate."

	para "Well I shall"
	line "see to it you"
	cont "are dealt with."
	done

SwimmermKirkBeatenText:
	text "I surrender!"
	done

SwimmermKirkAfterBattleText:
	text "If you run into"
	line "a pirate named"
	cont "Jack you be sure"
	cont "to alert me!"
	done

SwimmermMathewSeenText:
	text "Within the caves"
	line "dwells a great"
	cont "leviathan."

	para "But it will"
	line "only appear to"
	cont "a true SILVER"
	cont "knight."
	done

SwimmermMathewBeatenText:
	text "Forgive me great"
	line "LUGIA."
	done

SwimmermMathewAfterBattleText:
	text "Stay away from"
	line "the caves!"

	para "They are a"
	line "holy place and"
	cont "I will not let"
	cont "you besmirch"
	cont "them."
	done

SwimmerfKayleeSeenText:
	text "I can't go on."

	para "CIANWOOD is"
	line "too far."

	para "I need my"
	line "#mon to"
	cont "save me."

	para "Right after I"
	line "beat you."
	done

SwimmerfKayleeBeatenText:
	text "I'm doomed"
	done

SwimmerfKayleeAfterBattleText:
	text "I must push"
	line "through!"

	para "I must keep"
	line "going!"
	done

SwimmerfSusieSeenText:
	text "It is always"
	line "logical to check"
	cont "the perimeter"
	cont "when looking"
	cont "for a way in."
	done

SwimmerfSusieBeatenText:
	text "Q.E.D"
	done

SwimmerfSusieAfterBattleText:
	text "Why are these"
	line "barriers not"
	cont "perfect squares."

	para "Who would make"
	line "this!"
	done

SwimmerfDeniseSeenText:
	text "What are these"
	line "barriers?"

	para "I will use my"
	line "ninja jutsu"
	cont "to slip under"
	cont "these."
	done

SwimmerfDeniseBeatenText:
	text "Go shadow"
	line "clones!"
	done

SwimmerfDeniseAfterBattleText:
	text "I welcome the"
	line "darkness of"
	cont "the cave."

	para "Where my ninja"
	line "power is"
	cont "strongest."
	done

SwimmerfKaraSeenText:
	text "There must be"
	line "a way into these"
	cont "islands."

	para "Maybe a special"
	line "move can get"
	cont "past these rough"
	cont "waters."
	done

SwimmerfKaraBeatenText:
	text "That didn't do it."
	done

SwimmerfKaraAfterBattleText:
	text "I heard roars from"
	line "deep inside the"
	cont "ISLANDS."
	done

SwimmerfWendySeenText:
	text "I've had it"
	line "living in"
	cont "CIANWOOD!"

	para "I'm swimming to"
	line "the mainland."

	para "Nobody can"
	line "stop me!"
	done

SwimmerfWendyBeatenText:
	text "I'm not going"
	line "back there!"
	done

SwimmerfWendyAfterBattleText:
	text "It's just so"
	line "boring in"
	cont "CIANWOOD."

	para "And that little"
	line "psychic girl"
	cont "is so annoying!"
	done

Route41FieldMon1Script:
	trainer GYARADOS, FIELD_MON, EVENT_FIELD_MON_1, Route41PokemonAttacksText, 46, 0, .script
.script
    disappear ROUTE41_FIELDMON_1
    end

Route41FieldMon2Script:
	trainer TENTACRUEL, FIELD_MON, EVENT_FIELD_MON_2, Route41PokemonAttacksText, 48, 0, .script
.script
    disappear ROUTE41_FIELDMON_2
    end

Route41FieldMon3Script:
	trainer DRACOVISH, FIELD_MON, EVENT_FIELD_MON_3, Route41PokemonAttacksText, 48, 0, .script
.script
    disappear ROUTE41_FIELDMON_3
    end

Route41FieldMon4Script:
	trainer KINGDRA, FIELD_MON, EVENT_FIELD_MON_4, Route41PokemonAttacksText, 56, 0, .script
.script
    disappear ROUTE41_FIELDMON_4
    end

Route41PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route41FieldMon5Script:
	faceplayer
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 55
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE41_FIELDMON_5
	end

Route41FieldMon6Script:
	faceplayer
	cry LAPRAS
	pause 15
	loadwildmon LAPRAS, 40
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE41_FIELDMON_6
	end

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	def_object_events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
	object_event 40,  4, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route41FieldMon1Script, EVENT_FIELD_MON_1
	object_event  7,  2, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route41FieldMon2Script, EVENT_FIELD_MON_2
	object_event 47,  26, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route41FieldMon3Script, EVENT_FIELD_MON_3
	object_event 22, 25, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, Route41FieldMon4Script, EVENT_FIELD_MON_4
	object_event 26,  50, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route41FieldMon5Script, EVENT_FIELD_MON_5
	object_event  3, 26, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route41FieldMon6Script, EVENT_FIELD_MON_6
