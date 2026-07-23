	object_const_def
	const OLDLIGHTHOUSE_ZAPDOS
	const OLDLIGHTHOUSE_FIELDMON_1
	const OLDLIGHTHOUSE_FIELDMON_2
	const OLDLIGHTHOUSE_FIELDMON_3
	const OLDLIGHTHOUSE_FIELDMON_4
	const OLDLIGHTHOUSE_FIELDMON_5
	const OLDLIGHTHOUSE_FIELDMON_6
	const OLDLIGHTHOUSE_FIELDMON_7
	const OLDLIGHTHOUSE_FIELDMON_8

OldLighthouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .OldLighthouseFieldMon

.OldLighthouseFieldMon:
	appear OLDLIGHTHOUSE_FIELDMON_1
	appear OLDLIGHTHOUSE_FIELDMON_2
	appear OLDLIGHTHOUSE_FIELDMON_3
	appear OLDLIGHTHOUSE_FIELDMON_4
	appear OLDLIGHTHOUSE_FIELDMON_5
	appear OLDLIGHTHOUSE_FIELDMON_6
	appear OLDLIGHTHOUSE_FIELDMON_7
	appear OLDLIGHTHOUSE_FIELDMON_8
	endcallback

OldLighthouseFieldMon1Script:
	trainer GALVANTULA, FIELD_MON, EVENT_FIELD_MON_1, OldLighthousePokemonAttacksText, 61, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_1
	end

OldLighthouseFieldMon2Script:
	trainer ROTOM, FIELD_MON, EVENT_FIELD_MON_2, OldLighthousePokemonAttacksText, 63, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_2
	end

OldLighthouseFieldMon3Script:
	trainer JOLTEON, FIELD_MON, EVENT_FIELD_MON_3, OldLighthousePokemonAttacksText, 64, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_3
	end

OldLighthouseFieldMon4Script:
	trainer MAGNEZONE, FIELD_MON, EVENT_FIELD_MON_4, OldLighthousePokemonAttacksText, 65, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_4
	end

OldLighthouseFieldMon5Script:
	trainer ARCTOZOLT, FIELD_MON, EVENT_FIELD_MON_5, OldLighthousePokemonAttacksText, 66, 0, .script
.script
	disappear OLDLIGHTHOUSE_FIELDMON_5
	end

OldLighthouseFieldMon6Script:
	faceplayer
	cry RAICHU
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon RAICHU, 62
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear OLDLIGHTHOUSE_FIELDMON_6
	end

OldLighthouseFieldMon7Script:
	faceplayer
	cry AMPHAROS
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon AMPHAROS, 63
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear OLDLIGHTHOUSE_FIELDMON_7
	end

OldLighthouseFieldMon8Script:
	faceplayer
	cry ELECTIVIRE
	pause 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ELECTIVIRE, 73
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear OLDLIGHTHOUSE_FIELDMON_8
	end

OldLighthouseTMThunder:
	itemball TM_THUNDER

OldLighthousePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

OldLighthouseZapdosScript:
	cry ZAPDOS
	pause 15
	checkevent EVENT_BEAT_CLAIR
	iffalse .level50
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .level60
	checkevent EVENT_BEAT_WALLACE
	iffalse .level70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 80
	sjump .begin
.level70
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 70
	sjump .begin
.level60
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 60
	sjump .begin
.level50
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 50
.begin
	startbattle
	reloadmapafterbattle
	setval ZAPDOS
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_CAUGHT_ZAPDOS
	disappear OLDLIGHTHOUSE_ZAPDOS
	end

OldLighthouseHistory1:
	jumptext LighthouseHistoryText1

OldLighthouseHistory2:
	jumptext LighthouseHistoryText2

OldLighthouseHistory3:
	jumptext LighthouseHistoryText3

OldLighthouseHistory4:
	jumptext LighthouseHistoryText4

OldLighthouseHistory5:
	jumptext LighthouseHistoryText5

OldLighthouseHistory6:
	jumptext LighthouseHistoryText6

LighthouseHistoryText1:
	text "What do those"
	line "mainland fools"
	cont "think they are"
	cont "playing at!"
	para "I've been manning"
	line "this lighthouse by"
	cont "myself for 7"
	cont "years."
	para "My Ampharos"
	line "produces plenty of"
	cont "light."
	para "This lad Li from"
	line "Violet has some"
	cont "nerve thinking he"
	cont "can improve things"
	cont "around here!"
	done

LighthouseHistoryText2:
	text "The light produced"
	line "by this life"
	cont "saving beacon is"
	cont "not sufficient."
	para "I see why I was"
	line "sent here."
	para "There is a bleak"
	line "foggy haze that"
	cont "has infected this"
	cont "place."
	para "It stifles the"
	line "luminosity of the"
	cont "Ampharos and it"
	cont "stifles the heart"
	cont "of he old"
	cont "caretaker."
	para "I will restore the"
	line "brilliance to this"
	cont "tower."
	done

