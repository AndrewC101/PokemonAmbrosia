CapeStorm_MapScripts:
	def_scene_scripts

	def_callbacks


CapeStorm_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 39, 14, CAPE_STORM_ROUTE_21_GATE, 1
	warp_event 39, 15, CAPE_STORM_ROUTE_21_GATE, 2
	warp_event 17,  9, OLD_LIGHTHOUSE, 1

	def_coord_events

	def_bg_events

	def_object_events
