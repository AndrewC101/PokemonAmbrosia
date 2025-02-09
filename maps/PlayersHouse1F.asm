	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F
	const PLAYERSHOUSE1F_DAD

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Dad

.DummyScene0:
	end

.DummyScene1:
	end

.Dad:
    disappear PLAYERSHOUSE1F_DAD
    checkevent EVENT_BEAT_DAD
    iffalse .end
    appear PLAYERSHOUSE1F_DAD
.end
    endcallback

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iftrue .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	writetext GiveWarpBeaconText
	verbosegiveitem ESCAPE_POD
	writetext StaySafeText
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

GiveWarpBeaconText:
    text "It is dangerous"
    line "out there."

    para "If you get stuck"
    line "or lost use this."

    para "It will keep you"
    line "safe."
    prompt

StaySafeText:
    text "Stay safe out"
    line "there <PLAYER>."

    para "I know you want to"
    line "find your father."

    para "...."

    para "Make sure you"
    line "come back to me!"
    prompt

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	checkevent EVENT_ROUTE_30_BATTLE
	iffalse .start
	opentext
	checkevent EVENT_BEAT_WALLACE
	iffalse .checkDad
	writetext PostWallaceMumText
	sjump .continue
.checkDad
    checkevent EVENT_BEAT_DAD
    iffalse .default
	writetext PostDadMumText
	sjump .continue
.default
    writetext MumDefaultText
.continue
    waitbutton
    closetext
.start
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime EVE | NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
    checkevent EVENT_BEAT_DAD
    iffalse .noDad
    jumptext PlayerHouse1FFridgePostDadText
.noDad
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

PostWallaceMumText:
	text "We are so proud of"
	line "you <PLAYER>."
	para "You are our child."
	para "Our CHAMPION."
	para "Our HERO."
	para "You will do great"
	line "things and we will"
	cont "always love you."
	done

PostDadMumText:
	text "I wish we could"
	line "all be a family"
	cont "again."
	para "But I know that is"
	line "selfish."
	para "You are the"
	line "CHAMPION of JOHTO"
	cont "and people need"
	cont "you."
	done

MumDefaultText:
	text "I'm proud of you"
	line "<PLAYER>."
	para "You are smart and"
	line "kind."
	para "I know you'll be a"
	line "great trainer."
	done

ElmsLookingForYouText:
	text "Oh <PLAYER>!"

	para "This is it."

	para "Your big day is"
	line "here."

	para "I'm proud of you"
	line "beginning your"
	cont "#MON training."

	para "I can't believe"
	line "you are sixteen"
	cont "already!"

	para "Oh! Don't forget"
	line "your #GEAR."

	para "It's back from the"
	line "repair shop."

	para "Here you go!"
	done

MomGivesPokegearText:
	text "This device has"
	line "all sorts of"
	cont "useful tools."

	para "You should set the"
	line "day on it."
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "Did you forget"
	line "your PHONE?"
	done

KnowTheInstructionsText:
	text "Ah good."

	para "You will need"
	line "it for me to"
	cont "contact you."
	done

DontKnowTheInstructionsText:
	text "Awk <PLAYER>."

	para "This is why I"
	line "worry."

	para "You will need"
	line "it for me to"
	cont "contact you."
	done

InstructionsNextText:
	text "Don't forget to"
	line "call me and let"
	cont "me know how you"
	cont "are doing."
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM is"
	line "waiting for you."

	para "Good luck my"
	line "darling."

	para "Mummy loves you."
	done

SoWhatWasProfElmsErrandText:
	text "So your first"
	line "task is to meet"
	cont "PROF OAK."

	para "OAK is very well"
	line "respected in"
	cont "KANTO."

	para "He also used to"
	line "be a trainer."

	para "He understands us"
	line "better than most"
	cont "academics."

	para "Be polite."
	done

ImBehindYouText:
	text "Go on <PLAYER>!"

	para "Your Mum is fully"
	line "behind you!"
	done

PlayersHouse1FStoveText:
	text "Looks like dinner"
	line "is pasta..."
	para "again."
	done

PlayersHouse1FSinkText:
	text "The sink is always"
	line "spotless."
	para "Mum has been"
	line "cleaning a lot"
	cont "recently."
	done

PlayerHouse1FFridgePostDadText:
    text "Full of Dads"
    line "food!"
    done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "There is an"
	line "empty shelf"
	cont "where Dads food"
	cont "used to be."
	done

PlayersHouse1FTVText:
	text "So many streaming"
	line "services and still"
	cont "nothing worth"
	cont "watching..."
	done

DadScript:
    faceplayer
    opentext
    checkevent EVENT_BEAT_WALLACE
    iftrue .beatWallace
    writetext DadTalkText
    waitbutton
    closetext
    sjump .heal
.beatWallace
    writetext DadPostWallaceText
    waitbutton
    closetext
.heal
    special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext DadGoodLuckText
	waitbutton
	closetext
	end

DadTalkText:
    text "I am very proud"
    line "of you <PLAYER>."

    para "I am sorry for"
    line "trying to stop"
    cont "you."

    para "It's clear to me"
    line "now I never had"
    cont "a change against"
    cont "a CHAMPION."

    para "Go and use your"
    line "strength to do"
    cont "what I could not."

	para "Now you and your"
	line "#MON should"
	cont "have a good rest."
	done

DadPostWallaceText:
    text "You are a hero!"

    para "I can't believe"
    line "the great CHAMPION"
    cont "you have become."

    para "...."

    para "I wasn't there"
    line "for you when you"
    cont "needed me."

    para "And now you don't"
    line "need anyone."

    para "You are my kid"
    line "and my hero."

	para "Now you and your"
	line "#MON should"
	cont "have a good rest."
	done

DadGoodLuckText:
	text "Good luck out"
	line "there <PLAYER>."
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"
	done

NeighborText:
	text "<PLAY_G>, this is"
	line "your big day!"

	para "I know your father"
	line "would be proud."
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY | EVE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	object_event  7,  3, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DadScript, EVENT_TEMP_EVENT_1
