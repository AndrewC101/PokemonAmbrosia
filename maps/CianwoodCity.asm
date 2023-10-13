	object_const_def
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE
    const CIANWOODCITY_FIELDMON_1
    const CIANWOODCITY_FIELDMON_2
    const CIANWOODCITY_FIELDMON_3
    const CIANWOODCITY_FIELDMON_4
    const CIANWOODCITY_FIELDMON_5
    const CIANWOODCITY_HOEN_SPY
    const CIANWOODCITY_GIRL_1
    const CIANWOODCITY_GIRL_2
    const CIANWOODCITY_MEWTWO
    const CIANWOODCITY_POLIWRATH

CianwoodCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune
	callback MAPCALLBACK_OBJECTS, .CianwoodCityFieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.CianwoodCityFieldMon:
; Pokemon which always appear
    disappear CIANWOODCITY_POLIWRATH
    disappear CIANWOODCITY_GIRL_1
    disappear CIANWOODCITY_GIRL_2
    disappear CIANWOODCITY_MEWTWO

    checkevent EVENT_BEAT_SOLDIER_10
    iffalse .mons
    appear CIANWOODCITY_GIRL_1

.mons
    appear CIANWOODCITY_FIELDMON_2
    appear CIANWOODCITY_FIELDMON_3
    appear CIANWOODCITY_FIELDMON_4
    appear CIANWOODCITY_FIELDMON_5

    random 2
    ifequal 1, .spawn1
    disappear CIANWOODCITY_FIELDMON_1
    sjump .end
.spawn1
    appear CIANWOODCITY_FIELDMON_1

.end
    endcallback

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript: ; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodBeachSign:
	jumptext CianwoodBeachSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

;CianwoodCityRock:
;	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#MON knew how"
	line "to FLY…"
	done

ChucksWifeBeatChuckText:
	text "But you can't use"
	line "FLY without this"
	cont "city's GYM BADGE."

	para "If you beat the"
	line "GYM LEADER here,"
	cont "come see me."

	para "I'll have a nice"
	line "gift for you."
	done

ChucksWifeGiveHMText:
	text "That's CIANWOOD's"
	line "GYM BADGE!"

	para "Then you should"
	line "take this HM."
	done

ChucksWifeFlySpeechText:
	text "Teach FLY to your"
	line "#MON."

	para "You will be able"
	line "to FLY instantly"

	para "to anywhere you "
	line "have visited."
	done

ChucksWifeChubbyText:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

CianwoodCityYoungsterText:
	text "If you use FLY,"
	line "you can get back"

	para "to OLIVINE in-"
	line "stantly."
	done

CianwoodCityPokefanMText:
	text "Boulders to the"
	line "north of town can"
	cont "be crushed."

	para "They may be hiding"
	line "something."

	para "Your #MON could"
	line "use ROCK SMASH to"
	cont "break them."
	done

CianwoodCityLassText:
	text "CHUCK, the GYM"
	line "LEADER, spars with"

	para "his fighting #-"
	line "MON."
	done

CianwoodCityUnusedText:
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done

EusineSuicuneText:
	text "EUSINE: Yo,"
	line "<PLAYER>."

	para "Wasn't that"
	line "SUICUNE just now?"

	para "I only caught a"
	line "quick glimpse, but"

	para "I thought I saw"
	line "SUICUNE running on"
	cont "the waves."

	para "SUICUNE is beau-"
	line "tiful and grand."

	para "And it races"
	line "through towns and"

	para "roads at simply"
	line "awesome speeds."

	para "It's wonderful…"

	para "I want to see"
	line "SUICUNE up close…"

	para "I've decided."

	para "I'll battle you as"
	line "a trainer to earn"
	cont "SUICUNE's respect!"

	para "Come on, <PLAYER>."
	line "Let's battle now!"
	done

EusineBeatenText:
	text "I hate to admit"
	line "it, but you win."
	done

EusineAfterText:
	text "You're amazing,"
	line "<PLAYER>!"

	para "No wonder #MON"
	line "gravitate to you."

	para "I get it now."

	para "I'm going to keep"
	line "searching for"
	cont "SUICUNE."

	para "I'm sure we'll see"
	line "each other again."

	para "See you around!"
	done

