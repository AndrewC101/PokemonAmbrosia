	object_const_def
	const HEROESPASS_SAGE1
	const HEROESPASS_SAGE2
	const HEROESPASS_SAGE3
	const HEROESPASS_SAGE4
	const HEROESPASS_SAGE5
	const HEROESPASS_SAGE6
	const HEROESPASS_GRANNY1
	const HEROESPASS_GRANNY2
	const HEROESPASS_TM_SELFDESTRUCT
	const HEROESPASS_TM_FISSURE
	const HEROESPASS_TM_EARTH_POWER
	const HEROESPASS_RESCUE_GRAMPS

HeroesPassSage1Script:
	jumptextfaceplayer HeroesPassSage1Text

HeroesPassSage2Script:
	jumptextfaceplayer HeroesPassSage2Text

HeroesPassSage3Script:
	jumptextfaceplayer HeroesPassSage3Text

HeroesPassSage4Script:
	jumptextfaceplayer HeroesPassSage4Text

HeroesPassSage5Script:
	jumptextfaceplayer HeroesPassSage5Text

HeroesPassSage6Script:
	jumptextfaceplayer HeroesPassSage6Text

HeroesPassGranny1Script:
	faceplayer
	opentext
	checkevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
	iftrue .finish
	writetext HeroesPassGrannyIntroText
	waitbutton
	callasm HeroesPassHasPalkiaInParty
	iffalse .close
	setevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
.finish
	writetext HeroesPassGrannyFinishText
	waitbutton
.close
	closetext
	end

HeroesPassGranny2Script:
	faceplayer
	opentext
	checkevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
	iftrue .finish
	writetext HeroesPassGrannyIntroText
	waitbutton
	callasm HeroesPassHasPalkiaInParty
	iffalse .close
	setevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
.finish
	writetext HeroesPassGrannyFinishText
	waitbutton
.close
	closetext
	end

HeroesPassGrannyBlockScript:
	checkevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
	iftrue .done
	readvar VAR_XCOORD
	ifequal 53, .face_granny_1
	turnobject HEROESPASS_GRANNY2, LEFT
	sjump .after_face
.face_granny_1
	turnobject HEROESPASS_GRANNY1, RIGHT
.after_face
	opentext
	writetext HeroesPassGrannyIntroText
	waitbutton
	callasm HeroesPassHasPalkiaInParty
	iftrue .open_gate
	closetext
	readvar VAR_XCOORD
	ifequal 53, .push_down
	applymovement PLAYER, HeroesPassStepLeftMovement
	end
.push_down
	applymovement PLAYER, HeroesPassStepDownMovement
	end
.open_gate
    closetext
    opentext
    writetext PalkiaOpensGateText
	setevent EVENT_HEROES_PASS_PALKIA_GATE_OPEN
	closetext
	end
.done
	end

HeroesPassRescueGrampsScript:
	faceplayer
	opentext
	writetext HeroesPassRescueGrampsText
	yesorno
	iffalse .close
	closetext
	warp HEROES_PASS, 67, 22
	end
.close
	closetext
	end

; Return 1 in wScriptVar if the party contains Palkia.
HeroesPassHasPalkiaInParty:
	ld a, [wPartyCount]
	ld b, a
	and a
	jr z, .not_found
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp PALKIA
	jr z, .found
	dec b
	jr z, .not_found
	jr .loop
.not_found
	xor a
	ld [wScriptVar], a
	ret
.found
	ld a, 1
	ld [wScriptVar], a
	ret

HeroesPassStepDownMovement:
	step DOWN
	step_end

HeroesPassStepLeftMovement:
	step LEFT
	step_end

HeroesPassSage1Text:
	text "The bedroom window"
	line "shook as the wind"
	cont "and waves came"
	cont "calling."
	para "Savage water tore"
	line "through the house."
	para "The boys mother"
	line "got him to the"
	cont "roof but was swept"
	cont "away in the"
	cont "torrent."
	para "The boy, now"
	line "alone, made a vow"
	cont "to never need to"
	cont "be saved again."
	done

HeroesPassSage2Text:
	text "The young man"
	line "became an"
	cont "engineer."
	para "He designed sea"
	line "barriers to"
	cont "protect the lands"
	cont "from freak waves."
	para "The #mon"
	line "League rejected"
	cont "the plans as they"
	cont "would disturb the"
	cont "habitats of marine"
	cont "#mon."
	para "The man made a vow"
	line "to never need to"
	cont "ask permission to"
	cont "protect people"
	cont "again."
	done

HeroesPassSage3Text:
	text "The man became a"
	line "politician and"
	cont "traveled the land"
	cont "speaking to the"
	cont "common people."
	para "His message of"
	line "protecting people"
	cont "and #mon from"
	cont "savage weather was"
	cont "well received."
	para "He was not an"
	line "aristocrat."
	para "He was one of the"
	line "people, and the"
	cont "people trusted"
	cont "him."
	para "The man made a vow"
	line "to give a voice to"
	cont "those who have"
	cont "none."
	done

