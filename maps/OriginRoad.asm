OriginRoad_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
	setval WEATHER_NONE
	writemem wFieldWeather
	endcallback

OriginWarpScript1:
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warpfacing UP, HALL_OF_ORIGIN, 10, 44
    end

OriginWarpScript2:
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warpfacing UP, HALL_OF_ORIGIN, 11, 44
    end

OriginWarpScript3:
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warpfacing UP, HALL_OF_ORIGIN, 12, 44
    end

OriginWarpScript4:
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warpfacing UP, HALL_OF_ORIGIN, 13, 44
    end

OriginRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event 4,  4, SCENE_ALWAYS, OriginWarpScript1
	coord_event 5, 4, SCENE_ALWAYS, OriginWarpScript2
	coord_event 6, 4, SCENE_ALWAYS, OriginWarpScript3
	coord_event 7, 4, SCENE_ALWAYS, OriginWarpScript4

	def_bg_events

	def_object_events
