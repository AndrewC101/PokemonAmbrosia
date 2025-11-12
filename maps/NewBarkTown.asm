	object_const_def
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_SILVER
	const NEWBARKTOWN_FIELDMON_6
	const NEWBARKTOWN_REPEL_WOMAN
	const NEWBARKTOWN_CRYSTAL
	const NEWBARKTOWN_SILVER_FINAL
	const NEWBARKTOWN_CRYSTAL_FINAL
	const NEWBARKTOWN_PIKACHU

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .SilverAndCrystal

.DummyScene0:
	end

.DummyScene1:
	end

.SilverAndCrystal
    disappear NEWBARKTOWN_CRYSTAL
    disappear NEWBARKTOWN_CRYSTAL_FINAL
    disappear NEWBARKTOWN_SILVER_FINAL

    checkevent EVENT_BEAT_CRYSTAL_7
    iffalse .end
    appear NEWBARKTOWN_CRYSTAL_FINAL
    appear NEWBARKTOWN_SILVER_FINAL
.end
    endcallback

.FlyPoint:
    appear NEWBARKTOWN_FIELDMON_6
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BeatE4
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.BeatE4:
	writetext Text_SafeWithYou
	waitbutton
	closetext
	end

NewBarkTownFisherScript:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .notBeatE4
    jumptextfaceplayer Text_FishBeatE4
.notBeatE4
	jumptextfaceplayer Text_ElmDiscoveredNewMon

NewBarkTownSilverScript:
    faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .noPokemon
	writetext NewBarkTownRivalNotThatOneText
	waitbutton
	closetext
	end
.noPokemon
	writetext NewBarkTownRivalText1
	waitbutton
	closetext
	turnobject NEWBARKTOWN_SILVER, LEFT
	opentext
	writetext NewBarkTownRivalText2
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_SILVER
	applymovement PLAYER, NewBarkTown_SilverPushesYouAwayMovement
	stopfollow
	pause 5
	turnobject NEWBARKTOWN_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, NewBarkTown_SilverShovesYouOutMovement
	applymovement NEWBARKTOWN_SILVER, NewBarkTown_SilverReturnsToTheShadowsMovement
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign:
	jumptext NewBarkTownElmsHouseSignText

NewBarkTown_TeacherRunsToYouMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTown_TeacherRunsToYouMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

NewBarkTown_TeacherBringsYouBackMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_TeacherBringsYouBackMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_SilverPushesYouAwayMovement:
	turn_head UP
	step DOWN
	step_end

NewBarkTown_SilverShovesYouOutMovement:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

NewBarkTown_SilverReturnsToTheShadowsMovement:
	step RIGHT
	step_end

Text_GearIsImpressive:
	text "I tried being a"
	line "trainer once."

	para "But I ran into"
	line "a huge RATICATE"
	cont "out there."

	para "I ran for it!"

	para "You can run by"
	line "holding B."

	para "Unless you have"
	line "SPORT SHOES, then"
	cont "you can run by"
	cont "default."
	done

Text_SafeWithYou:
	text "Hello Champion"
	line "<PLAYER>!"
	para "You make me so"
	line "proud to be from"
	cont "New Bark Town."
	para "I feel safe with"
	line "you here."
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#mon!"
	done

Text_YourMonIsAdorable:
	text "Oh! Your #mon"
	line "looks strong!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should see"
	line "your Mum one"
	cont "last time."
	done

Text_ElmDiscoveredNewMon:
	text "Hi, <PLAYER>!"

	para "I remember when"
	line "your Dad left"
	cont "for his #mon"
	cont "training."

	para "He was strong!"

	para "He caught a"
	line "raging URSARING."

	para "He can take care"
	line "of himself."
	done

Text_FishBeatE4:
	text "Wow <PLAYER> you"
	line "are the Champion!"
	para "Your dad is so"
	line "proud."
	para "You are way"
	line "stronger than he"
	cont "could ever be!"
	done

NewBarkTownRivalNotThatOneText:
    text "You think that one"
    line "was the strongest?"

    para "You are as useless"
    line "as that #mon."

    para "I'll have to do"
    line "this myself."

    para "Get lost kid!"
    done

