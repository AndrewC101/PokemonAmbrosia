	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Eusine

.Eusine
    disappear CELADONPOKECENTER1F_EUSINE
    checkevent EVENT_FOUGHT_SUICUNE
    iffalse .end
    appear CELADONPOKECENTER1F_EUSINE
.end
    endcallback

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
    faceplayer
	opentext
	checkevent EVENT_BEAT_CELADON_EUSINE
	iftrue .FightDone
.fight
	writetext Eusine2SeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_CELADON_EUSINE
	iftrue .dontAsk
	opentext
	writetext Eusine2OfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext Eusine2BeatenText, Eusine2WinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer MYSTICALMAN, EUSINE_CELADON
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_CELADON_EUSINE
	end
.FightDone:
	writetext Eusine2AfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextEusine2
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextEusine2
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext Eusine2WinAfterBattleText
    waitbutton
    closetext
    end
Eusine2WinAfterBattleText:
    text "Thank you"
    line "<PLAYER>."

    para "I feel whole"
    line "and complete."

    para "I hope one day"
    line "you can find"
    cont "whatever it is"
    cont "that makes you"
    cont "complete."
    done
Eusine2SeenText:
    text "Hi <PLAYER>!"

    para "I'm visiting my"
    line "home town and"
    cont "seeing my family."

    para "I finally did it."

    para "I had given up."

    para "I didn't care"
    line "anymore."

    para "Then I got up"
    line "and decided I"
    cont "had to see"
    cont "SUICUNE one"
    cont "more time."

    para "For the first"
    line "time I didn't"
    cont "want to catch"
    cont "her."

    para "Only to say"
    line "goodbye."

    para "SUICUNE didn't"
    line "run."

    para "Now let us battle"
    line "one more time."
    done
Eusine2BeatenText:
    text "I am not upset."

    para "I am complete."
    done
Eusine2WinsText:
    text "I am complete."
    done
Eusine2OfferFightText:
    text "Shall we battle?"
    done
Eusine2AfterBattleText:
    text "I am one with"
    line "SUICUNE."

    para "I can not explain"
    line "the peace I feel."

    para "My journey is"
    line "over and now a"
    cont "new one begins."

    para "I've always been"
    line "interested in"
    cont "the legendary"
    cont "birds."
    done
RematchTextEusine2:
    text "Would you like"
    line "another battle?"
    done
RematchRefuseTextEusine2:
    text "Go find what"
    line "matters to you."
    done

CeladonPokecenter1FCooltrainerFText:
	text "Erika is a master"
	line "of grass #mon."

	para "She is so pretty."

	para "We need to fight"
	line "back against"
	cont "pollution and"
	cont "crime."

	para "Lead us Erika!"
	done

CeladonPokecenter1FPharmacistText:
	text "TEAM ROCKET's"
	line "hideout is in the"

	para "basement of the"
	line "GAME CORNER."

	para "It was closed up."

	para "Rumor is the"
	line "black market"
	cont "exists there now."
	done

CeladonEusineText1:
	text "EUSINE: Hi!"

	para "I'm back visiting"
	line "my hometown."

	para "It's been quite a"
	line "while."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, have you"
	line "heard?"

	para "There have been"
	line "fresh rumors of a"

	para "rainbow-colored"
	line "#mon appearing"
	cont "at TIN TOWER."

	para "I've just had my"
	line "party healed, so"

	para "now I'm headed to"
	line "ECRUTEAK."

	para "I'll be seeing"
	line "you, <PLAYER>!"
	done

NoBeastsText:
	text "Oh, by the way,"
	line "<PLAYER>."

	para "Have you caught"
	line "the legendary"

	para "#mon RAIKOU and"
	line "ENTEI?"

	para "<……><……><……>"

	para "Okay…"

	para "If you catch even"
	line "one, I hope that"
	cont "you'll inform me."

	para "I'm counting on"
	line "you, <PLAYER>!"
	done

CelaBlisseyScript:
    opentext
    writetext CelaBlisseyText
    cry BLISSEY
    waitbutton
    closetext
    end

CelaBlisseyText:
    text "Blissey!"
    done

CelaArcanineScript:
    opentext
    writetext CelaArcanineText
    cry ARCANINE
    waitbutton
    closetext
    end

CelaArcanineText:
    text "Arcanine!"
    done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 1
	warp_event  4,  7, CELADON_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_TEMP_EVENT_1
	object_event  4,  1, SPRITE_BLISSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CelaBlisseyScript, -1
	object_event  1,  3, SPRITE_ARCANINE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CelaArcanineScript, -1
