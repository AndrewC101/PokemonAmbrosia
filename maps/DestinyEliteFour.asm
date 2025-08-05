    object_const_def
    const DESTINYELITEFOUR_SABRINA
    const DESTINYELITEFOUR_BRUNO
    const DESTINYELITEFOUR_KAREN
    const DESTINYELITEFOUR_GIOVANNI

DestinyEliteFour_MapScripts:
	def_scene_scripts

	def_callbacks

MasterSabrinaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_SABRINA
	iftrue .FightDone
.fight
	writetext MasterSabrinaSeenText
	waitbutton
	closetext
	winlosstext MasterSabrinaBeatenText, MasterSabrinaWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SABRINA, MASTER_SABRINA
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	checkevent EVENT_BEAT_MASTER_SABRINA
	iftrue .skipFlags
	setevent EVENT_BEAT_MASTER_SABRINA
	setmapscene DESTINY_ELITE_FOUR, SCENE_CUSTOM_3
.skipFlags
	opentext
	writetext MasterSabrinaAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterSabrinaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyEliteFour
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinyEliteFour
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterSabrinaLoseAfterBattleText
    waitbutton
    closetext
    end

MasterSabrinaSeenText:
	text "Perfection is only"
	line "a concept."
	para "Many a fool waste"
	line "their lives"
	cont "striving for"
	cont "perfection."
	para "An imperfect"
	line "solution is the"
	cont "only solution."
	done

MasterSabrinaBeatenText:
    text "Pragmatic."
    done

MasterSabrinaWinText:
    text "An imperfect"
    line "battle."
    done

MasterSabrinaAfterBattleText:
	text "There is an"
	line "anomaly, a"
	cont "singularity where"
	cont "perfection exists."
	para "When I focus all"
	line "my psychic power I"
	cont "can almost see it."
	para "A man made of"
	line "gold."
	done

MasterSabrinaLoseAfterBattleText:
	text "There is no"
	line "perfect #MON"
	cont "team."
	para "Trying to create"
	line "such a thing is"
	cont "folly."
	done

MasterBrunoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_BRUNO
	iftrue .FightDone
.fight
	writetext MasterBrunoSeenText
	waitbutton
	closetext
	winlosstext MasterBrunoBeatenText, MasterBrunoWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer BRUNO, MASTER_BRUNO
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	checkevent EVENT_BEAT_MASTER_BRUNO
	iftrue .skipFlags
	setevent EVENT_BEAT_MASTER_BRUNO
	setmapscene DESTINY_ELITE_FOUR, SCENE_CUSTOM_1
.skipFlags
	opentext
	writetext MasterBrunoAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterBrunoAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyEliteFour
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinyEliteFour
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterBrunoLoseAfterBattleText
    waitbutton
    closetext
    end

MasterBrunoSeenText:
	text "You have defeated"
	line "many to reach"
	cont "here."
	para "However those"
	line "victories mean"
	cont "nothing!"
	para "Because now I am"
	line "your opponent!"
	done

MasterBrunoBeatenText:
    text "You may pass."
    done

MasterBrunoWinText:
    text "You may not pass."
    done

MasterBrunoAfterBattleText:
	text "I have failed to"
	line "stop you."
	para "You are stronger"
	line "than I."
	para "But many more"
	line "trials await."
	done

MasterBrunoLoseAfterBattleText:
	text "You have failed."
	para "You are not strong"
	line "enough to proceed."
	para "But you should not"
	line "give up."
	para "Always keep"
	line "fighting."
	done

MasterKarenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_KAREN
	iftrue .FightDone
.fight
	writetext MasterKarenSeenText
	waitbutton
	closetext
	winlosstext MasterKarenBeatenText, MasterKarenWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer KAREN, MASTER_KAREN
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	checkevent EVENT_BEAT_MASTER_KAREN
	iftrue .skipFlags
	setevent EVENT_BEAT_MASTER_KAREN
	setmapscene DESTINY_ELITE_FOUR, SCENE_CUSTOM_2
.skipFlags
	opentext
	writetext MasterKarenAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterKarenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyEliteFour
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinyEliteFour
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterKarenLoseAfterBattleText
    waitbutton
    closetext
    end

MasterKarenSeenText:
	text "The world is a"
	line "chaotic swirl of"
	cont "unlikely"
	cont "interactions."
	para "You must hone your"
	line "vision to identify"
	cont "the things you can"
	cont "control, and the"
	cont "things you can"
	cont "not."
	done

MasterKarenBeatenText:
	text "You were in"
	line "control."
	done

MasterKarenWinText:
	text "It was inevitable."
	done

MasterKarenAfterBattleText:
	text "Always be aware of"
	line "your changing"
	cont "situation and what"
	cont "things you can"
	cont "control."
	para "That is the"
	line "starting point of"
	cont "all strategy."
	done

MasterKarenLoseAfterBattleText:
	text "Identify what you"
	line "can control, focus"
	cont "only on those"
	cont "things and nothing"
	cont "else."
	done

MasterGiovanniScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER_GIOVANNI
	iftrue .FightDone