CianwoodCitySignText:
	text "CIANWOOD CITY"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "CIANWOOD CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

CianwoodPokeSeerSignText:
	text "THE # SEER"
	line "AHEAD"
	done

CianwoodBeachSignText:
	text "CIANWOOD"
	line "BEACH"
	done

CianwoodCityFieldMon1Script:
	trainer HAWLUCHA, FIELD_MON, EVENT_FIELD_MON_1, CianwoodCityPokemonAttacksText, 54, 0, .script
.script
    disappear CIANWOODCITY_FIELDMON_1
    end

CianwoodCityPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

CianwoodCityFieldMon2Script:
	faceplayer
	cry MACHOKE
	pause 15
	loadwildmon MACHOKE, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear CIANWOODCITY_FIELDMON_2
	end

CianwoodCityFieldMon3Script:
	faceplayer
	cry GURDURR
	pause 15
	loadwildmon GURDURR, 33
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear CIANWOODCITY_FIELDMON_3
	end

CianwoodCityFieldMon4Script:
	faceplayer
	cry POLIWHIRL
	pause 15
	loadwildmon POLIWHIRL, 31
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear CIANWOODCITY_FIELDMON_4
	end
	
CianwoodCityFieldMon5Script:
	faceplayer
	cry STARAPTOR
	pause 15
	loadwildmon STARAPTOR, 32
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear CIANWOODCITY_FIELDMON_5
	end

PsychicGirlScript1:
    appear CIANWOODCITY_GIRL_1
    playmusic MUSIC_SHOW_ME_AROUND
    applymovement CIANWOODCITY_GIRL_1, Movement_PsychicGirlAppears
    turnobject PLAYER, LEFT
    opentext
    writetext CameHereToGetMedicine
    waitbutton
    yesorno
    iffalse .dontBelieve
.again
    writetext HoenSpyBelieve
    waitbutton
    yesorno
    iffalse .dontBelieve
    writetext SeeYouAtBeach
    waitbutton
    closetext
    setevent EVENT_PSYCHIC_GIRL_WAITING
    applymovement CIANWOODCITY_GIRL_1, Movement_PsychicGirlLeaves
    disappear CIANWOODCITY_GIRL_1
    special RestartMapMusic
    end
.dontBelieve
    writetext JustLikeEveryoneElse
    waitbutton
    sjump .again

PsychicGirlScript2:
    appear CIANWOODCITY_GIRL_2
    playmusic MUSIC_SHOW_ME_AROUND
    applymovement CIANWOODCITY_GIRL_2, Movement_PsychicGirlAppearsAgain
