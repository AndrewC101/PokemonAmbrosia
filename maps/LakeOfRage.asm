	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL2
	const LAKEOFRAGE_FIELDMON_1
    const LAKEOFRAGE_FIELDMON_2
    const LAKEOFRAGE_FIELDMON_3
    const LAKEOFRAGE_FIELDMON_4
    const LAKEOFRAGE_FIELDMON_5
    const LAKEOFRAGE_FIELDMON_6

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; unusable
	scene_script .DummyScene1 ; unusable

	def_callbacks
	;callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Wesley

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	;setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

.Wesley:
	setval WEATHER_RAIN
	writemem wFieldWeather

    appear LAKEOFRAGE_FIELDMON_1
    appear LAKEOFRAGE_FIELDMON_3
    appear LAKEOFRAGE_FIELDMON_4
    appear LAKEOFRAGE_FIELDMON_5
    appear LAKEOFRAGE_FIELDMON_6

; Pokemon that only appear at night
    checktime NITE
    iffalse .wesley
    appear LAKEOFRAGE_FIELDMON_2

.wesley
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	setmapscene MAHOGANY_TOWN, SCENE_CUSTOM_1
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
    checkevent EVENT_BEAT_CHUCK
    iffalse .notInterested
    checkevent EVENT_BEAT_JASMINE
    iffalse .notInterested
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon GYARADOS, 45
	startbattle
	reloadmapafterbattle
	disappear LAKEOFRAGE_GYARADOS
	appear LAKEOFRAGE_LANCE
	end
.notInterested:
    opentext
    writetext NotInterestedText
    waitbutton
    closetext
    end

NotInterestedText:
    text "GYARADOS seems"
    line "uninterested."
    done

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_RED_GYARADOS
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

CooltrainerfLoisScript:
    jumptextfaceplayer CooltrainerfLoisText

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

;LakeOfRageElixer:
;	itemball MAX_ELIXER

LakeOfRageChoiceSpecs:
	itemball CHOICE_SPECS

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem PP_MAX, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Some external"
	line "torment heightens"
	cont "the aggressive"
	cont "instincts of"
	cont "these #mon."

	para "The product of an"
	line "unnatural and"
	cont "nefarious force."
	done

LakeOfRageLanceIntroText:
	text "Having witnessed"
	line "your interaction"
	cont "with the GYARADOS"
	cont "I am convinced"
	cont "you harbour an"
	cont "extraordinary"
	cont "affinity with"
	cont "#mon."

	para "A rare gift."

	para "As rare as your"
	line "gift for battle."

	para "I intend to"
	line "uncover those"
	cont "orchestrating"
	cont "these events and"
	cont "put them to a"
	cont "decisive end."

	para "Will you aid me"
	line "in this quest?"
	done

LakeOfRageLanceRadioSignalText:
	text "Our collaboration"
	line "is ordained by"
	cont "those #mon"
	cont "who are suffering."

	para "We shall permit"
	line "them endure this"
	cont "no longer."

	para "The signal that"
	line "torments our"
	cont "kin originates"
	cont "from Mahogany"
	cont "Town."

	para "Some there guard"
	line "their secrets"
	cont "well."

	para "Meet me at the"
	line "mart."

	para "We shall press"
	line "the limits of"
	cont "their loyalty."
	done

LakeOfRageLanceRefusedText:
	text "You can not"
	line "fool me as easily"
	cont "as you do"
	cont "yourself."

	para "I see how this"
	line "suffering stokes"
	cont "the inferno of"
	cont "justice in your"
	cont "heart."
	done

LakeOfRageLanceAskHelpText:
	text "I humbly request"
	line "your aid in this"
	cont "matter?"
	done

LakeOfRageGyaradosCryText:
	text "GYARADOS: Gyashaa!"
	done

LakeOfRageGrampsText:
	text "Aye I've seen many"
	line "a sea monster in"
	cont "ma day."
	para "Ones like dat red"
	line "beauty out der,"
	cont "they have a way of"
	cont "known a strong"
	cont "trainer from a"
	cont "weak one."
	para "Aye, I reckon dat"
	line "one won't pay no"
	cont "mind ta any"
	cont "trainer with less"
	cont "than 6 badges I'd"
	cont "say."
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "You conquered that"
	line "mighty red beast!"
	para "Aye I've only"
	line "known one other"
	cont "trainer ta tame"
	cont "such a beast."
	para "Fella who likes ta"
	line "wear a cape."
	done

LakeOfRageCooltrainerFText:
	text "GYARADOS has base"
	line "81 speed."

	para "That's exactly 1"
	line "point higher than"
	cont "DRAGONITE."

	para "I'm sure I can"
	line "use this to my"
	cont "advantage one"
	cont "day."

	para "WHAHAHA..."
	done

