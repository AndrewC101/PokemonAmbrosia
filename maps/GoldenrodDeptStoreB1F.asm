	object_const_def
	const GOLDENRODDEPTSTOREB1F_POKE_BALL1
	const GOLDENRODDEPTSTOREB1F_POKE_BALL2
	const GOLDENRODDEPTSTOREB1F_POKE_BALL3
	const GOLDENRODDEPTSTOREB1F_POKE_BALL4
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT1
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT2
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT3
	const GOLDENRODDEPTSTOREB1F_MACHOP

GoldenrodDeptStoreB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .ClearBoxes
	callback MAPCALLBACK_NEWMAP, .Unblock

.ClearBoxes:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	sjump .Continue

.GotCardKey:
	changeblock 16, 4, $0d ; floor
	sjump .Continue

.Continue:
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iftrue .Layout2
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	iftrue .Layout3
	changeblock 10, 8, $0d ; floor
	endcallback

.Layout2:
	changeblock 4, 10, $0d ; floor
	endcallback

.Layout3:
	changeblock 10, 12, $0d ; floor
	endcallback

.Unblock:
	clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	endcallback

GoldenrodDeptStoreB1FBlackBelt1Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt1Text

GoldenrodDeptStoreB1FBlackBelt2Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt2Text

GoldenrodDeptStoreB1FBlackBelt3Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt3Text

GoldenrodDeptStoreB1FMachopScript:
	opentext
	writetext GoldenrodDeptStoreB1FMachokeText
	cry MACHAMP
	waitbutton
	closetext
	end

GoldenrodDeptStoreB1FEther:
	itemball NUGGET

GoldenrodDeptStoreB1FAmuletCoin:
	itemball AMULET_COIN

GoldenrodDeptStoreB1FBurnHeal:
	itemball POKE_DOLL

GoldenrodDeptStoreB1FUltraBall:
	itemball PP_MAX

GoldenrodDeptStoreB1FBlackBelt1Text:
	text "I'd really"
	line "appreciate a job"
	cont "where I get to use"
	cont "my brain for a"
	cont "change."
	para "Now back to"
	line "pushing the heavy"
	cont "objects."
	done

GoldenrodDeptStoreB1FBlackBelt2Text:
	text "Hey kid, you want"
	line "to be strong like"
	cont "me?"
	para "I can hook you up"
	line "with my vitamin"
	cont "supplier."
	para "Nobody is natty"
	line "these days."
	para "You know who to"
	line "come to."
	done

GoldenrodDeptStoreB1FBlackBelt3Text:
	text "Hey, you're a"
	line "trainer!"
	para "I used to be a"
	line "trainer at Chucks"
	cont "Gym in Cianwood."
	para "I couldn't stand"
	line "it!"
	para "All they ever"
	line "talked about was"
	cont "Dragon Ball Z."
	done

GoldenrodDeptStoreB1FMachokeText:
	text "Machamp!"
	line "Champ!"
	done

GoldenrodDeptStoreB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  2, GOLDENROD_UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 10,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FEther, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FAmuletCoin, EVENT_GOLDENROD_DEPT_STORE_B1F_AMULET_COIN
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FBurnHeal, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FUltraBall, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt1Script, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt2Script, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt3Script, -1
	object_event  7,  7, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FMachopScript, -1