.fight
	writetext MasterGiovanniSeenText
	waitbutton
	closetext
	winlosstext MasterGiovanniBeatenText, MasterGiovanniWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer GIOVANNI, MASTER_GIOVANNI
	startbattle
	ifequal LOSE, .Lose
	reloadmapafterbattle
	checkevent EVENT_BEAT_MASTER_GIOVANNI
	iftrue .skipFlags
	setevent EVENT_BEAT_MASTER_GIOVANNI
	setmapscene DESTINY_ELITE_FOUR, SCENE_FINISHED
.skipFlags
	opentext
	writetext MasterGiovanniAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext MasterGiovanniAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDestinyEliteFour
	yesorno
	iftrue .fight
	writetext RematchRefuseTextDestinyEliteFour
	waitbutton
	closetext
	end
.Lose
    special HealParty
    reloadmap
    opentext
    writetext MasterGiovanniLoseAfterBattleText
    waitbutton
    closetext
    end

MasterGiovanniSeenText:
	text "I expected you"
	line "would reach me."
	para "I have a lot of"
	line "experience in"
	cont "business and in"
	cont "raising #MON."
	para "But I have greater"
	line "expertise in one"
	cont "thing than any"
	cont "other."
	para "Regret."
	para "Regret will follow"
	line "you like a shadow"
	cont "everywhere you go."
	para "It will drag you"
	line "down and suffocate"
	cont "you."
	para "You must learn to"
	line "rid yourself of"
	cont "this burden."
	done

MasterGiovanniBeatenText:
	text "This is one battle"
	line "I don't regret."
	done

MasterGiovanniWinText:
	text "A regrettable"
	line "conclusion."
	done

MasterGiovanniAfterBattleText:
	text "It is natural to"
	line "make mistakes in"
	cont "life."
	para "My greatest"
	line "mistake was not"
	cont "spending time with"
	cont "my son."
	para "But trust me on"
	line "this."
	para "It really is never"
	line "too late."
	para "Now go face the"
	line "HALL OF CHAMPIONS."
	done

MasterGiovanniLoseAfterBattleText:
	text "It is never too"
	line "late to do"
	cont "something."
	para "Maybe you can"
	line "never put things"
	cont "right, but you can"
	cont "always make them"
	cont "better in some"
	cont "way."
	done

RematchTextDestinyEliteFour:
    text "Shall we have"
    line "another match?"
    done

RematchRefuseTextDestinyEliteFour:
    text "I will always"
    line "be here."
    done

Movement_DestinyEliteFourTurnBack:
	step DOWN
	step_end

KarenBlockScript:
	opentext
	writetext DefeatOpponentText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyEliteFourTurnBack
    end

BrunoBlockScript:
	opentext
	writetext DefeatOpponentText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyEliteFourTurnBack
    end

SabrinaBlockScript:
	opentext
	writetext DefeatOpponentText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyEliteFourTurnBack
    end

GiovanniBlockScript:
	opentext
	writetext DefeatOpponentText
    waitbutton
    closetext
    applymovement PLAYER, Movement_DestinyEliteFourTurnBack
    end

DefeatOpponentText:
    text "You must defeat"
    line "your opponent"
    cont "to proceed!"
    done

DestinyEliteFour_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, DESTINY_FRONTIER, 16
	warp_event  5, 17, DESTINY_FRONTIER, 17

	warp_event  4, 2, DESTINY_ELITE_FOUR, 5
	warp_event  5, 2, DESTINY_ELITE_FOUR, 6
	warp_event  18, 17, DESTINY_ELITE_FOUR, 3
	warp_event  19, 17, DESTINY_ELITE_FOUR, 4

	warp_event  18, 2, DESTINY_ELITE_FOUR, 9
	warp_event  19, 2, DESTINY_ELITE_FOUR, 10
	warp_event  4, 39, DESTINY_ELITE_FOUR, 7
	warp_event  5, 39, DESTINY_ELITE_FOUR, 8

	warp_event  4, 24, DESTINY_ELITE_FOUR, 13
	warp_event  5, 24, DESTINY_ELITE_FOUR, 14
	warp_event  18, 39, DESTINY_ELITE_FOUR, 11
	warp_event  19, 39, DESTINY_ELITE_FOUR, 12

	warp_event  18, 24, DESTINY_SQUARE, 1
	warp_event  19, 24, DESTINY_SQUARE, 2

	def_coord_events
	coord_event  4,  3, SCENE_DEFAULT, BrunoBlockScript
	coord_event  5,  3, SCENE_DEFAULT, BrunoBlockScript
	coord_event 18,  3, SCENE_CUSTOM_1, KarenBlockScript
	coord_event 19,  3, SCENE_CUSTOM_1, KarenBlockScript
	coord_event  4, 25, SCENE_CUSTOM_2, SabrinaBlockScript
	coord_event  5, 25, SCENE_CUSTOM_2, SabrinaBlockScript
	coord_event 18, 25, SCENE_CUSTOM_3, GiovanniBlockScript
	coord_event 19, 25, SCENE_CUSTOM_3, GiovanniBlockScript

	def_bg_events

	def_object_events
	object_event  5, 29, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterSabrinaScript, -1
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterBrunoScript, -1
	object_event 19,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterKarenScript, -1
	object_event 19, 29, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MasterGiovanniScript, -1
