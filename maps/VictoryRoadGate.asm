	object_const_def
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_BLACK_BELT1
	const VICTORYROADGATE_BLACK_BELT2
	const VICTORYROADGATE_CRYSTAL

VictoryRoadGate_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadGateNoop1Scene, SCENE_VICTORYROADGATE_BADGE_CHECK
	scene_script VictoryRoadGateNoop2Scene, SCENE_VICTORYROADGATE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VictoryRoadGateBlackBeltCallback

VictoryRoadGateNoop1Scene:
	end

VictoryRoadGateNoop2Scene:
	end

VictoryRoadGateBlackBeltCallback:
	disappear VICTORYROADGATE_CRYSTAL
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .HideLeftBlackBelt
	checkflag ENGINE_FLYPOINT_SILVER_CAVE
	iftrue .HideLeftBlackBelt
	appear VICTORYROADGATE_BLACK_BELT1
	sjump .CheckRightBlackBelt
.HideLeftBlackBelt:
	disappear VICTORYROADGATE_BLACK_BELT1
.CheckRightBlackBelt:
	checkflag ENGINE_RISINGBADGE
	iftrue .HideRightBlackBelt
	appear VICTORYROADGATE_BLACK_BELT2
	endcallback
.HideRightBlackBelt:
	disappear VICTORYROADGATE_BLACK_BELT2
	endcallback

VictoryRoadGateBadgeCheckScript:
	turnobject PLAYER, LEFT
	sjump _VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
_VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	promptbutton
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_VICTORYROADGATE_NOOP
	end

VictoryRoadGateLeftBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateLeftBlackBeltText

VictoryRoadGateRightBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateRightBlackBeltText

VictoryRoadGateCrystalScript:
	checkevent EVENT_BEAT_CRYSTAL_5
	iftrue .end
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	playmusic MUSIC_DANCING_HALL
	appear VICTORYROADGATE_CRYSTAL
	applymovement VICTORYROADGATE_CRYSTAL, VictoryRoadGateMovement_CrystalApproaches

	opentext
	writetext VictoryRoadGateCrystalText_Intro
	waitbutton
	closetext

	special FadeOutMusic
	applymovement VICTORYROADGATE_CRYSTAL, VictoryRoadGateMovement_CrystalRight
	opentext
	writetext VictoryRoadGateCrystalText_Serious
	waitbutton
	closetext

	applymovement VICTORYROADGATE_CRYSTAL, VictoryRoadGateMovement_CrystalLeft
	playmusic MUSIC_INDIGO_PLATEAU
	opentext
	writetext VictoryRoadGateCrystalText_Battle
	waitbutton
	closetext

	special HealParty
	winlosstext VictoryRoadGateCrystal5LosesText, VictoryRoadGateCrystal5WinsText
	readmem wDifficulty
	ifequal DIFFICULTY_HARD, .hard_crystal
	sjump .normal
.hard_crystal
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CRYSTAL, CRYSTAL_5
	sjump .battle
.normal
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer CRYSTAL, CRYSTAL_5
.battle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_5
	setscene SCENE_VICTORYROADGATE_NOOP

	playmusic MUSIC_INDIGO_PLATEAU
	opentext
	writetext VictoryRoadGateCrystalText_KeepItUp
	waitbutton
	closetext
	turnobject VICTORYROADGATE_CRYSTAL, DOWN
	pause 10
	opentext
	writetext VictoryRoadGateCrystalText_IMeanIt
	waitbutton
	closetext
	applymovement VICTORYROADGATE_CRYSTAL, VictoryRoadGateMovement_CrystalLeaves
	disappear VICTORYROADGATE_CRYSTAL
.end
	end

VictoryRoadGateMovement_CrystalApproaches:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

VictoryRoadGateMovement_CrystalLeaves:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

VictoryRoadGateMovement_CrystalRight:
	slow_step RIGHT
	step_end

VictoryRoadGateMovement_CrystalLeft:
	slow_step LEFT
	turn_head UP
	step_end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end

VictoryRoadGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "You don't have all"
	line "the Gym Badges of"
	cont "Johto."

	para "I'm sorry, but I"
	line "can't let you go"
	cont "through."
	done

VictoryRoadGateEightBadgesText:
	text "Oh! The eight"
	line "Badges of Johto!"

	para "You are worthy!"
	done

VictoryRoadGateLeftBlackBeltText:
	text "This way leads to"
	line "Mt.Silver."

	para "An ancient and"
	line "forbidden place."

	para "Said to be the"
	line "bridge between"
	cont "worlds."

	para "The #mon out"
	line "there would"
	cont "kill a normal"
	cont "trainer without"
	cont "a thought."
	done

VictoryRoadGateRightBlackBeltText:
	text "The Elite Four"
	line "are some of the"
	cont "best trainers in"
	cont "the world."

	para "Only the best"
	line "trainers may"
	cont "face them."
	done

VictoryRoadGateCrystalText_Intro:
	text "You are going to"
	line "challenge the"
	cont "Elite Four."

	para "The final test."

	para "If you win you"
	line "earn the title of"
	cont "Champion."

	para "Then you will"
	line "have to head to"
	cont "Kanto to fight"
	cont "in the war..."
	done

VictoryRoadGateCrystalText_Serious:
	text "It seems so long"
	line "ago we were"
	cont "leaving New"
	cont "Bark together."

	para "I didn't think"
	line "it would get this"
	cont "far."

	para "Now that we are"
	line "here..."

	para "I don't want to"
	line "go on."

	para "I don't want to"
	line "be on the front"
	cont "line against"
	cont "the Hoenn army."

	para "I want us to"
	line "just have fun"
	cont "forever."

	para "But that can't"
	line "happen."
	done

VictoryRoadGateCrystalText_Battle:
	text "I guess we are"
	line "part of the big"
	cont "bad world now."

	para "You know what"
	line "we have to do."
	done

VictoryRoadGateCrystal5LosesText:
	text "You win."
	done

VictoryRoadGateCrystal5WinsText:
	text "Can we just"
	line "go home?"
	done

VictoryRoadGateCrystalText_KeepItUp:
	text "Well, it seems"
	line "you have won our"
	cont "race."

	para "I can't believe"
	line "how strong you"
	cont "have become."

	para "If anyone can"
	line "win the war,"
	cont "you can."

	para "And I'll be right"
	line "there with you!"

	para "I'm not letting"
	line "you go alone."

	para "But I need more"
	line "training first."

	para "Now you march in"
	line "there and wipe"
	cont "the floor with"
	cont "the Elite Four."

	para "Good luck"
	line "<PLAYER>."
	done

VictoryRoadGateCrystalText_IMeanIt:
	text "I really mean"
	line "that."
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  7, ROUTE_22, 1
	warp_event 18,  7, ROUTE_22, 1
	warp_event  9, 17, ROUTE_26, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event  9,  0, VICTORY_ROAD, 1
	warp_event  0,  0, VICTORY_ROAD, 1
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	def_coord_events
	coord_event  9,  1, SCENE_ALWAYS, VictoryRoadGateCrystalScript
	coord_event 10, 11, SCENE_VICTORYROADGATE_BADGE_CHECK, VictoryRoadGateBadgeCheckScript

	def_bg_events

	def_object_events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateLeftBlackBeltScript, EVENT_TEMP_EVENT_2
	object_event 12,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRightBlackBeltScript, EVENT_TEMP_EVENT_3
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
