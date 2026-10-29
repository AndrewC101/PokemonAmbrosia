	object_const_def
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .TTRWeather

.TTRWeather:
    checktime NITE
    iftrue .skipWeather
	setval WEATHER_SUN
	writemem wFieldWeather
.skipWeather
	endcallback

TinTowerHoOh:
	cry HO_OH
	pause 15

	checkitem SILVER_WING
	iffalse .lowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon HO_OH, 80
    sjump .begin
.midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon HO_OH, 70
	sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon HO_OH, 60
.begin
	startbattle
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH

	setval HO_OH
	special MonCheck
	iftrue .caught
	end
.caught
	setevent EVENT_FOUGHT_HO_OH
	disappear TINTOWERROOF_HO_OH
	end

HoOhText:
	text "Shaoooh!"
	done

TinTowerRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, TIN_TOWER_9F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 9, 5, SPRITE_DYNAMIC_POKEMON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, HO_OH, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_FOUGHT_HO_OH
