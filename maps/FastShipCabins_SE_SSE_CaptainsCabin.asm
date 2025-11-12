	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	def_scene_scripts

	def_callbacks

.DummyScene: ; unreferenced
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInQuickly
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, SSAquaGrandpaApproachesPlayerMovement
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton

	checkitem RAINBOW_WING
	iffalse .giveRainbowWing
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	writetext SSAquaGrandpaHaveThisSilverWingText
	sjump .continue
.giveRainbowWing
	verbosegiveitem RAINBOW_WING
	setevent EVENT_GOT_RAINBOW_WING
	writetext SSAquaGrandpaHaveThisRainbowWingText
.continue
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	checkitem RAINBOW_WING
	iffalse .giveRainbowWing
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	writetext SSAquaGrandpaHaveThisSilverWingText
	sjump .continue
.giveRainbowWing
	verbosegiveitem RAINBOW_WING
	setevent EVENT_GOT_RAINBOW_WING
	writetext SSAquaGrandpaHaveThisRainbowWingText
.continue
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step UP
	step UP
	turn_head LEFT
	step_end

SSAquaGrandpaApproachesPlayerMovement:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "My goodness! That"
	line "little girl asks"
	cont "all sorts of"
	cont "questions."

	para "Questions about"
	line "the ship, the"
	cont "route, the port."

	para "She knows her"
	line "stuff."
	done

SSAquaCaptainHowDoYouLikeText:
	text "How are you"
	line "finding your trip"
	cont "on this fine,"
	cont "luxurious ship?"

	para "We hold the BLUE"
	line "RIBAND for KANTO"
	cont "crossing."
	done

SSAquaCantFindGranddaughterText:
	text "Oh hello again!"

	para "I still haven't"
	line "found my..."

	para "Granddaughter."

	para "Have you seen her?"

	para "If you do please"
	line "let her know"
	cont "I'm looking for"
	cont "her."
	done

SSAquaEntertainedGranddaughterText:
	text "Well done! You"
	line "are as talented"
	cont "as I have heard."

	para "Champion <PLAYER>."

	para "I am in fact a"
	line "secret agent and"
	cont "this little girl"
	cont "is one of our"
	cont "best operatives."

	para "We use the"
	line "granddaughter"
	cont "persona as a"
	cont "cover."

	para "We have completed"
	line "our mission."

	para "The captain is"
	line "not selling"
	cont "secrets to HOENN."

	para "Here, I have been"
	line "authorized to give"
	cont "this to you."
	done

SSAquaGrandpaHaveThisText:
    text "I want you to"
    line "have this!"
    done

SSAquaGrandpaHaveThisRainbowWingText:
    text "There used to be a"
	line "tower in"
	cont "GOLDENROD CITY."

	para "But it was old and"
	line "creaky."

	para "So it was replaced"
	line "with the RADIO"
	cont "TOWER."

	para "I dug up that"
	line "wing during"
	cont "construction."

	para "I heard that all"
	line "sorts of #mon"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps…"

	para "That wing has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY…"
	done

SSAquaGrandpaHaveThisSilverWingText:
    text "I found that when"
    line "traveling the sea"
    cont "near OLIVINE."

    para "There was a storm"
    line "that day."

    para "It was the worst"
    line "storm I had ever"
    cont "seen."

    para "Everyone was in"
    line "panic."

    para "Then the sun"
    line "pierced the clouds"
    cont "and the storm just"
    cont "disappeared."

    para "A huge #mon"
    line "flew over me!"

    para "It filled the"
    line "sky."

    para "I know it must"
    line "have saved us."

    para "I followed it out"
    line "to the WHIRL"
    cont "ISLANDS."

    para "But all I found"
    line "was this feather."

    para "Maybe you will be"
    line "the one to"
    cont "find it."
	done

SSAquaGrandpaTravellingText:
	text "Well done"
	line "Champion."

	para "I am satisfied"
	line "the captain hasn't"
	cont "been compromised."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "CAPTAIN, play with"
	line "me, please?"

	para "I'm bored! I want"
	line "to play more!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Hi! Will you play"
	line "with us?"

	para "Ah my granddad is"
	line "looking for me."

	para "OK I'll go back"
	line "to him."

	para "Thank you for"
	line "answering all my"
	cont "questions MR"
	cont "CAPTAIN sir."
	done

