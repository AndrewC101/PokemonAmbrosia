object_const_def
	const CHERRYGROVEBAY_TM_EXPLOSION

CherrygroveBay_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .TrialGateCallback

.TrialGateCallback:
	checkevent EVENT_SOLVED_MEW_PUZZLE
	iffalse .gate_closed
	checkevent EVENT_SOLVED_KNOWLEDGE_TRIAL
	iffalse .gate_closed
	checkevent EVENT_SOLVED_FRIENDSHIP_TRIAL
	iffalse .gate_closed
	changeblock 18,  4, $73
	endcallback

.gate_closed
	changeblock 18,  4, $95
	endcallback

CherrygroveBayTrialGateSign:
	jumptext CherrygroveBayTrialGateSignText

CherrygroveBayTrialGateSignText:
	text "Only the proven"
	line "shall pass."
	done

CherrygroveBayTMExplosion:
	itemball TM_EXPLOSION

CherrygroveBay_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 33, CHERRYGROVE_RUINS, 1
	warp_event 18, 21, CHERRYGROVE_RUINS, 3
	warp_event 32, 31, CHERRYGROVE_RUINS, 5
	warp_event 18,  5, CHERRYGROVE_RUINS, 7

	def_coord_events

	def_bg_events
	bg_event 18,  5, BGEVENT_READ, CherrygroveBayTrialGateSign

	def_object_events
	object_event 19, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, CherrygroveBayTMExplosion, EVENT_CHERRYGROVE_BAY_TM_EXPLOSION
