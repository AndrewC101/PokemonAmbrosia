CapeStormRoute21Gate_MapScripts:
	def_scene_scripts

	def_callbacks


CapeStormRoute21Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, CAPE_STORM, 1
	warp_event  0,  5, CAPE_STORM, 2
	warp_event  9,  4, ROUTE_21, 1
	warp_event  9,  5, ROUTE_21, 2

	def_coord_events

	def_bg_events

	def_object_events
