	object_const_def
	const OLDLIGHTHOUSE_ZAPDOS

OldLighthouse_MapScripts:
	def_scene_scripts

	def_callbacks

OldLighthouseZapdosScript:
	cry ZAPDOS
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 80
	sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon ZAPDOS, 60
	sjump .begin
.lowerLevel
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


OldLighthouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 35, CAPE_STORM, 3
	warp_event  9, 35, CAPE_STORM, 3
	warp_event  5, 33, OLD_LIGHTHOUSE, 4
	warp_event 27, 33, OLD_LIGHTHOUSE, 3
	warp_event 35, 33, OLD_LIGHTHOUSE, 6
	warp_event 13, 13, OLD_LIGHTHOUSE, 5
	warp_event  9, 13, OLD_LIGHTHOUSE, 8
	warp_event 31, 13, OLD_LIGHTHOUSE, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 31,  4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldLighthouseZapdosScript, EVENT_CAUGHT_ZAPDOS
