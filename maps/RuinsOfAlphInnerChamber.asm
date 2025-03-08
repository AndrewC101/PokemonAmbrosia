	object_const_def
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS
	const RUINSOFALPHINNERCHAMBER_POKEBALL
	const RUINSOFALPHINNERCHAMBER_FIELDMON_1
	const RUINSOFALPHINNERCHAMBER_FIELDMON_2
	const RUINSOFALPHINNERCHAMBER_FIELDMON_3

RuinsOfAlphInnerChamber_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	scene_script .UnownAppear ; SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .RuinsOfAlphFieldMon

.DummyScene0:
	end

.UnownAppear:
	sdefer .StrangePresenceScript
	end

.RuinsOfAlphFieldMon
    appear RUINSOFALPHINNERCHAMBER_FIELDMON_1
    appear RUINSOFALPHINNERCHAMBER_FIELDMON_2
    appear RUINSOFALPHINNERCHAMBER_FIELDMON_3
    endcallback

.StrangePresenceScript:
	opentext
	writetext RuinsOfAlphStrangePresenceText
	waitbutton
	closetext
	setscene SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

RuinsOfAlphInnerChamberFisherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberFisherText

RuinsOfAlphInnerChamberTeacherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberTeacherText

RuinsOfAlphInnerChamberGrampsScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberGrampsText

RuinsOfAlphInnerChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText

RuinsOfAlphStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

RuinsOfAlphInnerChamberStatueText:
	text "It's a replica"
	line "of an ancient"
	cont "#MON."
	done

RuinsOfAlphInnerChamberWiseGlasses:
	itemball EXPERT_BELT

RuinsOfAlphInnerChamberMon1Script:
	faceplayer
	cry RALTS
	pause 15
	loadwildmon RALTS, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear RUINSOFALPHINNERCHAMBER_FIELDMON_1
	end

RuinsOfAlphInnerChamberMon2Script:
	faceplayer
	cry ABRA
	pause 15
	loadwildmon ABRA, 8
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear RUINSOFALPHINNERCHAMBER_FIELDMON_2
	end

RuinsOfAlphInnerChamberMon3Script:
	faceplayer
	cry SOLOSIS
	pause 15
	loadwildmon SOLOSIS, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear RUINSOFALPHINNERCHAMBER_FIELDMON_3
	end

ArceusStatueScript:
    opentext
    writetext arceusStatueText
    waitbutton
    closetext
    end

arceusStatueText:
	text "An ancient and"
	line "worn statue of"
	cont "ARCEUS, the"
	cont "creator."
	para "Words are too"
	line "weathered to read."
	done

RuinsOfAlphInnerChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 13, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  3, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  4,  9, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  7, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 13,  9, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  6, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

	def_object_events
	object_event 11,  6, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event  9, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphInnerChamberWiseGlasses, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_WISE_GLASSES
	object_event  3, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberMon1Script, EVENT_FIELD_MON_1
	object_event  4, 24, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberMon2Script, EVENT_FIELD_MON_2
	object_event 16,  1, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberMon3Script, EVENT_FIELD_MON_3
	object_event  8, 10, SPRITE_ARCEUS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ArceusStatueScript, -1