SSAquaGranddaughterWasPlayingMText:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this guy!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this lady!"
	done

SSAquaGranddaughterHadFunText:
	text "I had lots of fun"
	line "playing!"

	para "The CAPTAIN was"
	line "most cooperative."

	para "And well informed."
	done

PokefanmColinSeenText:
	text "War is coming."

	para "We can either"
	line "wait patiently"
	cont "or go out to"
	cont "meet it."

	para "Now let the"
	line "battle begin!"
	done

PokefanmColinBeatenText:
	text "And beyond that."
	done

PokefanmColinAfterBattleText:
	text "We managed to"
	line "flee from the"
	cont "commandos."

	para "Now we are"
	line "searching for"
	cont "our home."

	para "For GORGON."
	done

TwinsMegandpeg1SeenText:
	text "The world isn't"
	line "split into heroes"
	cont "and villains."

	para "We both have"
	line "light and dark"
	cont "within us."

	para "I bask in the"
	line "light."
	done

TwinsMegandpeg1BeatenText:
	text "The sun sets."
	done

TwinsMegandpeg1AfterBattleText:
	text "My cat is the"
	line "cutest, don't"
	cont "you think?"
	done

TwinsMegandpeg2SeenText:
	text "The world isn't"
	line "split into heroes"
	cont "and villains."

	para "We both have"
	line "light and dark"
	cont "within us."

	para "I wallow in"
	line "the dark."
	done

TwinsMegandpeg2BeatenText:
	text "The sun rises."
	done

TwinsMegandpeg2AfterBattleText:
	text "My cat is for"
	line "sure the most"
	cont "adorable!"
	done

PsychicRodneySeenText:
	text "Have you heard"
	line "SAFFRON has a"
	cont "second GYM?"

	para "They showed up"
	line "and beat up the"
	cont "PSYCHICS."

	para "I'm sure the"
	line "karate guys are"
	cont "loving this!"
	done

PsychicRodneyBeatenText:
	text "Psychic power"
	line "never gives up."
	done

PsychicRodneyAfterBattleText:
	text "I'm going to"
	line "SAFFRON to do"
	cont "my part in"
	cont "defending the"
	cont "honor of the"
	cont "Psychics."
	done

PokefanmJeremySeenText:
	text "I travel all over"
	line "the world showing"
	cont "off my mighty"
	cont "#mon."

	para "If you only knew"
	line "the power of the"
	cont "dark side!"

	para "You're not a"
	line "sequel fan, are"
	cont "you?"
	done

PokefanmJeremyBeatenText:
	text "A surprise to"
	line "be sure."

	para "But a welcome"
	line "one."
	done

PokefanmJeremyAfterBattleText:
	text "May the force"
	line "be with you."

	para "Unless you are"
	line "a fan of the"
	cont "sequels."
	done

PokefanfGeorgiaSeenText:
	text "Do you cosplay?"

	para "I go to all"
	line "the conventions."

	para "There should be"
	line "one in SAFFRON."

	para "I like to spread"
	line "my girl power"
	cont "message!"
	done

PokefanfGeorgiaBeatenText:
	text "Girls get it done."
	done

PokefanfGeorgiaAfterBattleText:
	text "Of course I like"
	line "male characters"
	cont "too."

	para "None is better"
	line "than the other."

	para "We are in this"
	line "together."
	done

SupernerdShawnSeenText:
	text "I am taking"
	line "some APRICORN"
	cont "balls to sell"
	cont "in KANTO."

	para "I'll make a"
	line "killing!"
	done

SupernerdShawnBeatenText:
	text "You want in"
	line "on this!"
	done

SupernerdShawnAfterBattleText:
	text "I hope that new"
	line "JOHTO Champion"
	cont "doesn't show up"
	cont "to spoil my new"
	cont "business."
	done

SSAquaHasArrivedVermilionText:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	def_object_events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
