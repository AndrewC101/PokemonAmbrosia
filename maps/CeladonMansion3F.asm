	object_const_def
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUIDE
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 1, .CompletedPokedex
	waitbutton
	closetext
	end

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	promptbutton
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
    jumptextfaceplayer GameFreakGraphicArtistText

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "I am the GAME"
	line "DESIGNER."

	para "The creator went"
	line "back and forth on"
	cont "whether to have"
	cont "level caps but"
	cont "in the end it"
	cont "was better than"
	cont "global exp scaling"
	cont "for balancing."

	para "If you complete"
	line "the #dex let"
	cont "me know!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "You completed the"
	line "#dex!"

	para "Thank you so"
	line "much for playing."

	para "Andrew is very"
	line "proud of you!"

	para "Congratulations!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "I never thought"
	line "anyone would ever"
	cont "do this."

	para "You have made all"
	line "the countless"
	cont "evenings in front"
	cont "of the laptop"
	cont "worth it!"
	done

GameFreakGraphicArtistText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Finding sprites"
	line "for all the new"
	cont "#mon was"
	cont "difficult."

	para "Some like Zygarde"
	line "and Genesect"
	cont "didn't have back"
	cont "sprites."

	para "It took some"
	line "creativity to"
	cont "make those."
	done

GameFreakProgrammerText:
	text "Who, me? I'm the"
	line "PROGRAMMER."

	para "It took a long"
	line "time and many"
	cont "failed attempts"
	cont "to get the SELF"
	cont "trainer to work."

	para "But the biggest"
	line "breakthrough was"
	cont "overriding the"
	cont "player team for"
	cont "Battle Arcade or"
	cont "the RPG minigames."

	para "I don't think"
	line "any other hack"
	cont "or #mon"
	cont "game has these"
	cont "features."

	para "The AI also needed"
	line "some real buffs!"
	done

GameFreakCharacterDesignerText:
	text "I'm the CHARACTER"
	line "DESIGNER."

	para "Cynthia and Leon"
	line "had to be made"
	cont "by editing other"
	cont "trainers."

	para "Wallace too."

	para "I think they"
	line "turned out OK."
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "DEVELOPMENT ROOM"
	done

CeladonMansion3FDrawingText:
	text "It's a detailed"
	line "drawing of a"
	cont "pretty girl."
	done

CeladonMansion3FGameProgramText:
	text "It's the game"
	line "program. Messing"

	para "with it could put"
	line "a bug in the game!"
	done

CeladonMansion3FReferenceMaterialText:
	text "It's crammed with"
	line "reference materi-"
	cont "als. There's even"
	cont "a # DOLL."
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	def_object_events
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