HeroesPassSage4Text:
	text "The people"
	line "rewarded the man"
	cont "with their votes."
	para "His party gained a"
	line "super majority in"
	cont "parliament."
	para "With his majority"
	line "he passed a bill"
	cont "giving him"
	cont "emergency powers"
	cont "to pass laws that"
	cont "protect the"
	cont "country."
	para "The man made a vow"
	line "to protect his"
	cont "country from any"
	cont "threat."
	done

HeroesPassSage5Text:
	text "A storm ripped"
	line "across the lands."
	para "The sea barriers"
	line "crumbled."
	para "The fatalities"
	line "mounted."
	para "The mans"
	line "helplessness fed"
	cont "his ambition."
	para "The man made a vow"
	line "that would find a"
	cont "way to control the"
	cont "very forces of"
	cont "nature themselves."
	cont "Or die trying."
	done

HeroesPassSage6Text:
	text "Wallace conquered"
	line "the forces of"
	cont "nature and became"
	cont "a hero in his"
	cont "land."
	para "All who opposed"
	line "him were traitors"
	cont "and his authority"
	cont "was absolute."
	para "He hates the"
	line "weakness of the"
	cont "boy he used to be."
	cont "Who let his own"
	cont "mother drown."
	para "Now he seeks to"
	line "share his strength"
	cont "with the rest of"
	cont "the world."
	para "Whether they want"
	line "it or not."
	done

HeroesPassGrannyIntroText:
	text "This door is"
	line "entangled with a"
	cont "distant place."
	para "A #mon that"
	line "can control space"
	cont "itself might be"
	cont "able to form a"
	cont "gateway."
	done

PalkiaOpensGateText:
    text "Palkia opens"
    line "the gateway."
    done

HeroesPassGrannyFinishText:
	text "You are not the"
	line "first hero to"
	cont "enter here."
	para "I hope you prove"
	line "to be the best."
	done

HeroesPassReturnToStartText:
	text "You seem stuck."

	para "Return to the"
	line "entrance?"
	done

HeroesPassRescueGrampsText:
	text "These waters can"
	line "be dangerous."

	para "You can find"
	line "yourself trapped"
	cont "by your own"
	cont "ambition."

	para "Shall I send you"
	line "back to the"
	cont "entrance?"
	done

HeroesPassTMSelfdestruct:
	itemball TM_SELFDESTRUCT

HeroesPassTMFissure:
	itemball TM_FISSURE

HeroesPassTMEarthPower:
	itemball TM_EARTH_POWER

HeroesPass_MapScripts:
	def_scene_scripts

	def_callbacks

HeroesPass_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 61,  7, HEROES_PASS_CAVES, 1
	warp_event 61, 13, HEROES_PASS_CAVES, 2
	warp_event 67,  7, HEROES_PASS_CAVES, 3
	warp_event 71,  7, HEROES_PASS_CAVES, 4
	warp_event 37,  3, HEROES_PASS_CAVES, 5
	warp_event 35,  9, HEROES_PASS_CAVES, 6
	warp_event 41,  9, HEROES_PASS_CAVES, 7
	warp_event 41, 15, HEROES_PASS_CAVES, 8
	warp_event 27, 23, HEROES_PASS_CAVES, 9
	warp_event 27, 19, HEROES_PASS_CAVES, 10
	warp_event 27, 11, HEROES_PASS_CAVES, 11
	warp_event 27,  7, HEROES_PASS_CAVES, 12
	warp_event 67, 21, HEROES_PASS_CAVES, 13
	warp_event 53, 29, ELEMENT_CAVE, 2
	warp_event  9, 23, ELEMENT_CAVE, 1

	def_coord_events
	coord_event 53, 30, SCENE_ALWAYS, HeroesPassGrannyBlockScript
	coord_event  9, 24, SCENE_ALWAYS, HeroesPassGrannyBlockScript

	def_bg_events

	def_object_events
	object_event 52, 20, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage1Script, -1
	object_event 62, 24, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage2Script, -1
	object_event 43,  3, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage3Script, -1
	object_event 32, 22, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage4Script, -1
	object_event 26, 10, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage5Script, -1
	object_event  9,  4, SPRITE_SAGE,   SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, HeroesPassSage6Script, -1
	object_event 52, 30, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HeroesPassGranny1Script, -1
	object_event 10, 24, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HeroesPassGranny2Script, -1
	object_event 70, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL,         0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_ITEMBALL, 0, HeroesPassTMSelfdestruct, EVENT_HEROES_PASS_TM_SELFDESTRUCT
	object_event 42, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL,         0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_ITEMBALL, 0, HeroesPassTMFissure,      EVENT_HEROES_PASS_TM_FISSURE
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL,         0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_ITEMBALL, 0, HeroesPassTMEarthPower,   EVENT_HEROES_PASS_TM_EARTH_POWER
	object_event 33, 32, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN,    0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HeroesPassRescueGrampsScript, -1
