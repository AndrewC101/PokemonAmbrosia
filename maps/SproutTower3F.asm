	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER
	const SPROUTTOWER3F_FIELDMON_1
    const SPROUTTOWER3F_FIELDMON_2
    const SPROUTTOWER3F_FIELDMON_3

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SproutTower3FFieldMon

.SproutTower3FFieldMon:
    appear SPROUTTOWER3F_FIELDMON_2
    random 2
    ifequal 1, .spawn
    disappear SPROUTTOWER3F_FIELDMON_1
    sjump .honedge
.spawn
    appear SPROUTTOWER3F_FIELDMON_1
.honedge
    random 2
    ifequal 1, .spawn1
    disappear SPROUTTOWER3F_FIELDMON_3
    sjump .end
.spawn1
    appear SPROUTTOWER3F_FIELDMON_3
.end
    endcallback

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_SILVER, SproutTower3FRivalApproachesElderMovement
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .FightDone
	writetext SageLiSeenText
	waitbutton
	closetext
	setval MUSIC_HO_OH_BATTLE
	writemem wBattleMusicOverride
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.FightDone:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
    opentext
	writetext RematchTextLi
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextLi
	waitbutton
	closetext
	end
.rematch
    writetext SageLiSeenText
	waitbutton
	closetext
	setval MUSIC_HO_OH_BATTLE
	writemem wBattleMusicOverride
	winlosstext SageLiBeatenText, 0
    loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	end

RematchTextLi:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextLi:
    text "Maybe next time."
    done

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball BRIGHTPOWDER

SproutTower3FEscapeRope:
	itemball SCOPE_LENS

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ELDER: You are"
	line "powerful."

	para "And though you"
	line "may not know it"
	cont "there is light"
	cont "in your heart."

	para "But your anger"
	line "and arrogance"
	cont "make you weak."

	para "And susceptible"
	line "to the darkness."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Humph!"

    para "The ELDER speaks"
    line "of light and"
    cont "dark like a child."

    para "Nothing in the"
    line "world is so clear."

    para "One persons hero"
    line "is another persons"
    cont "oppressor."

    para "There are only"
    line "two kinds of"
    cont "people."

    para "The strong and"
    line "the weak."

    para "That is how it"
    line "has always been."

    para "I know which one"
    line "you and him are."

    para "Stay out of"
    line "my way."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> used"
	line "ESCAPE POD!"
	done

SageLiSeenText:
	text "Ah it is good"
	line "to see you."

	para "There are in"
	line "fact three types"
	cont "of people."

	para "Those that fight"
	line "the darkness."

	para "Such as me."

	para "Those that are"
	line "seduced by the"
	cont "darkness."

	para "Like a former"
	line "brother of ours."

	para "And those like"
	line "that poor man."

	para "Caught in the"
	line "middle."

	para "Oblivious to"
	line "the danger."

	para "Let me see which"
	line "you are."
	done

SageLiBeatenText:
	text "Incredible!"
	done

SageLiTakeThisFlashText:
	text "You have within"
	line "you a light."

	para "Brighter than"
	line "any I have ever"
	cont "felt."

	para "A light that"
	line "will cut through"
	cont "any darkness."

	para "You must take"
	line "this."
	done

SageLiFlashExplanationText:
	text "FLASH is the"
	line "manifestation of"
	cont "ones will to"
	cont "reject the"
	cont "inevitability"
	cont "of death."

	para "It will shine in"
	line "the darkest of"
	cont "places."

	para "You do not have"
	line "to teach the move"
	cont "for your #mon"
	cont "to use it."

	para "However you"
	line "will need the"
	cont "VIOLET GYM"
	cont "BADGE."

	para "Check your"
	line "#mon when in"
	cont "a dark place to"
	cont "see which can"
	cont "use it."
	done

SageLiAfterBattleText:
	text "I am but a"
	line "candle trying"
	cont "desperately to"
	cont "stay alight."

	para "You are a blazing"
	line "star that erases"
	cont "all darkness"

	para "But even stars"
	line "fade."

	para "In the end all"
	line "things return"
	cont "to the dark."

	para "We must make our"
	line "peace with this."
	done

SageJinSeenText:
	text "I see it in my"
	line "dreams."
	para "A BELLSPROUT that"
	line "has reached the"
	cont "impossible"
	cont "pinnacle of power."
	done

SageJinBeatenText:
	text "It is out there"
	line "somewhere!"
	done

SageJinAfterBattleText:
	text "A BELLSPROUT that"
	line "can fell the very"
	cont "gods with a single"
	cont "stroke of its"
	cont "leaf."
	done

SageTroySeenText:
	text "We do not speak"
	line "his name."

	para "But he was my"
	line "friend."
	done

SageTroyBeatenText:
	text "You remind me"
	line "of him."
	done

SageTroyAfterBattleText:
	text "XEHANORT."

	para "He thought that"
	line "light and dark"
	cont "must exist in"
	cont "balance."

	para "And that we as"
	line "beings of pure"
	cont "light disrupt"
	cont "that balance."

	para "He left for"
	line "DARK CAVE."

	para "We have not"
	line "seen him since."
	done

SageNealSeenText:
	text "HMs are special"
	line "moves that change"
	cont "the world around"
	cont "you."

	para "You don't need to"
	line "teach them to"
	cont "#mon to be"
	cont "able to use them."
	done

SageNealBeatenText:
	text "FLASH shall no"
	line "doubt be yours."
	done

SageNealAfterBattleText:
	text "A #mon can"
	line "use an HM as"
	cont "long as it is"
	cont "able to learn it."

	para "It doesn't"
	line "actually need to"
	cont "know it."
	done

SproutTower3FPaintingText:
	text "It's a powerful"
	line "painting of a"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "A #mon statue…"

	para "There is something"
	line "eerie about it."
	done

SproutTower3FFieldMon1Script:
	faceplayer
	cry LITWICK
	pause 15
	loadwildmon LITWICK, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear SPROUTTOWER3F_FIELDMON_1
	end

SproutTower3FFieldMon2Script:
	faceplayer
	cry BELLSPROUT
	pause 15
	loadwildmon BELLSPROUT, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SPROUTTOWER3F_FIELDMON_2
	end

SproutTower3FFieldMon3Script:
	faceplayer
	cry HONEDGE
	pause 15
	loadwildmon HONEDGE, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear SPROUTTOWER3F_FIELDMON_3
	end

SproutTower3BellSproutScript:
    opentext
    writetext BellSproutText
    cry BELLSPROUT
    waitbutton
    closetext
    end

BellSproutText:
    text "Bellsprout"
    done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
	object_event  8, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, SproutTower3FFieldMon1Script, EVENT_FIELD_MON_1
	object_event  5,  1, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 2, SproutTower3FFieldMon2Script, EVENT_FIELD_MON_2
	object_event 14,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, SproutTower3FFieldMon3Script, EVENT_FIELD_MON_3
	object_event  9,  2, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, SproutTower3BellSproutScript, -1
