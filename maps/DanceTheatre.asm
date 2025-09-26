	object_const_def
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_KIMONO_GIRL2
	const DANCETHEATRE_KIMONO_GIRL3
	const DANCETHEATRE_KIMONO_GIRL4
	const DANCETHEATRE_KIMONO_GIRL5
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY

DanceTheatre_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYPERIOR
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

KimonoGirlNaokoSeenText:
	text "Let war come!"

	para "I shall fight"
	line "to my last"
	cont "breath."

	para "My rage burns."
	done

KimonoGirlNaokoBeatenText:
	text "I need to chill."
	done

KimonoGirlNaokoAfterBattleText:
	text "Fire will burn"
	line "everything if"
	cont "you can't"
	cont "control it."
	done

KimonoGirlSayoSeenText:
	text "I see your"
	line "heart is pure."

	para "But such purity"
	line "means little"
	cont "without strength."
	done

KimonoGirlSayoBeatenText:
	text "Your heart is"
	line "your weapon."
	done

KimonoGirlSayoAfterBattleText:
	text "Listen to your"
	line "heart."

	para "Let it guide"
	line "you."
	done

KimonoGirlZukiSeenText:
	text "We are consumed"
	line "by our trivial"
	cont "lives."

	para "In a million"
	line "years none of"
	cont "it will matter."
	done

KimonoGirlZukiBeatenText:
	text "A meaningless"
	line "victory."
	done

KimonoGirlZukiAfterBattleText:
	text "It doesn't matter"
	line "that it doesn't"
	cont "matter."

	para "It's the journey"
	line "not the"
	cont "destination."
	done

KimonoGirlKuniSeenText:
	text "You need to"
	line "stop and feel the"
	cont "push and pull"
	cont "of life."

	para "Go with the flow."
	done

KimonoGirlKuniBeatenText:
	text "Your flow is"
	line "strong."
	done

KimonoGirlKuniAfterBattleText:
	text "In hard times"
	line "hope is something"
	cont "you must give"
	cont "yourself."
	done

KimonoGirlMikiSeenText:
	text "EEVEE has many"
	line "forms."

	para "#mon have"
	line "many forms."

	para "What kind of"
	line "#mon are"
	cont "you?"
	done

KimonoGirlMikiBeatenText:
	text "A strong one!"
	done

KimonoGirlMikiAfterBattleText:
	text "You remind me"
	line "of SOPHIE."

	para "She too understood"
	line "the meaning of"
	cont "our dance."
	done

SurfGuyNeverLeftAScratchText:
	text "The KIMONO GIRLS"
	line "all have distinct"
	cont "personalities."

	para "They are suited"
	line "to battling with"
	cont "their #mon."
	done

SurfGuyLadGiftText:
	text "Young man, if"
	line "you defeat all the"
	cont "KIMONO GIRLS, I'll"
	cont "give you a gift."
	done

SurfGuyLassieGiftText:
	text "Young woman, if"
	line "you defeat all the"
	cont "KIMONO GIRLS, I'll"
	cont "give you a gift."
	done

SurfGuyLikeADanceText:
	text "Your battling was"
	line "a masterful"
	cont "dance."

	para "You must travel"
	line "the world to"
	cont "hone your craft."

	para "This will let"
	line "you do that!"
	done

SurfGuySurfExplanationText:
	text "That's SURF."

	para "It's a move that"
	line "lets #mon swim"
	cont "across water."
	done

SurfGuyElegantKimonoGirlsText:
	text "If only I could"
	line "be so elegant as"
	cont "the KIMONO GIRLS."
	done

RhydonText:
	text "Rhy!"
	line "Perior!"
	done

DanceTheatreCooltrainerMText:
	text "That man's always"
	line "with Rhydon."

	para "And he is always"
	line "watching these"
	cont "girls dance."

	para "I don't know"
	line "what to make"
	cont "of this."
	done

DanceTheatreGrannyText:
	text "The KIMONO GIRLS"
	line "are so beautiful…"

	para "But they have to"
	line "go through rigor-"
	cont "ous training."

	para "And they have to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "Sometimes I feel"
	line "sorry for them."

	para "They should enjoy"
	line "being young and"
	cont "free while they"
	cont "can."
	done

DanceTheatreFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

SurfScriptLeft:
	checkevent EVENT_GOT_HM03_SURF
	iftrue .end
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .end
    applymovement DANCETHEATRE_GENTLEMAN, Movement_SurfLeft_Approach
    turnobject PLAYER, UP
    scall DanceTheaterSurfGuy
    applymovement DANCETHEATRE_GENTLEMAN, Movement_SurfLeft_Leave
.end
    end

SurfScriptRight:
	checkevent EVENT_GOT_HM03_SURF
	iftrue .end
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .end
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .end
    applymovement DANCETHEATRE_GENTLEMAN, Movement_SurfRight_Approach
    turnobject PLAYER, UP
    scall DanceTheaterSurfGuy
    applymovement DANCETHEATRE_GENTLEMAN, Movement_SurfRight_Leave
.end
    end

Movement_SurfLeft_Approach:
    step LEFT
    step LEFT
    step DOWN
    step DOWN
    step_end

Movement_SurfLeft_Leave:
    step UP
    step UP
    step RIGHT
    step RIGHT
    turn_head UP
    step_end

Movement_SurfRight_Approach:
    step LEFT
    step DOWN
    step DOWN
    step_end

Movement_SurfRight_Leave:
    step UP
    step UP
    step RIGHT
    turn_head UP
    step_end

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events
	coord_event 5, 13, SCENE_ALWAYS, SurfScriptLeft
	coord_event 6, 13, SCENE_ALWAYS, SurfScriptRight

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYPERIOR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