LighthouseHistoryText3:
	text "This Lad Li, he be"
	line "talking about all"
	cont "sorts of mad"
	cont "ideas."
	para "I think they sent"
	line "me a lot of"
	cont "trouble with this"
	cont "one."
	para "He spends hours"
	line "tracking storms on"
	cont "maps and is"
	cont "building some kind"
	cont "of contraption"
	cont "atop the tower."
	para "I think I'll need"
	line "to send him on a"
	cont "boat back to"
	cont "Violet first"
	cont "chance I get."
	done

LighthouseHistoryText4:
	text "This lifesaving"
	line "tower will require"
	cont "a light of"
	cont "unmatched"
	cont "intensity."
	para "Even saving a"
	line "single extra life"
	cont "shall justify the"
	cont "immense effort."
	para "Efforts that are"
	line "not aided by the"
	cont "old caretaker."
	para "I think his heart"
	line "dulled long ago."
	para "I have tracked the"
	line "patterns of the"
	cont "recent"
	cont "thunderstorms and"
	cont "I'm convinced it"
	cont "is not a random"
	cont "act of nature, but"
	cont "the manifestations"
	cont "of a #mon."
	para "Of light"
	line "incarnate!"
	para "I will call it"
	line "here, where its"
	cont "light shall guide"
	cont "souls from harm."
	done

LighthouseHistoryText5:
	text "That damn crazy"
	line "fool!"
	para "We are here to"
	line "save lives."
	para "He has broken this"
	line "promise by leading"
	cont "that monster here."
	para "A #mon of"
	line "storms and death."
	para "What did he think"
	line "would happen!"
	para "He is on the first"
	line "boat out of here."
	para "May his soul be"
	line "swallowed by"
	cont "Giratina for what"
	cont "he has done."
	done

LighthouseHistoryText6:
	text "They say the path"
	line "to oblivion is"
	cont "pathed with good"
	cont "intentions."
	para "The lightning rod"
	line "attracted Zapdos"
	cont "as I had hoped."
	para "And the tower"
	line "shawn brighter"
	cont "than ever."
	para "I always believed"
	line "light to be the"
	cont "defender of life."
	para "But a bolt of"
	line "light from Zapdos"
	cont "stuck a small boat"
	cont "as it approached"
	cont "and I saw it go"
	cont "under."
	para "I wish it could be"
	line "me, instead of"
	cont "them."
	para "I will return to"
	line "Violet and devote"
	cont "myself to finding"
	cont "balance."
	para "Maybe the sages at"
	line "Sprout Tower can"
	cont "help."
	para "First I must"
	line "present myself to"
	cont "my people and be"
	cont "punished for my"
	cont "perversion of"
	cont "light and of bird"
	cont "#mon."
	done

OldLighthouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 35, CAPE_STORM, 3
	warp_event  9, 35, CAPE_STORM, 3
	warp_event  5, 33, OLD_LIGHTHOUSE, 4
	warp_event 27, 33, OLD_LIGHTHOUSE, 3
	warp_event 35, 33, OLD_LIGHTHOUSE, 6
	warp_event 13, 13, OLD_LIGHTHOUSE, 5
	warp_event  7, 13, OLD_LIGHTHOUSE, 8
	warp_event 29, 13, OLD_LIGHTHOUSE, 7

	def_coord_events

	def_bg_events
	bg_event  2, 23, BGEVENT_READ, OldLighthouseHistory1
	bg_event  3, 23, BGEVENT_READ, OldLighthouseHistory1
	bg_event 24, 23, BGEVENT_READ, OldLighthouseHistory2
	bg_event 25, 23, BGEVENT_READ, OldLighthouseHistory2
	bg_event 10,  3, BGEVENT_READ, OldLighthouseHistory3
	bg_event 11,  3, BGEVENT_READ, OldLighthouseHistory3
	bg_event  6,  3, BGEVENT_READ, OldLighthouseHistory4
	bg_event  7,  3, BGEVENT_READ, OldLighthouseHistory4
	bg_event 34,  5, BGEVENT_READ, OldLighthouseHistory5
	bg_event 35,  5, BGEVENT_READ, OldLighthouseHistory5
	bg_event 26,  5, BGEVENT_READ, OldLighthouseHistory6
	bg_event 27,  5, BGEVENT_READ, OldLighthouseHistory6

	def_object_events
	object_event 31,  4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseZapdosScript, EVENT_CAUGHT_ZAPDOS
	object_event 36, 27, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon1Script, EVENT_FIELD_MON_1
	object_event 25, 30, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon2Script, EVENT_FIELD_MON_2
	object_event 14, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon3Script, EVENT_FIELD_MON_3
	object_event  9,  4, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon4Script, EVENT_FIELD_MON_4
	object_event  3,  9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, OldLighthouseFieldMon5Script, EVENT_FIELD_MON_5
	object_event  5, 31, SPRITE_RAICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon6Script, EVENT_FIELD_MON_6
	object_event 35, 31, SPRITE_AMPHAROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon7Script, EVENT_FIELD_MON_7
	object_event  7, 11, SPRITE_ELECTABUZZ, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, OldLighthouseFieldMon8Script, EVENT_FIELD_MON_8
	object_event 33,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, OldLighthouseTMThunder, EVENT_OLD_LIGHTHOUSE_TM_THUNDER