NewBarkTownRivalText1:
	text "<……>"

	para "Look at those"
	line "#mon!"
	done

NewBarkTownRivalText2:
	text "Hey how would"
	line "like to help me!"

	para "Bring me one of"
	line "those #mon."

	para "Be sure to pick"
	line "the one that looks"
	cont "the strongest."

	para "Now go!"
	done

NewBarkTownSignText:
	text "New Bark Town"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "Elm #mon LAB"
	done

NewBarkTownElmsHouseSignText:
	text "Elm'S HOUSE"
	done

NeedToGetAPokemon:
    turnobject PLAYER, DOWN
	opentext
	writetext NewBarkTownBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_NewBarkTownTurnBack
    end

NeedToGetAPokemon2:
    turnobject PLAYER, LEFT
	opentext
	writetext NewBarkTownBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_NewBarkTownTurnLeft
    end

NewBarkTownBlockText:
    text "I need to get"
    line "a #mon from"
    cont "Prof.Elm!"
    done

ElmsMission:
    turnobject PLAYER, LEFT
	opentext
	writetext ElmsMissionText
    waitbutton
    closetext
    applymovement PLAYER, Movement_NewBarkTownTurnLeft
    end

ElmsMissionText:
    text "I better see"
    line "Prof.Elm!"
    done

Movement_NewBarkTownTurnBack:
	step DOWN
	step_end

Movement_NewBarkTownTurnLeft:
	step LEFT
	step_end

NewBarkFieldMon6Script:
	faceplayer
	cry STARLY
	pause 15
	loadwildmon STARLY, 3
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear NEWBARKTOWN_FIELDMON_6
	end

NewBarkTownRepelScript:
	faceplayer
	opentext
	checkitem REPULSOR
	iftrue .GotRepulsor
	writetext NewBarkTownRepulsorText
	promptbutton
	verbosegiveitem REPULSOR
	promptbutton
.GotRepulsor:
	writetext NewBarkTownGotRepelsText
	waitbutton
	closetext
	end

NewBarkTownRepulsorText:
    text "#mon are"
    line "friends."

    para "They will often"
    line "come up to greet"
    cont "you even if"
    cont "you're in a"
    cont "hurry."

    para "This will"
    line "help with that."
    done

NewBarkTownGotRepelsText:
    text "#mon are"
    line "friends."

    para "But some can be"
    line "dangerous."

    para "You should always"
    line "be prepared."

    para "REPULSOR will"
    line "keep weaker"
    cont "#mon away."

    para "You can turn it"
    line "on or off in the"
    cont "key items menu."
    done

CrystalScript1:
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, NewBarkTownMovement_PlayerRight
    sjump CrystalScript
    end

CrystalScript2:
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, NewBarkTownMovement_PlayerUpAndRight
    sjump CrystalScript
    end

CrystalScript:
    playmusic MUSIC_DANCING_HALL
    opentext
    writetext Crystal1_WaitUpText
    waitbutton
    closetext
    turnobject PLAYER, RIGHT
    appear NEWBARKTOWN_CRYSTAL
    applymovement NEWBARKTOWN_CRYSTAL, NewBarkTownMovement_CrystalApproaches
    opentext
    writetext Crystal1_ChallengeText
    waitbutton
    closetext

	winlosstext Crystal1LosesText, Crystal1WinsText
    loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadtrainer CRYSTAL, CRYSTAL_1
	startbattle
	setevent EVENT_BEAT_CRYSTAL_1
	setmapscene NEW_BARK_TOWN, SCENE_CUSTOM_FINISHED
	reloadmap

	opentext
	writetext Crystal1_WellDoneText
	waitbutton
	closetext
	special FadeOutMusic
	turnobject NEWBARKTOWN_CRYSTAL, DOWN
	pause 20
	opentext
	writetext Crystal1_SorryText
	waitbutton
	playmusic MUSIC_NEW_BARK_TOWN
	turnobject NEWBARKTOWN_CRYSTAL, LEFT
	writetext Crystal1_GoodLuckText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement NEWBARKTOWN_CRYSTAL, NewBarkTownMovement_CrystalLeaves
	disappear NEWBARKTOWN_CRYSTAL
	special HealParty