PsychicGirlTalkScript:
    faceplayer
    opentext
    writetext HeIsUpHere
    waitbutton
    yesorno
    closetext
    iffalse .noSave
    opentext
    special TryQuickSave
    closetext
    iffalse .noSave
    follow CIANWOODCITY_GIRL_2, PLAYER
    applymovement CIANWOODCITY_GIRL_2, Movement_PsychicGirlToShore
    stopfollow
    opentext
    writetext HeIsOverThere
    waitbutton
    closetext
    playsound SFX_WARP_FROM
    waitsfx
    special FadeOutMusic
    disappear CIANWOODCITY_GIRL_2
    warpfacing RIGHT, CIANWOOD_CITY, 18, 8
    moveobject CIANWOODCITY_GIRL_2, 18, 9
    turnobject CIANWOODCITY_GIRL_2, RIGHT
    appear CIANWOODCITY_GIRL_2
    follow PLAYER, CIANWOODCITY_GIRL_2
    applymovement PLAYER, Movement_ApproachSpy
    stopfollow
    applymovement CIANWOODCITY_GIRL_2, Movement_GirlBesidePlayerSpy
    special FadeOutMusic
    pause 15
    turnobject CIANWOODCITY_HOEN_SPY, LEFT
    opentext
    writetext WhoAreYou
    waitbutton
    closetext
    turnobject CIANWOODCITY_GIRL_2, UP
    opentext
    writetext HeIsASpy
    waitbutton
    closetext
    opentext
    writetext YesIAm
    waitbutton
    closetext
	winlosstext HoenSpyBeatenText, HoenSpyWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SOLDIER, SOLDIER_SPY
	startbattle
	reloadmap
	special FadeOutMusic
	special HealParty
	playsound SFX_TACKLE
	waitsfx
	applymovement PLAYER, Movement_PlayerKnockedBackBySpy
	applymovement CIANWOODCITY_GIRL_2, Movement_GirlBehindPlayer
	opentext
	writetext Poliwrath
	waitbutton
	closetext
	appear CIANWOODCITY_POLIWRATH
	cry POLIWRATH
	opentext
	writetext DrownThem
	waitbutton
	closetext
	cry POLIWRATH
	turnobject CIANWOODCITY_GIRL_2, LEFT
	opentext
	writetext KittyHelp
	waitbutton
	closetext
	pause 15
	special FadeOutPalettes
	playsound SFX_THUNDER
	waitsfx
	appear CIANWOODCITY_MEWTWO
	cry MEWTWO
	turnobject CIANWOODCITY_GIRL_2, RIGHT
	setval RED
	writemem wOtherTrainerClass
	setval RED_MEWTWO
	writemem wOtherTrainerID
	special OverridePlayerParty
	setval MUSIC_FINAL_BATTLE
	writemem wBattleMusicOverride
	winlosstext HoenSpyBeatenText, HoenSpyWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_WEAK_BATTLE
	loadtrainer SOLDIER, SOLDIER_SPY
	startbattle
	reloadmap
	playmusic MUSIC_RED_DUNGEON
	special LoadPokemonData
	special HealParty
	setevent EVENT_BEAT_SOLDIER_10
	opentext
	writetext HoenSpyBegs
	waitbutton
	closetext
	playsound SFX_PSYCHIC
	waitsfx
	special FadeOutPalettes
	disappear CIANWOODCITY_HOEN_SPY
	disappear CIANWOODCITY_POLIWRATH
	special RestartMapMusic
	opentext
	writetext ThankYouKitty
	waitbutton
	closetext
	cry MEWTWO
	playsound SFX_WARP_FROM
	waitsfx
	disappear CIANWOODCITY_MEWTWO
	turnobject PLAYER, LEFT
	opentext
	writetext ThanksHereIsTm
	waitbutton
	verbosegiveitem TM_PSYCHIC_M
	writetext MoveUsBack
	closetext
	playsound SFX_WARP_FROM
	waitsfx
    disappear CIANWOODCITY_GIRL_2
    warpfacing DOWN, CIANWOOD_CITY, 12, 10
    moveobject CIANWOODCITY_GIRL_2, 12, 11
    appear CIANWOODCITY_GIRL_2
    turnobject CIANWOODCITY_GIRL_2, UP
    opentext
	writetext ByeBye
	waitbutton
	closetext
    applymovement CIANWOODCITY_GIRL_2, Movement_PsychicGirlFinished
    pause 10
    disappear CIANWOODCITY_GIRL_2
.end
    end
.noSave
    opentext
    writetext ComebackWhenReady
    waitbutton
    closetext
    applymovement CIANWOODCITY_GIRL_2, Movement_NoSave
    disappear CIANWOODCITY_GIRL_2
    applymovement PLAYER, Movement_PlayerDownCianwood
    end

CameHereToGetMedicine:
    text "Hey <PLAYER>!"

    para "I'm AMBER."

    para "Hang on don't"
    line "tell me..."

    para "You are here to"
    line "get some special"
    cont "medicine for a"
    cont "sick #MON."

    para "I can tell because"
    line "I am a Psychic."

    para "That's how I"
    line "know your name."

    para "I'm from SAFFRON"
    line "which is full of"
    cont "Psychics."

    para "My dad sent me"
    line "here to escape"
    cont "the war."

    para "But a man showed"
    line "up here a few days"
    cont "ago and I am sure"
    cont "he is a HOEN spy."

    para "I can read his"
    line "mind and I'm"
    cont "sure!"

    para "Do you believe"
    line "me?"
    done

HoenSpyBelieve:
    text "Most people don't"
    line "believe me."

    para "Just like they"
    line "don't believe in"
    cont "KITTY my invisible"
    cont "friend."

    para "But you believe"
    line "me right?"
    done

