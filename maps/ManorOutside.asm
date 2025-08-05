ManorOutside_MapScripts:
	def_scene_scripts

	def_callbacks

ManorOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  15, MANOR_INSIDE, 1
	warp_event  6,  25, ROUTE_28, 3
	warp_event  7,  25, ROUTE_28, 4

	def_coord_events

	def_bg_events

	def_object_events