.end
    end

NewBarkTownMovement_PlayerRight:
    step RIGHT
    step_end

NewBarkTownMovement_PlayerUpAndRight:
    step UP
    step RIGHT
    step_end

Crystal1_WaitUpText:
    text "Hey!"

    para "Wait up."
    done

NewBarkTownMovement_CrystalApproaches:
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step UP
    big_step LEFT
    step_end

Crystal1_ChallengeText:
    text "You just got a"
    line "#mon!"

    para "I recently got"
    line "my first #mon"
    cont "too."

    para "My Dad gave it"
    line "to me."

    para "Well you know what"
    line "we have to do now."

    para "Let's battle?"
    done

Crystal1LosesText:
    text "Aww you did"
    line "well RIOLU."
    done

Crystal1WinsText:
    text "You did really"
    line "well."
    done

Crystal1_WellDoneText:
    text "That was fun!"

    para "Now we have to"
    line "beat all Gym"
    cont "Leaders."

    para "Beat all the ELITE"
    line "FOUR and Champion."

    para "Crush the Hoenn"
    line "army and save all"
    cont "Johto and Kanto!"

    para "Race you!"
    done

Crystal1_SorryText:
    text "I'm sorry."

    para "I hope you find"
    line "your Dad."
    done

Crystal1_GoodLuckText:
    text "I'm sure I'll see"
    line "you along the way."

    para "I'm serious about"
    line "that race though!"

    para "Good luck!"
    done

NewBarkTownMovement_CrystalLeaves:
    big_step DOWN
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    big_step LEFT
    step_end

FinalSilverScript:
    faceplayer
    opentext
	writetext SilverFinalGeneralText
	waitbutton
    closetext
	opentext
	writetext RematchTextSilverFinal
	nooryes
	iftrue .fight
	writetext RematchRefuseTextSilverFinal
	waitbutton
	closetext
	end
.fight
	writetext SilverFinalPreBattleText
	waitbutton
	closetext
	winlosstext SilverFinalLossText, SilverFinalWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer RIVAL2, RIVAL2_SILVER_CAVE
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	special HealParty
	opentext
	writetext SilverFinalAfterBattleText
	waitbutton
	closetext
	end
.lose
    reloadmap
	special HealParty
	opentext
	writetext SilverFinalLoseAfterBattleText
	waitbutton
	closetext
	end

FinalCrystalScript:
    faceplayer
    opentext
	writetext CrystalFinalGeneralText
	waitbutton
    closetext
	opentext
	writetext RematchTextCrystalFinal
	nooryes
	iftrue .fight
	writetext RematchRefuseTextCrystalFinal
	waitbutton
	closetext
	end
.fight
	writetext CrystalFinalPreBattleText
	waitbutton
	closetext
	winlosstext CrystalFinalLossText, CrystalFinalWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CRYSTAL, CRYSTAL_7
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	special HealParty
	opentext
	writetext CrystalFinalAfterBattleText
	waitbutton
	closetext
	end
.lose
    reloadmap
    special HealParty
	opentext
	writetext CrystalFinalLoseAfterBattleText
	waitbutton
	closetext
	end

SilverFinalGeneralText:
    text "This place is"
    line "peaceful."

    para "The rest of the"
    line "world is frantic"
    cont "and busy."

    para "Like I used to"
    line "be."

    para "I'm glad Crytal"
    line "insisted I come"
    cont "here and stay a"
    cont "while."

    para "I'm happier than"
    line "I can remember"
    cont "being before."
    done

RematchTextSilverFinal:
    text "However I don't"
    line "want you becoming"
    cont "too complacent."

    para "How about another"
    line "battle?"
    done

RematchRefuseTextSilverFinal:
    text "I guess we both"
    line "know how it would"
    cont "go."
    done

SilverFinalPreBattleText:
    text "Don't you dare"
    line "hold back!"
    done

SilverFinalLossText:
    text "Some things never"
    line "change."
    done

SilverFinalWinText:
    text "You let me win!"
    done