SeeYouAtBeach:
    text "Together we will"
    line "take this HOEN"
    cont "spy down!"

    para "Meet me at the"
    line "beach to the"
    cont "North."

    para "The spy is"
    line "by the lighthouse."
    done

JustLikeEveryoneElse:
    text "Don't be like"
    line "all the others."

    para "Just be open"
    line "minded!"
    done

Movement_PsychicGirlAppears:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    step_end

Movement_PsychicGirlLeaves:
    big_step LEFT
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    step_end

HeIsUpHere:
    text "I see you made"
    line "it past that"
    cont "weird guy!"

    para "His mind is like"
    line "a black hole of"
    cont "obsession."

    para "Anyway..."

    para "The spy is right"
    line "up here!"

    para "This could get"
    line "dangerous. You"
    cont "should save your"
    cont "progress."

    para "Save your game?"
    done

HeIsOverThere:
    text "He is right over"
    line "there by the"
    cont "lighthouse."

    para "I'm sure he plans"
    line "to use it to guide"
    cont "other HOEN forces."

    para "Hang on..."

    para "My ABRA can"
    line "TELEPORT us"
    cont "over."
    done

WhoAreYou:
    text "How did you sneak"
    line "up on me!"

    para "I am just a"
    line "sailor waiting"
    cont "for my ship to"
    cont "arrive."

    para "Run along now"
    line "children and"
    cont "forget you saw"
    cont "me."
    done

HeIsASpy:
    text "He is mindful of"
    line "his facial"
    cont "expression and"
    cont "vocal tone."

    para "He is trying hard"
    line "to withhold his"
    cont "anger and disgust"
    cont "for us."

    para "...."

    para "There was panic"
    line "for just a moment."

    para "Now there is..."

    para "Nothing."

    para "...."

    para "He means to"
    line "kill us!!"
    done

YesIAm:
    text "Very good little"
    line "Psychic."

    para "I am no meager"
    line "spy."

    para "I am a CAPTAIN"
    line "of the HOEN"
    cont "fleet."

    para "I report directly"
    line "to ADMIRAL DRAKE."

    para "And he reports"
    line "directly to"
    cont "FUHRER WALLACE."

    para "I am likely"
    line "the strongest"
    cont "trainer in all"
    cont "of JOHTO."

    para "Stronger even"
    line "than your"
    cont "ELITE FOUR."

    para "Such a weak"
    line "people are not"
    cont "meant to survive."
    done

HoenSpyBeatenText:
    text "What are you!"
    done

HoenSpyWinsText:
    text "Long live"
    line "FUHRER WALLACE!"
    done

Poliwrath:
    text "It is not safe"
    line "for children to"
    cont "play by this"
    cont "lighthouse."

    para "The sea is a"
    line "merciless force."

    para "Today it has"
    line "claimed two more"
    cont "young victims."

    para "POLIWRATH!"
    done

DrownThem:
    text "Drown them."

    para "Leave the bodies"
    line "on the shore."
    done

KittyHelp:
    text "Ahhhhh!"

    para "KITTY HELP!"
    done

HoenSpyBegs:
    text "NO..."

    para "What are you!"

    para "No... Stop..."

    para "AHHGGGHHHGAAA!!.."
    done

ThankYouKitty:
    text "Thank you"
    line "KITTY."

    para "I knew you"
    line "would come."

    para "Thank you"
    line "so much."
    done

ThanksHereIsTm:
    text "Thank you"
    line "<PLAYER>."

    para "I could feel"
    line "how desperate"
    cont "you were to"
    cont "protect me."

    para "I think that"
    line "is what really"
    cont "called KITTY"
    cont "here."

    para "You might have"
    line "latent Psychic"
    cont "powers too."

    para "This will help"
    line "you unlock them."
    done

MoveUsBack:
    text "Hang on..."

    para "ABRA can TELEPORT"
    line "us back if we"
    cont "concentrate..."
    done

ByeBye:
    text "Thank you"
    line "again."

    para "I can sense..."

    para "This will not"
    line "be the last"
    cont "time you save"
    cont "people from the"
    cont "forces of HOEN."

    para "Good luck"
    line "<PLAYER>"
    done

Movement_PsychicGirlAppearsAgain:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

