	object_const_def
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

Copycat:
	faceplayer
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer

	faceplayer
	opentext
	writetext catTradeText
	waitbutton
	trade NPC_TRADE_CAT
	waitbutton
	closetext

	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	end

catTradeText:
	text "I'm pretty good at"
	line "imitating people."
	para "It helps me"
	line "appreciate who I"
	cont "am more."
	para "And they say it's"
	line "a form of"
	cont "flattery."
	para "I'm also good at"
	line "teaching #mon"
	cont "to imitate others."
	done

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry MURKROW
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatsDodrioText1:
	text "Staraptor: Giii!"
	done

CopycatsDodrioText2:
	text "Mirror, Mirror on"
	line "the wall, who's"

	para "the fairest one of"
	line "all?"
	done

CopycatsHouse2FDollText:
	text "This is a rare"
	line "#mon! Huh?"

	para "It's only a doll…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_SELECTED_PLAYER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PLAYER, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MURKROW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_SHAYMIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_STARAPTOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