SilverFinalLoseAfterBattleText:
    text "You've gone soft"
    line "it seems."

    para "How disappointing."
    done

SilverFinalAfterBattleText:
    text "I don't even care"
    line "that I will never"
    cont "beat you."

    para "I am happy with"
    line "who I am and"
    cont "what I have"
    cont "achieved."

    para "Losing to Crytal"
    line "however..."

    para "That would be"
    line "different."
    done

CrystalFinalGeneralText:
    text "Hey <PLAYER>."

    para "It's really good"
    line "to see you again."

    para "I think I've had"
    line "enough"
    cont "adventuring."

    para "I'm happy here"
    line "with my family."

    para "Though I miss"
    line "not seeing our"
    cont "local hero more"
    cont "often!"
    done

RematchTextCrystalFinal:
    text "It can get a"
    line "little boring"
    cont "sometimes though."

    para "I can battle"
    line "<RIVAL> and it's"
    cont "fun but I'd like"
    cont "to battle you."

    para "How about it?"
    done

RematchRefuseTextCrystalFinal:
    text "Ah I see."

    para "You don't want"
    line "to embarrass me."

    para "How gallant of"
    line "you."
    done

CrystalFinalPreBattleText:
    text "Let's have some"
    line "fun!"
    done

CrystalFinalLossText:
    text "What a surprising"
    line "conclusion!"

    para "That was fun!"
    done

CrystalFinalWinText:
    text "You don't have"
    line "to let me win."
    done

CrystalFinalLoseAfterBattleText:
    text "I won?!"

    para "I must truly be"
    line "the best trainer"
    cont "ever huh."

    para "Thanks for letting"
    line "me win."
    done

CrystalFinalAfterBattleText:
    text "You know I am"
    line "still amazed at"
    cont "the adventure we"
    cont "had."

    para "You are the hero"
    line "who saved me and"
    cont "all of us."

    para "But you're also"
    line "my friend."

    para "And I miss you."

    para "Now get out"
    line "there and keep"
    cont "changing the"
    cont "world!"
    done

NewBarkPikachu:
    opentext
    writetext NewBarkPikachuText
    cry PIKACHU
    waitbutton
    closetext
    end

NewBarkPikachuText:
    text "Pika! Pika!"
    line "Pikachu!"
    done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 17, PLAYERS_HOUSE_1F, 1
	warp_event  6, 15, ELMS_LAB, 1
	warp_event  3, 23, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 25, ELMS_HOUSE, 1

	def_coord_events
	coord_event  1, 20, SCENE_DEFAULT, NewBarkTown_TeacherStopsYouScene1
	coord_event  1, 21, SCENE_DEFAULT, NewBarkTown_TeacherStopsYouScene2
	coord_event  10, 11, SCENE_DEFAULT, NeedToGetAPokemon
	coord_event  11, 11, SCENE_DEFAULT, NeedToGetAPokemon
	coord_event  18, 17, SCENE_DEFAULT, NeedToGetAPokemon2
	coord_event  18, 18, SCENE_DEFAULT, NeedToGetAPokemon2
	coord_event  1, 20, SCENE_CUSTOM_1, CrystalScript1
	coord_event  1, 21, SCENE_CUSTOM_1, CrystalScript2
	coord_event  18, 17, SCENE_CUSTOM_2, ElmsMission
	coord_event  18, 18, SCENE_CUSTOM_2, ElmsMission


	def_bg_events
	bg_event  8, 20, BGEVENT_READ, NewBarkTownSign
	bg_event 11, 17, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3, 15, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 25, BGEVENT_READ, NewBarkTownElmsHouseSign

	def_object_events
	object_event  6, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 10, 20, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	object_event  3, 14, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownSilverScript, EVENT_RIVAL_NEW_BARK_TOWN
	object_event 12,  7, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NewBarkFieldMon6Script, EVENT_FIELD_MON_6
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRepelScript, -1
	object_event  7, 21, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1

	object_event 14, 20, SPRITE_SILVER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FinalSilverScript, EVENT_TEMP_EVENT_2
	object_event 12, 22, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FinalCrystalScript, EVENT_TEMP_EVENT_3
	object_event 11,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, NewBarkPikachu, -1