Movement_PsychicGirlToShore:
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step RIGHT
    step RIGHT
    step_end

Movement_PlayerKnockedBackBySpy:
	fix_facing
	set_sliding
    big_step LEFT
    remove_sliding
    remove_fixed_facing
    step_end

Movement_GirlBehindPlayer:
    big_step LEFT
    big_step LEFT
    big_step UP
    turn_head RIGHT
    step_end

Movement_PsychicGirlFinished:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

Movement_ApproachSpy:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

Movement_GirlBesidePlayerSpy:
    step DOWN
    step RIGHT
    step_end

ComebackWhenReady:
    text "OK, come back"
    line "when you are"
    cont "ready."
    done

Movement_NoSave:
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    big_step UP
    step_end

Movement_PlayerDownCianwood:
    step DOWN
    step_end

PsychicGirlFirstScene:
    checkevent EVENT_PSYCHIC_GIRL_WAITING
    iftrue .end
    sjump PsychicGirlScript1
.end
    end

PsychicGirlSecondScene:
    checkevent EVENT_BEAT_SOLDIER_10
    iftrue .end
    checkevent EVENT_PSYCHIC_GIRL_WAITING
    iffalse .end
    sjump PsychicGirlScript2
.end
    end

PsychicGirlPostScript:
    jumptextfaceplayer PsychicGirlPostText

PsychicGirlPostText:
    text "Hey <PLAYER>!"

    para "I know you will"
    line "do great things."

    para "And we will"
    line "meet again."

    para "For now I like"
    line "just relaxing"
    cont "here."
    done

HoenSpyScript:
    jumptextfaceplayer HoenSpyText

HoenSpyText:
    text "Run along child."

    para "I am admiring"
    line "the strategic"
    cont "importance of"
    cont "this lighthouse."
    done

FlyScene:
    checkevent EVENT_GOT_HM02_FLY
    iftrue .end
    checkevent EVENT_BEAT_CHUCK
    iffalse .end
    applymovement CIANWOODCITY_POKEFAN_F, ChucksWife_Approach
    scall CianwoodCityChucksWife
    applymovement CIANWOODCITY_POKEFAN_F, ChucksWife_Leave
.end
    end

ChucksWife_Approach:
    step LEFT
    step LEFT
    turn_head UP
    step_end

ChucksWife_Leave:
    step RIGHT
    step RIGHT
    step_end

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 53, MANIAS_HOUSE, 1
	warp_event  8, 55, CIANWOOD_GYM, 1
	warp_event 23, 55, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 59, CIANWOOD_PHARMACY, 1
	warp_event  9, 43, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 49, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 29, POKE_SEERS_HOUSE, 1

	def_coord_events
	coord_event 11, 28, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine
	coord_event 15, 60, SCENE_ALWAYS, PsychicGirlFirstScene
	coord_event 11, 27, SCENE_ALWAYS, PsychicGirlSecondScene
	coord_event  8, 56, SCENE_ALWAYS, FlyScene

	def_bg_events
	bg_event 20, 46, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 57, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 55, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 59, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 44, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 36, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event 12, 22, BGEVENT_READ, CianwoodBeachSign
	bg_event  4, 31, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 41, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 21, 49, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 45, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 54, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event 10, 57, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 33, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 26, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	object_event 15, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, CianwoodCityFieldMon1Script, EVENT_FIELD_MON_1
	object_event 12, 8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, CianwoodCityFieldMon2Script, EVENT_FIELD_MON_2
	object_event 7,  38, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityFieldMon3Script, EVENT_FIELD_MON_3
	object_event 25, 46, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodCityFieldMon4Script, EVENT_FIELD_MON_4
	object_event 7, 16, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityFieldMon5Script, EVENT_FIELD_MON_5
	object_event 23, 8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, HoenSpyScript, EVENT_BEAT_SOLDIER_10
	object_event 13, 55, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PsychicGirlPostScript, EVENT_TEMP_EVENT_1
	object_event 11, 22, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PsychicGirlTalkScript, EVENT_TEMP_EVENT_2
	object_event 22,  8, SPRITE_MEWTWO, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEMP_EVENT_3
	object_event 23,  9, SPRITE_POLIWAG, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_FIELD_MON_6

