	object_const_def
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "Route 19 is"
	line "blocked by rocks"
	cont "at this time."

	para "Cinnabar's volcano"
	line "erupted some time"
	cont "ago and we are"
	cont "still clearing"
	cont "the debris."
	done

Route19FuchsiaGateOfficerText_RocksCleared:
    text "The road is clear."

    para "Cinnabar's volcano"
	line "erupted."

	para "Some say it was"
	line "Hoenn."

	para "How can anyone"
	line "make a volcano"
	cont "erupt?"

	para "That's nonsense!"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