FisherAndreSeenText:
	text "I saw a RED"
	line "GYARADOS!"

	para "I must have it!"

	para "It's bound to be"
	line "really strong"
	cont "right?"

	para "I'm kicking my"
	line "current GYARADOS"
	cont "out of my team!"
	done

FisherAndreBeatenText:
	text "Damn it GYARADOS!"

	para "This is all"
	line "your fault!"
	done

FisherAndreAfterBattleText:
	text "My #mon are"
	line "just too weak!"

	para "I don't want to"
	line "train them!"

	para "I want them to"
	line "be strong from"
	cont "the get go."
	done

FisherRaymondSeenText:
	text "Blimey!"

	para "Dat der RED"
	line "GYARADOS outta"
	cont "be worth a few"
	cont "bob eh?"

	para "You had better"
	line "be givin it to me."
	done

FisherRaymondBeatenText:
	text "Steady on mate!"
	done

FisherRaymondAfterBattleText:
	text "If I paint a"
	line "regular GYARADOS"
	cont "RED...."

	para "That outta do it!"
	done

CooltrainermAaronSeenText:
	text "Come on!"

	para "Bring it on!"

	para "Oh..."

	para "I was told it"
	line "is dangerous to"
	cont "be around here."

	para "I am ready for"
	line "it."

	para "I fear nothing!"
	done

CooltrainermAaronBeatenText:
	text "Stop!"

	para "Help me!"
	done

CooltrainermAaronAfterBattleText:
	text "I'm not as strong"
	line "as I thought!"

	para "What am I"
	line "doing here."

	para "I'm lost in the"
	line "woods."

	para "I'm so scared!"
	done

CooltrainerfLoisText:
	text "Oh hello."

	para "This place is"
	line "beautiful."

	para "But I can't see"
	line "the beauty."

	para "Three years ago"
	line "my little brother"
	cont "went missing here."

	para "He said he had"
	line "ate a DITTO and"
	cont "could TRANSFORM."

	para "He said he would"
	line "TRANSFORM into a"
	cont "dragon."

	para "All I remember"
	line "are the colourful"
	cont "CHOICE SPECS he"
	cont "was wearing when"
	cont "he left."

	para "I miss him."
	done

MeetWesleyText:
	text "WESLEY: Well, how"
	line "do you do?"

	para "Seeing as how it's"
	line "Wednesday today,"

	para "I'm WESLEY of"
	line "Wednesday."
	done

WesleyGivesGiftText:
	text "Pleased to meet"
	line "you. Please take a"
	cont "souvenir."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "beefs up the power"
	cont "of fighting moves."
	done

WesleyWednesdayText:
	text "WESLEY: Since you"
	line "found me, you must"

	para "have met my broth-"
	line "ers and sisters."

	para "Or did you just"
	line "get lucky?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

LakeOfRageSignText:
	text "Lake of Rage,"
	line "also known as"
	cont "Gyarados Lake."
	done

FishingGurusHouseSignText:
	text "FISHING GURU'S"
	line "HOUSE"
	done

LakeOfRageFieldMon1Script:
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 36
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear LAKEOFRAGE_FIELDMON_1
	end

LakeOfRageFieldMon2Script:
	trainer GRENINJA, FIELD_MON, EVENT_FIELD_MON_2, LakeOfRagePokemonAttacksText, 72, 0, .script
.script
    disappear LAKEOFRAGE_FIELDMON_2
    end

LakeOfRageFieldMon3Script:
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 37
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear LAKEOFRAGE_FIELDMON_3
	end

LakeOfRageFieldMon4Script:
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 38
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear LAKEOFRAGE_FIELDMON_4
	end

LakeOfRagePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

LakeOfRageFieldMon5Script:
	faceplayer
	cry SHELGON
	pause 15
	loadwildmon SHELGON, 35
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear LAKEOFRAGE_FIELDMON_5
	end

LakeOfRageFieldMon6Script:
	faceplayer
	cry SALAMENCE
	pause 15
	loadwildmon SALAMENCE, 70
    loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT_ESCAPE
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear LAKEOFRAGE_FIELDMON_6
	end

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CooltrainerfLoisScript, -1
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageChoiceSpecs, EVENT_LAKE_OF_RAGE_CHOICE_SPECS
	object_event 15, 24, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LakeOfRageFieldMon1Script, EVENT_FIELD_MON_1
	object_event 29,  26, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, LakeOfRageFieldMon2Script, EVENT_FIELD_MON_2
	object_event 24, 17, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LakeOfRageFieldMon3Script, EVENT_FIELD_MON_3
	object_event 31, 10, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LakeOfRageFieldMon4Script, EVENT_FIELD_MON_4
	object_event 7,  10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LakeOfRageFieldMon5Script, EVENT_FIELD_MON_5
	object_event 28,  2, SPRITE_SALAMENCE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LakeOfRageFieldMon6Script, EVENT_FIELD_MON_6
